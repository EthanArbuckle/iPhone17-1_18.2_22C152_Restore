@interface AMSUILoadingView
- (AMSUILoadingView)initWithFrame:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIActivityIndicatorView)activityIndicator;
- (UILabel)label;
- (void)layoutSubviews;
- (void)setActivityIndicator:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLoadingText:(id)a3;
- (void)startAnimating;
- (void)stopAnimating;
@end

@implementation AMSUILoadingView

- (AMSUILoadingView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)AMSUILoadingView;
  v3 = -[AMSUICommonView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    activityIndicator = v3->_activityIndicator;
    v3->_activityIndicator = (UIActivityIndicatorView *)v4;

    [(UIActivityIndicatorView *)v3->_activityIndicator setHidesWhenStopped:0];
    [(AMSUILoadingView *)v3 addSubview:v3->_activityIndicator];
    id v6 = objc_alloc(MEMORY[0x263F828E0]);
    uint64_t v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    label = v3->_label;
    v3->_label = (UILabel *)v7;

    v9 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83590]];
    [(UILabel *)v3->_label setFont:v9];

    [(UILabel *)v3->_label setTextAlignment:1];
    [(UILabel *)v3->_label setNumberOfLines:0];
    [(UILabel *)v3->_label setText:&stru_26CC491D8];
    [(AMSUILoadingView *)v3 addSubview:v3->_label];
  }
  return v3;
}

- (void)setLoadingText:(id)a3
{
  v5 = &stru_26CC491D8;
  if (a3) {
    v5 = (__CFString *)a3;
  }
  id v6 = v5;
  id v8 = a3;
  uint64_t v7 = [(AMSUILoadingView *)self label];
  [v7 setText:v6];
}

- (void)startAnimating
{
  id v2 = [(AMSUILoadingView *)self activityIndicator];
  [v2 startAnimating];
}

- (void)stopAnimating
{
  id v2 = [(AMSUILoadingView *)self activityIndicator];
  [v2 stopAnimating];
}

- (void)layoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)AMSUILoadingView;
  [(AMSUILoadingView *)&v33 layoutSubviews];
  [(AMSUILoadingView *)self frame];
  double v4 = v3;
  double v6 = v5;
  [(AMSUILoadingView *)self safeAreaInsets];
  double v9 = v4 - (v7 + v8);
  double v12 = v6 - (v10 + v11);
  double v13 = v9 + -30.0;
  v14 = [(AMSUILoadingView *)self activityIndicator];
  objc_msgSend(v14, "sizeThatFits:", v13, v12);
  double v16 = v15;
  double v18 = v17;

  v19 = [(AMSUILoadingView *)self label];
  objc_msgSend(v19, "sizeThatFits:", v13, v12);
  double v21 = v20;
  double v23 = v22;

  [(AMSUILoadingView *)self bounds];
  double v25 = v24 * 0.5 - (v18 + v23 + 7.0) * 0.5;
  [(AMSUILoadingView *)self bounds];
  double v27 = v26 * 0.5 - v16 * 0.5;
  v28 = [(AMSUILoadingView *)self activityIndicator];
  objc_msgSend(v28, "setFrame:", v27, v25, v16, v18);

  double v29 = v18 + 7.0 + v25;
  [(AMSUILoadingView *)self bounds];
  double v31 = v30 * 0.5 - v21 * 0.5;
  v32 = [(AMSUILoadingView *)self label];
  objc_msgSend(v32, "setFrame:", v31, v29, v21, v23);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(AMSUILoadingView *)self activityIndicator];
  objc_msgSend(v6, "sizeThatFits:", width, height);
  double v8 = v7;
  double v10 = v9;

  double v11 = [(AMSUILoadingView *)self label];
  objc_msgSend(v11, "sizeThatFits:", width, height);
  double v13 = v12;
  double v15 = v14;

  if (v8 >= v13) {
    double v16 = v8;
  }
  else {
    double v16 = v13;
  }
  double v17 = v10 + 7.0 + v15;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end