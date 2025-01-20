@interface NTKVictoryDigitalFaceView
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
+ (int64_t)uiSensitivity;
- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4;
- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3;
- (BOOL)_needsForegroundContainerView;
- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4;
- (CGRect)_timeViewFrame;
- (NTKComplicationDisplayWrapperView)logoWrapperView;
- (NTKVictoryDigitalFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_bottomComplicationAlphaForEditMode:(int64_t)a3;
- (double)_complicationAlphaForEditMode:(int64_t)a3;
- (double)_keylineEdgeGapForState:(int64_t)a3;
- (double)_keylinePaddingForState:(int64_t)a3;
- (double)_logoPlatterAlphaForEditMode:(int64_t)a3;
- (double)_logoPlatterXOffsetForEditMode:(int64_t)a3;
- (double)_timeAlphaForEditMode:(int64_t)a3;
- (double)_verticalPaddingForStatusBar;
- (id)_additionalPrelaunchApplicationIdentifiers;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)createFaceColorPalette;
- (int64_t)_keylineStyleForComplicationSlot:(id)a3;
- (int64_t)_utilitySlotForSlot:(id)a3;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyColor:(id)a3 platterColor:(id)a4 toComplicationView:(id)a5 slot:(id)a6;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyPopAnimationWithFraction:(double)a3;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_cleanupAfterEditing;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_endScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)_loadLayoutRules;
- (void)_loadSnapshotContentViews;
- (void)_logoTapped;
- (void)_positionLogoPlatterView;
- (void)_prepareForEditing;
- (void)_scrubToDate:(id)a3 animated:(BOOL)a4;
- (void)_setupLogoViews;
- (void)_unloadSnapshotContentViews;
- (void)layoutSubviews;
- (void)setLogoWrapperView:(id)a3;
- (void)updateComplicationWithPalette:(id)a3;
@end

@implementation NTKVictoryDigitalFaceView

+ (int64_t)uiSensitivity
{
  v2 = +[CLKRenderingContext sharedRenderingContext];
  v3 = [v2 device];
  int64_t v4 = NTKSensitivityForVictoryFaces();

  return v4;
}

- (NTKVictoryDigitalFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)NTKVictoryDigitalFaceView;
  v9 = [(NTKVictoryDigitalFaceView *)&v25 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  v10 = v9;
  if (v9)
  {
    double v24 = 0.0;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v19 = 0u;
    v11 = [(NTKVictoryDigitalFaceView *)v9 device];
    sub_3E78(v11, (uint64_t)&v19);

    v12 = (NTKUtilityComplicationFactory *)[objc_alloc((Class)NTKUtilityComplicationFactory) initForDevice:v8];
    utilityComplicationFactory = v10->_utilityComplicationFactory;
    v10->_utilityComplicationFactory = v12;

    [(NTKUtilityComplicationFactory *)v10->_utilityComplicationFactory setSelectedKeylineHeight:*(double *)&v23];
    [(NTKUtilityComplicationFactory *)v10->_utilityComplicationFactory setBottomCenterLayout:3];
    [(NTKUtilityComplicationFactory *)v10->_utilityComplicationFactory setMaxNormalLongWidth:*((double *)&v23 + 1)];
    -[NTKUtilityComplicationFactory setScreenEdgeInsets:](v10->_utilityComplicationFactory, "setScreenEdgeInsets:", 0.0, 0.0, v24, 0.0);
    v14 = [(NTKVictoryDigitalFaceView *)v10 device];
    NTKCircularMediumComplicationDiameter();
    double v16 = v15 * 0.5;

    CGFloat v17 = v16 + *(double *)&v20;
    v10->_logoPlatterCenter.x = v16 + *(double *)&v19;
    v10->_logoPlatterCenter.y = v17;
  }

  return v10;
}

- (id)createFaceColorPalette
{
  v2 = [[NTKVictoryDigitalColorPalette alloc] initWithFaceClass:objc_opt_class()];

  return v2;
}

- (void)_loadSnapshotContentViews
{
  v3 = [NTKVictoryDigitalTimeView alloc];
  int64_t v4 = [(NTKVictoryDigitalFaceView *)self device];
  id v5 = [(NTKVictoryDigitalTimeView *)v3 initForDevice:v4];
  [(NTKVictoryDigitalFaceView *)self setTimeView:v5];

  v6 = [(NTKVictoryDigitalFaceView *)self timeView];
  [v6 setDelegate:self];

  v7 = [(NTKVictoryDigitalFaceView *)self contentView];
  id v8 = [(NTKVictoryDigitalFaceView *)self timeView];
  [v7 addSubview:v8];

  [(NTKVictoryDigitalFaceView *)self _setupLogoViews];
  [(NTKVictoryDigitalFaceView *)self _updateImageToBlur];

  [(NTKVictoryDigitalFaceView *)self setNeedsLayout];
}

- (void)_unloadSnapshotContentViews
{
  v3 = [(NTKVictoryDigitalFaceView *)self timeView];
  [v3 setDelegate:0];

  int64_t v4 = [(NTKVictoryDigitalFaceView *)self timeView];
  [v4 removeFromSuperview];

  [(NTKVictoryDigitalFaceView *)self setTimeView:0];
  [(NTKComplicationDisplayWrapperView *)self->_logoWrapperView removeFromSuperview];
  logoWrapperView = self->_logoWrapperView;
  self->_logoWrapperView = 0;
}

- (void)_setupLogoViews
{
  id v3 = objc_alloc((Class)NTKComplicationDisplayWrapperView);
  int64_t v4 = (NTKComplicationDisplayWrapperView *)[v3 initWithFamily:CLKComplicationFamilyCircularMedium];
  logoWrapperView = self->_logoWrapperView;
  self->_logoWrapperView = v4;

  v6 = [(NTKVictoryDigitalFaceView *)self device];
  NTKCircularMediumComplicationDiameter();
  double v8 = v7;

  -[NTKComplicationDisplayWrapperView setBounds:](self->_logoWrapperView, "setBounds:", 0.0, 0.0, v8, v8);
  v9 = +[NTKVictoryDigitalFaceBundle imageWithName:@"victoryNTK-complication-logo"];
  id v13 = +[CLKImageProvider imageProviderWithOnePieceImage:v9];

  v10 = +[CLKComplicationTemplateCircularMediumSimpleImage templateWithImageProvider:v13];
  [(NTKComplicationDisplayWrapperView *)self->_logoWrapperView setComplicationTemplate:v10 reason:0 animation:0];
  v11 = [(NTKComplicationDisplayWrapperView *)self->_logoWrapperView display];
  [(NTKVictoryDigitalFaceView *)self _configureComplicationView:v11 forSlot:0];

  [(NTKComplicationDisplayWrapperView *)self->_logoWrapperView setTapEnabled:1];
  [(NTKComplicationDisplayWrapperView *)self->_logoWrapperView addTarget:self action:"_logoTapped" forControlEvents:64];
  v12 = [(NTKVictoryDigitalFaceView *)self foregroundContainerView];
  [v12 addSubview:self->_logoWrapperView];
}

- (void)_logoTapped
{
  id v3 = [(NTKVictoryDigitalFaceView *)self delegate];
  +[NTKVictoryAppLauncher attemptLaunchWithDelegate:v3];

  logoWrapperView = self->_logoWrapperView;
  [(NTKComplicationDisplayWrapperView *)logoWrapperView bounds];
  -[NTKComplicationDisplayWrapperView convertRect:toView:](logoWrapperView, "convertRect:toView:", self);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = [(NTKVictoryDigitalFaceView *)self delegate];
  objc_msgSend(v13, "faceViewRequestedLaunchFromRect:", v6, v8, v10, v12);
}

- (id)_additionalPrelaunchApplicationIdentifiers
{
  v2 = +[NTKVictoryAppLauncher prelaunchApplicationIdentifiers];
  id v3 = +[NSOrderedSet orderedSetWithSet:v2];

  return v3;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)NTKVictoryDigitalFaceView;
  [(NTKVictoryDigitalFaceView *)&v4 layoutSubviews];
  id v3 = [(NTKVictoryDigitalFaceView *)self timeView];
  [(NTKVictoryDigitalFaceView *)self _timeViewFrame];
  objc_msgSend(v3, "ntk_setBoundsAndPositionFromFrame:");

  [(NTKVictoryDigitalFaceView *)self _positionLogoPlatterView];
}

- (void)_positionLogoPlatterView
{
}

- (double)_verticalPaddingForStatusBar
{
  return 0.0;
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v11 = a3;
  double v7 = [(NTKVictoryDigitalFaceView *)self timeView];
  if (a4 == 10)
  {
    double v8 = [(NTKVictoryDigitalFaceView *)self palette];
    [v7 setColorPalette:v8];

    double v9 = [(NTKVictoryDigitalFaceView *)self palette];
    [(NTKVictoryDigitalFaceView *)self updateComplicationWithPalette:v9];
  }
  else if (a4 == 13)
  {
    objc_msgSend(v7, "setStyle:", objc_msgSend(v11, "style"));
  }
  double v10 = [(NTKVictoryDigitalFaceView *)self timeView];
  [(NTKVictoryDigitalFaceView *)self _timeViewFrame];
  objc_msgSend(v10, "ntk_setBoundsAndPositionFromFrame:");
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v15 = a4;
  id v11 = a5;
  double v12 = [(NTKVictoryDigitalFaceView *)self timeView];
  if (a6 == 10)
  {
    id v13 = [(NTKVictoryDigitalFaceView *)self interpolatedColorPalette];
    [v12 setColorPalette:v13];

    v14 = [(NTKVictoryDigitalFaceView *)self interpolatedColorPalette];
    [(NTKVictoryDigitalFaceView *)self updateComplicationWithPalette:v14];

    [(NTKVictoryDigitalFaceView *)self _applyPopAnimationWithFraction:a3];
  }
  else if (a6 == 13)
  {
    objc_msgSend(v12, "applyTransitionFraction:fromStyle:toStyle:", objc_msgSend(v15, "style"), objc_msgSend(v11, "style"), a3);
  }
}

- (void)_applyPopAnimationWithFraction:(double)a3
{
  id v13 = [(NTKVictoryDigitalFaceView *)self timeView];
  [v13 applyPopAnimationTransitionFraction:a3];
  v19[0] = NTKComplicationSlot1;
  v19[1] = NTKComplicationSlot2;
  v19[2] = NTKComplicationSlotBottom;
  double v5 = +[NSArray arrayWithObjects:v19 count:3];
  NTKVictoryTransitionTimingFunction();
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_48EC;
  v16[3] = &unk_103E8;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = v12;
  double v18 = a3;
  double v6 = objc_retainBlock(v16);
  for (uint64_t i = 0; i != 4; ++i)
  {
    float v8 = ((float (*)(void *, float))v6[2])(v6, flt_FCA0[i]);
    if (i)
    {
      double v9 = [v5 objectAtIndex:i - 1];
      double v10 = [(NTKVictoryDigitalFaceView *)self normalComplicationDisplayWrapperForSlot:v9];
      id v11 = [v10 display];
    }
    else
    {
      id v11 = [(NTKComplicationDisplayWrapperView *)self->_logoWrapperView display];
    }
    CGAffineTransformMakeScale(&v15, v8 * 0.15 + 0.85, v8 * 0.15 + 0.85);
    CGAffineTransform v14 = v15;
    [v11 setTransform:&v14];
  }
}

- (void)updateComplicationWithPalette:(id)a3
{
  id v4 = a3;
  double v5 = [v4 complication];
  double v6 = [v4 complicationPlatter];
  double v7 = [(NTKComplicationDisplayWrapperView *)self->_logoWrapperView display];
  [(NTKVictoryDigitalFaceView *)self _applyColor:v5 platterColor:v6 toComplicationView:v7 slot:0];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_4A24;
  v9[3] = &unk_10410;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(NTKVictoryDigitalFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v9];
}

- (void)_applyColor:(id)a3 platterColor:(id)a4 toComplicationView:(id)a5 slot:(id)a6
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if (([v9 conformsToProtocol:&OBJC_PROTOCOL___NTKUtilityComplicationView] & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v10 = v9;
    [v10 setForegroundColor:v11];
    [v10 setPlatterColor:v8];
  }
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v17.receiver = self;
  v17.super_class = (Class)NTKVictoryDigitalFaceView;
  -[NTKVictoryDigitalFaceView _applyRubberBandingFraction:forCustomEditMode:slot:](&v17, "_applyRubberBandingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4)
  {
    NTKScaleForRubberBandingFraction();
    CGFloat v8 = v7;
    NTKAlphaForRubberBandingFraction();
    double v10 = v9;
    memset(&v16, 0, sizeof(v16));
    CGAffineTransformMakeScale(&v16, v8, v8);
    if (a4 == 10)
    {
      CGAffineTransform v13 = v16;
      [(NTKVictoryDigitalFaceView *)self setTransform:&v13];
      [(NTKVictoryDigitalFaceView *)self setAlpha:v10];
    }
    else if (a4 == 13)
    {
      CGAffineTransform v15 = v16;
      id v11 = [(NTKVictoryDigitalFaceView *)self timeView];
      CGAffineTransform v14 = v15;
      [v11 setTransform:&v14];

      id v12 = [(NTKVictoryDigitalFaceView *)self timeView];
      [v12 setAlpha:v10];
    }
  }
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)NTKVictoryDigitalFaceView;
  -[NTKVictoryDigitalFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v15, "_applyBreathingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4 == 13)
  {
    NTKLargeElementScaleForBreathingFraction();
    memset(&v14, 0, sizeof(v14));
    CGAffineTransformMakeScale(&v14, v11, v11);
    double v10 = [(NTKVictoryDigitalFaceView *)self timeView];
  }
  else
  {
    if (a4 != 10) {
      return;
    }
    NTKLargeElementScaleForBreathingFraction();
    memset(&v14, 0, sizeof(v14));
    CGAffineTransformMakeScale(&v14, v7, v7);
    CGFloat v8 = [(NTKVictoryDigitalFaceView *)self foregroundContainerView];
    CGAffineTransform v13 = v14;
    [v8 setTransform:&v13];

    double v9 = [(NTKVictoryDigitalFaceView *)self timeView];
    CGAffineTransform v13 = v14;
    [v9 setTransform:&v13];

    double v10 = [(NTKVictoryDigitalFaceView *)self complicationContainerView];
  }
  id v12 = v10;
  CGAffineTransform v13 = v14;
  [v10 setTransform:&v13];
}

- (void)_prepareForEditing
{
  v4.receiver = self;
  v4.super_class = (Class)NTKVictoryDigitalFaceView;
  [(NTKVictoryDigitalFaceView *)&v4 _prepareForEditing];
  id v3 = [(NTKVictoryDigitalFaceView *)self timeView];
  [v3 willBeginEditing];
}

- (void)_cleanupAfterEditing
{
  v13.receiver = self;
  v13.super_class = (Class)NTKVictoryDigitalFaceView;
  [(NTKVictoryDigitalFaceView *)&v13 _cleanupAfterEditing];
  id v3 = [(NTKVictoryDigitalFaceView *)self foregroundContainerView];
  long long v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v11[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v8 = v11[0];
  v11[1] = v9;
  long long v12 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  long long v7 = v12;
  [v3 setTransform:v11];

  objc_super v4 = [(NTKVictoryDigitalFaceView *)self foregroundContainerView];
  [v4 setAlpha:1.0];

  double v5 = [(NTKVictoryDigitalFaceView *)self timeView];
  v10[0] = v8;
  v10[1] = v9;
  v10[2] = v7;
  [v5 setTransform:v10];

  double v6 = [(NTKVictoryDigitalFaceView *)self timeView];
  [v6 setAlpha:1.0];
}

- (CGRect)_timeViewFrame
{
  id v3 = [(NTKVictoryDigitalFaceView *)self foregroundContainerView];
  [v3 bounds];
  double v5 = v4;

  double v6 = [(NTKVictoryDigitalFaceView *)self timeView];
  objc_msgSend(v6, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  double v8 = v7;
  double v10 = v9;

  CGFloat v11 = [(NTKVictoryDigitalFaceView *)self device];
  CLKValueForDeviceMetrics();
  double v13 = v12;

  double v14 = v5 - v8;
  double v15 = v13;
  double v16 = v8;
  double v17 = v10;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  v22.receiver = self;
  v22.super_class = (Class)NTKVictoryDigitalFaceView;
  -[NTKVictoryDigitalFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](&v22, "_configureForTransitionFraction:fromEditMode:toEditMode:");
  [(NTKVictoryDigitalFaceView *)self _timeAlphaForEditMode:a4];
  [(NTKVictoryDigitalFaceView *)self _timeAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v9 = v8;
  double v10 = [(NTKVictoryDigitalFaceView *)self timeView];
  [v10 setAlpha:v9];

  [(NTKVictoryDigitalFaceView *)self _complicationAlphaForEditMode:a4];
  [(NTKVictoryDigitalFaceView *)self _complicationAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v12 = v11;
  double v13 = [(NTKVictoryDigitalFaceView *)self foregroundContainerView];
  [v13 setAlpha:v12];

  double v14 = [(NTKVictoryDigitalFaceView *)self device];
  double v15 = (char *)[v14 deviceCategory];

  if (v15 == (unsigned char *)&dword_0 + 1)
  {
    [(NTKVictoryDigitalFaceView *)self _bottomComplicationAlphaForEditMode:a4];
    [(NTKVictoryDigitalFaceView *)self _bottomComplicationAlphaForEditMode:a5];
    CLKInterpolateBetweenFloatsClipped();
    double v17 = v16;
    double v18 = [(NTKVictoryDigitalFaceView *)self normalComplicationDisplayWrapperForSlot:NTKComplicationSlotBottom];
    long long v19 = [v18 display];
    [v19 setAlpha:v17];
  }
  [(NTKVictoryDigitalFaceView *)self _logoPlatterAlphaForEditMode:a4];
  [(NTKVictoryDigitalFaceView *)self _logoPlatterAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  -[NTKComplicationDisplayWrapperView setAlpha:](self->_logoWrapperView, "setAlpha:");
  [(NTKVictoryDigitalFaceView *)self _logoPlatterXOffsetForEditMode:a4];
  [(NTKVictoryDigitalFaceView *)self _logoPlatterXOffsetForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  self->_currentLogoPlatterXOffset = v20;
  [(NTKVictoryDigitalFaceView *)self _positionLogoPlatterView];
  long long v21 = [(NTKVictoryDigitalFaceView *)self timeView];
  [v21 clearEditingTransitions];
}

- (double)_timeAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if (a3 != 1) {
    return 1.0;
  }
  return result;
}

- (double)_bottomComplicationAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if (a3 != 10) {
    return 1.0;
  }
  return result;
}

- (double)_logoPlatterXOffsetForEditMode:(int64_t)a3
{
  if (!a3) {
    return 0.0;
  }
  id v3 = [(NTKVictoryDigitalFaceView *)self device];
  sub_3E78(v3, (uint64_t)v6);
  double v4 = v7;

  return v4;
}

- (double)_logoPlatterAlphaForEditMode:(int64_t)a3
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
  if (a3 != 13) {
    return 1.0;
  }
  return result;
}

- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NTKVictoryDigitalFaceView;
  [(NTKVictoryDigitalFaceView *)&v8 _keylineFrameForComplicationSlot:a3 selected:0];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3
{
  return a3 == 10;
}

- (int64_t)_keylineStyleForComplicationSlot:(id)a3
{
  id v4 = a3;
  double v5 = [(NTKVictoryDigitalFaceView *)self device];
  if ([v5 deviceCategory] == (char *)&dword_0 + 1)
  {

LABEL_7:
    v9.receiver = self;
    v9.super_class = (Class)NTKVictoryDigitalFaceView;
    id v7 = [(NTKVictoryDigitalFaceView *)&v9 _keylineStyleForComplicationSlot:v4];
    goto LABEL_8;
  }
  if ([v4 isEqualToString:NTKComplicationSlot1])
  {
  }
  else
  {
    unsigned __int8 v6 = [v4 isEqualToString:NTKComplicationSlot2];

    if ((v6 & 1) == 0) {
      goto LABEL_7;
    }
  }
  id v7 = &dword_0 + 1;
LABEL_8:

  return (int64_t)v7;
}

- (BOOL)_needsForegroundContainerView
{
  return 1;
}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  return a4 == 13;
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  uint64_t v9 = NTKComplicationSlotBottom;
  id v10 = a5;
  if ([v10 isEqual:v9])
  {
    id v11 = [(NTKUtilityComplicationFactory *)self->_utilityComplicationFactory newViewForComplication:v8 family:a4 forSlot:[(NTKVictoryDigitalFaceView *)self _utilitySlotForSlot:v10]];
  }
  else
  {
    +[NTKCircularComplicationView mediumViewForComplicationType:](NTKCircularComplicationView, "mediumViewForComplicationType:", [v8 complicationType]);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v12 = v11;
  [(NTKVictoryDigitalFaceView *)self _configureComplicationView:v11 forSlot:v10];

  return v12;
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:NTKComplicationSlotBottom])
  {
    v21.receiver = self;
    v21.super_class = (Class)NTKVictoryDigitalFaceView;
    [(NTKVictoryDigitalFaceView *)&v21 _configureComplicationView:v6 forSlot:v7];
    id v8 = v6;
    uint64_t v9 = [(NTKVictoryDigitalFaceView *)self palette];
    id v10 = [v9 complication];
    [v8 setForegroundColor:v10];

    id v11 = [(NTKVictoryDigitalFaceView *)self palette];
    double v12 = [v11 complicationPlatter];
    [v8 setPlatterColor:v12];

    [v8 setForegroundAlpha:1.0];
    [v8 setForegroundImageAlpha:1.0];
    double v13 = [(NTKVictoryDigitalFaceView *)self device];
    objc_msgSend(v8, "setShouldUseBackgroundPlatter:", objc_msgSend(v13, "deviceCategory") == (char *)&dword_0 + 1);

    [v8 setAlwaysEnforcePlatterInset:1];
    objc_msgSend(v8, "setPlacement:", +[NTKUtilityComplicationFactory placementForSlot:](NTKUtilityComplicationFactory, "placementForSlot:", -[NTKVictoryDigitalFaceView _utilitySlotForSlot:](self, "_utilitySlotForSlot:", v7)));
    double v14 = [(NTKVictoryDigitalFaceView *)self device];
    double v15 = (char *)[v14 sizeClass];

    if (v15 == (unsigned char *)&dword_0 + 3) {
      [v8 setFontSize:14.5];
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = v6;
      [v16 setUsesMediumLayout:1];
      double v17 = [(NTKVictoryDigitalFaceView *)self palette];
      double v18 = [v17 complication];
      [v16 setForegroundColor:v18];

      long long v19 = [(NTKVictoryDigitalFaceView *)self palette];
      double v20 = [v19 complicationPlatter];
      [v16 setPlatterColor:v20];
    }
  }
}

- (int64_t)_utilitySlotForSlot:(id)a3
{
  if ([a3 isEqualToString:NTKComplicationSlotBottom]) {
    return 10;
  }
  else {
    return 0;
  }
}

- (void)_loadLayoutRules
{
  [(NTKVictoryDigitalFaceView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v15[0] = NTKComplicationSlot1;
  v15[1] = NTKComplicationSlot2;
  double v14 = +[NSArray arrayWithObjects:v15 count:2];
  id v11 = v14;
  NTKEnumerateComplicationStates();
  uint64_t v12 = NTKComplicationSlotBottom;
  double v13 = [(NTKVictoryDigitalFaceView *)self complicationLayoutforSlot:NTKComplicationSlotBottom];
  -[NTKUtilityComplicationFactory configureComplicationLayout:forSlot:withBounds:](self->_utilityComplicationFactory, "configureComplicationLayout:forSlot:withBounds:", v13, [(NTKVictoryDigitalFaceView *)self _utilitySlotForSlot:v12], v4, v6, v8, v10);
}

- (double)_keylineEdgeGapForState:(int64_t)a3
{
  double v3 = 0.0;
  if ((unint64_t)(a3 - 2) >= 2)
  {
    if (a3 == 1)
    {
      double v4 = [(NTKVictoryDigitalFaceView *)self device];
      sub_3E78(v4, (uint64_t)v6);
      double v3 = *(double *)&v6[1];
    }
    else
    {
      double v4 = [(NTKVictoryDigitalFaceView *)self device];
      sub_3E78(v4, (uint64_t)v7);
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
    return v4 + 2.0;
  }
  return result;
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 13) {
    return &off_10F60;
  }
  else {
    return 0;
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  double v9 = v8;
  if (a4 == 13)
  {
    id v10 = v8;
    id v11 = [a5 objectForKeyedSubscript:&off_10B38];
    if (!qword_17378)
    {
      uint64_t v12 = objc_opt_new();
      double v13 = (void *)qword_17378;
      qword_17378 = v12;
    }
    double v14 = +[NSString stringWithFormat:@"%@-%@", v10, v11];
    double v15 = [(id)qword_17378 objectForKey:v14];
    if (!v15)
    {
      id v16 = (int *)[v10 style];
      CFStringRef v17 = &stru_10738;
      CFStringRef v18 = @"Italic-Fill";
      CFStringRef v19 = @"Italic-Fill";
      char v20 = 1;
      if (v16 == (int *)((char *)&dword_0 + 3)) {
        CFStringRef v17 = @"Italic-Fill";
      }
      if (v16 == &dword_4)
      {
        char v20 = 0;
        CFStringRef v17 = @"Italic-HalfFill";
      }
      else
      {
        CFStringRef v19 = 0;
      }
      if (v16 == (int *)((char *)&dword_4 + 1)) {
        char v21 = 0;
      }
      else {
        char v21 = v20;
      }
      if (v16 != (int *)((char *)&dword_4 + 1)) {
        CFStringRef v18 = v19;
      }
      CFStringRef v41 = v18;
      if (v16 == (int *)((char *)&dword_4 + 1)) {
        CFStringRef v22 = @"Italic-Outline";
      }
      else {
        CFStringRef v22 = v17;
      }
      uint64_t v23 = [@"Swatch-VictoryDigital-" stringByAppendingString:v22];
      double v24 = [(NTKVictoryDigitalFaceView *)self faceColorPalette];
      id v25 = [v24 copy];

      v26 = [v11 pigmentEditOption];
      [v25 setPigmentEditOption:v26];

      uint64_t v27 = [v25 digits];
      v40 = (void *)v23;
      v28 = +[NTKVictoryDigitalFaceBundle imageWithName:v23];
      v39 = (void *)v27;
      v29 = [v28 _flatImageWithColor:v27];

      if (v21)
      {
        v30 = 0;
        v42 = 0;
      }
      else
      {
        uint64_t v31 = [@"Swatch-VictoryDigital-" stringByAppendingString:v41];
        v32 = [v25 complicationPlatter];
        v42 = (void *)v31;
        v33 = +[NTKVictoryDigitalFaceBundle imageWithName:v31];
        v30 = [v33 _flatImageWithColor:v32];
      }
      id v34 = objc_alloc((Class)UIGraphicsImageRenderer);
      [v29 size];
      id v35 = objc_msgSend(v34, "initWithSize:");
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_5F88;
      v44[3] = &unk_10460;
      id v45 = v30;
      id v46 = v29;
      id v36 = v29;
      id v37 = v30;
      double v15 = [v35 imageWithActions:v44];
      [(id)qword_17378 setObject:v15 forKey:v14];
    }
  }
  else
  {
    v43.receiver = self;
    v43.super_class = (Class)NTKVictoryDigitalFaceView;
    double v15 = [(NTKVictoryDigitalFaceView *)&v43 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:a5];
  }

  return v15;
}

- (void)_scrubToDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)NTKVictoryDigitalFaceView;
  id v6 = a3;
  [(NTKVictoryDigitalFaceView *)&v8 _scrubToDate:v6 animated:v4];
  double v7 = [(NTKVictoryDigitalFaceView *)self timeView];
  [v7 setOverrideDate:v6 duration:0.0];
}

- (void)_endScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  double v7 = [(NTKVictoryDigitalFaceView *)self timeView];
  [v7 setOverrideDate:0 duration:0.0];

  v8.receiver = self;
  v8.super_class = (Class)NTKVictoryDigitalFaceView;
  [(NTKVictoryDigitalFaceView *)&v8 _endScrubbingAnimated:v4 withCompletion:v6];
}

- (NTKComplicationDisplayWrapperView)logoWrapperView
{
  return self->_logoWrapperView;
}

- (void)setLogoWrapperView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logoWrapperView, 0);

  objc_storeStrong((id *)&self->_utilityComplicationFactory, 0);
}

@end