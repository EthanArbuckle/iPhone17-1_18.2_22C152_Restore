@interface SAClientUserActivity
- (BOOL)hasLocationData;
- (CLLocationCoordinate2D)coordinate;
- (id)addressDictionary;
- (id)mapItem;
- (id)startNavigationCommand;
@end

@implementation SAClientUserActivity

- (id)startNavigationCommand
{
  v3 = [(SAClientUserActivity *)self addressDictionary];
  [(SAClientUserActivity *)self coordinate];
  v4 = +[SALocation locationWithContactDictionary:coordinate:](SALocation, "locationWithContactDictionary:coordinate:", v3);

  v5 = [(SAClientUserActivity *)self userInfo];
  v6 = [v5 valueForKey:@"name"];
  [v4 setLabel:v6];

  v7 = objc_alloc_init(ASStartNavigation);
  [(ASStartNavigation *)v7 setDestination:v4];
  [(ASStartNavigation *)v7 setDirectionsType:SALocalSearchDirectionsTypeByCarValue];

  return v7;
}

- (id)addressDictionary
{
  v2 = [(SAClientUserActivity *)self userInfo];
  v9[0] = CNPostalAddressStreetKey;
  v9[1] = CNPostalAddressPostalCodeKey;
  v9[2] = CNPostalAddressStateKey;
  v9[3] = CNPostalAddressCityKey;
  v9[4] = CNPostalAddressCountryKey;
  v3 = +[NSArray arrayWithObjects:v9 count:5];
  v4 = [v2 dictionaryWithValuesForKeys:v3];
  id v5 = [v4 mutableCopy];

  v6 = [v5 keysOfEntriesPassingTest:&stru_C608];
  v7 = [v6 allObjects];
  [v5 removeObjectsForKeys:v7];

  return v5;
}

- (CLLocationCoordinate2D)coordinate
{
  v3 = [(SAClientUserActivity *)self userInfo];
  v4 = [v3 objectForKey:@"latitude"];

  id v5 = [(SAClientUserActivity *)self userInfo];
  v6 = [v5 objectForKey:@"longitude"];

  if (v4) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7
    || ([v4 floatValue],
        CLLocationDegrees v9 = v8,
        [v6 floatValue],
        CLLocationCoordinate2D v15 = CLLocationCoordinate2DMake(v9, v10),
        CLLocationDegrees latitude = v15.latitude,
        CLLocationDegrees longitude = v15.longitude,
        !CLLocationCoordinate2DIsValid(v15)))
  {
    CLLocationDegrees latitude = kCLLocationCoordinate2DInvalid.latitude;
    CLLocationDegrees longitude = kCLLocationCoordinate2DInvalid.longitude;
  }

  double v13 = latitude;
  double v14 = longitude;
  result.CLLocationDegrees longitude = v14;
  result.CLLocationDegrees latitude = v13;
  return result;
}

- (id)mapItem
{
  if ([(SAClientUserActivity *)self hasLocationData])
  {
    id v3 = objc_alloc((Class)MKPlacemark);
    [(SAClientUserActivity *)self coordinate];
    double v5 = v4;
    double v7 = v6;
    float v8 = [(SAClientUserActivity *)self addressDictionary];
    id v9 = objc_msgSend(v3, "initWithCoordinate:addressDictionary:", v8, v5, v7);

    id v10 = [objc_alloc((Class)MKMapItem) initWithPlacemark:v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)hasLocationData
{
  v2 = [(SAClientUserActivity *)self userInfo];
  id v3 = [v2 allKeys];

  if ([v3 containsObject:@"latitude"]
    && ([v3 containsObject:@"longitude"] & 1) != 0
    || [v3 containsObject:CNPostalAddressStreetKey]
    && ([v3 containsObject:CNPostalAddressCityKey] & 1) != 0
    || [v3 containsObject:CNPostalAddressStateKey]
    && ([v3 containsObject:CNPostalAddressCityKey] & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    unsigned __int8 v4 = [v3 containsObject:CNPostalAddressPostalCodeKey];
  }

  return v4;
}

@end