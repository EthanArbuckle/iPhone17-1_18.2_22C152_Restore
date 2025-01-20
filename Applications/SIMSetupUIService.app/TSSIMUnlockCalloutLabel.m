@interface TSSIMUnlockCalloutLabel
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)text;
- (TSSIMUnlockCalloutLabel)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setText:(id)a3;
@end

@implementation TSSIMUnlockCalloutLabel

- (TSSIMUnlockCalloutLabel)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)TSSIMUnlockCalloutLabel;
  v3 = -[TSSIMUnlockCalloutLabel initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init((Class)UILabel);
    textlabel = v3->_textlabel;
    v3->_textlabel = v4;

    v6 = v3->_textlabel;
    v7 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCallout];
    [(UILabel *)v6 setFont:v7];

    [(UILabel *)v3->_textlabel setNumberOfLines:0];
    v8 = v3->_textlabel;
    v9 = +[UIColor blackColor];
    [(UILabel *)v8 setTextColor:v9];

    [(TSSIMUnlockCalloutLabel *)v3 addSubview:v3->_textlabel];
    v10 = +[UIImage imageNamed:@"callout"];
    v11 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v10];
    calloutImageView = v3->_calloutImageView;
    v3->_calloutImageView = v11;

    [(TSSIMUnlockCalloutLabel *)v3 addSubview:v3->_calloutImageView];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UILabel sizeThatFits:](self->_textlabel, "sizeThatFits:", a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  v8 = [(UIImageView *)self->_calloutImageView image];
  [v8 size];
  double v10 = v9;
  double v12 = v11;

  double v13 = v5 + v10 + 5.0;
  if (v7 >= v12) {
    double v14 = v7;
  }
  else {
    double v14 = v12;
  }
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)TSSIMUnlockCalloutLabel;
  [(TSSIMUnlockCalloutLabel *)&v11 layoutSubviews];
  v3 = [(UIImageView *)self->_calloutImageView image];
  [v3 size];

  [(TSSIMUnlockCalloutLabel *)self bounds];
  UIRectCenteredYInRect();
  double x = v12.origin.x;
  double y = v12.origin.y;
  double width = v12.size.width;
  double height = v12.size.height;
  CGFloat v8 = CGRectGetMaxX(v12) + 5.0;
  [(TSSIMUnlockCalloutLabel *)self bounds];
  CGFloat v9 = CGRectGetWidth(v13) - v8;
  [(TSSIMUnlockCalloutLabel *)self bounds];
  double v10 = CGRectGetHeight(v14);
  -[UIImageView setFrame:](self->_calloutImageView, "setFrame:", x, y, width, height);
  -[UILabel setFrame:](self->_textlabel, "setFrame:", v8, 0.0, v9, v10);
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return [(UILabel *)self->_textlabel text];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutImageView, 0);

  objc_storeStrong((id *)&self->_textlabel, 0);
}

@end