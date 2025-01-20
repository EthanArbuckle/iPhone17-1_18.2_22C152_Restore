@interface NTKSiderealFaceView
+ (id)_prewarmSharedData;
- (BOOL)_canEnterInteractiveMode;
- (BOOL)_handlePhysicalButton:(unint64_t)a3 event:(unint64_t)a4;
- (BOOL)_isDayAnimationRunning;
- (BOOL)_wantsMinorDetents;
- (BOOL)_wheelChangedWithEvent:(id)a3;
- (CGAffineTransform)_timeViewScaleTransform;
- (CGImage)newImageRefFromSolarContainerView:(id)a3 withHeight:(double)a4;
- (CGImage)newImageRefFromView:(id)a3;
- (CGPath)newTimeViewPathForDarkeningView;
- (CGRect)_relativeKeylineFrameForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (CGRect)_timeViewKeylineFrameForEditing;
- (NTKSiderealFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_complicationAlphaForEditMode:(int64_t)a3;
- (double)_darkeningViewAlphaForEditMode:(int64_t)a3;
- (double)_dialAlphaForEditMode:(int64_t)a3;
- (double)_idealizedSolarDayProgress;
- (double)_solarDayProgressForCurrentTime;
- (double)_timeDarkeningViewAlphaForEditMode:(int64_t)a3;
- (double)_timeViewAlphaForEditMode:(int64_t)a3;
- (id)_dayDiscImageFromSolarContainerView:(id)a3;
- (id)_dayDiskBloomImageFromSolarContainerView:(id)a3;
- (id)_dayGnomonImageFromSolarContainerView:(id)a3;
- (id)_dialViewImageRef;
- (id)_faceDisplayTime;
- (id)_gnomonImage;
- (id)_innerComplicationColors;
- (id)_keylineViewForComplicationSlot:(id)a3;
- (id)_keylineViewForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_newGnomonLayer;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)_nightDiscImageFromSolarContainerView:(id)a3;
- (id)_nightGnomonImageFromSolarContainerView:(id)a3;
- (id)_nightRingImageFromSolarContainerView:(id)a3;
- (id)_outerComplicationColors;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)_waypointViewImageRef;
- (id)backgroundColorForView:(id)a3;
- (id)closestWaypointForSolarDayProgress:(double)a3 range:(double)a4;
- (id)colorForView:(id)a3 accented:(BOOL)a4;
- (id)filterForView:(id)a3 style:(int64_t)a4;
- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5;
- (id)filtersForView:(id)a3 style:(int64_t)a4;
- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5;
- (id)waypointBetweenPreviousOffset:(double)a3 currentOffset:(double)a4;
- (int64_t)_complicationPickerStyleForSlot:(id)a3;
- (int64_t)_keylineStyleForComplicationSlot:(id)a3;
- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4;
- (unint64_t)_keylineLabelAlignmentForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (void)_animateSolarDayFromProgress:(double)a3 toProgress:(double)a4 minDuration:(double)a5 completion:(id)a6;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyDataMode;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyScaleToTimeView;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_asyncUpdateLocale;
- (void)_becameActiveFace;
- (void)_becameInactiveFace;
- (void)_buttonPressTimerFired;
- (void)_cleanupAfterEditing;
- (void)_cleanupAfterSettingViewMode:(unint64_t)a3 previousViewMode:(unint64_t)a4;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_disableCrown;
- (void)_enableCrown;
- (void)_forceSolarDayUpdate;
- (void)_handleViewModeTapGesture:(id)a3;
- (void)_interpolateFromViewMode:(unint64_t)a3 toViewMode:(unint64_t)a4 progress:(double)a5;
- (void)_loadAuxiliaryDialLabelsIfNeeded;
- (void)_loadDial;
- (void)_loadLayoutRules;
- (void)_loadOffsetLabelIfNeeded;
- (void)_loadSnapshotContentViews;
- (void)_loadTimeView;
- (void)_loadUI;
- (void)_prepareForEditing;
- (void)_prepareForSettingViewMode:(unint64_t)a3 animated:(BOOL)a4;
- (void)_refreshGlowPathState;
- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)_resetInteractionProgress;
- (void)_setSolarDayProgress:(double)a3;
- (void)_setViewMode:(unint64_t)a3 animated:(BOOL)a4;
- (void)_setViewMode:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_startClockUpdates;
- (void)_stopClockUpdates;
- (void)_tearDownAuxiliaryDialLabels;
- (void)_tearDownOffsetLabel;
- (void)_timeDidUpdate:(id)a3;
- (void)_unloadDial;
- (void)_unloadSnapshotContentViews;
- (void)_unloadTimeView;
- (void)_unloadUI;
- (void)_updateFramerate;
- (void)_updateLocale;
- (void)_updateSolarOrbitGlowPath:(double)a3;
- (void)_updateStatusBarVisibility;
- (void)_updateSunsetFilter;
- (void)_updateTimeLabelsWithReferenceDate:(id)a3 overrideDate:(id)a4;
- (void)_updateTimeScrubbingContent:(double)a3;
- (void)_updateTimeViewOrbitWithSolarDayProgress:(double)a3;
- (void)_updateWaypointLabel;
- (void)_wheelDelayTimerFired;
- (void)dataSourceDidUpdateSolarData:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)performScrollTestNamed:(id)a3 completion:(id)a4;
- (void)screenDidTurnOffAnimated:(BOOL)a3;
- (void)setDataMode:(int64_t)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setTimeOffset:(double)a3;
- (void)setupDarkeningViewIfNeeded;
- (void)tearDownDarkeningView;
@end

@implementation NTKSiderealFaceView

- (NTKSiderealFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NTKSiderealFaceView;
  v9 = [(NTKSiderealFaceView *)&v18 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  v10 = v9;
  if (v9)
  {
    v9->_useXR = 0;
    v11 = +[UIColor blackColor];
    [(NTKSiderealFaceView *)v10 setBackgroundColor:v11];

    v10->_previousDataMode = 0;
    v12 = (NTKWhistlerAnalogFaceViewComplicationFactory *)[objc_alloc((Class)NTKWhistlerAnalogFaceViewComplicationFactory) initForDevice:v8];
    faceViewComplicationFactory = v10->_faceViewComplicationFactory;
    v10->_faceViewComplicationFactory = v12;

    v14 = [(NTKSiderealFaceView *)v10 _accessPrewarmedData];
    uint64_t v15 = [v14 object];
    dataSource = v10->_dataSource;
    v10->_dataSource = (NTKSiderealDataSource *)v15;

    [(NTKSiderealDataSource *)v10->_dataSource addObserver:v10];
  }

  return v10;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(NTKSiderealDataSource *)self->_dataSource removeObserver:self];
  v4.receiver = self;
  v4.super_class = (Class)NTKSiderealFaceView;
  [(NTKSiderealFaceView *)&v4 dealloc];
}

+ (id)_prewarmSharedData
{
  return +[NTKPromise promiseNamed:@"Sidereal Data Source" withBlock:&stru_2CB08];
}

- (void)_loadUI
{
  self->_currentSolarDayProgress = -1.0;
  [(NTKSiderealFaceView *)self _loadTimeView];
  [(NTKSiderealFaceView *)self _loadDial];
  siderealTimeView = self->_siderealTimeView;

  [(NTKSiderealFaceView *)self bringSubviewToFront:siderealTimeView];
}

- (void)_unloadUI
{
  [(NTKSiderealFaceView *)self _unloadTimeView];

  [(NTKSiderealFaceView *)self _unloadDial];
}

- (void)_loadDial
{
  v3 = [(NTKSiderealFaceView *)self device];
  sub_11DF8(v3, v50);
  double v4 = v50[0];

  v5 = [NTKSiderealSolarContainerView alloc];
  v6 = [(NTKSiderealFaceView *)self device];
  [v6 screenBounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  uint64_t v15 = [(NTKSiderealFaceView *)self device];
  sub_11DF8(v15, &v48);
  double v16 = v49;
  v17 = [(NTKSiderealFaceView *)self device];
  v43 = -[NTKSiderealSolarContainerView initWithFrame:orbitDiameter:device:](v5, "initWithFrame:orbitDiameter:device:", v17, v8, v10, v12, v14, v16);

  objc_super v18 = [NTKSiderealDialBackgroundView alloc];
  v42 = [(NTKSiderealFaceView *)self device];
  sub_11DF8(v42, &v46);
  double v19 = v47;
  v41 = [(NTKSiderealFaceView *)self device];
  sub_11DF8(v41, &v44);
  double v20 = v45;
  v40 = [(NTKSiderealFaceView *)self timeView];
  [v40 bounds];
  double v22 = v21 * 0.5;
  v38 = [(NTKSiderealFaceView *)self _dialViewImageRef];
  v23 = [(NTKSiderealFaceView *)self _waypointViewImageRef];
  v39 = [(NTKSiderealFaceView *)self _gnomonImage];
  v24 = [(NTKSiderealFaceView *)self _dayGnomonImageFromSolarContainerView:v43];
  v25 = [(NTKSiderealFaceView *)self _dayDiskBloomImageFromSolarContainerView:v43];
  v26 = [(NTKSiderealFaceView *)self _dayDiscImageFromSolarContainerView:v43];
  v27 = [(NTKSiderealFaceView *)self _nightGnomonImageFromSolarContainerView:v43];
  v28 = [(NTKSiderealFaceView *)self _nightDiscImageFromSolarContainerView:v43];
  v29 = [(NTKSiderealFaceView *)self _nightRingImageFromSolarContainerView:v43];
  LOBYTE(v37) = self->_useXR;
  v30 = -[NTKSiderealDialBackgroundView initWithFrame:orbitDiameter:timeOrbitRadius:timeRadius:dialImage:waypointImage:gnomonImage:dayGnomonImage:dayDiskBloomImage:dayDiscImage:nightGnomonImage:nightDiscImage:nightRingImage:initialData:useXR:](v18, "initWithFrame:orbitDiameter:timeOrbitRadius:timeRadius:dialImage:waypointImage:gnomonImage:dayGnomonImage:dayDiskBloomImage:dayDiscImage:nightGnomonImage:nightDiscImage:nightRingImage:initialData:useXR:", v38, v23, v39, v24, v25, v26, 0.0, 0.0, v4, v4, v19, v20, v22, v27, v28, v29,
          self->_currentData,
          v37);
  dialBackgroundView = self->_dialBackgroundView;
  self->_dialBackgroundView = v30;

  v32 = self->_dialBackgroundView;
  v33 = [(NTKSiderealFaceView *)self device];
  [v33 screenBounds];
  CLKRectGetCenter();
  -[NTKSiderealDialBackgroundView setCenter:](v32, "setCenter:");

  v34 = self->_dialBackgroundView;
  v35 = [(NTKSiderealData *)self->_currentData sectors];
  [(NTKSiderealDialBackgroundView *)v34 setSectors:v35];

  v36 = [(NTKSiderealFaceView *)self contentView];
  [v36 insertSubview:self->_dialBackgroundView atIndex:0];
}

- (void)_unloadDial
{
  [(NTKSiderealDialBackgroundView *)self->_dialBackgroundView removeFromSuperview];
  dialBackgroundView = self->_dialBackgroundView;
  self->_dialBackgroundView = 0;
}

- (void)_loadTimeView
{
  v3 = [(NTKSiderealFaceView *)self device];
  sub_11DF8(v3, &v10);
  double v4 = *((double *)&v10 + 1);

  v5 = [NTKSiderealTimeView alloc];
  v6 = [(NTKSiderealFaceView *)self device];
  double v7 = -[NTKSiderealTimeView initWithFrame:style:andDevice:](v5, "initWithFrame:style:andDevice:", 0, v6, 0.0, 0.0, v4, v4);
  siderealTimeView = self->_siderealTimeView;
  self->_siderealTimeView = v7;

  [(NTKSiderealFaceView *)self addSubview:self->_siderealTimeView];
  double v9 = self->_siderealTimeView;

  [(NTKSiderealFaceView *)self setTimeView:v9];
}

- (void)_unloadTimeView
{
  [(NTKSiderealTimeView *)self->_siderealTimeView removeFromSuperview];
  siderealTimeView = self->_siderealTimeView;
  self->_siderealTimeView = 0;
}

- (void)_loadSnapshotContentViews
{
  v11.receiver = self;
  v11.super_class = (Class)NTKSiderealFaceView;
  [(NTKSiderealFaceView *)&v11 _loadSnapshotContentViews];
  self->_breathScaleModifier = 1.0;
  self->_rubberBandScaleModifier = 1.0;
  v3 = (NSDateFormatter *)objc_opt_new();
  interactiveModeDateFormatter = self->_interactiveModeDateFormatter;
  self->_interactiveModeDateFormatter = v3;

  [(NTKSiderealFaceView *)self _updateLocale];
  [(NTKSiderealFaceView *)self _loadUI];
  self->_viewMode = 0;
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_asyncUpdateLocale" name:NSCurrentLocaleDidChangeNotification object:0];

  if (!self->_viewModeTapButton)
  {
    v6 = (NTKFaceViewTapControl *)objc_opt_new();
    viewModeTapButton = self->_viewModeTapButton;
    self->_viewModeTapButton = v6;

    [(NTKFaceViewTapControl *)self->_viewModeTapButton addTarget:self action:"_handleViewModeTapGesture:" forControlEvents:64];
    double v8 = [(NTKFaceViewTapControl *)self->_viewModeTapButton highlightImageView];
    double v9 = [(NTKSiderealFaceView *)self device];
    long long v10 = NTKNoHighlightDialTapImage();
    [v8 setImage:v10];

    [(NTKSiderealFaceView *)self addSubview:self->_viewModeTapButton];
  }
}

- (void)_unloadSnapshotContentViews
{
  [(NTKSiderealFaceView *)self _unloadUI];
  [(NTKSiderealFaceView *)self _stopClockUpdates];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:NSCurrentLocaleDidChangeNotification object:0];

  [(NTKFaceViewTapControl *)self->_viewModeTapButton removeFromSuperview];
  viewModeTapButton = self->_viewModeTapButton;
  self->_viewModeTapButton = 0;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)NTKSiderealFaceView;
  [(NTKSiderealFaceView *)&v5 layoutSubviews];
  viewModeTapButton = self->_viewModeTapButton;
  [(NTKSiderealFaceView *)self bounds];
  double MidX = CGRectGetMidX(v6);
  [(NTKSiderealFaceView *)self bounds];
  -[NTKFaceViewTapControl setCenter:](viewModeTapButton, "setCenter:", MidX, CGRectGetMidY(v7));
  [(NTKFaceViewTapControl *)self->_viewModeTapButton sizeToFit];
}

- (void)_becameActiveFace
{
}

- (void)_becameInactiveFace
{
}

- (BOOL)_wantsMinorDetents
{
  return NTKStarbearEnabled() ^ 1;
}

- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  BOOL v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NTKSiderealFaceView;
  id v6 = a4;
  [(NTKSiderealFaceView *)&v8 _renderSynchronouslyWithImageQueueDiscard:v4 inGroup:v6];
  CGRect v7 = [(NTKSiderealDialBackgroundView *)self->_dialBackgroundView quadView];
  [v7 renderSynchronouslyWithImageQueueDiscard:v4 inGroup:v6];
}

- (void)setDataMode:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKSiderealFaceView;
  -[NTKSiderealFaceView setDataMode:](&v5, "setDataMode:");
  [(NTKFaceViewTapControl *)self->_viewModeTapButton setHighlighted:0];
  [(NTKFaceViewTapControl *)self->_viewModeTapButton setUserInteractionEnabled:a3 == 1];
  [(NTKSiderealFaceView *)self _updateFramerate];
}

- (void)_applyDataMode
{
  v12.receiver = self;
  v12.super_class = (Class)NTKSiderealFaceView;
  [(NTKSiderealFaceView *)&v12 _applyDataMode];
  id previousDataMode = self->_previousDataMode;
  if (previousDataMode != [(NTKSiderealFaceView *)self dataMode])
  {
    double currentSolarDayProgress = self->_currentSolarDayProgress;
    double v5 = -1.0;
    switch((unint64_t)[(NTKSiderealFaceView *)self dataMode])
    {
      case 0uLL:
      case 4uLL:
      case 5uLL:
        [(NTKSiderealFaceView *)self _solarDayProgressForCurrentTime];
        self->_interactionProgress = v6;
        [(NTKSiderealFaceView *)self _stopClockUpdates];
        [(NTKSiderealFaceView *)self _setViewMode:0 animated:0];
        goto LABEL_16;
      case 1uLL:
        int64_t v7 = self->_previousDataMode;
        BOOL v8 = v7 == 3;
        if (v7 == 3)
        {
          double v9 = [(NTKSiderealFaceView *)self timeView];
          [v9 setOverrideDate:0 duration:0.5];
        }
        [(NTKSiderealFaceView *)self _solarDayProgressForCurrentTime];
        double v5 = v10;
        self->_interactionProgress = v10;
        [(NTKSiderealFaceView *)self _startClockUpdates];
        [(NTKSiderealFaceView *)self _setViewMode:0 animated:0];
        goto LABEL_13;
      case 2uLL:
        goto LABEL_11;
      case 3uLL:
        [(NTKSiderealFaceView *)self _idealizedSolarDayProgress];
        double v5 = v11;
        if (self->_previousDataMode != 1) {
          goto LABEL_12;
        }
        self->_interactionProgress = v11;
        if (self->_viewMode == 1) {
          [(NTKSiderealFaceView *)self _setViewMode:0 animated:0];
        }
        [(NTKSiderealFaceView *)self _setViewMode:2 animated:0];
LABEL_11:
        [(NTKSiderealFaceView *)self _stopClockUpdates];
LABEL_12:
        BOOL v8 = 1;
LABEL_13:
        if (v8)
        {
          if (self->_previousDataMode) {
            [(NTKSiderealFaceView *)self _animateSolarDayFromProgress:0 toProgress:currentSolarDayProgress minDuration:v5 completion:0.5];
          }
        }
LABEL_16:
        self->_id previousDataMode = (int64_t)[(NTKSiderealFaceView *)self dataMode];
        break;
      default:
        goto LABEL_12;
    }
  }
}

- (void)setFrozen:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKSiderealFaceView;
  [(NTKSiderealFaceView *)&v4 setFrozen:a3];
  [(NTKSiderealFaceView *)self _updateFramerate];
}

- (void)screenDidTurnOffAnimated:(BOOL)a3
{
  [(NTKSiderealFaceView *)self _updateFramerate];

  [(NTKSiderealFaceView *)self _forceSolarDayUpdate];
}

- (void)_updateFramerate
{
  if (NTKIsScreenOn()) {
    [(NTKSiderealFaceView *)self isFrozen];
  }
  id v3 = [(NTKSiderealDialBackgroundView *)self->_dialBackgroundView quadView];
  [v3 setPaused:1];
}

- (void)_enableCrown
{
  v3.receiver = self;
  v3.super_class = (Class)NTKSiderealFaceView;
  [(NTKSiderealFaceView *)&v3 _enableCrown];
  self->_isHandlingHardwareEvents = 1;
}

- (void)_disableCrown
{
  v3.receiver = self;
  v3.super_class = (Class)NTKSiderealFaceView;
  [(NTKSiderealFaceView *)&v3 _disableCrown];
  self->_isHandlingHardwareEvents = 0;
}

- (BOOL)_wheelChangedWithEvent:(id)a3
{
  return 0;
}

- (BOOL)_handlePhysicalButton:(unint64_t)a3 event:(unint64_t)a4
{
  return 0;
}

- (void)_wheelDelayTimerFired
{
  wheelDelayTimer = self->_wheelDelayTimer;
  self->_wheelDelayTimer = 0;

  if (!self->_buttonPressTimer && [(NTKSiderealFaceView *)self _canEnterInteractiveMode])
  {
    [(NTKSiderealFaceView *)self _setViewMode:1 animated:1];
  }
}

- (void)_buttonPressTimerFired
{
  self->_buttonPressTimer = 0;
  _objc_release_x1();
}

- (void)_updateTimeScrubbingContent:(double)a3
{
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  id v10 = [(NTKSiderealData *)self->_currentData interpolateBetweenCalendricalMidnights:a3];
  double v5 = [(NTKSiderealFaceView *)self _faceDisplayTime];
  double v6 = NTKRoundDateDownToNearestMinute();

  [(NTKSiderealFaceView *)self _updateTimeLabelsWithReferenceDate:v6 overrideDate:v10];
  if (self->_viewMode == 1 || self->_transitionState - 1 <= 1)
  {
    BOOL v8 = [(NTKSiderealFaceView *)self timeView];
    [v8 setOverrideDate:v10 duration:0.0];
  }
  [(NTKSiderealFaceView *)self _setSolarDayProgress:a3];
  double v9 = [(NTKSiderealDialBackgroundView *)self->_dialBackgroundView quadView];
  [v9 renderSynchronouslyWithImageQueueDiscard:0 inGroup:0 completion:0];

  +[CATransaction commit];
}

- (void)_resetInteractionProgress
{
  [(NTKSiderealFaceView *)self _solarDayProgressForCurrentTime];
  self->_interactionProgress = v3;
  id v4 = [(NTKSiderealFaceView *)self timeView];
  [v4 setOverrideDate:0 duration:0.0];
}

- (id)_faceDisplayTime
{
  v2 = +[NTKTimeOffsetManager sharedManager];
  double v3 = [v2 faceDisplayTime];

  return v3;
}

- (void)_startClockUpdates
{
  if (!self->_clockTimerToken)
  {
    objc_initWeak(&location, self);
    double v3 = +[CLKClockTimer sharedInstance];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_12B84;
    v6[3] = &unk_2C8E8;
    objc_copyWeak(&v7, &location);
    id v4 = [v3 startUpdatesWithUpdateFrequency:0 withHandler:v6 identificationLog:&stru_2CB28];
    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)_stopClockUpdates
{
  if (self->_clockTimerToken)
  {
    double v3 = +[CLKClockTimer sharedInstance];
    [v3 stopUpdatesForToken:self->_clockTimerToken];

    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = 0;
  }
}

- (void)_timeDidUpdate:(id)a3
{
  id v4 = a3;
  double v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "[NTKSiderealFaceView] _updateForChangedDate with date:%@", (uint8_t *)&v8, 0xCu);
  }

  +[NTKSiderealDataSource reverseInterpolateBetweenCalendricalMidnights:v4];
  double v7 = v6;
  if ([(NTKSiderealData *)self->_currentData isDateInReferenceDate:v4])
  {
    if (self->_viewMode != 1 && ![(NTKSiderealFaceView *)self _isDayAnimationRunning])
    {
      self->_interactionProgress = v7;
      [(NTKSiderealFaceView *)self _updateTimeScrubbingContent:v7];
    }
  }
  else
  {
    [(NTKSiderealDataSource *)self->_dataSource updateModelWithDate:v4];
  }
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  id v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKSiderealFaceView;
  [(NTKSiderealFaceView *)&v7 setOverrideDate:v6 duration:a4];
  if (![(NTKSiderealFaceView *)self _isDayAnimationRunning] && !self->_viewMode)
  {
    if (v6) {
      +[NTKSiderealDataSource reverseInterpolateBetweenCalendricalMidnights:v6];
    }
    else {
      [(NTKSiderealFaceView *)self _solarDayProgressForCurrentTime];
    }
    -[NTKSiderealFaceView _updateTimeScrubbingContent:](self, "_updateTimeScrubbingContent:");
  }
}

- (void)setTimeOffset:(double)a3
{
}

- (void)_asyncUpdateLocale
{
  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_12F68;
  v2[3] = &unk_2C950;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)_updateLocale
{
  id v3 = +[NSLocale currentLocale];
  int v4 = CLKLocaleIs24HourMode();

  interactiveModeDateFormatter = self->_interactiveModeDateFormatter;
  if (v4) {
    CFStringRef v6 = @"H:mm";
  }
  else {
    CFStringRef v6 = @"h:mm a";
  }

  [(NSDateFormatter *)interactiveModeDateFormatter setLocalizedDateFormatFromTemplate:v6];
}

- (void)_updateSunsetFilter
{
  v23 = self->_currentData;
  id v3 = [(NTKSiderealData *)v23 sunriseSunsetInfo];
  int v4 = [(NTKSiderealData *)v23 sunriseTime];
  double v5 = [(NTKSiderealData *)v23 sunsetTime];
  CFStringRef v6 = [(NTKSiderealData *)v23 referenceDate];
  objc_super v7 = NTKEndOfDayForDate();

  [v5 timeIntervalSinceDate:v4];
  double v9 = v8;
  [v7 timeIntervalSinceDate:v5];
  double v11 = v10;
  if (([(NTKSiderealData *)v23 sunsetFollowsSunrise] & 1) == 0)
  {
    self->_sunsetFilterEnabled = 0;
    goto LABEL_14;
  }
  objc_super v12 = +[NSCalendar currentCalendar];
  double v13 = [(NTKSiderealData *)v23 referenceDate];
  double v14 = [v12 components:160 fromDate:v13];

  [v14 setSecond:0];
  [v14 setHour:22];
  uint64_t v15 = [(NTKSiderealData *)v23 referenceDate];
  double v16 = [v12 nextDateAfterDate:v15 matchingComponents:v14 options:2];

  if (v9 < 14400.0) {
    goto LABEL_3;
  }
  if (v9 < 28800.0)
  {
    self->_sunsetFilterEnabled = 1;
    uint64_t v17 = [v3 solarNoon];
LABEL_9:
    objc_super v18 = (void *)v17;
    if (v11 >= 7200.0) {
      double v19 = v5;
    }
    else {
      double v19 = v16;
    }
    id v20 = v19;
    +[NTKSiderealDataSource reverseInterpolateBetweenCalendricalMidnights:v18];
    *(float *)&double v21 = v21;
    self->_sunsetFilterRampUpStartProgress = *(float *)&v21;
    +[NTKSiderealDataSource reverseInterpolateBetweenCalendricalMidnights:v20];
    *(float *)&double v22 = v22;
    self->_sunsetFilterRampDownStartProgress = *(float *)&v22;

    goto LABEL_13;
  }
  if (v9 < 72000.0)
  {
    self->_sunsetFilterEnabled = 1;
    uint64_t v17 = [v5 dateByAddingTimeInterval:-14400.0];
    goto LABEL_9;
  }
LABEL_3:
  self->_sunsetFilterEnabled = 0;
LABEL_13:

LABEL_14:
}

- (void)dataSourceDidUpdateSolarData:(id)a3
{
  double v5 = (NTKSiderealData *)a3;
  if (self->_currentData != v5)
  {
    CFStringRef v6 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "[NTKSiderealFaceView] dataSourceDidUpdateSolarData", v15, 2u);
    }

    objc_storeStrong((id *)&self->_currentData, a3);
    dialBackgroundView = self->_dialBackgroundView;
    double v8 = [(NTKSiderealData *)self->_currentData sectors];
    [(NTKSiderealDialBackgroundView *)dialBackgroundView setSectors:v8];

    double v9 = +[NTKSiderealCache sharedCache];
    [v9 purgeCachedKey:NTKSiderealCacheWaypointViewKey];

    double v10 = +[NTKSiderealCache sharedCache];
    [v10 purgeAPLCache];

    double v11 = self->_dialBackgroundView;
    if (v11)
    {
      objc_super v12 = [(NTKSiderealDialBackgroundView *)v11 quad];
      double v13 = [(NTKSiderealFaceView *)self _waypointViewImageRef];
      [v12 updateWaypointImage:v13];
    }
    [(NTKSiderealFaceView *)self _updateSunsetFilter];
    double v14 = [(NTKSiderealDialBackgroundView *)self->_dialBackgroundView quad];
    [v14 siderealDataChanged:v5];
  }
}

- (void)_setSolarDayProgress:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_double currentSolarDayProgress = a3;
    float v5 = 0.0;
    if (self->_sunsetFilterEnabled && self->_useXR)
    {
      float v6 = a3;
      float sunsetFilterRampUpStartProgress = self->_sunsetFilterRampUpStartProgress;
      float v8 = (float)((float)(self->_sunsetFilterRampDownStartProgress - sunsetFilterRampUpStartProgress) + -0.083333)
         * 0.5;
      float v9 = (float)((float)(v8 + 0.083333) / 0.083333)
         - fabsf((float)((float)((float)(v6 + -0.083333) - sunsetFilterRampUpStartProgress) - v8) / 0.083333);
      if (v9 < 0.0) {
        float v9 = 0.0;
      }
      float v5 = fminf(v9, 1.0);
    }
    double v10 = [(NTKSiderealDialBackgroundView *)self->_dialBackgroundView quad];
    *(float *)&double v11 = v5;
    [v10 setSunsetFilter:v11];

    [(NTKSiderealDialBackgroundView *)self->_dialBackgroundView setSolarDayProgress:self->_currentSolarDayProgress];
    [(NTKSiderealFaceView *)self _updateTimeViewOrbitWithSolarDayProgress:self->_currentSolarDayProgress];
    [(NTKSiderealFaceView *)self _updateSolarOrbitGlowPath:self->_currentSolarDayProgress];
    [(NTKSiderealFaceView *)self _updateWaypointLabel];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_135C4;
    v12[3] = &unk_2CB50;
    v12[4] = self;
    [(NTKSiderealFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v12];
  }
}

- (void)_forceSolarDayUpdate
{
  [(NTKSiderealFaceView *)self _solarDayProgressForCurrentTime];
  -[NTKSiderealFaceView _updateTimeScrubbingContent:](self, "_updateTimeScrubbingContent:");

  [(NTKSiderealFaceView *)self _setViewMode:0 animated:0];
}

- (void)_animateSolarDayFromProgress:(double)a3 toProgress:(double)a4 minDuration:(double)a5 completion:(id)a6
{
}

- (BOOL)_isDayAnimationRunning
{
  return 0;
}

- (void)_updateTimeViewOrbitWithSolarDayProgress:(double)a3
{
  int v4 = [(NTKSiderealFaceView *)self device];
  sub_11DF8(v4, &v7);

  float v5 = [(NTKSiderealFaceView *)self device];
  [v5 screenBounds];
  CLKRectGetCenter();

  CLKDegreesToRadians();
  NTKPointOnCircle();
  siderealTimeView = self->_siderealTimeView;

  -[NTKSiderealTimeView setCenter:](siderealTimeView, "setCenter:");
}

- (BOOL)_canEnterInteractiveMode
{
  return ![(NTKSiderealFaceView *)self _isDayAnimationRunning] && self->_viewMode == 0;
}

- (void)_handleViewModeTapGesture:(id)a3
{
  unsigned int v4 = [(NTKSiderealFaceView *)self _isDayAnimationRunning];
  unint64_t viewMode = self->_viewMode;
  if (!v4 || viewMode)
  {
    [(NTKSiderealFaceView *)self _setViewMode:viewMode != 1 animated:1];
  }
}

- (void)_setViewMode:(unint64_t)a3 animated:(BOOL)a4
{
}

- (void)_setViewMode:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  unint64_t viewMode = self->_viewMode;
  if (!a3)
  {
    self->_previousViewMode = viewMode;
    self->_unint64_t viewMode = 0;
    if (self->_previousViewMode != 1) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (viewMode != a3)
  {
    self->_previousViewMode = viewMode;
    self->_unint64_t viewMode = a3;
    if (self->_previousViewMode != 1)
    {
      if (a3 == 1)
      {
        unint64_t v10 = 1;
LABEL_9:
        self->_transitionState = v10;
        [(NTKSiderealFaceView *)self _prepareForSettingViewMode:a3 animated:v5];
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_13970;
        v12[3] = &unk_2CB98;
        v12[4] = self;
        unint64_t v14 = a3;
        id v13 = v8;
        double v11 = objc_retainBlock(v12);
        ((void (*)(void))v11[2])();

        goto LABEL_10;
      }
LABEL_8:
      unint64_t v10 = 0;
      goto LABEL_9;
    }
LABEL_7:
    unint64_t v10 = 2;
    goto LABEL_9;
  }
LABEL_10:
}

- (void)_prepareForSettingViewMode:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t viewMode = self->_viewMode;
  if (viewMode != 1)
  {
    if (!viewMode)
    {
      [(NTKSiderealAuxiliaryDialLabels *)self->_auxiliaryDialLabels willStartTransition];
      [(NTKSiderealFaceView *)self enumerateComplicationDisplayWrappersWithBlock:&stru_2CBD8];
      if (v4)
      {
        double currentSolarDayProgress = self->_currentSolarDayProgress;
        [(NTKSiderealFaceView *)self _solarDayProgressForCurrentTime];
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_13DDC;
        v21[3] = &unk_2CC00;
        v21[4] = self;
        [(NTKSiderealFaceView *)self _animateSolarDayFromProgress:v21 toProgress:currentSolarDayProgress minDuration:v8 completion:0.5];
      }
      else
      {
        [(NTKSiderealFaceView *)self _resetInteractionProgress];
      }
      [(NTKSiderealTimeView *)self->_siderealTimeView setUseMonospacedDigitalNumbers:0];
    }
    goto LABEL_30;
  }
  [(NTKSiderealFaceView *)self _updateStatusBarVisibility];
  [(NTKSiderealFaceView *)self _loadAuxiliaryDialLabelsIfNeeded];
  [(NTKSiderealFaceView *)self _loadOffsetLabelIfNeeded];
  if (v4) {
    [(NTKSiderealFaceView *)self enableCrownEventReception];
  }
  [(NTKSiderealTimeView *)self->_siderealTimeView setUseMonospacedDigitalNumbers:1];
  [(NTKSiderealTimeView *)self->_siderealTimeView setSecondsHidden:1 animated:1];
  [(NTKSiderealFaceView *)self _updateWaypointLabel];
  float v9 = [(NTKSiderealData *)self->_currentData sunriseSunsetInfo];
  unint64_t v10 = [v9 rise];
  uint64_t v11 = [v9 set];
  if (v10) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    id v13 = NTKEndOfDayForDate();
    uint64_t v15 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      double v23 = *(double *)&v10;
      __int16 v24 = 2112;
      v25 = v13;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "sunrise exists (%@) but sunset doesn't (nil), setting to end of day (%@)", buf, 0x16u);
    }

    goto LABEL_18;
  }
  id v13 = (void *)v11;
  if (v10)
  {
LABEL_18:
    [v13 timeIntervalSinceDate:v10];
    double v14 = v16;
    goto LABEL_19;
  }
  double v14 = 0.0;
LABEL_19:
  if ([v9 constantSun] == (char *)&dword_0 + 2 && v14 == 0.0) {
    double v14 = 86400.0;
  }
  if ((*(void *)&v14 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    objc_super v18 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      double v23 = v14;
      __int16 v24 = 2112;
      v25 = v10;
      __int16 v26 = 2112;
      v27 = v13;
      _os_log_error_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, "dayLength is not valid (%f). Derived from sunrise (%@) sunset (%@)", buf, 0x20u);
    }
    id v20 = &stru_2D1F8;
  }
  else
  {
    objc_super v18 = sub_13DE4(0, v14);
    double v19 = +[NTKSolarDialFaceBundle localizedStringForKey:@"SOLAR_DAY_LENGTH" comment:@"Day Length"];
    id v20 = +[NSString stringWithFormat:@"%@: %@", v19, v18];
  }
  [(NTKSiderealAuxiliaryDialLabels *)self->_auxiliaryDialLabels setBottomText:v20];

LABEL_30:
  [(NTKSiderealFaceView *)self _updateFramerate];
  [(NTKSiderealFaceView *)self _refreshGlowPathState];
}

- (void)_interpolateFromViewMode:(unint64_t)a3 toViewMode:(unint64_t)a4 progress:(double)a5
{
  CLKCompressFraction();
  CLKCompressFraction();
  CLKInterpolateBetweenFloatsClipped();
  -[NTKWhistlerAnalogFaceViewComplicationFactory setAlpha:faceView:](self->_faceViewComplicationFactory, "setAlpha:faceView:", self);
  CLKCompressFraction();
  CLKInterpolateBetweenFloatsClipped();
  -[UILabel setAlpha:](self->_offsetLabel, "setAlpha:");
  CLKInterpolateBetweenFloatsClipped();
  auxiliaryDialLabels = self->_auxiliaryDialLabels;

  -[NTKSiderealAuxiliaryDialLabels applyTransitionFraction:](auxiliaryDialLabels, "applyTransitionFraction:");
}

- (void)_cleanupAfterSettingViewMode:(unint64_t)a3 previousViewMode:(unint64_t)a4
{
  self->_transitionState = 0;
  unint64_t viewMode = self->_viewMode;
  if (viewMode == 1)
  {
    [(NTKSiderealAuxiliaryDialLabels *)self->_auxiliaryDialLabels didFinishTransition];
    [(NTKSiderealFaceView *)self enumerateComplicationDisplayWrappersWithBlock:&stru_2CC20];
    if (NTKStarbearEnabled()) {
      [(NTKSiderealFaceView *)self _enableCrown];
    }
  }
  else if (!viewMode)
  {
    [(NTKSiderealFaceView *)self _tearDownAuxiliaryDialLabels];
    [(NTKSiderealFaceView *)self _tearDownOffsetLabel];
    [(NTKSiderealFaceView *)self _updateStatusBarVisibility];
    [(NTKSiderealTimeView *)self->_siderealTimeView setSecondsHidden:0 animated:1];
    if (a4 != 2)
    {
      [(NTKSiderealFaceView *)self _solarDayProgressForCurrentTime];
      -[NTKSiderealFaceView _updateTimeScrubbingContent:](self, "_updateTimeScrubbingContent:");
    }
    [(NTKSiderealFaceView *)self _resetInteractionProgress];
    if (NTKStarbearEnabled()) {
      [(NTKSiderealFaceView *)self _disableCrown];
    }
  }

  [(NTKSiderealFaceView *)self _refreshGlowPathState];
}

- (void)_updateStatusBarVisibility
{
  id v3 = [(NTKSiderealFaceView *)self delegate];
  [v3 faceViewWantsStatusBarHidden:self->_viewMode == 1 animated:1];
}

- (void)_refreshGlowPathState
{
  unint64_t v2 = self->_transitionState - 1;
  unint64_t viewMode = self->_viewMode;
  BOOL v4 = [(NTKSiderealDialBackgroundView *)self->_dialBackgroundView quad];
  id v7 = v4;
  BOOL v6 = v2 < 2 || viewMode == 1;
  [v4 setShouldDrawGlowPath:v6];
}

- (void)_updateSolarOrbitGlowPath:(double)a3
{
  [(NTKSiderealFaceView *)self _solarDayProgressForCurrentTime];
  double v6 = v5 * 6.28318531;
  id v7 = [(NTKSiderealDialBackgroundView *)self->_dialBackgroundView quad];
  [v7 setGlowViewStartAngle:v6 endAngle:a3 * 6.28318531];
}

- (void)_updateWaypointLabel
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = [(NTKSiderealData *)self->_currentData sectors];
  id v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        float v9 = [v8 startingEvent];
        [v9 degree];
        NTKSiderealDegreesToSolarDayProgress();
        double v11 = v10;

        BOOL v12 = [v8 endingEvent];
        [v12 degree];
        NTKSiderealDegreesToSolarDayProgress();
        double v14 = v13;

        double interactionProgress = self->_interactionProgress;
        if (interactionProgress >= v11 && interactionProgress <= v14)
        {
          auxiliaryDialLabels = self->_auxiliaryDialLabels;
          objc_super v18 = [v8 localizedName];
          [(NTKSiderealAuxiliaryDialLabels *)auxiliaryDialLabels setTopText:v18];

          goto LABEL_13;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }
LABEL_13:
}

- (void)_updateTimeLabelsWithReferenceDate:(id)a3 overrideDate:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  id v7 = v6;
  if (self->_viewMode == 1 || self->_transitionState == 1)
  {
    [v6 timeIntervalSinceDate:v17];
    float v9 = sub_13DE4(1, v8);
    double v10 = [(UILabel *)self->_offsetLabel text];
    unsigned __int8 v11 = [v10 isEqualToString:v9];

    if ((v11 & 1) == 0) {
      [(UILabel *)self->_offsetLabel setText:v9];
    }
    BOOL v12 = [(NSDateFormatter *)self->_interactiveModeDateFormatter stringFromDate:v17];
    double v13 = +[NSLocale currentLocale];
    double v14 = [v12 uppercaseStringWithLocale:v13];

    uint64_t v15 = +[NTKSolarDialFaceBundle localizedStringForKey:@"SOLAR_DATE_NOW" comment:@"Now"];
    double v16 = +[NSString stringWithFormat:@"%@ %@", v15, v14];

    [(NTKSiderealAuxiliaryDialLabels *)self->_auxiliaryDialLabels setBottomText:v16];
  }
}

- (void)_loadAuxiliaryDialLabelsIfNeeded
{
  if (!self->_auxiliaryDialLabels)
  {
    id v3 = [NTKSiderealAuxiliaryDialLabels alloc];
    [(NTKSiderealFaceView *)self bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    BOOL v12 = [(NTKSiderealFaceView *)self device];
    double v13 = -[NTKSiderealAuxiliaryDialLabels initWithFrame:device:](v3, "initWithFrame:device:", v12, v5, v7, v9, v11);
    auxiliaryDialLabels = self->_auxiliaryDialLabels;
    self->_auxiliaryDialLabels = v13;

    id v15 = [(NTKSiderealFaceView *)self contentView];
    [v15 addSubview:self->_auxiliaryDialLabels];
  }
}

- (void)_tearDownAuxiliaryDialLabels
{
  [(NTKSiderealAuxiliaryDialLabels *)self->_auxiliaryDialLabels removeFromSuperview];
  auxiliaryDialLabels = self->_auxiliaryDialLabels;
  self->_auxiliaryDialLabels = 0;
}

- (void)_loadOffsetLabelIfNeeded
{
  if (!self->_offsetLabel)
  {
    id v3 = [(NTKSiderealFaceView *)self device];
    sub_11DF8(v3, v25);
    double v4 = +[CLKFont systemFontOfSize:CLKRoundedFontDesignName weight:v26 design:UIFontWeightMedium];
    id v22 = [v4 CLKFontWithMonospacedNumbers];

    NTKSingleLineHeight();
    double v6 = v5;
    double v7 = [(NTKSiderealFaceView *)self device];
    sub_11DF8(v7, v23);
    double v8 = v24 - v6;
    [(NTKSiderealTimeView *)self->_siderealTimeView bounds];
    double v10 = v9;

    double v11 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", 0.0, v8, v10, v6);
    offsetLabel = self->_offsetLabel;
    self->_offsetLabel = v11;

    [(UILabel *)self->_offsetLabel setFont:v22];
    double v13 = self->_offsetLabel;
    double v14 = +[UIColor colorWithRed:1.0 green:0.941176471 blue:0.501960784 alpha:1.0];
    [(UILabel *)v13 setTextColor:v14];

    [(UILabel *)self->_offsetLabel setTextAlignment:1];
    id v15 = [(UILabel *)self->_offsetLabel layer];
    [v15 setShadowRadius:5.0];

    double v16 = [(UILabel *)self->_offsetLabel layer];
    LODWORD(v17) = 1041865114;
    [v16 setShadowOpacity:v17];

    objc_super v18 = [(UILabel *)self->_offsetLabel layer];
    objc_msgSend(v18, "setShadowOffset:", 0.0, 0.0);

    long long v19 = self->_offsetLabel;
    long long v20 = +[UIColor colorWithWhite:0.0 alpha:0.15];
    [(UILabel *)v19 setShadowColor:v20];

    long long v21 = [(NTKSiderealTimeView *)self->_siderealTimeView dialBackgroundView];
    [v21 addSubview:self->_offsetLabel];
  }
}

- (void)_tearDownOffsetLabel
{
  [(UILabel *)self->_offsetLabel removeFromSuperview];
  offsetLabel = self->_offsetLabel;
  self->_offsetLabel = 0;
}

- (void)_prepareForEditing
{
  v4.receiver = self;
  v4.super_class = (Class)NTKSiderealFaceView;
  [(NTKSiderealFaceView *)&v4 _prepareForEditing];
  self->_breathScaleModifier = 1.0;
  self->_rubberBandScaleModifier = 1.0;
  id v3 = [(NTKSiderealFaceView *)self timeView];
  [v3 setEditing:1];

  [(NTKSiderealFaceView *)self setupDarkeningViewIfNeeded];
  [(NTKSiderealFaceView *)self _updateFramerate];
}

- (void)_cleanupAfterEditing
{
  v4.receiver = self;
  v4.super_class = (Class)NTKSiderealFaceView;
  [(NTKSiderealFaceView *)&v4 _cleanupAfterEditing];
  id v3 = [(NTKSiderealFaceView *)self timeView];
  [v3 setEditing:0];

  [(NTKSiderealFaceView *)self tearDownDarkeningView];
  [(NTKSiderealFaceView *)self _updateFramerate];
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  if (a4 == 15)
  {
    siderealTimeView = self->_siderealTimeView;
    id v7 = [a3 style];
    [(NTKSiderealTimeView *)siderealTimeView setStyle:v7];
  }
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  if (a6 == 15)
  {
    siderealTimeView = self->_siderealTimeView;
    id v11 = a5;
    id v12 = [a4 style];
    id v13 = [v11 style];

    [(NTKSiderealTimeView *)siderealTimeView applyTransitionFraction:v12 fromStyle:v13 toStyle:a3];
  }
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  double v6 = [(NTKSiderealFaceView *)self device];
  sub_11DF8(v6, &v9);
  NTKScaleForBreathingFraction();
  double v8 = v7;

  self->_breathScaleModifier = v8;

  [(NTKSiderealFaceView *)self _applyScaleToTimeView];
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  NTKScaleForRubberBandingFraction();
  self->_rubberBandScaleModifier = v6;

  [(NTKSiderealFaceView *)self _applyScaleToTimeView];
}

- (void)_applyScaleToTimeView
{
  +[CATransaction begin];
  +[CATransaction setValue:kCFBooleanTrue forKey:kCATransactionDisableActions];
  siderealTimeView = self->_siderealTimeView;
  [(NTKSiderealFaceView *)self _timeViewScaleTransform];
  [(NTKSiderealTimeView *)siderealTimeView setTransform:&v9];
  objc_super v4 = [(NTKSiderealFaceView *)self newTimeViewPathForDarkeningView];
  [(CAShapeLayer *)self->_dialDarkeningLayer setPath:v4];
  CGPathRelease(v4);
  [(NTKSiderealTimeView *)self->_siderealTimeView frame];
  double v6 = v5;
  -[CALayer setFrame:](self->_timeViewDarkeningLayer, "setFrame:");
  [(CALayer *)self->_timeViewDarkeningLayer setCornerRadius:v6 * 0.5];
  *(float *)&double v6 = self->_rubberBandScaleModifier;
  double v7 = [(NTKSiderealDialBackgroundView *)self->_dialBackgroundView quad];
  LODWORD(v8) = LODWORD(v6);
  [v7 setBlurScale:v8];

  +[CATransaction commit];
}

- (void)_configureForEditMode:(int64_t)a3
{
  [(NTKSiderealFaceView *)self _applyScaleToTimeView];
  dialDarkeningLayer = self->_dialDarkeningLayer;
  [(NTKSiderealFaceView *)self _darkeningViewAlphaForEditMode:a3];
  *(float *)&double v6 = v6;
  [(CAShapeLayer *)dialDarkeningLayer setOpacity:v6];
  timeViewDarkeningLayer = self->_timeViewDarkeningLayer;
  [(NTKSiderealFaceView *)self _timeDarkeningViewAlphaForEditMode:a3];
  *(float *)&double v8 = v8;
  [(CALayer *)timeViewDarkeningLayer setOpacity:v8];
  faceViewComplicationFactory = self->_faceViewComplicationFactory;
  [(NTKSiderealFaceView *)self _complicationAlphaForEditMode:a3];

  -[NTKWhistlerAnalogFaceViewComplicationFactory setAlpha:faceView:](faceViewComplicationFactory, "setAlpha:faceView:", self);
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  -[NTKSiderealFaceView _darkeningViewAlphaForEditMode:](self, "_darkeningViewAlphaForEditMode:");
  [(NTKSiderealFaceView *)self _darkeningViewAlphaForEditMode:a5];
  dialDarkeningLayer = self->_dialDarkeningLayer;
  CLKInterpolateBetweenFloatsClipped();
  *(float *)&double v9 = v9;
  [(CAShapeLayer *)dialDarkeningLayer setOpacity:v9];
  [(NTKSiderealFaceView *)self _timeDarkeningViewAlphaForEditMode:a4];
  [(NTKSiderealFaceView *)self _timeDarkeningViewAlphaForEditMode:a5];
  timeViewDarkeningLayer = self->_timeViewDarkeningLayer;
  CLKInterpolateBetweenFloatsClipped();
  *(float *)&double v11 = v11;
  [(CALayer *)timeViewDarkeningLayer setOpacity:v11];
  [(NTKSiderealFaceView *)self _complicationAlphaForEditMode:a4];
  [(NTKSiderealFaceView *)self _complicationAlphaForEditMode:a5];
  faceViewComplicationFactory = self->_faceViewComplicationFactory;
  CLKInterpolateBetweenFloatsClipped();

  -[NTKWhistlerAnalogFaceViewComplicationFactory setAlpha:faceView:](faceViewComplicationFactory, "setAlpha:faceView:", self);
}

- (double)_dialAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if (a3 != 1) {
    return 1.0;
  }
  return result;
}

- (double)_timeViewAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if (a3 != 1) {
    return 1.0;
  }
  return result;
}

- (double)_complicationAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if (a3 != 15) {
    return 1.0;
  }
  return result;
}

- (double)_darkeningViewAlphaForEditMode:(int64_t)a3
{
  double result = 0.7;
  if (!a3) {
    return 0.0;
  }
  return result;
}

- (double)_timeDarkeningViewAlphaForEditMode:(int64_t)a3
{
  double result = 0.7;
  if (a3 != 1) {
    return 0.0;
  }
  return result;
}

- (void)setupDarkeningViewIfNeeded
{
  if (!self->_darkeningContainerView)
  {
    id v3 = objc_alloc((Class)UIView);
    [(NTKSiderealFaceView *)self bounds];
    objc_super v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    darkeningContainerView = self->_darkeningContainerView;
    self->_darkeningContainerView = v4;

    double v6 = [(NTKSiderealFaceView *)self newTimeViewPathForDarkeningView];
    double v7 = (CAShapeLayer *)objc_alloc_init((Class)CAShapeLayer);
    dialDarkeningLayer = self->_dialDarkeningLayer;
    self->_dialDarkeningLayer = v7;

    [(CAShapeLayer *)self->_dialDarkeningLayer setPath:v6];
    [(CAShapeLayer *)self->_dialDarkeningLayer setFillRule:kCAFillRuleEvenOdd];
    id v9 = +[UIColor blackColor];
    -[CAShapeLayer setFillColor:](self->_dialDarkeningLayer, "setFillColor:", [v9 CGColor]);

    double v10 = self->_dialDarkeningLayer;
    CFStringRef v32 = @"opacity";
    double v11 = +[NSNull null];
    v33 = v11;
    id v12 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    [(CAShapeLayer *)v10 setActions:v12];

    id v13 = [(UIView *)self->_darkeningContainerView layer];
    [v13 addSublayer:self->_dialDarkeningLayer];

    CGPathRelease(v6);
    [(NTKSiderealTimeView *)self->_siderealTimeView frame];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    id v22 = (CALayer *)objc_alloc_init((Class)CALayer);
    timeViewDarkeningLayer = self->_timeViewDarkeningLayer;
    self->_timeViewDarkeningLayer = v22;

    -[CALayer setFrame:](self->_timeViewDarkeningLayer, "setFrame:", v15, v17, v19, v21);
    [(CALayer *)self->_timeViewDarkeningLayer setCornerRadius:v19 * 0.5];
    double v24 = self->_timeViewDarkeningLayer;
    id v25 = +[UIColor blackColor];
    -[CALayer setBackgroundColor:](v24, "setBackgroundColor:", [v25 CGColor]);

    double v26 = self->_timeViewDarkeningLayer;
    CFStringRef v30 = @"opacity";
    v27 = +[NSNull null];
    v31 = v27;
    v28 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    [(CALayer *)v26 setActions:v28];

    v29 = [(UIView *)self->_darkeningContainerView layer];
    [v29 addSublayer:self->_timeViewDarkeningLayer];

    [(NTKSiderealFaceView *)self insertSubview:self->_darkeningContainerView aboveSubview:self->_dialBackgroundView];
  }
}

- (void)tearDownDarkeningView
{
  [(UIView *)self->_darkeningContainerView removeFromSuperview];
  darkeningContainerView = self->_darkeningContainerView;
  self->_darkeningContainerView = 0;
}

- (id)_keylineViewForComplicationSlot:(id)a3
{
  id v4 = a3;
  double v5 = [(NTKWhistlerAnalogFaceViewComplicationFactory *)self->_faceViewComplicationFactory keylineViewForComplicationSlot:v4];
  double v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)NTKSiderealFaceView;
    id v7 = [(NTKSiderealFaceView *)&v10 _keylineViewForComplicationSlot:v4];
  }
  double v8 = v7;

  return v8;
}

- (int64_t)_keylineStyleForComplicationSlot:(id)a3
{
  return (int64_t)[(NTKWhistlerAnalogFaceViewComplicationFactory *)self->_faceViewComplicationFactory keylineStyleForComplicationSlot:a3];
}

- (id)_keylineViewForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 15)
  {
    [(NTKSiderealFaceView *)self _faceEditingScaleForEditMode:15 slot:a4];
    [(NTKSiderealTimeView *)self->_siderealTimeView bounds];
    double v5 = NTKKeylineViewWithCircle();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NTKSiderealFaceView;
    double v5 = [(NTKSiderealFaceView *)&v7 _keylineViewForCustomEditMode:a3 slot:a4];
  }

  return v5;
}

- (unint64_t)_keylineLabelAlignmentForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 15) {
    return 148;
  }
  uint64_t v8 = v4;
  uint64_t v9 = v5;
  v7.receiver = self;
  v7.super_class = (Class)NTKSiderealFaceView;
  return [(NTKSiderealFaceView *)&v7 _keylineLabelAlignmentForCustomEditMode:a3 slot:a4];
}

- (CGRect)_relativeKeylineFrameForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 15)
  {
    [(NTKSiderealFaceView *)self _timeViewKeylineFrameForEditing];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKSiderealFaceView;
    [(NTKSiderealFaceView *)&v8 _relativeKeylineFrameForCustomEditMode:a3 slot:a4];
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)_timeViewKeylineFrameForEditing
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_35940);
  id WeakRetained = objc_loadWeakRetained(&qword_35948);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  double v4 = WeakRetained;
  id v5 = [(NTKSiderealFaceView *)self device];
  id v6 = objc_loadWeakRetained(&qword_35948);
  if (v5 != v6)
  {

LABEL_5:
    objc_super v10 = [(NTKSiderealFaceView *)self device];
    objc_storeWeak(&qword_35948, v10);

    id v11 = objc_loadWeakRetained(&qword_35948);
    qword_35950 = (uint64_t)[v11 version];

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1568C;
    v17[3] = &unk_2CC48;
    v17[4] = self;
    id v12 = [(NTKSiderealFaceView *)self device];
    sub_1568C((uint64_t)v17, v12);

    goto LABEL_6;
  }
  double v7 = [(NTKSiderealFaceView *)self device];
  id v8 = [v7 version];
  uint64_t v9 = qword_35950;

  if (v8 != (id)v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_35940);
  double v13 = *(double *)&qword_35920;
  double v14 = *(double *)&qword_35928;
  double v15 = *(double *)&qword_35930;
  double v16 = *(double *)&qword_35938;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)_loadLayoutRules
{
  faceViewComplicationFactory = self->_faceViewComplicationFactory;
  id v4 = [(NTKSiderealFaceView *)self device];
  sub_11DF8(v4, v5);
  [(NTKWhistlerAnalogFaceViewComplicationFactory *)faceViewComplicationFactory loadLayoutRulesForFaceView:self dialDiameter:v5[0]];
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  return [(NTKWhistlerAnalogFaceViewComplicationFactory *)self->_faceViewComplicationFactory newLegacyViewForComplication:a3 family:a4 slot:a5 faceView:self];
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6 = a3;
  [(NTKWhistlerAnalogFaceViewComplicationFactory *)self->_faceViewComplicationFactory configureComplicationView:v6 forSlot:a4 faceView:self];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 updateMonochromeColor];
  }
}

- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4
{
  return (int64_t)[(NTKWhistlerAnalogFaceViewComplicationFactory *)self->_faceViewComplicationFactory legacyLayoutOverrideforComplicationType:a3 slot:a4 faceView:self];
}

- (int64_t)_complicationPickerStyleForSlot:(id)a3
{
  return (int64_t)[(NTKWhistlerAnalogFaceViewComplicationFactory *)self->_faceViewComplicationFactory complicationPickerStyleForSlot:a3];
}

- (id)_dialViewImageRef
{
  id v3 = [NTKSiderealCachedMTLTexture alloc];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_15940;
  v6[3] = &unk_2CC70;
  void v6[4] = self;
  id v4 = [(NTKSiderealCachedMTLTexture *)v3 initWithCachedImageKey:NTKSiderealCacheDialViewKey isAlphaOnly:1 imageGenerationBlock:v6];

  return v4;
}

- (id)_waypointViewImageRef
{
  id v3 = [NTKSiderealCachedMTLTexture alloc];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_15B10;
  v6[3] = &unk_2CC70;
  void v6[4] = self;
  id v4 = [(NTKSiderealCachedMTLTexture *)v3 initWithCachedImageKey:NTKSiderealCacheWaypointViewKey isAlphaOnly:1 imageGenerationBlock:v6];

  return v4;
}

- (id)_newGnomonLayer
{
  long long v10 = 0u;
  unint64_t v2 = +[CLKDevice currentDevice];
  sub_11DF8(v2, &v9);

  id v3 = +[CAGradientLayer layer];
  [v3 setOpaque:0];
  objc_msgSend(v3, "setFrame:", 0.0, 0.0, v10);
  objc_msgSend(v3, "setStartPoint:", 0.0, 0.5);
  objc_msgSend(v3, "setEndPoint:", 1.0, 0.5);
  [v3 setType:kCAGradientLayerAxial];
  [v3 setLocations:&off_2E0A0];
  CGColorRef SRGB = CGColorCreateSRGB(1.0, 1.0, 1.0, 0.0);
  v11[0] = SRGB;
  CGColorRef v5 = CGColorCreateSRGB(0.8, 0.941176471, 1.0, 0.3);
  v11[1] = v5;
  CGColorRef v6 = CGColorCreateSRGB(1.0, 1.0, 1.0, 0.0);
  v11[2] = v6;
  double v7 = +[NSArray arrayWithObjects:v11 count:3];
  [v3 setColors:v7];

  return v3;
}

- (id)_gnomonImage
{
  id v3 = [NTKSiderealCachedMTLTexture alloc];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_15EB4;
  v6[3] = &unk_2CC70;
  void v6[4] = self;
  id v4 = [(NTKSiderealCachedMTLTexture *)v3 initWithCachedImageKey:NTKSiderealCacheGnomonViewKey isAlphaOnly:1 imageGenerationBlock:v6];

  return v4;
}

- (id)_dayGnomonImageFromSolarContainerView:(id)a3
{
  id v4 = a3;
  CGColorRef v5 = [NTKSiderealCachedMTLTexture alloc];
  uint64_t v6 = NTKSiderealCacheDayGnomonImageViewKey;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_160F4;
  v10[3] = &unk_2CC98;
  id v11 = v4;
  id v12 = self;
  id v7 = v4;
  id v8 = [(NTKSiderealCachedMTLTexture *)v5 initWithCachedImageKey:v6 isAlphaOnly:1 imageGenerationBlock:v10];

  return v8;
}

- (id)_dayDiskBloomImageFromSolarContainerView:(id)a3
{
  id v4 = a3;
  CGColorRef v5 = [NTKSiderealCachedMTLTexture alloc];
  uint64_t v6 = NTKSiderealCacheDayDiskBloomImageViewKey;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1626C;
  v10[3] = &unk_2CC98;
  id v11 = v4;
  id v12 = self;
  id v7 = v4;
  id v8 = [(NTKSiderealCachedMTLTexture *)v5 initWithCachedImageKey:v6 isAlphaOnly:1 imageGenerationBlock:v10];

  return v8;
}

- (id)_dayDiscImageFromSolarContainerView:(id)a3
{
  id v4 = a3;
  CGColorRef v5 = [NTKSiderealCachedMTLTexture alloc];
  uint64_t v6 = NTKSiderealCacheDayDiscImageViewKey;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_163E4;
  v10[3] = &unk_2CC98;
  id v11 = v4;
  id v12 = self;
  id v7 = v4;
  id v8 = [(NTKSiderealCachedMTLTexture *)v5 initWithCachedImageKey:v6 isAlphaOnly:1 imageGenerationBlock:v10];

  return v8;
}

- (id)_nightGnomonImageFromSolarContainerView:(id)a3
{
  id v4 = a3;
  CGColorRef v5 = [NTKSiderealCachedMTLTexture alloc];
  uint64_t v6 = NTKSiderealCacheNightGnomonImageViewKey;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1655C;
  v10[3] = &unk_2CC98;
  id v11 = v4;
  id v12 = self;
  id v7 = v4;
  id v8 = [(NTKSiderealCachedMTLTexture *)v5 initWithCachedImageKey:v6 isAlphaOnly:1 imageGenerationBlock:v10];

  return v8;
}

- (id)_nightDiscImageFromSolarContainerView:(id)a3
{
  id v4 = a3;
  CGColorRef v5 = [NTKSiderealCachedMTLTexture alloc];
  uint64_t v6 = NTKSiderealCacheNightDiscImageViewKey;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_166D4;
  v10[3] = &unk_2CC98;
  id v11 = v4;
  id v12 = self;
  id v7 = v4;
  id v8 = [(NTKSiderealCachedMTLTexture *)v5 initWithCachedImageKey:v6 isAlphaOnly:1 imageGenerationBlock:v10];

  return v8;
}

- (id)_nightRingImageFromSolarContainerView:(id)a3
{
  id v4 = a3;
  CGColorRef v5 = [NTKSiderealCachedMTLTexture alloc];
  uint64_t v6 = NTKSiderealCacheNightRingImageViewKey;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1684C;
  v10[3] = &unk_2CC98;
  id v11 = v4;
  id v12 = self;
  id v7 = v4;
  id v8 = [(NTKSiderealCachedMTLTexture *)v5 initWithCachedImageKey:v6 isAlphaOnly:1 imageGenerationBlock:v10];

  return v8;
}

- (CGImage)newImageRefFromSolarContainerView:(id)a3 withHeight:(double)a4
{
  id v6 = a3;
  [v6 bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  id v11 = [(NTKSiderealFaceView *)self device];
  [v11 screenScale];
  CGFloat v13 = v12;
  v21.width = v8;
  v21.height = v10;
  UIGraphicsBeginImageContextWithOptions(v21, 0, v13);

  CurrentContext = UIGraphicsGetCurrentContext();
  double v15 = [v6 layer];

  [v15 renderInContext:CurrentContext];
  Image = CGBitmapContextCreateImage(CurrentContext);
  UIGraphicsEndImageContext();
  double Width = (double)CGImageGetWidth(Image);
  size_t Height = CGImageGetHeight(Image);
  v22.origin.x = Width * 0.5;
  v22.origin.y = ((double)Height + a4 * -2.0) * 0.5;
  v22.size.height = a4 + a4;
  v22.size.width = Width * 0.5;
  double v19 = CGImageCreateWithImageInRect(Image, v22);
  CGImageRelease(Image);
  return v19;
}

- (CGImage)newImageRefFromView:(id)a3
{
  id v4 = a3;
  CGColorRef v5 = [(NTKSiderealFaceView *)self device];
  [v5 screenBounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v10 = [(NTKSiderealFaceView *)self device];
  [v10 screenScale];
  CGFloat v12 = v11;
  v26.width = v7;
  v26.height = v9;
  UIGraphicsBeginImageContextWithOptions(v26, 0, v12);

  CurrentContext = UIGraphicsGetCurrentContext();
  double v14 = [v4 layer];

  [v14 renderInContext:CurrentContext];
  Image = CGBitmapContextCreateImage(CurrentContext);
  UIGraphicsEndImageContext();
  double Width = (double)CGImageGetWidth(Image);
  double Height = (double)CGImageGetHeight(Image);
  double v18 = [(NTKSiderealFaceView *)self device];
  sub_11DF8(v18, v25);
  double v19 = v25[0];
  double v20 = [(NTKSiderealFaceView *)self device];
  [v20 screenScale];
  CGFloat v22 = v19 * v21;

  v27.origin.x = (Width - v22) * 0.5;
  v27.origin.y = (Height - v22) * 0.5;
  v27.size.width = v22;
  v27.size.height = v22;
  double v23 = CGImageCreateWithImageInRect(Image, v27);
  CGImageRelease(Image);
  return v23;
}

- (id)closestWaypointForSolarDayProgress:(double)a3 range:(double)a4
{
  float v6 = a3 * 360.0;
  float v7 = fmodf(v6, 360.0);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  double v8 = [(NTKSiderealData *)self->_currentData waypoints];
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    id v10 = v9;
    double v11 = 0;
    double v12 = v7;
    uint64_t v13 = *(void *)v23;
    double v14 = 1.79769313e308;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v8);
        }
        double v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        [v16 degree];
        double v18 = vabdd_f64(v17, v12);
        if (v18 <= a4 && v18 < v14)
        {
          id v20 = v16;

          double v11 = v20;
          double v14 = v18;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

- (id)waypointBetweenPreviousOffset:(double)a3 currentOffset:(double)a4
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  float v6 = [(NTKSiderealData *)self->_currentData waypoints];
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v11 degree];
        NTKSiderealDegreesToSolarDayProgress();
        if ((v12 <= a3 || v12 >= a4) && (v12 <= a4 || v12 >= a3)) {
          continue;
        }
        id v15 = v11;
        goto LABEL_19;
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      id v15 = 0;
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v15 = 0;
  }
LABEL_19:

  return v15;
}

- (CGAffineTransform)_timeViewScaleTransform
{
  return CGAffineTransformMakeScale(retstr, self->_breathScaleModifier * self->_rubberBandScaleModifier, self->_breathScaleModifier * self->_rubberBandScaleModifier);
}

- (double)_solarDayProgressForCurrentTime
{
  unint64_t v2 = [(NTKSiderealFaceView *)self _faceDisplayTime];
  +[NTKSiderealDataSource reverseInterpolateBetweenCalendricalMidnights:v2];
  double v4 = v3;

  return v4;
}

- (double)_idealizedSolarDayProgress
{
  unint64_t v2 = NTKIdealizedDate();
  +[NTKSiderealDataSource reverseInterpolateBetweenCalendricalMidnights:v2];
  double v4 = v3;

  return v4;
}

- (CGPath)newTimeViewPathForDarkeningView
{
  memset(&transform, 0, sizeof(transform));
  CGAffineTransformMakeScale(&transform, 1.02, 1.02);
  [(NTKSiderealDialBackgroundView *)self->_dialBackgroundView frame];
  CGFloat v4 = v3 * -0.01;
  [(NTKSiderealDialBackgroundView *)self->_dialBackgroundView frame];
  CGAffineTransform v9 = transform;
  CGAffineTransformTranslate(&v10, &v9, v4, v5 * -0.01);
  CGAffineTransform transform = v10;
  [(NTKSiderealDialBackgroundView *)self->_dialBackgroundView frame];
  float v6 = CGPathCreateWithEllipseInRect(v12, &transform);
  MutableCopy = CGPathCreateMutableCopy(v6);
  CGPathRelease(v6);
  [(NTKSiderealTimeView *)self->_siderealTimeView frame];
  CGPathAddEllipseInRect(MutableCopy, 0, v13);
  return MutableCopy;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  float v6 = [(NTKSiderealFaceView *)self _outerComplicationColors];
  id v7 = [(NTKSiderealFaceView *)self _innerComplicationColors];
  id v8 = CLKUIMonochromeFiltersForStyleWithTintedBackground();

  return v8;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4
{
  return [(NTKSiderealFaceView *)self filtersForView:a3 style:a4 fraction:1.0];
}

- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  id v7 = [(NTKSiderealFaceView *)self _outerComplicationColors];
  id v8 = [(NTKSiderealFaceView *)self _innerComplicationColors];
  switch(a4)
  {
    case 0:
    case 2:
      int64_t v9 = NTKFlatMonochromeFilter();
      goto LABEL_4;
    case 1:
    case 3:
    case 4:
    case 5:
      int64_t v9 = NTKDesatMonochromeFilter();
LABEL_4:
      a4 = v9;
      break;
    default:
      break;
  }

  return (id)a4;
}

- (id)filterForView:(id)a3 style:(int64_t)a4
{
  float v6 = [(NTKSiderealFaceView *)self _outerComplicationColors];
  id v7 = [(NTKSiderealFaceView *)self _innerComplicationColors];
  switch(a4)
  {
    case 0:
    case 2:
      int64_t v8 = NTKFlatMonochromeFilterOpaque();
      goto LABEL_4;
    case 1:
    case 3:
    case 4:
    case 5:
      int64_t v8 = NTKDesatMonochromeFilterOpaque();
LABEL_4:
      a4 = v8;
      break;
    default:
      break;
  }

  return (id)a4;
}

- (id)colorForView:(id)a3 accented:(BOOL)a4
{
  if (a4) {
    [(NTKSiderealFaceView *)self _innerComplicationColors];
  }
  else {
  CGFloat v4 = [(NTKSiderealFaceView *)self _outerComplicationColors];
  }

  return v4;
}

- (id)backgroundColorForView:(id)a3
{
  return 0;
}

- (id)_outerComplicationColors
{
  if (qword_35960 != -1) {
    dispatch_once(&qword_35960, &stru_2CCB8);
  }
  double v3 = (void *)qword_35958;
  [(NTKSiderealData *)self->_currentData altitudeForProgress:self->_currentSolarDayProgress];

  return objc_msgSend(v3, "colorForAltitude:");
}

- (id)_innerComplicationColors
{
  if (qword_35970 != -1) {
    dispatch_once(&qword_35970, &stru_2CCD8);
  }
  double v3 = (void *)qword_35968;
  [(NTKSiderealData *)self->_currentData altitudeForProgress:self->_currentSolarDayProgress];

  return objc_msgSend(v3, "colorForAltitude:");
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  int64_t v9 = v8;
  if (a4 == 15)
  {
    CGAffineTransform v10 = (char *)[v8 style];
    CFStringRef v11 = @"Digital";
    if (v10 != (unsigned char *)&dword_0 + 1) {
      CFStringRef v11 = 0;
    }
    if (!v10) {
      CFStringRef v11 = @"Analog";
    }
    CGRect v12 = +[NSString stringWithFormat:@"Swatch-Sidereal-%@", v11];
    CGRect v13 = +[NTKSolarDialFaceBundle imageWithName:v12];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)NTKSiderealFaceView;
    CGRect v13 = [(NTKSiderealFaceView *)&v15 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:a5];
  }

  return v13;
}

- (void)performScrollTestNamed:(id)a3 completion:(id)a4
{
  double v5 = (void (**)(void))a4;
  [(NTKSiderealFaceView *)self _setSolarDayProgress:0.0];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_175F4;
  v6[3] = &unk_2CC00;
  void v6[4] = self;
  [(NTKSiderealFaceView *)self _animateSolarDayFromProgress:v6 toProgress:0.0 minDuration:1.0 completion:1.0];
  if (v5) {
    v5[2](v5);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModeTapButton, 0);
  objc_storeStrong((id *)&self->_interactiveModeDateFormatter, 0);
  objc_storeStrong((id *)&self->_timeViewDarkeningLayer, 0);
  objc_storeStrong((id *)&self->_dialDarkeningLayer, 0);
  objc_storeStrong((id *)&self->_darkeningContainerView, 0);
  objc_storeStrong((id *)&self->_offsetLabel, 0);
  objc_storeStrong((id *)&self->_siderealTimeView, 0);
  objc_storeStrong((id *)&self->_auxiliaryDialLabels, 0);
  objc_storeStrong((id *)&self->_dialBackgroundView, 0);
  objc_storeStrong((id *)&self->_clockTimerToken, 0);
  objc_storeStrong((id *)&self->_currentData, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_buttonPressTimer, 0);
  objc_storeStrong((id *)&self->_wheelDelayTimer, 0);

  objc_storeStrong((id *)&self->_faceViewComplicationFactory, 0);
}

@end