@interface NTKMargaritaFaceView
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
+ (int64_t)uiSensitivity;
- (BOOL)_digitalTimeViewIsSmallerForStyle:(unint64_t)a3;
- (BOOL)_faceEditingViewShouldOffsetForComplicationEditMode;
- (BOOL)_hasBezelComplication;
- (BOOL)_shouldApplyBreathingForEditMode:(int64_t)a3;
- (BOOL)_shouldShowDial;
- (BOOL)_usePrimaryColorForNonAccentedColorForView:(id)a3;
- (BOOL)_wantsStatusBarIconShadow;
- (CGRect)_keylineFrameForCustomEditMode:(int64_t)a3 option:(id)a4 slot:(id)a5 selectedSlot:(id)a6;
- (CGRect)_keylineFrameForStripeAtSlot:(id)a3 withEditOption:(id)a4 stripeCount:(unint64_t)a5 selectedSlot:(id)a6;
- (NTKAnalogHandsView)analogTimeView;
- (NTKBigNumeralsDigitalTimeView)digitalTimeView;
- (NTKCircularAnalogDialView)dialView;
- (NTKFaceColorPalette)blackPalette;
- (NTKInterpolatedColorPalette)transitionalPalette;
- (NTKMargaritaBackgroundView)backgroundView;
- (NTKMargaritaFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_analogTimeViewAlphaForStyle:(unint64_t)a3;
- (double)_backgroundAlphaForEditMode:(int64_t)a3;
- (double)_bezelComplicationTextWidthInRadians;
- (double)_complicationAlphaForEditMode:(int64_t)a3 style:(unint64_t)a4;
- (double)_dialAlphaForEditMode:(int64_t)a3;
- (double)_digitalTimeScaleForStyle:(unint64_t)a3 shouldShowDial:(BOOL)a4;
- (double)_digitalTimeViewAlphaForStyle:(unint64_t)a3;
- (double)_editSpeedForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (double)_timeViewAlphaForEditMode:(int64_t)a3;
- (id)_complicationSlotsHiddenByCurrentConfiguration;
- (id)_enabledStripeColorsWithCount:(unint64_t)a3;
- (id)_findMostFrequentColorWithFrequencies:(id)a3 withLongestColor:(id)a4 longestLength:(unint64_t)a5;
- (id)_keylineViewForCustomEditMode:(int64_t)a3 slot:(id)a4 selectedSlot:(id)a5;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)_utilityBezelComplicationView;
- (id)colorForView:(id)a3 accented:(BOOL)a4;
- (id)colorPalette;
- (id)createFaceColorPalette;
- (id)filterForView:(id)a3 style:(int64_t)a4;
- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5;
- (id)filtersForView:(id)a3 style:(int64_t)a4;
- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5;
- (id)suggestedColorOptionForComplicationColor;
- (unint64_t)slotIndexForOption:(id)a3;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyDigitalTimeTransformForCurrentStyle;
- (void)_applyDigitalTimeTransformForStyle:(unint64_t)a3;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyStyle:(unint64_t)a3;
- (void)_applyTransitionFraction:(double)a3 fromComplication:(id)a4 toComplication:(id)a5 slot:(id)a6;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5;
- (void)_cleanupAfterEditing;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_keylineSelectionChangingTo:(id)a3 editMode:(int64_t)a4;
- (void)_loadContentViews;
- (void)_loadSnapshotContentViews;
- (void)_prepareForEditing;
- (void)_prepareForSnapshotting;
- (void)_removeContentViews;
- (void)_removeDialView;
- (void)_unloadSnapshotContentViews;
- (void)_updateComplicationColors;
- (void)_updateDialTicksForBezelText;
- (void)_updateDialVisibility;
- (void)layoutSubviews;
- (void)setAnalogTimeView:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setBlackPalette:(id)a3;
- (void)setDialView:(id)a3;
- (void)setDigitalTimeView:(id)a3;
- (void)setTransitionalPalette:(id)a3;
@end

@implementation NTKMargaritaFaceView

- (NTKMargaritaFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)NTKMargaritaFaceView;
  v9 = [(NTKMargaritaFaceView *)&v25 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  if (v9)
  {
    id v10 = objc_alloc_init((Class)NTKCompositeComplicationFactory);
    id v11 = objc_alloc((Class)NTKWhistlerAnalogFaceViewComplicationFactory);
    v12 = [(NTKMargaritaFaceView *)v9 device];
    id v13 = [v11 initWithFaceView:v9 dialDiameter:v8 device:sub_18F4(v12)];

    [v13 setUsesNarrowTopSlots:1];
    v26[0] = NTKComplicationSlotTopLeft;
    v26[1] = NTKComplicationSlotTopRight;
    v26[2] = NTKComplicationSlotBottomLeft;
    v26[3] = NTKComplicationSlotBottomRight;
    v14 = +[NSArray arrayWithObjects:v26 count:4];
    [v10 registerFactory:v13 forSlots:v14];

    id v15 = [objc_alloc((Class)NTKUtilityComplicationFactory) initForDevice:v8];
    [v15 setFaceView:v9];
    v16 = [(NTKMargaritaFaceView *)v9 device];
    [v15 setDialDiameter:sub_18F4(v16)];

    [v10 registerFactory:v15 forSlot:NTKComplicationSlotBezel];
    [(NTKMargaritaFaceView *)v9 setComplicationFactory:v10];
    v17 = [NTKMargaritaBackgroundView alloc];
    v18 = [(NTKMargaritaFaceView *)v9 device];
    v19 = [(NTKMargaritaBackgroundView *)v17 initWithDevice:v18];
    [(NTKMargaritaFaceView *)v9 setBackgroundView:v19];

    v20 = (NTKFaceColorPalette *)objc_alloc_init((Class)NTKFaceColorPalette);
    blackPalette = v9->_blackPalette;
    v9->_blackPalette = v20;

    v22 = +[NTKPigmentEditOption pigmentNamed:ntk_seasons_black];
    [(NTKFaceColorPalette *)v9->_blackPalette setPigmentEditOption:v22];

    v23 = v9;
  }

  return v9;
}

- (id)createFaceColorPalette
{
  v2 = objc_alloc_init(NTKMargaritaColorPalette);

  return v2;
}

- (id)colorPalette
{
  v3 = [(NTKMargaritaFaceView *)self faceColorPalette];
  objc_msgSend(v3, "setEditing:", -[NTKMargaritaFaceView editing](self, "editing"));
  [v3 setStyle:self->_style];

  return v3;
}

- (NTKInterpolatedColorPalette)transitionalPalette
{
  transitionalPalette = self->_transitionalPalette;
  if (!transitionalPalette)
  {
    id v4 = objc_alloc((Class)NTKInterpolatedColorPalette);
    v5 = [(NTKMargaritaFaceView *)self colorPalette];
    v6 = (NTKInterpolatedColorPalette *)[v4 initWithColorPalette:v5];
    v7 = self->_transitionalPalette;
    self->_transitionalPalette = v6;

    transitionalPalette = self->_transitionalPalette;
  }

  return transitionalPalette;
}

- (void)_loadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKMargaritaFaceView;
  [(NTKMargaritaFaceView *)&v3 _loadSnapshotContentViews];
  [(NTKMargaritaFaceView *)self _loadContentViews];
}

- (void)_loadContentViews
{
  analogTimeView = self->_analogTimeView;
  if (!analogTimeView)
  {
    id v4 = objc_alloc((Class)NTKAnalogHandsView);
    v5 = [(NTKMargaritaFaceView *)self device];
    v6 = (NTKAnalogHandsView *)[v4 initForDevice:v5];
    v7 = self->_analogTimeView;
    self->_analogTimeView = v6;

    id v8 = NTKColorWithRGBA();
    [(NTKAnalogHandsView *)self->_analogTimeView applySecondHandColor:v8];
    v9 = [(NTKAnalogHandsView *)self->_analogTimeView hourHandView];
    id v10 = [(NTKAnalogHandsView *)self->_analogTimeView minuteHandView];
    id v11 = [(NTKAnalogHandsView *)self->_analogTimeView secondHandView];
    v12 = +[UIColor clearColor];
    [v9 setHandDotColor:v12];
    [v10 setHandDotColor:v12];
    [v11 setHandDotColor:v12];

    analogTimeView = self->_analogTimeView;
  }
  id v13 = [(NTKAnalogHandsView *)analogTimeView superview];
  v14 = [(NTKMargaritaFaceView *)self contentView];

  if (v13 != v14)
  {
    id v15 = [(NTKMargaritaFaceView *)self contentView];
    [v15 addSubview:self->_analogTimeView];
  }
  [(NTKMargaritaFaceView *)self setTimeView:self->_analogTimeView];
  v16 = [(NTKMargaritaBackgroundView *)self->_backgroundView superview];
  v17 = [(NTKMargaritaFaceView *)self contentView];

  if (v16 != v17)
  {
    id v20 = [(NTKMargaritaFaceView *)self contentView];
    backgroundView = self->_backgroundView;
    v19 = [(NTKMargaritaFaceView *)self timeView];
    [v20 insertSubview:backgroundView belowSubview:v19];
  }
}

- (void)_unloadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKMargaritaFaceView;
  [(NTKMargaritaFaceView *)&v3 _unloadSnapshotContentViews];
  [(NTKMargaritaFaceView *)self _removeContentViews];
}

- (void)_removeContentViews
{
  [(NTKMargaritaBackgroundView *)self->_backgroundView removeFromSuperview];
  analogTimeView = self->_analogTimeView;
  if (analogTimeView)
  {
    [(NTKAnalogHandsView *)analogTimeView removeFromSuperview];
    id v4 = self->_analogTimeView;
    self->_analogTimeView = 0;
  }
  digitalTimeView = self->_digitalTimeView;
  if (digitalTimeView)
  {
    [(NTKBigNumeralsDigitalTimeView *)digitalTimeView removeFromSuperview];
    v6 = self->_digitalTimeView;
    self->_digitalTimeView = 0;
  }
  dialView = self->_dialView;
  if (dialView)
  {
    [(NTKCircularAnalogDialView *)dialView removeFromSuperview];
    id v8 = self->_dialView;
    self->_dialView = 0;
  }
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)NTKMargaritaFaceView;
  [(NTKMargaritaFaceView *)&v19 layoutSubviews];
  [(NTKMargaritaFaceView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  CLKRectGetCenter();
  double v12 = v11;
  double v14 = v13;
  id v15 = [(NTKMargaritaFaceView *)self backgroundView];
  objc_msgSend(v15, "setBounds:", v4, v6, v8, v10);

  v16 = [(NTKMargaritaFaceView *)self backgroundView];
  objc_msgSend(v16, "setCenter:", v12, v14);

  v17 = [(NTKMargaritaFaceView *)self analogTimeView];
  objc_msgSend(v17, "setBounds:", v4, v6, v8, v10);

  v18 = [(NTKMargaritaFaceView *)self analogTimeView];
  objc_msgSend(v18, "setCenter:", v12, v14);
}

+ (int64_t)uiSensitivity
{
  return 0;
}

- (void)_prepareForSnapshotting
{
  v5.receiver = self;
  v5.super_class = (Class)NTKMargaritaFaceView;
  [(NTKMargaritaFaceView *)&v5 _prepareForSnapshotting];
  double v3 = [(NTKMargaritaFaceView *)self delegate];
  unsigned __int8 v4 = [v3 faceViewShouldIgnoreSnapshotImages];

  if ((v4 & 1) == 0) {
    [(NTKMargaritaFaceView *)self _removeDialView];
  }
}

- (BOOL)_wantsStatusBarIconShadow
{
  return self->_style < 2;
}

- (NTKCircularAnalogDialView)dialView
{
  dialView = self->_dialView;
  if (!dialView)
  {
    unsigned __int8 v4 = [(NTKMargaritaFaceView *)self device];
    sub_18F4(v4);
    [(NTKMargaritaFaceView *)self bounds];
    CLKSizeCenteredInRectForDevice();
    double v9 = (NTKCircularAnalogDialView *)objc_msgSend(objc_alloc((Class)NTKCircularAnalogDialView), "initWithFrame:forDevice:", v4, v5, v6, v7, v8);
    double v10 = self->_dialView;
    self->_dialView = v9;

    [(NTKCircularAnalogDialView *)self->_dialView showAllTicksInDial];
    [(NTKCircularAnalogDialView *)self->_dialView applyColorTransitionFraction:self->_blackPalette fromFaceColorPalette:self->_blackPalette toFaceColorPalette:1.0];
    double v11 = self->_dialView;
    double v12 = +[UIColor clearColor];
    [(NTKCircularAnalogDialView *)v11 setBackgroundColor:v12];

    dialView = self->_dialView;
  }
  double v13 = [(NTKCircularAnalogDialView *)dialView superview];
  double v14 = [(NTKMargaritaFaceView *)self contentView];

  if (v13 != v14)
  {
    id v15 = [(NTKMargaritaFaceView *)self contentView];
    [v15 insertSubview:self->_dialView atIndex:0];
  }
  v16 = self->_dialView;

  return v16;
}

- (void)_removeDialView
{
  dialView = self->_dialView;
  if (dialView)
  {
    [(NTKCircularAnalogDialView *)dialView removeFromSuperview];
    unsigned __int8 v4 = self->_dialView;
    self->_dialView = 0;
  }
}

- (BOOL)_shouldShowDial
{
  double v3 = [(NTKMargaritaFaceView *)self optionForCustomEditMode:15 slot:0];
  unint64_t v4 = (unint64_t)[v3 style];

  BOOL result = [(NTKMargaritaFaceView *)self _hasBezelComplication];
  if ((v4 & 0xFFFFFFFFFFFFFFFELL) != 2) {
    return 0;
  }
  return result;
}

- (BOOL)_hasBezelComplication
{
  double v3 = [(NTKMargaritaFaceView *)self delegate];
  if (v3)
  {
    unint64_t v4 = [(NTKMargaritaFaceView *)self delegate];
    unsigned int v5 = [v4 faceViewComplicationIsEmptyForSlot:NTKComplicationSlotBezel] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)_updateDialVisibility
{
  unsigned int v3 = [(NTKMargaritaFaceView *)self _shouldShowDial];
  unint64_t v4 = [(NTKMargaritaFaceView *)self dialView];
  [v4 setHidden:v3 ^ 1];

  BOOL v5 = [(NTKMargaritaFaceView *)self _hasBezelComplication];
  double v6 = [(NTKMargaritaFaceView *)self backgroundView];
  [v6 setCompactCircular:v5];

  [(NTKMargaritaFaceView *)self _applyDigitalTimeTransformForCurrentStyle];
}

- (void)_updateDialTicksForBezelText
{
  id v6 = [(NTKMargaritaFaceView *)self dialView];
  [(NTKMargaritaFaceView *)self _bezelComplicationTextWidthInRadians];
  double v4 = v3;
  [(NTKMargaritaFaceView *)self _bezelComplicationTextWidthInRadians];
  [v6 transitTicksWithInitialBezelTextWidthInRadius:v4 finalBezelTextWidthInRadius:v5 fraction:1.0];
}

- (double)_bezelComplicationTextWidthInRadians
{
  v2 = [(NTKMargaritaFaceView *)self _utilityBezelComplicationView];
  [v2 textWidthInRadians];
  double v4 = v3;

  return v4;
}

- (void)_applyDigitalTimeTransformForCurrentStyle
{
  double v3 = [(NTKMargaritaFaceView *)self optionForCustomEditMode:15 slot:0];
  id v4 = [v3 style];

  [(NTKMargaritaFaceView *)self _applyDigitalTimeTransformForStyle:v4];
}

- (void)_applyDigitalTimeTransformForStyle:(unint64_t)a3
{
  [(NTKMargaritaFaceView *)self _digitalTimeScaleForStyle:a3 shouldShowDial:[(NTKMargaritaFaceView *)self _shouldShowDial]];
  CGFloat v5 = v4;
  id v6 = [(NTKMargaritaFaceView *)self digitalTimeView];
  CGAffineTransformMakeScale(&v7, v5, v5);
  [v6 setTransform:&v7];
}

- (double)_digitalTimeScaleForStyle:(unint64_t)a3 shouldShowDial:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned int v5 = [(NTKMargaritaFaceView *)self _digitalTimeViewIsSmallerForStyle:a3];
  double result = 0.6;
  if (v4) {
    double result = 0.55;
  }
  if (!v5) {
    return 0.9;
  }
  return result;
}

- (double)_analogTimeViewAlphaForStyle:(unint64_t)a3
{
  double result = 0.0;
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 0) {
    return 1.0;
  }
  return result;
}

- (double)_digitalTimeViewAlphaForStyle:(unint64_t)a3
{
  double result = 0.0;
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
    return 1.0;
  }
  return result;
}

- (BOOL)_digitalTimeViewIsSmallerForStyle:(unint64_t)a3
{
  return a3 == 3;
}

- (void)_applyStyle:(unint64_t)a3
{
  unsigned int v5 = [(NTKMargaritaFaceView *)self analogTimeView];
  [(NTKMargaritaFaceView *)self _analogTimeViewAlphaForStyle:a3];
  objc_msgSend(v5, "setAlpha:");

  id v6 = [(NTKMargaritaFaceView *)self complicationContainerView];
  if ([(NTKMargaritaFaceView *)self editing]) {
    uint64_t v7 = 15;
  }
  else {
    uint64_t v7 = 0;
  }
  [(NTKMargaritaFaceView *)self _complicationAlphaForEditMode:v7 style:a3];
  objc_msgSend(v6, "setAlpha:");

  if (self->_style != a3)
  {
    self->_style = a3;
    id v8 = [(NTKMargaritaFaceView *)self delegate];
    [v8 faceViewDidChangeWantsStatusBarIconShadow];
  }
}

- (void)_applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5
{
  id v8 = [(NTKMargaritaFaceView *)self analogTimeView];
  [(NTKMargaritaFaceView *)self _analogTimeViewAlphaForStyle:a4];
  [(NTKMargaritaFaceView *)self _analogTimeViewAlphaForStyle:a5];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v8, "setAlpha:");

  id v9 = [(NTKMargaritaFaceView *)self complicationContainerView];
  [(NTKMargaritaFaceView *)self _complicationAlphaForEditMode:15 style:a4];
  [(NTKMargaritaFaceView *)self _complicationAlphaForEditMode:15 style:a5];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v9, "setAlpha:");
}

- (double)_editSpeedForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 11) {
    return 100.0;
  }
  uint64_t v8 = v4;
  uint64_t v9 = v5;
  v7.receiver = self;
  v7.super_class = (Class)NTKMargaritaFaceView;
  [(NTKMargaritaFaceView *)&v7 _editSpeedForCustomEditMode:a3 slot:a4];
  return result;
}

- (void)_prepareForEditing
{
  v2.receiver = self;
  v2.super_class = (Class)NTKMargaritaFaceView;
  [(NTKMargaritaFaceView *)&v2 _prepareForEditing];
}

- (void)_cleanupAfterEditing
{
  v6.receiver = self;
  v6.super_class = (Class)NTKMargaritaFaceView;
  [(NTKMargaritaFaceView *)&v6 _cleanupAfterEditing];
  BOOL v3 = [(NTKMargaritaFaceView *)self _shouldShowDial];
  uint64_t v4 = [(NTKMargaritaFaceView *)self backgroundView];
  [v4 setCompactCircular:v3];

  uint64_t v5 = [(NTKMargaritaFaceView *)self delegate];
  [v5 faceViewDidChangeWantsStatusBarIconShadow];
}

- (void)_configureForEditMode:(int64_t)a3
{
  uint64_t v5 = [(NTKMargaritaFaceView *)self optionForCustomEditMode:15 slot:0];
  id v6 = [v5 style];

  [(NTKMargaritaFaceView *)self _timeViewAlphaForEditMode:a3];
  double v8 = v7;
  [(NTKMargaritaFaceView *)self _analogTimeViewAlphaForStyle:v6];
  double v10 = v8 * v9;
  double v11 = [(NTKMargaritaFaceView *)self analogTimeView];
  [v11 setAlpha:v10];

  double v12 = [(NTKMargaritaFaceView *)self backgroundView];
  id v18 = v12;
  if (a3 == 10) {
    id v13 = 0;
  }
  else {
    id v13 = v6;
  }
  [v12 setStyle:v13];
  double v14 = [(NTKMargaritaFaceView *)self optionForCustomEditMode:14 slot:0];
  id v15 = [v14 rotation];
  if (a3 == 10) {
    id v16 = 0;
  }
  else {
    id v16 = v15;
  }

  [v18 setRotation:v16];
  [(NTKMargaritaFaceView *)self _backgroundAlphaForEditMode:a3];
  objc_msgSend(v18, "setAlpha:");
  v17 = [(NTKMargaritaFaceView *)self complicationContainerView];
  [(NTKMargaritaFaceView *)self _complicationAlphaForEditMode:a3 style:v13];
  objc_msgSend(v17, "setAlpha:");
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  double v9 = [(NTKMargaritaFaceView *)self optionForCustomEditMode:15 slot:0];
  id v10 = [v9 style];

  [(NTKMargaritaFaceView *)self _timeViewAlphaForEditMode:a4];
  [(NTKMargaritaFaceView *)self _timeViewAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v12 = v11;
  [(NTKMargaritaFaceView *)self _analogTimeViewAlphaForStyle:v10];
  double v14 = v12 * v13;
  id v15 = [(NTKMargaritaFaceView *)self analogTimeView];
  [v15 setAlpha:v14];

  id v16 = [(NTKMargaritaFaceView *)self backgroundView];
  if (a4 != a5 && (a4 == 10 || a5 == 10))
  {
    v17 = [(NTKMargaritaFaceView *)self optionForCustomEditMode:14 slot:0];
    id v18 = [v17 rotation];

    uint64_t v19 = 360;
    if ((uint64_t)v18 <= 180) {
      uint64_t v19 = 0;
    }
    if (a5 == 10) {
      id v20 = (id)v19;
    }
    else {
      id v20 = v18;
    }
    if (a5 == 10) {
      id v21 = 0;
    }
    else {
      id v21 = v10;
    }
    if (a4 == 10) {
      id v22 = (id)v19;
    }
    else {
      id v22 = v18;
    }
    if (a4 == 10) {
      id v10 = 0;
    }
    [v16 applyTransitionFraction:v22 fromRotation:v20 toRotation:a3];
    [v16 applyTransitionFraction:v10 fromStyle:v21 toStyle:a3];
  }
  [(NTKMargaritaFaceView *)self _backgroundAlphaForEditMode:a4];
  [(NTKMargaritaFaceView *)self _backgroundAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v16, "setAlpha:");
  v23 = [(NTKMargaritaFaceView *)self optionForCustomEditMode:15 slot:0];
  id v24 = [v23 style];

  objc_super v25 = [(NTKMargaritaFaceView *)self complicationContainerView];
  [(NTKMargaritaFaceView *)self _complicationAlphaForEditMode:a4 style:v24];
  [(NTKMargaritaFaceView *)self _complicationAlphaForEditMode:a5 style:v24];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v25, "setAlpha:");

  if (!a4 || !a5)
  {
    if (!a5) {
      a3 = 1.0 - a3;
    }
    v26 = [(NTKMargaritaFaceView *)self editConfigurations];
    v27 = [v26 objectForKeyedSubscript:&off_119F8];

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_2C60;
    v29[3] = &unk_10530;
    double v32 = a3;
    v29[4] = self;
    id v30 = v27;
    id v31 = v16;
    id v28 = v27;
    [v28 enumerateSlotsWithBlock:v29];
  }
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v14 = a3;
  id v8 = a5;
  switch(a4)
  {
    case 10:
      double v9 = [(NTKMargaritaFaceView *)self backgroundView];
      id v10 = [(NTKMargaritaFaceView *)self colorPalette];
      double v11 = [v10 stripe];
      objc_msgSend(v9, "setStripeColor:atIndex:", v11, objc_msgSend(v8, "integerValue"));

      goto LABEL_4;
    case 11:
      self->_stripeCount = (unint64_t)[v14 count];
      double v9 = [(NTKMargaritaFaceView *)self backgroundView];
      [v9 setStripeCount:self->_stripeCount];
LABEL_4:

      [(NTKMargaritaFaceView *)self _updateComplicationColors];
      break;
    case 14:
      double v12 = [(NTKMargaritaFaceView *)self backgroundView];
      objc_msgSend(v12, "setRotation:", objc_msgSend(v14, "rotation"));
      goto LABEL_7;
    case 15:
      id v13 = [v14 style];
      [(NTKMargaritaFaceView *)self _applyStyle:v13];
      double v12 = [(NTKMargaritaFaceView *)self backgroundView];
      [v12 setStyle:v13];
LABEL_7:

      break;
    default:
      break;
  }
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v21 = a4;
  id v12 = a5;
  id v13 = a7;
  switch(a6)
  {
    case 10:
      id v14 = [(NTKMargaritaFaceView *)self backgroundView];
      id v15 = [(NTKMargaritaFaceView *)self interpolatedColorPalette];
      id v16 = [v15 stripe];
      objc_msgSend(v14, "setStripeColor:atIndex:", v16, objc_msgSend(v13, "integerValue"));

      goto LABEL_6;
    case 11:
      id v14 = [(NTKMargaritaFaceView *)self backgroundView];
      objc_msgSend(v14, "applyTransitionFraction:fromStripeCount:toStripeCount:", objc_msgSend(v21, "count"), objc_msgSend(v12, "count"), a3);
      goto LABEL_6;
    case 14:
      id v17 = [v21 rotation];
      id v18 = [v12 rotation];
      id v14 = [(NTKMargaritaFaceView *)self backgroundView];
      [v14 applyTransitionFraction:v17 fromRotation:v18 toRotation:a3];
      goto LABEL_6;
    case 15:
      id v19 = [v21 style];
      id v20 = [v12 style];
      [(NTKMargaritaFaceView *)self _applyTransitionFraction:v19 fromStyle:v20 toStyle:a3];
      id v14 = [(NTKMargaritaFaceView *)self backgroundView];
      [v14 applyTransitionFraction:v19 fromStyle:v20 toStyle:a3];
LABEL_6:

      break;
    default:
      break;
  }
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)NTKMargaritaFaceView;
  -[NTKMargaritaFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v12, "_applyBreathingFraction:forCustomEditMode:slot:", a4, a5);
  if ([(NTKMargaritaFaceView *)self _shouldApplyBreathingForEditMode:a4])
  {
    NTKLargeElementScaleForBreathingFraction();
    memset(&v11, 0, sizeof(v11));
    CGAffineTransformMakeScale(&v10, v7, v7);
    CGAffineTransformTranslate(&v11, &v10, 0.0, 1.0);
    id v8 = [(NTKMargaritaFaceView *)self backgroundView];
    CGAffineTransform v9 = v11;
    [v8 setTransform:&v9];
  }
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v14.receiver = self;
  v14.super_class = (Class)NTKMargaritaFaceView;
  -[NTKMargaritaFaceView _applyRubberBandingFraction:forCustomEditMode:slot:](&v14, "_applyRubberBandingFraction:forCustomEditMode:slot:", a4, a5);
  if ([(NTKMargaritaFaceView *)self _shouldApplyBreathingForEditMode:a4])
  {
    NTKScaleForRubberBandingFraction();
    CGFloat v8 = v7;
    CGAffineTransform v9 = [(NTKMargaritaFaceView *)self backgroundView];
    CGAffineTransformMakeScale(&v13, v8, v8);
    [v9 setTransform:&v13];

    NTKAlphaForRubberBandingFraction();
    double v11 = v10;
    objc_super v12 = [(NTKMargaritaFaceView *)self backgroundView];
    [v12 setAlpha:v11];
  }
}

- (BOOL)_shouldApplyBreathingForEditMode:(int64_t)a3
{
  return ((unint64_t)a3 < 0x10) & (0xC800u >> a3);
}

- (double)_dialAlphaForEditMode:(int64_t)a3
{
  double v3 = 0.0;
  if (a3 != 1 && a3 != 10 && [(NTKMargaritaFaceView *)self _shouldShowDial])
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFBLL) == 0xB || a3 == 14) {
      return NTKEditModeDimmedAlpha;
    }
    else {
      return 1.0;
    }
  }
  return v3;
}

- (double)_backgroundAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if (a3 != 1) {
    return 1.0;
  }
  return result;
}

- (double)_complicationAlphaForEditMode:(int64_t)a3 style:(unint64_t)a4
{
  double v4 = NTKEditModeDimmedAlpha;
  double v5 = 0.0;
  if (a3 == 10) {
    double v4 = 0.0;
  }
  if ((unint64_t)a3 < 2) {
    double v4 = 1.0;
  }
  if (a4 >= 2) {
    double v5 = 1.0;
  }
  return v5 * v4;
}

- (double)_timeViewAlphaForEditMode:(int64_t)a3
{
  if (a3 > 10)
  {
    if (a3 != 14 && a3 != 11) {
      return 1.0;
    }
    return NTKEditModeDimmedAlpha;
  }
  if (a3 == 1) {
    return NTKEditModeDimmedAlpha;
  }
  double result = 0.0;
  if (a3 != 10) {
    return 1.0;
  }
  return result;
}

- (id)_keylineViewForCustomEditMode:(int64_t)a3 slot:(id)a4 selectedSlot:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (a3 == 10)
  {
    if ((unint64_t)[v8 integerValue] >= self->_stripeCount)
    {
      v40 = 0;
    }
    else
    {
      double v10 = (char *)[v8 integerValue];
      double v11 = (char *)[v9 integerValue];
      if ([v9 isEqualToString:v8]) {
        double v12 = 3.0;
      }
      else {
        double v12 = 0.5;
      }
      CGAffineTransform v13 = [(NTKMargaritaFaceView *)self optionForCustomEditMode:10 slot:v9];
      [(NTKMargaritaFaceView *)self _keylineFrameForStripeAtSlot:v8 withEditOption:v13 stripeCount:self->_stripeCount selectedSlot:v9];
      double y = v164.origin.y;
      double x = v164.origin.x;
      CGFloat width = v164.size.width;
      CGFloat height = v164.size.height;
      double v131 = v12;
      CGRect v165 = CGRectInset(v164, v12 + 15.0, v12 + 15.0);
      CGFloat v14 = v165.origin.x;
      CGFloat v15 = v165.origin.y;
      CGFloat v16 = v165.size.width;
      CGFloat v17 = v165.size.height;
      v154.receiver = self;
      v154.super_class = (Class)NTKMargaritaFaceView;
      [(NTKMargaritaFaceView *)&v154 _keylineFrameForCustomEditMode:10 option:v13 slot:v8 selectedSlot:v9];
      CGFloat v148 = v18;
      CGFloat v20 = v19;
      CGFloat rect = v19;
      double v22 = v21;
      CGFloat v24 = v23;
      objc_super v25 = [(NTKMargaritaFaceView *)self device];
      [v25 screenCornerRadius];
      double v27 = v22 * v26;
      [v25 screenBounds];
      CGFloat v29 = v27 / v28;
      v166.origin.double x = v148;
      v166.origin.double y = v20;
      v166.size.CGFloat width = v22;
      v166.size.CGFloat height = v24;
      CGFloat v30 = v24;
      double v142 = v29;
      CGRect v167 = CGRectInset(v166, v29, v29);
      CGFloat v121 = v167.origin.x;
      CGFloat v31 = v167.origin.y;
      CGFloat v125 = v167.size.width;
      CGFloat v32 = v167.size.height;
      v167.origin.double x = v14;
      v167.origin.double y = v15;
      v167.size.CGFloat width = v16;
      v167.size.CGFloat height = v17;
      CGFloat MaxX = CGRectGetMaxX(v167);
      v168.origin.double x = v14;
      v168.origin.double y = v15;
      v168.size.CGFloat width = v16;
      v168.size.CGFloat height = v17;
      double MaxY = CGRectGetMaxY(v168);
      v169.origin.double x = v14;
      v169.origin.double y = v15;
      v169.size.CGFloat width = v16;
      v169.size.CGFloat height = v17;
      double MinX = CGRectGetMinX(v169);
      v170.origin.double x = v14;
      v170.origin.double y = v15;
      v170.size.CGFloat width = v16;
      v170.size.CGFloat height = v17;
      double v129 = CGRectGetMaxY(v170);
      v171.origin.double x = v14;
      v171.origin.double y = v15;
      v171.size.CGFloat width = v16;
      v171.size.CGFloat height = v17;
      CGFloat v146 = CGRectGetMinX(v171);
      v172.origin.double x = v14;
      v172.origin.double y = v15;
      v172.size.CGFloat width = v16;
      v172.size.CGFloat height = v17;
      double MinY = CGRectGetMinY(v172);
      v173.origin.double x = v14;
      v173.origin.double y = v15;
      v173.size.CGFloat width = v16;
      v173.size.CGFloat height = v17;
      double v141 = CGRectGetMaxX(v173);
      *(CGFloat *)v145 = v14;
      *(CGFloat *)&v145[8] = v15;
      v174.origin.double x = v14;
      v174.origin.double y = v15;
      *(CGFloat *)&v145[16] = v16;
      *(CGFloat *)&v145[24] = v17;
      v174.size.CGFloat width = v16;
      v174.size.CGFloat height = v17;
      double v136 = CGRectGetMinY(v174);
      v175.origin.double y = y;
      v175.origin.double x = x;
      v175.size.CGFloat width = width;
      v175.size.CGFloat height = height;
      double MidY = CGRectGetMidY(v175);
      v176.origin.double x = v148;
      v176.origin.double y = rect;
      CGFloat v34 = v22;
      v176.size.CGFloat width = v22;
      v176.size.CGFloat height = v30;
      double v35 = CGRectGetMidY(v176);
      v177.origin.double x = v121;
      v177.origin.double y = v31;
      v177.size.CGFloat width = v125;
      v177.size.CGFloat height = v32;
      double v119 = CGRectGetMinX(v177);
      CGFloat v36 = v121;
      CGFloat v37 = v31;
      CGFloat v38 = v125;
      CGFloat v39 = v32;
      if (MidY < v35)
      {
        double v118 = CGRectGetMinY(*(CGRect *)&v36);
        v178.origin.double x = v121;
        v178.origin.double y = v31;
        v178.size.CGFloat width = v125;
        v178.size.CGFloat height = v32;
        double v117 = CGRectGetMaxX(v178);
        v179.origin.double x = v121;
        v179.origin.double y = v31;
        v179.size.CGFloat width = v125;
        v179.size.CGFloat height = v32;
        double v41 = CGRectGetMinY(v179);
      }
      else
      {
        double v118 = CGRectGetMaxY(*(CGRect *)&v36);
        v180.origin.double x = v121;
        v180.origin.double y = v31;
        v180.size.CGFloat width = v125;
        v180.size.CGFloat height = v32;
        double v117 = CGRectGetMaxX(v180);
        v181.origin.double x = v121;
        v181.origin.double y = v31;
        v181.size.CGFloat width = v125;
        v181.size.CGFloat height = v32;
        double v41 = CGRectGetMaxY(v181);
      }
      double v116 = v41;
      double v120 = v142 - v131;
      v182.origin.double x = v121;
      v182.origin.double y = v31;
      v182.size.CGFloat width = v125;
      v182.size.CGFloat height = v32;
      CGFloat v140 = CGRectGetMaxX(v182);
      v183.origin.double x = v121;
      v183.origin.double y = v31;
      v183.size.CGFloat width = v125;
      v183.size.CGFloat height = v32;
      CGFloat v138 = CGRectGetMaxY(v183);
      v184.origin.double x = v148;
      v184.origin.double y = rect;
      v184.size.CGFloat width = v22;
      v184.size.CGFloat height = v30;
      double v122 = CGRectGetMinX(v184);
      v185.origin.double x = v121;
      v185.origin.double y = v31;
      v185.size.CGFloat width = v125;
      v185.size.CGFloat height = v32;
      CGFloat v128 = CGRectGetMaxY(v185);
      v186.origin.double x = v148;
      v186.origin.double y = rect;
      v186.size.CGFloat width = v22;
      v186.size.CGFloat height = v30;
      double v127 = CGRectGetMinX(v186) + -1.0;
      v187.origin.double x = v148;
      v187.origin.double y = rect;
      v187.size.CGFloat width = v22;
      v187.size.CGFloat height = v30;
      double v130 = CGRectGetMinY(v187) + -1.0;
      v188.origin.double x = v121;
      v188.origin.double y = v31;
      v188.size.CGFloat width = v125;
      v188.size.CGFloat height = v32;
      CGFloat v42 = CGRectGetMaxX(v188);
      v189.origin.double x = v148;
      v189.origin.double y = rect;
      v189.size.CGFloat width = v34;
      double v43 = -1.0;
      v189.size.CGFloat height = v30;
      double v44 = CGRectGetMinY(v189) + -1.0;
      v190.origin.double x = v42;
      v190.origin.double y = v44;
      v190.size.CGFloat width = v142 + 1.0;
      v190.size.CGFloat height = v142 + 1.0;
      double v45 = MaxX;
      v156.double x = MaxX;
      v156.double y = MaxY;
      BOOL v46 = CGRectContainsPoint(v190, v156);
      CGFloat v48 = v138;
      CGFloat v47 = v140;
      CGFloat v124 = v44;
      CGFloat v126 = v42;
      if (v46)
      {
        v191.origin.double x = v42;
        v191.origin.double y = v44;
        v191.size.CGFloat width = v142 + 1.0;
        v191.size.CGFloat height = v142 + 1.0;
        double v49 = CGRectGetMaxY(v191);
        v192.origin.double x = *(CGFloat *)v145;
        v192.origin.double y = *(CGFloat *)&v145[8];
        v192.size.CGFloat width = *(CGFloat *)&v145[16];
        v192.size.CGFloat height = v17;
        CGFloat v50 = CGRectGetMaxY(v192);
        long double v51 = acos((v49 - v50) / v120);
        v193.origin.double x = v42;
        v193.origin.double y = v44;
        v193.size.CGFloat width = v142 + 1.0;
        v193.size.CGFloat height = v142 + 1.0;
        double v52 = CGRectGetMinX(v193);
        double v45 = v52 + sin(v51) * v120;
        double v53 = v51 + 4.71238898;
        CGFloat v54 = v129;
        CGFloat v55 = MinX;
        double v56 = v142 - v131;
      }
      else
      {
        double v57 = v142 + 1.0;
        double v58 = v142 + 1.0;
        v157.double x = MaxX;
        v157.double y = MaxY;
        BOOL v59 = CGRectContainsPoint(*(CGRect *)&v47, v157);
        double v53 = 0.0;
        CGFloat v54 = v129;
        CGFloat v55 = MinX;
        double v56 = v142 - v131;
        if (v59)
        {
          double v60 = CGRectGetMaxY(*(CGRect *)v145);
          v194.origin.double x = v140;
          v194.origin.double y = v138;
          v194.size.CGFloat width = v142 + 1.0;
          v194.size.CGFloat height = v142 + 1.0;
          double v61 = (v60 - CGRectGetMinY(v194)) / v120;
          if (v61 > 1.0) {
            double v61 = 1.0;
          }
          long double v62 = acos(v61);
          v195.origin.double x = v140;
          v195.origin.double y = v138;
          CGFloat v54 = v129;
          double v43 = -1.0;
          v195.size.CGFloat width = v142 + 1.0;
          v195.size.CGFloat height = v142 + 1.0;
          double v63 = CGRectGetMinX(v195);
          double v45 = v63 + sin(v62) * v120;
          double v53 = 1.57079633 - v62;
        }
      }
      double v149 = v53;
      double v144 = v45;
      double v64 = v122 + v43;
      v196.origin.double x = v127;
      v196.origin.double y = v130;
      v196.size.CGFloat width = v142 + 1.0;
      v196.size.CGFloat height = v142 + 1.0;
      v158.double x = v55;
      v158.double y = v54;
      if (CGRectContainsPoint(v196, v158))
      {
        v197.origin.double x = v127;
        v197.origin.double y = v130;
        v197.size.CGFloat width = v142 + 1.0;
        v197.size.CGFloat height = v142 + 1.0;
        double v65 = CGRectGetMaxY(v197);
        CGFloat v66 = CGRectGetMaxY(*(CGRect *)v145);
        long double v67 = acos((v65 - v66) / v56);
        v198.origin.double x = v127;
        v198.origin.double y = v130;
        v198.size.CGFloat width = v142 + 1.0;
        v198.size.CGFloat height = v142 + 1.0;
        double v68 = CGRectGetMaxX(v198);
        double MinX = v68 - sin(v67) * v56;
        double recta = 4.71238898 - v67;
        double v69 = v146;
        CGFloat v70 = v128;
      }
      else
      {
        v199.origin.double x = v64;
        v159.double y = v54;
        CGFloat v70 = v128;
        v199.origin.double y = v128;
        v199.size.CGFloat width = v142 + 1.0;
        v199.size.CGFloat height = v142 + 1.0;
        v159.double x = v55;
        if (CGRectContainsPoint(v199, v159))
        {
          double v71 = CGRectGetMaxY(*(CGRect *)v145);
          v200.origin.double x = v64;
          v200.origin.double y = v128;
          v200.size.CGFloat width = v142 + 1.0;
          v200.size.CGFloat height = v142 + 1.0;
          double v72 = (v71 - CGRectGetMinY(v200)) / v56;
          if (v72 > 1.0) {
            double v72 = 1.0;
          }
          long double v73 = acos(v72);
          v201.origin.double x = v64;
          v201.origin.double y = v128;
          v201.size.CGFloat width = v142 + 1.0;
          v201.size.CGFloat height = v142 + 1.0;
          double v74 = CGRectGetMaxX(v201);
          double MinX = v74 - sin(v73) * v56;
          double v75 = v73 + 1.57079633;
        }
        else
        {
          double v75 = 3.14159265;
        }
        double recta = v75;
        double v69 = v146;
      }
      v202.origin.double x = v64;
      v202.origin.double y = v70;
      v202.size.CGFloat width = v142 + 1.0;
      v202.size.CGFloat height = v142 + 1.0;
      v160.double x = v69;
      v160.double y = MinY;
      CGFloat v123 = v64;
      if (CGRectContainsPoint(v202, v160))
      {
        double v76 = CGRectGetMinY(*(CGRect *)v145);
        v203.origin.double x = v64;
        v203.origin.double y = v70;
        v203.size.CGFloat width = v142 + 1.0;
        v203.size.CGFloat height = v142 + 1.0;
        CGFloat v77 = CGRectGetMinY(v203);
        long double v78 = acos((v76 - v77) / v56);
        v204.origin.double x = v64;
        v204.origin.double y = v70;
        v204.size.CGFloat width = v142 + 1.0;
        v204.size.CGFloat height = v142 + 1.0;
        double v79 = CGRectGetMaxX(v204);
        double v69 = v79 - sin(v78) * v56;
        double v80 = v78 + 1.57079633;
      }
      else
      {
        v205.origin.double x = v127;
        v161.double y = MinY;
        v205.origin.double y = v130;
        v205.size.CGFloat width = v142 + 1.0;
        v205.size.CGFloat height = v142 + 1.0;
        v161.double x = v69;
        if (CGRectContainsPoint(v205, v161))
        {
          v206.origin.double x = v127;
          v206.origin.double y = v130;
          v206.size.CGFloat width = v142 + 1.0;
          v206.size.CGFloat height = v142 + 1.0;
          double v81 = CGRectGetMaxY(v206);
          double v82 = (v81 - CGRectGetMinY(*(CGRect *)v145)) / v56;
          if (v82 > 1.0) {
            double v82 = 1.0;
          }
          long double v83 = acos(v82);
          v207.origin.double x = v127;
          v207.origin.double y = v130;
          v207.size.CGFloat width = v142 + 1.0;
          v207.size.CGFloat height = v142 + 1.0;
          double v84 = CGRectGetMaxX(v207);
          double v69 = v84 - sin(v83) * v56;
          double v80 = 4.71238898 - v83;
        }
        else
        {
          double v80 = 3.14159265;
        }
      }
      v208.origin.double x = v140;
      v208.origin.double y = v138;
      v208.size.CGFloat width = v142 + 1.0;
      v208.size.CGFloat height = v142 + 1.0;
      v162.double x = v141;
      v162.double y = v136;
      double v147 = v69;
      if (CGRectContainsPoint(v208, v162))
      {
        double v85 = CGRectGetMinY(*(CGRect *)v145);
        v209.origin.double x = v140;
        v209.origin.double y = v138;
        v209.size.CGFloat width = v142 + 1.0;
        v209.size.CGFloat height = v142 + 1.0;
        CGFloat v86 = CGRectGetMinY(v209);
        long double v87 = acos((v85 - v86) / v56);
        v210.origin.double x = v140;
        v210.origin.double y = v138;
        v210.size.CGFloat width = v142 + 1.0;
        v210.size.CGFloat height = v142 + 1.0;
        double v88 = CGRectGetMinX(v210);
        double v141 = v88 + sin(v87) * v56;
        double v89 = 1.57079633 - v87;
        double v90 = MaxY;
        CGFloat v91 = v128;
      }
      else
      {
        v211.origin.double y = v124;
        v211.origin.double x = v126;
        v211.size.CGFloat width = v142 + 1.0;
        v211.size.CGFloat height = v142 + 1.0;
        v163.double x = v141;
        v163.double y = v136;
        double v89 = 0.0;
        double v90 = MaxY;
        CGFloat v91 = v128;
        if (CGRectContainsPoint(v211, v163))
        {
          v212.origin.double x = v126;
          v212.origin.double y = v124;
          v212.size.CGFloat width = v142 + 1.0;
          v212.size.CGFloat height = v142 + 1.0;
          double v92 = CGRectGetMaxY(v212);
          double v93 = (v92 - CGRectGetMinY(*(CGRect *)v145)) / v56;
          if (v93 > 1.0) {
            double v93 = 1.0;
          }
          long double v94 = acos(v93);
          v213.origin.double x = v126;
          v213.origin.double y = v124;
          v213.size.CGFloat width = v142 + 1.0;
          v213.size.CGFloat height = v142 + 1.0;
          double v95 = CGRectGetMinX(v213);
          double v141 = v95 + sin(v94) * v56;
          double v89 = v94 + 4.71238898;
        }
      }
      v96 = v10 - 1;
      if (v10 - 1 == v11)
      {
        double v107 = v142 + -3.0;
        v217.origin.double x = v127;
        v217.origin.double y = v130;
        v217.size.CGFloat width = v142 + 1.0;
        v217.size.CGFloat height = v142 + 1.0;
        double MinY = MinY + -3.5;
        double v108 = fmax((CGRectGetMaxY(v217) - MinY) / (v142 + -3.0), 0.0);
        if (v108 > 1.0) {
          double v108 = 1.0;
        }
        long double v109 = acos(v108);
        v218.origin.double x = v127;
        v218.origin.double y = v130;
        v218.size.CGFloat width = v142 + 1.0;
        v218.size.CGFloat height = v142 + 1.0;
        double v110 = CGRectGetMaxX(v218);
        double v111 = sin(v109);
        double v147 = v110 - v111 * v107;
        double v80 = 4.71238898 - v109;
        double v136 = v136 + -3.5;
        double v90 = MaxY;
        v219.origin.double y = v124;
        v219.origin.double x = v126;
        v219.size.CGFloat width = v142 + 1.0;
        v219.size.CGFloat height = v142 + 1.0;
        double v141 = CGRectGetMinX(v219) + v111 * v107;
        if (v109 + 4.71238898 >= 6.28318531) {
          double v89 = v109 + 4.71238898 + -6.28318531;
        }
        else {
          double v89 = v109 + 4.71238898;
        }
        uint64_t v102 = 1;
        double v104 = 1.57079633;
        double v103 = v131;
        double v106 = 3.0;
        double v105 = 1.57079633;
      }
      else if (v10 + 1 == v11)
      {
        double v97 = v142 + -3.0;
        v214.origin.double x = v123;
        v214.origin.double y = v91;
        v214.size.CGFloat width = v142 + 1.0;
        v214.size.CGFloat height = v142 + 1.0;
        double v129 = v129 + 3.5;
        double v98 = fmax((v129 - CGRectGetMinY(v214)) / (v142 + -3.0), 0.0);
        if (v98 > 1.0) {
          double v98 = 1.0;
        }
        long double v99 = acos(v98);
        v215.origin.double x = v123;
        v215.origin.double y = v91;
        v215.size.CGFloat width = v142 + 1.0;
        v215.size.CGFloat height = v142 + 1.0;
        double v100 = CGRectGetMaxX(v215);
        double v101 = sin(v99);
        double MinX = v100 - v101 * v97;
        double recta = v99 + 1.57079633;
        double v90 = MaxY + 3.5;
        v216.origin.double y = v138;
        v216.origin.double x = v140;
        v216.size.CGFloat width = v142 + 1.0;
        v216.size.CGFloat height = v142 + 1.0;
        uint64_t v102 = 0;
        double v144 = CGRectGetMinX(v216) + v101 * v97;
        double v149 = 1.57079633 - v99;
        double v103 = 3.0;
        double v104 = 4.71238898;
        double v105 = 4.71238898;
        double v106 = v131;
      }
      else
      {
        uint64_t v102 = 1;
        double v105 = 1.57079633;
        double v104 = 4.71238898;
        double v106 = v131;
        double v103 = v131;
      }
      v112 = +[UIBezierPath bezierPath];
      v113 = v112;
      double v114 = v149;
      if (vabdd_f64(v89, v149) > 0.0001)
      {
        objc_msgSend(v112, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v117 - x, v116 - y, v142, v89, v149);
        double v114 = v149;
      }
      if (vabdd_f64(v105, v114) > 0.0001) {
        objc_msgSend(v113, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", v102, v144 - x, v90 - y, v103);
      }
      if (vabdd_f64(recta, v105) > 0.0001) {
        objc_msgSend(v113, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", v102, MinX - x, v129 - y, v103, v105, recta);
      }
      if (vabdd_f64(recta, v80) > 0.0001) {
        objc_msgSend(v113, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v119 - x, v118 - y, v142, recta, v80);
      }
      if (vabdd_f64(v104, v80) > 0.0001) {
        objc_msgSend(v113, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", v96 != v11, v147 - x, MinY - y, v106, v80, v104);
      }
      if (vabdd_f64(v89, v104) > 0.0001) {
        objc_msgSend(v113, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", v96 != v11, v141 - x, v136 - y, v106, v104, v89);
      }
      [v113 closePath];
      v40 = NTKKeylineViewWithBezierPath();
    }
  }
  else
  {
    v153.receiver = self;
    v153.super_class = (Class)NTKMargaritaFaceView;
    v40 = [(NTKMargaritaFaceView *)&v153 _keylineViewForCustomEditMode:a3 slot:v8 selectedSlot:v9];
  }

  return v40;
}

- (BOOL)_faceEditingViewShouldOffsetForComplicationEditMode
{
  objc_super v2 = [(NTKMargaritaFaceView *)self optionForCustomEditMode:15 slot:0];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v3 = v2;
    BOOL v4 = [v3 style] == (char *)&dword_0 + 2 || objc_msgSend(v3, "style") == (char *)&dword_0 + 3;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_keylineSelectionChangingTo:(id)a3 editMode:(int64_t)a4
{
  id v7 = a3;
  if (a4 == 10)
  {
    id v9 = v7;
    id v8 = [(NTKMargaritaFaceView *)self delegate];
    [v8 faceViewWantsCustomKeylineFramesReloadedForEditMode:10];

    objc_storeStrong((id *)&self->_selectedStripeSlot, a3);
    id v7 = v9;
  }
}

- (CGRect)_keylineFrameForCustomEditMode:(int64_t)a3 option:(id)a4 slot:(id)a5 selectedSlot:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (a3 == 10)
  {
    CGAffineTransform v13 = [(NTKMargaritaFaceView *)self optionForCustomEditMode:11 slot:0];
    id v14 = [v13 count];

    id v15 = v10;
    if (([v11 isEqualToString:v12] & 1) == 0)
    {
      uint64_t v16 = [(NTKMargaritaFaceView *)self optionForCustomEditMode:10 slot:v12];

      id v15 = (id)v16;
    }
    [(NTKMargaritaFaceView *)self _keylineFrameForStripeAtSlot:v11 withEditOption:v15 stripeCount:v14 selectedSlot:v12];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
  }
  else
  {
    v33.receiver = self;
    v33.super_class = (Class)NTKMargaritaFaceView;
    [(NTKMargaritaFaceView *)&v33 _keylineFrameForCustomEditMode:a3 option:v10 slot:v11 selectedSlot:v12];
    double v18 = v25;
    double v20 = v26;
    double v22 = v27;
    double v24 = v28;
  }

  double v29 = v18;
  double v30 = v20;
  double v31 = v22;
  double v32 = v24;
  result.size.CGFloat height = v32;
  result.size.CGFloat width = v31;
  result.origin.double y = v30;
  result.origin.double x = v29;
  return result;
}

- (CGRect)_keylineFrameForStripeAtSlot:(id)a3 withEditOption:(id)a4 stripeCount:(unint64_t)a5 selectedSlot:(id)a6
{
  v28.receiver = self;
  v28.super_class = (Class)NTKMargaritaFaceView;
  id v9 = a4;
  id v10 = a3;
  [(NTKMargaritaFaceView *)&v28 _keylineFrameForCustomEditMode:10 option:v9 slot:0 selectedSlot:0];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  v27.receiver = self;
  v27.super_class = (Class)NTKMargaritaFaceView;
  [(NTKMargaritaFaceView *)&v27 _faceViewFrameForEditMode:10 option:v9 slot:v10];
  double v20 = v19;
  double v22 = v21;

  id v23 = [v10 integerValue];
  double v24 = v22 / (double)a5;
  if (v23)
  {
    double MinY = v20 + v24 * (double)(uint64_t)v23;
  }
  else
  {
    v29.origin.double x = v12;
    v29.origin.double y = v14;
    v29.size.CGFloat width = v16;
    v29.size.CGFloat height = v18;
    double MinY = CGRectGetMinY(v29);
  }
  if (v23 == (id)(a5 - 1))
  {
    v30.origin.double x = v12;
    v30.origin.double y = v14;
    v30.size.CGFloat width = v16;
    v30.size.CGFloat height = v18;
    double MaxY = CGRectGetMaxY(v30);
  }
  else
  {
    double MaxY = v20 + v24 * (double)((uint64_t)v23 + 1);
  }
  v31.size.CGFloat height = MaxY - MinY;
  v31.origin.double x = v12;
  v31.origin.double y = MinY;
  v31.size.CGFloat width = v16;
  return CGRectInset(v31, -15.0, -15.0);
}

- (void)_applyTransitionFraction:(double)a3 fromComplication:(id)a4 toComplication:(id)a5 slot:(id)a6
{
  id v12 = a4;
  id v10 = a5;
  if ([a6 isEqualToString:NTKComplicationSlotBezel])
  {
    if ([v12 complicationType])
    {
      if ([v10 complicationType]) {
        goto LABEL_6;
      }
      a3 = 1.0 - a3;
    }
    double v11 = [(NTKMargaritaFaceView *)self backgroundView];
    [v11 applyTransitionFractionToCompactCircular:a3];
  }
LABEL_6:
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKMargaritaFaceView;
  [(NTKMargaritaFaceView *)&v7 _configureComplicationView:v6 forSlot:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 updateMonochromeColor];
  }
}

- (id)_complicationSlotsHiddenByCurrentConfiguration
{
  id v3 = [(NTKMargaritaFaceView *)self optionForCustomEditMode:15 slot:0];
  id v4 = [v3 style];

  double v5 = 0;
  if ((unint64_t)v4 <= 1)
  {
    id v6 = [(NTKMargaritaFaceView *)self delegate];
    objc_super v7 = [v6 faceViewComplicationSlots];
    double v5 = +[NSSet setWithArray:v7];
  }

  return v5;
}

- (void)_updateComplicationColors
{
  id v3 = [(NTKMargaritaFaceView *)self suggestedColorOptionForComplicationColor];
  if (v3)
  {
    id v4 = [(NTKMargaritaFaceView *)self colorPalette];
    [v4 setPigmentEditOption:v3];
  }
  double v5 = [(NTKMargaritaFaceView *)self colorPalette];
  id v6 = [v5 complication];

  [(NTKMargaritaFaceView *)self setComplicationColor:v6];
  [(NTKMargaritaFaceView *)self setInterpolatedComplicationColor:v6];
  [(NTKMargaritaFaceView *)self setAlternateComplicationColor:v6];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_48AC;
  v7[3] = &unk_10558;
  v7[4] = self;
  [(NTKMargaritaFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v7];
}

- (id)_utilityBezelComplicationView
{
  objc_super v2 = [(NTKMargaritaFaceView *)self normalComplicationDisplayWrapperForSlot:NTKComplicationSlotBezel];
  id v3 = [v2 display];
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

- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  id v6 = a3;
  objc_super v7 = [(NTKMargaritaFaceView *)self colorForView:v6 accented:0];
  id v8 = [(NTKMargaritaFaceView *)self colorForView:v6 accented:1];

  id v9 = CLKUIMonochromeFiltersForStyleWithTintedBackground();

  return v9;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4
{
  return [(NTKMargaritaFaceView *)self filtersForView:a3 style:a4 fraction:1.0];
}

- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  id v7 = a3;
  id v8 = [(NTKMargaritaFaceView *)self colorForView:v7 accented:0];
  id v9 = [(NTKMargaritaFaceView *)self colorForView:v7 accented:1];

  switch(a4)
  {
    case 0:
    case 2:
      int64_t v10 = NTKFlatMonochromeFilter();
      goto LABEL_4;
    case 1:
    case 3:
    case 4:
    case 5:
      int64_t v10 = NTKDesatMonochromeFilter();
LABEL_4:
      a4 = v10;
      break;
    default:
      break;
  }

  return (id)a4;
}

- (id)filterForView:(id)a3 style:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(NTKMargaritaFaceView *)self colorForView:v6 accented:0];
  id v8 = [(NTKMargaritaFaceView *)self colorForView:v6 accented:1];

  switch(a4)
  {
    case 0:
    case 2:
      int64_t v9 = NTKFlatMonochromeFilterOpaque();
      goto LABEL_4;
    case 1:
    case 3:
    case 4:
    case 5:
      int64_t v9 = NTKDesatMonochromeFilterOpaque();
LABEL_4:
      a4 = v9;
      break;
    default:
      break;
  }

  return (id)a4;
}

- (id)colorForView:(id)a3 accented:(BOOL)a4
{
  id v6 = a3;
  unsigned int v7 = [(NTKMargaritaFaceView *)self _usePrimaryColorForNonAccentedColorForView:v6];
  if (a4 || v7)
  {
    int64_t v9 = [(NTKMargaritaFaceView *)self suggestedColorOptionForComplicationColor];
    uint64_t v14 = 0;
    double v15 = &v14;
    uint64_t v16 = 0x3032000000;
    double v17 = sub_4E20;
    CGFloat v18 = sub_4E30;
    id v19 = 0;
    if (v9)
    {
      int64_t v10 = [(NTKMargaritaFaceView *)self colorPalette];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_4E38;
      v13[3] = &unk_10580;
      v13[4] = &v14;
      [v10 executeWithOption:v9 block:v13];

      double v11 = (void *)v15[5];
    }
    else
    {
      double v11 = 0;
    }
    id v8 = v11;
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    CLKUIDefaultAlternateComplicationColor();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)_usePrimaryColorForNonAccentedColorForView:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char isKindOfClass = 1;
    }
    else
    {
      id v6 = [v4 complicationTemplate];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int64_t v10 = [(NTKMargaritaFaceView *)self device];
  switch(a4)
  {
    case 11:
      objc_super v28 = -[NTKMargaritaFaceView _enabledStripeColorsWithCount:](self, "_enabledStripeColorsWithCount:", [v8 count]);
      objc_super v27 = +[NTKMargaritaBackgroundView stripeCountSwatchImageForDevice:v10 withColors:v28];
LABEL_10:

      break;
    case 14:
      objc_super v28 = [(NTKMargaritaFaceView *)self optionForCustomEditMode:11 slot:0];
      CGRect v29 = -[NTKMargaritaFaceView _enabledStripeColorsWithCount:](self, "_enabledStripeColorsWithCount:", [v28 count]);
      objc_super v27 = +[NTKMargaritaBackgroundView rotationSwatchImageForDevice:withColors:rotation:](NTKMargaritaBackgroundView, "rotationSwatchImageForDevice:withColors:rotation:", v10, v29, [v8 rotation]);

      goto LABEL_10;
    case 15:
      double v11 = [[NTKMargaritaFaceView alloc] initWithFaceStyle:44 forDevice:v10 clientIdentifier:0];
      [v10 screenBounds];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      -[NTKMargaritaFaceView setFrame:](v11, "setFrame:");
      [(NTKMargaritaFaceView *)v11 _loadSnapshotContentViews];
      double v20 = [(NTKMargaritaFaceView *)self optionForCustomEditMode:11 slot:0];
      [(NTKMargaritaFaceView *)v11 _applyOption:v20 forCustomEditMode:11 slot:0];
      [(NTKMargaritaFaceView *)v11 _applyOption:v8 forCustomEditMode:15 slot:0];
      CGRect v31 = [(NTKMargaritaFaceView *)self optionForCustomEditMode:14 slot:0];
      -[NTKMargaritaFaceView _applyOption:forCustomEditMode:slot:](v11, "_applyOption:forCustomEditMode:slot:");
      if ([v20 count])
      {
        unint64_t v21 = 0;
        do
        {
          double v22 = +[NSString stringWithFormat:@"%lu", v21];
          id v23 = [(NTKMargaritaFaceView *)self optionForCustomEditMode:10 slot:v22];
          [(NTKMargaritaFaceView *)v11 setOption:v23 forCustomEditMode:10 slot:v22];

          ++v21;
        }
        while (v21 < (unint64_t)[v20 count]);
      }
      double v24 = NTKIdealizedDate();
      [(NTKMargaritaFaceView *)v11 setOverrideDate:v24 duration:0.0];

      id v25 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithBounds:", v13, v15, v17, v19);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_52C4;
      v33[3] = &unk_105A8;
      CGFloat v34 = v11;
      double v26 = v11;
      objc_super v27 = [v25 imageWithActions:v33];

      break;
    default:
      v32.receiver = self;
      v32.super_class = (Class)NTKMargaritaFaceView;
      objc_super v27 = [(NTKMargaritaFaceView *)&v32 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:v9];
      break;
  }

  return v27;
}

- (id)_enabledStripeColorsWithCount:(unint64_t)a3
{
  double v5 = objc_opt_new();
  if (a3)
  {
    uint64_t v6 = 0;
    do
    {
      unsigned int v7 = +[NSString stringWithFormat:@"%lu", v6];
      id v8 = [(NTKMargaritaFaceView *)self optionForCustomEditMode:10 slot:v7];
      id v9 = [v8 pigmentEditOption];

      int64_t v10 = [(NTKMargaritaFaceView *)self colorPalette];
      [v10 setPigmentEditOption:v9];

      double v11 = [(NTKMargaritaFaceView *)self colorPalette];
      double v12 = [v11 stripe];
      [v5 addObject:v12];

      ++v6;
    }
    while (a3 != v6);
  }

  return v5;
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  if ((unint64_t)(a3 - 11) > 4) {
    return 0;
  }
  else {
    return (&off_10618)[a3 - 11];
  }
}

- (id)suggestedColorOptionForComplicationColor
{
  id v3 = [(NTKMargaritaFaceView *)self editConfigurations];
  id v4 = [v3 objectForKeyedSubscript:&off_119F8];

  double v5 = +[NSMutableDictionary dictionary];
  objc_super v27 = v4;
  uint64_t v6 = [v4 editOptionForSlot:@"0"];
  unsigned int v7 = [v6 pigmentEditOption];

  id v25 = v7;
  if (v25)
  {
    if (self->_stripeCount)
    {
      uint64_t v8 = 0;
      unint64_t v26 = 1;
      unint64_t v9 = 1;
      int64_t v10 = v25;
      while (1)
      {
        double v11 = +[NSNumber numberWithInteger:v8];
        double v12 = [v11 stringValue];
        double v13 = [v27 editOptionForSlot:v12];
        double v14 = [v13 pigmentEditOption];

        if (v14)
        {
          double v15 = [v5 objectForKeyedSubscript:v14];

          if (v15)
          {
            double v16 = [v5 objectForKeyedSubscript:v14];
            double v17 = (char *)[v16 integerValue];

            double v18 = +[NSNumber numberWithInteger:v17 + 1];
            [v5 setObject:v18 forKeyedSubscript:v14];

            if (!v8) {
              goto LABEL_17;
            }
LABEL_9:
            id v19 = v14;
            if ([v19 isEqual:v10])
            {
              uint64_t v20 = v9 + 1;
LABEL_16:

              unint64_t v9 = v20;
              goto LABEL_17;
            }
            if (v9 > v26)
            {
LABEL_14:
              id v21 = v10;

              id v25 = v21;
            }
            else if ([v25 isWhiteColor])
            {
              if (v9 == v26) {
                goto LABEL_14;
              }
              unint64_t v9 = v26;
            }
            else
            {
              unint64_t v9 = v26;
            }
            id v22 = v19;

            int64_t v10 = v22;
            uint64_t v20 = 1;
            unint64_t v26 = v9;
            goto LABEL_16;
          }
          [v5 setObject:&off_11A40 forKeyedSubscript:v14];
          if (v8) {
            goto LABEL_9;
          }
        }
LABEL_17:

        if (++v8 >= self->_stripeCount) {
          goto LABEL_23;
        }
      }
    }
    unint64_t v26 = 1;
    int64_t v10 = v25;
LABEL_23:
    id v23 = [(NTKMargaritaFaceView *)self _findMostFrequentColorWithFrequencies:v5 withLongestColor:v25 longestLength:v26];
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

- (id)_findMostFrequentColorWithFrequencies:(id)a3 withLongestColor:(id)a4 longestLength:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_4E20;
  id v23 = sub_4E30;
  id v24 = 0;
  uint64_t v15 = 0;
  double v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_58BC;
  v14[3] = &unk_105D0;
  v14[5] = &v15;
  v14[6] = &v19;
  v14[4] = self;
  [v7 enumerateKeysAndObjectsUsingBlock:v14];
  unint64_t v9 = [v7 objectForKey:v8];
  id v10 = [v9 integerValue];

  double v11 = v8;
  if (v10 != (id)v16[3]) {
    double v11 = (void *)v20[5];
  }
  id v12 = v11;
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v12;
}

- (unint64_t)slotIndexForOption:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  double v5 = [(NTKMargaritaFaceView *)self editConfigurations];
  uint64_t v6 = [v5 objectForKeyedSubscript:&off_119F8];

  id v7 = [(NTKMargaritaFaceView *)self device];
  id v8 = +[NTKMargaritaFace _slotsForCustomEditMode:10 forDevice:v7];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_5B14;
  v13[3] = &unk_105F8;
  id v9 = v6;
  id v14 = v9;
  id v10 = v4;
  id v15 = v10;
  double v16 = &v17;
  [v8 enumerateObjectsUsingBlock:v13];
  unint64_t v11 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (NTKMargaritaBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (void)setDialView:(id)a3
{
}

- (NTKAnalogHandsView)analogTimeView
{
  return self->_analogTimeView;
}

- (void)setAnalogTimeView:(id)a3
{
}

- (NTKBigNumeralsDigitalTimeView)digitalTimeView
{
  return self->_digitalTimeView;
}

- (void)setDigitalTimeView:(id)a3
{
}

- (NTKFaceColorPalette)blackPalette
{
  return self->_blackPalette;
}

- (void)setBlackPalette:(id)a3
{
}

- (void)setTransitionalPalette:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionalPalette, 0);
  objc_storeStrong((id *)&self->_blackPalette, 0);
  objc_storeStrong((id *)&self->_digitalTimeView, 0);
  objc_storeStrong((id *)&self->_analogTimeView, 0);
  objc_storeStrong((id *)&self->_dialView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_selectedStripeSlot, 0);
}

@end