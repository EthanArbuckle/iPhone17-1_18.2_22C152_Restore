@interface UARPSupportedAccessoryA3058USB
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA3058USB)init;
@end

@implementation UARPSupportedAccessoryA3058USB

- (UARPSupportedAccessoryA3058USB)init
{
  v8.receiver = self;
  v8.super_class = (Class)UARPSupportedAccessoryA3058USB;
  v2 = [(UARPSupportedAccessoryAirPodsCaseUSB *)&v8 init];
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA3058USB appleModelNumber];
    [(UARPSupportedAccessory *)v2 setAppleModelNumber:v3];

    [(UARPSupportedAccessory *)v2 setModelName:@"AirPods Pro 2 Case"];
    v4 = +[UARPSupportedAccessoryAirPodsBud mobileAssetAppleModelNumber];
    [(UARPSupportedAccessory *)v2 setMobileAssetAppleModelNumber:v4];

    v5 = [[UARPAccessoryHardwareUSB alloc] initWithVendorID:+[UARPSupportedAccessoryAirPodsCaseUSB vendorID](UARPSupportedAccessoryAirPodsCaseUSB, "vendorID") productID:+[UARPSupportedAccessoryA3058USB productID]];
    hwID = v2->hwID;
    v2->hwID = v5;

    [(UARPSupportedAccessory *)v2 setHardwareID:v2->hwID];
  }
  return v2;
}

+ (id)appleModelNumber
{
  return @"A3058";
}

+ (unsigned)productID
{
  return 5023;
}

- (void).cxx_destruct
{
}

@end