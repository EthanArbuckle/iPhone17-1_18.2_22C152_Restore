@interface SRSpeechAlternativeLabelCellView
- (CGSize)sizeThatFits:(CGSize)a3;
- (SRSpeechAlternativeLabelCellView)initWithTitle:(id)a3 font:(id)a4;
- (void)layoutSubviews;
@end

@implementation SRSpeechAlternativeLabelCellView

- (SRSpeechAlternativeLabelCellView)initWithTitle:(id)a3 font:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SRSpeechAlternativeLabelCellView;
  v8 = [(SRSpeechAlternativeLabelCellView *)&v14 init];
  if (v8)
  {
    v9 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    label = v8->_label;
    v8->_label = v9;

    [(UILabel *)v8->_label setFont:v7];
    v11 = v8->_label;
    v12 = +[UIColor colorWithWhite:1.0 alpha:1.0];
    [(UILabel *)v11 setTextColor:v12];

    [(UILabel *)v8->_label setText:v6];
    [(UILabel *)v8->_label sizeToFit];
    [(SRSpeechAlternativeLabelCellView *)v8 addSubview:v8->_label];
  }

  return v8;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  v4 = [(UILabel *)self->_label font];
  [v4 _scaledValueForValue:66.0];
  double v6 = v5;

  double v7 = width;
  double v8 = v6;
  result.height = v8;
  result.CGFloat width = v7;
  return result;
}

- (void)layoutSubviews
{
  [(SRSpeechAlternativeLabelCellView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(UILabel *)self->_label frame];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  double v16 = v15;
  double v18 = v17;
  if (SiriLanguageIsRTL())
  {
    v29.origin.x = v4;
    v29.origin.y = v6;
    v29.size.CGFloat width = v8;
    v29.size.height = v10;
    CGFloat v19 = CGRectGetWidth(v29) - SiriUIPlatterStyle[34];
    v30.origin.x = v12;
    v30.origin.y = v14;
    v30.size.CGFloat width = v16;
    v30.size.height = v18;
    double v20 = v19 - CGRectGetWidth(v30);
  }
  else
  {
    double v20 = SiriUIPlatterStyle[32];
  }
  v21 = [(UILabel *)self->_label font];
  [v21 _scaledValueForValue:42.0];
  double v23 = v22;
  v24 = [(UILabel *)self->_label font];
  [v24 ascender];
  double v26 = v23 - v25;

  label = self->_label;

  -[UILabel setFrame:](label, "setFrame:", v20, v26, v16, v18);
}

- (void).cxx_destruct
{
}

@end