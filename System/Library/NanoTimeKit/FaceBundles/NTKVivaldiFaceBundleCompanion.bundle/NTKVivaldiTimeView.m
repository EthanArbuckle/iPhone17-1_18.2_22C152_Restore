@interface NTKVivaldiTimeView
+ (id)vivaldiFontDescriptor;
+ (id)vivaldiLowerFontDescriptor;
+ (id)vivaldiLowerOutlineFontDescriptor;
+ (id)vivaldiOutlineFontDescriptor;
+ (id)vivaldiUpperFontDescriptor;
+ (id)vivaldiUpperOutlineFontDescriptor;
- (BOOL)frozen;
- (BOOL)isFrozen;
- (NTKVivaldiTimeView)initWithDevice:(id)a3 color:(id)a4;
- (NTKVivaldiTimeViewDelegate)delegate;
- (id)_shadowImage;
- (int64_t)faceDataMode;
- (void)_updateAnimating;
- (void)_updateLabels;
- (void)applyColorPalette:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setFaceDataMode:(int64_t)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)updateColorsForComplicationsEditingFraction:(double)a3 withColorPalette:(id)a4;
@end

@implementation NTKVivaldiTimeView

- (NTKVivaldiTimeView)initWithDevice:(id)a3 color:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v47.receiver = self;
  v47.super_class = (Class)NTKVivaldiTimeView;
  v9 = [(NTKVivaldiTimeView *)&v47 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    uint64_t v11 = objc_opt_new();
    timeLabelsContainerView = v10->_timeLabelsContainerView;
    v10->_timeLabelsContainerView = (UIView *)v11;

    [(NTKVivaldiTimeView *)v10 addSubview:v10->_timeLabelsContainerView];
    double v13 = sub_246CB54D8(v7);
    v14 = (void *)MEMORY[0x263EFD198];
    v15 = [(id)objc_opt_class() vivaldiUpperFontDescriptor];
    uint64_t v16 = [v14 fontWithDescriptor:v15 size:v13];
    topLabelFont = v10->_topLabelFont;
    v10->_topLabelFont = (CLKFont *)v16;

    v18 = (void *)MEMORY[0x263EFD198];
    v19 = [(id)objc_opt_class() vivaldiLowerFontDescriptor];
    uint64_t v20 = [v18 fontWithDescriptor:v19 size:v13];
    bottomLabelFont = v10->_bottomLabelFont;
    v10->_bottomLabelFont = (CLKFont *)v20;

    v22 = (void *)MEMORY[0x263EFD198];
    v23 = [(id)objc_opt_class() vivaldiUpperOutlineFontDescriptor];
    uint64_t v24 = [v22 fontWithDescriptor:v23 size:v13];
    topLabelOutlineFont = v10->_topLabelOutlineFont;
    v10->_topLabelOutlineFont = (CLKFont *)v24;

    v26 = (void *)MEMORY[0x263EFD198];
    v27 = [(id)objc_opt_class() vivaldiLowerOutlineFontDescriptor];
    uint64_t v28 = [v26 fontWithDescriptor:v27 size:v13];
    bottomLabelOutlineFont = v10->_bottomLabelOutlineFont;
    v10->_bottomLabelOutlineFont = (CLKFont *)v28;

    v30 = [[NTKVivaldiTimeLabel alloc] initWithTimeComponent:0 color:v8 font:v10->_topLabelFont fontSize:0 outline:v13];
    topLabel = v10->_topLabel;
    v10->_topLabel = v30;

    [(NTKVivaldiTimeLabel *)v10->_topLabel setTextAlignment:1];
    [(UIView *)v10->_timeLabelsContainerView addSubview:v10->_topLabel];
    v32 = [[NTKVivaldiTimeLabel alloc] initWithTimeComponent:1 color:v8 font:v10->_bottomLabelFont fontSize:0 outline:v13];
    bottomLabel = v10->_bottomLabel;
    v10->_bottomLabel = v32;

    [(NTKVivaldiTimeLabel *)v10->_bottomLabel setTextAlignment:1];
    [(UIView *)v10->_timeLabelsContainerView addSubview:v10->_bottomLabel];
    uint64_t v34 = [(NTKVivaldiTimeView *)v10 _shadowImage];
    shadowImage = v10->_shadowImage;
    v10->_shadowImage = (UIImage *)v34;

    uint64_t v36 = [objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v10->_shadowImage];
    shadowView = v10->_shadowView;
    v10->_shadowView = (UIImageView *)v36;

    v38 = [[NTKVivaldiGlobeView alloc] initWithDevice:v10->_device];
    globeView = v10->_globeView;
    v10->_globeView = v38;

    [(NTKVivaldiTimeView *)v10 addSubview:v10->_globeView];
    [(NTKVivaldiTimeView *)v10 addSubview:v10->_shadowView];
    [(NTKVivaldiTimeView *)v10 sendSubviewToBack:v10->_shadowView];
    [(NTKVivaldiTimeView *)v10 sendSubviewToBack:v10->_globeView];
    objc_initWeak(&location, v10);
    v40 = [MEMORY[0x263EFCF88] sharedInstance];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = sub_246CB55E4;
    v44[3] = &unk_265200FD0;
    objc_copyWeak(&v45, &location);
    uint64_t v41 = [v40 startUpdatesWithUpdateFrequency:0 withHandler:v44 identificationLog:&unk_26FB3B9B0];
    timerToken = v10->_timerToken;
    v10->_timerToken = (CLKClockTimerToken *)v41;

    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263EFCF88] sharedInstance];
  [v3 stopUpdatesForToken:self->_timerToken];

  v4.receiver = self;
  v4.super_class = (Class)NTKVivaldiTimeView;
  [(NTKVivaldiTimeView *)&v4 dealloc];
}

- (void)layoutSubviews
{
  double v3 = sub_246CB54D8(self->_device);
  double v24 = v4;
  double v26 = v5;
  [(NTKVivaldiTimeView *)self bounds];
  double v25 = v6;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  -[UIView ntk_setBoundsAndPositionFromFrame:](self->_timeLabelsContainerView, "ntk_setBoundsAndPositionFromFrame:");
  [(NTKVivaldiTimeLabel *)self->_topLabel sizeToFit];
  [(NTKVivaldiTimeLabel *)self->_bottomLabel sizeToFit];
  [(NTKVivaldiTimeLabel *)self->_topLabel bounds];
  double v14 = v13;
  double v16 = v15;
  [(NTKVivaldiTimeLabel *)self->_bottomLabel bounds];
  double v18 = v17;
  double v20 = v19;
  [(NTKVivaldiTimeLabel *)self->_topLabel _lastLineBaseline];
  -[NTKVivaldiTimeLabel setFrame:](self->_topLabel, "setFrame:", (v10 - v14) * 0.5, v24 - v21, v14, v16);
  [(NTKVivaldiTimeLabel *)self->_bottomLabel _lastLineBaseline];
  -[NTKVivaldiTimeLabel setFrame:](self->_bottomLabel, "setFrame:", (v10 - v18) * 0.5, v26 - v22, v18, v20);
  -[UIImageView setFrame:](self->_shadowView, "setFrame:", v25, v8, v10, v12);
  globeView = self->_globeView;

  -[NTKVivaldiGlobeView setFrame:](globeView, "setFrame:", v25, v8, v10, v12);
}

- (void)_updateLabels
{
  overrideDate = self->_overrideDate;
  if (overrideDate)
  {
    double v4 = overrideDate;
  }
  else
  {
    double v4 = [MEMORY[0x263F579B0] faceDate];
  }
  double v6 = v4;
  [(NTKVivaldiTimeLabel *)self->_topLabel setDate:v4];
  [(NTKVivaldiTimeLabel *)self->_bottomLabel setDate:v6];
  [(NTKVivaldiTimeView *)self setNeedsLayout];
  double v5 = [(NTKVivaldiTimeView *)self delegate];
  [v5 vivaldiTimeViewDidChangeTime];
}

- (void)applyColorPalette:(id)a3
{
  double v4 = (void *)MEMORY[0x263F158F8];
  id v5 = a3;
  [v4 setDisableActions:1];
  shadowView = self->_shadowView;
  double v7 = [v5 numeralsShadow];
  [(UIImageView *)shadowView setTintColor:v7];

  [(NTKVivaldiTimeView *)self updateColorsForComplicationsEditingFraction:v5 withColorPalette:0.0];
  double v8 = (void *)MEMORY[0x263F158F8];

  [v8 setDisableActions:0];
}

- (void)updateColorsForComplicationsEditingFraction:(double)a3 withColorPalette:(id)a4
{
  topLabel = self->_topLabel;
  id v7 = a4;
  [(NTKVivaldiTimeLabel *)topLabel updateColorsForComplicationsEditingFraction:v7 withColorPalette:a3];
  [(NTKVivaldiTimeLabel *)self->_bottomLabel updateColorsForComplicationsEditingFraction:v7 withColorPalette:a3];
  [(UIImageView *)self->_shadowView setAlpha:1.0 - a3];
  [(NTKVivaldiGlobeView *)self->_globeView updateColorsForComplicationsEditingFraction:v7 withColorPalette:a3];
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  objc_storeStrong((id *)&self->_overrideDate, a3);
  id v6 = a3;
  [(NTKVivaldiTimeView *)self _updateLabels];
  [(NTKVivaldiGlobeView *)self->_globeView setDate:v6];
}

- (BOOL)frozen
{
  return self->_frozen;
}

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
  MEMORY[0x270F9A6D0](self, sel__updateAnimating);
}

- (int64_t)faceDataMode
{
  return self->_faceDataMode;
}

- (void)setFaceDataMode:(int64_t)a3
{
  self->_faceDataMode = a3;
  MEMORY[0x270F9A6D0](self, sel__updateAnimating);
}

- (void)_updateAnimating
{
}

- (id)_shadowImage
{
  v2 = +[NTKFaceBundle imageWithName:@"Shadow"];
  double v3 = [v2 imageWithRenderingMode:2];

  return v3;
}

+ (id)vivaldiUpperFontDescriptor
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_246CB5C58;
  block[3] = &unk_2652010D8;
  block[4] = a1;
  if (qword_2691E2678 != -1) {
    dispatch_once(&qword_2691E2678, block);
  }
  v2 = (void *)qword_2691E2670;

  return v2;
}

+ (id)vivaldiLowerFontDescriptor
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_246CB5E44;
  block[3] = &unk_2652010D8;
  block[4] = a1;
  if (qword_2691E2688 != -1) {
    dispatch_once(&qword_2691E2688, block);
  }
  v2 = (void *)qword_2691E2680;

  return v2;
}

+ (id)vivaldiUpperOutlineFontDescriptor
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_246CB6030;
  block[3] = &unk_2652010D8;
  block[4] = a1;
  if (qword_2691E2698 != -1) {
    dispatch_once(&qword_2691E2698, block);
  }
  v2 = (void *)qword_2691E2690;

  return v2;
}

+ (id)vivaldiLowerOutlineFontDescriptor
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_246CB6284;
  block[3] = &unk_2652010D8;
  block[4] = a1;
  if (qword_2691E26A8 != -1) {
    dispatch_once(&qword_2691E26A8, block);
  }
  v2 = (void *)qword_2691E26A0;

  return v2;
}

+ (id)vivaldiFontDescriptor
{
  if (qword_2691E26B8 != -1) {
    dispatch_once(&qword_2691E26B8, &unk_26FB3B9D0);
  }
  v2 = (void *)qword_2691E26B0;

  return v2;
}

+ (id)vivaldiOutlineFontDescriptor
{
  if (qword_2691E26C8 != -1) {
    dispatch_once(&qword_2691E26C8, &unk_26FB3B9F0);
  }
  v2 = (void *)qword_2691E26C0;

  return v2;
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (NTKVivaldiTimeViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKVivaldiTimeViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timerToken, 0);
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_globeView, 0);
  objc_storeStrong((id *)&self->_bottomLabelOutline, 0);
  objc_storeStrong((id *)&self->_topLabelOutline, 0);
  objc_storeStrong((id *)&self->_bottomLabel, 0);
  objc_storeStrong((id *)&self->_topLabel, 0);
  objc_storeStrong((id *)&self->_bottomLabelOutlineFont, 0);
  objc_storeStrong((id *)&self->_topLabelOutlineFont, 0);
  objc_storeStrong((id *)&self->_bottomLabelFont, 0);
  objc_storeStrong((id *)&self->_topLabelFont, 0);
  objc_storeStrong((id *)&self->_shadowImage, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_timeLabelsContainerView, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end