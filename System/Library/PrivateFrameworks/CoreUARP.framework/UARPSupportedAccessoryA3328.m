@interface UARPSupportedAccessoryA3328
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA3328)init;
@end

@implementation UARPSupportedAccessoryA3328

- (UARPSupportedAccessoryA3328)init
{
  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA3328;
  v2 = [(UARPSupportedAccessoryUSBPDPowerAdapter *)&v7 init];
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA3328 appleModelNumber];
    [(UARPSupportedAccessory *)v2 setAppleModelNumber:v3];

    [(UARPSupportedAccessory *)v2 setModelName:@"Power Adapter"];
    [(UARPSupportedAccessory *)v2 setSupportsAnalytics:1];
    v4 = [[UARPAccessoryHardwareUSBPD alloc] initWithVendorID:+[UARPSupportedAccessoryUSBPD vendorID](UARPSupportedAccessoryUSBPD, "vendorID") productID:+[UARPSupportedAccessoryA3328 productID](UARPSupportedAccessoryA3328, "productID") usbpdClass:+[UARPSupportedAccessoryUSBPDPowerAdapter deviceClass](UARPSupportedAccessoryUSBPDPowerAdapter, "deviceClass") locationType:+[UARPSupportedAccessoryUSBPD locationType] supportsAccMode7:[(UARPSupportedAccessory *)v2 supportsAccMode7]];
    hwID = v2->hwID;
    v2->hwID = v4;

    [(UARPSupportedAccessory *)v2 setHardwareID:v2->hwID];
  }
  return v2;
}

+ (id)appleModelNumber
{
  return @"A3328";
}

+ (unsigned)productID
{
  return 28703;
}

- (void).cxx_destruct
{
}

@end