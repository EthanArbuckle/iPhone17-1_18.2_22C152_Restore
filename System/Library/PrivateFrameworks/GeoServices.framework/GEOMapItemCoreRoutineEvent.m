@interface GEOMapItemCoreRoutineEvent
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (BOOL)_hasResolvablePartialInformation;
- (BOOL)_responseStatusIsIncomplete;
- (BOOL)isEventAllDay;
- (BOOL)isValid;
- (GEOMapItemCoreRoutineEvent)initWithAddressDictionary:(id)a3 eventName:(id)a4 eventTitle:(id)a5 eventDate:(id)a6 eventIsAllDay:(BOOL)a7 coordinate:(id)a8 clientAttributes:(id)a9;
- (id)_clientAttributes;
- (id)_place;
- (id)addressDictionary;
- (id)addressObject;
- (id)description;
- (id)eventDate;
- (id)eventName;
- (id)geoAddress;
- (id)name;
- (id)weatherDisplayName;
@end

@implementation GEOMapItemCoreRoutineEvent

- (GEOMapItemCoreRoutineEvent)initWithAddressDictionary:(id)a3 eventName:(id)a4 eventTitle:(id)a5 eventDate:(id)a6 eventIsAllDay:(BOOL)a7 coordinate:(id)a8 clientAttributes:(id)a9
{
  double var1 = a8.var1;
  double var0 = a8.var0;
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a9;
  v31.receiver = self;
  v31.super_class = (Class)GEOMapItemCoreRoutineEvent;
  v23 = [(GEOMapItemCoreRoutineEvent *)&v31 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_addressDictionary, a3);
    uint64_t v25 = [v19 copy];
    eventName = v24->_eventName;
    v24->_eventName = (NSString *)v25;

    uint64_t v27 = [v20 copy];
    eventTitle = v24->_eventTitle;
    v24->_eventTitle = (NSString *)v27;

    objc_storeStrong((id *)&v24->_eventDate, a6);
    v24->_eventIsAllDay = a7;
    v24->_coordinate.latitude = var0;
    v24->_coordinate.longitude = var1;
    objc_storeStrong((id *)&v24->_clientAttributes, a9);
    v29 = v24;
  }

  return v24;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F1C9E8];
  v4 = NSNumber;
  [(GEOMapItemCoreRoutineEvent *)self coordinate];
  v5 = objc_msgSend(v4, "numberWithDouble:");
  v6 = NSNumber;
  [(GEOMapItemCoreRoutineEvent *)self coordinate];
  v8 = [v6 numberWithDouble:v7];
  v9 = [(GEOMapItemCoreRoutineEvent *)self addressDictionary];
  v10 = objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v5, @"latitude", v8, @"longitude", v9, @"addressDictionary", self->_clientAttributes, @"clientAttributes", 0);

  v11 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)GEOMapItemCoreRoutineEvent;
  v12 = [(GEOMapItemCoreRoutineEvent *)&v15 description];
  v13 = [v11 stringWithFormat:@"%@ <%@>", v12, v10];

  return v13;
}

- (BOOL)isValid
{
  return 1;
}

- (id)name
{
  return self->_eventName;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double var1 = longitude;
  result.double var0 = latitude;
  return result;
}

- (id)addressDictionary
{
  return self->_addressDictionary;
}

- (id)eventName
{
  return self->_eventTitle;
}

- (id)eventDate
{
  return self->_eventDate;
}

- (BOOL)isEventAllDay
{
  return self->_eventIsAllDay;
}

- (BOOL)_hasResolvablePartialInformation
{
  return self->_addressDictionary != 0;
}

- (BOOL)_responseStatusIsIncomplete
{
  return 0;
}

- (id)_place
{
  place = self->_place;
  if (!place)
  {
    v4 = [GEOPlace alloc];
    [(GEOMapItemCoreRoutineEvent *)self coordinate];
    double v6 = v5;
    [(GEOMapItemCoreRoutineEvent *)self coordinate];
    double v7 = -[GEOPlace initWithLatitude:longitude:addressDictionary:](v4, "initWithLatitude:longitude:addressDictionary:", self->_addressDictionary, v6);
    v8 = self->_place;
    self->_place = v7;

    v9 = [(GEOMapItemCoreRoutineEvent *)self name];
    [(GEOPlace *)self->_place setName:v9];

    place = self->_place;
  }

  return place;
}

- (id)_clientAttributes
{
  return self->_clientAttributes;
}

- (id)geoAddress
{
  v2 = [[GEOAddress alloc] initWithAddressDictionary:self->_addressDictionary];

  return v2;
}

- (id)addressObject
{
  addressObject = self->_addressObject;
  if (!addressObject)
  {
    v4 = [(GEOMapItemCoreRoutineEvent *)self _place];
    GEOAddressObjectOfGEOPlace(v4);
    double v5 = (GEOAddressObject *)objc_claimAutoreleasedReturnValue();
    double v6 = self->_addressObject;
    self->_addressObject = v5;

    addressObject = self->_addressObject;
  }

  return addressObject;
}

- (id)weatherDisplayName
{
  v2 = [(GEOMapItemCoreRoutineEvent *)self addressObject];
  v3 = [v2 weatherDisplayName];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressObject, 0);
  objc_storeStrong((id *)&self->_eventDate, 0);
  objc_storeStrong((id *)&self->_eventTitle, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_clientAttributes, 0);

  objc_storeStrong((id *)&self->_addressDictionary, 0);
}

@end