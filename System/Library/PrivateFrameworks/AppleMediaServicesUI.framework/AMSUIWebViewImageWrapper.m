@interface AMSUIWebViewImageWrapper
- (AMSUIWebViewImageWrapper)initWithView:(id)a3 topInset:(double)a4;
- (CGSize)intrinsicContentSize;
- (UIView)view;
- (double)inset;
- (void)layoutSubviews;
- (void)setInset:(double)a3;
- (void)setView:(id)a3;
@end

@implementation AMSUIWebViewImageWrapper

- (AMSUIWebViewImageWrapper)initWithView:(id)a3 topInset:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSUIWebViewImageWrapper;
  v8 = -[AMSUICommonView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_view, a3);
    v9->_inset = a4;
    [(AMSUIWebViewImageWrapper *)v9 addSubview:v7];
  }

  return v9;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebViewImageWrapper;
  [(AMSUIWebViewImageWrapper *)&v12 layoutSubviews];
  [(AMSUIWebViewImageWrapper *)self inset];
  double v4 = v3;
  v5 = [(AMSUIWebViewImageWrapper *)self view];
  [v5 intrinsicContentSize];
  double v7 = v6;
  v8 = [(AMSUIWebViewImageWrapper *)self view];
  [v8 intrinsicContentSize];
  double v10 = v9;
  objc_super v11 = [(AMSUIWebViewImageWrapper *)self view];
  objc_msgSend(v11, "setFrame:", 0.0, v4, v7, v10);
}

- (CGSize)intrinsicContentSize
{
  double v3 = [(AMSUIWebViewImageWrapper *)self view];
  [v3 intrinsicContentSize];
  double v5 = v4;
  double v6 = [(AMSUIWebViewImageWrapper *)self view];
  [v6 intrinsicContentSize];
  double v8 = v7;

  double v9 = v5;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (UIView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
}

- (double)inset
{
  return self->_inset;
}

- (void)setInset:(double)a3
{
  self->_inset = a3;
}

- (void).cxx_destruct
{
}

@end