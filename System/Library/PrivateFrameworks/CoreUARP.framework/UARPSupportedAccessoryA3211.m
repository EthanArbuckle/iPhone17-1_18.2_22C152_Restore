@interface UARPSupportedAccessoryA3211
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA3211)init;
@end

@implementation UARPSupportedAccessoryA3211

- (UARPSupportedAccessoryA3211)init
{
  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA3211;
  v2 = [(UARPSupportedAccessoryBeatsBluetooth *)&v7 init];
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA3211 appleModelNumber];
    [(UARPSupportedAccessory *)v2 setAppleModelNumber:v3];

    [(UARPSupportedAccessory *)v2 setModelName:@"Speaker"];
    [(UARPSupportedAccessory *)v2 setSupportsHeySiriCompact:0];
    v4 = [[UARPAccessoryHardwareBluetooth alloc] initWithVendorIDSource:1 vendorID:+[UARPSupportedAccessoryBeatsBluetooth vendorID](UARPSupportedAccessoryBeatsBluetooth, "vendorID") productID:+[UARPSupportedAccessoryA3211 productID] productVersion:1];
    hwID = v2->hwID;
    v2->hwID = v4;

    [(UARPSupportedAccessory *)v2 setHardwareID:v2->hwID];
  }
  return v2;
}

+ (id)appleModelNumber
{
  return @"A3211";
}

+ (unsigned)productID
{
  return 8218;
}

- (void).cxx_destruct
{
}

@end