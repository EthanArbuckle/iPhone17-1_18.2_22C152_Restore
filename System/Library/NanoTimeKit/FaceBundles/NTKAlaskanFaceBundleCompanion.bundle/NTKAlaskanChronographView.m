@interface NTKAlaskanChronographView
- (BOOL)isChronoMode;
- (BOOL)isEditing;
- (BOOL)isRunning;
- (BOOL)showTimelapsedByMinutes;
- (CALayer)centerLabelBackgroundLayer;
- (CALayer)innerBackgroundCircle;
- (CALayer)outerBackgroundCircle;
- (CLKClockTimerToken)tachymeterTimerToken;
- (CLKDevice)device;
- (CLKUIColoringLabel)centerLabel;
- (CLKUIColoringLabel)topLabel;
- (CLKUIColoringLabel)transitionCenterLabel;
- (NSDate)date;
- (NSDate)overrideDate;
- (NTKAlaskanChronoButton)resetButton;
- (NTKAlaskanChronoButton)startStopButton;
- (NTKAlaskanChronoDialView)dialTickView;
- (NTKAlaskanChronoDialView)transitionDialTickView;
- (NTKAlaskanChronoSubdialView)bottomSubdialView;
- (NTKAlaskanChronoSubdialView)leftSubdialView;
- (NTKAlaskanChronoSubdialView)rightSubdialView;
- (NTKAlaskanChronoSubdialView)transitionLeftSubdialView;
- (NTKAlaskanChronoSubdialView)transitionRightSubdialView;
- (NTKAlaskanChronographView)initWithFrame:(CGRect)a3;
- (NTKAlaskanChronographViewDelegate)delegate;
- (NTKAlaskanDialViewFactory)dialViewFactory;
- (NTKAlaskanStopwatch)stopwatchModel;
- (NTKAlaskanSubdialViewFactory)subdialViewFactory;
- (NTKChronographProFacePalette)originalPalette;
- (NTKChronographProFacePalette)palette;
- (NTKHandView)primaryHandView;
- (NTKHandView)secondaryHandView;
- (UIColor)topLabelPrefixColor;
- (UIColor)topLabelSuffixColor;
- (UIView)chronometerHandsParentView;
- (double)_stopwatchCurrentLapTime;
- (double)_stopwatchElapsedTimeToDate:(id)a3;
- (double)bottomSubdialAnalogHandsFullRotationDuration;
- (double)bottomSubdialHandsAnimationFPS;
- (double)diameter;
- (double)largeAnalogHandsFullRotationDuration;
- (double)largeHandsAnimationFPS;
- (double)leftSubdialAnalogHandsFullRotationDuration;
- (double)leftSubdialHandsAnimationFPS;
- (double)resetButtonAlpha;
- (double)rightSubdialAnalogHandsFullRotationDuration;
- (double)rightSubdialHandsAnimationFPS;
- (double)secondsAngleForCurrentDate;
- (double)startStopButtonAlpha;
- (float)zRotationForTime:(double)a3 withDuration:(float)a4;
- (id)_lapTimelapsedTextProviderWithDate:(id)a3;
- (id)_newCenterLabel;
- (id)_stopwatchStartDateRelativeToDate:(id)a3;
- (id)_tachymeterTextProviderWithTimeInterval:(double)a3;
- (id)_tachymeterTextProviderWithTimeInterval:(double)a3 dropPrefix:(BOOL)a4;
- (id)_tachymeterTextProviderWithTimeInterval:(double)a3 dropPrefix:(BOOL)a4 dropSuffix:(BOOL)a5;
- (id)_totalTimelapsedTextProviderWithDate:(id)a3;
- (id)currentDate;
- (id)currentDateTextProvider;
- (id)dialViewForTimeScale:(unint64_t)a3;
- (id)layerDisabledActions;
- (id)leftSubdialViewForTimeScale:(unint64_t)timeScale;
- (id)rightSubdialViewForTimeScale:(unint64_t)timeScale;
- (id)titleForTimeScale:(unint64_t)a3;
- (unint64_t)nextTimeScale;
- (unint64_t)previousTimeScale;
- (unint64_t)timeScale;
- (void)_cleanupSubdialView:(id)a3;
- (void)_setUpUIForTimeScale:(unint64_t)a3;
- (void)_updateElapsedTimeLabel;
- (void)_updateTachymeterLabel;
- (void)applyPalette:(id)a3;
- (void)applyTransitionFromTimeModeToChronometerModeWithfraction:(double)a3;
- (void)applyTransitionFromTimeScale:(unint64_t)a3 toTimeScale:(unint64_t)a4 fraction:(double)a5;
- (void)applyTransitionFromView:(id)a3 toView:(id)a4 fraction:(double)a5;
- (void)applyTransitionTritiumOnWithFraction:(double)a3;
- (void)cleanUpTimeScaleTransition;
- (void)configureHandsAnimation:(id)a3 currentRadians:(double)a4 durationOfFullRotation:(double)a5 fps:(double)a6;
- (void)dealloc;
- (void)enableDisableResetButton;
- (void)handleResetButtonTap;
- (void)handleStartStopButtonTap;
- (void)handleTapGestureRecognizer:(id)a3;
- (void)layoutSubviews;
- (void)removeAllTransitionViews;
- (void)setBottomSubdialView:(id)a3;
- (void)setCenterLabel:(id)a3;
- (void)setCenterLabelBackgroundLayer:(id)a3;
- (void)setChronometerHandsParentView:(id)a3;
- (void)setDate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDialTickView:(id)a3;
- (void)setDialViewFactory:(id)a3;
- (void)setDiameter:(double)a3;
- (void)setInnerBackgroundCircle:(id)a3;
- (void)setIsChronoMode:(BOOL)a3;
- (void)setIsChronoMode:(BOOL)a3 completionBlock:(id)a4 animated:(BOOL)a5;
- (void)setIsEditing:(BOOL)a3;
- (void)setLeftSubdialView:(id)a3;
- (void)setOriginalPalette:(id)a3;
- (void)setOuterBackgroundCircle:(id)a3;
- (void)setOverrideDate:(id)a3;
- (void)setOverrideDate:(id)a3 animatingAnalogHands:(BOOL)a4;
- (void)setPalette:(id)a3;
- (void)setPrimaryHandView:(id)a3;
- (void)setResetButton:(id)a3;
- (void)setRightSubdialView:(id)a3;
- (void)setSecondaryHandView:(id)a3;
- (void)setShowTimelapsedByMinutes:(BOOL)a3;
- (void)setStartStopButton:(id)a3;
- (void)setStopwatchModel:(id)a3;
- (void)setStopwatchModel:(id)a3 animating:(BOOL)a4;
- (void)setSubdialViewFactory:(id)a3;
- (void)setTachymeterTimerToken:(id)a3;
- (void)setTimeScale:(unint64_t)a3;
- (void)setTopLabel:(id)a3;
- (void)setTopLabelPrefixColor:(id)a3;
- (void)setTopLabelSuffixColor:(id)a3;
- (void)setTransitionCenterLabel:(id)a3;
- (void)setTransitionDialTickView:(id)a3;
- (void)setTransitionLeftSubdialView:(id)a3;
- (void)setTransitionRightSubdialView:(id)a3;
- (void)setupForChronographMode;
- (void)setupForChronographModeWithCompletionBlock:(id)a3;
- (void)setupForTimeMode;
- (void)setupForTimeModeWithCompletionBlock:(id)a3 animated:(BOOL)a4;
- (void)startAnimatingHands;
- (void)startAnimatingSubdialMinuteHand;
- (void)startStopTachymeterUnitUpdates:(BOOL)a3;
- (void)stopAnimatingHands;
- (void)stopAnimatingSubdialMinuteHand;
- (void)stopHandAnimation:(id)a3;
- (void)switchBottomSubDialView;
- (void)switchDialViewForTimeScale:(unint64_t)a3;
- (void)switchDialViewForTimeScale:(unint64_t)a3 setTopLabel:(BOOL)a4;
- (void)switchLeftSubDialViewsForTimeScale:(unint64_t)a3;
- (void)switchRightSubDialViewsForTimeScale:(unint64_t)a3;
- (void)switchSubDialViewsForTimeScale:(unint64_t)a3;
- (void)updateAnalogHandsPositionAnimated:(BOOL)a3;
- (void)updateCenterLabelColor;
- (void)updateCenterLabelColorForChronometerMode;
- (void)updateCenterLabelColorForTimeMode;
- (void)updateChronoLargeHandsCenterPoint;
- (void)updateHandsPosition;
- (void)updateInnerCircleColor;
- (void)updateSecondaryHandVisibility;
- (void)updateStartStopButtonColor;
- (void)updateSubdialMinuteHandPosition;
- (void)updateSubdialViewFrames;
@end

@implementation NTKAlaskanChronographView

- (NTKAlaskanChronographView)initWithFrame:(CGRect)a3
{
  v35.receiver = self;
  v35.super_class = (Class)NTKAlaskanChronographView;
  v3 = -[NTKAlaskanChronographView initWithFrame:](&v35, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[NTKFaceViewRenderingContext sharedRenderingContext];
    uint64_t v5 = [v4 device];
    device = v3->_device;
    v3->_device = (CLKDevice *)v5;

    v7 = objc_alloc_init(NTKAlaskanDialViewFactory);
    dialViewFactory = v3->_dialViewFactory;
    v3->_dialViewFactory = v7;

    v9 = objc_alloc_init(NTKAlaskanSubdialViewFactory);
    subdialViewFactory = v3->_subdialViewFactory;
    v3->_subdialViewFactory = v9;

    uint64_t v11 = +[UIColor colorWithWhite:0.5 alpha:1.0];
    topLabelPrefixColor = v3->_topLabelPrefixColor;
    v3->_topLabelPrefixColor = (UIColor *)v11;

    uint64_t v13 = +[UIColor whiteColor];
    topLabelSuffixColor = v3->_topLabelSuffixColor;
    v3->_topLabelSuffixColor = (UIColor *)v13;

    v15 = [(NTKAlaskanChronographView *)v3 layerDisabledActions];
    uint64_t v16 = objc_opt_new();
    outerBackgroundCircle = v3->_outerBackgroundCircle;
    v3->_outerBackgroundCircle = (CALayer *)v16;

    [(CALayer *)v3->_outerBackgroundCircle setMasksToBounds:1];
    [(CALayer *)v3->_outerBackgroundCircle setActions:v15];
    v18 = [(NTKAlaskanChronographView *)v3 layer];
    [v18 addSublayer:v3->_outerBackgroundCircle];

    uint64_t v19 = objc_opt_new();
    innerBackgroundCircle = v3->_innerBackgroundCircle;
    v3->_innerBackgroundCircle = (CALayer *)v19;

    [(CALayer *)v3->_innerBackgroundCircle setMasksToBounds:1];
    [(CALayer *)v3->_innerBackgroundCircle setActions:v15];
    v21 = [(NTKAlaskanChronographView *)v3 layer];
    [v21 addSublayer:v3->_innerBackgroundCircle];

    v22 = [(NTKAlaskanChronographView *)v3 device];
    v23 = +[CLKUIAnalogHandConfiguration defaultSecondConfigurationForDevice:v22];

    id v24 = objc_alloc((Class)NTKHandView);
    v25 = [(NTKAlaskanChronographView *)v3 device];
    v26 = (NTKHandView *)[v24 initWithConfiguration:v23 forDevice:v25 maskedShadow:1];
    primaryHandView = v3->_primaryHandView;
    v3->_primaryHandView = v26;

    [(NTKHandView *)v3->_primaryHandView anchorPointFromConfiguration];
    double v29 = v28;
    double v31 = v30;
    v32 = [(NTKHandView *)v3->_primaryHandView layer];
    objc_msgSend(v32, "setAnchorPoint:", v29, v31);

    [(NTKAlaskanChronographView *)v3 addSubview:v3->_primaryHandView];
    id v33 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v3 action:"handleTapGestureRecognizer:"];
    [(NTKAlaskanChronographView *)v3 addGestureRecognizer:v33];
    [(NTKAlaskanChronographView *)v3 setupForTimeMode];
    [(NTKAlaskanChronographView *)v3 setStopwatchModel:0];
  }
  return v3;
}

- (id)layerDisabledActions
{
  v2 = +[NSNull null];
  v5[0] = @"contents";
  v5[1] = @"backgroundColor";
  v6[0] = v2;
  v6[1] = v2;
  v5[2] = @"transform";
  v5[3] = @"bounds";
  v6[2] = v2;
  v6[3] = v2;
  v5[4] = @"position";
  v5[5] = @"opacity";
  v6[4] = v2;
  v6[5] = v2;
  v5[6] = @"mask";
  v6[6] = v2;
  v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:7];

  return v3;
}

- (void)dealloc
{
  [(NTKHandView *)self->_primaryHandView removeFromSuperview];
  [(NTKHandView *)self->_secondaryHandView removeFromSuperview];
  if (self->_tachymeterTimerToken)
  {
    v3 = +[CLKClockTimer sharedInstance];
    [v3 stopUpdatesForToken:self->_tachymeterTimerToken];
  }
  v4.receiver = self;
  v4.super_class = (Class)NTKAlaskanChronographView;
  [(NTKAlaskanChronographView *)&v4 dealloc];
}

- (void)setIsEditing:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isEditing = a3;
  -[CLKUIColoringLabel setHidden:](self->_topLabel, "setHidden:");
  [(NTKAlaskanChronoButton *)self->_resetButton setHidden:v3];
  [(NTKAlaskanChronoButton *)self->_startStopButton setHidden:v3];
  if (!v3)
  {
    [(CLKUIColoringLabel *)self->_transitionCenterLabel removeFromSuperview];
    transitionCenterLabel = self->_transitionCenterLabel;
    self->_transitionCenterLabel = 0;
  }
}

- (void)setPalette:(id)a3
{
  objc_storeStrong((id *)&self->_originalPalette, a3);
  id v5 = a3;
  [(NTKAlaskanChronographView *)self applyPalette:v5];
}

- (void)applyPalette:(id)a3
{
  p_palette = &self->_palette;
  objc_storeStrong((id *)&self->_palette, a3);
  id v6 = a3;
  [(NTKAlaskanDialViewFactory *)self->_dialViewFactory setPalette:v6];
  [(NTKAlaskanSubdialViewFactory *)self->_subdialViewFactory setPalette:v6];
  id v7 = [(NTKChronographProFacePalette *)*p_palette ring];
  -[CALayer setBackgroundColor:](self->_outerBackgroundCircle, "setBackgroundColor:", [v7 CGColor]);

  v8 = [(NTKChronographProFacePalette *)*p_palette lapHand1];
  [(NTKHandView *)self->_primaryHandView setTintColor:v8];

  v9 = [(NTKChronographProFacePalette *)*p_palette lapHand2];
  [(NTKHandView *)self->_secondaryHandView setTintColor:v9];

  v10 = [(NTKChronographProFacePalette *)*p_palette resetButton];
  [(NTKAlaskanChronoButton *)self->_resetButton setTintColor:v10];

  uint64_t v11 = [(NTKAlaskanChronographView *)self dialTickView];
  [v11 updateWithColorPalette:*p_palette];

  [(NTKAlaskanChronoSubdialView *)self->_leftSubdialView updateWithColorPalette:*p_palette];
  [(NTKAlaskanChronoSubdialView *)self->_rightSubdialView updateWithColorPalette:*p_palette];
  [(NTKAlaskanChronoSubdialView *)self->_bottomSubdialView updateWithColorPalette:*p_palette];

  [(NTKAlaskanChronographView *)self updateStartStopButtonColor];
  [(NTKAlaskanChronographView *)self updateInnerCircleColor];

  [(NTKAlaskanChronographView *)self updateCenterLabelColor];
}

- (void)updateStartStopButtonColor
{
  unsigned int v3 = [(NTKAlaskanChronographView *)self isRunning];
  palette = self->_palette;
  if (v3)
  {
    id v6 = [(NTKChronographProFacePalette *)palette stopButton];
    id v5 = [(NTKAlaskanChronographView *)self startStopButton];
    [v5 setTintColor:v6];
  }
  else
  {
    id v6 = [(NTKChronographProFacePalette *)palette startButton];
    -[NTKAlaskanChronoButton setTintColor:](self->_startStopButton, "setTintColor:");
  }
}

- (void)updateInnerCircleColor
{
  BOOL isChronoMode = self->_isChronoMode;
  palette = self->_palette;
  if (isChronoMode) {
    [(NTKChronographProFacePalette *)palette backgroundChronometerMode];
  }
  else {
  id v5 = [(NTKChronographProFacePalette *)palette backgroundTimeMode];
  }
  -[CALayer setBackgroundColor:](self->_innerBackgroundCircle, "setBackgroundColor:", [v5 CGColor]);
}

- (void)updateCenterLabelColor
{
  if (self->_isChronoMode) {
    [(NTKAlaskanChronographView *)self updateCenterLabelColorForChronometerMode];
  }
  else {
    [(NTKAlaskanChronographView *)self updateCenterLabelColorForTimeMode];
  }
}

- (void)updateCenterLabelColorForTimeMode
{
  id v4 = [(NTKChronographProFacePalette *)self->_palette timeLapsedInactiveLabel];
  unsigned int v3 = [(NTKAlaskanChronographView *)self centerLabel];
  [v3 setTextColor:v4];

  if ([(NTKAlaskanChronographView *)self isEditing]) {
    [(CLKUIColoringLabel *)self->_transitionCenterLabel setTextColor:v4];
  }
}

- (void)updateCenterLabelColorForChronometerMode
{
  id v4 = [(NTKChronographProFacePalette *)self->_palette timeLapsedLabel];
  unsigned int v3 = [(NTKAlaskanChronographView *)self centerLabel];
  [v3 setTextColor:v4];

  if ([(NTKAlaskanChronographView *)self isEditing]) {
    [(CLKUIColoringLabel *)self->_transitionCenterLabel setTextColor:v4];
  }
}

- (NTKHandView)secondaryHandView
{
  secondaryHandView = self->_secondaryHandView;
  if (!secondaryHandView)
  {
    id v4 = [(NTKAlaskanChronographView *)self device];
    id v5 = +[CLKUIAnalogHandConfiguration defaultSecondConfigurationForDevice:v4];

    id v6 = objc_alloc((Class)NTKHandView);
    id v7 = [(NTKAlaskanChronographView *)self device];
    v8 = (NTKHandView *)[v6 initWithConfiguration:v5 forDevice:v7 maskedShadow:1];
    v9 = self->_secondaryHandView;
    self->_secondaryHandView = v8;

    [(NTKHandView *)self->_secondaryHandView anchorPointFromConfiguration];
    double v11 = v10;
    double v13 = v12;
    v14 = [(NTKHandView *)self->_secondaryHandView layer];
    objc_msgSend(v14, "setAnchorPoint:", v11, v13);

    v15 = [(NTKChronographProFacePalette *)self->_palette lapHand2];
    [(NTKHandView *)self->_secondaryHandView setTintColor:v15];

    uint64_t v16 = [(NTKAlaskanChronographView *)self chronometerHandsParentView];
    [v16 addSubview:self->_secondaryHandView];

    secondaryHandView = self->_secondaryHandView;
  }

  return secondaryHandView;
}

- (NTKAlaskanChronoButton)resetButton
{
  resetButton = self->_resetButton;
  if (!resetButton)
  {
    uint64_t v13 = 0;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = [(NTKAlaskanChronographView *)self device];
    sub_19BAC(v4, (uint64_t)&v10);

    id v5 = [NTKAlaskanChronoButton alloc];
    id v6 = -[NTKAlaskanChronoButton initWithFrame:](v5, "initWithFrame:", 0.0, 0.0, *(double *)&v11, *(double *)&v11);
    id v7 = self->_resetButton;
    self->_resetButton = v6;

    v8 = [(NTKChronographProFacePalette *)self->_palette resetButton];
    [(NTKAlaskanChronoButton *)self->_resetButton setTintColor:v8];

    [(NTKAlaskanChronoButton *)self->_resetButton addTarget:self action:"handleResetButtonTap" forControlEvents:64];
    [(NTKAlaskanChronoButton *)self->_resetButton setHidden:1];
    [(NTKAlaskanChronographView *)self addSubview:self->_resetButton];
    resetButton = self->_resetButton;
  }

  return resetButton;
}

- (NTKAlaskanChronoButton)startStopButton
{
  startStopButton = self->_startStopButton;
  if (!startStopButton)
  {
    uint64_t v13 = 0;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = [(NTKAlaskanChronographView *)self device];
    sub_19BAC(v4, (uint64_t)&v10);

    id v5 = [NTKAlaskanChronoButton alloc];
    id v6 = -[NTKAlaskanChronoButton initWithFrame:](v5, "initWithFrame:", 0.0, 0.0, *(double *)&v11, *(double *)&v11);
    id v7 = self->_startStopButton;
    self->_startStopButton = v6;

    v8 = [(NTKChronographProFacePalette *)self->_palette startButton];
    [(NTKAlaskanChronoButton *)self->_startStopButton setTintColor:v8];

    [(NTKAlaskanChronoButton *)self->_startStopButton addTarget:self action:"handleStartStopButtonTap" forControlEvents:64];
    [(NTKAlaskanChronoButton *)self->_startStopButton setHidden:1];
    [(NTKAlaskanChronographView *)self addSubview:self->_startStopButton];
    startStopButton = self->_startStopButton;
  }

  return startStopButton;
}

- (CLKUIColoringLabel)topLabel
{
  topLabel = self->_topLabel;
  if (!topLabel)
  {
    uint64_t v26 = 0;
    memset(v25, 0, sizeof(v25));
    id v4 = [(NTKAlaskanChronographView *)self device];
    sub_19BAC(v4, (uint64_t)v25);

    id v5 = +[CLKUIColoringLabel labelWithOptions:0];
    id v6 = self->_topLabel;
    self->_topLabel = v5;

    id v7 = +[UIColor whiteColor];
    [(CLKUIColoringLabel *)self->_topLabel setTextColor:v7];

    [(CLKUIColoringLabel *)self->_topLabel setUsesTextProviderTintColoring:1];
    double v8 = *((double *)v25 + 1);
    v9 = +[CLKFont compactSoftFontOfSize:*((double *)v25 + 1) weight:UIFontWeightSemibold];
    long long v10 = [v9 fontDescriptor];
    v30[0] = UIFontFeatureTypeIdentifierKey;
    v30[1] = UIFontFeatureSelectorIdentifierKey;
    v31[0] = &off_3A960;
    v31[1] = &off_3A978;
    long long v11 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
    v27 = v11;
    UIFontDescriptorAttributeName v28 = UIFontDescriptorFeatureSettingsAttribute;
    long long v12 = +[NSArray arrayWithObjects:&v27 count:1];
    double v29 = v12;
    uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    v14 = [v10 fontDescriptorByAddingAttributes:v13];

    objc_initWeak(&location, self);
    v15 = self->_topLabel;
    uint64_t v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    v21 = sub_1A11C;
    v22 = &unk_39240;
    objc_copyWeak(&v23, &location);
    [(CLKUIColoringLabel *)v15 setNowProvider:&v19];
    uint64_t v16 = +[CLKFont fontWithDescriptor:size:](CLKFont, "fontWithDescriptor:size:", v14, v8, v19, v20, v21, v22);
    [(CLKUIColoringLabel *)self->_topLabel setFont:v16];

    [(CLKUIColoringLabel *)self->_topLabel setTextAlignment:1];
    v17 = +[UIColor blackColor];
    [(CLKUIColoringLabel *)self->_topLabel setBackgroundColor:v17];

    [(CLKUIColoringLabel *)self->_topLabel setHidden:[(NTKAlaskanChronographView *)self isEditing]];
    [(NTKAlaskanChronographView *)self addSubview:self->_topLabel];
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

    topLabel = self->_topLabel;
  }

  return topLabel;
}

- (CLKUIColoringLabel)centerLabel
{
  centerLabel = self->_centerLabel;
  if (!centerLabel)
  {
    id v4 = [(NTKAlaskanChronographView *)self _newCenterLabel];
    id v5 = self->_centerLabel;
    self->_centerLabel = v4;

    id v6 = +[CALayer layer];
    centerLabelBackgroundLayer = self->_centerLabelBackgroundLayer;
    self->_centerLabelBackgroundLayer = v6;

    double v8 = [(NTKAlaskanChronographView *)self layerDisabledActions];
    [(CALayer *)self->_centerLabelBackgroundLayer setActions:v8];

    v9 = [(NTKAlaskanChronographView *)self layer];
    [v9 addSublayer:self->_centerLabelBackgroundLayer];

    objc_initWeak(&location, self);
    long long v10 = self->_centerLabel;
    long long v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    v14 = sub_1A2EC;
    v15 = &unk_39240;
    objc_copyWeak(&v16, &location);
    [(CLKUIColoringLabel *)v10 setNowProvider:&v12];
    -[NTKAlaskanChronographView addSubview:](self, "addSubview:", self->_centerLabel, v12, v13, v14, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    centerLabel = self->_centerLabel;
  }

  return centerLabel;
}

- (id)_newCenterLabel
{
  uint64_t v12 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v2 = [(NTKAlaskanChronographView *)self device];
  sub_19BAC(v2, (uint64_t)&v7);

  unsigned int v3 = +[CLKUIColoringLabel labelWithOptions:0];
  id v4 = +[CLKFont compactSoftFontOfSize:*(double *)&v8 weight:UIFontWeightSemibold];
  id v5 = [v4 CLKFontWithMonospacedNumbers];
  [v3 setFont:v5];

  [v3 setTextAlignment:1];
  [v3 setNumberOfLines:1];
  return v3;
}

- (void)setDialTickView:(id)a3
{
  id v5 = (NTKAlaskanChronoDialView *)a3;
  p_dialTickView = &self->_dialTickView;
  dialTickView = self->_dialTickView;
  if (dialTickView != v5)
  {
    [(NTKAlaskanChronoDialView *)dialTickView removeFromSuperview];
    objc_storeStrong((id *)&self->_dialTickView, a3);
    [(NTKAlaskanChronographView *)self insertSubview:*p_dialTickView atIndex:1];
    long long v8 = *p_dialTickView;
    [(NTKAlaskanChronographView *)self bounds];
    dialTickView = (NTKAlaskanChronoDialView *)-[NTKAlaskanChronoDialView ntk_setBoundsAndPositionFromFrame:](v8, "ntk_setBoundsAndPositionFromFrame:");
  }

  _objc_release_x1(dialTickView);
}

- (void)setChronometerHandsParentView:(id)a3
{
  p_chronometerHandsParentView = &self->_chronometerHandsParentView;
  id v5 = a3;
  objc_storeWeak((id *)p_chronometerHandsParentView, v5);
  id v6 = [(NTKAlaskanChronographView *)self primaryHandView];
  [v6 removeFromSuperview];

  long long v7 = [(NTKAlaskanChronographView *)self primaryHandView];
  [v5 addSubview:v7];

  long long v8 = [(NTKAlaskanChronographView *)self secondaryHandView];
  [v8 removeFromSuperview];

  long long v9 = [(NTKAlaskanChronographView *)self secondaryHandView];
  [v5 addSubview:v9];

  [(NTKAlaskanChronographView *)self updateSecondaryHandVisibility];

  [(NTKAlaskanChronographView *)self updateChronoLargeHandsCenterPoint];
}

- (void)setStopwatchModel:(id)a3
{
}

- (void)setStopwatchModel:(id)a3 animating:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  objc_storeStrong((id *)&self->_stopwatchModel, a3);
  if (v8 && ([v8 isRunning] & 1) != 0 || objc_msgSend(v8, "isPaused")) {
    [(NTKAlaskanChronographView *)self setIsChronoMode:1];
  }
  if ([(NTKAlaskanChronographView *)self isChronoMode]) {
    [(NTKAlaskanChronographView *)self updateSecondaryHandVisibility];
  }
  unsigned int v7 = [(NTKAlaskanChronographView *)self isRunning];
  [(NTKAlaskanChronographView *)self stopAnimatingHands];
  if (v7 && v4) {
    [(NTKAlaskanChronographView *)self startAnimatingHands];
  }
  else {
    [(NTKAlaskanChronographView *)self updateHandsPosition];
  }
  if (v8) {
    [(NTKAlaskanChronographView *)self updateStartStopButtonColor];
  }
  [(NTKAlaskanChronographView *)self _updateElapsedTimeLabel];
  [(NTKAlaskanChronographView *)self enableDisableResetButton];
}

- (void)setOverrideDate:(id)a3
{
}

- (void)setOverrideDate:(id)a3 animatingAnalogHands:(BOOL)a4
{
  BOOL v4 = a4;
  objc_storeStrong((id *)&self->_overrideDate, a3);

  [(NTKAlaskanChronographView *)self updateAnalogHandsPositionAnimated:v4];
}

- (void)updateAnalogHandsPositionAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(NTKAlaskanChronographView *)self stopAnimatingSubdialMinuteHand];
  if (v3)
  {
    [(NTKAlaskanChronographView *)self startAnimatingSubdialMinuteHand];
  }
  else
  {
    [(NTKAlaskanChronographView *)self updateSubdialMinuteHandPosition];
  }
}

- (id)currentDate
{
  overrideDate = self->_overrideDate;
  if (overrideDate)
  {
    BOOL v3 = overrideDate;
  }
  else
  {
    BOOL v3 = +[NSDate date];
  }

  return v3;
}

- (void)applyTransitionFromTimeScale:(unint64_t)a3 toTimeScale:(unint64_t)a4 fraction:(double)a5
{
  if (a3 == a4)
  {
    [(NTKAlaskanChronographView *)self setTimeScale:a5];
    return;
  }
  long long v9 = [(NTKAlaskanChronographView *)self dialTickView];
  id v10 = [v9 tag];

  if (v10 != (id)a3) {
    [(NTKAlaskanChronographView *)self switchDialViewForTimeScale:a3];
  }
  if (self->_transitionDialTickView)
  {
    long long v11 = [(NTKAlaskanChronographView *)self transitionDialTickView];
    id v12 = [v11 tag];

    if (v12 == (id)a4) {
      goto LABEL_12;
    }
    transitionDialTickView = self->_transitionDialTickView;
  }
  else
  {
    transitionDialTickView = 0;
  }
  [(NTKAlaskanChronoDialView *)transitionDialTickView removeFromSuperview];
  v14 = [(NTKAlaskanChronographView *)self dialViewForTimeScale:a4];
  v15 = self->_transitionDialTickView;
  self->_transitionDialTickView = v14;

  [(NTKAlaskanChronoDialView *)self->_transitionDialTickView setTag:a4];
  [(NTKAlaskanChronographView *)self insertSubview:self->_transitionDialTickView aboveSubview:self->_dialTickView];
  id v16 = self->_transitionDialTickView;
  [(NTKAlaskanChronoDialView *)self->_dialTickView bounds];
  -[NTKAlaskanChronoDialView ntk_setBoundsAndPositionFromFrame:](v16, "ntk_setBoundsAndPositionFromFrame:");
LABEL_12:
  id v54 = [(NTKAlaskanChronographView *)self dialTickView];
  v17 = [(NTKAlaskanChronographView *)self transitionDialTickView];
  [(NTKAlaskanChronographView *)self applyTransitionFromView:v54 toView:v17 fraction:a5];
  v18 = [(NTKAlaskanChronographView *)self leftSubdialViewForTimeScale:a3];
  id v19 = [v18 tag];

  uint64_t v20 = [(NTKAlaskanChronographView *)self leftSubdialViewForTimeScale:a4];
  id v21 = [v20 tag];

  v22 = [(NTKAlaskanChronographView *)self leftSubdialView];
  id v23 = [v22 tag];

  if (v23 != v19) {
    [(NTKAlaskanChronographView *)self switchLeftSubDialViewsForTimeScale:a3];
  }
  if (v19 == v21)
  {
    [(NTKAlaskanChronographView *)self _cleanupSubdialView:self->_leftSubdialView];
    [(NTKAlaskanChronoSubdialView *)self->_transitionLeftSubdialView removeFromSuperview];
    transitionLeftSubdialView = self->_transitionLeftSubdialView;
    self->_transitionLeftSubdialView = 0;

    goto LABEL_21;
  }
  v25 = self->_transitionLeftSubdialView;
  if (!v25) {
    goto LABEL_19;
  }
  if ([(NTKAlaskanChronoSubdialView *)v25 tag] != v21)
  {
    v25 = self->_transitionLeftSubdialView;
LABEL_19:
    [(NTKAlaskanChronoSubdialView *)v25 removeFromSuperview];
    uint64_t v26 = [(NTKAlaskanChronographView *)self leftSubdialViewForTimeScale:a4];
    v27 = self->_transitionLeftSubdialView;
    self->_transitionLeftSubdialView = v26;

    [(NTKAlaskanChronoSubdialView *)self->_transitionLeftSubdialView setTag:v21];
    [(NTKAlaskanChronographView *)self insertSubview:self->_transitionLeftSubdialView aboveSubview:self->_leftSubdialView];
    UIFontDescriptorAttributeName v28 = self->_transitionLeftSubdialView;
    [(NTKAlaskanChronoSubdialView *)self->_leftSubdialView frame];
    -[NTKAlaskanChronoSubdialView ntk_setBoundsAndPositionFromFrame:](v28, "ntk_setBoundsAndPositionFromFrame:");
    double v29 = +[UIColor clearColor];
    [(NTKAlaskanChronoSubdialView *)self->_transitionLeftSubdialView setBackgroundColor:v29];

    double v30 = [(NTKAlaskanChronoSubdialView *)self->_transitionLeftSubdialView analogHand];
    [v30 setHidden:1];
  }
  double v31 = [(NTKAlaskanChronographView *)self leftSubdialView];
  v32 = [v31 markersView];

  id v33 = [(NTKAlaskanChronoSubdialView *)self->_transitionLeftSubdialView markersView];

  [(NTKAlaskanChronographView *)self applyTransitionFromView:v32 toView:v33 fraction:a5];
  v34 = [(NTKAlaskanChronographView *)self leftSubdialView];
  id v54 = [v34 tickView];

  v17 = [(NTKAlaskanChronoSubdialView *)self->_transitionLeftSubdialView tickView];

  [(NTKAlaskanChronographView *)self applyTransitionFromView:v54 toView:v17 fraction:a5];
LABEL_21:
  objc_super v35 = [(NTKAlaskanChronographView *)self rightSubdialViewForTimeScale:a3];
  id v36 = [v35 tag];

  v37 = [(NTKAlaskanChronographView *)self rightSubdialViewForTimeScale:a4];
  id v38 = [v37 tag];

  v39 = [(NTKAlaskanChronographView *)self rightSubdialView];
  id v40 = [v39 tag];

  if (v40 != v36) {
    [(NTKAlaskanChronographView *)self switchRightSubDialViewsForTimeScale:a3];
  }
  if (v36 == v38)
  {
    [(NTKAlaskanChronographView *)self _cleanupSubdialView:self->_rightSubdialView];
    [(NTKAlaskanChronoSubdialView *)self->_transitionRightSubdialView removeFromSuperview];
    transitionRightSubdialView = self->_transitionRightSubdialView;
    self->_transitionRightSubdialView = 0;

    goto LABEL_30;
  }
  v42 = self->_transitionRightSubdialView;
  if (!v42) {
    goto LABEL_28;
  }
  if ([(NTKAlaskanChronoSubdialView *)v42 tag] != v38)
  {
    v42 = self->_transitionRightSubdialView;
LABEL_28:
    [(NTKAlaskanChronoSubdialView *)v42 removeFromSuperview];
    v43 = [(NTKAlaskanChronographView *)self rightSubdialViewForTimeScale:a4];
    v44 = self->_transitionRightSubdialView;
    self->_transitionRightSubdialView = v43;

    [(NTKAlaskanChronoSubdialView *)self->_transitionRightSubdialView setTag:v38];
    [(NTKAlaskanChronographView *)self insertSubview:self->_transitionRightSubdialView aboveSubview:self->_rightSubdialView];
    v45 = self->_transitionRightSubdialView;
    [(NTKAlaskanChronoSubdialView *)self->_rightSubdialView frame];
    -[NTKAlaskanChronoSubdialView ntk_setBoundsAndPositionFromFrame:](v45, "ntk_setBoundsAndPositionFromFrame:");
    v46 = +[UIColor clearColor];
    [(NTKAlaskanChronoSubdialView *)self->_transitionRightSubdialView setBackgroundColor:v46];

    v47 = [(NTKAlaskanChronoSubdialView *)self->_transitionRightSubdialView analogHand];
    [v47 setHidden:1];
  }
  v48 = [(NTKAlaskanChronographView *)self rightSubdialView];
  v49 = [v48 markersView];

  v50 = [(NTKAlaskanChronoSubdialView *)self->_transitionRightSubdialView markersView];

  [(NTKAlaskanChronographView *)self applyTransitionFromView:v49 toView:v50 fraction:a5];
  v51 = [(NTKAlaskanChronographView *)self rightSubdialView];
  id v54 = [v51 tickView];

  v17 = [(NTKAlaskanChronoSubdialView *)self->_transitionRightSubdialView tickView];

  [(NTKAlaskanChronographView *)self applyTransitionFromView:v54 toView:v17 fraction:a5];
LABEL_30:
  if (![(NTKAlaskanChronographView *)self isEditing])
  {
    if (a5 >= 0.5)
    {
      [(NTKAlaskanChronographView *)self _updateElapsedTimeLabel];
      if (a3) {
        goto LABEL_35;
      }
      goto LABEL_34;
    }
    v52 = [(NTKAlaskanChronographView *)self titleForTimeScale:a3];
    v53 = [(NTKAlaskanChronographView *)self topLabel];
    [v53 setText:v52];
  }
  if (!a3) {
LABEL_34:
  }
    [(NTKAlaskanChronographView *)self applyTransitionFromTimeModeToChronometerModeWithfraction:a5];
LABEL_35:
}

- (void)_cleanupSubdialView:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 markersView];
  [v4 setAlpha:1.0];

  id v5 = [v3 tickView];
  [v5 setAlpha:1.0];

  id v6 = [v3 markersView];
  long long v10 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v12[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v9 = v12[0];
  v12[1] = v10;
  long long v13 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  long long v8 = v13;
  [v6 setTransform:v12];

  unsigned int v7 = [v3 tickView];

  v11[0] = v9;
  v11[1] = v10;
  v11[2] = v8;
  [v7 setTransform:v11];
}

- (void)applyTransitionFromTimeModeToChronometerModeWithfraction:(double)a3
{
  CLKCompressFraction();
  double v6 = v5;
  CLKCompressFraction();
  double v8 = v7;
  long long v9 = [(NTKChronographProFacePalette *)self->_palette backgroundTimeMode];
  long long v10 = [(NTKChronographProFacePalette *)self->_palette backgroundChronometerMode];
  NTKInterpolateBetweenColors();
  id v11 = objc_claimAutoreleasedReturnValue();
  -[CALayer setBackgroundColor:](self->_innerBackgroundCircle, "setBackgroundColor:", [v11 CGColor]);

  if ([(NTKAlaskanChronographView *)self isEditing])
  {
    transitionCenterLabel = self->_transitionCenterLabel;
    if (!transitionCenterLabel)
    {
      long long v13 = [(NTKAlaskanChronographView *)self _newCenterLabel];
      v14 = self->_transitionCenterLabel;
      self->_transitionCenterLabel = v13;

      [(CLKUIColoringLabel *)self->_transitionCenterLabel setAlpha:0.0];
      [(NTKAlaskanChronographView *)self _updateElapsedTimeLabel];
      [(NTKAlaskanChronographView *)self addSubview:self->_transitionCenterLabel];
      transitionCenterLabel = self->_transitionCenterLabel;
    }
    [(NTKAlaskanChronographView *)self applyTransitionFromView:self->_centerLabel toView:transitionCenterLabel fraction:a3];
  }
  if (a3 >= 0.5)
  {
    [(NTKAlaskanChronographView *)self updateCenterLabelColorForChronometerMode];
    if (![(NTKAlaskanChronographView *)self isEditing])
    {
      v17 = [(NTKAlaskanChronographView *)self centerLabel];
      [v17 setAlpha:v8];
    }
    v18 = [(NTKAlaskanChronographView *)self primaryHandView];
    [v18 setHidden:0];

    CLKInterpolateBetweenFloatsClipped();
    double v20 = v19;
    id v16 = [(NTKAlaskanChronographView *)self primaryHandView];
    [v16 setAlpha:v20];
  }
  else
  {
    [(NTKAlaskanChronographView *)self updateCenterLabelColorForTimeMode];
    if (![(NTKAlaskanChronographView *)self isEditing])
    {
      v15 = [(NTKAlaskanChronographView *)self centerLabel];
      [v15 setAlpha:1.0 - v6];
    }
    id v16 = [(NTKAlaskanChronographView *)self primaryHandView];
    [v16 setHidden:1];
  }

  if (![(NTKAlaskanChronographView *)self isEditing])
  {
    [(NTKAlaskanChronoButton *)self->_resetButton setHidden:0];
    [(NTKAlaskanChronoButton *)self->_startStopButton setHidden:0];
    [(NTKAlaskanChronographView *)self resetButtonAlpha];
    CLKInterpolateBetweenFloatsClipped();
    -[NTKAlaskanChronoButton setAlpha:](self->_resetButton, "setAlpha:");
    CLKInterpolateBetweenFloatsClipped();
    -[NTKAlaskanChronoButton setAlpha:](self->_startStopButton, "setAlpha:");
  }
  CLKInterpolateBetweenFloatsClipped();
  topLabel = self->_topLabel;

  -[CLKUIColoringLabel setAlpha:](topLabel, "setAlpha:");
}

- (double)startStopButtonAlpha
{
  unsigned int v2 = [(NTKAlaskanChronographView *)self isChronoMode];
  double result = 0.0;
  if (v2) {
    return 1.0;
  }
  return result;
}

- (double)resetButtonAlpha
{
  unsigned int v3 = [(NTKAlaskanChronographView *)self isChronoMode];
  double result = 0.0;
  if (v3)
  {
    double result = 1.0;
    if (self->_timeScale == 1)
    {
      double v5 = [(NTKAlaskanChronographView *)self stopwatchModel];
      unsigned int v6 = [v5 isRunning];

      double result = 0.3;
      if (!v6) {
        return 1.0;
      }
    }
  }
  return result;
}

- (void)applyTransitionFromView:(id)a3 toView:(id)a4 fraction:(double)a5
{
  id v6 = a4;
  id v7 = a3;
  CLKCompressFraction();
  CLKCompressFraction();
  CLKInterpolateBetweenFloatsClipped();
  CGFloat v9 = v8;
  CLKInterpolateBetweenFloatsClipped();
  double v11 = v10;
  CGAffineTransformMakeScale(&v19, v9, v9);
  CGAffineTransform v18 = v19;
  [v7 setTransform:&v18];
  [v7 setAlpha:v11];

  CLKInterpolateBetweenFloatsClipped();
  CGFloat v13 = v12;
  CLKInterpolateBetweenFloatsClipped();
  double v15 = v14;
  CGAffineTransformMakeScale(&v17, v13, v13);
  CGAffineTransform v16 = v17;
  [v6 setTransform:&v16];
  [v6 setAlpha:v15];
}

- (void)setTimeScale:(unint64_t)a3
{
  double v5 = [(NTKAlaskanChronographView *)self transitionDialTickView];

  if (v5)
  {
    [(NTKAlaskanChronographView *)self removeAllTransitionViews];
  }
  else if (self->_timeScale == a3)
  {
    return;
  }
  self->_timeScale = a3;

  [(NTKAlaskanChronographView *)self _setUpUIForTimeScale:a3];
}

- (void)_setUpUIForTimeScale:(unint64_t)a3
{
  [(NTKAlaskanChronographView *)self updateSecondaryHandVisibility];
  [(NTKAlaskanChronographView *)self switchSubDialViewsForTimeScale:a3];
  if ([(NTKAlaskanChronographView *)self isChronoMode])
  {
    [(NTKAlaskanChronographView *)self switchDialViewForTimeScale:a3];
    [(NTKAlaskanChronographView *)self enableDisableResetButton];
    [(NTKAlaskanChronographView *)self setStopwatchModel:self->_stopwatchModel];
  }
  double v5 = [(NTKAlaskanChronographView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(NTKAlaskanChronographView *)self delegate];
    [v7 alaskanChronographView:self didChangeTimeScale:a3];
  }
}

- (void)cleanUpTimeScaleTransition
{
  [(NTKAlaskanChronographView *)self removeAllTransitionViews];
  unint64_t timeScale = self->_timeScale;

  [(NTKAlaskanChronographView *)self _setUpUIForTimeScale:timeScale];
}

- (void)removeAllTransitionViews
{
  unsigned int v3 = [(NTKAlaskanChronographView *)self transitionDialTickView];
  [v3 removeFromSuperview];

  [(NTKAlaskanChronographView *)self setTransitionDialTickView:0];
  BOOL v4 = [(NTKAlaskanChronographView *)self transitionLeftSubdialView];
  [v4 removeFromSuperview];

  [(NTKAlaskanChronographView *)self setTransitionLeftSubdialView:0];
  double v5 = [(NTKAlaskanChronographView *)self transitionRightSubdialView];
  [v5 removeFromSuperview];

  [(NTKAlaskanChronographView *)self setTransitionRightSubdialView:0];
}

- (void)setIsChronoMode:(BOOL)a3
{
}

- (void)setIsChronoMode:(BOOL)a3 completionBlock:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  id v8 = a4;
  if (self->_isChronoMode != v6)
  {
    self->_BOOL isChronoMode = v6;
    if (v6) {
      id v8 = [(NTKAlaskanChronographView *)self setupForChronographModeWithCompletionBlock:v8];
    }
    else {
      id v8 = [(NTKAlaskanChronographView *)self setupForTimeModeWithCompletionBlock:v8 animated:v5];
    }
  }

  _objc_release_x1(v8);
}

- (void)setupForChronographMode
{
}

- (void)setupForChronographModeWithCompletionBlock:(id)a3
{
  unint64_t timeScale = self->_timeScale;
  id v5 = a3;
  [(NTKAlaskanChronographView *)self switchDialViewForTimeScale:timeScale];
  [(NTKAlaskanChronographView *)self updateInnerCircleColor];
  [(NTKAlaskanChronographView *)self setStopwatchModel:self->_stopwatchModel];
  [(NTKAlaskanChronographView *)self updateCenterLabelColor];
  BOOL v6 = [(NTKAlaskanChronographView *)self resetButton];
  [v6 setAlpha:1.0];

  id v7 = [(NTKAlaskanChronographView *)self startStopButton];
  [v7 setAlpha:1.0];

  id v8 = [(NTKAlaskanChronographView *)self topLabel];
  [(NTKAlaskanChronographView *)self switchSubDialViewsForTimeScale:self->_timeScale];
  [(NTKAlaskanChronographView *)self updateSecondaryHandVisibility];
  [(NTKAlaskanChronographView *)self removeAllTransitionViews];
  CGFloat v9 = [(NTKAlaskanChronographView *)self primaryHandView];
  [v9 setHidden:0];

  double v10 = [(NTKAlaskanChronographView *)self primaryHandView];
  [v10 setAlpha:1.0];

  id v11 = [(NTKAlaskanChronographView *)self delegate];
  [v11 alaskanChronographViewDidEnterChronometerMode:self completionBlock:v5];
}

- (void)setupForTimeMode
{
}

- (void)setupForTimeModeWithCompletionBlock:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  dialViewFactory = self->_dialViewFactory;
  id v7 = a3;
  id v8 = [(NTKAlaskanDialViewFactory *)dialViewFactory _12HourDialView];
  [(NTKAlaskanChronographView *)self setDialTickView:v8];

  CGFloat v9 = [(NTKAlaskanChronographView *)self titleForTimeScale:self->_timeScale];
  double v10 = [(NTKAlaskanChronographView *)self centerLabel];
  [v10 setText:v9];

  [(NTKAlaskanChronographView *)self updateInnerCircleColor];
  [(NTKAlaskanChronographView *)self updateCenterLabelColor];
  [(NTKAlaskanChronoButton *)self->_resetButton setAlpha:0.0];
  [(NTKAlaskanChronoButton *)self->_startStopButton setAlpha:0.0];
  [(CLKUIColoringLabel *)self->_topLabel removeFromSuperview];
  topLabel = self->_topLabel;
  self->_topLabel = 0;

  [(NTKAlaskanChronographView *)self switchSubDialViewsForTimeScale:self->_timeScale];
  [(NTKAlaskanChronographView *)self updateSecondaryHandVisibility];
  [(NTKAlaskanChronographView *)self removeAllTransitionViews];
  double v12 = [(NTKAlaskanChronographView *)self primaryHandView];
  [v12 setHidden:1];

  id v13 = [(NTKAlaskanChronographView *)self delegate];
  [v13 alaskanChronographViewDidExitChronometerMode:self completionBlock:v7 animated:v4];
}

- (void)switchLeftSubDialViewsForTimeScale:(unint64_t)a3
{
  [(NTKAlaskanChronoSubdialView *)self->_leftSubdialView removeFromSuperview];
  id v5 = [(NTKAlaskanChronographView *)self leftSubdialViewForTimeScale:a3];
  leftSubdialView = self->_leftSubdialView;
  self->_leftSubdialView = v5;

  id v7 = [(NTKChronographProFacePalette *)self->_palette subdialClockHand];
  id v8 = [(NTKAlaskanChronoSubdialView *)self->_leftSubdialView analogHand];
  [v8 setTintColor:v7];

  [(NTKAlaskanChronographView *)self updateHandsPosition];
  [(NTKAlaskanChronographView *)self addSubview:self->_leftSubdialView];

  [(NTKAlaskanChronographView *)self updateSubdialViewFrames];
}

- (void)switchRightSubDialViewsForTimeScale:(unint64_t)a3
{
  [(NTKAlaskanChronoSubdialView *)self->_rightSubdialView removeFromSuperview];
  id v5 = [(NTKAlaskanChronographView *)self rightSubdialViewForTimeScale:a3];
  rightSubdialView = self->_rightSubdialView;
  self->_rightSubdialView = v5;

  id v7 = [(NTKChronographProFacePalette *)self->_palette subdialClockHand];
  id v8 = [(NTKAlaskanChronoSubdialView *)self->_rightSubdialView analogHand];
  [v8 setTintColor:v7];

  [(NTKAlaskanChronographView *)self updateHandsPosition];
  [(NTKAlaskanChronographView *)self addSubview:self->_rightSubdialView];

  [(NTKAlaskanChronographView *)self updateSubdialViewFrames];
}

- (void)switchBottomSubDialView
{
  [(NTKAlaskanChronoSubdialView *)self->_bottomSubdialView removeFromSuperview];
  unsigned int v3 = [(NTKAlaskanSubdialViewFactory *)self->_subdialViewFactory _60secondsSubdialView];
  bottomSubdialView = self->_bottomSubdialView;
  self->_bottomSubdialView = v3;

  id v5 = [(NTKChronographProFacePalette *)self->_palette subdialClockHand];
  BOOL v6 = [(NTKAlaskanChronoSubdialView *)self->_bottomSubdialView analogHand];
  [v6 setTintColor:v5];

  [(NTKAlaskanChronographView *)self updateSubdialMinuteHandPosition];
  [(NTKAlaskanChronographView *)self addSubview:self->_bottomSubdialView];

  [(NTKAlaskanChronographView *)self updateSubdialViewFrames];
}

- (void)switchSubDialViewsForTimeScale:(unint64_t)a3
{
  -[NTKAlaskanChronographView switchLeftSubDialViewsForTimeScale:](self, "switchLeftSubDialViewsForTimeScale:");
  [(NTKAlaskanChronographView *)self switchRightSubDialViewsForTimeScale:a3];
  if (!self->_bottomSubdialView)
  {
    id v5 = [(NTKAlaskanSubdialViewFactory *)self->_subdialViewFactory _60secondsSubdialView];
    bottomSubdialView = self->_bottomSubdialView;
    self->_bottomSubdialView = v5;

    id v7 = [(NTKChronographProFacePalette *)self->_palette subdialClockHand];
    id v8 = [(NTKAlaskanChronoSubdialView *)self->_bottomSubdialView analogHand];
    [v8 setTintColor:v7];

    [(NTKAlaskanChronographView *)self addSubview:self->_bottomSubdialView];
  }

  [(NTKAlaskanChronographView *)self updateSubdialViewFrames];
}

- (void)switchDialViewForTimeScale:(unint64_t)a3
{
}

- (void)switchDialViewForTimeScale:(unint64_t)a3 setTopLabel:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = -[NTKAlaskanChronographView dialViewForTimeScale:](self, "dialViewForTimeScale:");
  [(NTKAlaskanChronographView *)self setDialTickView:v7];

  id v8 = [(NTKAlaskanChronographView *)self dialTickView];
  [v8 setTag:a3];

  if (v4
    && ![(NTKAlaskanChronographView *)self isEditing]
    && [(NTKAlaskanChronographView *)self isChronoMode])
  {
    id v10 = [(NTKAlaskanChronographView *)self titleForTimeScale:self->_timeScale];
    CGFloat v9 = [(NTKAlaskanChronographView *)self topLabel];
    [v9 setText:v10];
  }
}

- (id)dialViewForTimeScale:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      unsigned int v3 = [(NTKAlaskanDialViewFactory *)self->_dialViewFactory _tachymeterDialView];
      break;
    case 2uLL:
      unsigned int v3 = [(NTKAlaskanDialViewFactory *)self->_dialViewFactory _60secondsDialView];
      break;
    case 3uLL:
      unsigned int v3 = [(NTKAlaskanDialViewFactory *)self->_dialViewFactory _30secondsDialView];
      break;
    case 4uLL:
      unsigned int v3 = [(NTKAlaskanDialViewFactory *)self->_dialViewFactory _6secondsDialView];
      break;
    case 5uLL:
      unsigned int v3 = [(NTKAlaskanDialViewFactory *)self->_dialViewFactory _3secondsDialView];
      break;
    default:
      unsigned int v3 = [(NTKAlaskanDialViewFactory *)self->_dialViewFactory _12HourDialView];
      break;
  }

  return v3;
}

- (id)titleForTimeScale:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      CFStringRef v5 = @"EDIT_OPTION_LABEL_SHARK_TIME_SCALE_TACHYMETER";
      CFStringRef v6 = @"TACHYMETER";
      goto LABEL_10;
    case 2uLL:
      CFStringRef v5 = @"EDIT_OPTION_LABEL_SHARK_TIME_SCALE_60";
      CFStringRef v6 = @"60-SECONDS";
      goto LABEL_10;
    case 3uLL:
      CFStringRef v5 = @"EDIT_OPTION_LABEL_SHARK_TIME_SCALE_30";
      CFStringRef v6 = @"30-SECONDS";
      goto LABEL_10;
    case 4uLL:
      CFStringRef v5 = @"EDIT_OPTION_LABEL_SHARK_TIME_SCALE_6";
      CFStringRef v6 = @"6-SECONDS";
      goto LABEL_10;
    case 5uLL:
      CFStringRef v5 = @"EDIT_OPTION_LABEL_SHARK_TIME_SCALE_3";
      CFStringRef v6 = @"3-SECONDS";
LABEL_10:
      id v7 = +[NTKAlaskanFaceBundle localizedStringForKey:comment:](NTKAlaskanFaceBundle, "localizedStringForKey:comment:", v5, v6, v3);
      break;
    default:
      id v7 = 0;
      break;
  }
  return v7;
}

- (id)leftSubdialViewForTimeScale:(unint64_t)timeScale
{
  if (!timeScale) {
    unint64_t timeScale = self->_timeScale;
  }
  switch(timeScale)
  {
    case 4uLL:
    case 5uLL:
      uint64_t v3 = [(NTKAlaskanSubdialViewFactory *)self->_subdialViewFactory _60MinutesSubdialView];
      break;
    default:
      uint64_t v3 = [(NTKAlaskanSubdialViewFactory *)self->_subdialViewFactory _12HoursSubdialView];
      break;
  }

  return v3;
}

- (id)rightSubdialViewForTimeScale:(unint64_t)timeScale
{
  if (!timeScale) {
    unint64_t timeScale = self->_timeScale;
  }
  switch(timeScale)
  {
    case 3uLL:
      uint64_t v3 = [(NTKAlaskanSubdialViewFactory *)self->_subdialViewFactory _15MinutesSubdialView];
      break;
    case 4uLL:
      uint64_t v3 = [(NTKAlaskanSubdialViewFactory *)self->_subdialViewFactory _3MinutesSubdialView];
      break;
    case 5uLL:
      uint64_t v3 = [(NTKAlaskanSubdialViewFactory *)self->_subdialViewFactory _2MinutesSubdialView];
      break;
    default:
      uint64_t v3 = [(NTKAlaskanSubdialViewFactory *)self->_subdialViewFactory _30MinutesSubdialView];
      break;
  }

  return v3;
}

- (void)_updateElapsedTimeLabel
{
  unsigned int v3 = [(NTKAlaskanChronographView *)self isRunning];
  if ([(NTKAlaskanChronographView *)self isChronoMode])
  {
    uint64_t v4 = [(NTKAlaskanChronographView *)self currentDate];
    CFStringRef v5 = [(NTKAlaskanChronographView *)self _stopwatchStartDateRelativeToDate:v4];

    CFStringRef v6 = [(NTKAlaskanChronographView *)self _totalTimelapsedTextProviderWithDate:v5];
    uint64_t v7 = v3 ^ 1;
    [v6 setPaused:v7];
    if ([(NTKAlaskanChronographView *)self isEditing])
    {
      id v8 = [(NTKAlaskanChronographView *)self titleForTimeScale:self->_timeScale];
      [(CLKUIColoringLabel *)self->_centerLabel setText:v8];

      [(CLKUIColoringLabel *)self->_transitionCenterLabel setTextProvider:v6];
      [(CLKUIColoringLabel *)self->_transitionCenterLabel sizeToFit];
    }
    else
    {
      [(CLKUIColoringLabel *)self->_centerLabel setTextProvider:v6];
    }
    if (self->_timeScale == 1)
    {
      [(NTKAlaskanChronographView *)self _updateTachymeterLabel];
    }
    else
    {
      [(NTKAlaskanStopwatch *)self->_stopwatchModel currentTime];
      double v11 = v10;
      [(NTKAlaskanStopwatch *)self->_stopwatchModel currentLapTime];
      id v13 = [v5 dateByAddingTimeInterval:v11 - v12];
      double v14 = [(NTKAlaskanChronographView *)self _lapTimelapsedTextProviderWithDate:v13];
      double v15 = [(NTKAlaskanChronographView *)self topLabel];
      [v15 setTextProvider:v14];
    }
  }
  else
  {
    CGFloat v9 = [(NTKAlaskanChronographView *)self titleForTimeScale:self->_timeScale];
    [(CLKUIColoringLabel *)self->_centerLabel setText:v9];

    uint64_t v7 = v3 ^ 1;
  }
  CGAffineTransform v16 = [(CLKUIColoringLabel *)self->_topLabel textProvider];
  [v16 setPaused:v7];

  CGAffineTransform v17 = [(CLKUIColoringLabel *)self->_centerLabel textProvider];
  [v17 setPaused:v7];

  if ([(NTKAlaskanStopwatch *)self->_stopwatchModel isStopped]
    && ![(NTKAlaskanChronographView *)self isEditing]
    && [(NTKAlaskanChronographView *)self isChronoMode])
  {
    CGAffineTransform v18 = [(NTKAlaskanChronographView *)self titleForTimeScale:self->_timeScale];
    [(CLKUIColoringLabel *)self->_topLabel setText:v18];
  }
  BOOL v19 = (char *)[(NTKAlaskanChronographView *)self timeScale] == (char *)&dword_0 + 1
     && [(NTKAlaskanChronographView *)self isRunning];
  [(NTKAlaskanChronographView *)self startStopTachymeterUnitUpdates:v19];

  [(NTKAlaskanChronographView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v47.receiver = self;
  v47.super_class = (Class)NTKAlaskanChronographView;
  [(NTKAlaskanChronographView *)&v47 layoutSubviews];
  CGFloat dy = 0.0;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  unsigned int v3 = [(NTKAlaskanChronographView *)self device];
  sub_19BAC(v3, (uint64_t)&v41);

  dialTickView = self->_dialTickView;
  [(NTKAlaskanChronographView *)self bounds];
  -[NTKAlaskanChronoDialView ntk_setBoundsAndPositionFromFrame:](dialTickView, "ntk_setBoundsAndPositionFromFrame:");
  topLabel = self->_topLabel;
  if (topLabel)
  {
    [(CLKUIColoringLabel *)topLabel sizeToFit];
    [(CLKUIColoringLabel *)self->_topLabel bounds];
    double v7 = v6;
    double v8 = *((double *)&v42 + 1);
    double v9 = *((double *)&v44 + 1);
    double v10 = *((double *)&v44 + 1) * 0.5;
    [(NTKAlaskanChronographView *)self bounds];
    double v12 = v11 - v9;
    [(CLKUIColoringLabel *)self->_topLabel setMaxWidth:v12];
    -[CLKUIColoringLabel setFrame:](self->_topLabel, "setFrame:", v10, v8, v12, v7);
  }
  [(NTKAlaskanChronographView *)self bounds];
  double v14 = v13;
  [(NTKAlaskanChronographView *)self bounds];
  if (v14 >= v15) {
    double v16 = v15;
  }
  else {
    double v16 = v14;
  }
  [(NTKAlaskanChronographView *)self setDiameter:v16];
  CGAffineTransform v17 = [(NTKAlaskanChronographView *)self centerLabel];

  if (v17)
  {
    [(CALayer *)self->_innerBackgroundCircle bounds];
    [(CLKUIColoringLabel *)self->_centerLabel setMaxWidth:*(double *)&v45 * v18];
    centerLabel = self->_centerLabel;
    [(CLKUIColoringLabel *)centerLabel maxWidth];
    double v21 = v20;
    [(NTKAlaskanChronographView *)self bounds];
    -[CLKUIColoringLabel sizeThatFits:](centerLabel, "sizeThatFits:", v21, v22);
    -[CLKUIColoringLabel setFrame:](self->_centerLabel, "setFrame:", 0.0, 0.0, v23 + *((double *)&v45 + 1), v24);
    [(NTKAlaskanChronographView *)self bounds];
    CGRectGetMidX(v48);
    v25 = [(NTKAlaskanChronographView *)self device];
    CLKRoundForDevice();
    double v27 = v26;
    [(NTKAlaskanChronographView *)self bounds];
    CGRectGetMidY(v49);
    UIFontDescriptorAttributeName v28 = [(NTKAlaskanChronographView *)self device];
    CLKRoundForDevice();
    -[CLKUIColoringLabel setCenter:](self->_centerLabel, "setCenter:", v27, v29);

    if (self->_transitionCenterLabel)
    {
      [(CLKUIColoringLabel *)self->_centerLabel center];
      -[CLKUIColoringLabel setCenter:](self->_transitionCenterLabel, "setCenter:");
    }
    [(CLKUIColoringLabel *)self->_centerLabel frame];
    CGRect v51 = CGRectInset(v50, 0.0, dy);
    -[CALayer setFrame:](self->_centerLabelBackgroundLayer, "setFrame:", v51.origin.x, v51.origin.y, v51.size.width, v51.size.height);
    [(CALayer *)self->_centerLabelBackgroundLayer frame];
    double v30 = [(NTKAlaskanChronographView *)self device];
    CLKRoundForDevice();
    -[CALayer setCornerRadius:](self->_centerLabelBackgroundLayer, "setCornerRadius:");
  }
  [(NTKAlaskanChronographView *)self updateSubdialViewFrames];
  [(NTKAlaskanChronoButton *)self->_resetButton bounds];
  double v32 = *((double *)&v43 + 1);
  double v33 = *((double *)&v43 + 1) + v31 * 0.5;
  [(NTKAlaskanChronographView *)self bounds];
  double MaxY = CGRectGetMaxY(v52);
  [(NTKAlaskanChronoButton *)self->_resetButton bounds];
  -[NTKAlaskanChronoButton setCenter:](self->_resetButton, "setCenter:", v33, MaxY - v35 * 0.5 - v32);
  [(NTKAlaskanChronographView *)self bounds];
  double MaxX = CGRectGetMaxX(v53);
  [(NTKAlaskanChronoButton *)self->_startStopButton bounds];
  double v38 = MaxX - v37 * 0.5 - v32;
  [(NTKAlaskanChronographView *)self bounds];
  double v39 = CGRectGetMaxY(v54);
  [(NTKAlaskanChronoButton *)self->_startStopButton bounds];
  -[NTKAlaskanChronoButton setCenter:](self->_startStopButton, "setCenter:", v38, v39 - v40 * 0.5 - v32);
  [(NTKAlaskanChronographView *)self updateChronoLargeHandsCenterPoint];
}

- (void)updateChronoLargeHandsCenterPoint
{
  [(NTKAlaskanChronographView *)self bounds];
  CLKRectGetCenter();
  double v4 = v3;
  double v6 = v5;
  double v7 = [(NTKAlaskanChronographView *)self window];
  objc_msgSend(v7, "convertPoint:fromView:", self, v4, v6);
  double v9 = v8;
  double v11 = v10;

  double v12 = [(NTKAlaskanChronographView *)self window];
  double v13 = [(NTKAlaskanChronographView *)self chronometerHandsParentView];
  objc_msgSend(v12, "convertPoint:toView:", v13, v9, v11);
  double v15 = v14;
  double v17 = v16;

  -[NTKHandView setCenter:](self->_primaryHandView, "setCenter:", v15, v17);
  secondaryHandView = self->_secondaryHandView;

  -[NTKHandView setCenter:](secondaryHandView, "setCenter:", v15, v17);
}

- (void)updateSubdialViewFrames
{
  uint64_t v15 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  double v3 = [(NTKAlaskanChronographView *)self device];
  sub_19BAC(v3, (uint64_t)&v11);

  [(NTKAlaskanChronographView *)self bounds];
  CGFloat MidX = CGRectGetMidX(v17);
  double v5 = *(double *)&v12;
  CGFloat v6 = MidX + *(double *)&v12;
  [(NTKAlaskanChronographView *)self bounds];
  -[NTKAlaskanChronoSubdialView setCenter:](self->_rightSubdialView, "setCenter:", v6, CGRectGetMidY(v18));
  [(NTKAlaskanChronographView *)self bounds];
  CGFloat v7 = CGRectGetMidX(v19) - v5;
  [(NTKAlaskanChronographView *)self bounds];
  -[NTKAlaskanChronoSubdialView setCenter:](self->_leftSubdialView, "setCenter:", v7, CGRectGetMidY(v20));
  [(NTKAlaskanChronographView *)self bounds];
  double v8 = CGRectGetMidX(v21);
  [(NTKAlaskanChronographView *)self bounds];
  double v9 = v5 + CGRectGetMidY(v22);
  bottomSubdialView = self->_bottomSubdialView;

  -[NTKAlaskanChronoSubdialView setCenter:](bottomSubdialView, "setCenter:", v8, v9);
}

- (void)setDiameter:(double)a3
{
  if (self->_diameter != a3)
  {
    self->_diameter = a3;
    uint64_t v15 = 0;
    memset(v14, 0, sizeof(v14));
    double v4 = [(NTKAlaskanChronographView *)self device];
    sub_19BAC(v4, (uint64_t)v14);

    [(NTKAlaskanChronographView *)self bounds];
    double v5 = *(double *)v14;
    double v7 = v6 - *(double *)v14 * 2.0;
    [(NTKAlaskanChronographView *)self bounds];
    -[CALayer setFrame:](self->_innerBackgroundCircle, "setFrame:", 0.0, 0.0, v7, v8 - v5 * 2.0);
    [(NTKAlaskanChronographView *)self bounds];
    CLKRectGetCenter();
    -[CALayer setPosition:](self->_innerBackgroundCircle, "setPosition:");
    [(CALayer *)self->_innerBackgroundCircle bounds];
    [(CALayer *)self->_innerBackgroundCircle setCornerRadius:v9 * 0.5];
    [(CALayer *)self->_innerBackgroundCircle setMasksToBounds:0];
    [(NTKAlaskanChronographView *)self bounds];
    double v11 = v10;
    [(NTKAlaskanChronographView *)self bounds];
    -[CALayer setFrame:](self->_outerBackgroundCircle, "setFrame:", 0.0, 0.0, v11, v12);
    [(NTKAlaskanChronographView *)self bounds];
    CLKRectGetCenter();
    -[CALayer setPosition:](self->_outerBackgroundCircle, "setPosition:");
    [(CALayer *)self->_outerBackgroundCircle bounds];
    [(CALayer *)self->_outerBackgroundCircle setCornerRadius:v13 * 0.5];
  }
}

- (void)handleResetButtonTap
{
  if ([(NTKAlaskanChronographView *)self isRunning])
  {
    id v3 = [(NTKAlaskanChronographView *)self delegate];
    [v3 alaskanChronographViewDidTapStartNewLapButton:self];
  }
  else
  {
    [(NTKAlaskanChronographView *)self setIsChronoMode:0];
    id v3 = [(NTKAlaskanChronographView *)self delegate];
    [v3 alaskanChronographViewDidTapResetButton:self];
  }
}

- (void)handleStartStopButtonTap
{
  unsigned int v3 = [(NTKAlaskanChronographView *)self isRunning];
  double v4 = [(NTKAlaskanChronographView *)self delegate];
  id v5 = v4;
  if (v3) {
    [v4 alaskanChronographViewDidTapPauseButton:self];
  }
  else {
    [v4 alaskanChronographViewDidTapStartButton:self];
  }
}

- (void)handleTapGestureRecognizer:(id)a3
{
  if (![(NTKAlaskanChronographView *)self isChronoMode])
  {
    [(NTKAlaskanChronographView *)self setIsChronoMode:1];
    id v4 = [(NTKAlaskanChronographView *)self delegate];
    [v4 alaskanChronographViewDidTapView:self];
  }
}

- (unint64_t)nextTimeScale
{
  unint64_t v2 = [(NTKAlaskanChronographView *)self timeScale];
  if (v2 + 1 <= 5) {
    return v2 + 1;
  }
  else {
    return 1;
  }
}

- (unint64_t)previousTimeScale
{
  unint64_t v2 = [(NTKAlaskanChronographView *)self timeScale];
  if (v2 == 1) {
    return 5;
  }
  else {
    return v2 - 1;
  }
}

- (void)updateHandsPosition
{
  [(NTKAlaskanChronographView *)self largeAnalogHandsFullRotationDuration];
  double v4 = v3;
  id v5 = [(NTKAlaskanChronographView *)self currentDate];
  [(NTKAlaskanChronographView *)self _stopwatchElapsedTimeToDate:v5];
  double v7 = v6;

  [(NTKAlaskanChronographView *)self _stopwatchCurrentLapTime];
  double v9 = v8;
  double v10 = [(NTKAlaskanChronographView *)self primaryHandView];
  *(float *)&double v4 = v4;
  LODWORD(v11) = LODWORD(v4);
  [(NTKAlaskanChronographView *)self zRotationForTime:v7 withDuration:v11];
  [v10 setZRotation:v12];

  double v13 = [(NTKAlaskanChronographView *)self secondaryHandView];
  LODWORD(v14) = LODWORD(v4);
  [(NTKAlaskanChronographView *)self zRotationForTime:v9 withDuration:v14];
  [v13 setZRotation:v15];

  [(NTKAlaskanChronographView *)self leftSubdialAnalogHandsFullRotationDuration];
  *(float *)&double v17 = v16;
  [(NTKAlaskanChronographView *)self zRotationForTime:v7 withDuration:v17];
  CGAffineTransformMakeRotation(&v27, v18);
  CGRect v19 = [(NTKAlaskanChronoSubdialView *)self->_leftSubdialView analogHand];
  CGAffineTransform v26 = v27;
  [v19 setTransform:&v26];

  [(NTKAlaskanChronographView *)self rightSubdialAnalogHandsFullRotationDuration];
  *(float *)&double v21 = v20;
  [(NTKAlaskanChronographView *)self zRotationForTime:v7 withDuration:v21];
  CGAffineTransformMakeRotation(&v25, v22);
  double v23 = [(NTKAlaskanChronoSubdialView *)self->_rightSubdialView analogHand];
  CGAffineTransform v24 = v25;
  [v23 setTransform:&v24];
}

- (void)startAnimatingHands
{
  [(NTKAlaskanChronographView *)self largeAnalogHandsFullRotationDuration];
  double v4 = v3;
  [(NTKAlaskanStopwatch *)self->_stopwatchModel currentTime];
  double v6 = v5;
  [(NTKAlaskanChronographView *)self _stopwatchCurrentLapTime];
  double v8 = v7;
  primaryHandView = self->_primaryHandView;
  float v10 = v4;
  *(float *)&double v11 = v10;
  [(NTKAlaskanChronographView *)self zRotationForTime:v6 withDuration:v11];
  double v13 = v12;
  [(NTKAlaskanChronographView *)self largeHandsAnimationFPS];
  [(NTKAlaskanChronographView *)self configureHandsAnimation:primaryHandView currentRadians:v13 durationOfFullRotation:v4 fps:v14];
  secondaryHandView = self->_secondaryHandView;
  *(float *)&double v16 = v4;
  [(NTKAlaskanChronographView *)self zRotationForTime:v8 withDuration:v16];
  double v18 = v17;
  [(NTKAlaskanChronographView *)self largeHandsAnimationFPS];
  [(NTKAlaskanChronographView *)self configureHandsAnimation:secondaryHandView currentRadians:v18 durationOfFullRotation:v4 fps:v19];
  [(NTKAlaskanChronographView *)self leftSubdialAnalogHandsFullRotationDuration];
  double v21 = v20;
  float v22 = [(NTKAlaskanChronoSubdialView *)self->_leftSubdialView analogHand];
  *(float *)&double v23 = v21;
  [(NTKAlaskanChronographView *)self zRotationForTime:v6 withDuration:v23];
  double v25 = v24;
  [(NTKAlaskanChronographView *)self leftSubdialHandsAnimationFPS];
  [(NTKAlaskanChronographView *)self configureHandsAnimation:v22 currentRadians:v25 durationOfFullRotation:v21 fps:v26];

  [(NTKAlaskanChronographView *)self rightSubdialAnalogHandsFullRotationDuration];
  double v28 = v27;
  id v33 = [(NTKAlaskanChronoSubdialView *)self->_rightSubdialView analogHand];
  *(float *)&double v29 = v28;
  [(NTKAlaskanChronographView *)self zRotationForTime:v6 withDuration:v29];
  double v31 = v30;
  [(NTKAlaskanChronographView *)self rightSubdialHandsAnimationFPS];
  [(NTKAlaskanChronographView *)self configureHandsAnimation:v33 currentRadians:v31 durationOfFullRotation:v28 fps:v32];
}

- (void)startAnimatingSubdialMinuteHand
{
  [(NTKAlaskanChronographView *)self bottomSubdialAnalogHandsFullRotationDuration];
  double v4 = v3;
  id v8 = [(NTKAlaskanChronoSubdialView *)self->_bottomSubdialView analogHand];
  [(NTKAlaskanChronographView *)self secondsAngleForCurrentDate];
  double v6 = v5;
  [(NTKAlaskanChronographView *)self bottomSubdialHandsAnimationFPS];
  [(NTKAlaskanChronographView *)self configureHandsAnimation:v8 currentRadians:v6 durationOfFullRotation:v4 fps:v7];
}

- (void)updateSubdialMinuteHandPosition
{
  [(NTKAlaskanChronographView *)self secondsAngleForCurrentDate];
  CGAffineTransformMakeRotation(&v6, v3);
  double v4 = [(NTKAlaskanChronoSubdialView *)self->_bottomSubdialView analogHand];
  CGAffineTransform v5 = v6;
  [v4 setTransform:&v5];
}

- (void)configureHandsAnimation:(id)a3 currentRadians:(double)a4 durationOfFullRotation:(double)a5 fps:(double)a6
{
  id v9 = a3;
  id v15 = +[CABasicAnimation animationWithKeyPath:@"transform.rotation"];
  LODWORD(v10) = 2139095040;
  [v15 setRepeatCount:v10];
  double v11 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
  [v15 setTimingFunction:v11];

  [v15 setRemovedOnCompletion:0];
  [v15 setFillMode:kCAFillModeForwards];
  if (a4 < 0.0) {
    a4 = a4 + 6.28318531;
  }
  float v12 = +[NSNumber numberWithDouble:a4];
  [v15 setFromValue:v12];

  double v13 = +[NSNumber numberWithDouble:a4 + 6.28318531];
  [v15 setToValue:v13];

  [v15 setDuration:a5];
  [v15 setFrameInterval:1.0 / a6];
  double v14 = [v9 layer];

  [v14 addAnimation:v15 forKey:@"NTKAlaskanChronographHandsAnimationKey"];
}

- (void)stopAnimatingHands
{
  CGFloat v3 = [(NTKHandView *)self->_primaryHandView layer];
  [(NTKAlaskanChronographView *)self stopHandAnimation:v3];

  double v4 = [(NTKHandView *)self->_secondaryHandView layer];
  [(NTKAlaskanChronographView *)self stopHandAnimation:v4];

  CGAffineTransform v5 = [(NTKAlaskanChronoSubdialView *)self->_rightSubdialView analogHand];
  CGAffineTransform v6 = [v5 layer];
  [(NTKAlaskanChronographView *)self stopHandAnimation:v6];

  id v8 = [(NTKAlaskanChronoSubdialView *)self->_leftSubdialView analogHand];
  double v7 = [v8 layer];
  [(NTKAlaskanChronographView *)self stopHandAnimation:v7];
}

- (void)stopAnimatingSubdialMinuteHand
{
  id v4 = [(NTKAlaskanChronoSubdialView *)self->_bottomSubdialView analogHand];
  CGFloat v3 = [v4 layer];
  [(NTKAlaskanChronographView *)self stopHandAnimation:v3];
}

- (void)stopHandAnimation:(id)a3
{
  id v6 = a3;
  CGFloat v3 = [v6 animationForKey:@"NTKAlaskanChronographHandsAnimationKey"];

  if (v3)
  {
    id v4 = [v6 presentationLayer];
    CGAffineTransform v5 = [v4 valueForKeyPath:@"transform.rotation"];
    [v6 setValue:v5 forKeyPath:@"transform.rotation"];

    [v6 removeAnimationForKey:@"NTKAlaskanChronographHandsAnimationKey"];
  }
}

- (double)largeHandsAnimationFPS
{
  unint64_t v2 = self->_timeScale - 1;
  double result = 0.0;
  if (v2 <= 4) {
    return dbl_36E20[v2];
  }
  return result;
}

- (double)leftSubdialHandsAnimationFPS
{
  return 1.0;
}

- (double)rightSubdialHandsAnimationFPS
{
  return 15.0;
}

- (double)bottomSubdialHandsAnimationFPS
{
  return 30.0;
}

- (double)largeAnalogHandsFullRotationDuration
{
  unint64_t timeScale = self->_timeScale;
  double result = 0.0;
  if (timeScale <= 5) {
    return dbl_36E48[timeScale];
  }
  return result;
}

- (double)leftSubdialAnalogHandsFullRotationDuration
{
  unint64_t timeScale = self->_timeScale;
  double result = 0.0;
  if (timeScale <= 5) {
    return dbl_36E78[timeScale];
  }
  return result;
}

- (double)rightSubdialAnalogHandsFullRotationDuration
{
  unint64_t timeScale = self->_timeScale;
  double result = 0.0;
  if (timeScale <= 5) {
    return dbl_36EA8[timeScale];
  }
  return result;
}

- (double)bottomSubdialAnalogHandsFullRotationDuration
{
  return 60.0;
}

- (id)currentDateTextProvider
{
  unint64_t v2 = [(NTKAlaskanChronographView *)self currentDate];
  CGFloat v3 = +[CLKDateTextProvider textProviderWithDate:v2 units:528];

  [v3 setUppercase:1];
  [v3 setShortUnits:1];

  return v3;
}

- (id)_totalTimelapsedTextProviderWithDate:(id)a3
{
  id v4 = +[CLKRelativeDateTextProvider textProviderWithDate:a3 style:2 units:224];
  if (![(NTKAlaskanChronographView *)self isRunning])
  {
    CGAffineTransform v5 = [(NTKAlaskanChronographView *)self currentDate];
    [v4 setRelativeToDate:v5];
  }
  objc_msgSend(v4, "setPaused:", -[NTKAlaskanChronographView isRunning](self, "isRunning") ^ 1);
  [v4 setWantsSubseconds:1];
  [v4 setTwoDigitMinuteZeroPadding:1];

  return v4;
}

- (id)_lapTimelapsedTextProviderWithDate:(id)a3
{
  id v4 = +[CLKRelativeDateTextProvider textProviderWithDate:a3 style:2 units:224];
  if (![(NTKAlaskanChronographView *)self isRunning])
  {
    CGAffineTransform v5 = [(NTKAlaskanChronographView *)self currentDate];
    [v4 setRelativeToDate:v5];
  }
  objc_msgSend(v4, "setPaused:", -[NTKAlaskanChronographView isRunning](self, "isRunning") ^ 1);
  [v4 setWantsSubseconds:1];
  [v4 setTwoDigitMinuteZeroPadding:1];
  [v4 setTintColor:self->_topLabelSuffixColor];
  id v6 = +[NTKAlaskanFaceBundle localizedStringForKey:@"ALASKAN_CHRONO_LAP_COUNT" comment:@"LAP %lu: %@"];
  double v7 = [(NTKAlaskanStopwatch *)self->_stopwatchModel laps];
  id v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, (char *)[v7 count] + 1);

  id v9 = +[CLKSimpleTextProvider textProviderWithText:v8];
  [v9 setTintColor:self->_topLabelPrefixColor];
  double v10 = +[CLKTextProvider textProviderWithFormat:@"%@%@", v9, v4];

  return v10;
}

- (void)_updateTachymeterLabel
{
  if (self->_showTimelapsedByMinutes && [(NTKAlaskanChronographView *)self isRunning])
  {
    id v10 = [(NTKAlaskanChronographView *)self titleForTimeScale:self->_timeScale];
    [(CLKUIColoringLabel *)self->_topLabel setText:v10];
  }
  else
  {
    [(NTKAlaskanStopwatch *)self->_stopwatchModel currentTime];
    CGFloat v3 = -[NTKAlaskanChronographView _tachymeterTextProviderWithTimeInterval:](self, "_tachymeterTextProviderWithTimeInterval:");
    [(CLKUIColoringLabel *)self->_topLabel setTextProvider:v3];

    [(CLKUIColoringLabel *)self->_topLabel sizeToFit];
    uint64_t v14 = 0;
    long long v12 = 0u;
    long long v13 = 0u;
    memset(v11, 0, sizeof(v11));
    id v4 = [(NTKAlaskanChronographView *)self device];
    sub_19BAC(v4, (uint64_t)v11);

    [(NTKAlaskanChronographView *)self bounds];
    double v6 = v5 - *((double *)&v12 + 1);
    [(CLKUIColoringLabel *)self->_topLabel bounds];
    if (CGRectGetWidth(v16) > v6)
    {
      [(NTKAlaskanStopwatch *)self->_stopwatchModel currentTime];
      double v7 = -[NTKAlaskanChronographView _tachymeterTextProviderWithTimeInterval:dropPrefix:](self, "_tachymeterTextProviderWithTimeInterval:dropPrefix:", 1);
      [(CLKUIColoringLabel *)self->_topLabel setTextProvider:v7];

      [(CLKUIColoringLabel *)self->_topLabel sizeToFit];
      [(CLKUIColoringLabel *)self->_topLabel bounds];
      if (CGRectGetWidth(v17) > v6)
      {
        [(NTKAlaskanStopwatch *)self->_stopwatchModel currentTime];
        id v8 = -[NTKAlaskanChronographView _tachymeterTextProviderWithTimeInterval:dropPrefix:dropSuffix:](self, "_tachymeterTextProviderWithTimeInterval:dropPrefix:dropSuffix:", 1, 1);
        [(CLKUIColoringLabel *)self->_topLabel setTextProvider:v8];

        topLabel = self->_topLabel;
        [(CLKUIColoringLabel *)topLabel sizeToFit];
      }
    }
  }
}

- (id)_tachymeterTextProviderWithTimeInterval:(double)a3
{
  return [(NTKAlaskanChronographView *)self _tachymeterTextProviderWithTimeInterval:0 dropPrefix:a3];
}

- (id)_tachymeterTextProviderWithTimeInterval:(double)a3 dropPrefix:(BOOL)a4
{
  return [(NTKAlaskanChronographView *)self _tachymeterTextProviderWithTimeInterval:a4 dropPrefix:0 dropSuffix:a3];
}

- (id)_tachymeterTextProviderWithTimeInterval:(double)a3 dropPrefix:(BOOL)a4 dropSuffix:(BOOL)a5
{
  if (a4)
  {
    id v8 = &stru_39558;
  }
  else
  {
    id v8 = +[NTKAlaskanFaceBundle localizedStringForKey:@"ALASKAN_CHRONO_TACHY_LABEL_PREFIX" comment:@"TOTAL"];
  }
  id v9 = +[CLKSimpleTextProvider textProviderWithText:v8];
  [v9 setTintColor:self->_topLabelPrefixColor];
  if (a5)
  {
    id v10 = @"%lu";
  }
  else
  {
    id v10 = +[NTKAlaskanFaceBundle localizedStringForKey:@"ALASKAN_CHRONO_TACHY_LABEL" table:@"AlaskanFormats" comment:@"%lu UNITS/HOUR"];
  }
  double v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, vcvtpd_u64_f64(3600.0 / a3));
  long long v12 = +[CLKSimpleTextProvider textProviderWithText:v11];
  [v12 setTintColor:self->_topLabelSuffixColor];
  if (CLKLayoutIsRTL()) {
    +[CLKTextProvider textProviderWithFormat:@"%@%@", v12, v9];
  }
  else {
  long long v13 = +[CLKTextProvider textProviderWithFormat:@"%@%@", v9, v12];
  }

  return v13;
}

- (void)startStopTachymeterUnitUpdates:(BOOL)a3
{
  tachymeterTimerToken = self->_tachymeterTimerToken;
  if (tachymeterTimerToken) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (v5)
  {
    if (tachymeterTimerToken && !a3)
    {
      double v6 = +[CLKClockTimer sharedInstance];
      [v6 stopUpdatesForToken:self->_tachymeterTimerToken];

      double v7 = self->_tachymeterTimerToken;
      self->_tachymeterTimerToken = 0;
    }
  }
  else
  {
    objc_initWeak(&location, self);
    id v8 = +[CLKClockTimer sharedInstance];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1DB54;
    _OWORD v11[3] = &unk_38A98;
    objc_copyWeak(&v12, &location);
    id v9 = [v8 startUpdatesWithUpdateFrequency:2 withHandler:v11 identificationLog:&stru_39260];
    id v10 = self->_tachymeterTimerToken;
    self->_tachymeterTimerToken = v9;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)enableDisableResetButton
{
  BOOL v5 = 0;
  if ([(NTKAlaskanChronographView *)self isChronoMode])
  {
    if (self->_timeScale != 1
      || ([(NTKAlaskanChronographView *)self stopwatchModel],
          CGFloat v3 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v4 = [v3 isRunning],
          v3,
          (v4 & 1) == 0))
    {
      BOOL v5 = 1;
    }
  }
  [(NTKAlaskanChronoButton *)self->_resetButton setUserInteractionEnabled:v5];
  [(NTKAlaskanChronographView *)self resetButtonAlpha];
  resetButton = self->_resetButton;

  -[NTKAlaskanChronoButton setAlpha:](resetButton, "setAlpha:");
}

- (void)updateSecondaryHandVisibility
{
  stopwatchModel = self->_stopwatchModel;
  if (stopwatchModel)
  {
    unsigned __int8 v4 = [(NTKAlaskanStopwatch *)stopwatchModel laps];
    if ([v4 count]
      && (char *)[(NTKAlaskanChronographView *)self timeScale] != (char *)&dword_0 + 1)
    {
      uint64_t v5 = [(NTKAlaskanChronographView *)self isChronoMode] ^ 1;
    }
    else
    {
      uint64_t v5 = 1;
    }
  }
  else
  {
    uint64_t v5 = 1;
  }
  id v6 = [(NTKAlaskanChronographView *)self secondaryHandView];
  [v6 setHidden:v5];
}

- (double)secondsAngleForCurrentDate
{
  CGFloat v3 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
  unsigned __int8 v4 = [(NTKAlaskanChronographView *)self currentDate];
  NTKHourMinuteSecondAnglesForTime();

  return 0.0;
}

- (double)_stopwatchCurrentLapTime
{
  [(NTKAlaskanStopwatch *)self->_stopwatchModel currentTime];
  double v4 = v3;
  [(NTKAlaskanStopwatch *)self->_stopwatchModel timeUntilLastLap];
  return v4 - v5;
}

- (double)_stopwatchElapsedTimeToDate:(id)a3
{
  stopwatchModel = self->_stopwatchModel;
  [a3 timeIntervalSinceReferenceDate];

  -[NTKAlaskanStopwatch elapsedDurationForFutureTime:](stopwatchModel, "elapsedDurationForFutureTime:");
  return result;
}

- (id)_stopwatchStartDateRelativeToDate:(id)a3
{
  id v4 = a3;
  [(NTKAlaskanChronographView *)self _stopwatchElapsedTimeToDate:v4];
  id v6 = +[NSDate dateWithTimeInterval:v4 sinceDate:-v5];

  return v6;
}

- (float)zRotationForTime:(double)a3 withDuration:(float)a4
{
  return fmod(a3, a4) * 6.28318531 / a4;
}

- (BOOL)isRunning
{
  unint64_t v2 = [(NTKAlaskanChronographView *)self stopwatchModel];
  unsigned __int8 v3 = [v2 isRunning];

  return v3;
}

- (void)applyTransitionTritiumOnWithFraction:(double)a3
{
  double v5 = [(NTKAlaskanChronographView *)self originalPalette];
  id v13 = [v5 tritiumPaletteWithProgress:a3];

  CLKInterpolateBetweenFloatsClipped();
  -[NTKHandView setAlpha:](self->_primaryHandView, "setAlpha:");
  CLKInterpolateBetweenFloatsClipped();
  -[NTKHandView setAlpha:](self->_secondaryHandView, "setAlpha:");
  CLKInterpolateBetweenFloatsClipped();
  double v7 = v6;
  id v8 = [(NTKAlaskanChronoSubdialView *)self->_bottomSubdialView analogHand];
  [v8 setAlpha:v7];

  if ([(NTKAlaskanChronographView *)self isChronoMode]
    && [(NTKAlaskanChronographView *)self isRunning])
  {
    CLKCompressFraction();
    double v10 = v9;
    CLKCompressFraction();
    if (a3 >= 0.5)
    {
      double v12 = v11;
      self->_showTimelapsedByMinutes = 1;
      [(NTKAlaskanChronographView *)self _updateElapsedTimeLabel];
    }
    else
    {
      self->_showTimelapsedByMinutes = 0;
      [(NTKAlaskanChronographView *)self _updateElapsedTimeLabel];
      double v12 = 1.0 - v10;
    }
    [(CLKUIColoringLabel *)self->_topLabel setAlpha:v12];
    [(CLKUIColoringLabel *)self->_centerLabel setAlpha:v12];
  }
  [(NTKAlaskanChronographView *)self applyPalette:v13];
}

- (NTKAlaskanChronographViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKAlaskanChronographViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isChronoMode
{
  return self->_isChronoMode;
}

- (BOOL)isEditing
{
  return self->_isEditing;
}

- (unint64_t)timeScale
{
  return self->_timeScale;
}

- (NTKHandView)primaryHandView
{
  return self->_primaryHandView;
}

- (void)setPrimaryHandView:(id)a3
{
}

- (void)setSecondaryHandView:(id)a3
{
}

- (BOOL)showTimelapsedByMinutes
{
  return self->_showTimelapsedByMinutes;
}

- (void)setShowTimelapsedByMinutes:(BOOL)a3
{
  self->_showTimelapsedByMinutes = a3;
}

- (NTKAlaskanStopwatch)stopwatchModel
{
  return self->_stopwatchModel;
}

- (UIView)chronometerHandsParentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chronometerHandsParentView);

  return (UIView *)WeakRetained;
}

- (NTKChronographProFacePalette)palette
{
  return self->_palette;
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NTKAlaskanChronoDialView)dialTickView
{
  return self->_dialTickView;
}

- (NTKAlaskanChronoDialView)transitionDialTickView
{
  return self->_transitionDialTickView;
}

- (void)setTransitionDialTickView:(id)a3
{
}

- (NTKAlaskanDialViewFactory)dialViewFactory
{
  return self->_dialViewFactory;
}

- (void)setDialViewFactory:(id)a3
{
}

- (NTKAlaskanSubdialViewFactory)subdialViewFactory
{
  return self->_subdialViewFactory;
}

- (void)setSubdialViewFactory:(id)a3
{
}

- (void)setTopLabel:(id)a3
{
}

- (void)setCenterLabel:(id)a3
{
}

- (CLKUIColoringLabel)transitionCenterLabel
{
  return self->_transitionCenterLabel;
}

- (void)setTransitionCenterLabel:(id)a3
{
}

- (CALayer)centerLabelBackgroundLayer
{
  return self->_centerLabelBackgroundLayer;
}

- (void)setCenterLabelBackgroundLayer:(id)a3
{
}

- (UIColor)topLabelPrefixColor
{
  return self->_topLabelPrefixColor;
}

- (void)setTopLabelPrefixColor:(id)a3
{
}

- (UIColor)topLabelSuffixColor
{
  return self->_topLabelSuffixColor;
}

- (void)setTopLabelSuffixColor:(id)a3
{
}

- (void)setResetButton:(id)a3
{
}

- (void)setStartStopButton:(id)a3
{
}

- (NTKAlaskanChronoSubdialView)leftSubdialView
{
  return self->_leftSubdialView;
}

- (void)setLeftSubdialView:(id)a3
{
}

- (NTKAlaskanChronoSubdialView)rightSubdialView
{
  return self->_rightSubdialView;
}

- (void)setRightSubdialView:(id)a3
{
}

- (NTKAlaskanChronoSubdialView)bottomSubdialView
{
  return self->_bottomSubdialView;
}

- (void)setBottomSubdialView:(id)a3
{
}

- (NTKAlaskanChronoSubdialView)transitionLeftSubdialView
{
  return self->_transitionLeftSubdialView;
}

- (void)setTransitionLeftSubdialView:(id)a3
{
}

- (NTKAlaskanChronoSubdialView)transitionRightSubdialView
{
  return self->_transitionRightSubdialView;
}

- (void)setTransitionRightSubdialView:(id)a3
{
}

- (CALayer)outerBackgroundCircle
{
  return self->_outerBackgroundCircle;
}

- (void)setOuterBackgroundCircle:(id)a3
{
}

- (CALayer)innerBackgroundCircle
{
  return self->_innerBackgroundCircle;
}

- (void)setInnerBackgroundCircle:(id)a3
{
}

- (double)diameter
{
  return self->_diameter;
}

- (CLKClockTimerToken)tachymeterTimerToken
{
  return self->_tachymeterTimerToken;
}

- (void)setTachymeterTimerToken:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NTKChronographProFacePalette)originalPalette
{
  return self->_originalPalette;
}

- (void)setOriginalPalette:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalPalette, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_tachymeterTimerToken, 0);
  objc_storeStrong((id *)&self->_innerBackgroundCircle, 0);
  objc_storeStrong((id *)&self->_outerBackgroundCircle, 0);
  objc_storeStrong((id *)&self->_transitionRightSubdialView, 0);
  objc_storeStrong((id *)&self->_transitionLeftSubdialView, 0);
  objc_storeStrong((id *)&self->_bottomSubdialView, 0);
  objc_storeStrong((id *)&self->_rightSubdialView, 0);
  objc_storeStrong((id *)&self->_leftSubdialView, 0);
  objc_storeStrong((id *)&self->_startStopButton, 0);
  objc_storeStrong((id *)&self->_resetButton, 0);
  objc_storeStrong((id *)&self->_topLabelSuffixColor, 0);
  objc_storeStrong((id *)&self->_topLabelPrefixColor, 0);
  objc_storeStrong((id *)&self->_centerLabelBackgroundLayer, 0);
  objc_storeStrong((id *)&self->_transitionCenterLabel, 0);
  objc_storeStrong((id *)&self->_centerLabel, 0);
  objc_storeStrong((id *)&self->_topLabel, 0);
  objc_storeStrong((id *)&self->_subdialViewFactory, 0);
  objc_storeStrong((id *)&self->_dialViewFactory, 0);
  objc_storeStrong((id *)&self->_transitionDialTickView, 0);
  objc_storeStrong((id *)&self->_dialTickView, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_destroyWeak((id *)&self->_chronometerHandsParentView);
  objc_storeStrong((id *)&self->_stopwatchModel, 0);
  objc_storeStrong((id *)&self->_secondaryHandView, 0);
  objc_storeStrong((id *)&self->_primaryHandView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end