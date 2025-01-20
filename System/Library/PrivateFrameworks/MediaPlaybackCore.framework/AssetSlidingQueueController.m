@interface AssetSlidingQueueController
- (NSDictionary)stateDictionary;
- (void)resetWithReason:(id)a3;
@end

@implementation AssetSlidingQueueController

- (void)resetWithReason:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_21BC81E30((uint64_t)v3);
  swift_release();
}

- (NSDictionary)stateDictionary
{
  swift_retain();
  sub_21BC8DD60();
  swift_release();
  v2 = (void *)sub_21BEAA088();
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2;
}

@end