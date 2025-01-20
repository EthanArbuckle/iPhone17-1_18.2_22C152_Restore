@interface _DKCellNetworkingQualityMonitor
+ (id)eventStream;
- (_DKCellNetworkingQualityMonitor)init;
@end

@implementation _DKCellNetworkingQualityMonitor

- (_DKCellNetworkingQualityMonitor)init
{
  v3 = [MEMORY[0x263F35220] keyPathForCellConnectionStatus];
  v4 = [MEMORY[0x263F351D0] keyPathForCellConnectionQuality];
  v5 = [MEMORY[0x263F351C0] keyPathForCellQualityPrediction];
  v6 = [MEMORY[0x263F351F0] keyPathWithKey:@"/system/cell/active"];
  v9.receiver = self;
  v9.super_class = (Class)_DKCellNetworkingQualityMonitor;
  v7 = [(_DKNetworkQualityMonitor *)&v9 initForInterfaceType:2 connectionStatusKeyPath:v3 qualityKeyPath:v4 predictedQualityKeyPath:v5 discretionaryInvitedPath:v6];

  return v7;
}

+ (id)eventStream
{
  return @"CellQuality";
}

@end