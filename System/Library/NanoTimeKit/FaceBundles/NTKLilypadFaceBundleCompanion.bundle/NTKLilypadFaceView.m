@interface NTKLilypadFaceView
- (BOOL)_wantsStatusBarIconShadow;
- (NTKLilypadFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_activeClearColorForCurrentColorMode;
- (double)_complicationAlphaForEditMode:(int64_t)a3;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (void)_applyDataMode;
- (void)_applyFrozen;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_loadSnapshotContentViews;
- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)_startClockTimer;
- (void)_stopClockTimer;
- (void)_timeUpdated:(CLKClockTimerDate *)a3;
- (void)_unloadSnapshotContentViews;
- (void)_updateClearColorAndColorMode;
- (void)_updateLocale;
- (void)_updatePausedState;
- (void)_updateTime;
- (void)cleanupAfterEditing;
- (void)layoutSubviews;
- (void)prepareForEditing;
- (void)screenWillTurnOnAnimated:(BOOL)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
@end

@implementation NTKLilypadFaceView

- (NTKLilypadFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)NTKLilypadFaceView;
  v5 = [(NTKLilypadFaceView *)&v9 initWithFaceStyle:a3 forDevice:a4 clientIdentifier:a5];
  v6 = v5;
  if (v5)
  {
    v5->_isPaused = 1;
    v5->_tritiumProgress = 1.0;
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v6 selector:"_updateLocale" name:NSCurrentLocaleDidChangeNotification object:0];

    [(NTKLilypadFaceView *)v6 _updateLocale];
  }
  return v6;
}

- (BOOL)_wantsStatusBarIconShadow
{
  return 1;
}

- (void)_updateLocale
{
  id v4 = +[NSLocale currentLocale];
  uint64_t v3 = CLKLocaleIs24HourMode();
  self->_is24HourMode = v3;
  [(NTKLilypadQuad *)self->_quad setIs24hour:v3];
}

- (void)prepareForEditing
{
  v3.receiver = self;
  v3.super_class = (Class)NTKLilypadFaceView;
  [(NTKLilypadFaceView *)&v3 prepareForEditing];
  [(NTKLilypadFaceView *)self _updatePausedState];
}

- (void)cleanupAfterEditing
{
  v3.receiver = self;
  v3.super_class = (Class)NTKLilypadFaceView;
  [(NTKLilypadFaceView *)&v3 cleanupAfterEditing];
  [(NTKLilypadFaceView *)self _updatePausedState];
}

- (void)_applyFrozen
{
  v3.receiver = self;
  v3.super_class = (Class)NTKLilypadFaceView;
  [(NTKLilypadFaceView *)&v3 _applyFrozen];
  [(NTKLilypadFaceView *)self _updatePausedState];
}

- (void)_applyDataMode
{
  v5.receiver = self;
  v5.super_class = (Class)NTKLilypadFaceView;
  [(NTKLilypadFaceView *)&v5 _applyDataMode];
  unint64_t v3 = (unint64_t)[(NTKLilypadFaceView *)self dataMode];
  if (v3 <= 5)
  {
    LODWORD(v4) = dword_9578[v3];
    [(NTKLilypadQuad *)self->_quad setMotionSuppressed:v4];
  }
  [(NTKLilypadFaceView *)self _updatePausedState];
}

- (void)_updatePausedState
{
  unint64_t v3 = (unint64_t)[(NTKLilypadFaceView *)self dataMode];
  unsigned int v4 = [(NTKLilypadFaceView *)self editing];
  BOOL v5 = (v3 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  LODWORD(v3) = [(NTKLilypadFaceView *)self isFrozen];
  int v6 = v5 & ~v3 & NTKIsScreenOn() | v4;
  if (v6 == 1)
  {
    if (!self->_isPaused) {
      return;
    }
    self->_isPaused = 0;
    [(NTKLilypadFaceView *)self _startClockTimer];
  }
  else
  {
    if (self->_isPaused) {
      return;
    }
    self->_isPaused = 1;
    [(NTKLilypadFaceView *)self _stopClockTimer];
  }
  quadView = self->_quadView;

  [(CLKUIMetalQuadView *)quadView setPaused:v6 ^ 1u];
}

- (void)_startClockTimer
{
  objc_initWeak(&location, self);
  unint64_t v3 = +[CLKClockTimer sharedInstance];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_31B8;
  v6[3] = &unk_C408;
  objc_copyWeak(&v7, &location);
  unsigned int v4 = [v3 startUpdatesWithUpdateFrequency:4 withHandler:v6 identificationLog:&stru_C448];
  clockTimerToken = self->_clockTimerToken;
  self->_clockTimerToken = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_stopClockTimer
{
  unint64_t v3 = +[CLKClockTimer sharedInstance];
  [v3 stopUpdatesForToken:self->_clockTimerToken];

  clockTimerToken = self->_clockTimerToken;
  self->_clockTimerToken = 0;
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  int v6 = (NSDate *)a3;
  v8.receiver = self;
  v8.super_class = (Class)NTKLilypadFaceView;
  [(NTKLilypadFaceView *)&v8 setOverrideDate:v6 duration:a4];
  overrideDate = self->_overrideDate;
  self->_overrideDate = v6;

  [(NTKLilypadFaceView *)self _updateTime];
}

- (void)_timeUpdated:(CLKClockTimerDate *)a3
{
  p_currentDate = &self->_currentDate;
  objc_storeStrong((id *)&self->_currentDate.now, a3->now);
  long long v6 = *(_OWORD *)&a3->hour;
  *(_OWORD *)&p_currentDate->second = *(_OWORD *)&a3->second;
  *(_OWORD *)&p_currentDate->hour = v6;
  [(NTKLilypadFaceView *)self _updateTime];
  now = a3->now;
}

- (void)_updateTime
{
  if (self->_overrideDate)
  {
    CLKClockTimerDateForDate();
    v2 = (NSDate *)v31;
    LODWORD(hour) = v32;
    LODWORD(minute) = v34;
    unint64_t second = v35;
    subunint64_t second = v36;
    goto LABEL_9;
  }
  p_currentDate = &self->_currentDate;
  now = self->_currentDate.now;
  objc_super v9 = +[NTKTimeOffsetManager sharedManager];
  v10 = v9;
  if (!now)
  {
    uint64_t v13 = [v9 faceDisplayTime];
    goto LABEL_7;
  }
  [v9 timeOffset];
  double v12 = v11;

  if (v12 > 0.0)
  {
    v10 = +[NTKTimeOffsetManager sharedManager];
    uint64_t v13 = [v10 displayTimeForRealTime:p_currentDate->now];
LABEL_7:
    v14 = (void *)v13;

    CLKClockTimerDateForDate();
    v2 = (NSDate *)v31;
    LODWORD(hour) = v32;
    LODWORD(minute) = v34;
    unint64_t second = v35;
    subunint64_t second = v36;

    goto LABEL_9;
  }
  v2 = p_currentDate->now;
  unint64_t hour = p_currentDate->hour;
  unint64_t minute = p_currentDate->minute;
  unint64_t second = p_currentDate->second;
  subunint64_t second = p_currentDate->subsecond;
LABEL_9:
  if (second == 59)
  {
    v15 = +[NSCalendar currentCalendar];
    v16 = [v15 components:128 fromDate:v2];
    [v16 setSecond:0];
    v17 = +[NSCalendar currentCalendar];
    v18 = [v17 nextDateAfterDate:v2 matchingComponents:v16 options:1024];
    unsigned int v19 = minute;
    unsigned int v20 = hour;

    CLKClockTimerDateForDate();
    v21 = (NSDate *)v31;
    LODWORD(hour) = v32;
    LODWORD(minute) = v34;

    float v22 = subsecond;
    double v23 = v22;
  }
  else
  {
    v21 = v2;
    double v23 = 0.0;
    unsigned int v19 = minute;
    unsigned int v20 = hour;
  }
  double v24 = pow(v23, 3.0);
  if (self->_is24HourMode)
  {
    v25 = v2;
  }
  else
  {
    v30 = v2;
    CLKClockTimerDateConvertTo12Hour();
    v25 = (void *)v31;

    unsigned int v20 = v32;
    unsigned int v19 = v34;
    v29 = v21;
    CLKClockTimerDateConvertTo12Hour();
    v21 = 0;
    unint64_t v31 = 0;

    LODWORD(hour) = v32;
    LODWORD(minute) = v34;
  }
  quad = self->_quad;
  float v27 = v24 * -2.0 + v23 * v23 * 3.0;
  unint64_t v31 = __PAIR64__(v19, v20);
  unsigned int v32 = hour;
  int v33 = minute;
  *(float *)&uint64_t v34 = v27;
  [(NTKLilypadQuad *)quad setTime:&v31];
}

- (double)_activeClearColorForCurrentColorMode
{
  *(float *)&a2 = 1.0 - *(float *)(a1 + 96);
  *(void *)&double result = vdupq_lane_s32(*(int32x2_t *)&a2, 0).u64[0];
  return result;
}

- (void)_loadSnapshotContentViews
{
  v32.receiver = self;
  v32.super_class = (Class)NTKLilypadFaceView;
  [(NTKLilypadFaceView *)&v32 _loadSnapshotContentViews];
  unint64_t v3 = +[UIColor blackColor];
  [(NTKLilypadFaceView *)self setBackgroundColor:v3];

  unsigned int v4 = [(NTKLilypadFaceView *)self device];
  [v4 screenBounds];
  +[CLKUIQuadView quadViewWithFrame:identifier:options:colorSpace:](CLKUIQuadView, "quadViewWithFrame:identifier:options:colorSpace:", @"Lily", 0, 0);
  BOOL v5 = (CLKUIMetalQuadView *)objc_claimAutoreleasedReturnValue();
  quadView = self->_quadView;
  self->_quadView = v5;

  [(NTKLilypadFaceView *)self _activeClearColorForCurrentColorMode];
  -[CLKUIMetalQuadView setClearColor:](self->_quadView, "setClearColor:", v10, v7, v8, v9);
  double v11 = [NTKLilypadQuad alloc];
  double v12 = [(NTKLilypadFaceView *)self device];
  uint64_t v13 = [(NTKLilypadQuad *)v11 initWithDevice:v12];
  quad = self->_quad;
  self->_quad = v13;

  [(CLKUIMetalQuadView *)self->_quadView addQuad:self->_quad];
  [(CLKUIMetalQuadView *)self->_quadView setOpaque:1];
  [(NTKLilypadQuad *)self->_quad setIs24hour:self->_is24HourMode];
  v15 = [(NTKLilypadFaceView *)self contentView];
  [v15 addSubview:self->_quadView];

  [(CLKUIMetalQuadView *)self->_quadView setPreferredFramesPerSecond:60];
  [(CLKUIMetalQuadView *)self->_quadView setPaused:1];
  v16 = self->_quad;
  [(NTKLilypadFaceView *)self _activeClearColorForCurrentColorMode];
  -[NTKLilypadQuad setColorMode:](v16, "setColorMode:");
  id v17 = objc_alloc((Class)NTKRoundedCornerOverlayView);
  v18 = [(NTKLilypadFaceView *)self contentView];
  [v18 bounds];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  float v27 = [(NTKLilypadFaceView *)self device];
  v28 = (NTKRoundedCornerOverlayView *)objc_msgSend(v17, "initWithFrame:forDeviceCornerRadius:", v27, v20, v22, v24, v26);
  cornerOverlayView = self->_cornerOverlayView;
  self->_cornerOverlayView = v28;

  v30 = [(NTKLilypadFaceView *)self contentView];
  [v30 addSubview:self->_cornerOverlayView];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self->_quadView, (CFNotificationCallback)sub_396C, @"com.apple.nanotimekit.lilypad.screenshot", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  [(NTKLilypadFaceView *)self setNeedsLayout];
}

- (void)_unloadSnapshotContentViews
{
  v5.receiver = self;
  v5.super_class = (Class)NTKLilypadFaceView;
  [(NTKLilypadFaceView *)&v5 _unloadSnapshotContentViews];
  [(CLKUIMetalQuadView *)self->_quadView removeFromSuperview];
  quadView = self->_quadView;
  self->_quadView = 0;

  [(NTKRoundedCornerOverlayView *)self->_cornerOverlayView removeFromSuperview];
  cornerOverlayView = self->_cornerOverlayView;
  self->_cornerOverlayView = 0;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKLilypadFaceView;
  [(NTKLilypadFaceView *)&v3 layoutSubviews];
  [(NTKLilypadFaceView *)self bounds];
  -[CLKUIMetalQuadView setFrame:](self->_quadView, "setFrame:");
}

- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  BOOL v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKLilypadFaceView;
  id v6 = a4;
  [(NTKLilypadFaceView *)&v7 _renderSynchronouslyWithImageQueueDiscard:v4 inGroup:v6];
  -[CLKUIMetalQuadView renderSynchronouslyWithImageQueueDiscard:inGroup:](self->_quadView, "renderSynchronouslyWithImageQueueDiscard:inGroup:", v4, v6, v7.receiver, v7.super_class);
}

- (void)_updateClearColorAndColorMode
{
  [(NTKLilypadFaceView *)self _activeClearColorForCurrentColorMode];
  float32x4_t v5 = vmulq_n_f32(v3, self->_tritiumProgress);
  -[CLKUIMetalQuadView setClearColor:](self->_quadView, "setClearColor:", v5.f32[0], v5.f32[1], v5.f32[2], 1.0);
  quad = self->_quad;

  [(NTKLilypadQuad *)quad setColorMode:*(double *)v5.i64];
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  if (a4 == 15)
  {
    LODWORD(self->_activeColorMode) = dword_9570[[a3 backgroundStyle] == 0];
    [(NTKLilypadFaceView *)self _updateClearColorAndColorMode];
  }
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  if (a6 == 15)
  {
    id v10 = a5;
    [a4 backgroundStyle];
    [v10 backgroundStyle];

    CLKInterpolateBetweenFloatsUnclipped();
    *(float *)&double v11 = v11;
    self->_activeColorMode = *(float *)&v11;
    [(NTKLilypadFaceView *)self _updateClearColorAndColorMode];
  }
}

- (double)_complicationAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if ((unint64_t)a3 < 2) {
    return 1.0;
  }
  return result;
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  id v8 = [(NTKLilypadFaceView *)self complicationContainerView];
  [(NTKLilypadFaceView *)self _complicationAlphaForEditMode:a4];
  [(NTKLilypadFaceView *)self _complicationAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v8, "setAlpha:");
}

- (void)screenWillTurnOnAnimated:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKLilypadFaceView;
  [(NTKLilypadFaceView *)&v4 screenWillTurnOnAnimated:a3];
  [(NTKLilypadQuad *)self->_quad resetStartTime];
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4 == 15)
  {
    if (qword_11318 != -1) {
      dispatch_once(&qword_11318, &stru_C488);
    }
    id v10 = v8;
    double v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 backgroundStyle]);
    double v12 = +[NSString stringWithFormat:@"%@", v11];

    uint64_t v13 = [(id)qword_11310 objectForKey:v12];
    if (!v13)
    {
      v14 = [NTKLilypadFaceView alloc];
      v15 = [(NTKLilypadFaceView *)self device];
      v16 = [(NTKLilypadFaceView *)v14 initWithFaceStyle:44 forDevice:v15 clientIdentifier:0];

      [(NTKLilypadFaceView *)self bounds];
      objc_msgSend(v16, "setFrame:");
      [v16 _loadSnapshotContentViews];
      [v16 setOption:v10 forCustomEditMode:15 slot:0];
      id v17 = NTKIdealizedDate();
      [v16 setOverrideDate:v17 duration:0.0];

      +[NTKEditOption sizeForSwatchStyle:](NTKEditOption, "sizeForSwatchStyle:", [v10 swatchStyle]);
      double v19 = v18;
      double v21 = v20;
      [(NTKLilypadFaceView *)self bounds];
      CGFloat v22 = CGRectGetHeight(v29) / v21;
      double v23 = [(NTKLilypadFaceView *)self device];
      [v23 screenScale];
      CGFloat v25 = v22 * v24;

      uint64_t v13 = objc_msgSend(v16[1], "snapshotInRect:scale:time:", 0.0, 0.0, v19, v21, v25, 0.0);
      [(id)qword_11310 setObject:v13 forKey:v12];
    }
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)NTKLilypadFaceView;
    uint64_t v13 = [(NTKLilypadFaceView *)&v27 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:v9];
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_clockTimerToken, 0);
  objc_storeStrong((id *)&self->_cornerOverlayView, 0);
  objc_storeStrong((id *)&self->_quad, 0);

  objc_storeStrong((id *)&self->_quadView, 0);
}

@end