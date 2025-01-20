@interface PSHeaderSpinnerCell
- (BOOL)animating;
- (NSString)name;
- (PSHeaderSpinnerCell)initWithSpecifier:(id)a3;
- (UIActivityIndicatorView)spinner;
- (double)preferredHeightForWidth:(double)a3;
- (void)layoutSubviews;
- (void)setAnimating:(BOOL)a3;
- (void)setName:(id)a3;
@end

@implementation PSHeaderSpinnerCell

- (PSHeaderSpinnerCell)initWithSpecifier:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PSHeaderSpinnerCell;
  v5 = [(PSHeaderSpinnerCell *)&v23 init];
  if (v5)
  {
    v6 = +[UIColor clearColor];
    [(PSHeaderSpinnerCell *)v5 setBackgroundColor:v6];

    [(PSHeaderSpinnerCell *)v5 setAutoresizingMask:2];
    v7 = (UILabel *)objc_alloc_init((Class)UILabel);
    text = v5->_text;
    v5->_text = v7;

    v9 = +[UITableViewHeaderFooterView _defaultFontForTableViewStyle:1 isSectionHeader:1];
    [(UILabel *)v5->_text setFont:v9];

    v10 = +[UITableViewHeaderFooterView _defaultTextColorForTableViewStyle:1 isSectionHeader:1];
    [(UILabel *)v5->_text setTextColor:v10];

    v11 = +[UIColor clearColor];
    [(UILabel *)v5->_text setBackgroundColor:v11];

    uint64_t v12 = [v4 name];
    name = v5->_name;
    v5->_name = (NSString *)v12;

    v14 = v5->_text;
    v22.receiver = v5;
    v22.super_class = (Class)PSHeaderSpinnerCell;
    [(PSHeaderSpinnerCell *)&v22 addSubview:v14];
    v15 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    spinner = v5->_spinner;
    v5->_spinner = v15;

    [(UIActivityIndicatorView *)v5->_spinner setHidesWhenStopped:1];
    v17 = v5->_spinner;
    v21.receiver = v5;
    v21.super_class = (Class)PSHeaderSpinnerCell;
    [(PSHeaderSpinnerCell *)&v21 addSubview:v17];
    [v4 setProperty:v5 forKey:@"PSHeaderSpinner"];
    v18 = [v4 propertyForKey:@"PSHeaderSpinner_Animate"];
    unsigned int v19 = [v18 BOOLValue];

    if (v19) {
      [(UIActivityIndicatorView *)v5->_spinner startAnimating];
    }
  }

  return v5;
}

- (void)setName:(id)a3
{
}

- (void)setAnimating:(BOOL)a3
{
  spinner = self->_spinner;
  if (a3) {
    [(UIActivityIndicatorView *)spinner startAnimating];
  }
  else {
    [(UIActivityIndicatorView *)spinner stopAnimating];
  }
}

- (double)preferredHeightForWidth:(double)a3
{
  [(UIActivityIndicatorView *)self->_spinner frame];
  return v3 + 12.0;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)layoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)PSHeaderSpinnerCell;
  [(PSHeaderSpinnerCell *)&v29 layoutSubviews];
  [(UILabel *)self->_text setText:self->_name];
  [(UILabel *)self->_text sizeToFit];
  [(UILabel *)self->_text frame];
  double v4 = v3;
  double v6 = v5;
  [(UIActivityIndicatorView *)self->_spinner frame];
  double v8 = v7;
  double v10 = v9;
  if ([UIApp userInterfaceLayoutDirection])
  {
    [(PSHeaderSpinnerCell *)self bounds];
    double v12 = v11;
    v13 = [(PSHeaderSpinnerCell *)self superview];
    [v13 _backgroundInset];
    double v15 = v12 - v14;
    PreferencesTableViewCellLeftPad();
    double v17 = v15 - v16 - v4;
  }
  else
  {
    v13 = [(PSHeaderSpinnerCell *)self superview];
    [v13 _backgroundInset];
    double v19 = v18;
    PreferencesTableViewCellLeftPad();
    double v17 = v19 + v20;
  }

  [(PSHeaderSpinnerCell *)self frame];
  double v22 = v21;
  if ([UIApp userInterfaceLayoutDirection]) {
    double v23 = v17 + -10.0 - v8;
  }
  else {
    double v23 = v4 + v17 + 10.0;
  }
  v24 = [(UILabel *)self->_text text];
  id v25 = [v24 length];

  if (!v25)
  {
    [(PSHeaderSpinnerCell *)self frame];
    double v23 = floor((v26 - v8) * 0.5);
  }
  [(PSHeaderSpinnerCell *)self frame];
  CGFloat v28 = floor((v27 - v10) * 0.5);
  v30.origin.x = v17;
  v30.origin.y = floor((v22 - v6) * 0.5);
  v30.size.width = v4;
  v30.size.height = v6;
  CGRect v31 = CGRectIntegral(v30);
  -[UILabel setFrame:](self->_text, "setFrame:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
  v32.origin.x = v23;
  v32.origin.y = v28;
  v32.size.width = v8;
  v32.size.height = v10;
  CGRect v33 = CGRectIntegral(v32);
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", v33.origin.x, v33.origin.y, v33.size.width, v33.size.height);
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)animating
{
  return self->_animating;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_spinner, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end