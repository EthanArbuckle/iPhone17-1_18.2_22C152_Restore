@interface UARPSupportedAccessoryA3059USB
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA3059USB)init;
@end

@implementation UARPSupportedAccessoryA3059USB

- (UARPSupportedAccessoryA3059USB)init
{
  v8.receiver = self;
  v8.super_class = (Class)UARPSupportedAccessoryA3059USB;
  v2 = [(UARPSupportedAccessoryAirPodsCaseUSB *)&v8 init];
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA3059USB appleModelNumber];
    [(UARPSupportedAccessory *)v2 setAppleModelNumber:v3];

    [(UARPSupportedAccessory *)v2 setModelName:@"AirPods Pro 2 Case"];
    v4 = +[UARPSupportedAccessoryAirPodsBud mobileAssetAppleModelNumber];
    [(UARPSupportedAccessory *)v2 setMobileAssetAppleModelNumber:v4];

    v5 = [[UARPAccessoryHardwareUSB alloc] initWithVendorID:+[UARPSupportedAccessoryAirPodsCaseUSB vendorID](UARPSupportedAccessoryAirPodsCaseUSB, "vendorID") productID:+[UARPSupportedAccessoryA3059USB productID]];
    hwID = v2->hwID;
    v2->hwID = v5;

    [(UARPSupportedAccessory *)v2 setHardwareID:v2->hwID];
  }
  return v2;
}

+ (id)appleModelNumber
{
  return +[UARPSupportedAccessoryA3059 appleModelNumber];
}

+ (unsigned)productID
{
  return 5024;
}

- (void).cxx_destruct
{
}

@end