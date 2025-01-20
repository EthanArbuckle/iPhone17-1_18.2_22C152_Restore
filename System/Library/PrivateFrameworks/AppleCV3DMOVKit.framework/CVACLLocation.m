@interface CVACLLocation
- (CVACLLocation)initWithCLLocation:(id)a3 timestamp:(double)a4;
- (CVACLLocation)initWithDictionary:(id)a3;
- (double)altitude;
- (double)course;
- (double)horizontalAccuracy;
- (double)latitude;
- (double)longitude;
- (double)speed;
- (double)timestamp;
- (double)timestampSince1970;
- (double)verticalAccuracy;
- (id)debugDescription;
- (id)dictionary;
- (void)setAltitude:(double)a3;
- (void)setCourse:(double)a3;
- (void)setHorizontalAccuracy:(double)a3;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
- (void)setSpeed:(double)a3;
- (void)setTimestamp:(double)a3;
- (void)setTimestampSince1970:(double)a3;
- (void)setVerticalAccuracy:(double)a3;
@end

@implementation CVACLLocation

- (CVACLLocation)initWithDictionary:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CVACLLocation;
  v5 = [(CVACLLocation *)&v25 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"t"];
    [v6 doubleValue];
    v5->_timestamp = v7;

    v8 = [v4 objectForKeyedSubscript:@"ts"];
    [v8 doubleValue];
    v5->_timestampSince1970 = v9;

    v10 = [v4 objectForKeyedSubscript:@"lat"];
    [v10 doubleValue];
    v5->_latitude = v11;

    v12 = [v4 objectForKeyedSubscript:@"long"];
    [v12 doubleValue];
    v5->_longitude = v13;

    v14 = [v4 objectForKeyedSubscript:@"alt"];
    [v14 doubleValue];
    v5->_altitude = v15;

    v16 = [v4 objectForKeyedSubscript:@"h_acc"];
    [v16 doubleValue];
    v5->_horizontalAccuracy = v17;

    v18 = [v4 objectForKeyedSubscript:@"v_acc"];
    [v18 doubleValue];
    v5->_verticalAccuracy = v19;

    v20 = [v4 objectForKeyedSubscript:@"speed"];
    [v20 doubleValue];
    v5->_speed = v21;

    v22 = [v4 objectForKeyedSubscript:@"course"];
    [v22 doubleValue];
    v5->_course = v23;
  }
  return v5;
}

- (CVACLLocation)initWithCLLocation:(id)a3 timestamp:(double)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CVACLLocation;
  double v7 = [(CVACLLocation *)&v19 init];
  v8 = v7;
  if (v7)
  {
    v7->_timestamp = a4;
    double v9 = [v6 timestamp];
    [v9 timeIntervalSince1970];
    v8->_timestampSince1970 = v10;

    [v6 coordinate];
    v8->_latitude = v11;
    [v6 coordinate];
    v8->_longitude = v12;
    [v6 altitude];
    v8->_altitude = v13;
    [v6 horizontalAccuracy];
    v8->_horizontalAccuracy = v14;
    [v6 verticalAccuracy];
    v8->_verticalAccuracy = v15;
    [v6 speed];
    v8->_speed = v16;
    [v6 course];
    v8->_course = v17;
  }

  return v8;
}

- (id)dictionary
{
  v15[9] = *MEMORY[0x263EF8340];
  v3 = objc_msgSend(NSNumber, "numberWithDouble:", self->_timestamp, @"t");
  v15[0] = v3;
  v14[1] = @"ts";
  id v4 = [NSNumber numberWithDouble:self->_timestampSince1970];
  v15[1] = v4;
  v14[2] = @"lat";
  v5 = [NSNumber numberWithDouble:self->_latitude];
  v15[2] = v5;
  v14[3] = @"long";
  id v6 = [NSNumber numberWithDouble:self->_longitude];
  v15[3] = v6;
  v14[4] = @"alt";
  double v7 = [NSNumber numberWithDouble:self->_altitude];
  v15[4] = v7;
  v14[5] = @"h_acc";
  v8 = [NSNumber numberWithDouble:self->_horizontalAccuracy];
  v15[5] = v8;
  v14[6] = @"v_acc";
  double v9 = [NSNumber numberWithDouble:self->_verticalAccuracy];
  v15[6] = v9;
  v14[7] = @"speed";
  double v10 = [NSNumber numberWithDouble:self->_speed];
  v15[7] = v10;
  v14[8] = @"course";
  double v11 = [NSNumber numberWithDouble:self->_course];
  v15[8] = v11;
  double v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:9];

  return v12;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CVACLLocation *)self dictionary];
  id v6 = [v3 stringWithFormat:@"<%@: %@>", v4, v5];

  return v6;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)timestampSince1970
{
  return self->_timestampSince1970;
}

- (void)setTimestampSince1970:(double)a3
{
  self->_timestampSince1970 = a3;
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (double)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(double)a3
{
  self->_altitude = a3;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (void)setHorizontalAccuracy:(double)a3
{
  self->_horizontalAccuracy = a3;
}

- (double)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (void)setVerticalAccuracy:(double)a3
{
  self->_verticalAccuracy = a3;
}

- (double)speed
{
  return self->_speed;
}

- (void)setSpeed:(double)a3
{
  self->_speed = a3;
}

- (double)course
{
  return self->_course;
}

- (void)setCourse:(double)a3
{
  self->_course = a3;
}

@end