@interface MSNanoRegistry
+ (NSString)pairedDeviceRegistryDeviceDidPairDarwinNotification;
@end

@implementation MSNanoRegistry

+ (NSString)pairedDeviceRegistryDeviceDidPairDarwinNotification
{
  return (NSString *)NRPairedDeviceRegistryDeviceDidPairDarwinNotification;
}

@end