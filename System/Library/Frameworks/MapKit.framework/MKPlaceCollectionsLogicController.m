@interface MKPlaceCollectionsLogicController
- (BOOL)isCollectionSavedAtIndex:(int64_t)a3;
- (MKCuratedCollectionsSyncCoordinator)syncCoordinator;
- (MKPlaceBatchController)batchController;
- (MKPlaceCollectionsLogicController)initWithCollectionView:(id)a3 withPlaceCollections:(id)a4 usingCollectionIds:(id)a5 usingCollectionFetcher:(id)a6 usingGuideConsumer:(id)a7 usingSyncCoordinator:(id)a8 inContext:(int64_t)a9 usingBatchSize:(unint64_t)a10;
- (MKPlaceCollectionsLogicController)initWithPlaceCollections:(id)a3 usingSyncCoordinator:(id)a4 inContext:(int64_t)a5;
- (NSArray)collections;
- (NSArray)geoCollections;
- (NSDiffableDataSourceSnapshot)snapshot;
- (UICollectionView)collectionView;
- (UICollectionViewDiffableDataSource)dataSource;
- (id)buildCuratedCollectionsFrom:(id)a3 shouldCancelImageDownloads:(BOOL)a4;
- (id)collectionAtIndex:(int64_t)a3;
- (id)geoCollectionAtIndex:(int64_t)a3;
- (id)identifierForCollectionAtIndex:(int64_t)a3;
- (id)removeIdentifiers:(id)a3 collidingWithPlaceCollections:(id)a4;
- (int64_t)numberOfCollections;
- (int64_t)numberOfSections;
- (int64_t)sectionKindAtIndex:(int64_t)a3;
- (void)_dispatchOnManThread:(id)a3;
- (void)appendBatchOfCollections:(id)a3;
- (void)applySnapShot:(id)a3 animated:(BOOL)a4;
- (void)clearPreviousModelImageDownloads;
- (void)clearSnapshotData;
- (void)createBatchControllerIfNeededUsingIdentifiers:(id)a3 andPlaceCollections:(id)a4 usingCollectionFetcher:(id)a5 usingGuideConsumer:(id)a6 usingBatchSize:(unint64_t)a7;
- (void)didStartFetchingBatch;
- (void)displayCollections;
- (void)getCollections:(id)a3;
- (void)getCollectionsUsingDataSource:(id)a3 onCompletion:(id)a4;
- (void)prepareSnapshot;
- (void)refreshCollections;
- (void)setBatchController:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCollections:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setGeoCollections:(id)a3;
- (void)setSnapshot:(id)a3;
- (void)setSyncCoordinator:(id)a3;
- (void)shouldConsumeBatch:(BOOL)a3 fetchedBatch:(id)a4;
- (void)updateCollections:(id)a3 usingBatchedIdentifiers:(id)a4 usingCollectionFetcher:(id)a5 usingBatchSize:(unint64_t)a6;
- (void)updateCollectionsWithoutPreparingSnapshot:(id)a3 usingBatchedIdentifiers:(id)a4 usingCollectionFetcher:(id)a5 usingGuideConsumer:(id)a6 usingBatchSize:(unint64_t)a7;
- (void)updateUsingBatchedIdentifiers:(id)a3 usingCollectionFetcher:(id)a4 usingBatchSize:(unint64_t)a5;
- (void)willDisplayCellAtIndexpath:(id)a3;
@end

@implementation MKPlaceCollectionsLogicController

id __52__MKPlaceCollectionsLogicController_getCollections___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = +[MKPlaceCollectionCell reuseIdentifier];
    v12 = [v7 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v8];

    v13 = objc_msgSend(WeakRetained, "collectionAtIndex:", objc_msgSend(v8, "item"));
    [v12 configureWithModel:v13];

    goto LABEL_7;
  }
  v14 = +[MKCollectionBatchCell reuseIdentifier];
  int v15 = [v9 isEqualToString:v14];

  if (v15)
  {
    v16 = +[MKCollectionBatchCell reuseIdentifier];
    v12 = [v7 dequeueReusableCellWithReuseIdentifier:v16 forIndexPath:v8];

    [v12 startedLoadingBatch];
  }
  else
  {
LABEL_6:
    v12 = 0;
  }
LABEL_7:

  return v12;
}

- (id)collectionAtIndex:(int64_t)a3
{
  v4 = [(MKPlaceCollectionsLogicController *)self collections];
  v5 = [v4 objectAtIndex:a3];

  return v5;
}

- (NSArray)collections
{
  return self->_collections;
}

- (MKPlaceCollectionsLogicController)initWithCollectionView:(id)a3 withPlaceCollections:(id)a4 usingCollectionIds:(id)a5 usingCollectionFetcher:(id)a6 usingGuideConsumer:(id)a7 usingSyncCoordinator:(id)a8 inContext:(int64_t)a9 usingBatchSize:(unint64_t)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  v38.receiver = self;
  v38.super_class = (Class)MKPlaceCollectionsLogicController;
  v22 = [(MKPlaceCollectionsLogicController *)&v38 init];
  v23 = v22;
  if (v22)
  {
    id v36 = v21;
    id v37 = v20;
    id v24 = v18;
    [(MKPlaceCollectionsLogicController *)v22 setCollectionView:v16];
    v25 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v17];
    v26 = [v25 array];
    v27 = (void *)[v26 copy];
    [(MKPlaceCollectionsLogicController *)v23 setGeoCollections:v27];

    objc_storeStrong((id *)&v23->_syncCoordinator, a8);
    v23->_context = a9;
    v28 = [(MKPlaceCollectionsLogicController *)v23 buildCuratedCollectionsFrom:v17 shouldCancelImageDownloads:0];
    [(MKPlaceCollectionsLogicController *)v23 setCollections:v28];

    if (a9 == 9)
    {
      v29 = v23;
      id v18 = v24;
      id v30 = v24;
    }
    else
    {
      id v18 = v24;
      if (a9 != 5)
      {
        id v21 = v36;
        id v20 = v37;
        if (a9 == 2) {
          [(MKPlaceCollectionsLogicController *)v23 createBatchControllerIfNeededUsingIdentifiers:v18 andPlaceCollections:v17 usingCollectionFetcher:v19 usingGuideConsumer:v23 usingBatchSize:a10];
        }
        goto LABEL_9;
      }
      v29 = v23;
      id v30 = v24;
    }
    id v20 = v37;
    [(MKPlaceCollectionsLogicController *)v29 createBatchControllerIfNeededUsingIdentifiers:v30 andPlaceCollections:v17 usingCollectionFetcher:v19 usingGuideConsumer:v37 usingBatchSize:a10];
    id v21 = v36;
LABEL_9:
    uint64_t v31 = objc_opt_class();
    v32 = +[MKPlaceCollectionCell reuseIdentifier];
    [v16 registerClass:v31 forCellWithReuseIdentifier:v32];

    uint64_t v33 = objc_opt_class();
    v34 = +[MKCollectionBatchCell reuseIdentifier];
    [v16 registerClass:v33 forCellWithReuseIdentifier:v34];
  }
  return v23;
}

- (void)setGeoCollections:(id)a3
{
}

- (void)setCollections:(id)a3
{
}

- (void)setCollectionView:(id)a3
{
}

- (id)buildCuratedCollectionsFrom:(id)a3 shouldCancelImageDownloads:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v4) {
    [(MKPlaceCollectionsLogicController *)self clearPreviousModelImageDownloads];
  }
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v14 = [MKPlaceCollectionViewModel alloc];
        int v15 = [(MKPlaceCollectionsLogicController *)self syncCoordinator];
        id v16 = [(MKPlaceCollectionViewModel *)v14 initWithGEOPlaceCollection:v13 usingSyncCoordinator:v15 inContext:self->_context usingTitleFont:0];

        [v7 addObject:v16];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  return v7;
}

- (MKCuratedCollectionsSyncCoordinator)syncCoordinator
{
  return self->_syncCoordinator;
}

- (int64_t)sectionKindAtIndex:(int64_t)a3
{
  int64_t v4 = [(MKPlaceCollectionsLogicController *)self numberOfSections];
  if (a3 == 1) {
    int64_t v5 = 1;
  }
  else {
    int64_t v5 = -1;
  }
  if (!a3) {
    int64_t v5 = 0;
  }
  if (v4 <= a3) {
    return 0;
  }
  else {
    return v5;
  }
}

- (int64_t)numberOfSections
{
  return 2;
}

- (void)willDisplayCellAtIndexpath:(id)a3
{
  id v4 = a3;
  id v6 = [(MKPlaceCollectionsLogicController *)self batchController];
  uint64_t v5 = [v4 item];

  [v6 didDisplayItemAtIndex:v5];
}

- (MKPlaceBatchController)batchController
{
  return self->_batchController;
}

- (void)prepareSnapshot
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F42650]);
  [(MKPlaceCollectionsLogicController *)self setSnapshot:v3];

  id v4 = [(MKPlaceCollectionsLogicController *)self snapshot];
  v9[0] = @"CarouselSection";
  v9[1] = @"LoadingSection";
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  [v4 appendSectionsWithIdentifiers:v5];

  id v6 = [(MKPlaceCollectionsLogicController *)self snapshot];
  id v7 = [(MKPlaceCollectionsLogicController *)self geoCollections];
  [v6 appendItemsWithIdentifiers:v7 intoSectionWithIdentifier:@"CarouselSection"];

  id v8 = [(MKPlaceCollectionsLogicController *)self snapshot];
  [v8 appendItemsWithIdentifiers:MEMORY[0x1E4F1CBF0] intoSectionWithIdentifier:@"LoadingSection"];
}

- (NSDiffableDataSourceSnapshot)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
}

- (NSArray)geoCollections
{
  return self->_geoCollections;
}

void __60__MKPlaceCollectionsLogicController_applySnapShot_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained dataSource];
  [v2 applySnapshot:*(void *)(a1 + 32) animatingDifferences:*(unsigned __int8 *)(a1 + 48)];
}

- (void)updateCollections:(id)a3 usingBatchedIdentifiers:(id)a4 usingCollectionFetcher:(id)a5 usingBatchSize:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  [(MKPlaceCollectionsLogicController *)self setGeoCollections:v12];
  uint64_t v13 = [(MKPlaceCollectionsLogicController *)self geoCollections];
  v14 = [(MKPlaceCollectionsLogicController *)self buildCuratedCollectionsFrom:v13 shouldCancelImageDownloads:1];
  [(MKPlaceCollectionsLogicController *)self setCollections:v14];

  [(MKPlaceCollectionsLogicController *)self createBatchControllerIfNeededUsingIdentifiers:v11 andPlaceCollections:v12 usingCollectionFetcher:v10 usingGuideConsumer:self usingBatchSize:a6];

  [(MKPlaceCollectionsLogicController *)self prepareSnapshot];
}

- (void)setDataSource:(id)a3
{
}

- (void)setBatchController:(id)a3
{
}

- (void)getCollections:(id)a3
{
  id v4 = (void (**)(void))a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4F42880]);
  id v6 = [(MKPlaceCollectionsLogicController *)self collectionView];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __52__MKPlaceCollectionsLogicController_getCollections___block_invoke;
  id v11 = &unk_1E54BEED8;
  objc_copyWeak(&v12, &location);
  id v7 = (void *)[v5 initWithCollectionView:v6 cellProvider:&v8];
  -[MKPlaceCollectionsLogicController setDataSource:](self, "setDataSource:", v7, v8, v9, v10, v11);

  [(MKPlaceCollectionsLogicController *)self prepareSnapshot];
  if (v4) {
    v4[2](v4);
  }
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)displayCollections
{
  id v3 = [(MKPlaceCollectionsLogicController *)self snapshot];
  [(MKPlaceCollectionsLogicController *)self applySnapShot:v3 animated:0];
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)createBatchControllerIfNeededUsingIdentifiers:(id)a3 andPlaceCollections:(id)a4 usingCollectionFetcher:(id)a5 usingGuideConsumer:(id)a6 usingBatchSize:(unint64_t)a7
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  [(MKPlaceCollectionsLogicController *)self setBatchController:0];
  if (v18)
  {
    int v15 = [(MKPlaceCollectionsLogicController *)self removeIdentifiers:v18 collidingWithPlaceCollections:v12];
    uint64_t v16 = [v15 count];
    if (v14 && v13 && v16)
    {
      id v17 = -[MKPlaceBatchController initWithItemIdentifiers:withBatchSize:minimumNumberOfItemBeforeFetching:shouldLoadFirstBatchImmediately:usingBatchFetcher:usingBatchConsumer:displayedItemCount:]([MKPlaceBatchController alloc], "initWithItemIdentifiers:withBatchSize:minimumNumberOfItemBeforeFetching:shouldLoadFirstBatchImmediately:usingBatchFetcher:usingBatchConsumer:displayedItemCount:", v15, a7, 2, 0, v13, v14, [v12 count]);
      [(MKPlaceCollectionsLogicController *)self setBatchController:v17];
    }
  }
}

- (UICollectionView)collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);

  return (UICollectionView *)WeakRetained;
}

- (void)clearPreviousModelImageDownloads
{
  id v3 = +[MKPlaceCollectionImageProvider sharedInstance];
  unint64_t v4 = self->_context - 1;
  if (v4 > 9) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = qword_18BD1C2E8[v4];
  }
  id v6 = v3;
  [v3 cancelAllOperationsForImageSource:v5];
}

- (void)applySnapShot:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__MKPlaceCollectionsLogicController_applySnapShot_animated___block_invoke;
  v8[3] = &unk_1E54B8B28;
  objc_copyWeak(&v10, &location);
  id v7 = v6;
  id v9 = v7;
  BOOL v11 = a4;
  [(MKPlaceCollectionsLogicController *)self _dispatchOnManThread:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_dispatchOnManThread:(id)a3
{
  id v3 = (void (**)(void))a3;
  if (v3)
  {
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      v3[2](v3);
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __58__MKPlaceCollectionsLogicController__dispatchOnManThread___block_invoke;
      block[3] = &unk_1E54B82E8;
      uint64_t v5 = v3;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_18BAEC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: block", buf, 2u);
  }
}

- (MKPlaceCollectionsLogicController)initWithPlaceCollections:(id)a3 usingSyncCoordinator:(id)a4 inContext:(int64_t)a5
{
  return [(MKPlaceCollectionsLogicController *)self initWithCollectionView:0 withPlaceCollections:a3 usingCollectionIds:0 usingCollectionFetcher:0 usingGuideConsumer:0 usingSyncCoordinator:a4 inContext:a5 usingBatchSize:0];
}

- (void)clearSnapshotData
{
  id v3 = [(MKPlaceCollectionsLogicController *)self dataSource];
  id v6 = [v3 snapshot];

  unint64_t v4 = [v6 itemIdentifiersInSectionWithIdentifier:@"CarouselSection"];
  uint64_t v5 = [v6 itemIdentifiersInSectionWithIdentifier:@"LoadingSection"];
  [v6 deleteItemsWithIdentifiers:v4];
  [v6 deleteItemsWithIdentifiers:v5];
  [(MKPlaceCollectionsLogicController *)self applySnapShot:v6 animated:0];
}

- (void)getCollectionsUsingDataSource:(id)a3 onCompletion:(id)a4
{
  id v7 = a4;
  [(MKPlaceCollectionsLogicController *)self setDataSource:a3];
  [(MKPlaceCollectionsLogicController *)self prepareSnapshot];
  id v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    id v6 = v7;
  }
}

- (void)refreshCollections
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(MKPlaceCollectionsLogicController *)self numberOfCollections])
  {
    id v3 = MKGetCuratedCollectionsLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_DEBUG, "Logic controller is refreshing collections", v7, 2u);
    }

    unint64_t v4 = [(MKPlaceCollectionsLogicController *)self dataSource];
    uint64_t v5 = [v4 snapshot];

    v8[0] = @"CarouselSection";
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [v5 reloadSectionsWithIdentifiers:v6];

    [(MKPlaceCollectionsLogicController *)self applySnapShot:v5 animated:0];
  }
}

- (int64_t)numberOfCollections
{
  v2 = [(MKPlaceCollectionsLogicController *)self collections];
  int64_t v3 = [v2 count];

  return v3;
}

- (id)geoCollectionAtIndex:(int64_t)a3
{
  unint64_t v4 = [(MKPlaceCollectionsLogicController *)self geoCollections];
  uint64_t v5 = [v4 objectAtIndex:a3];

  return v5;
}

- (void)updateCollectionsWithoutPreparingSnapshot:(id)a3 usingBatchedIdentifiers:(id)a4 usingCollectionFetcher:(id)a5 usingGuideConsumer:(id)a6 usingBatchSize:(unint64_t)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v17 = a3;
  [(MKPlaceCollectionsLogicController *)self setGeoCollections:v17];
  int v15 = [(MKPlaceCollectionsLogicController *)self geoCollections];
  uint64_t v16 = [(MKPlaceCollectionsLogicController *)self buildCuratedCollectionsFrom:v15 shouldCancelImageDownloads:1];
  [(MKPlaceCollectionsLogicController *)self setCollections:v16];

  [(MKPlaceCollectionsLogicController *)self createBatchControllerIfNeededUsingIdentifiers:v14 andPlaceCollections:v17 usingCollectionFetcher:v13 usingGuideConsumer:v12 usingBatchSize:a7];
}

- (void)updateUsingBatchedIdentifiers:(id)a3 usingCollectionFetcher:(id)a4 usingBatchSize:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(MKPlaceCollectionsLogicController *)self geoCollections];
  [(MKPlaceCollectionsLogicController *)self createBatchControllerIfNeededUsingIdentifiers:v9 andPlaceCollections:v10 usingCollectionFetcher:v8 usingGuideConsumer:self usingBatchSize:a5];
}

- (void)appendBatchOfCollections:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MKPlaceCollectionsLogicController *)self geoCollections];
  id v6 = (void *)[v5 mutableCopy];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __62__MKPlaceCollectionsLogicController_appendBatchOfCollections___block_invoke;
  v18[3] = &unk_1E54BEF00;
  id v19 = v6;
  id v7 = v6;
  [v4 enumerateObjectsUsingBlock:v18];
  [(MKPlaceCollectionsLogicController *)self setGeoCollections:v7];
  id v8 = [(MKPlaceCollectionsLogicController *)self buildCuratedCollectionsFrom:v4 shouldCancelImageDownloads:0];

  id v9 = [(MKPlaceCollectionsLogicController *)self collections];
  id v10 = (void *)[v9 mutableCopy];

  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  int v15 = __62__MKPlaceCollectionsLogicController_appendBatchOfCollections___block_invoke_2;
  uint64_t v16 = &unk_1E54BEF28;
  id v17 = v10;
  id v11 = v10;
  [v8 enumerateObjectsUsingBlock:&v13];
  id v12 = objc_msgSend(v11, "copy", v13, v14, v15, v16);
  [(MKPlaceCollectionsLogicController *)self setCollections:v12];
}

uint64_t __62__MKPlaceCollectionsLogicController_appendBatchOfCollections___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __62__MKPlaceCollectionsLogicController_appendBatchOfCollections___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)identifierForCollectionAtIndex:(int64_t)a3
{
  int64_t v3 = [(MKPlaceCollectionsLogicController *)self geoCollectionAtIndex:a3];
  id v4 = [v3 collectionIdentifier];

  return v4;
}

- (BOOL)isCollectionSavedAtIndex:(int64_t)a3
{
  int64_t v3 = [(MKPlaceCollectionsLogicController *)self collectionAtIndex:a3];
  char v4 = [v3 isSaved];

  return v4;
}

- (id)removeIdentifiers:(id)a3 collidingWithPlaceCollections:(id)a4
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_msgSend([v5 alloc], "initWithCapacity:", objc_msgSend(v6, "count"));
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __85__MKPlaceCollectionsLogicController_removeIdentifiers_collidingWithPlaceCollections___block_invoke;
  v20[3] = &unk_1E54BEF00;
  id v21 = v8;
  id v9 = v8;
  [v6 enumerateObjectsUsingBlock:v20];

  id v10 = (void *)[v7 mutableCopy];
  [v10 removeObjectsInArray:v9];
  id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __85__MKPlaceCollectionsLogicController_removeIdentifiers_collidingWithPlaceCollections___block_invoke_2;
  id v18 = &unk_1E54BEF50;
  id v19 = v11;
  id v12 = v11;
  [v10 enumerateObjectsUsingBlock:&v15];
  uint64_t v13 = objc_msgSend(v12, "copy", v15, v16, v17, v18);

  return v13;
}

void __85__MKPlaceCollectionsLogicController_removeIdentifiers_collidingWithPlaceCollections___block_invoke(uint64_t a1, void *a2)
{
  int64_t v3 = [a2 collectionIdentifier];
  if (v3)
  {
    char v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    int64_t v3 = v4;
  }
}

void __85__MKPlaceCollectionsLogicController_removeIdentifiers_collidingWithPlaceCollections___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = [[MKMapItemIdentifier alloc] initWithGEOMapItemIdentifier:v3];

  char v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
    char v4 = v5;
  }
}

uint64_t __58__MKPlaceCollectionsLogicController__dispatchOnManThread___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)shouldConsumeBatch:(BOOL)a3 fetchedBatch:(id)a4
{
  BOOL v4 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = MKGetCuratedCollectionsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_18BAEC000, v7, OS_LOG_TYPE_DEBUG, "[􀉟] Logic controller informed to consume a batch. Removing loading cell.", (uint8_t *)&v15, 2u);
  }

  id v8 = [(MKPlaceCollectionsLogicController *)self snapshot];
  id v9 = [(MKPlaceCollectionsLogicController *)self snapshot];
  id v10 = [v9 itemIdentifiersInSectionWithIdentifier:@"LoadingSection"];
  [v8 deleteItemsWithIdentifiers:v10];

  if (v4 && [v6 count])
  {
    id v11 = MKGetCuratedCollectionsLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = [v6 count];
      int v15 = 134217984;
      uint64_t v16 = v12;
      _os_log_impl(&dword_18BAEC000, v11, OS_LOG_TYPE_DEBUG, "[􀉟] Logic controller showing %ld more collections.", (uint8_t *)&v15, 0xCu);
    }

    [(MKPlaceCollectionsLogicController *)self appendBatchOfCollections:v6];
    uint64_t v13 = [(MKPlaceCollectionsLogicController *)self snapshot];
    [v13 appendItemsWithIdentifiers:v6 intoSectionWithIdentifier:@"CarouselSection"];
  }
  else
  {
    if (![v6 count])
    {
      uint64_t v14 = MKGetCuratedCollectionsLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_18BAEC000, v14, OS_LOG_TYPE_ERROR, "[􀉟] placeCollections shouldn't be empty when we were sure to load a batch.", (uint8_t *)&v15, 2u);
      }
    }
    uint64_t v13 = MKGetCuratedCollectionsLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_18BAEC000, v13, OS_LOG_TYPE_DEBUG, "[􀉟] Logic controller was informed about batch load failure.", (uint8_t *)&v15, 2u);
    }
  }

  [(MKPlaceCollectionsLogicController *)self displayCollections];
}

- (void)didStartFetchingBatch
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(MKPlaceCollectionsLogicController *)self snapshot];
  BOOL v4 = [v3 itemIdentifiersInSectionWithIdentifier:@"LoadingSection"];
  uint64_t v5 = [v4 count];

  id v6 = MKGetCuratedCollectionsLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_18BAEC000, v6, OS_LOG_TYPE_DEBUG, "[􀉟] Logic controller informed about batch load started when there is already one happening.", v11, 2u);
    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_18BAEC000, v6, OS_LOG_TYPE_DEBUG, "[􀉟] Logic controller informed about batch load started. Showing loading cell.", v11, 2u);
    }

    id v8 = [(MKPlaceCollectionsLogicController *)self snapshot];
    id v9 = +[MKCollectionBatchCell reuseIdentifier];
    v12[0] = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v8 appendItemsWithIdentifiers:v10 intoSectionWithIdentifier:@"LoadingSection"];

    [(MKPlaceCollectionsLogicController *)self displayCollections];
  }
}

- (void)setSyncCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchController, 0);
  objc_storeStrong((id *)&self->_syncCoordinator, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_geoCollections, 0);
  objc_storeStrong((id *)&self->_collections, 0);

  objc_destroyWeak((id *)&self->_collectionView);
}

@end