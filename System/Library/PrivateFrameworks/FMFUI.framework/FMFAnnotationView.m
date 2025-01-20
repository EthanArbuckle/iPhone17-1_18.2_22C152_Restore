@interface FMFAnnotationView
- (BOOL)isLiveAnimated;
- (CALayer)stewieLargeBadgeLayer;
- (CALayer)stewieSmallBadgeLayer;
- (CAShapeLayer)accuracyLayer;
- (CAShapeLayer)largePulseLayer;
- (CAShapeLayer)smallPulseLayer;
- (FMFAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4 tintColor:(id)a5;
- (double)lastAccuracyRadius;
- (id)buildAccuracyLayer;
- (id)buildPulseLayerWithDiameter:(double)a3 centeredInParentLayer:(id)a4;
- (id)buildStewieLayerWithDiameter:(double)a3 image:(id)a4 size:(CGSize)a5 offsetInParentLayer:(id)a6 by:(CGPoint)a7;
- (void)setAccuracyLayer:(id)a3;
- (void)setIsLiveAnimated:(BOOL)a3;
- (void)setLargePulseLayer:(id)a3;
- (void)setLastAccuracyRadius:(double)a3;
- (void)setSmallPulseLayer:(id)a3;
- (void)setStewieLargeBadgeLayer:(id)a3;
- (void)setStewieSmallBadgeLayer:(id)a3;
- (void)startLiveAnimation;
- (void)stopLiveAnimation;
- (void)updateWithLocation:(id)a3;
@end

@implementation FMFAnnotationView

- (FMFAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4 tintColor:(id)a5
{
  v20.receiver = self;
  v20.super_class = (Class)FMFAnnotationView;
  id v7 = a3;
  v8 = [(FMAnnotationView *)&v20 initWithAnnotation:v7 reuseIdentifier:a4 tintColor:a5];
  v9 = [(FMFAnnotationView *)v8 buildAccuracyLayer];
  [(FMFAnnotationView *)v8 setAccuracyLayer:v9];

  [(FMFAnnotationView *)v8 setLastAccuracyRadius:-1.0];
  v10 = [(FMAnnotationView *)v8 locationOuterLayer];
  v11 = [(FMFAnnotationView *)v8 accuracyLayer];
  [v10 addSublayer:v11];

  v12 = [MEMORY[0x263F1C6C8] configurationWithTextStyle:*MEMORY[0x263F1D260] scale:1];
  v13 = [MEMORY[0x263F1C6B0] _systemImageNamed:@"satellite.fill"];
  v14 = [v13 imageByApplyingSymbolConfiguration:v12];

  v15 = [(FMAnnotationView *)v8 smallCircleLayer];
  v16 = -[FMFAnnotationView buildStewieLayerWithDiameter:image:size:offsetInParentLayer:by:](v8, "buildStewieLayerWithDiameter:image:size:offsetInParentLayer:by:", v14, v15, 26.0, 22.0, 22.0, 16.0, 16.0);
  [(FMFAnnotationView *)v8 setStewieSmallBadgeLayer:v16];

  v17 = [(FMAnnotationView *)v8 largeCircleLayer];
  v18 = -[FMFAnnotationView buildStewieLayerWithDiameter:image:size:offsetInParentLayer:by:](v8, "buildStewieLayerWithDiameter:image:size:offsetInParentLayer:by:", v14, v17, 64.0, 30.0, 30.0, 46.0, 46.0);
  [(FMFAnnotationView *)v8 setStewieLargeBadgeLayer:v18];

  [(FMFAnnotationView *)v8 updateWithLocation:v7];
  return v8;
}

- (void)updateWithLocation:(id)a3
{
  id v4 = a3;
  [v4 horizontalAccuracy];
  double v6 = v5;
  uint64_t v7 = [v4 locationType];
  BOOL v9 = v6 <= 200.0 && v7 == 2;
  [(FMFAnnotationView *)self setIsLiveAnimated:v9];
  uint64_t v10 = [v4 locationType];
  [v4 horizontalAccuracy];
  double v12 = v11;

  [(MKAnnotationView *)self _pointsForDistance:v12];
  double v14 = v13;
  v15 = [(FMAnnotationView *)self locationOuterLayer];
  [v15 bounds];
  double v17 = v16;
  v18 = [(FMAnnotationView *)self locationOuterLayer];
  [v18 bounds];
  double v20 = v19;
  v21 = [(FMAnnotationView *)self locationOuterLayer];
  [v21 bounds];
  double v23 = v22;
  v24 = [(FMAnnotationView *)self locationOuterLayer];
  [v24 bounds];
  double v26 = v25;

  v27 = [MEMORY[0x263F1C550] systemBlueColor];
  id v28 = [v27 colorWithAlphaComponent:0.2];
  uint64_t v29 = [v28 CGColor];
  v30 = [(FMFAnnotationView *)self accuracyLayer];
  [v30 setFillColor:v29];

  id v31 = [MEMORY[0x263F1C550] clearColor];
  uint64_t v32 = [v31 CGColor];
  v33 = [(FMFAnnotationView *)self accuracyLayer];
  [v33 setStrokeColor:v32];

  v34 = [(FMFAnnotationView *)self accuracyLayer];
  [v34 setLineWidth:3.0];

  [(FMFAnnotationView *)self lastAccuracyRadius];
  if (v35 != v14)
  {
    double v36 = v14 + v14;
    objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithOvalInRect:", 0.0, 0.0, v36, v36);
    id v37 = objc_claimAutoreleasedReturnValue();
    uint64_t v38 = [v37 CGPath];

    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    v39 = [(FMFAnnotationView *)self accuracyLayer];
    [v39 setPath:v38];

    v40 = [(FMFAnnotationView *)self accuracyLayer];
    objc_msgSend(v40, "setFrame:", v17 + v20 * 0.5 - v36 * 0.5, v23 + v26 * 0.5 - v36 * 0.5, v36, v36);

    [MEMORY[0x263F158F8] commit];
  }
  double v41 = 0.0;
  if (v6 > 200.0)
  {
    if ([(MKAnnotationView *)self isSelected]) {
      double v41 = 1.0;
    }
    else {
      double v41 = 0.0;
    }
  }
  v42 = [(FMFAnnotationView *)self accuracyLayer];
  [v42 opacity];
  double v44 = v43;

  if (v41 != v44)
  {
    v45 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    v46 = NSNumber;
    v47 = [(FMFAnnotationView *)self accuracyLayer];
    [v47 opacity];
    v48 = objc_msgSend(v46, "numberWithFloat:");
    [v45 setFromValue:v48];

    v49 = [NSNumber numberWithDouble:v41];
    [v45 setToValue:v49];

    [v45 setDuration:0.5];
    [v45 setRemovedOnCompletion:0];
    v50 = [(FMFAnnotationView *)self accuracyLayer];
    [v50 addAnimation:v45 forKey:@"opacity"];
  }
  if (v10 == 3) {
    float v51 = 1.0;
  }
  else {
    float v51 = 0.0;
  }
  v52 = [(FMFAnnotationView *)self stewieSmallBadgeLayer];
  *(float *)&double v53 = v51;
  [v52 setOpacity:v53];

  id v55 = [(FMFAnnotationView *)self stewieLargeBadgeLayer];
  *(float *)&double v54 = v51;
  [v55 setOpacity:v54];
}

- (id)buildAccuracyLayer
{
  v2 = objc_opt_new();
  objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithOvalInRect:", 0.0, 0.0, 0.0, 0.0);
  id v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPath:", objc_msgSend(v3, "CGPath"));

  return v2;
}

- (id)buildPulseLayerWithDiameter:(double)a3 centeredInParentLayer:(id)a4
{
  v21[2] = *MEMORY[0x263EF8340];
  double v5 = (void *)MEMORY[0x263F1C550];
  id v6 = a4;
  id v7 = [v5 systemGreenColor];
  uint64_t v8 = [v7 CGColor];

  BOOL v9 = objc_opt_new();
  [v6 bounds];
  double v11 = (v10 - a3) * 0.5;
  [v6 bounds];
  objc_msgSend(v9, "setFrame:", v11, (v12 - a3) * 0.5, a3, a3);
  objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithOvalInRect:", 0.0, 0.0, a3, a3);
  id v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPath:", objc_msgSend(v13, "CGPath"));

  objc_msgSend(v9, "setAnchorPoint:", 0.5, 0.5);
  [v9 setFillColor:v8];
  [v9 setOpacity:0.0];
  double v14 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale"];
  [v14 setFromValue:&unk_26CA0F5D0];
  [v14 setToValue:&unk_26CA0F5E0];
  [v14 setDuration:1.5];
  [v14 setRemovedOnCompletion:0];
  v15 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v15 setFromValue:&unk_26CA0F5F0];
  [v15 setToValue:&unk_26CA0F600];
  [v15 setDuration:1.5];
  [v15 setRemovedOnCompletion:0];
  double v16 = objc_opt_new();
  v21[0] = v14;
  v21[1] = v15;
  double v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
  [v16 setAnimations:v17];

  [v16 setDuration:1.5];
  [v16 setRepeatCount:0.0];
  v18 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC0]];
  [v16 setTimingFunction:v18];

  [v15 setRemovedOnCompletion:0];
  LODWORD(v19) = 2139095039;
  [v16 setRepeatCount:v19];
  [v6 insertSublayer:v9 atIndex:0];

  [v9 addAnimation:v16 forKey:@"pulse"];
  return v9;
}

- (BOOL)isLiveAnimated
{
  v2 = [(FMFAnnotationView *)self smallPulseLayer];
  id v3 = [v2 animationKeys];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)setIsLiveAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(FMFAnnotationView *)self isLiveAnimated] != a3)
  {
    if (v3)
    {
      [(FMFAnnotationView *)self startLiveAnimation];
    }
    else
    {
      [(FMFAnnotationView *)self stopLiveAnimation];
    }
  }
}

- (void)startLiveAnimation
{
  BOOL v3 = [(FMAnnotationView *)self smallCircleLayer];
  BOOL v4 = [(FMFAnnotationView *)self buildPulseLayerWithDiameter:v3 centeredInParentLayer:26.0];
  [(FMFAnnotationView *)self setSmallPulseLayer:v4];

  id v6 = [(FMAnnotationView *)self largeCircleLayer];
  double v5 = [(FMFAnnotationView *)self buildPulseLayerWithDiameter:v6 centeredInParentLayer:64.0];
  [(FMFAnnotationView *)self setLargePulseLayer:v5];
}

- (void)stopLiveAnimation
{
  BOOL v3 = [(FMFAnnotationView *)self smallPulseLayer];
  [v3 removeAllAnimations];

  BOOL v4 = [(FMFAnnotationView *)self smallPulseLayer];
  [v4 removeFromSuperlayer];

  [(FMFAnnotationView *)self setSmallPulseLayer:0];
  double v5 = [(FMFAnnotationView *)self largePulseLayer];
  [v5 removeAllAnimations];

  id v6 = [(FMFAnnotationView *)self largePulseLayer];
  [v6 removeFromSuperlayer];

  [(FMFAnnotationView *)self setLargePulseLayer:0];
}

- (id)buildStewieLayerWithDiameter:(double)a3 image:(id)a4 size:(CGSize)a5 offsetInParentLayer:(id)a6 by:(CGPoint)a7
{
  double y = a7.y;
  double x = a7.x;
  double height = a5.height;
  double width = a5.width;
  id v13 = a6;
  id v14 = a4;
  v15 = objc_opt_new();
  [v13 bounds];
  double v17 = x + (v16 - a3) * 0.5;
  [v13 bounds];
  objc_msgSend(v15, "setFrame:", v17, y + (v18 - a3) * 0.5, width, height);
  double v19 = objc_opt_new();
  objc_msgSend(v19, "setFrame:", 0.0, 0.0, width, height);
  objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithOvalInRect:", 0.0, 0.0, width, height);
  id v20 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPath:", objc_msgSend(v20, "CGPath"));

  id v21 = [MEMORY[0x263F1C550] whiteColor];
  objc_msgSend(v19, "setFillColor:", objc_msgSend(v21, "CGColor"));

  double v22 = objc_opt_new();
  [v19 frame];
  CGRect v32 = CGRectInset(v31, 2.0, 2.0);
  objc_msgSend(v22, "setFrame:", v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
  objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithOvalInRect:", 0.0, 0.0, width + -4.0, height + -4.0);
  id v23 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPath:", objc_msgSend(v23, "CGPath"));

  id v24 = [MEMORY[0x263F1C550] blackColor];
  objc_msgSend(v22, "setFillColor:", objc_msgSend(v24, "CGColor"));

  double v25 = objc_opt_new();
  [v22 frame];
  CGRect v34 = CGRectInset(v33, 2.0, 2.0);
  objc_msgSend(v25, "setFrame:", v34.origin.x, v34.origin.y, v34.size.width, v34.size.height);
  [v25 setContentsGravity:*MEMORY[0x263F15E20]];
  double v26 = [MEMORY[0x263F1C550] whiteColor];
  v27 = [v14 tintedImageWithColor:v26];

  id v28 = v27;
  objc_msgSend(v25, "setContents:", objc_msgSend(v28, "CGImage"));

  [v15 addSublayer:v19];
  [v15 addSublayer:v22];
  [v15 addSublayer:v25];
  [v13 addSublayer:v15];

  return v15;
}

- (CAShapeLayer)accuracyLayer
{
  return self->_accuracyLayer;
}

- (void)setAccuracyLayer:(id)a3
{
}

- (CAShapeLayer)smallPulseLayer
{
  return self->_smallPulseLayer;
}

- (void)setSmallPulseLayer:(id)a3
{
}

- (CAShapeLayer)largePulseLayer
{
  return self->_largePulseLayer;
}

- (void)setLargePulseLayer:(id)a3
{
}

- (double)lastAccuracyRadius
{
  return self->_lastAccuracyRadius;
}

- (void)setLastAccuracyRadius:(double)a3
{
  self->_lastAccuracyRadius = a3;
}

- (CALayer)stewieSmallBadgeLayer
{
  return self->_stewieSmallBadgeLayer;
}

- (void)setStewieSmallBadgeLayer:(id)a3
{
}

- (CALayer)stewieLargeBadgeLayer
{
  return self->_stewieLargeBadgeLayer;
}

- (void)setStewieLargeBadgeLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stewieLargeBadgeLayer, 0);
  objc_storeStrong((id *)&self->_stewieSmallBadgeLayer, 0);
  objc_storeStrong((id *)&self->_largePulseLayer, 0);
  objc_storeStrong((id *)&self->_smallPulseLayer, 0);
  objc_storeStrong((id *)&self->_accuracyLayer, 0);
}

@end