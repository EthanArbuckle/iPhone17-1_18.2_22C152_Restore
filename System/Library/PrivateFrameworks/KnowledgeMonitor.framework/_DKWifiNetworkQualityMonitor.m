@interface _DKWifiNetworkQualityMonitor
+ (id)eventStream;
- (_DKWifiNetworkQualityMonitor)init;
@end

@implementation _DKWifiNetworkQualityMonitor

- (_DKWifiNetworkQualityMonitor)init
{
  v3 = [MEMORY[0x263F35220] keyPathForWiFiConnectionStatus];
  v4 = [MEMORY[0x263F351D0] keyPathForWiFiConnectionQuality];
  v5 = [MEMORY[0x263F351C0] keyPathForWiFiQualityPrediction];
  v6 = [MEMORY[0x263F351F0] keyPathWithKey:@"/system/wifi/active"];
  v9.receiver = self;
  v9.super_class = (Class)_DKWifiNetworkQualityMonitor;
  v7 = [(_DKNetworkQualityMonitor *)&v9 initForInterfaceType:1 connectionStatusKeyPath:v3 qualityKeyPath:v4 predictedQualityKeyPath:v5 discretionaryInvitedPath:v6];

  return v7;
}

+ (id)eventStream
{
  return @"WiFiQuality";
}

@end