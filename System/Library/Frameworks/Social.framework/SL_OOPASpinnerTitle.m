@interface SL_OOPASpinnerTitle
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)title;
- (SL_OOPASpinnerTitle)init;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setTitle:(id)a3;
- (void)startAnimating;
- (void)stopAnimating;
@end

@implementation SL_OOPASpinnerTitle

- (SL_OOPASpinnerTitle)init
{
  v10.receiver = self;
  v10.super_class = (Class)SL_OOPASpinnerTitle;
  v2 = -[SL_OOPASpinnerTitle initWithFrame:](&v10, sel_initWithFrame_, 0.0, 0.0, 0.0, 22.0);
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F42B38]);
    uint64_t v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    titleView = v2->_titleView;
    v2->_titleView = (UILabel *)v4;

    v6 = [MEMORY[0x1E4F42A30] boldSystemFontOfSize:18.0];
    [(UILabel *)v2->_titleView setFont:v6];

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
    spinner = v2->_spinner;
    v2->_spinner = (UIActivityIndicatorView *)v7;

    [(SL_OOPASpinnerTitle *)v2 addSubview:v2->_titleView];
    [(SL_OOPASpinnerTitle *)v2 addSubview:v2->_spinner];
  }
  return v2;
}

- (void)dealloc
{
  [(UIActivityIndicatorView *)self->_spinner stopAnimating];
  v3.receiver = self;
  v3.super_class = (Class)SL_OOPASpinnerTitle;
  [(SL_OOPASpinnerTitle *)&v3 dealloc];
}

- (NSString)title
{
  return [(UILabel *)self->_titleView text];
}

- (void)setTitle:(id)a3
{
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
  v11.super_class = (Class)SL_OOPASpinnerTitle;
  [(SL_OOPASpinnerTitle *)&v11 layoutSubviews];
  [(UILabel *)self->_titleView sizeToFit];
  [(UIActivityIndicatorView *)self->_spinner sizeToFit];
  [(SL_OOPASpinnerTitle *)self bounds];
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