@interface UARPSupportedAccessoryA2781
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2781)init;
@end

@implementation UARPSupportedAccessoryA2781

- (UARPSupportedAccessoryA2781)init
{
  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA2781;
  v2 = [(UARPSupportedAccessoryMagSafe *)&v7 init];
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2781 appleModelNumber];
    [(UARPSupportedAccessory *)v2 setAppleModelNumber:v3];

    [(UARPSupportedAccessory *)v2 setModelName:@"Apple Vision Pro Battery"];
    [(UARPSupportedAccessory *)v2 setSupportsAnalytics:1];
    v4 = [[UARPAccessoryHardwareHID alloc] initWithVendorID:+[UARPSupportedAccessoryHID vendorID](UARPSupportedAccessoryHID, "vendorID") productID:+[UARPSupportedAccessoryA2781 productID]];
    hwID = v2->hwID;
    v2->hwID = v4;

    [(UARPSupportedAccessory *)v2 setHardwareID:v2->hwID];
  }
  return v2;
}

+ (id)appleModelNumber
{
  return @"A2781";
}

+ (unsigned)productID
{
  return 30723;
}

- (void).cxx_destruct
{
}

@end