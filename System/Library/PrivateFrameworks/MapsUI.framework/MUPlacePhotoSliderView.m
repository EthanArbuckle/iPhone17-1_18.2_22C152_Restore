@interface MUPlacePhotoSliderView
- (CGSize)_sizeForAttribution;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (MUPlacePhotoSliderDelegate)delegate;
- (MUPlacePhotoSliderView)initWithDataSource:(id)a3 photoTileSize:(CGSize)a4;
- (MUScrollAnalyticActionObserving)analyticsDelegate;
- (id)attributionViewForAttribution:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5;
- (id)imageViewForIndex:(unint64_t)a3;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)displayPhotos;
- (void)displayPhotos:(BOOL)a3;
- (void)enumerateImageViewsWithBlock:(id)a3;
- (void)layoutSubviews;
- (void)scrollToViewAtIndex:(unint64_t)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setAnalyticsDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateViewsWithAlpha:(double)a3;
@end

@implementation MUPlacePhotoSliderView

- (MUPlacePhotoSliderView)initWithDataSource:(id)a3 photoTileSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MUPlacePhotoSliderView;
  v8 = -[MUPlacePhotoSliderView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSource, v7);
    v9->_photoTileSize.CGFloat width = width;
    v9->_photoTileSize.CGFloat height = height;
    [(MUPlacePhotoSliderView *)v9 _setupSubviews];
    [(MUPlacePhotoSliderView *)v9 _setupConstraints];
    [(MUPlacePhotoSliderView *)v9 setAccessibilityIdentifier:@"PhotoSliderView"];
  }

  return v9;
}

- (void)_setupSubviews
{
  v22 = objc_alloc_init(_MUPhotoSliderViewFlowLayout);
  [(UICollectionViewFlowLayout *)v22 setScrollDirection:1];
  [(UICollectionViewFlowLayout *)v22 setMinimumInteritemSpacing:8.0];
  [(UICollectionViewFlowLayout *)v22 setMinimumLineSpacing:8.0];
  id v3 = objc_alloc(MEMORY[0x1E4FB1568]);
  v4 = (UICollectionView *)objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v22, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  p_contentCollectionView = (id *)&self->_contentCollectionView;
  contentCollectionView = self->_contentCollectionView;
  self->_contentCollectionView = v4;

  [(UICollectionView *)self->_contentCollectionView setTranslatesAutoresizingMaskIntoConstraints:0];
  -[UICollectionView setContentInset:](self->_contentCollectionView, "setContentInset:", 0.0, 16.0, 0.0, 16.0);
  id v7 = [MEMORY[0x1E4FB1618] clearColor];
  [(UICollectionView *)self->_contentCollectionView setBackgroundColor:v7];

  [(UICollectionView *)self->_contentCollectionView setShowsHorizontalScrollIndicator:0];
  [(UICollectionView *)self->_contentCollectionView setDelegate:self];
  v8 = self->_contentCollectionView;
  uint64_t v9 = objc_opt_class();
  v10 = +[MUPhotoTileCollectionViewCell reuseIdentifier];
  [(UICollectionView *)v8 registerClass:v9 forCellWithReuseIdentifier:v10];

  objc_super v11 = self->_contentCollectionView;
  uint64_t v12 = objc_opt_class();
  v13 = +[MUPunchoutCollectionViewCell reuseIdentifier];
  [(UICollectionView *)v11 registerClass:v12 forCellWithReuseIdentifier:v13];

  [(UICollectionView *)self->_contentCollectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kHeaderViewCellIdentifier"];
  id v14 = objc_alloc(MEMORY[0x1E4FB1598]);
  v15 = self->_contentCollectionView;
  v16 = MUCollectionViewDiffableDataSourceCellProviderForwardingBlock(self);
  v17 = (UICollectionViewDiffableDataSource *)[v14 initWithCollectionView:v15 cellProvider:v16];
  diffableDataSource = self->_diffableDataSource;
  self->_diffableDataSource = v17;

  if (MapKitIdiomIsMacCatalyst())
  {
    v19 = [[MUPagingScrollContainerView alloc] initWithHorizontalScrollView:*p_contentCollectionView];
    p_contentCollectionView = (id *)&self->_pagingScrollView;
    pagingScrollView = self->_pagingScrollView;
    self->_pagingScrollView = v19;

    [(MUPagingScrollContainerView *)self->_pagingScrollView setAutomaticallyFlipsForRTL:1];
  }
  id v21 = *p_contentCollectionView;
  [(MUPlacePhotoSliderView *)self addSubview:v21];
}

- (void)_setupConstraints
{
  v11[2] = *MEMORY[0x1E4F143B8];
  int IsMacCatalyst = MapKitIdiomIsMacCatalyst();
  uint64_t v4 = 2;
  if (IsMacCatalyst) {
    uint64_t v4 = 4;
  }
  id v5 = *(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MUPlacePhotoSliderView__dataSource[v4]);
  v6 = [[MUEdgeLayout alloc] initWithItem:v5 container:self];
  id v7 = [MUSizeLayout alloc];
  +[MUSizeLayout useIntrinsicContentSize];
  v8 = -[MUSizeLayout initWithItem:size:](v7, "initWithItem:size:", v5);
  uint64_t v9 = (void *)MEMORY[0x1E4F28DC8];
  v11[0] = v6;
  v11[1] = v8;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  objc_msgSend(v9, "_mapsui_activateLayouts:", v10);
}

- (id)imageViewForIndex:(unint64_t)a3
{
  contentCollectionView = self->_contentCollectionView;
  uint64_t v4 = [MEMORY[0x1E4F28D58] indexPathForRow:self->_hasHeaderView + a3 inSection:0];
  id v5 = [(UICollectionView *)contentCollectionView cellForItemAtIndexPath:v4];

  objc_opt_class();
  v6 = 0;
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 contentImageView];
  }

  return v6;
}

- (void)displayPhotos
{
}

- (void)displayPhotos:(BOOL)a3
{
  BOOL v3 = a3;
  v22[1] = *MEMORY[0x1E4F143B8];
  id v5 = MUGetMUPhotoSliderViewLog();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)v20 = 0;
    _os_signpost_emit_with_name_impl(&dword_1931EA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPhotoSliderViewDisplayPhotos", "", v20, 2u);
  }

  id v6 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  v22[0] = @"kPhotosSection";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  [v6 appendSectionsWithIdentifiers:v7];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v9 = [WeakRetained photoSliderViewHeaderViewForPhotoSlider:self];

  if (v9)
  {
    self->_hasHeaderView = 1;
    [v9 setAccessibilityIdentifier:@"PhotoSliderHeaderView"];
    id v21 = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    [v6 appendItemsWithIdentifiers:v10 intoSectionWithIdentifier:@"kPhotosSection"];
  }
  else
  {
    self->_hasHeaderView = 0;
  }
  id v11 = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v12 = [v11 photoSliderViewRequestsViewModels:self];

  v13 = (NSArray *)[v12 copy];
  photoModels = self->_photoModels;
  self->_photoModels = v13;

  if ([v12 count])
  {
    v15 = (void *)[v12 copy];
    [v6 appendItemsWithIdentifiers:v15 intoSectionWithIdentifier:@"kPhotosSection"];
  }
  if ([v12 count])
  {
    id v16 = objc_loadWeakRetained((id *)&self->_dataSource);
    v17 = [v16 attributionViewModelsForPhotoSliderView:self];

    if ([v17 count])
    {
      v18 = (void *)[v17 copy];
      [v6 appendItemsWithIdentifiers:v18 intoSectionWithIdentifier:@"kPhotosSection"];
    }
  }
  [(UICollectionViewDiffableDataSource *)self->_diffableDataSource applySnapshot:v6 animatingDifferences:v3];
  v19 = MUGetMUPhotoSliderViewLog();
  if (os_signpost_enabled(v19))
  {
    *(_WORD *)v20 = 0;
    _os_signpost_emit_with_name_impl(&dword_1931EA000, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPhotoSliderViewDisplayPhotos", "", v20, 2u);
  }
}

- (void)updateViewsWithAlpha:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [(UICollectionView *)self->_contentCollectionView visibleCells];
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

- (id)attributionViewForAttribution:(id)a3
{
  uint64_t v4 = [(UICollectionViewDiffableDataSource *)self->_diffableDataSource indexPathForItemIdentifier:a3];
  if (v4)
  {
    uint64_t v5 = [(UICollectionView *)self->_contentCollectionView cellForItemAtIndexPath:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)scrollToViewAtIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_photoModels count] > a3)
  {
    contentCollectionView = self->_contentCollectionView;
    id v6 = [MEMORY[0x1E4F28D58] indexPathForRow:a3 inSection:0];
    [(UICollectionView *)contentCollectionView scrollToItemAtIndexPath:v6 atScrollPosition:16 animated:0];
  }
}

- (void)enumerateImageViewsWithBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void *))a3;
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
          long long v11 = [v10 contentImageView];
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

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v11 = [v8 dequeueReusableCellWithReuseIdentifier:@"kHeaderViewCellIdentifier" forIndexPath:v9];
    id v12 = v10;
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_msgSend(v12, "_mapsui_setCardCorner");
    long long v13 = [v11 contentView];
    [v13 addSubview:v12];

    long long v14 = [MUEdgeLayout alloc];
    id WeakRetained = [v11 contentView];
    id v16 = [(MUEdgeLayout *)v14 initWithItem:v12 container:WeakRetained];

    [(MUConstraintLayout *)v16 activate];
LABEL_7:

    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v17 = +[MUPunchoutCollectionViewCell reuseIdentifier];
    long long v11 = [v8 dequeueReusableCellWithReuseIdentifier:v17 forIndexPath:v9];

    [v11 setViewModel:v10];
    goto LABEL_8;
  }
  if ([v10 conformsToProtocol:&unk_1EE4413A8])
  {
    id v18 = v10;
    v19 = +[MUPhotoTileCollectionViewCell reuseIdentifier];
    long long v11 = [v8 dequeueReusableCellWithReuseIdentifier:v19 forIndexPath:v9];

    objc_msgSend(v11, "setTargetFrameSize:", self->_photoTileSize.width, self->_photoTileSize.height);
    [v11 setViewModel:v18];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v20 = [WeakRetained photoSliderView:self photoOverlayForModel:v18];

    [v11 setPhotoOverlay:v20];
    goto LABEL_7;
  }
  long long v11 = 0;
LABEL_8:

  return v11;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = [(UICollectionViewDiffableDataSource *)self->_diffableDataSource itemIdentifierForIndexPath:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(MUPlacePhotoSliderView *)self delegate];
    [v5 photoSliderView:self didTapAttribution:v6];
  }
  else if ([v6 conformsToProtocol:&unk_1EE4413A8])
  {
    uint64_t v5 = [(MUPlacePhotoSliderView *)self delegate];
    [v5 photoSliderView:self didTapViewModel:v6];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_8;
    }
    uint64_t v5 = [(MUPlacePhotoSliderView *)self delegate];
    [v5 photoSliderViewDidTapHeaderView:self];
  }

LABEL_8:
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [(UICollectionViewDiffableDataSource *)self->_diffableDataSource itemIdentifierForIndexPath:v6];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (id v8 = objc_loadWeakRetained((id *)&self->_dataSource),
        char v9 = objc_opt_respondsToSelector(),
        v8,
        (v9 & 1) != 0))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    int v11 = [WeakRetained photoSliderView:self shouldShowFullWidthForModel:v7];
  }
  else
  {
    int v11 = 0;
  }
  if (self->_hasHeaderView)
  {
    if ([(NSArray *)self->_photoModels count]) {
      char v12 = v11;
    }
    else {
      char v12 = 1;
    }
    if (v12) {
      goto LABEL_10;
    }
  }
  else if (v11)
  {
LABEL_10:
    [(UICollectionView *)self->_contentCollectionView frame];
    double v14 = v13;
    CGFloat height = v15;
    [(UICollectionView *)self->_contentCollectionView contentInset];
    double v18 = v17;
    [(UICollectionView *)self->_contentCollectionView contentInset];
    double width = v14 - (v18 + v19);
    goto LABEL_15;
  }
  id v21 = [(UICollectionViewDiffableDataSource *)self->_diffableDataSource itemIdentifierForIndexPath:v6];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [(MUPlacePhotoSliderView *)self _sizeForAttribution];
    double width = v23;
    CGFloat height = v24;
  }
  else
  {
    double width = self->_photoTileSize.width;
    CGFloat height = self->_photoTileSize.height;
  }
LABEL_15:

  double v25 = width;
  double v26 = height;
  result.CGFloat height = v26;
  result.double width = v25;
  return result;
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
  id v6 = [(MUPlacePhotoSliderView *)self analyticsDelegate];
  id v7 = v6;
  if (v5 <= 0.0) {
    [v6 performInstrumentationForScrollRight];
  }
  else {
    [v6 performInstrumentationForScrollLeft];
  }
}

- (CGSize)_sizeForAttribution
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v4 = [WeakRetained numberOfAttributionsForPhotoSliderView:self];

  +[MUPunchoutView preferredWidth];
  double height = self->_photoTileSize.height;
  if (v4 != 1) {
    double height = (height + -8.0) * 0.5;
  }
  result.double height = height;
  result.double width = v5;
  return result;
}

- (void)layoutSubviews
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB15C8]);
  [v3 setInvalidateFlowLayoutDelegateMetrics:1];
  uint64_t v4 = [(UICollectionView *)self->_contentCollectionView collectionViewLayout];
  [v4 invalidateLayoutWithContext:v3];

  v5.receiver = self;
  v5.super_class = (Class)MUPlacePhotoSliderView;
  [(MUPlacePhotoSliderView *)&v5 layoutSubviews];
}

- (MUScrollAnalyticActionObserving)analyticsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDelegate);
  return (MUScrollAnalyticActionObserving *)WeakRetained;
}

- (void)setAnalyticsDelegate:(id)a3
{
}

- (MUPlacePhotoSliderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MUPlacePhotoSliderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_photoModels, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_pagingScrollView, 0);
  objc_storeStrong((id *)&self->_contentCollectionView, 0);
}

@end