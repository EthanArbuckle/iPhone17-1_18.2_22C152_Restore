@interface NTKPoodleDateComplicationView
- (CGRect)contentFrame;
- (CGRect)padContentFrame:(CGRect)a3;
- (NTKPoodleDateComplicationView)initWithBackgroundView:(id)a3;
- (unint64_t)desiredDateComplicationDateStyle;
- (void)_updateLabel;
- (void)applyPalette:(id)a3;
- (void)applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5;
- (void)layoutSubviews;
- (void)setDateComplicationText:(id)a3 withDayRange:(_NSRange)a4 forDateStyle:(unint64_t)a5;
@end

@implementation NTKPoodleDateComplicationView

- (NTKPoodleDateComplicationView)initWithBackgroundView:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)NTKPoodleDateComplicationView;
  v3 = [(NTKZeusComplicationView *)&v13 initWithBackgroundView:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(NTKZeusComplicationView *)v3 device];
    sub_1BE50(v5);
    double v7 = v6;

    uint64_t v8 = objc_opt_new();
    label = v4->_label;
    v4->_label = (UILabel *)v8;

    v10 = +[NTKZeusFontLoader clipperFontDescriptor];
    v11 = +[UIFont fontWithDescriptor:v10 size:v7];
    [(UILabel *)v4->_label setFont:v11];
    [(UILabel *)v4->_label setTextAlignment:1];
    [(NTKPoodleDateComplicationView *)v4 addSubview:v4->_label];
  }
  return v4;
}

- (CGRect)padContentFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = [(NTKZeusComplicationView *)self device];
  CGFloat v8 = -sub_1BE50(v7);
  CGFloat v10 = -v9;
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGRect v20 = CGRectInset(v19, v8, v10);
  CGFloat v11 = v20.origin.x;
  CGFloat v12 = v20.origin.y;
  CGFloat v13 = v20.size.width;
  CGFloat v14 = v20.size.height;

  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (void)setDateComplicationText:(id)a3 withDayRange:(_NSRange)a4 forDateStyle:(unint64_t)a5
{
  int v6 = [a3 intValue];
  if (v6 != self->_currentDayNumber)
  {
    self->_currentDayNumber = v6;
    [(NTKPoodleDateComplicationView *)self _updateLabel];
  }
}

- (unint64_t)desiredDateComplicationDateStyle
{
  return 4;
}

- (void)_updateLabel
{
  label = self->_label;
  v4 = +[NSString stringWithFormat:@"%d", self->_currentDayNumber];
  [(UILabel *)label setText:v4];

  v5 = self->_label;
  int v6 = [(NTKZeusComplicationView *)self palette];
  double v7 = [v6 bottomComplication];
  [(UILabel *)v5 setTextColor:v7];

  [(NTKPoodleDateComplicationView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v3 = [(NTKZeusComplicationView *)self device];
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  [(NTKPoodleDateComplicationView *)self bounds];
  label = self->_label;
  CLKRectCenteredXInRectForDevice();
  -[UILabel setFrame:](label, "setFrame:");
  [(NTKPoodleDateComplicationView *)self contentFrame];
  double v6 = v5;
  double v7 = self->_label;
  CGFloat v8 = [(UILabel *)v7 font];
  [v8 capHeight];
  [(UILabel *)v7 _setFirstLineBaselineFrameOriginY:v6 + v9];

  v10.receiver = self;
  v10.super_class = (Class)NTKPoodleDateComplicationView;
  [(NTKZeusComplicationView *)&v10 layoutSubviews];
}

- (CGRect)contentFrame
{
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  v3 = [(UILabel *)self->_label font];
  [v3 capHeight];

  [(NTKPoodleDateComplicationView *)self bounds];
  v4 = [(NTKZeusComplicationView *)self device];
  CLKRectCenteredIntegralRectForDevice();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (void)applyPalette:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKPoodleDateComplicationView;
  [(NTKZeusComplicationView *)&v4 applyPalette:a3];
  [(NTKPoodleDateComplicationView *)self _updateLabel];
}

- (void)applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5
{
  v14.receiver = self;
  v14.super_class = (Class)NTKPoodleDateComplicationView;
  id v8 = a5;
  id v9 = a4;
  [(NTKZeusComplicationView *)&v14 applyTransitionFraction:v9 fromPalette:v8 toPalette:a3];
  label = self->_label;
  double v11 = objc_msgSend(v9, "bottomComplication", v14.receiver, v14.super_class);

  double v12 = [v8 bottomComplication];

  double v13 = NTKInterpolateBetweenColors();
  [(UILabel *)label setTextColor:v13];
}

- (void).cxx_destruct
{
}

@end