@interface UARPSupportedAccessoryA2924
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2924)init;
@end

@implementation UARPSupportedAccessoryA2924

- (UARPSupportedAccessoryA2924)init
{
  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA2924;
  v2 = [(UARPSupportedAccessoryBeatsBluetooth *)&v7 init];
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2924 appleModelNumber];
    [(UARPSupportedAccessory *)v2 setAppleModelNumber:v3];

    [(UARPSupportedAccessory *)v2 setModelName:@"Headset"];
    v4 = [[UARPAccessoryHardwareBluetooth alloc] initWithVendorIDSource:1 vendorID:+[UARPSupportedAccessoryBeatsBluetooth vendorID](UARPSupportedAccessoryBeatsBluetooth, "vendorID") productID:+[UARPSupportedAccessoryA2924 productID] productVersion:1];
    hwID = v2->hwID;
    v2->hwID = v4;

    [(UARPSupportedAccessory *)v2 setHardwareID:v2->hwID];
  }
  return v2;
}

+ (id)appleModelNumber
{
  return @"A2924";
}

+ (unsigned)productID
{
  return 8215;
}

- (void).cxx_destruct
{
}

@end