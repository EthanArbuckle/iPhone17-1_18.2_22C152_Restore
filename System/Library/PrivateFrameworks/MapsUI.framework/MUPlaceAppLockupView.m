@interface MUPlaceAppLockupView
+ (CGSize)appIconSize;
- (MUAppLockupViewModel)viewModel;
- (MUPlaceAppLockupView)initWithFrame:(CGRect)a3;
- (MUPlaceAppLockupViewDelegate)delegate;
- (double)scaledHeight;
- (void)_punchOutButtonSelected;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateAppearance;
- (void)_updateHeightConstraint;
- (void)setDelegate:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation MUPlaceAppLockupView

+ (CGSize)appIconSize
{
  double v2 = 48.0;
  double v3 = 48.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (MUPlaceAppLockupView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MUPlaceAppLockupView;
  double v3 = -[MUPlaceAppLockupView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MUPlaceAppLockupView *)v3 setAccessibilityIdentifier:@"PlaceAppLockup"];
    [(MUPlaceAppLockupView *)v4 _setupSubviews];
    [(MUPlaceAppLockupView *)v4 _setupConstraints];
  }
  return v4;
}

- (void)_setupSubviews
{
  v44[1] = *MEMORY[0x1E4F143B8];
  double v3 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
  titleSubtitleLayoutGuide = self->_titleSubtitleLayoutGuide;
  self->_titleSubtitleLayoutGuide = v3;

  [(MUPlaceAppLockupView *)self addLayoutGuide:self->_titleSubtitleLayoutGuide];
  id v5 = objc_alloc(MEMORY[0x1E4FB1838]);
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v10 = (UIImageView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v7, v8, v9);
  appLockupImageView = self->_appLockupImageView;
  self->_appLockupImageView = v10;

  [(UIImageView *)self->_appLockupImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_appLockupImageView _setContinuousCornerRadius:10.0];
  v12 = +[MUInfoCardStyle tokenBackgroundColor];
  [(UIImageView *)self->_appLockupImageView setBackgroundColor:v12];

  [(UIImageView *)self->_appLockupImageView setAccessibilityIdentifier:@"PlaceAppLockupImage"];
  v13 = [(UIImageView *)self->_appLockupImageView layer];
  v14 = [MEMORY[0x1E4FB1618] blackColor];
  id v15 = [v14 colorWithAlphaComponent:0.200000003];
  objc_msgSend(v13, "setBorderColor:", objc_msgSend(v15, "CGColor"));

  v16 = [(MUPlaceAppLockupView *)self window];
  v17 = [v16 screen];
  v18 = v17;
  if (v17)
  {
    [v17 nativeScale];
    double v20 = v19;
  }
  else
  {
    v21 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v21 nativeScale];
    double v20 = v22;
  }
  v23 = [(UIImageView *)self->_appLockupImageView layer];
  [v23 setBorderWidth:1.0 / v20];

  [(UIImageView *)self->_appLockupImageView setClipsToBounds:1];
  [(MUPlaceAppLockupView *)self addSubview:self->_appLockupImageView];
  v24 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v6, v7, v8, v9);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v24;

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_titleLabel setNumberOfLines:1];
  v26 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  v27 = objc_msgSend(v26, "_mapkit_fontWithWeight:", *MEMORY[0x1E4FB09E0]);
  [(UILabel *)self->_titleLabel setFont:v27];

  [(UILabel *)self->_titleLabel setAdjustsFontForContentSizeCategory:1];
  [(UILabel *)self->_titleLabel setAccessibilityIdentifier:@"PlaceAppLockupTitle"];
  [(MUPlaceAppLockupView *)self addSubview:self->_titleLabel];
  v28 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v6, v7, v8, v9);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v28;

  [(UILabel *)self->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_subtitleLabel setNumberOfLines:1];
  v30 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)self->_subtitleLabel setTextColor:v30];

  v31 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  [(UILabel *)self->_subtitleLabel setFont:v31];

  [(UILabel *)self->_subtitleLabel setAdjustsFontForContentSizeCategory:1];
  [(UILabel *)self->_subtitleLabel setAccessibilityIdentifier:@"PlaceAppLockupSubtitle"];
  [(MUPlaceAppLockupView *)self addSubview:self->_subtitleLabel];
  v32 = [MEMORY[0x1E4FB14D8] filledButtonConfiguration];
  v33 = +[MUInfoCardStyle tokenBackgroundColor];
  v34 = [v32 background];
  [v34 setBackgroundColor:v33];

  [v32 setCornerStyle:4];
  [v32 setTitleTextAttributesTransformer:&__block_literal_global_5];
  v35 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
  punchoutButton = self->_punchoutButton;
  self->_punchoutButton = v35;

  [(UIButton *)self->_punchoutButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_punchoutButton setConfiguration:v32];
  LODWORD(v37) = 1148846080;
  [(UIButton *)self->_punchoutButton setContentCompressionResistancePriority:0 forAxis:v37];
  LODWORD(v38) = 1148846080;
  [(UIButton *)self->_punchoutButton setContentCompressionResistancePriority:1 forAxis:v38];
  LODWORD(v39) = 1148846080;
  [(UIButton *)self->_punchoutButton setContentHuggingPriority:0 forAxis:v39];
  LODWORD(v40) = 1148846080;
  [(UIButton *)self->_punchoutButton setContentHuggingPriority:1 forAxis:v40];
  [(UIButton *)self->_punchoutButton addTarget:self action:sel__punchOutButtonSelected forControlEvents:64];
  [(UIButton *)self->_punchoutButton setAccessibilityIdentifier:@"PlaceAppLockupPunchoutButton"];
  [(MUPlaceAppLockupView *)self addSubview:self->_punchoutButton];
  [(UIView *)self _mapsui_addSelectGestureRecognizerWithTarget:self action:sel__punchOutButtonSelected];
  v41 = self;
  v44[0] = v41;
  v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
  id v43 = (id)[(MUPlaceAppLockupView *)self registerForTraitChanges:v42 withAction:sel__updateHeightConstraint];
}

id __38__MUPlaceAppLockupView__setupSubviews__block_invoke(uint64_t a1, void *a2)
{
  double v2 = (void *)[a2 mutableCopy];
  double v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  v4 = objc_msgSend(v3, "_mapkit_fontWithWeight:", *MEMORY[0x1E4FB09E0]);
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  id v5 = +[MUInfoCardStyle tintColor];
  [v2 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

  double v6 = (void *)[v2 copy];
  return v6;
}

- (void)_setupConstraints
{
  v74[23] = *MEMORY[0x1E4F143B8];
  double v3 = [(MUPlaceAppLockupView *)self heightAnchor];
  [(MUPlaceAppLockupView *)self scaledHeight];
  objc_msgSend(v3, "constraintEqualToConstant:");
  v4 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v4;

  v49 = (void *)MEMORY[0x1E4F28DC8];
  v73 = [(UIImageView *)self->_appLockupImageView heightAnchor];
  v72 = [v73 constraintEqualToConstant:48.0];
  v74[0] = v72;
  v71 = [(UIImageView *)self->_appLockupImageView widthAnchor];
  v70 = [(UIImageView *)self->_appLockupImageView heightAnchor];
  v69 = [v71 constraintEqualToAnchor:v70];
  v74[1] = v69;
  v68 = [(UIImageView *)self->_appLockupImageView leadingAnchor];
  v67 = [(MUPlaceAppLockupView *)self leadingAnchor];
  v66 = [v68 constraintEqualToAnchor:v67 constant:16.0];
  v74[2] = v66;
  v65 = [(UIImageView *)self->_appLockupImageView trailingAnchor];
  v64 = [(UILayoutGuide *)self->_titleSubtitleLayoutGuide leadingAnchor];
  v63 = [v65 constraintEqualToAnchor:v64 constant:-10.0];
  v74[3] = v63;
  v62 = [(UIImageView *)self->_appLockupImageView topAnchor];
  v61 = [(MUPlaceAppLockupView *)self topAnchor];
  v60 = [v62 constraintGreaterThanOrEqualToAnchor:v61 constant:14.0];
  v74[4] = v60;
  v59 = [(UIImageView *)self->_appLockupImageView bottomAnchor];
  v58 = [(MUPlaceAppLockupView *)self bottomAnchor];
  v57 = [v59 constraintLessThanOrEqualToAnchor:v58 constant:-14.0];
  v74[5] = v57;
  v56 = [(UILabel *)self->_titleLabel leadingAnchor];
  v55 = [(UILayoutGuide *)self->_titleSubtitleLayoutGuide leadingAnchor];
  v54 = [v56 constraintEqualToAnchor:v55];
  v74[6] = v54;
  v53 = [(UILabel *)self->_titleLabel trailingAnchor];
  v52 = [(UILayoutGuide *)self->_titleSubtitleLayoutGuide trailingAnchor];
  v51 = [v53 constraintEqualToAnchor:v52];
  v74[7] = v51;
  v50 = [(UILabel *)self->_titleLabel topAnchor];
  v48 = [(UILayoutGuide *)self->_titleSubtitleLayoutGuide topAnchor];
  v47 = [v50 constraintEqualToAnchor:v48];
  v74[8] = v47;
  v46 = [(UILabel *)self->_titleLabel bottomAnchor];
  v45 = [(UILabel *)self->_subtitleLabel topAnchor];
  v44 = [v46 constraintEqualToAnchor:v45];
  v74[9] = v44;
  id v43 = [(UILabel *)self->_subtitleLabel leadingAnchor];
  v42 = [(UILayoutGuide *)self->_titleSubtitleLayoutGuide leadingAnchor];
  v41 = [v43 constraintEqualToAnchor:v42];
  v74[10] = v41;
  double v40 = [(UILabel *)self->_subtitleLabel trailingAnchor];
  double v39 = [(UILayoutGuide *)self->_titleSubtitleLayoutGuide trailingAnchor];
  double v38 = [v40 constraintEqualToAnchor:v39];
  v74[11] = v38;
  double v37 = [(UILabel *)self->_subtitleLabel bottomAnchor];
  v36 = [(UILayoutGuide *)self->_titleSubtitleLayoutGuide bottomAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v74[12] = v35;
  v34 = [(UILayoutGuide *)self->_titleSubtitleLayoutGuide topAnchor];
  v33 = [(MUPlaceAppLockupView *)self topAnchor];
  v32 = [v34 constraintGreaterThanOrEqualToAnchor:v33 constant:14.0];
  v74[13] = v32;
  v31 = [(UILayoutGuide *)self->_titleSubtitleLayoutGuide bottomAnchor];
  v30 = [(MUPlaceAppLockupView *)self bottomAnchor];
  v29 = [v31 constraintLessThanOrEqualToAnchor:v30 constant:-14.0];
  v74[14] = v29;
  v28 = [(UILayoutGuide *)self->_titleSubtitleLayoutGuide trailingAnchor];
  v27 = [(UIButton *)self->_punchoutButton leadingAnchor];
  v26 = [v28 constraintLessThanOrEqualToAnchor:v27 constant:-16.0];
  v74[15] = v26;
  v25 = [(UIButton *)self->_punchoutButton trailingAnchor];
  v24 = [(MUPlaceAppLockupView *)self trailingAnchor];
  v23 = [v25 constraintEqualToAnchor:v24 constant:-16.0];
  v74[16] = v23;
  double v22 = [(UIButton *)self->_punchoutButton topAnchor];
  v21 = [(MUPlaceAppLockupView *)self topAnchor];
  double v20 = [v22 constraintGreaterThanOrEqualToAnchor:v21 constant:24.0];
  v74[17] = v20;
  double v19 = [(UIButton *)self->_punchoutButton bottomAnchor];
  v18 = [(MUPlaceAppLockupView *)self bottomAnchor];
  v17 = [v19 constraintLessThanOrEqualToAnchor:v18 constant:-24.0];
  v74[18] = v17;
  double v6 = [(UIImageView *)self->_appLockupImageView centerYAnchor];
  double v7 = [(MUPlaceAppLockupView *)self centerYAnchor];
  double v8 = [v6 constraintEqualToAnchor:v7];
  v74[19] = v8;
  double v9 = [(UILayoutGuide *)self->_titleSubtitleLayoutGuide centerYAnchor];
  v10 = [(MUPlaceAppLockupView *)self centerYAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v74[20] = v11;
  v12 = [(UIButton *)self->_punchoutButton centerYAnchor];
  v13 = [(MUPlaceAppLockupView *)self centerYAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  id v15 = self->_heightConstraint;
  v74[21] = v14;
  v74[22] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:23];
  [v49 activateConstraints:v16];
}

- (void)setViewModel:(id)a3
{
  id v5 = (MUAppLockupViewModel *)a3;
  p_viewModel = &self->_viewModel;
  if (self->_viewModel != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_viewModel, a3);
    p_viewModel = (MUAppLockupViewModel **)[(MUPlaceAppLockupView *)self _updateAppearance];
    id v5 = v7;
  }
  MEMORY[0x1F41817F8](p_viewModel, v5);
}

- (void)_updateAppearance
{
  double v3 = [(MUAppLockupViewModel *)self->_viewModel titleText];
  [(UILabel *)self->_titleLabel setText:v3];

  v4 = [(MUAppLockupViewModel *)self->_viewModel subtitleText];
  [(UILabel *)self->_subtitleLabel setText:v4];

  punchoutButton = self->_punchoutButton;
  double v6 = [(MUAppLockupViewModel *)self->_viewModel actionButtonText];
  [(UIButton *)punchoutButton setTitle:v6 forState:0];

  objc_initWeak(&location, self);
  viewModel = self->_viewModel;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__MUPlaceAppLockupView__updateAppearance__block_invoke;
  v8[3] = &unk_1E574EE30;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  [(MUAppLockupViewModel *)viewModel loadAppArtworkWithCompletion:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __41__MUPlaceAppLockupView__updateAppearance__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    double v6 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__MUPlaceAppLockupView__updateAppearance__block_invoke_2;
    v7[3] = &unk_1E574EE08;
    v7[4] = WeakRetained;
    id v8 = v3;
    objc_msgSend(v6, "_mapsui_performImageLoadingTransitionWithAnimations:completion:", v7, 0);
  }
}

uint64_t __41__MUPlaceAppLockupView__updateAppearance__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 408) setImage:*(void *)(a1 + 40)];
}

- (double)scaledHeight
{
  double v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  id v3 = objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E4FB09E0]);
  [v3 _scaledValueForValue:76.0];
  double v5 = v4;

  return v5;
}

- (void)_punchOutButtonSelected
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained appLockupViewDidSelectPunchOutButton:self];
}

- (void)_updateHeightConstraint
{
  [(MUPlaceAppLockupView *)self scaledHeight];
  heightConstraint = self->_heightConstraint;
  -[NSLayoutConstraint setConstant:](heightConstraint, "setConstant:");
}

- (MUPlaceAppLockupViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MUPlaceAppLockupViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MUAppLockupViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_titleSubtitleLayoutGuide, 0);
  objc_storeStrong((id *)&self->_punchoutButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_appLockupImageView, 0);
}

@end