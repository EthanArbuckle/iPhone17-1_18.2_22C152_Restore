@interface MUPlaceCompactTileContentView
+ (CGSize)_preferredSizeForViewModel:(id)a3 cellConfiguration:(id)a4 maximumMeasurements:(id)a5;
+ (CGSize)preferredSizeForViewModels:(id)a3 cellConfiguration:(id)a4 usingMeasurements:(id)a5;
- (MUPlaceCompactTileContentView)initWithCellConfiguration:(id)a3;
- (MUPlaceTileViewModel)viewModel;
- (UIImageView)tileImageView;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateAppearance;
- (void)_updateFonts;
- (void)setViewModel:(id)a3;
@end

@implementation MUPlaceCompactTileContentView

- (MUPlaceCompactTileContentView)initWithCellConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUPlaceCompactTileContentView;
  v6 = -[MUPlaceCompactTileContentView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    [(MUPlaceCompactTileContentView *)v7 setAccessibilityIdentifier:@"PlaceCompactTileContent"];
    [(MUPlaceCompactTileContentView *)v7 _setupSubviews];
    [(MUPlaceCompactTileContentView *)v7 _setupConstraints];
  }

  return v7;
}

- (UIImageView)tileImageView
{
  return 0;
}

- (void)_setupSubviews
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if ([(MUPlaceTileCellConfiguration *)self->_configuration showIcon])
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1838]);
    v4 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    iconView = self->_iconView;
    self->_iconView = v4;

    [(UIImageView *)self->_iconView setAccessibilityIdentifier:@"PlaceCompactTileIcon"];
    [(MUPlaceCompactTileContentView *)self addSubview:self->_iconView];
  }
  _createTitleLabel();
  v6 = (MULabelViewProtocol *)objc_claimAutoreleasedReturnValue();
  primaryLabel = self->_primaryLabel;
  self->_primaryLabel = v6;

  [(MULabelViewProtocol *)self->_primaryLabel setAccessibilityIdentifier:@"PlaceCompactTilePrimaryLabel"];
  [(MUPlaceCompactTileContentView *)self addSubview:self->_primaryLabel];
  _createFooterLabel();
  v8 = (MULabelViewProtocol *)objc_claimAutoreleasedReturnValue();
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = v8;

  [(MULabelViewProtocol *)self->_secondaryLabel setAccessibilityIdentifier:@"PlaceCompactTileSecondaryLabel"];
  [(MUPlaceCompactTileContentView *)self addSubview:self->_secondaryLabel];
  v10 = self;
  v13[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  id v12 = (id)[(MUPlaceCompactTileContentView *)self registerForTraitChanges:v11 withAction:sel__updateFonts];
}

- (void)_setupConstraints
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(MUPlaceTileCellConfiguration *)self->_configuration showIcon])
  {
    v4 = -[MUSizeLayout initWithItem:size:]([MUSizeLayout alloc], "initWithItem:size:", self->_iconView, 24.0, 24.0);
    [v3 addObject:v4];
    id v5 = [[MUCompositionalStackLayoutGroup alloc] initWithAxis:1];
    primaryLabel = self->_primaryLabel;
    v20[0] = self->_iconView;
    v20[1] = primaryLabel;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    [(MUCompositionalStackLayoutGroup *)v5 setArrangedLayoutItems:v7];

    [(MUCompositionalStackLayoutGroup *)v5 setSpacing:4.0];
    [(MUCompositionalStackLayoutGroup *)v5 setAlignment:1 forArrangedLayoutItem:self->_iconView];
    secondaryLabel = self->_secondaryLabel;
    v19[0] = v5;
    v19[1] = secondaryLabel;
    objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  }
  else
  {
    v10 = self->_secondaryLabel;
    v18[0] = self->_primaryLabel;
    v18[1] = v10;
    objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  }
  v11 = [[MUCompositionalStackLayoutGroup alloc] initWithAxis:1];
  [(MUCompositionalStackLayoutGroup *)v11 setArrangedLayoutItems:v9];
  [(MUCompositionalStackLayoutGroup *)v11 setDistribution:5];
  LODWORD(v12) = 1112276992;
  [(MUCompositionalStackLayoutGroup *)v11 setDistributionFittingSizePriority:v12];
  -[MUCompositionalStackLayoutGroup setInsets:](v11, "setInsets:", 16.0, 16.0, 16.0, 16.0);
  [(MUCompositionalStackLayoutGroup *)v11 setSpacing:8.0];
  v13 = [[MUCompositionalStackLayoutGroup alloc] initWithAxis:1];
  v17 = v11;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  [(MUCompositionalStackLayoutGroup *)v13 setArrangedLayoutItems:v14];

  [(MUCompositionalStackLayoutGroup *)v13 setDistribution:2];
  LODWORD(v15) = 1112539136;
  [(MUCompositionalStackLayoutGroup *)v13 setDistributionFittingSizePriority:v15];
  v16 = [[MUCompositionalStackLayout alloc] initWithContainer:self group:v13];
  [v3 addObject:v16];
  objc_msgSend(MEMORY[0x1E4F28DC8], "_mapsui_activateLayouts:", v3);
}

- (void)setViewModel:(id)a3
{
  id v5 = a3;
  if ((-[MUPlaceTileViewModel isEqual:](self->_viewModel, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    [(MUPlaceCompactTileContentView *)self _updateAppearance];
  }
}

- (void)_updateAppearance
{
  if ([(MUPlaceTileCellConfiguration *)self->_configuration showIcon])
  {
    id v3 = self->_viewModel;
    objc_initWeak(&location, self);
    viewModel = self->_viewModel;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __50__MUPlaceCompactTileContentView__updateAppearance__block_invoke;
    v11[3] = &unk_1E57501F0;
    objc_copyWeak(&v13, &location);
    id v5 = v3;
    double v12 = v5;
    [(MUPlaceTileViewModel *)viewModel fetchBadgeIconWithCompletion:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  v6 = [(MUPlaceTileViewModel *)self->_viewModel tileName];
  [(MULabelViewProtocol *)self->_primaryLabel setText:v6];

  [(MULabelViewProtocol *)self->_secondaryLabel setNumberOfLines:[(MUPlaceTileViewModel *)self->_viewModel expectedNumberOfFooterLines]];
  v7 = self->_viewModel;
  v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  objc_super v9 = objc_msgSend(v8, "_mapkit_fontWithSymbolicTraits:", 0x8000);
  v10 = [(MUPlaceTileViewModel *)v7 footerAttributedStringForFont:v9];
  [(MULabelViewProtocol *)self->_secondaryLabel setAttributedText:v10];
}

void __50__MUPlaceCompactTileContentView__updateAppearance__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
    if (WeakRetained[55] == *(id *)(a1 + 32)) {
      [WeakRetained[51] setImage:v4];
    }
  }
}

- (void)_updateFonts
{
  id v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D0]];
  id v4 = objc_msgSend(v3, "_mapkit_fontWithSymbolicTraits:", 0x8000);
  id v5 = objc_msgSend(v4, "_mapkit_fontWithWeight:", *MEMORY[0x1E4FB09E0]);
  [(MULabelViewProtocol *)self->_primaryLabel setFont:v5];

  viewModel = self->_viewModel;
  id v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  v7 = objc_msgSend(v9, "_mapkit_fontWithSymbolicTraits:", 0x8000);
  v8 = [(MUPlaceTileViewModel *)viewModel footerAttributedStringForFont:v7];
  [(MULabelViewProtocol *)self->_secondaryLabel setAttributedText:v8];
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
  v33[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  [v8 tileWidth];
  double v11 = v10;
  int v12 = [v9 showIcon];

  if (v12) {
    double v13 = 44.0;
  }
  else {
    double v13 = 16.0;
  }
  uint64_t v14 = [v7 tileName];
  uint64_t v15 = [v14 length];

  if (v15)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F28B18]);
    double v17 = [v7 tileName];
    uint64_t v32 = *MEMORY[0x1E4FB06F8];
    double v18 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D0]];
    double v19 = objc_msgSend(v18, "_mapkit_fontWithSymbolicTraits:", 0x8000);
    double v20 = objc_msgSend(v19, "_mapkit_fontWithWeight:", *MEMORY[0x1E4FB09E0]);
    v33[0] = v20;
    long long v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    long long v22 = (void *)[v16 initWithString:v17 attributes:v21];

    v35.origin.x = _calculateBoundingRectForAttributedStringWithHeight(v22, v11 + -16.0 + -16.0);
    double Height = CGRectGetHeight(v35);
    [v8 maxTitleHeight];
    if (Height < v24) {
      double v24 = Height;
    }
    double v13 = v13 + v24;
  }
  v25 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  uint64_t v26 = objc_msgSend(v25, "_mapkit_fontWithSymbolicTraits:", 0x8000);
  v27 = [v7 footerAttributedStringForFont:v26];

  if ([v27 length])
  {
    v36.origin.x = _calculateBoundingRectForAttributedStringWithHeight(v27, 1000.0);
    double v13 = v13 + 8.0 + CGRectGetHeight(v36);
  }
  [v8 tileWidth];
  double v29 = v28;

  double v30 = v13 + 16.0;
  double v31 = v29;
  result.height = v30;
  result.width = v31;
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
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end