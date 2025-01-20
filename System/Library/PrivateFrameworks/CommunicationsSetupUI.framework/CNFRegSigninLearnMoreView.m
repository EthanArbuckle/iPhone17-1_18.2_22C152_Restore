@interface CNFRegSigninLearnMoreView
- (CNFRegSigninLearnMoreView)initWithSpecifier:(id)a3;
- (CNFRegSplashSignInController)controller;
- (UIButton)learnMoreButton;
- (UIImageView)splashImageView;
- (UILabel)titleLabel;
- (UILabel)verbiageLabel;
- (UIView)authKitSignInView;
- (double)preferredHeightForWidth:(double)a3;
- (id)_serviceTitle;
- (id)_splashImage;
- (id)signingInLabel;
- (id)signingInSpinner;
- (int64_t)serviceType;
- (void)_learnMorePressed:(id)a3;
- (void)layoutSubviews;
- (void)setAuthKitSignInView:(id)a3;
- (void)setController:(id)a3;
- (void)setLearnMoreButton:(id)a3;
- (void)setServiceType:(int64_t)a3;
- (void)setSigningIn:(BOOL)a3;
- (void)setSplashImageView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setVerbiageLabel:(id)a3;
@end

@implementation CNFRegSigninLearnMoreView

- (CNFRegSigninLearnMoreView)initWithSpecifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNFRegSigninLearnMoreView;
  v6 = -[CNFRegSigninLearnMoreView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_specifier, a3);
    v7->_serviceType = 0;
  }

  return v7;
}

- (id)_serviceTitle
{
  int64_t v2 = [(CNFRegSigninLearnMoreView *)self serviceType];
  switch(v2)
  {
    case 2:
      goto LABEL_4;
    case 1:
      v3 = CommunicationsSetupUIBundle();
      v4 = CNFRegStringTableName();
      id v5 = @"IMESSAGE";
      goto LABEL_6;
    case 0:
LABEL_4:
      v3 = CommunicationsSetupUIBundle();
      v4 = CNFRegStringTableName();
      id v5 = @"FACETIME";
LABEL_6:
      v6 = [v3 localizedStringForKey:v5 value:&stru_26D05D4F8 table:v4];

      goto LABEL_8;
  }
  v6 = &stru_26D05D4F8;
LABEL_8:
  return v6;
}

- (void)setAuthKitSignInView:(id)a3
{
  p_authKitSignInView = &self->_authKitSignInView;
  objc_storeStrong((id *)&self->_authKitSignInView, a3);
  id v7 = a3;
  v6 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
  [(UIView *)*p_authKitSignInView setBackgroundColor:v6];

  [(CNFRegSigninLearnMoreView *)self addSubview:*p_authKitSignInView];
}

- (void)setSigningIn:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x263F158F8] flush];
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setAnimationDuration:0.0];
  [(UIView *)self->_authKitSignInView setHidden:v3];
  id v5 = [(CNFRegSigninLearnMoreView *)self signingInLabel];
  uint64_t v6 = v3 ^ 1;
  [v5 setHidden:v6];

  id v7 = [(CNFRegSigninLearnMoreView *)self signingInSpinner];
  [v7 setHidden:v6];

  v8 = [(CNFRegSigninLearnMoreView *)self signingInSpinner];
  objc_super v9 = v8;
  if (v6) {
    [v8 stopAnimating];
  }
  else {
    [v8 startAnimating];
  }

  [(CNFRegSigninLearnMoreView *)self setNeedsDisplay];
  v10 = (void *)MEMORY[0x263F158F8];
  [v10 commit];
}

- (id)_splashImage
{
  unint64_t serviceType = self->_serviceType;
  if (serviceType > 2) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = off_2644F1240[serviceType];
  }
  v4 = (void *)MEMORY[0x263F827E8];
  id v5 = [MEMORY[0x263F82B60] mainScreen];
  [v5 scale];
  uint64_t v6 = objc_msgSend(v4, "_applicationIconImageForBundleIdentifier:format:scale:", v3, 2);

  return v6;
}

- (UIButton)learnMoreButton
{
  learnMoreButton = self->_learnMoreButton;
  if (!learnMoreButton)
  {
    v4 = CommunicationsSetupUIBundle();
    id v5 = CNFRegStringTableName();
    uint64_t v6 = [v4 localizedStringForKey:@"FACETIME_SPLASH_LEARN_MORE" value:&stru_26D05D4F8 table:v5];
    id v7 = CNFRegGlobalAppearanceController();
    v8 = [v7 userInteractionColor];
    objc_super v9 = +[CNFRegLearnMoreButton roundedButtonWithText:v6 color:v8];
    v10 = self->_learnMoreButton;
    self->_learnMoreButton = v9;

    v11 = [(UIButton *)self->_learnMoreButton titleLabel];
    v12 = [MEMORY[0x263F81708] systemFontOfSize:17.0];
    [v11 setFont:v12];

    [(UIButton *)self->_learnMoreButton setAutoresizingMask:5];
    [(UIButton *)self->_learnMoreButton addTarget:self action:sel__learnMorePressed_ forControlEvents:64];
    [(CNFRegSigninLearnMoreView *)self addSubview:self->_learnMoreButton];
    [(CNFRegSigninLearnMoreView *)self setNeedsLayout];
    learnMoreButton = self->_learnMoreButton;
  }
  return learnMoreButton;
}

- (UIImageView)splashImageView
{
  if (!self->_splashImageView)
  {
    BOOL v3 = CNFRegGlobalAppearanceController();
    int v4 = [v3 splashScreenShowsIcon];

    if (v4)
    {
      id v5 = objc_alloc(MEMORY[0x263F82828]);
      uint64_t v6 = [(CNFRegSigninLearnMoreView *)self _splashImage];
      id v7 = (UIImageView *)[v5 initWithImage:v6];
      splashImageView = self->_splashImageView;
      self->_splashImageView = v7;

      [(UIImageView *)self->_splashImageView sizeToFit];
      [(CNFRegSigninLearnMoreView *)self addSubview:self->_splashImageView];
      [(CNFRegSigninLearnMoreView *)self setNeedsLayout];
    }
  }
  objc_super v9 = self->_splashImageView;
  return v9;
}

- (UILabel)titleLabel
{
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    id v4 = objc_alloc(MEMORY[0x263F828E0]);
    id v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    uint64_t v6 = self->_titleLabel;
    self->_titleLabel = v5;

    id v7 = [(CNFRegSigninLearnMoreView *)self _serviceTitle];
    [(UILabel *)self->_titleLabel setText:v7];

    v8 = [MEMORY[0x263F81708] _thinSystemFontOfSize:35.0];
    [(UILabel *)self->_titleLabel setFont:v8];

    objc_super v9 = CNFRegGlobalAppearanceController();
    v10 = [v9 splashTitleLabelTextColor];
    [(UILabel *)self->_titleLabel setTextColor:v10];

    [(UILabel *)self->_titleLabel setTextAlignment:1];
    v11 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)self->_titleLabel setBackgroundColor:v11];

    [(UILabel *)self->_titleLabel sizeToFit];
    [(CNFRegSigninLearnMoreView *)self addSubview:self->_titleLabel];
    [(CNFRegSigninLearnMoreView *)self setNeedsLayout];
    titleLabel = self->_titleLabel;
  }
  return titleLabel;
}

- (UILabel)verbiageLabel
{
  verbiageLabel = self->_verbiageLabel;
  if (!verbiageLabel)
  {
    id v4 = +[CNFRegAppearanceController globalAppearanceController];
    id v5 = objc_alloc(MEMORY[0x263F828E0]);
    uint64_t v6 = (UILabel *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    id v7 = self->_verbiageLabel;
    self->_verbiageLabel = v6;

    v8 = [MEMORY[0x263F3BB18] sharedInstance];
    int v9 = [v8 supportsWLAN];
    int v10 = _os_feature_enabled_impl();
    v11 = CNFRegStringTableName();
    v12 = CommunicationsSetupUIBundle();
    v13 = @"FACETIME_SPLASH_SYNOPSIS_WLAN";
    if (v10) {
      v13 = @"FACETIME_SPLASH_SYNOPSIS_WLAN_APPLEACCOUNT";
    }
    v14 = @"FACETIME_SPLASH_SYNOPSIS_WIFI_APPLEACCOUNT";
    if (!v10) {
      v14 = @"FACETIME_SPLASH_SYNOPSIS_WIFI";
    }
    if (v9) {
      v15 = v13;
    }
    else {
      v15 = v14;
    }
    v16 = CNFLocalizedStringFromTableInBundleWithFallback(v15, v11, v12);
    [(UILabel *)self->_verbiageLabel setText:v16];

    v17 = [v4 tableFooterFont];
    [(UILabel *)self->_verbiageLabel setFont:v17];

    v18 = [v4 tableHeaderTextColor];
    [(UILabel *)self->_verbiageLabel setTextColor:v18];

    [(UILabel *)self->_verbiageLabel setNumberOfLines:0];
    [(UILabel *)self->_verbiageLabel setLineBreakMode:0];
    [(UILabel *)self->_verbiageLabel setTextAlignment:1];
    v19 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)self->_verbiageLabel setBackgroundColor:v19];

    v20 = [v4 tableHeaderTextShadowColor];
    [(UILabel *)self->_verbiageLabel setShadowColor:v20];

    [v4 tableHeaderTextShadowOffset];
    -[UILabel setShadowOffset:](self->_verbiageLabel, "setShadowOffset:");
    [(UILabel *)self->_verbiageLabel setAutoresizingMask:18];
    [(CNFRegSigninLearnMoreView *)self addSubview:self->_verbiageLabel];
    [(CNFRegSigninLearnMoreView *)self setNeedsLayout];

    verbiageLabel = self->_verbiageLabel;
  }
  return verbiageLabel;
}

- (id)signingInLabel
{
  signingInLabel = self->_signingInLabel;
  if (!signingInLabel)
  {
    id v4 = +[CNFRegAppearanceController globalAppearanceController];
    id v5 = objc_alloc(MEMORY[0x263F828E0]);
    uint64_t v6 = (UILabel *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    id v7 = self->_signingInLabel;
    self->_signingInLabel = v6;

    v8 = CommunicationsSetupUIBundle();
    int v9 = CNFRegStringTableName();
    int v10 = [v8 localizedStringForKey:@"SIGNING_IN" value:&stru_26D05D4F8 table:v9];
    [(UILabel *)self->_signingInLabel setText:v10];

    v11 = [v4 tableFooterFont];
    [(UILabel *)self->_signingInLabel setFont:v11];

    v12 = [v4 tableHeaderTextColor];
    [(UILabel *)self->_signingInLabel setTextColor:v12];

    [(UILabel *)self->_signingInLabel setNumberOfLines:0];
    [(UILabel *)self->_signingInLabel setLineBreakMode:0];
    [(UILabel *)self->_signingInLabel setTextAlignment:1];
    v13 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)self->_signingInLabel setBackgroundColor:v13];

    v14 = [v4 tableHeaderTextShadowColor];
    [(UILabel *)self->_signingInLabel setShadowColor:v14];

    [v4 tableHeaderTextShadowOffset];
    -[UILabel setShadowOffset:](self->_signingInLabel, "setShadowOffset:");
    [(UILabel *)self->_signingInLabel setAutoresizingMask:18];
    [(UILabel *)self->_signingInLabel setHidden:1];
    [(CNFRegSigninLearnMoreView *)self addSubview:self->_signingInLabel];
    [(CNFRegSigninLearnMoreView *)self setNeedsLayout];

    signingInLabel = self->_signingInLabel;
  }
  return signingInLabel;
}

- (id)signingInSpinner
{
  signingInSpinner = self->_signingInSpinner;
  if (!signingInSpinner)
  {
    id v4 = +[CNFRegAppearanceController globalAppearanceController];
    id v5 = objc_alloc(MEMORY[0x263F823E8]);
    uint64_t v6 = (UIActivityIndicatorView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    id v7 = self->_signingInSpinner;
    self->_signingInSpinner = v6;

    v8 = [v4 tableHeaderTextColor];
    [(UIActivityIndicatorView *)self->_signingInSpinner setColor:v8];

    [(UIActivityIndicatorView *)self->_signingInSpinner setHidden:1];
    [(CNFRegSigninLearnMoreView *)self addSubview:self->_signingInSpinner];
    [(CNFRegSigninLearnMoreView *)self setNeedsLayout];

    signingInSpinner = self->_signingInSpinner;
  }
  return signingInSpinner;
}

- (void)setServiceType:(int64_t)a3
{
  if (self->_serviceType != a3)
  {
    self->_unint64_t serviceType = a3;
    id v4 = [(CNFRegSigninLearnMoreView *)self splashImageView];
    id v5 = [(CNFRegSigninLearnMoreView *)self _splashImage];
    [v4 setImage:v5];

    uint64_t v6 = [(CNFRegSigninLearnMoreView *)self _serviceTitle];
    [(UILabel *)self->_titleLabel setText:v6];

    [(CNFRegSigninLearnMoreView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  [(CNFRegSigninLearnMoreView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  CGFloat v91 = v9;
  id v92 = [(CNFRegSigninLearnMoreView *)self splashImageView];
  [v92 bounds];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v94.origin.x = v4;
  v94.origin.y = v6;
  v94.size.width = v8;
  v94.size.height = v10;
  double MidX = CGRectGetMidX(v94);
  v95.origin.x = v12;
  v95.origin.y = v14;
  v95.size.width = v16;
  v95.size.height = v18;
  CGFloat v20 = floor(MidX - CGRectGetWidth(v95) * 0.5);
  objc_msgSend(v92, "setFrame:", v20, 48.0, v16, v18);
  v96.origin.x = v20;
  v96.origin.y = 48.0;
  v96.size.width = v16;
  v96.size.height = v18;
  CGFloat v21 = CGRectGetMaxY(v96) + 44.0;
  v22 = [(CNFRegSigninLearnMoreView *)self titleLabel];
  [v22 frame];
  double v24 = v23;
  double v26 = v25;
  v97.origin.x = v4;
  v97.origin.y = v6;
  v97.size.width = v8;
  v97.size.height = v91;
  CGFloat v27 = floor(CGRectGetMidX(v97) - v24 * 0.5);
  v28 = [v22 font];
  [v28 ascender];
  CGFloat v30 = floor(v21 - v29);

  objc_msgSend(v22, "setFrame:", v27, v30, v24, v26);
  v98.origin.x = v27;
  v98.origin.y = v30;
  v98.size.width = v24;
  v98.size.height = v26;
  double MaxY = CGRectGetMaxY(v98);
  v32 = [v22 font];
  [v32 descender];
  double v34 = MaxY + v33 + 43.0;

  v35 = [(CNFRegSigninLearnMoreView *)self verbiageLabel];
  v99.origin.x = v4;
  v99.origin.y = v6;
  v99.size.width = v8;
  v99.size.height = v91;
  objc_msgSend(v35, "sizeThatFits:", CGRectGetWidth(v99) + -20.0, 1.79769313e308);
  double v37 = v36;
  double v39 = v38;
  v100.origin.x = v4;
  v100.origin.y = v6;
  v100.size.width = v8;
  v100.size.height = v91;
  CGFloat v40 = floor(CGRectGetMidX(v100) - v37 * 0.5);
  [v35 numberOfLines];
  v41 = [v35 font];
  [v41 ascender];
  v42 = [v35 font];
  [v42 descender];
  v43 = [v35 font];
  [v43 leading];

  v44 = [v35 font];
  [v44 ascender];
  CGFloat v46 = floor(v34 - v45);

  objc_msgSend(v35, "setFrame:", v40, v46, v37, v39);
  v101.origin.x = v40;
  v101.origin.y = v46;
  v101.size.width = v37;
  v101.size.height = v39;
  double v47 = CGRectGetMaxY(v101);
  v48 = [v35 font];
  [v48 descender];
  double v50 = v49;

  v51 = [(CNFRegSigninLearnMoreView *)self learnMoreButton];
  [v51 sizeToFit];
  [v51 bounds];
  CGFloat v54 = v53;
  CGFloat v56 = v55;
  double v58 = v57;
  CGFloat v59 = v8;
  CGFloat v90 = v8;
  if (v52 <= v8) {
    double v8 = v52;
  }
  double v60 = v47 + v50 + 24.0;
  v102.origin.x = v4;
  v102.origin.y = v6;
  v102.size.width = v59;
  v102.size.height = v91;
  double v61 = CGRectGetMidX(v102);
  v103.origin.x = v54;
  v103.origin.y = v56;
  v103.size.width = v8;
  v103.size.height = v58;
  CGFloat v62 = floor(v61 - CGRectGetWidth(v103) * 0.5);
  v63 = [v51 titleLabel];
  v64 = [v63 font];
  [v64 ascender];
  CGFloat v66 = floor(v60 - v65);

  objc_msgSend(v51, "setFrame:", v62, v66, v8, v58);
  v104.origin.x = v62;
  v104.origin.y = v66;
  v104.size.width = v8;
  v104.size.height = v58;
  double v67 = CGRectGetMaxY(v104);
  v68 = [v51 titleLabel];
  v69 = [v68 font];
  [v69 descender];
  double v71 = ceil(v67 + v70 + 40.0);

  [(UIView *)self->_authKitSignInView sizeToFit];
  [(CNFRegSigninLearnMoreView *)self frame];
  double v73 = v72;
  v105.origin.x = v4;
  v105.size.width = v90;
  v105.origin.y = v6;
  v105.size.height = v91;
  -[UIView setFrame:](self->_authKitSignInView, "setFrame:", 0.0, v71, v73, CGRectGetHeight(v105) - v71);
  [(UIView *)self->_authKitSignInView setTranslatesAutoresizingMaskIntoConstraints:1];
  v74 = [(CNFRegSigninLearnMoreView *)self signingInLabel];
  [v74 sizeToFit];

  v75 = [(CNFRegSigninLearnMoreView *)self signingInLabel];
  [v75 frame];
  double v77 = v76;
  double v79 = v78;

  [(CNFRegSigninLearnMoreView *)self frame];
  double v81 = v80 * 0.5 - v77 * 0.5;
  v82 = [(CNFRegSigninLearnMoreView *)self signingInLabel];
  objc_msgSend(v82, "setFrame:", v81, v71, v77, v79);

  v83 = [(CNFRegSigninLearnMoreView *)self signingInSpinner];
  [v83 sizeToFit];

  v84 = [(CNFRegSigninLearnMoreView *)self signingInSpinner];
  [v84 frame];
  double v86 = v85;
  double v88 = v87;

  v89 = [(CNFRegSigninLearnMoreView *)self signingInSpinner];
  objc_msgSend(v89, "setFrame:", v81 - v86 + -6.0, v71, v86, v88);
}

- (double)preferredHeightForWidth:(double)a3
{
  if (a3 == 0.0) {
    a3 = 320.0;
  }
  double v4 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (a3 >= 20.0) {
    double v5 = a3 + -20.0;
  }
  else {
    double v5 = 0.0;
  }
  CGFloat v6 = [(CNFRegSigninLearnMoreView *)self splashImageView];
  [v6 size];
  double v8 = v4 + v7 + 92.0;
  double v9 = [(CNFRegSigninLearnMoreView *)self titleLabel];
  uint64_t v10 = [v9 text];
  if (v10)
  {
    double v11 = (void *)v10;
    CGFloat v12 = [v9 text];
    uint64_t v13 = [v12 length];

    if (v13)
    {
      objc_msgSend(v9, "sizeThatFits:", v5, 1.79769313e308);
      double v8 = v8 + v14 + 43.0;
    }
  }
  double v15 = [(CNFRegSigninLearnMoreView *)self verbiageLabel];
  uint64_t v16 = [v15 text];
  if (v16)
  {
    double v17 = (void *)v16;
    double v18 = [v15 text];
    uint64_t v19 = [v18 length];

    if (v19)
    {
      objc_msgSend(v15, "sizeThatFits:", v5, 1.79769313e308);
      double v8 = v8 + v20 + 24.0;
    }
  }
  CGFloat v21 = [(CNFRegSigninLearnMoreView *)self learnMoreButton];
  [v21 frame];
  double v23 = v8 + v22 + 40.0;

  [(UIView *)self->_authKitSignInView frame];
  double v25 = v23 + v24;

  return v25;
}

- (void)_learnMorePressed:(id)a3
{
  double v3 = (void *)*MEMORY[0x263F83300];
  CNFRegLocalizedSplashScreenURL();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 openURL:v4 withCompletionHandler:0];
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (CNFRegSplashSignInController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  self->_controller = (CNFRegSplashSignInController *)a3;
}

- (void)setSplashImageView:(id)a3
{
}

- (void)setTitleLabel:(id)a3
{
}

- (void)setVerbiageLabel:(id)a3
{
}

- (void)setLearnMoreButton:(id)a3
{
}

- (UIView)authKitSignInView
{
  return self->_authKitSignInView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authKitSignInView, 0);
  objc_storeStrong((id *)&self->_learnMoreButton, 0);
  objc_storeStrong((id *)&self->_verbiageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_splashImageView, 0);
  objc_storeStrong((id *)&self->_signingInSpinner, 0);
  objc_storeStrong((id *)&self->_signingInLabel, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
}

@end