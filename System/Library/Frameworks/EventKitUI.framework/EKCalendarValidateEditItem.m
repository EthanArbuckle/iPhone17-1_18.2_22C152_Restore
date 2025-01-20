@interface EKCalendarValidateEditItem
- (BOOL)URLIsSpam;
- (BOOL)animateSpinner;
- (BOOL)showError;
- (EKCalendarValidateEditItem)init;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (id)footerTitle;
- (void)setAnimateSpinner:(BOOL)a3;
- (void)setButtonTitle:(id)a3;
- (void)setShowError:(BOOL)a3;
- (void)setURLIsSpam:(BOOL)a3;
@end

@implementation EKCalendarValidateEditItem

- (EKCalendarValidateEditItem)init
{
  v6.receiver = self;
  v6.super_class = (Class)EKCalendarValidateEditItem;
  v2 = [(EKCalendarValidateEditItem *)&v6 init];
  if (v2)
  {
    v3 = EventKitUIBundle();
    v4 = [v3 localizedStringForKey:@"Subscribe" value:&stru_1F0CC2140 table:0];
    [(EKCalendarValidateEditItem *)v2 setButtonTitle:v4];
  }
  return v2;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  v31[4] = *MEMORY[0x1E4F143B8];
  cell = self->_cell;
  if (!cell)
  {
    v5 = (UITableViewCell *)objc_alloc_init(MEMORY[0x1E4FB1D08]);
    objc_super v6 = self->_cell;
    self->_cell = v5;

    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    [(UILabel *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [MEMORY[0x1E4FB1618] systemRedColor];
    [(UILabel *)v7 setTextColor:v8];

    [(UILabel *)v7 setText:self->_buttonTitle];
    v9 = [(UITableViewCell *)self->_cell contentView];
    [v9 addSubview:v7];

    v10 = (UIActivityIndicatorView *)objc_alloc_init(MEMORY[0x1E4FB1400]);
    spinner = self->_spinner;
    self->_spinner = v10;

    [(UIActivityIndicatorView *)self->_spinner setTranslatesAutoresizingMaskIntoConstraints:0];
    v12 = [(UITableViewCell *)self->_cell contentView];
    [v12 addSubview:self->_spinner];

    v24 = (void *)MEMORY[0x1E4F28DC8];
    v29 = [(UILabel *)v7 centerXAnchor];
    v30 = [(UITableViewCell *)self->_cell contentView];
    v28 = [v30 centerXAnchor];
    v27 = [v29 constraintEqualToAnchor:v28];
    v31[0] = v27;
    v25 = [(UILabel *)v7 centerYAnchor];
    v26 = [(UITableViewCell *)self->_cell contentView];
    v23 = [v26 centerYAnchor];
    v22 = [v25 constraintEqualToAnchor:v23];
    v31[1] = v22;
    v13 = [(UIActivityIndicatorView *)self->_spinner centerYAnchor];
    v14 = [(UILabel *)v7 centerYAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v31[2] = v15;
    v16 = [(UIActivityIndicatorView *)self->_spinner leadingAnchor];
    v17 = [(UILabel *)v7 trailingAnchor];
    v18 = [v16 constraintEqualToSystemSpacingAfterAnchor:v17 multiplier:1.0];
    v31[3] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
    [v24 activateConstraints:v19];

    buttonTextLabel = self->_buttonTextLabel;
    self->_buttonTextLabel = v7;

    cell = self->_cell;
  }

  return cell;
}

- (void)setButtonTitle:(id)a3
{
  p_buttonTitle = &self->_buttonTitle;
  objc_storeStrong((id *)&self->_buttonTitle, a3);
  id v6 = a3;
  [(UILabel *)self->_buttonTextLabel setText:*p_buttonTitle];
}

- (void)setAnimateSpinner:(BOOL)a3
{
  self->_animateSpinner = a3;
  spinner = self->_spinner;
  if (a3) {
    [(UIActivityIndicatorView *)spinner startAnimating];
  }
  else {
    [(UIActivityIndicatorView *)spinner stopAnimating];
  }
}

- (void)setURLIsSpam:(BOOL)a3
{
  if (self->_URLIsSpam != a3)
  {
    BOOL v3 = a3;
    self->_URLIsSpam = a3;
    v5 = EventKitUIBundle();
    id v6 = v5;
    if (v3) {
      v7 = @"Subscribe Anyway";
    }
    else {
      v7 = @"Subscribe";
    }
    id v8 = [v5 localizedStringForKey:v7 value:&stru_1F0CC2140 table:0];

    [(EKCalendarValidateEditItem *)self setButtonTitle:v8];
  }
}

- (id)footerTitle
{
  if (self->_showError)
  {
    v2 = EventKitUIBundle();
    BOOL v3 = [v2 localizedStringForKey:@"Validation failed. Please edit the URL and try again." value:&stru_1F0CC2140 table:0];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)showError
{
  return self->_showError;
}

- (void)setShowError:(BOOL)a3
{
  self->_showError = a3;
}

- (BOOL)animateSpinner
{
  return self->_animateSpinner;
}

- (BOOL)URLIsSpam
{
  return self->_URLIsSpam;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonTextLabel, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);

  objc_storeStrong((id *)&self->_cell, 0);
}

@end