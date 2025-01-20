@interface ACUISpinnerTitle
- (ACUISpinnerTitle)initWithTitle:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
@end

@implementation ACUISpinnerTitle

- (ACUISpinnerTitle)initWithTitle:(id)a3
{
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = v22;
  CGRectMake();
  double v17 = v3;
  double v18 = v4;
  double v19 = v5;
  double v20 = v6;
  v22 = 0;
  v16.receiver = v15;
  v16.super_class = (Class)ACUISpinnerTitle;
  v22 = -[ACUISpinnerTitle initWithFrame:](&v16, sel_initWithFrame_, v3, v4, v5, v6);
  objc_storeStrong((id *)&v22, v22);
  if (v22)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F42B38]);
    uint64_t v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    titleView = v22->_titleView;
    v22->_titleView = (UILabel *)v8;

    [(UILabel *)v22->_titleView setText:location[0]];
    id v14 = (id)[MEMORY[0x1E4F42A30] boldSystemFontOfSize:18.0];
    -[UILabel setFont:](v22->_titleView, "setFont:");

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
    spinner = v22->_spinner;
    v22->_spinner = (UIActivityIndicatorView *)v10;

    [(ACUISpinnerTitle *)v22 addSubview:v22->_titleView];
    [(ACUISpinnerTitle *)v22 addSubview:v22->_spinner];
  }
  v13 = v22;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v22, 0);
  return v13;
}

- (void)dealloc
{
  double v4 = self;
  SEL v3 = a2;
  [(UIActivityIndicatorView *)self->_spinner stopAnimating];
  v2.receiver = v4;
  v2.super_class = (Class)ACUISpinnerTitle;
  [(ACUISpinnerTitle *)&v2 dealloc];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(UILabel *)self->_titleView sizeToFit];
  [(UIActivityIndicatorView *)self->_spinner sizeToFit];
  [(UILabel *)self->_titleView frame];
  double v13 = v3;
  [(UIActivityIndicatorView *)self->_spinner frame];
  if (v13 >= v4) {
    double v12 = v13;
  }
  else {
    double v12 = v4;
  }
  [(UILabel *)self->_titleView frame];
  double v10 = v5 + 10.0;
  [(UIActivityIndicatorView *)self->_spinner frame];
  double v11 = v10 + v6 + 10.0;
  [(UIActivityIndicatorView *)self->_spinner frame];
  double v8 = v11 + v7;
  double v9 = v12;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  objc_super v16 = self;
  SEL v15 = a2;
  v14.receiver = self;
  v14.super_class = (Class)ACUISpinnerTitle;
  [(ACUISpinnerTitle *)&v14 layoutSubviews];
  [(UILabel *)v16->_titleView sizeToFit];
  [(UIActivityIndicatorView *)v16->_spinner sizeToFit];
  [(ACUISpinnerTitle *)v16 bounds];
  double v13 = v2;
  [(UIActivityIndicatorView *)v16->_spinner frame];
  -[UIActivityIndicatorView setFrame:](v16->_spinner, "setFrame:", v5, v4 + floor((v13 - v3) / 2.0), v6, v3);
  [(UILabel *)v16->_titleView frame];
  double v10 = v7;
  double v11 = v8;
  double v12 = v9;
  [(UIActivityIndicatorView *)v16->_spinner frame];
  -[UILabel setFrame:](v16->_titleView, "setFrame:", CGRectGetMaxX(v17) + 10.0, v12 + floor((v13 - v11) / 2.0), v10, v11);
}

- (void)didMoveToWindow
{
  id v2 = (id)[(ACUISpinnerTitle *)self window];
  BOOL v3 = v2 == 0;

  if (v3) {
    [(UIActivityIndicatorView *)self->_spinner stopAnimating];
  }
  else {
    [(UIActivityIndicatorView *)self->_spinner startAnimating];
  }
}

- (void).cxx_destruct
{
}

@end