@interface InternalPlayerController
- (NSDictionary)stateDictionary;
- (void)resetWithReason:(id)a3;
@end

@implementation InternalPlayerController

- (NSDictionary)stateDictionary
{
  swift_retain();
  sub_21BC2896C();
  swift_release();
  v2 = (void *)sub_21BEAA088();
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2;
}

- (void)resetWithReason:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_21BC30B28();
  swift_release();
}

@end