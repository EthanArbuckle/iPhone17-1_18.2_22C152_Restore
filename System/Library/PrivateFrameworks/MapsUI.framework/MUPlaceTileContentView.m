@interface MUPlaceTileContentView
+ (CGSize)_preferredSizeForViewModel:(id)a3 cellConfiguration:(id)a4 maximumMeasurements:(id)a5;
+ (CGSize)preferredSizeForViewModels:(id)a3 cellConfiguration:(id)a4 usingMeasurements:(id)a5;
+ (double)preferredWidth;
- (CGSize)intrinsicContentSize;
- (MUPlaceTileContentView)initWithCellConfiguration:(id)a3;
- (MUPlaceTileViewModel)viewModel;
- (UIImageView)tileImageView;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateAppearance;
- (void)_updateFonts;
- (void)setViewModel:(id)a3;
@end

@implementation MUPlaceTileContentView

- (MUPlaceTileContentView)initWithCellConfiguration:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MUPlaceTileContentView;
  v6 = -[MUPlaceTileContentView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    [(MUPlaceTileContentView *)v7 setAccessibilityIdentifier:@"PlaceTileContent"];
    [(MUPlaceTileContentView *)v7 _setupSubviews];
    [(MUPlaceTileContentView *)v7 _setupConstraints];
    [(UIView *)v7 _mapsui_setCardCorner];
    v8 = self;
    v13[0] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    id v10 = (id)[(MUPlaceTileContentView *)v7 registerForTraitChanges:v9 withAction:sel__updateAppearance];
  }
  return v7;
}

- (void)_setupSubviews
{
  v30[1] = *MEMORY[0x1E4F143B8];
  _createTitleLabel();
  v3 = (MULabelViewProtocol *)objc_claimAutoreleasedReturnValue();
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  [(MULabelViewProtocol *)self->_titleLabel setAccessibilityIdentifier:@"PlaceTileTitle"];
  [(MUPlaceTileContentView *)self addSubview:self->_titleLabel];
  _createSecondaryLabel();
  id v5 = (MULabelViewProtocol *)objc_claimAutoreleasedReturnValue();
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v5;

  [(MULabelViewProtocol *)self->_subtitleLabel setAccessibilityIdentifier:@"PlaceTileSubtitle"];
  [(MUPlaceTileContentView *)self addSubview:self->_subtitleLabel];
  _createFooterLabel();
  v7 = (MULabelViewProtocol *)objc_claimAutoreleasedReturnValue();
  footerLabel = self->_footerLabel;
  self->_footerLabel = v7;

  [(MULabelViewProtocol *)self->_footerLabel setAccessibilityIdentifier:@"PlaceTileFooter"];
  [(MUPlaceTileContentView *)self addSubview:self->_footerLabel];
  v9 = [MUImageView alloc];
  double v10 = *MEMORY[0x1E4F1DB28];
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v14 = -[MUImageView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], v11, v12, v13);
  contentImageView = self->_contentImageView;
  self->_contentImageView = v14;

  v16 = +[MUInfoCardStyle imageTileBackgroundColor];
  [(MUImageView *)self->_contentImageView setBackgroundColor:v16];

  [(MUImageView *)self->_contentImageView setClipsToBounds:1];
  [(MUImageView *)self->_contentImageView setAccessibilityIdentifier:@"PlaceTileImage"];
  [(MUPlaceTileContentView *)self addSubview:self->_contentImageView];
  v17 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
  titleLayoutGuide = self->_titleLayoutGuide;
  self->_titleLayoutGuide = v17;

  [(MUPlaceTileContentView *)self addLayoutGuide:self->_titleLayoutGuide];
  v19 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
  textLayoutGuide = self->_textLayoutGuide;
  self->_textLayoutGuide = v19;

  [(MUPlaceTileContentView *)self addLayoutGuide:self->_textLayoutGuide];
  if ([(MUPlaceTileCellConfiguration *)self->_configuration showIcon])
  {
    v21 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v10, v11, v12, v13);
    badgeImageView = self->_badgeImageView;
    self->_badgeImageView = v21;

    [(UIImageView *)self->_badgeImageView _setCornerRadius:12.0];
    v23 = [(UIImageView *)self->_badgeImageView layer];
    [v23 setBorderWidth:1.0];

    id v24 = [MEMORY[0x1E4FB1618] whiteColor];
    uint64_t v25 = [v24 CGColor];
    v26 = [(UIImageView *)self->_badgeImageView layer];
    [v26 setBorderColor:v25];

    [(UIImageView *)self->_badgeImageView setAccessibilityIdentifier:@"PlaceTileBadge"];
    [(MUPlaceTileContentView *)self addSubview:self->_badgeImageView];
  }
  v27 = self;
  v30[0] = v27;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  id v29 = (id)[(MUPlaceTileContentView *)self registerForTraitChanges:v28 withAction:sel__updateFonts];
}

- (void)_setupConstraints
{
  v23[2] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  v19 = -[MUSizeLayout initWithItem:size:]([MUSizeLayout alloc], "initWithItem:size:", self->_contentImageView, 150.0, 112.0);
  objc_msgSend(v3, "addObject:");
  v4 = [[MUStackLayout alloc] initWithContainer:self->_titleLayoutGuide axis:1];
  titleStackLayout = self->_titleStackLayout;
  self->_titleStackLayout = v4;

  subtitleLabel = self->_subtitleLabel;
  v23[0] = self->_titleLabel;
  v23[1] = subtitleLabel;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  [(MUStackLayout *)self->_titleStackLayout setArrangedLayoutItems:v7];

  [v3 addObject:self->_titleStackLayout];
  v8 = [[MUStackLayout alloc] initWithContainer:self->_textLayoutGuide axis:1];
  textStackLayout = self->_textStackLayout;
  self->_textStackLayout = v8;

  footerLabel = self->_footerLabel;
  v22[0] = self->_titleLayoutGuide;
  v22[1] = footerLabel;
  double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  [(MUStackLayout *)self->_textStackLayout setArrangedLayoutItems:v11];

  [(MUStackLayout *)self->_textStackLayout setDistribution:5];
  -[MUStackLayout setInsets:](self->_textStackLayout, "setInsets:", 16.0, 16.0, 16.0, 16.0);
  [v3 addObject:self->_textStackLayout];
  double v12 = [[MUStackLayout alloc] initWithContainer:self axis:1];
  textLayoutGuide = self->_textLayoutGuide;
  v21[0] = self->_contentImageView;
  v21[1] = textLayoutGuide;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  [(MUStackLayout *)v12 setArrangedLayoutItems:v14];

  [(MUStackLayout *)v12 setDistribution:2];
  LODWORD(v15) = 1112276992;
  [(MUStackLayout *)v12 setDistributionFittingSizePriority:v15];
  [v3 addObject:v12];
  if ([(MUPlaceTileCellConfiguration *)self->_configuration showIcon])
  {
    v16 = -[MUSizeLayout initWithItem:size:]([MUSizeLayout alloc], "initWithItem:size:", self->_badgeImageView, 24.0, 24.0);
    [v3 addObject:v16];
    v17 = [[MUBoxLayout alloc] initWithContainer:self->_contentImageView];
    badgeImageView = self->_badgeImageView;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&badgeImageView count:1];
    [(MUBoxLayout *)v17 setArrangedLayoutItems:v18];

    [(MUBoxLayout *)v17 setHorizontalAlignment:1];
    [(MUBoxLayout *)v17 setVerticalAlignment:3];
    -[MUBoxLayout setOffset:forArrangedLayoutItem:](v17, "setOffset:forArrangedLayoutItem:", self->_badgeImageView, 8.0, 12.0);
    [v3 addObject:v17];
  }
  objc_msgSend(MEMORY[0x1E4F28DC8], "_mapsui_activateLayouts:", v3);
}

- (void)setViewModel:(id)a3
{
  id v5 = a3;
  if ((-[MUPlaceTileViewModel isEqual:](self->_viewModel, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    [(MUPlaceTileContentView *)self _updateAppearance];
  }
}

- (void)_updateAppearance
{
  [(MUImageView *)self->_contentImageView setImage:0];
  [(UIImageView *)self->_badgeImageView setImage:0];
  [(UIImageView *)self->_badgeImageView setHidden:1];
  v3 = [(MUPlaceTileViewModel *)self->_viewModel tileName];
  [(MULabelViewProtocol *)self->_titleLabel setText:v3];

  viewModel = self->_viewModel;
  id v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  v6 = [(MUPlaceTileViewModel *)viewModel subtitleAttributedStringForFont:v5];
  [(MULabelViewProtocol *)self->_subtitleLabel setAttributedText:v6];

  v7 = [(MULabelViewProtocol *)self->_subtitleLabel attributedText];
  uint64_t v8 = [v7 length];

  [(MUStackLayout *)self->_titleStackLayout setSpacing:2.0];
  double v9 = 8.0;
  if (!v8) {
    double v9 = 6.0;
  }
  [(MUStackLayout *)self->_textStackLayout setSpacing:v9];
  [(MULabelViewProtocol *)self->_footerLabel setNumberOfLines:[(MUPlaceTileViewModel *)self->_viewModel expectedNumberOfFooterLines]];
  double v10 = self->_viewModel;
  double v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  double v12 = objc_msgSend(v11, "_mapkit_fontWithSymbolicTraits:", 0x8000);
  double v13 = [(MUPlaceTileViewModel *)v10 footerAttributedStringForFont:v12];
  [(MULabelViewProtocol *)self->_footerLabel setAttributedText:v13];

  v14 = self->_viewModel;
  objc_initWeak(&location, self);
  double v15 = self->_viewModel;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __43__MUPlaceTileContentView__updateAppearance__block_invoke;
  v26[3] = &unk_1E57501F0;
  objc_copyWeak(&v28, &location);
  v16 = v14;
  v27 = v16;
  [(MUPlaceTileViewModel *)v15 fetchFallbackIconWithCompletion:v26];
  if ([(MUPlaceTileCellConfiguration *)self->_configuration showIcon])
  {
    v17 = self->_viewModel;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __43__MUPlaceTileContentView__updateAppearance__block_invoke_2;
    void v23[3] = &unk_1E57501F0;
    objc_copyWeak(&v25, &location);
    id v24 = v16;
    [(MUPlaceTileViewModel *)v17 fetchBadgeIconWithCompletion:v23];

    objc_destroyWeak(&v25);
  }
  v18 = self->_viewModel;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __43__MUPlaceTileContentView__updateAppearance__block_invoke_3;
  v20[3] = &unk_1E57501F0;
  objc_copyWeak(&v22, &location);
  v19 = v16;
  v21 = v19;
  -[MUPlaceTileViewModel fetchImageTilewWithSize:completion:](v18, "fetchImageTilewWithSize:completion:", v20, 150.0, 112.0);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

void __43__MUPlaceTileContentView__updateAppearance__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
    if (WeakRetained[61] == *(id *)(a1 + 32)) {
      [WeakRetained[54] setFallbackImage:v4];
    }
  }
}

void __43__MUPlaceTileContentView__updateAppearance__block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
    if (WeakRetained[61] == *(id *)(a1 + 32)) {
      [WeakRetained[55] setImage:v4];
    }
  }
}

void __43__MUPlaceTileContentView__updateAppearance__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
    if (*((void *)WeakRetained + 61) == *(void *)(a1 + 32))
    {
      v7 = (void *)*((void *)WeakRetained + 54);
      if (v8) {
        [v7 setImage:v8 animated:a4 ^ 1u];
      }
      else {
        [v7 setImage:0];
      }
      [*((id *)WeakRetained + 55) setHidden:v8 == 0];
    }
  }
}

- (void)_updateFonts
{
  v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D0]];
  id v4 = objc_msgSend(v3, "_mapkit_fontWithSymbolicTraits:", 0x8000);
  id v5 = objc_msgSend(v4, "_mapkit_fontWithWeight:", *MEMORY[0x1E4FB09E0]);
  [(MULabelViewProtocol *)self->_titleLabel setFont:v5];

  viewModel = self->_viewModel;
  v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  id v8 = [(MUPlaceTileViewModel *)viewModel subtitleAttributedStringForFont:v7];
  [(MULabelViewProtocol *)self->_subtitleLabel setAttributedText:v8];

  double v9 = self->_viewModel;
  id v12 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  double v10 = objc_msgSend(v12, "_mapkit_fontWithSymbolicTraits:", 0x8000);
  double v11 = [(MUPlaceTileViewModel *)v9 footerAttributedStringForFont:v10];
  [(MULabelViewProtocol *)self->_footerLabel setAttributedText:v11];
}

- (UIImageView)tileImageView
{
  return [(MUImageView *)self->_contentImageView contentImageView];
}

- (CGSize)intrinsicContentSize
{
  +[MUPlaceTileContentView preferredWidth];
  double v3 = *MEMORY[0x1E4FB30D8];
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)preferredWidth
{
  return 150.0;
}

+ (CGSize)preferredSizeForViewModels:(id)a3 cellConfiguration:(id)a4 usingMeasurements:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v12 = *MEMORY[0x1E4F1DB30];
  double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v13 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v8);
        }
        [a1 _preferredSizeForViewModel:*(void *)(*((void *)&v21 + 1) + 8 * i) cellConfiguration:v9 maximumMeasurements:v10];
        if (v18 > v11)
        {
          double v11 = v18;
          double v12 = v17;
        }
      }
      uint64_t v14 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  double v19 = v12;
  double v20 = v11;
  result.height = v20;
  result.width = v19;
  return result;
}

+ (CGSize)_preferredSizeForViewModel:(id)a3 cellConfiguration:(id)a4 maximumMeasurements:(id)a5
{
  v50[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a5;
  [v7 tileWidth];
  double v9 = v8 + -32.0;
  id v10 = [v6 tileName];
  uint64_t v11 = [v10 length];

  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4FB0848]);
    LODWORD(v13) = 1.0;
    [v12 setHyphenationFactor:v13];
    id v14 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v15 = [v6 tileName];
    v49[0] = *MEMORY[0x1E4FB06F8];
    v16 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D0]];
    double v17 = objc_msgSend(v16, "_mapkit_fontWithSymbolicTraits:", 0x8000);
    double v18 = objc_msgSend(v17, "_mapkit_fontWithWeight:", *MEMORY[0x1E4FB09E0]);
    v49[1] = *MEMORY[0x1E4FB0738];
    v50[0] = v18;
    v50[1] = v12;
    double v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:2];
    double v20 = (void *)[v14 initWithString:v15 attributes:v19];

    v52.origin.x = _calculateBoundingRectForAttributedStringWithHeight(v20, v9);
    double Height = CGRectGetHeight(v52);
    [v7 maxTitleHeight];
    if (Height < v22) {
      double v22 = Height;
    }
    double v23 = v22 + 128.0;
  }
  else
  {
    double v23 = 128.0;
  }
  long long v24 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  id v25 = [v6 subtitleAttributedStringForFont:v24];

  if ([v25 length])
  {
    v53.origin.x = _calculateBoundingRectForAttributedStringWithHeight(v25, v9);
    double v26 = CGRectGetHeight(v53);
    [v7 maxSubtitleHeight];
    if (v26 < v27) {
      double v27 = v26;
    }
    BOOL v28 = v27 > 0.0;
    double v23 = v23 + v27;
  }
  else
  {
    BOOL v28 = 0;
  }
  id v29 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  v30 = objc_msgSend(v29, "_mapkit_fontWithSymbolicTraits:", 0x8000);
  v31 = [v6 footerAttributedStringForFont:v30];
  double v32 = _calculateBoundingRectForAttributedStringWithHeight(v31, v9);
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  CGFloat v38 = v37;

  v54.origin.x = v32;
  v54.origin.y = v34;
  v54.size.width = v36;
  v54.size.height = v38;
  BOOL v39 = CGRectGetHeight(v54) <= 0.0;
  double v40 = v23 + 2.0 + 8.0;
  if (v39) {
    double v40 = v23 + 2.0;
  }
  if (v28) {
    double v41 = v40;
  }
  else {
    double v41 = v23 + 8.0;
  }
  v55.origin.x = v32;
  v55.origin.y = v34;
  v55.size.width = v36;
  v55.size.height = v38;
  double v42 = CGRectGetHeight(v55);
  [v7 maxFooterHeight];
  if (v42 >= v43) {
    double v44 = v43;
  }
  else {
    double v44 = v42;
  }
  [v7 tileWidth];
  double v46 = v45;

  double v47 = v41 + v44 + 16.0;
  double v48 = v46;
  result.height = v47;
  result.width = v48;
  return result;
}

- (MUPlaceTileViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_textStackLayout, 0);
  objc_storeStrong((id *)&self->_titleStackLayout, 0);
  objc_storeStrong((id *)&self->_textLayoutGuide, 0);
  objc_storeStrong((id *)&self->_titleLayoutGuide, 0);
  objc_storeStrong((id *)&self->_badgeImageView, 0);
  objc_storeStrong((id *)&self->_contentImageView, 0);
  objc_storeStrong((id *)&self->_footerLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end