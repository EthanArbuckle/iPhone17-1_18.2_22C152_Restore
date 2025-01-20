@interface NTKCrosswindFaceView
+ (Class)_timeViewClass;
- (BOOL)_allowsEditingSliderEditableColorsForSlot:(id)a3;
- (BOOL)_wantsStatusBarIconShadow;
- (CLKUIQuadView)quadView;
- (NTKCrosswindFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (NTKCrosswindQuad)quad;
- (NTKRoundedCornerOverlayView)cornerView;
- (double)_contentAlphaForEditMode:(int64_t)a3;
- (id)colorPalette;
- (id)createFaceColorPalette;
- (id)timeView;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyFrozen;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_cleanupAfterEditing;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_configureTimeView:(id)a3;
- (void)_loadLayoutRules;
- (void)_loadSnapshotContentViews;
- (void)_prepareForEditing;
- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)_unloadSnapshotContentViews;
- (void)_updateColors;
- (void)_updateColorsWithPalette:(id)a3;
- (void)_updateComplicationColorsWithPalette:(id)a3;
- (void)_updateComplicationsWithComplicationColor;
- (void)_updateContentTransform;
- (void)_updateFrameRate;
- (void)_updateGradientColorsWithPalette:(id)a3;
- (void)_updateTimeViewColors;
- (void)screenDidTurnOffAnimated:(BOOL)a3;
- (void)screenWillTurnOnAnimated:(BOOL)a3;
- (void)setDataMode:(int64_t)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
@end

@implementation NTKCrosswindFaceView

- (NTKCrosswindFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NTKCrosswindFaceView;
  v9 = [(NTKCrosswindFaceView *)&v13 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  if (v9)
  {
    +[NTKCrosswindAnalogHandsView outerCircleRadiusForDevice:v8];
    id v11 = [objc_alloc((Class)NTKWhistlerAnalogFaceViewComplicationFactory) initWithFaceView:v9 dialDiameter:v8 device:v10 + v10];
    [(NTKCrosswindFaceView *)v9 setComplicationFactory:v11];
  }
  return v9;
}

- (void)_loadSnapshotContentViews
{
  v27.receiver = self;
  v27.super_class = (Class)NTKCrosswindFaceView;
  [(NTKCrosswindFaceView *)&v27 _loadSnapshotContentViews];
  self->_breathScaleModifier = 1.0;
  self->_rubberBandScaleModifier = 1.0;
  self->_lastAppliedTritiumProgress = -1.0;
  v3 = [(NTKCrosswindFaceView *)self timeView];
  v4 = [(NTKCrosswindFaceView *)self contentView];
  [(NTKCrosswindFaceView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  objc_super v13 = [(NTKCrosswindFaceView *)self device];
  if (!self->_quadView)
  {
    v14 = +[CLKUIQuadView quadViewWithFrame:@"Xwnd", 0, 2, v6, v8, v10, v12 identifier options colorSpace];
    quadView = self->_quadView;
    self->_quadView = v14;

    [(CLKUIQuadView *)self->_quadView setOpaque:1];
    v16 = [NTKCrosswindQuad alloc];
    [v13 screenScale];
    double v18 = v17;
    v19 = [v3 calendar];
    v20 = [(NTKCrosswindQuad *)v16 initWithScreenScale:v19 calendar:v18];
    quad = self->_quad;
    self->_quad = v20;

    v22 = self->_quad;
    [v3 innerCircleRadius];
    -[NTKCrosswindQuad setInnerCircleRadius:](v22, "setInnerCircleRadius:");
    v23 = self->_quad;
    [v3 middleCircleRadius];
    -[NTKCrosswindQuad setMiddleCircleRadius:](v23, "setMiddleCircleRadius:");
    v24 = self->_quad;
    [v3 outerCircleRadius];
    -[NTKCrosswindQuad setOuterCircleRadius:](v24, "setOuterCircleRadius:");
    [(NTKCrosswindQuad *)self->_quad setDelegate:self];
    [(CLKUIQuadView *)self->_quadView addQuad:self->_quad];
    [(CLKUIQuadView *)self->_quadView setDelegate:self];
    [v4 addSubview:self->_quadView];
  }
  if (!self->_cornerView)
  {
    v25 = (NTKRoundedCornerOverlayView *)objc_msgSend(objc_alloc((Class)NTKRoundedCornerOverlayView), "initWithFrame:forDeviceCornerRadius:", v13, v6, v8, v10, v12);
    cornerView = self->_cornerView;
    self->_cornerView = v25;

    [v4 addSubview:self->_cornerView];
  }
  [v3 setSecondHandDisabled:1];
  [(NTKCrosswindFaceView *)self _updateColors];
  [(NTKCrosswindFaceView *)self _updateFrameRate];
  [(NTKCrosswindFaceView *)self _updateTimeViewColors];
}

- (void)_unloadSnapshotContentViews
{
  v6.receiver = self;
  v6.super_class = (Class)NTKCrosswindFaceView;
  [(NTKCrosswindFaceView *)&v6 _unloadSnapshotContentViews];
  [(NTKCrosswindQuad *)self->_quad setDelegate:0];
  [(CLKUIQuadView *)self->_quadView setDelegate:0];
  [(CLKUIQuadView *)self->_quadView removeQuad:self->_quad];
  quad = self->_quad;
  self->_quad = 0;

  [(CLKUIQuadView *)self->_quadView removeFromSuperview];
  quadView = self->_quadView;
  self->_quadView = 0;

  [(NTKRoundedCornerOverlayView *)self->_cornerView removeFromSuperview];
  cornerView = self->_cornerView;
  self->_cornerView = 0;
}

- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  BOOL v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKCrosswindFaceView;
  id v6 = a4;
  [(NTKCrosswindFaceView *)&v7 _renderSynchronouslyWithImageQueueDiscard:v4 inGroup:v6];
  -[CLKUIQuadView renderSynchronouslyWithImageQueueDiscard:inGroup:](self->_quadView, "renderSynchronouslyWithImageQueueDiscard:inGroup:", v4, v6, v7.receiver, v7.super_class);
}

- (void)_applyFrozen
{
  v3.receiver = self;
  v3.super_class = (Class)NTKCrosswindFaceView;
  [(NTKCrosswindFaceView *)&v3 _applyFrozen];
  [(NTKCrosswindFaceView *)self _updateFrameRate];
}

- (void)setDataMode:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKCrosswindFaceView;
  [(NTKCrosswindFaceView *)&v4 setDataMode:a3];
  [(NTKCrosswindFaceView *)self _updateFrameRate];
}

- (void)screenWillTurnOnAnimated:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKCrosswindFaceView;
  [(NTKCrosswindFaceView *)&v4 screenWillTurnOnAnimated:a3];
  [(NTKCrosswindFaceView *)self _updateFrameRate];
}

- (void)screenDidTurnOffAnimated:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKCrosswindFaceView;
  [(NTKCrosswindFaceView *)&v4 screenDidTurnOffAnimated:a3];
  [(NTKCrosswindFaceView *)self _updateFrameRate];
}

- (BOOL)_wantsStatusBarIconShadow
{
  return 1;
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKCrosswindFaceView;
  [(NTKCrosswindFaceView *)&v11 setOverrideDate:v6 duration:a4];
  NTKIdealizedDate();
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    uint64_t v8 = NTKCrosswindColorCompositionIdealized();
    uint64_t v9 = v10;
  }
  else
  {
    uint64_t v8 = -1;
    uint64_t v9 = -1;
  }
  -[NTKCrosswindQuad setOverrideDate:overrideComposition:duration:](self->_quad, "setOverrideDate:overrideComposition:duration:", v6, v8, v9, a4);
}

+ (Class)_timeViewClass
{
  return (Class)objc_opt_class();
}

- (id)timeView
{
  v4.receiver = self;
  v4.super_class = (Class)NTKCrosswindFaceView;
  v2 = [(NTKCrosswindFaceView *)&v4 timeView];

  return v2;
}

- (void)_configureTimeView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKCrosswindFaceView;
  [(NTKCrosswindFaceView *)&v4 _configureTimeView:a3];
  [(NTKCrosswindFaceView *)self _updateTimeViewColors];
}

- (id)createFaceColorPalette
{
  v2 = [[NTKCrosswindColorPalette alloc] initWithFaceClass:objc_opt_class()];

  return v2;
}

- (id)colorPalette
{
  return [(NTKCrosswindFaceView *)self faceColorPalette];
}

- (void)_loadLayoutRules
{
  v17.receiver = self;
  v17.super_class = (Class)NTKCrosswindFaceView;
  [(NTKCrosswindFaceView *)&v17 _loadLayoutRules];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_42B4;
  v16[3] = &unk_10410;
  v16[4] = self;
  objc_super v3 = objc_retainBlock(v16);
  objc_super v4 = [(NTKCrosswindFaceView *)self device];
  NTKDefaultCornerComplicationScaleForFullscreenOpaqueFaceForDevice();
  CGFloat v6 = v5;

  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeScale(&v15, v6, v6);
  id v7 = (void (*)(void *, CGAffineTransform *, void))v3[2];
  CGAffineTransform v14 = v15;
  v7(v3, &v14, 0);
  uint64_t v8 = (void (*)(void *, CGAffineTransform *, uint64_t))v3[2];
  CGAffineTransform v14 = v15;
  v8(v3, &v14, 1);
  uint64_t v9 = (void (*)(void *, CGAffineTransform *, uint64_t))v3[2];
  long long v13 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v14.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v12 = *(_OWORD *)&v14.a;
  *(_OWORD *)&v14.c = v13;
  *(_OWORD *)&v14.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  long long v11 = *(_OWORD *)&v14.tx;
  v9(v3, &v14, 3);
  uint64_t v10 = (void (*)(void *, CGAffineTransform *, uint64_t))v3[2];
  *(_OWORD *)&v14.a = v12;
  *(_OWORD *)&v14.c = v13;
  *(_OWORD *)&v14.tx = v11;
  v10(v3, &v14, 2);
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKCrosswindFaceView;
  [(NTKCrosswindFaceView *)&v7 _configureComplicationView:v6 forSlot:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 updateMonochromeColor];
  }
}

- (void)_prepareForEditing
{
  v3.receiver = self;
  v3.super_class = (Class)NTKCrosswindFaceView;
  [(NTKCrosswindFaceView *)&v3 _prepareForEditing];
  [(NTKCrosswindFaceView *)self _updateFrameRate];
}

- (void)_cleanupAfterEditing
{
  v3.receiver = self;
  v3.super_class = (Class)NTKCrosswindFaceView;
  [(NTKCrosswindFaceView *)&v3 _cleanupAfterEditing];
  [(NTKCrosswindFaceView *)self _updateFrameRate];
}

- (void)_configureForEditMode:(int64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)NTKCrosswindFaceView;
  -[NTKCrosswindFaceView _configureForEditMode:](&v13, "_configureForEditMode:");
  double v5 = [(NTKCrosswindFaceView *)self timeView];
  [(NTKCrosswindFaceView *)self _timeAlphaForEditMode:a3];
  objc_msgSend(v5, "setAlpha:");

  id v6 = [(NTKCrosswindFaceView *)self contentView];
  [(NTKCrosswindFaceView *)self _contentAlphaForEditMode:a3];
  objc_msgSend(v6, "setAlpha:");

  editingComplicationsPalette = self->_editingComplicationsPalette;
  if (a3 == 1)
  {
    if (!editingComplicationsPalette)
    {
      uint64_t v8 = [(NTKCrosswindFaceView *)self colorPalette];
      id v9 = [v8 copy];
      [v9 setIsEditingComplications:1];
      uint64_t v10 = (NTKInterpolatedColorPalette *)[objc_alloc((Class)NTKInterpolatedColorPalette) initWithFromPalette:v8 toPalette:v9];
      long long v11 = self->_editingComplicationsPalette;
      self->_editingComplicationsPalette = v10;

      editingComplicationsPalette = self->_editingComplicationsPalette;
    }
    [(NTKInterpolatedColorPalette *)editingComplicationsPalette setTransitionFraction:1.0];
    [(NTKCrosswindFaceView *)self _updateComplicationColorsWithPalette:self->_editingComplicationsPalette];
  }
  else
  {
    self->_editingComplicationsPalette = 0;

    long long v12 = [(NTKCrosswindFaceView *)self colorPalette];
    [(NTKCrosswindFaceView *)self _updateComplicationColorsWithPalette:v12];
  }
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  v16.receiver = self;
  v16.super_class = (Class)NTKCrosswindFaceView;
  -[NTKCrosswindFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](&v16, "_configureForTransitionFraction:fromEditMode:toEditMode:");
  uint64_t v8 = [(NTKCrosswindFaceView *)self timeView];
  [(NTKCrosswindFaceView *)self _timeAlphaForEditMode:a4];
  [(NTKCrosswindFaceView *)self _timeAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v8, "setAlpha:");

  id v9 = [(NTKCrosswindFaceView *)self contentView];
  [(NTKCrosswindFaceView *)self _contentAlphaForEditMode:a4];
  [(NTKCrosswindFaceView *)self _contentAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v9, "setAlpha:");

  editingComplicationsPalette = self->_editingComplicationsPalette;
  if (a4 == 1 || a5 == 1)
  {
    if (!editingComplicationsPalette)
    {
      long long v12 = [(NTKCrosswindFaceView *)self colorPalette];
      id v13 = [v12 copy];
      [v13 setIsEditingComplications:1];
      CGAffineTransform v14 = (NTKInterpolatedColorPalette *)[objc_alloc((Class)NTKInterpolatedColorPalette) initWithFromPalette:v12 toPalette:v13];
      CGAffineTransform v15 = self->_editingComplicationsPalette;
      self->_editingComplicationsPalette = v14;
    }
    CLKInterpolateBetweenFloatsClipped();
    -[NTKInterpolatedColorPalette setTransitionFraction:](self->_editingComplicationsPalette, "setTransitionFraction:");
    [(NTKCrosswindFaceView *)self _updateComplicationColorsWithPalette:self->_editingComplicationsPalette];
  }
  else
  {
    self->_editingComplicationsPalette = 0;

    long long v11 = [(NTKCrosswindFaceView *)self colorPalette];
    [(NTKCrosswindFaceView *)self _updateComplicationColorsWithPalette:v11];
  }
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  if (a4 == 10) {
    [(NTKCrosswindFaceView *)self _updateColors];
  }
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  if (a6 == 10)
  {
    id v9 = [(NTKCrosswindFaceView *)self interpolatedColorPalette];
    [(NTKCrosswindFaceView *)self _updateColorsWithPalette:v9];
  }
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)NTKCrosswindFaceView;
  -[NTKCrosswindFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v8, "_applyBreathingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4 == 10)
  {
    NTKLargeElementScaleForBreathingFraction();
    self->_breathScaleModifier = v7;
    [(NTKCrosswindFaceView *)self _updateContentTransform];
  }
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)NTKCrosswindFaceView;
  -[NTKCrosswindFaceView _applyRubberBandingFraction:forCustomEditMode:slot:](&v8, "_applyRubberBandingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4 == 10)
  {
    NTKScaleForRubberBandingFraction();
    self->_rubberBandScaleModifier = v7;
    [(NTKCrosswindFaceView *)self _updateContentTransform];
    NTKAlphaForRubberBandingFraction();
    -[NTKCrosswindFaceView setAlpha:](self, "setAlpha:");
  }
}

- (BOOL)_allowsEditingSliderEditableColorsForSlot:(id)a3
{
  return 0;
}

- (void)_updateFrameRate
{
  unsigned int v3 = [(NTKCrosswindFaceView *)self editing];
  if (v3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    unint64_t v5 = (unint64_t)[(NTKCrosswindFaceView *)self dataMode];
    unsigned __int8 v6 = [(NTKCrosswindFaceView *)self isFrozen];
    BOOL v8 = v5 != 3 && (v5 & 0xFFFFFFFFFFFFFFFBLL) != 1;
    uint64_t v4 = (v6 & 1) != 0 || v8;
  }
  [(CLKUIQuadView *)self->_quadView setPaused:v4];
  if ((v3 | [(NTKCrosswindQuad *)self->_quad isAnimatingOverrideDate]))
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = [(NTKCrosswindFaceView *)self device];
    uint64_t v9 = CLKUIAnalogHandsDefaultPreferredFramesPerSecondForDevice();
  }
  quadView = self->_quadView;

  [(CLKUIQuadView *)quadView setPreferredFramesPerSecond:v9];
}

- (void)_updateContentTransform
{
  CGFloat v3 = self->_breathScaleModifier * self->_rubberBandScaleModifier;
  memset(&v8, 0, sizeof(v8));
  CGAffineTransformMakeScale(&v8, v3, v3);
  uint64_t v4 = [(NTKCrosswindFaceView *)self contentView];
  CGAffineTransform v7 = v8;
  [v4 setTransform:&v7];

  unint64_t v5 = [(NTKCrosswindFaceView *)self timeView];
  CGAffineTransform v7 = v8;
  [v5 setTransform:&v7];

  unsigned __int8 v6 = [(NTKCrosswindFaceView *)self complicationContainerView];
  CGAffineTransform v7 = v8;
  [v6 setTransform:&v7];
}

- (void)_updateColors
{
  id v3 = [(NTKCrosswindFaceView *)self colorPalette];
  [(NTKCrosswindFaceView *)self _updateColorsWithPalette:v3];
}

- (void)_updateColorsWithPalette:(id)a3
{
  id v4 = a3;
  [(NTKCrosswindFaceView *)self _updateComplicationColorsWithPalette:v4];
  [(NTKCrosswindFaceView *)self _updateGradientColorsWithPalette:v4];
}

- (void)_updateComplicationColorsWithPalette:(id)a3
{
  id v13 = a3;
  id v4 = [v13 resolvedComplicationColor];
  [(NTKCrosswindFaceView *)self setAlternateComplicationColor:v4];
  [(NTKCrosswindFaceView *)self setComplicationColor:v4];
  [(NTKCrosswindFaceView *)self setInterpolatedComplicationColor:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v13;
    unsigned __int8 v6 = [v5 toPalette];
    if ([v6 isTritium])
    {
      [v5 transitionFraction];
      double v8 = v7;

      if (v8 > 0.0)
      {
        uint64_t v9 = [v5 baseLayerBackground];
        uint64_t v10 = +[UIColor blackColor];
        long long v11 = CLKInterpolateBetweenColors();

        long long v12 = CLKInterpolateBetweenColors();
        [(NTKCrosswindFaceView *)self setComplicationBackgroundColor:v12];

        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  uint64_t v9 = [v13 baseLayerBackground];
  [(NTKCrosswindFaceView *)self setComplicationBackgroundColor:v9];
LABEL_7:

  [(NTKCrosswindFaceView *)self _updateComplicationsWithComplicationColor];
}

- (void)_updateComplicationsWithComplicationColor
{
}

- (void)_updateGradientColorsWithPalette:(id)a3
{
  id v4 = a3;
  id v35 = [(NTKCrosswindFaceView *)self quad];
  id v5 = [v4 baseLayerBackground];
  unsigned __int8 v6 = [v4 baseLayerForeground];
  [v35 setBaseLayerBackgroundColor:v5 baseLayerForegroundColor:v6];

  double v7 = [v4 fromColor1];
  double v8 = [v4 midColor1];
  uint64_t v9 = [v4 toColor1];
  [v35 setFromColor:v7 midColor:v8 toColor:v9 forGradientIndex:0];

  uint64_t v10 = [v4 fromColor2];
  long long v11 = [v4 midColor2];
  long long v12 = [v4 toColor2];
  [v35 setFromColor:v10 midColor:v11 toColor:v12 forGradientIndex:1];

  id v13 = [v4 fromColor3];
  CGAffineTransform v14 = [v4 midColor3];
  CGAffineTransform v15 = [v4 toColor3];
  [v35 setFromColor:v13 midColor:v14 toColor:v15 forGradientIndex:2];

  objc_super v16 = [v4 fromColor4];
  objc_super v17 = [v4 midColor4];
  double v18 = [v4 toColor4];
  [v35 setFromColor:v16 midColor:v17 toColor:v18 forGradientIndex:3];

  v19 = [v4 outermostFromColor1];
  v20 = [v4 outermostMidColor1];
  v21 = [v4 outermostToColor1];
  [v35 setOutermostFromColor:v19 midColor:v20 toColor:v21 forGradientIndex:0];

  v22 = [v4 outermostFromColor2];
  v23 = [v4 outermostMidColor2];
  v24 = [v4 outermostToColor2];
  [v35 setOutermostFromColor:v22 midColor:v23 toColor:v24 forGradientIndex:1];

  v25 = [v4 outermostFromColor3];
  v26 = [v4 outermostMidColor3];
  objc_super v27 = [v4 outermostToColor3];
  [v35 setOutermostFromColor:v25 midColor:v26 toColor:v27 forGradientIndex:2];

  v28 = [v4 outermostFromColor4];
  v29 = [v4 outermostMidColor4];
  v30 = [v4 outermostToColor4];
  [v35 setOutermostFromColor:v28 midColor:v29 toColor:v30 forGradientIndex:3];

  v31 = [v4 handInlay1];
  [v35 setHandInlayColor:v31 forGradientIndex:0];

  v32 = [v4 handInlay2];
  [v35 setHandInlayColor:v32 forGradientIndex:1];

  v33 = [v4 handInlay3];
  [v35 setHandInlayColor:v33 forGradientIndex:2];

  v34 = [v4 handInlay4];

  [v35 setHandInlayColor:v34 forGradientIndex:3];
}

- (void)_updateTimeViewColors
{
  id v9 = [(NTKCrosswindFaceView *)self quad];
  id v3 = [v9 minuteHandInlayColor];
  id v4 = [v9 hourHandInlayColor];
  id v5 = [v9 minuteHandDotColor];
  unsigned __int8 v6 = [(NTKCrosswindFaceView *)self timeView];
  double v7 = [v6 minuteHandView];
  double v8 = [v6 hourHandView];
  [v7 setInlayColor:v3];
  [v8 setInlayColor:v4];
  [v7 setHandDotColor:v5];
}

- (double)_contentAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if (a3 != 1) {
    return 1.0;
  }
  return result;
}

- (NTKRoundedCornerOverlayView)cornerView
{
  return self->_cornerView;
}

- (CLKUIQuadView)quadView
{
  return self->_quadView;
}

- (NTKCrosswindQuad)quad
{
  return self->_quad;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quad, 0);
  objc_storeStrong((id *)&self->_quadView, 0);
  objc_storeStrong((id *)&self->_cornerView, 0);

  objc_storeStrong((id *)&self->_editingComplicationsPalette, 0);
}

@end