@interface UARPSupportedAccessoryBeatsBluetooth
+ (id)appleModelNumber;
+ (unsigned)productID;
+ (unsigned)vendorID;
- (UARPSupportedAccessoryBeatsBluetooth)init;
@end

@implementation UARPSupportedAccessoryBeatsBluetooth

- (UARPSupportedAccessoryBeatsBluetooth)init
{
  v5.receiver = self;
  v5.super_class = (Class)UARPSupportedAccessoryBeatsBluetooth;
  v2 = [(UARPSupportedAccessory *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(UARPSupportedAccessory *)v2 setVendorName:@"Beats by Dre"];
    [(UARPSupportedAccessory *)v3 setSupportsHeySiriCompact:1];
    [(UARPSupportedAccessory *)v3 setReofferFirmwareOnSync:1];
    [(UARPSupportedAccessory *)v3 setSupportsFriendlyName:1];
    [(UARPSupportedAccessory *)v3 setSupportsInternalSettings:1];
    [(UARPSupportedAccessory *)v3 setSupportsDeveloperSettings:1];
    [(UARPSupportedAccessory *)v3 setAllowDownloadOnCellular:1];
    [(UARPSupportedAccessory *)v3 setUpdaterName:@"BTLEServer"];
    [(UARPSupportedAccessory *)v3 addBSDNotificationName:@"com.apple.corespeech.voicetriggerassetchange"];
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