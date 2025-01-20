@interface DSClientMotionDataOptions
- (DSClientMotionDataOptions)init;
- (unsigned)dataSubType;
- (unsigned)deviceType;
- (void)setDataSubType:(unsigned int)a3;
- (void)setDeviceType:(unsigned int)a3;
@end

@implementation DSClientMotionDataOptions

- (DSClientMotionDataOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)DSClientMotionDataOptions;
  result = [(DSClientMotionDataOptions *)&v3 init];
  if (result) {
    *(void *)&result->_deviceType = 0;
  }
  return result;
}

- (unsigned)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(unsigned int)a3
{
  self->_deviceType = a3;
}

- (unsigned)dataSubType
{
  return self->_dataSubType;
}

- (void)setDataSubType:(unsigned int)a3
{
  self->_dataSubType = a3;
}

@end