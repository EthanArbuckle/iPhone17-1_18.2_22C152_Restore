@interface NTKZeusWorldClockComplicationView
- (CGRect)contentFrame;
- (CGRect)padContentFrame:(CGRect)a3;
- (NTKZeusWorldClockComplicationView)initWithBackgroundView:(id)a3;
- (void)_updateLabels;
- (void)applyPalette:(id)a3;
- (void)applyTransitionFraction:(double)a3 fromMode:(int64_t)a4 toMode:(int64_t)a5;
- (void)applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5;
- (void)blancEditModeApplyPalette:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setOverrideDate:(id)a3;
- (void)setShortCity:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)timeFormatterTextDidChange:(id)a3;
@end

@implementation NTKZeusWorldClockComplicationView

- (NTKZeusWorldClockComplicationView)initWithBackgroundView:(id)a3
{
  v4 = (NTKZeusComplicationBackgroundView *)a3;
  if (!v4)
  {
    v5 = [NTKZeusComplicationBackgroundView alloc];
    v6 = +[NTKFaceViewRenderingContext sharedRenderingContext];
    v7 = [v6 device];
    v4 = [(NTKZeusComplicationBackgroundView *)v5 initWithDevice:v7];
  }
  v24.receiver = self;
  v24.super_class = (Class)NTKZeusWorldClockComplicationView;
  v8 = [(NTKZeusComplicationView *)&v24 initWithBackgroundView:v4];
  if (v8)
  {
    uint64_t v9 = objc_opt_new();
    timeLabel = v8->_timeLabel;
    v8->_timeLabel = (UILabel *)v9;

    v11 = v8->_timeLabel;
    v12 = [(NTKZeusComplicationView *)v8 device];
    sub_9058(v12, v22);
    v13 = +[CLKFont systemFontOfSize:v23 weight:UIFontWeightMedium];
    [(UILabel *)v11 setFont:v13];

    [(UILabel *)v8->_timeLabel setTextAlignment:1];
    [(NTKZeusWorldClockComplicationView *)v8 addSubview:v8->_timeLabel];
    uint64_t v14 = objc_opt_new();
    cityLabel = v8->_cityLabel;
    v8->_cityLabel = (UILabel *)v14;

    v16 = v8->_cityLabel;
    v17 = [(UILabel *)v8->_timeLabel font];
    [(UILabel *)v16 setFont:v17];

    v18 = v8->_cityLabel;
    [(UILabel *)v8->_timeLabel alpha];
    -[UILabel setAlpha:](v18, "setAlpha:");
    [(UILabel *)v8->_cityLabel setTextAlignment:1];
    [(NTKZeusWorldClockComplicationView *)v8 addSubview:v8->_cityLabel];
    [(NTKZeusWorldClockComplicationView *)v8 _updateLabels];
    uint64_t v19 = objc_opt_new();
    formatter = v8->_formatter;
    v8->_formatter = (CLKTimeFormatter *)v19;

    [(CLKTimeFormatter *)v8->_formatter addObserver:v8];
  }

  return v8;
}

- (void)dealloc
{
  [(CLKTimeFormatter *)self->_formatter removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)NTKZeusWorldClockComplicationView;
  [(NTKZeusWorldClockComplicationView *)&v3 dealloc];
}

- (void)layoutSubviews
{
  objc_super v3 = [(NTKZeusComplicationView *)self device];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  memset(v18, 0, sizeof(v18));
  sub_9058(v3, v18);
  double height = CGSizeZero.height;
  -[UILabel sizeThatFits:](self->_timeLabel, "sizeThatFits:", CGSizeZero.width, height);
  -[UILabel sizeThatFits:](self->_cityLabel, "sizeThatFits:", CGSizeZero.width, height);
  [(NTKZeusWorldClockComplicationView *)self bounds];
  timeLabel = self->_timeLabel;
  CLKRectCenteredXInRectForDevice();
  -[UILabel setFrame:](timeLabel, "setFrame:");
  cityLabel = self->_cityLabel;
  CLKRectCenteredXInRectForDevice();
  -[UILabel setFrame:](cityLabel, "setFrame:");
  [(NTKZeusWorldClockComplicationView *)self contentFrame];
  double v8 = v7;
  uint64_t v9 = self->_timeLabel;
  v10 = [(UILabel *)v9 font];
  [v10 capHeight];
  [(UILabel *)v9 _setFirstLineBaselineFrameOriginY:v8 + v11];

  v12 = self->_cityLabel;
  [(UILabel *)self->_timeLabel _firstLineBaselineFrameOriginY];
  double v14 = v13 + *(double *)&v19;
  v15 = [(UILabel *)self->_cityLabel font];
  [v15 capHeight];
  [(UILabel *)v12 _setFirstLineBaselineFrameOriginY:v14 + v16];

  v17.receiver = self;
  v17.super_class = (Class)NTKZeusWorldClockComplicationView;
  [(NTKZeusComplicationView *)&v17 layoutSubviews];
}

- (CGRect)contentFrame
{
  double height = CGSizeZero.height;
  -[UILabel sizeThatFits:](self->_timeLabel, "sizeThatFits:", CGSizeZero.width, height);
  -[UILabel sizeThatFits:](self->_cityLabel, "sizeThatFits:", CGSizeZero.width, height);
  v4 = [(UILabel *)self->_timeLabel font];
  [v4 capHeight];
  v5 = [(NTKZeusComplicationView *)self device];
  sub_9058(v5, &v19);

  [(NTKZeusWorldClockComplicationView *)self bounds];
  v6 = [(NTKZeusComplicationView *)self device];
  CLKRectCenteredIntegralRectForDevice();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.double height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)padContentFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v7 = [(NTKZeusComplicationView *)self device];
  sub_9058(v7, &v14);

  double v8 = -*(double *)&v15;
  double v9 = -(*((double *)&v15 + 1) + *((double *)&v16 + 1));
  CGFloat v10 = x;
  CGFloat v11 = y;
  CGFloat v12 = width;
  CGFloat v13 = height;

  return CGRectInset(*(CGRect *)&v10, v8, v9);
}

- (void)setTimeZone:(id)a3
{
}

- (void)setOverrideDate:(id)a3
{
}

- (void)setShortCity:(id)a3
{
  [(UILabel *)self->_cityLabel setText:a3];

  [(NTKZeusWorldClockComplicationView *)self setNeedsLayout];
}

- (void)timeFormatterTextDidChange:(id)a3
{
  timeLabel = self->_timeLabel;
  v5 = [a3 timeText];
  [(UILabel *)timeLabel setText:v5];

  [(NTKZeusWorldClockComplicationView *)self setNeedsLayout];
}

- (void)_updateLabels
{
  timeLabel = self->_timeLabel;
  v4 = [(NTKZeusComplicationView *)self palette];
  v5 = [v4 bottomComplication];
  [(UILabel *)timeLabel setTextColor:v5];

  cityLabel = self->_cityLabel;
  id v8 = [(NTKZeusComplicationView *)self palette];
  double v7 = [v8 bottomComplication];
  [(UILabel *)cityLabel setTextColor:v7];
}

- (void)applyPalette:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKZeusWorldClockComplicationView;
  [(NTKZeusComplicationView *)&v4 applyPalette:a3];
  [(NTKZeusWorldClockComplicationView *)self _updateLabels];
}

- (void)blancEditModeApplyPalette:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NTKZeusWorldClockComplicationView;
  [(NTKZeusComplicationView *)&v10 blancEditModeApplyPalette:a3];
  timeLabel = self->_timeLabel;
  v5 = [(NTKZeusComplicationView *)self palette];
  v6 = [v5 editMode];
  [(UILabel *)timeLabel setTextColor:v6];

  cityLabel = self->_cityLabel;
  id v8 = [(NTKZeusComplicationView *)self palette];
  double v9 = [v8 editMode];
  [(UILabel *)cityLabel setTextColor:v9];
}

- (void)applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)NTKZeusWorldClockComplicationView;
  id v8 = a5;
  id v9 = a4;
  [(NTKZeusComplicationView *)&v13 applyTransitionFraction:v9 fromPalette:v8 toPalette:a3];
  objc_super v10 = objc_msgSend(v9, "bottomComplication", v13.receiver, v13.super_class);

  CGFloat v11 = [v8 bottomComplication];

  CGFloat v12 = NTKInterpolateBetweenColors();

  [(UILabel *)self->_timeLabel setTextColor:v12];
  [(UILabel *)self->_cityLabel setTextColor:v12];
}

- (void)applyTransitionFraction:(double)a3 fromMode:(int64_t)a4 toMode:(int64_t)a5
{
  v13.receiver = self;
  v13.super_class = (Class)NTKZeusWorldClockComplicationView;
  -[NTKZeusComplicationView applyTransitionFraction:fromMode:toMode:](&v13, "applyTransitionFraction:fromMode:toMode:");
  v12.receiver = self;
  v12.super_class = (Class)NTKZeusWorldClockComplicationView;
  id v8 = [(NTKZeusComplicationView *)&v12 complicationColorForBlancEditMode:a4];
  v11.receiver = self;
  v11.super_class = (Class)NTKZeusWorldClockComplicationView;
  id v9 = [(NTKZeusComplicationView *)&v11 complicationColorForBlancEditMode:a5];
  objc_super v10 = NTKInterpolateBetweenColors();

  [(UILabel *)self->_timeLabel setTextColor:v10];
  [(UILabel *)self->_cityLabel setTextColor:v10];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_cityLabel, 0);

  objc_storeStrong((id *)&self->_timeLabel, 0);
}

@end