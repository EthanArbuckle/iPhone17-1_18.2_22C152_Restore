@interface UARPSupportedAccessoryUSBPDDongle
+ (int64_t)deviceClass;
- (UARPSupportedAccessoryUSBPDDongle)init;
@end

@implementation UARPSupportedAccessoryUSBPDDongle

- (UARPSupportedAccessoryUSBPDDongle)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPSupportedAccessoryUSBPDDongle;
  return [(UARPSupportedAccessoryUSBPD *)&v3 init];
}

+ (int64_t)deviceClass
{
  return 2;
}

@end