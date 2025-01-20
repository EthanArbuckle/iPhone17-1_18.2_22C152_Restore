@interface UARPSupportedAccessoryA2571
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2571)init;
@end

@implementation UARPSupportedAccessoryA2571

- (UARPSupportedAccessoryA2571)init
{
  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA2571;
  v2 = [(UARPSupportedAccessoryUSBPDPowerAdapter *)&v7 init];
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2571 appleModelNumber];
    [(UARPSupportedAccessory *)v2 setAppleModelNumber:v3];

    [(UARPSupportedAccessory *)v2 setModelName:@"Power Adapter"];
    v4 = [[UARPAccessoryHardwareUSBPD alloc] initWithVendorID:+[UARPSupportedAccessoryUSBPD vendorID](UARPSupportedAccessoryUSBPD, "vendorID") productID:+[UARPSupportedAccessoryA2571 productID](UARPSupportedAccessoryA2571, "productID") usbpdClass:+[UARPSupportedAccessoryUSBPDPowerAdapter deviceClass](UARPSupportedAccessoryUSBPDPowerAdapter, "deviceClass") locationType:+[UARPSupportedAccessoryUSBPD locationType] supportsAccMode7:[(UARPSupportedAccessory *)v2 supportsAccMode7]];
    hwID = v2->hwID;
    v2->hwID = v4;

    [(UARPSupportedAccessory *)v2 setHardwareID:v2->hwID];
  }
  return v2;
}

+ (id)appleModelNumber
{
  return @"A2571";
}

+ (unsigned)productID
{
  return 28698;
}

- (void).cxx_destruct
{
}

@end