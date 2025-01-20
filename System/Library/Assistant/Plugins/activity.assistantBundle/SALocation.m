@interface SALocation
+ (SALocation)locationWithContactDictionary:(id)a3 coordinate:(CLLocationCoordinate2D)a4;
- (BOOL)hasLocationData;
- (CLLocationCoordinate2D)coordinate;
- (id)addressDictionary;
- (id)mapItem;
@end

@implementation SALocation

+ (SALocation)locationWithContactDictionary:(id)a3 coordinate:(CLLocationCoordinate2D)a4
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)SALocation);
  v8 = [v6 allKeys];
  v25.double latitude = latitude;
  v25.double longitude = longitude;
  if (CLLocationCoordinate2DIsValid(v25))
  {
    v9 = +[NSNumber numberWithDouble:longitude];
    [v7 setLongitude:v9];

    v10 = +[NSNumber numberWithDouble:latitude];
    [v7 setLatitude:v10];
  }
  v11 = +[NSUUID UUID];
  v12 = [v11 UUIDString];
  [v7 setAceId:v12];

  if ([v8 containsObject:@"latitude"])
  {
    v13 = [v6 valueForKey:@"latitude"];
    [v7 setLatitude:v13];
  }
  if ([v8 containsObject:@"longitude"])
  {
    v14 = [v6 valueForKey:@"longitude"];
    [v7 setLongitude:v14];
  }
  if ([v8 containsObject:@"name"])
  {
    v15 = [v6 valueForKey:@"name"];
    [v7 setLabel:v15];
  }
  if ([v8 containsObject:CNPostalAddressStreetKey])
  {
    v16 = [v6 valueForKey:CNPostalAddressStreetKey];
    [v7 setStreet:v16];

    v17 = [v6 valueForKey:CNPostalAddressStreetKey];
    [v7 setThoroughfare:v17];
  }
  if ([v8 containsObject:CNPostalAddressCityKey])
  {
    v18 = [v6 valueForKey:CNPostalAddressCityKey];
    [v7 setCity:v18];
  }
  if ([v8 containsObject:CNPostalAddressStateKey])
  {
    v19 = [v6 valueForKey:CNPostalAddressStateKey];
    [v7 setStateCode:v19];
  }
  if ([v8 containsObject:CNPostalAddressCountryKey])
  {
    v20 = [v6 valueForKey:CNPostalAddressCountryKey];
    [v7 setCountryCode:v20];
  }
  if ([v8 containsObject:CNPostalAddressPostalCodeKey])
  {
    v21 = [v6 valueForKey:CNPostalAddressPostalCodeKey];
    [v7 setPostalCode:v21];
  }
  if ([v8 containsObject:CNPostalAddressPostalCodeKey])
  {
    v22 = [v6 valueForKey:CNPostalAddressPostalCodeKey];
    [v7 setPostalCode:v22];
  }

  return (SALocation *)v7;
}

- (id)addressDictionary
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = [(SALocation *)self street];
  if (v4)
  {
    [v3 setObject:v4 forKeyedSubscript:CNPostalAddressStreetKey];
  }
  else
  {
    v5 = [(SALocation *)self thoroughfare];
    [v3 setObject:v5 forKeyedSubscript:CNPostalAddressStreetKey];
  }
  id v6 = [(SALocation *)self city];
  [v3 setObject:v6 forKeyedSubscript:CNPostalAddressCityKey];

  id v7 = [(SALocation *)self stateCode];
  [v3 setObject:v7 forKeyedSubscript:CNPostalAddressStateKey];

  v8 = [(SALocation *)self postalCode];
  [v3 setObject:v8 forKeyedSubscript:CNPostalAddressPostalCodeKey];

  v9 = [(SALocation *)self countryCode];
  [v3 setObject:v9 forKeyedSubscript:CNPostalAddressCountryKey];

  return v3;
}

- (CLLocationCoordinate2D)coordinate
{
  id v3 = [(SALocation *)self latitude];
  uint64_t v4 = [(SALocation *)self longitude];
  v5 = (void *)v4;
  if (!v3
    || !v4
    || ([v3 floatValue],
        CLLocationDegrees v7 = v6,
        [v5 floatValue],
        CLLocationCoordinate2D v13 = CLLocationCoordinate2DMake(v7, v8),
        CLLocationDegrees latitude = v13.latitude,
        CLLocationDegrees longitude = v13.longitude,
        !CLLocationCoordinate2DIsValid(v13)))
  {
    CLLocationDegrees latitude = kCLLocationCoordinate2DInvalid.latitude;
    CLLocationDegrees longitude = kCLLocationCoordinate2DInvalid.longitude;
  }

  double v11 = latitude;
  double v12 = longitude;
  result.CLLocationDegrees longitude = v12;
  result.CLLocationDegrees latitude = v11;
  return result;
}

- (BOOL)hasLocationData
{
  [(SALocation *)self coordinate];
  if (!CLLocationCoordinate2DIsValid(v8))
  {
    uint64_t v4 = [(SALocation *)self street];
    if (v4 && ([(SALocation *)self city], (v5 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      char v3 = 1;
    }
    else
    {
      float v6 = [(SALocation *)self postalCode];
      char v3 = v6 != 0;

      if (!v4)
      {
LABEL_9:

        return v3;
      }
      v5 = 0;
    }

    goto LABEL_9;
  }
  return 1;
}

- (id)mapItem
{
  if ([(SALocation *)self hasLocationData])
  {
    id v3 = objc_alloc((Class)MKPlacemark);
    [(SALocation *)self coordinate];
    double v5 = v4;
    double v7 = v6;
    CLLocationCoordinate2D v8 = [(SALocation *)self addressDictionary];
    id v9 = objc_msgSend(v3, "initWithCoordinate:addressDictionary:", v8, v5, v7);

    id v10 = [objc_alloc((Class)MKMapItem) initWithPlacemark:v9];
    double v11 = [(SALocation *)self label];
    [v10 setName:v11];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

@end