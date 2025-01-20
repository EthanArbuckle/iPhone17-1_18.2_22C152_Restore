@interface NTKGladiusHandsView
- (NTKGladiusSecondHandLightingDelegate)lightingDelegate;
- (_TtC29NTKGladiusFaceBundleCompanion32NTKGladiusStretchySecondHandData)stretchySecondHandData;
- (double)_timeAnimationFramesPerSecondForDevice:(id)a3;
- (id)createSecondHandView;
- (id)hourHandConfiguration;
- (id)initForDevice:(id)a3;
- (id)minuteHandConfiguration;
- (id)secondHandConfiguration;
- (void)_startNewTimeAnimation;
- (void)_stopTimeAnimation;
- (void)applyInstantaneousSecondHandTransformForAngle:(double)a3;
- (void)dealloc;
- (void)setLightingDelegate:(id)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setStretchySecondHandData:(id)a3;
@end

@implementation NTKGladiusHandsView

- (id)initForDevice:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKGladiusHandsView;
  id v3 = [(NTKGladiusHandsView *)&v6 initForDevice:a3];
  v4 = v3;
  if (v3) {
    [v3 setSecondHandDotDiameter:3.0];
  }
  return v4;
}

- (void)dealloc
{
  if (self->_timerToken)
  {
    id v3 = +[CLKClockTimer sharedInstance];
    [v3 stopUpdatesForToken:self->_timerToken];
  }
  v4.receiver = self;
  v4.super_class = (Class)NTKGladiusHandsView;
  [(NTKGladiusHandsView *)&v4 dealloc];
}

- (id)secondHandConfiguration
{
  v9.receiver = self;
  v9.super_class = (Class)NTKGladiusHandsView;
  id v3 = [(NTKGladiusHandsView *)&v9 secondHandConfiguration];
  objc_super v4 = [(NTKGladiusHandsView *)self device];
  [v4 screenBounds];
  double v6 = v5 * 0.5;
  +[NTKGladiusDialView outerEdgeInsetForDevice:v4];
  [v3 setHandLength:v6 - v7];
  [v3 setHandWidth:2.0];
  [v3 setDropShadowOpacity:0.0];
  [v3 setRadialShadowOpacity:0.0];

  return v3;
}

- (id)hourHandConfiguration
{
  v8.receiver = self;
  v8.super_class = (Class)NTKGladiusHandsView;
  id v3 = [(NTKGladiusHandsView *)&v8 hourHandConfiguration];
  objc_super v4 = [(NTKGladiusHandsView *)self device];
  sub_9F2C(v4);
  [v3 setHandLength:v5];

  double v6 = [(NTKGladiusHandsView *)self device];
  [v3 setArmLength:sub_9F2C(v6)];

  [v3 setDropShadowOpacity:0.0];
  [v3 setRadialShadowOpacity:0.0];

  return v3;
}

- (id)minuteHandConfiguration
{
  v8.receiver = self;
  v8.super_class = (Class)NTKGladiusHandsView;
  id v3 = [(NTKGladiusHandsView *)&v8 minuteHandConfiguration];
  objc_super v4 = [(NTKGladiusHandsView *)self device];
  sub_9F2C(v4);
  [v3 setHandLength:v5];

  double v6 = [(NTKGladiusHandsView *)self device];
  [v3 setArmLength:sub_9F2C(v6)];

  [v3 setDropShadowOpacity:0.0];
  [v3 setRadialShadowOpacity:0.0];

  return v3;
}

- (id)createSecondHandView
{
  id v3 = [(NTKGladiusHandsView *)self device];
  objc_super v4 = [(NTKGladiusHandsView *)self secondHandConfiguration];
  id v5 = [objc_alloc((Class)NTKHandView) initWithConfiguration:v4 forDevice:v3 maskedShadow:0];
  [v4 anchorPoint];
  double v7 = v6;
  double v9 = v8;
  v10 = [v5 layer];
  objc_msgSend(v10, "setAnchorPoint:", v7, v9);
  v11 = [v5 handImageView];
  v12 = [v11 layer];

  objc_msgSend(v12, "setContentsCenter:", 0.0, 0.5, 1.0, 0.0);
  v17[0] = @"bounds";
  v13 = +[NSNull null];
  v17[1] = @"transform";
  v18[0] = v13;
  v14 = +[NSNull null];
  v18[1] = v14;
  v15 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  [v12 setActions:v15];

  return v5;
}

- (void)_startNewTimeAnimation
{
  v42.receiver = self;
  v42.super_class = (Class)NTKGladiusHandsView;
  [(NTKGladiusHandsView *)&v42 _startNewTimeAnimation];
  if ([(NTKGladiusHandsView *)self _canRunTimeAnimation])
  {
    uint64_t v40 = 0;
    uint64_t v41 = 0;
    double v39 = 0.0;
    v35 = [(NTKGladiusHandsView *)self displayTime];
    id v3 = [(NTKGladiusHandsView *)self secondHandConfiguration];
    [v3 handLength];
    double v5 = v4;
    v34 = v3;
    [v3 tailLength];
    double v7 = v5 + v6;
    double v8 = [(NTKGladiusHandsView *)self secondHandView];
    double v9 = [v8 handImageView];
    v10 = [v9 layer];

    [v10 bounds];
    objc_msgSend(v10, "setBounds:");
    v11 = +[NSMutableArray arrayWithCapacity:240];
    v12 = +[NSMutableArray arrayWithCapacity:240];
    v13 = +[NSMutableArray arrayWithCapacity:240];
    int v14 = 0;
    double v15 = CLKUIAnalogHandsDurationForSecondsAnimation;
    double v16 = CLKUIAnalogHandsDurationForSecondsAnimation / 240.0;
    double v17 = 0.0;
    do
    {
      v18 = [v35 dateByAddingTimeInterval:v16 * v17];
      v19 = [(NTKGladiusHandsView *)self calendar];
      NTKHourMinuteSecondAnglesForTime();

      [(NTKGladiusStretchySecondHandData *)self->_stretchySecondHandData sampleAtAngle:0 includeBaseRadius:v39];
      double v21 = v20;
      *(float *)&double v20 = (float)v14 / 240.0;
      v22 = +[NSNumber numberWithFloat:v20];
      [v13 addObject:v22];

      v23 = +[NSNumber numberWithDouble:v7 + v21];
      [v11 addObject:v23];

      v24 = +[NSNumber numberWithDouble:v21 * -0.5];
      [v12 addObject:v24];

      double v17 = v17 + 1.0;
      ++v14;
    }
    while (v14 != 241);
    v25 = +[CAKeyframeAnimation animationWithKeyPath:@"bounds.size.height"];
    [v25 setDuration:v15];
    v26 = [(NTKGladiusHandsView *)self device];
    [(NTKGladiusHandsView *)self _timeAnimationFramesPerSecondForDevice:v26];
    [v25 setFrameInterval:1.0 / v27];

    [v25 setValues:v11];
    [v25 setKeyTimes:v13];
    [v10 addAnimation:v25 forKey:@"length"];
    v28 = +[CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
    [v25 duration];
    objc_msgSend(v28, "setDuration:");
    [v25 frameInterval];
    objc_msgSend(v28, "setFrameInterval:");
    [v28 setValues:v12];
    [v28 setKeyTimes:v13];
    [v10 addAnimation:v28 forKey:@"offset"];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_lightingDelegate);
    [WeakRetained startSecondHandLightingAnimationAtDate:v35];

    if (self->_timerToken)
    {
      v30 = +[CLKClockTimer sharedInstance];
      [v30 stopUpdatesForToken:self->_timerToken];
    }
    objc_initWeak(&location, self);
    v31 = +[CLKClockTimer sharedInstance];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_A758;
    v36[3] = &unk_209B0;
    objc_copyWeak(&v37, &location);
    v32 = [v31 startUpdatesWithUpdateFrequency:2 withHandler:v36 identificationLog:&stru_209D0];
    timerToken = self->_timerToken;
    self->_timerToken = v32;

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }
}

- (void)_stopTimeAnimation
{
  v11.receiver = self;
  v11.super_class = (Class)NTKGladiusHandsView;
  [(NTKGladiusHandsView *)&v11 _stopTimeAnimation];
  id v3 = [(NTKGladiusHandsView *)self secondHandView];
  double v4 = [v3 handImageView];
  double v5 = [v4 layer];

  double v6 = [v5 animationKeys];
  id v7 = [v6 count];

  if (v7)
  {
    [v5 removeAllAnimations];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_lightingDelegate);
    [WeakRetained stopSecondHandLightingAnimation];

    if (self->_timerToken)
    {
      double v9 = +[CLKClockTimer sharedInstance];
      [v9 stopUpdatesForToken:self->_timerToken];

      timerToken = self->_timerToken;
      self->_timerToken = 0;
    }
  }
}

- (double)_timeAnimationFramesPerSecondForDevice:(id)a3
{
  return 30.0;
}

- (void)applyInstantaneousSecondHandTransformForAngle:(double)a3
{
  [(NTKGladiusStretchySecondHandData *)self->_stretchySecondHandData sampleAtAngle:0 includeBaseRadius:a3];
  double v5 = v4;
  double v6 = [(NTKGladiusHandsView *)self secondHandConfiguration];
  [v6 handLength];
  [v6 tailLength];
  id v7 = [(NTKGladiusHandsView *)self secondHandView];
  double v8 = [v7 handImageView];
  double v9 = [v8 layer];

  [v9 bounds];
  objc_msgSend(v9, "setBounds:");
  CATransform3DMakeTranslation(&v11, 0.0, v5 * -0.5, 0.0);
  CATransform3D v10 = v11;
  [v9 setTransform:&v10];
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  id v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NTKGladiusHandsView;
  [(NTKGladiusHandsView *)&v8 setOverrideDate:v6 duration:a4];
  if (a4 == 0.0)
  {
    id v7 = [(NTKGladiusHandsView *)self calendar];
    NTKHourMinuteSecondAnglesForTime();

    [(NTKGladiusHandsView *)self applyInstantaneousSecondHandTransformForAngle:0.0];
  }
}

- (_TtC29NTKGladiusFaceBundleCompanion32NTKGladiusStretchySecondHandData)stretchySecondHandData
{
  return self->_stretchySecondHandData;
}

- (void)setStretchySecondHandData:(id)a3
{
  self->_stretchySecondHandData = (_TtC29NTKGladiusFaceBundleCompanion32NTKGladiusStretchySecondHandData *)a3;
}

- (NTKGladiusSecondHandLightingDelegate)lightingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lightingDelegate);

  return (NTKGladiusSecondHandLightingDelegate *)WeakRetained;
}

- (void)setLightingDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lightingDelegate);

  objc_storeStrong((id *)&self->_timerToken, 0);
}

@end