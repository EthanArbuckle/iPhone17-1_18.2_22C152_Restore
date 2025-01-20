@interface NTKSecretariatFaceView
- (BOOL)_shouldAnimateComplicationsOnTap;
- (BOOL)_wantsStatusBarIconShadow;
- (double)_contentViewAlphaForEditMode:(int64_t)a3;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)colorPalette;
- (id)createFaceColorPalette;
- (int64_t)_keylineStyleForComplicationSlot:(id)a3;
- (void)_applyBreathingAndRubberbanding;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyDataMode;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromComplication:(id)a4 toComplication:(id)a5 slot:(id)a6;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_loadBackgroundView;
- (void)_loadCornerOverlayView;
- (void)_loadLayoutRules;
- (void)_loadLogoImageView;
- (void)_loadSnapshotContentViews;
- (void)_unloadBackgroundView;
- (void)_unloadCornerOverlayView;
- (void)_unloadLogoImageView;
- (void)_unloadSnapshotContentViews;
- (void)_updateComplicationColorForPalette:(id)a3 slot:(id)a4 view:(id)a5;
- (void)_updateViewColorsWithPalette:(id)a3;
- (void)layoutSubviews;
@end

@implementation NTKSecretariatFaceView

- (void)_loadSnapshotContentViews
{
  v6.receiver = self;
  v6.super_class = (Class)NTKSecretariatFaceView;
  [(NTKSecretariatFaceView *)&v6 _loadSnapshotContentViews];
  [(NTKSecretariatFaceView *)self _loadBackgroundView];
  [(NTKSecretariatFaceView *)self _loadLogoImageView];
  [(NTKSecretariatFaceView *)self _loadCornerOverlayView];
  v3 = [(NTKSecretariatFaceView *)self faceTapControl];
  [v3 removeFromSuperview];

  v4 = [(NTKSecretariatFaceView *)self contentView];
  v5 = [(NTKSecretariatFaceView *)self faceTapControl];
  [v4 addSubview:v5];
}

- (void)_unloadSnapshotContentViews
{
  [(NTKSecretariatFaceView *)self _unloadCornerOverlayView];
  [(NTKSecretariatFaceView *)self _unloadLogoImageView];
  [(NTKSecretariatFaceView *)self _unloadBackgroundView];
  v3.receiver = self;
  v3.super_class = (Class)NTKSecretariatFaceView;
  [(NTKSecretariatFaceView *)&v3 _unloadSnapshotContentViews];
}

- (void)_applyDataMode
{
  v2.receiver = self;
  v2.super_class = (Class)NTKSecretariatFaceView;
  [(NTKSecretariatFaceView *)&v2 _applyDataMode];
}

- (BOOL)_wantsStatusBarIconShadow
{
  objc_super v2 = [(NTKSecretariatFaceView *)self colorPalette];
  unsigned __int8 v3 = [v2 isBlackColor];

  return v3 ^ 1;
}

- (void)_loadBackgroundView
{
  unsigned __int8 v3 = [NTKSecretariatBackgroundView alloc];
  v4 = [(NTKSecretariatFaceView *)self contentView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(NTKSecretariatFaceView *)self device];
  v14 = -[NTKSecretariatBackgroundView initWithFrame:device:inactive:](v3, "initWithFrame:device:inactive:", v13, 0, v6, v8, v10, v12);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v14;

  id v16 = [(NTKSecretariatFaceView *)self contentView];
  [v16 addSubview:self->_backgroundView];
}

- (void)_unloadBackgroundView
{
  [(NTKSecretariatBackgroundView *)self->_backgroundView removeFromSuperview];
  backgroundView = self->_backgroundView;
  self->_backgroundView = 0;
}

- (void)_loadCornerOverlayView
{
  id v3 = objc_alloc((Class)NTKRoundedCornerOverlayView);
  v4 = [(NTKSecretariatFaceView *)self contentView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(NTKSecretariatFaceView *)self device];
  v14 = (NTKRoundedCornerOverlayView *)objc_msgSend(v3, "initWithFrame:forDeviceCornerRadius:", v13, v6, v8, v10, v12);
  cornerOverlayView = self->_cornerOverlayView;
  self->_cornerOverlayView = v14;

  id v16 = [(NTKSecretariatFaceView *)self contentView];
  [v16 addSubview:self->_cornerOverlayView];
}

- (void)_unloadCornerOverlayView
{
  [(NTKRoundedCornerOverlayView *)self->_cornerOverlayView removeFromSuperview];
  cornerOverlayView = self->_cornerOverlayView;
  self->_cornerOverlayView = 0;
}

- (void)_loadLogoImageView
{
  id v6 = +[NTKSecretariatFaceBundle imageWithName:@"SecretariatLogo"];
  id v3 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v6];
  logoImageView = self->_logoImageView;
  self->_logoImageView = v3;

  double v5 = [(NTKSecretariatFaceView *)self contentView];
  [v5 addSubview:self->_logoImageView];
}

- (void)_unloadLogoImageView
{
  [(UIImageView *)self->_logoImageView removeFromSuperview];
  logoImageView = self->_logoImageView;
  self->_logoImageView = 0;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)NTKSecretariatFaceView;
  [(NTKSecretariatFaceView *)&v14 layoutSubviews];
  double v13 = 0.0;
  long long v12 = 0u;
  id v3 = [(NTKSecretariatFaceView *)self device];
  sub_18014(v3, (uint64_t)&v11);

  [(UIImageView *)self->_logoImageView frame];
  double v5 = v4;
  double v7 = v6;
  double v8 = *((double *)&v12 + 1);
  double v9 = v13;
  [(NTKSecretariatFaceView *)self bounds];
  CGFloat v10 = (CGRectGetMidX(v15) - v8) * 0.5;
  [(NTKSecretariatFaceView *)self bounds];
  -[UIImageView setFrame:](self->_logoImageView, "setFrame:", v10, (CGRectGetMidY(v16) - v9) * 0.5, v5, v7);
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NTKSecretariatFaceView *)self colorPalette];
  [(NTKSecretariatFaceView *)self _updateComplicationColorForPalette:v8 slot:v6 view:v7];
}

- (void)_loadLayoutRules
{
}

- (int64_t)_keylineStyleForComplicationSlot:(id)a3
{
  return 1;
}

- (BOOL)_shouldAnimateComplicationsOnTap
{
  return 0;
}

- (void)_configureForEditMode:(int64_t)a3
{
  [(NTKSecretariatFaceView *)self _contentViewAlphaForEditMode:a3];
  double v5 = v4;
  id v6 = [(NTKSecretariatFaceView *)self timeView];
  [v6 setAlpha:v5];

  id v7 = [(NTKSecretariatFaceView *)self contentView];
  [v7 setAlpha:v5];
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  [(NTKSecretariatFaceView *)self _contentViewAlphaForEditMode:a4];
  [(NTKSecretariatFaceView *)self _contentViewAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v8 = v7;
  double v9 = [(NTKSecretariatFaceView *)self timeView];
  [v9 setAlpha:v8];

  id v10 = [(NTKSecretariatFaceView *)self contentView];
  [v10 setAlpha:v8];
}

- (double)_contentViewAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if (a3 != 1) {
    return 1.0;
  }
  return result;
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  if (a4 == 10)
  {
    self->_breathingFraction = a3;
    [(NTKSecretariatFaceView *)self _applyBreathingAndRubberbanding];
  }
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  if (a4 == 10)
  {
    self->_rubberbandingFraction = a3;
    [(NTKSecretariatFaceView *)self _applyBreathingAndRubberbanding];
    NTKAlphaForRubberBandingFraction();
    -[NTKSecretariatFaceView setAlpha:](self, "setAlpha:");
  }
}

- (void)_applyBreathingAndRubberbanding
{
  NTKLargeElementScaleForBreathingFraction();
  double v4 = v3;
  NTKScaleForRubberBandingFraction();
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeScale(&v15, v4 * v5, v4 * v5);
  CGAffineTransform v14 = v15;
  id v6 = [(NTKSecretariatFaceView *)self timeView];
  CGAffineTransform v13 = v14;
  [v6 setTransform:&v13];

  CGAffineTransform v12 = v15;
  double v7 = [(NTKSecretariatFaceView *)self contentView];
  CGAffineTransform v11 = v12;
  [v7 setTransform:&v11];

  CGAffineTransform v10 = v15;
  double v8 = [(NTKSecretariatFaceView *)self complicationContainerView];
  CGAffineTransform v9 = v10;
  [v8 setTransform:&v9];
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  if (a4 == 10)
  {
    double v7 = [(NTKSecretariatFaceView *)self colorPalette];
    [(NTKSecretariatFaceView *)self _updateViewColorsWithPalette:v7];

    id v8 = [(NTKSecretariatFaceView *)self delegate];
    [v8 faceViewDidChangeWantsStatusBarIconShadow];
  }
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  if (a6 == 10)
  {
    id v9 = [(NTKSecretariatFaceView *)self interpolatedColorPalette];
    [(NTKSecretariatFaceView *)self _updateViewColorsWithPalette:v9];
  }
}

- (void)_applyTransitionFraction:(double)a3 fromComplication:(id)a4 toComplication:(id)a5 slot:(id)a6
{
  id v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)NTKSecretariatFaceView;
  [(NTKSecretariatFaceView *)&v15 _applyTransitionFraction:a4 fromComplication:a5 toComplication:v10 slot:a3];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1894C;
  v12[3] = &unk_3D088;
  id v13 = v10;
  CGAffineTransform v14 = self;
  id v11 = v10;
  [(NTKSecretariatFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v12];
}

- (id)createFaceColorPalette
{
  objc_super v2 = [[NTKSecretariatColorPalette alloc] initWithFaceClass:objc_opt_class()];

  return v2;
}

- (id)colorPalette
{
  return [(NTKSecretariatFaceView *)self faceColorPalette];
}

- (void)_updateViewColorsWithPalette:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 logo];
  [(UIImageView *)self->_logoImageView setTintColor:v5];

  id v6 = [v4 background];
  [(NTKSecretariatBackgroundView *)self->_backgroundView setBackgroundColor:v6];

  [(NTKSecretariatBackgroundView *)self->_backgroundView setPalette:v4];
  uint64_t v7 = [(NTKSecretariatFaceView *)self timeView];
  id v8 = [v4 hourMinuteHandStroke];
  id v9 = [v4 hourMinuteHandInlay];
  [v7 applyHourMinuteHandsStrokeColor:v8 fillColor:v9];

  id v11 = [(NTKSecretariatFaceView *)self timeView];
  id v10 = [v4 secondHand];

  [v11 applySecondHandColor:v10];
}

- (void)_updateComplicationColorForPalette:(id)a3 slot:(id)a4 view:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [v8 complication];
  id v10 = [v8 alternateComplication];

  [(NTKSecretariatFaceView *)self setComplicationColor:v9];
  [(NTKSecretariatFaceView *)self setInterpolatedComplicationColor:v9];
  [(NTKSecretariatFaceView *)self setAlternateComplicationColor:v10];
  id v12 = v7;
  [v12 updateMonochromeColor];
  if (objc_opt_respondsToSelector())
  {
    id v11 = +[UIColor clearColor];
    [v12 setPlatterColor:v11];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logoImageView, 0);
  objc_storeStrong((id *)&self->_cornerOverlayView, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end