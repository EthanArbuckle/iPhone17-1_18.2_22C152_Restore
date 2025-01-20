@interface MKPlaceCompactCollectionCell
- (BOOL)canBecomeFirstResponder;
- (MKPlaceCompactCollectionCell)initWithFrame:(CGRect)a3;
- (MKPlaceCompactCollectionOverlayView)imageOverlayView;
- (MKPlaceCompactCollectionViewModel)item;
- (NSLayoutConstraint)overlayHeightConstraint;
- (NSUUID)updateIdentifier;
- (UIImageView)collectionImageView;
- (UILabel)subTitleLabel;
- (UILabel)titleLabel;
- (UIStackView)metadataStackView;
- (void)prepareForReuse;
- (void)setCollectionImageView:(id)a3;
- (void)setImageOverlayView:(id)a3;
- (void)setItem:(id)a3;
- (void)setMetadataStackView:(id)a3;
- (void)setOverlayHeightConstraint:(id)a3;
- (void)setSubTitleLabel:(id)a3;
- (void)setTextMetadata;
- (void)setTitleLabel:(id)a3;
- (void)setUpCellUsingModel:(id)a3;
- (void)setUpdateIdentifier:(id)a3;
- (void)setupAccessibility;
- (void)setupBorderHighlight;
- (void)setupCompactCollectionData;
- (void)setupCompactCollectionImage;
- (void)setupCompactCollectionImageOverlay;
- (void)setupConstraints;
- (void)setupCornerRadius;
- (void)setupShadows;
- (void)setupSubTitle;
- (void)setupSubviews;
- (void)setupTitle;
- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4;
@end

@implementation MKPlaceCompactCollectionCell

- (MKPlaceCompactCollectionCell)initWithFrame:(CGRect)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)MKPlaceCompactCollectionCell;
  v3 = -[MKPlaceCompactCollectionCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MKPlaceCompactCollectionCell *)v3 setupSubviews];
    [(MKPlaceCompactCollectionCell *)v4 setupCornerRadius];
    [(MKPlaceCompactCollectionCell *)v4 setupConstraints];
    [(MKPlaceCompactCollectionCell *)v4 setupShadows];
    [(MKPlaceCompactCollectionCell *)v4 setupAccessibility];
    v9[0] = objc_opt_class();
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    id v6 = (id)[(MKPlaceCompactCollectionCell *)v4 registerForTraitChanges:v5 withAction:sel_traitEnvironment_didChangeTraitCollection_];
  }
  return v4;
}

- (BOOL)canBecomeFirstResponder
{
  v2 = [(MKPlaceCompactCollectionCell *)self traitCollection];
  BOOL v3 = [v2 userInterfaceIdiom] == 5;

  return v3;
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  v5 = objc_msgSend(a4, "preferredContentSizeCategory", a3);
  id v6 = [(MKPlaceCompactCollectionCell *)self traitCollection];
  v7 = [v6 preferredContentSizeCategory];

  if (v5 != v7)
  {
    objc_super v8 = [(MKPlaceCompactCollectionCell *)self item];
    v9 = [(MKPlaceCompactCollectionCell *)self traitCollection];
    v10 = [v9 preferredContentSizeCategory];
    [v8 contentCategorySizeDidChange:v10];

    [(MKPlaceCompactCollectionCell *)self setTextMetadata];
  }
}

- (void)prepareForReuse
{
  v13.receiver = self;
  v13.super_class = (Class)MKPlaceCompactCollectionCell;
  [(MKPlaceCompactCollectionCell *)&v13 prepareForReuse];
  BOOL v3 = [(MKPlaceCompactCollectionCell *)self titleLabel];
  [v3 setAttributedText:0];

  v4 = [(MKPlaceCompactCollectionCell *)self subTitleLabel];
  [v4 setAttributedText:0];

  v5 = [(MKPlaceCompactCollectionCell *)self collectionImageView];
  [v5 setImage:0];

  id v6 = [(MKPlaceCompactCollectionCell *)self overlayHeightConstraint];
  [v6 setConstant:60.0];

  v7 = [(MKPlaceCompactCollectionCell *)self contentView];
  [v7 setBackgroundColor:0];

  objc_super v8 = [(MKPlaceCompactCollectionCell *)self contentView];
  v9 = [v8 layer];
  [v9 setBorderWidth:0.0];

  v10 = [(MKPlaceCompactCollectionCell *)self contentView];
  v11 = [v10 layer];
  [v11 setBorderColor:0];

  v12 = [(MKPlaceCompactCollectionCell *)self metadataStackView];
  [v12 setAccessibilityLabel:0];

  [(MKPlaceCompactCollectionCell *)self setItem:0];
}

- (void)setTextMetadata
{
  BOOL v3 = [(MKPlaceCompactCollectionCell *)self item];
  v4 = [v3 title];
  v5 = [(MKPlaceCompactCollectionCell *)self titleLabel];
  [v5 setAttributedText:v4];

  id v6 = [(MKPlaceCompactCollectionCell *)self item];
  v7 = [(MKPlaceCompactCollectionCell *)self traitCollection];
  objc_super v8 = [v7 preferredContentSizeCategory];
  int v9 = [v6 shouldShowSubtitleForCategory:v8];

  if (v9)
  {
    v10 = [(MKPlaceCompactCollectionCell *)self item];
    v11 = [v10 subTitle];
    v12 = [(MKPlaceCompactCollectionCell *)self subTitleLabel];
    [v12 setAttributedText:v11];

    objc_super v13 = [(MKPlaceCompactCollectionCell *)self subTitleLabel];
    id v15 = v13;
    uint64_t v14 = 0;
  }
  else
  {
    objc_super v13 = [(MKPlaceCompactCollectionCell *)self subTitleLabel];
    id v15 = v13;
    uint64_t v14 = 1;
  }
  [v13 setHidden:v14];
}

- (void)setUpCellUsingModel:(id)a3
{
  id v4 = a3;
  [(MKPlaceCompactCollectionCell *)self setItem:v4];
  [(MKPlaceCompactCollectionCell *)self setTextMetadata];
  v5 = [v4 backgroundColor];
  id v6 = [(MKPlaceCompactCollectionCell *)self contentView];
  [v6 setBackgroundColor:v5];

  v7 = NSString;
  objc_super v8 = [(MKPlaceCompactCollectionCell *)self titleLabel];
  uint64_t v9 = [v8 text];
  v10 = (void *)v9;
  if (v9) {
    v11 = (__CFString *)v9;
  }
  else {
    v11 = &stru_1ED919588;
  }
  v12 = [(MKPlaceCompactCollectionCell *)self subTitleLabel];
  uint64_t v13 = [v12 text];
  uint64_t v14 = (void *)v13;
  if (v13) {
    id v15 = (__CFString *)v13;
  }
  else {
    id v15 = &stru_1ED919588;
  }
  v16 = [v7 stringWithFormat:@"%@ %@", v11, v15];
  v17 = [(MKPlaceCompactCollectionCell *)self metadataStackView];
  [v17 setAccessibilityLabel:v16];

  if ([v4 useBorderHighlight]) {
    [(MKPlaceCompactCollectionCell *)self setupBorderHighlight];
  }
  if ([v4 isWorldwide])
  {
    v18 = [(MKPlaceCompactCollectionCell *)self overlayHeightConstraint];
    [v18 setConstant:40.0];
  }
  v19 = [MEMORY[0x1E4F29128] UUID];
  [(MKPlaceCompactCollectionCell *)self setUpdateIdentifier:v19];
  objc_initWeak(&location, self);
  v20 = [(MKPlaceCompactCollectionCell *)self item];
  v21 = [(MKPlaceCompactCollectionCell *)self contentView];
  [v21 frame];
  double v23 = v22;
  double v25 = v24;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __52__MKPlaceCompactCollectionCell_setUpCellUsingModel___block_invoke;
  v27[3] = &unk_1E54BF088;
  objc_copyWeak(&v29, &location);
  id v26 = v19;
  id v28 = v26;
  objc_msgSend(v20, "compactCollectionImageForSize:onCompletion:", v27, v23, v25);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

void __52__MKPlaceCompactCollectionCell_setUpCellUsingModel___block_invoke(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v9 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_10;
  }
  v10 = [WeakRetained updateIdentifier];
  if (([v10 isEqual:*(void *)(a1 + 32)] & 1) == 0)
  {

    goto LABEL_10;
  }
  v11 = [v9 item];

  if (!v11)
  {
LABEL_10:
    v16 = MKGetCuratedCollectionsLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18BAEC000, v16, OS_LOG_TYPE_INFO, "Cell doesn't exist OR identifier mistach", buf, 2u);
    }

    goto LABEL_13;
  }
  if (v7 && !a3)
  {
    v12 = MKGetCuratedCollectionsLog();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (a4)
    {
      double v14 = 0.0;
      if (v13)
      {
        *(_WORD *)buf = 0;
        id v15 = "Received cached image. Displaying without animation.";
LABEL_16:
        _os_log_impl(&dword_18BAEC000, v12, OS_LOG_TYPE_INFO, v15, buf, 2u);
      }
    }
    else
    {
      double v14 = 0.100000001;
      if (v13)
      {
        *(_WORD *)buf = 0;
        id v15 = "Received non-cached image. Displaying with animation.";
        goto LABEL_16;
      }
    }

    v17 = (void *)MEMORY[0x1E4F42FF0];
    v18 = [v9 collectionImageView];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __52__MKPlaceCompactCollectionCell_setUpCellUsingModel___block_invoke_17;
    v19[3] = &unk_1E54B8248;
    v19[4] = v9;
    id v20 = v7;
    [v17 transitionWithView:v18 duration:5242882 options:v19 animations:0 completion:v14];
  }
LABEL_13:
}

void __52__MKPlaceCompactCollectionCell_setUpCellUsingModel___block_invoke_17(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) collectionImageView];
  [v2 setImage:v1];
}

- (void)setupSubviews
{
  BOOL v3 = [MEMORY[0x1E4F428B8] clearColor];
  [(MKPlaceCompactCollectionCell *)self setBackgroundColor:v3];

  [(MKPlaceCompactCollectionCell *)self setupCompactCollectionImage];
  [(MKPlaceCompactCollectionCell *)self setupCompactCollectionImageOverlay];

  [(MKPlaceCompactCollectionCell *)self setupCompactCollectionData];
}

- (void)setupCompactCollectionImage
{
  id v3 = objc_alloc(MEMORY[0x1E4F42AA0]);
  id v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(MKPlaceCompactCollectionCell *)self setCollectionImageView:v4];

  v5 = [(MKPlaceCompactCollectionCell *)self collectionImageView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v6 = [(MKPlaceCompactCollectionCell *)self collectionImageView];
  [v6 setAccessibilityIgnoresInvertColors:1];

  id v7 = [(MKPlaceCompactCollectionCell *)self collectionImageView];
  [v7 setAccessibilityIdentifier:@"CompactCollectionImageView"];

  objc_super v8 = [(MKPlaceCompactCollectionCell *)self collectionImageView];
  [v8 setContentMode:2];

  id v10 = [(MKPlaceCompactCollectionCell *)self contentView];
  uint64_t v9 = [(MKPlaceCompactCollectionCell *)self collectionImageView];
  [v10 addSubview:v9];
}

- (void)setupCompactCollectionImageOverlay
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v3 = [MKPlaceCompactCollectionOverlayView alloc];
  id v4 = -[MKPlaceCompactCollectionOverlayView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(MKPlaceCompactCollectionCell *)self setImageOverlayView:v4];

  v5 = [(MKPlaceCompactCollectionCell *)self imageOverlayView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v6 = [MEMORY[0x1E4F428B8] clearColor];
  id v7 = [(MKPlaceCompactCollectionCell *)self imageOverlayView];
  [v7 setBackgroundColor:v6];

  objc_super v8 = [(MKPlaceCompactCollectionCell *)self imageOverlayView];
  uint64_t v9 = [v8 gradientLayer];
  objc_msgSend(v9, "setStartPoint:", 0.5, 0.0);

  id v10 = [(MKPlaceCompactCollectionCell *)self imageOverlayView];
  v11 = [v10 gradientLayer];
  objc_msgSend(v11, "setEndPoint:", 0.5, 1.0);

  v12 = [MEMORY[0x1E4F428B8] blackColor];
  BOOL v13 = [v12 colorWithAlphaComponent:0.0];

  id v14 = v13;
  v22[0] = [v14 CGColor];
  id v15 = [MEMORY[0x1E4F428B8] blackColor];
  id v16 = [v15 colorWithAlphaComponent:0.38];
  v22[1] = [v16 CGColor];
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  v18 = [(MKPlaceCompactCollectionCell *)self imageOverlayView];
  v19 = [v18 gradientLayer];
  [v19 setColors:v17];

  id v20 = [(MKPlaceCompactCollectionCell *)self contentView];
  v21 = [(MKPlaceCompactCollectionCell *)self imageOverlayView];
  [v20 addSubview:v21];
}

- (void)setupCompactCollectionData
{
  id v3 = objc_alloc(MEMORY[0x1E4F42E20]);
  id v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(MKPlaceCompactCollectionCell *)self setMetadataStackView:v4];

  v5 = [(MKPlaceCompactCollectionCell *)self metadataStackView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v6 = [(MKPlaceCompactCollectionCell *)self metadataStackView];
  [v6 setAxis:1];

  id v7 = [(MKPlaceCompactCollectionCell *)self metadataStackView];
  [v7 setDistribution:0];

  objc_super v8 = [(MKPlaceCompactCollectionCell *)self metadataStackView];
  [v8 setAlignment:1];

  uint64_t v9 = [(MKPlaceCompactCollectionCell *)self metadataStackView];
  [v9 setSpacing:0.0];

  id v10 = [(MKPlaceCompactCollectionCell *)self contentView];
  v11 = [(MKPlaceCompactCollectionCell *)self metadataStackView];
  [v10 addSubview:v11];

  [(MKPlaceCompactCollectionCell *)self setupTitle];

  [(MKPlaceCompactCollectionCell *)self setupSubTitle];
}

- (void)setupTitle
{
  id v3 = objc_alloc(MEMORY[0x1E4F42B38]);
  id v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(MKPlaceCompactCollectionCell *)self setTitleLabel:v4];

  v5 = [MEMORY[0x1E4F428B8] whiteColor];
  id v6 = [(MKPlaceCompactCollectionCell *)self titleLabel];
  [v6 setTextColor:v5];

  id v7 = [(MKPlaceCompactCollectionCell *)self titleLabel];
  [v7 setNumberOfLines:3];

  objc_super v8 = [(MKPlaceCompactCollectionCell *)self titleLabel];
  [v8 setAccessibilityIdentifier:@"CompactCollectionTitle"];

  id v10 = [(MKPlaceCompactCollectionCell *)self metadataStackView];
  uint64_t v9 = [(MKPlaceCompactCollectionCell *)self titleLabel];
  [v10 addArrangedSubview:v9];
}

- (void)setupSubTitle
{
  id v3 = objc_alloc(MEMORY[0x1E4F42B38]);
  id v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(MKPlaceCompactCollectionCell *)self setSubTitleLabel:v4];

  v5 = [MEMORY[0x1E4F428B8] whiteColor];
  id v6 = [v5 colorWithAlphaComponent:0.9];
  id v7 = [(MKPlaceCompactCollectionCell *)self subTitleLabel];
  [v7 setTextColor:v6];

  objc_super v8 = [(MKPlaceCompactCollectionCell *)self subTitleLabel];
  [v8 setNumberOfLines:3];

  uint64_t v9 = [(MKPlaceCompactCollectionCell *)self subTitleLabel];
  [v9 setAccessibilityIdentifier:@"CompactCollectionSubtitle"];

  id v11 = [(MKPlaceCompactCollectionCell *)self metadataStackView];
  id v10 = [(MKPlaceCompactCollectionCell *)self subTitleLabel];
  [v11 addArrangedSubview:v10];
}

- (void)setupShadows
{
  id v3 = [MEMORY[0x1E4F428B8] systemBlackColor];
  uint64_t v4 = [v3 CGColor];
  v5 = [(MKPlaceCompactCollectionCell *)self layer];
  [v5 setShadowColor:v4];

  id v6 = [(MKPlaceCompactCollectionCell *)self layer];
  LODWORD(v7) = 1028443341;
  [v6 setShadowOpacity:v7];

  objc_super v8 = [(MKPlaceCompactCollectionCell *)self layer];
  objc_msgSend(v8, "setShadowOffset:", 0.0, 2.0);

  uint64_t v9 = [(MKPlaceCompactCollectionCell *)self layer];
  [v9 setShadowRadius:12.0];

  id v10 = [(MKPlaceCompactCollectionCell *)self layer];
  [v10 setShadowPathIsBounds:1];
}

- (void)setupAccessibility
{
  [(MKPlaceCompactCollectionCell *)self setAccessibilityIdentifier:@"CompactCollectionCell"];
  id v3 = [(MKPlaceCompactCollectionCell *)self metadataStackView];
  [v3 setIsAccessibilityElement:1];

  uint64_t v4 = *MEMORY[0x1E4F434F0];
  id v5 = [(MKPlaceCompactCollectionCell *)self metadataStackView];
  [v5 setAccessibilityTraits:v4];
}

- (void)setupConstraints
{
  v64[12] = *MEMORY[0x1E4F143B8];
  id v3 = [(MKPlaceCompactCollectionCell *)self imageOverlayView];
  uint64_t v4 = [v3 heightAnchor];
  id v5 = [v4 constraintEqualToConstant:60.0];
  [(MKPlaceCompactCollectionCell *)self setOverlayHeightConstraint:v5];

  v39 = (void *)MEMORY[0x1E4F28DC8];
  v63 = [(MKPlaceCompactCollectionCell *)self collectionImageView];
  v61 = [v63 leadingAnchor];
  v62 = [(MKPlaceCompactCollectionCell *)self contentView];
  v60 = [v62 leadingAnchor];
  v59 = [v61 constraintEqualToAnchor:v60];
  v64[0] = v59;
  v58 = [(MKPlaceCompactCollectionCell *)self collectionImageView];
  v56 = [v58 trailingAnchor];
  v57 = [(MKPlaceCompactCollectionCell *)self contentView];
  v55 = [v57 trailingAnchor];
  v54 = [v56 constraintEqualToAnchor:v55];
  v64[1] = v54;
  v53 = [(MKPlaceCompactCollectionCell *)self collectionImageView];
  v51 = [v53 topAnchor];
  v52 = [(MKPlaceCompactCollectionCell *)self contentView];
  v50 = [v52 topAnchor];
  v49 = [v51 constraintEqualToAnchor:v50];
  v64[2] = v49;
  v48 = [(MKPlaceCompactCollectionCell *)self collectionImageView];
  v46 = [v48 bottomAnchor];
  v47 = [(MKPlaceCompactCollectionCell *)self contentView];
  v45 = [v47 bottomAnchor];
  v44 = [v46 constraintEqualToAnchor:v45];
  v64[3] = v44;
  v43 = [(MKPlaceCompactCollectionCell *)self imageOverlayView];
  v41 = [v43 leadingAnchor];
  v42 = [(MKPlaceCompactCollectionCell *)self contentView];
  v40 = [v42 leadingAnchor];
  v38 = [v41 constraintEqualToAnchor:v40];
  v64[4] = v38;
  v37 = [(MKPlaceCompactCollectionCell *)self imageOverlayView];
  v35 = [v37 trailingAnchor];
  v36 = [(MKPlaceCompactCollectionCell *)self contentView];
  v34 = [v36 trailingAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v64[5] = v33;
  v32 = [(MKPlaceCompactCollectionCell *)self overlayHeightConstraint];
  v64[6] = v32;
  v31 = [(MKPlaceCompactCollectionCell *)self imageOverlayView];
  id v29 = [v31 bottomAnchor];
  v30 = [(MKPlaceCompactCollectionCell *)self contentView];
  id v28 = [v30 bottomAnchor];
  v27 = [v29 constraintEqualToAnchor:v28];
  v64[7] = v27;
  id v26 = [(MKPlaceCompactCollectionCell *)self metadataStackView];
  double v24 = [v26 leadingAnchor];
  double v25 = [(MKPlaceCompactCollectionCell *)self contentView];
  double v23 = [v25 leadingAnchor];
  double v22 = [v24 constraintEqualToAnchor:v23 constant:12.0];
  v64[8] = v22;
  v21 = [(MKPlaceCompactCollectionCell *)self metadataStackView];
  v19 = [v21 trailingAnchor];
  id v20 = [(MKPlaceCompactCollectionCell *)self contentView];
  v18 = [v20 trailingAnchor];
  v17 = [v19 constraintEqualToAnchor:v18 constant:-12.0];
  v64[9] = v17;
  id v16 = [(MKPlaceCompactCollectionCell *)self metadataStackView];
  id v6 = [v16 topAnchor];
  double v7 = [(MKPlaceCompactCollectionCell *)self contentView];
  objc_super v8 = [v7 topAnchor];
  uint64_t v9 = [v6 constraintGreaterThanOrEqualToAnchor:v8];
  v64[10] = v9;
  id v10 = [(MKPlaceCompactCollectionCell *)self metadataStackView];
  id v11 = [v10 bottomAnchor];
  v12 = [(MKPlaceCompactCollectionCell *)self contentView];
  BOOL v13 = [v12 bottomAnchor];
  id v14 = [v11 constraintEqualToAnchor:v13 constant:-12.0];
  v64[11] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:12];
  [v39 activateConstraints:v15];
}

- (void)setupCornerRadius
{
  id v3 = [(MKPlaceCompactCollectionCell *)self contentView];
  uint64_t v4 = [v3 layer];
  [v4 setCornerRadius:10.0];

  id v6 = [(MKPlaceCompactCollectionCell *)self contentView];
  id v5 = [v6 layer];
  [v5 setMasksToBounds:1];
}

- (void)setupBorderHighlight
{
  id v3 = [(MKPlaceCompactCollectionCell *)self contentView];
  uint64_t v4 = [v3 layer];
  [v4 setBorderWidth:3.0];

  id v8 = [MEMORY[0x1E4F428B8] systemBlueColor];
  uint64_t v5 = [v8 CGColor];
  id v6 = [(MKPlaceCompactCollectionCell *)self contentView];
  double v7 = [v6 layer];
  [v7 setBorderColor:v5];
}

- (UIStackView)metadataStackView
{
  return self->_metadataStackView;
}

- (void)setMetadataStackView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subTitleLabel
{
  return self->_subTitleLabel;
}

- (void)setSubTitleLabel:(id)a3
{
}

- (UIImageView)collectionImageView
{
  return self->_collectionImageView;
}

- (void)setCollectionImageView:(id)a3
{
}

- (MKPlaceCompactCollectionOverlayView)imageOverlayView
{
  return self->_imageOverlayView;
}

- (void)setImageOverlayView:(id)a3
{
}

- (MKPlaceCompactCollectionViewModel)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (NSUUID)updateIdentifier
{
  return self->_updateIdentifier;
}

- (void)setUpdateIdentifier:(id)a3
{
}

- (NSLayoutConstraint)overlayHeightConstraint
{
  return self->_overlayHeightConstraint;
}

- (void)setOverlayHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayHeightConstraint, 0);
  objc_storeStrong((id *)&self->_updateIdentifier, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_imageOverlayView, 0);
  objc_storeStrong((id *)&self->_collectionImageView, 0);
  objc_storeStrong((id *)&self->_subTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_metadataStackView, 0);
}

@end