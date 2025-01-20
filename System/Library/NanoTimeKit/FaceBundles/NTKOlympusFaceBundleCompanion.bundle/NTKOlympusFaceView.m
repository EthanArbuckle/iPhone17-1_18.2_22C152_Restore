@interface NTKOlympusFaceView
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
+ (int64_t)uiSensitivity;
- (BOOL)_needsForegroundContainerView;
- (BOOL)_showAnalogHands;
- (BOOL)_wantsStatusBarIconShadow;
- (BOOL)contentLoaded;
- (BOOL)isCircularDialWithBezel;
- (NSDate)date;
- (NTKCircularAnalogDialView)dialView;
- (NTKOlympusController)olympusController;
- (NTKOlympusFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (NTKOlympusTimeView)olympusView;
- (NTKRoundedCornerOverlayView)cornerView;
- (NTKVictoryAnalogBackgroundView)analogBackgroundView;
- (double)_bezelUtilityComplicationAlphaForEditMode:(int64_t)a3;
- (double)_complicationAlphaForEditMode:(int64_t)a3;
- (double)_contentAlphaForEditMode:(int64_t)a3;
- (double)_dialAlphaForEditMode:(int64_t)a3;
- (double)_editSpeedForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (double)_minimumBreathingScaleForComplicationSlot:(id)a3;
- (double)_timeAlphaForEditMode:(int64_t)a3;
- (double)bezelComplicationTextWidthInRadius;
- (double)circleDiameter;
- (double)contentViewScale;
- (id)_additionalPrelaunchApplicationIdentifiers;
- (id)_additonalViewsToApplyDesaturationDuringComplicationEditing;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)createFaceColorPalette;
- (id)palette;
- (id)utilityBezelComplicationView;
- (unint64_t)currentDial;
- (unint64_t)currentStyle;
- (unint64_t)hour;
- (unint64_t)minute;
- (unint64_t)second;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyContentViewTranform:(CGAffineTransform *)a3;
- (void)_applyDataMode;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5 animateElements:(BOOL)a6;
- (void)_applyTransitionFraction:(double)a3 fromComplication:(id)a4 toComplication:(id)a5 slot:(id)a6;
- (void)_applyTransitionFraction:(double)a3 fromDial:(unint64_t)a4 toDial:(unint64_t)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5;
- (void)_cleanupAfterEditing;
- (void)_cleanupAfterTransitionComplicationSlot:(id)a3 selectedComplication:(id)a4;
- (void)_cleanupAfterTransitionToOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_configureTimeView:(id)a3;
- (void)_createAnalogBackgroundIfNeeded;
- (void)_loadSnapshotContentViews;
- (void)_prepareForEditing;
- (void)_removeViews;
- (void)_setupController;
- (void)_setupDialViewIfNeeded;
- (void)_setupViews;
- (void)_tearDownAnalogView;
- (void)_tearDownOlympusView;
- (void)_unloadSnapshotContentViews;
- (void)_updateBackgroundViewAlpha;
- (void)_updateDialBezelComplicationColor:(id)a3;
- (void)_updateDialTicksForBezelText;
- (void)applyColorOnAnalogHands;
- (void)applyTransitionToCircularDialWithBezelFraction:(double)a3;
- (void)configureComplicationAlphaFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)configureViewsForEditing;
- (void)createAndRemoveViewsForCurrentStateIfNeeded;
- (void)createOlympusViewIfNeeded;
- (void)dealloc;
- (void)layoutSubviews;
- (void)logoTappedFromRect:(CGRect)a3;
- (void)olympusView:(id)a3 didTapAppLogoFromRect:(CGRect)a4;
- (void)openVictoryAppFromRect:(CGRect)a3;
- (void)setAnalogBackgroundView:(id)a3;
- (void)setCircleDiameter:(double)a3;
- (void)setCircularMaskForCircularDialFraction:(double)a3 circleDiameter:(double)a4;
- (void)setContentLoaded:(BOOL)a3;
- (void)setCornerView:(id)a3;
- (void)setCurrentDial:(unint64_t)a3;
- (void)setCurrentStyle:(unint64_t)a3;
- (void)setDate:(id)a3;
- (void)setDialView:(id)a3;
- (void)setHour:(unint64_t)a3;
- (void)setMinute:(unint64_t)a3;
- (void)setOlympusController:(id)a3;
- (void)setOlympusView:(id)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setSecond:(unint64_t)a3;
- (void)setTimeOffset:(double)a3;
- (void)setupViewsForCurrentState;
- (void)tearDownDialView;
- (void)updateCircularMask;
@end

@implementation NTKOlympusFaceView

+ (int64_t)uiSensitivity
{
  v2 = +[CLKRenderingContext sharedRenderingContext];
  v3 = [v2 device];
  int64_t v4 = NTKSensitivityForVictoryFaces();

  return v4;
}

- (NTKOlympusFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)NTKOlympusFaceView;
  v9 = [(NTKOlympusFaceView *)&v22 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  v10 = v9;
  if (v9)
  {
    [(NTKOlympusFaceView *)v9 setClipsToBounds:1];
    v11 = [(NTKOlympusFaceView *)v10 layer];
    [v11 setMasksToBounds:1];

    id v12 = objc_alloc_init((Class)NTKCompositeComplicationFactory);
    id v13 = objc_alloc((Class)NTKWhistlerAnalogFaceViewComplicationFactory);
    v14 = [(NTKOlympusFaceView *)v10 device];
    sub_1D84(v14);
    id v16 = [v13 initWithFaceView:v10 dialDiameter:v8 device:v15];

    [v16 setUsesNarrowTopSlots:1];
    v23[0] = NTKComplicationSlotTopLeft;
    v23[1] = NTKComplicationSlotTopRight;
    v23[2] = NTKComplicationSlotBottomLeft;
    v23[3] = NTKComplicationSlotBottomRight;
    v17 = +[NSArray arrayWithObjects:v23 count:4];
    [v12 registerFactory:v16 forSlots:v17];

    id v18 = [objc_alloc((Class)NTKUtilityComplicationFactory) initForDevice:v8];
    [v18 setFaceView:v10];
    v19 = [(NTKOlympusFaceView *)v10 device];
    sub_1D84(v19);
    [v18 setDialDiameter:v20];

    [v12 registerFactory:v18 forSlot:NTKComplicationSlotBezel];
    [(NTKOlympusFaceView *)v10 setComplicationFactory:v12];
  }
  return v10;
}

- (void)dealloc
{
  [(NTKOlympusFaceView *)self _unloadSnapshotContentViews];
  v3.receiver = self;
  v3.super_class = (Class)NTKOlympusFaceView;
  [(NTKOlympusFaceView *)&v3 dealloc];
}

- (id)createFaceColorPalette
{
  id v2 = objc_alloc_init((Class)NTKOlympusColorPalette);

  return v2;
}

- (id)palette
{
  objc_super v3 = [(NTKOlympusFaceView *)self faceColorPalette];
  [v3 setStyle:self->_currentStyle];
  [v3 setDial:self->_currentDial];

  return v3;
}

- (void)_loadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKOlympusFaceView;
  [(NTKOlympusFaceView *)&v3 _loadSnapshotContentViews];
  [(NTKOlympusFaceView *)self _setupViews];
}

- (void)_unloadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKOlympusFaceView;
  [(NTKOlympusFaceView *)&v3 _unloadSnapshotContentViews];
  [(NTKOlympusFaceView *)self _removeViews];
}

- (void)_setupViews
{
  self->_contentLoaded = 1;
  objc_super v3 = [(NTKOlympusFaceView *)self optionForCustomEditMode:15 slot:0];
  self->_unint64_t currentStyle = (unint64_t)[v3 style];

  unint64_t currentStyle = self->_currentStyle;
  v5 = [(NTKOlympusFaceView *)self olympusView];
  [v5 setCurrentStyle:currentStyle];

  v6 = [(NTKOlympusFaceView *)self optionForCustomEditMode:12 slot:0];
  self->_unint64_t currentDial = (unint64_t)[v6 dialShape];

  unint64_t currentDial = self->_currentDial;
  id v8 = [(NTKOlympusFaceView *)self olympusView];
  [v8 setCurrentDial:currentDial];

  v9 = [(NTKOlympusFaceView *)self palette];
  v10 = [(NTKOlympusFaceView *)self olympusView];
  [v10 setCurrentColorPalette:v9];

  [(NTKOlympusFaceView *)self createAndRemoveViewsForCurrentStateIfNeeded];
  [(NTKOlympusFaceView *)self _setupController];
  id v11 = objc_alloc((Class)NTKRoundedCornerOverlayView);
  [(NTKOlympusFaceView *)self bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v20 = [(NTKOlympusFaceView *)self device];
  v21 = (NTKRoundedCornerOverlayView *)objc_msgSend(v11, "initWithFrame:forDeviceCornerRadius:", v20, v13, v15, v17, v19);
  cornerView = self->_cornerView;
  self->_cornerView = v21;

  v23 = [(NTKOlympusFaceView *)self contentView];
  [v23 addSubview:self->_cornerView];

  v24 = [(NTKOlympusFaceView *)self timeView];
  [(NTKOlympusFaceView *)self _configureTimeView:v24];

  [(NTKOlympusFaceView *)self _updateDialTicksForBezelText];
}

- (void)_setupController
{
  if (!self->_olympusController)
  {
    self->_olympusController = (NTKOlympusController *)[objc_alloc((Class)NTKOlympusController) initWithFaceView:self olympusView:self->_olympusView];
    _objc_release_x1();
  }
}

- (void)_removeViews
{
  self->_contentLoaded = 0;
  [(NTKOlympusFaceView *)self _tearDownOlympusView];
  [(NTKOlympusFaceView *)self _tearDownAnalogView];
  [(NTKOlympusFaceView *)self tearDownDialView];
  [(NTKRoundedCornerOverlayView *)self->_cornerView removeFromSuperview];
  cornerView = self->_cornerView;
  self->_cornerView = 0;

  olympusController = self->_olympusController;
  self->_olympusController = 0;
}

- (void)createAndRemoveViewsForCurrentStateIfNeeded
{
  if (self->_contentLoaded)
  {
    unint64_t currentStyle = self->_currentStyle;
    if (currentStyle - 1 >= 2 && currentStyle)
    {
      if (currentStyle == 3)
      {
        [(NTKOlympusFaceView *)self _createAnalogBackgroundIfNeeded];
        [(NTKOlympusFaceView *)self _tearDownOlympusView];
      }
    }
    else
    {
      [(NTKOlympusFaceView *)self createOlympusViewIfNeeded];
      [(NTKOlympusFaceView *)self _tearDownAnalogView];
    }
    if (self->_currentDial) {
      [(NTKOlympusFaceView *)self tearDownDialView];
    }
    else {
      [(NTKOlympusFaceView *)self _setupDialViewIfNeeded];
    }
    int64_t v4 = [(NTKOlympusFaceView *)self timeView];
    [(NTKOlympusFaceView *)self _configureTimeView:v4];

    [(NTKOlympusFaceView *)self setupViewsForCurrentState];
    id v6 = [(NTKOlympusFaceView *)self contentView];
    v5 = [(NTKOlympusFaceView *)self cornerView];
    [v6 bringSubviewToFront:v5];
  }
}

- (void)setupViewsForCurrentState
{
  [(NTKOlympusTimeView *)self->_olympusView setupViewsForCurrentState:[(NTKOlympusFaceView *)self editing]];
  if (self->_analogBackgroundView)
  {
    unint64_t currentDial = self->_currentDial;
    int64_t v4 = [(NTKOlympusFaceView *)self palette];
    [v4 setDial:currentDial];

    unint64_t currentStyle = self->_currentStyle;
    id v6 = [(NTKOlympusFaceView *)self palette];
    [v6 setStyle:currentStyle];

    id v7 = objc_alloc((Class)NTKOlympusAnalogBackgroundPalette);
    id v8 = [(NTKOlympusFaceView *)self palette];
    id v9 = [v7 initWithOlympusColorPalette:v8];

    [(NTKVictoryAnalogBackgroundView *)self->_analogBackgroundView applyTransitionFraction:self->_currentStyle fromOlympusStyle:self->_currentStyle toOlympusStyle:1.0];
    [(NTKVictoryAnalogBackgroundView *)self->_analogBackgroundView setPalette:v9];
    [(NTKVictoryAnalogBackgroundView *)self->_analogBackgroundView setDialShape:self->_currentDial];
    [(NTKOlympusFaceView *)self _updateBackgroundViewAlpha];
  }
  dialView = self->_dialView;
  if (dialView) {
    [(NTKCircularAnalogDialView *)dialView setHideHourTicks:self->_currentStyle - 4 < 0xFFFFFFFFFFFFFFFELL];
  }
  if (self->_currentDial == 1)
  {
    id v11 = [(NTKOlympusFaceView *)self contentView];
    double v12 = [v11 layer];
    [v12 setMask:0];

    uint64_t v13 = 1;
  }
  else
  {
    [(NTKOlympusFaceView *)self circleDiameter];
    [(NTKOlympusFaceView *)self setCircularMaskForCircularDialFraction:1.0 circleDiameter:v14];
    uint64_t v13 = [(NTKOlympusFaceView *)self isCircularDialWithBezel] ^ 1;
  }
  double v15 = self->_dialView;

  [(NTKCircularAnalogDialView *)v15 setHidden:v13];
}

- (void)configureViewsForEditing
{
  if (self->_contentLoaded)
  {
    [(NTKOlympusFaceView *)self createOlympusViewIfNeeded];
    [(NTKOlympusTimeView *)self->_olympusView configureViewsForEditing];
    [(NTKOlympusFaceView *)self _createAnalogBackgroundIfNeeded];
    [(NTKOlympusFaceView *)self _setupDialViewIfNeeded];
    [(NTKOlympusFaceView *)self setupViewsForCurrentState];
    [(NTKOlympusFaceView *)self _applyTransitionFraction:self->_currentDial fromDial:self->_currentDial toDial:1.0];
    [(NTKOlympusFaceView *)self _applyTransitionFraction:self->_currentStyle fromStyle:self->_currentStyle toStyle:1.0];
    objc_super v3 = [(NTKOlympusFaceView *)self palette];
    int64_t v4 = [(NTKOlympusFaceView *)self palette];
    [(NTKOlympusFaceView *)self _applyTransitionFraction:v3 fromColorPalette:v4 toColorPalette:0 animateElements:1.0];

    [(NTKOlympusFaceView *)self contentViewScale];
    CGAffineTransformMakeScale(&v8, v5, v5);
    [(NTKOlympusFaceView *)self _applyContentViewTranform:&v8];
    id v6 = [(NTKOlympusFaceView *)self contentView];
    id v7 = [(NTKOlympusFaceView *)self cornerView];
    [v6 bringSubviewToFront:v7];
  }
}

- (void)_createAnalogBackgroundIfNeeded
{
  analogBackgroundView = self->_analogBackgroundView;
  if (!analogBackgroundView)
  {
    int64_t v4 = [(NTKOlympusFaceView *)self device];
    id v5 = objc_alloc((Class)NTKVictoryAnalogBackgroundView);
    [v4 screenBounds];
    id v6 = (NTKVictoryAnalogBackgroundView *)objc_msgSend(v5, "initWithFrame:forDevice:", v4);
    id v7 = self->_analogBackgroundView;
    self->_analogBackgroundView = v6;

    [(NTKVictoryAnalogBackgroundView *)self->_analogBackgroundView setDelegate:self];
    [(NTKVictoryAnalogBackgroundView *)self->_analogBackgroundView setStyle:4];
    [(NTKOlympusFaceView *)self contentViewScale];
    CGAffineTransformMakeScale(&v14, v8, v8);
    id v9 = self->_analogBackgroundView;
    CGAffineTransform v13 = v14;
    [(NTKVictoryAnalogBackgroundView *)v9 setTransform:&v13];

    analogBackgroundView = self->_analogBackgroundView;
  }
  v10 = [(NTKVictoryAnalogBackgroundView *)analogBackgroundView superview];
  id v11 = [(NTKOlympusFaceView *)self contentView];

  if (v10 != v11)
  {
    double v12 = [(NTKOlympusFaceView *)self contentView];
    [v12 addSubview:self->_analogBackgroundView];
  }
  [(NTKVictoryAnalogBackgroundView *)self->_analogBackgroundView setHidden:0];
}

- (void)_setupDialViewIfNeeded
{
  dialView = self->_dialView;
  if (!dialView)
  {
    int64_t v4 = [(NTKOlympusFaceView *)self device];
    sub_1D84(v4);

    [(NTKOlympusFaceView *)self bounds];
    id v5 = [(NTKOlympusFaceView *)self device];
    CLKSizeCenteredInRectForDevice();
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    id v14 = objc_alloc((Class)NTKCircularAnalogDialView);
    double v15 = [(NTKOlympusFaceView *)self device];
    double v16 = (NTKCircularAnalogDialView *)objc_msgSend(v14, "initWithFrame:forDevice:hideHourTicks:", v15, 0, v7, v9, v11, v13);
    double v17 = self->_dialView;
    self->_dialView = v16;

    [(NTKCircularAnalogDialView *)self->_dialView showAllTicksInDial];
    double v18 = self->_dialView;
    double v19 = [(NTKOlympusFaceView *)self palette];
    double v20 = [(NTKOlympusFaceView *)self palette];
    [(NTKCircularAnalogDialView *)v18 applyColorTransitionFraction:v19 fromColorPalette:v20 toColorPalette:1.0];

    v21 = self->_dialView;
    objc_super v22 = +[UIColor clearColor];
    [(NTKCircularAnalogDialView *)v21 setDialBackgroundColor:v22];

    v23 = +[UIColor clearColor];
    [(NTKCircularAnalogDialView *)self->_dialView setBackgroundColor:v23];

    dialView = self->_dialView;
  }
  v24 = [(NTKCircularAnalogDialView *)dialView superview];

  if (v24 != self) {
    [(NTKOlympusFaceView *)self insertSubview:self->_dialView atIndex:0];
  }
  uint64_t v25 = [(NTKOlympusFaceView *)self isCircularDialWithBezel] ^ 1;
  v26 = self->_dialView;

  [(NTKCircularAnalogDialView *)v26 setHidden:v25];
}

- (void)_tearDownAnalogView
{
  [(NTKVictoryAnalogBackgroundView *)self->_analogBackgroundView removeFromSuperview];
  analogBackgroundView = self->_analogBackgroundView;
  self->_analogBackgroundView = 0;
}

- (void)createOlympusViewIfNeeded
{
  if (!self->_olympusView)
  {
    id v3 = objc_alloc((Class)NTKOlympusTimeView);
    int64_t v4 = [(NTKOlympusFaceView *)self device];
    unint64_t currentDial = self->_currentDial;
    unint64_t currentStyle = self->_currentStyle;
    double v7 = [(NTKOlympusFaceView *)self palette];
    double v8 = [(NTKOlympusFaceView *)self currentDisplayDate];
    double v9 = (NTKOlympusTimeView *)[v3 initWithDevice:v4 dial:currentDial style:currentStyle colorPalette:v7 date:v8];
    olympusView = self->_olympusView;
    self->_olympusView = v9;

    [(NTKOlympusTimeView *)self->_olympusView setDelegate:self];
    [(NTKOlympusFaceView *)self contentViewScale];
    CGAffineTransformMakeScale(&v18, v11, v11);
    double v12 = self->_olympusView;
    CGAffineTransform v17 = v18;
    [(NTKOlympusTimeView *)v12 setTransform:&v17];
    [(NTKOlympusController *)self->_olympusController setOlympusView:self->_olympusView];
    analogBackgroundView = self->_analogBackgroundView;
    id v14 = [(NTKOlympusFaceView *)self contentView];
    double v15 = v14;
    double v16 = self->_olympusView;
    if (analogBackgroundView) {
      [v14 insertSubview:v16 belowSubview:self->_analogBackgroundView];
    }
    else {
      [v14 addSubview:v16];
    }
  }
}

- (void)_tearDownOlympusView
{
  [(NTKOlympusTimeView *)self->_olympusView removeFromSuperview];
  olympusView = self->_olympusView;
  self->_olympusView = 0;
}

- (void)tearDownDialView
{
  [(NTKCircularAnalogDialView *)self->_dialView removeFromSuperview];
  dialView = self->_dialView;
  self->_dialView = 0;
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NTKOlympusFaceView;
  [(NTKOlympusFaceView *)&v13 _configureComplicationView:v6 forSlot:a4];
  double v7 = [(NTKOlympusFaceView *)self palette];
  double v8 = [v7 cornerComplicationsAccentColor];
  [(NTKOlympusFaceView *)self setComplicationColor:v8];

  double v9 = [(NTKOlympusFaceView *)self complicationColor];
  [(NTKOlympusFaceView *)self setInterpolatedComplicationColor:v9];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 updateMonochromeColor];
  }
  if ([v6 conformsToProtocol:&OBJC_PROTOCOL___NTKUtilityComplicationView])
  {
    id v10 = v6;
    CGFloat v11 = [(NTKOlympusFaceView *)self palette];
    double v12 = [v11 bezelComplicationColor];
    [v10 setForegroundColor:v12];
  }
}

- (BOOL)_needsForegroundContainerView
{
  return 1;
}

- (id)_additionalPrelaunchApplicationIdentifiers
{
  id v2 = +[NTKVictoryAppLauncher prelaunchApplicationIdentifiers];
  id v3 = +[NSOrderedSet orderedSetWithSet:v2];

  return v3;
}

- (void)_applyDataMode
{
  id v3 = (char *)[(NTKOlympusFaceView *)self dataMode];
  [(NTKOlympusController *)self->_olympusController applyDataMode:v3];
  BOOL v4 = v3 == (unsigned char *)&dword_0 + 1;
  [(NTKOlympusTimeView *)self->_olympusView setUserInteractionEnabled:v4];
  analogBackgroundView = self->_analogBackgroundView;

  [(NTKVictoryAnalogBackgroundView *)analogBackgroundView setUserInteractionEnabled:v4];
}

- (void)setTimeOffset:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKOlympusFaceView;
  -[NTKOlympusFaceView setTimeOffset:](&v5, "setTimeOffset:");
  [(NTKOlympusTimeView *)self->_olympusView setTimeOffset:a3];
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NTKOlympusFaceView;
  id v6 = a3;
  [(NTKOlympusFaceView *)&v7 setOverrideDate:v6 duration:a4];
  -[NTKOlympusController setOverrideDate:duration:](self->_olympusController, "setOverrideDate:duration:", v6, a4, v7.receiver, v7.super_class);
}

- (void)_configureTimeView:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NTKOlympusFaceView;
  id v4 = a3;
  [(NTKOlympusFaceView *)&v9 _configureTimeView:v4];
  unsigned int v5 = [(NTKOlympusFaceView *)self _showAnalogHands];
  double v6 = 0.0;
  if (v5) {
    double v6 = 1.0;
  }
  [v4 setAlpha:v6];
  objc_msgSend(v4, "setHidden:", -[NTKOlympusFaceView _showAnalogHands](self, "_showAnalogHands") ^ 1);
  objc_super v7 = [v4 secondHandView];

  double v8 = +[UIColor blackColor];
  [v7 setHandDotColor:v8];

  [(NTKOlympusFaceView *)self applyColorOnAnalogHands];
}

- (BOOL)_wantsStatusBarIconShadow
{
  return self->_currentDial == 1;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)NTKOlympusFaceView;
  [(NTKOlympusFaceView *)&v5 layoutSubviews];
  olympusView = self->_olympusView;
  [(NTKOlympusFaceView *)self bounds];
  -[NTKOlympusTimeView ntk_setBoundsAndPositionFromFrame:](olympusView, "ntk_setBoundsAndPositionFromFrame:");
  analogBackgroundView = self->_analogBackgroundView;
  [(NTKOlympusFaceView *)self bounds];
  -[NTKVictoryAnalogBackgroundView ntk_setBoundsAndPositionFromFrame:](analogBackgroundView, "ntk_setBoundsAndPositionFromFrame:");
  [(NTKOlympusFaceView *)self bounds];
  -[NTKRoundedCornerOverlayView setFrame:](self->_cornerView, "setFrame:");
  if (([(NTKOlympusFaceView *)self editing] & 1) == 0 && !self->_currentDial) {
    [(NTKOlympusFaceView *)self updateCircularMask];
  }
}

- (void)_prepareForEditing
{
  v3.receiver = self;
  v3.super_class = (Class)NTKOlympusFaceView;
  [(NTKOlympusFaceView *)&v3 _prepareForEditing];
  [(NTKOlympusFaceView *)self configureViewsForEditing];
  [(NTKOlympusFaceView *)self _updateDialTicksForBezelText];
  [(NTKCircularAnalogDialView *)self->_dialView prepareForEdit];
  [(NTKOlympusTimeView *)self->_olympusView prepareForEditing];
  [(NTKVictoryAnalogBackgroundView *)self->_analogBackgroundView willBeginEditing];
}

- (void)_cleanupAfterEditing
{
  v8.receiver = self;
  v8.super_class = (Class)NTKOlympusFaceView;
  [(NTKOlympusFaceView *)&v8 _cleanupAfterEditing];
  [(NTKOlympusTimeView *)self->_olympusView cleanupAfterEditing];
  [(NTKOlympusFaceView *)self _updateDialTicksForBezelText];
  [(NTKCircularAnalogDialView *)self->_dialView cleanupAfterEdit];
  if (self->_currentDial == 1)
  {
    [(NTKCircularAnalogDialView *)self->_dialView setHidden:1];
    dialView = self->_dialView;
LABEL_4:
    double v6 = 0.0;
    goto LABEL_5;
  }
  unsigned int v4 = [(NTKOlympusFaceView *)self isCircularDialWithBezel];
  char v5 = v4;
  [(NTKCircularAnalogDialView *)self->_dialView setHidden:v4 ^ 1];
  dialView = self->_dialView;
  double v6 = 1.0;
  if ((v5 & 1) == 0) {
    goto LABEL_4;
  }
LABEL_5:
  [(NTKCircularAnalogDialView *)dialView setAlpha:v6];
  [(NTKOlympusFaceView *)self createAndRemoveViewsForCurrentStateIfNeeded];
  objc_super v7 = [(NTKOlympusFaceView *)self delegate];
  [v7 faceViewDidChangeWantsStatusBarIconShadow];
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  v18.receiver = self;
  v18.super_class = (Class)NTKOlympusFaceView;
  -[NTKOlympusFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](&v18, "_configureForTransitionFraction:fromEditMode:toEditMode:");
  [(NTKOlympusFaceView *)self _contentAlphaForEditMode:a4];
  [(NTKOlympusFaceView *)self _contentAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v10 = v9;
  CGFloat v11 = [(NTKOlympusFaceView *)self contentView];
  [v11 setAlpha:v10];

  [(NTKOlympusFaceView *)self _timeAlphaForEditMode:a4];
  [(NTKOlympusFaceView *)self _timeAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v13 = v12;
  id v14 = [(NTKOlympusFaceView *)self timeView];
  [v14 setAlpha:v13];

  [(NTKOlympusFaceView *)self _dialAlphaForEditMode:a4];
  [(NTKOlympusFaceView *)self _dialAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v16 = v15;
  CGAffineTransform v17 = [(NTKOlympusFaceView *)self dialView];
  [v17 setAlpha:v16];

  [(NTKOlympusFaceView *)self configureComplicationAlphaFraction:a4 fromEditMode:a5 toEditMode:a3];
}

- (void)_configureForEditMode:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKOlympusFaceView;
  -[NTKOlympusFaceView _configureForEditMode:](&v5, "_configureForEditMode:");
  [(NTKOlympusFaceView *)self configureComplicationAlphaFraction:a3 fromEditMode:a3 toEditMode:1.0];
}

- (void)_cleanupAfterTransitionComplicationSlot:(id)a3 selectedComplication:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NTKOlympusFaceView;
  [(NTKOlympusFaceView *)&v5 _cleanupAfterTransitionComplicationSlot:a3 selectedComplication:a4];
  [(NTKOlympusFaceView *)self _updateDialTicksForBezelText];
}

- (void)configureComplicationAlphaFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  [(NTKOlympusFaceView *)self _complicationAlphaForEditMode:a4];
  [(NTKOlympusFaceView *)self _complicationAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v8 = v7;
  id v9 = [(NTKOlympusFaceView *)self complicationContainerView];
  [v9 setAlpha:v8];
}

- (double)_complicationAlphaForEditMode:(int64_t)a3
{
  if ((unint64_t)a3 > 0xA) {
    return NTKEditModeDimmedAlpha;
  }
  double result = 1.0;
  if (((1 << a3) & 0x403) == 0) {
    return NTKEditModeDimmedAlpha;
  }
  return result;
}

- (double)_bezelUtilityComplicationAlphaForEditMode:(int64_t)a3
{
  if ((unint64_t)a3 > 0xC) {
    return NTKEditModeDimmedAlpha;
  }
  double result = 1.0;
  if (((1 << a3) & 0x1003) == 0) {
    return NTKEditModeDimmedAlpha;
  }
  return result;
}

- (double)_dialAlphaForEditMode:(int64_t)a3
{
  double result = 1.0;
  double v4 = 0.5;
  if (a3 == 1) {
    double v4 = 0.0;
  }
  if (a3 == 12) {
    double v4 = 1.0;
  }
  if (a3) {
    return v4;
  }
  return result;
}

- (double)_contentAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if (a3 != 1) {
    return 1.0;
  }
  return result;
}

- (double)_timeAlphaForEditMode:(int64_t)a3
{
  unsigned int v4 = [(NTKOlympusFaceView *)self _showAnalogHands];
  double result = NTKEditModeDimmedAlpha;
  if (a3 != 1) {
    double result = 1.0;
  }
  if (!v4) {
    return 0.0;
  }
  return result;
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  if (a4 == 10)
  {
    double v10 = [(NTKOlympusFaceView *)self palette];
    CGFloat v11 = [(NTKOlympusFaceView *)self palette];
    [(NTKOlympusFaceView *)self _applyTransitionFraction:v10 fromColorPalette:v11 toColorPalette:0 animateElements:1.0];

    [(NTKOlympusFaceView *)self applyColorOnAnalogHands];
  }
  else
  {
    if (a4 == 12)
    {
      id v9 = [(NTKOlympusFaceView *)self optionForCustomEditMode:12 slot:0];
      -[NTKOlympusFaceView setCurrentDial:](self, "setCurrentDial:", [v9 dialShape]);
    }
    else
    {
      if (a4 != 15) {
        goto LABEL_8;
      }
      id v9 = [(NTKOlympusFaceView *)self optionForCustomEditMode:15 slot:0];
      -[NTKOlympusFaceView setCurrentStyle:](self, "setCurrentStyle:", [v9 style]);
    }
  }
LABEL_8:
  if (!self->_contentLoaded) {
    [(NTKCircularAnalogDialView *)self->_dialView setHidden:[(NTKOlympusFaceView *)self isCircularDialWithBezel] ^ 1];
  }
  if ([(NTKOlympusFaceView *)self editing])
  {
    [(NTKOlympusFaceView *)self setupViewsForCurrentState];
  }
  else
  {
    [(NTKOlympusFaceView *)self createAndRemoveViewsForCurrentStateIfNeeded];
    [(NTKOlympusTimeView *)self->_olympusView cleanupAfterEditing];
  }
}

- (void)applyColorOnAnalogHands
{
  objc_super v3 = [(NTKOlympusFaceView *)self palette];
  id v10 = [v3 largeHandsColor];

  unsigned int v4 = [(NTKOlympusFaceView *)self timeView];
  objc_super v5 = [v4 minuteHandView];
  [v5 setColor:v10];

  double v6 = [v4 hourHandView];
  [v6 setColor:v10];

  double v7 = [v4 secondHandView];
  id v8 = [(NTKOlympusFaceView *)self palette];
  id v9 = [v8 secondHandColor];
  [v7 setColor:v9];
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v18 = a4;
  id v12 = a5;
  id v13 = a7;
  switch(a6)
  {
    case 10:
      id v14 = [(NTKOlympusFaceView *)self interpolatedColorPalette];
      double v15 = [v14 fromPalette];
      double v16 = [(NTKOlympusFaceView *)self interpolatedColorPalette];
      CGAffineTransform v17 = [v16 toPalette];
      [(NTKOlympusFaceView *)self _applyTransitionFraction:v15 fromColorPalette:v17 toColorPalette:1 animateElements:a3];

      break;
    case 15:
      -[NTKOlympusFaceView _applyTransitionFraction:fromStyle:toStyle:](self, "_applyTransitionFraction:fromStyle:toStyle:", [v18 style], objc_msgSend(v12, "style"), a3);
      break;
    case 12:
      -[NTKOlympusFaceView _applyTransitionFraction:fromDial:toDial:](self, "_applyTransitionFraction:fromDial:toDial:", [v18 dialShape], objc_msgSend(v12, "dialShape"), a3);
      break;
  }
}

- (void)_applyTransitionFraction:(double)a3 fromDial:(unint64_t)a4 toDial:(unint64_t)a5
{
  if (a4 == a5)
  {
    [(NTKOlympusFaceView *)self setCurrentDial:a3];
  }
  else
  {
    if (a5 == 1 && a4 == 0) {
      double v9 = 1.0 - a3;
    }
    else {
      double v9 = a3;
    }
    [(NTKOlympusFaceView *)self circleDiameter];
    [(NTKOlympusFaceView *)self setCircularMaskForCircularDialFraction:v9 circleDiameter:v10];
    CLKCompressFraction();
    double v12 = v11;
    id v13 = [(NTKOlympusFaceView *)self dialView];
    [(NTKOlympusFaceView *)self bezelComplicationTextWidthInRadius];
    [v13 fillDialTransitionWithFraction:v12 bezelTextWidthRadians:v14];

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_3BC8;
    v22[3] = &unk_C348;
    *(double *)&v22[4] = v12;
    [(NTKOlympusFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v22];
    double v15 = [(NTKOlympusFaceView *)self analogBackgroundView];
    [v15 applyTransitionFraction:a4 fromDialShape:a5 toDialShape:v9];

    [(NTKOlympusTimeView *)self->_olympusView applyTransitionFraction:a4 fromDial:a5 toDial:v9];
    double v16 = [(NTKOlympusFaceView *)self palette];
    id v17 = [v16 copy];

    [v17 setDial:a4];
    id v18 = [(NTKOlympusFaceView *)self palette];
    id v19 = [v18 copy];

    [v17 setDial:a5];
    [(NTKOlympusFaceView *)self _applyTransitionFraction:v17 fromColorPalette:v19 toColorPalette:0 animateElements:v9];
    [(NTKOlympusFaceView *)self isCircularDialWithBezel];
    CLKInterpolateBetweenFloatsClipped();
    CGAffineTransformMakeScale(&v21, v20, v20);
    [(NTKOlympusFaceView *)self _applyContentViewTranform:&v21];
  }
}

- (void)setCurrentDial:(unint64_t)a3
{
  self->_unint64_t currentDial = a3;
  objc_super v5 = [(NTKOlympusFaceView *)self analogBackgroundView];
  [v5 setDialShape:a3];

  unint64_t currentDial = self->_currentDial;
  double v7 = [(NTKOlympusFaceView *)self olympusView];
  [v7 setCurrentDial:currentDial];

  [(NTKCircularAnalogDialView *)self->_dialView setHidden:[(NTKOlympusFaceView *)self isCircularDialWithBezel] ^ 1];
  if (self->_currentDial) {
    double v8 = 0.0;
  }
  else {
    double v8 = 1.0;
  }
  [(NTKOlympusFaceView *)self circleDiameter];
  [(NTKOlympusFaceView *)self setCircularMaskForCircularDialFraction:v8 circleDiameter:v9];
  [(NTKOlympusFaceView *)self contentViewScale];
  CGAffineTransformMakeScale(&v11, v10, v10);
  [(NTKOlympusFaceView *)self _applyContentViewTranform:&v11];
}

- (void)_applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5
{
  if (self->_currentDial == 1) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = [(NTKOlympusFaceView *)self isCircularDialWithBezel] ^ 1;
  }
  [(NTKCircularAnalogDialView *)self->_dialView setHidden:v9];
  CGFloat v10 = [(NTKOlympusFaceView *)self timeView];
  [v10 setHidden:0];

  CGAffineTransform v11 = [(NTKOlympusFaceView *)self olympusView];
  [v11 applyTransitionFraction:a4 fromStyle:a5 toStyle:a3];

  CLKCompressFraction();
  double v13 = v12;
  double v14 = [(NTKOlympusFaceView *)self timeView];
  [v14 setAlpha:v13];

  double v15 = [(NTKOlympusFaceView *)self dialView];
  double v16 = [(NTKOlympusFaceView *)self timeView];
  [v16 alpha];
  double v18 = v17;
  [(NTKOlympusFaceView *)self bezelComplicationTextWidthInRadius];
  [v15 setHourTicksOpacity:v18 bezelTextWidthRadians:v19];

  CLKCompressFraction();
  double v21 = v20;
  -[NTKVictoryAnalogBackgroundView setAlpha:](self->_analogBackgroundView, "setAlpha:");
  [(NTKOlympusTimeView *)self->_olympusView setAlpha:1.0 - v21];
  [(NTKVictoryAnalogBackgroundView *)self->_analogBackgroundView applyTransitionFraction:a4 fromOlympusStyle:a5 toOlympusStyle:a3];
  objc_super v22 = [(NTKOlympusFaceView *)self palette];
  id v25 = [v22 copy];

  [v25 setStyle:a4];
  v23 = [(NTKOlympusFaceView *)self palette];
  id v24 = [v23 copy];

  [v24 setStyle:a5];
  [(NTKOlympusFaceView *)self _applyTransitionFraction:v25 fromColorPalette:v24 toColorPalette:0 animateElements:a3];
}

- (void)_applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5 animateElements:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v31 = [objc_alloc((Class)NTKOlympusAnalogBackgroundPalette) initWithOlympusColorPalette:v11];
  id v30 = [objc_alloc((Class)NTKOlympusAnalogBackgroundPalette) initWithOlympusColorPalette:v10];
  [(NTKVictoryAnalogBackgroundView *)self->_analogBackgroundView applyTransitionFraction:v31 fromPalette:v30 toPalette:4 style:v6 animateElements:a3];
  [(NTKOlympusTimeView *)self->_olympusView applyTransitionFraction:v11 fromColorPalette:v10 toColorPalette:v6 animateElements:a3];
  double v12 = [v11 largeHandsColor];
  double v13 = [v10 largeHandsColor];
  uint64_t v14 = NTKInterpolateBetweenColors();

  double v15 = [v11 secondHandColor];
  double v16 = [v10 secondHandColor];
  v28 = NTKInterpolateBetweenColors();

  double v17 = [(NTKOlympusFaceView *)self timeView];
  double v18 = [v17 minuteHandView];
  v29 = (void *)v14;
  [v18 setColor:v14];

  double v19 = [v17 hourHandView];
  [v19 setColor:v14];

  double v20 = [v17 secondHandView];
  [v20 setColor:v28];

  double v21 = [v11 cornerComplicationsAccentColor];
  objc_super v22 = [v10 cornerComplicationsAccentColor];
  v23 = NTKInterpolateBetweenColors();
  [(NTKOlympusFaceView *)self setInterpolatedComplicationColor:v23];
  [(NTKOlympusFaceView *)self setComplicationColor:v22];
  +[NTKOlympusTimeContentView scaleForViewDuringColorChangeTransitionWithFraction:a3];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_42D0;
  v32[3] = &unk_C348;
  v32[4] = v24;
  [(NTKOlympusFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v32];
  id v25 = [v11 bezelComplicationColor];
  v26 = [v10 bezelComplicationColor];
  v27 = NTKInterpolateBetweenColors();
  [(NTKOlympusFaceView *)self _updateDialBezelComplicationColor:v27];

  [(NTKCircularAnalogDialView *)self->_dialView applyColorTransitionFraction:v11 fromColorPalette:v10 toColorPalette:a3];
}

- (void)_updateDialBezelComplicationColor:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_4404;
  v5[3] = &unk_C370;
  id v6 = a3;
  id v4 = v6;
  [(NTKOlympusFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v5];
}

- (void)_applyTransitionFraction:(double)a3 fromComplication:(id)a4 toComplication:(id)a5 slot:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)NTKOlympusFaceView;
  id v12 = a6;
  [(NTKOlympusFaceView *)&v17 _applyTransitionFraction:v10 fromComplication:v11 toComplication:v12 slot:a3];
  id v13 = (id)NTKComplicationSlotBezel;

  if (v13 == v12)
  {
    if (!objc_msgSend(v10, "complicationType", v17.receiver, v17.super_class)
      || (id v15 = [v11 complicationType], v14 = 1.0, !v15))
    {
      if (objc_msgSend(v10, "complicationType", v14) || objc_msgSend(v11, "complicationType"))
      {
        id v16 = [v11 complicationType];
        double v14 = 1.0 - a3;
        if (v16) {
          double v14 = a3;
        }
      }
      else
      {
        double v14 = 0.0;
      }
    }
    [(NTKOlympusFaceView *)self applyTransitionToCircularDialWithBezelFraction:v14];
  }
}

- (void)_applyContentViewTranform:(CGAffineTransform *)a3
{
  long long v5 = *(_OWORD *)&a3->c;
  v8[0] = *(_OWORD *)&a3->a;
  v8[1] = v5;
  v8[2] = *(_OWORD *)&a3->tx;
  [(NTKVictoryAnalogBackgroundView *)self->_analogBackgroundView setTransform:v8];
  long long v6 = *(_OWORD *)&a3->c;
  v7[0] = *(_OWORD *)&a3->a;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a3->tx;
  [(NTKOlympusTimeView *)self->_olympusView setTransform:v7];
}

- (double)contentViewScale
{
  double result = 1.0;
  if (!self->_currentDial)
  {
    unsigned int v3 = [(NTKOlympusFaceView *)self isCircularDialWithBezel];
    double result = 0.86;
    if (!v3) {
      return 1.0;
    }
  }
  return result;
}

- (void)applyTransitionToCircularDialWithBezelFraction:(double)a3
{
  id v4 = [(NTKOlympusFaceView *)self device];
  sub_1D84(v4);

  CLKInterpolateBetweenFloatsClipped();
  [(NTKOlympusFaceView *)self setCircularMaskForCircularDialFraction:1.0 circleDiameter:v5];
  CLKInterpolateBetweenFloatsClipped();
  CGAffineTransformMakeScale(&v7, v6, v6);
  [(NTKOlympusFaceView *)self _applyContentViewTranform:&v7];
  [(NTKOlympusFaceView *)self _dialAlphaForEditMode:1];
  CLKCompressFraction();
  -[NTKCircularAnalogDialView setAlpha:](self->_dialView, "setAlpha:");
}

- (double)circleDiameter
{
  unsigned int v3 = [(NTKOlympusFaceView *)self device];
  double v4 = sub_1D84(v3);
  double v6 = v5;

  if ([(NTKOlympusFaceView *)self isCircularDialWithBezel]) {
    return v4;
  }
  else {
    return v6;
  }
}

- (BOOL)isCircularDialWithBezel
{
  unsigned int v3 = [(NTKOlympusFaceView *)self delegate];
  if (v3)
  {
    double v4 = [(NTKOlympusFaceView *)self delegate];
    unsigned int v5 = [v4 faceViewComplicationIsEmptyForSlot:NTKComplicationSlotBezel] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)updateCircularMask
{
  if (self->_currentDial) {
    double v3 = 0.0;
  }
  else {
    double v3 = 1.0;
  }
  [(NTKOlympusFaceView *)self circleDiameter];

  [(NTKOlympusFaceView *)self setCircularMaskForCircularDialFraction:v3 circleDiameter:v4];
}

- (void)setCircularMaskForCircularDialFraction:(double)a3 circleDiameter:(double)a4
{
  [(NTKCircularAnalogDialView *)self->_dialView setHidden:[(NTKOlympusFaceView *)self isCircularDialWithBezel] ^ 1];
  CLKCompressFraction();
  CLKInterpolateBetweenFloatsClipped();
  CGAffineTransformMakeScale(&v21, v5, v5);
  dialView = self->_dialView;
  CGAffineTransform v20 = v21;
  [(NTKCircularAnalogDialView *)dialView setTransform:&v20];
  CLKInterpolateBetweenFloatsClipped();
  double v8 = v7;
  double v9 = v7 * 0.5;
  [(NTKOlympusFaceView *)self bounds];
  double v11 = v10 * 0.5 - v9;
  [(NTKOlympusFaceView *)self bounds];
  id v13 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v11, v12 * 0.5 - v9, v8, v8);
  double v14 = +[CAShapeLayer layer];
  id v15 = v13;
  objc_msgSend(v14, "setPath:", objc_msgSend(v15, "CGPath"));
  id v16 = [(NTKOlympusFaceView *)self contentView];
  objc_super v17 = [v16 layer];
  [v17 setMask:v14];

  [(NTKOlympusFaceView *)self contentViewScale];
  CGAffineTransformMakeScale(&v19, v18, v18);
  [(NTKOlympusFaceView *)self _applyContentViewTranform:&v19];
}

- (void)_cleanupAfterTransitionToOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v5.receiver = self;
  v5.super_class = (Class)NTKOlympusFaceView;
  [(NTKOlympusFaceView *)&v5 _cleanupAfterTransitionToOption:a3 forCustomEditMode:a4 slot:a5];
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)NTKOlympusFaceView;
  -[NTKOlympusFaceView _applyRubberBandingFraction:forCustomEditMode:slot:](&v11, "_applyRubberBandingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4)
  {
    NTKScaleForRubberBandingFraction();
    memset(&v10, 0, sizeof(v10));
    CGAffineTransformMakeScale(&v10, v7, v7);
    double v8 = [(NTKOlympusFaceView *)self foregroundContainerView];
    CGAffineTransform v9 = v10;
    [v8 setTransform:&v9];
  }
}

- (double)_editSpeedForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 != 10) {
    return NTKEditSpeedCustomEditModeDefault;
  }
  v5.receiver = self;
  v5.super_class = (Class)NTKOlympusFaceView;
  [(NTKOlympusFaceView *)&v5 _editSpeedForCustomEditMode:10 slot:a4];
  return result;
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)NTKOlympusFaceView;
  -[NTKOlympusFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v10, "_applyBreathingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4)
  {
    NTKLargeElementScaleForBreathingFraction();
    memset(&v9, 0, sizeof(v9));
    CGAffineTransformMakeScale(&v9, v7, v7);
    CGAffineTransform v8 = v9;
    [(NTKOlympusFaceView *)self setTransform:&v8];
  }
}

- (double)_minimumBreathingScaleForComplicationSlot:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:NTKComplicationSlotBezel])
  {
    double v5 = NTKLargeElementMinimumBreathingScale;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKOlympusFaceView;
    [(NTKOlympusFaceView *)&v8 _minimumBreathingScaleForComplicationSlot:v4];
    double v5 = v6;
  }

  return v5;
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  id v4 = &off_C9E8;
  if (a3 != 12) {
    id v4 = 0;
  }
  if (a3 == 15) {
    return &off_C9D0;
  }
  else {
    return v4;
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_super v10 = v9;
  if (a4 == 15 || a4 == 12)
  {
    objc_super v11 = [v9 objectForKeyedSubscript:&off_C778];
    uint64_t v12 = [v10 objectForKeyedSubscript:&off_C730];
    id v13 = (void *)v12;
    if (a4 == 15)
    {
      double v14 = v11;
      objc_super v11 = v8;
    }
    else
    {
      double v14 = (void *)v12;
      id v13 = v8;
    }
    id v16 = v8;

    objc_super v17 = [v10 objectForKeyedSubscript:&off_C748];
    if (!qword_12108)
    {
      uint64_t v18 = objc_opt_new();
      CGAffineTransform v19 = (void *)qword_12108;
      qword_12108 = v18;
    }
    CGAffineTransform v20 = +[NSString stringWithFormat:@"%@-%@-%@", v11, v13, v17];
    id v15 = [(id)qword_12108 objectForKey:v20];
    if (!v15)
    {
      CGAffineTransform v21 = [NTKOlympusFaceView alloc];
      objc_super v22 = [(NTKOlympusFaceView *)self device];
      v23 = [(NTKOlympusFaceView *)v21 initWithFaceStyle:35 forDevice:v22 clientIdentifier:0];

      [(NTKOlympusFaceView *)self frame];
      -[NTKOlympusFaceView setFrame:](v23, "setFrame:");
      [(NTKOlympusFaceView *)v23 _loadSnapshotContentViews];
      [(NTKOlympusFaceView *)v23 setOption:v13 forCustomEditMode:12 slot:0];
      [(NTKOlympusFaceView *)v23 setOption:v11 forCustomEditMode:15 slot:0];
      [(NTKOlympusFaceView *)v23 setOption:v17 forCustomEditMode:10 slot:0];
      uint64_t v24 = NTKIdealizedDate();
      [(NTKOlympusFaceView *)v23 setOverrideDate:v24 duration:0.0];

      [(NTKOlympusFaceView *)self frame];
      -[NTKOlympusFaceView setFrame:](v23, "setFrame:");
      [(NTKOlympusFaceView *)v23 bounds];
      v31.width = v25;
      v31.height = v26;
      UIGraphicsBeginImageContextWithOptions(v31, 0, 0.0);
      v27 = [(NTKOlympusFaceView *)v23 layer];
      [v27 renderInContext:UIGraphicsGetCurrentContext()];

      id v15 = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
      [(id)qword_12108 setObject:v15 forKey:v20];
    }
  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)NTKOlympusFaceView;
    id v15 = [(NTKOlympusFaceView *)&v29 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:v9];
  }

  return v15;
}

- (BOOL)_showAnalogHands
{
  return (self->_currentStyle & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)olympusView:(id)a3 didTapAppLogoFromRect:(CGRect)a4
{
}

- (void)logoTappedFromRect:(CGRect)a3
{
}

- (void)openVictoryAppFromRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [(NTKOlympusFaceView *)self delegate];
  +[NTKVictoryAppLauncher attemptLaunchWithDelegate:v8];

  id v9 = [(NTKOlympusFaceView *)self delegate];
  objc_msgSend(v9, "faceViewRequestedLaunchFromRect:", x, y, width, height);
}

- (id)_additonalViewsToApplyDesaturationDuringComplicationEditing
{
  dialView = self->_dialView;
  id v2 = +[NSArray arrayWithObjects:&dialView count:1];

  return v2;
}

- (void)_updateDialTicksForBezelText
{
  dialView = self->_dialView;
  [(NTKOlympusFaceView *)self bezelComplicationTextWidthInRadius];
  double v5 = v4;
  [(NTKOlympusFaceView *)self bezelComplicationTextWidthInRadius];

  [(NTKCircularAnalogDialView *)dialView transitTicksWithInitialBezelTextWidthInRadius:v5 finalBezelTextWidthInRadius:v6 fraction:1.0];
}

- (double)bezelComplicationTextWidthInRadius
{
  id v2 = [(NTKOlympusFaceView *)self utilityBezelComplicationView];
  [v2 textWidthInRadians];
  double v4 = v3;

  return v4;
}

- (id)utilityBezelComplicationView
{
  id v2 = [(NTKOlympusFaceView *)self normalComplicationDisplayWrapperForSlot:NTKComplicationSlotBezel];
  double v3 = [v2 display];
  unsigned int v4 = [v3 conformsToProtocol:&OBJC_PROTOCOL___NTKUtilityFlatComplicationView];

  if (v4)
  {
    double v5 = [v2 display];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (void)setCurrentStyle:(unint64_t)a3
{
  self->_unint64_t currentStyle = a3;
  double v5 = [(NTKOlympusFaceView *)self olympusView];
  [v5 setCurrentStyle:a3];

  [(NTKOlympusFaceView *)self _updateBackgroundViewAlpha];
  id v6 = [(NTKOlympusFaceView *)self analogBackgroundView];
  [v6 applyTransitionFraction:self->_currentStyle fromOlympusStyle:self->_currentStyle toOlympusStyle:1.0];
}

- (void)_updateBackgroundViewAlpha
{
  if (self->_currentStyle == 3) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  [(NTKVictoryAnalogBackgroundView *)self->_analogBackgroundView setAlpha:v3];
  olympusView = self->_olympusView;

  [(NTKOlympusTimeView *)olympusView setAlpha:1.0 - v3];
}

- (NTKOlympusController)olympusController
{
  return self->_olympusController;
}

- (void)setOlympusController:(id)a3
{
}

- (NTKOlympusTimeView)olympusView
{
  return self->_olympusView;
}

- (void)setOlympusView:(id)a3
{
}

- (NTKVictoryAnalogBackgroundView)analogBackgroundView
{
  return self->_analogBackgroundView;
}

- (void)setAnalogBackgroundView:(id)a3
{
}

- (NTKCircularAnalogDialView)dialView
{
  return self->_dialView;
}

- (void)setDialView:(id)a3
{
}

- (NTKRoundedCornerOverlayView)cornerView
{
  return self->_cornerView;
}

- (void)setCornerView:(id)a3
{
}

- (BOOL)contentLoaded
{
  return self->_contentLoaded;
}

- (void)setContentLoaded:(BOOL)a3
{
  self->_contentLoaded = a3;
}

- (unint64_t)hour
{
  return self->_hour;
}

- (void)setHour:(unint64_t)a3
{
  self->_hour = a3;
}

- (unint64_t)minute
{
  return self->_minute;
}

- (void)setMinute:(unint64_t)a3
{
  self->_minute = a3;
}

- (unint64_t)second
{
  return self->_second;
}

- (void)setSecond:(unint64_t)a3
{
  self->_second = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (void)setCircleDiameter:(double)a3
{
  self->_circleDiameter = a3;
}

- (unint64_t)currentStyle
{
  return self->_currentStyle;
}

- (unint64_t)currentDial
{
  return self->_currentDial;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_cornerView, 0);
  objc_storeStrong((id *)&self->_dialView, 0);
  objc_storeStrong((id *)&self->_analogBackgroundView, 0);
  objc_storeStrong((id *)&self->_olympusView, 0);

  objc_storeStrong((id *)&self->_olympusController, 0);
}

@end