@interface QLPinchRotationTracker
- (BOOL)shouldFinishDismissal;
- (CGAffineTransform)trackedTransform;
- (CGPoint)anchorPoint;
- (CGPoint)trackedCenter;
- (CGRect)trackedBounds;
- (QLPinchRotationTracker)init;
- (_QLDismissGestureTrackingVelocity)trackedVelocity;
- (double)dismissalProgress;
- (double)finalAnimationDuration;
- (double)finalAnimationSpringDamping;
- (double)minimumZoomForDismissal;
- (double)targetZoom;
- (void)setMinimumZoomForDismissal:(double)a3;
- (void)setTargetZoom:(double)a3;
- (void)startTrackingCenter:(CGPoint)a3 bounds:(CGRect)a4 transform:(CGAffineTransform *)a5 withInitialGestureLocation:(CGPoint)a6;
- (void)trackGestureLocation:(CGPoint)a3;
- (void)trackRotation:(double)a3;
- (void)trackScale:(double)a3;
- (void)update;
@end

@implementation QLPinchRotationTracker

- (QLPinchRotationTracker)init
{
  v3.receiver = self;
  v3.super_class = (Class)QLPinchRotationTracker;
  result = [(QLPinchRotationTracker *)&v3 init];
  if (result)
  {
    result->_targetZoom = 0.35;
    result->_minimumZoomForDismissal = 0.95;
  }
  return result;
}

- (void)startTrackingCenter:(CGPoint)a3 bounds:(CGRect)a4 transform:(CGAffineTransform *)a5 withInitialGestureLocation:(CGPoint)a6
{
  double x = a6.x;
  self->_initialBounds = a4;
  self->_initialTrackingCenter = a3;
  self->_trackedCenter = a3;
  long long v8 = *(_OWORD *)&a5->a;
  long long v9 = *(_OWORD *)&a5->c;
  *(_OWORD *)&self->_trackedTransform.tdouble x = *(_OWORD *)&a5->tx;
  *(_OWORD *)&self->_trackedTransform.c = v9;
  *(_OWORD *)&self->_trackedTransform.a = v8;
  self->_initialGestureLocation = a6;
  self->_previousScale = 1.0;
  self->_trackedScale = 1.0;
  *(CGFloat *)&long long v8 = a4.origin.x;
  *(CGFloat *)&long long v9 = a4.origin.y;
  CGFloat width = a4.size.width;
  CGFloat height = a4.size.height;
  CGFloat v12 = CGRectGetWidth(*(CGRect *)&v8);
  double y = self->_initialGestureLocation.y;
  CGFloat v14 = x / v12;
  CGFloat v15 = CGRectGetHeight(self->_initialBounds);
  self->_anchorPoint.double x = v14;
  self->_anchorPoint.double y = y / v15;
  double v16 = self->_initialGestureLocation.x;
  CGFloat v17 = v16 - CGRectGetWidth(self->_initialBounds) * 0.5;
  double v18 = self->_initialGestureLocation.y;
  CGFloat v19 = CGRectGetHeight(self->_initialBounds);
  self->_anchorLocationOffset.double x = v17;
  self->_anchorLocationOffset.double y = v18 - v19 * 0.5;
}

- (void)trackGestureLocation:(CGPoint)a3
{
  self->_location = a3;
  CGFloat y = a3.y;
  self->_trackedCenter = (CGPoint)vaddq_f64(vsubq_f64((float64x2_t)a3, (float64x2_t)self->_initialGestureLocation), (float64x2_t)self->_initialTrackingCenter);
  [(QLPinchRotationTracker *)self update];
}

- (void)trackScale:(double)a3
{
  self->_previousScale = self->_trackedScale;
  self->_trackedScale = a3;
  [(QLPinchRotationTracker *)self update];
}

- (void)trackRotation:(double)a3
{
  self->_rotation = a3;
  [(QLPinchRotationTracker *)self update];
}

- (_QLDismissGestureTrackingVelocity)trackedVelocity
{
  double trackedScale = self->_trackedScale;
  double rotation = self->_rotation;
  double v4 = 0.0;
  double v5 = 0.0;
  result.var3 = rotation;
  result.var2 = trackedScale;
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (CGRect)trackedBounds
{
  double x = self->_initialBounds.origin.x;
  double y = self->_initialBounds.origin.y;
  double width = self->_initialBounds.size.width;
  double height = self->_initialBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)finalAnimationDuration
{
  return 0.4;
}

- (double)finalAnimationSpringDamping
{
  return 1.0;
}

- (void)update
{
  double trackedScale = self->_trackedScale;
  self->_shouldFinishDismissal = trackedScale < self->_minimumZoomForDismissal;
  uint64_t v4 = MEMORY[0x263F000D0];
  long long v5 = *MEMORY[0x263F000D0];
  long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&self->_trackedTransform.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&self->_trackedTransform.c = v6;
  long long v7 = *(_OWORD *)(v4 + 32);
  *(_OWORD *)&self->_trackedTransform.tdouble x = v7;
  *(_OWORD *)&v13.a = v5;
  *(_OWORD *)&v13.c = v6;
  *(_OWORD *)&v13.tdouble x = v7;
  CGAffineTransformScale(&v14, &v13, trackedScale, trackedScale);
  long long v8 = *(_OWORD *)&v14.c;
  *(_OWORD *)&self->_trackedTransform.a = *(_OWORD *)&v14.a;
  *(_OWORD *)&self->_trackedTransform.c = v8;
  *(_OWORD *)&self->_trackedTransform.tdouble x = *(_OWORD *)&v14.tx;
  double rotation = self->_rotation;
  long long v10 = *(_OWORD *)&self->_trackedTransform.c;
  *(_OWORD *)&v13.a = *(_OWORD *)&self->_trackedTransform.a;
  *(_OWORD *)&v13.c = v10;
  *(_OWORD *)&v13.tdouble x = *(_OWORD *)&self->_trackedTransform.tx;
  CGAffineTransformRotate(&v14, &v13, rotation);
  long long v11 = *(_OWORD *)&v14.c;
  *(_OWORD *)&self->_trackedTransform.a = *(_OWORD *)&v14.a;
  *(_OWORD *)&self->_trackedTransform.c = v11;
  *(_OWORD *)&self->_trackedTransform.tdouble x = *(_OWORD *)&v14.tx;
  self->_trackedCenter = (CGPoint)vaddq_f64(vaddq_f64(vsubq_f64((float64x2_t)self->_location, (float64x2_t)self->_initialGestureLocation), (float64x2_t)self->_initialTrackingCenter), (float64x2_t)self->_anchorLocationOffset);
  double v12 = 1.0;
  if ((1.0 - trackedScale) / (1.0 - self->_targetZoom) <= 1.0) {
    double v12 = (1.0 - trackedScale) / (1.0 - self->_targetZoom);
  }
  self->_dismissalProgress = fmax(v12, 0.0);
}

- (CGPoint)anchorPoint
{
  double x = self->_anchorPoint.x;
  double y = self->_anchorPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)trackedCenter
{
  double x = self->_trackedCenter.x;
  double y = self->_trackedCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGAffineTransform)trackedTransform
{
  long long v3 = *(_OWORD *)&self[3].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[3].d;
  return self;
}

- (double)dismissalProgress
{
  return self->_dismissalProgress;
}

- (BOOL)shouldFinishDismissal
{
  return self->_shouldFinishDismissal;
}

- (double)targetZoom
{
  return self->_targetZoom;
}

- (void)setTargetZoom:(double)a3
{
  self->_targetZoom = a3;
}

- (double)minimumZoomForDismissal
{
  return self->_minimumZoomForDismissal;
}

- (void)setMinimumZoomForDismissal:(double)a3
{
  self->_minimumZoomForDismissal = a3;
}

@end