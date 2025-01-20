@interface RegistrationViewModel
- (void)closeRegUI;
- (void)closeRegUIImmediate;
- (void)notifyRegUIResultWithResult:(id)a3;
@end

@implementation RegistrationViewModel

- (void)notifyRegUIResultWithResult:(id)a3
{
  uint64_t v3 = sub_23EF05418();
  unint64_t v5 = v4;
  swift_retain();
  sub_23EEBC4D0(v3, v5);
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