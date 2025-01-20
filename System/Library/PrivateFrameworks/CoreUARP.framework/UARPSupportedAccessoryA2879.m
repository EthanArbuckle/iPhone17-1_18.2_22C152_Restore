@interface UARPSupportedAccessoryA2879
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2879)init;
@end

@implementation UARPSupportedAccessoryA2879

- (UARPSupportedAccessoryA2879)init
{
  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA2879;
  v2 = [(UARPSupportedAccessoryWatchPuck *)&v7 init];
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2879 appleModelNumber];
    [(UARPSupportedAccessory *)v2 setAppleModelNumber:v3];

    [(UARPSupportedAccessory *)v2 setModelName:@"Watch Puck Charger"];
    v4 = [[UARPAccessoryHardwareHID alloc] initWithVendorID:+[UARPSupportedAccessoryHID vendorID](UARPSupportedAccessoryHID, "vendorID") productID:+[UARPSupportedAccessoryA2879 productID]];
    hwID = v2->hwID;
    v2->hwID = v4;

    [(UARPSupportedAccessory *)v2 setHardwareID:v2->hwID];
  }
  return v2;
}

+ (id)appleModelNumber
{
  return @"A2879";
}

+ (unsigned)productID
{
  return 1287;
}

- (void).cxx_destruct
{
}

@end