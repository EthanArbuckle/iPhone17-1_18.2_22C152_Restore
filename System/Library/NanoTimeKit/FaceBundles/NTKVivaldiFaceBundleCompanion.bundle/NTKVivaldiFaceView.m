@interface NTKVivaldiFaceView
- (BOOL)_applyRoundedCornerOverlay;
- (BOOL)_needsForegroundContainerView;
- (BOOL)_wantsStatusBarIconShadow;
- (CGAffineTransform)_timeViewScaleTransform;
- (NTKVivaldiFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (id)_filterProviderForSlot:(id)a3;
- (id)colorPalette;
- (id)createFaceColorPalette;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyComplicationColor:(id)a3 slot:(id)a4;
- (void)_applyComplicationColor:(id)a3 withPalette:(id)a4 slot:(id)a5;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyPaletteToComplications:(id)a3;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyScaleToTimeView;
- (void)_applyTransitionFraction:(double)a3 fromColor:(id)a4 toColor:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_createTimeView;
- (void)_handleLogoTap;
- (void)_loadLayoutRules;
- (void)_loadLogoView;
- (void)_loadSnapshotContentViews;
- (void)_prepareForSnapshotting;
- (void)_removeTimeView;
- (void)_removeViews;
- (void)_setupViews;
- (void)_unloadLogoView;
- (void)_unloadSnapshotContentViews;
- (void)_updateViewColorsWithPalette:(id)a3;
- (void)layoutSubviews;
@end

@implementation NTKVivaldiFaceView

- (NTKVivaldiFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NTKVivaldiFaceView;
  v9 = [(NTKVivaldiFaceView *)&v18 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  if (v9)
  {
    uint64_t v17 = 0;
    memset(v16, 0, sizeof(v16));
    sub_246CB1AD8(v8, (uint64_t)v16);
    id v10 = objc_alloc(MEMORY[0x263F57AC8]);
    uint64_t v11 = [v10 initWithFaceView:v9 dialDiameter:v8 device:*(double *)v16];
    cornerComplicationFactory = v9->_cornerComplicationFactory;
    v9->_cornerComplicationFactory = (NTKWhistlerAnalogFaceViewComplicationFactory *)v11;

    [(NTKWhistlerAnalogFaceViewComplicationFactory *)v9->_cornerComplicationFactory setUsesNarrowTopSlots:1];
    [(NTKVivaldiFaceView *)v9 setComplicationFactory:v9->_cornerComplicationFactory];
    uint64_t v13 = [objc_alloc(MEMORY[0x263F57A20]) initWithDevice:v8];
    cornerFilterProvider = v9->_cornerFilterProvider;
    v9->_cornerFilterProvider = (NTKMonochromeModel *)v13;
  }
  return v9;
}

- (id)colorPalette
{
  return (id)MEMORY[0x270F9A6D0](self, sel_faceColorPalette);
}

- (void)_updateViewColorsWithPalette:(id)a3
{
  id v4 = a3;
  [(NTKVivaldiFaceView *)self _applyPaletteToComplications:v4];
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  v5 = [(UIView *)self->_backgroundView layer];
  id v6 = [v4 background];
  objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(v6, "CGColor"));

  id v8 = [(NTKVivaldiFaceView *)self timeView];
  [v8 applyColorPalette:v4];
  v7 = [v4 secondaryComplication];

  [(NTKVictoryLogoButton *)self->_logoButton setTintColor:v7];
  [MEMORY[0x263F158F8] commit];
}

- (BOOL)_needsForegroundContainerView
{
  return 1;
}

- (id)_filterProviderForSlot:(id)a3
{
  return self->_cornerFilterProvider;
}

- (BOOL)_applyRoundedCornerOverlay
{
  return 1;
}

- (void)_prepareForSnapshotting
{
  v2.receiver = self;
  v2.super_class = (Class)NTKVivaldiFaceView;
  [(NTKVivaldiFaceView *)&v2 _prepareForSnapshotting];
}

- (void)_loadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKVivaldiFaceView;
  [(NTKVivaldiFaceView *)&v3 _loadSnapshotContentViews];
  self->_breathScaleModifier = 1.0;
  self->_rubberBandScaleModifier = 1.0;
  [(NTKVivaldiFaceView *)self _createTimeView];
  [(NTKVivaldiFaceView *)self _setupViews];
  [(NTKVivaldiFaceView *)self _loadLogoView];
}

- (void)_unloadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKVivaldiFaceView;
  [(NTKVivaldiFaceView *)&v3 _unloadSnapshotContentViews];
  [(NTKVivaldiFaceView *)self _removeTimeView];
  [(NTKVivaldiFaceView *)self _unloadLogoView];
  [(NTKVivaldiFaceView *)self _removeViews];
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NTKVivaldiFaceView;
  id v6 = a4;
  id v7 = a3;
  [(NTKVivaldiFaceView *)&v8 _configureComplicationView:v7 forSlot:v6];
  -[NTKVivaldiFaceView _applyComplicationColor:slot:](self, "_applyComplicationColor:slot:", v7, v6, v8.receiver, v8.super_class);
}

- (void)_applyPaletteToComplications:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_246CB1F40;
  v6[3] = &unk_265200F30;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(NTKVivaldiFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v6];
}

- (void)_applyComplicationColor:(id)a3 slot:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NTKVivaldiFaceView *)self colorPalette];
  [(NTKVivaldiFaceView *)self _applyComplicationColor:v7 withPalette:v8 slot:v6];
}

- (void)_applyComplicationColor:(id)a3 withPalette:(id)a4 slot:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [v17 display];
    [(NTKVivaldiFaceView *)self _applyComplicationColor:v10 withPalette:v8 slot:v9];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      cornerFilterProvider = self->_cornerFilterProvider;
      v12 = [v8 secondaryComplication];
      [(NTKMonochromeModel *)cornerFilterProvider setAccentColor:v12];

      uint64_t v13 = self->_cornerFilterProvider;
      v14 = [v8 primaryComplication];
      [(NTKMonochromeModel *)v13 setNonAccentColor:v14];

      v15 = self->_cornerFilterProvider;
      v16 = [v8 background];
      [(NTKMonochromeModel *)v15 setBackgroundColor:v16];

      [v17 updateMonochromeColor];
    }
  }
}

- (void)_setupViews
{
  if (!self->_backgroundView)
  {
    id v3 = objc_alloc(MEMORY[0x263F1CB60]);
    [(NTKVivaldiFaceView *)self bounds];
    id v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    backgroundView = self->_backgroundView;
    self->_backgroundView = v4;

    id v6 = [(NTKVivaldiFaceView *)self contentView];
    [v6 addSubview:self->_backgroundView];
  }
  id v7 = [(NTKVivaldiFaceView *)self contentView];
  [v7 sendSubviewToBack:self->_backgroundView];

  id v9 = [(NTKVivaldiFaceView *)self contentView];
  id v8 = [(NTKVivaldiFaceView *)self timeView];
  [v9 bringSubviewToFront:v8];
}

- (void)_removeViews
{
  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    [(UIView *)backgroundView removeFromSuperview];
    id v4 = self->_backgroundView;
    self->_backgroundView = 0;
  }
}

- (void)_createTimeView
{
  id v3 = [(NTKVivaldiFaceView *)self timeView];

  if (!v3)
  {
    id v4 = [NTKVivaldiTimeView alloc];
    id v5 = [(NTKVivaldiFaceView *)self device];
    id v6 = [MEMORY[0x263F1C550] whiteColor];
    id v8 = [(NTKVivaldiTimeView *)v4 initWithDevice:v5 color:v6];

    [(NTKVivaldiFaceView *)self setTimeView:v8];
    id v7 = [(NTKVivaldiFaceView *)self contentView];
    [v7 addSubview:v8];
  }
}

- (void)_removeTimeView
{
  id v3 = [(NTKVivaldiFaceView *)self timeView];
  [v3 removeFromSuperview];

  [(NTKVivaldiFaceView *)self setTimeView:0];
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)NTKVivaldiFaceView;
  [(NTKVivaldiFaceView *)&v16 layoutSubviews];
  [(NTKVivaldiFaceView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(NTKVivaldiFaceView *)self timeView];
  objc_msgSend(v11, "ntk_setBoundsAndPositionFromFrame:", v4, v6, v8, v10);

  double v15 = 0.0;
  long long v13 = 0u;
  long long v14 = 0u;
  v12 = [(NTKVivaldiFaceView *)self device];
  sub_246CB1AD8(v12, (uint64_t)&v13);

  -[NTKVictoryLogoButton setFrame:](self->_logoButton, "setFrame:", v15, *((double *)&v14 + 1), *((double *)&v13 + 1), *(double *)&v14);
}

- (void)_loadLayoutRules
{
  cornerComplicationFactory = self->_cornerComplicationFactory;
  double v4 = [(NTKVivaldiFaceView *)self device];
  [v4 screenBounds];
  double v6 = v5;
  double v7 = [(NTKVivaldiFaceView *)self device];
  [v7 screenScale];
  [(NTKWhistlerAnalogFaceViewComplicationFactory *)cornerComplicationFactory loadLayoutRulesForFaceView:self dialDiameter:v6 * v8];

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_246CB2618;
  v19[3] = &unk_265200F80;
  v19[4] = self;
  double v9 = (void *)MEMORY[0x24C546C30](v19);
  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeScale(&v18, 0.9, 0.9);
  double v10 = (void (*)(void *, CGAffineTransform *, void))v9[2];
  CGAffineTransform v17 = v18;
  v10(v9, &v17, 0);
  uint64_t v11 = (void (*)(void *, CGAffineTransform *, uint64_t))v9[2];
  CGAffineTransform v17 = v18;
  v11(v9, &v17, 1);
  v12 = (void (*)(void *, CGAffineTransform *, uint64_t))v9[2];
  long long v16 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v17.a = *MEMORY[0x263F000D0];
  long long v15 = *(_OWORD *)&v17.a;
  *(_OWORD *)&v17.c = v16;
  *(_OWORD *)&v17.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  long long v14 = *(_OWORD *)&v17.tx;
  v12(v9, &v17, 3);
  long long v13 = (void (*)(void *, CGAffineTransform *, uint64_t))v9[2];
  *(_OWORD *)&v17.a = v15;
  *(_OWORD *)&v17.c = v16;
  *(_OWORD *)&v17.tx = v14;
  v13(v9, &v17, 2);
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  if (a4 == 10)
  {
    id v7 = [(NTKVivaldiFaceView *)self colorPalette];
    [(NTKVivaldiFaceView *)self _updateViewColorsWithPalette:v7];
  }
}

- (BOOL)_wantsStatusBarIconShadow
{
  return 1;
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v12 = a4;
  id v11 = a5;
  if (a6 == 10) {
    [(NTKVivaldiFaceView *)self _applyTransitionFraction:v12 fromColor:v11 toColor:a3];
  }
}

- (void)_applyTransitionFraction:(double)a3 fromColor:(id)a4 toColor:(id)a5
{
  id v6 = [(NTKVivaldiFaceView *)self interpolatedColorPalette];
  [(NTKVivaldiFaceView *)self _updateViewColorsWithPalette:v6];
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)NTKVivaldiFaceView;
  -[NTKVivaldiFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v7, sel__applyBreathingFraction_forCustomEditMode_slot_, a4, a5);
  NTKLargeElementScaleForBreathingFraction();
  self->_breathScaleModifier = v6;
  [(NTKVivaldiFaceView *)self _applyScaleToTimeView];
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)NTKVivaldiFaceView;
  -[NTKVivaldiFaceView _applyRubberBandingFraction:forCustomEditMode:slot:](&v8, sel__applyRubberBandingFraction_forCustomEditMode_slot_, a4, a5);
  if (a4)
  {
    NTKScaleForRubberBandingFraction();
    self->_rubberBandScaleModifier = v7;
    [(NTKVivaldiFaceView *)self _applyScaleToTimeView];
    NTKAlphaForRubberBandingFraction();
    -[NTKVivaldiFaceView setAlpha:](self, "setAlpha:");
  }
}

- (CGAffineTransform)_timeViewScaleTransform
{
  return CGAffineTransformMakeScale(retstr, self->_breathScaleModifier * self->_rubberBandScaleModifier, self->_breathScaleModifier * self->_rubberBandScaleModifier);
}

- (void)_applyScaleToTimeView
{
  [(NTKVivaldiFaceView *)self _timeViewScaleTransform];
  [(NTKVivaldiFaceView *)self setTransform:&v3];
}

- (void)_loadLogoView
{
  uint64_t v16 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = [(NTKVivaldiFaceView *)self device];
  sub_246CB1AD8(v3, (uint64_t)&v14);

  double v4 = *((double *)&v14 + 1);
  double v5 = *(double *)&v15;
  double v6 = [MEMORY[0x263F57AC0] buttonWithType:0];
  logoButton = self->_logoButton;
  self->_logoButton = v6;

  objc_super v8 = self->_logoButton;
  double v9 = +[NTKFaceBundle imageWithName:@"logo"];
  double v10 = [v9 imageWithRenderingMode:2];
  [(NTKVictoryLogoButton *)v8 setBackgroundImage:v10 forState:0];

  -[NTKVictoryLogoButton setBounds:](self->_logoButton, "setBounds:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v4, v5);
  [(NTKVictoryLogoButton *)self->_logoButton addTarget:self action:sel__handleLogoTap forControlEvents:64];
  id v11 = self->_logoButton;
  id v12 = +[NTKFaceBundle localizedStringForKey:@"VIVALDI_LOGO_BUTTON_ACCESSIBILITY_LABEL" comment:@"Accessibility label for logo button"];
  [(NTKVictoryLogoButton *)v11 setAccessibilityLabel:v12];

  [(NTKVivaldiFaceView *)self addSubview:self->_logoButton];
  long long v13 = self->_logoButton;

  [(NTKVivaldiFaceView *)self bringSubviewToFront:v13];
}

- (void)_handleLogoTap
{
  uint64_t v3 = (void *)MEMORY[0x263F57AB8];
  double v4 = [(NTKVivaldiFaceView *)self delegate];
  [v3 attemptLaunchWithDelegate:v4];

  logoButton = self->_logoButton;
  [(NTKVictoryLogoButton *)logoButton bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  long long v14 = [(NTKVivaldiFaceView *)self contentView];
  -[NTKVictoryLogoButton convertRect:toView:](logoButton, "convertRect:toView:", v14, v7, v9, v11, v13);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  id v23 = [(NTKVivaldiFaceView *)self delegate];
  objc_msgSend(v23, "faceViewRequestedLaunchFromRect:", v16, v18, v20, v22);
}

- (void)_unloadLogoView
{
  [(NTKVictoryLogoButton *)self->_logoButton removeFromSuperview];
  logoButton = self->_logoButton;
  self->_logoButton = 0;
}

- (id)createFaceColorPalette
{
  objc_super v2 = [(NTKFaceColorPalette *)[NTKVivaldiFaceColorPalette alloc] initWithFaceClass:objc_opt_class()];

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cornerComplicationFactory, 0);
  objc_storeStrong((id *)&self->_cornerFilterProvider, 0);
  objc_storeStrong((id *)&self->_logoButton, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end