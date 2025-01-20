@interface NTKParameciumFaceView
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
- (BOOL)_applyRoundedCornerOverlay;
- (BOOL)_needsForegroundContainerView;
- (NTKParameciumFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_backgroundAlphaForEditMode:(int64_t)a3;
- (double)_complicationAlphaForEditMode:(int64_t)a3;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyDataMode;
- (void)_applyFrozen;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_cleanupAfterTransitionComplicationSlot:(id)a3 selectedComplication:(id)a4;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_finalizeForSnapshotting:(id)a3;
- (void)_loadLayoutRules;
- (void)_loadSnapshotContentViews;
- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)_significantTimeChanged;
- (void)_unloadSnapshotContentViews;
- (void)_updateBackgroundAndPlatterAlpha:(double)a3;
- (void)_updateComplicationCenterOffsetForStyle:(unint64_t)a3;
- (void)_updateConfettiRotationRate;
- (void)_updatePausedState;
- (void)cleanupAfterEditing;
- (void)layoutSubviews;
- (void)prepareForEditing;
- (void)screenDidTurnOffAnimated:(BOOL)a3;
- (void)screenWillTurnOnAnimated:(BOOL)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)updateTime:(CLKClockTimerDate *)a3;
@end

@implementation NTKParameciumFaceView

- (NTKParameciumFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v9 = a4;
  v25.receiver = self;
  v25.super_class = (Class)NTKParameciumFaceView;
  v10 = [(NTKParameciumFaceView *)&v25 initWithFaceStyle:a3 forDevice:v9 clientIdentifier:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_device, a4);
    v11->_isPaused = 1;
    v11->_tritiumProgress = 1.0;
    v11->_confettiRotationRate = 0.0;
    v11->_forSwatchRendering = 0;
    v11->_snapshotContentViewsLoaded = 0;
    v12 = +[UIColor colorWithRed:0.537 green:0.573 blue:0.6 alpha:1.0];
    [(NTKParameciumFaceView *)v11 setComplicationColor:v12];
    [(NTKParameciumFaceView *)v11 setAlternateComplicationColor:v12];
    [(NTKParameciumFaceView *)v11 setInterpolatedComplicationColor:v12];
    v13 = +[UIColor blackColor];
    [(NTKParameciumFaceView *)v11 setComplicationBackgroundColor:v13];

    id v14 = objc_alloc_init((Class)NTKCompositeComplicationFactory);
    id v15 = [objc_alloc((Class)NTKWhistlerAnalogFaceViewComplicationFactory) initForDevice:v9];
    [v15 setAlpha:v11 faceView:1.0];
    v26[0] = NTKComplicationSlotTopLeft;
    v26[1] = NTKComplicationSlotTopRight;
    v26[2] = NTKComplicationSlotBottomLeft;
    v26[3] = NTKComplicationSlotBottomRight;
    v16 = +[NSArray arrayWithObjects:v26 count:4];
    [v14 registerFactory:v15 forSlots:v16];

    cornerFactory = v11->_cornerFactory;
    v11->_cornerFactory = (NTKWhistlerAnalogFaceViewComplicationFactory *)v15;
    id v18 = v15;

    id v19 = objc_alloc_init((Class)NTKSimpleTextFaceViewComplicationFactory);
    [v19 setFaceView:v11];
    v20 = [(NTKParameciumFaceView *)v11 device];
    [v19 setVerticalCenterOffset:sub_24E8(v20)];

    [v14 registerFactory:v19 forSlot:NTKComplicationSlotSubdialTop];
    subdialFactory = v11->_subdialFactory;
    v11->_subdialFactory = (NTKSimpleTextFaceViewComplicationFactory *)v19;
    id v22 = v19;

    [(NTKParameciumFaceView *)v11 setComplicationFactory:v14];
    v23 = +[NSNotificationCenter defaultCenter];
    [v23 addObserver:v11 selector:"_significantTimeChanged" name:UIApplicationSignificantTimeChangeNotification object:0];
  }
  return v11;
}

- (void)_loadSnapshotContentViews
{
  v14.receiver = self;
  v14.super_class = (Class)NTKParameciumFaceView;
  [(NTKParameciumFaceView *)&v14 _loadSnapshotContentViews];
  self->_snapshotContentViewsLoaded = 1;
  if (self->_forSwatchRendering) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 4;
  }
  [(CLKDevice *)self->_device screenBounds];
  +[CLKUIMetalQuadView quadViewWithFrame:identifier:options:colorSpace:](CLKUIMetalQuadView, "quadViewWithFrame:identifier:options:colorSpace:", @"QARK", 352, v3);
  v4 = (CLKUIMetalQuadView *)objc_claimAutoreleasedReturnValue();
  quadView = self->_quadView;
  self->_quadView = v4;

  [(CLKUIMetalQuadView *)self->_quadView setDelegate:self];
  [(CLKUIMetalQuadView *)self->_quadView setUserInteractionEnabled:0];
  [(CLKUIMetalQuadView *)self->_quadView setOpaque:0];
  v6 = [[NTKParameciumCompositeQuad alloc] initWithDevice:self->_device];
  compositeQuad = self->_compositeQuad;
  self->_compositeQuad = v6;

  [(CLKUIMetalQuadView *)self->_quadView addQuad:self->_compositeQuad];
  [(NTKParameciumCompositeQuad *)self->_compositeQuad setConfettiEntropy:1.0];
  v8 = [(NTKParameciumFaceView *)self contentView];
  [v8 addSubview:self->_quadView];

  [(NTKParameciumFaceView *)self bounds];
  -[CLKUIMetalQuadView setFrame:](self->_quadView, "setFrame:");
  [(CLKUIMetalQuadView *)self->_quadView setPreferredFramesPerSecond:60];
  id v9 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 2.0, 2.0);
  pin = self->_pin;
  self->_pin = v9;

  v11 = +[UIColor blackColor];
  [(UIView *)self->_pin setBackgroundColor:v11];

  v12 = [(UIView *)self->_pin layer];
  [v12 setCornerRadius:1.0];

  v13 = [(NTKParameciumFaceView *)self contentView];
  [v13 addSubview:self->_pin];

  [(NTKParameciumFaceView *)self _updatePausedState];
  [(NTKParameciumFaceView *)self _updateBackgroundAndPlatterAlpha:1.0];
}

- (void)_unloadSnapshotContentViews
{
  v5.receiver = self;
  v5.super_class = (Class)NTKParameciumFaceView;
  [(NTKParameciumFaceView *)&v5 _unloadSnapshotContentViews];
  self->_snapshotContentViewsLoaded = 0;
  [(CLKUIMetalQuadView *)self->_quadView removeFromSuperview];
  quadView = self->_quadView;
  self->_quadView = 0;

  [(UIView *)self->_pin removeFromSuperview];
  pin = self->_pin;
  self->_pin = 0;

  [(NTKParameciumFaceView *)self _updateBackgroundAndPlatterAlpha:1.0];
}

- (BOOL)_needsForegroundContainerView
{
  return 1;
}

- (BOOL)_applyRoundedCornerOverlay
{
  return 1;
}

- (void)prepareForEditing
{
  v3.receiver = self;
  v3.super_class = (Class)NTKParameciumFaceView;
  [(NTKParameciumFaceView *)&v3 prepareForEditing];
  [(NTKParameciumFaceView *)self _updatePausedState];
}

- (void)cleanupAfterEditing
{
  v3.receiver = self;
  v3.super_class = (Class)NTKParameciumFaceView;
  [(NTKParameciumFaceView *)&v3 cleanupAfterEditing];
  [(NTKParameciumFaceView *)self _updatePausedState];
}

- (void)_applyFrozen
{
  v3.receiver = self;
  v3.super_class = (Class)NTKParameciumFaceView;
  [(NTKParameciumFaceView *)&v3 _applyFrozen];
  [(NTKParameciumFaceView *)self _updatePausedState];
}

- (void)_applyDataMode
{
  v3.receiver = self;
  v3.super_class = (Class)NTKParameciumFaceView;
  [(NTKParameciumFaceView *)&v3 _applyDataMode];
  [(NTKParameciumFaceView *)self _updatePausedState];
  [(NTKParameciumFaceView *)self _updateConfettiRotationRate];
  if ([(NTKParameciumFaceView *)self dataMode] == (char *)&dword_0 + 3) {
    [(NTKParameciumCompositeQuad *)self->_compositeQuad setConfettiRotation:0.0];
  }
}

- (void)_updatePausedState
{
  unint64_t v3 = (unint64_t)[(NTKParameciumFaceView *)self dataMode];
  unsigned int v4 = [(NTKParameciumFaceView *)self editing];
  BOOL v5 = (v3 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  LODWORD(v3) = [(NTKParameciumFaceView *)self isFrozen];
  if ((v5 & ~v3 & NTKIsScreenOn() & 1) != 0 || v4)
  {
    if (self->_isPaused)
    {
      self->_isPaused = 0;
      [(CLKUIMetalQuadView *)self->_quadView setPaused:0];
      objc_initWeak(&location, self);
      v7 = +[CLKClockTimer sharedInstance];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_2BA4;
      v10[3] = &unk_10500;
      objc_copyWeak(&v11, &location);
      v8 = [v7 startUpdatesWithUpdateFrequency:3 withHandler:v10 identificationLog:&stru_10540];
      clockTimerToken = self->_clockTimerToken;
      self->_clockTimerToken = v8;

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
  else if (!self->_isPaused)
  {
    self->_isPaused = 1;
    [(CLKUIMetalQuadView *)self->_quadView setPaused:1];
    v6 = self->_clockTimerToken;
    self->_clockTimerToken = 0;
  }
}

- (void)_significantTimeChanged
{
}

- (void)_updateConfettiRotationRate
{
  unint64_t v3 = (char *)[(NTKParameciumFaceView *)self dataMode];
  unsigned int v4 = [(NTKParameciumFaceView *)self optionForCustomEditMode:12 slot:0];
  BOOL v5 = (char *)[v4 style];

  BOOL v6 = v5 == (unsigned char *)&dword_0 + 2 && v3 == (unsigned char *)&dword_0 + 1;
  double v7 = 0.00174532925;
  if (!v6) {
    double v7 = 0.0;
  }
  self->_confettiRotationRate = v7;
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  BOOL v6 = (NSDate *)a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKParameciumFaceView;
  [(NTKParameciumFaceView *)&v10 setOverrideDate:v6 duration:a4];
  overrideDate = self->_overrideDate;
  self->_overrideDate = v6;
  v8 = v6;

  CLKClockTimerDateForDate();
  [(NTKParameciumFaceView *)self updateTime:v9];
}

- (void)updateTime:(CLKClockTimerDate *)a3
{
  if (self->_overrideDate)
  {
    CLKClockTimerDateForDate();
    id v5 = v12;
  }
  else
  {
    if (a3->var0)
    {
      BOOL v6 = +[NTKTimeOffsetManager sharedManager];
      [v6 timeOffset];
      double v8 = v7;

      if (v8 <= 0.0)
      {
        id v5 = a3->var0;
        goto LABEL_9;
      }
      id v9 = +[NTKTimeOffsetManager sharedManager];
      objc_super v10 = [v9 displayTimeForRealTime:a3->var0];

      CLKClockTimerDateForDate();
    }
    else
    {
      id v11 = +[NTKTimeOffsetManager sharedManager];
      objc_super v10 = [v11 faceDisplayTime];

      CLKClockTimerDateForDate();
    }
    id v5 = v12;
  }
LABEL_9:
  [(NTKParameciumCompositeQuad *)self->_compositeQuad setToDate:v5];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)NTKParameciumFaceView;
  [(NTKParameciumFaceView *)&v5 layoutSubviews];
  [(NTKParameciumFaceView *)self bounds];
  -[CLKUIMetalQuadView setFrame:](self->_quadView, "setFrame:");
  [(CLKDevice *)self->_device screenBounds];
  -[UIView setCenter:](self->_pin, "setCenter:", v3 * 0.5, v4 * 0.5);
}

- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  BOOL v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKParameciumFaceView;
  id v6 = a4;
  [(NTKParameciumFaceView *)&v7 _renderSynchronouslyWithImageQueueDiscard:v4 inGroup:v6];
  -[CLKUIMetalQuadView renderSynchronouslyWithImageQueueDiscard:inGroup:](self->_quadView, "renderSynchronouslyWithImageQueueDiscard:inGroup:", v4, v6, v7.receiver, v7.super_class);
}

- (void)_updateBackgroundAndPlatterAlpha:(double)a3
{
  if (self->_snapshotContentViewsLoaded)
  {
    float v4 = (float)((float)(self->_tritiumProgress + -1.0) + 1.0) * 0.992156863 * (float)(1.0 - self->_backgroundOn) * a3;
    id v9 = +[UIColor colorWithRed:v4 green:v4 blue:v4 alpha:1.0];
    objc_super v5 = [(NTKParameciumFaceView *)self rootContainerView];
    [v5 setBackgroundColor:v9];

    id v6 = [(NTKParameciumFaceView *)self complicationBackgroundColor];
    unsigned __int8 v7 = [v6 isEqual:v9];

    if ((v7 & 1) == 0)
    {
      [(NTKParameciumFaceView *)self setComplicationBackgroundColor:v9];
      [(NTKParameciumFaceView *)self enumerateComplicationDisplayWrappersWithBlock:&stru_10580];
    }
  }
  else
  {
    id v9 = +[UIColor clearColor];
    double v8 = [(NTKParameciumFaceView *)self rootContainerView];
    [v8 setBackgroundColor:v9];
  }
}

- (void)_updateComplicationCenterOffsetForStyle:(unint64_t)a3
{
  objc_super v5 = [(NTKParameciumFaceView *)self device];
  double v6 = sub_24E8(v5);
  double v8 = v7;

  if (a3 == 2) {
    double v6 = v8;
  }
  id v10 = [(NTKParameciumFaceView *)self complicationFactory];
  id v9 = [v10 factoryAtSlot:NTKComplicationSlotSubdialTop];
  [v9 verticalCenterOffset];
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    [v9 setVerticalCenterOffset:v6];
    [(NTKParameciumFaceView *)self invalidateComplicationLayout];
    [(NTKParameciumFaceView *)self layoutIfNeeded];
    [(NTKParameciumFaceView *)self layoutComplicationViews];
  }
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  if (a4 == 12)
  {
    uint64_t v10 = (int)[v12 style];
    [(NTKParameciumCompositeQuad *)self->_compositeQuad setTickShadows:0.0];
    [(NTKParameciumCompositeQuad *)self->_compositeQuad setShowsTicks:flt_BC18[v10]];
    float v11 = flt_BC30[v10];
    [(NTKParameciumCompositeQuad *)self->_compositeQuad setShowsConfetti:v11];
    [(NTKParameciumCompositeQuad *)self->_compositeQuad setShowsNumbers:flt_BC24[v10]];
    self->_simpleProgress = v11;
    [(NTKParameciumCompositeQuad *)self->_compositeQuad setConfettiRotation:0.0];
    [(NTKParameciumFaceView *)self _updateConfettiRotationRate];
    [(NTKParameciumFaceView *)self _updateComplicationCenterOffsetForStyle:v10];
  }
  else if (a4 == 15)
  {
    float v9 = flt_BC10[(void)[v12 background]];
    self->_backgroundOn = v9;
    [(NTKParameciumCompositeQuad *)self->_compositeQuad setBackgroundOn:v9];
    if (self->_forSwatchRendering) {
      -[CLKUIMetalQuadView setClearColor:](self->_quadView, "setClearColor:", (float)(1.0 - self->_backgroundOn), (float)(1.0 - self->_backgroundOn), (float)(1.0 - self->_backgroundOn), 1.0);
    }
  }
  [(NTKParameciumFaceView *)self _updateBackgroundAndPlatterAlpha:1.0];
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = v14;
  if (a6 == 12)
  {
    id v33 = v14;
    id v17 = [v12 style];
    id v18 = [v13 style];
    int v19 = (int)v18;
    uint64_t v20 = (void)v18 << 32;
    CLKInterpolateBetweenFloatsUnclipped();
    -[NTKParameciumCompositeQuad setTickShadows:](self->_compositeQuad, "setTickShadows:");
    CLKInterpolateBetweenFloatsUnclipped();
    *(float *)&double v21 = v21;
    self->_simpleProgress = *(float *)&v21;
    CLKInterpolateBetweenFloatsUnclipped();
    -[NTKParameciumCompositeQuad setShowsNumbers:](self->_compositeQuad, "setShowsNumbers:");
    uint64_t v22 = v20;
    uint64_t v23 = (void)v17 << 32;
    CLKInterpolateBetweenFloatsUnclipped();
    float v25 = v24;
    CLKInterpolateBetweenFloatsUnclipped();
    float v27 = v26;
    if ((void)v17 << 32 == 0x100000000 && v22 == 0x200000000
      || (void)v17 << 32 == 0x200000000 && v22 == 0x100000000)
    {
      float v25 = floorf(v25);
    }
    [(NTKParameciumCompositeQuad *)self->_compositeQuad setShowsTicks:v25];
    [(NTKParameciumCompositeQuad *)self->_compositeQuad setShowsConfetti:v27];
    [(NTKParameciumCompositeQuad *)self->_compositeQuad setConfettiRotation:0.0];
    if (a3 >= 0.5) {
      id v17 = (id)v19;
    }
    else {
      id v17 = (id)(int)v17;
    }
    CLKMapFractionIntoRange();
    double v29 = v28;
    id v15 = v33;
    CLKMapFractionIntoRange();
    memset(&v35, 0, sizeof(v35));
    CGAffineTransformMakeScale(&v35, v30, v30);
    [(NTKParameciumFaceView *)self _updateComplicationCenterOffsetForStyle:v17];
    if (v22 == 0x200000000 || v23 == 0x200000000)
    {
      v31 = [(NTKParameciumFaceView *)self normalComplicationDisplayWrapperForSlot:NTKComplicationSlotSubdialTop];
      v32 = [v31 display];

      [v32 setAlpha:v29];
      CGAffineTransform v34 = v35;
      [v32 setTransform:&v34];
    }
    [(NTKParameciumFaceView *)self _updateConfettiRotationRate];
    goto LABEL_16;
  }
  if (a6 == 15)
  {
    [v12 background];
    [v13 background];
    CLKInterpolateBetweenFloatsUnclipped();
    *(float *)&double v16 = v16;
    self->_backgroundOn = *(float *)&v16;
    [(NTKParameciumCompositeQuad *)self->_compositeQuad setBackgroundOn:*(float *)&v16];
LABEL_16:
    [(NTKParameciumFaceView *)self _updateBackgroundAndPlatterAlpha:1.0];
  }
  [(NTKParameciumFaceView *)self _updateBackgroundAndPlatterAlpha:1.0];
}

- (double)_complicationAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if ((unint64_t)a3 < 2) {
    return 1.0;
  }
  return result;
}

- (double)_backgroundAlphaForEditMode:(int64_t)a3
{
  double result = 0.2;
  if (a3 != 1) {
    return 1.0;
  }
  return result;
}

- (void)_cleanupAfterTransitionComplicationSlot:(id)a3 selectedComplication:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)NTKParameciumFaceView;
  [(NTKParameciumFaceView *)&v4 _cleanupAfterTransitionComplicationSlot:a3 selectedComplication:a4];
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v5.receiver = self;
  v5.super_class = (Class)NTKParameciumFaceView;
  [(NTKParameciumFaceView *)&v5 _applyRubberBandingFraction:a4 forCustomEditMode:a5 slot:a3];
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v5.receiver = self;
  v5.super_class = (Class)NTKParameciumFaceView;
  [(NTKParameciumFaceView *)&v5 _applyBreathingFraction:a4 forCustomEditMode:a5 slot:a3];
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  id v8 = [(NTKParameciumFaceView *)self complicationContainerView];
  [(NTKParameciumFaceView *)self _complicationAlphaForEditMode:a4];
  [(NTKParameciumFaceView *)self _complicationAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v8, "setAlpha:");

  [(NTKParameciumFaceView *)self _backgroundAlphaForEditMode:a4];
  [(NTKParameciumFaceView *)self _backgroundAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();

  -[NTKParameciumFaceView _updateBackgroundAndPlatterAlpha:](self, "_updateBackgroundAndPlatterAlpha:");
}

- (void)_loadLayoutRules
{
  v9.receiver = self;
  v9.super_class = (Class)NTKParameciumFaceView;
  [(NTKParameciumFaceView *)&v9 _loadLayoutRules];
  cornerFactory = self->_cornerFactory;
  objc_super v4 = [(NTKParameciumFaceView *)self device];
  [v4 screenBounds];
  double v6 = v5;
  double v7 = [(NTKParameciumFaceView *)self device];
  [v7 screenScale];
  [(NTKWhistlerAnalogFaceViewComplicationFactory *)cornerFactory loadLayoutRulesForFaceView:self dialDiameter:v6 * v8];

  [(NTKSimpleTextFaceViewComplicationFactory *)self->_subdialFactory loadLayoutRules];
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  double v7 = [(NTKParameciumFaceView *)self complicationFactory];
  [v7 configureComplicationView:v12 forSlot:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v12 transitionToMonochromeWithFraction:1.0];
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v12;
    objc_super v9 = [(NTKParameciumFaceView *)self complicationColor];
    uint64_t v10 = [v8 label];

    [v10 setTextColor:v9];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_8;
    }
    id v11 = v12;
    [v11 setShowsSeconds:0];
    objc_super v9 = [(NTKParameciumFaceView *)self complicationColor];
    [v11 setTextColor:v9];
  }
LABEL_8:
}

- (void)_finalizeForSnapshotting:(id)a3
{
}

- (void)screenWillTurnOnAnimated:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NTKParameciumFaceView;
  [(NTKParameciumFaceView *)&v3 screenWillTurnOnAnimated:a3];
}

- (void)screenDidTurnOffAnimated:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKParameciumFaceView;
  [(NTKParameciumFaceView *)&v4 screenDidTurnOffAnimated:a3];
  self->_filteredAccMagnitude = 0.0;
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  objc_super v4 = &off_10F58;
  if (a3 != 15) {
    objc_super v4 = 0;
  }
  if (a3 == 12) {
    return &off_10F40;
  }
  else {
    return v4;
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v12 = 0;
      goto LABEL_15;
    }
  }
  if (qword_16510 != -1) {
    dispatch_once(&qword_16510, &stru_105A0);
  }
  if (a4 == 15)
  {
    id v10 = v8;
    id v11 = [v9 objectForKeyedSubscript:&off_10D48];
  }
  else
  {
    if (a4 != 12)
    {
      id v13 = 0;
      id v10 = 0;
      goto LABEL_12;
    }
    id v10 = [v9 objectForKeyedSubscript:&off_10D30];
    id v11 = v8;
  }
  id v13 = v11;
LABEL_12:
  id v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 background]);
  id v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v13 style]);
  double v16 = +[NSString stringWithFormat:@"%@-%@", v14, v15];

  id v12 = [(id)qword_16508 objectForKey:v16];
  if (!v12)
  {
    id v17 = [NTKParameciumFaceView alloc];
    id v18 = [(NTKParameciumFaceView *)self device];
    int v19 = [(NTKParameciumFaceView *)v17 initWithFaceStyle:44 forDevice:v18 clientIdentifier:0];

    v19->_forSwatchRendering = 1;
    [(NTKParameciumFaceView *)v19 _loadSnapshotContentViews];
    +[NTKEditOption sizeForSwatchStyle:3];
    double v21 = v20;
    double v23 = v22;
    double v24 = +[UIScreen mainScreen];
    [v24 nativeScale];
    double v26 = v25;

    [(NTKParameciumFaceView *)v19 _applyOption:v10 forCustomEditMode:15 slot:0];
    [(NTKParameciumFaceView *)v19 _applyOption:v13 forCustomEditMode:12 slot:0];
    float v27 = NTKIdealizedDate();
    [(NTKParameciumFaceView *)v19 setOverrideDate:v27 duration:0.0];

    id v12 = -[CLKUIMetalQuadView snapshotInRect:scale:time:](v19->_quadView, "snapshotInRect:scale:time:", 0.0, 0.0, v21, v23, v26, 0.0);
    v19->_forSwatchRendering = 0;
    [(id)qword_16508 setObject:v12 forKey:v16];
  }
LABEL_15:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pin, 0);
  objc_storeStrong((id *)&self->_subdialFactory, 0);
  objc_storeStrong((id *)&self->_cornerFactory, 0);
  objc_storeStrong((id *)&self->_clockTimerToken, 0);
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_compositeQuad, 0);

  objc_storeStrong((id *)&self->_quadView, 0);
}

@end