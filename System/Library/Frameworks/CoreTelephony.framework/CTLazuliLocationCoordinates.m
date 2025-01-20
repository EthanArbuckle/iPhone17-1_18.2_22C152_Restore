@interface CTLazuliLocationCoordinates
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliLocationCoordinates:(id)a3;
- (CTLazuliLocationCoordinates)initWithCoder:(id)a3;
- (CTLazuliLocationCoordinates)initWithReflection:(const LocationCoordinates *)a3;
- (NSNumber)latitude;
- (NSNumber)longitude;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setLatitude:(id)a3;
- (void)setLongitude:(id)a3;
@end

@implementation CTLazuliLocationCoordinates

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliLocationCoordinates *)self longitude];
  [v3 appendFormat:@", longitude = %@", v4];

  v5 = [(CTLazuliLocationCoordinates *)self latitude];
  [v3 appendFormat:@", latitude = %@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliLocationCoordinates:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliLocationCoordinates *)self longitude];
  [v5 doubleValue];
  double v7 = v6;
  v8 = [v4 longitude];
  [v8 doubleValue];
  if (v7 == v9)
  {
    v10 = [(CTLazuliLocationCoordinates *)self latitude];
    [v10 doubleValue];
    double v12 = v11;
    v13 = [v4 latitude];
    [v13 doubleValue];
    BOOL v15 = v12 == v14;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliLocationCoordinates *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliLocationCoordinates *)self isEqualToCTLazuliLocationCoordinates:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliLocationCoordinates allocWithZone:a3];
  [(CTLazuliLocationCoordinates *)v4 setLongitude:self->_longitude];
  [(CTLazuliLocationCoordinates *)v4 setLatitude:self->_latitude];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_longitude forKey:@"kLongitudeKey"];
  [v4 encodeObject:self->_latitude forKey:@"kLatitudeKey"];
}

- (CTLazuliLocationCoordinates)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliLocationCoordinates;
  v5 = [(CTLazuliLocationCoordinates *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kLongitudeKey"];
    longitude = v5->_longitude;
    v5->_longitude = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kLatitudeKey"];
    latitude = v5->_latitude;
    v5->_latitude = (NSNumber *)v8;
  }
  return v5;
}

- (CTLazuliLocationCoordinates)initWithReflection:(const LocationCoordinates *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CTLazuliLocationCoordinates;
  id v4 = [(CTLazuliLocationCoordinates *)&v10 init];
  if (v4)
  {
    uint64_t v5 = [NSNumber numberWithDouble:a3->var0];
    longitude = v4->_longitude;
    v4->_longitude = (NSNumber *)v5;

    uint64_t v7 = [NSNumber numberWithDouble:a3->var1];
    latitude = v4->_latitude;
    v4->_latitude = (NSNumber *)v7;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(id)a3
{
}

- (NSNumber)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latitude, 0);

  objc_storeStrong((id *)&self->_longitude, 0);
}

@end