@interface UARPSupportedAccessoryUSBPDMagSafe
+ (int64_t)deviceClass;
+ (int64_t)locationType;
- (UARPSupportedAccessoryUSBPDMagSafe)init;
@end

@implementation UARPSupportedAccessoryUSBPDMagSafe

- (UARPSupportedAccessoryUSBPDMagSafe)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPSupportedAccessoryUSBPDMagSafe;
  return [(UARPSupportedAccessoryUSBPD *)&v3 init];
}

+ (int64_t)deviceClass
{
  return 0;
}

+ (int64_t)locationType
{
  return 1;
}

@end