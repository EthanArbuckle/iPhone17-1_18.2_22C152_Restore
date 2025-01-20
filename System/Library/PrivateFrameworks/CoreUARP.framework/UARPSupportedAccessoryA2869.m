@interface UARPSupportedAccessoryA2869
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2869)init;
@end

@implementation UARPSupportedAccessoryA2869

- (UARPSupportedAccessoryA2869)init
{
  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA2869;
  v2 = [(UARPSupportedAccessoryUSBPDDongle *)&v7 init];
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2869 appleModelNumber];
    [(UARPSupportedAccessory *)v2 setAppleModelNumber:v3];

    [(UARPSupportedAccessory *)v2 setModelName:@"Lightning to USB-C Adapter"];
    [(UARPSupportedAccessory *)v2 setUpdateRequiresPowerAssertion:1];
    v4 = [[UARPAccessoryHardwareUSBPD alloc] initWithVendorID:+[UARPSupportedAccessoryUSBPD vendorID](UARPSupportedAccessoryUSBPD, "vendorID") productID:+[UARPSupportedAccessoryA2869 productID](UARPSupportedAccessoryA2869, "productID") usbpdClass:+[UARPSupportedAccessoryUSBPDDongle deviceClass](UARPSupportedAccessoryUSBPDDongle, "deviceClass") locationType:+[UARPSupportedAccessoryUSBPD locationType] supportsAccMode7:[(UARPSupportedAccessory *)v2 supportsAccMode7]];
    hwID = v2->hwID;
    v2->hwID = v4;

    [(UARPSupportedAccessory *)v2 setHardwareID:v2->hwID];
  }
  return v2;
}

+ (id)appleModelNumber
{
  return @"A2869";
}

+ (unsigned)productID
{
  return 5905;
}

- (void).cxx_destruct
{
}

@end