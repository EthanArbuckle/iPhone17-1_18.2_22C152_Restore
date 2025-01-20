@interface CNFRegLoadingView
- (CNFRegLoadingView)initWithFrame:(CGRect)a3;
- (NSString)message;
- (void)layoutSubviews;
- (void)setMessage:(id)a3;
@end

@implementation CNFRegLoadingView

- (CNFRegLoadingView)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CNFRegLoadingView;
  v3 = -[CNFRegLoadingView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] blackColor];
    v5 = [v4 colorWithAlphaComponent:0.600000024];
    [(CNFRegLoadingView *)v3 setBackgroundColor:v5];

    id v6 = objc_alloc(MEMORY[0x263F828E0]);
    uint64_t v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    label = v3->_label;
    v3->_label = (UILabel *)v7;

    v9 = [MEMORY[0x263F81708] systemFontOfSize:17.0];
    [(UILabel *)v3->_label setFont:v9];

    v10 = CommunicationsSetupUIBundle();
    v11 = CNFRegStringTableName();
    v12 = [v10 localizedStringForKey:@"LOADING" value:&stru_26D05D4F8 table:v11];
    [(UILabel *)v3->_label setText:v12];

    v13 = [MEMORY[0x263F825C8] whiteColor];
    [(UILabel *)v3->_label setTextColor:v13];

    v14 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)v3->_label setBackgroundColor:v14];

    [(CNFRegLoadingView *)v3 addSubview:v3->_label];
    uint64_t v15 = [objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:1];
    spinner = v3->_spinner;
    v3->_spinner = (UIActivityIndicatorView *)v15;

    [(UIActivityIndicatorView *)v3->_spinner startAnimating];
    [(CNFRegLoadingView *)v3 addSubview:v3->_spinner];
  }
  return v3;
}

- (void)layoutSubviews
{
  [(CNFRegLoadingView *)self bounds];
  CGFloat v35 = v4;
  CGFloat v36 = v3;
  CGFloat v34 = v5;
  CGFloat v7 = v6;
  [(UILabel *)self->_label sizeToFit];
  [(UILabel *)self->_label bounds];
  CGFloat v9 = v8;
  CGFloat v32 = v10;
  CGFloat v33 = v8;
  CGFloat v11 = v10;
  double v13 = v12;
  CGFloat v15 = v14;
  double v31 = v14;
  [(UIActivityIndicatorView *)self->_spinner sizeToFit];
  [(UIActivityIndicatorView *)self->_spinner bounds];
  CGFloat y = v38.origin.y;
  CGFloat x = v38.origin.x;
  double width = v38.size.width;
  double height = v38.size.height;
  double v18 = CGRectGetHeight(v38);
  v39.origin.CGFloat x = v9;
  v39.origin.CGFloat y = v11;
  v39.size.double width = v13;
  v39.size.double height = v15;
  double v19 = CGRectGetHeight(v39);
  if (v19 <= 0.0) {
    double v20 = v18;
  }
  else {
    double v20 = v18 + v19 + 5.0;
  }
  double v28 = v20;
  v40.origin.CGFloat x = v36;
  v40.origin.CGFloat y = v35;
  v40.size.double width = v34;
  v40.size.double height = v7;
  double MidX = CGRectGetMidX(v40);
  v41.origin.CGFloat x = v36;
  v41.origin.CGFloat y = v35;
  v41.size.double width = v34;
  v41.size.double height = v7;
  double MidY = CGRectGetMidY(v41);
  v42.origin.CGFloat y = y;
  v42.origin.CGFloat x = x;
  v42.size.double width = width;
  v42.size.double height = height;
  CGFloat v23 = MidX - CGRectGetWidth(v42) * 0.5;
  CGFloat v24 = MidY - v28 * 0.5;
  v43.origin.CGFloat y = v32;
  v43.origin.CGFloat x = v33;
  v43.size.double width = v13;
  v43.size.double height = v31;
  double v25 = MidX - CGRectGetWidth(v43) * 0.5;
  v44.origin.CGFloat x = v23;
  v44.origin.CGFloat y = v24;
  v44.size.double width = width;
  v44.size.double height = height;
  double v26 = CGRectGetMaxY(v44) + 5.0;
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", v23, v24, width, height);
  label = self->_label;
  -[UILabel setFrame:](label, "setFrame:", v25, v26, v13, v31);
}

- (NSString)message
{
  return [(UILabel *)self->_label text];
}

- (void)setMessage:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (!v4)
  {
    double v5 = CommunicationsSetupUIBundle();
    double v6 = CNFRegStringTableName();
    id v4 = [v5 localizedStringForKey:@"LOADING" value:&stru_26D05D4F8 table:v6];
  }
  CGFloat v7 = [(UILabel *)self->_label text];
  char v8 = [v4 isEqualToString:v7];

  if ((v8 & 1) == 0)
  {
    [(UILabel *)self->_label setText:v4];
    [(CNFRegLoadingView *)self setNeedsLayout];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end