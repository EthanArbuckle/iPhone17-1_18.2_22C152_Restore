@interface NTKGreyhoundFaceView
+ (id)swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
- (BOOL)_wantsStatusBarIconShadow;
- (NTKGreyhoundContentView)greyhoundContentView;
- (NTKGreyhoundFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (NTKRoundedCornerOverlayView)cornerView;
- (UIView)backgroundView;
- (UIView)contentContainerView;
- (double)_complicationAlphaForEditMode:(int64_t)a3;
- (double)_contentImageViewAlphaForEditMode:(int64_t)a3;
- (double)_contentsScaleForDensity:(unint64_t)a3 statusBar:(BOOL)a4;
- (double)_timeAlphaForEditMode:(int64_t)a3;
- (double)_verticalPaddingForStatusBar;
- (double)breathingFraction;
- (double)rubberbandingFraction;
- (double)tritiumScale;
- (id)_complicationColorForEditMode:(int64_t)a3;
- (id)_complicationFontForTypeface:(unint64_t)a3;
- (id)_complicationFontForTypeface:(unint64_t)a3 complicationType:(unint64_t)a4;
- (id)_complicationFontForTypeface:(unint64_t)a3 fontSize:(double)a4 fontWeight:(double)a5 useNumeralsFont:(BOOL)a6;
- (id)_dialComplicationView;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)createFaceColorPalette;
- (id)palette;
- (unint64_t)density;
- (unint64_t)style;
- (unint64_t)typeface;
- (void)_applyBreathingAndRubberbandingScale;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberbandingAlpha;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_cleanupComplicationTransition;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_configureTimeView:(id)a3;
- (void)_loadContentViews;
- (void)_loadCurrentComplicationFont;
- (void)_loadSnapshotContentViews;
- (void)_prepareForStatusChange:(BOOL)a3;
- (void)_unloadContentViews;
- (void)_unloadSnapshotContentViews;
- (void)_updateComplicationCenterOffsetForStyle:(unint64_t)a3;
- (void)_updateContentViewColorsWithPalette:(id)a3;
- (void)_updateDialComplicationWithFont:(id)a3;
- (void)_updateDialComplicationWithTextColor:(id)a3;
- (void)layoutSubviews;
- (void)setBackgroundView:(id)a3;
- (void)setBreathingFraction:(double)a3;
- (void)setContentContainerView:(id)a3;
- (void)setCornerView:(id)a3;
- (void)setDensity:(unint64_t)a3;
- (void)setGreyhoundContentView:(id)a3;
- (void)setRubberbandingFraction:(double)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setTritiumScale:(double)a3;
- (void)setTypeface:(unint64_t)a3;
@end

@implementation NTKGreyhoundFaceView

- (NTKGreyhoundFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)NTKGreyhoundFaceView;
  v5 = [(NTKGreyhoundFaceView *)&v8 initWithFaceStyle:a3 forDevice:a4 clientIdentifier:a5];
  if (v5)
  {
    id v6 = objc_alloc_init((Class)NTKSimpleTextFaceViewComplicationFactory);
    [v6 setFaceView:v5];
    [(NTKGreyhoundFaceView *)v5 setComplicationFactory:v6];
  }
  return v5;
}

- (void)_configureTimeView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKGreyhoundFaceView;
  id v3 = a3;
  [(NTKGreyhoundFaceView *)&v6 _configureTimeView:v3];
  v4 = +[UIColor blackColor];
  v5 = [v3 secondHandView];

  [v5 setHandDotColor:v4];
}

- (void)_loadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKGreyhoundFaceView;
  [(NTKGreyhoundFaceView *)&v3 _loadSnapshotContentViews];
  [(NTKGreyhoundFaceView *)self _loadContentViews];
}

- (void)_unloadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKGreyhoundFaceView;
  [(NTKGreyhoundFaceView *)&v3 _unloadSnapshotContentViews];
  [(NTKGreyhoundFaceView *)self _unloadContentViews];
}

- (id)createFaceColorPalette
{
  id v2 = objc_alloc_init((Class)NTKCaliforniaColorPalette);

  return v2;
}

- (id)palette
{
  return [(NTKGreyhoundFaceView *)self faceColorPalette];
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)NTKGreyhoundFaceView;
  [(NTKGreyhoundFaceView *)&v7 layoutSubviews];
  backgroundView = self->_backgroundView;
  [(NTKGreyhoundFaceView *)self bounds];
  -[UIView ntk_setBoundsAndPositionFromFrame:](backgroundView, "ntk_setBoundsAndPositionFromFrame:");
  contentContainerView = self->_contentContainerView;
  [(NTKGreyhoundFaceView *)self bounds];
  -[UIView ntk_setBoundsAndPositionFromFrame:](contentContainerView, "ntk_setBoundsAndPositionFromFrame:");
  greyhoundContentView = self->_greyhoundContentView;
  objc_super v6 = [(NTKGreyhoundFaceView *)self contentView];
  [v6 bounds];
  -[NTKGreyhoundContentView ntk_setBoundsAndPositionFromFrame:](greyhoundContentView, "ntk_setBoundsAndPositionFromFrame:");
}

- (void)_loadContentViews
{
  if (!self->_backgroundView)
  {
    objc_super v3 = (UIView *)objc_opt_new();
    backgroundView = self->_backgroundView;
    self->_backgroundView = v3;

    v5 = [(NTKGreyhoundFaceView *)self contentView];
    [v5 addSubview:self->_backgroundView];
  }
  if (!self->_contentContainerView)
  {
    objc_super v6 = (UIView *)objc_opt_new();
    contentContainerView = self->_contentContainerView;
    self->_contentContainerView = v6;

    [(UIView *)self->_backgroundView addSubview:self->_contentContainerView];
  }
  if (!self->_greyhoundContentView)
  {
    objc_super v8 = [NTKGreyhoundContentView alloc];
    v9 = [(NTKGreyhoundFaceView *)self contentView];
    [v9 bounds];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    v18 = [(NTKGreyhoundFaceView *)self device];
    unint64_t style = self->_style;
    unint64_t density = self->_density;
    unint64_t typeface = self->_typeface;
    v22 = [(NTKGreyhoundFaceView *)self palette];
    v23 = -[NTKGreyhoundContentView initWithFrame:device:style:density:typeface:colorPalette:](v8, "initWithFrame:device:style:density:typeface:colorPalette:", v18, style, density, typeface, v22, v11, v13, v15, v17);
    greyhoundContentView = self->_greyhoundContentView;
    self->_greyhoundContentView = v23;

    [(UIView *)self->_contentContainerView addSubview:self->_greyhoundContentView];
    CGFloat sx = 0.0;
    memset(v43, 0, sizeof(v43));
    v25 = [(NTKGreyhoundFaceView *)self device];
    sub_D850(v25, (uint64_t)v43);

    CGAffineTransformMakeScale(&v42, sx, sx);
    v26 = self->_greyhoundContentView;
    CGAffineTransform v41 = v42;
    [(NTKGreyhoundContentView *)v26 setTransform:&v41];
  }
  if (!self->_cornerView)
  {
    id v27 = objc_alloc((Class)NTKRoundedCornerOverlayView);
    v28 = [(NTKGreyhoundFaceView *)self contentView];
    [v28 bounds];
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    v37 = [(NTKGreyhoundFaceView *)self device];
    v38 = (NTKRoundedCornerOverlayView *)objc_msgSend(v27, "initWithFrame:forDeviceCornerRadius:", v37, v30, v32, v34, v36);
    cornerView = self->_cornerView;
    self->_cornerView = v38;

    v40 = [(NTKGreyhoundFaceView *)self contentView];
    [v40 addSubview:self->_cornerView];
  }
}

- (void)_unloadContentViews
{
  [(NTKGreyhoundContentView *)self->_greyhoundContentView removeFromSuperview];
  greyhoundContentView = self->_greyhoundContentView;
  self->_greyhoundContentView = 0;

  [(UIView *)self->_contentContainerView removeFromSuperview];
  contentContainerView = self->_contentContainerView;
  self->_contentContainerView = 0;

  [(UIView *)self->_backgroundView removeFromSuperview];
  backgroundView = self->_backgroundView;
  self->_backgroundView = 0;

  [(NTKRoundedCornerOverlayView *)self->_cornerView removeFromSuperview];
  cornerView = self->_cornerView;
  self->_cornerView = 0;
}

- (void)_updateContentViewColorsWithPalette:(id)a3
{
  greyhoundContentView = self->_greyhoundContentView;
  id v5 = a3;
  [(NTKGreyhoundContentView *)greyhoundContentView setColorPalette:v5];
  objc_super v6 = [v5 background];
  [(UIView *)self->_backgroundView setBackgroundColor:v6];

  objc_super v7 = [(NTKGreyhoundFaceView *)self timeView];
  objc_super v8 = [v5 clockHands];
  v9 = [v5 clockHandsInlay];
  [v7 applyHourMinuteHandsStrokeColor:v8 fillColor:v9];

  double v10 = [(NTKGreyhoundFaceView *)self timeView];
  double v11 = [v5 secondHand];
  [v10 applySecondHandColor:v11];

  id v12 = [v5 digit];

  [(NTKGreyhoundFaceView *)self _updateDialComplicationWithTextColor:v12];
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NTKGreyhoundFaceView;
  [(NTKGreyhoundFaceView *)&v14 _configureComplicationView:v6 forSlot:a4];
  objc_super v7 = [(NTKGreyhoundFaceView *)self optionForCustomEditMode:13 slot:0];
  id v8 = [v7 typeface];

  v9 = [(NTKGreyhoundFaceView *)self _complicationColorForEditMode:[(NTKGreyhoundFaceView *)self editing]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v6;
    double v11 = [v10 label];
    [v11 setTextColor:v9];

    id v12 = [v10 complicationType];
LABEL_5:
    double v13 = [(NTKGreyhoundFaceView *)self _complicationFontForTypeface:v8 complicationType:v12];
    [v6 setFont:v13];

    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v6 setTextColor:v9];
    id v12 = &stru_20 + 13;
    goto LABEL_5;
  }
LABEL_6:
}

- (id)_dialComplicationView
{
  id v2 = [(NTKGreyhoundFaceView *)self normalComplicationDisplayWrapperForSlot:NTKComplicationSlotSubdialTop];
  objc_super v3 = [v2 display];

  return v3;
}

- (void)_loadCurrentComplicationFont
{
  id v3 = [(NTKGreyhoundFaceView *)self _complicationFontForTypeface:self->_typeface];
  -[NTKGreyhoundFaceView _updateDialComplicationWithFont:](self, "_updateDialComplicationWithFont:");
  if (self->_density == 1) {
    [(NTKGreyhoundFaceView *)self _cleanupComplicationTransition];
  }
}

- (void)_cleanupComplicationTransition
{
  if ([(NTKGreyhoundFaceView *)self editing])
  {
    id v3 = [(NTKGreyhoundFaceView *)self dialComplicationContainerView];
    [v3 setAlpha:1.0];

    v4 = [(NTKGreyhoundFaceView *)self dialComplicationContainerView];
    long long v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v6[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v6[1] = v5;
    v6[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [v4 setTransform:v6];
  }
}

- (void)_updateDialComplicationWithFont:(id)a3
{
  id v5 = a3;
  v4 = [(NTKGreyhoundFaceView *)self _dialComplicationView];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    [v4 setFont:v5];
  }
}

- (void)_updateDialComplicationWithTextColor:(id)a3
{
  id v6 = a3;
  v4 = [(NTKGreyhoundFaceView *)self _dialComplicationView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 label];
    [v5 setTextColor:v6];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v4 setTextColor:v6];
    }
  }
}

- (id)_complicationFontForTypeface:(unint64_t)a3
{
  id v5 = [(NTKGreyhoundFaceView *)self _dialComplicationView];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = [v5 complicationType];
  }
  else {
    id v6 = &stru_20 + 13;
  }
  objc_super v7 = [(NTKGreyhoundFaceView *)self _complicationFontForTypeface:a3 complicationType:v6];

  return v7;
}

- (id)_complicationFontForTypeface:(unint64_t)a3 complicationType:(unint64_t)a4
{
  uint64_t v15 = 0;
  long long v13 = 0u;
  memset(v14, 0, sizeof(v14));
  objc_super v7 = [(NTKGreyhoundFaceView *)self device];
  sub_D850(v7, (uint64_t)&v13);

  if (a4 == 3)
  {
    double v8 = *(double *)&v13;
    v9 = (double *)v14;
    goto LABEL_6;
  }
  if (a4 == 45 || a4 == 4)
  {
    double v8 = *((double *)&v13 + 1);
    v9 = (double *)v14 + 1;
LABEL_6:
    uint64_t v10 = 1;
    goto LABEL_8;
  }
  uint64_t v10 = 0;
  double v8 = *(double *)&v13;
  v9 = (double *)v14;
LABEL_8:
  double v11 = *v9;

  return [(NTKGreyhoundFaceView *)self _complicationFontForTypeface:a3 fontSize:v10 fontWeight:v8 useNumeralsFont:v11];
}

- (id)_complicationFontForTypeface:(unint64_t)a3 fontSize:(double)a4 fontWeight:(double)a5 useNumeralsFont:(BOOL)a6
{
  BOOL v6 = a6;
  if (qword_1B6D0 != -1) {
    dispatch_once(&qword_1B6D0, &stru_14608);
  }
  uint64_t v10 = +[NSNumber numberWithBool:v6];
  double v11 = +[NSString stringWithFormat:@"%lu-%f-%f-%@", a3, *(void *)&a4, *(void *)&a5, v10];

  id v12 = [(id)qword_1B6D8 objectForKey:v11];
  if (!v12)
  {
    if (a3 == 2)
    {
      objc_super v14 = (const UIFontDescriptorSystemDesign *)&CLKRoundedFontDesignName;
    }
    else
    {
      if (a3 == 1)
      {
        if (v6)
        {
          double v16 = +[NTKGreyhoundFontLoader sfNumeralsHeavyFontDescriptor];
          id v12 = +[CLKFont fontWithDescriptor:v16 size:a4];

          if (v12) {
            goto LABEL_17;
          }
        }
        uint64_t v15 = +[CLKFont compactSoftFontOfSize:a4 weight:a5];
        goto LABEL_15;
      }
      if (a3)
      {
        id v12 = 0;
        goto LABEL_17;
      }
      if (v6)
      {
        long long v13 = +[NTKGreyhoundFontLoader nyNumeralsHeavyFontDescriptor];
        id v12 = +[CLKFont fontWithDescriptor:v13 size:a4];

        if (v12) {
          goto LABEL_17;
        }
      }
      objc_super v14 = &UIFontDescriptorSystemDesignSerif;
    }
    uint64_t v15 = +[CLKFont systemFontOfSize:*v14 weight:a4 design:a5];
LABEL_15:
    id v12 = (void *)v15;
LABEL_17:
    [(id)qword_1B6D8 setObject:v12 forKey:v11];
  }

  return v12;
}

- (void)_updateComplicationCenterOffsetForStyle:(unint64_t)a3
{
  uint64_t v11 = 0;
  memset(v10, 0, sizeof(v10));
  memset(v9, 0, sizeof(v9));
  id v5 = [(NTKGreyhoundFaceView *)self device];
  sub_D850(v5, (uint64_t)v9);

  BOOL v6 = (double *)v10 + 1;
  if (a3 != 4) {
    BOOL v6 = (double *)v10;
  }
  double v7 = *v6;
  id v8 = [(NTKGreyhoundFaceView *)self complicationFactory];
  [v8 verticalCenterOffset];
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    [v8 setVerticalCenterOffset:v7];
    [(NTKGreyhoundFaceView *)self invalidateComplicationLayout];
    [(NTKGreyhoundFaceView *)self layoutIfNeeded];
    [(NTKGreyhoundFaceView *)self layoutComplicationViews];
  }
}

- (BOOL)_wantsStatusBarIconShadow
{
  id v2 = [(NTKGreyhoundFaceView *)self palette];
  char v3 = [v2 isBlackBackground] ^ 1;

  return v3;
}

- (double)_verticalPaddingForStatusBar
{
  return 1.0;
}

- (void)_prepareForStatusChange:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = 0.95;
  if (a3) {
    double v5 = 1.0;
  }
  [(NTKGreyhoundFaceView *)self setTritiumScale:v5];
  if (([(NTKGreyhoundFaceView *)self editing] & 1) == 0)
  {
    [(NTKGreyhoundFaceView *)self _contentsScaleForDensity:self->_density statusBar:v3];
    memset(&v10, 0, sizeof(v10));
    if (v6 == 1.0)
    {
      long long v7 = *(_OWORD *)&CGAffineTransformIdentity.c;
      *(_OWORD *)&v10.a = *(_OWORD *)&CGAffineTransformIdentity.a;
      *(_OWORD *)&v10.c = v7;
      *(_OWORD *)&v10.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    }
    else
    {
      CGAffineTransformMakeScale(&v10, v6, v6);
    }
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    CGAffineTransform v9 = v10;
    v8[2] = sub_E508;
    v8[3] = &unk_14630;
    v8[4] = self;
    +[UIView animateWithDuration:v8 animations:0.3];
  }
}

- (double)_contentsScaleForDensity:(unint64_t)a3 statusBar:(BOOL)a4
{
  BOOL v4 = a4;
  double v12 = 0.0;
  CGFloat v6 = [(NTKGreyhoundFaceView *)self device];
  sub_D850(v6, (uint64_t)&v10);

  double v7 = 1.0;
  if (v4)
  {
    if (self->_density) {
      id v8 = (double *)&v11;
    }
    else {
      id v8 = (double *)&v11 + 1;
    }
    double v7 = *v8;
  }
  return v7 * v12;
}

- (void)_configureForEditMode:(int64_t)a3
{
  v16.receiver = self;
  v16.super_class = (Class)NTKGreyhoundFaceView;
  -[NTKGreyhoundFaceView _configureForEditMode:](&v16, "_configureForEditMode:");
  double v5 = [(NTKGreyhoundFaceView *)self palette];
  [(NTKGreyhoundFaceView *)self _updateContentViewColorsWithPalette:v5];

  [(NTKGreyhoundFaceView *)self _loadCurrentComplicationFont];
  CGFloat v6 = [(NTKGreyhoundFaceView *)self _complicationColorForEditMode:a3];
  [(NTKGreyhoundFaceView *)self _updateDialComplicationWithTextColor:v6];

  [(NTKGreyhoundFaceView *)self _timeAlphaForEditMode:a3];
  double v8 = v7;
  CGAffineTransform v9 = [(NTKGreyhoundFaceView *)self timeView];
  [v9 setAlpha:v8];

  [(NTKGreyhoundFaceView *)self _complicationAlphaForEditMode:a3];
  double v11 = v10;
  double v12 = [(NTKGreyhoundFaceView *)self complicationContainerView];
  [v12 setAlpha:v11];

  [(NTKGreyhoundFaceView *)self _contentImageViewAlphaForEditMode:a3];
  double v14 = v13;
  uint64_t v15 = [(NTKGreyhoundFaceView *)self contentView];
  [v15 setAlpha:v14];
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  v20.receiver = self;
  v20.super_class = (Class)NTKGreyhoundFaceView;
  -[NTKGreyhoundFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](&v20, "_configureForTransitionFraction:fromEditMode:toEditMode:");
  [(NTKGreyhoundFaceView *)self _timeAlphaForEditMode:a4];
  [(NTKGreyhoundFaceView *)self _timeAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v9 = v8;
  double v10 = [(NTKGreyhoundFaceView *)self timeView];
  [v10 setAlpha:v9];

  [(NTKGreyhoundFaceView *)self _complicationAlphaForEditMode:a4];
  [(NTKGreyhoundFaceView *)self _complicationAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v12 = v11;
  double v13 = [(NTKGreyhoundFaceView *)self complicationContainerView];
  [v13 setAlpha:v12];

  [(NTKGreyhoundFaceView *)self _contentImageViewAlphaForEditMode:a4];
  [(NTKGreyhoundFaceView *)self _contentImageViewAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v15 = v14;
  objc_super v16 = [(NTKGreyhoundFaceView *)self contentView];
  [v16 setAlpha:v15];

  if (self->_density == 1)
  {
    double v17 = [(NTKGreyhoundFaceView *)self _complicationColorForEditMode:a4];
    v18 = [(NTKGreyhoundFaceView *)self _complicationColorForEditMode:a5];
    v19 = NTKInterpolateBetweenColors();
    [(NTKGreyhoundFaceView *)self _updateDialComplicationWithTextColor:v19];
  }
}

- (double)_timeAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if (!a3) {
    return 1.0;
  }
  return result;
}

- (double)_complicationAlphaForEditMode:(int64_t)a3
{
  double result = 1.0;
  if (a3 && a3 != 11)
  {
    if (self->_density)
    {
      double result = NTKEditModeDimmedAlpha;
      if (a3 != 15) {
        return 1.0;
      }
    }
    else
    {
      return 0.0;
    }
  }
  return result;
}

- (double)_contentImageViewAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if (a3 != 1) {
    return 1.0;
  }
  return result;
}

- (id)_complicationColorForEditMode:(int64_t)a3
{
  if (a3 == 1)
  {
    BOOL v3 = +[UIColor colorWithWhite:0.95 alpha:1.0];
  }
  else
  {
    BOOL v4 = [(NTKGreyhoundFaceView *)self palette];
    BOOL v3 = [v4 digit];
  }

  return v3;
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NTKGreyhoundFaceView;
  [(NTKGreyhoundFaceView *)&v14 _applyOption:v8 forCustomEditMode:a4 slot:a5];
  switch(a4)
  {
    case 10:
      double v9 = [(NTKGreyhoundFaceView *)self palette];
      [(NTKGreyhoundFaceView *)self _updateContentViewColorsWithPalette:v9];

      double v10 = [(NTKGreyhoundFaceView *)self delegate];
      [v10 faceViewDidChangeWantsStatusBarIconShadow];

      break;
    case 11:
      id v11 = [v8 density];
      self->_unint64_t density = (unint64_t)v11;
      [(NTKGreyhoundContentView *)self->_greyhoundContentView setDensity:v11];
      break;
    case 13:
      id v12 = [v8 typeface];
      self->_unint64_t typeface = (unint64_t)v12;
      [(NTKGreyhoundContentView *)self->_greyhoundContentView setTypeface:v12];
      [(NTKGreyhoundFaceView *)self _loadCurrentComplicationFont];
      break;
    case 15:
      id v13 = [v8 style];
      self->_unint64_t style = (unint64_t)v13;
      [(NTKGreyhoundContentView *)self->_greyhoundContentView setStyle:v13];
      [(NTKGreyhoundFaceView *)self _updateComplicationCenterOffsetForStyle:self->_style];
      break;
    default:
      break;
  }
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  v56.receiver = self;
  v56.super_class = (Class)NTKGreyhoundFaceView;
  [(NTKGreyhoundFaceView *)&v56 _applyTransitionFraction:v12 fromOption:v13 toOption:a6 forCustomEditMode:a7 slot:a3];
  switch(a6)
  {
    case 10:
      objc_super v14 = [(NTKGreyhoundFaceView *)self interpolatedColorPalette];
      double v15 = [v14 fromPalette];
      objc_super v16 = [v14 toPalette];
      if (([v15 isEqual:v16] & 1) == 0) {
        [(NTKGreyhoundFaceView *)self _updateContentViewColorsWithPalette:v14];
      }

      goto LABEL_19;
    case 11:
      id v17 = [v12 density];
      id v18 = [v13 density];
      if (v17 == v18) {
        goto LABEL_25;
      }
      id v19 = v18;
      if (a3 >= 0.5)
      {
        CLKMapFractionIntoRange();
        double v20 = v33;
        double v22 = v33;
        id v23 = v19;
      }
      else
      {
        double v20 = 0.0;
        CLKMapFractionIntoRange();
        double v22 = v21;
        id v23 = v17;
      }
      [(NTKGreyhoundFaceView *)self _contentsScaleForDensity:v17 statusBar:0];
      [(NTKGreyhoundFaceView *)self _contentsScaleForDensity:v19 statusBar:0];
      CLKInterpolateBetweenFloatsClipped();
      CLKMapFractionIntoRange();
      memset(&v55, 0, sizeof(v55));
      CGAffineTransformMakeScale(&v55, v34, v34);
      [(NTKGreyhoundContentView *)self->_greyhoundContentView setDensity:v23];
      [(NTKGreyhoundContentView *)self->_greyhoundContentView setAlpha:v22];
      CGAffineTransform v54 = v55;
      [(NTKGreyhoundContentView *)self->_greyhoundContentView setTransform:&v54];
      double v35 = [(NTKGreyhoundFaceView *)self dialComplicationContainerView];
      [v35 setAlpha:v20];

      CGAffineTransform v53 = v55;
      double v36 = [(NTKGreyhoundFaceView *)self dialComplicationContainerView];
      v37 = v36;
      CGAffineTransform v52 = v53;
      v38 = &v52;
      break;
    case 13:
      id v24 = [v12 typeface];
      id v25 = [v13 typeface];
      if (v24 != v25)
      {
        if (a3 >= 0.5)
        {
          id v39 = v25;
          CLKMapFractionIntoRange();
          double v27 = v40;
          id v24 = v39;
        }
        else
        {
          CLKMapFractionIntoRange();
          double v27 = v26;
        }
        objc_super v14 = [(NTKGreyhoundFaceView *)self _complicationFontForTypeface:v24];
        [(NTKGreyhoundFaceView *)self _contentsScaleForDensity:self->_density statusBar:0];
        CLKMapFractionIntoRange();
        memset(&v55, 0, sizeof(v55));
        CGAffineTransformMakeScale(&v55, v41, v41);
        [(NTKGreyhoundFaceView *)self _updateDialComplicationWithFont:v14];
        [(NTKGreyhoundContentView *)self->_greyhoundContentView setTypeface:v24];
        [(NTKGreyhoundContentView *)self->_greyhoundContentView setAlpha:v27];
        CGAffineTransform v51 = v55;
        [(NTKGreyhoundContentView *)self->_greyhoundContentView setTransform:&v51];
        if (self->_density == 1)
        {
          CGAffineTransform v42 = [(NTKGreyhoundFaceView *)self dialComplicationContainerView];
          [v42 setAlpha:v27];

          CGAffineTransform v50 = v55;
          v43 = [(NTKGreyhoundFaceView *)self dialComplicationContainerView];
          CGAffineTransform v49 = v50;
          [v43 setTransform:&v49];
        }
LABEL_19:
      }
      goto LABEL_25;
    case 15:
      v28 = (int *)[v12 style];
      double v29 = (int *)[v13 style];
      if (v28 == v29) {
        goto LABEL_25;
      }
      double v30 = v29;
      CLKMapFractionIntoRange();
      if (a3 >= 0.5)
      {
        double v32 = v31;
        v28 = v30;
      }
      else
      {
        double v32 = v31;
      }
      [(NTKGreyhoundFaceView *)self _contentsScaleForDensity:self->_density statusBar:0];
      CLKMapFractionIntoRange();
      memset(&v55, 0, sizeof(v55));
      CGAffineTransformMakeScale(&v55, v44, v44);
      [(NTKGreyhoundContentView *)self->_greyhoundContentView setStyle:v28];
      [(NTKGreyhoundContentView *)self->_greyhoundContentView setAlpha:v32];
      CGAffineTransform v48 = v55;
      [(NTKGreyhoundContentView *)self->_greyhoundContentView setTransform:&v48];
      [(NTKGreyhoundFaceView *)self _updateComplicationCenterOffsetForStyle:v28];
      if (v30 != &dword_4 || self->_density != 1) {
        goto LABEL_25;
      }
      v45 = [(NTKGreyhoundFaceView *)self dialComplicationContainerView];
      [v45 setAlpha:v32];

      CGAffineTransform v47 = v55;
      double v36 = [(NTKGreyhoundFaceView *)self dialComplicationContainerView];
      v37 = v36;
      CGAffineTransform v46 = v47;
      v38 = &v46;
      break;
    default:
      goto LABEL_25;
  }
  objc_msgSend(v36, "setTransform:", v38, *(_OWORD *)&v46.a, *(_OWORD *)&v46.c, *(_OWORD *)&v46.tx);

LABEL_25:
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)NTKGreyhoundFaceView;
  -[NTKGreyhoundFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v8, "_applyBreathingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4)
  {
    self->_breathingFraction = a3;
    [(NTKGreyhoundFaceView *)self _applyBreathingAndRubberbandingScale];
  }
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)NTKGreyhoundFaceView;
  -[NTKGreyhoundFaceView _applyRubberBandingFraction:forCustomEditMode:slot:](&v8, "_applyRubberBandingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4)
  {
    self->_rubberbandingFraction = a3;
    [(NTKGreyhoundFaceView *)self _applyBreathingAndRubberbandingScale];
    [(NTKGreyhoundFaceView *)self _applyRubberbandingAlpha];
  }
}

- (void)_applyBreathingAndRubberbandingScale
{
  NTKLargeElementScaleForBreathingFraction();
  double v4 = v3;
  NTKScaleForRubberBandingFraction();
  memset(&v10, 0, sizeof(v10));
  CGAffineTransformMakeScale(&v10, v4 * v5, v4 * v5);
  CGFloat v6 = [(NTKGreyhoundFaceView *)self contentView];
  CGAffineTransform v9 = v10;
  [v6 setTransform:&v9];

  double v7 = [(NTKGreyhoundFaceView *)self timeView];
  CGAffineTransform v9 = v10;
  [v7 setTransform:&v9];

  objc_super v8 = [(NTKGreyhoundFaceView *)self complicationContainerView];
  CGAffineTransform v9 = v10;
  [v8 setTransform:&v9];
}

- (void)_applyRubberbandingAlpha
{
  NTKAlphaForRubberBandingFraction();

  -[NTKGreyhoundFaceView setAlpha:](self, "setAlpha:");
}

+ (id)swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  if ((unint64_t)(a3 - 11) > 4) {
    return 0;
  }
  else {
    return (&off_14650)[a3 - 11];
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  CGAffineTransform v10 = v9;
  if ((unint64_t)a4 > 0xF || ((1 << a4) & 0xA800) == 0)
  {
    v30.receiver = self;
    v30.super_class = (Class)NTKGreyhoundFaceView;
    id v17 = [(NTKGreyhoundFaceView *)&v30 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:v9];
    goto LABEL_16;
  }
  id v11 = [v9 objectForKeyedSubscript:&off_15B30];
  id v12 = [v10 objectForKeyedSubscript:&off_15AE8];
  id v13 = [v10 objectForKeyedSubscript:&off_15B00];
  objc_super v14 = [v10 objectForKeyedSubscript:&off_15B18];
  if (a4 == 11)
  {
    double v15 = v11;
    id v16 = v12;
    id v11 = v8;
  }
  else if (a4 == 15)
  {
    double v15 = v13;
    id v13 = v8;
    id v16 = v12;
  }
  else
  {
    double v15 = v12;
    id v16 = v8;
    if (a4 != 13) {
      goto LABEL_11;
    }
  }
  id v18 = v8;

  id v12 = v16;
LABEL_11:
  if (!qword_1B6E0)
  {
    uint64_t v19 = objc_opt_new();
    double v20 = (void *)qword_1B6E0;
    qword_1B6E0 = v19;
  }
  double v21 = +[NSString stringWithFormat:@"%@-%@-%@-%@", v11, v12, v13, v14];
  id v17 = [(id)qword_1B6E0 objectForKey:v21];
  if (!v17)
  {
    double v22 = [NTKGreyhoundFaceView alloc];
    id v23 = [(NTKGreyhoundFaceView *)self device];
    id v24 = [(NTKGreyhoundFaceView *)v22 initWithFaceStyle:44 forDevice:v23 clientIdentifier:0];

    [(NTKGreyhoundFaceView *)self frame];
    -[NTKGreyhoundFaceView setFrame:](v24, "setFrame:");
    [(NTKGreyhoundFaceView *)v24 _loadSnapshotContentViews];
    [(NTKGreyhoundFaceView *)v24 setOption:v11 forCustomEditMode:11 slot:0];
    [(NTKGreyhoundFaceView *)v24 setOption:v12 forCustomEditMode:13 slot:0];
    [(NTKGreyhoundFaceView *)v24 setOption:v13 forCustomEditMode:15 slot:0];
    [(NTKGreyhoundFaceView *)v24 setOption:v14 forCustomEditMode:10 slot:0];
    id v25 = NTKIdealizedDate();
    [(NTKGreyhoundFaceView *)v24 setOverrideDate:v25 duration:0.0];

    [(NTKGreyhoundFaceView *)self frame];
    -[NTKGreyhoundFaceView setFrame:](v24, "setFrame:");
    [(NTKGreyhoundFaceView *)v24 bounds];
    v32.width = v26;
    v32.height = v27;
    UIGraphicsBeginImageContextWithOptions(v32, 0, 0.0);
    v28 = [(NTKGreyhoundFaceView *)v24 layer];
    [v28 renderInContext:UIGraphicsGetCurrentContext()];

    id v17 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [(id)qword_1B6E0 setObject:v17 forKey:v21];
  }
LABEL_16:

  return v17;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIView)contentContainerView
{
  return self->_contentContainerView;
}

- (void)setContentContainerView:(id)a3
{
}

- (NTKGreyhoundContentView)greyhoundContentView
{
  return self->_greyhoundContentView;
}

- (void)setGreyhoundContentView:(id)a3
{
}

- (NTKRoundedCornerOverlayView)cornerView
{
  return self->_cornerView;
}

- (void)setCornerView:(id)a3
{
}

- (unint64_t)density
{
  return self->_density;
}

- (void)setDensity:(unint64_t)a3
{
  self->_unint64_t density = a3;
}

- (unint64_t)typeface
{
  return self->_typeface;
}

- (void)setTypeface:(unint64_t)a3
{
  self->_unint64_t typeface = a3;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_unint64_t style = a3;
}

- (double)breathingFraction
{
  return self->_breathingFraction;
}

- (void)setBreathingFraction:(double)a3
{
  self->_breathingFraction = a3;
}

- (double)rubberbandingFraction
{
  return self->_rubberbandingFraction;
}

- (void)setRubberbandingFraction:(double)a3
{
  self->_rubberbandingFraction = a3;
}

- (double)tritiumScale
{
  return self->_tritiumScale;
}

- (void)setTritiumScale:(double)a3
{
  self->_tritiumScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cornerView, 0);
  objc_storeStrong((id *)&self->_greyhoundContentView, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end