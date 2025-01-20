@interface HUWaveformView
- (HUWaveformView)initWithFrame:(CGRect)a3 waveformColor:(id)a4 backgroundColor:(id)a5;
- (NSArray)powerLevels;
- (NSMutableArray)audioPowerLevels;
- (NSMutableArray)waveformSlices;
- (SUICFlamesView)flamesView;
- (UIColor)backgroundColor;
- (UIColor)waveformColor;
- (UILabel)timeLabel;
- (double)minTimeLabelWidth;
- (float)audioLevelForFlamesView:(id)a3;
- (void)appendPowerLevel:(double)a3;
- (void)clearPowerLevels;
- (void)layoutSubviews;
- (void)setAudioPowerLevels:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setFlamesView:(id)a3;
- (void)setMinTimeLabelWidth:(double)a3;
- (void)setTimeLabel:(id)a3;
- (void)setWaveformColor:(id)a3;
- (void)setWaveformSlices:(id)a3;
@end

@implementation HUWaveformView

- (HUWaveformView)initWithFrame:(CGRect)a3 waveformColor:(id)a4 backgroundColor:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  id v13 = a5;
  v24.receiver = self;
  v24.super_class = (Class)HUWaveformView;
  v14 = -[HUWaveformView initWithFrame:](&v24, sel_initWithFrame_, x, y, width, height);
  if (v14)
  {
    uint64_t v15 = objc_opt_new();
    waveformSlices = v14->_waveformSlices;
    v14->_waveformSlices = (NSMutableArray *)v15;

    objc_storeStrong((id *)&v14->_waveformColor, a4);
    objc_storeStrong((id *)&v14->_backgroundColor, a5);
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2050000000;
    v17 = (void *)_MergedGlobals_1_0;
    uint64_t v29 = _MergedGlobals_1_0;
    if (!_MergedGlobals_1_0)
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __getSUICFlamesViewClass_block_invoke;
      v25[3] = &unk_1E63852F0;
      v25[4] = &v26;
      __getSUICFlamesViewClass_block_invoke((uint64_t)v25);
      v17 = (void *)v27[3];
    }
    v18 = v17;
    _Block_object_dispose(&v26, 8);
    id v19 = [v18 alloc];
    v20 = [MEMORY[0x1E4F42D90] mainScreen];
    uint64_t v21 = objc_msgSend(v19, "initWithFrame:screen:fidelity:", v20, 2, x, y, width, height);
    flamesView = v14->_flamesView;
    v14->_flamesView = (SUICFlamesView *)v21;

    [(SUICFlamesView *)v14->_flamesView setDelegate:v14];
    [(SUICFlamesView *)v14->_flamesView setMode:1];
    [(SUICFlamesView *)v14->_flamesView setState:1];
    [(SUICFlamesView *)v14->_flamesView setDictationColor:v12];
    [(HUWaveformView *)v14 addSubview:v14->_flamesView];
  }

  return v14;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)HUWaveformView;
  [(HUWaveformView *)&v6 layoutSubviews];
  v3 = [(HUWaveformView *)self layer];
  [v3 setOpaque:1];

  v4 = [(HUWaveformView *)self flamesView];
  [(HUWaveformView *)self bounds];
  objc_msgSend(v4, "setFrame:");

  v5 = [(HUWaveformView *)self flamesView];
  [v5 setNeedsLayout];
}

- (void)setWaveformColor:(id)a3
{
  objc_storeStrong((id *)&self->_waveformColor, a3);
  id v5 = a3;
  [(SUICFlamesView *)self->_flamesView setDictationColor:v5];
}

- (void)appendPowerLevel:(double)a3
{
  id v6 = [(HUWaveformView *)self audioPowerLevels];
  if (!v6)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    -[HUWaveformView setAudioPowerLevels:](self, "setAudioPowerLevels:");
  }
  id v5 = [NSNumber numberWithDouble:a3];
  [v6 addObject:v5];
}

- (void)clearPowerLevels
{
  [(HUWaveformView *)self setAudioPowerLevels:0];
  v3 = [(HUWaveformView *)self waveformSlices];
  [v3 removeAllObjects];

  [(HUWaveformView *)self setNeedsLayout];
}

- (NSArray)powerLevels
{
  v2 = [(HUWaveformView *)self audioPowerLevels];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (float)audioLevelForFlamesView:(id)a3
{
  v3 = [(HUWaveformView *)self audioPowerLevels];
  v4 = [v3 lastObject];
  [v4 floatValue];
  float v6 = v5;

  return v6;
}

- (UIColor)waveformColor
{
  return self->_waveformColor;
}

- (NSMutableArray)audioPowerLevels
{
  return self->_audioPowerLevels;
}

- (void)setAudioPowerLevels:(id)a3
{
}

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
}

- (double)minTimeLabelWidth
{
  return self->_minTimeLabelWidth;
}

- (void)setMinTimeLabelWidth:(double)a3
{
  self->_minTimeLabelWidth = a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (NSMutableArray)waveformSlices
{
  return self->_waveformSlices;
}

- (void)setWaveformSlices:(id)a3
{
}

- (SUICFlamesView)flamesView
{
  return self->_flamesView;
}

- (void)setFlamesView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flamesView, 0);
  objc_storeStrong((id *)&self->_waveformSlices, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_audioPowerLevels, 0);

  objc_storeStrong((id *)&self->_waveformColor, 0);
}

@end