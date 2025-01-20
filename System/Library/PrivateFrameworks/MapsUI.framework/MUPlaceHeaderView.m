@interface MUPlaceHeaderView
+ (double)minimalModeHeight;
- (BOOL)shouldBlurChromeHeaderButtons;
- (BOOL)suppressContainmentTap;
- (MUPlaceCoverPhotoOptions)coverPhotoOptions;
- (MUPlaceHeaderView)initWithViewModel:(id)a3 coverPhotoOptions:(id)a4 trailingConstraintProvider:(id)a5;
- (MUPlaceHeaderView)initWithViewModel:(id)a3 trailingConstraintProvider:(id)a4;
- (MUPlaceHeaderViewDelegate)delegate;
- (MUPlaceHeaderViewModel)viewModel;
- (UILayoutGuide)titleLabelToTopLayoutGuide;
- (UIView)viewForContainmentString;
- (double)_trailingPadding;
- (double)verifiedBusinessHeaderAlpha;
- (double)verifiedBusinessHeaderHeight;
- (id)_verifiedAttributedString;
- (void)_contentSizeDidChange;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_shareButtonPressed;
- (void)_tappedEnclosingPlace;
- (void)_updateAppearance;
- (void)_updateContainmentLineWithAttributedString;
- (void)_updateCoverPhoto;
- (void)_updateWithTransitionController:(id)a3;
- (void)beginAnimatingActivityIndicator;
- (void)endAnimatingActivityIndicatorWithError:(id)a3;
- (void)hideTitle:(BOOL)a3;
- (void)layoutSubviews;
- (void)reloadTrailingConstraint;
- (void)setDelegate:(id)a3;
- (void)setSuppressContainmentTap:(BOOL)a3;
- (void)setVerifiedBusinessHeaderAlpha:(double)a3;
- (void)setVerifiedBusinessHeaderExpansionProgress:(double)a3;
- (void)setVerifiedBusinessHeaderHeight:(double)a3;
- (void)setViewModel:(id)a3;
@end

@implementation MUPlaceHeaderView

- (UILayoutGuide)titleLabelToTopLayoutGuide
{
  return self->_topToTitleLayoutGuide;
}

- (MUPlaceHeaderView)initWithViewModel:(id)a3 trailingConstraintProvider:(id)a4
{
  return [(MUPlaceHeaderView *)self initWithViewModel:a3 coverPhotoOptions:0 trailingConstraintProvider:a4];
}

- (MUPlaceHeaderView)initWithViewModel:(id)a3 coverPhotoOptions:(id)a4 trailingConstraintProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MUPlaceHeaderView;
  v12 = -[MUPlaceHeaderView initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_viewModel, a3);
    objc_storeStrong((id *)&v13->_coverPhotoOptions, a4);
    uint64_t v14 = [v11 copy];
    id trailingConstraintProvider = v13->_trailingConstraintProvider;
    v13->_id trailingConstraintProvider = (id)v14;

    [(MUPlaceHeaderView *)v13 setAccessibilityIdentifier:@"PlaceHeaderView"];
    [(MUPlaceHeaderView *)v13 _setupSubviews];
    [(MUPlaceHeaderView *)v13 _setupConstraints];
    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v13 selector:sel__contentSizeDidChange name:*MEMORY[0x1E4FB27A8] object:0];

    [(MUPlaceHeaderView *)v13 _updateAppearance];
  }

  return v13;
}

- (void)_setupSubviews
{
  BOOL v3 = [(MUPlaceHeaderViewModel *)self->_viewModel hasHeroImage];
  v4 = (double *)MEMORY[0x1E4F1DB28];
  unint64_t v5 = 0x1E574D000uLL;
  if (v3)
  {
    v6 = -[MUImageView initWithFrame:]([MUImageView alloc], "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    heroImageView = self->_heroImageView;
    self->_heroImageView = v6;

    [(MUImageView *)self->_heroImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = +[MUInfoCardStyle imageTileBackgroundColor];
    [(MUImageView *)self->_heroImageView setBackgroundColor:v8];

    [(UIView *)self->_heroImageView _mapsui_setCardCorner];
    [(MUImageView *)self->_heroImageView setAccessibilityIdentifier:@"PlaceHeaderHeroImage"];
    [(MUPlaceHeaderView *)self addSubview:self->_heroImageView];
  }
  if ([(MUPlaceHeaderViewModel *)self->_viewModel supportsEnhancedBusinessHeader])
  {
    if (MUIdiomInTraitEnvironment(self) == 5) {
      double v9 = 8.0;
    }
    else {
      double v9 = 10.0;
    }
    if (MUIdiomInTraitEnvironment(self) == 5) {
      double v10 = 12.0;
    }
    else {
      double v10 = 16.0;
    }
    BOOL v11 = [(MUPlaceHeaderViewModel *)self->_viewModel supportsLogo];
    if (MUIdiomInTraitEnvironment(self) == 5) {
      double v12 = 40.0;
    }
    else {
      double v12 = 56.0;
    }
    if (MUIdiomInTraitEnvironment(self) == 5) {
      double v13 = 40.0;
    }
    else {
      double v13 = 56.0;
    }
    GEOConfigGetDouble();
    double v15 = v14;
    GEOConfigGetDouble();
    double v17 = v16;
    *(_OWORD *)&self->_headerMetrics.topToTitleSpacing = xmmword_19335B7D0;
    self->_headerMetrics.coverPhotoMetrics.hasLogo = v11;
    *(_DWORD *)(&self->_headerMetrics.coverPhotoMetrics.hasLogo + 1) = 0;
    *((_DWORD *)&self->_headerMetrics.coverPhotoMetrics.hasLogo + 1) = 0;
    self->_headerMetrics.coverPhotoMetrics.logoSize.width = v12;
    self->_headerMetrics.coverPhotoMetrics.logoSize.height = v13;
    self->_headerMetrics.coverPhotoMetrics.coverPhotoBottomToLogoBottomSpacing = v10;
    self->_headerMetrics.coverPhotoMetrics.coverPhotoContainerToTitleSpacing = v9;
    self->_headerMetrics.coverPhotoMetrics.startingLogoAlphaTransitionValue = v15;
    self->_headerMetrics.coverPhotoMetrics.endingLogoAlphaTransitionValue = v16;
    objc_initWeak(location, self);
    objc_super v18 = [MUPlaceCoverPhotoTransitionController alloc];
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __35__MUPlaceHeaderView__setupSubviews__block_invoke;
    v81[3] = &unk_1E574FC40;
    objc_copyWeak(&v82, location);
    *(_OWORD *)from = xmmword_19335B7D0;
    BOOL v73 = v11;
    memset(v74, 0, sizeof(v74));
    double v75 = v12;
    double v76 = v13;
    double v77 = v10;
    double v78 = v9;
    double v79 = v15;
    double v80 = v17;
    v19 = [(MUPlaceCoverPhotoTransitionController *)v18 initWithMetrics:from updateHandler:v81];
    coverPhotoTransitionController = self->_coverPhotoTransitionController;
    self->_coverPhotoTransitionController = v19;

    id v21 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v22 = *v4;
    double v23 = v4[1];
    double v24 = v4[2];
    double v25 = v4[3];
    v26 = (UIView *)objc_msgSend(v21, "initWithFrame:", *v4, v23, v24, v25);
    verifiedBusinessContainerView = self->_verifiedBusinessContainerView;
    self->_verifiedBusinessContainerView = v26;

    [(UIView *)self->_verifiedBusinessContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MUPlaceHeaderView *)self addSubview:self->_verifiedBusinessContainerView];
    v28 = -[MUImageView initWithFrame:]([MUImageView alloc], "initWithFrame:", v22, v23, v24, v25);
    verifiedBusinessCoverPhotoImageView = self->_verifiedBusinessCoverPhotoImageView;
    self->_verifiedBusinessCoverPhotoImageView = v28;

    [(MUImageView *)self->_verifiedBusinessCoverPhotoImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MUImageView *)self->_verifiedBusinessCoverPhotoImageView setAccessibilityIdentifier:@"PlaceHeaderCoverPhotoImage"];
    v30 = [(MUPlaceHeaderViewModel *)self->_viewModel coverPhotoBackgroundColor];
    v31 = v30;
    if (!v30)
    {
      v31 = +[MUInfoCardStyle punchoutButtonPlatterColor];
    }
    -[MUImageView setBackgroundColor:](self->_verifiedBusinessCoverPhotoImageView, "setBackgroundColor:", v31, 0x4030000000000000, 0x3FD8F18F20000000);
    if (!v30) {

    }
    [(UIView *)self->_verifiedBusinessContainerView addSubview:self->_verifiedBusinessCoverPhotoImageView];
    if ([(MUPlaceCoverPhotoOptions *)self->_coverPhotoOptions insetsCoverPhoto]) {
      [(UIView *)self->_verifiedBusinessCoverPhotoImageView _mapsui_setCardCorner];
    }
    if ([(MUPlaceHeaderViewModel *)self->_viewModel supportsLogo])
    {
      v32 = -[MUVerifiedLogoImageView initWithFrame:]([MUVerifiedLogoImageView alloc], "initWithFrame:", v22, v23, v24, v25);
      verifiedBusinessLogoImageView = self->_verifiedBusinessLogoImageView;
      self->_verifiedBusinessLogoImageView = v32;

      [(MUVerifiedLogoImageView *)self->_verifiedBusinessLogoImageView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(MUVerifiedLogoImageView *)self->_verifiedBusinessLogoImageView setAccessibilityIdentifier:@"PlaceHeaderLogoImage"];
      v34 = [(MUPlaceHeaderViewModel *)self->_viewModel logoBackgroundColor];
      v35 = v34;
      if (!v34)
      {
        v35 = +[MUInfoCardStyle verifiedLogoBackgroundColor];
      }
      [(MUVerifiedLogoImageView *)self->_verifiedBusinessLogoImageView setBackgroundColor:v35];
      if (!v34) {

      }
      [(UIView *)self->_verifiedBusinessContainerView addSubview:self->_verifiedBusinessLogoImageView];
    }
    [(MUPlaceHeaderView *)self _updateWithTransitionController:self->_coverPhotoTransitionController];
    objc_destroyWeak(&v82);
    objc_destroyWeak(location);
    unint64_t v5 = 0x1E574D000;
  }
  if ([(MUPlaceCoverPhotoOptions *)self->_coverPhotoOptions showShareButton])
  {
    v36 = -[MUCardButton initWithFrame:]([MUCardButton alloc], "initWithFrame:", *v4, v4[1], v4[2], v4[3]);
    shareButton = self->_shareButton;
    self->_shareButton = v36;

    [(MUCardButton *)self->_shareButton setAccessibilityIdentifier:@"PlaceHeaderShareButton"];
    [(MUCardButton *)self->_shareButton setSymbolName:@"square.and.arrow.up"];
    [(MUCardButton *)self->_shareButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MUCardButton *)self->_shareButton addTarget:self action:sel__shareButtonPressed forControlEvents:64];
    if ([(MUPlaceHeaderViewModel *)self->_viewModel supportsEnhancedBusinessHeader])
    {
      [(MUCardButton *)self->_shareButton setBlurBackground:1];
      BOOL v38 = [(MUPlaceHeaderViewModel *)self->_viewModel supportsEnhancedBusinessHeader];
      double v39 = 16.0;
      if (v38) {
        double v39 = 8.0;
      }
      -[MUCardButton setDirectionalLayoutMargins:](self->_shareButton, "setDirectionalLayoutMargins:", v39, 0.0, 0.0, v39);
    }
    else if ([*(id *)(v5 + 4064) hasExternallyProvidedTintColor])
    {
      v40 = objc_opt_new();
      [(MUCardButton *)self->_shareButton setBackgroundView:v40];

      v41 = [*(id *)(v5 + 4064) tintColor];
      [(MUCardButton *)self->_shareButton setForegroundColor:v41];
    }
    if ([(MUPlaceHeaderViewModel *)self->_viewModel supportsEnhancedBusinessHeader])
    {
      v42 = self->_verifiedBusinessCoverPhotoImageView;
      v43 = self->_shareButton;
    }
    else
    {
      v43 = self->_shareButton;
      v42 = self;
    }
    [v42 addSubview:v43];
  }
  objc_msgSend(MEMORY[0x1E4FB1930], "_mapsui_defaultLabel");
  v44 = (UILabel *)objc_claimAutoreleasedReturnValue();
  titleLabel = self->_titleLabel;
  self->_titleLabel = v44;

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v46 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2988]];
  v47 = objc_msgSend(v46, "_mapkit_fontWithSymbolicTraits:", 2);
  [(UILabel *)self->_titleLabel setFont:v47];

  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  [(UILabel *)self->_titleLabel setAccessibilityIdentifier:@"PlaceHeaderTitle"];
  [(MUPlaceHeaderView *)self addSubview:self->_titleLabel];
  v48 = [(MUPlaceHeaderViewModel *)self->_viewModel placeSecondaryName];
  uint64_t v49 = [v48 length];

  if (v49)
  {
    objc_msgSend(MEMORY[0x1E4FB1930], "_mapsui_defaultLabel");
    v50 = (UILabel *)objc_claimAutoreleasedReturnValue();
    secondaryTitleLabel = self->_secondaryTitleLabel;
    self->_secondaryTitleLabel = v50;

    [(UILabel *)self->_secondaryTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v52 = [*(id *)(v5 + 4064) secondaryTextColor];
    [(UILabel *)self->_secondaryTitleLabel setTextColor:v52];

    v53 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
    [(UILabel *)self->_secondaryTitleLabel setFont:v53];

    [(UILabel *)self->_secondaryTitleLabel setAccessibilityIdentifier:@"PlaceHeaderSecondaryTitle"];
    [(MUPlaceHeaderView *)self addSubview:self->_secondaryTitleLabel];
  }
  if ([(MUPlaceHeaderViewModel *)self->_viewModel hasInitialData])
  {
    v54 = -[MULinkView initWithFrame:]([MULinkView alloc], "initWithFrame:", *v4, v4[1], v4[2], v4[3]);
    containmentLabel = self->_containmentLabel;
    self->_containmentLabel = v54;

    [(MULinkView *)self->_containmentLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MULinkView *)self->_containmentLabel setAccessibilityIdentifier:@"PlaceHeaderContainmentButton"];
    [(MULinkView *)self->_containmentLabel setNumberOfLines:1];
    objc_initWeak(from, self);
    v56 = self->_containmentLabel;
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __35__MUPlaceHeaderView__setupSubviews__block_invoke_2;
    v70[3] = &unk_1E574FC68;
    objc_copyWeak(&v71, from);
    [(MULinkView *)v56 setSelectionBlock:v70];
    [(MUPlaceHeaderView *)self addSubview:self->_containmentLabel];
    objc_destroyWeak(&v71);
    objc_destroyWeak(from);
  }
  v57 = [(MUPlaceHeaderViewModel *)self->_viewModel transitLabelItems];
  uint64_t v58 = [v57 count];

  if (v58)
  {
    v59 = (MKTransitInfoLabelView *)objc_alloc_init(MEMORY[0x1E4F31078]);
    transitInfoLabelView = self->_transitInfoLabelView;
    self->_transitInfoLabelView = v59;

    [(MKTransitInfoLabelView *)self->_transitInfoLabelView setTranslatesAutoresizingMaskIntoConstraints:0];
    v61 = [(MUPlaceHeaderViewModel *)self->_viewModel transitLabelItems];
    [(MKTransitInfoLabelView *)self->_transitInfoLabelView setLabelItems:v61];

    [(MKTransitInfoLabelView *)self->_transitInfoLabelView setAccessibilityIdentifier:@"PlaceHeaderTransitInfo"];
    [(MUPlaceHeaderView *)self addSubview:self->_transitInfoLabelView];
  }
  if ([(MUPlaceHeaderViewModel *)self->_viewModel isVerified])
  {
    objc_msgSend(MEMORY[0x1E4FB1930], "_mapsui_defaultLabel");
    v62 = (UILabel *)objc_claimAutoreleasedReturnValue();
    verifiedLabel = self->_verifiedLabel;
    self->_verifiedLabel = v62;

    [(UILabel *)self->_verifiedLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)self->_verifiedLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)self->_verifiedLabel setNumberOfLines:0];
    v64 = [(MUPlaceHeaderView *)self _verifiedAttributedString];
    [(UILabel *)self->_verifiedLabel setAttributedText:v64];

    [(UILabel *)self->_verifiedLabel setAccessibilityIdentifier:@"PlaceHeaderVerifiedLabel"];
    [(MUPlaceHeaderView *)self addSubview:self->_verifiedLabel];
  }
  if ([(MUPlaceHeaderViewModel *)self->_viewModel supportsContactAddressDescription])
  {
    objc_msgSend(MEMORY[0x1E4FB1930], "_mapsui_defaultLabel");
    v65 = (UILabel *)objc_claimAutoreleasedReturnValue();
    contactAddressDescription = self->_contactAddressDescription;
    self->_contactAddressDescription = v65;

    [(UILabel *)self->_contactAddressDescription setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)self->_contactAddressDescription setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)self->_contactAddressDescription setNumberOfLines:0];
    v67 = [(MUPlaceHeaderViewModel *)self->_viewModel addressDescriptionForContact];
    [(UILabel *)self->_contactAddressDescription setAttributedText:v67];

    [(UILabel *)self->_contactAddressDescription setAccessibilityIdentifier:@"ContactAddressDescriptionLabel"];
    [(MUPlaceHeaderView *)self addSubview:self->_contactAddressDescription];
  }
  v68 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
  topToTitleLayoutGuide = self->_topToTitleLayoutGuide;
  self->_topToTitleLayoutGuide = v68;

  [(MUPlaceHeaderView *)self addLayoutGuide:self->_topToTitleLayoutGuide];
}

void __35__MUPlaceHeaderView__setupSubviews__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _updateWithTransitionController:v5];
  }
}

void __35__MUPlaceHeaderView__setupSubviews__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _tappedEnclosingPlace];
    id WeakRetained = v2;
  }
}

- (void)_updateWithTransitionController:(id)a3
{
  id v4 = a3;
  -[MUVerifiedLogoImageView setHidden:](self->_verifiedBusinessLogoImageView, "setHidden:", [v4 hideLogo]);
  [v4 logoImageAlpha];
  -[MUVerifiedLogoImageView setAlpha:](self->_verifiedBusinessLogoImageView, "setAlpha:");
  [v4 coverPhotoAlpha];
  -[MUImageView setAlpha:](self->_verifiedBusinessCoverPhotoImageView, "setAlpha:");
  [(MUPlaceHeaderView *)self frame];
  [v4 coverPhotoHeightForProposedWidth:CGRectGetWidth(v10)];
  -[MUPlaceHeaderView setVerifiedBusinessHeaderHeight:](self, "setVerifiedBusinessHeaderHeight:");
  stackLayout = self->_stackLayout;
  [v4 interpolatedCoverPhotoToTitleSpacing];
  double v7 = v6;

  titleLabel = self->_titleLabel;
  -[MUStackLayout setPadding:forArrangedLayoutItem:](stackLayout, "setPadding:forArrangedLayoutItem:", titleLabel, v7, 19.0, 0.0, 19.0);
}

- (id)_verifiedAttributedString
{
  v25[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB0870]);
  id v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.seal.fill"];
  id v5 = (void *)MEMORY[0x1E4FB1830];
  uint64_t v6 = *MEMORY[0x1E4FB2950];
  double v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  v8 = [v5 configurationWithFont:v7];
  double v9 = [v4 imageWithSymbolConfiguration:v8];
  CGRect v10 = [v9 imageWithRenderingMode:2];
  [v3 setImage:v10];

  BOOL v11 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v3];
  double v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
  id v13 = objc_alloc(MEMORY[0x1E4F28B18]);
  double v14 = _MULocalizedStringFromThisBundle(@"Verified [Brand]");
  double v15 = (void *)[v13 initWithString:v14];

  v25[0] = v11;
  v25[1] = v12;
  v25[2] = v15;
  double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:3];
  double v17 = +[MapsUILayout buildAttributedDisplayStringForComponents:v16 forContainingView:self];
  objc_super v18 = (void *)[v17 mutableCopy];

  v19 = objc_msgSend(MEMORY[0x1E4FB08E0], "preferredFontForTextStyle:", v6, *MEMORY[0x1E4FB06F8]);
  double v24 = v19;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  objc_msgSend(v18, "addAttributes:range:", v20, 0, objc_msgSend(v18, "length"));

  id v21 = (void *)[v18 copy];
  return v21;
}

- (void)_setupConstraints
{
  v70[3] = *MEMORY[0x1E4F143B8];
  id v3 = [[MUStackLayout alloc] initWithContainer:self axis:1];
  [(MUStackLayout *)v3 setAlignment:1];
  [(MUStackLayout *)v3 setAlignmentBoundsContent:1];
  objc_storeStrong((id *)&self->_stackLayout, v3);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v4 addObject:v3];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (self->_heroImageView)
  {
    [(MUStackLayout *)v3 addArrangedLayoutItem:"addArrangedLayoutItem:"];
    -[MUStackLayout setPadding:forArrangedLayoutItem:](v3, "setPadding:forArrangedLayoutItem:", self->_heroImageView, 16.0, 19.0, 0.0, 19.0);
    uint64_t v6 = -[MUSizeLayout initWithItem:size:]([MUSizeLayout alloc], "initWithItem:size:", self->_heroImageView, 86.0, 86.0);
    [v4 addObject:v6];
  }
  v69 = v5;
  v64 = v4;
  v65 = v3;
  if (self->_verifiedBusinessContainerView && self->_verifiedBusinessCoverPhotoImageView)
  {
    [(MUStackLayout *)v3 addArrangedLayoutItem:"addArrangedLayoutItem:"];
    [(MUStackLayout *)v3 setAlignment:0 forArrangedLayoutItem:self->_verifiedBusinessContainerView];
    if ([(MUPlaceHeaderViewModel *)self->_viewModel supportsLogo])
    {
      double v7 = [MUSizeLayout alloc];
      verifiedBusinessLogoImageView = self->_verifiedBusinessLogoImageView;
      if (MUIdiomInTraitEnvironment(self) == 5) {
        double v9 = 40.0;
      }
      else {
        double v9 = 56.0;
      }
      if (MUIdiomInTraitEnvironment(self) == 5) {
        double v10 = 40.0;
      }
      else {
        double v10 = 56.0;
      }
      v66 = -[MUSizeLayout initWithItem:size:](v7, "initWithItem:size:", verifiedBusinessLogoImageView, v9, v10);
      LODWORD(v11) = 1148829696;
      [(MUSizeLayout *)v66 setPriority:v11];
      [v4 addObject:v66];
      double v12 = [(MUVerifiedLogoImageView *)self->_verifiedBusinessLogoImageView bottomAnchor];
      id v13 = [(MUImageView *)self->_verifiedBusinessCoverPhotoImageView bottomAnchor];
      double v14 = [v12 constraintEqualToAnchor:v13 constant:self->_headerMetrics.coverPhotoMetrics.coverPhotoBottomToLogoBottomSpacing];

      LODWORD(v15) = 1148829696;
      [v14 setPriority:v15];
      [v69 addObject:v14];
      double v16 = [(MUVerifiedLogoImageView *)self->_verifiedBusinessLogoImageView bottomAnchor];
      double v17 = [(UIView *)self->_verifiedBusinessContainerView bottomAnchor];
      objc_super v18 = [v16 constraintEqualToAnchor:v17];
      [v69 addObject:v18];

      v19 = [(MUVerifiedLogoImageView *)self->_verifiedBusinessLogoImageView leadingAnchor];
      v20 = [(UIView *)self->_verifiedBusinessContainerView leadingAnchor];
      id v21 = [v19 constraintEqualToAnchor:v20 constant:16.0];
      [v69 addObject:v21];

      uint64_t v22 = 11;
    }
    else
    {
      uint64_t v22 = 15;
    }
    if ([(MUPlaceCoverPhotoOptions *)self->_coverPhotoOptions insetsCoverPhoto])
    {
      double v26 = 16.0;
      double v27 = 0.0;
      double v28 = 8.0;
      double v29 = 8.0;
    }
    else
    {
      double v26 = *MEMORY[0x1E4FB12A8];
      double v29 = *(double *)(MEMORY[0x1E4FB12A8] + 8);
      double v27 = *(double *)(MEMORY[0x1E4FB12A8] + 16);
      double v28 = *(double *)(MEMORY[0x1E4FB12A8] + 24);
    }
    v30 = [MUEdgeLayout alloc];
    LODWORD(v31) = 1148846080;
    uint64_t v23 = -[MUEdgeLayout initWithItem:container:insets:edges:priority:](v30, "initWithItem:container:insets:edges:priority:", self->_verifiedBusinessCoverPhotoImageView, self->_verifiedBusinessContainerView, v22, v26, v29, v27, v28, v31);
    [v4 addObject:v23];
    coverPhotoTransitionController = self->_coverPhotoTransitionController;
    [(MUPlaceHeaderView *)self frame];
    [(MUPlaceCoverPhotoTransitionController *)coverPhotoTransitionController coverPhotoHeightForProposedWidth:CGRectGetWidth(v71)];
    double v34 = v33;
    v35 = [(UIView *)self->_verifiedBusinessContainerView heightAnchor];
    v36 = [v35 constraintEqualToConstant:v34];
    verifiedBusinessHeaderHeightConstraint = self->_verifiedBusinessHeaderHeightConstraint;
    self->_verifiedBusinessHeaderHeightConstraint = v36;

    [v69 addObject:self->_verifiedBusinessHeaderHeightConstraint];
    double v24 = [(UILayoutGuide *)self->_topToTitleLayoutGuide topAnchor];
    double v25 = [(MUImageView *)self->_verifiedBusinessCoverPhotoImageView bottomAnchor];
    BOOL v38 = [v24 constraintEqualToAnchor:v25];
    [v69 addObject:v38];
  }
  else
  {
    uint64_t v23 = [(UILayoutGuide *)self->_topToTitleLayoutGuide topAnchor];
    double v24 = [(MUPlaceHeaderView *)self topAnchor];
    double v25 = [(MUEdgeLayout *)v23 constraintEqualToAnchor:v24];
    [v5 addObject:v25];
  }

  v67 = [(UILayoutGuide *)self->_topToTitleLayoutGuide leadingAnchor];
  v63 = [(MUPlaceHeaderView *)self leadingAnchor];
  double v39 = [v67 constraintEqualToAnchor:v63];
  v70[0] = v39;
  v40 = [(UILayoutGuide *)self->_topToTitleLayoutGuide trailingAnchor];
  v41 = [(UILabel *)self->_titleLabel trailingAnchor];
  v42 = [v40 constraintEqualToAnchor:v41];
  v70[1] = v42;
  v43 = [(UILayoutGuide *)self->_topToTitleLayoutGuide bottomAnchor];
  v44 = [(UILabel *)self->_titleLabel bottomAnchor];
  v45 = [v43 constraintEqualToAnchor:v44];
  v70[2] = v45;
  v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:3];
  [v69 addObjectsFromArray:v46];

  if (self->_titleLabel)
  {
    [(MUStackLayout *)v65 addArrangedLayoutItem:"addArrangedLayoutItem:"];
    [(MUPlaceHeaderView *)self _trailingPadding];
    -[MUStackLayout setPadding:forArrangedLayoutItem:](v65, "setPadding:forArrangedLayoutItem:", self->_titleLabel, 16.0, 19.0, 0.0, v47);
  }
  if (self->_secondaryTitleLabel)
  {
    if (self->_containmentLabel) {
      double v48 = 2.0;
    }
    else {
      double v48 = 4.0;
    }
    [(MUStackLayout *)v65 addArrangedLayoutItem:"addArrangedLayoutItem:"];
    -[MUStackLayout setPadding:forArrangedLayoutItem:](v65, "setPadding:forArrangedLayoutItem:", self->_secondaryTitleLabel, 0.0, 19.0, 0.0, 19.0);
  }
  else
  {
    double v48 = 4.0;
  }
  viewModel = self->_viewModel;
  v50 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  v51 = [MEMORY[0x1E4FB1618] labelColor];
  v52 = +[MUInfoCardStyle tintColor];
  v68 = [(MUPlaceHeaderViewModel *)viewModel enclosingPlaceAttributedStringWithFont:v50 labelColor:v51 tokenColor:v52];

  if (self->_containmentLabel && [v68 length])
  {
    [(MUStackLayout *)v65 addArrangedLayoutItem:self->_containmentLabel];
    -[MUStackLayout setPadding:forArrangedLayoutItem:](v65, "setPadding:forArrangedLayoutItem:", self->_containmentLabel, v48, 19.0, 0.0, 19.0);
  }
  if (self->_transitInfoLabelView)
  {
    [(MUStackLayout *)v65 addArrangedLayoutItem:"addArrangedLayoutItem:"];
    -[MUStackLayout setPadding:forArrangedLayoutItem:](v65, "setPadding:forArrangedLayoutItem:", self->_transitInfoLabelView, v48, 19.0, 0.0, 19.0);
  }
  if (self->_verifiedLabel)
  {
    [(MUStackLayout *)v65 addArrangedLayoutItem:"addArrangedLayoutItem:"];
    -[MUStackLayout setPadding:forArrangedLayoutItem:](v65, "setPadding:forArrangedLayoutItem:", self->_verifiedLabel, v48, 19.0, 0.0, 19.0);
  }
  if (self->_contactAddressDescription)
  {
    [(MUStackLayout *)v65 addArrangedLayoutItem:"addArrangedLayoutItem:"];
    -[MUStackLayout setPadding:forArrangedLayoutItem:](v65, "setPadding:forArrangedLayoutItem:", self->_contactAddressDescription, v48, 19.0, 0.0, 19.0);
  }
  if ([(MUPlaceCoverPhotoOptions *)self->_coverPhotoOptions showShareButton])
  {
    BOOL v53 = [(MUPlaceHeaderViewModel *)self->_viewModel supportsEnhancedBusinessHeader];
    verifiedBusinessCoverPhotoImageView = self;
    if (v53) {
      verifiedBusinessCoverPhotoImageView = self->_verifiedBusinessCoverPhotoImageView;
    }
    id v55 = verifiedBusinessCoverPhotoImageView;
    v56 = [[MUEdgeLayout alloc] initWithItem:self->_shareButton container:v55];
    [(MUEdgeLayout *)v56 setEdges:9];
    [v64 addObject:v56];
    if (self->_titleLabel)
    {
      v57 = [(MUCardButton *)self->_shareButton leadingAnchor];
      uint64_t v58 = [(UILabel *)self->_titleLabel trailingAnchor];
      v59 = [v57 constraintGreaterThanOrEqualToAnchor:v58];
      [v69 addObject:v59];
    }
  }
  v60 = (void *)MEMORY[0x1E4F28DC8];
  v61 = (void *)[v64 copy];
  v62 = (void *)[v69 copy];
  objc_msgSend(v60, "_mapsui_activateLayouts:constraints:", v61, v62);
}

- (void)_updateAppearance
{
  v52[1] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  if ([(MUPlaceHeaderViewModel *)self->_viewModel hasHeroImage])
  {
    viewModel = self->_viewModel;
    id v4 = [(MUPlaceHeaderView *)self traitCollection];
    [v4 displayScale];
    double v6 = v5;
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __38__MUPlaceHeaderView__updateAppearance__block_invoke;
    v46[3] = &unk_1E574FC90;
    objc_copyWeak(&v47, &location);
    -[MUPlaceHeaderViewModel loadHeroImageWithFrameSize:displayScale:completion:](viewModel, "loadHeroImageWithFrameSize:displayScale:completion:", v46, 86.0, 86.0, v6);

    objc_destroyWeak(&v47);
  }
  if ([(MUPlaceHeaderViewModel *)self->_viewModel supportsEnhancedBusinessHeader])
  {
    [(MUPlaceHeaderView *)self _updateCoverPhoto];
    if ([(MUPlaceHeaderViewModel *)self->_viewModel supportsLogo])
    {
      double v7 = self->_viewModel;
      v8 = self;
      if (MUIdiomInTraitEnvironment(v8) == 5) {
        double v9 = 40.0;
      }
      else {
        double v9 = 56.0;
      }

      double v10 = v8;
      if (MUIdiomInTraitEnvironment(v10) == 5) {
        double v11 = 40.0;
      }
      else {
        double v11 = 56.0;
      }

      double v12 = [(MUPlaceHeaderView *)v10 traitCollection];
      [v12 displayScale];
      double v14 = v13;
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __38__MUPlaceHeaderView__updateAppearance__block_invoke_2;
      v44[3] = &unk_1E574FC90;
      objc_copyWeak(&v45, &location);
      -[MUPlaceHeaderViewModel loadVerifiedLogoImageWithFrameSize:displayScale:completion:](v7, "loadVerifiedLogoImageWithFrameSize:displayScale:completion:", v44, v9, v11, v14);

      objc_destroyWeak(&v45);
    }
  }
  double v15 = [(MUPlaceHeaderViewModel *)self->_viewModel placeName];
  BOOL v16 = [v15 length] == 0;

  if (!v16)
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v18 = objc_alloc(MEMORY[0x1E4F28B18]);
    v19 = [(MUPlaceHeaderViewModel *)self->_viewModel placeName];
    uint64_t v51 = *MEMORY[0x1E4FB06F8];
    v20 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2988]];
    id v21 = objc_msgSend(v20, "_mapkit_fontWithSymbolicTraits:", 2);
    v52[0] = v21;
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
    uint64_t v23 = (void *)[v18 initWithString:v19 attributes:v22];

    [v17 addObject:v23];
    if ([(MUPlaceHeaderViewModel *)self->_viewModel isClaimed])
    {
      uint64_t v24 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
      [v17 addObject:v24];
      v41 = (void *)v24;
      id v25 = objc_alloc_init(MEMORY[0x1E4FB0870]);
      double v26 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.seal.fill"];
      double v27 = (void *)MEMORY[0x1E4FB1830];
      double v28 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2998]];
      double v29 = objc_msgSend(v28, "_mapkit_fontWithSymbolicTraits:", 2);
      v30 = [v27 configurationWithFont:v29 scale:1];
      double v31 = [v26 imageWithConfiguration:v30];
      v32 = [v31 imageWithRenderingMode:2];
      [v25 setImage:v32];

      double v33 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v25];
      double v34 = (void *)[v33 mutableCopy];

      uint64_t v49 = *MEMORY[0x1E4FB0700];
      v35 = [MEMORY[0x1E4FB1618] systemBlueColor];
      v50 = v35;
      v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      objc_msgSend(v34, "addAttributes:range:", v36, 0, objc_msgSend(v34, "length"));

      [v17 addObject:v34];
    }
    v37 = objc_msgSend(v17, "copy", v41);
    BOOL v38 = +[MapsUILayout buildAttributedDisplayStringForComponents:v37];
    [(UILabel *)self->_titleLabel setAttributedText:v38];
  }
  double v39 = [(MUPlaceHeaderViewModel *)self->_viewModel placeSecondaryName];
  [(UILabel *)self->_secondaryTitleLabel setText:v39];

  if ([(MUPlaceHeaderViewModel *)self->_viewModel hasInitialData])
  {
    [(MUPlaceHeaderView *)self _updateContainmentLineWithAttributedString];
  }
  else if ([(MUPlaceHeaderViewModel *)self->_viewModel hasEnclosingPlace])
  {
    v40 = self->_viewModel;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __38__MUPlaceHeaderView__updateAppearance__block_invoke_3;
    v42[3] = &unk_1E574FCB8;
    objc_copyWeak(&v43, &location);
    [(MUPlaceHeaderViewModel *)v40 refineEnclosingMapItemWithCompletion:v42];
    objc_destroyWeak(&v43);
  }
  objc_destroyWeak(&location);
}

void __38__MUPlaceHeaderView__updateAppearance__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  double v6 = WeakRetained;
  if (!a3 && WeakRetained) {
    [WeakRetained[51] setImage:v7 animated:1];
  }
}

void __38__MUPlaceHeaderView__updateAppearance__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && v6 && !a3) {
    [WeakRetained[53] setImage:v6 animated:0];
  }
}

void __38__MUPlaceHeaderView__updateAppearance__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateContainmentLineWithAttributedString];
    id WeakRetained = v2;
  }
}

- (void)_updateContainmentLineWithAttributedString
{
  viewModel = self->_viewModel;
  id v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  id v4 = [MEMORY[0x1E4FB1618] labelColor];
  double v5 = +[MUInfoCardStyle tintColor];
  id v6 = [(MUPlaceHeaderViewModel *)viewModel enclosingPlaceAttributedStringWithFont:v7 labelColor:v4 tokenColor:v5];
  [(MULinkView *)self->_containmentLabel setAttributedText:v6];
}

- (void)setViewModel:(id)a3
{
  id v5 = a3;
  if ((-[MUPlaceHeaderViewModel isEqual:](self->_viewModel, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    [(MUPlaceHeaderView *)self _updateAppearance];
  }
}

- (void)_contentSizeDidChange
{
  id v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2988]];
  id v4 = objc_msgSend(v3, "_mapkit_fontWithSymbolicTraits:", 2);
  [(UILabel *)self->_titleLabel setFont:v4];

  id v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
  [(UILabel *)self->_secondaryTitleLabel setFont:v5];

  id v6 = [(MUPlaceHeaderView *)self _verifiedAttributedString];
  [(UILabel *)self->_verifiedLabel setAttributedText:v6];

  id v7 = [(MUPlaceHeaderViewModel *)self->_viewModel addressDescriptionForContact];
  [(UILabel *)self->_contactAddressDescription setAttributedText:v7];
}

- (void)_tappedEnclosingPlace
{
  if (![(MUPlaceHeaderView *)self suppressContainmentTap])
  {
    objc_initWeak(&location, self);
    [(MUPlaceHeaderView *)self beginAnimatingActivityIndicator];
    viewModel = self->_viewModel;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __42__MUPlaceHeaderView__tappedEnclosingPlace__block_invoke;
    v4[3] = &unk_1E574FCB8;
    objc_copyWeak(&v5, &location);
    [(MUPlaceHeaderViewModel *)viewModel refineEnclosingMapItemWithCompletion:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __42__MUPlaceHeaderView__tappedEnclosingPlace__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && v7 && !a3)
  {
    id v6 = [WeakRetained delegate];
    [v6 headerView:WeakRetained didSelectEnclosingMapItem:v7];

    [WeakRetained endAnimatingActivityIndicatorWithError:0];
  }
}

- (void)setSuppressContainmentTap:(BOOL)a3
{
  if (self->_suppressContainmentTap != a3)
  {
    self->_suppressContainmentTap = a3;
    [(MULinkView *)self->_containmentLabel setUserInteractionEnabled:!a3];
  }
}

- (void)reloadTrailingConstraint
{
  [(MUStackLayout *)self->_stackLayout paddingForArrangedLayoutItem:self->_titleLabel];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  [(MUPlaceHeaderView *)self _trailingPadding];
  stackLayout = self->_stackLayout;
  titleLabel = self->_titleLabel;
  -[MUStackLayout setPadding:forArrangedLayoutItem:](stackLayout, "setPadding:forArrangedLayoutItem:", titleLabel, v4, v6, v8, v9);
}

- (void)hideTitle:(BOOL)a3
{
  BOOL v3 = a3;
  -[UILabel setHidden:](self->_titleLabel, "setHidden:");
  verifiedBusinessContainerView = self->_verifiedBusinessContainerView;
  [(UIView *)verifiedBusinessContainerView setHidden:v3];
}

- (double)verifiedBusinessHeaderHeight
{
  [(NSLayoutConstraint *)self->_verifiedBusinessHeaderHeightConstraint constant];
  return result;
}

- (void)setVerifiedBusinessHeaderHeight:(double)a3
{
}

- (void)setVerifiedBusinessHeaderExpansionProgress:(double)a3
{
}

- (double)verifiedBusinessHeaderAlpha
{
  [(UIView *)self->_verifiedBusinessContainerView alpha];
  return result;
}

- (void)setVerifiedBusinessHeaderAlpha:(double)a3
{
}

+ (double)minimalModeHeight
{
  id v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2988]];
  BOOL v3 = objc_msgSend(v2, "_mapkit_fontWithSymbolicTraits:", 2);
  [v3 pointSize];
  double v5 = v4 + 16.0 + 4.0;
  double v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  [v6 pointSize];
  double v8 = v5 + v7 + 14.0;

  return v8;
}

- (double)_trailingPadding
{
  id trailingConstraintProvider = (void (**)(void))self->_trailingConstraintProvider;
  if (!trailingConstraintProvider) {
    return 19.0;
  }
  trailingConstraintProvider[2]();
  return result;
}

- (void)beginAnimatingActivityIndicator
{
  [(MULinkView *)self->_containmentLabel setAlpha:0.3];
  containmentLabel = self->_containmentLabel;
  [(MULinkView *)containmentLabel setUserInteractionEnabled:0];
}

- (void)endAnimatingActivityIndicatorWithError:(id)a3
{
  -[MULinkView setAlpha:](self->_containmentLabel, "setAlpha:", a3, 1.0);
  containmentLabel = self->_containmentLabel;
  [(MULinkView *)containmentLabel setUserInteractionEnabled:1];
}

- (void)_shareButtonPressed
{
  double v6 = objc_alloc_init(MUPresentationOptions);
  [(MUPresentationOptions *)v6 setSourceView:self->_shareButton];
  BOOL v3 = [(MUPlaceHeaderView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    double v5 = [(MUPlaceHeaderView *)self delegate];
    [v5 headerView:self didSelectShareWithPresentationOptions:v6];
  }
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)MUPlaceHeaderView;
  [(MUPlaceHeaderView *)&v8 layoutSubviews];
  [(MUPlaceHeaderView *)self bounds];
  if (!CGRectEqualToRect(v9, self->_cachedBounds))
  {
    [(MUPlaceHeaderView *)self bounds];
    self->_cachedBounds.origin.x = v3;
    self->_cachedBounds.origin.y = v4;
    self->_cachedBounds.size.width = v5;
    self->_cachedBounds.size.height = v6;
    if ([(MUPlaceHeaderViewModel *)self->_viewModel supportsEnhancedBusinessHeader])
    {
      coverPhotoTransitionController = self->_coverPhotoTransitionController;
      [(MUPlaceHeaderView *)self frame];
      [(MUPlaceCoverPhotoTransitionController *)coverPhotoTransitionController coverPhotoHeightForProposedWidth:CGRectGetWidth(v10)];
      -[MUPlaceHeaderView setVerifiedBusinessHeaderHeight:](self, "setVerifiedBusinessHeaderHeight:");
      [(MUPlaceHeaderView *)self _updateCoverPhoto];
    }
    [(MUPlaceHeaderView *)self reloadTrailingConstraint];
  }
}

- (void)_updateCoverPhoto
{
  [(MUPlaceHeaderView *)self frame];
  double v4 = v3;
  objc_initWeak(&location, self);
  viewModel = self->_viewModel;
  CGFloat v6 = [(MUPlaceHeaderView *)self traitCollection];
  [v6 displayScale];
  double v8 = v7;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__MUPlaceHeaderView__updateCoverPhoto__block_invoke;
  v9[3] = &unk_1E574FC90;
  objc_copyWeak(&v10, &location);
  -[MUPlaceHeaderViewModel loadCoverPhotoWithFrameSize:displayScale:completion:](viewModel, "loadCoverPhotoWithFrameSize:displayScale:completion:", v9, v4, v4, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __38__MUPlaceHeaderView__updateCoverPhoto__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && v6 && !a3) {
    [WeakRetained[52] setImage:v6 animated:0];
  }
}

- (BOOL)shouldBlurChromeHeaderButtons
{
  return [(MUPlaceCoverPhotoTransitionController *)self->_coverPhotoTransitionController shouldBlurChromeHeaderButtons];
}

- (UIView)viewForContainmentString
{
  return (UIView *)self->_containmentLabel;
}

- (MUPlaceHeaderViewModel)viewModel
{
  return self->_viewModel;
}

- (MUPlaceHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MUPlaceHeaderViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)suppressContainmentTap
{
  return self->_suppressContainmentTap;
}

- (MUPlaceCoverPhotoOptions)coverPhotoOptions
{
  return self->_coverPhotoOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverPhotoOptions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_coverPhotoTransitionController, 0);
  objc_storeStrong((id *)&self->_stackLayout, 0);
  objc_storeStrong((id *)&self->_topToTitleLayoutGuide, 0);
  objc_storeStrong((id *)&self->_verifiedBusinessHeaderHeightConstraint, 0);
  objc_storeStrong((id *)&self->_titleTrailingConstraint, 0);
  objc_storeStrong(&self->_trailingConstraintProvider, 0);
  objc_storeStrong((id *)&self->_transitInfoLabelView, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_verifiedBusinessContainerView, 0);
  objc_storeStrong((id *)&self->_contactAddressDescription, 0);
  objc_storeStrong((id *)&self->_verifiedLabel, 0);
  objc_storeStrong((id *)&self->_containmentLabel, 0);
  objc_storeStrong((id *)&self->_secondaryTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_verifiedBusinessLogoImageView, 0);
  objc_storeStrong((id *)&self->_verifiedBusinessCoverPhotoImageView, 0);
  objc_storeStrong((id *)&self->_heroImageView, 0);
}

@end