@interface UARPSupportedAccessoryA2452
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2452)init;
@end

@implementation UARPSupportedAccessoryA2452

- (UARPSupportedAccessoryA2452)init
{
  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA2452;
  v2 = [(UARPSupportedAccessoryUSBPDPowerAdapterLegacy *)&v7 init];
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2452 appleModelNumber];
    [(UARPSupportedAccessory *)v2 setAppleModelNumber:v3];

    [(UARPSupportedAccessory *)v2 setModelName:@"Power Adapter (Legacy)"];
    v4 = [[UARPAccessoryHardwareUSBPD alloc] initWithVendorID:+[UARPSupportedAccessoryUSBPD vendorID](UARPSupportedAccessoryUSBPD, "vendorID") productID:+[UARPSupportedAccessoryA2452 productID](UARPSupportedAccessoryA2452, "productID") usbpdClass:+[UARPSupportedAccessoryUSBPDPowerAdapter deviceClass](UARPSupportedAccessoryUSBPDPowerAdapterLegacy, "deviceClass") locationType:+[UARPSupportedAccessoryUSBPD locationType] supportsAccMode7:[(UARPSupportedAccessory *)v2 supportsAccMode7]];
    hwID = v2->hwID;
    v2->hwID = v4;

    [(UARPSupportedAccessory *)v2 setHardwareID:v2->hwID];
  }
  return v2;
}

+ (id)appleModelNumber
{
  return @"A2452";
}

+ (unsigned)productID
{
  return 28697;
}

- (void).cxx_destruct
{
}

@end