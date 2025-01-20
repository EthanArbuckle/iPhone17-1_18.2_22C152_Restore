@interface NTKPrideWeaveFaceView
- (BOOL)_wantsStatusBarIconShadow;
- (NTKPrideWeaveFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_complicationAlphaForEditMode:(int64_t)a3;
- (id)_innerComplicationColors;
- (id)_outerComplicationColors;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)colorForView:(id)a3 accented:(BOOL)a4;
- (id)filterForView:(id)a3 style:(int64_t)a4;
- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5;
- (id)filtersForView:(id)a3 style:(int64_t)a4;
- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyDataMode;
- (void)_applyFrozen;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_cleanupAfterTransitionComplicationSlot:(id)a3 selectedComplication:(id)a4;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_configureTimeView:(id)a3;
- (void)_finalizeForSnapshotting:(id)a3;
- (void)_loadLayoutRules;
- (void)_loadSnapshotContentViews;
- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)_unloadSnapshotContentViews;
- (void)_updatePausedState;
- (void)cleanupAfterEditing;
- (void)layoutSubviews;
- (void)prepareForEditing;
- (void)screenDidTurnOffAnimated:(BOOL)a3;
- (void)screenWillTurnOnAnimated:(BOOL)a3;
- (void)setAnalogHandsColor;
@end

@implementation NTKPrideWeaveFaceView

- (NTKPrideWeaveFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NTKPrideWeaveFaceView;
  v9 = [(NTKPrideWeaveFaceView *)&v14 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  if (v9)
  {
    v10 = (NTKWhistlerAnalogFaceViewComplicationFactory *)[objc_alloc((Class)NTKWhistlerAnalogFaceViewComplicationFactory) initForDevice:v8];
    faceViewComplicationFactory = v9->_faceViewComplicationFactory;
    v9->_faceViewComplicationFactory = v10;

    [(NTKPrideWeaveFaceView *)v9 setComplicationFactory:v9->_faceViewComplicationFactory];
    v12 = +[UIColor whiteColor];
    [(NTKPrideWeaveFaceView *)v9 setComplicationColor:v12];
  }
  return v9;
}

- (void)_loadSnapshotContentViews
{
  v14.receiver = self;
  v14.super_class = (Class)NTKPrideWeaveFaceView;
  [(NTKPrideWeaveFaceView *)&v14 _loadSnapshotContentViews];
  v3 = +[UIColor blackColor];
  [(NTKPrideWeaveFaceView *)self setBackgroundColor:v3];

  v4 = [(NTKPrideWeaveFaceView *)self device];
  [v4 screenBounds];
  +[CLKUIQuadView quadViewWithFrame:identifier:options:colorSpace:](CLKUIQuadView, "quadViewWithFrame:identifier:options:colorSpace:", @"PrWv", 9, 0);
  v5 = (CLKUIMetalQuadView *)objc_claimAutoreleasedReturnValue();
  quadView = self->_quadView;
  self->_quadView = v5;

  v7 = objc_alloc_init(NTKPrideWeaveBarberQuad);
  barberQuad = self->_barberQuad;
  self->_barberQuad = v7;

  v9 = objc_alloc_init(NTKPrideWeaveSpiroQuad);
  spiroQuad = self->_spiroQuad;
  self->_spiroQuad = v9;

  [(CLKUIMetalQuadView *)self->_quadView addQuad:self->_barberQuad];
  [(CLKUIMetalQuadView *)self->_quadView addQuad:self->_spiroQuad];
  [(CLKUIMetalQuadView *)self->_quadView setOpaque:1];
  LODWORD(v11) = 1.0;
  [(NTKPrideWeaveBarberQuad *)self->_barberQuad setWinding:v11];
  [(NTKPrideWeaveBarberQuad *)self->_barberQuad setRotation:0.0];
  [(NTKPrideWeaveBarberQuad *)self->_barberQuad setTimeScale:0.0];
  LODWORD(v12) = 1.0;
  [(NTKPrideWeaveSpiroQuad *)self->_spiroQuad setWinding:v12];
  [(NTKPrideWeaveSpiroQuad *)self->_spiroQuad setRotation:0.0];
  [(NTKPrideWeaveSpiroQuad *)self->_spiroQuad setTimeScale:0.0];
  v13 = [(NTKPrideWeaveFaceView *)self contentView];
  [v13 addSubview:self->_quadView];

  [(CLKUIMetalQuadView *)self->_quadView setPreferredFramesPerSecond:60];
  [(CLKUIMetalQuadView *)self->_quadView setPaused:0];
  [(NTKPrideWeaveFaceView *)self setNeedsLayout];
}

- (void)_unloadSnapshotContentViews
{
  v6.receiver = self;
  v6.super_class = (Class)NTKPrideWeaveFaceView;
  [(NTKPrideWeaveFaceView *)&v6 _unloadSnapshotContentViews];
  [(CLKUIMetalQuadView *)self->_quadView removeFromSuperview];
  barberQuad = self->_barberQuad;
  self->_barberQuad = 0;

  spiroQuad = self->_spiroQuad;
  self->_spiroQuad = 0;

  quadView = self->_quadView;
  self->_quadView = 0;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKPrideWeaveFaceView;
  [(NTKPrideWeaveFaceView *)&v3 layoutSubviews];
  [(NTKPrideWeaveFaceView *)self bounds];
  -[CLKUIMetalQuadView setFrame:](self->_quadView, "setFrame:");
}

- (void)_configureTimeView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKPrideWeaveFaceView;
  [(NTKPrideWeaveFaceView *)&v4 _configureTimeView:a3];
  [(NTKPrideWeaveFaceView *)self setAnalogHandsColor];
}

- (void)setAnalogHandsColor
{
  objc_super v3 = [(NTKPrideWeaveFaceView *)self timeView];
  objc_super v4 = +[UIColor whiteColor];
  v5 = +[UIColor blackColor];
  [v3 applyHourMinuteHandsStrokeColor:v4 fillColor:v5];

  objc_super v6 = [(NTKPrideWeaveFaceView *)self timeView];
  v7 = +[UIColor systemRedColor];
  [v6 applySecondHandColor:v7];

  id v10 = [(NTKPrideWeaveFaceView *)self timeView];
  id v8 = [v10 secondHandView];
  v9 = +[UIColor blackColor];
  [v8 setHandDotColor:v9];
}

- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  BOOL v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKPrideWeaveFaceView;
  id v6 = a4;
  [(NTKPrideWeaveFaceView *)&v7 _renderSynchronouslyWithImageQueueDiscard:v4 inGroup:v6];
  -[CLKUIMetalQuadView renderSynchronouslyWithImageQueueDiscard:inGroup:](self->_quadView, "renderSynchronouslyWithImageQueueDiscard:inGroup:", v4, v6, v7.receiver, v7.super_class);
}

- (BOOL)_wantsStatusBarIconShadow
{
  return [(NTKEditOption *)self->_currentContentOption dialShape] == (char *)&dword_0 + 1;
}

- (void)prepareForEditing
{
  v3.receiver = self;
  v3.super_class = (Class)NTKPrideWeaveFaceView;
  [(NTKPrideWeaveFaceView *)&v3 prepareForEditing];
  [(NTKPrideWeaveFaceView *)self _updatePausedState];
}

- (void)cleanupAfterEditing
{
  v3.receiver = self;
  v3.super_class = (Class)NTKPrideWeaveFaceView;
  [(NTKPrideWeaveFaceView *)&v3 cleanupAfterEditing];
  [(NTKPrideWeaveFaceView *)self _updatePausedState];
}

- (void)_applyFrozen
{
  v3.receiver = self;
  v3.super_class = (Class)NTKPrideWeaveFaceView;
  [(NTKPrideWeaveFaceView *)&v3 _applyFrozen];
  [(NTKPrideWeaveFaceView *)self _updatePausedState];
}

- (void)_applyDataMode
{
  v3.receiver = self;
  v3.super_class = (Class)NTKPrideWeaveFaceView;
  [(NTKPrideWeaveFaceView *)&v3 _applyDataMode];
  [(NTKPrideWeaveFaceView *)self _updatePausedState];
}

- (void)screenWillTurnOnAnimated:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKPrideWeaveFaceView;
  [(NTKPrideWeaveFaceView *)&v4 screenWillTurnOnAnimated:a3];
  [(NTKPrideWeaveFaceView *)self _updatePausedState];
}

- (void)screenDidTurnOffAnimated:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKPrideWeaveFaceView;
  [(NTKPrideWeaveFaceView *)&v4 screenDidTurnOffAnimated:a3];
  [(NTKPrideWeaveFaceView *)self _updatePausedState];
}

- (void)_updatePausedState
{
  if ([(NTKPrideWeaveFaceView *)self editing]) {
    goto LABEL_6;
  }
  if ([(NTKPrideWeaveFaceView *)self isFrozen])
  {
    BOOL v3 = 1;
    goto LABEL_7;
  }
  if ([(NTKPrideWeaveFaceView *)self dataMode] == (char *)&dword_0 + 1
    || [(NTKPrideWeaveFaceView *)self dataMode] == (char *)&dword_4 + 1)
  {
LABEL_6:
    BOOL v3 = 0;
  }
  else
  {
    BOOL v3 = [(NTKPrideWeaveFaceView *)self dataMode] != (char *)&dword_0 + 3;
  }
LABEL_7:
  uint64_t v4 = v3 | NTKIsScreenOn() ^ 1;
  LODWORD(v5) = 1.0;
  [(NTKPrideWeaveBarberQuad *)self->_barberQuad setTimeScale:v5];
  LODWORD(v6) = 1.0;
  [(NTKPrideWeaveSpiroQuad *)self->_spiroQuad setTimeScale:v6];
  quadView = self->_quadView;

  [(CLKUIMetalQuadView *)quadView setPaused:v4];
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  if (a4 == 12)
  {
    id v15 = v8;
    float v9 = flt_1DD98[(void)[v8 dialShape]];
    objc_storeStrong((id *)&self->_currentContentOption, a3);
    *(float *)&double v10 = v9;
    [(NTKPrideWeaveBarberQuad *)self->_barberQuad setViewMode:v10];
    *(float *)&double v11 = v9;
    [(NTKPrideWeaveSpiroQuad *)self->_spiroQuad setViewMode:v11];
    *(float *)&double v12 = 1.0 - v9;
    [(NTKPrideWeaveBarberQuad *)self->_barberQuad setThickness:v12];
    *(float *)&double v13 = v9;
    [(NTKPrideWeaveSpiroQuad *)self->_spiroQuad setThickness:v13];
    objc_super v14 = [(NTKPrideWeaveFaceView *)self delegate];
    [v14 faceViewDidChangeWantsStatusBarIconShadow];

    id v8 = v15;
  }
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  if (a6 == 12)
  {
    uint64_t v27 = v13;
    uint64_t v28 = v9;
    uint64_t v29 = v8;
    uint64_t v30 = v7;
    id v17 = a5;
    [a4 dialShape];
    [v17 dialShape];

    CLKInterpolateBetweenFloatsUnclipped();
    float v19 = v18;
    *(float *)&double v18 = v19;
    [(NTKPrideWeaveBarberQuad *)self->_barberQuad setViewMode:v18];
    *(float *)&double v20 = v19;
    [(NTKPrideWeaveSpiroQuad *)self->_spiroQuad setViewMode:v20];
    double v21 = 0.0;
    if ((float)(v19 + v19) < 1.0) {
      *(float *)&double v21 = 1.0 - (float)(v19 + v19);
    }
    -[NTKPrideWeaveBarberQuad setThickness:](self->_barberQuad, "setThickness:", v21, v14, v27, v10, v28, v29, v30, v11);
    spiroQuad = self->_spiroQuad;
    double v23 = 1.0 - v19 + 1.0 - v19;
    double v24 = 1.0 - v23;
    BOOL v25 = v23 < 1.0;
    double v26 = 0.0;
    if (v25) {
      double v26 = v24;
    }
    *(float *)&double v26 = v26;
    [(NTKPrideWeaveSpiroQuad *)spiroQuad setThickness:v26];
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
  id v8 = [(NTKPrideWeaveFaceView *)self complicationContainerView];
  [(NTKPrideWeaveFaceView *)self _complicationAlphaForEditMode:a4];
  [(NTKPrideWeaveFaceView *)self _complicationAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v8, "setAlpha:");
}

- (void)_cleanupAfterTransitionComplicationSlot:(id)a3 selectedComplication:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)NTKPrideWeaveFaceView;
  [(NTKPrideWeaveFaceView *)&v4 _cleanupAfterTransitionComplicationSlot:a3 selectedComplication:a4];
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v5.receiver = self;
  v5.super_class = (Class)NTKPrideWeaveFaceView;
  [(NTKPrideWeaveFaceView *)&v5 _applyRubberBandingFraction:a4 forCustomEditMode:a5 slot:a3];
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v5.receiver = self;
  v5.super_class = (Class)NTKPrideWeaveFaceView;
  [(NTKPrideWeaveFaceView *)&v5 _applyBreathingFraction:a4 forCustomEditMode:a5 slot:a3];
}

- (void)_loadLayoutRules
{
  faceViewComplicationFactory = self->_faceViewComplicationFactory;
  id v8 = [(NTKPrideWeaveFaceView *)self device];
  [v8 screenBounds];
  double v5 = v4;
  double v6 = [(NTKPrideWeaveFaceView *)self device];
  [v6 screenScale];
  [(NTKWhistlerAnalogFaceViewComplicationFactory *)faceViewComplicationFactory loadLayoutRulesForFaceView:self dialDiameter:v5 * v7];
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

- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  id v6 = [(NTKPrideWeaveFaceView *)self _outerComplicationColors];
  double v7 = [(NTKPrideWeaveFaceView *)self _innerComplicationColors];
  id v8 = CLKUIMonochromeFiltersForStyleWithTintedBackground();

  return v8;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4
{
  return [(NTKPrideWeaveFaceView *)self filtersForView:a3 style:a4 fraction:1.0];
}

- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  double v7 = [(NTKPrideWeaveFaceView *)self _outerComplicationColors];
  id v8 = [(NTKPrideWeaveFaceView *)self _innerComplicationColors];
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
  id v6 = [(NTKPrideWeaveFaceView *)self _outerComplicationColors];
  double v7 = [(NTKPrideWeaveFaceView *)self _innerComplicationColors];
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
    [(NTKPrideWeaveFaceView *)self _innerComplicationColors];
  }
  else {
  double v4 = [(NTKPrideWeaveFaceView *)self _outerComplicationColors];
  }

  return v4;
}

- (id)_outerComplicationColors
{
  return +[UIColor whiteColor];
}

- (id)_innerComplicationColors
{
  return +[UIColor colorWithWhite:0.7 alpha:1.0];
}

- (void)_finalizeForSnapshotting:(id)a3
{
  barberQuad = self->_barberQuad;
  id v7 = a3;
  LODWORD(v5) = 1.0;
  [(NTKPrideWeaveBarberQuad *)barberQuad setWinding:v5];
  [(NTKPrideWeaveBarberQuad *)self->_barberQuad setRotation:0.0];
  LODWORD(v6) = 1.0;
  [(NTKPrideWeaveSpiroQuad *)self->_spiroQuad setWinding:v6];
  [(NTKPrideWeaveSpiroQuad *)self->_spiroQuad setRotation:0.0];
  [(NTKSpringCrownHandler *)self->_barberCrownHandler setCurrentPosition:1.0];
  [(NTKSpringCrownHandler *)self->_spiroCrownHandler setCurrentPosition:1.0];
  [(CLKUIMetalQuadView *)self->_quadView renderSynchronouslyWithImageQueueDiscard:1 inGroup:0 completion:v7];
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = +[NTKPrideSwatchMappedImageCache keyForFaceStyle:@"NTKPrideWeaveFace" editOption:v6 mode:a4 selectedOptions:0];
    int64_t v8 = +[NTKPrideSwatchMappedImageCache sharedCache];
    int64_t v9 = [v8 imageForKey:v7];

    if (!v9)
    {
      uint64_t v10 = [NTKPrideWeaveFaceView alloc];
      uint64_t v11 = +[CLKDevice currentDevice];
      uint64_t v12 = [(NTKPrideWeaveFaceView *)v10 initWithFaceStyle:44 forDevice:v11 clientIdentifier:0];

      [v12 _loadSnapshotContentViews];
      +[NTKEditOption sizeForSwatchStyle:3];
      double v14 = v13;
      double v16 = v15;
      id v17 = +[UIScreen mainScreen];
      [v17 nativeScale];
      double v19 = v18;

      objc_msgSend(v12, "setBounds:", 0.0, 0.0, v14, v16);
      [v12 layoutSubviews];
      [v12 _applyOption:v6 forCustomEditMode:a4 slot:0];
      int64_t v9 = objc_msgSend(v12[1], "snapshotInRect:scale:time:", 0.0, 0.0, v14, v16, v19, 0.0);
      double v20 = +[NTKPrideSwatchMappedImageCache sharedCache];
      [v20 setImage:v9 forKey:v7];
    }
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentContentOption, 0);
  objc_storeStrong((id *)&self->_currentConfig, 0);
  objc_storeStrong((id *)&self->_faceViewComplicationFactory, 0);
  objc_storeStrong((id *)&self->_tritiumSnapshot, 0);
  objc_storeStrong((id *)&self->_spiroCrownHandler, 0);
  objc_storeStrong((id *)&self->_barberCrownHandler, 0);
  objc_storeStrong((id *)&self->_tritiumSnapshotView, 0);
  objc_storeStrong((id *)&self->_spiroQuad, 0);
  objc_storeStrong((id *)&self->_barberQuad, 0);

  objc_storeStrong((id *)&self->_quadView, 0);
}

@end