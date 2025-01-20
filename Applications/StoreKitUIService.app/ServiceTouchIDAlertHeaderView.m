@interface ServiceTouchIDAlertHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)message;
- (NSString)title;
- (UIImage)image;
- (void)layoutSubviews;
- (void)setImage:(id)a3;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
- (void)shakeTitleView;
@end

@implementation ServiceTouchIDAlertHeaderView

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (NSString)message
{
  return [(UILabel *)self->_messageLabel text];
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  imageView = self->_imageView;
  id v8 = v4;
  if (v4)
  {
    if (!imageView)
    {
      v6 = (UIImageView *)objc_alloc_init((Class)UIImageView);
      v7 = self->_imageView;
      self->_imageView = v6;

      [(ServiceTouchIDAlertHeaderView *)self addSubview:self->_imageView];
      imageView = self->_imageView;
    }
    [(UIImageView *)imageView setHidden:0];
    [(UIImageView *)self->_imageView setImage:v8];
    [(UIImageView *)self->_imageView sizeToFit];
    [(ServiceTouchIDAlertHeaderView *)self setNeedsLayout];
  }
  else
  {
    [(UIImageView *)imageView setHidden:1];
  }
}

- (void)setMessage:(id)a3
{
  id v4 = a3;
  messageLabel = self->_messageLabel;
  id v15 = v4;
  if (v4)
  {
    if (!messageLabel)
    {
      v6 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleFootnote];
      v7 = (UILabel *)objc_alloc_init((Class)UILabel);
      id v8 = self->_messageLabel;
      self->_messageLabel = v7;

      v9 = self->_messageLabel;
      v10 = +[UIColor clearColor];
      [(UILabel *)v9 setBackgroundColor:v10];

      v11 = self->_messageLabel;
      v12 = +[UIFont fontWithDescriptor:v6 size:0.0];
      [(UILabel *)v11 setFont:v12];

      [(UILabel *)self->_messageLabel setNumberOfLines:0];
      [(UILabel *)self->_messageLabel setTextAlignment:1];
      v13 = self->_messageLabel;
      v14 = +[UIColor blackColor];
      [(UILabel *)v13 setTextColor:v14];

      [(ServiceTouchIDAlertHeaderView *)self addSubview:self->_messageLabel];
      messageLabel = self->_messageLabel;
    }
    [(UILabel *)messageLabel setHidden:0];
    [(UILabel *)self->_messageLabel setText:v15];
    [(ServiceTouchIDAlertHeaderView *)self setNeedsLayout];
  }
  else
  {
    [(UILabel *)messageLabel setHidden:1];
  }
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  titleLabel = self->_titleLabel;
  id v16 = v4;
  if (v4)
  {
    if (!titleLabel)
    {
      v6 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody];
      v7 = [v6 fontDescriptorWithSymbolicTraits:2];

      id v8 = (UILabel *)objc_alloc_init((Class)UILabel);
      v9 = self->_titleLabel;
      self->_titleLabel = v8;

      v10 = self->_titleLabel;
      v11 = +[UIColor clearColor];
      [(UILabel *)v10 setBackgroundColor:v11];

      v12 = self->_titleLabel;
      v13 = +[UIFont fontWithDescriptor:v7 size:0.0];
      [(UILabel *)v12 setFont:v13];

      [(UILabel *)self->_titleLabel setNumberOfLines:2];
      [(UILabel *)self->_titleLabel setTextAlignment:1];
      v14 = self->_titleLabel;
      id v15 = +[UIColor blackColor];
      [(UILabel *)v14 setTextColor:v15];

      [(ServiceTouchIDAlertHeaderView *)self addSubview:self->_titleLabel];
      titleLabel = self->_titleLabel;
    }
    [(UILabel *)titleLabel setHidden:0];
    [(UILabel *)self->_titleLabel setText:v16];
    [(ServiceTouchIDAlertHeaderView *)self setNeedsLayout];
  }
  else
  {
    [(UILabel *)titleLabel setHidden:1];
  }
}

- (void)shakeTitleView
{
  id v20 = [(UILabel *)self->_titleLabel layer];
  [v20 removeAllAnimations];
  v2 = +[CASpringAnimation animationWithKeyPath:@"position.x"];
  [v2 setMass:1.20000005];
  [v2 setStiffness:1200.0];
  [v2 setDamping:12.0];
  LODWORD(v3) = 1028389654;
  LODWORD(v4) = 990057071;
  LODWORD(v5) = 1059712716;
  LODWORD(v6) = 1.0;
  v7 = +[CAMediaTimingFunction functionWithControlPoints:v3 :v4 :v5 :v6];
  [v2 setTimingFunction:v7];

  [v2 setDuration:0.860000014];
  [v2 setVelocity:0.0];
  [v2 setFillMode:kCAFillModeBackwards];
  [v20 position];
  double v9 = v8 + 60.0;
  *(float *)&double v9 = v9;
  v10 = +[NSNumber numberWithFloat:v9];
  [v2 setFromValue:v10];

  [v20 addAnimation:v2 forKey:@"position"];
  v11 = +[CABasicAnimation animationWithKeyPath:@"position.x"];
  LODWORD(v12) = 1036831949;
  LODWORD(v13) = 0.25;
  LODWORD(v14) = 0.25;
  LODWORD(v15) = 1.0;
  id v16 = +[CAMediaTimingFunction functionWithControlPoints:v13 :v12 :v14 :v15];
  [v11 setTimingFunction:v16];

  [v11 setDuration:0.0700000003];
  [v11 setFillMode:kCAFillModeBackwards];
  [v20 position];
  double v18 = v17 + -60.0;
  *(float *)&double v18 = v18;
  v19 = +[NSNumber numberWithFloat:v18];
  [v11 setFromValue:v19];

  [v20 addAnimation:v11 forKey:@"force"];
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)layoutSubviews
{
  [(ServiceTouchIDAlertHeaderView *)self bounds];
  double v4 = v3;
  imageView = self->_imageView;
  double v6 = 0.0;
  double MaxY = 18.0;
  if (imageView && ([(UIImageView *)imageView isHidden] & 1) == 0)
  {
    [(UIImageView *)self->_imageView frame];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    float v12 = (v4 - v8) * 0.5;
    CGFloat v13 = floorf(v12);
    -[UIImageView setFrame:](self->_imageView, "setFrame:", v13, 18.0);
    v28.origin.y = 18.0;
    v28.origin.x = v13;
    v28.size.width = v9;
    v28.size.height = v11;
    double MaxY = CGRectGetMaxY(v28);
    double v6 = 9.0;
  }
  titleLabel = self->_titleLabel;
  if (titleLabel && ([(UILabel *)titleLabel isHidden] & 1) == 0)
  {
    [(UILabel *)self->_titleLabel frame];
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v4 + -30.0, 1.79769313e308);
    double v16 = v15;
    CGFloat v18 = v17;
    *(float *)&double v15 = (v4 - v15) * 0.5;
    CGFloat v19 = floorf(*(float *)&v15);
    CGFloat v20 = MaxY + v6;
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v19, v20, v16, v17);
    v29.origin.x = v19;
    v29.origin.y = v20;
    v29.size.width = v16;
    v29.size.height = v18;
    double MaxY = CGRectGetMaxY(v29);
    double v6 = 4.0;
  }
  messageLabel = self->_messageLabel;
  if (messageLabel && ([(UILabel *)messageLabel isHidden] & 1) == 0)
  {
    [(UILabel *)self->_messageLabel frame];
    -[UILabel sizeThatFits:](self->_messageLabel, "sizeThatFits:", v4 + -30.0, 1.79769313e308);
    double v24 = v23;
    *(float *)&double v23 = (v4 - v23) * 0.5;
    double v25 = floorf(*(float *)&v23);
    v26 = self->_messageLabel;
    -[UILabel setFrame:](v26, "setFrame:", v25, MaxY + v6, v24, v22);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  imageView = self->_imageView;
  double v6 = 0.0;
  if (imageView && ([(UIImageView *)imageView isHidden] & 1) == 0)
  {
    [(UIImageView *)self->_imageView frame];
    a3.double width = 36.0;
    double v7 = v8 + 36.0;
    double v6 = 9.0;
  }
  else
  {
    double v7 = 36.0;
  }
  titleLabel = self->_titleLabel;
  if (titleLabel && ([(UILabel *)titleLabel isHidden] & 1) == 0)
  {
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width + -30.0, 1.79769313e308);
    a3.double width = v6 + a3.height;
    double v7 = v7 + v6 + a3.height;
    double v6 = 4.0;
  }
  messageLabel = self->_messageLabel;
  if (messageLabel && ([(UILabel *)messageLabel isHidden] & 1) == 0)
  {
    -[UILabel sizeThatFits:](self->_messageLabel, "sizeThatFits:", width + -30.0, 1.79769313e308);
    double v7 = v7 + v6 + v11;
  }
  double v12 = width;
  double v13 = v7;
  result.height = v13;
  result.double width = v12;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end