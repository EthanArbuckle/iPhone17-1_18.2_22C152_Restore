@interface HLPHelpLoadingView
- (BOOL)supportsDarkMode;
- (HLPHelpLoadingView)initWithFrame:(CGRect)a3;
- (HLPHelpLoadingViewDelegate)delegate;
- (UIActivityIndicatorView)activityIndicatorView;
- (UILabel)errorMessageLabel;
- (UILabel)errorTitleLabel;
- (void)removeErrorView;
- (void)setActivityIndicatorView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setErrorMessageLabel:(id)a3;
- (void)setErrorTitleLabel:(id)a3;
- (void)setSupportsDarkMode:(BOOL)a3;
- (void)showActivityIndicator:(BOOL)a3;
- (void)showDefaultErrorMessage;
- (void)showErrorWithTitle:(id)a3 message:(id)a4;
- (void)showHelpBookInfo;
- (void)showNoConnectionErrorMessage;
- (void)updateBackgroundColor;
@end

@implementation HLPHelpLoadingView

- (HLPHelpLoadingView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HLPHelpLoadingView;
  v3 = -[HLPHelpLoadingView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(HLPHelpLoadingView *)v3 updateBackgroundColor];
    [(HLPHelpLoadingView *)v4 setUserInteractionEnabled:1];
  }
  return v4;
}

- (void)setSupportsDarkMode:(BOOL)a3
{
  if (self->_supportsDarkMode != a3)
  {
    self->_supportsDarkMode = a3;
    [(HLPHelpLoadingView *)self updateBackgroundColor];
  }
}

- (void)updateBackgroundColor
{
  if (+[HLPCommonDefines isVisionOS])
  {
    uint64_t v3 = [MEMORY[0x263F1C550] secondarySystemBackgroundColor];
  }
  else
  {
    if (self->_supportsDarkMode) {
      [MEMORY[0x263F1C550] systemBackgroundColor];
    }
    else {
    uint64_t v3 = [MEMORY[0x263F1C550] whiteColor];
    }
  }
  id v4 = (id)v3;
  [(HLPHelpLoadingView *)self setBackgroundColor:v3];
}

- (void)showActivityIndicator:(BOOL)a3
{
  if (a3)
  {
    [(HLPHelpLoadingView *)self setHidden:0];
    [(HLPHelpLoadingView *)self removeErrorView];
    activityIndicatorView = self->_activityIndicatorView;
    if (!activityIndicatorView)
    {
      v5 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
      objc_super v6 = self->_activityIndicatorView;
      self->_activityIndicatorView = v5;

      [(UIActivityIndicatorView *)self->_activityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIActivityIndicatorView *)self->_activityIndicatorView sizeToFit];
      [(HLPHelpLoadingView *)self addSubview:self->_activityIndicatorView];
      v7 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
      v8 = [MEMORY[0x263F08938] constraintWithItem:self->_activityIndicatorView attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
      [v7 addObject:v8];

      v9 = [MEMORY[0x263F08938] constraintWithItem:self->_activityIndicatorView attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];
      [v7 addObject:v9];

      [(HLPHelpLoadingView *)self addConstraints:v7];
      activityIndicatorView = self->_activityIndicatorView;
    }
    [(UIActivityIndicatorView *)activityIndicatorView startAnimating];
  }
  else
  {
    [(HLPHelpLoadingView *)self setHidden:1];
    [(UIActivityIndicatorView *)self->_activityIndicatorView removeFromSuperview];
    v10 = self->_activityIndicatorView;
    self->_activityIndicatorView = 0;
  }
}

- (void)removeErrorView
{
}

- (void)showNoConnectionErrorMessage
{
  id v6 = [MEMORY[0x263F086E0] HLPBundle];
  uint64_t v3 = [v6 localizedStringForKey:@"No Internet connection." value:&stru_26D29FC58 table:0];
  id v4 = [MEMORY[0x263F086E0] HLPBundle];
  v5 = [v4 localizedStringForKey:@"Try again later." value:&stru_26D29FC58 table:0];
  [(HLPHelpLoadingView *)self showErrorWithTitle:v3 message:v5];
}

- (void)showDefaultErrorMessage
{
  id v6 = [MEMORY[0x263F086E0] HLPBundle];
  uint64_t v3 = [v6 localizedStringForKey:@"Can’t Open Help." value:&stru_26D29FC58 table:0];
  id v4 = [MEMORY[0x263F086E0] HLPBundle];
  v5 = [v4 localizedStringForKey:@"Try again later." value:&stru_26D29FC58 table:0];
  [(HLPHelpLoadingView *)self showErrorWithTitle:v3 message:v5];
}

- (void)showErrorWithTitle:(id)a3 message:(id)a4
{
  id v76 = a3;
  id v6 = a4;
  [(HLPHelpLoadingView *)self showActivityIndicator:0];
  [(HLPHelpLoadingView *)self setHidden:0];
  id v7 = v76;
  errorImageView = self->_errorImageView;
  if (v76 && v6)
  {
    if (!errorImageView || (v9 = self->_errorTitleLabel) == 0 || !self->_errorMessageLabel)
    {
      id v10 = objc_alloc_init(MEMORY[0x263F1CB60]);
      [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(HLPHelpLoadingView *)self addSubview:v10];
      v11 = (void *)MEMORY[0x263F1C6B0];
      v12 = [MEMORY[0x263F086E0] HLPBundle];
      v13 = [v11 imageNamed:@"HLPHelpBook" inBundle:v12 compatibleWithTraitCollection:0];

      BOOL v14 = +[HLPCommonDefines isVisionOS];
      if (v14)
      {
        uint64_t v15 = [v13 imageWithRenderingMode:2];

        v13 = (void *)v15;
      }
      v75 = v13;
      v16 = (UIImageView *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v13];
      v17 = self->_errorImageView;
      self->_errorImageView = v16;

      [(UIImageView *)self->_errorImageView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIImageView *)self->_errorImageView sizeToFit];
      [(UIImageView *)self->_errorImageView setUserInteractionEnabled:1];
      v18 = (void *)[objc_alloc(MEMORY[0x263F1C7A0]) initWithTarget:self action:sel_showHelpBookInfo];
      [v18 setNumberOfTouchesRequired:1];
      [v18 setMinimumPressDuration:5.0];
      [v18 setAllowableMovement:50.0];
      [(UIImageView *)self->_errorImageView addGestureRecognizer:v18];
      [v10 addSubview:self->_errorImageView];
      id v19 = objc_alloc(MEMORY[0x263F1C768]);
      double v20 = *MEMORY[0x263F001A8];
      double v21 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v22 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v23 = *(double *)(MEMORY[0x263F001A8] + 24);
      v24 = (UILabel *)objc_msgSend(v19, "initWithFrame:", *MEMORY[0x263F001A8], v21, v22, v23);
      errorTitleLabel = self->_errorTitleLabel;
      self->_errorTitleLabel = v24;

      [(UILabel *)self->_errorTitleLabel setTextAlignment:1];
      [(UILabel *)self->_errorTitleLabel setNumberOfLines:0];
      [(UILabel *)self->_errorTitleLabel setLineBreakMode:0];
      if (v14) {
        [MEMORY[0x263F1C550] labelColor];
      }
      else {
      v29 = [MEMORY[0x263F1C550] colorWithWhite:0.368627451 alpha:1.0];
      }
      [(UILabel *)self->_errorTitleLabel setTextColor:v29];

      [(UILabel *)self->_errorTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      v30 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F1D298]];
      [(UILabel *)self->_errorTitleLabel setFont:v30];

      [(UILabel *)self->_errorTitleLabel setAdjustsFontForContentSizeCategory:1];
      [v10 addSubview:self->_errorTitleLabel];
      v31 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v20, v21, v22, v23);
      errorMessageLabel = self->_errorMessageLabel;
      self->_errorMessageLabel = v31;

      v33 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F1D2C0]];
      [(UILabel *)self->_errorMessageLabel setFont:v33];

      [(UILabel *)self->_errorMessageLabel setTextAlignment:1];
      [(UILabel *)self->_errorMessageLabel setNumberOfLines:0];
      [(UILabel *)self->_errorMessageLabel setLineBreakMode:0];
      if (v14) {
        [MEMORY[0x263F1C550] secondaryLabelColor];
      }
      else {
      v34 = [MEMORY[0x263F1C550] colorWithWhite:0.666666667 alpha:1.0];
      }
      [(UILabel *)self->_errorMessageLabel setTextColor:v34];

      [(UILabel *)self->_errorMessageLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UILabel *)self->_errorMessageLabel setAdjustsFontForContentSizeCategory:1];
      [v10 addSubview:self->_errorMessageLabel];
      v35 = [v10 topAnchor];
      v36 = [(UIImageView *)self->_errorImageView topAnchor];
      v37 = [v35 constraintEqualToAnchor:v36];
      [v37 setActive:1];

      v38 = [v10 bottomAnchor];
      v39 = [(UILabel *)self->_errorMessageLabel bottomAnchor];
      v40 = [v38 constraintEqualToAnchor:v39];
      [v40 setActive:1];

      v41 = [v10 leadingAnchor];
      v42 = [(HLPHelpLoadingView *)self leadingAnchor];
      v43 = [v41 constraintEqualToAnchor:v42];
      [v43 setActive:1];

      v44 = [v10 trailingAnchor];
      v45 = [(HLPHelpLoadingView *)self trailingAnchor];
      v46 = [v44 constraintEqualToAnchor:v45];
      [v46 setActive:1];

      v47 = [v10 centerYAnchor];
      v48 = [(HLPHelpLoadingView *)self centerYAnchor];
      v49 = [v47 constraintEqualToAnchor:v48];
      [v49 setActive:1];

      v50 = [(UIImageView *)self->_errorImageView centerXAnchor];
      v51 = [v10 centerXAnchor];
      v52 = [v50 constraintEqualToAnchor:v51];
      [v52 setActive:1];

      double v53 = 20.0;
      if (v14)
      {
        v54 = [MEMORY[0x263F1C550] secondaryLabelColor];
        [(UIImageView *)self->_errorImageView setTintColor:v54];

        v55 = [(UIImageView *)self->_errorImageView widthAnchor];
        v56 = [v55 constraintEqualToConstant:100.0];
        [v56 setActive:1];

        [(UIImageView *)self->_errorImageView setContentMode:1];
        double v53 = 8.0;
      }
      v57 = [(UILabel *)self->_errorTitleLabel topAnchor];
      v58 = [(UIImageView *)self->_errorImageView bottomAnchor];
      v59 = [v57 constraintEqualToAnchor:v58 constant:v53];
      [v59 setActive:1];

      v60 = [(UILabel *)self->_errorTitleLabel centerXAnchor];
      v61 = [v10 centerXAnchor];
      v62 = [v60 constraintEqualToAnchor:v61];
      [v62 setActive:1];

      v63 = [(UILabel *)self->_errorTitleLabel widthAnchor];
      v64 = [v10 widthAnchor];
      v65 = [v63 constraintEqualToAnchor:v64 multiplier:0.9];
      [v65 setActive:1];

      v66 = [(UILabel *)self->_errorMessageLabel topAnchor];
      v67 = [(UILabel *)self->_errorTitleLabel bottomAnchor];
      v68 = [v66 constraintEqualToAnchor:v67 constant:6.0];
      [v68 setActive:1];

      v69 = [(UILabel *)self->_errorMessageLabel centerXAnchor];
      v70 = [v10 centerXAnchor];
      v71 = [v69 constraintEqualToAnchor:v70];
      [v71 setActive:1];

      v72 = [(UILabel *)self->_errorMessageLabel widthAnchor];
      v73 = [(UILabel *)self->_errorTitleLabel widthAnchor];
      v74 = [v72 constraintEqualToAnchor:v73];
      [v74 setActive:1];

      v9 = self->_errorTitleLabel;
      id v7 = v76;
    }
    [(UILabel *)v9 setText:v7];
    [(UILabel *)self->_errorMessageLabel setText:v6];
  }
  else
  {
    [(UIImageView *)errorImageView removeFromSuperview];
    [(UILabel *)self->_errorTitleLabel removeFromSuperview];
    [(UILabel *)self->_errorMessageLabel removeFromSuperview];
    v26 = self->_errorImageView;
    self->_errorImageView = 0;

    v27 = self->_errorTitleLabel;
    self->_errorTitleLabel = 0;

    v28 = self->_errorMessageLabel;
    self->_errorMessageLabel = 0;
  }
}

- (void)showHelpBookInfo
{
  id v3 = [(HLPHelpLoadingView *)self delegate];
  [v3 showHelpBookInfo:self];
}

- (HLPHelpLoadingViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HLPHelpLoadingViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)supportsDarkMode
{
  return self->_supportsDarkMode;
}

- (UILabel)errorTitleLabel
{
  return self->_errorTitleLabel;
}

- (void)setErrorTitleLabel:(id)a3
{
}

- (UILabel)errorMessageLabel
{
  return self->_errorMessageLabel;
}

- (void)setErrorMessageLabel:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorMessageLabel, 0);
  objc_storeStrong((id *)&self->_errorTitleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_errorImageView, 0);
}

@end