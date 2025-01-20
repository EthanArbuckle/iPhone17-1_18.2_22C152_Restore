@interface UARPSupportedAccessoryA2458
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2458)init;
@end

@implementation UARPSupportedAccessoryA2458

- (UARPSupportedAccessoryA2458)init
{
  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA2458;
  v2 = [(UARPSupportedAccessoryMagSafe *)&v7 init];
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2458 appleModelNumber];
    [(UARPSupportedAccessory *)v2 setAppleModelNumber:v3];

    [(UARPSupportedAccessory *)v2 setModelName:@"MagSafe Duo Charger"];
    v4 = [[UARPAccessoryHardwareHID alloc] initWithVendorID:+[UARPSupportedAccessoryHID vendorID](UARPSupportedAccessoryHID, "vendorID") productID:+[UARPSupportedAccessoryA2458 productID]];
    hwID = v2->hwID;
    v2->hwID = v4;

    [(UARPSupportedAccessory *)v2 setHardwareID:v2->hwID];
  }
  return v2;
}

+ (id)appleModelNumber
{
  return @"A2458";
}

+ (unsigned)productID
{
  return 1282;
}

- (void).cxx_destruct
{
}

@end