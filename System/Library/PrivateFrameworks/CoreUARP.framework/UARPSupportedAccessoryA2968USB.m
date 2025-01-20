@interface UARPSupportedAccessoryA2968USB
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2968USB)init;
@end

@implementation UARPSupportedAccessoryA2968USB

- (UARPSupportedAccessoryA2968USB)init
{
  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA2968USB;
  v2 = [(UARPSupportedAccessoryAirPodsCaseUSB *)&v7 init];
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2968USB appleModelNumber];
    [(UARPSupportedAccessory *)v2 setAppleModelNumber:v3];

    [(UARPSupportedAccessory *)v2 setModelName:@"AirPods Pro 2 Case"];
    [(UARPSupportedAccessory *)v2 setPersonalizationNotification:@"com.apple.uarp.BTLEServer.personalizationNeeded"];
    v4 = [[UARPAccessoryHardwareUSB alloc] initWithVendorID:+[UARPSupportedAccessoryAirPodsCaseUSB vendorID](UARPSupportedAccessoryAirPodsCaseUSB, "vendorID") productID:+[UARPSupportedAccessoryA2968USB productID]];
    hwID = v2->hwID;
    v2->hwID = v4;

    [(UARPSupportedAccessory *)v2 setHardwareID:v2->hwID];
  }
  return v2;
}

+ (id)appleModelNumber
{
  return +[UARPSupportedAccessoryA2968 appleModelNumber];
}

+ (unsigned)productID
{
  return 5022;
}

- (void).cxx_destruct
{
}

@end