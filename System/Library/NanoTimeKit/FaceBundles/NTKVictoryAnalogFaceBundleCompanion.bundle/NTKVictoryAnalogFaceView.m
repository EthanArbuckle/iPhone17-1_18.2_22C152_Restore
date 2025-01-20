@interface NTKVictoryAnalogFaceView
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
+ (int64_t)uiSensitivity;
- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3;
- (BOOL)_needsForegroundContainerView;
- (BOOL)_wantsStatusBarIconShadow;
- (CGPoint)_contentCenterOffset;
- (CGPoint)_myContentCenterOffset;
- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4;
- (NTKVictoryAnalogFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (UIView)scaleView;
- (double)_backgroundAlphaForEditMode:(int64_t)a3;
- (double)_complicationAlphaForEditMode:(int64_t)a3;
- (double)_editSpeedForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (double)_handsAlphaForEditMode:(int64_t)a3;
- (double)_keylineCornerRadiusForComplicationSlot:(id)a3;
- (double)_keylineEdgeGapForState:(int64_t)a3;
- (double)_keylinePaddingForState:(int64_t)a3;
- (double)_verticalPaddingForStatusBar;
- (id)_additionalPrelaunchApplicationIdentifiers;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)_slotForUtilitySlot:(int64_t)a3;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)createFaceColorPalette;
- (id)palette;
- (id)utilityDateComplicationFontForDateStyle:(unint64_t)a3;
- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4;
- (int64_t)_utilitySlotForSlot:(id)a3;
- (unint64_t)textLayoutStyleForSlot:(int64_t)a3;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyColor:(id)a3 toComplicationView:(id)a4;
- (void)_applyComplicationViewColor:(id)a3;
- (void)_applyDataMode;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_cleanupAfterEditing;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_configureTimeView:(id)a3;
- (void)_endScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)_loadLayoutRules;
- (void)_loadSnapshotContentViews;
- (void)_prepareForEditing;
- (void)_setStyle:(unint64_t)a3;
- (void)_startScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)_unloadSnapshotContentViews;
- (void)logoTappedFromRect:(CGRect)a3;
- (void)setScaleView:(id)a3;
@end

@implementation NTKVictoryAnalogFaceView

+ (int64_t)uiSensitivity
{
  v2 = +[CLKRenderingContext sharedRenderingContext];
  v3 = [v2 device];
  int64_t v4 = NTKSensitivityForVictoryFaces();

  return v4;
}

- (NTKVictoryAnalogFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)NTKVictoryAnalogFaceView;
  v9 = [(NTKVictoryAnalogFaceView *)&v21 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  v10 = v9;
  if (v9)
  {
    double v20 = 0.0;
    long long v18 = 0u;
    long long v19 = 0u;
    v11 = [(NTKVictoryAnalogFaceView *)v9 device];
    sub_3E18(v11, (uint64_t)&v17);

    v12 = (NTKUtilityComplicationFactory *)[objc_alloc((Class)NTKUtilityComplicationFactory) initForDevice:v8];
    utilityComplicationFactory = v10->_utilityComplicationFactory;
    v10->_utilityComplicationFactory = v12;

    [(NTKUtilityComplicationFactory *)v10->_utilityComplicationFactory setDelegate:v10];
    [(NTKUtilityComplicationFactory *)v10->_utilityComplicationFactory setBottomCenterLayout:3];
    -[NTKUtilityComplicationFactory setScreenEdgeInsets:](v10->_utilityComplicationFactory, "setScreenEdgeInsets:", v18, v19);
    [(NTKUtilityComplicationFactory *)v10->_utilityComplicationFactory setMaxNormalLongWidth:v20];
    v14 = [(NTKVictoryAnalogFaceView *)v10 device];
    v15 = (char *)[v14 deviceCategory];

    if (v15 != (unsigned char *)&dword_0 + 1)
    {
      [(NTKUtilityComplicationFactory *)v10->_utilityComplicationFactory setNormalSidePadding:0.0];
      -[NTKUtilityComplicationFactory setNormalCircularPadding:](v10->_utilityComplicationFactory, "setNormalCircularPadding:", CGSizeZero.width, CGSizeZero.height);
      [(NTKUtilityComplicationFactory *)v10->_utilityComplicationFactory setCrownIndicatorGap:0.0];
    }
    [(NTKVictoryAnalogFaceView *)v10 setComplicationFactory:v10->_utilityComplicationFactory];
  }

  return v10;
}

- (id)createFaceColorPalette
{
  v2 = [[NTKVictoryAnalogColorPalette alloc] initWithFaceClass:objc_opt_class()];

  return v2;
}

- (id)palette
{
  return [(NTKVictoryAnalogFaceView *)self faceColorPalette];
}

- (void)_loadSnapshotContentViews
{
  v15.receiver = self;
  v15.super_class = (Class)NTKVictoryAnalogFaceView;
  [(NTKVictoryAnalogFaceView *)&v15 _loadSnapshotContentViews];
  v3 = [(NTKVictoryAnalogFaceView *)self device];
  id v4 = objc_alloc((Class)UIView);
  [v3 screenBounds];
  v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
  scaleView = self->_scaleView;
  self->_scaleView = v5;

  v7 = [(NTKVictoryAnalogFaceView *)self contentView];
  [v7 insertSubview:self->_scaleView atIndex:0];

  id v8 = objc_alloc((Class)NTKVictoryAnalogBackgroundView);
  [v3 screenBounds];
  v9 = (NTKVictoryAnalogBackgroundView *)objc_msgSend(v8, "initWithFrame:forDevice:", v3);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v9;

  [(NTKVictoryAnalogBackgroundView *)self->_backgroundView setDelegate:self];
  [(UIView *)self->_scaleView addSubview:self->_backgroundView];
  id v11 = objc_alloc((Class)NTKRoundedCornerOverlayView);
  [(NTKVictoryAnalogFaceView *)self bounds];
  v12 = (NTKRoundedCornerOverlayView *)objc_msgSend(v11, "initWithFrame:forDeviceCornerRadius:", v3);
  cornerView = self->_cornerView;
  self->_cornerView = v12;

  v14 = [(NTKVictoryAnalogFaceView *)self contentView];
  [v14 insertSubview:self->_cornerView aboveSubview:self->_scaleView];
}

- (void)_unloadSnapshotContentViews
{
  [(UIView *)self->_scaleView removeFromSuperview];
  scaleView = self->_scaleView;
  self->_scaleView = 0;

  [(NTKVictoryAnalogBackgroundView *)self->_backgroundView removeFromSuperview];
  backgroundView = self->_backgroundView;
  self->_backgroundView = 0;

  [(NTKRoundedCornerOverlayView *)self->_cornerView removeFromSuperview];
  cornerView = self->_cornerView;
  self->_cornerView = 0;

  v6.receiver = self;
  v6.super_class = (Class)NTKVictoryAnalogFaceView;
  [(NTKVictoryAnalogFaceView *)&v6 _unloadSnapshotContentViews];
}

- (void)_configureTimeView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKVictoryAnalogFaceView;
  id v3 = a3;
  [(NTKVictoryAnalogFaceView *)&v6 _configureTimeView:v3];
  id v4 = objc_msgSend(v3, "secondHandView", v6.receiver, v6.super_class);

  v5 = +[UIColor blackColor];
  [v4 setHandDotColor:v5];
}

- (id)_additionalPrelaunchApplicationIdentifiers
{
  v2 = +[NTKVictoryAppLauncher prelaunchApplicationIdentifiers];
  id v3 = +[NSOrderedSet orderedSetWithSet:v2];

  return v3;
}

- (void)_applyDataMode
{
  BOOL v3 = [(NTKVictoryAnalogFaceView *)self dataMode] == (char *)&dword_0 + 1;
  backgroundView = self->_backgroundView;

  [(NTKVictoryAnalogBackgroundView *)backgroundView setUserInteractionEnabled:v3];
}

- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NTKVictoryAnalogFaceView;
  [(NTKVictoryAnalogFaceView *)&v23 _keylineFrameForComplicationSlot:v6 selected:v4];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  if ((id)NTKComplicationSlotTopLeft == v6 || NTKComplicationSlotTopRight == (void)v6)
  {
    v16 = [(NTKVictoryAnalogFaceView *)self delegate];
    unsigned __int8 v17 = [v16 faceViewComplicationIsEmptyForSlot:v6];

    if ((v17 & 1) == 0)
    {
      [(NTKUtilityComplicationFactory *)self->_utilityComplicationFactory selectedKeylineHeight];
      double v14 = v18;
    }
  }

  double v19 = v8;
  double v20 = v10;
  double v21 = v12;
  double v22 = v14;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (double)_keylineCornerRadiusForComplicationSlot:(id)a3
{
  utilityComplicationFactory = self->_utilityComplicationFactory;
  int64_t v4 = [(NTKVictoryAnalogFaceView *)self _utilitySlotForSlot:a3];

  [(NTKUtilityComplicationFactory *)utilityComplicationFactory keylineCornerRadiusForSlot:v4];
  return result;
}

- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3
{
  return a3 == 10;
}

- (double)_editSpeedForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  int64_t v4 = (double *)&NTKEditSpeedComplicationsDefault;
  if (a3 != 10) {
    int64_t v4 = (double *)&NTKEditSpeedCustomEditModeDefault;
  }
  return *v4;
}

- (CGPoint)_contentCenterOffset
{
  [(NTKVictoryAnalogFaceView *)self _myContentCenterOffset];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)_myContentCenterOffset
{
  double v3 = [(NTKVictoryAnalogFaceView *)self optionForCustomEditMode:11 slot:0];
  int64_t v4 = (int *)[v3 style];

  if (v4 == &dword_4) {
    goto LABEL_2;
  }
  double v7 = [(NTKVictoryAnalogFaceView *)self delegate];
  unsigned __int8 v8 = [v7 faceViewComplicationIsEmptyForSlot:NTKComplicationSlotBottomCenter];

  double y = 2.0;
  CGFloat x = 0.0;
  if (v8) {
    goto LABEL_10;
  }
  double v9 = [(NTKVictoryAnalogFaceView *)self delegate];
  if ([v9 faceViewComplicationIsEmptyForSlot:NTKComplicationSlotTopLeft])
  {
    double v10 = [(NTKVictoryAnalogFaceView *)self delegate];
    unsigned __int8 v11 = [v10 faceViewComplicationIsEmptyForSlot:NTKComplicationSlotTopRight];

    if (v11)
    {
LABEL_2:
      CGFloat x = CGPointZero.x;
      double y = CGPointZero.y;
      goto LABEL_10;
    }
  }
  else
  {
  }
  double y = 2.0;
  if (v4 != (int *)((char *)&dword_0 + 3)) {
    double y = 1.0;
  }
LABEL_10:
  double v12 = x;
  result.double y = y;
  result.CGFloat x = v12;
  return result;
}

- (double)_verticalPaddingForStatusBar
{
  double result = 2.0;
  if (!self->_isFullBleed) {
    return 0.0;
  }
  return result;
}

- (BOOL)_wantsStatusBarIconShadow
{
  return self->_isFullBleed;
}

- (void)_startScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)NTKVictoryAnalogFaceView;
  [(NTKVictoryAnalogFaceView *)&v6 _startScrubbingAnimated:a3 withCompletion:a4];
  [(NTKVictoryAnalogBackgroundView *)self->_backgroundView setInTimeTravel:1 animated:v4];
}

- (void)_endScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  backgroundView = self->_backgroundView;
  id v7 = a4;
  [(NTKVictoryAnalogBackgroundView *)backgroundView setInTimeTravel:0 animated:v4];
  v8.receiver = self;
  v8.super_class = (Class)NTKVictoryAnalogFaceView;
  [(NTKVictoryAnalogFaceView *)&v8 _endScrubbingAnimated:v4 withCompletion:v7];
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v27 = a3;
  id v8 = a5;
  if (a4 == 10)
  {
    backgroundView = self->_backgroundView;
    double v10 = [(NTKVictoryAnalogFaceView *)self palette];
    [(NTKVictoryAnalogBackgroundView *)backgroundView setPalette:v10];
  }
  else if (a4 == 11)
  {
    -[NTKVictoryAnalogFaceView _setStyle:](self, "_setStyle:", [v27 style]);
  }
  else if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 0xA)
  {
    goto LABEL_9;
  }
  unsigned __int8 v11 = [(NTKVictoryAnalogFaceView *)self optionForCustomEditMode:10 slot:0];
  double v12 = [v11 pigmentEditOption];

  if (v12)
  {
    double v13 = [(NTKVictoryAnalogFaceView *)self palette];
    double v14 = [v13 hands];

    objc_super v15 = [(NTKVictoryAnalogFaceView *)self timeView];
    v16 = [v15 minuteHandView];
    [v16 setColor:v14];

    unsigned __int8 v17 = [v15 hourHandView];
    [v17 setColor:v14];

    double v18 = [v15 secondHandView];
    double v19 = [(NTKVictoryAnalogFaceView *)self palette];
    double v20 = [v19 secondHand];
    [v18 setColor:v20];

    double v21 = [(NTKVictoryAnalogFaceView *)self palette];
    double v22 = [v21 handInlay];

    objc_super v23 = [v15 minuteHandView];
    [v23 setInlayColor:v22];

    v24 = [v15 hourHandView];
    [v24 setInlayColor:v22];

    v25 = [(NTKVictoryAnalogFaceView *)self palette];
    v26 = [v25 cornerComplicationsAccent];
    [(NTKVictoryAnalogFaceView *)self _applyComplicationViewColor:v26];
  }
LABEL_9:
}

- (void)_setStyle:(unint64_t)a3
{
  self->_style = a3;
  v5 = [(NTKVictoryAnalogFaceView *)self palette];
  [v5 setStyle:a3];

  backgroundView = self->_backgroundView;
  id v7 = [(NTKVictoryAnalogFaceView *)self palette];
  [(NTKVictoryAnalogBackgroundView *)backgroundView setPalette:v7];

  [(NTKVictoryAnalogBackgroundView *)self->_backgroundView setStyle:a3];
  [(NTKVictoryAnalogBackgroundView *)self->_transitionBackgroundView setAlpha:0.0];
  transitionBackgroundView = self->_transitionBackgroundView;
  long long v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v10[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v10[1] = v9;
  v10[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [(NTKVictoryAnalogBackgroundView *)transitionBackgroundView setTransform:v10];
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (a6 == 10)
  {
    backgroundView = self->_backgroundView;
    v33 = [(NTKVictoryAnalogFaceView *)self interpolatedColorPalette];
    v34 = [v33 fromPalette];
    v35 = [(NTKVictoryAnalogFaceView *)self interpolatedColorPalette];
    v36 = [v35 toPalette];
    [(NTKVictoryAnalogBackgroundView *)backgroundView applyTransitionFraction:v34 fromPalette:v36 toPalette:[(NTKVictoryAnalogBackgroundView *)self->_backgroundView style] style:a3];

    id v19 = [(NTKVictoryAnalogFaceView *)self interpolatedColorPalette];
    id v21 = [v19 cornerComplicationsAccent];
    [(NTKVictoryAnalogFaceView *)self _applyComplicationViewColor:v21];
    goto LABEL_6;
  }
  if (a6 == 11)
  {
    id v15 = [v12 style];
    id v16 = [v13 style];
    if (v15 != v16)
    {
      id v17 = v16;
      double v18 = [(NTKVictoryAnalogFaceView *)self palette];
      id v19 = [v18 copy];

      [v19 setStyle:v15];
      [(NTKVictoryAnalogBackgroundView *)self->_backgroundView setStyle:v15];
      [(NTKVictoryAnalogBackgroundView *)self->_backgroundView setPalette:v19];
      double v20 = [(NTKVictoryAnalogFaceView *)self palette];
      id v21 = [v20 copy];

      [v21 setStyle:v17];
      [(NTKVictoryAnalogBackgroundView *)self->_transitionBackgroundView setStyle:v17];
      [(NTKVictoryAnalogBackgroundView *)self->_transitionBackgroundView setPalette:v21];
      CLKCompressFraction();
      CLKInterpolateBetweenFloatsClipped();
      CGFloat v23 = v22;
      CLKInterpolateBetweenFloatsClipped();
      double v25 = v24;
      memset(&v40, 0, sizeof(v40));
      CGAffineTransformMakeScale(&v40, v23, v23);
      CGAffineTransform v39 = v40;
      [(NTKVictoryAnalogBackgroundView *)self->_backgroundView setTransform:&v39];
      [(NTKVictoryAnalogBackgroundView *)self->_backgroundView setAlpha:v25];
      CLKCompressFraction();
      CLKInterpolateBetweenFloatsClipped();
      CGFloat v27 = v26;
      CLKInterpolateBetweenFloatsClipped();
      double v29 = v28;
      CGAffineTransformMakeScale(&v38, v27, v27);
      CGAffineTransform v40 = v38;
      CGAffineTransform v37 = v38;
      [(NTKVictoryAnalogBackgroundView *)self->_transitionBackgroundView setTransform:&v37];
      [(NTKVictoryAnalogBackgroundView *)self->_transitionBackgroundView setAlpha:v29];
      v30 = [(NTKVictoryAnalogFaceView *)self palette];
      v31 = [v30 cornerComplicationsAccent];
      [(NTKVictoryAnalogFaceView *)self _applyComplicationViewColor:v31];

LABEL_6:
    }
  }
}

- (void)_applyComplicationViewColor:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_4D10;
  v4[3] = &unk_C448;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(NTKVictoryAnalogFaceView *)v5 enumerateComplicationDisplayWrappersWithBlock:v4];
}

- (void)_applyColor:(id)a3 toComplicationView:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  if ([v5 conformsToProtocol:&OBJC_PROTOCOL___NTKUtilityComplicationView])
  {
    id v6 = v5;
    [v6 setForegroundColor:v7];
    [v6 setForegroundAlpha:1.0];
    [v6 setForegroundImageAlpha:1.0];
  }
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v20.receiver = self;
  v20.super_class = (Class)NTKVictoryAnalogFaceView;
  -[NTKVictoryAnalogFaceView _applyRubberBandingFraction:forCustomEditMode:slot:](&v20, "_applyRubberBandingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4)
  {
    NTKScaleForRubberBandingFraction();
    CGFloat v8 = v7;
    NTKAlphaForRubberBandingFraction();
    double v10 = v9;
    [(NTKVictoryAnalogFaceView *)self _complicationAlphaForEditMode:a4];
    double v12 = v10 * v11;
    [(NTKVictoryAnalogFaceView *)self _backgroundAlphaForEditMode:a4];
    double v14 = v10 * v13;
    memset(&v19, 0, sizeof(v19));
    CGAffineTransformMakeScale(&v19, v8, v8);
    id v15 = [(NTKVictoryAnalogFaceView *)self foregroundContainerView];
    CGAffineTransform v18 = v19;
    [v15 setTransform:&v18];
    [v15 setAlpha:v12];
    backgroundView = self->_backgroundView;
    CGAffineTransform v18 = v19;
    [(NTKVictoryAnalogBackgroundView *)backgroundView setTransform:&v18];
    [(NTKVictoryAnalogBackgroundView *)self->_backgroundView setAlpha:v14];
    cornerView = self->_cornerView;
    CGAffineTransform v18 = v19;
    [(NTKRoundedCornerOverlayView *)cornerView setTransform:&v18];
  }
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)NTKVictoryAnalogFaceView;
  -[NTKVictoryAnalogFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v11, "_applyBreathingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4)
  {
    NTKLargeElementScaleForBreathingFraction();
    memset(&v10, 0, sizeof(v10));
    CGAffineTransformMakeScale(&v10, v7, v7);
    CGFloat v8 = [(NTKVictoryAnalogFaceView *)self contentView];
    CGAffineTransform v9 = v10;
    [v8 setTransform:&v9];
  }
}

- (void)_configureForEditMode:(int64_t)a3
{
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  v14.receiver = self;
  v14.super_class = (Class)NTKVictoryAnalogFaceView;
  -[NTKVictoryAnalogFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](&v14, "_configureForTransitionFraction:fromEditMode:toEditMode:");
  [(NTKVictoryAnalogFaceView *)self _handsAlphaForEditMode:a4];
  [(NTKVictoryAnalogFaceView *)self _handsAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v9 = v8;
  CGAffineTransform v10 = [(NTKVictoryAnalogFaceView *)self timeView];
  [v10 setAlpha:v9];

  [(NTKVictoryAnalogFaceView *)self _complicationAlphaForEditMode:a4];
  [(NTKVictoryAnalogFaceView *)self _complicationAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v12 = v11;
  double v13 = [(NTKVictoryAnalogFaceView *)self foregroundContainerView];
  [v13 setAlpha:v12];

  [(NTKVictoryAnalogFaceView *)self _backgroundAlphaForEditMode:a4];
  [(NTKVictoryAnalogFaceView *)self _backgroundAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  -[NTKVictoryAnalogBackgroundView setAlpha:](self->_backgroundView, "setAlpha:");
}

- (double)_backgroundAlphaForEditMode:(int64_t)a3
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
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 0xA) {
    return 1.0;
  }
  return result;
}

- (double)_handsAlphaForEditMode:(int64_t)a3
{
  double result = 0.0;
  if ((unint64_t)(a3 - 10) >= 2)
  {
    if (a3 == 1) {
      return NTKEditModeDimmedAlpha;
    }
    else {
      return 1.0;
    }
  }
  return result;
}

- (void)_prepareForEditing
{
  v16.receiver = self;
  v16.super_class = (Class)NTKVictoryAnalogFaceView;
  [(NTKVictoryAnalogFaceView *)&v16 _prepareForEditing];
  [(NTKVictoryAnalogBackgroundView *)self->_backgroundView willBeginEditing];
  id v3 = objc_alloc((Class)NTKVictoryAnalogBackgroundView);
  BOOL v4 = [(NTKVictoryAnalogFaceView *)self device];
  [v4 screenBounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [(NTKVictoryAnalogFaceView *)self device];
  objc_super v14 = (NTKVictoryAnalogBackgroundView *)objc_msgSend(v3, "initWithFrame:forDevice:", v13, v6, v8, v10, v12);
  transitionBackgroundView = self->_transitionBackgroundView;
  self->_transitionBackgroundView = v14;

  [(NTKVictoryAnalogBackgroundView *)self->_transitionBackgroundView setAlpha:0.0];
  [(UIView *)self->_scaleView addSubview:self->_transitionBackgroundView];
}

- (void)_cleanupAfterEditing
{
  [(NTKVictoryAnalogBackgroundView *)self->_transitionBackgroundView removeFromSuperview];
  transitionBackgroundView = self->_transitionBackgroundView;
  self->_transitionBackgroundView = 0;
}

- (void)logoTappedFromRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(NTKVictoryAnalogFaceView *)self delegate];
  +[NTKVictoryAppLauncher attemptLaunchWithDelegate:v8];

  id v9 = [(NTKVictoryAnalogFaceView *)self delegate];
  objc_msgSend(v9, "faceViewRequestedLaunchFromRect:", x, y, width, height);
}

- (BOOL)_needsForegroundContainerView
{
  return 1;
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  utilityComplicationFactordouble y = self->_utilityComplicationFactory;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(NTKUtilityComplicationFactory *)utilityComplicationFactory newViewForComplication:v10 family:a4 forSlot:[(NTKVictoryAnalogFaceView *)self _utilitySlotForSlot:v9]];

  [(NTKVictoryAnalogFaceView *)self _configureComplicationView:v11 forSlot:v9];
  return v11;
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NTKVictoryAnalogFaceView;
  [(NTKVictoryAnalogFaceView *)&v13 _configureComplicationView:v6 forSlot:v7];
  double v8 = [(NTKVictoryAnalogFaceView *)self optionForCustomEditMode:10 slot:0];
  id v9 = [v8 pigmentEditOption];

  if (v9)
  {
    id v10 = [(NTKVictoryAnalogFaceView *)self palette];
    id v11 = [v10 cornerComplicationsAccent];
    [(NTKVictoryAnalogFaceView *)self _applyColor:v11 toComplicationView:v6];

    if ([v6 conformsToProtocol:&OBJC_PROTOCOL___NTKUtilityComplicationView])
    {
      id v12 = v6;
      objc_msgSend(v12, "setPlacement:", +[NTKUtilityComplicationFactory placementForSlot:](NTKUtilityComplicationFactory, "placementForSlot:", -[NTKVictoryAnalogFaceView _utilitySlotForSlot:](self, "_utilitySlotForSlot:", v7)));
      objc_msgSend(v12, "setAlwaysEnforcePlatterInset:", objc_msgSend(v7, "isEqualToString:", NTKComplicationSlotBottomCenter));
    }
  }
}

- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4
{
  utilityComplicationFactordouble y = self->_utilityComplicationFactory;
  int64_t v6 = [(NTKVictoryAnalogFaceView *)self _utilitySlotForSlot:a4];

  return (int64_t)[(NTKUtilityComplicationFactory *)utilityComplicationFactory layoutOverrideForComplicationType:a3 inSlot:v6];
}

- (int64_t)_utilitySlotForSlot:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:NTKComplicationSlotTopLeft])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:NTKComplicationSlotTopRight])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:NTKComplicationSlotBottomCenter])
  {
    int64_t v4 = 10;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)_slotForUtilitySlot:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      int64_t v4 = (id *)&NTKComplicationSlotTopLeft;
      goto LABEL_7;
    case 10:
      int64_t v4 = (id *)&NTKComplicationSlotBottomCenter;
LABEL_7:
      id v5 = *v4;
      return v5;
    case 2:
      int64_t v4 = (id *)&NTKComplicationSlotTopRight;
      goto LABEL_7;
  }
  id v5 = 0;
  return v5;
}

- (void)_loadLayoutRules
{
  [(NTKVictoryAnalogFaceView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v22[0] = NTKComplicationSlotTopLeft;
  v22[1] = NTKComplicationSlotTopRight;
  v22[2] = NTKComplicationSlotBottomCenter;
  id v11 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 3, 0);
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v17 = [(NTKVictoryAnalogFaceView *)self complicationLayoutforSlot:v16];
        -[NTKUtilityComplicationFactory configureComplicationLayout:forSlot:withBounds:](self->_utilityComplicationFactory, "configureComplicationLayout:forSlot:withBounds:", v17, [(NTKVictoryAnalogFaceView *)self _utilitySlotForSlot:v16], v4, v6, v8, v10);
      }
      id v13 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v13);
  }
}

- (double)_keylineEdgeGapForState:(int64_t)a3
{
  double v3 = 0.0;
  if ((unint64_t)(a3 - 2) >= 2)
  {
    if (a3 == 1)
    {
      double v4 = [(NTKVictoryAnalogFaceView *)self device];
      sub_3E18(v4, (uint64_t)v6);
      double v3 = *(double *)&v6[1];
    }
    else
    {
      double v4 = [(NTKVictoryAnalogFaceView *)self device];
      sub_3E18(v4, (uint64_t)v7);
      double v3 = v7[0];
    }
  }
  return v3;
}

- (double)_keylinePaddingForState:(int64_t)a3
{
  double result = 0.0;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    NTKKeylineWidth();
    return v4 + 1.5;
  }
  return result;
}

- (id)utilityDateComplicationFontForDateStyle:(unint64_t)a3
{
  return 0;
}

- (unint64_t)textLayoutStyleForSlot:(int64_t)a3
{
  double v4 = [(NTKVictoryAnalogFaceView *)self _slotForUtilitySlot:a3];
  id v5 = [(NTKVictoryAnalogFaceView *)self layoutStyleForSlot:v4];

  return (unint64_t)v5;
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 11) {
    return &off_CC70;
  }
  else {
    return 0;
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  double v9 = v8;
  if (a4 == 11)
  {
    id v10 = v8;
    id v11 = [a5 objectForKeyedSubscript:&off_CA20];
    id v12 = [v11 pigmentEditOption];

    if (!qword_12B48)
    {
      uint64_t v13 = objc_opt_new();
      uint64_t v14 = (void *)qword_12B48;
      qword_12B48 = v13;
    }
    id v15 = +[NSString stringWithFormat:@"%@-%@", v10, v12];
    uint64_t v16 = [(id)qword_12B48 objectForKey:v15];
    if (!v16)
    {
      id v17 = [(NTKVictoryAnalogFaceView *)self palette];
      id v18 = [v17 copyWithOption:v12];

      objc_msgSend(v18, "setStyle:", objc_msgSend(v10, "style"));
      v59 = [v18 backgroundColor];
      id v19 = objc_alloc((Class)NTKVictoryAnalogBackgroundView);
      long long v20 = [(NTKVictoryAnalogFaceView *)self device];
      [v20 screenBounds];
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      double v29 = [(NTKVictoryAnalogFaceView *)self device];
      id v30 = objc_msgSend(v19, "initWithFrame:forDevice:", v29, v22, v24, v26, v28);

      objc_msgSend(v30, "setStyle:", objc_msgSend(v10, "style"));
      v31 = v18;
      [v30 setPalette:v18];
      v32 = [v18 hands];
      v60 = v18;
      uint64_t v33 = [v18 handInlay];
      v34 = NTKImageNamed();
      v35 = v34;
      v61 = (void *)v33;
      if (v33) {
        v36 = (void *)v33;
      }
      else {
        v36 = v32;
      }
      v57 = [v34 _flatImageWithColor:v36];

      CGAffineTransform v37 = NTKImageNamed();
      v56 = [v37 _flatImageWithColor:v32];

      v53 = NTKImageNamed();
      CGAffineTransform v38 = NTKImageNamed();
      [v31 secondHand];
      v40 = CGAffineTransform v39 = v12;
      v41 = [v38 _flatImageWithColor:v40];

      v42 = [(NTKVictoryAnalogFaceView *)self device];
      [v42 screenBounds];
      double v44 = v43;
      double v46 = v45;

      id v12 = v39;
      id v47 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:", v44, v46);
      v63[0] = _NSConcreteStackBlock;
      v63[1] = 3221225472;
      v63[2] = sub_5DF8;
      v63[3] = &unk_C470;
      id v64 = v59;
      id v65 = v30;
      id v66 = v56;
      id v67 = v53;
      id v68 = v57;
      id v69 = v41;
      id v55 = v41;
      id v58 = v57;
      id v54 = v53;
      id v48 = v56;
      id v49 = v30;
      id v50 = v59;
      v51 = v47;
      uint64_t v16 = [v47 imageWithActions:v63];
      [(id)qword_12B48 setObject:v16 forKey:v15];
    }
  }
  else
  {
    v62.receiver = self;
    v62.super_class = (Class)NTKVictoryAnalogFaceView;
    uint64_t v16 = [(NTKVictoryAnalogFaceView *)&v62 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:a5];
  }

  return v16;
}

- (UIView)scaleView
{
  return self->_scaleView;
}

- (void)setScaleView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scaleView, 0);
  objc_storeStrong((id *)&self->_cornerView, 0);
  objc_storeStrong((id *)&self->_transitionBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_utilityComplicationFactory, 0);
}

@end