@interface UARPSupportedAccessoryA2049
+ (id)appleModelNumber;
+ (id)modelName;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2049)init;
@end

@implementation UARPSupportedAccessoryA2049

- (UARPSupportedAccessoryA2049)init
{
  v8.receiver = self;
  v8.super_class = (Class)UARPSupportedAccessoryA2049;
  v2 = [(UARPSupportedAccessoryUSB *)&v8 init];
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2049 appleModelNumber];
    [(UARPSupportedAccessory *)v2 setAppleModelNumber:v3];

    v4 = +[UARPSupportedAccessoryA2049 modelName];
    [(UARPSupportedAccessory *)v2 setModelName:v4];

    v5 = [[UARPAccessoryHardwareUSB alloc] initWithVendorID:+[UARPSupportedAccessoryUSB vendorID](UARPSupportedAccessoryUSB, "vendorID") productID:+[UARPSupportedAccessoryA2049 productID]];
    hwID = v2->hwID;
    v2->hwID = v5;

    [(UARPSupportedAccessory *)v2 setHardwareID:v2->hwID];
  }
  return v2;
}

+ (id)appleModelNumber
{
  return @"A2049";
}

+ (unsigned)productID
{
  return 4362;
}

+ (id)modelName
{
  return @"USB-C to 3.5 mm Headphone Jack Adapter";
}

- (void).cxx_destruct
{
}

@end