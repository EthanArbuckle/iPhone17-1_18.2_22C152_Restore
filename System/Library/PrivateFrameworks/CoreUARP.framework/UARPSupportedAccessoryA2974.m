@interface UARPSupportedAccessoryA2974
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2974)init;
@end

@implementation UARPSupportedAccessoryA2974

- (UARPSupportedAccessoryA2974)init
{
  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA2974;
  v2 = [(UARPSupportedAccessoryMagicKeyboard *)&v7 init];
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2974 appleModelNumber];
    [(UARPSupportedAccessory *)v2 setAppleModelNumber:v3];

    [(UARPSupportedAccessory *)v2 setModelName:@"Magic Keyboard"];
    [(UARPSupportedAccessory *)v2 setUpdateRequiresPowerAssertion:1];
    v4 = [[UARPAccessoryHardwareHID alloc] initWithVendorID:+[UARPSupportedAccessoryHID vendorID](UARPSupportedAccessoryMagicKeyboard, "vendorID") productID:+[UARPSupportedAccessoryA2974 productID]];
    hwID = v2->hwID;
    v2->hwID = v4;

    [(UARPSupportedAccessory *)v2 setHardwareID:v2->hwID];
  }
  return v2;
}

+ (id)appleModelNumber
{
  return @"A2974";
}

+ (unsigned)productID
{
  return 1109;
}

- (void).cxx_destruct
{
}

@end