@interface BKUIRotationArrowAnimationLayer
+ (id)animatorByEmbedding:(id)a3 color:(id)a4 radiusForOrientation:(id)a5;
+ (id)animatorWith:(CGRect)a3 color:(id)a4 radiusForOrientation:(id)a5;
- (BKUIRotationArrowAnimationLayer)initWith:(CGRect)a3 radiusForOrientation:(id)a4 arrowAngle:(double)a5 arrowLength:(double)a6 color:(id)a7;
- (CALayer)arrowContainer;
- (CAShapeLayer)arrowLayerLeft;
- (CAShapeLayer)arrowLayerRight;
- (CAShapeLayer)circleLayer;
- (CAShapeLayer)rotationLayer;
- (CGPoint)hostCenter;
- (CGSize)containerSize;
- (UIColor)color;
- (double)arrowAngle;
- (double)arrowlength;
- (double)radius;
- (id)_extendedInit:(CGPoint)a3;
- (id)getOrientation;
- (int64_t)orientation;
- (void)_animateArrowClockwise:(double)a3 duration:(double)a4 animationDelay:(double)a5;
- (void)_animateArrowCounterClockwise:(double)a3 duration:(double)a4 animationDelay:(double)a5;
- (void)_animateArrowPaths:(double)a3 delay:(double)a4 duration:(double)a5;
- (void)_animateArrowUpsideDown:(double)a3 duration:(double)a4 animationDelay:(double)a5;
- (void)_landscapeAnimationImpl:(double)a3 duration:(double)a4 animationDelay:(double)a5;
- (void)_layoutArrowContainer:(int64_t)a3;
- (void)_layoutArrowSubLayers;
- (void)_resetHideCircleLayerStrokeTo:(double)a3;
- (void)_rotateRotationLayerBy:(double)a3 startTime:(double)a4 fromDegree:(unint64_t)a5 toDegree:(unint64_t)a6;
- (void)_updateCircleLayerLayout:(int64_t)a3;
- (void)_zeroOutArrowStroke;
- (void)animateDirectionPath:(double)a3 orientation:(int64_t)a4 duration:(double)a5 animationDelay:(double)a6;
- (void)enableDebug:(BOOL)a3;
- (void)layoutSublayers;
- (void)resetLayout;
- (void)setArrowAngle:(double)a3;
- (void)setArrowContainer:(id)a3;
- (void)setArrowLayerLeft:(id)a3;
- (void)setArrowLayerRight:(id)a3;
- (void)setArrowlength:(double)a3;
- (void)setCircleLayer:(id)a3;
- (void)setColor:(id)a3;
- (void)setContainerSize:(CGSize)a3;
- (void)setGetOrientation:(id)a3;
- (void)setHostCenter:(CGPoint)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setRadius:(double)a3;
- (void)setRotationLayer:(id)a3;
- (void)stopAnimationRemoveStroke;
@end

@implementation BKUIRotationArrowAnimationLayer

+ (id)animatorWith:(CGRect)a3 color:(id)a4 radiusForOrientation:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a5;
  id v11 = a4;
  v12 = -[BKUIRotationArrowAnimationLayer initWith:radiusForOrientation:arrowAngle:arrowLength:color:]([BKUIRotationArrowAnimationLayer alloc], "initWith:radiusForOrientation:arrowAngle:arrowLength:color:", v10, v11, x, y, width, height, 0.0, 0.0);

  return v12;
}

+ (id)animatorByEmbedding:(id)a3 color:(id)a4 radiusForOrientation:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [BKUIRotationArrowAnimationLayer alloc];
  [v9 bounds];
  id v11 = -[BKUIRotationArrowAnimationLayer initWith:radiusForOrientation:arrowAngle:arrowLength:color:](v10, "initWith:radiusForOrientation:arrowAngle:arrowLength:color:", v7, v8);

  v12 = [v9 layer];
  [v12 addSublayer:v11];

  [v9 center];
  id v13 = -[BKUIRotationArrowAnimationLayer _extendedInit:](v11, "_extendedInit:");
  [v9 center];
  -[BKUIRotationArrowAnimationLayer setPosition:](v11, "setPosition:");
  [v9 center];
  double v15 = v14;
  double v17 = v16;

  -[BKUIRotationArrowAnimationLayer setHostCenter:](v11, "setHostCenter:", v15, v17);

  return v11;
}

- (BKUIRotationArrowAnimationLayer)initWith:(CGRect)a3 radiusForOrientation:(id)a4 arrowAngle:(double)a5 arrowLength:(double)a6 color:(id)a7
{
  id v11 = a4;
  id v12 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BKUIRotationArrowAnimationLayer;
  id v13 = [(BKUIRotationArrowAnimationLayer *)&v20 init];
  if (v13)
  {
    uint64_t v14 = [v11 copy];
    id getOrientation = v13->_getOrientation;
    v13->_id getOrientation = (id)v14;

    v13->_arrowAngle = a5;
    v13->_arrowlength = a6;
    objc_storeStrong((id *)&v13->_color, a7);
    double v16 = (*((double (**)(id, void))v11 + 2))(v11, 0);
    double v17 = v16 + v16;
    double v18 = (*((double (**)(id, void))v11 + 2))(v11, 0);
    -[BKUIRotationArrowAnimationLayer setBounds:](v13, "setBounds:", 0.0, 0.0, v17, v18 + v18);
  }

  return v13;
}

- (id)_extendedInit:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[BKUIRotationArrowAnimationLayer setContainerSize:](self, "setContainerSize:", 28.0, 28.0);
  -[BKUIRotationArrowAnimationLayer setHostCenter:](self, "setHostCenter:", x, y);
  v6 = [(BKUIRotationArrowAnimationLayer *)self circleLayer];
  [(BKUIRotationArrowAnimationLayer *)self addSublayer:v6];

  [(BKUIRotationArrowAnimationLayer *)self hostCenter];
  -[BKUIRotationArrowAnimationLayer setPosition:](self, "setPosition:");
  id v7 = [(BKUIRotationArrowAnimationLayer *)self circleLayer];
  id v8 = [(BKUIRotationArrowAnimationLayer *)self rotationLayer];
  [v7 addSublayer:v8];

  [(BKUIRotationArrowAnimationLayer *)self bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v17 = [(BKUIRotationArrowAnimationLayer *)self circleLayer];
  objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

  double v18 = [MEMORY[0x1E4F39BE8] layer];
  [(BKUIRotationArrowAnimationLayer *)self setArrowContainer:v18];

  v19 = [MEMORY[0x1E4F39C88] layer];
  [(BKUIRotationArrowAnimationLayer *)self setArrowLayerLeft:v19];

  objc_super v20 = [MEMORY[0x1E4F39C88] layer];
  [(BKUIRotationArrowAnimationLayer *)self setArrowLayerRight:v20];

  v21 = [(BKUIRotationArrowAnimationLayer *)self arrowContainer];
  objc_msgSend(v21, "setFrame:", 0.0, 100.0, 28.0, 28.0);

  v22 = [(BKUIRotationArrowAnimationLayer *)self rotationLayer];
  [v22 position];
  double v24 = v23;
  double v26 = v25;
  v27 = [(BKUIRotationArrowAnimationLayer *)self arrowContainer];
  objc_msgSend(v27, "setPosition:", v24, v26);

  v28 = [(BKUIRotationArrowAnimationLayer *)self rotationLayer];
  v29 = [(BKUIRotationArrowAnimationLayer *)self arrowContainer];
  [v28 addSublayer:v29];

  [(BKUIRotationArrowAnimationLayer *)self _resetHideCircleLayerStrokeTo:0.5];
  [(BKUIRotationArrowAnimationLayer *)self _layoutArrowSubLayers];
  [(BKUIRotationArrowAnimationLayer *)self enableDebug:0];
  return self;
}

- (CAShapeLayer)circleLayer
{
  if (!self->_circleLayer)
  {
    v3 = [MEMORY[0x1E4F39C88] layer];
    circleLayer = self->_circleLayer;
    self->_circleLayer = v3;
  }
  [(BKUIRotationArrowAnimationLayer *)self _updateCircleLayerLayout:[(BKUIRotationArrowAnimationLayer *)self orientation]];
  v5 = self->_circleLayer;

  return v5;
}

- (CAShapeLayer)rotationLayer
{
  rotationLayer = self->_rotationLayer;
  if (!rotationLayer)
  {
    v4 = [MEMORY[0x1E4F39C88] layer];
    v5 = self->_rotationLayer;
    self->_rotationLayer = v4;

    rotationLayer = self->_rotationLayer;
  }

  return rotationLayer;
}

- (void)_layoutArrowContainer:(int64_t)a3
{
  [(BKUIRotationArrowAnimationLayer *)self setOrientation:a3];
  v4 = [(BKUIRotationArrowAnimationLayer *)self circleLayer];
  [v4 bounds];
  double MidX = CGRectGetMidX(v28);
  v6 = [(BKUIRotationArrowAnimationLayer *)self circleLayer];
  [v6 bounds];
  double MidY = CGRectGetMidY(v29);
  id v8 = [(BKUIRotationArrowAnimationLayer *)self arrowContainer];
  objc_msgSend(v8, "setPosition:", MidX, MidY);

  uint64_t v9 = MGGetProductType();
  if (v9 > 2619317133)
  {
    if (v9 == 2619317134) {
      goto LABEL_7;
    }
    uint64_t v10 = 3241053352;
  }
  else
  {
    if (v9 == 555503454) {
      goto LABEL_7;
    }
    uint64_t v10 = 2487868872;
  }
  if (v9 != v10)
  {
    if ([(BKUIRotationArrowAnimationLayer *)self orientation] == 1
      || ![(BKUIRotationArrowAnimationLayer *)self orientation])
    {
      return;
    }
    int64_t v21 = [(BKUIRotationArrowAnimationLayer *)self orientation];
    double v12 = [(BKUIRotationArrowAnimationLayer *)self arrowContainer];
    [v12 frame];
    double v14 = v22;
    if (v21 == 2) {
      goto LABEL_10;
    }
LABEL_14:
    double v23 = [(BKUIRotationArrowAnimationLayer *)self circleLayer];
    [v23 bounds];
    double v14 = v14 + v24 * -0.5;

    double v15 = [(BKUIRotationArrowAnimationLayer *)self arrowContainer];
    [v15 frame];
    double v20 = v25;
    goto LABEL_15;
  }
LABEL_7:
  if ([(BKUIRotationArrowAnimationLayer *)self orientation] == 4
    || ![(BKUIRotationArrowAnimationLayer *)self orientation])
  {
    return;
  }
  int64_t v11 = [(BKUIRotationArrowAnimationLayer *)self orientation];
  double v12 = [(BKUIRotationArrowAnimationLayer *)self arrowContainer];
  [v12 frame];
  double v14 = v13;
  if (v11 != 3) {
    goto LABEL_14;
  }
LABEL_10:

  double v15 = [(BKUIRotationArrowAnimationLayer *)self arrowContainer];
  [v15 frame];
  double v17 = v16;
  double v18 = [(BKUIRotationArrowAnimationLayer *)self circleLayer];
  [v18 bounds];
  double v20 = v17 + v19 * 0.5;

LABEL_15:
  id v26 = [(BKUIRotationArrowAnimationLayer *)self arrowContainer];
  objc_msgSend(v26, "setFrame:", v14, v20, 28.0, 28.0);
}

- (void)animateDirectionPath:(double)a3 orientation:(int64_t)a4 duration:(double)a5 animationDelay:(double)a6
{
  int64_t v11 = [(BKUIRotationArrowAnimationLayer *)self rotationLayer];
  [v11 setHidden:0];

  [(BKUIRotationArrowAnimationLayer *)self _layoutArrowContainer:a4];
  [(BKUIRotationArrowAnimationLayer *)self _layoutArrowSubLayers];
  [(BKUIRotationArrowAnimationLayer *)self setOrientation:a4];
  uint64_t v12 = MGGetProductType();
  if (v12 > 2619317133)
  {
    if (v12 == 2619317134) {
      goto LABEL_7;
    }
    uint64_t v13 = 3241053352;
  }
  else
  {
    if (v12 == 555503454) {
      goto LABEL_7;
    }
    uint64_t v13 = 2487868872;
  }
  if (v12 == v13)
  {
LABEL_7:
    int64_t v14 = [(BKUIRotationArrowAnimationLayer *)self orientation];
    if (v14 != 3)
    {
      if (v14 != 2)
      {
        if (v14 != 1) {
          return;
        }
        goto LABEL_20;
      }
LABEL_14:
      [(BKUIRotationArrowAnimationLayer *)self _animateArrowClockwise:a3 duration:a5 animationDelay:a6];
      return;
    }
    goto LABEL_17;
  }
  int64_t v15 = [(BKUIRotationArrowAnimationLayer *)self orientation];
  if (v15 != 2)
  {
    if (v15 == 3)
    {
LABEL_20:
      [(BKUIRotationArrowAnimationLayer *)self _animateArrowCounterClockwise:a3 duration:a5 animationDelay:a6];
      return;
    }
    if (v15 != 4) {
      return;
    }
    goto LABEL_14;
  }
LABEL_17:

  [(BKUIRotationArrowAnimationLayer *)self _animateArrowUpsideDown:a3 duration:a5 animationDelay:a6];
}

- (void)stopAnimationRemoveStroke
{
  v3 = [(BKUIRotationArrowAnimationLayer *)self arrowLayerRight];
  [v3 removeAllAnimations];

  v4 = [(BKUIRotationArrowAnimationLayer *)self arrowLayerLeft];
  [v4 removeAllAnimations];

  [(BKUIRotationArrowAnimationLayer *)self _zeroOutArrowStroke];
  v5 = [(BKUIRotationArrowAnimationLayer *)self circleLayer];
  [v5 removeAllAnimations];

  id v6 = [(BKUIRotationArrowAnimationLayer *)self rotationLayer];
  [v6 removeAllAnimations];
}

- (void)_layoutArrowSubLayers
{
  v3 = [(BKUIRotationArrowAnimationLayer *)self arrowContainer];
  v4 = [v3 superlayer];

  if (!v4)
  {
    v5 = [(BKUIRotationArrowAnimationLayer *)self rotationLayer];
    id v6 = [(BKUIRotationArrowAnimationLayer *)self arrowContainer];
    [v5 addSublayer:v6];
  }
  uint64_t v7 = 2;
  uint64_t v8 = MGGetProductType();
  if (v8 > 2619317133)
  {
    if (v8 != 3241053352)
    {
      uint64_t v9 = 2619317134;
LABEL_8:
      if (v8 != v9) {
        goto LABEL_10;
      }
    }
  }
  else if (v8 != 555503454)
  {
    uint64_t v9 = 2487868872;
    goto LABEL_8;
  }
  uint64_t v7 = 3;
LABEL_10:
  int64_t v10 = [(BKUIRotationArrowAnimationLayer *)self orientation];
  if (v10 == v7) {
    double v11 = 28.0;
  }
  else {
    double v11 = 0.0;
  }
  if (v10 == v7) {
    double v12 = 0.0;
  }
  else {
    double v12 = 28.0;
  }
  uint64_t v13 = [MEMORY[0x1E4F427D0] bezierPath];
  objc_msgSend(v13, "moveToPoint:", 14.0, 14.0);
  objc_msgSend(v13, "addLineToPoint:", v11, v12);
  id v14 = [(BKUIRotationArrowAnimationLayer *)self color];
  uint64_t v15 = [v14 CGColor];
  double v16 = [(BKUIRotationArrowAnimationLayer *)self arrowLayerLeft];
  [v16 setStrokeColor:v15];

  double v17 = [(BKUIRotationArrowAnimationLayer *)self arrowLayerLeft];
  [v17 setFillColor:0];

  double v18 = [(BKUIRotationArrowAnimationLayer *)self arrowLayerLeft];
  [v18 setLineWidth:6.0];

  uint64_t v19 = *MEMORY[0x1E4F3A458];
  double v20 = [(BKUIRotationArrowAnimationLayer *)self arrowLayerLeft];
  [v20 setLineCap:v19];

  id v42 = v13;
  uint64_t v21 = [v42 CGPath];
  double v22 = [(BKUIRotationArrowAnimationLayer *)self arrowLayerLeft];
  [v22 setPath:v21];

  double v23 = [(BKUIRotationArrowAnimationLayer *)self arrowContainer];
  double v24 = [(BKUIRotationArrowAnimationLayer *)self arrowLayerLeft];
  [v23 addSublayer:v24];

  double v25 = [MEMORY[0x1E4F427D0] bezierPath];
  objc_msgSend(v25, "moveToPoint:", 14.0, 14.0);
  objc_msgSend(v25, "addLineToPoint:", 28.0, 28.0);
  id v26 = [MEMORY[0x1E4F39C88] layer];
  [(BKUIRotationArrowAnimationLayer *)self setArrowLayerRight:v26];

  id v27 = [(BKUIRotationArrowAnimationLayer *)self color];
  uint64_t v28 = [v27 CGColor];
  CGRect v29 = [(BKUIRotationArrowAnimationLayer *)self arrowLayerRight];
  [v29 setStrokeColor:v28];

  id v30 = [MEMORY[0x1E4F428B8] clearColor];
  uint64_t v31 = [v30 CGColor];
  v32 = [(BKUIRotationArrowAnimationLayer *)self arrowLayerRight];
  [v32 setFillColor:v31];

  v33 = [(BKUIRotationArrowAnimationLayer *)self arrowLayerRight];
  [v33 setLineWidth:6.0];

  uint64_t v34 = *MEMORY[0x1E4F3A478];
  v35 = [(BKUIRotationArrowAnimationLayer *)self arrowLayerRight];
  [v35 setLineJoin:v34];

  v36 = [(BKUIRotationArrowAnimationLayer *)self arrowLayerRight];
  [v36 setLineCap:v19];

  id v37 = v25;
  uint64_t v38 = [v37 CGPath];
  v39 = [(BKUIRotationArrowAnimationLayer *)self arrowLayerRight];
  [v39 setPath:v38];

  v40 = [(BKUIRotationArrowAnimationLayer *)self arrowContainer];
  v41 = [(BKUIRotationArrowAnimationLayer *)self arrowLayerRight];
  [v40 addSublayer:v41];

  [(BKUIRotationArrowAnimationLayer *)self _zeroOutArrowStroke];
}

- (double)radius
{
  v3 = [(BKUIRotationArrowAnimationLayer *)self getOrientation];
  double v4 = v3[2](v3, [(BKUIRotationArrowAnimationLayer *)self orientation]);

  return v4;
}

- (void)_animateArrowPaths:(double)a3 delay:(double)a4 duration:(double)a5
{
  objc_msgSend(MEMORY[0x1E4F39B48], "animationWithKeyPath:", @"strokeEnd", a3, a4);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  double v8 = a5 * 0.5;
  [v15 setDuration:v8];
  [v15 setFromValue:&unk_1F4094750];
  [v15 setToValue:&unk_1F4094760];
  [v15 setAutoreverses:1];
  [v15 setBeginTime:a3];
  uint64_t v9 = *MEMORY[0x1E4F3A490];
  int64_t v10 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v15 setTimingFunction:v10];

  double v11 = [(BKUIRotationArrowAnimationLayer *)self arrowLayerRight];
  [v11 addAnimation:v15 forKey:@"strokeEnd"];

  double v12 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"strokeEnd"];
  [v12 setDuration:v8];
  [v12 setFromValue:&unk_1F4094750];
  [v12 setToValue:&unk_1F4094760];
  [v12 setAutoreverses:1];
  [v12 setBeginTime:a3];
  uint64_t v13 = [MEMORY[0x1E4F39C10] functionWithName:v9];
  [v12 setTimingFunction:v13];

  id v14 = [(BKUIRotationArrowAnimationLayer *)self arrowLayerLeft];
  [v14 addAnimation:v12 forKey:@"strokeEnd"];
}

- (void)_rotateRotationLayerBy:(double)a3 startTime:(double)a4 fromDegree:(unint64_t)a5 toDegree:(unint64_t)a6
{
  id v15 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.rotation.z"];
  [v15 setDuration:a3];
  double v11 = [NSNumber numberWithDouble:(double)a5 * 3.14159265 / 180.0];
  [v15 setFromValue:v11];

  double v12 = [NSNumber numberWithDouble:(double)a6 * 3.14159265 / 180.0];
  [v15 setToValue:v12];

  uint64_t v13 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v15 setTimingFunction:v13];

  [v15 setRemovedOnCompletion:0];
  [v15 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v15 setBeginTime:a4];
  id v14 = [(BKUIRotationArrowAnimationLayer *)self rotationLayer];
  [v14 addAnimation:v15 forKey:@"rotationZ"];
}

- (void)_animateArrowUpsideDown:(double)a3 duration:(double)a4 animationDelay:(double)a5
{
  double v8 = [(BKUIRotationArrowAnimationLayer *)self circleLayer];
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  v24[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  v24[5] = v9;
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  v24[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  v24[7] = v10;
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  v24[0] = *MEMORY[0x1E4F39B10];
  v24[1] = v11;
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  v24[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  v24[3] = v12;
  [v8 setTransform:v24];

  CFTimeInterval v13 = CACurrentMediaTime();
  CFTimeInterval v14 = v13 + a5;
  [(BKUIRotationArrowAnimationLayer *)self _animateArrowPaths:v13 + a5 delay:a5 duration:a4];
  [(BKUIRotationArrowAnimationLayer *)self _resetHideCircleLayerStrokeTo:0.25];
  id v15 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"strokeEnd"];
  [v15 setDuration:a4 + a4 * -0.031];
  [v15 setFromValue:&unk_1F4094770];
  [v15 setToValue:&unk_1F4094780];
  [v15 setBeginTime:v14 + a4 * 0.01419];
  LODWORD(v16) = 1054280253;
  LODWORD(v17) = 1058306785;
  LODWORD(v18) = 1065185444;
  uint64_t v19 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v16 :0.0 :v17 :v18];
  [v15 setTimingFunction:v19];

  [v15 setRemovedOnCompletion:0];
  double v20 = [(BKUIRotationArrowAnimationLayer *)self circleLayer];
  [v20 addAnimation:v15 forKey:@"strokeEnd"];

  uint64_t v21 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"strokeStart"];
  [v21 setDuration:a4 - a4 * 0.35];
  [v21 setFromValue:&unk_1F4094770];
  [v21 setToValue:&unk_1F4094780];
  double v22 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v21 setTimingFunction:v22];

  [v21 setRemovedOnCompletion:0];
  [v21 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v21 setBeginTime:v14 + a4 * 0.35];
  double v23 = [(BKUIRotationArrowAnimationLayer *)self circleLayer];
  [v23 addAnimation:v21 forKey:@"strokeStart"];

  [(BKUIRotationArrowAnimationLayer *)self _rotateRotationLayerBy:0 startTime:180 fromDegree:a4 toDegree:v14];
}

- (void)_animateArrowClockwise:(double)a3 duration:(double)a4 animationDelay:(double)a5
{
  long long v9 = [(BKUIRotationArrowAnimationLayer *)self circleLayer];
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  v14[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  v14[5] = v10;
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  v14[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  v14[7] = v11;
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  v14[0] = *MEMORY[0x1E4F39B10];
  v14[1] = v12;
  long long v13 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  v14[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  v14[3] = v13;
  [v9 setTransform:v14];

  [(BKUIRotationArrowAnimationLayer *)self _landscapeAnimationImpl:a3 duration:a4 animationDelay:a5];
}

- (void)_animateArrowCounterClockwise:(double)a3 duration:(double)a4 animationDelay:(double)a5
{
  CATransform3DMakeRotation(&v11, 3.14159265, 0.0, 1.0, 0.0);
  long long v9 = [(BKUIRotationArrowAnimationLayer *)self circleLayer];
  CATransform3D v10 = v11;
  [v9 setTransform:&v10];

  [(BKUIRotationArrowAnimationLayer *)self _landscapeAnimationImpl:a3 duration:a4 animationDelay:a5];
}

- (void)_landscapeAnimationImpl:(double)a3 duration:(double)a4 animationDelay:(double)a5
{
  CFTimeInterval v8 = CACurrentMediaTime();
  CFTimeInterval v9 = v8 + a5;
  [(BKUIRotationArrowAnimationLayer *)self _animateArrowPaths:v8 + a5 delay:a5 duration:a4];
  [(BKUIRotationArrowAnimationLayer *)self _resetHideCircleLayerStrokeTo:0.5];
  id v16 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"strokeEnd"];
  [v16 setDuration:a4 - a4 * 0.023];
  [v16 setFromValue:&unk_1F4094790];
  [v16 setToValue:&unk_1F4094780];
  [v16 setBeginTime:v9 + a4 * 0.023];
  uint64_t v10 = *MEMORY[0x1E4F3A490];
  CATransform3D v11 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v16 setTimingFunction:v11];

  [v16 setRemovedOnCompletion:0];
  long long v12 = [(BKUIRotationArrowAnimationLayer *)self circleLayer];
  [v12 addAnimation:v16 forKey:@"strokeEnd"];

  long long v13 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"strokeStart"];
  [v13 setDuration:a4 - a4 * 0.35];
  [v13 setFromValue:&unk_1F4094790];
  [v13 setToValue:&unk_1F4094780];
  CFTimeInterval v14 = [MEMORY[0x1E4F39C10] functionWithName:v10];
  [v13 setTimingFunction:v14];

  [v13 setRemovedOnCompletion:0];
  [v13 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v13 setBeginTime:v9 + a4 * 0.35];
  id v15 = [(BKUIRotationArrowAnimationLayer *)self circleLayer];
  [v15 addAnimation:v13 forKey:@"strokeStart"];

  [(BKUIRotationArrowAnimationLayer *)self _rotateRotationLayerBy:0 startTime:90 fromDegree:a4 toDegree:v9 + a4 * 0.01];
}

- (void)_updateCircleLayerLayout:(int64_t)a3
{
  [(BKUIRotationArrowAnimationLayer *)self radius];
  double v5 = v4 + v4;
  [(BKUIRotationArrowAnimationLayer *)self radius];
  double v7 = v6 + v6;
  CFTimeInterval v8 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithOvalInRect:", 0.0, 0.0, v5, v6 + v6);
  -[CAShapeLayer setBounds:](self->_circleLayer, "setBounds:", 0.0, 0.0, v5, v7);
  id v9 = [MEMORY[0x1E4F428B8] colorWithRed:0.0 green:0.490196079 blue:1.0 alpha:1.0];
  -[CAShapeLayer setStrokeColor:](self->_circleLayer, "setStrokeColor:", [v9 CGColor]);

  [(CAShapeLayer *)self->_circleLayer setFillColor:0];
  [(CAShapeLayer *)self->_circleLayer setLineWidth:6.0];
  [(CAShapeLayer *)self->_circleLayer setLineCap:*MEMORY[0x1E4F3A458]];
  -[CAShapeLayer setAnchorPoint:](self->_circleLayer, "setAnchorPoint:", 0.5, 0.5);
  id v19 = v8;
  -[CAShapeLayer setPath:](self->_circleLayer, "setPath:", [v19 CGPath]);
  [(CAShapeLayer *)self->_circleLayer bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v18 = [(BKUIRotationArrowAnimationLayer *)self rotationLayer];
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);
}

- (void)layoutSublayers
{
  v3.receiver = self;
  v3.super_class = (Class)BKUIRotationArrowAnimationLayer;
  [(BKUIRotationArrowAnimationLayer *)&v3 layoutSublayers];
  [(BKUIRotationArrowAnimationLayer *)self _updateCircleLayerLayout:[(BKUIRotationArrowAnimationLayer *)self orientation]];
}

- (void)setHostCenter:(CGPoint)a3
{
  self->_hostCenter = a3;
}

- (void)enableDebug:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F428B8] greenColor];
  uint64_t v6 = [v5 CGColor];
  double v7 = [(BKUIRotationArrowAnimationLayer *)self arrowContainer];
  [v7 setBorderColor:v6];

  double v8 = (double)v3;
  id v9 = [(BKUIRotationArrowAnimationLayer *)self arrowContainer];
  [v9 setBorderWidth:v8];

  id v10 = [MEMORY[0x1E4F428B8] greenColor];
  uint64_t v11 = [v10 CGColor];
  double v12 = [(BKUIRotationArrowAnimationLayer *)self arrowLayerLeft];
  [v12 setBorderColor:v11];

  double v13 = [(BKUIRotationArrowAnimationLayer *)self arrowLayerLeft];
  [v13 setBorderWidth:v8];

  id v14 = [MEMORY[0x1E4F428B8] blueColor];
  uint64_t v15 = [v14 CGColor];
  double v16 = [(BKUIRotationArrowAnimationLayer *)self rotationLayer];
  [v16 setBorderColor:v15];

  double v17 = [(BKUIRotationArrowAnimationLayer *)self rotationLayer];
  [v17 setBorderWidth:v8];

  id v18 = [MEMORY[0x1E4F428B8] redColor];
  -[BKUIRotationArrowAnimationLayer setBorderColor:](self, "setBorderColor:", [v18 CGColor]);

  [(BKUIRotationArrowAnimationLayer *)self setBorderWidth:v8];
}

- (void)_resetHideCircleLayerStrokeTo:(double)a3
{
  id v5 = [(BKUIRotationArrowAnimationLayer *)self circleLayer];
  [v5 setHidden:1];

  uint64_t v6 = [(BKUIRotationArrowAnimationLayer *)self circleLayer];
  [v6 setStrokeEnd:a3];

  double v7 = [(BKUIRotationArrowAnimationLayer *)self circleLayer];
  [v7 setStrokeStart:a3];

  id v8 = [(BKUIRotationArrowAnimationLayer *)self circleLayer];
  [v8 setHidden:0];
}

- (void)_zeroOutArrowStroke
{
  BOOL v3 = [(BKUIRotationArrowAnimationLayer *)self arrowLayerRight];
  [v3 setStrokeStart:0.0];

  double v4 = [(BKUIRotationArrowAnimationLayer *)self arrowLayerRight];
  [v4 setStrokeEnd:0.0];

  id v5 = [(BKUIRotationArrowAnimationLayer *)self arrowLayerLeft];
  [v5 setStrokeStart:0.0];

  id v6 = [(BKUIRotationArrowAnimationLayer *)self arrowLayerLeft];
  [v6 setStrokeEnd:0.0];
}

- (void)resetLayout
{
  BOOL v3 = [(BKUIRotationArrowAnimationLayer *)self circleLayer];
  [v3 setHidden:1];

  double v4 = [(BKUIRotationArrowAnimationLayer *)self rotationLayer];
  [v4 setHidden:1];

  [(BKUIRotationArrowAnimationLayer *)self stopAnimationRemoveStroke];
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (double)arrowAngle
{
  return self->_arrowAngle;
}

- (void)setArrowAngle:(double)a3
{
  self->_arrowAngle = a3;
}

- (double)arrowlength
{
  return self->_arrowlength;
}

- (void)setArrowlength:(double)a3
{
  self->_arrowlength = a3;
}

- (CGSize)containerSize
{
  double width = self->_containerSize.width;
  double height = self->_containerSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setContainerSize:(CGSize)a3
{
  self->_containerSize = a3;
}

- (CGPoint)hostCenter
{
  double x = self->_hostCenter.x;
  double y = self->_hostCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (CALayer)arrowContainer
{
  return self->_arrowContainer;
}

- (void)setArrowContainer:(id)a3
{
}

- (id)getOrientation
{
  return self->_getOrientation;
}

- (void)setGetOrientation:(id)a3
{
}

- (CAShapeLayer)arrowLayerLeft
{
  return self->_arrowLayerLeft;
}

- (void)setArrowLayerLeft:(id)a3
{
}

- (CAShapeLayer)arrowLayerRight
{
  return self->_arrowLayerRight;
}

- (void)setArrowLayerRight:(id)a3
{
}

- (void)setCircleLayer:(id)a3
{
}

- (void)setRotationLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotationLayer, 0);
  objc_storeStrong((id *)&self->_circleLayer, 0);
  objc_storeStrong((id *)&self->_arrowLayerRight, 0);
  objc_storeStrong((id *)&self->_arrowLayerLeft, 0);
  objc_storeStrong(&self->_getOrientation, 0);
  objc_storeStrong((id *)&self->_arrowContainer, 0);

  objc_storeStrong((id *)&self->_color, 0);
}

@end