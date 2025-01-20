@interface ACUILinkButtonFooterView
- (ACUILinkButtonFooterView)initWithButton:(id)a3;
- (ACUILinkButtonFooterView)initWithSpecifier:(id)a3;
- (double)preferredHeightForWidth:(double)a3;
- (int64_t)alignment;
- (void)layoutSubviews;
- (void)setAlignment:(int64_t)a3;
@end

@implementation ACUILinkButtonFooterView

- (ACUILinkButtonFooterView)initWithSpecifier:(id)a3
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v18;
  v18 = 0;
  v16.receiver = v3;
  v16.super_class = (Class)ACUILinkButtonFooterView;
  v15 = [(ACUILinkButtonFooterView *)&v16 init];
  v18 = v15;
  objc_storeStrong((id *)&v18, v15);
  if (v15)
  {
    v4 = (ACUILinkButton *)(id)[location[0] propertyForKey:@"ACUILinkButtonHolder"];
    linkButton = v18->_linkButton;
    v18->_linkButton = v4;

    id v13 = (id)[location[0] propertyForKey:*MEMORY[0x1E4F93138]];
    uint64_t v6 = [v13 integerValue];
    v18->_desiredTextAlignment = v6;

    v14 = v18;
    [(ACUILinkButton *)v18->_linkButton bounds];
    -[ACUILinkButtonFooterView setFrame:](v14, "setFrame:", v7, v8, v9, v10);
    [(ACUILinkButtonFooterView *)v18 addSubview:v18->_linkButton];
  }
  v12 = v18;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v18, 0);
  return v12;
}

- (ACUILinkButtonFooterView)initWithButton:(id)a3
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v14;
  v14 = 0;
  v12.receiver = v3;
  v12.super_class = (Class)ACUILinkButtonFooterView;
  v11 = [(ACUILinkButtonFooterView *)&v12 init];
  v14 = v11;
  objc_storeStrong((id *)&v14, v11);
  if (v11)
  {
    objc_storeStrong((id *)&v14->_linkButton, location[0]);
    double v10 = v14;
    [(ACUILinkButton *)v14->_linkButton bounds];
    -[ACUILinkButtonFooterView setFrame:](v10, "setFrame:", v4, v5, v6, v7);
    [(ACUILinkButtonFooterView *)v14 addSubview:v14->_linkButton];
  }
  double v9 = v14;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v14, 0);
  return v9;
}

- (double)preferredHeightForWidth:(double)a3
{
  return 35.0;
}

- (void)layoutSubviews
{
  [(ACUILinkButton *)self->_linkButton frame];
  double v11 = v2;
  double v12 = v3;
  if (self->_desiredTextAlignment == 1)
  {
    [(ACUILinkButtonFooterView *)self bounds];
    float v5 = (v4 - v11) / 2.0;
    double v9 = floorf(v5);
    float v7 = (v6 - v12) / 2.0;
    double v10 = floorf(v7);
  }
  else
  {
    if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
    {
      double v9 = 12.0;
    }
    else
    {
      [(ACUILinkButtonFooterView *)self bounds];
      double v9 = v8 - v11 - 12.0;
    }
    double v10 = 12.0;
  }
  -[ACUILinkButton setFrame:](self->_linkButton, "setFrame:", v9, v10, v11, v12);
}

- (int64_t)alignment
{
  return self->_desiredTextAlignment;
}

- (void)setAlignment:(int64_t)a3
{
  self->_desiredTextAlignment = a3;
}

- (void).cxx_destruct
{
}

@end