@interface AnalogHandsView
- (AnalogHandsView)initWithFixedSize:(CGSize)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (double)_timeAnimationFramesPerSecondForDevice:(id)a3;
- (id)hourHandConfiguration;
- (id)minuteHandConfiguration;
- (id)secondHandConfiguration;
- (void)_startNewSecondHandAnimation;
- (void)_stopHandAnimation;
- (void)setOverrideDate:(id)a3;
@end

@implementation AnalogHandsView

- (AnalogHandsView)initWithFixedSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v6 = [MEMORY[0x263F82B60] mainScreen];
  [v6 scale];
  UIRoundToScale();
  self->_scaleFactor = v7;

  self->_size.CGFloat width = width;
  self->_size.CGFloat height = height;
  v8 = [MEMORY[0x263EFD180] currentDevice];
  v11.receiver = self;
  v11.super_class = (Class)AnalogHandsView;
  v9 = [(CLKUIAnalogHandsView *)&v11 initForDevice:v8];

  return v9;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AnalogHandsView;
  -[CLKUIAnalogHandsView sizeThatFits:](&v9, sel_sizeThatFits_, a3.width, a3.height);
  double scaleFactor = self->_scaleFactor;
  double v6 = v5 * scaleFactor;
  double v8 = v7 * scaleFactor;
  result.CGFloat height = v8;
  result.CGFloat width = v6;
  return result;
}

- (CGSize)intrinsicContentSize
{
  -[AnalogHandsView sizeThatFits:](self, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (void)setOverrideDate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(CLKUIAnalogHandsView *)self setFrozen:1];
    [(AnalogHandsView *)self _stopHandAnimation];
    double v5 = [(CLKUIAnalogHandsView *)self calendar];
    CLKHourMinuteSecondAnglesForTime();

    double v6 = [(CLKUIAnalogHandsView *)self hourHandView];
    [v6 setZRotation:0.0];

    double v7 = [(CLKUIAnalogHandsView *)self minuteHandView];
    [v7 setZRotation:0.0];

    double v8 = [(CLKUIAnalogHandsView *)self secondHandView];
    [v8 setZRotation:0.0];
  }
  else
  {
    [(CLKUIAnalogHandsView *)self setFrozen:0];
    [(AnalogHandsView *)self _startNewSecondHandAnimation];
  }
}

- (void)_startNewSecondHandAnimation
{
  id v9 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform.rotation"];
  LODWORD(v3) = 2139095040;
  [v9 setRepeatCount:v3];
  id v4 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC8]];
  [v9 setTimingFunction:v4];

  [v9 setByValue:&unk_26FDF06E0];
  [v9 setDuration:*MEMORY[0x263F320E0]];
  double v5 = [(CLKUIAnalogHandsView *)self device];
  [(AnalogHandsView *)self _timeAnimationFramesPerSecondForDevice:v5];
  [v9 setFrameInterval:1.0 / v6];

  [v9 setDiscretizesTime:1];
  double v7 = [(CLKUIAnalogHandsView *)self secondHandView];
  double v8 = [v7 layer];
  [v8 addAnimation:v9 forKey:@"time"];
}

- (void)_stopHandAnimation
{
  double v3 = [(CLKUIAnalogHandsView *)self hourHandView];
  id v4 = [v3 layer];
  [v4 removeAnimationForKey:@"time"];

  double v5 = [(CLKUIAnalogHandsView *)self minuteHandView];
  double v6 = [v5 layer];
  [v6 removeAnimationForKey:@"time"];

  id v8 = [(CLKUIAnalogHandsView *)self secondHandView];
  double v7 = [v8 layer];
  [v7 removeAnimationForKey:@"time"];
}

- (double)_timeAnimationFramesPerSecondForDevice:(id)a3
{
  return 30.0;
}

- (id)hourHandConfiguration
{
  double v3 = (void *)MEMORY[0x263F32108];
  id v4 = [MEMORY[0x263EFD180] currentDevice];
  double v5 = [v3 defaultHourConfigurationForDevice:v4];

  double scaleFactor = self->_scaleFactor;
  [v5 handWidth];
  [v5 setHandWidth:v7 * (scaleFactor * 0.8)];
  [v5 pegRadius];
  [v5 setPegRadius:scaleFactor * v8];
  [v5 pegStrokeWidth];
  [v5 setPegStrokeWidth:scaleFactor * v9];
  [v5 armWidth];
  [v5 setArmWidth:scaleFactor * v10];
  [v5 armLength];
  [v5 setArmLength:scaleFactor * v11];
  [v5 dropShadowRadius];
  [v5 setDropShadowRadius:scaleFactor * v12];
  [v5 radialShadowRadius];
  [v5 setRadialShadowRadius:scaleFactor * v13];
  [v5 directionalShadowOffset];
  double v15 = scaleFactor * v14;
  [v5 directionalShadowOffset];
  objc_msgSend(v5, "setDirectionalShadowOffset:", v15, scaleFactor * v16);
  v17 = [(AnalogHandsView *)self secondHandConfiguration];
  [v17 handLength];
  double v19 = v18;
  [v5 armLength];
  double v21 = -(v20 - v19 * 0.54);
  [v5 pegRadius];
  double v23 = v21 + v22 * -0.5;
  [v5 pegStrokeWidth];
  [v5 setHandLength:v23 - v24];

  v25 = objc_msgSend(v5, "cp_handConfigurationRoundedToScaleOfView:", self);

  return v25;
}

- (id)minuteHandConfiguration
{
  double v3 = (void *)MEMORY[0x263F32108];
  id v4 = [MEMORY[0x263EFD180] currentDevice];
  double v5 = [v3 defaultMinuteConfigurationForDevice:v4];

  double scaleFactor = self->_scaleFactor;
  [v5 handWidth];
  [v5 setHandWidth:v7 * (scaleFactor * 0.8)];
  [v5 pegRadius];
  [v5 setPegRadius:scaleFactor * v8];
  [v5 pegStrokeWidth];
  [v5 setPegStrokeWidth:scaleFactor * v9];
  [v5 armWidth];
  [v5 setArmWidth:scaleFactor * v10];
  [v5 armLength];
  [v5 setArmLength:scaleFactor * v11];
  [v5 dropShadowRadius];
  [v5 setDropShadowRadius:scaleFactor * v12];
  [v5 radialShadowRadius];
  [v5 setRadialShadowRadius:scaleFactor * v13];
  [v5 directionalShadowOffset];
  double v15 = scaleFactor * v14;
  [v5 directionalShadowOffset];
  objc_msgSend(v5, "setDirectionalShadowOffset:", v15, scaleFactor * v16);
  v17 = [(AnalogHandsView *)self secondHandConfiguration];
  [v17 handLength];
  double v19 = v18;
  [v5 armLength];
  double v21 = -(v20 - v19 * 0.92);
  [v5 pegRadius];
  double v23 = v21 + v22 * -0.5;
  [v5 pegStrokeWidth];
  [v5 setHandLength:v23 - v24];

  v25 = objc_msgSend(v5, "cp_handConfigurationRoundedToScaleOfView:", self);

  return v25;
}

- (id)secondHandConfiguration
{
  double v3 = (void *)MEMORY[0x263F32108];
  id v4 = [MEMORY[0x263EFD180] currentDevice];
  double v5 = [v3 defaultSecondConfigurationForDevice:v4];

  double scaleFactor = self->_scaleFactor;
  [v5 handWidth];
  [v5 setHandWidth:scaleFactor * v7];
  double v8 = [MEMORY[0x263F82B60] mainScreen];
  [v8 scale];
  UIRoundToScale();
  objc_msgSend(v5, "setHandLength:");

  [v5 pegRadius];
  [v5 setPegRadius:scaleFactor * 1.3333 * v9];
  [v5 pegStrokeWidth];
  [v5 setPegStrokeWidth:scaleFactor / 1.3333 * v10];
  [v5 tailLength];
  [v5 setTailLength:scaleFactor * v11];
  [v5 dropShadowRadius];
  [v5 setDropShadowRadius:scaleFactor * v12];
  [v5 radialShadowRadius];
  [v5 setRadialShadowRadius:scaleFactor * v13];
  [v5 setRadialShadowOpacity:0.15];
  [v5 directionalShadowOffset];
  double v15 = scaleFactor * v14;
  [v5 directionalShadowOffset];
  objc_msgSend(v5, "setDirectionalShadowOffset:", v15, scaleFactor * v16);
  v17 = objc_msgSend(v5, "cp_handConfigurationRoundedToScaleOfView:", self);

  return v17;
}

@end