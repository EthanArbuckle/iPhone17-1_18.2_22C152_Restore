@interface UARPSupportedAccessoryAirPodsCaseUSB
+ (id)appleModelNumber;
+ (unsigned)productID;
+ (unsigned)vendorID;
- (UARPSupportedAccessoryAirPodsCaseUSB)init;
@end

@implementation UARPSupportedAccessoryAirPodsCaseUSB

- (UARPSupportedAccessoryAirPodsCaseUSB)init
{
  v5.receiver = self;
  v5.super_class = (Class)UARPSupportedAccessoryAirPodsCaseUSB;
  v2 = [(UARPSupportedAccessory *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(UARPSupportedAccessory *)v2 setVendorName:@"Apple Inc."];
    [(UARPSupportedAccessory *)v3 setSupportsLogs:1];
    [(UARPSupportedAccessory *)v3 setSupportsAnalytics:1];
    [(UARPSupportedAccessory *)v3 setSupportsInternalSettings:1];
    [(UARPSupportedAccessory *)v3 setSupportsDeveloperSettings:1];
    [(UARPSupportedAccessory *)v3 setAllowDownloadOnCellular:1];
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
  return 1452;
}

+ (unsigned)productID
{
  return 0;
}

@end