@interface NTKKuiperFaceView
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
- (BOOL)_wantsStatusBarIconShadow;
- (NTKKuiperFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)colorPalette;
- (id)createFaceColorPalette;
- (int64_t)_complicationPickerStyleForSlot:(id)a3;
- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4;
- (void)_applyBreathingAndRubberbanding;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyColorPalette:(id)a3;
- (void)_applyComplicationFontToView:(id)a3;
- (void)_applyCurrentColorPalette;
- (void)_applyDataMode;
- (void)_applyDensity:(unint64_t)a3;
- (void)_applyDensityTransitionFraction:(double)a3 fromDensity:(unint64_t)a4 toDensity:(unint64_t)a5;
- (void)_applyDial:(unint64_t)a3;
- (void)_applyDialTransitionFraction:(double)a3 fromDial:(unint64_t)a4 toDial:(unint64_t)a5;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyPrimaryComplicationColor:(id)a3 secondaryComplicationColor:(id)a4;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_loadLayoutRules;
- (void)_loadSnapshotContentViews;
- (void)_loadTypographicSizeConfiguration;
- (void)_unloadSnapshotContentViews;
- (void)setDelegate:(id)a3;
- (void)typographicSizeProviderUpdateNumeralSizes:(id)a3;
- (void)updateComplicationColors;
@end

@implementation NTKKuiperFaceView

- (NTKKuiperFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NTKKuiperFaceView;
  v9 = [(NTKKuiperFaceView *)&v13 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  if (v9)
  {
    v10 = (NTKWhistlerAnalogFaceViewComplicationFactory *)[objc_alloc((Class)NTKWhistlerAnalogFaceViewComplicationFactory) initForDevice:v8];
    faceViewComplicationFactory = v9->_faceViewComplicationFactory;
    v9->_faceViewComplicationFactory = v10;

    [(NTKKuiperFaceView *)v9 setComplicationFactory:v9->_faceViewComplicationFactory];
  }

  return v9;
}

- (void)setDelegate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKKuiperFaceView;
  [(NTKKuiperFaceView *)&v4 setDelegate:a3];
  [(NTKKuiperFaceView *)self _loadTypographicSizeConfiguration];
}

- (void)_loadSnapshotContentViews
{
  v15.receiver = self;
  v15.super_class = (Class)NTKKuiperFaceView;
  [(NTKKuiperFaceView *)&v15 _loadSnapshotContentViews];
  if (!self->_backgroundView)
  {
    v3 = [(NTKKuiperFaceView *)self timeView];
    objc_super v4 = [v3 secondHandView];
    v5 = [v4 configuration];

    [v5 handLength];
    double v7 = v6;
    id v8 = [NTKKuiperBackgroundView alloc];
    v9 = [(NTKKuiperFaceView *)self device];
    v10 = [(NTKKuiperBackgroundView *)v8 initWithDevice:v9 dialRadius:v7];
    backgroundView = self->_backgroundView;
    self->_backgroundView = v10;

    v12 = [(NTKKuiperFaceView *)self contentView];
    [v12 addSubview:self->_backgroundView];
  }
  if (!self->_typographicSizeProvider)
  {
    objc_super v13 = objc_alloc_init(NTKKuiperTypographicSizeProvider);
    typographicSizeProvider = self->_typographicSizeProvider;
    self->_typographicSizeProvider = v13;

    [(NTKKuiperTypographicSizeProvider *)self->_typographicSizeProvider setDelegate:self];
  }
  [(NTKKuiperFaceView *)self _loadTypographicSizeConfiguration];
}

- (void)_loadTypographicSizeConfiguration
{
  v3 = [(NTKKuiperFaceView *)self delegate];
  if (v3)
  {
    id v7 = v3;
    objc_super v4 = [(NTKKuiperFaceView *)self delegate];
    v5 = [v4 faceViewDidRequestCustomDataForKey:@"typographicStyleFraction"];

    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      +[NTKKuiperTypographicSizeProvider typographicStyleFractionForKey:v5];
    }
    else {
      +[NTKKuiperTypographicSizeProvider randomTypographicStyleFraction];
    }
    -[NTKKuiperTypographicSizeProvider resetWithTypographicStyleFraction:](self->_typographicSizeProvider, "resetWithTypographicStyleFraction:");
    storedTypographicSizeFractionKey = self->_storedTypographicSizeFractionKey;
    self->_storedTypographicSizeFractionKey = v5;

    v3 = v7;
  }
}

- (void)_unloadSnapshotContentViews
{
  v5.receiver = self;
  v5.super_class = (Class)NTKKuiperFaceView;
  [(NTKKuiperFaceView *)&v5 _unloadSnapshotContentViews];
  [(NTKKuiperBackgroundView *)self->_backgroundView removeFromSuperview];
  backgroundView = self->_backgroundView;
  self->_backgroundView = 0;

  [(NTKKuiperTypographicSizeProvider *)self->_typographicSizeProvider setDelegate:0];
  typographicSizeProvider = self->_typographicSizeProvider;
  self->_typographicSizeProvider = 0;
}

- (BOOL)_wantsStatusBarIconShadow
{
  return self->_dial != 4;
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  self->_breathingFraction = a3;
  [(NTKKuiperFaceView *)self _applyBreathingAndRubberbanding];
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  self->_rubberbandingFraction = a3;
  [(NTKKuiperFaceView *)self _applyBreathingAndRubberbanding];
  NTKAlphaForRubberBandingFraction();

  -[NTKKuiperFaceView setAlpha:](self, "setAlpha:");
}

- (void)_applyBreathingAndRubberbanding
{
  NTKLargeElementScaleForBreathingFraction();
  double v4 = v3;
  NTKScaleForRubberBandingFraction();
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeScale(&v15, v4 * v5, v4 * v5);
  CGAffineTransform v14 = v15;
  double v6 = [(NTKKuiperFaceView *)self timeView];
  CGAffineTransform v13 = v14;
  [v6 setTransform:&v13];

  CGAffineTransform v12 = v15;
  id v7 = [(NTKKuiperFaceView *)self contentView];
  CGAffineTransform v11 = v12;
  [v7 setTransform:&v11];

  CGAffineTransform v10 = v15;
  id v8 = [(NTKKuiperFaceView *)self complicationContainerView];
  CGAffineTransform v9 = v10;
  [v8 setTransform:&v9];
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKKuiperFaceView;
  [(NTKKuiperFaceView *)&v10 _applyOption:v8 forCustomEditMode:a4 slot:a5];
  switch(a4)
  {
    case 10:
      [(NTKKuiperFaceView *)self _applyCurrentColorPalette];
      break;
    case 15:
      -[NTKKuiperFaceView _applyDial:](self, "_applyDial:", [v8 dial]);
      CGAffineTransform v9 = [(NTKKuiperFaceView *)self delegate];
      [v9 faceViewDidChangeWantsStatusBarIconShadow];

      break;
    case 11:
      -[NTKKuiperFaceView _applyDensity:](self, "_applyDensity:", [v8 density]);
      break;
  }
}

- (void)_applyDensity:(unint64_t)a3
{
  self->_density = a3;
}

- (void)_applyDial:(unint64_t)a3
{
  self->_dial = a3;
  id v5 = [(NTKKuiperFaceView *)self colorPalette];
  [v5 setDial:a3];
  [(NTKKuiperFaceView *)self _applyColorPalette:v5];
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)NTKKuiperFaceView;
  [(NTKKuiperFaceView *)&v21 _applyTransitionFraction:v12 fromOption:v13 toOption:a6 forCustomEditMode:a7 slot:a3];
  switch(a6)
  {
    case 10:
      v17 = [(NTKKuiperFaceView *)self interpolatedColorPalette];
      [(NTKKuiperFaceView *)self _applyColorPalette:v17];

      break;
    case 15:
      id v18 = v13;
      id v19 = [v12 dial];
      id v20 = [v18 dial];

      [(NTKKuiperFaceView *)self _applyDialTransitionFraction:v19 fromDial:v20 toDial:a3];
      break;
    case 11:
      id v14 = v13;
      id v15 = [v12 density];
      id v16 = [v14 density];

      [(NTKKuiperFaceView *)self _applyDensityTransitionFraction:v15 fromDensity:v16 toDensity:a3];
      break;
  }
}

- (void)_applyDensityTransitionFraction:(double)a3 fromDensity:(unint64_t)a4 toDensity:(unint64_t)a5
{
  id v10 = [(NTKKuiperBackgroundView *)self->_backgroundView digitRotationAnimation];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || [v10 fromDensity] != (id)a4
    || [v10 toDensity] != (id)a5)
  {
    CGAffineTransform v9 = [[NTKKuiperFontRotationAnimation alloc] initWithFromDensity:a4 toDensity:a5];

    [(NTKKuiperBackgroundView *)self->_backgroundView setDigitRotationAnimation:v9];
    id v10 = v9;
  }
  [(NTKKuiperBackgroundView *)self->_backgroundView setDigitRotationFraction:a3];
  [(NTKKuiperBackgroundView *)self->_backgroundView applyFont];
}

- (void)_applyDialTransitionFraction:(double)a3 fromDial:(unint64_t)a4 toDial:(unint64_t)a5
{
  id v12 = [(NTKKuiperFaceView *)self colorPalette];
  id v9 = [v12 copy];
  [v9 setDial:a4];
  id v10 = [v12 copy];
  [v10 setDial:a5];
  id v11 = [objc_alloc((Class)NTKInterpolatedColorPalette) initWithFromPalette:v9 toPalette:v10];
  [v11 setTransitionFraction:a3];
  [(NTKKuiperFaceView *)self _applyColorPalette:v11];
}

- (void)_applyCurrentColorPalette
{
  id v3 = [(NTKKuiperFaceView *)self colorPalette];
  [(NTKKuiperFaceView *)self _applyColorPalette:v3];
}

- (void)_applyColorPalette:(id)a3
{
  id v4 = a3;
  id v18 = [(NTKKuiperFaceView *)self timeView];
  id v5 = [v4 hourMinuteHandInlay];
  double v6 = [v4 hourMinuteHandStroke];
  id v7 = [v18 hourHandView];
  [v7 setColor:v6];

  id v8 = [v18 hourHandView];
  [v8 setInlayColor:v5];

  id v9 = [v18 minuteHandView];
  [v9 setColor:v6];

  id v10 = [v18 minuteHandView];
  [v10 setInlayColor:v5];

  id v11 = [v4 handDot];
  id v12 = [v18 secondHandView];
  [v12 setHandDotColor:v11];

  id v13 = [v4 secondHand];
  id v14 = [v18 secondHandView];
  [v14 setColor:v13];

  [(NTKKuiperBackgroundView *)self->_backgroundView setColorPalette:v4];
  id v15 = [v4 complicationBackground];
  [(NTKKuiperFaceView *)self setComplicationBackgroundColor:v15];

  [(NTKKuiperBackgroundView *)self->_backgroundView applyFont];
  id v16 = [v4 complicationPrimary];
  v17 = [v4 complicationSecondary];

  [(NTKKuiperFaceView *)self _applyPrimaryComplicationColor:v16 secondaryComplicationColor:v17];
}

- (void)_applyPrimaryComplicationColor:(id)a3 secondaryComplicationColor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(NTKKuiperFaceView *)self setComplicationColor:v7];
  [(NTKKuiperFaceView *)self setInterpolatedComplicationColor:v7];

  [(NTKKuiperFaceView *)self setAlternateComplicationColor:v6];

  [(NTKKuiperFaceView *)self updateComplicationColors];
}

- (void)updateComplicationColors
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_56E8;
  v2[3] = &unk_10580;
  v2[4] = self;
  [(NTKKuiperFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v2];
}

- (id)createFaceColorPalette
{
  id v3 = [[NTKKuiperFaceColorPalette alloc] initWithFaceClass:objc_opt_class()];
  [(NTKKuiperFaceColorPalette *)v3 setDial:self->_dial];

  return v3;
}

- (id)colorPalette
{
  return [(NTKKuiperFaceView *)self faceColorPalette];
}

- (void)_applyDataMode
{
  v2.receiver = self;
  v2.super_class = (Class)NTKKuiperFaceView;
  [(NTKKuiperFaceView *)&v2 _applyDataMode];
}

- (void)_loadLayoutRules
{
  id v3 = [(NTKKuiperFaceView *)self device];
  faceViewComplicationFactory = self->_faceViewComplicationFactory;
  [v3 screenBounds];
  double v6 = v5;
  [v3 screenScale];
  [(NTKWhistlerAnalogFaceViewComplicationFactory *)faceViewComplicationFactory loadLayoutRulesForFaceView:self dialDiameter:v7 * v6];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_59C0;
  v19[3] = &unk_105D0;
  v19[4] = self;
  id v8 = objc_retainBlock(v19);
  NTKDefaultCornerComplicationScaleForFullscreenOpaqueFaceForDevice();
  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeScale(&v18, v9, v9);
  id v10 = (void (*)(void *, CGAffineTransform *, void))v8[2];
  CGAffineTransform v17 = v18;
  v10(v8, &v17, 0);
  id v11 = (void (*)(void *, CGAffineTransform *, uint64_t))v8[2];
  CGAffineTransform v17 = v18;
  v11(v8, &v17, 1);
  id v12 = (void (*)(void *, CGAffineTransform *, uint64_t))v8[2];
  long long v16 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v17.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v15 = *(_OWORD *)&v17.a;
  *(_OWORD *)&v17.c = v16;
  *(_OWORD *)&v17.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  long long v14 = *(_OWORD *)&v17.tx;
  v12(v8, &v17, 3);
  id v13 = (void (*)(void *, CGAffineTransform *, uint64_t))v8[2];
  *(_OWORD *)&v17.a = v15;
  *(_OWORD *)&v17.c = v16;
  *(_OWORD *)&v17.tx = v14;
  v13(v8, &v17, 2);
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  return [(NTKWhistlerAnalogFaceViewComplicationFactory *)self->_faceViewComplicationFactory newLegacyViewForComplication:a3 family:a4 slot:a5 faceView:self];
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6 = a3;
  [(NTKWhistlerAnalogFaceViewComplicationFactory *)self->_faceViewComplicationFactory configureComplicationView:v6 forSlot:a4 faceView:self];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 updateMonochromeColor];
  }
  [(NTKKuiperFaceView *)self _applyComplicationFontToView:v6];
}

- (void)_applyComplicationFontToView:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v5 display];
    [(NTKKuiperFaceView *)self _applyComplicationFontToView:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v5 setFontStyle:1];
    }
  }
}

- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4
{
  return (int64_t)[(NTKWhistlerAnalogFaceViewComplicationFactory *)self->_faceViewComplicationFactory legacyLayoutOverrideforComplicationType:a3 slot:a4 faceView:self];
}

- (int64_t)_complicationPickerStyleForSlot:(id)a3
{
  return (int64_t)[(NTKWhistlerAnalogFaceViewComplicationFactory *)self->_faceViewComplicationFactory complicationPickerStyleForSlot:a3];
}

- (void)typographicSizeProviderUpdateNumeralSizes:(id)a3
{
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  id v4 = &off_11058;
  if (a3 != 15) {
    id v4 = 0;
  }
  if (a3 == 11) {
    return &off_11040;
  }
  else {
    return v4;
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ((a4 | 4) == 0xF)
  {
    if (qword_171B8 != -1) {
      dispatch_once(&qword_171B8, &stru_10618);
    }
    id v10 = (id)qword_171B0;
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_60F0;
    v45[3] = &unk_105F8;
    int64_t v48 = a4;
    id v43 = v8;
    id v46 = v8;
    id v42 = v9;
    id v11 = v9;
    id v47 = v11;
    id v12 = objc_retainBlock(v45);
    id v13 = ((void (*)(void *, uint64_t))v12[2])(v12, 11);
    long long v14 = ((void (*)(void *, uint64_t))v12[2])(v12, 15);
    long long v15 = [v11 objectForKeyedSubscript:&off_10E10];
    long long v16 = [(NTKKuiperTypographicSizeProvider *)self->_typographicSizeProvider currentTypographicStyleKey];
    CGAffineTransform v17 = v10;
    CGAffineTransform v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu-%lu-%lu-%@-%@", a4, [v13 density], objc_msgSend(v14, "dial"), v15, v16);
    id v19 = [v17 objectForKey:v18];
    if (!v19)
    {
      v39 = v12;
      v41 = v17;
      uint64_t v20 = [(NTKKuiperFaceView *)self device];
      objc_super v21 = [[NTKKuiperFaceView alloc] initWithFaceStyle:44 forDevice:v20 clientIdentifier:0];
      [(NTKKuiperFaceView *)v21 _loadSnapshotContentViews];
      v40 = v13;
      [(NTKKuiperFaceView *)v21 setOption:v13 forCustomEditMode:11 slot:0];
      [(NTKKuiperFaceView *)v21 setOption:v14 forCustomEditMode:15 slot:0];
      [(NTKKuiperFaceView *)v21 setOption:v15 forCustomEditMode:10 slot:0];
      v22 = (void *)v20;
      [(NTKKuiperFaceView *)v21 typographicSizeProviderUpdateNumeralSizes:self->_typographicSizeProvider];
      v23 = NTKIdealizedDate();
      [(NTKKuiperFaceView *)v21 setOverrideDate:v23 duration:0.0];

      [v22 screenBounds];
      -[NTKKuiperFaceView setFrame:](v21, "setFrame:");
      if (a4 == 11)
      {
        v24 = v21->_backgroundView;
        v25 = +[UIColor blackColor];
        [(NTKKuiperBackgroundView *)v24 setOverrideBackgroundColor:v25];
        [(NTKKuiperBackgroundView *)v24 dialFrame];
        double v27 = v26;
        double v29 = v28;
        CGFloat v31 = v30;
        CGFloat v33 = v32;

        v50.width = v31;
        v50.height = v33;
        UIGraphicsBeginImageContextWithOptions(v50, 0, 0.0);
        CurrentContext = UIGraphicsGetCurrentContext();
        CGContextTranslateCTM(CurrentContext, -v27, -v29);
      }
      else
      {
        [(NTKKuiperFaceView *)v21 bounds];
        v51.width = v35;
        v51.height = v36;
        UIGraphicsBeginImageContextWithOptions(v51, 0, 0.0);
      }
      v37 = [(NTKKuiperFaceView *)v21 layer];
      [v37 renderInContext:UIGraphicsGetCurrentContext()];

      id v19 = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
      [v41 setObject:v19 forKey:v18];

      CGAffineTransform v17 = v41;
      id v12 = v39;
      id v13 = v40;
    }

    id v9 = v42;
    id v8 = v43;
  }
  else
  {
    v44.receiver = self;
    v44.super_class = (Class)NTKKuiperFaceView;
    id v19 = [(NTKKuiperFaceView *)&v44 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:v9];
  }

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storedTypographicSizeFractionKey, 0);
  objc_storeStrong((id *)&self->_typographicSizeProvider, 0);
  objc_storeStrong((id *)&self->_faceViewComplicationFactory, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end