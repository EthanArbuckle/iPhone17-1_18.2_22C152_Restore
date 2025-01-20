@interface XPCSubscription
- (void)modelStatesDidUpdate:(id)a3;
@end

@implementation XPCSubscription

- (void)modelStatesDidUpdate:(id)a3
{
  uint64_t v3 = sub_236DB9B30();
  swift_retain();
  sub_236DAB8D0(v3);
  swift_release();
  swift_bridgeObjectRelease();
}

@end