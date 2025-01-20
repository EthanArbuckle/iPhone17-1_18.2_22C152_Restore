@interface UARPSupportedAccessoryA2538
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2538)init;
@end

@implementation UARPSupportedAccessoryA2538

- (UARPSupportedAccessoryA2538)init
{
  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA2538;
  v2 = [(UARPSupportedAccessoryPencil *)&v7 init];
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2538 appleModelNumber];
    [(UARPSupportedAccessory *)v2 setAppleModelNumber:v3];

    [(UARPSupportedAccessory *)v2 setUpdateRequiresPowerAssertion:1];
    v4 = [[UARPAccessoryHardwareHID alloc] initWithVendorID:+[UARPSupportedAccessoryPencil vendorID](UARPSupportedAccessoryPencil, "vendorID") productID:+[UARPSupportedAccessoryA2538 productID]];
    hwID = v2->hwID;
    v2->hwID = v4;

    [(UARPSupportedAccessory *)v2 setHardwareID:v2->hwID];
  }
  return v2;
}

+ (id)appleModelNumber
{
  return @"A2538";
}

+ (unsigned)productID
{
  return 1106;
}

- (void).cxx_destruct
{
}

@end