@interface RTCoordinate
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCoordinate:(id)a3;
- (RTCoordinate)init;
- (RTCoordinate)initWithCoder:(id)a3;
- (RTCoordinate)initWithLatitude:(double)a3 longitude:(double)a4;
- (double)latitude;
- (double)longitude;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTCoordinate

- (RTCoordinate)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithLatitude_longitude_);
}

- (RTCoordinate)initWithLatitude:(double)a3 longitude:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)RTCoordinate;
  result = [(RTCoordinate *)&v7 init];
  if (result)
  {
    result->_latitude = a3;
    result->_longitude = a4;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  [(RTCoordinate *)self latitude];
  uint64_t v5 = v4;
  [(RTCoordinate *)self longitude];
  return (id)[v3 stringWithFormat:@"<%.6f, %.6f>", v5, v6];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTCoordinate)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"latitude"];
  double v6 = v5;
  [v4 decodeDoubleForKey:@"longitude"];
  double v8 = v7;

  return [(RTCoordinate *)self initWithLatitude:v6 longitude:v8];
}

- (void)encodeWithCoder:(id)a3
{
  double latitude = self->_latitude;
  id v5 = a3;
  [v5 encodeDouble:@"latitude" forKey:latitude];
  [v5 encodeDouble:@"longitude" forKey:self->_longitude];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  double latitude = self->_latitude;
  double longitude = self->_longitude;
  return (id)[v4 initWithLatitude:latitude longitude:longitude];
}

- (BOOL)isEqualToCoordinate:(id)a3
{
  id v4 = a3;
  double v5 = round(self->_latitude * 1000000.0);
  [v4 latitude];
  if (v5 == round(v6 * 1000000.0))
  {
    double v7 = round(self->_longitude * 1000000.0);
    [v4 longitude];
    BOOL v9 = v7 == round(v8 * 1000000.0);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTCoordinate *)a3;
  double v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(RTCoordinate *)self isEqualToCoordinate:v5];

  return v6;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithDouble:round(self->_latitude * 1000000.0)];
  uint64_t v4 = [v3 hash];
  double v5 = [NSNumber numberWithDouble:round(self->_longitude * 1000000.0)];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

@end