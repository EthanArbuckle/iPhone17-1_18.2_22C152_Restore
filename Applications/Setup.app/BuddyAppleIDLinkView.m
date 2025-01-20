@interface BuddyAppleIDLinkView
- (BuddyAppleIDLinkView)initWithFrame:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIButton)linkButton;
- (double)buttonTopPadding;
- (double)sidePadding;
- (void)layoutSubviews;
- (void)setButtonTopPadding:(double)a3;
- (void)setSidePadding:(double)a3;
@end

@implementation BuddyAppleIDLinkView

- (BuddyAppleIDLinkView)initWithFrame:(CGRect)a3
{
  CGRect v14 = a3;
  SEL v12 = a2;
  id location = 0;
  v11.receiver = self;
  v11.super_class = (Class)BuddyAppleIDLinkView;
  id location = -[BuddyAppleIDLinkView initWithFrame:](&v11, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong(&location, location);
  if (location)
  {
    v3 = +[UIButton buttonWithType:1];
    v4 = (void *)*((void *)location + 1);
    *((void *)location + 1) = v3;

    v5 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    id v6 = [*((id *)location + 1) titleLabel];
    [v6 setFont:v5];

    id v7 = [*((id *)location + 1) titleLabel];
    [v7 setNumberOfLines:0];

    id v8 = [*((id *)location + 1) titleLabel];
    [v8 setTextAlignment:1];

    [location addSubview:*((void *)location + 1)];
  }
  v9 = (BuddyAppleIDLinkView *)location;
  objc_storeStrong(&location, 0);
  return v9;
}

- (void)layoutSubviews
{
  [(BuddyAppleIDLinkView *)self bounds];
  v2 = [(UIButton *)self->_linkButton titleLabel];
  sub_100165E2C();
  -[UILabel sizeThatFits:](v2, "sizeThatFits:", v3, v4);
  double v8 = v5;
  double v9 = v6;

  [(UIButton *)self->_linkButton frame];
  UIRoundToViewScale();
  -[UIButton setFrame:](self->_linkButton, "setFrame:", v7, self->_buttonTopPadding, v8, v9, *(void *)&v7, *(void *)&self->_buttonTopPadding, *(void *)&v8, *(void *)&v9, *(void *)&v7, *(void *)&self->_buttonTopPadding, *(void *)&v8, *(void *)&v9, *(void *)&v7, *(void *)&self->_buttonTopPadding);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = [(UIButton *)self->_linkButton titleLabel];
  sub_100165E2C();
  -[UILabel sizeThatFits:](v3, "sizeThatFits:", v4, v5, *(void *)&v4, *(void *)&v5);
  double v11 = v6;
  double v12 = v7;

  double v8 = v11;
  double v9 = v12 + self->_buttonTopPadding;
  result.height = v9;
  result.width = v8;
  return result;
}

- (UIButton)linkButton
{
  return self->_linkButton;
}

- (double)buttonTopPadding
{
  return self->_buttonTopPadding;
}

- (void)setButtonTopPadding:(double)a3
{
  self->_buttonTopPadding = a3;
}

- (double)sidePadding
{
  return self->_sidePadding;
}

- (void)setSidePadding:(double)a3
{
  self->_sidePadding = a3;
}

- (void).cxx_destruct
{
}

@end