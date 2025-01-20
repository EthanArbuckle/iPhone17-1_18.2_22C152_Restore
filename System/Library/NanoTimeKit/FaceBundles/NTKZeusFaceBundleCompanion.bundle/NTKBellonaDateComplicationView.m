@interface NTKBellonaDateComplicationView
- (CGRect)contentFrame;
- (CGRect)padContentFrame:(CGRect)a3;
- (NTKBellonaDateComplicationView)initWithBackgroundView:(id)a3;
- (unint64_t)desiredDateComplicationDateStyle;
- (void)_updateLabel;
- (void)alphaBasedOnSpecificFadeInProgress:(double)a3 fadeOutProgress:(double)a4 forCurrentHour:(unint64_t)a5;
- (void)applyPalette:(id)a3;
- (void)applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5;
- (void)hourChangeAnimationFromCurrentHour:(unint64_t)a3 withFraction:(double)a4 timeChanged:(BOOL)a5;
- (void)layoutSubviews;
- (void)setDateComplicationText:(id)a3 withDayRange:(_NSRange)a4 forDateStyle:(unint64_t)a5;
- (void)tritiumOnTransitionWithFraction:(double)a3 forCurrentHour:(unint64_t)a4;
@end

@implementation NTKBellonaDateComplicationView

- (NTKBellonaDateComplicationView)initWithBackgroundView:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NTKBellonaDateComplicationView;
  v6 = [(NTKZeusComplicationView *)&v16 initWithBackgroundView:v5];
  v7 = v6;
  if (v6)
  {
    double v15 = 0.0;
    v8 = [(NTKZeusComplicationView *)v6 device];
    sub_18F98(v8, (uint64_t)&v14);

    objc_storeStrong((id *)&v7->_backgroundView, a3);
    uint64_t v9 = objc_opt_new();
    label = v7->_label;
    v7->_label = (UILabel *)v9;

    v11 = +[NTKZeusFontLoader capeCodFontDescriptor];
    v12 = +[UIFont fontWithDescriptor:v11 size:v15];
    [(UILabel *)v7->_label setFont:v12];
    [(UILabel *)v7->_label setTextAlignment:1];
    [(NTKBellonaDateComplicationView *)v7 addSubview:v7->_label];
  }
  return v7;
}

- (void)applyPalette:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKBellonaDateComplicationView;
  [(NTKZeusComplicationView *)&v4 applyPalette:a3];
  [(NTKBellonaDateComplicationView *)self _updateLabel];
}

- (void)applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5
{
}

- (void)hourChangeAnimationFromCurrentHour:(unint64_t)a3 withFraction:(double)a4 timeChanged:(BOOL)a5
{
}

- (void)tritiumOnTransitionWithFraction:(double)a3 forCurrentHour:(unint64_t)a4
{
}

- (void)alphaBasedOnSpecificFadeInProgress:(double)a3 fadeOutProgress:(double)a4 forCurrentHour:(unint64_t)a5
{
}

- (CGRect)padContentFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  v8 = [(NTKZeusComplicationView *)self device];
  LODWORD(v7) = v7->_currentDayNumber;
  uint64_t v20 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  sub_18F98(v8, (uint64_t)&v18);
  uint64_t v9 = (double *)&v18 + 1;
  if ((int)v7 < 10) {
    uint64_t v9 = (double *)&v18;
  }
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGRect v22 = CGRectInset(v21, -*v9, -*((double *)&v19 + 1));
  CGFloat v10 = v22.origin.x;
  CGFloat v11 = v22.origin.y;
  CGFloat v12 = v22.size.width;
  CGFloat v13 = v22.size.height;

  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (void)setDateComplicationText:(id)a3 withDayRange:(_NSRange)a4 forDateStyle:(unint64_t)a5
{
  int v6 = [a3 intValue];
  if (v6 != self->_currentDayNumber)
  {
    self->_currentDayNumber = v6;
    [(NTKBellonaDateComplicationView *)self _updateLabel];
  }
}

- (unint64_t)desiredDateComplicationDateStyle
{
  return 4;
}

- (void)_updateLabel
{
  label = self->_label;
  objc_super v4 = +[NSString stringWithFormat:@"%d", self->_currentDayNumber];
  [(UILabel *)label setText:v4];

  id v5 = self->_label;
  int v6 = [(NTKZeusComplicationView *)self palette];
  v7 = [v6 beige];
  [(UILabel *)v5 setTextColor:v7];

  [(NTKBellonaDateComplicationView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v3 = [(NTKZeusComplicationView *)self device];
  uint64_t v16 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  sub_18F98(v3, (uint64_t)&v14);
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  [(NTKBellonaDateComplicationView *)self bounds];
  label = self->_label;
  CLKRectCenteredXInRectForDevice();
  -[UILabel setFrame:](label, "setFrame:");
  int currentDayNumber = self->_currentDayNumber;
  if (currentDayNumber == 1 || (currentDayNumber - 10) <= 9)
  {
    [(UILabel *)self->_label frame];
    [(UILabel *)self->_label setFrame:v7 - *(double *)&v15];
  }
  [(NTKBellonaDateComplicationView *)self contentFrame];
  double v9 = v8;
  CGFloat v10 = self->_label;
  CGFloat v11 = [(UILabel *)v10 font];
  [v11 capHeight];
  [(UILabel *)v10 _setFirstLineBaselineFrameOriginY:v9 + v12];

  v13.receiver = self;
  v13.super_class = (Class)NTKBellonaDateComplicationView;
  [(NTKZeusComplicationView *)&v13 layoutSubviews];
}

- (CGRect)contentFrame
{
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  v3 = [(UILabel *)self->_label font];
  [v3 capHeight];

  [(NTKBellonaDateComplicationView *)self bounds];
  objc_super v4 = [(NTKZeusComplicationView *)self device];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end