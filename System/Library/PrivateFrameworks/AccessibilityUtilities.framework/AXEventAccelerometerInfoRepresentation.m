@interface AXEventAccelerometerInfoRepresentation
+ (BOOL)supportsSecureCoding;
- (AXEventAccelerometerInfoRepresentation)initWithCoder:(id)a3;
- (NSString)description;
- (float)x;
- (float)y;
- (float)z;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)type;
- (void)encodeWithCoder:(id)a3;
- (void)setType:(unsigned int)a3;
- (void)setX:(float)a3;
- (void)setY:(float)a3;
- (void)setZ:(float)a3;
@end

@implementation AXEventAccelerometerInfoRepresentation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXEventAccelerometerInfoRepresentation)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AXEventAccelerometerInfoRepresentation;
  v5 = [(AXEventAccelerometerInfoRepresentation *)&v7 init];
  if (v5)
  {
    [v4 decodeFloatForKey:@"x"];
    -[AXEventAccelerometerInfoRepresentation setX:](v5, "setX:");
    [v4 decodeFloatForKey:@"y"];
    -[AXEventAccelerometerInfoRepresentation setY:](v5, "setY:");
    [v4 decodeFloatForKey:@"z"];
    -[AXEventAccelerometerInfoRepresentation setZ:](v5, "setZ:");
    -[AXEventAccelerometerInfoRepresentation setType:](v5, "setType:", [v4 decodeInt32ForKey:@"type"]);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(AXEventAccelerometerInfoRepresentation);
  [(AXEventAccelerometerInfoRepresentation *)self x];
  -[AXEventAccelerometerInfoRepresentation setX:](v4, "setX:");
  [(AXEventAccelerometerInfoRepresentation *)self y];
  -[AXEventAccelerometerInfoRepresentation setY:](v4, "setY:");
  [(AXEventAccelerometerInfoRepresentation *)self z];
  -[AXEventAccelerometerInfoRepresentation setZ:](v4, "setZ:");
  [(AXEventAccelerometerInfoRepresentation *)v4 setType:[(AXEventAccelerometerInfoRepresentation *)self type]];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[AXEventAccelerometerInfoRepresentation type](self, "type"), @"type");
  [(AXEventAccelerometerInfoRepresentation *)self x];
  objc_msgSend(v4, "encodeFloat:forKey:", @"x");
  [(AXEventAccelerometerInfoRepresentation *)self y];
  objc_msgSend(v4, "encodeFloat:forKey:", @"y");
  [(AXEventAccelerometerInfoRepresentation *)self z];
  objc_msgSend(v4, "encodeFloat:forKey:", @"z");
}

- (NSString)description
{
  v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)AXEventAccelerometerInfoRepresentation;
  id v4 = [(AXEventAccelerometerInfoRepresentation *)&v12 description];
  [(AXEventAccelerometerInfoRepresentation *)self x];
  double v6 = v5;
  [(AXEventAccelerometerInfoRepresentation *)self y];
  double v8 = v7;
  [(AXEventAccelerometerInfoRepresentation *)self z];
  v10 = [v3 stringWithFormat:@"%@ [%f %f %f]", v4, *(void *)&v6, *(void *)&v8, v9];

  return (NSString *)v10;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
}

- (float)x
{
  return self->_x;
}

- (void)setX:(float)a3
{
  self->_x = a3;
}

- (float)y
{
  return self->_y;
}

- (void)setY:(float)a3
{
  self->_y = a3;
}

- (float)z
{
  return self->_z;
}

- (void)setZ:(float)a3
{
  self->_z = a3;
}

@end