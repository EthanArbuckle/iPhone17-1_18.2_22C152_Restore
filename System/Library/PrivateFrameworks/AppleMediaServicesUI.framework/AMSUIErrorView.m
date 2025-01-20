@interface AMSUIErrorView
+ (id)_sanitizeTitle:(id)a3;
- (AMSUIErrorView)initWithFrame:(CGRect)a3 title:(id)a4;
- (NSString)buttonTitle;
- (NSString)message;
- (NSString)title;
- (_UIContentUnavailableView)backingView;
- (id)buttonAction;
- (void)_handleButtonTap;
- (void)layoutSubviews;
- (void)setBackingView:(id)a3;
- (void)setButtonAction:(id)a3;
- (void)setButtonTitle:(id)a3;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation AMSUIErrorView

- (AMSUIErrorView)initWithFrame:(CGRect)a3 title:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AMSUIErrorView;
  v10 = -[AMSUICommonView initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v11 = +[AMSUIErrorView _sanitizeTitle:v9];
    id v12 = objc_alloc(MEMORY[0x263F82EF0]);
    uint64_t v13 = objc_msgSend(v12, "initWithFrame:title:style:", v11, 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    backingView = v10->_backingView;
    v10->_backingView = (_UIContentUnavailableView *)v13;

    [(AMSUIErrorView *)v10 addSubview:v10->_backingView];
  }

  return v10;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)AMSUIErrorView;
  [(AMSUIErrorView *)&v12 layoutSubviews];
  [(AMSUIErrorView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(AMSUIErrorView *)self backingView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (id)buttonAction
{
  v2 = [(AMSUIErrorView *)self backingView];
  double v3 = [v2 buttonAction];

  return v3;
}

- (NSString)buttonTitle
{
  v2 = [(AMSUIErrorView *)self backingView];
  double v3 = [v2 buttonTitle];

  return (NSString *)v3;
}

- (NSString)message
{
  v2 = [(AMSUIErrorView *)self backingView];
  double v3 = [v2 message];

  return (NSString *)v3;
}

- (NSString)title
{
  v2 = [(AMSUIErrorView *)self backingView];
  double v3 = [v2 title];

  return (NSString *)v3;
}

- (void)setButtonAction:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIErrorView *)self backingView];
  [v5 setButtonAction:v4];
}

- (void)setButtonTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIErrorView *)self backingView];
  [v5 setButtonTitle:v4];
}

- (void)setMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIErrorView *)self backingView];
  [v5 setMessage:v4];
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v6 = [(id)objc_opt_class() _sanitizeTitle:v4];

  id v5 = [(AMSUIErrorView *)self backingView];
  [v5 setTitle:v6];
}

- (void)_handleButtonTap
{
  double v3 = [(AMSUIErrorView *)self buttonAction];

  if (v3)
  {
    id v4 = [(AMSUIErrorView *)self buttonAction];
    v4[2]();
  }
}

+ (id)_sanitizeTitle:(id)a3
{
  if (a3) {
    return a3;
  }
  else {
    return @" ";
  }
}

- (_UIContentUnavailableView)backingView
{
  return self->_backingView;
}

- (void)setBackingView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end