@interface QLPHSwipeDownTracker
- (BOOL)shouldFinishDismissal;
- (CGAffineTransform)trackedTransform;
- (CGPoint)trackedCenter;
- (CGRect)trackedBounds;
- (QLPHDisplayVelocity)trackedVelocity;
- (QLPHSwipeDownTracker)init;
- (QLPXSwipeDownTracker)impl;
- (double)dismissalProgress;
- (double)finalAnimationDuration;
- (double)finalAnimationSpringDamping;
- (void)startTrackingCenter:(CGPoint)a3 bounds:(CGRect)a4 transform:(CGAffineTransform *)a5 withInitialGestureLocation:(CGPoint)a6;
- (void)trackGestureTranslation:(CGPoint)a3 velocity:(CGPoint)a4;
@end

@implementation QLPHSwipeDownTracker

- (QLPHSwipeDownTracker)init
{
  v6.receiver = self;
  v6.super_class = (Class)QLPHSwipeDownTracker;
  v2 = [(QLPHSwipeDownTracker *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(QLPXSwipeDownTracker);
    impl = v2->_impl;
    v2->_impl = v3;
  }
  return v2;
}

- (void)startTrackingCenter:(CGPoint)a3 bounds:(CGRect)a4 transform:(CGAffineTransform *)a5 withInitialGestureLocation:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  double height = a4.size.height;
  double width = a4.size.width;
  double v11 = a4.origin.y;
  double v12 = a4.origin.x;
  double v13 = a3.y;
  double v14 = a3.x;
  v15 = [(QLPHSwipeDownTracker *)self impl];
  long long v16 = *(_OWORD *)&a5->c;
  v17[0] = *(_OWORD *)&a5->a;
  v17[1] = v16;
  v17[2] = *(_OWORD *)&a5->tx;
  objc_msgSend(v15, "startTrackingCenter:bounds:transform:withInitialGestureLocation:", v17, v14, v13, v12, v11, width, height, x, y);
}

- (void)trackGestureTranslation:(CGPoint)a3 velocity:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  id v8 = [(QLPHSwipeDownTracker *)self impl];
  objc_msgSend(v8, "trackGestureTranslation:velocity:", v7, v6, x, y);
}

- (double)dismissalProgress
{
  v2 = [(QLPHSwipeDownTracker *)self impl];
  [v2 dismissalProgress];
  double v4 = v3;

  return v4;
}

- (BOOL)shouldFinishDismissal
{
  v2 = [(QLPHSwipeDownTracker *)self impl];
  char v3 = [v2 shouldFinishDismissal];

  return v3;
}

- (CGPoint)trackedCenter
{
  v2 = [(QLPHSwipeDownTracker *)self impl];
  [v2 trackedCenter];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (CGRect)trackedBounds
{
  v2 = [(QLPHSwipeDownTracker *)self impl];
  [v2 trackedBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (CGAffineTransform)trackedTransform
{
  double v4 = [(QLPHSwipeDownTracker *)self impl];
  if (v4)
  {
    double v6 = v4;
    [v4 trackedTransform];
    double v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tdouble x = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (QLPHDisplayVelocity)trackedVelocity
{
  v2 = [(QLPHSwipeDownTracker *)self impl];
  double v3 = QLPHDisplayVelocityFromQLPXDisplayVelocity([v2 trackedVelocity]);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.var3 = v13;
  result.var2 = v12;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (double)finalAnimationDuration
{
  v2 = [(QLPHSwipeDownTracker *)self impl];
  [v2 finalAnimationDuration];
  double v4 = v3;

  return v4;
}

- (double)finalAnimationSpringDamping
{
  v2 = [(QLPHSwipeDownTracker *)self impl];
  [v2 finalAnimationSpringDamping];
  double v4 = v3;

  return v4;
}

- (QLPXSwipeDownTracker)impl
{
  return self->_impl;
}

- (void).cxx_destruct
{
}

@end