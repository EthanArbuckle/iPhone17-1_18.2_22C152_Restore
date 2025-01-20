@interface GKCollectionMultiDataSource
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)dataSources;
- (double)preferredCollectionHeight;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)dataSourceForIndexPath:(id)a3;
- (id)itemForIndexPath:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)itemCount;
- (int64_t)itemCountInSection:(int64_t)a3;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didFocusItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUnfocusItemAtIndexPath:(id)a4;
- (void)loadDataWithCompletionHandler:(id)a3;
- (void)setDataSources:(id)a3;
- (void)setupCollectionView:(id)a3;
@end

@implementation GKCollectionMultiDataSource

- (id)dataSourceForIndexPath:(id)a3
{
  unint64_t v4 = [a3 section];
  if ([(NSArray *)self->_dataSources count] <= v4)
  {
    v5 = NSString;
    v6 = [NSString stringWithFormat:@"Assertion failed"];
    v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKCollectionMultiDataSource.m"];
    id v8 = [v7 lastPathComponent];
    v9 = [v5 stringWithFormat:@"%@ (_dataSources.count > section)\n[%s (%s:%d)]", v6, "-[GKCollectionMultiDataSource dataSourceForIndexPath:]", objc_msgSend(v8, "UTF8String"), 18];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v9 format];
  }
  dataSources = self->_dataSources;

  return [(NSArray *)dataSources objectAtIndexedSubscript:v4];
}

- (void)setupCollectionView:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_dataSources;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setupCollectionView:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [v4 setDataSource:self];
  [v4 setDelegate:self];
}

- (void)loadDataWithCompletionHandler:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  char v27 = 0;
  id v4 = (void *)MEMORY[0x1E4F636D8];
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKCollectionMultiDataSource.m", 35, "-[GKCollectionMultiDataSource loadDataWithCompletionHandler:]");
  uint64_t v6 = [v4 dispatchGroupWithName:v5];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v7 = self->_dataSources;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __61__GKCollectionMultiDataSource_loadDataWithCompletionHandler___block_invoke;
        v19[3] = &unk_1E5F64138;
        v19[4] = v11;
        v21 = v26;
        id v20 = v6;
        [v20 perform:v19];
      }
      uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v8);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__GKCollectionMultiDataSource_loadDataWithCompletionHandler___block_invoke_3;
  v15[3] = &unk_1E5F65468;
  id v12 = v14;
  id v17 = v12;
  v18 = v26;
  id v13 = v6;
  id v16 = v13;
  [v13 notifyOnMainQueueWithBlock:v15];

  _Block_object_dispose(v26, 8);
}

void __61__GKCollectionMultiDataSource_loadDataWithCompletionHandler___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__GKCollectionMultiDataSource_loadDataWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E5F65E80;
  v5 = (void *)a1[4];
  id v4 = (void *)a1[5];
  uint64_t v10 = a1[6];
  id v8 = v4;
  id v9 = v3;
  id v6 = v3;
  [v5 loadDataWithCompletionHandler:v7];
}

void __61__GKCollectionMultiDataSource_loadDataWithCompletionHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  id v6 = v5;
  if (v5) {
    [*(id *)(a1 + 32) setError:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __61__GKCollectionMultiDataSource_loadDataWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    uint64_t v2 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    id v3 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);
  }
}

- (int64_t)itemCount
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = self->_dataSources;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "itemCount", (void)v9);
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (int64_t)itemCountInSection:(int64_t)a3
{
  if ([(NSArray *)self->_dataSources count] <= a3)
  {
    int64_t v5 = NSString;
    uint64_t v6 = [NSString stringWithFormat:@"Assertion failed"];
    uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKCollectionMultiDataSource.m"];
    id v8 = [v7 lastPathComponent];
    long long v9 = [v5 stringWithFormat:@"%@ (_dataSources.count > section)\n[%s (%s:%d)]", v6, "-[GKCollectionMultiDataSource itemCountInSection:]", objc_msgSend(v8, "UTF8String"), 69];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v9 format];
  }
  long long v10 = [(NSArray *)self->_dataSources objectAtIndexedSubscript:a3];
  int64_t v11 = [v10 itemCount];

  return v11;
}

- (double)preferredCollectionHeight
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = self->_dataSources;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    double v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "preferredCollectionHeight", (void)v10);
        if (v8 > v6) {
          double v6 = v8;
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (id)itemForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GKCollectionMultiDataSource *)self dataSourceForIndexPath:v4];
  double v6 = [v5 itemForIndexPath:v4];

  return v6;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return [(NSArray *)self->_dataSources count];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(GKCollectionMultiDataSource *)self itemCountInSection:a4];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(GKCollectionMultiDataSource *)self dataSourceForIndexPath:v6];
  long long v9 = [v8 collectionView:v7 cellForItemAtIndexPath:v6];

  return v9;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  long long v11 = [(GKCollectionMultiDataSource *)self dataSourceForIndexPath:v8];
  long long v12 = [v11 collectionView:v10 viewForSupplementaryElementOfKind:v9 atIndexPath:v8];

  return v12;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(NSArray *)self->_dataSources count] <= a5)
  {
    id v10 = NSString;
    long long v11 = [NSString stringWithFormat:@"Assertion failed"];
    long long v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKCollectionMultiDataSource.m"];
    id v13 = [v12 lastPathComponent];
    uint64_t v14 = [v10 stringWithFormat:@"%@ (_dataSources.count > section)\n[%s (%s:%d)]", v11, "-[GKCollectionMultiDataSource collectionView:layout:referenceSizeForHeaderInSection:]", objc_msgSend(v13, "UTF8String"), 125];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v14 format];
  }
  uint64_t v15 = [(NSArray *)self->_dataSources objectAtIndexedSubscript:a5];
  if (objc_opt_respondsToSelector())
  {
    [v15 collectionView:v8 layout:v9 referenceSizeForHeaderInSection:a5];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      double v18 = *MEMORY[0x1E4F1DB30];
      double v19 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      goto LABEL_9;
    }
    [v9 headerReferenceSize];
  }
  double v18 = v16;
  double v19 = v17;
LABEL_9:

  double v20 = v18;
  double v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(NSArray *)self->_dataSources count] <= a5)
  {
    id v10 = NSString;
    long long v11 = [NSString stringWithFormat:@"Assertion failed"];
    long long v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKCollectionMultiDataSource.m"];
    id v13 = [v12 lastPathComponent];
    uint64_t v14 = [v10 stringWithFormat:@"%@ (_dataSources.count > section)\n[%s (%s:%d)]", v11, "-[GKCollectionMultiDataSource collectionView:layout:referenceSizeForFooterInSection:]", objc_msgSend(v13, "UTF8String"), 143];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v14 format];
  }
  uint64_t v15 = [(NSArray *)self->_dataSources objectAtIndexedSubscript:a5];
  if (objc_opt_respondsToSelector())
  {
    [v15 collectionView:v8 layout:v9 referenceSizeForFooterInSection:a5];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      double v18 = *MEMORY[0x1E4F1DB30];
      double v19 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      goto LABEL_9;
    }
    [v9 footerReferenceSize];
  }
  double v18 = v16;
  double v19 = v17;
LABEL_9:

  double v20 = v18;
  double v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [(GKCollectionMultiDataSource *)self dataSourceForIndexPath:v10];
  if (objc_opt_respondsToSelector())
  {
    [v11 collectionView:v8 layout:v9 sizeForItemAtIndexPath:v10];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      double v14 = *MEMORY[0x1E4F1DB30];
      double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      goto LABEL_7;
    }
    [v9 itemSize];
  }
  double v14 = v12;
  double v15 = v13;
LABEL_7:

  double v16 = v14;
  double v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(GKCollectionMultiDataSource *)self dataSourceForIndexPath:v7];
  if (objc_opt_respondsToSelector()) {
    char v9 = [v8 collectionView:v6 shouldSelectItemAtIndexPath:v7];
  }
  else {
    char v9 = 1;
  }

  return v9;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(GKCollectionMultiDataSource *)self dataSourceForIndexPath:v6];
  if (objc_opt_respondsToSelector())
  {
    id v8 = [v7 presentationViewController];

    if (!v8)
    {
      char v9 = [(GKCollectionDataSource *)self presentationViewController];
      [v7 setPresentationViewController:v9];
    }
    [v7 collectionView:v10 didSelectItemAtIndexPath:v6];
  }
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(GKCollectionMultiDataSource *)self dataSourceForIndexPath:v6];
  if (objc_opt_respondsToSelector()) {
    [v7 collectionView:v8 didDeselectItemAtIndexPath:v6];
  }
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKCollectionMultiDataSource *)self dataSourceForIndexPath:v6];
  char v9 = [v8 collectionView:v7 canFocusItemAtIndexPath:v6];

  return v9;
}

- (void)collectionView:(id)a3 didFocusItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKCollectionMultiDataSource *)self dataSourceForIndexPath:v6];
  [v8 collectionView:v7 didFocusItemAtIndexPath:v6];
}

- (void)collectionView:(id)a3 didUnfocusItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKCollectionMultiDataSource *)self dataSourceForIndexPath:v6];
  [v8 collectionView:v7 didUnfocusItemAtIndexPath:v6];
}

- (NSArray)dataSources
{
  return self->_dataSources;
}

- (void)setDataSources:(id)a3
{
}

- (void).cxx_destruct
{
}

@end