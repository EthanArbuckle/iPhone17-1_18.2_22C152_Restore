@interface _CLVertex
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CLLocationCoordinate2D)coordinate;
- (_CLVertex)initWithClientCoordinate:(id)a3;
- (_CLVertex)initWithCoder:(id)a3;
- (_CLVertex)initWithCoordinate:(CLLocationCoordinate2D)a3;
- (double)getDistanceFrom:(CLLocationCoordinate2D)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _CLVertex

- (_CLVertex)initWithCoordinate:(CLLocationCoordinate2D)a3
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  v6.receiver = self;
  v6.super_class = (Class)_CLVertex;
  result = [(_CLVertex *)&v6 init];
  if (result)
  {
    result->_coordinate.CLLocationDegrees latitude = latitude;
    result->_coordinate.CLLocationDegrees longitude = longitude;
  }
  return result;
}

- (_CLVertex)initWithClientCoordinate:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  v6.receiver = self;
  v6.super_class = (Class)_CLVertex;
  result = [(_CLVertex *)&v6 init];
  if (result)
  {
    result->_coordinate.CLLocationDegrees latitude = var0;
    result->_coordinate.CLLocationDegrees longitude = var1;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)_CLVertex;
  [(_CLVertex *)&v2 dealloc];
}

- (double)getDistanceFrom:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  [(_CLVertex *)self coordinate];
  double v7 = v6;
  [(_CLVertex *)self coordinate];

  return sub_1906D7AA4(latitude, longitude, v7, v8);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CLVertex)initWithCoder:(id)a3
{
  [a3 decodeDoubleForKey:@"kCLVertexCodingKeyLatitude"];
  self->_coordinate.double latitude = v5;
  [a3 decodeDoubleForKey:@"kCLVertexCodingKeyLongitude"];
  self->_coordinate.double longitude = v6;
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  [(_CLVertex *)self coordinate];
  objc_msgSend(a3, "encodeDouble:forKey:", @"kCLVertexCodingKeyLatitude");
  [(_CLVertex *)self coordinate];

  [a3 encodeDouble:@"kCLVertexCodingKeyLongitude" forKey:v5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  [(_CLVertex *)self coordinate];

  return (id)MEMORY[0x1F4181798](v4, sel_initWithCoordinate_);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    int v5 = [a3 isMemberOfClass:objc_opt_class()];
    if (v5)
    {
      [(_CLVertex *)self coordinate];
      double v7 = v6;
      [a3 coordinate];
      if (v7 == v8)
      {
        [(_CLVertex *)self coordinate];
        double v10 = v9;
        [a3 coordinate];
        LOBYTE(v5) = v10 == v11;
      }
      else
      {
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  [(_CLVertex *)self coordinate];
  uint64_t v5 = v4;
  [(_CLVertex *)self coordinate];
  return (id)[v3 stringWithFormat:@"#polygon,_CLVertex (latitude:'%.07lf', longitude:'%.07lf')", v5, v6];
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)&qword_190885000;
  LODWORD(v3) = llround(self->_coordinate.latitude * 100000.0);
  LODWORD(v2) = llround(self->_coordinate.longitude * 100000.0);
  return v3 | (v2 << 32);
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

@end