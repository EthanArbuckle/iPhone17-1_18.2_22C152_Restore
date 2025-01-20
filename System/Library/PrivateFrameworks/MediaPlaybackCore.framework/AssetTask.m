@interface AssetTask
- (BOOL)isCancelled;
@end

@implementation AssetTask

- (BOOL)isCancelled
{
  swift_retain();
  sub_21BD42660();
  char v3 = v2;
  swift_release();
  return v3 & 1;
}

@end