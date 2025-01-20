@interface CPSAppMetadataView
- (CGSize)intrinsicContentSize;
- (CPSAppMetadataView)initWithCoder:(id)a3;
- (CPSAppMetadataView)initWithFrame:(CGRect)a3;
- (UIImage)appIcon;
- (void)_setUpSubviews;
- (void)_updateAppStoreButtonConstraints;
- (void)setAppIcon:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateWithMetadata:(id)a3;
@end

@implementation CPSAppMetadataView

- (CPSAppMetadataView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CPSAppMetadataView;
  v3 = -[CPSAppMetadataView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CPSAppMetadataView *)v3 _setUpSubviews];
    [(CPSAppMetadataView *)v4 updateWithMetadata:0];
    v5 = v4;
  }

  return v4;
}

- (CPSAppMetadataView)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"-initWithCoder: is not supported." userInfo:0];
  objc_exception_throw(v4);
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x1E4F43ED8];
  double v3 = *MEMORY[0x1E4F43ED8];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_setUpSubviews
{
  v90[12] = *MEMORY[0x1E4F143B8];
  double v3 = (void *)MEMORY[0x1E4F42AA0];
  id v4 = [MEMORY[0x1E4F428B8] systemFillColor];
  objc_msgSend(v3, "cps_viewWithBackgroundColor:cornerRadius:", v4, 5.0);
  v5 = (UIImageView *)objc_claimAutoreleasedReturnValue();
  appIconView = self->_appIconView;
  self->_appIconView = v5;

  [(UIImageView *)self->_appIconView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_appIconView setAccessibilityIgnoresInvertColors:1];
  LODWORD(v7) = 1144766464;
  [(UIImageView *)self->_appIconView setContentCompressionResistancePriority:0 forAxis:v7];
  [(CPSAppMetadataView *)self addSubview:self->_appIconView];
  v8 = [CPSVibrantLabel alloc];
  v9 = [(CPSVibrantLabel *)v8 initWithTextStyle:*MEMORY[0x1E4F43888] textVariant:256 vibrancyEffectStyle:1];
  poweredByVibrantLabel = self->_poweredByVibrantLabel;
  self->_poweredByVibrantLabel = v9;

  [(CPSVibrantLabel *)self->_poweredByVibrantLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v11 = _CPSLocalizedString();
  [(CPSVibrantLabel *)self->_poweredByVibrantLabel setText:v11];

  [(CPSVibrantLabel *)self->_poweredByVibrantLabel setAlpha:0.0];
  [(CPSAppMetadataView *)self addSubview:self->_poweredByVibrantLabel];
  v12 = [CPSVibrantLabel alloc];
  v13 = [(CPSVibrantLabel *)v12 initWithTextStyle:*MEMORY[0x1E4F43890] textVariant:1280 vibrancyEffectStyle:0];
  appNameVibrantLabel = self->_appNameVibrantLabel;
  self->_appNameVibrantLabel = v13;

  [(CPSVibrantLabel *)self->_appNameVibrantLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CPSVibrantLabel *)self->_appNameVibrantLabel setText:*MEMORY[0x1E4F590C0]];
  [(CPSAppMetadataView *)self addSubview:self->_appNameVibrantLabel];
  v15 = objc_alloc_init(CPSContentRatingContainerView);
  contentRatingContainerView = self->_contentRatingContainerView;
  self->_contentRatingContainerView = v15;

  [(CPSContentRatingContainerView *)self->_contentRatingContainerView setUserInteractionEnabled:0];
  [(CPSContentRatingContainerView *)self->_contentRatingContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CPSAppMetadataView *)self addSubview:self->_contentRatingContainerView];
  v17 = objc_alloc_init(CPSAppStoreButton);
  appStoreButton = self->_appStoreButton;
  self->_appStoreButton = v17;

  [(CPSAppStoreButton *)self->_appStoreButton setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v19) = 1144766464;
  [(CPSAppStoreButton *)self->_appStoreButton setContentCompressionResistancePriority:0 forAxis:v19];
  [(CPSAppStoreButton *)self->_appStoreButton setUserInteractionEnabled:0];
  [(CPSAppStoreButton *)self->_appStoreButton setHidden:1];
  [(CPSAppMetadataView *)self addSubview:self->_appStoreButton];
  v63 = (void *)MEMORY[0x1E4F28DC8];
  v84 = [(UIImageView *)self->_appIconView centerYAnchor];
  v81 = [(CPSAppMetadataView *)self centerYAnchor];
  v78 = [v84 constraintEqualToAnchor:v81];
  v90[0] = v78;
  v75 = [(UIImageView *)self->_appIconView leadingAnchor];
  v73 = [(CPSAppMetadataView *)self leadingAnchor];
  v72 = [v75 constraintEqualToAnchor:v73];
  v90[1] = v72;
  v71 = [(UIImageView *)self->_appIconView heightAnchor];
  v70 = [v71 constraintEqualToConstant:28.0];
  v90[2] = v70;
  v69 = [(UIImageView *)self->_appIconView widthAnchor];
  v68 = [(UIImageView *)self->_appIconView heightAnchor];
  v67 = [v69 constraintEqualToAnchor:v68];
  v90[3] = v67;
  v66 = [(CPSVibrantLabel *)self->_poweredByVibrantLabel topAnchor];
  v65 = [(CPSAppMetadataView *)self topAnchor];
  v64 = [v66 constraintEqualToAnchor:v65];
  v90[4] = v64;
  v62 = [(CPSVibrantLabel *)self->_poweredByVibrantLabel leadingAnchor];
  v61 = [(UIImageView *)self->_appIconView trailingAnchor];
  v60 = [v62 constraintEqualToAnchor:v61 constant:8.0];
  v90[5] = v60;
  v59 = [(CPSVibrantLabel *)self->_poweredByVibrantLabel bottomAnchor];
  v58 = [(CPSVibrantLabel *)self->_appNameVibrantLabel topAnchor];
  v57 = [v59 constraintEqualToAnchor:v58 constant:-1.0];
  v90[6] = v57;
  v56 = [(CPSVibrantLabel *)self->_poweredByVibrantLabel trailingAnchor];
  v55 = [(CPSAppMetadataView *)self trailingAnchor];
  v54 = [v56 constraintLessThanOrEqualToAnchor:v55];
  v90[7] = v54;
  v53 = [(CPSVibrantLabel *)self->_appNameVibrantLabel leadingAnchor];
  v52 = [(CPSVibrantLabel *)self->_poweredByVibrantLabel leadingAnchor];
  v51 = [v53 constraintEqualToAnchor:v52];
  v90[8] = v51;
  v50 = [(CPSContentRatingContainerView *)self->_contentRatingContainerView leadingAnchor];
  v20 = [(CPSVibrantLabel *)self->_appNameVibrantLabel trailingAnchor];
  v21 = [v50 constraintEqualToAnchor:v20 constant:4.0];
  v90[9] = v21;
  v22 = [(CPSContentRatingContainerView *)self->_contentRatingContainerView bottomAnchor];
  v23 = [(CPSVibrantLabel *)self->_appNameVibrantLabel firstBaselineAnchor];
  v24 = [v22 constraintEqualToAnchor:v23 constant:1.0];
  v90[10] = v24;
  v25 = [(CPSContentRatingContainerView *)self->_contentRatingContainerView trailingAnchor];
  v26 = [(CPSAppMetadataView *)self trailingAnchor];
  v27 = [v25 constraintLessThanOrEqualToAnchor:v26];
  v90[11] = v27;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:12];
  [v63 activateConstraints:v28];

  v85 = [(CPSAppStoreButton *)self->_appStoreButton leadingAnchor];
  v82 = [(CPSVibrantLabel *)self->_poweredByVibrantLabel leadingAnchor];
  v79 = [v85 constraintEqualToAnchor:v82 constant:-2.0];
  v89[0] = v79;
  v76 = [(CPSAppStoreButton *)self->_appStoreButton topAnchor];
  v29 = [(CPSVibrantLabel *)self->_appNameVibrantLabel bottomAnchor];
  v30 = [v76 constraintEqualToAnchor:v29 constant:1.0];
  v89[1] = v30;
  v31 = [(CPSAppStoreButton *)self->_appStoreButton trailingAnchor];
  v32 = [(CPSAppMetadataView *)self trailingAnchor];
  v33 = [v31 constraintLessThanOrEqualToAnchor:v32];
  v89[2] = v33;
  v34 = [(CPSAppStoreButton *)self->_appStoreButton bottomAnchor];
  v35 = [(CPSAppMetadataView *)self bottomAnchor];
  v36 = [v34 constraintEqualToAnchor:v35];
  v89[3] = v36;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:4];
  leadingAppStoreButtonConstraints = self->_leadingAppStoreButtonConstraints;
  self->_leadingAppStoreButtonConstraints = v37;

  v86 = [(CPSAppStoreButton *)self->_appStoreButton leadingAnchor];
  v83 = [(CPSContentRatingContainerView *)self->_contentRatingContainerView trailingAnchor];
  v80 = [v86 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v83 multiplier:1.0];
  v88[0] = v80;
  v77 = [(CPSAppStoreButton *)self->_appStoreButton leadingAnchor];
  v87 = [(CPSVibrantLabel *)self->_poweredByVibrantLabel trailingAnchor];
  v74 = [v77 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v87 multiplier:1.0];
  v88[1] = v74;
  v39 = [(CPSAppStoreButton *)self->_appStoreButton trailingAnchor];
  v40 = [(CPSAppMetadataView *)self trailingAnchor];
  v41 = [v39 constraintEqualToAnchor:v40];
  v88[2] = v41;
  v42 = [(CPSAppStoreButton *)self->_appStoreButton centerYAnchor];
  v43 = [(CPSAppMetadataView *)self centerYAnchor];
  v44 = [v42 constraintEqualToAnchor:v43];
  v88[3] = v44;
  v45 = [(CPSVibrantLabel *)self->_appNameVibrantLabel bottomAnchor];
  v46 = [(CPSAppMetadataView *)self bottomAnchor];
  v47 = [v45 constraintEqualToAnchor:v46];
  v88[4] = v47;
  v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:5];
  trailingAppStoreButtonConstraints = self->_trailingAppStoreButtonConstraints;
  self->_trailingAppStoreButtonConstraints = v48;

  [(CPSAppMetadataView *)self _updateAppStoreButtonConstraints];
}

- (void)updateWithMetadata:(id)a3
{
  id v15 = a3;
  id v4 = [v15 fullAppName];
  if (v4)
  {
    [(CPSVibrantLabel *)self->_poweredByVibrantLabel setAlpha:1.0];
    [(CPSVibrantLabel *)self->_appNameVibrantLabel setText:v4];
    if ([v15 hasAppMetadata] && (objc_msgSend(v15, "fullAppOnly") & 1) == 0) {
      [(CPSAppStoreButton *)self->_appStoreButton setHidden:0];
    }
    v5 = [v15 fullAppContentRating];
    v6 = objc_msgSend(MEMORY[0x1E4F42A80], "cps_imageNamed:", v5);
    int v7 = [v5 hasSuffix:@"-Brazil"];
    if (v7)
    {
      v8 = objc_msgSend(MEMORY[0x1E4F42A80], "cps_imageNamed:", @"4+");
      [v8 size];

      v9 = [(CPSAppMetadataView *)self traitCollection];
      [v9 displayScale];
      UISizeRoundToScale();
      double v11 = v10;
      double v13 = v12;

      uint64_t v14 = objc_msgSend(v6, "cps_resizedImageWithSize:", v11, v13);

      v6 = (void *)v14;
    }
    [(CPSContentRatingContainerView *)self->_contentRatingContainerView setImage:v6 usesVibrantAppearance:v7 ^ 1u];
  }
}

- (UIImage)appIcon
{
  return [(UIImageView *)self->_appIconView image];
}

- (void)setAppIcon:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F6F248]);
    id v6 = objc_alloc(MEMORY[0x1E4F6F238]);
    id v7 = v4;
    uint64_t v8 = [v7 CGImage];
    [v7 scale];
    v9 = objc_msgSend(v6, "initWithCGImage:scale:", v8);
    v18[0] = v9;
    double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    double v11 = (void *)[v5 initWithImages:v10];
  }
  else
  {
    double v11 = [MEMORY[0x1E4F6F248] genericApplicationIcon];
  }
  double v12 = [MEMORY[0x1E4F6F258] imageDescriptorNamed:*MEMORY[0x1E4F6F2B8]];
  double v13 = [v11 imageForImageDescriptor:v12];

  uint64_t v14 = (void *)MEMORY[0x1E4F42A80];
  uint64_t v15 = [v13 CGImage];
  [v13 scale];
  v16 = objc_msgSend(v14, "imageWithCGImage:scale:orientation:", v15, 0);
  [(UIImageView *)self->_appIconView setImage:v16];

  [(UIImageView *)self->_appIconView _setContinuousCornerRadius:0.0];
  v17 = [MEMORY[0x1E4F428B8] clearColor];
  [(UIImageView *)self->_appIconView setBackgroundColor:v17];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CPSAppMetadataView;
  id v4 = a3;
  [(CPSAppMetadataView *)&v8 traitCollectionDidChange:v4];
  id v5 = [(CPSAppMetadataView *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];

  id v7 = [v4 preferredContentSizeCategory];

  LOBYTE(v4) = [v6 isEqualToString:v7];
  if ((v4 & 1) == 0) {
    [(CPSAppMetadataView *)self _updateAppStoreButtonConstraints];
  }
}

- (void)_updateAppStoreButtonConstraints
{
  double v3 = [(CPSAppMetadataView *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  id v6 = (void *)MEMORY[0x1E4F28DC8];
  leadingAppStoreButtonConstraints = self->_leadingAppStoreButtonConstraints;
  trailingAppStoreButtonConstraints = self->_trailingAppStoreButtonConstraints;

  objc_msgSend(v6, "cps_if:thenActivateConstraints:elseActivateConstraints:", IsAccessibilityCategory, leadingAppStoreButtonConstraints, trailingAppStoreButtonConstraints);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingAppStoreButtonConstraints, 0);
  objc_storeStrong((id *)&self->_leadingAppStoreButtonConstraints, 0);
  objc_storeStrong((id *)&self->_appStoreButton, 0);
  objc_storeStrong((id *)&self->_contentRatingContainerView, 0);
  objc_storeStrong((id *)&self->_appNameVibrantLabel, 0);
  objc_storeStrong((id *)&self->_poweredByVibrantLabel, 0);

  objc_storeStrong((id *)&self->_appIconView, 0);
}

@end