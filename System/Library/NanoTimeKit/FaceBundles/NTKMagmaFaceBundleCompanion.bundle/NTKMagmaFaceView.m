@interface NTKMagmaFaceView
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
+ (int64_t)uiSensitivity;
- (BOOL)_wantsStatusBarIconShadow;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)colorPalette;
- (id)createFaceColorPalette;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyDataMode;
- (void)_applyFrozen;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_finalizeForSnapshotting:(id)a3;
- (void)_handleLogoTap;
- (void)_loadCornerOverlayView;
- (void)_loadEffectsView;
- (void)_loadLogoView;
- (void)_loadSnapshotContentViews;
- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)_unloadCornerOverlayView;
- (void)_unloadEffectsView;
- (void)_unloadLogoView;
- (void)_unloadSnapshotContentViews;
- (void)_updateViewColorsWithPalette:(id)a3;
- (void)layoutSubviews;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setTimeOffset:(double)a3;
@end

@implementation NTKMagmaFaceView

+ (int64_t)uiSensitivity
{
  v2 = +[CLKRenderingContext sharedRenderingContext];
  v3 = [v2 device];
  int64_t v4 = NTKSensitivityForVictoryFaces();

  return v4;
}

- (void)_applyFrozen
{
  v3.receiver = self;
  v3.super_class = (Class)NTKMagmaFaceView;
  [(NTKMagmaFaceView *)&v3 _applyFrozen];
  [(NTKMagmaEffectsView *)self->_effectsView setPaused:[(NTKMagmaFaceView *)self isFrozen]];
}

- (void)_loadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKMagmaFaceView;
  [(NTKMagmaFaceView *)&v3 _loadSnapshotContentViews];
  [(NTKMagmaFaceView *)self _loadEffectsView];
  [(NTKMagmaFaceView *)self _loadLogoView];
  [(NTKMagmaFaceView *)self _loadCornerOverlayView];
}

- (void)_unloadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKMagmaFaceView;
  [(NTKMagmaFaceView *)&v3 _unloadSnapshotContentViews];
  [(NTKMagmaFaceView *)self _unloadCornerOverlayView];
  [(NTKMagmaFaceView *)self _unloadLogoView];
  [(NTKMagmaFaceView *)self _unloadEffectsView];
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NTKMagmaFaceView;
  id v6 = a3;
  [(NTKMagmaFaceView *)&v7 setOverrideDate:v6 duration:a4];
  -[NTKMagmaEffectsView setOverrideDate:duration:](self->_effectsView, "setOverrideDate:duration:", v6, a4, v7.receiver, v7.super_class);
}

- (void)setTimeOffset:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKMagmaFaceView;
  -[NTKMagmaFaceView setTimeOffset:](&v5, "setTimeOffset:");
  [(NTKMagmaEffectsView *)self->_effectsView setTimeOffset:a3];
}

- (BOOL)_wantsStatusBarIconShadow
{
  v2 = [(NTKMagmaFaceView *)self optionForCustomEditMode:15 slot:0];
  BOOL v3 = [v2 backgroundStyle] == (char *)&dword_0 + 1;

  return v3;
}

- (void)_applyDataMode
{
  BOOL v3 = [(NTKMagmaFaceView *)self dataMode] == (char *)&dword_0 + 1;
  logoButton = self->_logoButton;

  [(NTKMagmaButton *)logoButton setUserInteractionEnabled:v3];
}

- (void)_loadEffectsView
{
  BOOL v3 = [NTKMagmaEffectsView alloc];
  int64_t v4 = [(NTKMagmaFaceView *)self contentView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(NTKMagmaFaceView *)self device];
  v14 = -[NTKMagmaEffectsView initWithFrame:device:](v3, "initWithFrame:device:", v13, v6, v8, v10, v12);
  effectsView = self->_effectsView;
  self->_effectsView = v14;

  id v16 = [(NTKMagmaFaceView *)self contentView];
  [v16 addSubview:self->_effectsView];
}

- (void)_unloadEffectsView
{
  [(NTKMagmaEffectsView *)self->_effectsView removeFromSuperview];
  effectsView = self->_effectsView;
  self->_effectsView = 0;
}

- (void)_loadLogoView
{
  BOOL v3 = [(NTKMagmaFaceView *)self device];
  sub_8CAC(v3);
  double v5 = v4;
  double v7 = v6;

  double v8 = [(NTKMagmaFaceView *)self device];
  sub_8CAC(v8);
  double v10 = v9;

  double v11 = +[NTKMagmaButton buttonWithType:0];
  logoButton = self->_logoButton;
  self->_logoButton = v11;

  -[NTKMagmaButton setTouchEdgeInsets:](self->_logoButton, "setTouchEdgeInsets:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  -[NTKMagmaButton setBounds:](self->_logoButton, "setBounds:", CGPointZero.x, CGPointZero.y, v5 + v10 * 2.0, v7 + v10 * 2.0);
  [(NTKMagmaButton *)self->_logoButton addTarget:self action:"_handleLogoTap" forControlEvents:64];
  v13 = self->_logoButton;
  v14 = +[NTKMagmaFaceBundle localizedStringForKey:@"MAGMA_LOGO_BUTTON_ACCESSIBILITY_LABEL" comment:@"Accessibility label for logo button"];
  [(NTKMagmaButton *)v13 setAccessibilityLabel:v14];

  [(NTKMagmaButton *)self->_logoButton setNeedsLayout];
  [(NTKMagmaButton *)self->_logoButton setDelegate:self->_effectsView];
  id v15 = [(NTKMagmaFaceView *)self contentView];
  [v15 addSubview:self->_logoButton];
}

- (void)_handleLogoTap
{
  BOOL v3 = [(NTKMagmaFaceView *)self delegate];
  +[NTKVictoryAppLauncher attemptLaunchWithDelegate:v3];

  logoButton = self->_logoButton;
  [(NTKMagmaButton *)logoButton bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(NTKMagmaFaceView *)self contentView];
  -[NTKMagmaButton convertRect:toView:](logoButton, "convertRect:toView:", v13, v6, v8, v10, v12);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  id v22 = [(NTKMagmaFaceView *)self delegate];
  objc_msgSend(v22, "faceViewRequestedLaunchFromRect:", v15, v17, v19, v21);
}

- (void)_unloadLogoView
{
  [(NTKMagmaButton *)self->_logoButton removeFromSuperview];
  logoButton = self->_logoButton;
  self->_logoButton = 0;
}

- (void)_loadCornerOverlayView
{
  id v3 = objc_alloc((Class)NTKRoundedCornerOverlayView);
  double v4 = [(NTKMagmaFaceView *)self contentView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(NTKMagmaFaceView *)self device];
  double v14 = (NTKRoundedCornerOverlayView *)objc_msgSend(v3, "initWithFrame:forDeviceCornerRadius:", v13, v6, v8, v10, v12);
  cornerOverlayView = self->_cornerOverlayView;
  self->_cornerOverlayView = v14;

  id v16 = [(NTKMagmaFaceView *)self contentView];
  [v16 addSubview:self->_cornerOverlayView];
}

- (void)_unloadCornerOverlayView
{
  [(NTKRoundedCornerOverlayView *)self->_cornerOverlayView removeFromSuperview];
  cornerOverlayView = self->_cornerOverlayView;
  self->_cornerOverlayView = 0;
}

- (void)_finalizeForSnapshotting:(id)a3
{
  effectsView = self->_effectsView;
  id v4 = a3;
  id v5 = [(NTKMagmaEffectsView *)effectsView quadView];
  [v5 renderSynchronouslyWithImageQueueDiscard:1 inGroup:0 completion:v4];
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)NTKMagmaFaceView;
  [(NTKMagmaFaceView *)&v16 layoutSubviews];
  id v3 = [(NTKMagmaFaceView *)self device];
  double v4 = sub_8CAC(v3);
  double v6 = v5;

  double v7 = [(NTKMagmaFaceView *)self device];
  sub_8CAC(v7);
  double v9 = v8;

  [(NTKMagmaButton *)self->_logoButton frame];
  double v11 = v10;
  double v13 = v12;
  [(NTKMagmaFaceView *)self bounds];
  CGFloat v14 = CGRectGetMidX(v17) + v6 * -0.5 - v9;
  [(NTKMagmaFaceView *)self bounds];
  double Height = CGRectGetHeight(v18);
  [(NTKMagmaButton *)self->_logoButton bounds];
  -[NTKMagmaButton setFrame:](self->_logoButton, "setFrame:", v14, v9 + Height - CGRectGetHeight(v19) - v4, v11, v13);
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v16 = a3;
  id v8 = a5;
  if (a4 == 15)
  {
    double v11 = [(NTKMagmaFaceView *)self optionForCustomEditMode:15 slot:0];
    id v12 = [v11 backgroundStyle];
    self->_unint64_t backgroundStyle = (unint64_t)v12;
    double v13 = [(NTKMagmaFaceView *)self colorPalette];
    [v13 setBackgroundStyle:v12];

    CGFloat v14 = [(NTKMagmaFaceView *)self colorPalette];
    [(NTKMagmaFaceView *)self _updateViewColorsWithPalette:v14];

    double v15 = [(NTKMagmaFaceView *)self delegate];
    [v15 faceViewDidChangeWantsStatusBarIconShadow];
  }
  else
  {
    if (a4 != 10) {
      goto LABEL_6;
    }
    unint64_t backgroundStyle = self->_backgroundStyle;
    double v10 = [(NTKMagmaFaceView *)self colorPalette];
    [v10 setBackgroundStyle:backgroundStyle];

    double v11 = [(NTKMagmaFaceView *)self colorPalette];
    [(NTKMagmaFaceView *)self _updateViewColorsWithPalette:v11];
  }

LABEL_6:
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v22 = a4;
  id v12 = a5;
  id v13 = a7;
  if (a6 == 15)
  {
    id v15 = [v22 backgroundStyle];
    id v16 = [v12 backgroundStyle];
    CGRect v17 = [(NTKMagmaFaceView *)self colorPalette];
    id v14 = [v17 copy];

    [v14 setBackgroundStyle:v15];
    CGRect v18 = [(NTKMagmaFaceView *)self colorPalette];
    id v19 = [v18 copy];

    [v19 setBackgroundStyle:v16];
    id v20 = [objc_alloc((Class)NTKInterpolatedColorPalette) initWithFromPalette:v14 toPalette:v19];
    [v20 setTransitionFraction:a3];
    if (a3 >= 0.5) {
      id v15 = v16;
    }
    self->_unint64_t backgroundStyle = (unint64_t)v15;
    double v21 = [(NTKMagmaFaceView *)self colorPalette];
    [v21 setBackgroundStyle:v15];

    [(NTKMagmaFaceView *)self _updateViewColorsWithPalette:v20];
  }
  else
  {
    if (a6 != 10) {
      goto LABEL_8;
    }
    id v14 = [(NTKMagmaFaceView *)self interpolatedColorPalette];
    [(NTKMagmaFaceView *)self _updateViewColorsWithPalette:v14];
  }

LABEL_8:
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  if (a4 == 15 || a4 == 10)
  {
    NTKLargeElementScaleForBreathingFraction();
    memset(&v10, 0, sizeof(v10));
    CGAffineTransformMakeScale(&v10, v6, v6);
    CGAffineTransform v9 = v10;
    double v7 = [(NTKMagmaFaceView *)self contentView];
    CGAffineTransform v8 = v9;
    [v7 setTransform:&v8];
  }
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  if (a4 == 15 || a4 == 10)
  {
    NTKScaleForRubberBandingFraction();
    CGFloat v7 = v6;
    NTKAlphaForRubberBandingFraction();
    double v9 = v8;
    memset(&v14, 0, sizeof(v14));
    CGAffineTransformMakeScale(&v14, v7, v7);
    CGAffineTransform v13 = v14;
    CGAffineTransform v10 = [(NTKMagmaFaceView *)self contentView];
    CGAffineTransform v12 = v13;
    [v10 setTransform:&v12];

    double v11 = [(NTKMagmaFaceView *)self contentView];
    [v11 setAlpha:v9];
  }
}

- (void)_configureForEditMode:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKMagmaFaceView;
  -[NTKMagmaFaceView _configureForEditMode:](&v5, "_configureForEditMode:");
  [(NTKMagmaEffectsView *)self->_effectsView setEditing:a3 != 0];
}

- (id)createFaceColorPalette
{
  v2 = [[NTKMagmaColorPalette alloc] initWithFaceClass:objc_opt_class()];

  return v2;
}

- (id)colorPalette
{
  return [(NTKMagmaFaceView *)self faceColorPalette];
}

- (void)_updateViewColorsWithPalette:(id)a3
{
  id v5 = a3;
  double v4 = [v5 swoosh];
  [(NTKMagmaButton *)self->_logoButton setTintColor:v4];

  [(NTKMagmaEffectsView *)self->_effectsView setColorPalette:v5];
}

- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  BOOL v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NTKMagmaFaceView;
  id v6 = a4;
  [(NTKMagmaFaceView *)&v8 _renderSynchronouslyWithImageQueueDiscard:v4 inGroup:v6];
  CGFloat v7 = [(NTKMagmaEffectsView *)self->_effectsView quadView];
  [v7 renderSynchronouslyWithImageQueueDiscard:v4 inGroup:v6];
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 15) {
    return &off_14FF0;
  }
  else {
    return 0;
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4 == 15)
  {
    if (qword_1C4F0 != -1) {
      dispatch_once(&qword_1C4F0, &stru_14668);
    }
    id v10 = v8;
    double v11 = [v9 objectForKeyedSubscript:&off_14FA8];
    CGAffineTransform v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 backgroundStyle]);
    CGAffineTransform v13 = [v11 identifier];
    CGAffineTransform v14 = +[NSString stringWithFormat:@"%@-%@", v12, v13];

    id v15 = [(id)qword_1C4E8 objectForKey:v14];
    if (!v15)
    {
      id v16 = [NTKMagmaFaceView alloc];
      CGRect v17 = [(NTKMagmaFaceView *)self device];
      CGRect v18 = [(NTKMagmaFaceView *)v16 initWithFaceStyle:44 forDevice:v17 clientIdentifier:0];

      [(NTKMagmaFaceView *)self bounds];
      objc_msgSend(v18, "setFrame:");
      [v18 _loadSnapshotContentViews];
      [v18 setOption:v10 forCustomEditMode:15 slot:0];
      [v18 setOption:v11 forCustomEditMode:10 slot:0];
      id v19 = NTKIdealizedDate();
      [v18 setOverrideDate:v19 duration:0.0];

      +[NTKEditOption sizeForSwatchStyle:](NTKEditOption, "sizeForSwatchStyle:", [v10 swatchStyle]);
      double v21 = v20;
      double v23 = v22;
      [(NTKMagmaFaceView *)self bounds];
      CGFloat v24 = CGRectGetHeight(v32) / v23;
      v25 = [(NTKMagmaFaceView *)self device];
      [v25 screenScale];
      CGFloat v27 = v24 * v26;

      v28 = [v18[2] quadView];
      id v15 = objc_msgSend(v28, "snapshotInRect:scale:time:", 0.0, 0.0, v21, v23, v27, 0.0);

      [(id)qword_1C4E8 setObject:v15 forKey:v14];
    }
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)NTKMagmaFaceView;
    id v15 = [(NTKMagmaFaceView *)&v30 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:v9];
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logoButton, 0);
  objc_storeStrong((id *)&self->_effectsView, 0);

  objc_storeStrong((id *)&self->_cornerOverlayView, 0);
}

@end