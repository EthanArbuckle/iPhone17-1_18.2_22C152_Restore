@interface FMLLocation
- (FMLLocation)initWithAddress:(id)a3 altitude:(double)a4 longitude:(double)a5 speed:(double)a6 floorLevel:(int)a7 horizontalAccuracy:(double)a8 labels:(id)a9 latitude:(double)a10 timestamp:(double)a11 verticalAccuracy:(double)a12 locationType:(int64_t)a13 coarseAddressLabel:(id)a14;
- (FMLPlaceMark)address;
- (NSArray)labels;
- (NSString)coarseAddressLabel;
- (double)altitude;
- (double)horizontalAccuracy;
- (double)latitude;
- (double)longitude;
- (double)speed;
- (double)timestamp;
- (double)verticalAccuracy;
- (id)debugDescription;
- (id)description;
- (id)locationTypeDescription;
- (int)floorLevel;
- (int64_t)locationType;
- (int64_t)type;
- (void)setAddress:(id)a3;
- (void)setAltitude:(double)a3;
- (void)setCoarseAddressLabel:(id)a3;
- (void)setFloorLevel:(int)a3;
- (void)setHorizontalAccuracy:(double)a3;
- (void)setLabels:(id)a3;
- (void)setLatitude:(double)a3;
- (void)setLocationType:(int64_t)a3;
- (void)setLongitude:(double)a3;
- (void)setSpeed:(double)a3;
- (void)setTimestamp:(double)a3;
- (void)setVerticalAccuracy:(double)a3;
@end

@implementation FMLLocation

- (FMLLocation)initWithAddress:(id)a3 altitude:(double)a4 longitude:(double)a5 speed:(double)a6 floorLevel:(int)a7 horizontalAccuracy:(double)a8 labels:(id)a9 latitude:(double)a10 timestamp:(double)a11 verticalAccuracy:(double)a12 locationType:(int64_t)a13 coarseAddressLabel:(id)a14
{
  uint64_t v21 = *(void *)&a7;
  id v26 = a3;
  id v27 = a9;
  id v28 = a14;
  v33.receiver = self;
  v33.super_class = (Class)FMLLocation;
  v29 = [(FMLLocation *)&v33 init];
  v30 = v29;
  if (v29)
  {
    [(FMLLocation *)v29 setAddress:v26];
    [(FMLLocation *)v30 setAltitude:a4];
    [(FMLLocation *)v30 setLongitude:a5];
    [(FMLLocation *)v30 setSpeed:a6];
    [(FMLLocation *)v30 setFloorLevel:v21];
    [(FMLLocation *)v30 setHorizontalAccuracy:a8];
    v31 = (void *)[v27 copy];
    [(FMLLocation *)v30 setLabels:v31];

    [(FMLLocation *)v30 setLatitude:a10];
    [(FMLLocation *)v30 setLongitude:a5];
    [(FMLLocation *)v30 setTimestamp:a11];
    [(FMLLocation *)v30 setVerticalAccuracy:a12];
    [(FMLLocation *)v30 setLocationType:a13];
    [(FMLLocation *)v30 setCoarseAddressLabel:v28];
  }

  return v30;
}

- (id)description
{
  v3 = NSString;
  [(FMLLocation *)self longitude];
  uint64_t v5 = v4;
  [(FMLLocation *)self latitude];
  uint64_t v7 = v6;
  v8 = [(FMLLocation *)self locationTypeDescription];
  v9 = [(FMLLocation *)self coarseAddressLabel];
  if (v9)
  {
    v10 = [(FMLLocation *)self coarseAddressLabel];
    v11 = [v3 stringWithFormat:@"longitude:%.2f latitude:%.2f type:%@ coarseAddressLabel:%@", v5, v7, v8, v10];
  }
  else
  {
    v11 = [v3 stringWithFormat:@"longitude:%.2f latitude:%.2f type:%@ coarseAddressLabel:%@", v5, v7, v8, &stru_270051750];
  }

  return v11;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(FMLLocation *)self description];
  uint64_t v6 = [v3 stringWithFormat:@"<%@ %p [%@]>", v4, self, v5];

  return v6;
}

- (id)locationTypeDescription
{
  unint64_t v2 = self->_locationType - 1;
  if (v2 > 2) {
    return @"legacy";
  }
  else {
    return off_26531C3E0[v2];
  }
}

- (FMLPlaceMark)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (double)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(double)a3
{
  self->_altitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (double)speed
{
  return self->_speed;
}

- (void)setSpeed:(double)a3
{
  self->_speed = a3;
}

- (int)floorLevel
{
  return self->_floorLevel;
}

- (void)setFloorLevel:(int)a3
{
  self->_floorLevel = a3;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (void)setHorizontalAccuracy:(double)a3
{
  self->_horizontalAccuracy = a3;
}

- (NSArray)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (void)setVerticalAccuracy:(double)a3
{
  self->_verticalAccuracy = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)coarseAddressLabel
{
  return self->_coarseAddressLabel;
}

- (void)setCoarseAddressLabel:(id)a3
{
}

- (int64_t)locationType
{
  return self->_locationType;
}

- (void)setLocationType:(int64_t)a3
{
  self->_locationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coarseAddressLabel, 0);
  objc_storeStrong((id *)&self->_labels, 0);

  objc_storeStrong((id *)&self->_address, 0);
}

@end