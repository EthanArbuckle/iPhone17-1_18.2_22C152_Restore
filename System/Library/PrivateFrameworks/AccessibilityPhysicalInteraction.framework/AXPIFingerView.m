@interface AXPIFingerView
+ (id)layerClass;
- (AXPIFingerAppearanceDelegate)appearanceDelegate;
- (AXPIFingerLayer)cursorLayer;
- (AXPIFingerView)initWithFrame:(CGRect)a3;
- (AXPIFingerView)initWithFrame:(CGRect)a3 appearanceDelegate:(id)a4;
- (BOOL)accessibilityIgnoresInvertColors;
- (BOOL)isPressed;
- (BOOL)isSelected;
- (BOOL)isUserInteractionEnabled;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CAShapeLayer)innerStrokeLayer;
- (CAShapeLayer)outerStrokeLayer;
- (CAShapeLayer)outerStrokeTrackLayer;
- (CAShapeLayer)progressLayer;
- (CGSize)sizeThatFits:(CGSize)a3;
- (double)_iconScaleForForce:(double)a3;
- (double)force;
- (id)_createProgressLayerWithDuration:(double)a3 inRect:(CGRect)a4;
- (id)backdropLayer;
- (id)lastProgressCompletionBlock;
- (unint64_t)shape;
- (void)_setPathForCurrentShape;
- (void)animateCircularProgressWithDuration:(double)a3 completion:(id)a4;
- (void)animateToTapWithDuration:(double)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)cancelExisingCircularProgressAnimation;
- (void)dealloc;
- (void)setAppearanceDelegate:(id)a3;
- (void)setCursorLayer:(id)a3;
- (void)setForce:(double)a3;
- (void)setInnerStrokeLayer:(id)a3;
- (void)setLastProgressCompletionBlock:(id)a3;
- (void)setOuterStrokeLayer:(id)a3;
- (void)setOuterStrokeTrackLayer:(id)a3;
- (void)setPressed:(BOOL)a3;
- (void)setPressed:(BOOL)a3 animated:(BOOL)a4;
- (void)setProgressLayer:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShape:(unint64_t)a3;
@end

@implementation AXPIFingerView

- (id)backdropLayer
{
  if (UIAccessibilityIsInvertColorsEnabled())
  {
    v3 = 0;
  }
  else
  {
    v3 = [(AXPIFingerView *)self layer];
  }
  return v3;
}

+ (id)layerClass
{
  UIAccessibilityIsInvertColorsEnabled();
  v2 = self;
  return v2;
}

- (AXPIFingerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [AXPIFingerView alloc];
  v9 = AXPIDefaultAppearanceForDevice();
  v10 = -[AXPIFingerView initWithFrame:appearanceDelegate:](v8, "initWithFrame:appearanceDelegate:", v9, x, y, width, height);

  return v10;
}

- (AXPIFingerView)initWithFrame:(CGRect)a3 appearanceDelegate:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v55.receiver = self;
  v55.super_class = (Class)AXPIFingerView;
  v10 = -[AXPIFingerView initWithFrame:](&v55, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v11 = [MEMORY[0x263F825C8] clearColor];
    [(AXPIFingerView *)v10 setBackgroundColor:v11];

    [(AXPIFingerView *)v10 setClipsToBounds:0];
    [(AXPIFingerView *)v10 setAppearanceDelegate:v9];
    v12 = [[AXPIFingerLayer alloc] initWithAppearanceDelegate:v9];
    v13 = [(AXPIFingerView *)v10 layer];
    [v13 addSublayer:v12];

    [(AXPIFingerView *)v10 setCursorLayer:v12];
    v14 = [(AXPIFingerView *)v10 appearanceDelegate];
    int v15 = [v14 showFingerOutlines];

    if (v15)
    {
      v16 = [MEMORY[0x263F15880] layer];
      v17 = [(AXPIFingerView *)v10 appearanceDelegate];
      id v18 = [v17 strokeOutlineColor];
      objc_msgSend(v16, "setStrokeColor:", objc_msgSend(v18, "CGColor"));

      id v19 = [MEMORY[0x263F825C8] clearColor];
      objc_msgSend(v16, "setFillColor:", objc_msgSend(v19, "CGColor"));

      v20 = [(AXPIFingerView *)v10 appearanceDelegate];
      [v20 strokeOutlineWidth];
      double v22 = v21;
      v23 = [(AXPIFingerView *)v10 appearanceDelegate];
      [v23 strokeWidth];
      [v16 setLineWidth:v24 + v22 * 2.0];

      v25 = [(AXPIFingerView *)v10 layer];
      [v25 addSublayer:v16];

      [(AXPIFingerView *)v10 setOuterStrokeTrackLayer:v16];
      v26 = [MEMORY[0x263F15880] layer];

      v27 = [(AXPIFingerView *)v10 appearanceDelegate];
      id v28 = [v27 deselectedStrokeColor];
      objc_msgSend(v26, "setStrokeColor:", objc_msgSend(v28, "CGColor"));

      id v29 = [MEMORY[0x263F825C8] clearColor];
      objc_msgSend(v26, "setFillColor:", objc_msgSend(v29, "CGColor"));

      v30 = [(AXPIFingerView *)v10 appearanceDelegate];
      [v30 strokeWidth];
      objc_msgSend(v26, "setLineWidth:");

      v31 = [(AXPIFingerView *)v10 layer];
      [v31 addSublayer:v26];

      [(AXPIFingerView *)v10 setOuterStrokeLayer:v26];
    }
    v32 = [(AXPIFingerView *)v10 appearanceDelegate];
    int v33 = [v32 showInnerCircle];

    if (v33)
    {
      v34 = [(AXPIFingerView *)v10 appearanceDelegate];
      [v34 fingerInnerCircleInnerRadius];
      double v36 = v35;
      v37 = [(AXPIFingerView *)v10 appearanceDelegate];
      [v37 innerCircleStrokeWidth];
      double v39 = v38 + v36 * 2.0;

      v40 = [(AXPIFingerView *)v10 appearanceDelegate];
      [v40 fingerInnerCircleInnerRadius];
      double v42 = v41;
      v43 = [(AXPIFingerView *)v10 appearanceDelegate];
      [v43 innerCircleStrokeWidth];
      double v45 = v44 + v42 * 2.0;

      v46 = [MEMORY[0x263F15880] layer];
      objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithOvalInRect:", x + (width - v39) * 0.5, y + (height - v45) * 0.5, v39, v45);
      id v47 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setPath:", objc_msgSend(v47, "CGPath"));

      v48 = [(AXPIFingerView *)v10 appearanceDelegate];
      id v49 = [v48 strokeOutlineColor];
      objc_msgSend(v46, "setStrokeColor:", objc_msgSend(v49, "CGColor"));

      v50 = [(AXPIFingerView *)v10 appearanceDelegate];
      id v51 = [v50 deselectedStrokeColor];
      objc_msgSend(v46, "setFillColor:", objc_msgSend(v51, "CGColor"));

      v52 = [(AXPIFingerView *)v10 appearanceDelegate];
      [v52 innerCircleStrokeWidth];
      objc_msgSend(v46, "setLineWidth:");

      [v46 setLineJoin:*MEMORY[0x263F15E98]];
      v53 = [(AXPIFingerView *)v10 layer];
      [v53 addSublayer:v46];

      [(AXPIFingerView *)v10 setInnerStrokeLayer:v46];
    }
    [(AXPIFingerView *)v10 _setPathForCurrentShape];
  }
  return v10;
}

- (void)dealloc
{
  v3 = [(AXPIFingerView *)self outerStrokeTrackLayer];
  [v3 removeAllAnimations];

  v4 = [(AXPIFingerView *)self outerStrokeLayer];
  [v4 removeAllAnimations];

  v5 = [(AXPIFingerView *)self innerStrokeLayer];
  [v5 removeAllAnimations];

  v6 = [(AXPIFingerView *)self outerStrokeTrackLayer];
  [v6 removeFromSuperlayer];

  v7 = [(AXPIFingerView *)self outerStrokeLayer];
  [v7 removeFromSuperlayer];

  v8 = [(AXPIFingerView *)self innerStrokeLayer];
  [v8 removeFromSuperlayer];

  v9.receiver = self;
  v9.super_class = (Class)AXPIFingerView;
  [(AXPIFingerView *)&v9 dealloc];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = [(AXPIFingerView *)self appearanceDelegate];
  [v3 fingerWidth];
  double v5 = v4;

  double v6 = v5;
  double v7 = v5;
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  double v6 = [(AXPIFingerView *)self cursorLayer];
  [v6 outerFrame];
  v9.CGFloat x = x;
  v9.CGFloat y = y;
  BOOL v7 = CGRectContainsPoint(v10, v9);

  return v7;
}

- (void)setSelected:(BOOL)a3
{
  if ([(AXPIFingerView *)self isSelected] != a3)
  {
    double v5 = [(AXPIFingerView *)self appearanceDelegate];
    double v6 = v5;
    if (a3) {
      [v5 selectedStrokeColor];
    }
    else {
    id v7 = [v5 deselectedStrokeColor];
    }
    uint64_t v8 = [v7 CGColor];

    id v9 = [(AXPIFingerView *)self outerStrokeLayer];
    [v9 setStrokeColor:v8];
  }
}

- (BOOL)isSelected
{
  v2 = [(AXPIFingerView *)self cursorLayer];
  char v3 = [v2 isSelected];

  return v3;
}

- (void)setPressed:(BOOL)a3
{
}

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_pressed != a3)
  {
    BOOL v4 = a4;
    self->_pressed = a3;
    [MEMORY[0x263F158F8] begin];
    if (a3)
    {
      double v7 = 0.1;
      if (!v4) {
        double v7 = 0.0;
      }
      [MEMORY[0x263F158F8] setAnimationDuration:v7];
      uint64_t v8 = [(AXPIFingerView *)self cursorLayer];
      [v8 setPressed:1];

      [MEMORY[0x263F158F8] commit];
      id v9 = [(AXPIFingerView *)self appearanceDelegate];
      CGRect v10 = [v9 selectedStrokeColor];
    }
    else
    {
      double v11 = 0.16;
      if (!v4) {
        double v11 = 0.0;
      }
      [MEMORY[0x263F158F8] setAnimationDuration:v11];
      v12 = [(AXPIFingerView *)self cursorLayer];
      [v12 setPressed:0];

      [MEMORY[0x263F158F8] commit];
      id v9 = [(AXPIFingerView *)self appearanceDelegate];
      CGRect v10 = [v9 deselectedStrokeColor];
    }
    id v13 = v10;
    uint64_t v14 = [v13 CGColor];

    int v15 = [(AXPIFingerView *)self outerStrokeLayer];
    [v15 setStrokeColor:v14];

    id v16 = [(AXPIFingerView *)self innerStrokeLayer];
    [v16 setFillColor:v14];
  }
}

- (void)setShape:(unint64_t)a3
{
  if (self->_shape != a3)
  {
    self->_shape = a3;
    [(AXPIFingerView *)self _setPathForCurrentShape];
  }
}

- (void)animateCircularProgressWithDuration:(double)a3 completion:(id)a4
{
  id v6 = a4;
  [(AXPIFingerView *)self cancelExisingCircularProgressAnimation];
  [(AXPIFingerView *)self setLastProgressCompletionBlock:v6];

  double v7 = [(AXPIFingerView *)self cursorLayer];
  [v7 outerFrame];
  -[AXPIFingerView _createProgressLayerWithDuration:inRect:](self, "_createProgressLayerWithDuration:inRect:", a3, v8, v9, v10, v11);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  v12 = [(AXPIFingerView *)self layer];
  [v12 addSublayer:v13];

  [(AXPIFingerView *)self setProgressLayer:v13];
}

- (void)cancelExisingCircularProgressAnimation
{
  char v3 = [(AXPIFingerView *)self progressLayer];
  [v3 removeFromSuperlayer];

  [(AXPIFingerView *)self setProgressLayer:0];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(AXPIFingerView *)self lastProgressCompletionBlock];

  if (v6)
  {
    double v7 = [(AXPIFingerView *)self lastProgressCompletionBlock];
    v7[2](v7, v4);

    [(AXPIFingerView *)self setLastProgressCompletionBlock:0];
  }
}

- (void)_setPathForCurrentShape
{
  char v3 = [(AXPIFingerView *)self cursorLayer];
  [v3 outerFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double y = v7;
  double width = v9;
  double height = v11;
  double x = v5;
  if (!self->_shape)
  {
    id v16 = [(AXPIFingerView *)self appearanceDelegate];
    char v17 = [v16 showFingerOutlines];

    double y = v7;
    double width = v9;
    double height = v11;
    double x = v5;
    if ((v17 & 1) == 0)
    {
      id v18 = [(AXPIFingerView *)self appearanceDelegate];
      [v18 strokeWidth];
      double v20 = v19;

      v44.origin.double x = v5;
      v44.origin.double y = v7;
      v44.size.double width = v9;
      v44.size.double height = v11;
      CGRect v45 = CGRectInset(v44, v20 * 0.5, v20 * 0.5);
      double x = v45.origin.x;
      double y = v45.origin.y;
      double width = v45.size.width;
      double height = v45.size.height;
    }
  }
  double v21 = [(AXPIFingerView *)self cursorLayer];
  objc_msgSend(MEMORY[0x263F824C0], "bezierPathForFingerShape:inRect:curveOnly:", self->_shape, 0, x, y, width, height);
  id v22 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPath:", objc_msgSend(v22, "CGPath"));

  v23 = [(AXPIFingerView *)self outerStrokeTrackLayer];
  objc_msgSend(MEMORY[0x263F824C0], "bezierPathForFingerShape:inRect:curveOnly:", self->_shape, 1, v5, v7, v9, v11);
  id v24 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setPath:", objc_msgSend(v24, "CGPath"));

  v25 = [(AXPIFingerView *)self outerStrokeLayer];
  objc_msgSend(MEMORY[0x263F824C0], "bezierPathForFingerShape:inRect:curveOnly:", self->_shape, 1, v5, v7, v9, v11);
  id v26 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setPath:", objc_msgSend(v26, "CGPath"));

  if (self->_shape)
  {
    double v28 = *MEMORY[0x263F001A8];
    double v27 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v29 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v30 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  else
  {
    v31 = [(AXPIFingerView *)self appearanceDelegate];
    [v31 fingerInnerCircleInnerRadius];
    double v33 = v32;
    v34 = [(AXPIFingerView *)self appearanceDelegate];
    [v34 innerCircleStrokeWidth];
    double v29 = v35 + v33 * 2.0;

    double v36 = [(AXPIFingerView *)self appearanceDelegate];
    [v36 fingerInnerCircleInnerRadius];
    double v38 = v37;
    double v39 = [(AXPIFingerView *)self appearanceDelegate];
    [v39 innerCircleStrokeWidth];
    double v30 = v40 + v38 * 2.0;

    double v28 = v5 + (v9 - v29) * 0.5;
    double v27 = v7 + (v11 - v30) * 0.5;
  }
  id v42 = [(AXPIFingerView *)self innerStrokeLayer];
  objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithOvalInRect:", v28, v27, v29, v30);
  id v41 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setPath:", objc_msgSend(v41, "CGPath"));
}

- (id)_createProgressLayerWithDuration:(double)a3 inRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v10 = objc_alloc_init(MEMORY[0x263F15880]);
  double v11 = *MEMORY[0x263F00148];
  double v12 = *(double *)(MEMORY[0x263F00148] + 8);
  objc_msgSend(v10, "setPosition:", *MEMORY[0x263F00148], v12);
  uint64_t v13 = *MEMORY[0x263F15E70];
  [v10 setLineCap:*MEMORY[0x263F15E70]];
  objc_msgSend(MEMORY[0x263F824C0], "bezierPathForFingerShape:inRect:curveOnly:", self->_shape, 1, x, y, width, height);
  id v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPath:", objc_msgSend(v14, "CGPath"));
  [MEMORY[0x263F158F8] begin];
  int v15 = [MEMORY[0x263F15760] animationWithKeyPath:@"strokeEnd"];
  [v15 setDuration:a3 + -0.100000001];
  id v16 = [NSNumber numberWithInt:0];
  [v15 setFromValue:v16];

  char v17 = [NSNumber numberWithInt:1];
  [v15 setToValue:v17];

  [v15 setDelegate:self];
  [v10 addAnimation:v15 forKey:@"drawCircleAnimation"];
  [MEMORY[0x263F158F8] commit];
  BOOL v18 = [(AXPIFingerView *)self isPressed];
  double v19 = [(AXPIFingerView *)self appearanceDelegate];
  double v20 = v19;
  if (v18) {
    [v19 pressedCircularProgressFillColor];
  }
  else {
  id v21 = [v19 circularProgressFillColor];
  }
  objc_msgSend(v10, "setStrokeColor:", objc_msgSend(v21, "CGColor"));

  id v22 = [MEMORY[0x263F825C8] clearColor];
  objc_msgSend(v10, "setFillColor:", objc_msgSend(v22, "CGColor"));

  v23 = [(AXPIFingerView *)self appearanceDelegate];
  [v23 strokeWidth];
  objc_msgSend(v10, "setLineWidth:");

  [v10 setName:@"holdDurationProgressTrack"];
  id v24 = [(AXPIFingerView *)self window];
  uint64_t v25 = [v24 screen];
  [(id)v25 scale];
  objc_msgSend(v10, "setContentsScale:");

  id v26 = [(AXPIFingerView *)self appearanceDelegate];
  LOBYTE(v25) = [v26 showFingerOutlines];

  if (v25)
  {
    id v27 = v10;
  }
  else
  {
    id v27 = objc_alloc_init(MEMORY[0x263F15880]);
    objc_msgSend(v27, "setPosition:", v11, v12);
    [v27 setLineCap:v13];
    objc_msgSend(v27, "setPath:", objc_msgSend(v14, "CGPath"));
    id v28 = [MEMORY[0x263F825C8] clearColor];
    objc_msgSend(v27, "setFillColor:", objc_msgSend(v28, "CGColor"));

    double v29 = [(AXPIFingerView *)self appearanceDelegate];
    [v29 strokeWidth];
    [v27 setLineWidth:v30 + 4.0];

    [v27 setName:@"holdDurationBaseProgressTrack"];
    v31 = [(AXPIFingerView *)self window];
    double v32 = [v31 screen];
    [v32 scale];
    objc_msgSend(v27, "setContentsScale:");

    [v27 addAnimation:v15 forKey:@"drawCircleAnimation"];
    double v33 = [(AXPIFingerView *)self appearanceDelegate];
    id v34 = [v33 pressedCircularProgressFillColor];
    uint64_t v35 = [v34 CGColor];

    if ([(AXPIFingerView *)self isPressed])
    {
      [v27 setStrokeColor:v35];
    }
    else
    {
      id v36 = [MEMORY[0x263F825C8] blackColor];
      objc_msgSend(v27, "setStrokeColor:", objc_msgSend(v36, "CGColor"));
    }
    [v27 addSublayer:v10];
  }

  return v27;
}

- (void)animateToTapWithDuration:(double)a3
{
  id v8 = [MEMORY[0x263F15760] animationWithKeyPath:@"strokeColor"];
  double v5 = [(AXPIFingerView *)self appearanceDelegate];
  id v6 = [v5 selectedStrokeColor];
  objc_msgSend(v8, "setToValue:", objc_msgSend(v6, "CGColor"));

  [v8 setDuration:a3];
  [v8 setRemovedOnCompletion:1];
  double v7 = [(AXPIFingerView *)self outerStrokeLayer];
  [v7 addAnimation:v8 forKey:@"AXPIFingerView-SetSelected"];
}

- (double)_iconScaleForForce:(double)a3
{
  double v3 = a3 * 0.001 + 1.0;
  if (v3 > 1.5) {
    double v3 = 1.5;
  }
  if (a3 <= 100.0) {
    return 1.0;
  }
  else {
    return v3;
  }
}

- (void)setForce:(double)a3
{
  if (self->_force != a3)
  {
    self->_force = a3;
    long long v4 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v7.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v7.c = v4;
    *(_OWORD *)&v7.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    -[AXPIFingerView _iconScaleForForce:](self, "_iconScaleForForce:");
    if (v5 > 1.0) {
      CGAffineTransformMakeScale(&v7, v5, v5);
    }
    CGAffineTransform v6 = v7;
    [(AXPIFingerView *)self setTransform:&v6];
  }
}

- (BOOL)isUserInteractionEnabled
{
  return 0;
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (BOOL)isPressed
{
  return self->_pressed;
}

- (double)force
{
  return self->_force;
}

- (unint64_t)shape
{
  return self->_shape;
}

- (AXPIFingerLayer)cursorLayer
{
  return self->_cursorLayer;
}

- (void)setCursorLayer:(id)a3
{
}

- (CAShapeLayer)outerStrokeTrackLayer
{
  return self->_outerStrokeTrackLayer;
}

- (void)setOuterStrokeTrackLayer:(id)a3
{
}

- (CAShapeLayer)outerStrokeLayer
{
  return self->_outerStrokeLayer;
}

- (void)setOuterStrokeLayer:(id)a3
{
}

- (CAShapeLayer)innerStrokeLayer
{
  return self->_innerStrokeLayer;
}

- (void)setInnerStrokeLayer:(id)a3
{
}

- (AXPIFingerAppearanceDelegate)appearanceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
  return (AXPIFingerAppearanceDelegate *)WeakRetained;
}

- (void)setAppearanceDelegate:(id)a3
{
}

- (CAShapeLayer)progressLayer
{
  return self->_progressLayer;
}

- (void)setProgressLayer:(id)a3
{
}

- (id)lastProgressCompletionBlock
{
  return self->_lastProgressCompletionBlock;
}

- (void)setLastProgressCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lastProgressCompletionBlock, 0);
  objc_storeStrong((id *)&self->_progressLayer, 0);
  objc_destroyWeak((id *)&self->_appearanceDelegate);
  objc_storeStrong((id *)&self->_innerStrokeLayer, 0);
  objc_storeStrong((id *)&self->_outerStrokeLayer, 0);
  objc_storeStrong((id *)&self->_outerStrokeTrackLayer, 0);
  objc_storeStrong((id *)&self->_cursorLayer, 0);
}

@end