@interface UARPSupportedAccessoryAirPodsCase
+ (id)appleModelNumber;
+ (unsigned)productID;
+ (unsigned)vendorID;
- (UARPSupportedAccessoryAirPodsCase)init;
@end

@implementation UARPSupportedAccessoryAirPodsCase

- (UARPSupportedAccessoryAirPodsCase)init
{
  v5.receiver = self;
  v5.super_class = (Class)UARPSupportedAccessoryAirPodsCase;
  v2 = [(UARPSupportedAccessory *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(UARPSupportedAccessory *)v2 setVendorName:@"Apple Inc."];
    [(UARPSupportedAccessory *)v3 setSupportsInternalSettings:1];
    [(UARPSupportedAccessory *)v3 setSupportsDeveloperSettings:1];
    [(UARPSupportedAccessory *)v3 setAllowDownloadOnCellular:1];
    [(UARPSupportedAccessory *)v3 setUpdaterName:@"BTLEServer"];
    [(UARPSupportedAccessory *)v3 setTtrSolicitLogs:1];
  }
  return v3;
}

+ (id)appleModelNumber
{
  return @"Unknown";
}

+ (unsigned)vendorID
{
  return 76;
}

+ (unsigned)productID
{
  return 0;
}

@end