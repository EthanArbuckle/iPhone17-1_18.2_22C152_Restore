@interface IMDMessageFromStorageMonitor
+ (IMDMessageFromStorageMonitor)sharedStorageMonitor;
- (IMDMessageFromStorageMonitor)init;
- (void)incomingMessageProcessedWithElapsedTime:(double)a3;
- (void)showTapToRadarOnSlowDelivery;
@end

@implementation IMDMessageFromStorageMonitor

+ (IMDMessageFromStorageMonitor)sharedStorageMonitor
{
  if (qword_1EA8C8050 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EA8C9DA8;

  return (IMDMessageFromStorageMonitor *)v2;
}

- (IMDMessageFromStorageMonitor)init
{
  return (IMDMessageFromStorageMonitor *)sub_1D98D40B0();
}

- (void)incomingMessageProcessedWithElapsedTime:(double)a3
{
  v4 = self;
  sub_1D98D41F8(a3);
}

- (void)showTapToRadarOnSlowDelivery
{
  v2 = self;
  sub_1D98D4628();
}

@end