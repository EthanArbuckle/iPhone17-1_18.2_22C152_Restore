@interface NTKChronoHandsView
- (BOOL)_stopwatchIsRunning;
- (BOOL)_stopwatchIsStopped;
- (BOOL)minuteHandUsesManualTime;
- (CGPoint)lowerDialCenter;
- (CGPoint)upperDialCenter;
- (NTKChronoPalette)palette;
- (NTKHandView)chronoFlybackMinuteHandView;
- (NTKHandView)chronoFlybackSecondHandView;
- (NTKHandView)chronoMinuteHandView;
- (NTKHandView)chronoSecondHandView;
- (double)_stopwatchCurrentLapTime;
- (double)_stopwatchCurrentTime;
- (double)chronoDuration;
- (double)secondsAnimationFPS;
- (double)upperDuration;
- (float)zRotationForTime:(double)a3 withDuration:(float)a4;
- (id)createSecondHandView;
- (id)createTinyBabyHandViewWithColor:(id)a3;
- (id)initForDevice:(id)a3;
- (id)tinyBabyHandConfiguration;
- (int64_t)_stopwatchLapCount;
- (unint64_t)timeScale;
- (void)_enumerateChronoHandViews:(id)a3;
- (void)_enumerateFlybackChronoHands:(id)a3;
- (void)_enumeratePrimaryChronoHands:(id)a3;
- (void)layoutHandViews;
- (void)setLowerDialCenter:(CGPoint)a3;
- (void)setMinuteHandUsesManualTime:(BOOL)a3;
- (void)setPalette:(id)a3;
- (void)setTimeScale:(unint64_t)a3;
- (void)setUpperDialCenter:(CGPoint)a3;
- (void)showChronoMode;
- (void)showTimeMode;
- (void)startNewChronoAnimation;
- (void)stopChronoAnimation;
- (void)updateLapHandsVisibility;
@end

@implementation NTKChronoHandsView

- (id)initForDevice:(id)a3
{
  v28.receiver = self;
  v28.super_class = (Class)NTKChronoHandsView;
  v3 = [(NTKChronoHandsView *)&v28 initForDevice:a3];
  if (v3)
  {
    v4 = +[UIColor systemBlueColor];
    uint64_t v5 = [v3 createTinyBabyHandViewWithColor:v4];
    id v6 = v3[7];
    v3[7] = (id)v5;

    v7 = +[UIColor whiteColor];
    uint64_t v8 = [v3 createTinyBabyHandViewWithColor:v7];
    id v9 = v3[6];
    v3[6] = (id)v8;

    id v10 = v3[6];
    v11 = [v3 hourHandView];
    [v3 insertSubview:v10 belowSubview:v11];

    [v3 insertSubview:v3[5] belowSubview:v3[6]];
    v27.receiver = v3;
    v27.super_class = (Class)NTKChronoHandsView;
    uint64_t v12 = [(NTKChronoHandsView *)&v27 createSecondHandView];
    id v13 = v3[4];
    v3[4] = (id)v12;

    id v14 = v3[4];
    v15 = [v3 minuteHandView];
    [v3 insertSubview:v14 aboveSubview:v15];

    id v16 = v3[4];
    v17 = +[UIColor systemOrangeColor];
    [v16 setColor:v17];

    [v3[4] setDropShadowsHidden:1];
    v26.receiver = v3;
    v26.super_class = (Class)NTKChronoHandsView;
    uint64_t v18 = [(NTKChronoHandsView *)&v26 createSecondHandView];
    id v19 = v3[5];
    v3[5] = (id)v18;

    id v20 = v3[5];
    v21 = +[UIColor systemBlueColor];
    [v20 setColor:v21];

    [v3[5] setDropShadowsHidden:1];
    id v22 = v3[5];
    [v3[4] bounds];
    objc_msgSend(v22, "setBounds:");
    [v3 insertSubview:v3[5] belowSubview:v3[4]];
    v23 = [v3 secondHandView];
    v24 = [v3 hourHandView];
    [v3 insertSubview:v23 belowSubview:v24];

    v3[2] = 0;
  }
  return v3;
}

- (id)createTinyBabyHandViewWithColor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NTKChronoHandsView *)self device];
  id v6 = objc_alloc((Class)NTKHandView);
  v7 = [(NTKChronoHandsView *)self tinyBabyHandConfiguration];
  id v8 = [v6 initWithConfiguration:v7 forDevice:v5 maskedShadow:0];

  [v8 anchorPointFromConfiguration];
  double v10 = v9;
  double v12 = v11;
  id v13 = [v8 layer];
  objc_msgSend(v13, "setAnchorPoint:", v10, v12);

  [v8 setColor:v4];
  [v8 setRadialShadowsHidden:1];
  [v8 setDropShadowsHidden:1];

  return v8;
}

- (id)tinyBabyHandConfiguration
{
  v2 = [(NTKChronoHandsView *)self device];
  v3 = +[CLKUIAnalogHandConfiguration defaultSubdialConfigurationForDevice:v2];

  return v3;
}

- (id)createSecondHandView
{
  v3 = +[UIColor systemBlueColor];
  id v4 = [(NTKChronoHandsView *)self createTinyBabyHandViewWithColor:v3];

  return v4;
}

- (void)layoutHandViews
{
  v8.receiver = self;
  v8.super_class = (Class)NTKChronoHandsView;
  [(NTKChronoHandsView *)&v8 layoutHandViews];
  [(NTKChronoHandsView *)self bounds];
  double v4 = v3 * 0.5;
  [(NTKChronoHandsView *)self bounds];
  double v6 = v5 * 0.5;
  -[NTKHandView setCenter:](self->_chronoSecondHandView, "setCenter:", v4, v5 * 0.5);
  -[NTKHandView setCenter:](self->_chronoFlybackSecondHandView, "setCenter:", v4, v6);
  -[NTKHandView setCenter:](self->_chronoMinuteHandView, "setCenter:", self->_upperDialCenter.x, self->_upperDialCenter.y);
  -[NTKHandView setCenter:](self->_chronoFlybackMinuteHandView, "setCenter:", self->_upperDialCenter.x, self->_upperDialCenter.y);
  v7 = [(NTKChronoHandsView *)self secondHandView];
  objc_msgSend(v7, "setCenter:", self->_lowerDialCenter.x, self->_lowerDialCenter.y);
}

- (void)setMinuteHandUsesManualTime:(BOOL)a3
{
  if (self->_minuteHandUsesManualTime != a3)
  {
    self->_minuteHandUsesManualTime = a3;
    if (self->_isChronoAnimationRunning) {
      [(NTKChronoHandsView *)self startNewChronoAnimation];
    }
  }
}

- (void)showTimeMode
{
  [(NTKChronoHandsView *)self stopChronoAnimation];
  [(NTKChronoHandsView *)self updateLapHandsVisibility];

  [(NTKChronoHandsView *)self _enumeratePrimaryChronoHands:&stru_1C7F0];
}

- (void)showChronoMode
{
  [(NTKChronoHandsView *)self updateLapHandsVisibility];
  if (![(NTKChronoHandsView *)self _stopwatchIsRunning])
  {
    [(NTKChronoHandsView *)self _stopwatchCurrentTime];
    uint64_t v4 = v3;
    [(NTKChronoHandsView *)self _stopwatchCurrentLapTime];
    uint64_t v6 = v5;
    [(NTKChronoHandsView *)self chronoDuration];
    uint64_t v8 = v7;
    [(NTKChronoHandsView *)self upperDuration];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_AB88;
    v10[3] = &unk_1C818;
    v10[4] = self;
    v10[5] = v4;
    v10[6] = v8;
    v10[7] = v9;
    v10[8] = v6;
    +[UIView animateWithDuration:v10 animations:0.25];
  }
}

- (void)startNewChronoAnimation
{
  [(NTKChronoHandsView *)self chronoDuration];
  double v4 = v3;
  [(NTKChronoHandsView *)self upperDuration];
  double v6 = v5;
  [(NTKChronoHandsView *)self _stopwatchCurrentTime];
  double v8 = v7;
  [(NTKChronoHandsView *)self _stopwatchCurrentLapTime];
  double v10 = v9;
  double v11 = +[CABasicAnimation animationWithKeyPath:@"transform.rotation"];
  LODWORD(v12) = 2139095040;
  [v11 setRepeatCount:v12];
  id v13 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
  [v11 setTimingFunction:v13];

  [v11 setRemovedOnCompletion:0];
  [v11 setFillMode:kCAFillModeForwards];
  v33 = _NSConcreteStackBlock;
  uint64_t v34 = 3221225472;
  v35 = sub_AEFC;
  v36 = &unk_1C840;
  uint64_t v38 = 0x401921FB54442D18;
  id v14 = v11;
  id v37 = v14;
  v15 = objc_retainBlock(&v33);
  chronoSecondHandView = self->_chronoSecondHandView;
  float v17 = v4;
  *(float *)&double v18 = v17;
  -[NTKChronoHandsView zRotationForTime:withDuration:](self, "zRotationForTime:withDuration:", v8, v18, v33, v34, v35, v36);
  float v20 = v19;
  [(NTKChronoHandsView *)self secondsAnimationFPS];
  ((void (*)(void ***, NTKHandView *, double, double, double))v15[2])(v15, chronoSecondHandView, v20, v4, v21);
  if (self->_minuteHandUsesManualTime)
  {
    float v23 = v6;
  }
  else
  {
    chronoMinuteHandView = self->_chronoMinuteHandView;
    float v23 = v6;
    *(float *)&double v22 = v23;
    [(NTKChronoHandsView *)self zRotationForTime:v8 withDuration:v22];
    ((void (*)(void ***, NTKHandView *, double, double, double))v15[2])(v15, chronoMinuteHandView, v25, v6, 15.0);
  }
  chronoFlybackSecondHandView = self->_chronoFlybackSecondHandView;
  *(float *)&double v22 = v4;
  [(NTKChronoHandsView *)self zRotationForTime:v10 withDuration:v22];
  double v28 = v27;
  [(NTKChronoHandsView *)self secondsAnimationFPS];
  ((void (*)(void ***, NTKHandView *, double, double, double))v15[2])(v15, chronoFlybackSecondHandView, v28, v4, v29);
  chronoFlybackMinuteHandView = self->_chronoFlybackMinuteHandView;
  *(float *)&double v31 = v23;
  [(NTKChronoHandsView *)self zRotationForTime:v10 withDuration:v31];
  ((void (*)(void ***, NTKHandView *, double, double, double))v15[2])(v15, chronoFlybackMinuteHandView, v32, v6, 15.0);
  self->_isChronoAnimationRunning = 1;
}

- (void)stopChronoAnimation
{
  self->_isChronoAnimationRunning = 0;
}

- (void)updateLapHandsVisibility
{
  BOOL v3 = [(NTKChronoHandsView *)self _stopwatchIsStopped]
    || [(NTKChronoHandsView *)self _stopwatchLapCount] < 1
    || [(NTKChronoHandsView *)self dataMode] != (char *)&dword_0 + 1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_B1BC;
  v4[3] = &unk_1C880;
  BOOL v5 = v3;
  [(NTKChronoHandsView *)self _enumerateFlybackChronoHands:v4];
}

- (void)setPalette:(id)a3
{
  if (self->_palette != a3)
  {
    self->_palette = (NTKChronoPalette *)a3;
    id v4 = a3;
    id v19 = [v4 foregroundColor];
    BOOL v5 = [(NTKChronoHandsView *)self minuteHandView];
    [v5 setColor:v19];

    double v6 = [(NTKChronoHandsView *)self hourHandView];
    [v6 setColor:v19];

    double v7 = [(NTKChronoHandsView *)self secondHandView];
    [v7 setColor:v19];

    double v8 = [v4 chronoHandColor];
    [(NTKHandView *)self->_chronoSecondHandView setColor:v8];
    [(NTKHandView *)self->_chronoMinuteHandView setColor:v8];
    uint64_t v9 = [v4 showsShadows] ^ 1;
    double v10 = [(NTKChronoHandsView *)self minuteHandView];
    [v10 setShadowsHidden:v9];

    double v11 = [(NTKChronoHandsView *)self hourHandView];
    [v11 setShadowsHidden:v9];

    double v12 = [(NTKChronoHandsView *)self chronoSecondHandView];
    [v12 setShadowsHidden:v9];

    id v13 = [(NTKChronoHandsView *)self chronoFlybackSecondHandView];
    [v13 setShadowsHidden:v9];

    id v14 = [(NTKChronoHandsView *)self chronoSecondHandView];
    v15 = [v4 backgroundColor];
    [v14 setHandDotColor:v15];

    id v16 = [(NTKChronoHandsView *)self chronoFlybackSecondHandView];
    float v17 = [v4 backgroundColor];
    [v16 setHandDotColor:v17];

    double v18 = [v4 inlayColor];

    [(NTKChronoHandsView *)self setInlayColor:v18];
  }
}

- (BOOL)_stopwatchIsRunning
{
  return 0;
}

- (BOOL)_stopwatchIsStopped
{
  return 1;
}

- (double)_stopwatchCurrentTime
{
  return 0.0;
}

- (double)_stopwatchCurrentLapTime
{
  return 0.0;
}

- (int64_t)_stopwatchLapCount
{
  return 0;
}

- (void)_enumerateChronoHandViews:(id)a3
{
  id v4 = a3;
  [(NTKChronoHandsView *)self _enumeratePrimaryChronoHands:v4];
  [(NTKChronoHandsView *)self _enumerateFlybackChronoHands:v4];
}

- (void)_enumeratePrimaryChronoHands:(id)a3
{
  id v4 = (void (**)(id, NTKHandView *))((char *)a3 + 16);
  BOOL v5 = (void (*)(void))*((void *)a3 + 2);
  id v6 = a3;
  v5();
  (*v4)(v6, self->_chronoMinuteHandView);
}

- (void)_enumerateFlybackChronoHands:(id)a3
{
  id v4 = (void (**)(id, NTKHandView *))((char *)a3 + 16);
  BOOL v5 = (void (*)(void))*((void *)a3 + 2);
  id v6 = a3;
  v5();
  (*v4)(v6, self->_chronoFlybackMinuteHandView);
}

- (float)zRotationForTime:(double)a3 withDuration:(float)a4
{
  return fmod(a3, a4) * 6.28318531 / a4;
}

- (double)chronoDuration
{
  unint64_t timeScale = self->_timeScale;
  double result = 0.0;
  if (timeScale <= 3) {
    return dbl_16CA0[timeScale];
  }
  return result;
}

- (double)upperDuration
{
  unint64_t timeScale = self->_timeScale;
  double result = 0.0;
  if (timeScale <= 3) {
    return dbl_16CC0[timeScale];
  }
  return result;
}

- (double)secondsAnimationFPS
{
  unint64_t timeScale = self->_timeScale;
  double result = 0.0;
  if (timeScale <= 3) {
    return dbl_16CE0[timeScale];
  }
  return result;
}

- (unint64_t)timeScale
{
  return self->_timeScale;
}

- (void)setTimeScale:(unint64_t)a3
{
  self->_unint64_t timeScale = a3;
}

- (NTKChronoPalette)palette
{
  return self->_palette;
}

- (NTKHandView)chronoSecondHandView
{
  return self->_chronoSecondHandView;
}

- (NTKHandView)chronoFlybackSecondHandView
{
  return self->_chronoFlybackSecondHandView;
}

- (NTKHandView)chronoMinuteHandView
{
  return self->_chronoMinuteHandView;
}

- (NTKHandView)chronoFlybackMinuteHandView
{
  return self->_chronoFlybackMinuteHandView;
}

- (BOOL)minuteHandUsesManualTime
{
  return self->_minuteHandUsesManualTime;
}

- (CGPoint)upperDialCenter
{
  double x = self->_upperDialCenter.x;
  double y = self->_upperDialCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setUpperDialCenter:(CGPoint)a3
{
  self->_upperDialCenter = a3;
}

- (CGPoint)lowerDialCenter
{
  double x = self->_lowerDialCenter.x;
  double y = self->_lowerDialCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLowerDialCenter:(CGPoint)a3
{
  self->_lowerDialCenter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chronoFlybackMinuteHandView, 0);
  objc_storeStrong((id *)&self->_chronoMinuteHandView, 0);
  objc_storeStrong((id *)&self->_chronoFlybackSecondHandView, 0);

  objc_storeStrong((id *)&self->_chronoSecondHandView, 0);
}

@end