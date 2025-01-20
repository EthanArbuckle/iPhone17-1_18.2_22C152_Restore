@interface OOPASpinnerTitle
- (CGSize)sizeThatFits:(CGSize)a3;
- (OOPASpinnerTitle)initWithTitle:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)startAnimating;
- (void)stopAnimating;
@end

@implementation OOPASpinnerTitle

- (OOPASpinnerTitle)initWithTitle:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)OOPASpinnerTitle;
  v5 = -[OOPASpinnerTitle initWithFrame:](&v12, "initWithFrame:", 0.0, 0.0, 0.0, 22.0);
  if (v5)
  {
    v6 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    titleView = v5->_titleView;
    v5->_titleView = v6;

    [(UILabel *)v5->_titleView setText:v4];
    v8 = +[UIFont boldSystemFontOfSize:18.0];
    [(UILabel *)v5->_titleView setFont:v8];

    v9 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    spinner = v5->_spinner;
    v5->_spinner = v9;

    [(OOPASpinnerTitle *)v5 addSubview:v5->_titleView];
    [(OOPASpinnerTitle *)v5 addSubview:v5->_spinner];
  }

  return v5;
}

- (void)dealloc
{
  [(UIActivityIndicatorView *)self->_spinner stopAnimating];
  v3.receiver = self;
  v3.super_class = (Class)OOPASpinnerTitle;
  [(OOPASpinnerTitle *)&v3 dealloc];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(UILabel *)self->_titleView sizeToFit];
  [(UIActivityIndicatorView *)self->_spinner sizeToFit];
  [(UILabel *)self->_titleView frame];
  double v5 = v4;
  [(UIActivityIndicatorView *)self->_spinner frame];
  if (v5 < v6) {
    double v5 = v6;
  }
  [(UILabel *)self->_titleView frame];
  double v8 = v7 + 10.0;
  [(UIActivityIndicatorView *)self->_spinner frame];
  double v10 = v8 + v9 + 10.0;
  [(UIActivityIndicatorView *)self->_spinner frame];
  double v12 = v10 + v11;
  double v13 = v5;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)OOPASpinnerTitle;
  [(OOPASpinnerTitle *)&v11 layoutSubviews];
  [(UILabel *)self->_titleView sizeToFit];
  [(UIActivityIndicatorView *)self->_spinner sizeToFit];
  [(OOPASpinnerTitle *)self bounds];
  double v4 = v3;
  [(UIActivityIndicatorView *)self->_spinner frame];
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:");
  [(UILabel *)self->_titleView frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UIActivityIndicatorView *)self->_spinner frame];
  -[UILabel setFrame:](self->_titleView, "setFrame:", CGRectGetMaxX(v12) + 10.0, v6 + floor((v4 - v10) * 0.5), v8, v10);
}

- (void)startAnimating
{
}

- (void)stopAnimating
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);

  objc_storeStrong((id *)&self->_titleView, 0);
}

@end