@interface FPUIAuthenticationNavigationBarTitleView
- (FPUIAuthenticationNavigationBarTitleView)init;
- (NSString)title;
- (UIActivityIndicatorView)activityIndicator;
- (UILabel)label;
- (void)setActivityIndicator:(id)a3;
- (void)setActivityIndicatorHidden:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setTitle:(id)a3;
- (void)updateForChangedTraitsAffectingFonts;
@end

@implementation FPUIAuthenticationNavigationBarTitleView

- (FPUIAuthenticationNavigationBarTitleView)init
{
  v12[2] = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)FPUIAuthenticationNavigationBarTitleView;
  v2 = [(FPUIAuthenticationNavigationBarTitleView *)&v11 init];
  v3 = v2;
  if (v2)
  {
    [(FPUIAuthenticationNavigationBarTitleView *)v2 setTranslatesAutoresizingMaskIntoConstraints:0];
    v4 = (void *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
    objc_storeWeak((id *)&v3->_activityIndicator, v4);
    v5 = objc_opt_new();
    v6 = self;
    v12[0] = v6;
    v7 = self;
    v12[1] = v7;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
    id v9 = (id)[(FPUIAuthenticationNavigationBarTitleView *)v3 registerForTraitChanges:v8 withHandler:&__block_literal_global_7];

    objc_storeWeak((id *)&v3->_label, v5);
    [(FPUIAuthenticationNavigationBarTitleView *)v3 updateForChangedTraitsAffectingFonts];
    [(FPUIAuthenticationNavigationBarTitleView *)v3 setAxis:0];
    [(FPUIAuthenticationNavigationBarTitleView *)v3 setSpacing:5.0];
    [(FPUIAuthenticationNavigationBarTitleView *)v3 addArrangedSubview:v4];
    [(FPUIAuthenticationNavigationBarTitleView *)v3 addArrangedSubview:v5];
  }
  return v3;
}

uint64_t __48__FPUIAuthenticationNavigationBarTitleView_init__block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateForChangedTraitsAffectingFonts];
}

- (void)updateForChangedTraitsAffectingFonts
{
  id v9 = [(FPUIAuthenticationNavigationBarTitleView *)self label];
  [v9 setAdjustsFontForContentSizeCategory:1];
  v3 = objc_opt_new();
  v4 = [(FPUIAuthenticationNavigationBarTitleView *)self traitCollection];
  uint64_t v5 = [v4 verticalSizeClass];

  if (v5 != 1 || ([v3 compactAppearance], (v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6 = [v3 standardAppearance];
  }
  v7 = [v6 titleTextAttributes];
  v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F1C238]];
  [v9 setFont:v8];
}

- (void)setTitle:(id)a3
{
  p_label = &self->_label;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_label);
  [WeakRetained setText:v4];
}

- (NSString)title
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_label);
  v3 = [WeakRetained text];

  return (NSString *)v3;
}

- (void)setActivityIndicatorHidden:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(FPUIAuthenticationNavigationBarTitleView *)self activityIndicator];
  [v5 setHidden:v3];

  v6 = [(FPUIAuthenticationNavigationBarTitleView *)self activityIndicator];
  id v7 = v6;
  if (v3) {
    [v6 stopAnimating];
  }
  else {
    [v6 startAnimating];
  }
}

- (UIActivityIndicatorView)activityIndicator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityIndicator);

  return (UIActivityIndicatorView *)WeakRetained;
}

- (void)setActivityIndicator:(id)a3
{
}

- (UILabel)label
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_label);

  return (UILabel *)WeakRetained;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_label);

  objc_destroyWeak((id *)&self->_activityIndicator);
}

@end