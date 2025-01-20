@interface BCDeviceState
- (BOOL)isLocked;
@end

@implementation BCDeviceState

- (BOOL)isLocked
{
  int v2 = sub_100008030();
  if (v2 != 1) {
    LOBYTE(v2) = sub_100008030() == 2;
  }
  return v2;
}

@end