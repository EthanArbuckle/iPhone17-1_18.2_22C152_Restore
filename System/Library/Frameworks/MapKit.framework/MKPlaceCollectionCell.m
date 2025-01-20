@interface MKPlaceCollectionCell
- (BOOL)canBecomeFirstResponder;
- (CGSize)sizeForSavedPill;
- (MKPlaceCollectionCell)initWithFrame:(CGRect)a3;
- (MKPlaceCollectionViewModel)item;
- (NSLayoutConstraint)logoWidthConstraint;
- (NSUUID)updateIdentifier;
- (UIImageView)checkMarkImageView;
- (UIImageView)collectionImageView;
- (UIImageView)publisherLogoImageView;
- (UILabel)collectionLabel;
- (UILabel)savedCollectionLabel;
- (UIStackView)metadataStackView;
- (UIVisualEffectView)savedView;
- (void)addCollectionNameView;
- (void)addPublisherLogoImage;
- (void)addSavedCollectionView;
- (void)prepareForReuse;
- (void)setCheckMarkImageView:(id)a3;
- (void)setCollectionImageView:(id)a3;
- (void)setCollectionLabel:(id)a3;
- (void)setImageMetadata;
- (void)setItem:(id)a3;
- (void)setLogoWidthConstraint:(id)a3;
- (void)setMetadataStackView:(id)a3;
- (void)setPublisherLogoImageView:(id)a3;
- (void)setSavedCollectionLabel:(id)a3;
- (void)setSavedView:(id)a3;
- (void)setTextMetadata;
- (void)setUpCellUsingModel:(id)a3;
- (void)setUpdateIdentifier:(id)a3;
- (void)setupAccessibility;
- (void)setupCollectionImage;
- (void)setupConstraints;
- (void)setupCornerRadius;
- (void)setupShadows;
- (void)setupStackView;
- (void)setupSubviews;
- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4;
@end

@implementation MKPlaceCollectionCell

- (void)setUpCellUsingModel:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = MKGetCuratedCollectionsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = [v4 collectionTitle];
    v7 = [v6 string];
    int v10 = 138412290;
    v11 = v7;
    _os_log_impl(&dword_18BAEC000, v5, OS_LOG_TYPE_DEBUG, "Configuring cell for Collection: %@", (uint8_t *)&v10, 0xCu);
  }
  [(MKPlaceCollectionCell *)self setItem:v4];
  v8 = [v4 backgroundColor];
  v9 = [(MKPlaceCollectionCell *)self contentView];
  [v9 setBackgroundColor:v8];

  [(MKPlaceCollectionCell *)self setTextMetadata];
  [(MKPlaceCollectionCell *)self setImageMetadata];
}

- (void)setItem:(id)a3
{
}

- (void)setImageMetadata
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F29128] UUID];
  [(MKPlaceCollectionCell *)self setUpdateIdentifier:v3];
  objc_initWeak(&location, self);
  id v4 = [(MKPlaceCollectionCell *)self item];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __41__MKPlaceCollectionCell_setImageMetadata__block_invoke;
  v23[3] = &unk_1E54BECA0;
  objc_copyWeak(&v25, &location);
  id v5 = v3;
  id v24 = v5;
  [v4 publisherLogoImageWithCompletion:v23];

  v6 = MKGetCuratedCollectionsLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = [(MKPlaceCollectionCell *)self item];
    v8 = [v7 collectionTitle];
    v9 = [v8 string];
    *(_DWORD *)buf = 138412290;
    v28 = v9;
    _os_log_impl(&dword_18BAEC000, v6, OS_LOG_TYPE_DEBUG, "[⌛]Requesting image for : %@", buf, 0xCu);
  }
  int v10 = [MEMORY[0x1E4F1C9C8] date];
  v11 = [(MKPlaceCollectionCell *)self item];
  uint64_t v12 = [(MKPlaceCollectionCell *)self contentView];
  [v12 frame];
  double v14 = v13;
  double v16 = v15;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __41__MKPlaceCollectionCell_setImageMetadata__block_invoke_59;
  v19[3] = &unk_1E54BECC8;
  objc_copyWeak(&v22, &location);
  v19[4] = self;
  id v17 = v5;
  id v20 = v17;
  id v18 = v10;
  id v21 = v18;
  objc_msgSend(v11, "collectionImageForSize:onCompletion:", v19, v14, v16);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

- (void)setTextMetadata
{
  v3 = [(MKPlaceCollectionCell *)self item];
  id v4 = [v3 collectionTitle];
  id v5 = [(MKPlaceCollectionCell *)self collectionLabel];
  [v5 setAttributedText:v4];

  v6 = [(MKPlaceCollectionCell *)self item];
  uint64_t v7 = [v6 isSaved] ^ 1;
  v8 = [(MKPlaceCollectionCell *)self savedView];
  [v8 setHidden:v7];

  id v13 = [(MKPlaceCollectionCell *)self collectionLabel];
  uint64_t v9 = [v13 text];
  int v10 = (void *)v9;
  if (v9) {
    v11 = (__CFString *)v9;
  }
  else {
    v11 = &stru_1ED919588;
  }
  uint64_t v12 = [(MKPlaceCollectionCell *)self metadataStackView];
  [v12 setAccessibilityLabel:v11];
}

- (MKPlaceCollectionViewModel)item
{
  return self->_item;
}

- (void)setUpdateIdentifier:(id)a3
{
}

- (void)addCollectionNameView
{
  id v3 = objc_alloc(MEMORY[0x1E4F42B38]);
  id v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(MKPlaceCollectionCell *)self setCollectionLabel:v4];

  id v5 = [MEMORY[0x1E4F428B8] whiteColor];
  v6 = [(MKPlaceCollectionCell *)self collectionLabel];
  [v6 setTextColor:v5];

  uint64_t v7 = [(MKPlaceCollectionCell *)self collectionLabel];
  [v7 setNumberOfLines:0];

  v8 = [(MKPlaceCollectionCell *)self collectionLabel];
  [v8 setAccessibilityIdentifier:@"PlaceCollectionTitle"];

  id v10 = [(MKPlaceCollectionCell *)self metadataStackView];
  uint64_t v9 = [(MKPlaceCollectionCell *)self collectionLabel];
  [v10 addArrangedSubview:v9];
}

- (UILabel)collectionLabel
{
  return self->_collectionLabel;
}

- (void)setCollectionLabel:(id)a3
{
}

void __41__MKPlaceCollectionCell_setImageMetadata__block_invoke_61(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) collectionImageView];
  [v2 setImage:v1];
}

- (void)setupConstraints
{
  v84[17] = *MEMORY[0x1E4F143B8];
  [(MKPlaceCollectionCell *)self sizeForSavedPill];
  double v4 = v3;
  double v6 = v5;
  v52 = (void *)MEMORY[0x1E4F28DC8];
  v83 = [(MKPlaceCollectionCell *)self collectionImageView];
  v81 = [v83 leadingAnchor];
  v82 = [(MKPlaceCollectionCell *)self contentView];
  v80 = [v82 leadingAnchor];
  v79 = [v81 constraintEqualToAnchor:v80];
  v84[0] = v79;
  v78 = [(MKPlaceCollectionCell *)self collectionImageView];
  v76 = [v78 trailingAnchor];
  v77 = [(MKPlaceCollectionCell *)self contentView];
  v75 = [v77 trailingAnchor];
  v74 = [v76 constraintEqualToAnchor:v75];
  v84[1] = v74;
  v73 = [(MKPlaceCollectionCell *)self collectionImageView];
  v71 = [v73 topAnchor];
  v72 = [(MKPlaceCollectionCell *)self contentView];
  v70 = [v72 topAnchor];
  v69 = [v71 constraintEqualToAnchor:v70];
  v84[2] = v69;
  v68 = [(MKPlaceCollectionCell *)self collectionImageView];
  v66 = [v68 bottomAnchor];
  v67 = [(MKPlaceCollectionCell *)self contentView];
  v65 = [v67 bottomAnchor];
  v64 = [v66 constraintEqualToAnchor:v65];
  v84[3] = v64;
  v63 = [(MKPlaceCollectionCell *)self metadataStackView];
  v61 = [v63 leadingAnchor];
  v62 = [(MKPlaceCollectionCell *)self contentView];
  v60 = [v62 leadingAnchor];
  v59 = [v61 constraintEqualToAnchor:v60 constant:12.0];
  v84[4] = v59;
  v58 = [(MKPlaceCollectionCell *)self metadataStackView];
  v56 = [v58 trailingAnchor];
  v57 = [(MKPlaceCollectionCell *)self contentView];
  v55 = [v57 trailingAnchor];
  v54 = [v56 constraintEqualToAnchor:v55 constant:-20.0];
  v84[5] = v54;
  v53 = [(MKPlaceCollectionCell *)self metadataStackView];
  v50 = [v53 topAnchor];
  v51 = [(MKPlaceCollectionCell *)self contentView];
  v49 = [v51 topAnchor];
  v48 = [v50 constraintGreaterThanOrEqualToAnchor:v49];
  v84[6] = v48;
  v47 = [(MKPlaceCollectionCell *)self metadataStackView];
  v45 = [v47 bottomAnchor];
  v46 = [(MKPlaceCollectionCell *)self contentView];
  v44 = [v46 bottomAnchor];
  v43 = [v45 constraintEqualToAnchor:v44 constant:-12.0];
  v84[7] = v43;
  v42 = [(MKPlaceCollectionCell *)self publisherLogoImageView];
  v41 = [v42 heightAnchor];
  v40 = [v41 constraintEqualToConstant:32.0];
  v84[8] = v40;
  v39 = [(MKPlaceCollectionCell *)self savedCollectionLabel];
  v37 = [v39 centerXAnchor];
  v38 = [(MKPlaceCollectionCell *)self savedView];
  v36 = [v38 centerXAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v84[9] = v35;
  v34 = [(MKPlaceCollectionCell *)self savedCollectionLabel];
  v32 = [v34 centerYAnchor];
  v33 = [(MKPlaceCollectionCell *)self savedView];
  v31 = [v33 centerYAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v84[10] = v30;
  uint64_t v29 = [(MKPlaceCollectionCell *)self savedCollectionLabel];
  v28 = [v29 heightAnchor];
  v27 = [v28 constraintEqualToConstant:v6];
  v84[11] = v27;
  v26 = [(MKPlaceCollectionCell *)self savedCollectionLabel];
  id v25 = [v26 widthAnchor];
  id v24 = [v25 constraintEqualToConstant:v4];
  v84[12] = v24;
  v23 = [(MKPlaceCollectionCell *)self savedView];
  id v21 = [v23 topAnchor];
  id v22 = [(MKPlaceCollectionCell *)self contentView];
  id v20 = [v22 topAnchor];
  v19 = [v21 constraintEqualToAnchor:v20 constant:8.0];
  v84[13] = v19;
  id v18 = [(MKPlaceCollectionCell *)self savedView];
  id v17 = [v18 trailingAnchor];
  uint64_t v7 = [(MKPlaceCollectionCell *)self contentView];
  v8 = [v7 trailingAnchor];
  uint64_t v9 = [v17 constraintEqualToAnchor:v8 constant:-8.0];
  v84[14] = v9;
  id v10 = [(MKPlaceCollectionCell *)self savedView];
  v11 = [v10 heightAnchor];
  uint64_t v12 = [v11 constraintEqualToConstant:v6];
  v84[15] = v12;
  id v13 = [(MKPlaceCollectionCell *)self savedView];
  double v14 = [v13 widthAnchor];
  double v15 = [v14 constraintEqualToConstant:v4];
  v84[16] = v15;
  double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:17];
  [v52 activateConstraints:v16];
}

- (UIVisualEffectView)savedView
{
  return self->_savedView;
}

- (UIImageView)collectionImageView
{
  return self->_collectionImageView;
}

- (CGSize)sizeForSavedPill
{
  double v3 = [(MKPlaceCollectionCell *)self savedCollectionLabel];
  double v4 = [v3 attributedText];
  [v4 size];
  double v6 = v5;

  uint64_t v7 = [(MKPlaceCollectionCell *)self savedView];
  [v7 _setContinuousCornerRadius:12.0];

  double v8 = 24.0;
  double v9 = v6 + 7.0 + 7.0;
  result.height = v8;
  result.width = v9;
  return result;
}

- (void)setupStackView
{
  id v3 = objc_alloc(MEMORY[0x1E4F42E20]);
  double v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(MKPlaceCollectionCell *)self setMetadataStackView:v4];

  double v5 = [(MKPlaceCollectionCell *)self metadataStackView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v6 = [(MKPlaceCollectionCell *)self metadataStackView];
  [v6 setAxis:1];

  uint64_t v7 = [(MKPlaceCollectionCell *)self metadataStackView];
  [v7 setDistribution:0];

  double v8 = [(MKPlaceCollectionCell *)self metadataStackView];
  [v8 setAlignment:1];

  double v9 = [(MKPlaceCollectionCell *)self metadataStackView];
  [v9 setAccessibilityIdentifier:@"PlaceCollectionMetadataStack"];

  id v10 = [(MKPlaceCollectionCell *)self contentView];
  v11 = [(MKPlaceCollectionCell *)self metadataStackView];
  [v10 addSubview:v11];

  [(MKPlaceCollectionCell *)self addPublisherLogoImage];
  [(MKPlaceCollectionCell *)self addCollectionNameView];

  [(MKPlaceCollectionCell *)self addSavedCollectionView];
}

- (UIStackView)metadataStackView
{
  return self->_metadataStackView;
}

- (void)setMetadataStackView:(id)a3
{
}

- (void)addSavedCollectionView
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F427D8] effectWithBlurRadius:10.0];
  double v4 = (void *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v3];
  [(MKPlaceCollectionCell *)self setSavedView:v4];

  double v5 = [(MKPlaceCollectionCell *)self savedView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v6 = [MEMORY[0x1E4F428B8] clearColor];
  uint64_t v7 = [(MKPlaceCollectionCell *)self savedView];
  [v7 setBackgroundColor:v6];

  double v8 = [MEMORY[0x1E4F428B8] blackColor];
  double v9 = [v8 colorWithAlphaComponent:0.24];
  id v10 = [(MKPlaceCollectionCell *)self savedView];
  v11 = [v10 contentView];
  [v11 setBackgroundColor:v9];

  uint64_t v12 = [(MKPlaceCollectionCell *)self savedView];
  [v12 setAccessibilityIdentifier:@"PlaceCollectionSavedView"];

  id v13 = objc_alloc(MEMORY[0x1E4F42B38]);
  double v14 = objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(MKPlaceCollectionCell *)self setSavedCollectionLabel:v14];

  double v15 = [(MKPlaceCollectionCell *)self savedCollectionLabel];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v16 = [MEMORY[0x1E4F428B8] whiteColor];
  id v17 = [(MKPlaceCollectionCell *)self savedCollectionLabel];
  [v17 setTextColor:v16];

  id v18 = [(MKPlaceCollectionCell *)self savedCollectionLabel];
  LODWORD(v19) = 1148846080;
  [v18 setContentCompressionResistancePriority:0 forAxis:v19];

  uint64_t v20 = *MEMORY[0x1E4F43888];
  double v21 = *MEMORY[0x1E4F43920];
  id v22 = [MEMORY[0x1E4F42A30] _preferredFontForTextStyle:*MEMORY[0x1E4F43888] weight:*MEMORY[0x1E4F43920]];
  v23 = [(MKPlaceCollectionCell *)self savedCollectionLabel];
  [v23 setFont:v22];

  id v24 = [(MKPlaceCollectionCell *)self savedCollectionLabel];
  [v24 setNumberOfLines:1];

  id v25 = objc_alloc_init(MEMORY[0x1E4F42698]);
  v26 = (void *)MEMORY[0x1E4F42A80];
  v27 = (void *)MEMORY[0x1E4F42A98];
  v28 = [MEMORY[0x1E4F42A30] _preferredFontForTextStyle:v20 weight:v21];
  uint64_t v29 = [v27 configurationWithFont:v28];
  v30 = [v26 systemImageNamed:@"checkmark" withConfiguration:v29];
  v31 = [MEMORY[0x1E4F428B8] whiteColor];
  v32 = [v30 imageWithTintColor:v31];
  [v25 setImage:v32];

  v33 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v25];
  id v34 = objc_alloc(MEMORY[0x1E4F28E48]);
  uint64_t v50 = *MEMORY[0x1E4F42508];
  v35 = [MEMORY[0x1E4F42A30] _preferredFontForTextStyle:v20 weight:v21];
  v51[0] = v35;
  v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
  v37 = (void *)[v34 initWithString:&stru_1ED919588 attributes:v36];

  [v37 appendAttributedString:v33];
  v38 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
  [v37 appendAttributedString:v38];

  id v39 = objc_alloc(MEMORY[0x1E4F28B18]);
  v40 = _MKLocalizedStringFromThisBundle(@"[Curated Collection] Saved Collection text");
  v41 = (void *)[v39 initWithString:v40];

  [v37 appendAttributedString:v41];
  v42 = [(MKPlaceCollectionCell *)self savedCollectionLabel];
  [v42 setTextAlignment:1];

  v43 = [(MKPlaceCollectionCell *)self savedCollectionLabel];
  [v43 setAttributedText:v37];

  v44 = [(MKPlaceCollectionCell *)self savedCollectionLabel];
  [v44 setAccessibilityIdentifier:@"PlaceCollectionSavedLabel"];

  v45 = [(MKPlaceCollectionCell *)self savedView];
  v46 = [v45 contentView];
  v47 = [(MKPlaceCollectionCell *)self savedCollectionLabel];
  [v46 addSubview:v47];

  v48 = [(MKPlaceCollectionCell *)self contentView];
  v49 = [(MKPlaceCollectionCell *)self savedView];
  [v48 addSubview:v49];
}

- (UILabel)savedCollectionLabel
{
  return self->_savedCollectionLabel;
}

- (void)setSavedView:(id)a3
{
}

- (void)setSavedCollectionLabel:(id)a3
{
}

- (void)addPublisherLogoImage
{
  id v3 = objc_alloc(MEMORY[0x1E4F42AA0]);
  double v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(MKPlaceCollectionCell *)self setPublisherLogoImageView:v4];

  double v5 = [(MKPlaceCollectionCell *)self publisherLogoImageView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v6 = [(MKPlaceCollectionCell *)self publisherLogoImageView];
  [v6 setAccessibilityIgnoresInvertColors:1];

  uint64_t v7 = [(MKPlaceCollectionCell *)self publisherLogoImageView];
  [v7 setAccessibilityIdentifier:@"PlaceCollectionPublisherLogo"];

  double v8 = [(MKPlaceCollectionCell *)self publisherLogoImageView];
  [v8 setContentMode:1];

  id v10 = [(MKPlaceCollectionCell *)self metadataStackView];
  double v9 = [(MKPlaceCollectionCell *)self publisherLogoImageView];
  [v10 addArrangedSubview:v9];
}

void __41__MKPlaceCollectionCell_setImageMetadata__block_invoke(uint64_t a1, void *a2)
{
  id v23 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v4 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_8;
  }
  double v5 = [WeakRetained updateIdentifier];
  if (([v5 isEqual:*(void *)(a1 + 32)] & 1) == 0)
  {

LABEL_8:
    id v22 = [v4 publisherLogoImageView];
    [v22 setHidden:1];
    goto LABEL_9;
  }
  double v6 = [v4 item];

  if (!v23 || !v6) {
    goto LABEL_8;
  }
  uint64_t v7 = [v4 publisherLogoImageView];
  double v8 = [v7 image];

  if (v8) {
    goto LABEL_10;
  }
  double v9 = [v4 publisherLogoImageView];
  [v9 setImage:v23];

  id v10 = [v4 publisherLogoImageView];
  v11 = [v10 widthAnchor];
  uint64_t v12 = [v4 publisherLogoImageView];
  id v13 = [v12 heightAnchor];
  double v14 = [v4 publisherLogoImageView];
  double v15 = [v14 image];
  [v15 size];
  double v17 = v16;
  id v18 = [v4 publisherLogoImageView];
  double v19 = [v18 image];
  [v19 size];
  double v21 = [v11 constraintEqualToAnchor:v13 multiplier:v17 / v20];
  [v4 setLogoWidthConstraint:v21];

  id v22 = [v4 logoWidthConstraint];
  [v22 setActive:1];
LABEL_9:

LABEL_10:
}

- (UIImageView)publisherLogoImageView
{
  return self->_publisherLogoImageView;
}

- (NSUUID)updateIdentifier
{
  return self->_updateIdentifier;
}

- (void)setLogoWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)logoWidthConstraint
{
  return self->_logoWidthConstraint;
}

- (void)setupCollectionImage
{
  id v3 = objc_alloc(MEMORY[0x1E4F42AA0]);
  double v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(MKPlaceCollectionCell *)self setCollectionImageView:v4];

  double v5 = [(MKPlaceCollectionCell *)self collectionImageView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v6 = [(MKPlaceCollectionCell *)self collectionImageView];
  [v6 setAccessibilityIgnoresInvertColors:1];

  uint64_t v7 = [(MKPlaceCollectionCell *)self collectionImageView];
  [v7 setAccessibilityIdentifier:@"PlaceCollectionImage"];

  double v8 = [(MKPlaceCollectionCell *)self collectionImageView];
  [v8 setContentMode:2];

  id v10 = [(MKPlaceCollectionCell *)self contentView];
  double v9 = [(MKPlaceCollectionCell *)self collectionImageView];
  [v10 addSubview:v9];
}

- (void)setPublisherLogoImageView:(id)a3
{
}

- (void)setCollectionImageView:(id)a3
{
}

- (MKPlaceCollectionCell)initWithFrame:(CGRect)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)MKPlaceCollectionCell;
  id v3 = -[MKPlaceCollectionCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    [(MKPlaceCollectionCell *)v3 setupSubviews];
    [(MKPlaceCollectionCell *)v4 setupCornerRadius];
    [(MKPlaceCollectionCell *)v4 setupConstraints];
    [(MKPlaceCollectionCell *)v4 setupShadows];
    [(MKPlaceCollectionCell *)v4 setupAccessibility];
    v9[0] = objc_opt_class();
    double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    id v6 = (id)[(MKPlaceCollectionCell *)v4 registerForTraitChanges:v5 withAction:sel_traitEnvironment_didChangeTraitCollection_];
  }
  return v4;
}

- (void)setupShadows
{
  id v3 = [MEMORY[0x1E4F428B8] systemBlackColor];
  uint64_t v4 = [v3 CGColor];
  double v5 = [(MKPlaceCollectionCell *)self layer];
  [v5 setShadowColor:v4];

  id v6 = [(MKPlaceCollectionCell *)self layer];
  LODWORD(v7) = 1028443341;
  [v6 setShadowOpacity:v7];

  objc_super v8 = [(MKPlaceCollectionCell *)self layer];
  objc_msgSend(v8, "setShadowOffset:", 0.0, 2.0);

  double v9 = [(MKPlaceCollectionCell *)self layer];
  [v9 setShadowRadius:12.0];

  id v10 = [(MKPlaceCollectionCell *)self layer];
  [v10 setShadowPathIsBounds:1];
}

- (void)setupCornerRadius
{
  id v3 = [(MKPlaceCollectionCell *)self contentView];
  [v3 _setContinuousCornerRadius:10.0];

  id v5 = [(MKPlaceCollectionCell *)self contentView];
  uint64_t v4 = [v5 layer];
  [v4 setMasksToBounds:1];
}

- (void)setupAccessibility
{
  [(MKPlaceCollectionCell *)self setAccessibilityIdentifier:@"PlaceCollectionCell"];
  id v3 = [(MKPlaceCollectionCell *)self metadataStackView];
  [v3 setIsAccessibilityElement:1];

  uint64_t v4 = *MEMORY[0x1E4F434F0];
  id v5 = [(MKPlaceCollectionCell *)self metadataStackView];
  [v5 setAccessibilityTraits:v4];
}

- (void)setupSubviews
{
  [(MKPlaceCollectionCell *)self setupCollectionImage];

  [(MKPlaceCollectionCell *)self setupStackView];
}

void __41__MKPlaceCollectionCell_setImageMetadata__block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = MKGetCuratedCollectionsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v3 = [*(id *)(a1 + 32) item];
    uint64_t v4 = [v3 collectionTitle];
    id v5 = [v4 string];
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    [v6 timeIntervalSinceDate:*(void *)(a1 + 40)];
    int v8 = 138412546;
    double v9 = v5;
    __int16 v10 = 2048;
    uint64_t v11 = v7;
    _os_log_impl(&dword_18BAEC000, v2, OS_LOG_TYPE_DEBUG, "[⌛]Finished showing image for : %@ in %f", (uint8_t *)&v8, 0x16u);
  }
}

void __41__MKPlaceCollectionCell_setImageMetadata__block_invoke_59(uint64_t a1, void *a2, uint64_t a3, int a4, char a5)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v11 = WeakRetained;
  if ((a5 & 1) == 0)
  {
    id v22 = MKGetCuratedCollectionsLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = [*(id *)(a1 + 32) item];
      id v24 = [v23 collectionTitle];
      id v25 = [v24 string];
      *(_DWORD *)buf = 138412290;
      id v34 = v25;
      _os_log_impl(&dword_18BAEC000, v22, OS_LOG_TYPE_INFO, "Cancelled image download for collection: %@", buf, 0xCu);
    }
    goto LABEL_19;
  }
  if (!WeakRetained) {
    goto LABEL_16;
  }
  uint64_t v12 = [WeakRetained updateIdentifier];
  if (([v12 isEqual:*(void *)(a1 + 40)] & 1) == 0)
  {

    goto LABEL_16;
  }
  id v13 = [*(id *)(a1 + 32) item];

  if (!v13)
  {
LABEL_16:
    v26 = MKGetCuratedCollectionsLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18BAEC000, v26, OS_LOG_TYPE_INFO, "Cell doesn't exist OR identifier mistach", buf, 2u);
    }

    goto LABEL_19;
  }
  double v14 = MKGetCuratedCollectionsLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    double v15 = [v11 item];
    double v16 = [v15 collectionTitle];
    double v17 = [v16 string];
    *(_DWORD *)buf = 138412290;
    id v34 = v17;
    _os_log_impl(&dword_18BAEC000, v14, OS_LOG_TYPE_DEBUG, "[⌛]Received image for : %@", buf, 0xCu);
  }
  if (v9 && !a3)
  {
    id v18 = MKGetCuratedCollectionsLog();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
    if (a4)
    {
      double v20 = 0.0;
      if (v19)
      {
        *(_WORD *)buf = 0;
        double v21 = "Received cached image. Displaying without animation.";
LABEL_22:
        _os_log_impl(&dword_18BAEC000, v18, OS_LOG_TYPE_INFO, v21, buf, 2u);
      }
    }
    else
    {
      double v20 = 0.100000001;
      if (v19)
      {
        *(_WORD *)buf = 0;
        double v21 = "Received non-cached image. Displaying with animation.";
        goto LABEL_22;
      }
    }

    v27 = (void *)MEMORY[0x1E4F42FF0];
    v28 = [v11 collectionImageView];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __41__MKPlaceCollectionCell_setImageMetadata__block_invoke_61;
    v31[3] = &unk_1E54B8248;
    v31[4] = v11;
    id v32 = v9;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __41__MKPlaceCollectionCell_setImageMetadata__block_invoke_2;
    v29[3] = &unk_1E54B8930;
    v29[4] = v11;
    id v30 = *(id *)(a1 + 48);
    [v27 transitionWithView:v28 duration:5242882 options:v31 animations:v29 completion:v20];
  }
LABEL_19:
}

- (BOOL)canBecomeFirstResponder
{
  id v2 = [(MKPlaceCollectionCell *)self traitCollection];
  BOOL v3 = [v2 userInterfaceIdiom] == 5;

  return v3;
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v5 = objc_msgSend(a4, "preferredContentSizeCategory", a3);
  id v6 = [(MKPlaceCollectionCell *)self traitCollection];
  uint64_t v7 = [v6 preferredContentSizeCategory];

  if (v5 != v7)
  {
    int v8 = [(MKPlaceCollectionCell *)self item];
    [v8 contentCategorySizeDidChange];

    [(MKPlaceCollectionCell *)self setTextMetadata];
  }
}

- (void)prepareForReuse
{
  v8.receiver = self;
  v8.super_class = (Class)MKPlaceCollectionCell;
  [(MKPlaceCollectionCell *)&v8 prepareForReuse];
  BOOL v3 = [(MKPlaceCollectionCell *)self publisherLogoImageView];
  [v3 setImage:0];

  uint64_t v4 = [(MKPlaceCollectionCell *)self collectionLabel];
  [v4 setAttributedText:0];

  id v5 = [(MKPlaceCollectionCell *)self collectionImageView];
  [v5 setImage:0];

  id v6 = [(MKPlaceCollectionCell *)self contentView];
  [v6 setBackgroundColor:0];

  uint64_t v7 = [(MKPlaceCollectionCell *)self metadataStackView];
  [v7 setAccessibilityLabel:0];

  [(MKPlaceCollectionCell *)self setItem:0];
}

- (UIImageView)checkMarkImageView
{
  return self->_checkMarkImageView;
}

- (void)setCheckMarkImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateIdentifier, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_logoWidthConstraint, 0);
  objc_storeStrong((id *)&self->_checkMarkImageView, 0);
  objc_storeStrong((id *)&self->_savedView, 0);
  objc_storeStrong((id *)&self->_savedCollectionLabel, 0);
  objc_storeStrong((id *)&self->_collectionLabel, 0);
  objc_storeStrong((id *)&self->_metadataStackView, 0);
  objc_storeStrong((id *)&self->_collectionImageView, 0);

  objc_storeStrong((id *)&self->_publisherLogoImageView, 0);
}

@end