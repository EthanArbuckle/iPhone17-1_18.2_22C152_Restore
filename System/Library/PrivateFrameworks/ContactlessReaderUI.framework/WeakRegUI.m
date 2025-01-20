@interface WeakRegUI
- (void)closeRegUI;
- (void)closeRegUIImmediate;
- (void)notifyRegUIResultWithResult:(id)a3;
@end

@implementation WeakRegUI

- (void)notifyRegUIResultWithResult:(id)a3
{
  uint64_t v3 = sub_23EF05418();
  swift_retain();
  sub_23EE788E4(v3);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)closeRegUI
{
}

- (void)closeRegUIImmediate
{
}

@end