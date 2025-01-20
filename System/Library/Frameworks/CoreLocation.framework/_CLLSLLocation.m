@interface _CLLSLLocation
+ (BOOL)supportsSecureCoding;
- (_CLLSLLocation)initWithCoder:(id)a3;
- (_CLLSLLocation)initWithCoordinate:(id)a3;
- (_CLLSLLocation)initWithCoordinate:(id)a3 altitude:(double)a4 timetamp:(double)a5;
- (_CLLSLLocation)initWithLatitude:(double)a3 longitude:(double)a4;
- (_CLLSLLocation)initWithLatitude:(double)a3 longitude:(double)a4 altitude:(double)a5 timetamp:(double)a6;
- (_CLLSLLocationCoordinate)coordinate;
- (double)altitude;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithMemberIndent:(id)a3 endIndent:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAltitude:(double)a3;
- (void)setCoordinate:(id)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation _CLLSLLocation

- (_CLLSLLocation)initWithLatitude:(double)a3 longitude:(double)a4
{
  v5 = [[_CLLSLLocationCoordinate alloc] initWithLatitude:a3 longitude:a4];

  return (_CLLSLLocation *)MEMORY[0x1F4181798](self, sel_initWithCoordinate_altitude_timetamp_);
}

- (_CLLSLLocation)initWithCoordinate:(id)a3
{
  return (_CLLSLLocation *)MEMORY[0x1F4181798](self, sel_initWithCoordinate_altitude_timetamp_);
}

- (_CLLSLLocation)initWithLatitude:(double)a3 longitude:(double)a4 altitude:(double)a5 timetamp:(double)a6
{
  v7 = [[_CLLSLLocationCoordinate alloc] initWithLatitude:a3 longitude:a4];

  return (_CLLSLLocation *)MEMORY[0x1F4181798](self, sel_initWithCoordinate_altitude_timetamp_);
}

- (_CLLSLLocation)initWithCoordinate:(id)a3 altitude:(double)a4 timetamp:(double)a5
{
  v10.receiver = self;
  v10.super_class = (Class)_CLLSLLocation;
  v8 = [(_CLLSLLocation *)&v10 init];
  if (v8)
  {
    v8->_coordinate = (_CLLSLLocationCoordinate *)[a3 copy];
    v8->_altitude = a4;
    v8->_timestamp = a5;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CLLSLLocation;
  [(_CLLSLLocation *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v5 + 8) = [(_CLLSLLocationCoordinate *)self->_coordinate copyWithZone:a3];
  *(double *)(v5 + 16) = self->_altitude;
  *(double *)(v5 + 24) = self->_timestamp;
  return (id)v5;
}

- (_CLLSLLocation)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_CLLSLLocation;
  v4 = [(_CLLSLLocation *)&v8 init];
  if (v4)
  {
    v4->_coordinate = (_CLLSLLocationCoordinate *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"coordinate"];
    [a3 decodeDoubleForKey:@"altitude"];
    v4->_altitude = v5;
    [a3 decodeDoubleForKey:@"timestamp"];
    v4->_timestamp = v6;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_coordinate forKey:@"coordinate"];
  [a3 encodeDouble:@"altitude" forKey:self->_altitude];
  double timestamp = self->_timestamp;

  [a3 encodeDouble:@"timestamp" forKey:timestamp];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return [(_CLLSLLocation *)self descriptionWithMemberIndent:@"\t" endIndent:&stru_1EE006720];
}

- (id)descriptionWithMemberIndent:(id)a3 endIndent:(id)a4
{
  v7 = NSString;
  objc_super v8 = [(_CLLSLLocation *)self coordinate];
  [(_CLLSLLocation *)self altitude];
  uint64_t v10 = v9;
  [(_CLLSLLocation *)self timestamp];
  return (id)[v7 stringWithFormat:@"<_CLLSLLocation: %p> {\n%@.coordinate = %@,\n%@.altitude = %f,\n%@.double timestamp = %f\n%@}", self, a3, v8, a3, v10, a3, v11, a4];
}

- (_CLLSLLocationCoordinate)coordinate
{
  return self->_coordinate;
}

- (void)setCoordinate:(id)a3
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

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_double timestamp = a3;
}

@end