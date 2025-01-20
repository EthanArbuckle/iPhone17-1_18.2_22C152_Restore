@interface CLKUIDigitalClockView
- (CLKUIDigitalClockView)initWithDevice:(id)a3 clockTimer:(id)a4;
- (NSArray)fontScaleFactorForNumberSystemOverridesWithTicks;
- (NSArray)fontScaleFactorForNumberSystemOverridesWithoutTicks;
- (id)_fontForConfiguration:(id)a3;
- (void)layoutSubviews;
- (void)setAodTransform:(CGAffineTransform *)a3;
- (void)setConfiguration:(id)a3;
- (void)setFontScaleFactorForNumberSystemOverridesWithTicks:(id)a3;
- (void)setFontScaleFactorForNumberSystemOverridesWithoutTicks:(id)a3;
- (void)setOverrideDate:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
@end

@implementation CLKUIDigitalClockView

- (CLKUIDigitalClockView)initWithDevice:(id)a3 clockTimer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CLKUIDigitalClockView;
  v8 = [(CLKUITimeView *)&v14 initWithDevice:v6 clockTimer:v7];
  if (v8)
  {
    v9 = [[CLKUITimeLabel alloc] initWithTimeLabelOptions:1 forDevice:v6 clockTimer:v7];
    timeLabel = v8->_timeLabel;
    v8->_timeLabel = v9;

    v11 = [[CLKUITimeLabel alloc] initWithTimeLabelOptions:1 forDevice:v6 clockTimer:v7];
    inactiveTimeLabel = v8->_inactiveTimeLabel;
    v8->_inactiveTimeLabel = v11;

    [(CLKUITimeLabel *)v8->_inactiveTimeLabel setAlpha:0.0];
    [(CLKUIDigitalClockView *)v8 addSubview:v8->_timeLabel];
    [(CLKUIDigitalClockView *)v8 addSubview:v8->_inactiveTimeLabel];
  }

  return v8;
}

- (void)layoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)CLKUIDigitalClockView;
  [(CLKUIDigitalClockView *)&v29 layoutSubviews];
  MEMORY[0x1D94315A0]([(CLKUIDigitalClockView *)self bounds]);
  double v4 = v3;
  -[CLKUITimeLabel setCenter:](self->_timeLabel, "setCenter:");
  [(CLKUITimeLabel *)self->_timeLabel frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(CLKUITimeLabel *)self->_timeLabel _lastLineBaseline];
  double v12 = v4 - v11;
  [(CLKUITimeLabel *)self->_timeLabel _lastLineBaseline];
  double v14 = v13;
  [(CLKUITimeLabel *)self->_timeLabel _capOffsetFromBoundsTop];
  double v16 = v12 + (v14 - v15) * 0.5;
  -[CLKUITimeLabel setFrame:](self->_timeLabel, "setFrame:", v6, v16, v8, v10);
  -[CLKUITimeLabel setFrame:](self->_inactiveTimeLabel, "setFrame:", v6, v16, v8, v10);
  if (self->_ticksView)
  {
    [(CLKUIDigitalClockView *)self bounds];
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    [(CLKUITimeView *)self dialInset];
    CGFloat v26 = v25;
    [(CLKUITimeView *)self dialInset];
    CGFloat v28 = v27;
    v30.origin.x = v18;
    v30.origin.y = v20;
    v30.size.width = v22;
    v30.size.height = v24;
    CGRect v31 = CGRectInset(v30, v26, v28);
    -[CLKUIDualTimeDigitalTicksView setFrame:](self->_ticksView, "setFrame:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
  }
}

- (void)setConfiguration:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CLKUIDigitalClockView;
  [(CLKUITimeView *)&v33 setConfiguration:v4];
  double v5 = [(CLKUITimeView *)self device];
  _LayoutConstants_0(v5);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;

  ticksView = self->_ticksView;
  if (ticksView)
  {
    [(CLKUIDualTimeDigitalTicksView *)ticksView setFrozen:0];
    [(CLKUIDualTimeDigitalTicksView *)self->_ticksView startAnimation];
    [(CLKUIDualTimeDigitalTicksView *)self->_ticksView setHidden:0];
  }
  else
  {
    double v13 = [CLKUIDualTimeDigitalTicksView alloc];
    double v14 = [(CLKUITimeView *)self clockTimer];
    v32[0] = v7;
    v32[1] = v9;
    v32[2] = v7;
    v32[3] = v9;
    v32[4] = v11;
    v32[5] = v11;
    double v15 = [(CLKUIDualTimeDigitalTicksView *)v13 initWithConfiguration:v32 timer:v14];
    double v16 = self->_ticksView;
    self->_ticksView = v15;

    [(CLKUIDualTimeDigitalTicksView *)self->_ticksView startAnimation];
    [(CLKUIDigitalClockView *)self addSubview:self->_ticksView];
  }
  double v17 = [v4 activeTickColor];
  CGFloat v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    id v19 = [(CLKUITimeView *)self timeColor];
  }
  CGFloat v20 = v19;

  [(CLKUIDualTimeDigitalTicksView *)self->_ticksView setActiveTickColor:v20];
  double v21 = [v20 colorWithAlphaComponent:0.5];
  [(CLKUIDualTimeDigitalTicksView *)self->_ticksView setInactiveTickColor:v21];

  [(CLKUIDualTimeDigitalTicksView *)self->_ticksView refreshTicks];
  uint64_t v22 = [v4 forcedNumberSystem];
  double v23 = (void *)v22;
  CGFloat v24 = &unk_1F2A6A500;
  if (v22) {
    CGFloat v24 = (void *)v22;
  }
  id v25 = v24;

  uint64_t v26 = [v25 unsignedIntegerValue];
  [(CLKUITimeLabel *)self->_timeLabel setForcedNumberSystem:v26];
  [(CLKUITimeLabel *)self->_inactiveTimeLabel setForcedNumberSystem:v26];
  double v27 = [(CLKUIDigitalClockView *)self _fontForConfiguration:v4];
  [(CLKUITimeLabel *)self->_timeLabel setFont:v27];
  [(CLKUITimeLabel *)self->_inactiveTimeLabel setFont:v27];
  CGFloat v28 = [v4 timeLabelColor];
  if (v28)
  {
    [(CLKUITimeLabel *)self->_timeLabel setTextColor:v28];
  }
  else
  {
    objc_super v29 = [(CLKUITimeView *)self timeColor];
    [(CLKUITimeLabel *)self->_timeLabel setTextColor:v29];
  }
  CGRect v30 = [v4 timeLabelColor];
  if (v30)
  {
    [(CLKUITimeLabel *)self->_inactiveTimeLabel setTextColor:v30];
  }
  else
  {
    CGRect v31 = [MEMORY[0x1E4FB1618] whiteColor];
    [(CLKUITimeLabel *)self->_inactiveTimeLabel setTextColor:v31];
  }
}

- (id)_fontForConfiguration:(id)a3
{
  id v4 = a3;
  double v5 = [(CLKUITimeView *)self device];
  double v6 = _LayoutConstants_0(v5);

  uint64_t v7 = [v4 forcedNumberSystem];

  if (v7)
  {
    uint64_t v8 = [v4 forcedNumberSystem];
    unint64_t v9 = [v8 unsignedIntegerValue];

    if (v9 != -1)
    {
      uint64_t v10 = [(CLKUIDigitalClockView *)self fontScaleFactorForNumberSystemOverridesWithTicks];
      unint64_t v11 = [v10 count];

      if (v9 < v11)
      {
        double v12 = [(CLKUIDigitalClockView *)self fontScaleFactorForNumberSystemOverridesWithTicks];
        double v13 = [v12 objectAtIndexedSubscript:v9];
        [v13 doubleValue];

        double v14 = [(CLKUITimeView *)self device];
        CLKRoundForDevice();
        double v6 = v15;
      }
    }
  }
  double v16 = [v4 timeLabelFont];
  double v17 = [v16 fontWithSize:v6];

  if (!v17)
  {
    double v17 = [MEMORY[0x1E4F19A50] systemFontOfSize:*MEMORY[0x1E4F24630] weight:v6 design:*MEMORY[0x1E4FB29C0]];
  }

  return v17;
}

- (void)setState:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLKUIDigitalClockView;
  -[CLKUITimeView setState:](&v7, sel_setState_);
  if (a3 == 1)
  {
    [(CLKUITimeLabel *)self->_timeLabel setPaused:1];
    [(CLKUITimeLabel *)self->_inactiveTimeLabel setPaused:1];
    ticksView = self->_ticksView;
    if (ticksView)
    {
      [(CLKUIDualTimeDigitalTicksView *)ticksView setFrozen:1];
      [(CLKUIDualTimeDigitalTicksView *)self->_ticksView stopAnimation];
    }
  }
  else if (!a3)
  {
    [(CLKUITimeLabel *)self->_timeLabel setPaused:0];
    [(CLKUITimeLabel *)self->_inactiveTimeLabel setPaused:0];
    double v5 = self->_ticksView;
    if (v5)
    {
      [(CLKUIDualTimeDigitalTicksView *)v5 setFrozen:0];
      [(CLKUIDualTimeDigitalTicksView *)self->_ticksView startAnimation];
    }
  }
}

- (void)setOverrideDate:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLKUIDigitalClockView;
  id v4 = a3;
  [(CLKUITimeView *)&v7 setOverrideDate:v4];
  double v5 = [(CLKUITimeLabel *)self->_timeLabel timeFormatter];
  [v5 setOverrideDate:v4];

  double v6 = [(CLKUITimeLabel *)self->_inactiveTimeLabel timeFormatter];
  [v6 setOverrideDate:v4];
}

- (void)setAodTransform:(CGAffineTransform *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CLKUIDigitalClockView;
  long long v5 = *(_OWORD *)&a3->c;
  v8[0] = *(_OWORD *)&a3->a;
  v8[1] = v5;
  v8[2] = *(_OWORD *)&a3->tx;
  [(CLKUITimeView *)&v9 setAodTransform:v8];
  long long v6 = *(_OWORD *)&a3->c;
  v7[0] = *(_OWORD *)&a3->a;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a3->tx;
  [(CLKUIDigitalClockView *)self setTransform:v7];
}

- (NSArray)fontScaleFactorForNumberSystemOverridesWithTicks
{
  fontScaleFactorForNumberSystemOverridesWithTicks = self->_fontScaleFactorForNumberSystemOverridesWithTicks;
  if (!fontScaleFactorForNumberSystemOverridesWithTicks)
  {
    self->_fontScaleFactorForNumberSystemOverridesWithTicks = (NSArray *)&unk_1F2A6AA70;

    fontScaleFactorForNumberSystemOverridesWithTicks = self->_fontScaleFactorForNumberSystemOverridesWithTicks;
  }
  return fontScaleFactorForNumberSystemOverridesWithTicks;
}

- (NSArray)fontScaleFactorForNumberSystemOverridesWithoutTicks
{
  fontScaleFactorForNumberSystemOverridesWithoutTicks = self->_fontScaleFactorForNumberSystemOverridesWithoutTicks;
  if (!fontScaleFactorForNumberSystemOverridesWithoutTicks)
  {
    self->_fontScaleFactorForNumberSystemOverridesWithoutTicks = (NSArray *)&unk_1F2A6AA88;

    fontScaleFactorForNumberSystemOverridesWithoutTicks = self->_fontScaleFactorForNumberSystemOverridesWithoutTicks;
  }
  return fontScaleFactorForNumberSystemOverridesWithoutTicks;
}

- (void)traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5 = a4;
  long long v6 = [(CLKUIDigitalClockView *)self traitCollection];
  uint64_t v7 = [v6 activeAppearance];
  uint64_t v8 = [v5 activeAppearance];

  if (v7 != v8)
  {
    objc_super v9 = [(CLKUIDigitalClockView *)self traitCollection];
    double v10 = [v9 activeAppearance] ? 1.0 : 0.0;

    [(CLKUITimeLabel *)self->_timeLabel setAlpha:v10];
    [(CLKUITimeLabel *)self->_inactiveTimeLabel setAlpha:1.0 - v10];
    ticksView = self->_ticksView;
    if (ticksView)
    {
      [(CLKUIDualTimeDigitalTicksView *)ticksView setAlpha:v10];
    }
  }
}

- (void)setFontScaleFactorForNumberSystemOverridesWithTicks:(id)a3
{
}

- (void)setFontScaleFactorForNumberSystemOverridesWithoutTicks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontScaleFactorForNumberSystemOverridesWithoutTicks, 0);
  objc_storeStrong((id *)&self->_fontScaleFactorForNumberSystemOverridesWithTicks, 0);
  objc_storeStrong((id *)&self->_ticksView, 0);
  objc_storeStrong((id *)&self->_inactiveTimeLabel, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
}

@end