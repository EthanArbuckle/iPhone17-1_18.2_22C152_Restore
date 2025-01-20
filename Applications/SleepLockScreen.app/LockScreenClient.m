@interface LockScreenClient
- (void)setLockScreenState:(int64_t)a3 userInfo:(id)a4;
@end

@implementation LockScreenClient

- (void)setLockScreenState:(int64_t)a3 userInfo:(id)a4
{
  if (a4) {
    uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v5 = 0;
  }
  swift_retain();
  sub_10000D1CC(a3, v5);
  swift_release();

  swift_bridgeObjectRelease();
}

@end