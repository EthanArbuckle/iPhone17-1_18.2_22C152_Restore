@interface RCView
- (BOOL)_isSplitViewControllerTransitioningBetweenStates;
- (BOOL)isCreatingSnapshot;
- (CALayer)waveformLayer;
- (RCView)init;
- (RCWaveformRenderer)renderer;
- (id)_createSpringAnimationWithKeyPath:(id)a3 basedOnPropertiesFromSpringAnimation:(id)a4;
- (id)snapshot;
- (void)_setNeedsVisibleTimeRangeRenderingFromFrameChange;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setRenderer:(id)a3;
@end

@implementation RCView

- (RCView)init
{
  v6.receiver = self;
  v6.super_class = (Class)RCView;
  v2 = [(RCView *)&v6 init];
  if (v2)
  {
    v3 = +[RCNoAnimateLayerHelper sharedNoAnimationHelper];
    v4 = [(RCView *)v2 layer];
    [v4 setDelegate:v3];
  }
  return v2;
}

- (void)_setNeedsVisibleTimeRangeRenderingFromFrameChange
{
  id v2 = [(RCView *)self renderer];
  [v2 setCalcBlockShouldRefreshAllSlices:1];
  [v2 _setNeedsVisibleTimeRangeRenderingFromFrameChange];
}

- (id)snapshot
{
  self->_isCreatingSnapshot = 1;
  [(RCView *)self _setNeedsVisibleTimeRangeRenderingFromFrameChange];
  [(RCView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  v7 = +[UIScreen mainScreen];
  [v7 scale];
  CGFloat v9 = v8;
  v13.width = v4;
  v13.height = v6;
  UIGraphicsBeginImageContextWithOptions(v13, 0, v9);

  [(RCView *)self bounds];
  -[RCView drawViewHierarchyInRect:afterScreenUpdates:](self, "drawViewHierarchyInRect:afterScreenUpdates:", 1);
  v10 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  self->_isCreatingSnapshot = 0;

  return v10;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(RCView *)self frame];
  v14.origin.double x = x;
  v14.origin.double y = y;
  v14.size.double width = width;
  v14.size.double height = height;
  if (!CGRectEqualToRect(v13, v14))
  {
    v12.receiver = self;
    v12.super_class = (Class)RCView;
    -[RCView setFrame:](&v12, "setFrame:", x, y, width, height);
    if (!self->_waveformLayer)
    {
      double v8 = +[CALayer layer];
      waveformLayer = self->_waveformLayer;
      self->_waveformLayer = v8;

      [(CALayer *)self->_waveformLayer setOpaque:1];
      [(CALayer *)self->_waveformLayer setAllowsGroupOpacity:0];
      v10 = +[RCNoAnimateLayerHelper sharedNoAnimationHelper];
      [(CALayer *)self->_waveformLayer setDelegate:v10];

      v11 = [(RCView *)self layer];
      [v11 addSublayer:self->_waveformLayer];
    }
    [(RCView *)self bounds];
    -[CALayer setFrame:](self->_waveformLayer, "setFrame:");
    [(RCView *)self _setNeedsVisibleTimeRangeRenderingFromFrameChange];
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(RCView *)self bounds];
  if (v9 != *(uint64_t *)&width || v8 != *(uint64_t *)&height)
  {
    v11 = [(RCView *)self renderer];
    unsigned int v12 = [v11 isOverview];

    if (v12)
    {
      [(CALayer *)self->_waveformLayer bounds];
      double v14 = fmax(v13, 0.01);
      memset(&v28, 0, sizeof(v28));
      CATransform3DMakeScale(&v28, width / v14, 1.0, 1.0);
      v15 = [(RCView *)self superview];
      v16 = [v15 layer];
      v17 = [v16 animationForKey:@"bounds.origin"];

      if ([v17 isMemberOfClass:objc_opt_class()]) {
        id v18 = v17;
      }
      else {
        id v18 = 0;
      }
      unsigned int v19 = [(RCView *)self _isSplitViewControllerTransitioningBetweenStates];
      if (v18) {
        unsigned int v20 = v19;
      }
      else {
        unsigned int v20 = 0;
      }
      if (v20 == 1)
      {
        +[CATransaction begin];
        v21 = [(RCView *)self _createSpringAnimationWithKeyPath:@"position" basedOnPropertiesFromSpringAnimation:v18];
        -[CALayer setFrame:](self->_waveformLayer, "setFrame:", x, y, width, height);
        [(CALayer *)self->_waveformLayer addAnimation:v21 forKey:@"position"];
        v22 = [(RCView *)self _createSpringAnimationWithKeyPath:@"bounds" basedOnPropertiesFromSpringAnimation:v18];
        -[CALayer setBounds:](self->_waveformLayer, "setBounds:", 0.0, 0.0, v14, height);
        [(CALayer *)self->_waveformLayer addAnimation:v22 forKey:@"bounds"];
        v23 = [(RCView *)self _createSpringAnimationWithKeyPath:@"transform" basedOnPropertiesFromSpringAnimation:v18];
        CATransform3D v27 = v28;
        [(CALayer *)self->_waveformLayer setTransform:&v27];
        [(CALayer *)self->_waveformLayer addAnimation:v23 forKey:@"transform"];
        +[CATransaction commit];

        goto LABEL_16;
      }
      -[CALayer setFrame:](self->_waveformLayer, "setFrame:", x, y, width, height);
      -[CALayer setBounds:](self->_waveformLayer, "setBounds:", 0.0, 0.0, v14, height);
      CATransform3D v26 = v28;
      [(CALayer *)self->_waveformLayer setTransform:&v26];
    }
    v24 = [(RCView *)self renderer];
    [v24 setWaitForFinalCalc:1];

    [(RCView *)self _setNeedsVisibleTimeRangeRenderingFromFrameChange];
  }
LABEL_16:
  v25.receiver = self;
  v25.super_class = (Class)RCView;
  -[RCView setBounds:](&v25, "setBounds:", x, y, width, height);
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RCView;
  [(RCView *)&v15 layoutSublayersOfLayer:v4];
  double v5 = [(RCView *)self layer];
  unsigned int v6 = [v4 isEqual:v5];

  if (v6)
  {
    v7 = [(RCView *)self layer];
    uint64_t v8 = [v7 animationForKey:@"bounds.origin"];

    if ([v8 isMemberOfClass:objc_opt_class()]) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    unsigned int v10 = [(RCView *)self _isSplitViewControllerTransitioningBetweenStates];
    if (v9) {
      unsigned int v11 = v10;
    }
    else {
      unsigned int v11 = 0;
    }
    if (v11 != 1) {
      goto LABEL_13;
    }
    unsigned int v12 = [(RCView *)self renderer];
    if (([v12 isOverview] & 1) == 0)
    {
      double v13 = [(CALayer *)self->_waveformLayer animationKeys];
      id v14 = [v13 count];

      if (v14)
      {
LABEL_13:

        goto LABEL_14;
      }
      +[CATransaction begin];
      unsigned int v12 = [(RCView *)self _createSpringAnimationWithKeyPath:@"bounds" basedOnPropertiesFromSpringAnimation:v9];
      [(CALayer *)self->_waveformLayer addAnimation:v12 forKey:@"bounds"];
      +[CATransaction commit];
    }

    goto LABEL_13;
  }
LABEL_14:
}

- (BOOL)_isSplitViewControllerTransitioningBetweenStates
{
  return 1;
}

- (id)_createSpringAnimationWithKeyPath:(id)a3 basedOnPropertiesFromSpringAnimation:(id)a4
{
  id v5 = a4;
  unsigned int v6 = +[CASpringAnimation animationWithKeyPath:a3];
  [v5 duration];
  objc_msgSend(v6, "setDuration:");
  v7 = [v5 timingFunction];
  [v6 setTimingFunction:v7];

  [v5 damping];
  objc_msgSend(v6, "setDamping:");
  [v5 stiffness];
  objc_msgSend(v6, "setStiffness:");
  [v5 mass];
  objc_msgSend(v6, "setMass:");

  return v6;
}

- (BOOL)isCreatingSnapshot
{
  return self->_isCreatingSnapshot;
}

- (CALayer)waveformLayer
{
  return self->_waveformLayer;
}

- (RCWaveformRenderer)renderer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_renderer);

  return (RCWaveformRenderer *)WeakRetained;
}

- (void)setRenderer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_renderer);

  objc_storeStrong((id *)&self->_waveformLayer, 0);
}

@end