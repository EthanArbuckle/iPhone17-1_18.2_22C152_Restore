@interface MUPlaceTileListContentView
- (MUPlaceTileListContentView)initWithFrame:(CGRect)a3;
- (MUPlaceTileViewModel)viewModel;
- (UIImageView)tileImageView;
- (void)_setupConstraints;
- (void)_setupViews;
- (void)_updateAppearance;
- (void)_updateFonts;
- (void)setViewModel:(id)a3;
@end

@implementation MUPlaceTileListContentView

- (MUPlaceTileListContentView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MUPlaceTileListContentView;
  v3 = -[MUPlaceSectionRowView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MUPlaceTileListContentView *)v3 setAccessibilityIdentifier:@"PlaceTileListContent"];
    [(MUPlaceTileListContentView *)v4 _setupViews];
    [(MUPlaceTileListContentView *)v4 _setupConstraints];
  }
  return v4;
}

- (void)_setupViews
{
  v16[1] = *MEMORY[0x1E4F143B8];
  _createTitleLabel();
  v3 = (MULabelViewProtocol *)objc_claimAutoreleasedReturnValue();
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  [(MULabelViewProtocol *)self->_titleLabel setAccessibilityIdentifier:@"PlaceTileListTitle"];
  [(MUPlaceTileListContentView *)self addSubview:self->_titleLabel];
  _createSecondaryLabel();
  v5 = (MULabelViewProtocol *)objc_claimAutoreleasedReturnValue();
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = v5;

  [(MULabelViewProtocol *)self->_secondaryLabel setAccessibilityIdentifier:@"PlaceTileListSecondaryLabel"];
  [(MUPlaceTileListContentView *)self addSubview:self->_secondaryLabel];
  _createSecondaryLabel();
  v7 = (MULabelViewProtocol *)objc_claimAutoreleasedReturnValue();
  tertiaryLabel = self->_tertiaryLabel;
  self->_tertiaryLabel = v7;

  [(MULabelViewProtocol *)self->_tertiaryLabel setAccessibilityIdentifier:@"PlaceTileListTertiaryLabel"];
  [(MUPlaceTileListContentView *)self addSubview:self->_tertiaryLabel];
  v9 = [MUImageView alloc];
  v10 = -[MUImageView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  stopImageView = self->_stopImageView;
  self->_stopImageView = v10;

  v12 = +[MUInfoCardStyle imageTileBackgroundColor];
  [(MUImageView *)self->_stopImageView setBackgroundColor:v12];

  [(UIView *)self->_stopImageView _mapsui_setCardCorner];
  [(MUImageView *)self->_stopImageView setAccessibilityIdentifier:@"PlaceTileListImage"];
  [(MUPlaceTileListContentView *)self addSubview:self->_stopImageView];
  v13 = self;
  v16[0] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v15 = (id)[(MUPlaceTileListContentView *)self registerForTraitChanges:v14 withAction:sel__updateFonts];
}

- (void)_setupConstraints
{
  v16[3] = *MEMORY[0x1E4F143B8];
  v3 = -[MUSizeLayout initWithItem:size:]([MUSizeLayout alloc], "initWithItem:size:", self->_stopImageView, 48.0, 48.0);
  v4 = [[MUCompositionalStackLayoutGroup alloc] initWithAxis:1];
  secondaryLabel = self->_secondaryLabel;
  v16[0] = self->_titleLabel;
  v16[1] = secondaryLabel;
  void v16[2] = self->_tertiaryLabel;
  objc_super v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
  [(MUCompositionalStackLayoutGroup *)v4 setArrangedLayoutItems:v6];

  v7 = [[MUCompositionalStackLayoutGroup alloc] initWithAxis:0];
  stopImageView = self->_stopImageView;
  v15[0] = v4;
  v15[1] = stopImageView;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  [(MUCompositionalStackLayoutGroup *)v7 setArrangedLayoutItems:v9];

  [(MUCompositionalStackLayoutGroup *)v7 setDistribution:5];
  [(MUCompositionalStackLayoutGroup *)v7 setAlignment:2];
  [(MUCompositionalStackLayoutGroup *)v7 setAlignmentBoundsContent:1];
  LODWORD(v10) = 1112276992;
  [(MUCompositionalStackLayoutGroup *)v7 setAlignmentFittingSizePriority:v10];
  -[MUCompositionalStackLayoutGroup setInsets:](v7, "setInsets:", 16.0, 16.0, 16.0, 16.0);
  [(MUCompositionalStackLayoutGroup *)v7 setSpacing:8.0];
  v11 = [[MUCompositionalStackLayout alloc] initWithContainer:self group:v7];
  v12 = (void *)MEMORY[0x1E4F28DC8];
  v14[0] = v3;
  v14[1] = v11;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  objc_msgSend(v12, "_mapsui_activateLayouts:", v13);
}

- (void)setViewModel:(id)a3
{
  id v5 = a3;
  if ((-[MUPlaceTileViewModel isEqual:](self->_viewModel, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    [(MUPlaceTileListContentView *)self _updateAppearance];
  }
}

- (void)_updateAppearance
{
  [(MUImageView *)self->_stopImageView setImage:0];
  v3 = [(MUPlaceTileViewModel *)self->_viewModel tileName];
  [(MULabelViewProtocol *)self->_titleLabel setText:v3];

  viewModel = self->_viewModel;
  uint64_t v5 = *MEMORY[0x1E4FB2950];
  objc_super v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  v7 = [(MUPlaceTileViewModel *)viewModel subtitleAttributedStringForFont:v6];
  [(MULabelViewProtocol *)self->_secondaryLabel setAttributedText:v7];

  [(MULabelViewProtocol *)self->_tertiaryLabel setNumberOfLines:[(MUPlaceTileViewModel *)self->_viewModel expectedNumberOfFooterLines]];
  v8 = self->_viewModel;
  v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v5];
  double v10 = [(MUPlaceTileViewModel *)v8 footerAttributedStringForFont:v9];
  [(MULabelViewProtocol *)self->_tertiaryLabel setAttributedText:v10];

  objc_initWeak(&location, self);
  v11 = self->_viewModel;
  v12 = self->_viewModel;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __47__MUPlaceTileListContentView__updateAppearance__block_invoke;
  v19[3] = &unk_1E57501F0;
  objc_copyWeak(&v21, &location);
  v13 = v11;
  v20 = v13;
  [(MUPlaceTileViewModel *)v12 fetchFallbackIconWithCompletion:v19];
  v14 = self->_viewModel;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __47__MUPlaceTileListContentView__updateAppearance__block_invoke_2;
  v16[3] = &unk_1E57501F0;
  objc_copyWeak(&v18, &location);
  id v15 = v13;
  v17 = v15;
  -[MUPlaceTileViewModel fetchImageTilewWithSize:completion:](v14, "fetchImageTilewWithSize:completion:", v16, 150.0, 112.0);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&location);
}

void __47__MUPlaceTileListContentView__updateAppearance__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
    if (WeakRetained[63] == *(id *)(a1 + 32)) {
      [WeakRetained[61] setFallbackImage:v4];
    }
  }
}

void __47__MUPlaceTileListContentView__updateAppearance__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  id v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
    if (WeakRetained[63] == *(void *)(a1 + 32))
    {
      v7 = (void *)WeakRetained[61];
      if (v8) {
        [v7 setImage:v8 animated:a4 ^ 1u];
      }
      else {
        objc_msgSend(v7, "setImage:");
      }
    }
  }
}

- (void)_updateFonts
{
  v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D0]];
  id v4 = objc_msgSend(v3, "_mapkit_fontWithSymbolicTraits:", 0x8000);
  uint64_t v5 = objc_msgSend(v4, "_mapkit_fontWithWeight:", *MEMORY[0x1E4FB09E0]);
  [(MULabelViewProtocol *)self->_titleLabel setFont:v5];

  viewModel = self->_viewModel;
  uint64_t v7 = *MEMORY[0x1E4FB2950];
  id v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  v9 = [(MUPlaceTileViewModel *)viewModel subtitleAttributedStringForFont:v8];
  [(MULabelViewProtocol *)self->_secondaryLabel setAttributedText:v9];

  double v10 = self->_viewModel;
  id v12 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v7];
  v11 = [(MUPlaceTileViewModel *)v10 footerAttributedStringForFont:v12];
  [(MULabelViewProtocol *)self->_tertiaryLabel setAttributedText:v11];
}

- (UIImageView)tileImageView
{
  return self->_tileImageView;
}

- (MUPlaceTileViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_tileImageView, 0);
  objc_storeStrong((id *)&self->_stopImageView, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end