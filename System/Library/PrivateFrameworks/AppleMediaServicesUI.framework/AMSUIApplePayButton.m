@interface AMSUIApplePayButton
- (AMSUIApplePayButton)initWithButtonType:(int64_t)a3;
- (CGSize)intrinsicContentSize;
- (UIButton)button;
- (void)layoutSubviews;
- (void)setButton:(id)a3;
@end

@implementation AMSUIApplePayButton

- (AMSUIApplePayButton)initWithButtonType:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AMSUIApplePayButton;
  v4 = [(AMSUIApplePayButton *)&v7 init];
  if (v4)
  {
    v5 = (void *)[objc_alloc((Class)getPKPaymentButtonClass[0]()) initWithPaymentButtonType:a3 paymentButtonStyle:3];
    [v5 sizeToFit];
    [v5 setAutoresizingMask:18];
    [(AMSUIApplePayButton *)v4 setButton:v5];
    [(AMSUIApplePayButton *)v4 addSubview:v5];
  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  v2 = [(AMSUIApplePayButton *)self button];
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)AMSUIApplePayButton;
  [(AMSUIApplePayButton *)&v12 layoutSubviews];
  [(AMSUIApplePayButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(AMSUIApplePayButton *)self button];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end