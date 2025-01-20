@interface UARPSupportedAccessoryUSBPD
+ (id)appleModelNumber;
+ (int64_t)deviceClass;
+ (int64_t)locationType;
+ (unsigned)productID;
+ (unsigned)vendorID;
- (UARPSupportedAccessoryUSBPD)init;
@end

@implementation UARPSupportedAccessoryUSBPD

- (UARPSupportedAccessoryUSBPD)init
{
  v5.receiver = self;
  v5.super_class = (Class)UARPSupportedAccessoryUSBPD;
  v2 = [(UARPSupportedAccessory *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(UARPSupportedAccessory *)v2 setVendorName:@"Apple Inc."];
    [(UARPSupportedAccessory *)v3 setUpdaterName:@"com.apple.UARPUpdaterServiceUSBPD"];
    [(UARPSupportedAccessory *)v3 setSupportsInternalSettings:1];
    [(UARPSupportedAccessory *)v3 setSupportsAccMode7:1];
  }
  return v3;
}

+ (id)appleModelNumber
{
  return @"Unknown";
}

+ (unsigned)vendorID
{
  return 1452;
}

+ (unsigned)productID
{
  return 0;
}

+ (int64_t)deviceClass
{
  return 3;
}

+ (int64_t)locationType
{
  return 0;
}

@end