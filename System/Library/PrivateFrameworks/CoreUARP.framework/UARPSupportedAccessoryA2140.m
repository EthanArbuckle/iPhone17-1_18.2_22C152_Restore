@interface UARPSupportedAccessoryA2140
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2140)init;
@end

@implementation UARPSupportedAccessoryA2140

- (UARPSupportedAccessoryA2140)init
{
  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA2140;
  v2 = [(UARPSupportedAccessoryMagSafe *)&v7 init];
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2140 appleModelNumber];
    [(UARPSupportedAccessory *)v2 setAppleModelNumber:v3];

    [(UARPSupportedAccessory *)v2 setModelName:@"MagSafe Charger"];
    v4 = [[UARPAccessoryHardwareHID alloc] initWithVendorID:+[UARPSupportedAccessoryHID vendorID](UARPSupportedAccessoryHID, "vendorID") productID:+[UARPSupportedAccessoryA2140 productID]];
    hwID = v2->hwID;
    v2->hwID = v4;

    [(UARPSupportedAccessory *)v2 setHardwareID:v2->hwID];
  }
  return v2;
}

+ (id)appleModelNumber
{
  return @"A2140";
}

+ (unsigned)productID
{
  return 1280;
}

- (void).cxx_destruct
{
}

@end