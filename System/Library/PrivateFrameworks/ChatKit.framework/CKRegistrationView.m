@interface CKRegistrationView
- (CGSize)manualSizeToFitForAuthKitSignInView;
- (UIActivityIndicatorView)signingInSpinner;
- (UIButton)learnMoreButton;
- (UIImageView)iconImageView;
- (UILabel)signingInLabel;
- (UILabel)titleLabel;
- (UILabel)verbiageLabel;
- (UIView)authKitSignInView;
- (UIView)privacyLinkView;
- (void)_learnMorePressed:(id)a3;
- (void)layoutSubviews;
- (void)setAuthKitSignInView:(id)a3;
- (void)setIconImageView:(id)a3;
- (void)setLearnMoreButton:(id)a3;
- (void)setPrivacyLinkView:(id)a3;
- (void)setSigningIn:(BOOL)a3;
- (void)setSigningInLabel:(id)a3;
- (void)setSigningInSpinner:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setVerbiageLabel:(id)a3;
@end

@implementation CKRegistrationView

- (void)setAuthKitSignInView:(id)a3
{
  v5 = (UIView *)a3;
  p_authKitSignInView = (id *)&self->_authKitSignInView;
  authKitSignInView = self->_authKitSignInView;
  if (authKitSignInView != v5)
  {
    v10 = v5;
    [(UIView *)authKitSignInView removeFromSuperview];
    objc_storeStrong((id *)&self->_authKitSignInView, a3);
    id v8 = *p_authKitSignInView;
    v9 = [MEMORY[0x1E4F428B8] clearColor];
    [v8 setBackgroundColor:v9];

    [*p_authKitSignInView setTranslatesAutoresizingMaskIntoConstraints:1];
    [(CKRegistrationView *)self addSubview:*p_authKitSignInView];
    v5 = v10;
  }
}

- (void)setSigningIn:(BOOL)a3
{
  BOOL v3 = a3;
  -[UIView setHidden:](self->_authKitSignInView, "setHidden:");
  v5 = [(CKRegistrationView *)self signingInLabel];
  BOOL v6 = !v3;
  [v5 setHidden:v6];

  v7 = [(CKRegistrationView *)self signingInSpinner];
  [v7 setHidden:v6];

  id v8 = [(CKRegistrationView *)self signingInSpinner];
  v9 = v8;
  if (v6) {
    [v8 stopAnimating];
  }
  else {
    [v8 startAnimating];
  }

  [(CKRegistrationView *)self setNeedsDisplay];
}

- (void)setPrivacyLinkView:(id)a3
{
  v4 = (UIView *)a3;
  [(UIView *)self->_privacyLinkView removeFromSuperview];
  privacyLinkView = self->_privacyLinkView;
  self->_privacyLinkView = v4;
  BOOL v6 = v4;

  [(UIView *)self->_privacyLinkView setTranslatesAutoresizingMaskIntoConstraints:1];
  [(CKRegistrationView *)self addSubview:self->_privacyLinkView];
}

- (UIImageView)iconImageView
{
  iconImageView = self->_iconImageView;
  if (!iconImageView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42AA0]);
    v5 = +[CKUIBehavior sharedBehaviors];
    BOOL v6 = [v5 signInAppIconImage];
    v7 = (UIImageView *)[v4 initWithImage:v6];
    id v8 = self->_iconImageView;
    self->_iconImageView = v7;

    v9 = +[CKUIBehavior sharedBehaviors];
    [v9 signInSplashImageSize];
    double v11 = v10;
    double v13 = v12;

    v14 = self->_iconImageView;
    if (v11 == *MEMORY[0x1E4F1DB30] && v13 == *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
      [(UIImageView *)v14 sizeToFit];
    }
    else {
      -[UIImageView setFrame:](v14, "setFrame:", 0.0, 0.0, v11, v13);
    }
    [(CKRegistrationView *)self addSubview:self->_iconImageView];
    [(CKRegistrationView *)self setNeedsLayout];
    iconImageView = self->_iconImageView;
  }

  return iconImageView;
}

- (UILabel)titleLabel
{
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42B38]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    BOOL v6 = self->_titleLabel;
    self->_titleLabel = v5;

    v7 = CKFrameworkBundle();
    id v8 = [v7 localizedStringForKey:@"MADRID" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [(UILabel *)self->_titleLabel setText:v8];

    v9 = +[CKUIBehavior sharedBehaviors];
    double v10 = [v9 signInTitleFont];
    [(UILabel *)self->_titleLabel setFont:v10];

    double v11 = +[CKUIBehavior sharedBehaviors];
    double v12 = [v11 theme];
    double v13 = [v12 primaryLabelColor];
    [(UILabel *)self->_titleLabel setTextColor:v13];

    [(UILabel *)self->_titleLabel setTextAlignment:1];
    v14 = [MEMORY[0x1E4F428B8] clearColor];
    [(UILabel *)self->_titleLabel setBackgroundColor:v14];

    [(UILabel *)self->_titleLabel sizeToFit];
    [(CKRegistrationView *)self addSubview:self->_titleLabel];
    [(CKRegistrationView *)self setNeedsLayout];
    titleLabel = self->_titleLabel;
  }

  return titleLabel;
}

- (UILabel)verbiageLabel
{
  verbiageLabel = self->_verbiageLabel;
  if (!verbiageLabel)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42B38]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    BOOL v6 = self->_verbiageLabel;
    self->_verbiageLabel = v5;

    int v7 = MGGetBoolAnswer();
    id v8 = CKFrameworkBundle();
    v9 = v8;
    if (v7) {
      double v10 = @"IMESSAGE_REGISTRATION_BLURB_GREENTEA";
    }
    else {
      double v10 = @"IMESSAGE_REGISTRATION_BLURB";
    }
    double v11 = [v8 localizedStringForKey:v10 value:&stru_1EDE4CA38 table:@"ChatKit"];
    [(UILabel *)self->_verbiageLabel setText:v11];

    double v12 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F43870]];
    double v13 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v12 size:0.0];
    [(UILabel *)self->_verbiageLabel setFont:v13];

    v14 = +[CKUIBehavior sharedBehaviors];
    v15 = [v14 theme];
    v16 = [v15 primaryLabelColor];
    [(UILabel *)self->_verbiageLabel setTextColor:v16];

    [(UILabel *)self->_verbiageLabel setNumberOfLines:0];
    [(UILabel *)self->_verbiageLabel setLineBreakMode:0];
    [(UILabel *)self->_verbiageLabel setTextAlignment:1];
    v17 = [MEMORY[0x1E4F428B8] clearColor];
    [(UILabel *)self->_verbiageLabel setBackgroundColor:v17];

    [(UILabel *)self->_verbiageLabel setAutoresizingMask:18];
    [(UILabel *)self->_verbiageLabel sizeToFit];
    [(CKRegistrationView *)self addSubview:self->_verbiageLabel];
    [(CKRegistrationView *)self setNeedsLayout];

    verbiageLabel = self->_verbiageLabel;
  }

  return verbiageLabel;
}

- (UILabel)signingInLabel
{
  signingInLabel = self->_signingInLabel;
  if (!signingInLabel)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42B38]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    BOOL v6 = self->_signingInLabel;
    self->_signingInLabel = v5;

    int v7 = CKFrameworkBundle();
    id v8 = [v7 localizedStringForKey:@"IMESSAGE_REGISTRATION_SIGNING_IN" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [(UILabel *)self->_signingInLabel setText:v8];

    v9 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0];
    [(UILabel *)self->_signingInLabel setFont:v9];

    double v10 = +[CKUIBehavior sharedBehaviors];
    double v11 = [v10 theme];
    double v12 = [v11 primaryLabelColor];
    [(UILabel *)self->_signingInLabel setTextColor:v12];

    [(UILabel *)self->_signingInLabel setNumberOfLines:0];
    [(UILabel *)self->_signingInLabel setLineBreakMode:0];
    [(UILabel *)self->_signingInLabel setTextAlignment:1];
    double v13 = [MEMORY[0x1E4F428B8] clearColor];
    [(UILabel *)self->_signingInLabel setBackgroundColor:v13];

    [(UILabel *)self->_signingInLabel setAutoresizingMask:18];
    [(UILabel *)self->_signingInLabel setHidden:1];
    [(CKRegistrationView *)self addSubview:self->_signingInLabel];
    [(CKRegistrationView *)self setNeedsLayout];
    signingInLabel = self->_signingInLabel;
  }

  return signingInLabel;
}

- (UIActivityIndicatorView)signingInSpinner
{
  signingInSpinner = self->_signingInSpinner;
  if (!signingInSpinner)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42708]);
    v5 = (UIActivityIndicatorView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    BOOL v6 = self->_signingInSpinner;
    self->_signingInSpinner = v5;

    int v7 = +[CKUIBehavior sharedBehaviors];
    id v8 = [v7 signInActivityIndicatorColor];
    [(UIActivityIndicatorView *)self->_signingInSpinner setColor:v8];

    [(UIActivityIndicatorView *)self->_signingInSpinner setHidden:1];
    [(CKRegistrationView *)self addSubview:self->_signingInSpinner];
    [(CKRegistrationView *)self setNeedsLayout];
    signingInSpinner = self->_signingInSpinner;
  }

  return signingInSpinner;
}

- (UIButton)learnMoreButton
{
  learnMoreButton = self->_learnMoreButton;
  if (!learnMoreButton)
  {
    id v4 = [MEMORY[0x1E4F427E0] buttonWithType:1];
    v5 = self->_learnMoreButton;
    self->_learnMoreButton = v4;

    BOOL v6 = self->_learnMoreButton;
    int v7 = CKFrameworkBundle();
    id v8 = [v7 localizedStringForKey:@"IMESSAGE_REGISTRATION_LEARN_MORE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [(UIButton *)v6 setTitle:v8 forState:0];

    v9 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F43870]];
    double v10 = [(UIButton *)self->_learnMoreButton titleLabel];
    double v11 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v9 size:0.0];
    [v10 setFont:v11];

    double v12 = +[CKUIBehavior sharedBehaviors];
    double v13 = [v12 signInTintColor];

    if (v13) {
      [(UIButton *)self->_learnMoreButton setTitleColor:v13 forState:0];
    }
    [(UIButton *)self->_learnMoreButton setAutoresizingMask:5];
    [(UIButton *)self->_learnMoreButton addTarget:self action:sel__learnMorePressed_ forControlEvents:64];
    [(CKRegistrationView *)self addSubview:self->_learnMoreButton];
    [(CKRegistrationView *)self setNeedsLayout];

    learnMoreButton = self->_learnMoreButton;
  }

  return learnMoreButton;
}

- (CGSize)manualSizeToFitForAuthKitSignInView
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v2 = [(UIView *)self->_authKitSignInView subviews];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    double v6 = 0.0;
    double v7 = 2147483650.0;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        double v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        [v10 frame];
        double MaxX = CGRectGetMaxX(v25);
        [v10 frame];
        double v12 = MaxX - CGRectGetWidth(v26);
        [v10 frame];
        double v13 = v12 + v12 + CGRectGetWidth(v27);
        [v10 frame];
        double MaxY = CGRectGetMaxY(v28);
        [v10 frame];
        double MinY = CGRectGetMinY(v29);
        if (v7 >= MinY) {
          double v7 = MinY;
        }
        if (v8 <= v13) {
          double v8 = v13;
        }
        if (v6 <= MaxY) {
          double v6 = MaxY;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
    double v7 = 2147483650.0;
    double v8 = 0.0;
  }

  double v16 = v7 + v7 + v6;
  double v17 = v8;
  result.height = v16;
  result.width = v17;
  return result;
}

- (void)layoutSubviews
{
  [(CKRegistrationView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v98 = v3;
  CGFloat v99 = v5;
  CGFloat v6 = v5;
  double v96 = v7;
  CGFloat v9 = v8;
  CGFloat rect = v8;
  double v10 = +[CKUIBehavior sharedBehaviors];
  [v10 signInSplashImageTopPadding];
  double v12 = v11;

  id v97 = [(CKRegistrationView *)self iconImageView];
  [v97 bounds];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  double v18 = v17;
  double v20 = v19;
  v102.origin.x = v4;
  v102.origin.y = v6;
  v102.size.width = v96;
  v102.size.height = v9;
  double MidX = CGRectGetMidX(v102);
  v103.origin.x = v14;
  v103.origin.y = v16;
  v103.size.width = v18;
  v103.size.height = v20;
  CGFloat v22 = floor(MidX - CGRectGetWidth(v103) * 0.5);
  objc_msgSend(v97, "setFrame:", v22, v12, v18, v20);
  v104.origin.x = v22;
  v104.origin.y = v12;
  v104.size.width = v18;
  v104.size.height = v20;
  double MaxY = CGRectGetMaxY(v104);
  v24 = +[CKUIBehavior sharedBehaviors];
  [v24 signInSplashImageBottomPadding];
  CGFloat v26 = MaxY + v25;

  CGRect v27 = [(CKRegistrationView *)self titleLabel];
  [v27 frame];
  double v29 = v28;
  double v31 = v30;
  v105.origin.x = v98;
  v105.origin.y = v99;
  v105.size.width = v96;
  v105.size.height = rect;
  CGFloat v32 = floor(CGRectGetMidX(v105) - v29 * 0.5);
  objc_msgSend(v27, "setFrame:", v32, v26, v29, v31);
  v106.origin.x = v32;
  v106.origin.y = v26;
  v106.size.width = v29;
  v106.size.height = v31;
  double v33 = CGRectGetMaxY(v106);
  v34 = +[CKUIBehavior sharedBehaviors];
  [v34 signInTitleBottomPadding];
  CGFloat v36 = v33 + v35;

  v37 = [(CKRegistrationView *)self verbiageLabel];
  v107.origin.x = v98;
  v107.origin.y = v99;
  v107.size.width = v96;
  v107.size.height = rect;
  objc_msgSend(v37, "sizeThatFits:", CGRectGetWidth(v107) + -20.0, 1.79769313e308);
  double v39 = v38;
  double v41 = v40;
  v108.origin.x = v98;
  v108.origin.y = v99;
  v108.size.width = v96;
  v108.size.height = rect;
  CGFloat v42 = floor(CGRectGetMidX(v108) - v39 * 0.5);
  objc_msgSend(v37, "setFrame:", v42, v36, v39, v41);
  v109.origin.x = v42;
  v109.origin.y = v36;
  v109.size.width = v39;
  v109.size.height = v41;
  double v43 = CGRectGetMaxY(v109) + 0.0;
  v44 = [(CKRegistrationView *)self learnMoreButton];
  [v44 sizeToFit];
  [v44 bounds];
  CGFloat v47 = v46;
  CGFloat v49 = v48;
  double v51 = v50;
  if (v45 <= v96) {
    double v52 = v45;
  }
  else {
    double v52 = v96;
  }
  v110.origin.x = v98;
  v110.origin.y = v99;
  v110.size.width = v96;
  v110.size.height = rect;
  double v53 = CGRectGetMidX(v110);
  v111.origin.x = v47;
  v111.origin.y = v49;
  v111.size.width = v52;
  v111.size.height = v51;
  CGFloat v54 = floor(v53 - CGRectGetWidth(v111) * 0.5);
  objc_msgSend(v44, "setFrame:", v54, v43, v52, v51);
  v112.origin.x = v54;
  v112.origin.y = v43;
  v112.size.width = v52;
  v112.size.height = v51;
  double v55 = ceil(CGRectGetMaxY(v112) + 5.0);
  [(UIView *)self->_authKitSignInView origin];
  CGFloat v57 = v56;
  CGFloat v59 = v58;
  [(CKRegistrationView *)self manualSizeToFitForAuthKitSignInView];
  double v62 = v61;
  double v63 = v96;
  if (v60 <= v96) {
    double v64 = v60;
  }
  else {
    double v64 = v96;
  }
  CGFloat v65 = v98;
  CGFloat v66 = v99;
  CGFloat v67 = rect;
  double v68 = CGRectGetMidX(*(CGRect *)(&v63 - 2));
  v113.origin.x = v57;
  v113.origin.y = v59;
  v113.size.width = v64;
  v113.size.height = v62;
  CGFloat v69 = floor(v68 - CGRectGetWidth(v113) * 0.5);
  -[UIView setFrame:](self->_authKitSignInView, "setFrame:", v69, v55, v64, v62);
  v70 = [(CKRegistrationView *)self signingInLabel];
  [v70 sizeToFit];

  v71 = [(CKRegistrationView *)self signingInLabel];
  [v71 frame];
  double v73 = v72;
  double v75 = v74;

  [(CKRegistrationView *)self frame];
  double v77 = v76 * 0.5 - v73 * 0.5;
  v78 = [(CKRegistrationView *)self signingInLabel];
  objc_msgSend(v78, "setFrame:", v77, v55, v73, v75);

  v79 = [(CKRegistrationView *)self signingInSpinner];
  [v79 sizeToFit];

  v80 = [(CKRegistrationView *)self signingInSpinner];
  [v80 frame];
  double v82 = v81;
  double v84 = v83;

  v85 = [(CKRegistrationView *)self signingInSpinner];
  objc_msgSend(v85, "setFrame:", v77 - v82 + -6.0, v55, v82, v84);

  v114.origin.x = v69;
  v114.origin.y = v55;
  v114.size.width = v64;
  v114.size.height = v62;
  CGFloat v86 = ceil(CGRectGetMaxY(v114));
  v87 = [(CKRegistrationView *)self privacyLinkView];
  v88 = +[CKUIBehavior sharedBehaviors];
  [v88 signInPrivacyWidthMultiplier];
  CGFloat v90 = v96 * v89;

  LODWORD(v91) = 1112014848;
  LODWORD(v92) = 1132068864;
  objc_msgSend(v87, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v90, 0.0, v91, v92);
  double v94 = v93;
  v115.origin.x = v98;
  v115.origin.y = v99;
  v115.size.width = v96;
  v115.size.height = rect;
  CGFloat v95 = floor(CGRectGetMidX(v115) - v90 * 0.5);
  objc_msgSend(v87, "setFrame:", v95, v86, v90, v94);
  v116.origin.x = v95;
  v116.origin.y = v86;
  v116.size.width = v90;
  v116.size.height = v94;
  -[CKRegistrationView setContentSize:](self, "setContentSize:", v96, ceil(CGRectGetMaxY(v116) + 20.0));
}

- (void)_learnMorePressed:(id)a3
{
  double v3 = (void (*)(uint64_t))MEMORY[0x192FBA870]("CNFRegSetStringTableForServiceType", @"CommunicationsSetupUI", a3);
  v3(1);
  CGFloat v4 = (void (*)(void))MEMORY[0x192FBA870]("CNFRegLocalizedSplashScreenURL", @"CommunicationsSetupUI");
  double v5 = (void *)*MEMORY[0x1E4F43630];
  v4();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 openURL:v6];
}

- (void)setIconImageView:(id)a3
{
}

- (void)setTitleLabel:(id)a3
{
}

- (void)setVerbiageLabel:(id)a3
{
}

- (void)setSigningInLabel:(id)a3
{
}

- (void)setSigningInSpinner:(id)a3
{
}

- (void)setLearnMoreButton:(id)a3
{
}

- (UIView)authKitSignInView
{
  return self->_authKitSignInView;
}

- (UIView)privacyLinkView
{
  return self->_privacyLinkView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyLinkView, 0);
  objc_storeStrong((id *)&self->_authKitSignInView, 0);
  objc_storeStrong((id *)&self->_learnMoreButton, 0);
  objc_storeStrong((id *)&self->_signingInSpinner, 0);
  objc_storeStrong((id *)&self->_signingInLabel, 0);
  objc_storeStrong((id *)&self->_verbiageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end