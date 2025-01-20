@interface CAMModeAndDeviceConfigurationChangeListener
- (id)handler;
- (int64_t)desiredDevicePosition;
- (int64_t)desiredMode;
- (void)setDesiredDevicePosition:(int64_t)a3;
- (void)setDesiredMode:(int64_t)a3;
- (void)setHandler:(id)a3;
@end

@implementation CAMModeAndDeviceConfigurationChangeListener

- (int64_t)desiredMode
{
  return self->_desiredMode;
}

- (void)setDesiredMode:(int64_t)a3
{
  self->_desiredMode = a3;
}

- (int64_t)desiredDevicePosition
{
  return self->_desiredDevicePosition;
}

- (void)setDesiredDevicePosition:(int64_t)a3
{
  self->_desiredDevicePosition = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end