@interface SiriHintView
+ (CGSize)sizeThatFitsString:(id)a3 forWidth:(double)a4;
- (NSAttributedString)attributedText;
- (SiriHintView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAttributedText:(id)a3;
@end

@implementation SiriHintView

- (SiriHintView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SiriHintView;
  v3 = -[SiriHintView initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor siriui_snippetBackgroundColor];
    [(SiriHintView *)v3 setBackgroundColor:v4];

    v5 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    label = v3->_label;
    v3->_label = v5;

    v7 = v3->_label;
    v8 = +[UIColor siriui_lightTextColor];
    [(UILabel *)v7 setTextColor:v8];

    [(UILabel *)v3->_label setNumberOfLines:0];
    [(SiriHintView *)v3 addSubview:v3->_label];
  }
  return v3;
}

+ (CGSize)sizeThatFitsString:(id)a3 forWidth:(double)a4
{
  objc_msgSend(a3, "boundingRectWithSize:options:context:", 1, 0, a4 + -15.0 + -15.0, 1.79769313e308);
  double v5 = v4;
  double v7 = v6 + 11.0;
  v8 = +[UIScreen mainScreen];
  [v8 scale];
  double v9 = ceil(v7);
  if (v10 < 2.0) {
    double v7 = v9;
  }

  v11 = +[UIScreen mainScreen];
  [v11 scale];
  double v12 = ceil(v5);
  if (v13 < 2.0) {
    double v5 = v12;
  }

  double v14 = v5;
  double v15 = v7;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)setAttributedText:(id)a3
{
  double v4 = (NSAttributedString *)[a3 copy];
  attributedText = self->_attributedText;
  self->_attributedText = v4;

  label = self->_label;
  double v7 = self->_attributedText;

  [(UILabel *)label setAttributedText:v7];
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)SiriHintView;
  [(SiriHintView *)&v18 layoutSubviews];
  [(SiriHintView *)self bounds];
  UIRectInset();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = +[UIScreen mainScreen];
  [v11 scale];
  BOOL v13 = v12 < 2.0;
  double v14 = ceil(v4);
  double v15 = ceil(v6);
  double v16 = ceil(v8);
  double v17 = ceil(v10);
  if (v13) {
    double v4 = v14;
  }
  if (v13) {
    double v6 = v15;
  }
  if (v13) {
    double v8 = v16;
  }
  if (v13) {
    double v10 = v17;
  }

  -[UILabel setFrame:](self->_label, "setFrame:", v4, v6, v8, v10);
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedText, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end