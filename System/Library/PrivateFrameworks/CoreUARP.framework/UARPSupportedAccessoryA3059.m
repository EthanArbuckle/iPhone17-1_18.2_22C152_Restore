@interface UARPSupportedAccessoryA3059
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA3059)init;
@end

@implementation UARPSupportedAccessoryA3059

- (UARPSupportedAccessoryA3059)init
{
  v8.receiver = self;
  v8.super_class = (Class)UARPSupportedAccessoryA3059;
  v2 = [(UARPSupportedAccessoryAirPodsCase *)&v8 init];
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA3059 appleModelNumber];
    [(UARPSupportedAccessory *)v2 setAppleModelNumber:v3];

    [(UARPSupportedAccessory *)v2 setModelName:@"AirPods Pro 2 Case"];
    v4 = +[UARPSupportedAccessoryAirPodsBud mobileAssetAppleModelNumber];
    [(UARPSupportedAccessory *)v2 setMobileAssetAppleModelNumber:v4];

    v5 = [[UARPAccessoryHardwareBluetooth alloc] initWithVendorIDSource:1 vendorID:+[UARPSupportedAccessoryAirPodsCase vendorID](UARPSupportedAccessoryAirPodsCase, "vendorID") productID:+[UARPSupportedAccessoryA3059 productID] productVersion:1];
    hwID = v2->hwID;
    v2->hwID = v5;

    [(UARPSupportedAccessory *)v2 setHardwareID:v2->hwID];
  }
  return v2;
}

+ (id)appleModelNumber
{
  return @"A3059";
}

+ (unsigned)productID
{
  return 8220;
}

- (void).cxx_destruct
{
}

@end