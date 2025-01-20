@interface MTBridgeSettingsControllerFactory
+ (BOOL)_supportsPodcastsPinningSettingsV2;
+ (id)allocWithZone:(_NSZone *)a3;
@end

@implementation MTBridgeSettingsControllerFactory

+ (id)allocWithZone:(_NSZone *)a3
{
  [a1 _supportsPodcastsPinningSettingsV2];
  v4 = objc_opt_class();

  return [v4 allocWithZone:a3];
}

+ (BOOL)_supportsPodcastsPinningSettingsV2
{
  v2 = +[NRPairedDeviceRegistry sharedInstance];
  v3 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  v4 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:v3];
  v5 = [v4 firstObject];
  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"D718E4BE-8067-432E-AF41-7342473499D5"];
  unsigned __int8 v7 = [v5 supportsCapability:v6];

  return v7;
}

@end