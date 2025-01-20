@interface UARPSupportedAccessoryA3046DFUSimulated
+ (id)appleModelNumber;
+ (id)modelName;
+ (unsigned)productID;
- (UARPSupportedAccessoryA3046DFUSimulated)init;
@end

@implementation UARPSupportedAccessoryA3046DFUSimulated

- (UARPSupportedAccessoryA3046DFUSimulated)init
{
  v9.receiver = self;
  v9.super_class = (Class)UARPSupportedAccessoryA3046DFUSimulated;
  v2 = [(UARPSupportedAccessoryUSB *)&v9 init];
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA3046DFUSimulated appleModelNumber];
    [(UARPSupportedAccessory *)v2 setAppleModelNumber:v3];

    v4 = +[UARPSupportedAccessoryA3046DFUSimulated modelName];
    [(UARPSupportedAccessory *)v2 setModelName:v4];

    [(UARPSupportedAccessory *)v2 setDfuMode:1];
    [(UARPSupportedAccessory *)v2 setIsSimulator:1];
    v5 = +[UARPSupportedAccessoryA3046 appleModelNumber];
    [(UARPSupportedAccessory *)v2 setMobileAssetAppleModelNumber:v5];

    v6 = [[UARPAccessoryHardwareUSB alloc] initWithVendorID:+[UARPSupportedAccessoryA3046Simulated vendorID](UARPSupportedAccessoryA3046Simulated, "vendorID") productID:+[UARPSupportedAccessoryA3046DFUSimulated productID]];
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
  v4 = [v2 stringWithFormat:@"%@-DFUSIM", v3];

  return v4;
}

+ (unsigned)productID
{
  return +[UARPSupportedAccessoryA3046DFU productID];
}

+ (id)modelName
{
  v2 = NSString;
  v3 = +[UARPSupportedAccessoryA3046DFU modelName];
  v4 = [v2 stringWithFormat:@"%@ [Simulator]", v3];

  return v4;
}

- (void).cxx_destruct
{
}

@end