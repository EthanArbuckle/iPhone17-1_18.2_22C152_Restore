@interface NTKExtragalacticFaceView
+ (BOOL)_backgroundAlphaForOption:(id)a3;
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
- (BOOL)_applyRoundedCornerOverlay;
- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3;
- (NTKExtragalacticContentView)extragalacticContentView;
- (NTKExtragalacticFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)backgroundAlpha;
- (double)breathingFraction;
- (double)rubberbandingFraction;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)createFaceColorPalette;
- (id)extragalacticPalette;
- (void)_applyBreathingAndRubberbanding;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyPalette:(id)a3;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_loadSnapshotContentViews;
- (void)_prepareForSnapshotting;
- (void)_prepareSwatchImagesForSelectedOptions:(id)a3;
- (void)_unloadSnapshotContentViews;
- (void)screenDidTurnOffAnimated:(BOOL)a3;
- (void)screenWillTurnOnAnimated:(BOOL)a3;
- (void)setBackgroundAlpha:(double)a3;
- (void)setBreathingFraction:(double)a3;
- (void)setExtragalacticContentView:(id)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setRubberbandingFraction:(double)a3;
- (void)setTimeOffset:(double)a3;
@end

@implementation NTKExtragalacticFaceView

- (void)screenDidTurnOffAnimated:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKExtragalacticFaceView;
  [(NTKExtragalacticFaceView *)&v5 screenDidTurnOffAnimated:a3];
  v4 = [(NTKExtragalacticFaceView *)self extragalacticContentView];
  [v4 screenDidTurnOff];
}

- (void)screenWillTurnOnAnimated:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKExtragalacticFaceView;
  [(NTKExtragalacticFaceView *)&v5 screenWillTurnOnAnimated:a3];
  v4 = [(NTKExtragalacticFaceView *)self extragalacticContentView];
  [v4 screenWillTurnOn];
}

- (NTKExtragalacticFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)NTKExtragalacticFaceView;
  result = [(NTKExtragalacticFaceView *)&v6 initWithFaceStyle:a3 forDevice:a4 clientIdentifier:a5];
  if (result) {
    result->_backgroundAlpha = 1.0;
  }
  return result;
}

- (void)_loadSnapshotContentViews
{
  v17.receiver = self;
  v17.super_class = (Class)NTKExtragalacticFaceView;
  [(NTKExtragalacticFaceView *)&v17 _loadSnapshotContentViews];
  v3 = [NTKExtragalacticContentView alloc];
  [(NTKExtragalacticFaceView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(NTKExtragalacticFaceView *)self device];
  v13 = [(NTKExtragalacticFaceView *)self extragalacticPalette];
  v14 = -[NTKExtragalacticContentView initWithFrame:device:palette:](v3, "initWithFrame:device:palette:", v12, v13, v5, v7, v9, v11);
  extragalacticContentView = self->_extragalacticContentView;
  self->_extragalacticContentView = v14;

  [(NTKExtragalacticContentView *)self->_extragalacticContentView setBackgroundAlpha:self->_backgroundAlpha];
  v16 = [(NTKExtragalacticFaceView *)self contentView];
  [v16 addSubview:self->_extragalacticContentView];
}

- (void)_unloadSnapshotContentViews
{
  v4.receiver = self;
  v4.super_class = (Class)NTKExtragalacticFaceView;
  [(NTKExtragalacticFaceView *)&v4 _unloadSnapshotContentViews];
  [(NTKExtragalacticContentView *)self->_extragalacticContentView removeFromSuperview];
  extragalacticContentView = self->_extragalacticContentView;
  self->_extragalacticContentView = 0;
}

- (void)setBackgroundAlpha:(double)a3
{
  if (self->_backgroundAlpha != a3)
  {
    self->_backgroundAlpha = a3;
    -[NTKExtragalacticContentView setBackgroundAlpha:](self->_extragalacticContentView, "setBackgroundAlpha:");
  }
}

- (BOOL)_applyRoundedCornerOverlay
{
  return 1;
}

- (void)_prepareForSnapshotting
{
  v2.receiver = self;
  v2.super_class = (Class)NTKExtragalacticFaceView;
  [(NTKExtragalacticFaceView *)&v2 _prepareForSnapshotting];
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NTKExtragalacticFaceView;
  id v6 = a3;
  [(NTKExtragalacticFaceView *)&v7 setOverrideDate:v6 duration:a4];
  -[NTKExtragalacticContentView setOverrideDate:duration:](self->_extragalacticContentView, "setOverrideDate:duration:", v6, a4, v7.receiver, v7.super_class);
}

- (void)setTimeOffset:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKExtragalacticFaceView;
  -[NTKExtragalacticFaceView setTimeOffset:](&v5, sel_setTimeOffset_);
  [(NTKExtragalacticContentView *)self->_extragalacticContentView setTimeOffset:a3];
}

- (NTKExtragalacticContentView)extragalacticContentView
{
  return self->_extragalacticContentView;
}

- (void)setExtragalacticContentView:(id)a3
{
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

- (double)backgroundAlpha
{
  return self->_backgroundAlpha;
}

- (void).cxx_destruct
{
}

- (id)createFaceColorPalette
{
  objc_super v2 = objc_alloc_init(NTKExtragalacticColorPalette);

  return v2;
}

- (void)_applyPalette:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKExtragalacticFaceView *)self extragalacticContentView];
  [v5 setPalette:v4];
}

- (id)extragalacticPalette
{
  return (id)MEMORY[0x270F9A6D0](self, sel_faceColorPalette);
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NTKExtragalacticFaceView;
  [(NTKExtragalacticFaceView *)&v15 _applyTransitionFraction:v12 fromOption:v13 toOption:a6 forCustomEditMode:a7 slot:a3];
  if (a6 == 10)
  {
    v14 = [(NTKExtragalacticFaceView *)self interpolatedColorPalette];
    [(NTKExtragalacticFaceView *)self _applyPalette:v14];
  }
  else if (a6 == 17)
  {
    [(id)objc_opt_class() _backgroundAlphaForOption:v12];
    [(id)objc_opt_class() _backgroundAlphaForOption:v13];
    CLKInterpolateBetweenFloatsClipped();
    -[NTKExtragalacticFaceView setBackgroundAlpha:](self, "setBackgroundAlpha:");
  }
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKExtragalacticFaceView;
  [(NTKExtragalacticFaceView *)&v10 _applyOption:v8 forCustomEditMode:a4 slot:a5];
  if (a4 == 10)
  {
    double v9 = [(NTKExtragalacticFaceView *)self extragalacticPalette];
    [(NTKExtragalacticFaceView *)self _applyPalette:v9];
  }
  else if (a4 == 17)
  {
    -[NTKExtragalacticFaceView setBackgroundAlpha:](self, "setBackgroundAlpha:", (double)[(id)objc_opt_class() _backgroundAlphaForOption:v8]);
  }
}

+ (BOOL)_backgroundAlphaForOption:(id)a3
{
  return [a3 backgroundStyle] == 1;
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)NTKExtragalacticFaceView;
  -[NTKExtragalacticFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v7, sel__applyBreathingFraction_forCustomEditMode_slot_, a4, a5);
  [(NTKExtragalacticFaceView *)self setBreathingFraction:a3];
  [(NTKExtragalacticFaceView *)self _applyBreathingAndRubberbanding];
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)NTKExtragalacticFaceView;
  -[NTKExtragalacticFaceView _applyRubberBandingFraction:forCustomEditMode:slot:](&v7, sel__applyRubberBandingFraction_forCustomEditMode_slot_, a4, a5);
  NTKAlphaForRubberBandingFraction();
  -[NTKExtragalacticFaceView setAlpha:](self, "setAlpha:");
  [(NTKExtragalacticFaceView *)self setRubberbandingFraction:a3];
  [(NTKExtragalacticFaceView *)self _applyBreathingAndRubberbanding];
}

- (void)_applyBreathingAndRubberbanding
{
  [(NTKExtragalacticFaceView *)self breathingFraction];
  NTKLargeElementScaleForBreathingFraction();
  double v4 = v3;
  [(NTKExtragalacticFaceView *)self rubberbandingFraction];
  NTKScaleForRubberBandingFraction();
  CGAffineTransformMakeScale(&v7, v4 * v5, v4 * v5);
  CGAffineTransform v6 = v7;
  [(NTKExtragalacticFaceView *)self setTransform:&v6];
}

- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3
{
  return a3 == 10 || a3 == 17;
}

- (void)_prepareSwatchImagesForSelectedOptions:(id)a3
{
  id v10 = a3;
  double v4 = [(NTKExtragalacticFaceView *)self device];
  uint64_t v5 = [MEMORY[0x263F579E0] numberOfOptionsForDevice:v4];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
    {
      id v8 = [MEMORY[0x263F579E0] optionAtIndex:i forDevice:v4];
      id v9 = [(NTKExtragalacticFaceView *)self _swatchImageForEditOption:v8 mode:17 withSelectedOptions:v10];
    }
  }
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 17) {
    return &unk_26FB0C2C0;
  }
  else {
    return 0;
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4 == 17)
  {
    if (!qword_2691D4490)
    {
      uint64_t v10 = objc_opt_new();
      double v11 = (void *)qword_2691D4490;
      qword_2691D4490 = v10;
    }
    id v12 = v8;
    id v13 = [v9 objectForKeyedSubscript:&unk_26FB0C1A8];
    v14 = NSString;
    objc_super v15 = [v13 identifier];
    v16 = [v12 dailySnapshotKey];
    objc_super v17 = [v14 stringWithFormat:@"%@-%@", v15, v16];

    v18 = [(id)qword_2691D4490 objectForKey:v17];
    if (!v18)
    {
      [(NTKExtragalacticFaceView *)self bounds];
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      v27 = [NTKExtragalacticFaceView alloc];
      v28 = [(NTKExtragalacticFaceView *)self device];
      v29 = [(NTKExtragalacticFaceView *)v27 initWithFaceStyle:44 forDevice:v28 clientIdentifier:0];

      -[NTKExtragalacticFaceView setFrame:](v29, "setFrame:", v20, v22, v24, v26);
      [(NTKExtragalacticFaceView *)v29 _loadSnapshotContentViews];
      v30 = NTKIdealizedDate();
      [(NTKExtragalacticFaceView *)v29 setOverrideDate:v30 duration:0.0];

      [(NTKExtragalacticFaceView *)v29 setOption:v12 forCustomEditMode:17 slot:0];
      [(NTKExtragalacticFaceView *)v29 setOption:v13 forCustomEditMode:10 slot:0];
      v34.width = v24;
      v34.height = v26;
      UIGraphicsBeginImageContextWithOptions(v34, 0, 0.0);
      -[NTKExtragalacticFaceView drawViewHierarchyInRect:afterScreenUpdates:](v29, "drawViewHierarchyInRect:afterScreenUpdates:", 1, v20, v22, v24, v26);
      v18 = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
      [(id)qword_2691D4490 setObject:v18 forKey:v17];
    }
  }
  else
  {
    v32.receiver = self;
    v32.super_class = (Class)NTKExtragalacticFaceView;
    v18 = [(NTKExtragalacticFaceView *)&v32 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:v9];
  }

  return v18;
}

@end