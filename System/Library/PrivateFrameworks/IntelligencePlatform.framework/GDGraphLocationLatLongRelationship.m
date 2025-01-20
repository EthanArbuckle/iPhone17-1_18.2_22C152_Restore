@interface GDGraphLocationLatLongRelationship
- (GDGraphLocationLatLongRelationship)initWithLatitudeField:(id)a3 longitudeField:(id)a4 allLatitudeField:(id)a5 allLongitudeField:(id)a6;
- (NSArray)allLatitude;
- (NSArray)allLongitude;
- (NSNumber)latitude;
- (NSNumber)longitude;
@end

@implementation GDGraphLocationLatLongRelationship

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allLongitude, 0);
  objc_storeStrong((id *)&self->_allLatitude, 0);
  objc_storeStrong((id *)&self->_longitude, 0);

  objc_storeStrong((id *)&self->_latitude, 0);
}

- (NSArray)allLongitude
{
  return self->_allLongitude;
}

- (NSArray)allLatitude
{
  return self->_allLatitude;
}

- (NSNumber)longitude
{
  return self->_longitude;
}

- (NSNumber)latitude
{
  return self->_latitude;
}

- (GDGraphLocationLatLongRelationship)initWithLatitudeField:(id)a3 longitudeField:(id)a4 allLatitudeField:(id)a5 allLongitudeField:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)GDGraphLocationLatLongRelationship;
  v15 = [(GDGraphLocationLatLongRelationship *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_latitude, a3);
    objc_storeStrong((id *)&v16->_longitude, a4);
    objc_storeStrong((id *)&v16->_allLatitude, a5);
    objc_storeStrong((id *)&v16->_allLongitude, a6);
  }

  return v16;
}

@end