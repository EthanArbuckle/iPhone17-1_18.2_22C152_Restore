@interface UARPSupportedAccessoryA3088
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA3088)init;
@end

@implementation UARPSupportedAccessoryA3088

- (UARPSupportedAccessoryA3088)init
{
  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA3088;
  v2 = [(UARPSupportedAccessoryMagSafe *)&v7 init];
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA3088 appleModelNumber];
    [(UARPSupportedAccessory *)v2 setAppleModelNumber:v3];

    [(UARPSupportedAccessory *)v2 setModelName:@"MagSafe Charger (MFi Module)"];
    v4 = [[UARPAccessoryHardwareHID alloc] initWithVendorID:+[UARPSupportedAccessoryHID vendorID](UARPSupportedAccessoryHID, "vendorID") productID:+[UARPSupportedAccessoryA3088 productID]];
    hwID = v2->hwID;
    v2->hwID = v4;

    [(UARPSupportedAccessory *)v2 setHardwareID:v2->hwID];
  }
  return v2;
}

+ (id)appleModelNumber
{
  return @"A3088";
}

+ (unsigned)productID
{
  return 1288;
}

- (void).cxx_destruct
{
}

@end