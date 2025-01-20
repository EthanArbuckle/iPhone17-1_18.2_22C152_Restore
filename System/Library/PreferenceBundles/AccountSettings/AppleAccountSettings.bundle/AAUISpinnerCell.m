@interface AAUISpinnerCell
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation AAUISpinnerCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)AAUISpinnerCell;
  id v4 = a3;
  [(AAUISpinnerCell *)&v14 refreshCellContentsWithSpecifier:v4];
  v5 = objc_msgSend(v4, "propertyForKey:", @"AAUISpinnerCellIsSpinningKey", v14.receiver, v14.super_class);

  LODWORD(v4) = [v5 BOOLValue];
  if (v4)
  {
    [(AAUISpinnerCell *)self setType:3];
    [(AAUISpinnerCell *)self setEnabled:0];
    spinner = self->_spinner;
    if (!spinner)
    {
      v7 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
      v8 = self->_spinner;
      self->_spinner = v7;

      spinner = self->_spinner;
    }
    [(UIActivityIndicatorView *)spinner startAnimating];
    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"UPGRADING" value:&stru_76890 table:@"Localizable"];
    v11 = [(AAUISpinnerCell *)self detailTextLabel];
    [v11 setText:v10];

    [(AAUISpinnerCell *)self setAccessoryView:self->_spinner];
  }
  else
  {
    v12 = self->_spinner;
    self->_spinner = 0;

    [(AAUISpinnerCell *)self setAccessoryView:0];
    [(AAUISpinnerCell *)self setType:2];
    [(AAUISpinnerCell *)self setEnabled:1];
    v13 = [(AAUISpinnerCell *)self detailTextLabel];
    [v13 setHidden:0];
  }
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)AAUISpinnerCell;
  [(AAUISpinnerCell *)&v13 layoutSubviews];
  if (self->_spinner)
  {
    v3 = [(AAUISpinnerCell *)self detailTextLabel];
    [v3 frame];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    v12 = [(AAUISpinnerCell *)self detailTextLabel];
    objc_msgSend(v12, "setFrame:", v5 + -7.0, v7, v9, v11);
  }
}

- (void).cxx_destruct
{
}

@end