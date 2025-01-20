@interface MUPlaceTilesView
- (BOOL)shouldCalculateTileSizeAccordingToBounds;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (MUPlaceTilesView)initWithConfiguration:(id)a3;
- (MUPlaceTilesViewDelegate)delegate;
- (MUPunchoutViewModel)accessoryViewModel;
- (MUScrollAnalyticActionObserving)analyticsDelegate;
- (NSArray)viewModels;
- (double)_calculatedTileWidthFromBounds;
- (double)heightForTileSize:(CGSize)a3;
- (id)accessoryView;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5;
- (id)imageViewForIndex:(unint64_t)a3;
- (void)_contentSizeDidChange;
- (void)_setupStackView;
- (void)_updateContent;
- (void)_updateTileMetrics;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)displayPlaceTiles;
- (void)enumerateImageViewsWithBlock:(id)a3;
- (void)layoutSubviews;
- (void)scrollToViewAtIndex:(unint64_t)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setAccessoryViewModel:(id)a3;
- (void)setAnalyticsDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setViewModels:(id)a3;
- (void)updateViewsWithAlpha:(double)a3;
@end

@implementation MUPlaceTilesView

- (MUPlaceTilesView)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUPlaceTilesView;
  v6 = -[MUPlaceTilesView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    v6->_tileSize = (CGSize)*MEMORY[0x1E4F1DB30];
    objc_storeStrong((id *)&v6->_configuration, a3);
    [(MUPlaceTilesView *)v7 _setupStackView];
  }

  return v7;
}

- (void)_setupStackView
{
  v44[5] = *MEMORY[0x1E4F143B8];
  [(MUPlaceTilesView *)self setClipsToBounds:0];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  [v3 setScrollDirection:1];
  [v3 setMinimumInteritemSpacing:8.0];
  [v3 setMinimumLineSpacing:8.0];
  objc_storeStrong((id *)&self->_flowLayout, v3);
  id v4 = objc_alloc(MEMORY[0x1E4FB1568]);
  v42 = v3;
  id v5 = (UICollectionView *)objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  contentCollectionView = self->_contentCollectionView;
  self->_contentCollectionView = v5;

  -[UICollectionView setContentInset:](self->_contentCollectionView, "setContentInset:", 0.0, 16.0, 0.0, 16.0);
  v7 = [MEMORY[0x1E4FB1618] clearColor];
  [(UICollectionView *)self->_contentCollectionView setBackgroundColor:v7];

  [(UICollectionView *)self->_contentCollectionView setShowsHorizontalScrollIndicator:0];
  [(UICollectionView *)self->_contentCollectionView setDelegate:self];
  [(UICollectionView *)self->_contentCollectionView setClipsToBounds:0];
  v8 = self->_contentCollectionView;
  uint64_t v9 = objc_opt_class();
  v10 = +[MUPlaceTileCollectionViewCell reuseIdentifier];
  [(UICollectionView *)v8 registerClass:v9 forCellWithReuseIdentifier:v10];

  v11 = self->_contentCollectionView;
  uint64_t v12 = objc_opt_class();
  v13 = +[MUPunchoutCollectionViewCell reuseIdentifier];
  [(UICollectionView *)v11 registerClass:v12 forCellWithReuseIdentifier:v13];

  id v14 = objc_alloc(MEMORY[0x1E4FB1598]);
  v15 = self->_contentCollectionView;
  v16 = MUCollectionViewDiffableDataSourceCellProviderForwardingBlock(self);
  v17 = (UICollectionViewDiffableDataSource *)[v14 initWithCollectionView:v15 cellProvider:v16];
  diffableDataSource = self->_diffableDataSource;
  self->_diffableDataSource = v17;

  if (MapKitIdiomIsMacCatalyst()) {
    v19 = [[MUPagingScrollContainerView alloc] initWithHorizontalScrollView:self->_contentCollectionView];
  }
  else {
    v19 = self->_contentCollectionView;
  }
  v20 = v19;
  [(MUPagingScrollContainerView *)v19 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MUPlaceTilesView *)self addSubview:v20];
  v21 = [(MUPagingScrollContainerView *)v20 heightAnchor];
  v22 = [v21 constraintEqualToConstant:0.0];
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v22;

  v36 = (void *)MEMORY[0x1E4F28DC8];
  v41 = [(MUPagingScrollContainerView *)v20 leadingAnchor];
  v40 = [(MUPlaceTilesView *)self leadingAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v44[0] = v39;
  v38 = [(MUPagingScrollContainerView *)v20 trailingAnchor];
  v37 = [(MUPlaceTilesView *)self trailingAnchor];
  v24 = [v38 constraintEqualToAnchor:v37];
  v44[1] = v24;
  v25 = [(MUPagingScrollContainerView *)v20 topAnchor];
  v26 = [(MUPlaceTilesView *)self topAnchor];
  v27 = [v25 constraintEqualToAnchor:v26];
  v44[2] = v27;
  v28 = [(MUPagingScrollContainerView *)v20 bottomAnchor];
  v29 = [(MUPlaceTilesView *)self bottomAnchor];
  v30 = [v28 constraintEqualToAnchor:v29];
  v31 = self->_heightConstraint;
  v44[3] = v30;
  v44[4] = v31;
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:5];
  [v36 activateConstraints:v32];

  v33 = self;
  v43 = v33;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
  id v35 = (id)[(MUPlaceTilesView *)self registerForTraitChanges:v34 withAction:sel__contentSizeDidChange];
}

- (void)displayPlaceTiles
{
  if ([(NSArray *)self->_viewModels count])
  {
    [(MUPlaceTilesView *)self _updateTileMetrics];
    [(MUPlaceTilesView *)self _updateContent];
  }
}

- (void)_updateTileMetrics
{
  id v7 = +[MUPlaceTileMeasurements defaultMeasurements];
  if ([(MUPlaceTilesView *)self shouldCalculateTileSizeAccordingToBounds])
  {
    [(MUPlaceTilesView *)self _calculatedTileWidthFromBounds];
    objc_msgSend(v7, "setTileWidth:");
  }
  id v3 = (void *)[(NSArray *)self->_viewModels copy];
  id v4 = [(MUPlaceTilesViewConfiguration *)self->_configuration cellConfiguration];
  +[MUPlaceTileCollectionViewCell preferredSizeForViewModels:v3 cellConfiguration:v4 usingMeasurements:v7];
  self->_tileSize.width = v5;
  self->_tileSize.height = v6;

  -[MUPlaceTilesView heightForTileSize:](self, "heightForTileSize:", self->_tileSize.width, self->_tileSize.height);
  -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:");
}

- (void)_updateContent
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = MUGetMUPlaceTilesViewLog();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1931EA000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlaceTilesViewUpdateContent", "", v8, 2u);
  }

  id v4 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  v10[0] = @"kPlaceTilesSection";
  CGFloat v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v4 appendSectionsWithIdentifiers:v5];

  [v4 appendItemsWithIdentifiers:self->_viewModels intoSectionWithIdentifier:@"kPlaceTilesSection"];
  if (self->_accessoryViewModel)
  {
    accessoryViewModel = self->_accessoryViewModel;
    CGFloat v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&accessoryViewModel count:1];
    [v4 appendItemsWithIdentifiers:v6 intoSectionWithIdentifier:@"kPlaceTilesSection"];
  }
  [(UICollectionViewDiffableDataSource *)self->_diffableDataSource applySnapshot:v4 animatingDifferences:0];
  id v7 = MUGetMUPlaceTilesViewLog();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1931EA000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlaceTilesViewUpdateContent", "", v8, 2u);
  }
}

- (id)imageViewForIndex:(unint64_t)a3
{
  contentCollectionView = self->_contentCollectionView;
  id v4 = [MEMORY[0x1E4F28D58] indexPathForRow:a3 inSection:0];
  CGFloat v5 = [(UICollectionView *)contentCollectionView cellForItemAtIndexPath:v4];

  objc_opt_class();
  CGFloat v6 = 0;
  if (objc_opt_isKindOfClass())
  {
    CGFloat v6 = [v5 tileImageView];
  }

  return v6;
}

- (void)updateViewsWithAlpha:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(UICollectionView *)self->_contentCollectionView visibleCells];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setAlpha:a3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)enumerateImageViewsWithBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(UICollectionView *)self->_contentCollectionView visibleCells];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v11 = [v10 tileImageView];
          v4[2](v4, v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)scrollToViewAtIndex:(unint64_t)a3
{
  contentCollectionView = self->_contentCollectionView;
  id v4 = [MEMORY[0x1E4F28D58] indexPathForRow:a3 inSection:0];
  [(UICollectionView *)contentCollectionView scrollToItemAtIndexPath:v4 atScrollPosition:16 animated:0];
}

- (id)accessoryView
{
  if (self->_accessoryViewModel)
  {
    id v3 = -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](self->_diffableDataSource, "indexPathForItemIdentifier:");
    if (v3)
    {
      id v4 = [(UICollectionView *)self->_contentCollectionView cellForItemAtIndexPath:v3];
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v11 = +[MUPunchoutCollectionViewCell reuseIdentifier];
    long long v12 = [v8 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v9];

    [v12 setViewModel:v10];
  }
  else if ([v10 conformsToProtocol:&unk_1EE44C648])
  {
    id v13 = v10;
    long long v14 = +[MUPlaceTileCollectionViewCell reuseIdentifier];
    long long v12 = [v8 dequeueReusableCellWithReuseIdentifier:v14 forIndexPath:v9];

    long long v15 = [(MUPlaceTilesViewConfiguration *)self->_configuration cellConfiguration];
    [v12 setCellConfiguration:v15];

    [v12 setClipsToBounds:0];
    v16 = [v12 contentView];
    [v16 setClipsToBounds:0];

    uint64_t v17 = objc_alloc_init(MUPlatterView);
    [v12 setBackgroundView:v17];

    v18 = [v12 contentView];
    objc_msgSend(v18, "_mapsui_setCardCorner");

    [v12 setViewModel:v13];
  }
  else
  {
    long long v12 = 0;
  }

  return v12;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = [(UICollectionViewDiffableDataSource *)self->_diffableDataSource itemIdentifierForIndexPath:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(MUPlaceTilesView *)self delegate];
    [v5 placeTileCollectionView:self didTapOnAccessoryViewModel:v6];
  }
  else
  {
    if (![v6 conformsToProtocol:&unk_1EE44C648]) {
      goto LABEL_6;
    }
    uint64_t v5 = [(MUPlaceTilesView *)self delegate];
    [v5 placeTileCollectionView:self didTapOnViewModel:v6];
  }

LABEL_6:
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  p_beginAnalyticsScrollingPoint = &self->_beginAnalyticsScrollingPoint;
  [a3 contentOffset];
  p_beginAnalyticsScrollingPoint->x = v4;
  p_beginAnalyticsScrollingPoint->y = v5;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  CGFloat v5 = self->_beginAnalyticsScrollingPoint.x - a5->x;
  id v6 = [(MUPlaceTilesView *)self analyticsDelegate];
  id v7 = v6;
  if (v5 <= 0.0) {
    [v6 performInstrumentationForScrollRight];
  }
  else {
    [v6 performInstrumentationForScrollLeft];
  }
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)MUPlaceTilesView;
  [(MUPlaceTilesView *)&v7 layoutSubviews];
  [(MUPlaceTilesView *)self bounds];
  if (!CGRectEqualToRect(v8, self->_cachedBounds))
  {
    [(MUPlaceTilesView *)self bounds];
    self->_cachedBounds.origin.x = v3;
    self->_cachedBounds.origin.y = v4;
    self->_cachedBounds.size.width = v5;
    self->_cachedBounds.size.height = v6;
    if ([(MUPlaceTilesView *)self shouldCalculateTileSizeAccordingToBounds])
    {
      [(MUPlaceTilesView *)self _updateTileMetrics];
      [(UICollectionViewFlowLayout *)self->_flowLayout invalidateLayout];
    }
  }
}

- (void)_contentSizeDidChange
{
  [(MUPlaceTilesView *)self _updateTileMetrics];
  diffableDataSource = self->_diffableDataSource;
  id v4 = [(UICollectionViewDiffableDataSource *)diffableDataSource snapshot];
  [(UICollectionViewDiffableDataSource *)diffableDataSource applySnapshotUsingReloadData:v4];
}

- (BOOL)shouldCalculateTileSizeAccordingToBounds
{
  if (MUIdiomInTraitEnvironment(self) == 5) {
    return 0;
  }
  [(MUPlaceTilesView *)self bounds];
  if (CGRectGetWidth(v9) > 430.0) {
    return 0;
  }
  [(MUPlaceTilesView *)self _calculatedTileWidthFromBounds];
  double v5 = v4;
  CGFloat v6 = +[MUPlaceTileMeasurements defaultMeasurements];
  [v6 tileWidth];
  double v8 = v7;

  return v5 >= v8;
}

- (double)_calculatedTileWidthFromBounds
{
  [(MUPlaceTilesView *)self bounds];
  return (CGRectGetWidth(v3) + -16.0 + -16.0 + -8.0) * 0.5;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  CGFloat v6 = -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", a5, a4);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    +[MUPunchoutView preferredWidth];
    CGFloat width = v7;
    -[MUPlaceTilesView heightForTileSize:](self, "heightForTileSize:", self->_tileSize.width, self->_tileSize.height);
    CGFloat height = v9;
  }
  else
  {
    CGFloat width = self->_tileSize.width;
    CGFloat height = self->_tileSize.height;
  }

  double v11 = width;
  double v12 = height;
  result.CGFloat height = v12;
  result.CGFloat width = v11;
  return result;
}

- (double)heightForTileSize:(CGSize)a3
{
  double height = a3.height;
  if (![(MUPlaceTilesViewConfiguration *)self->_configuration numberOfRows]) {
    return 0.0;
  }
  unint64_t v5 = 0;
  double v6 = 0.0;
  do
  {
    double v7 = height + v6;
    unint64_t v8 = [(MUPlaceTilesViewConfiguration *)self->_configuration numberOfRows] - 1;
    double v9 = -0.0;
    if (v5 < v8) {
      double v9 = 8.0;
    }
    double v6 = v7 + v9;
    ++v5;
  }
  while (v5 < [(MUPlaceTilesViewConfiguration *)self->_configuration numberOfRows]);
  return v6;
}

- (MUPunchoutViewModel)accessoryViewModel
{
  return self->_accessoryViewModel;
}

- (void)setAccessoryViewModel:(id)a3
{
}

- (NSArray)viewModels
{
  return self->_viewModels;
}

- (void)setViewModels:(id)a3
{
}

- (MUScrollAnalyticActionObserving)analyticsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDelegate);
  return (MUScrollAnalyticActionObserving *)WeakRetained;
}

- (void)setAnalyticsDelegate:(id)a3
{
}

- (MUPlaceTilesViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MUPlaceTilesViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_viewModels, 0);
  objc_storeStrong((id *)&self->_accessoryViewModel, 0);
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_contentCollectionView, 0);
}

@end