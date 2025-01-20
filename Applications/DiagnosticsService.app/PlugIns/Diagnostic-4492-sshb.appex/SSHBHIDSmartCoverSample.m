@interface SSHBHIDSmartCoverSample
- (BOOL)isDownEvent;
- (NSString)description;
- (double)timestamp;
- (id)csv;
- (unsigned)location;
- (void)setIsDownEvent:(BOOL)a3;
- (void)setLocation:(unsigned int)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation SSHBHIDSmartCoverSample

- (NSString)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 initWithString:v5];

  v10.receiver = self;
  v10.super_class = (Class)SSHBHIDSmartCoverSample;
  v7 = [(SSHBHIDSmartCoverSample *)&v10 description];
  [v6 appendFormat:@"\n%@", v7];

  [v6 appendFormat:@"\nlocation: %d" , [self location]];
  [v6 appendFormat:@"\ndownEvent: %d" [self isDownEvent]];
  [(SSHBHIDSmartCoverSample *)self timestamp];
  [v6 appendFormat:@"\ntimestamp: %f", v8];

  return (NSString *)v6;
}

- (id)csv
{
  [(SSHBHIDSmartCoverSample *)self timestamp];
  return +[NSString stringWithFormat:@"%f,%d,%d", v3, [(SSHBHIDSmartCoverSample *)self location], [(SSHBHIDSmartCoverSample *)self isDownEvent]];
}

- (unsigned)location
{
  return self->_location;
}

- (void)setLocation:(unsigned int)a3
{
  self->_location = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (BOOL)isDownEvent
{
  return self->_isDownEvent;
}

- (void)setIsDownEvent:(BOOL)a3
{
  self->_isDownEvent = a3;
}

@end