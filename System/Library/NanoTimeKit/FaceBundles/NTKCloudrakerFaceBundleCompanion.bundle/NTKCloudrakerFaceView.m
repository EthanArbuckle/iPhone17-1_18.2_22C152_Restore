@interface NTKCloudrakerFaceView
- (CGRect)_relativeKeylineFrameForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (NSArray)digitalTimeLabelFontScaleFactorForNumberSystemOverrides;
- (NTKCloudrakerFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_complicationsContainerViewAlphaForEditMode:(int64_t)a3;
- (double)_keylineCornerRadiusForComplicationSlot:(id)a3;
- (double)_timeViewAlphaForEditMode:(int64_t)a3;
- (double)_verticalPaddingForStatusBar;
- (id)_digitalTimeLabelFont;
- (id)_digitalTimeLabelStyleFromViewMode:(int64_t)a3 faceBounds:(CGRect)a4;
- (id)_keylineViewForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (int64_t)_keylineStyleForComplicationSlot:(id)a3;
- (unint64_t)_keylineLabelAlignmentForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (unint64_t)_timeLabelOptions;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromNumeral:(unint64_t)a4 toNumeral:(unint64_t)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_handleLocaleDidChange;
- (void)_loadLayoutRules;
- (void)_setNumerals:(unint64_t)a3;
- (void)dealloc;
- (void)invalidateDigitalTimeLabelStyle;
- (void)sensitiveUIStateChanged;
- (void)setDigitalTimeLabelFontScaleFactorForNumberSystemOverrides:(id)a3;
@end

@implementation NTKCloudrakerFaceView

- (NTKCloudrakerFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)NTKCloudrakerFaceView;
  v5 = [(NTKCloudrakerFaceView *)&v9 initWithFaceStyle:a3 forDevice:a4 clientIdentifier:a5];
  v6 = v5;
  if (v5)
  {
    v5->_numberSystem = -1;
    v7 = +[CLKSensitiveUIMonitor sharedMonitor];
    [v7 addSensitiveUIObserver:v6];
  }
  return v6;
}

- (void)dealloc
{
  v3 = +[CLKSensitiveUIMonitor sharedMonitor];
  [v3 removeSensitiveUIObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NTKCloudrakerFaceView;
  [(NTKCloudrakerFaceView *)&v4 dealloc];
}

- (NSArray)digitalTimeLabelFontScaleFactorForNumberSystemOverrides
{
  digitalTimeLabelFontScaleFactorForNumberSystemOverrides = self->_digitalTimeLabelFontScaleFactorForNumberSystemOverrides;
  if (!digitalTimeLabelFontScaleFactorForNumberSystemOverrides)
  {
    self->_digitalTimeLabelFontScaleFactorForNumberSystemOverrides = (NSArray *)&off_8CC0;

    digitalTimeLabelFontScaleFactorForNumberSystemOverrides = self->_digitalTimeLabelFontScaleFactorForNumberSystemOverrides;
  }

  return digitalTimeLabelFontScaleFactorForNumberSystemOverrides;
}

- (double)_verticalPaddingForStatusBar
{
  return 0.0;
}

- (void)_handleLocaleDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)NTKCloudrakerFaceView;
  [(NTKCloudrakerFaceView *)&v3 _handleLocaleDidChange];
  [(NTKCloudrakerFaceView *)self invalidateDigitalTimeLabelStyle];
}

- (void)invalidateDigitalTimeLabelStyle
{
  v4.receiver = self;
  v4.super_class = (Class)NTKCloudrakerFaceView;
  [(NTKCloudrakerFaceView *)&v4 invalidateDigitalTimeLabelStyle];
  objc_super v3 = [(NTKCloudrakerFaceView *)self timeView];
  [v3 setForcedNumberSystem:self->_numberSystem];
}

- (id)_digitalTimeLabelStyleFromViewMode:(int64_t)a3 faceBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v21 = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  objc_super v9 = [(NTKCloudrakerFaceView *)self device];
  sub_3B00(v9, (uint64_t)&v18);

  v10 = [(NTKCloudrakerFaceView *)self _digitalTimeLabelFont];
  double v11 = *(double *)&v20;
  [v10 capHeight];
  double v13 = v11 + v12 * 0.5;
  double v14 = *((double *)&v19 + 1);
  v15 = [(NTKCloudrakerFaceView *)self device];
  v16 = +[NTKDigitalTimeLabelStyle defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:](NTKDigitalTimeLabelStyle, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:", 1, v10, v15, x, y, width, height, v14, v13);

  [v16 setTracking:&off_8DC8];

  return v16;
}

- (id)_digitalTimeLabelFont
{
  objc_super v3 = [(NTKCloudrakerFaceView *)self device];
  sub_3B00(v3, (uint64_t)&v16);

  int v4 = CLKCurrentLocaleIs24HourMode();
  v5 = (double *)&v17 + 1;
  if (v4) {
    v5 = (double *)&v18;
  }
  double v6 = *v5;
  v7 = [(NTKCloudrakerFaceView *)self device];
  char v8 = NTKShowIndicScriptNumerals();

  if ((v8 & 1) == 0)
  {
    double v13 = UIFontWeightMedium;
LABEL_9:
    double v14 = +[CLKFont compactSoftFontOfSize:v6 weight:v13];
    goto LABEL_10;
  }
  if (self->_numberSystem != -1)
  {
    objc_super v9 = [(NTKCloudrakerFaceView *)self digitalTimeLabelFontScaleFactorForNumberSystemOverrides];
    v10 = [v9 objectAtIndexedSubscript:self->_numberSystem];
    [v10 doubleValue];

    double v11 = [(NTKCloudrakerFaceView *)self device];
    CLKRoundForDevice();
    double v6 = v12;
  }
  double v13 = UIFontWeightMedium;
  double v14 = +[NTKSFCompactFont numericSoftFontOfSize:v6 weight:UIFontWeightMedium];
  if (!v14) {
    goto LABEL_9;
  }
LABEL_10:

  return v14;
}

- (unint64_t)_timeLabelOptions
{
  return 1;
}

- (void)_setNumerals:(unint64_t)a3
{
  unint64_t v4 = CLKLocaleNumberSystemFromNumeralOption();
  if (self->_numberSystem != v4)
  {
    unint64_t v5 = v4;
    self->_numberSystem = v4;
    double v6 = [(NTKCloudrakerFaceView *)self device];
    int v7 = NTKShowIndicScriptNumerals();

    if (v7)
    {
      char v8 = [(NTKCloudrakerFaceView *)self timeView];
      [v8 setForcedNumberSystem:v5];

      [(NTKCloudrakerFaceView *)self invalidateDigitalTimeLabelStyle];
      [(NTKCloudrakerFaceView *)self setNeedsLayout];
    }
  }
}

- (void)sensitiveUIStateChanged
{
  unint64_t numberSystem = self->_numberSystem;
  unint64_t v4 = [(NTKCloudrakerFaceView *)self device];
  int v5 = NTKShowIndicScriptNumerals();

  if (v5) {
    uint64_t v6 = numberSystem;
  }
  else {
    uint64_t v6 = -1;
  }
  int v7 = [(NTKCloudrakerFaceView *)self timeView];
  [v7 setForcedNumberSystem:v6];

  [(NTKCloudrakerFaceView *)self invalidateDigitalTimeLabelStyle];

  [(NTKCloudrakerFaceView *)self setNeedsLayout];
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v11 = a3;
  id v8 = a5;
  if (a4 == 19)
  {
    -[NTKCloudrakerFaceView _setNumerals:](self, "_setNumerals:", [v11 numeralOption]);
  }
  else if (a4 == 10)
  {
    objc_super v9 = [(NTKCloudrakerFaceView *)self faceColorPalette];
    v10 = [(NTKCloudrakerFaceView *)self faceColorPalette];
    [(NTKCloudrakerFaceView *)self _applyTransitionFraction:v9 fromColorPalette:v10 toColorPalette:0.0];
  }
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v18 = a4;
  id v12 = a5;
  id v13 = a7;
  if (a6 == 19)
  {
    -[NTKCloudrakerFaceView _applyTransitionFraction:fromNumeral:toNumeral:](self, "_applyTransitionFraction:fromNumeral:toNumeral:", [v18 numeralOption], objc_msgSend(v12, "numeralOption"), a3);
  }
  else if (a6 == 10)
  {
    double v14 = [(NTKCloudrakerFaceView *)self interpolatedColorPalette];
    v15 = [v14 fromPalette];
    long long v16 = [(NTKCloudrakerFaceView *)self interpolatedColorPalette];
    long long v17 = [v16 toPalette];
    [(NTKCloudrakerFaceView *)self _applyTransitionFraction:v15 fromColorPalette:v17 toColorPalette:a3];
  }
}

- (void)_applyTransitionFraction:(double)a3 fromNumeral:(unint64_t)a4 toNumeral:(unint64_t)a5
{
  if (a3 >= 0.5)
  {
    double v10 = a3 + -0.5 + a3 + -0.5;
    id v8 = [(NTKCloudrakerFaceView *)self timeView];
    [v8 setAlpha:v10];
    unint64_t v6 = a5;
  }
  else
  {
    unint64_t v6 = a4;
    double v7 = 1.0 - (a3 + a3);
    id v8 = [(NTKCloudrakerFaceView *)self timeView];
    [v8 setAlpha:v7];
  }

  [(NTKCloudrakerFaceView *)self _setNumerals:v6];
}

- (void)_applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  double v10 = [v8 primaryColor];
  id v11 = [v9 primaryColor];
  id v12 = NTKInterpolateBetweenColors();
  [(NTKCloudrakerFaceView *)self setInterpolatedComplicationColor:v12];
  if (([v8 isMulticolor] & 1) != 0 || objc_msgSend(v9, "isMulticolor"))
  {
    if ([v9 isMulticolor] && !objc_msgSend(v8, "isMulticolor")) {
      a3 = 1.0 - a3;
    }
    char v13 = 1;
  }
  else
  {
    char v13 = 0;
  }
  if ([v9 isMulticolor]) {
    double v14 = v10;
  }
  else {
    double v14 = v11;
  }
  [(NTKCloudrakerFaceView *)self setComplicationColor:v14];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_42F0;
  v15[3] = &unk_8370;
  v15[4] = self;
  char v16 = v13;
  *(double *)&v15[5] = a3;
  [(NTKCloudrakerFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v15];
}

- (id)_keylineViewForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 19)
  {
    NTKKeylineCornerRadiusLarge();
    unint64_t v4 = NTKKeylineViewWithContinuousCurveCornerRadius();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NTKCloudrakerFaceView;
    unint64_t v4 = [(NTKCloudrakerFaceView *)&v6 _keylineViewForCustomEditMode:a3 slot:a4];
  }

  return v4;
}

- (CGRect)_relativeKeylineFrameForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 19)
  {
    int v5 = [(NTKCloudrakerFaceView *)self timeView];
    [v5 frame];
    double v7 = v6;

    id v8 = [(NTKCloudrakerFaceView *)self timeView];
    [v8 center];
    double v10 = v9;

    double v11 = v10 + v7 * -0.5;
    [(NTKCloudrakerFaceView *)self frame];
    double v13 = 0.0;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)NTKCloudrakerFaceView;
    [(NTKCloudrakerFaceView *)&v18 _relativeKeylineFrameForCustomEditMode:a3 slot:a4];
    double v11 = v14;
    double v7 = v15;
  }
  double v16 = v11;
  double v17 = v7;
  result.size.double height = v17;
  result.size.double width = v12;
  result.origin.double y = v16;
  result.origin.double x = v13;
  return result;
}

- (unint64_t)_keylineLabelAlignmentForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 19) {
    return 164;
  }
  uint64_t v8 = v4;
  uint64_t v9 = v5;
  v7.receiver = self;
  v7.super_class = (Class)NTKCloudrakerFaceView;
  return [(NTKCloudrakerFaceView *)&v7 _keylineLabelAlignmentForCustomEditMode:a3 slot:a4];
}

- (void)_configureForEditMode:(int64_t)a3
{
  -[NTKCloudrakerFaceView _complicationsContainerViewAlphaForEditMode:](self, "_complicationsContainerViewAlphaForEditMode:");
  double v6 = v5;
  objc_super v7 = [(NTKCloudrakerFaceView *)self complicationContainerView];
  [v7 setAlpha:v6];

  [(NTKCloudrakerFaceView *)self _timeViewAlphaForEditMode:a3];
  double v9 = v8;
  id v10 = [(NTKCloudrakerFaceView *)self timeView];
  [v10 setAlpha:v9];
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  -[NTKCloudrakerFaceView _timeViewAlphaForEditMode:](self, "_timeViewAlphaForEditMode:");
  [(NTKCloudrakerFaceView *)self _timeViewAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v9 = v8;
  [(NTKCloudrakerFaceView *)self _complicationsContainerViewAlphaForEditMode:a4];
  [(NTKCloudrakerFaceView *)self _complicationsContainerViewAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v11 = v10;
  double v12 = [(NTKCloudrakerFaceView *)self complicationContainerView];
  [v12 setAlpha:v11];

  id v13 = [(NTKCloudrakerFaceView *)self timeView];
  [v13 setAlpha:v9];
}

- (double)_timeViewAlphaForEditMode:(int64_t)a3
{
  return 1.0;
}

- (double)_complicationsContainerViewAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if (a3 != 19) {
    return 1.0;
  }
  return result;
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  NTKLargeElementScaleForBreathingFraction();
  memset(&v9, 0, sizeof(v9));
  CGAffineTransformMakeScale(&v9, v7, v7);
  if (a4 == 10)
  {
    CGAffineTransform v8 = v9;
    [(NTKCloudrakerFaceView *)self setTransform:&v8];
  }
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  NTKScaleForRubberBandingFraction();
  memset(&v11, 0, sizeof(v11));
  CGAffineTransformMakeScale(&v11, v7, v7);
  NTKAlphaForRubberBandingFraction();
  if (a4 == 10)
  {
    double v9 = v8;
    CGAffineTransform v10 = v11;
    [(NTKCloudrakerFaceView *)self setTransform:&v10];
    [(NTKCloudrakerFaceView *)self setAlpha:v9];
  }
}

- (void)_loadLayoutRules
{
  objc_super v3 = [(NTKCloudrakerFaceView *)self device];
  uint64_t v15 = 0;
  memset(v14, 0, sizeof(v14));
  sub_3B00(v3, (uint64_t)v14);
  [(NTKCloudrakerFaceView *)self bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  memset(&v13, 0, sizeof(v13));
  CGAffineTransformMakeScale(&v13, *(CGFloat *)v14, *(CGFloat *)v14);
  NTKWhistlerSubdialComplicationDiameter();
  NTKWhistlerSubdialComplicationContentDiameter();
  NTKWhistlerLargeRectangularComplicationSize();
  v16.origin.double x = v5;
  v16.origin.double y = v7;
  v16.size.double width = v9;
  v16.size.double height = v11;
  CGRectGetWidth(v16);
  id v12 = v3;
  NTKEnumerateComplicationStates();
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  uint64_t v6 = NTKComplicationSlotTopLeft;
  id v7 = a3;
  unsigned int v8 = [a5 isEqualToString:v6];
  CGFloat v9 = (void **)NTKRichComplicationCircularBaseView_ptr;
  if (!v8) {
    CGFloat v9 = (void **)NTKRichComplicationRectangularBaseView_ptr;
  }
  double v10 = *v9;
  id v11 = [v7 complicationType];

  [v10 viewWithLegacyComplicationType:v11];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v7 = a3;
  CGFloat v5 = [(NTKCloudrakerFaceView *)self faceColorPalette];
  unsigned int v6 = [v5 isMulticolor];

  if (v6) {
    [v7 transitionToMonochromeWithFraction:0.0];
  }
  else {
    [v7 updateMonochromeColor];
  }
}

- (int64_t)_keylineStyleForComplicationSlot:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:NTKComplicationSlotTopLeft])
  {
    id v5 = &dword_0 + 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NTKCloudrakerFaceView;
    id v5 = [(NTKCloudrakerFaceView *)&v7 _keylineStyleForComplicationSlot:v4];
  }

  return (int64_t)v5;
}

- (double)_keylineCornerRadiusForComplicationSlot:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:NTKComplicationSlotCenter] & 1) != 0
    || [v4 isEqualToString:NTKComplicationSlotBottom])
  {
    id v5 = [(NTKCloudrakerFaceView *)self device];
    +[NTKModuleView cornerRadiusForComplicationFamily:1 forDevice:v5];
    double v7 = v6;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)NTKCloudrakerFaceView;
    [(NTKCloudrakerFaceView *)&v10 _keylineCornerRadiusForComplicationSlot:v4];
    double v7 = v8;
  }

  return v7;
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  if (a4 == 19)
  {
    CGFloat v9 = [(NTKCloudrakerFaceView *)self _digitalTimeLabelFont];
    objc_super v10 = [(NTKCloudrakerFaceView *)self device];
    id v11 = [v8 swatchImageWithFont:v9 device:v10 baseline:0.0];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)NTKCloudrakerFaceView;
    id v11 = [(NTKCloudrakerFaceView *)&v13 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:a5];
  }

  return v11;
}

- (void)setDigitalTimeLabelFontScaleFactorForNumberSystemOverrides:(id)a3
{
}

- (void).cxx_destruct
{
}

@end