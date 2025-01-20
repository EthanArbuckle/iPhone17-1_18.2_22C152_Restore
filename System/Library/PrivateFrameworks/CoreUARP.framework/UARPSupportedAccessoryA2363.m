@interface UARPSupportedAccessoryA2363
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2363)init;
@end

@implementation UARPSupportedAccessoryA2363

- (UARPSupportedAccessoryA2363)init
{
  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA2363;
  v2 = [(UARPSupportedAccessoryUSBPDMagSafe *)&v7 init];
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2363 appleModelNumber];
    [(UARPSupportedAccessory *)v2 setAppleModelNumber:v3];

    [(UARPSupportedAccessory *)v2 setModelName:@"MagSafe Charge Cable"];
    [(UARPSupportedAccessory *)v2 setSupportsLogs:1];
    [(UARPSupportedAccessory *)v2 setSupportsAnalytics:1];
    v4 = [[UARPAccessoryHardwareUSBPD alloc] initWithVendorID:+[UARPSupportedAccessoryUSBPD vendorID](UARPSupportedAccessoryUSBPD, "vendorID") productID:+[UARPSupportedAccessoryA2363 productID](UARPSupportedAccessoryA2363, "productID") usbpdClass:+[UARPSupportedAccessoryUSBPDMagSafe deviceClass](UARPSupportedAccessoryUSBPDMagSafe, "deviceClass") locationType:+[UARPSupportedAccessoryUSBPDMagSafe locationType] supportsAccMode7:[(UARPSupportedAccessory *)v2 supportsAccMode7]];
    hwID = v2->hwID;
    v2->hwID = v4;

    [(UARPSupportedAccessory *)v2 setHardwareID:v2->hwID];
  }
  return v2;
}

+ (id)appleModelNumber
{
  return @"A2363";
}

+ (unsigned)productID
{
  return 30720;
}

- (void).cxx_destruct
{
}

@end