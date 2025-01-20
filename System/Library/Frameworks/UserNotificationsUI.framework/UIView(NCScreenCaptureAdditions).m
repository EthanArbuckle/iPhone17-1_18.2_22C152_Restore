@interface UIView(NCScreenCaptureAdditions)
- (void)nc_setScreenCaptureProhibited:()NCScreenCaptureAdditions;
@end

@implementation UIView(NCScreenCaptureAdditions)

- (void)nc_setScreenCaptureProhibited:()NCScreenCaptureAdditions
{
  id v6 = [a1 layer];
  uint64_t v4 = [v6 disableUpdateMask] & 0xFFFFFFEDLL;
  if (a3) {
    int v5 = 18;
  }
  else {
    int v5 = 0;
  }
  [v6 setDisableUpdateMask:v4 | v5];
}

@end