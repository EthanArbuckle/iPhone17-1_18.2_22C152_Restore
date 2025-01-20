@interface UARPAccessoryHardwareIIC
- (UARPAccessoryHardwareIIC)init;
- (id)description;
@end

@implementation UARPAccessoryHardwareIIC

- (UARPAccessoryHardwareIIC)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPAccessoryHardwareIIC;
  return [(UARPAccessoryHardwareID *)&v3 initWithTransport:10];
}

- (id)description
{
  return @"IIC";
}

@end