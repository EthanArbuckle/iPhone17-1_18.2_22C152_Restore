@interface UARPSupportedAccessoryA3046Simulated
+ (id)appleModelNumber;
+ (id)modelName;
+ (unsigned)productID;
+ (unsigned)vendorID;
- (UARPSupportedAccessoryA3046Simulated)init;
@end

@implementation UARPSupportedAccessoryA3046Simulated

- (UARPSupportedAccessoryA3046Simulated)init
{
  v9.receiver = self;
  v9.super_class = (Class)UARPSupportedAccessoryA3046Simulated;
  v2 = [(UARPSupportedAccessoryUSB *)&v9 init];
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA3046Simulated appleModelNumber];
    [(UARPSupportedAccessory *)v2 setAppleModelNumber:v3];

    v4 = +[UARPSupportedAccessoryA3046Simulated modelName];
    [(UARPSupportedAccessory *)v2 setModelName:v4];

    [(UARPSupportedAccessory *)v2 setIsSimulator:1];
    v5 = +[UARPSupportedAccessoryA3046 appleModelNumber];
    [(UARPSupportedAccessory *)v2 setMobileAssetAppleModelNumber:v5];

    v6 = [[UARPAccessoryHardwareUSB alloc] initWithVendorID:+[UARPSupportedAccessoryA3046Simulated vendorID](UARPSupportedAccessoryA3046Simulated, "vendorID") productID:+[UARPSupportedAccessoryA3046Simulated productID]];
    hwID = v2->hwID;
    v2->hwID = v6;

    [(UARPSupportedAccessory *)v2 setHardwareID:v2->hwID];
  }
  return v2;
}

+ (id)appleModelNumber
{
  v2 = NSString;
  v3 = +[UARPSupportedAccessoryA3046 appleModelNumber];
  v4 = [v2 stringWithFormat:@"%@-SIM", v3];

  return v4;
}

+ (unsigned)vendorID
{
  return 1093;
}

+ (unsigned)productID
{
  return +[UARPSupportedAccessoryA3046 productID];
}

+ (id)modelName
{
  v2 = NSString;
  v3 = +[UARPSupportedAccessoryA3046 modelName];
  v4 = [v2 stringWithFormat:@"%@ [Simulator]", v3];

  return v4;
}

- (void).cxx_destruct
{
}

@end