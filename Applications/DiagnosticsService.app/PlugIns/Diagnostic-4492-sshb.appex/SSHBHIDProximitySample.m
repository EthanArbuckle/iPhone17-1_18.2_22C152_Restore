@interface SSHBHIDProximitySample
- (NSString)description;
- (id)csv;
- (unsigned)detectionMask;
- (unsigned)level;
- (void)setDetectionMask:(unsigned int)a3;
- (void)setLevel:(unsigned int)a3;
@end

@implementation SSHBHIDProximitySample

- (NSString)description
{
  return +[NSString stringWithFormat:@"Mask: %d, Level: %d", [(SSHBHIDProximitySample *)self detectionMask], [(SSHBHIDProximitySample *)self level]];
}

- (id)csv
{
  return +[NSString stringWithFormat:@"%d,%d", [(SSHBHIDProximitySample *)self detectionMask], [(SSHBHIDProximitySample *)self level]];
}

- (unsigned)detectionMask
{
  return self->_detectionMask;
}

- (void)setDetectionMask:(unsigned int)a3
{
  self->_detectionMask = a3;
}

- (unsigned)level
{
  return self->_level;
}

- (void)setLevel:(unsigned int)a3
{
  self->_level = a3;
}

@end