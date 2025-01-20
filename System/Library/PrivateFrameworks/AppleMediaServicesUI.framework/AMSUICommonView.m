@interface AMSUICommonView
- (AMSUICommonView)init;
- (AMSUICommonView)initWithCoder:(id)a3;
- (AMSUICommonView)initWithFrame:(CGRect)a3;
- (NSString)accessibilityElementLabel;
- (id)accessibilityLabel;
- (id)tintColor;
- (unint64_t)edgesPropagatingSafeAreaInsetsToSubviews;
- (void)_setup;
- (void)setEdgesPropagatingSafeAreaInsetsToSubviews:(unint64_t)a3;
@end

@implementation AMSUICommonView

- (AMSUICommonView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AMSUICommonView;
  v3 = -[AMSUICommonView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_edgesPropagatingSafeAreaInsetsToSubviews = 15;
    [(AMSUICommonView *)v3 _setup];
  }
  return v4;
}

- (void)_setup
{
}

- (AMSUICommonView)init
{
  return -[AMSUICommonView initWithFrame:](self, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
}

- (AMSUICommonView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AMSUICommonView;
  v3 = [(AMSUICommonView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(AMSUICommonView *)v3 _setup];
  }
  return v4;
}

- (id)tintColor
{
  v7.receiver = self;
  v7.super_class = (Class)AMSUICommonView;
  v2 = [(AMSUICommonView *)&v7 tintColor];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x263F825C8], "ams_appTint");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)accessibilityLabel
{
  v3 = [(AMSUICommonView *)self accessibilityElementLabel];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AMSUICommonView;
    id v5 = [(AMSUICommonView *)&v8 accessibilityLabel];
  }
  objc_super v6 = v5;

  return v6;
}

- (NSString)accessibilityElementLabel
{
  return self->_accessibilityElementLabel;
}

- (unint64_t)edgesPropagatingSafeAreaInsetsToSubviews
{
  return self->_edgesPropagatingSafeAreaInsetsToSubviews;
}

- (void)setEdgesPropagatingSafeAreaInsetsToSubviews:(unint64_t)a3
{
  self->_edgesPropagatingSafeAreaInsetsToSubviews = a3;
}

- (void).cxx_destruct
{
}

@end