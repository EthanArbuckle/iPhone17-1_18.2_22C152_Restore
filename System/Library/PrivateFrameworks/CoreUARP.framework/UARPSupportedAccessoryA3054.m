@interface UARPSupportedAccessoryA3054
+ (id)appleModelNumber;
+ (id)mobileAssetAppleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA3054)init;
@end

@implementation UARPSupportedAccessoryA3054

- (UARPSupportedAccessoryA3054)init
{
  v8.receiver = self;
  v8.super_class = (Class)UARPSupportedAccessoryA3054;
  v2 = [(UARPSupportedAccessoryAirPodsBud *)&v8 init];
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA3054 appleModelNumber];
    [(UARPSupportedAccessory *)v2 setAppleModelNumber:v3];

    [(UARPSupportedAccessory *)v2 setModelName:@"AirPods Pro 2"];
    v4 = +[UARPSupportedAccessoryA3054 mobileAssetAppleModelNumber];
    [(UARPSupportedAccessory *)v2 setMobileAssetAppleModelNumber:v4];

    v5 = [[UARPAccessoryHardwareBluetooth alloc] initWithVendorIDSource:1 vendorID:+[UARPSupportedAccessoryAirPodsBud vendorID](UARPSupportedAccessoryAirPodsBud, "vendorID") productID:+[UARPSupportedAccessoryA3054 productID] productVersion:1];
    hwID = v2->hwID;
    v2->hwID = v5;

    [(UARPSupportedAccessory *)v2 setHardwareID:v2->hwID];
  }
  return v2;
}

+ (id)appleModelNumber
{
  return @"A3054";
}

+ (id)mobileAssetAppleModelNumber
{
  return +[UARPSupportedAccessoryA3053 appleModelNumber];
}

+ (unsigned)productID
{
  return 8222;
}

- (void).cxx_destruct
{
}

@end