@interface UARPSupportedAccessoryA2388
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2388)init;
@end

@implementation UARPSupportedAccessoryA2388

- (UARPSupportedAccessoryA2388)init
{
  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA2388;
  v2 = [(UARPSupportedAccessoryUSBPDPowerAdapterLegacy *)&v7 init];
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2388 appleModelNumber];
    [(UARPSupportedAccessory *)v2 setAppleModelNumber:v3];

    [(UARPSupportedAccessory *)v2 setModelName:@"Power Adapter (Legacy)"];
    v4 = [[UARPAccessoryHardwareUSBPD alloc] initWithVendorID:+[UARPSupportedAccessoryUSBPD vendorID](UARPSupportedAccessoryUSBPD, "vendorID") productID:+[UARPSupportedAccessoryA2388 productID](UARPSupportedAccessoryA2388, "productID") usbpdClass:+[UARPSupportedAccessoryUSBPDPowerAdapter deviceClass](UARPSupportedAccessoryUSBPDPowerAdapterLegacy, "deviceClass") locationType:+[UARPSupportedAccessoryUSBPD locationType] supportsAccMode7:[(UARPSupportedAccessory *)v2 supportsAccMode7]];
    hwID = v2->hwID;
    v2->hwID = v4;

    [(UARPSupportedAccessory *)v2 setHardwareID:v2->hwID];
  }
  return v2;
}

+ (id)appleModelNumber
{
  return @"A2388";
}

+ (unsigned)productID
{
  return 28696;
}

- (void).cxx_destruct
{
}

@end