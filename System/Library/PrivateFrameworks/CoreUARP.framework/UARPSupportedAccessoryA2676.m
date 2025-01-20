@interface UARPSupportedAccessoryA2676
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2676)init;
@end

@implementation UARPSupportedAccessoryA2676

- (UARPSupportedAccessoryA2676)init
{
  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA2676;
  v2 = [(UARPSupportedAccessoryUSBPDPowerAdapter *)&v7 init];
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2676 appleModelNumber];
    [(UARPSupportedAccessory *)v2 setAppleModelNumber:v3];

    [(UARPSupportedAccessory *)v2 setModelName:@"Power Adapter"];
    v4 = [[UARPAccessoryHardwareUSBPD alloc] initWithVendorID:+[UARPSupportedAccessoryUSBPD vendorID](UARPSupportedAccessoryUSBPD, "vendorID") productID:+[UARPSupportedAccessoryA2676 productID](UARPSupportedAccessoryA2676, "productID") usbpdClass:+[UARPSupportedAccessoryUSBPDPowerAdapter deviceClass](UARPSupportedAccessoryUSBPDPowerAdapter, "deviceClass") locationType:+[UARPSupportedAccessoryUSBPD locationType] supportsAccMode7:[(UARPSupportedAccessory *)v2 supportsAccMode7]];
    hwID = v2->hwID;
    v2->hwID = v4;

    [(UARPSupportedAccessory *)v2 setHardwareID:v2->hwID];
  }
  return v2;
}

+ (id)appleModelNumber
{
  return @"A2676";
}

+ (unsigned)productID
{
  return 28699;
}

- (void).cxx_destruct
{
}

@end