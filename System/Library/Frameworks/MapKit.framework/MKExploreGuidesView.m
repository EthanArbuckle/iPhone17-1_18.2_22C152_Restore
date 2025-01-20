@interface MKExploreGuidesView
+ (double)defaultHeight;
- (GEOExploreGuides)exploreGuide;
- (MKExploreGuidesView)initWithExploreGuides:(id)a3 tapHandler:(id)a4;
- (UIButton)button;
- (UIFont)defaultTitleFont;
- (UIFont)maxSupportedTitleFont;
- (UIImageView)imageView;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIStackView)labelsStack;
- (UIView)contentView;
- (id)tapHandler;
- (void)didSelectExploreGuides:(id)a3;
- (void)setButton:(id)a3;
- (void)setContentView:(id)a3;
- (void)setDefaultTitleFont:(id)a3;
- (void)setExploreGuide:(id)a3;
- (void)setImageView:(id)a3;
- (void)setLabelsStack:(id)a3;
- (void)setMaxSupportedTitleFont:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTapHandler:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setupConstraints;
- (void)setupImage;
- (void)setupSubviews;
- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4;
- (void)updateUI;
@end

@implementation MKExploreGuidesView

+ (double)defaultHeight
{
  return 85.0;
}

- (void)setupConstraints
{
  v63[12] = *MEMORY[0x1E4F143B8];
  v3 = -[MKPlaceCollectionsSizeController initWithCollectionsConfiguration:isSingleCollection:usingTraitCollections:inContext:]([MKPlaceCollectionsSizeController alloc], "initWithCollectionsConfiguration:isSingleCollection:usingTraitCollections:inContext:", 0, 1, 0, self, 7);
  v40 = (void *)MEMORY[0x1E4F28DC8];
  v62 = [(MKExploreGuidesView *)self button];
  v61 = [v62 leadingAnchor];
  v60 = [(MKExploreGuidesView *)self leadingAnchor];
  v58 = v3;
  [(MKPlaceCollectionsSizeController *)v3 sectionInsets];
  v59 = [v61 constraintEqualToAnchor:v60 constant:v4];
  v63[0] = v59;
  v57 = [(MKExploreGuidesView *)self button];
  v56 = [v57 trailingAnchor];
  v55 = [(MKExploreGuidesView *)self trailingAnchor];
  [(MKPlaceCollectionsSizeController *)v3 sectionInsets];
  v54 = [v56 constraintEqualToAnchor:v55 constant:-v5];
  v63[1] = v54;
  v53 = [(MKExploreGuidesView *)self button];
  v52 = [v53 topAnchor];
  v51 = [(MKExploreGuidesView *)self topAnchor];
  v50 = [v52 constraintEqualToAnchor:v51 constant:5.0];
  v63[2] = v50;
  v49 = [(MKExploreGuidesView *)self button];
  v48 = [v49 bottomAnchor];
  v47 = [(MKExploreGuidesView *)self bottomAnchor];
  v46 = [v48 constraintEqualToAnchor:v47 constant:-5.0];
  v63[3] = v46;
  v45 = [(MKExploreGuidesView *)self labelsStack];
  v43 = [v45 leadingAnchor];
  v44 = [(MKExploreGuidesView *)self button];
  v42 = [v44 leadingAnchor];
  v41 = [v43 constraintEqualToAnchor:v42 constant:16.0];
  v63[4] = v41;
  v39 = [(MKExploreGuidesView *)self labelsStack];
  v37 = [v39 trailingAnchor];
  v38 = [(MKExploreGuidesView *)self imageView];
  v36 = [v38 leadingAnchor];
  v35 = [v37 constraintEqualToAnchor:v36 constant:-16.0];
  v63[5] = v35;
  v34 = [(MKExploreGuidesView *)self labelsStack];
  v32 = [v34 topAnchor];
  v33 = [(MKExploreGuidesView *)self button];
  v31 = [v33 topAnchor];
  v30 = [v32 constraintEqualToAnchor:v31 constant:16.0];
  v63[6] = v30;
  v29 = [(MKExploreGuidesView *)self labelsStack];
  v27 = [v29 bottomAnchor];
  v28 = [(MKExploreGuidesView *)self button];
  v26 = [v28 bottomAnchor];
  v25 = [v27 constraintEqualToAnchor:v26 constant:-16.0];
  v63[7] = v25;
  v24 = [(MKExploreGuidesView *)self imageView];
  v22 = [v24 trailingAnchor];
  v23 = [(MKExploreGuidesView *)self button];
  v21 = [v23 trailingAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v63[8] = v20;
  v19 = [(MKExploreGuidesView *)self imageView];
  v17 = [v19 topAnchor];
  v18 = [(MKExploreGuidesView *)self button];
  v16 = [v18 topAnchor];
  v6 = [v17 constraintEqualToAnchor:v16];
  v63[9] = v6;
  v7 = [(MKExploreGuidesView *)self imageView];
  v8 = [v7 bottomAnchor];
  v9 = [(MKExploreGuidesView *)self button];
  v10 = [v9 bottomAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v63[10] = v11;
  v12 = [(MKExploreGuidesView *)self imageView];
  v13 = [v12 widthAnchor];
  v14 = [v13 constraintEqualToConstant:92.0];
  v63[11] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:12];
  [v40 activateConstraints:v15];
}

- (UIButton)button
{
  return self->_button;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setupSubviews
{
  v3 = [MEMORY[0x1E4F427E0] buttonWithType:0];
  [(MKExploreGuidesView *)self setButton:v3];

  double v4 = [(MKExploreGuidesView *)self button];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v5 = [(MKExploreGuidesView *)self button];
  [v5 _setContinuousCornerRadius:10.0];

  v6 = [(MKExploreGuidesView *)self button];
  [v6 addTarget:self action:sel_didSelectExploreGuides_ forControlEvents:0x2000];

  v7 = [(MKExploreGuidesView *)self button];
  [(MKExploreGuidesView *)self addSubview:v7];

  id v8 = objc_alloc(MEMORY[0x1E4F42E20]);
  v9 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(MKExploreGuidesView *)self setLabelsStack:v9];

  v10 = [(MKExploreGuidesView *)self labelsStack];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  v11 = [(MKExploreGuidesView *)self labelsStack];
  [v11 setAxis:1];

  v12 = [(MKExploreGuidesView *)self labelsStack];
  [v12 setDistribution:0];

  v13 = [(MKExploreGuidesView *)self labelsStack];
  [v13 setAlignment:0];

  v14 = [(MKExploreGuidesView *)self labelsStack];
  [v14 setUserInteractionEnabled:0];

  v15 = [(MKExploreGuidesView *)self labelsStack];
  [v15 setAccessibilityIdentifier:@"ExploreGuidesLabelStack"];

  v16 = [(MKExploreGuidesView *)self labelsStack];
  [(MKExploreGuidesView *)self addSubview:v16];

  id v29 = objc_alloc_init(MEMORY[0x1E4F42B38]);
  [v29 setNumberOfLines:1];
  v17 = [(MKExploreGuidesView *)self defaultTitleFont];
  [v29 setFont:v17];

  v18 = [MEMORY[0x1E4F428B8] labelColor];
  [v29 setTextColor:v18];

  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
  v19 = _MKLocalizedStringFromThisBundle(@"[Curated Collections] Explore Guides Title");
  [v29 setText:v19];

  [v29 setAccessibilityIdentifier:@"ExploreGuidesTitle"];
  [(MKExploreGuidesView *)self setTitleLabel:v29];
  v20 = [v29 text];
  v21 = [(MKExploreGuidesView *)self button];
  [v21 setAccessibilityLabel:v20];

  v22 = [(MKExploreGuidesView *)self button];
  [v22 setAccessibilityIdentifier:@"ExploreGuidesButton"];

  v23 = [(MKExploreGuidesView *)self labelsStack];
  [v23 addArrangedSubview:v29];

  id v24 = objc_alloc_init(MEMORY[0x1E4F42B38]);
  [v24 setNumberOfLines:1];
  [v24 setAdjustsFontSizeToFitWidth:1];
  [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
  v25 = objc_msgSend(MEMORY[0x1E4F42A30], "_mapkit_preferredFontForTextStyleInTableViewCell:", *MEMORY[0x1E4F438C8]);
  [v24 setFont:v25];

  v26 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  [v24 setTextColor:v26];

  v27 = _MKLocalizedStringFromThisBundle(@"[Curated Collections] Explore Guide Subtitle");
  [v24 setText:v27];

  [v24 setAccessibilityIdentifier:@"ExploreGuidesSubtitle"];
  [(MKExploreGuidesView *)self setSubtitleLabel:v24];
  v28 = [(MKExploreGuidesView *)self labelsStack];
  [v28 addArrangedSubview:v24];

  [(MKExploreGuidesView *)self setupImage];
}

- (UIStackView)labelsStack
{
  return self->_labelsStack;
}

- (void)setupImage
{
  id v3 = objc_alloc(MEMORY[0x1E4F42AA0]);
  double v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(MKExploreGuidesView *)self setImageView:v4];

  double v5 = [(MKExploreGuidesView *)self imageView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [(MKExploreGuidesView *)self imageView];
  [v6 setAccessibilityIdentifier:@"ExploreGuidesImage"];

  v7 = [(MKExploreGuidesView *)self imageView];
  [(MKExploreGuidesView *)self addSubview:v7];

  if (MKApplicationLayoutDirectionIsRightToLeft()) {
    uint64_t v8 = 5;
  }
  else {
    uint64_t v8 = 10;
  }
  v9 = [(MKExploreGuidesView *)self imageView];
  [v9 _setContinuousCornerRadius:10.0];

  v10 = [(MKExploreGuidesView *)self imageView];
  v11 = [v10 layer];
  [v11 setMaskedCorners:v8];

  v12 = [(MKExploreGuidesView *)self imageView];
  [v12 setClipsToBounds:1];

  v13 = +[MKSystemController sharedInstance];
  [v13 screenScale];
  double v15 = v14;

  double v16 = v15 * 92.0;
  +[MKExploreGuidesView defaultHeight];
  double v18 = v15 * v17;
  v19 = [(MKExploreGuidesView *)self exploreGuide];
  v20 = objc_msgSend(v19, "imageURLForSize:", v16, v18);

  v21 = +[MKAppImageManager sharedImageManager];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __33__MKExploreGuidesView_setupImage__block_invoke;
  v22[3] = &unk_1E54B9820;
  v22[4] = self;
  [v21 loadAppImageAtURL:v20 completionHandler:v22];
}

- (void)setTitleLabel:(id)a3
{
}

- (void)setSubtitleLabel:(id)a3
{
}

- (void)setLabelsStack:(id)a3
{
}

- (void)setImageView:(id)a3
{
}

- (void)setButton:(id)a3
{
}

- (MKExploreGuidesView)initWithExploreGuides:(id)a3 tapHandler:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)MKExploreGuidesView;
  v9 = -[MKExploreGuidesView initWithFrame:](&v22, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_exploreGuide, a3);
    uint64_t v11 = MEMORY[0x18C139AE0](v8);
    id tapHandler = v10->_tapHandler;
    v10->_id tapHandler = (id)v11;

    v13 = [MEMORY[0x1E4F428B8] clearColor];
    [(MKExploreGuidesView *)v10 setBackgroundColor:v13];

    [(MKExploreGuidesView *)v10 setClipsToBounds:1];
    uint64_t v14 = *MEMORY[0x1E4F43870];
    double v15 = objc_msgSend(MEMORY[0x1E4F42A30], "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", *MEMORY[0x1E4F43870], *MEMORY[0x1E4F43930]);
    [(MKExploreGuidesView *)v10 setDefaultTitleFont:v15];

    double v16 = (void *)[objc_alloc(MEMORY[0x1E4F42A40]) initForTextStyle:v14];
    double v17 = [(MKExploreGuidesView *)v10 defaultTitleFont];
    double v18 = [v16 scaledFontForFont:v17 maximumPointSize:36.0];
    [(MKExploreGuidesView *)v10 setMaxSupportedTitleFont:v18];

    [(MKExploreGuidesView *)v10 setAccessibilityIdentifier:@"ExploreGuidesView"];
    [(MKExploreGuidesView *)v10 setupSubviews];
    [(MKExploreGuidesView *)v10 setupConstraints];
    [(MKExploreGuidesView *)v10 updateUI];
    v23[0] = objc_opt_class();
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    id v20 = (id)[(MKExploreGuidesView *)v10 registerForTraitChanges:v19 withAction:sel_traitEnvironment_didChangeTraitCollection_];
  }
  return v10;
}

- (UIFont)defaultTitleFont
{
  return self->_defaultTitleFont;
}

- (void)updateUI
{
  id v3 = [(MKExploreGuidesView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  double v5 = [(MKExploreGuidesView *)self button];
  if (v4 == 2) {
    [MEMORY[0x1E4F428B8] secondarySystemGroupedBackgroundColor];
  }
  else {
  v6 = [MEMORY[0x1E4F428B8] whiteColor];
  }
  [v5 setBackgroundColor:v6];

  id v7 = [(MKExploreGuidesView *)self traitCollection];
  id v8 = [v7 preferredContentSizeCategory];
  NSComparisonResult v9 = UIContentSizeCategoryCompareToCategory(v8, (UIContentSizeCategory)*MEMORY[0x1E4F43790]);

  v10 = [(MKExploreGuidesView *)self subtitleLabel];
  uint64_t v11 = v10;
  if (v9 == NSOrderedAscending)
  {
    [v10 setHidden:0];

    [(MKExploreGuidesView *)self defaultTitleFont];
  }
  else
  {
    [v10 setHidden:1];

    [(MKExploreGuidesView *)self maxSupportedTitleFont];
  }
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  v12 = [(MKExploreGuidesView *)self titleLabel];
  [v12 setFont:v13];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setMaxSupportedTitleFont:(id)a3
{
}

- (void)setDefaultTitleFont:(id)a3
{
}

- (GEOExploreGuides)exploreGuide
{
  return self->_exploreGuide;
}

uint64_t __33__MKExploreGuidesView_setupImage__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(*(void *)(result + 32) + 440) setImage:a2];
  }
  return result;
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v5 = a4;
  v6 = [(MKExploreGuidesView *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];
  uint64_t v8 = [v5 userInterfaceStyle];

  if (v7 != v8)
  {
    [(MKExploreGuidesView *)self updateUI];
  }
}

- (void)didSelectExploreGuides:(id)a3
{
  uint64_t v4 = [(MKExploreGuidesView *)self tapHandler];

  if (v4)
  {
    v6 = [(MKExploreGuidesView *)self tapHandler];
    id v5 = [(MKExploreGuidesView *)self exploreGuide];
    v6[2](v6, v5);
  }
}

- (void)setExploreGuide:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (UIFont)maxSupportedTitleFont
{
  return self->_maxSupportedTitleFont;
}

- (id)tapHandler
{
  return self->_tapHandler;
}

- (void)setTapHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tapHandler, 0);
  objc_storeStrong((id *)&self->_maxSupportedTitleFont, 0);
  objc_storeStrong((id *)&self->_defaultTitleFont, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_labelsStack, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_contentView, 0);

  objc_storeStrong((id *)&self->_exploreGuide, 0);
}

@end