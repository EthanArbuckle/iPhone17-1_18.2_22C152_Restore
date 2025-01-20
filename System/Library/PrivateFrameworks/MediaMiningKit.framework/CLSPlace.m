@interface CLSPlace
+ (BOOL)supportsSecureCoding;
- (CLCircularRegion)region;
- (CLLocationCoordinate2D)coordinate;
- (CLSLitePlacemark)placemark;
- (CLSPlace)initWithCoder:(id)a3;
- (CLSPlace)initWithName:(id)a3 region:(id)a4 placemark:(id)a5;
- (CLSPlace)initWithPlacemark:(id)a3;
- (NSString)name;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLSPlace

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placemark, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (CLSLitePlacemark)placemark
{
  return self->_placemark;
}

- (CLCircularRegion)region
{
  return self->_region;
}

- (NSString)name
{
  return self->_name;
}

- (id)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)CLSPlace;
  v4 = [(CLSPlace *)&v10 description];
  [(CLCircularRegion *)self->_region center];
  uint64_t v6 = v5;
  [(CLCircularRegion *)self->_region center];
  v8 = [v3 stringWithFormat:@"%@: {%f, %f}", v4, v6, v7];

  return v8;
}

- (CLSPlace)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"region"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placemark"];

  v8 = [(CLSPlace *)self initWithName:v5 region:v6 placemark:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeObject:self->_region forKey:@"region"];
  [v5 encodeObject:self->_placemark forKey:@"placemark"];
}

- (CLLocationCoordinate2D)coordinate
{
  [(CLCircularRegion *)self->_region center];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (CLSPlace)initWithName:(id)a3 region:(id)a4 placemark:(id)a5
{
  id v7 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CLSPlace;
  v8 = [(CLSPlace *)&v19 init];
  if (v8)
  {
    v9 = [v7 location];
    objc_super v10 = NSString;
    [v9 coordinate];
    uint64_t v12 = v11;
    [v9 coordinate];
    uint64_t v14 = objc_msgSend(v10, "stringWithFormat:", @"<+%f,%f>", v12, v13);
    name = v8->_name;
    v8->_name = (NSString *)v14;

    uint64_t v16 = [v7 region];
    region = v8->_region;
    v8->_region = (CLCircularRegion *)v16;

    objc_storeStrong((id *)&v8->_placemark, a5);
  }

  return v8;
}

- (CLSPlace)initWithPlacemark:(id)a3
{
  id v4 = a3;
  id v5 = [v4 location];
  uint64_t v6 = NSString;
  [v5 coordinate];
  uint64_t v8 = v7;
  [v5 coordinate];
  objc_super v10 = objc_msgSend(v6, "stringWithFormat:", @"<+%f,%f>", v8, v9);
  uint64_t v11 = [v4 region];
  uint64_t v12 = [(CLSPlace *)self initWithName:v10 region:v11 placemark:v4];

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end