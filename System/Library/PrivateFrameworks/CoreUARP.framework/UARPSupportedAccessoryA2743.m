@interface UARPSupportedAccessoryA2743
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2743)init;
@end

@implementation UARPSupportedAccessoryA2743

- (UARPSupportedAccessoryA2743)init
{
  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA2743;
  v2 = [(UARPSupportedAccessoryUSBPDPowerAdapter *)&v7 init];
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2743 appleModelNumber];
    [(UARPSupportedAccessory *)v2 setAppleModelNumber:v3];

    [(UARPSupportedAccessory *)v2 setModelName:@"Power Adapter"];
    [(UARPSupportedAccessory *)v2 setSupportsAnalytics:1];
    v4 = [[UARPAccessoryHardwareUSBPD alloc] initWithVendorID:+[UARPSupportedAccessoryUSBPD vendorID](UARPSupportedAccessoryUSBPD, "vendorID") productID:+[UARPSupportedAccessoryA2743 productID](UARPSupportedAccessoryA2743, "productID") usbpdClass:+[UARPSupportedAccessoryUSBPDPowerAdapter deviceClass](UARPSupportedAccessoryUSBPDPowerAdapter, "deviceClass") locationType:+[UARPSupportedAccessoryUSBPD locationType] supportsAccMode7:[(UARPSupportedAccessory *)v2 supportsAccMode7]];
    hwID = v2->hwID;
    v2->hwID = v4;

    [(UARPSupportedAccessory *)v2 setHardwareID:v2->hwID];
  }
  return v2;
}

+ (id)appleModelNumber
{
  return @"A2743";
}

+ (unsigned)productID
{
  return 28700;
}

- (void).cxx_destruct
{
}

@end