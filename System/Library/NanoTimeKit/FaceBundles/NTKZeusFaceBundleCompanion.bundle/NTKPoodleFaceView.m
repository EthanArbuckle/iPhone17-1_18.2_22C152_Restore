@interface NTKPoodleFaceView
+ (id)_supportedComplicationSlots;
+ (int64_t)uiSensitivity;
+ (unint64_t)colorCodeFromEditOption:(id)a3;
- (BOOL)_applyRoundedCornerOverlay;
- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3;
- (CGRect)_lowerComplicationFrame;
- (NTKPoodleFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_backgroundAlphaForEditMode:(int64_t)a3;
- (double)_dialAlphaForEditMode:(int64_t)a3;
- (double)_timeViewAlphaForEditMode:(int64_t)a3;
- (id)_keylineViewForComplicationSlot:(id)a3;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)createFaceColorPalette;
- (id)palette;
- (int64_t)_complicationPickerStyleForSlot:(id)a3;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_loadLayoutRules;
- (void)_loadSnapshotContentViews;
- (void)_removeViews;
- (void)_setupViews;
- (void)_unloadSnapshotContentViews;
- (void)_updateBottomComplicationColorsWithPalette:(id)a3;
- (void)_updateCornerComplicationColorsWithPrimaryColor:(id)a3 secondaryColor:(id)a4;
- (void)layoutSubviews;
- (void)updateColorsWithPalette:(id)a3;
@end

@implementation NTKPoodleFaceView

- (NTKPoodleFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NTKPoodleFaceView;
  v9 = [(NTKPoodleFaceView *)&v16 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  if (v9)
  {
    id v10 = objc_alloc((Class)NTKWhistlerAnalogFaceViewComplicationFactory);
    v11 = [(NTKPoodleFaceView *)v9 device];
    sub_29100(v11, v15);
    id v12 = [v10 initWithFaceView:v9 dialDiameter:v8 device:v15[0]];

    [v12 setUsesNarrowTopSlots:1];
    [(NTKPoodleFaceView *)v9 setComplicationFactory:v12];
    v13 = v9;
  }
  return v9;
}

- (id)createFaceColorPalette
{
  v2 = [[NTKPoodleColorPalette alloc] initWithFaceClass:objc_opt_class()];

  return v2;
}

- (id)palette
{
  return [(NTKPoodleFaceView *)self faceColorPalette];
}

- (void)_loadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKPoodleFaceView;
  [(NTKPoodleFaceView *)&v3 _loadSnapshotContentViews];
  [(NTKPoodleFaceView *)self _setupViews];
}

- (void)_unloadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKPoodleFaceView;
  [(NTKPoodleFaceView *)&v3 _unloadSnapshotContentViews];
  [(NTKPoodleFaceView *)self _removeViews];
}

- (void)_setupViews
{
  v48.receiver = self;
  v48.super_class = (Class)NTKPoodleFaceView;
  [(NTKPoodleFaceView *)&v48 _loadSnapshotContentViews];
  objc_super v3 = [NTKPoodleBackgroundView alloc];
  v4 = [(NTKPoodleFaceView *)self device];
  v5 = [(NTKPoodleBackgroundView *)v3 initWithDevice:v4];
  backgroundView = self->_backgroundView;
  self->_backgroundView = v5;

  v7 = self->_backgroundView;
  id v8 = [(NTKPoodleFaceView *)self palette];
  [(NTKPoodleBackgroundView *)v7 setPalette:v8];

  v9 = [(NTKPoodleFaceView *)self contentView];
  [v9 addSubview:self->_backgroundView];

  id v10 = +[NTKPoodleFaceBundle imageWithName:@"PoodleNumerals"];
  v11 = [v10 imageWithRenderingMode:2];
  dialImage = self->_dialImage;
  self->_dialImage = v11;

  if (!self->_dialImageView)
  {
    v13 = [(NTKPoodleFaceView *)self device];
    sub_29100(v13, &v45);
    double v14 = v46;
    double v15 = v47;

    objc_super v16 = [(NTKPoodleFaceView *)self device];
    sub_29100(v16, v43);
    double v17 = v44;

    v18 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:self->_dialImage];
    dialImageView = self->_dialImageView;
    self->_dialImageView = v18;

    [(UIImageView *)self->_dialImageView setContentMode:1];
    -[UIImageView setBounds:](self->_dialImageView, "setBounds:", 0.0, 0.0, v14, v15);
    [(NTKPoodleFaceView *)self bounds];
    double v21 = v20 * 0.5;
    [(UIImageView *)self->_dialImageView bounds];
    double v23 = v21 - v22 * 0.5;
    [(NTKPoodleFaceView *)self bounds];
    double v25 = v24 * 0.5;
    [(UIImageView *)self->_dialImageView bounds];
    -[UIImageView setFrame:](self->_dialImageView, "setFrame:", v23, v17 + v25 - v26 * 0.5, v14, v15);
    v27 = [(NTKPoodleFaceView *)self contentView];
    [v27 addSubview:self->_dialImageView];
  }
  if (!self->_logoView)
  {
    v28 = [(NTKPoodleFaceView *)self device];
    sub_29100(v28, &v40);
    double v29 = v41;
    double v30 = v42;

    v31 = +[NTKPoodleFaceBundle imageWithName:@"PoodleLogo"];
    v32 = [v31 imageWithRenderingMode:2];

    v33 = [(NTKPoodleFaceView *)self device];
    sub_29100(v33, v38);
    double v34 = v39;

    v35 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v32];
    logoView = self->_logoView;
    self->_logoView = v35;

    [(UIImageView *)self->_logoView setContentMode:1];
    -[UIImageView setBounds:](self->_logoView, "setBounds:", 0.0, v34, v29, v30);
    v37 = [(NTKPoodleFaceView *)self contentView];
    [v37 addSubview:self->_logoView];
  }
}

- (void)_removeViews
{
  v7.receiver = self;
  v7.super_class = (Class)NTKPoodleFaceView;
  [(NTKPoodleFaceView *)&v7 _unloadSnapshotContentViews];
  [(NTKPoodleBackgroundView *)self->_backgroundView removeFromSuperview];
  backgroundView = self->_backgroundView;
  self->_backgroundView = 0;

  [(UIImageView *)self->_dialImageView removeFromSuperview];
  dialImageView = self->_dialImageView;
  self->_dialImageView = 0;

  [(UIImageView *)self->_logoView removeFromSuperview];
  v5 = self->_dialImageView;
  self->_dialImageView = 0;

  dialImage = self->_dialImage;
  self->_dialImage = 0;
}

- (BOOL)_applyRoundedCornerOverlay
{
  return 1;
}

- (void)layoutSubviews
{
  v31.receiver = self;
  v31.super_class = (Class)NTKPoodleFaceView;
  [(NTKPoodleFaceView *)&v31 layoutSubviews];
  [(NTKPoodleFaceView *)self bounds];
  CLKRectGetCenter();
  -[NTKPoodleBackgroundView setCenter:](self->_backgroundView, "setCenter:");
  [(NTKPoodleFaceView *)self bounds];
  double v4 = v3 * 0.5;
  [(UIImageView *)self->_dialImageView bounds];
  double v6 = v4 - v5 * 0.5;
  [(NTKPoodleFaceView *)self bounds];
  double v8 = v7 * 0.5;
  [(UIImageView *)self->_dialImageView bounds];
  double v10 = v8 - v9 * 0.5;
  v11 = [(NTKPoodleFaceView *)self device];
  sub_29100(v11, v29);
  double v12 = v10 + v30;
  [(UIImageView *)self->_dialImageView bounds];
  double v14 = v13;
  [(UIImageView *)self->_dialImageView bounds];
  -[UIImageView setFrame:](self->_dialImageView, "setFrame:", v6, v12, v14);

  [(NTKPoodleFaceView *)self bounds];
  double v16 = v15 * 0.5;
  [(UIImageView *)self->_logoView bounds];
  double v18 = v16 - v17 * 0.5;
  [(NTKPoodleFaceView *)self bounds];
  double v20 = v19 * 0.5;
  [(UIImageView *)self->_logoView bounds];
  double v22 = v20 - v21 * 0.5;
  double v23 = [(NTKPoodleFaceView *)self device];
  sub_29100(v23, v27);
  double v24 = v22 + v28;
  [(UIImageView *)self->_logoView bounds];
  double v26 = v25;
  [(UIImageView *)self->_logoView bounds];
  -[UIImageView setFrame:](self->_logoView, "setFrame:", v18, v24, v26);
}

+ (int64_t)uiSensitivity
{
  return 0;
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  v15.receiver = self;
  v15.super_class = (Class)NTKPoodleFaceView;
  -[NTKPoodleFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](&v15, "_configureForTransitionFraction:fromEditMode:toEditMode:");
  [(NTKPoodleFaceView *)self _dialAlphaForEditMode:a4];
  [(NTKPoodleFaceView *)self _dialAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v9 = v8;
  [(NTKPoodleFaceView *)self _backgroundAlphaForEditMode:a4];
  [(NTKPoodleFaceView *)self _backgroundAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v11 = v10;
  [(NTKPoodleFaceView *)self _timeViewAlphaForEditMode:a4];
  [(NTKPoodleFaceView *)self _timeViewAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v13 = v12;
  [(UIImageView *)self->_dialImageView setAlpha:v9];
  [(NTKPoodleBackgroundView *)self->_backgroundView setAlpha:v11];
  [(UIImageView *)self->_logoView setAlpha:v11];
  double v14 = [(NTKPoodleFaceView *)self timeView];
  [v14 setAlpha:v13];
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  if (a4 == 10)
  {
    id v7 = [(NTKPoodleFaceView *)self palette];
    [(NTKPoodleFaceView *)self updateColorsWithPalette:v7];
  }
}

- (void)updateColorsWithPalette:(id)a3
{
  id v23 = a3;
  double v4 = [v23 background];
  [(NTKPoodleFaceView *)self setBackgroundColor:v4];

  uint64_t v5 = [v23 background];
  [(NTKPoodleFaceView *)self setComplicationBackgroundColor:v5];

  double v6 = [(NTKPoodleFaceView *)self timeView];
  id v7 = [v6 hourHandView];
  double v8 = [v23 handColor];
  [v7 setColor:v8];

  double v9 = [(NTKPoodleFaceView *)self timeView];
  double v10 = [v9 minuteHandView];
  double v11 = [v23 handColor];
  [v10 setColor:v11];

  double v12 = [(NTKPoodleFaceView *)self timeView];
  double v13 = [v12 secondHandView];
  double v14 = [v23 secondHandColor];
  [v13 setColor:v14];

  objc_super v15 = [(NTKPoodleFaceView *)self timeView];
  double v16 = [v23 handInlayColor];
  [v15 setInlayColor:v16];

  [(NTKPoodleBackgroundView *)self->_backgroundView setPalette:v23];
  dialImageView = self->_dialImageView;
  double v18 = [v23 dialColor];
  [(UIImageView *)dialImageView setTintColor:v18];

  logoView = self->_logoView;
  double v20 = [v23 logoColor];
  [(UIImageView *)logoView setTintColor:v20];

  double v21 = [v23 primaryComplicationColor];
  double v22 = [v23 secondaryComplicationColor];
  [(NTKPoodleFaceView *)self _updateCornerComplicationColorsWithPrimaryColor:v21 secondaryColor:v22];

  [(NTKPoodleFaceView *)self _updateBottomComplicationColorsWithPalette:v23];
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  v10.receiver = self;
  v10.super_class = (Class)NTKPoodleFaceView;
  [(NTKPoodleFaceView *)&v10 _applyTransitionFraction:a4 fromOption:a5 toOption:a6 forCustomEditMode:a7 slot:a3];
  if (a6 == 10)
  {
    double v9 = [(NTKPoodleFaceView *)self interpolatedColorPalette];
    [(NTKPoodleFaceView *)self updateColorsWithPalette:v9];
  }
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)NTKPoodleFaceView;
  -[NTKPoodleFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v11, "_applyBreathingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4 == 10)
  {
    NTKLargeElementScaleForBreathingFraction();
    memset(&v10, 0, sizeof(v10));
    CGAffineTransformMakeScale(&v9, v7, v7);
    CGAffineTransformTranslate(&v10, &v9, 0.0, 1.0);
    CGAffineTransform v8 = v10;
    [(NTKPoodleFaceView *)self setTransform:&v8];
  }
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)NTKPoodleFaceView;
  -[NTKPoodleFaceView _applyRubberBandingFraction:forCustomEditMode:slot:](&v9, "_applyRubberBandingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4 == 10)
  {
    NTKScaleForRubberBandingFraction();
    CGAffineTransformMakeScale(&v8, v7, v7);
    [(NTKPoodleFaceView *)self setTransform:&v8];
    NTKAlphaForRubberBandingFraction();
    -[NTKPoodleFaceView setAlpha:](self, "setAlpha:");
  }
}

- (double)_dialAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if (a3 != 1) {
    return 1.0;
  }
  return result;
}

- (double)_backgroundAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if (a3 != 1) {
    return 1.0;
  }
  return result;
}

- (double)_timeViewAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if (a3 != 1) {
    return 1.0;
  }
  return result;
}

- (id)_keylineViewForComplicationSlot:(id)a3
{
  uint64_t v4 = NTKComplicationSlotBottom;
  id v5 = a3;
  if ([v5 isEqualToString:v4])
  {
    uint64_t v6 = [(NTKPoodleFaceView *)self _defaultKeylineViewForComplicationSlot:v5];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NTKPoodleFaceView;
    uint64_t v6 = [(NTKPoodleFaceView *)&v9 _keylineViewForComplicationSlot:v5];
  }
  CGFloat v7 = (void *)v6;

  return v7;
}

- (int64_t)_complicationPickerStyleForSlot:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:NTKComplicationSlotBottom])
  {
    id v5 = &dword_0 + 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NTKPoodleFaceView;
    id v5 = [(NTKPoodleFaceView *)&v7 _complicationPickerStyleForSlot:v4];
  }

  return (int64_t)v5;
}

- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3
{
  return a3 == 10;
}

- (CGRect)_lowerComplicationFrame
{
  double v3 = [(NTKPoodleFaceView *)self device];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  unsigned long long v15 = 0u;
  sub_29100(v3, &v14);
  [(NTKPoodleFaceView *)self bounds];
  double v5 = v4 * 0.5;
  [(NTKPoodleFaceView *)self bounds];
  unsigned long long v7 = v15;
  double v8 = v5 - *(double *)&v15 * 0.5;
  double v9 = *((double *)&v14 + 1) + v6 * 0.5 - *((double *)&v15 + 1) * 0.5;

  double v10 = v8;
  double v11 = v9;
  *(void *)&double v13 = v7 >> 64;
  *(void *)&double v12 = v7;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)_loadLayoutRules
{
  v9.receiver = self;
  v9.super_class = (Class)NTKPoodleFaceView;
  [(NTKPoodleFaceView *)&v9 _loadLayoutRules];
  double v3 = [(NTKPoodleFaceView *)self device];
  [(NTKPoodleFaceView *)self _lowerComplicationFrame];
  double v4 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:", v3, 3, 3);
  unsigned long long v7 = [(NTKPoodleFaceView *)self complicationLayoutforSlot:NTKComplicationSlotBottom];
  double v8 = v4;
  id v5 = v4;
  id v6 = v7;
  NTKEnumerateComplicationStates();
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  id v8 = a5;
  uint64_t v9 = NTKComplicationSlotBottom;
  id v10 = a3;
  if ([v8 isEqualToString:v9])
  {
    id v11 = [v10 complicationType];

    double v12 = +[NTKPoodleComplicationView viewForComplicationType:v11];
    double v13 = [(NTKPoodleFaceView *)self palette];
    [v12 applyPalette:v13];

    [(NTKPoodleFaceView *)self _configureComplicationView:v12 forSlot:v8];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)NTKPoodleFaceView;
    double v12 = [(NTKPoodleFaceView *)&v15 _newLegacyViewForComplication:v10 family:a4 slot:v8];
  }
  return v12;
}

+ (id)_supportedComplicationSlots
{
  v4[0] = NTKComplicationSlotTopLeft;
  v4[1] = NTKComplicationSlotTopRight;
  v4[2] = NTKComplicationSlotBottomLeft;
  v4[3] = NTKComplicationSlotBottomRight;
  v4[4] = NTKComplicationSlotBottom;
  v2 = +[NSArray arrayWithObjects:v4 count:5];

  return v2;
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NTKPoodleFaceView;
  [(NTKPoodleFaceView *)&v12 _configureComplicationView:v6 forSlot:a4];
  unsigned long long v7 = [(NTKPoodleFaceView *)self palette];
  id v8 = [v7 primaryComplicationColor];
  [(NTKPoodleFaceView *)self setComplicationColor:v8];

  uint64_t v9 = [(NTKPoodleFaceView *)self complicationColor];
  [(NTKPoodleFaceView *)self setInterpolatedComplicationColor:v9];

  id v10 = [(NTKPoodleFaceView *)self palette];
  id v11 = [v10 secondaryComplicationColor];
  [(NTKPoodleFaceView *)self setAlternateComplicationColor:v11];

  if (objc_opt_respondsToSelector()) {
    [v6 updateMonochromeColor];
  }
}

- (void)_updateCornerComplicationColorsWithPrimaryColor:(id)a3 secondaryColor:(id)a4
{
  id v6 = a4;
  [(NTKPoodleFaceView *)self setComplicationColor:a3];
  unsigned long long v7 = [(NTKPoodleFaceView *)self complicationColor];
  [(NTKPoodleFaceView *)self setInterpolatedComplicationColor:v7];

  [(NTKPoodleFaceView *)self setAlternateComplicationColor:v6];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_2A4D0;
  v8[3] = &unk_3CF68;
  v8[4] = self;
  [(NTKPoodleFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v8];
}

- (void)_updateBottomComplicationColorsWithPalette:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2A5EC;
  v5[3] = &unk_3CF68;
  id v6 = a3;
  id v4 = v6;
  [(NTKPoodleFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v5];
}

+ (unint64_t)colorCodeFromEditOption:(id)a3
{
  double v3 = [a3 pigmentEditOption];
  id v4 = +[CLKRenderingContext sharedRenderingContext];
  id v5 = [v4 device];

  id v6 = +[NTKPoodleColorEditOption legacyOptionWithPigmentEditOption:v3 forDevice:v5];
  id v7 = [v6 color];

  return (unint64_t)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logoView, 0);
  objc_storeStrong((id *)&self->_dialImageView, 0);
  objc_storeStrong((id *)&self->_dialImage, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end