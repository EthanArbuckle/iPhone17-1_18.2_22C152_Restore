@interface GKDashboardSingleButtonReusableFooterView
- (NSLayoutConstraint)buttonLeadingConstraint;
- (UIButton)button;
- (id)buttonTapHandler;
- (void)awakeFromNib;
- (void)buttonTapped:(id)a3;
- (void)setButton:(id)a3;
- (void)setButtonLeadingConstraint:(id)a3;
- (void)setButtonTapHandler:(id)a3;
- (void)setButtonTitle:(id)a3 forState:(unint64_t)a4;
@end

@implementation GKDashboardSingleButtonReusableFooterView

- (void)awakeFromNib
{
  v4.receiver = self;
  v4.super_class = (Class)GKDashboardSingleButtonReusableFooterView;
  [(GKDashboardSingleButtonReusableFooterView *)&v4 awakeFromNib];
  v3 = [(GKDashboardSingleButtonReusableFooterView *)self button];
  [v3 addTarget:self action:sel_buttonTapped_ forControlEvents:64];
}

- (void)setButtonTitle:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(GKDashboardSingleButtonReusableFooterView *)self button];
  [v7 setTitle:v6 forState:a4];
}

- (void)buttonTapped:(id)a3
{
  objc_super v4 = [(GKDashboardSingleButtonReusableFooterView *)self buttonTapHandler];

  if (v4)
  {
    v5 = [(GKDashboardSingleButtonReusableFooterView *)self buttonTapHandler];
    v5[2]();
  }
}

- (NSLayoutConstraint)buttonLeadingConstraint
{
  return self->_buttonLeadingConstraint;
}

- (void)setButtonLeadingConstraint:(id)a3
{
}

- (id)buttonTapHandler
{
  return self->_buttonTapHandler;
}

- (void)setButtonTapHandler:(id)a3
{
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
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong(&self->_buttonTapHandler, 0);

  objc_storeStrong((id *)&self->_buttonLeadingConstraint, 0);
}

@end