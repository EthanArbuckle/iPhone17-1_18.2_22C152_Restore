@interface UARPAccessoryHardwareID
- (UARPAccessoryHardwareID)init;
- (UARPAccessoryHardwareID)initWithTransport:(int64_t)a3;
- (int64_t)transport;
@end

@implementation UARPAccessoryHardwareID

- (UARPAccessoryHardwareID)init
{
  return 0;
}

- (UARPAccessoryHardwareID)initWithTransport:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UARPAccessoryHardwareID;
  result = [(UARPAccessoryHardwareID *)&v5 init];
  if (result) {
    result->_transport = a3;
  }
  return result;
}

- (int64_t)transport
{
  return self->_transport;
}

@end