@interface ARLocationEstimationData
+ (BOOL)supportsSecureCoding;
- (ARLocationEstimationData)initWithCoder:(id)a3;
- (ARLocationEstimationData)initWithCoordinates:(CLLocationCoordinate2D)a3 altitude:(double)a4 heading:(double)a5;
- (ARLocationEstimationData)initWithLocation:(id)a3 heading:(double)a4;
- (CLLocation)location;
- (double)heading;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ARLocationEstimationData

- (ARLocationEstimationData)initWithCoordinates:(CLLocationCoordinate2D)a3 altitude:(double)a4 heading:(double)a5
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v10 = objc_alloc(MEMORY[0x1E4F1E5F0]);
  v11 = [MEMORY[0x1E4F1C9C8] date];
  v12 = objc_msgSend(v10, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v11, latitude, longitude, a4, 0.0, 0.0);

  v13 = [(ARLocationEstimationData *)self initWithLocation:v12 heading:a5];
  return v13;
}

- (ARLocationEstimationData)initWithLocation:(id)a3 heading:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ARLocationEstimationData;
  v8 = [(ARLocationEstimationData *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_location, a3);
    v9->_heading = a4 + ceil(a4 / -360.0) * 360.0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(ARLocationEstimationData *)self heading];
  objc_msgSend(v4, "encodeDouble:forKey:", @"ARLocationEstimateData_headingKey");
  id v5 = [(ARLocationEstimationData *)self location];
  [v4 encodeObject:v5 forKey:@"ARLocationEstimateData_locationKey"];
}

- (ARLocationEstimationData)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"ARLocationEstimateData_headingKey"];
  double v6 = v5;
  id v7 = [v4 decodeObjectForKey:@"ARLocationEstimateData_locationKey"];

  v8 = [[ARLocationEstimationData alloc] initWithLocation:v7 heading:v6];
  return v8;
}

- (double)heading
{
  return self->_heading;
}

- (CLLocation)location
{
  return self->_location;
}

- (void).cxx_destruct
{
}

@end