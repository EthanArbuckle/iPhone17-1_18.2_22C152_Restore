@interface SSHBHIDAmbientLightSensorSample
- (NSString)description;
- (id)csv;
- (unsigned)brightnesschange;
- (unsigned)level;
- (unsigned)orientation;
- (unsigned)rawchannel0;
- (unsigned)rawchannel1;
- (unsigned)rawchannel2;
- (unsigned)rawchannel3;
- (void)setBrightnesschange:(unsigned int)a3;
- (void)setLevel:(unsigned int)a3;
- (void)setOrientation:(unsigned int)a3;
- (void)setRawchannel0:(unsigned int)a3;
- (void)setRawchannel1:(unsigned int)a3;
- (void)setRawchannel2:(unsigned int)a3;
- (void)setRawchannel3:(unsigned int)a3;
@end

@implementation SSHBHIDAmbientLightSensorSample

- (NSString)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 initWithString:v5];

  [v6 appendFormat:@"\nlevel: %u" , [self level]];
  [v6 appendFormat:@"\nrawchannel0: %u" [self rawchannel0]];
  [v6 appendFormat:@"\nrawchannel1: %u" , [self rawchannel1]];
  [v6 appendFormat:@"\nrawchannel2: %u" , [self rawchannel2]];
  [v6 appendFormat:@"\nrawchannel3: %u" , [self rawchannel3]];
  [v6 appendFormat:@"\nbrightnesschange: %u", [self brightnesschange]];
  [v6 appendFormat:@"\norientation: %u", [self orientation]];

  return (NSString *)v6;
}

- (id)csv
{
  return +[NSString stringWithFormat:@"%u,%u,%u,%u,%u,%u,%u", [(SSHBHIDAmbientLightSensorSample *)self level], [(SSHBHIDAmbientLightSensorSample *)self rawchannel0], [(SSHBHIDAmbientLightSensorSample *)self rawchannel1], [(SSHBHIDAmbientLightSensorSample *)self rawchannel2], [(SSHBHIDAmbientLightSensorSample *)self rawchannel3], [(SSHBHIDAmbientLightSensorSample *)self brightnesschange], [(SSHBHIDAmbientLightSensorSample *)self orientation]];
}

- (unsigned)level
{
  return self->_level;
}

- (void)setLevel:(unsigned int)a3
{
  self->_level = a3;
}

- (unsigned)rawchannel0
{
  return self->_rawchannel0;
}

- (void)setRawchannel0:(unsigned int)a3
{
  self->_rawchannel0 = a3;
}

- (unsigned)rawchannel1
{
  return self->_rawchannel1;
}

- (void)setRawchannel1:(unsigned int)a3
{
  self->_rawchannel1 = a3;
}

- (unsigned)rawchannel2
{
  return self->_rawchannel2;
}

- (void)setRawchannel2:(unsigned int)a3
{
  self->_rawchannel2 = a3;
}

- (unsigned)rawchannel3
{
  return self->_rawchannel3;
}

- (void)setRawchannel3:(unsigned int)a3
{
  self->_rawchannel3 = a3;
}

- (unsigned)brightnesschange
{
  return self->_brightnesschange;
}

- (void)setBrightnesschange:(unsigned int)a3
{
  self->_brightnesschange = a3;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(unsigned int)a3
{
  self->_orientation = a3;
}

@end