@interface FIUICompetitionLearnMoreExampleView
- (CGSize)sizeThatFits:(CGSize)a3;
- (FIUICompetitionLearnMoreExampleView)init;
- (NSString)totalPointsLabelText;
- (UIColor)separatorViewColor;
- (UIColor)totalPointsLabelColor;
- (id)_ringPercentageLabelForPercentage:(double)a3 withMetricColors:(id)a4;
- (id)_ringViewOfType:(int64_t)a3 withMetricColors:(id)a4 percentage:(double)a5;
- (void)layoutForWidth:(double)a3;
- (void)layoutSubviews;
- (void)setSeparatorViewColor:(id)a3;
- (void)setTotalPointsLabelColor:(id)a3;
- (void)setTotalPointsLabelText:(id)a3;
@end

@implementation FIUICompetitionLearnMoreExampleView

- (FIUICompetitionLearnMoreExampleView)init
{
  v29.receiver = self;
  v29.super_class = (Class)FIUICompetitionLearnMoreExampleView;
  double v2 = *MEMORY[0x263F001A8];
  double v3 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v4 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 24);
  v6 = -[FIUICompetitionLearnMoreExampleView initWithFrame:](&v29, sel_initWithFrame_, *MEMORY[0x263F001A8], v3, v4, v5);
  if (v6)
  {
    v7 = [MEMORY[0x263F23950] energyColors];
    v8 = [MEMORY[0x263F23950] briskColors];
    v9 = [MEMORY[0x263F23950] sedentaryColors];
    uint64_t v10 = [(FIUICompetitionLearnMoreExampleView *)v6 _ringViewOfType:2 withMetricColors:v7 percentage:1.25];
    moveRingView = v6->_moveRingView;
    v6->_moveRingView = (UIImageView *)v10;

    uint64_t v12 = [(FIUICompetitionLearnMoreExampleView *)v6 _ringViewOfType:1 withMetricColors:v8 percentage:0.5];
    exerciseRingView = v6->_exerciseRingView;
    v6->_exerciseRingView = (UIImageView *)v12;

    uint64_t v14 = [(FIUICompetitionLearnMoreExampleView *)v6 _ringViewOfType:0 withMetricColors:v9 percentage:0.25];
    standRingView = v6->_standRingView;
    v6->_standRingView = (UIImageView *)v14;

    [(FIUICompetitionLearnMoreExampleView *)v6 addSubview:v6->_moveRingView];
    [(FIUICompetitionLearnMoreExampleView *)v6 addSubview:v6->_exerciseRingView];
    [(FIUICompetitionLearnMoreExampleView *)v6 addSubview:v6->_standRingView];
    uint64_t v16 = [(FIUICompetitionLearnMoreExampleView *)v6 _ringPercentageLabelForPercentage:v7 withMetricColors:1.25];
    movePercentLabel = v6->_movePercentLabel;
    v6->_movePercentLabel = (UILabel *)v16;

    uint64_t v18 = [(FIUICompetitionLearnMoreExampleView *)v6 _ringPercentageLabelForPercentage:v8 withMetricColors:0.5];
    exercisePercentLabel = v6->_exercisePercentLabel;
    v6->_exercisePercentLabel = (UILabel *)v18;

    uint64_t v20 = [(FIUICompetitionLearnMoreExampleView *)v6 _ringPercentageLabelForPercentage:v9 withMetricColors:0.25];
    standPercentLabel = v6->_standPercentLabel;
    v6->_standPercentLabel = (UILabel *)v20;

    [(FIUICompetitionLearnMoreExampleView *)v6 addSubview:v6->_movePercentLabel];
    [(FIUICompetitionLearnMoreExampleView *)v6 addSubview:v6->_exercisePercentLabel];
    [(FIUICompetitionLearnMoreExampleView *)v6 addSubview:v6->_standPercentLabel];
    uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v2, v3, v4, v5);
    separatorView = v6->_separatorView;
    v6->_separatorView = (UIView *)v22;

    v24 = [(UIView *)v6->_separatorView layer];
    [v24 setCornerRadius:0.5];

    [(FIUICompetitionLearnMoreExampleView *)v6 addSubview:v6->_separatorView];
    uint64_t v25 = objc_opt_new();
    totalPointsLabel = v6->_totalPointsLabel;
    v6->_totalPointsLabel = (UILabel *)v25;

    v27 = [MEMORY[0x263F81708] systemFontOfSize:16.0];
    [(UILabel *)v6->_totalPointsLabel setFont:v27];

    [(UILabel *)v6->_totalPointsLabel setTextAlignment:1];
    [(FIUICompetitionLearnMoreExampleView *)v6 addSubview:v6->_totalPointsLabel];
  }
  return v6;
}

- (id)_ringViewOfType:(int64_t)a3 withMetricColors:(id)a4 percentage:(double)a5
{
  v7 = (void *)MEMORY[0x263F23980];
  id v8 = a4;
  v9 = [v7 ringsViewConfiguredForOneRingOnWatchOfType:a3 withIcon:0];
  uint64_t v10 = (void *)MEMORY[0x263F23978];
  v11 = [v8 gradientDarkColor];
  uint64_t v12 = [v8 gradientLightColor];

  v13 = [v10 renderSingleRingUsingRingsView:v9 forPercentage:v11 withDiameter:v12 thickness:a5 topColor:49.0 bottomColor:7.0];

  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v13];
  return v14;
}

- (id)_ringPercentageLabelForPercentage:(double)a3 withMetricColors:(id)a4
{
  double v5 = (objc_class *)MEMORY[0x263F08A30];
  id v6 = a4;
  id v7 = objc_alloc_init(v5);
  [v7 setNumberStyle:3];
  id v8 = objc_opt_new();
  v9 = [NSNumber numberWithDouble:a3];
  uint64_t v10 = [v7 stringFromNumber:v9];
  [v8 setText:v10];

  v11 = [MEMORY[0x263F81708] systemFontOfSize:11.0 weight:*MEMORY[0x263F81828]];
  [v8 setFont:v11];

  uint64_t v12 = [v6 gradientDarkColor];

  [v8 setTextColor:v12];
  [v8 setTextAlignment:1];

  return v8;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)FIUICompetitionLearnMoreExampleView;
  [(FIUICompetitionLearnMoreExampleView *)&v4 layoutSubviews];
  [(FIUICompetitionLearnMoreExampleView *)self bounds];
  [(FIUICompetitionLearnMoreExampleView *)self layoutForWidth:v3];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[FIUICompetitionLearnMoreExampleView layoutForWidth:](self, "layoutForWidth:", a3.width, a3.height);
  [(UIImageView *)self->_standRingView frame];
  CGFloat v4 = CGRectGetMaxX(v9) + 1.0;
  [(UILabel *)self->_totalPointsLabel _lastLineBaselineFrameOriginY];
  double v6 = v5 + 16.5;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)layoutForWidth:(double)a3
{
  previousLayoutWidth = self->_previousLayoutWidth;
  if (!previousLayoutWidth
    || ([(NSNumber *)previousLayoutWidth floatValue], vabdd_f64(v6, a3) >= 0.00000011920929))
  {
    -[UIImageView setFrame:](self->_moveRingView, "setFrame:", 1.0, 20.0, 49.0, 49.0);
    [(UIImageView *)self->_moveRingView frame];
    -[UILabel setFrame:](self->_movePercentLabel, "setFrame:");
    [(UIImageView *)self->_moveRingView frame];
    -[UIImageView setFrame:](self->_exerciseRingView, "setFrame:", CGRectGetMaxX(v8) + 3.5, 20.0, 49.0, 49.0);
    [(UIImageView *)self->_exerciseRingView frame];
    -[UILabel setFrame:](self->_exercisePercentLabel, "setFrame:");
    [(UIImageView *)self->_exerciseRingView frame];
    -[UIImageView setFrame:](self->_standRingView, "setFrame:", CGRectGetMaxX(v9) + 3.5, 20.0, 49.0, 49.0);
    [(UIImageView *)self->_standRingView frame];
    -[UILabel setFrame:](self->_standPercentLabel, "setFrame:");
    [(UIImageView *)self->_standRingView frame];
    -[UIView setFrame:](self->_separatorView, "setFrame:", (a3 + -154.0) * 0.5, CGRectGetMaxY(v10) + 8.0, 154.0, 1.5);
    [(UILabel *)self->_totalPointsLabel sizeToFit];
    [(UILabel *)self->_totalPointsLabel bounds];
    -[UILabel setFrame:](self->_totalPointsLabel, "setFrame:", 0.0, 0.0, a3);
    [(UIView *)self->_separatorView frame];
    [(UILabel *)self->_totalPointsLabel _setLastLineBaselineFrameOriginY:CGRectGetMaxY(v11) + 17.0];
    self->_previousLayoutWidth = [NSNumber numberWithDouble:a3];
    MEMORY[0x270F9A758]();
  }
}

- (void)setSeparatorViewColor:(id)a3
{
}

- (void)setTotalPointsLabelText:(id)a3
{
  [(UILabel *)self->_totalPointsLabel setText:a3];
  [(FIUICompetitionLearnMoreExampleView *)self setNeedsLayout];
}

- (void)setTotalPointsLabelColor:(id)a3
{
}

- (UIColor)separatorViewColor
{
  return self->_separatorViewColor;
}

- (UIColor)totalPointsLabelColor
{
  return self->_totalPointsLabelColor;
}

- (NSString)totalPointsLabelText
{
  return self->_totalPointsLabelText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalPointsLabelText, 0);
  objc_storeStrong((id *)&self->_totalPointsLabelColor, 0);
  objc_storeStrong((id *)&self->_separatorViewColor, 0);
  objc_storeStrong((id *)&self->_previousLayoutWidth, 0);
  objc_storeStrong((id *)&self->_totalPointsLabel, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_standPercentLabel, 0);
  objc_storeStrong((id *)&self->_exercisePercentLabel, 0);
  objc_storeStrong((id *)&self->_movePercentLabel, 0);
  objc_storeStrong((id *)&self->_standRingView, 0);
  objc_storeStrong((id *)&self->_exerciseRingView, 0);
  objc_storeStrong((id *)&self->_moveRingView, 0);
}

@end