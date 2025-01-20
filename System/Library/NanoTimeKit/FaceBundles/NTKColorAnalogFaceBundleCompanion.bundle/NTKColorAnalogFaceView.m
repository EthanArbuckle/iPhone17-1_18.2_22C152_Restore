@interface NTKColorAnalogFaceView
+ (Class)_timeViewClass;
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4;
- (BOOL)_needsForegroundContainerView;
- (BOOL)_wantsStatusBarIconShadow;
- (CGRect)_frameForComplicationDisplayWrapper:(id)a3 inSlot:(id)a4;
- (CGRect)_monogramReferenceFrame;
- (CGRect)_monogramReferenceFrameForStyle:(unint64_t)a3;
- (NTKColorAnalogFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (UIColor)complicationForegroundColor;
- (UIEdgeInsets)_monogramKeylinePadding;
- (double)_edgeGapForState:(int64_t)a3;
- (double)_keylineCornerRadiusForComplicationSlot:(id)a3;
- (double)_keylinePaddingForState:(int64_t)a3;
- (double)_lisaGapForState:(int64_t)a3;
- (id)_colorComplicationViewForSlot:(id)a3;
- (id)_complicationContainerViewForSlot:(id)a3;
- (id)_keylineViewForComplicationSlot:(id)a3;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (int64_t)_complicationPickerStyleForSlot:(id)a3;
- (int64_t)_keylineStyleForComplicationSlot:(id)a3;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_cleanupAfterTransitionToOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_configureTimeView:(id)a3;
- (void)_enumerateColorComplicationSlotsWithBlock:(id)a3;
- (void)_fadeComplicationFraction:(double)a3 entry:(double)a4 exit:(double)a5 slot:(id)a6;
- (void)_loadLayoutRules;
- (void)_loadSnapshotContentViews;
- (void)_unloadSnapshotContentViews;
- (void)_updateMonogramLayoutRule;
- (void)layoutSubviews;
- (void)setComplicationForegroundColor:(id)a3;
@end

@implementation NTKColorAnalogFaceView

+ (Class)_timeViewClass
{
  return (Class)objc_opt_class();
}

- (NTKColorAnalogFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)NTKColorAnalogFaceView;
  v5 = [(NTKColorAnalogFaceView *)&v12 initWithFaceStyle:a3 forDevice:a4 clientIdentifier:a5];
  if (v5)
  {
    id v6 = objc_alloc((Class)UIView);
    [(NTKColorAnalogFaceView *)v5 bounds];
    v7 = (UIView *)objc_msgSend(v6, "initWithFrame:");
    backgroundComplicationContainerView = v5->_backgroundComplicationContainerView;
    v5->_backgroundComplicationContainerView = v7;

    v9 = [(NTKColorAnalogFaceView *)v5 contentView];
    [v9 insertSubview:v5->_backgroundComplicationContainerView atIndex:0];

    CGSize size = CGRectNull.size;
    v5->_monogramOverrideFrame.origin = CGRectNull.origin;
    v5->_monogramOverrideFrame.CGSize size = size;
  }
  return v5;
}

- (void)_loadSnapshotContentViews
{
  v18.receiver = self;
  v18.super_class = (Class)NTKColorAnalogFaceView;
  [(NTKColorAnalogFaceView *)&v18 _loadSnapshotContentViews];
  v3 = [NTKColorAnalogBackgroundView alloc];
  [(NTKColorAnalogFaceView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  objc_super v12 = [(NTKColorAnalogFaceView *)self device];
  v13 = -[NTKColorAnalogBackgroundView initWithFrame:device:](v3, "initWithFrame:device:", v12, v5, v7, v9, v11);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v13;

  v15 = [(NTKColorAnalogFaceView *)self contentView];
  [v15 addSubview:self->_backgroundView];

  v16 = [(NTKColorAnalogFaceView *)self contentView];
  v17 = +[UIColor blackColor];
  [v16 setBackgroundColor:v17];
}

- (void)_unloadSnapshotContentViews
{
  v6.receiver = self;
  v6.super_class = (Class)NTKColorAnalogFaceView;
  [(NTKColorAnalogFaceView *)&v6 _unloadSnapshotContentViews];
  [(NTKColorAnalogBackgroundView *)self->_backgroundView removeFromSuperview];
  backgroundView = self->_backgroundView;
  self->_backgroundView = 0;

  double v4 = [(NTKColorAnalogFaceView *)self contentView];
  double v5 = +[UIColor clearColor];
  [v4 setBackgroundColor:v5];
}

- (BOOL)_needsForegroundContainerView
{
  return 1;
}

- (id)_complicationContainerViewForSlot:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:NTKComplicationSlotMonogram])
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKColorAnalogFaceView;
    double v5 = [(NTKColorAnalogFaceView *)&v8 _complicationContainerViewForSlot:v4];
  }
  else
  {
    double v5 = self->_backgroundComplicationContainerView;
  }
  objc_super v6 = v5;

  return v6;
}

- (void)_configureTimeView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKColorAnalogFaceView;
  id v3 = a3;
  [(NTKColorAnalogFaceView *)&v6 _configureTimeView:v3];
  id v4 = objc_msgSend(v3, "secondHandView", v6.receiver, v6.super_class);

  double v5 = +[UIColor systemOrangeColor];
  [v4 setColor:v5];
}

- (BOOL)_wantsStatusBarIconShadow
{
  return self->_currentStyle == 2;
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  uint64_t v7 = NTKComplicationSlotMonogram;
  id v8 = a3;
  LODWORD(a5) = [a5 isEqualToString:v7];
  id v9 = [v8 complicationType];

  double v10 = +[NTKCircularComplicationView viewForComplicationType:v9];
  double v11 = v10;
  objc_super v12 = &OBJC_IVAR___NTKColorAnalogFaceView__complicationForegroundColor;
  if (a5) {
    objc_super v12 = &OBJC_IVAR___NTKColorAnalogFaceView__monogramForegroundColor;
  }
  [v10 setForegroundColor:*(void *)&self->NTKAnalogFaceView_opaque[*v12]];
  [v11 setPlatterColor:self->_complicationPlatterColor];
  [v11 setUseRoundedFontDesign:1];
  return v11;
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v10 = a3;
  unsigned int v6 = [a4 isEqualToString:NTKComplicationSlotMonogram];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = &OBJC_IVAR___NTKColorAnalogFaceView__complicationForegroundColor;
    if (v6) {
      uint64_t v7 = &OBJC_IVAR___NTKColorAnalogFaceView__monogramForegroundColor;
    }
    uint64_t v8 = *(void *)&self->NTKAnalogFaceView_opaque[*v7];
    id v9 = v10;
    [v9 setForegroundColor:v8];
    [v9 setPlatterColor:self->_complicationPlatterColor];
    [v9 setUseRoundedFontDesign:1];
  }
}

- (CGRect)_frameForComplicationDisplayWrapper:(id)a3 inSlot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:NTKComplicationSlotMonogram]
    && !CGRectIsNull(self->_monogramOverrideFrame))
  {
    CGFloat x = self->_monogramOverrideFrame.origin.x;
    CGFloat y = self->_monogramOverrideFrame.origin.y;
    CGFloat width = self->_monogramOverrideFrame.size.width;
    CGFloat height = self->_monogramOverrideFrame.size.height;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)NTKColorAnalogFaceView;
    [(NTKColorAnalogFaceView *)&v20 _frameForComplicationDisplayWrapper:v6 inSlot:v7];
    CGFloat x = v8;
    CGFloat y = v10;
    CGFloat width = v12;
    CGFloat height = v14;
  }

  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKColorAnalogFaceView;
  [(NTKColorAnalogFaceView *)&v3 layoutSubviews];
  [(NTKColorAnalogFaceView *)self layoutComplicationViews];
}

- (void)_loadLayoutRules
{
}

- (id)_keylineViewForComplicationSlot:(id)a3
{
  uint64_t v4 = NTKComplicationSlotMonogram;
  id v5 = a3;
  if ([v5 isEqualToString:v4])
  {
    uint64_t v6 = [(NTKColorAnalogFaceView *)self _defaultKeylineViewForComplicationSlot:v5];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NTKColorAnalogFaceView;
    uint64_t v6 = [(NTKColorAnalogFaceView *)&v9 _keylineViewForComplicationSlot:v5];
  }
  id v7 = (void *)v6;

  return v7;
}

- (double)_edgeGapForState:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 2)
  {
    if (a3 == 1)
    {
      objc_super v3 = [(NTKColorAnalogFaceView *)self device];
      NTKColorFaceViewEdgeGapEditing();
    }
    else
    {
      objc_super v3 = [(NTKColorAnalogFaceView *)self device];
      NTKColorFaceViewEdgeGapNormal();
    }
  }
  else
  {
    objc_super v3 = [(NTKColorAnalogFaceView *)self device];
    NTKColorFaceViewEdgeGapDeselected();
  }
  double v5 = v4;

  return v5;
}

- (double)_keylinePaddingForState:(int64_t)a3
{
  double v3 = 0.0;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    NTKKeylineWidth();
    double v6 = v5;
    id v7 = [(NTKColorAnalogFaceView *)self device];
    NTKColorFaceViewDeselectedKeylineInnerPadding();
    double v3 = v6 + v8;
  }
  return v3;
}

- (double)_lisaGapForState:(int64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 2) {
    return 0.0;
  }
  double v3 = [(NTKColorAnalogFaceView *)self device];
  NTKColorFaceViewLisaKeylineGap();
  double v5 = v4;

  return v5;
}

- (UIEdgeInsets)_monogramKeylinePadding
{
  NTKKeylineWidth();
  double v4 = v3;
  double v5 = [(NTKColorAnalogFaceView *)self device];
  sub_8CA8(v5, (uint64_t)v16);
  double v6 = v4 + v17;

  NTKKeylineWidth();
  double v8 = v7;
  objc_super v9 = [(NTKColorAnalogFaceView *)self device];
  sub_8CA8(v9, (uint64_t)v15);
  double v10 = v8 + v15[6];

  double v11 = v6;
  double v12 = v10;
  double v13 = v6;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (CGRect)_monogramReferenceFrameForStyle:(unint64_t)a3
{
  double v5 = [(NTKColorAnalogFaceView *)self device];
  uint64_t v27 = 0;
  memset(v26, 0, sizeof(v26));
  sub_8CA8(v5, (uint64_t)v26);
  [(NTKColorAnalogFaceView *)self _monogramKeylinePadding];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  if (a3 <= 1)
  {
    +[NTKAnalogUtilities dialSizeForDevice:v5];
    [(NTKColorAnalogFaceView *)self bounds];
  }
  [(NTKColorAnalogFaceView *)self bounds];
  CLKRectCenteredXInRectForDevice();
  double v15 = v9 + v14;
  double v17 = v7 + v16;
  double v19 = v18 - (v9 + v13);
  double v21 = v20 - (v7 + v11);

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (CGRect)_monogramReferenceFrame
{
  double v3 = [(NTKColorAnalogFaceView *)self optionForCustomEditMode:15 slot:0];
  id v4 = [v3 style];

  [(NTKColorAnalogFaceView *)self _monogramReferenceFrameForStyle:v4];
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4 == 15)
  {
    id v17 = [v8 style];
    self->_currentStyle = (unint64_t)v17;
    [(NTKColorAnalogBackgroundView *)self->_backgroundView applyStyle:v17];
    [(NTKColorAnalogFaceView *)self _monogramReferenceFrameForStyle:self->_currentStyle];
    self->_monogramOverrideFrame.origin.CGFloat x = v18;
    self->_monogramOverrideFrame.origin.CGFloat y = v19;
    self->_monogramOverrideFrame.size.CGFloat width = v20;
    self->_monogramOverrideFrame.size.CGFloat height = v21;
    double v22 = [(NTKColorAnalogFaceView *)self device];
    double v23 = [(NTKColorAnalogFaceView *)self faceColorPalette];
    double v10 = +[NTKFaceColorScheme colorSchemeForDevice:v22 withFaceColorPalette:v23 units:49];

    if (self->_currentStyle) {
      _MonogramDarkForegroundColor();
    }
    else {
    double v25 = [v10 shiftedForegroundColor];
    }
    objc_storeStrong((id *)&self->_monogramForegroundColor, v25);

    v26 = [(NTKColorAnalogFaceView *)self _colorComplicationViewForSlot:NTKComplicationSlotMonogram];
    [v26 setForegroundColor:self->_monogramForegroundColor];

    [(NTKColorAnalogFaceView *)self invalidateComplicationLayout];
    uint64_t v27 = [(NTKColorAnalogFaceView *)self delegate];
    [v27 faceViewDidChangeWantsStatusBarIconShadow];

    goto LABEL_11;
  }
  if (a4 == 10)
  {
    double v10 = [(NTKColorAnalogFaceView *)self faceColorPalette];
    backgroundView = self->_backgroundView;
    double v12 = [v10 primaryColor];
    [(NTKColorAnalogBackgroundView *)backgroundView applyColor:v12];

    double v13 = [v10 primaryShiftedColor];
    complicationForegroundColor = self->_complicationForegroundColor;
    self->_complicationForegroundColor = v13;

    double v15 = [v10 secondaryShiftedColor];
    complicationPlatterColor = self->_complicationPlatterColor;
    self->_complicationPlatterColor = v15;

    if (self->_currentStyle) {
      _MonogramDarkForegroundColor();
    }
    else {
    double v24 = [v10 primaryShiftedColor];
    }
    objc_storeStrong((id *)&self->_monogramForegroundColor, v24);

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_9294;
    v28[3] = &unk_104D8;
    v28[4] = self;
    [(NTKColorAnalogFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v28];
LABEL_11:
  }
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  v42.receiver = self;
  v42.super_class = (Class)NTKColorAnalogFaceView;
  [(NTKColorAnalogFaceView *)&v42 _applyTransitionFraction:v12 fromOption:v13 toOption:a6 forCustomEditMode:a7 slot:a3];
  if (a6 == 15)
  {
    id v30 = [v12 style];
    id v31 = [v13 style];
    [(NTKColorAnalogBackgroundView *)self->_backgroundView applyTransitionFraction:v30 fromStyle:v31 toStyle:a3];
    if (a3 <= 0.5) {
      unint64_t v32 = (unint64_t)v30;
    }
    else {
      unint64_t v32 = (unint64_t)v31;
    }
    self->_currentStyle = v32;
    double v14 = [(NTKColorAnalogFaceView *)self _colorComplicationViewForSlot:NTKComplicationSlotMonogram];
    v33 = _MonogramDarkForegroundColor();
    v34 = [(NTKColorAnalogFaceView *)self faceColorPalette];
    v35 = [v34 primaryShiftedColor];
    v36 = NTKInterpolateBetweenColors();
    [v14 setForegroundColor:v36];

    [(NTKColorAnalogFaceView *)self _monogramReferenceFrameForStyle:v30];
    [(NTKColorAnalogFaceView *)self _monogramReferenceFrameForStyle:v31];
    CLKInterpolateBetweenRects();
    self->_monogramOverrideFrame.origin.CGFloat x = v37;
    self->_monogramOverrideFrame.origin.CGFloat y = v38;
    self->_monogramOverrideFrame.size.CGFloat width = v39;
    self->_monogramOverrideFrame.size.CGFloat height = v40;
    [(NTKColorAnalogFaceView *)self layoutComplicationViews];
LABEL_10:

    goto LABEL_11;
  }
  if (a6 == 10)
  {
    id v41 = v12;
    double v14 = [(NTKColorAnalogFaceView *)self interpolatedColorPalette];
    backgroundView = self->_backgroundView;
    [v14 transitionFraction];
    double v17 = v16;
    CGFloat v18 = [v14 fromPalette];
    CGFloat v19 = [v18 primaryColor];
    CGFloat v20 = [v14 toPalette];
    CGFloat v21 = [v20 primaryColor];
    double v22 = [v14 primaryColor];
    double v23 = [v14 primaryShiftedColor];
    [(NTKColorAnalogBackgroundView *)backgroundView applyTransitionFraction:v19 fromColor:v21 toColor:v22 withPrimaryColor:v23 boostedColor:v17];

    if (!self->_currentStyle)
    {
      CLKCompressFraction();
      double v25 = v24;
      v26 = [(NTKColorAnalogFaceView *)self interpolatedColorPalette];
      [v26 setTransitionFraction:v25];

      uint64_t v27 = [(NTKColorAnalogFaceView *)self _colorComplicationViewForSlot:NTKComplicationSlotMonogram];
      v28 = [(NTKColorAnalogFaceView *)self interpolatedColorPalette];
      v29 = [v28 primaryShiftedColor];
      [v27 setForegroundColor:v29];
    }
    [(NTKColorAnalogFaceView *)self _fadeComplicationFraction:NTKComplicationSlotTopRight entry:a3 exit:0.05 slot:0.15];
    [(NTKColorAnalogFaceView *)self _fadeComplicationFraction:NTKComplicationSlotBottomRight entry:a3 exit:0.35 slot:0.45];
    [(NTKColorAnalogFaceView *)self _fadeComplicationFraction:NTKComplicationSlotBottomLeft entry:a3 exit:0.55 slot:0.65];
    [(NTKColorAnalogFaceView *)self _fadeComplicationFraction:NTKComplicationSlotTopLeft entry:a3 exit:0.85 slot:0.95];
    id v12 = v41;
    goto LABEL_10;
  }
LABEL_11:
}

- (void)_fadeComplicationFraction:(double)a3 entry:(double)a4 exit:(double)a5 slot:(id)a6
{
  id v7 = a6;
  CLKCompressFraction();
  double v9 = v8;
  double v10 = [(NTKColorAnalogFaceView *)self interpolatedColorPalette];
  [v10 setTransitionFraction:v9];

  double v11 = [(NTKColorAnalogFaceView *)self normalComplicationDisplayWrapperForSlot:v7];

  id v17 = [v11 display];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v17;
    id v13 = [(NTKColorAnalogFaceView *)self interpolatedColorPalette];
    double v14 = [v13 primaryShiftedColor];
    [v12 setForegroundColor:v14];

    double v15 = [(NTKColorAnalogFaceView *)self interpolatedColorPalette];
    double v16 = [v15 secondaryShiftedColor];
    [v12 setPlatterColor:v16];
  }
}

- (void)_updateMonogramLayoutRule
{
  NTKEnumerateComplicationStates();
  double v3 = [(NTKColorAnalogFaceView *)self delegate];
  [v3 faceViewDidHideOrShowComplicationSlot];
}

- (void)_cleanupAfterTransitionToOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  if (a4 == 15) {
    [(NTKColorAnalogFaceView *)self _updateMonogramLayoutRule];
  }
}

- (void)_configureForEditMode:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)NTKColorAnalogFaceView;
  -[NTKColorAnalogFaceView _configureForEditMode:](&v14, "_configureForEditMode:");
  double v5 = [(NTKColorAnalogFaceView *)self timeView];
  double v6 = v5;
  double v7 = NTKEditModeDimmedAlpha;
  BOOL v8 = a3 == 15 || a3 == 10;
  double v9 = 0.0;
  if (v8) {
    double v9 = NTKEditModeDimmedAlpha;
  }
  if (!a3) {
    double v9 = 1.0;
  }
  [v5 setAlpha:v9];

  if (a3 == 1) {
    double v10 = v7;
  }
  else {
    double v10 = 1.0;
  }
  [(NTKColorAnalogBackgroundView *)self->_backgroundView setAlpha:v10];
  double v11 = 0.975;
  if ((unint64_t)a3 < 2) {
    double v11 = 1.0;
  }
  backgroundView = self->_backgroundView;
  CGAffineTransformMakeScale(&v13, v11, v11);
  [(NTKColorAnalogBackgroundView *)backgroundView setTransform:&v13];
  [(NTKColorAnalogFaceView *)self setClipsToBounds:a3 != 10];
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  v25.receiver = self;
  v25.super_class = (Class)NTKColorAnalogFaceView;
  -[NTKColorAnalogFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](&v25, "_configureForTransitionFraction:fromEditMode:toEditMode:");
  double v9 = [(NTKColorAnalogFaceView *)self timeView];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v9, "setAlpha:");

  backgroundView = self->_backgroundView;
  CLKInterpolateBetweenFloatsClipped();
  -[NTKColorAnalogBackgroundView setAlpha:](backgroundView, "setAlpha:");
  CLKInterpolateBetweenFloatsClipped();
  double v11 = self->_backgroundView;
  CGAffineTransformMakeScale(&v24, v12, v12);
  [(NTKColorAnalogBackgroundView *)v11 setTransform:&v24];
  CGAffineTransform v13 = [(NTKColorAnalogFaceView *)self device];
  objc_super v14 = [(NTKColorAnalogFaceView *)self faceColorPalette];
  double v15 = +[NTKFaceColorScheme colorSchemeForDevice:v13 withFaceColorPalette:v14 units:49];

  double v16 = [(NTKColorAnalogFaceView *)self _colorComplicationViewForSlot:NTKComplicationSlotMonogram];
  id v17 = [(NTKColorAnalogFaceView *)self optionForCustomEditMode:15 slot:0];
  id v18 = [v17 style];

  if (v18) {
    _MonogramDarkForegroundColor();
  }
  else {
  id v19 = [v15 shiftedForegroundColor];
  }
  CGFloat v20 = v19;
  if (a4 == 1)
  {
    CGFloat v20 = [v15 shiftedForegroundColor];
  }
  CGFloat v21 = v19;
  if (a5 == 1)
  {
    CGFloat v21 = [v15 shiftedForegroundColor];
  }
  double v22 = NTKInterpolateBetweenColors();
  [v16 setForegroundColor:v22];

  if (a3 <= 0.5) {
    double v23 = v20;
  }
  else {
    double v23 = v21;
  }
  objc_storeStrong((id *)&self->_monogramForegroundColor, v23);
}

- (int64_t)_keylineStyleForComplicationSlot:(id)a3
{
  id v4 = a3;
  double v5 = [(NTKColorAnalogFaceView *)self device];
  if ([v5 deviceCategory] == (char *)&dword_0 + 1)
  {
  }
  else
  {
    unsigned __int8 v6 = [v4 isEqual:NTKComplicationSlotMonogram];

    if ((v6 & 1) == 0)
    {
      int64_t v7 = 1;
      goto LABEL_6;
    }
  }
  int64_t v7 = 0;
LABEL_6:

  return v7;
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)NTKColorAnalogFaceView;
  -[NTKColorAnalogFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v13, "_applyBreathingFraction:forCustomEditMode:slot:", a4, a5);
  NTKLargeElementScaleForBreathingFraction();
  memset(&v12, 0, sizeof(v12));
  CGAffineTransformMakeScale(&v12, v7, v7);
  if (a4 == 10)
  {
    BOOL v8 = [(NTKColorAnalogFaceView *)self foregroundContainerView];
    CGAffineTransform v11 = v12;
    [v8 setTransform:&v11];

    backgroundComplicationContainerView = self->_backgroundComplicationContainerView;
    CGAffineTransform v11 = v12;
    [(UIView *)backgroundComplicationContainerView setTransform:&v11];
  }
  backgroundView = self->_backgroundView;
  CGAffineTransform v11 = v12;
  [(NTKColorAnalogBackgroundView *)backgroundView setTransform:&v11];
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v16.receiver = self;
  v16.super_class = (Class)NTKColorAnalogFaceView;
  -[NTKColorAnalogFaceView _applyRubberBandingFraction:forCustomEditMode:slot:](&v16, "_applyRubberBandingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4)
  {
    NTKLargeElementScaleForBreathingFraction();
    memset(&v15, 0, sizeof(v15));
    CGAffineTransformMakeScale(&v15, v7, v7);
    BOOL v8 = [(NTKColorAnalogFaceView *)self foregroundContainerView];
    CGAffineTransform v14 = v15;
    [v8 setTransform:&v14];

    backgroundComplicationContainerView = self->_backgroundComplicationContainerView;
    CGAffineTransform v14 = v15;
    [(UIView *)backgroundComplicationContainerView setTransform:&v14];
    backgroundView = self->_backgroundView;
    CGAffineTransform v14 = v15;
    [(NTKColorAnalogBackgroundView *)backgroundView setTransform:&v14];
    NTKAlphaForRubberBandingFraction();
    double v12 = v11;
    objc_super v13 = [(NTKColorAnalogFaceView *)self foregroundContainerView];
    [v13 setAlpha:v12];

    [(UIView *)self->_backgroundComplicationContainerView setAlpha:v12];
    [(NTKColorAnalogBackgroundView *)self->_backgroundView setAlpha:v12];
  }
}

- (int64_t)_complicationPickerStyleForSlot:(id)a3
{
  double v3 = [(NTKColorAnalogFaceView *)self device];
  int64_t v4 = [v3 deviceCategory] != (char *)&dword_0 + 1;

  return v4;
}

- (double)_keylineCornerRadiusForComplicationSlot:(id)a3
{
  if ([a3 isEqual:NTKComplicationSlotMonogram])
  {
    _NTKKeylineCornerRadiusSmall();
  }
  else
  {
    _NTKKeylineCornerRadiusLarge();
  }
  return result;
}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  return 0;
}

- (void)_enumerateColorComplicationSlotsWithBlock:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_A22C;
  v5[3] = &unk_10528;
  id v6 = a3;
  id v4 = v6;
  [(NTKColorAnalogFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v5];
}

- (id)_colorComplicationViewForSlot:(id)a3
{
  double v3 = [(NTKColorAnalogFaceView *)self normalComplicationDisplayWrapperForSlot:a3];
  id v4 = [v3 display];

  return v4;
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 15) {
    return &off_11270;
  }
  else {
    return 0;
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v8;
    double v11 = [v9 objectForKeyedSubscript:&off_10DC8];

    if (!qword_157E0)
    {
      uint64_t v12 = objc_opt_new();
      objc_super v13 = (void *)qword_157E0;
      qword_157E0 = v12;
    }
    CGAffineTransform v14 = +[NSString stringWithFormat:@"%@-%@", v10, v11];
    CGAffineTransform v15 = [(id)qword_157E0 objectForKey:v14];
    if (!v15)
    {
      id v16 = [v10 style];
      if ((unint64_t)v16 > 2)
      {
        id v17 = 0;
      }
      else
      {
        id v17 = +[NTKColorAnalogFaceBundle imageWithName:*(&off_10568 + (void)v16)];
      }
      id v18 = [(NTKColorAnalogFaceView *)self faceColorPalette];
      id v19 = [v18 copy];

      id v20 = objc_alloc((Class)NTKFaceColorPaletteConfiguration);
      CGFloat v21 = [v11 pigmentEditOption];
      id v22 = [v20 initWithPigmentEditOption:v21];
      [v19 setConfiguration:v22];

      double v23 = [(NTKColorAnalogFaceView *)self device];
      CGAffineTransform v24 = +[NTKFaceColorScheme colorSchemeForDevice:v23 withFaceColorPalette:v19 units:1];

      objc_super v25 = [v24 foregroundColor];
      CGAffineTransform v15 = [v17 _flatImageWithColor:v25];

      [(id)qword_157E0 setObject:v15 forKey:v14];
    }
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)NTKColorAnalogFaceView;
    CGAffineTransform v15 = [(NTKColorAnalogFaceView *)&v27 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:v9];
  }

  return v15;
}

- (UIColor)complicationForegroundColor
{
  return self->_complicationForegroundColor;
}

- (void)setComplicationForegroundColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationForegroundColor, 0);
  objc_storeStrong((id *)&self->_monogramForegroundColor, 0);
  objc_storeStrong((id *)&self->_complicationPlatterColor, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_backgroundComplicationContainerView, 0);
}

@end