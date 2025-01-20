@interface BackgroundTaskController
- (NSDictionary)stateDictionary;
- (void)resetWithReason:(id)a3;
@end

@implementation BackgroundTaskController

- (void)resetWithReason:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_21BC62120();
  swift_release();
}

- (NSDictionary)stateDictionary
{
  swift_retain();
  sub_21BC6274C();
  swift_release();
  v2 = (void *)sub_21BEAA088();
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2;
}

@end