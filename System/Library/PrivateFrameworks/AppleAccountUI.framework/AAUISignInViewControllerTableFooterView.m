@interface AAUISignInViewControllerTableFooterView
- (AAUISignInViewControllerTableFooterView)initWithReuseIdentifier:(id)a3;
- (NSArray)privacyLinkIdentifiers;
- (OBPrivacyLinkController)privacyLinkController;
- (UIButton)continueButton;
- (UIView)expandableView;
- (UIViewController)parentForPrivacyController;
- (double)naturalHeight;
- (double)totalHeight;
- (void)addActionButtonStackView:(id)a3;
- (void)addContinueButton:(id)a3;
- (void)addOtherButton:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setExpandableView:(id)a3;
- (void)setExpandableViewToHeight:(double)a3;
- (void)setParentForPrivacyController:(id)a3;
- (void)setPrivacyLinkController:(id)a3;
- (void)setPrivacyLinkIdentifiers:(id)a3;
@end

@implementation AAUISignInViewControllerTableFooterView

- (AAUISignInViewControllerTableFooterView)initWithReuseIdentifier:(id)a3
{
  v34.receiver = self;
  v34.super_class = (Class)AAUISignInViewControllerTableFooterView;
  v3 = [(AAUISignInViewControllerTableFooterView *)&v34 initWithReuseIdentifier:a3];
  if (v3)
  {
    v4 = _AAUILogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "Initializing AAUISignInViewControllerTableFooterView", v33, 2u);
    }

    v5 = (UIStackView *)objc_alloc_init(MEMORY[0x263F82BF8]);
    mainStack = v3->_mainStack;
    v3->_mainStack = v5;

    [(UIStackView *)v3->_mainStack setAxis:1];
    [(UIStackView *)v3->_mainStack setAlignment:3];
    [(UIStackView *)v3->_mainStack setDistribution:3];
    [(UIStackView *)v3->_mainStack setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    expandableView = v3->_expandableView;
    v3->_expandableView = v7;

    [(UIView *)v3->_expandableView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v3->_mainStack addArrangedSubview:v3->_expandableView];
    v9 = [(AAUISignInViewControllerTableFooterView *)v3 contentView];
    [v9 addSubview:v3->_mainStack];

    v10 = [(UIStackView *)v3->_mainStack leadingAnchor];
    v11 = [(AAUISignInViewControllerTableFooterView *)v3 contentView];
    v12 = [v11 leadingAnchor];
    v13 = [v10 constraintEqualToAnchor:v12];
    [v13 setActive:1];

    v14 = [(UIStackView *)v3->_mainStack trailingAnchor];
    v15 = [(AAUISignInViewControllerTableFooterView *)v3 contentView];
    v16 = [v15 trailingAnchor];
    v17 = [v14 constraintEqualToAnchor:v16];
    [v17 setActive:1];

    v18 = [(UIStackView *)v3->_mainStack topAnchor];
    v19 = [(AAUISignInViewControllerTableFooterView *)v3 contentView];
    v20 = [v19 topAnchor];
    v21 = [v18 constraintEqualToAnchor:v20 constant:15.0];
    [v21 setActive:1];

    v22 = [(UIStackView *)v3->_mainStack bottomAnchor];
    v23 = [(AAUISignInViewControllerTableFooterView *)v3 contentView];
    v24 = [v23 bottomAnchor];
    v25 = [v22 constraintEqualToAnchor:v24];
    [v25 setActive:1];

    v26 = [(UIView *)v3->_expandableView heightAnchor];
    v27 = [v26 constraintGreaterThanOrEqualToConstant:10.0];
    [v27 setActive:1];

    v28 = [(UIView *)v3->_expandableView heightAnchor];
    uint64_t v29 = [v28 constraintEqualToConstant:0.0];
    expandableHeight = v3->_expandableHeight;
    v3->_expandableHeight = (NSLayoutConstraint *)v29;

    v31 = [(AAUISignInViewControllerTableFooterView *)v3 contentView];
    [v31 setNeedsLayout];
  }
  return v3;
}

- (void)setPrivacyLinkIdentifiers:(id)a3
{
  v23[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count] && !self->_privacyLinkController)
  {
    v5 = [MEMORY[0x263F5B8F0] linkWithBundleIdentifiers:v4];
    privacyLinkController = self->_privacyLinkController;
    self->_privacyLinkController = v5;

    v7 = [(OBPrivacyLinkController *)self->_privacyLinkController view];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

    mainStack = self->_mainStack;
    v9 = [(OBPrivacyLinkController *)self->_privacyLinkController view];
    [(UIStackView *)mainStack addArrangedSubview:v9];

    v10 = [(AAUISignInViewControllerTableFooterView *)self parentForPrivacyController];
    [v10 addChildViewController:self->_privacyLinkController];

    v11 = self->_privacyLinkController;
    v12 = [(AAUISignInViewControllerTableFooterView *)self parentForPrivacyController];
    [(OBPrivacyLinkController *)v11 didMoveToParentViewController:v12];

    v22 = [(OBPrivacyLinkController *)self->_privacyLinkController view];
    v21 = [v22 leadingAnchor];
    v13 = [(UIStackView *)self->_mainStack leadingAnchor];
    v14 = [v21 constraintEqualToAnchor:v13];
    v23[0] = v14;
    v15 = [(OBPrivacyLinkController *)self->_privacyLinkController view];
    v16 = [v15 trailingAnchor];
    v17 = [(UIStackView *)self->_mainStack trailingAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    v23[1] = v18;
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];

    [(OBPrivacyLinkController *)self->_privacyLinkController setAccessibilityIdentifier:@"privacy-view"];
    [MEMORY[0x263F08938] activateConstraints:v19];
    v20 = [(AAUISignInViewControllerTableFooterView *)self contentView];
    [v20 setNeedsLayout];
  }
}

- (void)setExpandableViewToHeight:(double)a3
{
  [(NSLayoutConstraint *)self->_expandableHeight setActive:0];
  [(NSLayoutConstraint *)self->_expandableHeight setConstant:a3];
  expandableHeight = self->_expandableHeight;
  [(NSLayoutConstraint *)expandableHeight setActive:1];
}

- (double)naturalHeight
{
  double v3 = *MEMORY[0x263F83810];
  double v4 = *(double *)(MEMORY[0x263F83810] + 8);
  -[UIStackView systemLayoutSizeFittingSize:](self->_actionButtonStackView, "systemLayoutSizeFittingSize:", *MEMORY[0x263F83810], v4);
  double v6 = v5;
  v7 = [(OBPrivacyLinkController *)self->_privacyLinkController view];
  objc_msgSend(v7, "systemLayoutSizeFittingSize:", v3, v4);
  double v9 = v8;

  -[UIStackView systemLayoutSizeFittingSize:](self->_continueButtonStackView, "systemLayoutSizeFittingSize:", v3, v4);
  double v11 = 10.0;
  if (!self->_privacyLinkController) {
    double v11 = 0.0;
  }
  return v6 + v9 + v10 + v11;
}

- (double)totalHeight
{
  -[UIStackView systemLayoutSizeFittingSize:](self->_mainStack, "systemLayoutSizeFittingSize:", *MEMORY[0x263F83810], *(double *)(MEMORY[0x263F83810] + 8));
  double v4 = 10.0;
  if (!self->_privacyLinkController) {
    double v4 = 0.0;
  }
  return v3 + v4;
}

- (void)addActionButtonStackView:(id)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  p_actionButtonStackView = &self->_actionButtonStackView;
  if (!self->_actionButtonStackView)
  {
    objc_storeStrong((id *)&self->_actionButtonStackView, a3);
    [(UIStackView *)self->_mainStack insertArrangedSubview:*p_actionButtonStackView atIndex:0];
    v7 = [(UIStackView *)*p_actionButtonStackView leadingAnchor];
    double v8 = [(UIStackView *)self->_mainStack leadingAnchor];
    double v9 = [v7 constraintEqualToAnchor:v8];
    v15[0] = v9;
    double v10 = [(UIStackView *)*p_actionButtonStackView trailingAnchor];
    double v11 = [(UIStackView *)self->_mainStack trailingAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v15[1] = v12;
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];

    [MEMORY[0x263F08938] activateConstraints:v13];
    v14 = [(AAUISignInViewControllerTableFooterView *)self contentView];
    [v14 setNeedsLayout];
  }
}

- (void)addContinueButton:(id)a3
{
  v19[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(AAUISignInViewControllerTableFooterView *)self setContinueButton:v4];
  if (!self->_continueButtonStackView)
  {
    id v5 = (UIStackView *)objc_alloc_init(MEMORY[0x263F82BF8]);
    continueButtonStackView = self->_continueButtonStackView;
    self->_continueButtonStackView = v5;

    [(UIStackView *)self->_continueButtonStackView setAxis:1];
    [(UIStackView *)self->_continueButtonStackView setAlignment:0];
    [(UIStackView *)self->_continueButtonStackView setDistribution:0];
    [(UIStackView *)self->_continueButtonStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    if (self->_privacyLinkController)
    {
      id v7 = objc_alloc_init(MEMORY[0x263F82E00]);
      [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
      double v8 = [v7 heightAnchor];
      double v9 = [v8 constraintEqualToConstant:10.0];

      [v9 setActive:1];
      LODWORD(v10) = 1148846080;
      [v7 setContentCompressionResistancePriority:1 forAxis:v10];
      [(UIStackView *)self->_mainStack addArrangedSubview:v7];
    }
    [(UIStackView *)self->_continueButtonStackView addArrangedSubview:v4];
    [(UIStackView *)self->_mainStack addArrangedSubview:self->_continueButtonStackView];
    double v11 = [(UIStackView *)self->_continueButtonStackView leadingAnchor];
    v12 = [(UIStackView *)self->_mainStack leadingAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v19[0] = v13;
    v14 = [(UIStackView *)self->_continueButtonStackView trailingAnchor];
    v15 = [(UIStackView *)self->_mainStack trailingAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v19[1] = v16;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];

    [MEMORY[0x263F08938] activateConstraints:v17];
    v18 = [(AAUISignInViewControllerTableFooterView *)self contentView];
    [v18 setNeedsLayout];
  }
}

- (void)addOtherButton:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F82E00];
  id v5 = a3;
  id v8 = objc_alloc_init(v4);
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v6 = [v8 heightAnchor];
  id v7 = [v6 constraintEqualToConstant:10.0];
  [v7 setActive:1];

  [(UIStackView *)self->_continueButtonStackView addArrangedSubview:v8];
  [(UIStackView *)self->_continueButtonStackView addArrangedSubview:v5];
}

- (NSArray)privacyLinkIdentifiers
{
  return self->_privacyLinkIdentifiers;
}

- (UIViewController)parentForPrivacyController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentForPrivacyController);
  return (UIViewController *)WeakRetained;
}

- (void)setParentForPrivacyController:(id)a3
{
}

- (OBPrivacyLinkController)privacyLinkController
{
  return self->_privacyLinkController;
}

- (void)setPrivacyLinkController:(id)a3
{
}

- (UIView)expandableView
{
  return self->_expandableView;
}

- (void)setExpandableView:(id)a3
{
}

- (UIButton)continueButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_continueButton);
  return (UIButton *)WeakRetained;
}

- (void)setContinueButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_continueButton);
  objc_storeStrong((id *)&self->_privacyLinkController, 0);
  objc_destroyWeak((id *)&self->_parentForPrivacyController);
  objc_storeStrong((id *)&self->_privacyLinkIdentifiers, 0);
  objc_storeStrong((id *)&self->_expandableHeight, 0);
  objc_storeStrong((id *)&self->_continueButtonStackView, 0);
  objc_storeStrong((id *)&self->_actionButtonStackView, 0);
  objc_storeStrong((id *)&self->_expandableView, 0);
  objc_storeStrong((id *)&self->_mainStack, 0);
}

@end