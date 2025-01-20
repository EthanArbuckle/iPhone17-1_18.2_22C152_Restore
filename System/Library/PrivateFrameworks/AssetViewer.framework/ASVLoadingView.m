@interface ASVLoadingView
- (ASVLoadingView)initWithCoder:(id)a3;
- (ASVLoadingView)initWithFrame:(CGRect)a3;
- (NSError)loadingError;
- (unint64_t)spinnerColor;
- (void)_commonInit;
- (void)_updateLoadingSpinner;
- (void)_updateLoadingText;
- (void)setLoadingError:(id)a3;
- (void)setSpinnerColor:(unint64_t)a3;
@end

@implementation ASVLoadingView

- (ASVLoadingView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ASVLoadingView;
  v3 = -[ASVLoadingView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(ASVLoadingView *)v3 _commonInit];
    v5 = v4;
  }

  return v4;
}

- (ASVLoadingView)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ASVLoadingView;
  v3 = [(ASVLoadingView *)&v7 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    [(ASVLoadingView *)v3 _commonInit];
    v5 = v4;
  }

  return v4;
}

- (void)_commonInit
{
  v42[7] = *MEMORY[0x1E4F143B8];
  [(ASVLoadingView *)self setOpaque:0];
  v3 = [MEMORY[0x1E4FB1618] clearColor];
  [(ASVLoadingView *)self setBackgroundColor:v3];

  id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
  v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  assetLoadingStatusLabel = self->_assetLoadingStatusLabel;
  self->_assetLoadingStatusLabel = v5;

  objc_super v7 = [MEMORY[0x1E4FB1618] clearColor];
  [(UILabel *)self->_assetLoadingStatusLabel setBackgroundColor:v7];

  [(UILabel *)self->_assetLoadingStatusLabel setNumberOfLines:0];
  v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D0]];
  [(UILabel *)self->_assetLoadingStatusLabel setFont:v8];

  v9 = [MEMORY[0x1E4FB1618] colorWithHexValue:@"8E8E93" error:0];
  [(UILabel *)self->_assetLoadingStatusLabel setTextColor:v9];

  v10 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:2];
  spinner = self->_spinner;
  self->_spinner = v10;

  [(UILabel *)self->_assetLoadingStatusLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIActivityIndicatorView *)self->_spinner setTranslatesAutoresizingMaskIntoConstraints:0];
  [(ASVLoadingView *)self addSubview:self->_assetLoadingStatusLabel];
  [(ASVLoadingView *)self addSubview:self->_spinner];
  v12 = [(UILabel *)self->_assetLoadingStatusLabel trailingAnchor];
  v13 = [(ASVLoadingView *)self trailingAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];

  LODWORD(v15) = 1132068864;
  v41 = v14;
  [v14 setPriority:v15];
  v16 = [(UIActivityIndicatorView *)self->_spinner leadingAnchor];
  v17 = [(UILabel *)self->_assetLoadingStatusLabel trailingAnchor];
  v18 = [v16 constraintEqualToAnchor:v17 constant:6.0];
  spinnerLeadingConstraint = self->_spinnerLeadingConstraint;
  self->_spinnerLeadingConstraint = v18;

  LODWORD(v20) = 1132134400;
  [(NSLayoutConstraint *)self->_spinnerLeadingConstraint setPriority:v20];
  v33 = (void *)MEMORY[0x1E4F28DC8];
  v40 = [(UILabel *)self->_assetLoadingStatusLabel leadingAnchor];
  v39 = [(ASVLoadingView *)self leadingAnchor];
  v38 = [v40 constraintEqualToAnchor:v39];
  v42[0] = v38;
  v42[1] = v14;
  v37 = [(UILabel *)self->_assetLoadingStatusLabel centerYAnchor];
  v36 = [(ASVLoadingView *)self centerYAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v42[2] = v35;
  v34 = [(UILabel *)self->_assetLoadingStatusLabel heightAnchor];
  v32 = [(ASVLoadingView *)self heightAnchor];
  v31 = [v34 constraintLessThanOrEqualToAnchor:v32];
  v42[3] = v31;
  v30 = [(UIActivityIndicatorView *)self->_spinner trailingAnchor];
  v21 = [(ASVLoadingView *)self trailingAnchor];
  v22 = [v30 constraintEqualToAnchor:v21];
  v42[4] = v22;
  v23 = [(UIActivityIndicatorView *)self->_spinner centerYAnchor];
  v24 = [(ASVLoadingView *)self centerYAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  v42[5] = v25;
  v26 = [(UIActivityIndicatorView *)self->_spinner heightAnchor];
  v27 = [(ASVLoadingView *)self heightAnchor];
  v28 = [v26 constraintLessThanOrEqualToAnchor:v27];
  v42[6] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:7];
  [v33 activateConstraints:v29];

  [(ASVLoadingView *)self _updateLoadingText];
  [(ASVLoadingView *)self _updateLoadingSpinner];
}

- (void)setLoadingError:(id)a3
{
  v5 = (NSError *)a3;
  p_loadingError = &self->_loadingError;
  if (self->_loadingError != v5)
  {
    objc_super v7 = v5;
    objc_storeStrong((id *)p_loadingError, a3);
    [(ASVLoadingView *)self _updateLoadingText];
    p_loadingError = (NSError **)[(ASVLoadingView *)self _updateLoadingSpinner];
    v5 = v7;
  }
  MEMORY[0x1F41817F8](p_loadingError, v5);
}

- (void)setSpinnerColor:(unint64_t)a3
{
  if (self->_spinnerColor != a3) {
    self->_spinnerColor = a3;
  }
  if (a3) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  [(UIActivityIndicatorView *)self->_spinner setActivityIndicatorViewStyle:v3];
}

- (void)_updateLoadingText
{
  uint64_t v3 = [(ASVLoadingView *)self loadingError];

  if (v3)
  {
    id v4 = [(ASVLoadingView *)self loadingError];
    v5 = [v4 domain];

    if (v5 == @"com.apple.ASVError")
    {
      v10 = [(ASVLoadingView *)self loadingError];
      uint64_t v11 = [v10 code];

      switch(v11)
      {
        case -5:
          v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AssetViewer"];
          id v12 = v6;
          objc_super v7 = @"VARIANTS_ERROR";
          break;
        case -4:
          v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AssetViewer"];
          id v12 = v6;
          objc_super v7 = @"LOAD_FAILURE_UNSUPPORTED_FUTURE_FILE_VERSION";
          break;
        case -2:
        case -1:
          v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AssetViewer"];
          id v12 = v6;
          objc_super v7 = @"LOAD_FAILURE_FILE_TOO_BIG";
          break;
        default:
          goto LABEL_3;
      }
    }
    else
    {
LABEL_3:
      v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AssetViewer"];
      id v12 = v6;
      objc_super v7 = @"LOAD_FAILURE";
    }
    v8 = [v6 localizedStringForKey:v7 value:v7 table:@"Localizable"];
    [(UILabel *)self->_assetLoadingStatusLabel setText:v8];
  }
  else
  {
    assetLoadingStatusLabel = self->_assetLoadingStatusLabel;
    [(UILabel *)assetLoadingStatusLabel setText:&stru_1F3DDEEE8];
  }
}

- (void)_updateLoadingSpinner
{
  uint64_t v3 = [(ASVLoadingView *)self loadingError];
  double v4 = 0.0;
  if (!v3) {
    double v4 = 1.0;
  }
  [(UIActivityIndicatorView *)self->_spinner setAlpha:v4];

  v5 = [(ASVLoadingView *)self loadingError];

  spinnerLeadingConstraint = self->_spinnerLeadingConstraint;
  if (v5)
  {
    [(NSLayoutConstraint *)spinnerLeadingConstraint setActive:0];
    spinner = self->_spinner;
    [(UIActivityIndicatorView *)spinner stopAnimating];
  }
  else
  {
    [(NSLayoutConstraint *)spinnerLeadingConstraint setConstant:0.0];
    [(NSLayoutConstraint *)self->_spinnerLeadingConstraint setActive:1];
    v8 = self->_spinner;
    [(UIActivityIndicatorView *)v8 startAnimating];
  }
}

- (NSError)loadingError
{
  return self->_loadingError;
}

- (unint64_t)spinnerColor
{
  return self->_spinnerColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingError, 0);
  objc_storeStrong((id *)&self->_spinnerLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_assetLoadingStatusLabel, 0);
}

@end