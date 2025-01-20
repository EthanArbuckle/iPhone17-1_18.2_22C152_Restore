@interface SSHBHIDMotionSample
- (NSString)description;
- (double)timestamp;
- (float)x;
- (float)y;
- (float)z;
- (id)csv;
- (unsigned)sequence;
- (unsigned)subtype;
- (unsigned)type;
- (void)setSequence:(unsigned int)a3;
- (void)setSubtype:(unsigned int)a3;
- (void)setTimestamp:(double)a3;
- (void)setType:(unsigned int)a3;
- (void)setX:(float)a3;
- (void)setY:(float)a3;
- (void)setZ:(float)a3;
@end

@implementation SSHBHIDMotionSample

- (NSString)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 initWithString:v5];

  [(SSHBHIDMotionSample *)self timestamp];
  [v6 appendFormat:@"\nt: %f" v7];
  [(SSHBHIDMotionSample *)self x];
  [v6 appendFormat:@"\nx: %f", v8];
  [(SSHBHIDMotionSample *)self y];
  [v6 appendFormat:@"\ny: %f", v9];
  [(SSHBHIDMotionSample *)self z];
  [v6 appendFormat:@"\nz: %f", v10];
  [v6 appendFormat:@"\ns: %u" [self sequence]];

  return (NSString *)v6;
}

- (id)csv
{
  [(SSHBHIDMotionSample *)self timestamp];
  uint64_t v4 = v3;
  [(SSHBHIDMotionSample *)self x];
  double v6 = v5;
  [(SSHBHIDMotionSample *)self y];
  double v8 = v7;
  [(SSHBHIDMotionSample *)self z];
  return +[NSString stringWithFormat:@"%f,%f,%f,%f,%d", v4, *(void *)&v6, *(void *)&v8, v9, [(SSHBHIDMotionSample *)self sequence]];
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
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

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
}

- (unsigned)subtype
{
  return self->_subtype;
}

- (void)setSubtype:(unsigned int)a3
{
  self->_subtype = a3;
}

- (unsigned)sequence
{
  return self->_sequence;
}

- (void)setSequence:(unsigned int)a3
{
  self->_sequence = a3;
}

@end