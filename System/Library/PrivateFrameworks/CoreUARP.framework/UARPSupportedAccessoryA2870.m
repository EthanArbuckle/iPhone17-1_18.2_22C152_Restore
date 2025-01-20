@interface UARPSupportedAccessoryA2870
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2870)init;
@end

@implementation UARPSupportedAccessoryA2870

- (UARPSupportedAccessoryA2870)init
{
  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA2870;
  v2 = [(UARPSupportedAccessoryBeatsUSB *)&v7 init];
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2870 appleModelNumber];
    [(UARPSupportedAccessory *)v2 setAppleModelNumber:v3];

    [(UARPSupportedAccessory *)v2 setModelName:@"Studio Case"];
    v4 = [[UARPAccessoryHardwareB2PHID alloc] initWithVendorID:+[UARPSupportedAccessoryBeatsUSB vendorID](UARPSupportedAccessoryBeatsUSB, "vendorID") productID:+[UARPSupportedAccessoryA2870 productID]];
    hwID = v2->hwID;
    v2->hwID = v4;

    [(UARPSupportedAccessory *)v2 setHardwareID:v2->hwID];
  }
  return v2;
}

+ (id)appleModelNumber
{
  return @"A2870";
}

+ (unsigned)productID
{
  return 16432;
}

- (void).cxx_destruct
{
}

@end