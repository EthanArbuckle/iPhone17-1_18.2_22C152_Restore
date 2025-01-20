@interface NTKProteusFaceView
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4;
- (BOOL)_legacyShouldSwapGraphicCircularComplicationColors;
- (BOOL)_needsForegroundContainerView;
- (BOOL)_wantsStatusBarIconShadow;
- (NTKProteusContentView)proteusContentView;
- (NTKProteusFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (NTKRoundedCornerOverlayView)cornerView;
- (double)_adjustedTritiumFraction;
- (double)_angleForDigit:(unint64_t)a3;
- (double)_complicationAlphaForEditMode:(int64_t)a3;
- (double)_contentAlphaForEditMode:(int64_t)a3;
- (double)_dialAlphaForEditMode:(int64_t)a3;
- (double)_digitWeight:(unint64_t)a3 forAngle:(double)a4;
- (double)_horizontalPaddingForStatusBar;
- (double)_timeAlphaForEditMode:(int64_t)a3;
- (double)_timeAngle:(id)a3;
- (double)_verticalPaddingForStatusBar;
- (double)_weightForCWDistance:(double)a3;
- (id)_simpleTextComplicationColorForEditMode:(int64_t)a3;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)colorPalette;
- (id)createFaceColorPalette;
- (unint64_t)_digitForAngle:(double)a3;
- (unint64_t)backgroundStyle;
- (unint64_t)style;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyComplicationColor:(id)a3;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromBackgroundStyle:(unint64_t)a4 toBackgroundStyle:(unint64_t)a5;
- (void)_applyTransitionFraction:(double)a3 fromColor:(id)a4 toColor:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5;
- (void)_cleanupAfterEditing;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_loadSnapshotContentViews;
- (void)_prepareForStatusChange:(BOOL)a3;
- (void)_removeProteusContentView;
- (void)_removeViews;
- (void)_reorderSwitcherSnapshotView;
- (void)_setupProteusContentView;
- (void)_setupViews;
- (void)_unloadSnapshotContentViews;
- (void)_updateDigitWeights;
- (void)_updateNotchDigitWeights;
- (void)_updateSimpleTextLabelColor:(id)a3;
- (void)_updateSubDialRichComplicationsColor:(id)a3 alternateColor:(id)a4;
- (void)_updateViewColorsWithPalette:(id)a3;
- (void)applyColorOnAnalogHands;
- (void)configureComplicationAlphaFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)layoutSubviews;
- (void)setBackgroundStyle:(unint64_t)a3;
- (void)setCornerView:(id)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setProteusContentView:(id)a3;
- (void)setStyle:(unint64_t)a3;
@end

@implementation NTKProteusFaceView

- (NTKProteusFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  v16.receiver = self;
  v16.super_class = (Class)NTKProteusFaceView;
  v5 = [(NTKProteusFaceView *)&v16 initWithFaceStyle:a3 forDevice:a4 clientIdentifier:a5];
  if (v5)
  {
    id v6 = objc_alloc_init((Class)NTKCompositeComplicationFactory);
    id v7 = objc_alloc((Class)NTKFullscreenSubdialComplicationFactory);
    v8 = [(NTKProteusFaceView *)v5 device];
    id v9 = [v7 initForDevice:v8];

    [v9 setFaceView:v5];
    v10 = [(NTKProteusFaceView *)v5 device];
    sub_6288(v10, (uint64_t)v13);
    objc_msgSend(v9, "setCircularComplicationDistanceFromCenter:", v14, v15);

    [v9 setAlpha:v5 faceView:1.0];
    [v6 registerFactory:v9 forSlot:NTKComplicationSlotSubdialBottom];
    id v11 = objc_alloc_init((Class)NTKSimpleTextFaceViewComplicationFactory);
    [v11 setFaceView:v5];
    [v6 registerFactory:v11 forSlot:NTKComplicationSlotSubdialTop];
    [(NTKProteusFaceView *)v5 setComplicationFactory:v6];
  }
  return v5;
}

- (BOOL)_legacyShouldSwapGraphicCircularComplicationColors
{
  return 1;
}

- (BOOL)_needsForegroundContainerView
{
  return 1;
}

- (BOOL)_wantsStatusBarIconShadow
{
  v2 = [(NTKProteusFaceView *)self optionForCustomEditMode:12 slot:0];
  BOOL v3 = [v2 backgroundStyle] == (char *)&dword_0 + 1;

  return v3;
}

- (double)_horizontalPaddingForStatusBar
{
  uint64_t v6 = 0;
  memset(&v5[1], 0, 32);
  BOOL v3 = [(NTKProteusFaceView *)self device];
  sub_6288(v3, (uint64_t)v5);

  [(NTKProteusFaceView *)self _adjustedTritiumFraction];
  CLKInterpolateBetweenFloatsClipped();

  CLKInterpolateBetweenFloatsClipped();
  return result;
}

- (double)_verticalPaddingForStatusBar
{
  uint64_t v6 = 0;
  v5[2] = 0u;
  BOOL v3 = [(NTKProteusFaceView *)self device];
  sub_6288(v3, (uint64_t)v5);

  [(NTKProteusFaceView *)self _adjustedTritiumFraction];

  CLKInterpolateBetweenFloatsClipped();
  return result;
}

- (double)_adjustedTritiumFraction
{
  return 0.0;
}

- (void)_prepareForStatusChange:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)NTKProteusFaceView;
  -[NTKProteusFaceView _prepareForStatusChange:](&v6, "_prepareForStatusChange:");
  if (self->_showingStatus != v3)
  {
    self->_showingStatus = v3;
    double v5 = 0.0;
    if (v3) {
      double v5 = 1.0;
    }
    [(NTKProteusContentView *)self->_proteusContentView setNotchFraction:v5];
    [(NTKProteusFaceView *)self _updateNotchDigitWeights];
  }
}

- (void)_reorderSwitcherSnapshotView
{
  BOOL v3 = [(NTKProteusFaceView *)self switcherSnapshotView];

  if (v3)
  {
    id v4 = [(NTKProteusFaceView *)self switcherSnapshotView];
    [(NTKProteusFaceView *)self bringSubviewToFront:v4];
  }
}

- (void)_loadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKProteusFaceView;
  [(NTKProteusFaceView *)&v3 _loadSnapshotContentViews];
  [(NTKProteusFaceView *)self _setupViews];
}

- (void)_unloadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKProteusFaceView;
  [(NTKProteusFaceView *)&v3 _unloadSnapshotContentViews];
  [(NTKProteusFaceView *)self _removeViews];
}

- (void)_setupProteusContentView
{
  objc_super v3 = [NTKProteusContentView alloc];
  [(NTKProteusFaceView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  unint64_t style = self->_style;
  unint64_t v13 = [(NTKProteusFaceView *)self backgroundStyle];
  double v14 = [(NTKProteusFaceView *)self colorPalette];
  double v15 = [(NTKProteusFaceView *)self device];
  objc_super v16 = -[NTKProteusContentView initWithFrame:style:backgroundStyle:colorPalette:device:](v3, "initWithFrame:style:backgroundStyle:colorPalette:device:", style, v13, v14, v15, v5, v7, v9, v11);
  proteusContentView = self->_proteusContentView;
  self->_proteusContentView = v16;

  v18 = [(NTKProteusFaceView *)self contentView];
  [v18 addSubview:self->_proteusContentView];

  [(NTKProteusFaceView *)self _updateDigitWeights];
}

- (void)_setupViews
{
  [(NTKProteusFaceView *)self _setupProteusContentView];
  id v3 = objc_alloc((Class)NTKRoundedCornerOverlayView);
  [(NTKProteusFaceView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(NTKProteusFaceView *)self device];
  unint64_t v13 = (NTKRoundedCornerOverlayView *)objc_msgSend(v3, "initWithFrame:forDeviceCornerRadius:", v12, v5, v7, v9, v11);
  cornerView = self->_cornerView;
  self->_cornerView = v13;

  double v15 = [(NTKProteusFaceView *)self contentView];
  [v15 addSubview:self->_cornerView];

  [(NTKProteusFaceView *)self applyColorOnAnalogHands];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)NTKProteusFaceView;
  [(NTKProteusFaceView *)&v5 layoutSubviews];
  proteusContentView = self->_proteusContentView;
  [(NTKProteusFaceView *)self bounds];
  -[NTKProteusContentView ntk_setBoundsAndPositionFromFrame:](proteusContentView, "ntk_setBoundsAndPositionFromFrame:");
  cornerView = self->_cornerView;
  [(NTKProteusFaceView *)self bounds];
  -[NTKRoundedCornerOverlayView ntk_setBoundsAndPositionFromFrame:](cornerView, "ntk_setBoundsAndPositionFromFrame:");
}

- (void)_removeProteusContentView
{
  [(NTKProteusContentView *)self->_proteusContentView removeFromSuperview];
  proteusContentView = self->_proteusContentView;
  self->_proteusContentView = 0;
}

- (void)_removeViews
{
  [(NTKProteusFaceView *)self _removeProteusContentView];
  [(NTKRoundedCornerOverlayView *)self->_cornerView removeFromSuperview];
  cornerView = self->_cornerView;
  self->_cornerView = 0;
}

- (void)applyColorOnAnalogHands
{
  id v11 = [(NTKProteusFaceView *)self timeView];
  id v3 = +[UIColor whiteColor];
  double v4 = [v11 hourHandView];
  [v4 setInlayColor:v3];

  objc_super v5 = [v11 minuteHandView];
  [v5 setInlayColor:v3];

  double v6 = [v11 hourHandView];
  [v6 setColor:v3];

  double v7 = [v11 minuteHandView];
  [v7 setColor:v3];

  double v8 = [(NTKProteusFaceView *)self colorPalette];
  double v9 = [v8 secondHand];
  double v10 = [v11 secondHandView];
  [v10 setColor:v9];
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v17 = a3;
  id v8 = a5;
  switch(a4)
  {
    case 10:
      double v10 = [(NTKProteusFaceView *)self colorPalette];
      [(NTKProteusFaceView *)self _updateViewColorsWithPalette:v10];

      [(NTKProteusFaceView *)self applyColorOnAnalogHands];
      id v11 = [(NTKProteusFaceView *)self colorPalette];
      v12 = [v11 circularComplicationAColor];
      unint64_t v13 = [(NTKProteusFaceView *)self colorPalette];
      double v14 = [v13 circularComplicationB];
      [(NTKProteusFaceView *)self _updateSubDialRichComplicationsColor:v12 alternateColor:v14];

      double v9 = [(NTKProteusFaceView *)self _simpleTextComplicationColorForEditMode:10];
      [(NTKProteusFaceView *)self _updateSimpleTextLabelColor:v9];
      break;
    case 12:
      double v9 = [(NTKProteusFaceView *)self optionForCustomEditMode:12 slot:0];
      -[NTKProteusFaceView setBackgroundStyle:](self, "setBackgroundStyle:", [v9 backgroundStyle]);
      double v15 = [(NTKProteusFaceView *)self colorPalette];
      [(NTKProteusFaceView *)self _updateViewColorsWithPalette:v15];

      break;
    case 15:
      double v9 = [(NTKProteusFaceView *)self optionForCustomEditMode:15 slot:0];
      -[NTKProteusFaceView setStyle:](self, "setStyle:", [v9 style]);
      break;
    default:
      goto LABEL_8;
  }

LABEL_8:
  objc_super v16 = [(NTKProteusFaceView *)self delegate];
  [v16 faceViewDidChangeWantsStatusBarIconShadow];
}

- (void)_updateSubDialRichComplicationsColor:(id)a3 alternateColor:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_6D14;
  _OWORD v5[3] = &unk_10470;
  double v6 = self;
  id v7 = a3;
  id v4 = v7;
  [(NTKProteusFaceView *)v6 enumerateComplicationDisplayWrappersWithBlock:v5];
}

- (void)setStyle:(unint64_t)a3
{
  self->_unint64_t style = a3;
  -[NTKProteusContentView setStyle:](self->_proteusContentView, "setStyle:");
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  self->_backgroundStyle = a3;
  objc_super v5 = [(NTKProteusFaceView *)self colorPalette];
  [v5 setBackgroundStyle:a3];

  id v6 = [(NTKProteusFaceView *)self colorPalette];
  [(NTKProteusFaceView *)self _updateViewColorsWithPalette:v6];
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v14 = a4;
  id v12 = a5;
  id v13 = a7;
  switch(a6)
  {
    case 10:
      [(NTKProteusFaceView *)self _applyTransitionFraction:v14 fromColor:v12 toColor:a3];
      break;
    case 12:
      -[NTKProteusFaceView _applyTransitionFraction:fromBackgroundStyle:toBackgroundStyle:](self, "_applyTransitionFraction:fromBackgroundStyle:toBackgroundStyle:", [v14 backgroundStyle], objc_msgSend(v12, "backgroundStyle"), a3);
      break;
    case 15:
      -[NTKProteusFaceView _applyTransitionFraction:fromStyle:toStyle:](self, "_applyTransitionFraction:fromStyle:toStyle:", [v14 style], objc_msgSend(v12, "style"), a3);
      break;
  }
}

- (void)_applyTransitionFraction:(double)a3 fromColor:(id)a4 toColor:(id)a5
{
  id v6 = [(NTKProteusFaceView *)self interpolatedColorPalette];
  [(NTKProteusFaceView *)self _updateViewColorsWithPalette:v6];
}

- (void)_applyTransitionFraction:(double)a3 fromBackgroundStyle:(unint64_t)a4 toBackgroundStyle:(unint64_t)a5
{
  double v9 = [(NTKProteusFaceView *)self colorPalette];
  id v13 = [v9 copy];

  [v13 setBackgroundStyle:a4];
  double v10 = [(NTKProteusFaceView *)self colorPalette];
  id v11 = [v10 copy];

  [v11 setBackgroundStyle:a5];
  id v12 = [objc_alloc((Class)NTKInterpolatedColorPalette) initWithFromPalette:v13 toPalette:v11];
  [v12 setTransitionFraction:a3];
  [(NTKProteusFaceView *)self _updateViewColorsWithPalette:v12];
}

- (void)_applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5
{
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NTKProteusFaceView;
  [(NTKProteusFaceView *)&v15 _configureComplicationView:v6 forSlot:v7];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v7 isEqualToString:NTKComplicationSlotSubdialBottom])
  {
    id v8 = v6;
    double v9 = [(NTKProteusFaceView *)self colorPalette];
    double v10 = [v9 circularComplicationAColor];
    [(NTKProteusFaceView *)self setComplicationColor:v10];

    id v11 = [(NTKProteusFaceView *)self complicationColor];
    [(NTKProteusFaceView *)self setInterpolatedComplicationColor:v11];

    [v8 updateMonochromeColor];
LABEL_8:

    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v6;
    id v8 = [(NTKProteusFaceView *)self _simpleTextComplicationColorForEditMode:[(NTKProteusFaceView *)self editing]];
    id v13 = [v12 label];

    [v13 setTextColor:v8];
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v6;
    id v8 = [(NTKProteusFaceView *)self _simpleTextComplicationColorForEditMode:[(NTKProteusFaceView *)self editing]];
    [v14 setTextColor:v8];

    goto LABEL_8;
  }
LABEL_9:
}

- (void)_updateViewColorsWithPalette:(id)a3
{
  proteusContentView = self->_proteusContentView;
  id v5 = a3;
  [(NTKProteusContentView *)proteusContentView setColorPalette:v5];
  id v16 = [(NTKProteusFaceView *)self timeView];
  id v6 = [v5 hourHandInlay];
  id v7 = [v16 hourHandView];
  [v7 setInlayColor:v6];

  id v8 = [v5 hourHandInlay];
  double v9 = [v16 minuteHandView];
  [v9 setInlayColor:v8];

  double v10 = [v5 hourHandStroke];
  id v11 = [v16 hourHandView];
  [v11 setColor:v10];

  id v12 = [v5 hourHandStroke];
  id v13 = [v16 minuteHandView];
  [v13 setColor:v12];

  id v14 = [v5 secondHand];
  objc_super v15 = [v16 secondHandView];
  [v15 setColor:v14];

  [(NTKProteusFaceView *)self _applyComplicationColor:v5];
}

- (void)_applyComplicationColor:(id)a3
{
  id v4 = a3;
  id v5 = [v4 circularComplicationAColor];
  id v6 = [v4 circularComplicationB];
  [(NTKProteusFaceView *)self _updateSubDialRichComplicationsColor:v5 alternateColor:v6];

  id v7 = [v4 simpleTextComplicationColor];

  [(NTKProteusFaceView *)self _updateSimpleTextLabelColor:v7];
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)NTKProteusFaceView;
  -[NTKProteusFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v12, "_applyBreathingFraction:forCustomEditMode:slot:", a4, a5);
  NTKLargeElementScaleForBreathingFraction();
  memset(&v11, 0, sizeof(v11));
  CGAffineTransformMakeScale(&v11, v6, v6);
  id v7 = [(NTKProteusFaceView *)self contentView];
  CGAffineTransform v10 = v11;
  [v7 setTransform:&v10];

  id v8 = [(NTKProteusFaceView *)self timeView];
  CGAffineTransform v10 = v11;
  [v8 setTransform:&v10];

  double v9 = [(NTKProteusFaceView *)self complicationContainerView];
  CGAffineTransform v10 = v11;
  [v9 setTransform:&v10];
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)NTKProteusFaceView;
  -[NTKProteusFaceView _applyRubberBandingFraction:forCustomEditMode:slot:](&v9, "_applyRubberBandingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4)
  {
    NTKScaleForRubberBandingFraction();
    CGAffineTransformMakeScale(&v8, v7, v7);
    [(NTKProteusFaceView *)self setTransform:&v8];
    NTKAlphaForRubberBandingFraction();
    -[NTKProteusFaceView setAlpha:](self, "setAlpha:");
  }
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NTKProteusFaceView;
  [(NTKProteusFaceView *)&v5 setOverrideDate:a3 duration:a4];
  [(NTKProteusFaceView *)self _updateDigitWeights];
}

- (void)_updateNotchDigitWeights
{
  id v9 = [(NTKProteusFaceView *)self currentDisplayDate];
  [(NTKProteusFaceView *)self _timeAngle:v9];
  double v4 = v3;
  -[NTKProteusFaceView _digitWeight:forAngle:](self, "_digitWeight:forAngle:", 1);
  double v6 = v5;
  [(NTKProteusFaceView *)self _digitWeight:12 forAngle:v4];
  double v8 = v7;
  [(NTKProteusContentView *)self->_proteusContentView setDigitWeight:1 forDigit:v6];
  [(NTKProteusContentView *)self->_proteusContentView setDigitWeight:12 forDigit:v8];
}

- (void)_updateDigitWeights
{
  id v6 = [(NTKProteusFaceView *)self currentDisplayDate];
  -[NTKProteusFaceView _timeAngle:](self, "_timeAngle:");
  double v4 = v3;
  for (uint64_t i = 1; i != 13; ++i)
  {
    [(NTKProteusFaceView *)self _digitWeight:i forAngle:v4];
    -[NTKProteusContentView setDigitWeight:forDigit:](self->_proteusContentView, "setDigitWeight:forDigit:", i);
  }
}

- (double)_angleForDigit:(unint64_t)a3
{
  if (a3 > 3) {
    return ((double)(a3 - 3) / -6.0 + 2.0) * 3.14159265;
  }
  else {
    return (double)(3 - a3) * 3.14159265 / 6.0;
  }
}

- (unint64_t)_digitForAngle:(double)a3
{
  uint64_t v3 = 15;
  if (a3 < 1.30899694) {
    uint64_t v3 = 3;
  }
  return v3 - vcvtpd_u64_f64((a3 * 12.0 / 3.14159265 + -1.0) * 0.5);
}

- (double)_timeAngle:(id)a3
{
  id v4 = a3;
  double v5 = +[NSCalendar currentCalendar];
  id v6 = [v5 components:32992 fromDate:v4];

  -[NTKProteusFaceView _angleForDigit:](self, "_angleForDigit:", (uint64_t)[v6 hour] % 12);
  double v8 = v7;
  if ([v6 minute] == (char *)&stru_20.vmaddr + 3)
  {
    unint64_t v9 = (unint64_t)[v6 second];
    if (v9 >= 0x3A)
    {
      double v10 = (double)(1000 * v9 + (unint64_t)[v6 nanosecond] / 0xF4240 - 58000) / 2000.0;
      if (v10 > 1.0) {
        double v10 = 1.0;
      }
      double v8 = v8 + fmax(v10, 0.0) * -0.523598776;
    }
  }

  return v8;
}

- (double)_digitWeight:(unint64_t)a3 forAngle:(double)a4
{
  [(NTKProteusFaceView *)self _angleForDigit:a3];
  +[NTKProteusWave clockwiseDistance:fromStartAngle:](NTKProteusWave, "clockwiseDistance:fromStartAngle:");

  -[NTKProteusFaceView _weightForCWDistance:](self, "_weightForCWDistance:");
  return result;
}

- (double)_weightForCWDistance:(double)a3
{
  if (a3 >= 0.523598776) {
    return (a3 + -0.523598776) / 5.75958653;
  }
  else {
    return a3 / -0.523598776 + 1.0;
  }
}

- (void)_configureForEditMode:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)NTKProteusFaceView;
  -[NTKProteusFaceView _configureForEditMode:](&v12, "_configureForEditMode:");
  [(NTKProteusFaceView *)self configureComplicationAlphaFraction:a3 fromEditMode:a3 toEditMode:1.0];
  [(NTKProteusFaceView *)self _contentAlphaForEditMode:a3];
  double v6 = v5;
  double v7 = [(NTKProteusFaceView *)self proteusContentView];
  [v7 setAlpha:v6];

  [(NTKProteusFaceView *)self _timeAlphaForEditMode:a3];
  double v9 = v8;
  double v10 = [(NTKProteusFaceView *)self timeView];
  [v10 setAlpha:v9];

  CGAffineTransform v11 = [(NTKProteusFaceView *)self colorPalette];
  [(NTKProteusFaceView *)self _updateViewColorsWithPalette:v11];
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  v18.receiver = self;
  v18.super_class = (Class)NTKProteusFaceView;
  -[NTKProteusFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](&v18, "_configureForTransitionFraction:fromEditMode:toEditMode:");
  [(NTKProteusFaceView *)self _contentAlphaForEditMode:a4];
  [(NTKProteusFaceView *)self _contentAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v10 = v9;
  CGAffineTransform v11 = [(NTKProteusFaceView *)self proteusContentView];
  [v11 setAlpha:v10];

  [(NTKProteusFaceView *)self _timeAlphaForEditMode:a4];
  [(NTKProteusFaceView *)self _timeAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v13 = v12;
  id v14 = [(NTKProteusFaceView *)self timeView];
  [v14 setAlpha:v13];

  [(NTKProteusFaceView *)self configureComplicationAlphaFraction:a4 fromEditMode:a5 toEditMode:a3];
  objc_super v15 = [(NTKProteusFaceView *)self _simpleTextComplicationColorForEditMode:a4];
  id v16 = [(NTKProteusFaceView *)self _simpleTextComplicationColorForEditMode:a5];
  id v17 = NTKInterpolateBetweenColors();

  [(NTKProteusFaceView *)self _updateSimpleTextLabelColor:v17];
}

- (void)_updateSimpleTextLabelColor:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_7D04;
  _OWORD v5[3] = &unk_10498;
  id v6 = a3;
  id v4 = v6;
  [(NTKProteusFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v5];
}

- (void)configureComplicationAlphaFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_7E68;
  _OWORD v5[3] = &unk_104C0;
  void v5[4] = self;
  v5[5] = a4;
  v5[6] = a5;
  *(double *)&v5[7] = a3;
  [(NTKProteusFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v5];
}

- (void)_cleanupAfterEditing
{
  v4.receiver = self;
  v4.super_class = (Class)NTKProteusFaceView;
  [(NTKProteusFaceView *)&v4 _cleanupAfterEditing];
  uint64_t v3 = [(NTKProteusFaceView *)self delegate];
  [v3 faceViewDidChangeWantsStatusBarIconShadow];
}

- (double)_complicationAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if ((unint64_t)a3 < 2) {
    return 1.0;
  }
  return result;
}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  return (unint64_t)a4 > 1;
}

- (id)_simpleTextComplicationColorForEditMode:(int64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v3 = +[UIColor colorWithWhite:0.95 alpha:1.0];
  }
  else
  {
    objc_super v4 = [(NTKProteusFaceView *)self colorPalette];
    uint64_t v3 = [v4 simpleTextComplicationColor];
  }

  return v3;
}

- (double)_dialAlphaForEditMode:(int64_t)a3
{
  if (!a3) {
    return 1.0;
  }
  if (a3 == 1) {
    return 0.0;
  }
  return NTKEditModeDimmedAlpha;
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
  double result = NTKEditModeDimmedAlpha;
  if (!a3) {
    return 1.0;
  }
  return result;
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  objc_super v4 = &off_10C68;
  if (a3 != 12) {
    objc_super v4 = 0;
  }
  if (a3 == 15) {
    return &off_10C50;
  }
  else {
    return v4;
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  double v10 = v9;
  if (a4 == 15)
  {
    id v11 = v8;
    id v12 = [v10 objectForKeyedSubscript:&off_10AA0];
  }
  else
  {
    if (a4 != 12)
    {
      v27.receiver = self;
      v27.super_class = (Class)NTKProteusFaceView;
      objc_super v18 = [(NTKProteusFaceView *)&v27 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:v9];
      goto LABEL_11;
    }
    id v11 = [v9 objectForKeyedSubscript:&off_10AE8];
    id v12 = v8;
  }
  double v13 = v12;
  id v14 = [v10 objectForKeyedSubscript:&off_10AB8];
  if (!qword_16518)
  {
    uint64_t v15 = objc_opt_new();
    id v16 = (void *)qword_16518;
    qword_16518 = v15;
  }
  id v17 = +[NSString stringWithFormat:@"%@-%@-%@", v11, v13, v14];
  objc_super v18 = [(id)qword_16518 objectForKey:v17];
  if (!v18)
  {
    v19 = [NTKProteusFaceView alloc];
    v20 = [(NTKProteusFaceView *)self device];
    v21 = [(NTKProteusFaceView *)v19 initWithFaceStyle:44 forDevice:v20 clientIdentifier:0];

    [(NTKProteusFaceView *)self frame];
    -[NTKProteusFaceView setFrame:](v21, "setFrame:");
    [(NTKProteusFaceView *)v21 _loadSnapshotContentViews];
    [(NTKProteusFaceView *)v21 setOption:v14 forCustomEditMode:10 slot:0];
    [(NTKProteusFaceView *)v21 setOption:v11 forCustomEditMode:15 slot:0];
    [(NTKProteusFaceView *)v21 setOption:v13 forCustomEditMode:12 slot:0];
    v22 = NTKIdealizedDate();
    [(NTKProteusFaceView *)v21 setOverrideDate:v22 duration:0.0];

    [(NTKProteusFaceView *)self frame];
    -[NTKProteusFaceView setFrame:](v21, "setFrame:");
    [(NTKProteusFaceView *)v21 bounds];
    v29.width = v23;
    v29.height = v24;
    UIGraphicsBeginImageContextWithOptions(v29, 0, 0.0);
    v25 = [(NTKProteusFaceView *)v21 layer];
    [v25 renderInContext:UIGraphicsGetCurrentContext()];

    objc_super v18 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [(id)qword_16518 setObject:v18 forKey:v17];
  }
LABEL_11:

  return v18;
}

- (id)createFaceColorPalette
{
  uint64_t v3 = [NTKProteusFaceColorPalette alloc];
  uint64_t v4 = objc_opt_class();
  double v5 = [(NTKProteusFaceView *)self device];
  id v6 = [(NTKProteusFaceColorPalette *)v3 initWithFaceClass:v4 device:v5];

  [(NTKProteusFaceColorPalette *)v6 setBackgroundStyle:[(NTKProteusFaceView *)self backgroundStyle]];

  return v6;
}

- (id)colorPalette
{
  return [(NTKProteusFaceView *)self faceColorPalette];
}

- (unint64_t)style
{
  return self->_style;
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (NTKProteusContentView)proteusContentView
{
  return self->_proteusContentView;
}

- (void)setProteusContentView:(id)a3
{
}

- (NTKRoundedCornerOverlayView)cornerView
{
  return self->_cornerView;
}

- (void)setCornerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cornerView, 0);

  objc_storeStrong((id *)&self->_proteusContentView, 0);
}

@end