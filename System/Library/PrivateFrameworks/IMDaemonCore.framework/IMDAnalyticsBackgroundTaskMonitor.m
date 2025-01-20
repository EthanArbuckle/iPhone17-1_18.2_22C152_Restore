@interface IMDAnalyticsBackgroundTaskMonitor
+ (id)sharedInstance;
- (IMDAnalyticsBackgroundTaskMonitor)init;
@end

@implementation IMDAnalyticsBackgroundTaskMonitor

+ (id)sharedInstance
{
  if (qword_1EBE2B538 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EBE2B528;

  return v2;
}

- (IMDAnalyticsBackgroundTaskMonitor)init
{
  return (IMDAnalyticsBackgroundTaskMonitor *)sub_1D98A7CC8();
}

@end