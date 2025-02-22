class EntriesController < ApplicationController
  def show
    @entry = Entry.find_by({"id" => params["id"]})
    @place = Place.find_by({"id" => @place["place_id"]})
  end

  def new
    @place = Place.find_by({"id" => params["place_id"]})
  end

  def create
    puts "Params: #{params.inspect}"

    @entry = Entry.new

    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = params["place_id"]

    @entry.save
    
    redirect_to "/places/#{@entry["place_id"]}"
  end
end
