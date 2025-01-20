@interface UARPSupportedAccessoryA3046
+ (id)appleModelNumber;
+ (id)modelName;
+ (unsigned)productID;
- (UARPSupportedAccessoryA3046)init;
@end

@implementation UARPSupportedAccessoryA3046

- (UARPSupportedAccessoryA3046)init
{
  v8.receiver = self;
  v8.super_class = (Class)UARPSupportedAccessoryA3046;
  v2 = [(UARPSupportedAccessoryUSB *)&v8 init];
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA3046 appleModelNumber];
    [(UARPSupportedAccessory *)v2 setAppleModelNumber:v3];

    v4 = +[UARPSupportedAccessoryA3046 modelName];
    [(UARPSupportedAccessory *)v2 setModelName:v4];

    v5 = [[UARPAccessoryHardwareUSB alloc] initWithVendorID:+[UARPSupportedAccessoryUSB vendorID](UARPSupportedAccessoryUSB, "vendorID") productID:+[UARPSupportedAccessoryA3046 productID]];
    hwID = v2->hwID;
    v2->hwID = v5;

    [(UARPSupportedAccessory *)v2 setHardwareID:v2->hwID];
  }
  return v2;
}

+ (id)appleModelNumber
{
  return @"A3046";
}

+ (unsigned)productID
{
  return 4363;
}

+ (id)modelName
{
  return @"USB-C to 3.5 mm Headphone Jack Adapter";
}

- (void).cxx_destruct
{
}

@end