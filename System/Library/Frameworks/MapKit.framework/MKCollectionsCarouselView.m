@interface MKCollectionsCarouselView
+ (double)horizontalLayoutHeightInContext:(int64_t)a3 includeExploreGuidesHeight:(BOOL)a4 isSingleCollection:(BOOL)a5;
+ (double)verticalLayoutHeightWithNumberOfItems:(unint64_t)a3 maxWidth:(double)a4 usingTraitEnvironment:(id)a5 inContext:(int64_t)a6;
- (BOOL)isDisplayingCollections;
- (BOOL)isShowingExploreGuides;
- (CGPoint)contentOffset;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CGSize)contentSize;
- (GEOExploreGuides)exploreGuides;
- (MKCollectionCarouselAnalyticsDelegate)analyticsDelegate;
- (MKCollectionCarouselRoutingDelegate)routingDelegate;
- (MKCollectionsSizeProvider)sizeController;
- (MKPlaceCollectionsLogicController)logicController;
- (UICollectionView)collectionView;
- (UICollectionViewFlowLayout)flowLayout;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (UIScrollViewDelegate)scrollViewDelegate;
- (UIStackView)contentView;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (id)initCollectionsCarouselViewWithContext:(int64_t)a3 withPlaceCollections:(id)a4 usingSyncCoordinator:(id)a5 withRoutingDelegate:(id)a6 withScrollViewDelegate:(id)a7 withAnalyticsDelegate:(id)a8 exploreGuides:(id)a9;
- (int64_t)carouselContext;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)configureCarouselCollectionView;
- (void)configureCarouselMetadata:(int64_t)a3;
- (void)dismissedCollections;
- (void)displayCollectionsUsingBatchIds:(id)a3 usingGuideFetcher:(id)a4;
- (void)fetchCollections;
- (void)refreshCollections;
- (void)resetCollectionsLayout;
- (void)resetScrollOffset;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setAnalyticsDelegate:(id)a3;
- (void)setCarouselContext:(int64_t)a3;
- (void)setCollectionView:(id)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setContentView:(id)a3;
- (void)setExploreGuides:(id)a3;
- (void)setFlowLayout:(id)a3;
- (void)setLogicController:(id)a3;
- (void)setRoutingDelegate:(id)a3;
- (void)setScrollViewDelegate:(id)a3;
- (void)setSizeController:(id)a3;
- (void)updateCollections:(id)a3;
@end

@implementation MKCollectionsCarouselView

- (BOOL)isShowingExploreGuides
{
  v2 = [(MKCollectionsCarouselView *)self exploreGuides];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)configureCarouselCollectionView
{
  v74[4] = *MEMORY[0x1E4F143B8];
  if (self->_collectionsConfiguration.displayStyle == 1)
  {
    BOOL v3 = [(MKCollectionsCarouselView *)self collectionView];
    [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

    v4 = [(MKCollectionsCarouselView *)self collectionView];
    [v4 setDelegate:self];

    v5 = [(MKCollectionsCarouselView *)self collectionView];
    v6 = [MEMORY[0x1E4F428B8] clearColor];
    [v5 setBackgroundColor:v6];

    v7 = [(MKCollectionsCarouselView *)self collectionView];
    [(MKCollectionsCarouselView *)self addSubview:v7];

    v52 = (void *)MEMORY[0x1E4F28DC8];
    v66 = [(MKCollectionsCarouselView *)self collectionView];
    v64 = [v66 leadingAnchor];
    v62 = [(MKCollectionsCarouselView *)self leadingAnchor];
    v60 = [v64 constraintEqualToAnchor:v62];
    v74[0] = v60;
    v58 = [(MKCollectionsCarouselView *)self collectionView];
    v56 = [v58 trailingAnchor];
    v54 = [(MKCollectionsCarouselView *)self trailingAnchor];
    v8 = [v56 constraintEqualToAnchor:v54];
    v74[1] = v8;
    v9 = [(MKCollectionsCarouselView *)self collectionView];
    v10 = [v9 topAnchor];
    v11 = [(MKCollectionsCarouselView *)self topAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v74[2] = v12;
    v13 = [(MKCollectionsCarouselView *)self collectionView];
    v14 = [v13 bottomAnchor];
    v15 = [(MKCollectionsCarouselView *)self bottomAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v74[3] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:4];
    [v52 activateConstraints:v17];
  }
  else
  {
    id v18 = objc_alloc(MEMORY[0x1E4F42E20]);
    v19 = objc_msgSend(v18, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(MKCollectionsCarouselView *)self setContentView:v19];

    v20 = [(MKCollectionsCarouselView *)self contentView];
    [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

    v21 = [(MKCollectionsCarouselView *)self contentView];
    [v21 setAxis:1];

    v22 = [(MKCollectionsCarouselView *)self contentView];
    [v22 setDistribution:0];

    v23 = [(MKCollectionsCarouselView *)self contentView];
    [v23 setAlignment:0];

    v24 = [(MKCollectionsCarouselView *)self contentView];
    [(MKCollectionsCarouselView *)self addSubview:v24];

    id v67 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v25 = [(MKCollectionsCarouselView *)self collectionView];
    [v25 setTranslatesAutoresizingMaskIntoConstraints:0];

    v26 = [(MKCollectionsCarouselView *)self collectionView];
    [v26 setDelegate:self];

    v27 = [(MKCollectionsCarouselView *)self collectionView];
    v28 = [MEMORY[0x1E4F428B8] clearColor];
    [v27 setBackgroundColor:v28];

    v29 = [(MKCollectionsCarouselView *)self contentView];
    v30 = [(MKCollectionsCarouselView *)self collectionView];
    [v29 addArrangedSubview:v30];

    v31 = [(MKCollectionsCarouselView *)self collectionView];
    v32 = [v31 heightAnchor];
    +[MKCollectionsCarouselView horizontalLayoutHeightInContext:[(MKCollectionsCarouselView *)self carouselContext] includeExploreGuidesHeight:0 isSingleCollection:0];
    v33 = objc_msgSend(v32, "constraintEqualToConstant:");
    v73 = v33;
    v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
    [v67 addObjectsFromArray:v34];

    if ([(MKCollectionsCarouselView *)self isShowingExploreGuides])
    {
      objc_initWeak(&location, self);
      v35 = [MKExploreGuidesView alloc];
      v36 = [(MKCollectionsCarouselView *)self exploreGuides];
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __60__MKCollectionsCarouselView_configureCarouselCollectionView__block_invoke;
      v68[3] = &unk_1E54B9848;
      objc_copyWeak(&v69, &location);
      v68[4] = self;
      v37 = [(MKExploreGuidesView *)v35 initWithExploreGuides:v36 tapHandler:v68];

      [(MKExploreGuidesView *)v37 setTranslatesAutoresizingMaskIntoConstraints:0];
      v38 = [(MKCollectionsCarouselView *)self contentView];
      [v38 addArrangedSubview:v37];

      v39 = [(MKExploreGuidesView *)v37 heightAnchor];
      +[MKExploreGuidesView defaultHeight];
      v40 = objc_msgSend(v39, "constraintEqualToConstant:");
      v72 = v40;
      v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
      [v67 addObjectsFromArray:v41];

      objc_destroyWeak(&v69);
      objc_destroyWeak(&location);
    }
    v65 = [(MKCollectionsCarouselView *)self contentView];
    v63 = [v65 leadingAnchor];
    v61 = [(MKCollectionsCarouselView *)self leadingAnchor];
    v59 = [v63 constraintEqualToAnchor:v61];
    v71[0] = v59;
    v57 = [(MKCollectionsCarouselView *)self contentView];
    v55 = [v57 trailingAnchor];
    v53 = [(MKCollectionsCarouselView *)self trailingAnchor];
    v42 = [v55 constraintEqualToAnchor:v53];
    v71[1] = v42;
    v43 = [(MKCollectionsCarouselView *)self contentView];
    v44 = [v43 topAnchor];
    v45 = [(MKCollectionsCarouselView *)self topAnchor];
    v46 = [v44 constraintEqualToAnchor:v45];
    v71[2] = v46;
    v47 = [(MKCollectionsCarouselView *)self contentView];
    v48 = [v47 bottomAnchor];
    v49 = [(MKCollectionsCarouselView *)self bottomAnchor];
    v50 = [v48 constraintEqualToAnchor:v49];
    v71[3] = v50;
    v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:4];
    [v67 addObjectsFromArray:v51];

    [MEMORY[0x1E4F28DC8] activateConstraints:v67];
  }
}

- (UIStackView)contentView
{
  return self->_contentView;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (GEOExploreGuides)exploreGuides
{
  return self->_exploreGuides;
}

- (void)setContentView:(id)a3
{
}

- (int64_t)carouselContext
{
  return self->_carouselContext;
}

+ (double)horizontalLayoutHeightInContext:(int64_t)a3 includeExploreGuidesHeight:(BOOL)a4 isSingleCollection:(BOOL)a5
{
  BOOL v5 = a4;
  v6 = -[MKPlaceCollectionsSizeController initWithCollectionsConfiguration:isSingleCollection:usingTraitCollections:inContext:]([MKPlaceCollectionsSizeController alloc], "initWithCollectionsConfiguration:isSingleCollection:usingTraitCollections:inContext:", 0, 1, a5, 0, a3);
  [(MKPlaceCollectionsSizeController *)v6 sizeForCollectionWithMaxCollectionsWidth:100.0];
  double v8 = v7;
  [(MKPlaceCollectionsSizeController *)v6 sectionInsets];
  double v10 = v9;
  [(MKPlaceCollectionsSizeController *)v6 sectionInsets];
  double v12 = v10 + v11;
  if (v5)
  {
    double v12 = v12 + 5.0;
    +[MKExploreGuidesView defaultHeight];
    double v8 = v8 + v13;
  }

  return v12 + v8;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  double v9 = [(MKCollectionsCarouselView *)self logicController];
  uint64_t v10 = [v8 section];

  uint64_t v11 = [v9 sectionKindAtIndex:v10];
  if (v11 == 1)
  {
    [v7 frame];
    double v13 = v12;
    *(double *)&uint64_t v14 = 100.0;
  }
  else
  {
    v15 = [(MKCollectionsCarouselView *)self sizeController];
    [v7 frame];
    [v15 sizeForCollectionWithMaxCollectionsWidth:v16];
    double v13 = v17;
    uint64_t v14 = v18;
  }
  double v19 = v13;
  double v20 = *(double *)&v14;
  result.height = v20;
  result.width = v19;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  BOOL v5 = [(MKCollectionsCarouselView *)self sizeController];
  [v5 minimumInterItemSpacing];
  double v7 = v6;

  return v7;
}

- (MKCollectionsSizeProvider)sizeController
{
  return self->_sizeController;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v7 = [(MKCollectionsCarouselView *)self logicController];
  uint64_t v8 = [v7 sectionKindAtIndex:a5];

  if (v8 == 1)
  {
    double v9 = *MEMORY[0x1E4F437F8];
    double v10 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  }
  else
  {
    double v13 = [(MKCollectionsCarouselView *)self sizeController];
    [v13 sectionInsets];
    double v9 = v14;
    double v10 = v15;
    double v11 = v16;
    double v12 = v17;
  }
  double v18 = v9;
  double v19 = v10;
  double v20 = v11;
  double v21 = v12;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v9 = a5;
  double v6 = [(MKCollectionsCarouselView *)self logicController];
  uint64_t v7 = objc_msgSend(v6, "sectionKindAtIndex:", objc_msgSend(v9, "section"));

  if (v7 != 1)
  {
    uint64_t v8 = [(MKCollectionsCarouselView *)self logicController];
    [v8 willDisplayCellAtIndexpath:v9];
  }
}

- (MKPlaceCollectionsLogicController)logicController
{
  return self->_logicController;
}

- (id)initCollectionsCarouselViewWithContext:(int64_t)a3 withPlaceCollections:(id)a4 usingSyncCoordinator:(id)a5 withRoutingDelegate:(id)a6 withScrollViewDelegate:(id)a7 withAnalyticsDelegate:(id)a8 exploreGuides:(id)a9
{
  id v41 = a4;
  id v42 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  v43.receiver = self;
  v43.super_class = (Class)MKCollectionsCarouselView;
  double v19 = *MEMORY[0x1E4F1DB28];
  double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v23 = -[MKCollectionsCarouselView initWithFrame:](&v43, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v20, v21, v22);
  v24 = v23;
  if (v23)
  {
    v23->_carouselContext = a3;
    objc_storeWeak((id *)&v23->_routingDelegate, v15);
    objc_storeWeak((id *)&v24->_scrollViewDelegate, v16);
    objc_storeWeak((id *)&v24->_analyticsDelegate, v17);
    uint64_t v25 = geo_dispatch_queue_create_with_qos();
    utilityQueue = v24->_utilityQueue;
    v24->_utilityQueue = (OS_dispatch_queue *)v25;

    v27 = (UICollectionViewFlowLayout *)objc_alloc_init(MEMORY[0x1E4F42890]);
    flowLayout = v24->_flowLayout;
    v24->_flowLayout = v27;

    v24->_hasDisplayedCollections = 0;
    objc_storeStrong((id *)&v24->_exploreGuides, a9);
    v29 = (UICollectionView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42858]), "initWithFrame:collectionViewLayout:", v24->_flowLayout, v19, v20, v21, v22);
    id v40 = v17;
    id v30 = v16;
    id v31 = v15;
    id v32 = v18;
    collectionView = v24->_collectionView;
    v24->_collectionView = v29;
    v34 = v29;

    v35 = [[MKPlaceCollectionsLogicController alloc] initWithCollectionView:v34 withPlaceCollections:v41 usingCollectionIds:0 usingCollectionFetcher:0 usingGuideConsumer:0 usingSyncCoordinator:v42 inContext:a3 usingBatchSize:0];
    logicController = v24->_logicController;
    v24->_logicController = v35;

    [(UICollectionView *)v24->_collectionView setShowsVerticalScrollIndicator:0];
    [(UICollectionView *)v24->_collectionView setShowsHorizontalScrollIndicator:0];
    [(MKCollectionsCarouselView *)v24 configureCarouselMetadata:a3];
    id v18 = v32;
    id v15 = v31;
    id v16 = v30;
    id v17 = v40;
    v37 = -[MKPlaceCollectionsSizeController initWithCollectionsConfiguration:isSingleCollection:usingTraitCollections:inContext:]([MKPlaceCollectionsSizeController alloc], "initWithCollectionsConfiguration:isSingleCollection:usingTraitCollections:inContext:", v24->_collectionsConfiguration.displayStyle, v24->_collectionsConfiguration.collectionsPerRow, [v41 count] == 1, v24, a3);
    sizeController = v24->_sizeController;
    v24->_sizeController = (MKCollectionsSizeProvider *)v37;

    [(MKCollectionsCarouselView *)v24 configureCarouselCollectionView];
  }

  return v24;
}

- (void)configureCarouselMetadata:(int64_t)a3
{
  if ((unint64_t)a3 <= 7)
  {
    if (((1 << a3) & 0xD2) != 0)
    {
      self->_collectionsConfiguration = ($6D52D4259129B2917F58F12EE7EDADA3)xmmword_18BD1B110;
      id v6 = [(MKCollectionsCarouselView *)self flowLayout];
      [v6 setScrollDirection:1];
    }
    else
    {
      if (a3) {
        return;
      }
      self->_collectionsConfiguration = ($6D52D4259129B2917F58F12EE7EDADA3)vdupq_n_s64(1uLL);
      v4 = [(MKCollectionsCarouselView *)self flowLayout];
      [v4 setScrollDirection:0];

      BOOL v5 = [(MKCollectionsCarouselView *)self collectionView];
      [v5 setAlwaysBounceVertical:1];

      id v6 = [(MKCollectionsCarouselView *)self collectionView];
      [v6 setBounces:1];
    }
  }
}

- (UICollectionViewFlowLayout)flowLayout
{
  return self->_flowLayout;
}

void __45__MKCollectionsCarouselView_fetchCollections__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) logicController];
  [v2 displayCollections];

  BOOL v3 = *(void **)(a1 + 32);
  v4 = [v3 collectionView];
  [v3 scrollViewDidScroll:v4];

  *(unsigned char *)(*(void *)(a1 + 32) + 424) = 1;
}

- (void)updateCollections:(id)a3
{
  id v4 = a3;
  id v5 = [(MKCollectionsCarouselView *)self logicController];
  [v5 updateCollections:v4 usingBatchedIdentifiers:0 usingCollectionFetcher:0 usingBatchSize:0];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v7 = a3;
  id v4 = [(MKCollectionsCarouselView *)self scrollViewDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(MKCollectionsCarouselView *)self scrollViewDelegate];
    [v6 scrollViewDidScroll:v7];
  }
}

- (UIScrollViewDelegate)scrollViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewDelegate);

  return (UIScrollViewDelegate *)WeakRetained;
}

- (void)resetScrollOffset
{
  if ([(UIView *)self _mapkit_isRTL])
  {
    BOOL v3 = [(MKCollectionsCarouselView *)self collectionView];
    [v3 contentSize];
    double v5 = v4;
    id v6 = [(MKCollectionsCarouselView *)self collectionView];
    [v6 bounds];
    double v8 = v5 - v7;
    id v9 = [(MKCollectionsCarouselView *)self collectionView];
    [v9 contentInset];
    double v11 = v8 - v10;

    id v14 = [(MKCollectionsCarouselView *)self collectionView];
    objc_msgSend(v14, "setContentOffset:animated:", 0, v11, 0.0);
  }
  else
  {
    double v12 = *MEMORY[0x1E4F1DAD8];
    double v13 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    id v14 = [(MKCollectionsCarouselView *)self collectionView];
    objc_msgSend(v14, "setContentOffset:", v12, v13);
  }
}

- (void)fetchCollections
{
  BOOL v3 = [(MKCollectionsCarouselView *)self logicController];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__MKCollectionsCarouselView_fetchCollections__block_invoke;
  v4[3] = &unk_1E54B8188;
  v4[4] = self;
  [v3 getCollections:v4];
}

- (void)dismissedCollections
{
  id v2 = [(MKCollectionsCarouselView *)self logicController];
  [v2 dismissedCollections];
}

- (void)displayCollectionsUsingBatchIds:(id)a3 usingGuideFetcher:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(MKCollectionsCarouselView *)self logicController];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__MKCollectionsCarouselView_displayCollectionsUsingBatchIds_usingGuideFetcher___block_invoke;
  v11[3] = &unk_1E54B8270;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 getCollections:v11];
}

void __79__MKCollectionsCarouselView_displayCollectionsUsingBatchIds_usingGuideFetcher___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) logicController];
  [v2 updateUsingBatchedIdentifiers:*(void *)(a1 + 40) usingCollectionFetcher:*(void *)(a1 + 48) usingBatchSize:10];

  BOOL v3 = [*(id *)(a1 + 32) logicController];
  [v3 displayCollections];

  double v4 = *(void **)(a1 + 32);
  double v5 = [v4 collectionView];
  [v4 scrollViewDidScroll:v5];

  *(unsigned char *)(*(void *)(a1 + 32) + 424) = 1;
}

- (BOOL)isDisplayingCollections
{
  return self->_hasDisplayedCollections;
}

- (void)refreshCollections
{
  id v2 = [(MKCollectionsCarouselView *)self logicController];
  [v2 refreshCollections];
}

- (void)resetCollectionsLayout
{
  BOOL v3 = [(MKCollectionsCarouselView *)self collectionView];
  double v4 = [v3 collectionViewLayout];
  [v4 invalidateLayout];

  id v7 = objc_alloc_init(MEMORY[0x1E4F42890]);
  double v5 = [(MKCollectionsCarouselView *)self flowLayout];
  objc_msgSend(v7, "setScrollDirection:", objc_msgSend(v5, "scrollDirection"));

  id v6 = [(MKCollectionsCarouselView *)self collectionView];
  [v6 setCollectionViewLayout:v7];

  [(MKCollectionsCarouselView *)self setFlowLayout:v7];
}

void __60__MKCollectionsCarouselView_configureCarouselCollectionView__block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v4 = [WeakRetained routingDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v7 = [v6 routingDelegate];
    [(id)v7 routeToGuidesHomeFromExploreGuides:v10];

    double v8 = [*(id *)(a1 + 32) analyticsDelegate];
    LOBYTE(v7) = objc_opt_respondsToSelector();

    if (v7)
    {
      id v9 = [*(id *)(a1 + 32) analyticsDelegate];
      [v9 exploreGuidesButtonTapped];
    }
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(MKCollectionsCarouselView *)self logicController];
  uint64_t v7 = objc_msgSend(v6, "sectionKindAtIndex:", objc_msgSend(v5, "section"));

  if (v7 != 1)
  {
    double v8 = [(MKCollectionsCarouselView *)self routingDelegate];
    id v9 = [(MKCollectionsCarouselView *)self logicController];
    id v10 = objc_msgSend(v9, "geoCollectionAtIndex:", objc_msgSend(v5, "item"));
    [v8 routeToCuratedCollection:v10];

    objc_initWeak(&location, self);
    utilityQueue = self->_utilityQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__MKCollectionsCarouselView_collectionView_didSelectItemAtIndexPath___block_invoke;
    block[3] = &unk_1E54B8C68;
    objc_copyWeak(&v14, &location);
    id v13 = v5;
    dispatch_async(utilityQueue, block);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __69__MKCollectionsCarouselView_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v4 = [WeakRetained analyticsDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v14 = objc_loadWeakRetained(v2);
    id v6 = [v14 analyticsDelegate];
    id v7 = objc_loadWeakRetained(v2);
    double v8 = [v7 logicController];
    id v9 = objc_msgSend(v8, "geoCollectionAtIndex:", objc_msgSend(*(id *)(a1 + 32), "item"));
    id v10 = [v9 collectionIdentifier];
    uint64_t v11 = [*(id *)(a1 + 32) item];
    id v12 = objc_loadWeakRetained(v2);
    id v13 = [v12 logicController];
    objc_msgSend(v6, "collectionsCarouselDidRouteToCollectionId:atIndex:isSaved:", v10, v11, objc_msgSend(v13, "isCollectionSavedAtIndex:", objc_msgSend(*(id *)(a1 + 32), "item")));
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v7 = a3;
  double v4 = [(MKCollectionsCarouselView *)self scrollViewDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(MKCollectionsCarouselView *)self scrollViewDelegate];
    [v6 scrollViewWillBeginDragging:v7];
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  id v10 = [(MKCollectionsCarouselView *)self scrollViewDelegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [(MKCollectionsCarouselView *)self scrollViewDelegate];
    objc_msgSend(v12, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v9, a5, x, y);
  }
  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__MKCollectionsCarouselView_scrollViewWillEndDragging_withVelocity_targetContentOffset___block_invoke;
  block[3] = &unk_1E54B9870;
  void block[4] = self;
  v15[1] = *(id *)&x;
  v15[2] = *(id *)&y;
  objc_copyWeak(v15, &location);
  dispatch_async(utilityQueue, block);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

void __88__MKCollectionsCarouselView_scrollViewWillEndDragging_withVelocity_targetContentOffset___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 408);
  if ((unint64_t)(v1 - 1) >= 2)
  {
    if (v1) {
      return;
    }
    double v8 = *(double *)(a1 + 48);
    id v9 = (id *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    char v11 = [WeakRetained analyticsDelegate];
    if (v8 >= 0.0)
    {
      char v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) == 0) {
        return;
      }
      id v15 = objc_loadWeakRetained(v9);
      id v7 = [v15 analyticsDelegate];
      [v7 collectionsCarouselDidScrollBackward];
    }
    else
    {
      char v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) == 0) {
        return;
      }
      id v15 = objc_loadWeakRetained(v9);
      id v7 = [v15 analyticsDelegate];
      [v7 collectionsCarouselDidScrollForward];
    }
  }
  else
  {
    double v2 = *(double *)(a1 + 56);
    BOOL v3 = (id *)(a1 + 40);
    id v4 = objc_loadWeakRetained((id *)(a1 + 40));
    char v5 = [v4 analyticsDelegate];
    if (v2 <= 0.0)
    {
      char v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) == 0) {
        return;
      }
      id v15 = objc_loadWeakRetained(v3);
      id v7 = [v15 analyticsDelegate];
      [v7 collectionsCarouselDidScrollUp];
    }
    else
    {
      char v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) == 0) {
        return;
      }
      id v15 = objc_loadWeakRetained(v3);
      id v7 = [v15 analyticsDelegate];
      [v7 collectionsCarouselDidScrollDown];
    }
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v7 = a3;
  id v4 = [(MKCollectionsCarouselView *)self scrollViewDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(MKCollectionsCarouselView *)self scrollViewDelegate];
    [v6 scrollViewDidEndDecelerating:v7];
  }
}

+ (double)verticalLayoutHeightWithNumberOfItems:(unint64_t)a3 maxWidth:(double)a4 usingTraitEnvironment:(id)a5 inContext:(int64_t)a6
{
  id v9 = a5;
  id v10 = [[MKPlaceCollectionsSizeController alloc] initWithDefaultCollectionsConfigurationUsingTraitCollections:v9 inContext:a6];

  [(MKPlaceCollectionsSizeController *)v10 sizeForCollectionWithMaxCollectionsWidth:a4];
  double v12 = v11;
  [(MKPlaceCollectionsSizeController *)v10 minimumInterItemSpacing];
  double v14 = v13;
  [(MKPlaceCollectionsSizeController *)v10 sectionInsets];
  double v16 = v15 + (v12 + v14) * (double)a3;

  return v16;
}

- (void)setContentOffset:(CGPoint)a3
{
}

- (CGPoint)contentOffset
{
  [(UICollectionView *)self->_collectionView contentOffset];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (CGSize)contentSize
{
  [(UICollectionView *)self->_collectionView contentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setCollectionView:(id)a3
{
}

- (void)setFlowLayout:(id)a3
{
}

- (void)setLogicController:(id)a3
{
}

- (void)setSizeController:(id)a3
{
}

- (MKCollectionCarouselRoutingDelegate)routingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);

  return (MKCollectionCarouselRoutingDelegate *)WeakRetained;
}

- (void)setRoutingDelegate:(id)a3
{
}

- (void)setScrollViewDelegate:(id)a3
{
}

- (MKCollectionCarouselAnalyticsDelegate)analyticsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDelegate);

  return (MKCollectionCarouselAnalyticsDelegate *)WeakRetained;
}

- (void)setAnalyticsDelegate:(id)a3
{
}

- (void)setExploreGuides:(id)a3
{
}

- (void)setCarouselContext:(int64_t)a3
{
  self->_carouselContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_exploreGuides, 0);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_destroyWeak((id *)&self->_scrollViewDelegate);
  objc_destroyWeak((id *)&self->_routingDelegate);
  objc_storeStrong((id *)&self->_sizeController, 0);
  objc_storeStrong((id *)&self->_logicController, 0);
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);

  objc_storeStrong((id *)&self->_utilityQueue, 0);
}

@end