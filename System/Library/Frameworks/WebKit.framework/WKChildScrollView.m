@interface WKChildScrollView
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (WKChildScrollView)initWithFrame:(CGRect)a3;
@end

@implementation WKChildScrollView

- (WKChildScrollView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WKChildScrollView;
  v3 = -[WKBaseScrollView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(WKChildScrollView *)v3 setContentInsetAdjustmentBehavior:2];
  }
  return v4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [a4 shouldDeferGestureRecognizer:a3];
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [a3 shouldDeferGestureRecognizer:a4];
}

@end