@interface UARPSupportedAccessoryA3140
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA3140)init;
@end

@implementation UARPSupportedAccessoryA3140

- (UARPSupportedAccessoryA3140)init
{
  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA3140;
  v2 = [(UARPSupportedAccessoryBeatsBluetooth *)&v7 init];
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA3140 appleModelNumber];
    [(UARPSupportedAccessory *)v2 setAppleModelNumber:v3];

    [(UARPSupportedAccessory *)v2 setModelName:@"Headset"];
    v4 = [[UARPAccessoryHardwareBluetooth alloc] initWithVendorIDSource:1 vendorID:+[UARPSupportedAccessoryBeatsBluetooth vendorID](UARPSupportedAccessoryBeatsBluetooth, "vendorID") productID:+[UARPSupportedAccessoryA3140 productID] productVersion:1];
    hwID = v2->hwID;
    v2->hwID = v4;

    [(UARPSupportedAccessory *)v2 setHardwareID:v2->hwID];
  }
  return v2;
}

+ (id)appleModelNumber
{
  return @"A3140";
}

+ (unsigned)productID
{
  return 8229;
}

- (void).cxx_destruct
{
}

@end