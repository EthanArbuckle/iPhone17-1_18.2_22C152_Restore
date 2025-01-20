@interface UARPSupportedAccessoryHID
+ (id)appleModelNumber;
+ (unsigned)productID;
+ (unsigned)vendorID;
- (UARPSupportedAccessoryHID)init;
@end

@implementation UARPSupportedAccessoryHID

- (UARPSupportedAccessoryHID)init
{
  v5.receiver = self;
  v5.super_class = (Class)UARPSupportedAccessoryHID;
  v2 = [(UARPSupportedAccessory *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(UARPSupportedAccessory *)v2 setVendorName:@"Apple Inc."];
    [(UARPSupportedAccessory *)v3 setUpdaterName:@"com.apple.UARPUpdaterServiceHID"];
    [(UARPSupportedAccessory *)v3 setSupportsInternalSettings:1];
    [(UARPSupportedAccessory *)v3 setUploaderResponseTimeout:10000];
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

@end