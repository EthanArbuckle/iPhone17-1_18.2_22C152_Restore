@interface _CLLSLLocationCoordinate
+ (BOOL)supportsSecureCoding;
- (_CLLSLLocationCoordinate)initWithCoder:(id)a3;
- (_CLLSLLocationCoordinate)initWithLatitude:(double)a3 longitude:(double)a4;
- (double)latitude;
- (double)longitude;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
@end

@implementation _CLLSLLocationCoordinate

- (_CLLSLLocationCoordinate)initWithLatitude:(double)a3 longitude:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_CLLSLLocationCoordinate;
  result = [(_CLLSLLocationCoordinate *)&v7 init];
  if (result)
  {
    result->_latitude = a3;
    result->_longitude = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 1) = *(void *)&self->_latitude;
  *((void *)result + 2) = *(void *)&self->_longitude;
  return result;
}

- (_CLLSLLocationCoordinate)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_CLLSLLocationCoordinate;
  v4 = [(_CLLSLLocationCoordinate *)&v8 init];
  if (v4)
  {
    [a3 decodeDoubleForKey:@"latitude"];
    v4->_latitude = v5;
    [a3 decodeDoubleForKey:@"longitude"];
    v4->_longitude = v6;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeDouble:@"latitude" forKey:self->_latitude];
  double longitude = self->_longitude;

  [a3 encodeDouble:@"longitude" forKey:longitude];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  [(_CLLSLLocationCoordinate *)self latitude];
  uint64_t v5 = v4;
  [(_CLLSLLocationCoordinate *)self longitude];
  return (id)[v3 stringWithFormat:@"<_CLLSLLocationCoordinate: %p> { .latitude = %f, .double longitude = %f }", self, v5, v6];
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
  self->_double longitude = a3;
}

@end