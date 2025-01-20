@interface GKCollectionViewAggregateDataSource
- (BOOL)containsDataSource:(id)a3;
- (BOOL)item:(id)a3 matchesSearchTerms:(id)a4 inSection:(int64_t)a5;
- (GKCollectionViewAggregateDataSource)init;
- (NSMapTable)dataSourceToMappings;
- (NSMutableArray)mappings;
- (NSMutableDictionary)globalSectionToMappings;
- (id)_gkDescription;
- (id)_gkDescriptionWithChildren:(int64_t)a3;
- (id)allDataSources;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 evaluateFactoryForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5 isRecursive:(BOOL)a6;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)createMetricsTreeWithGridLayout:(id)a3;
- (id)dataSourceForSection:(unint64_t)a3;
- (id)globalIndexPathsForLocal:(id)a3 dataSource:(id)a4;
- (id)globalSectionsForLocal:(id)a3 dataSource:(id)a4;
- (id)indexPathsForItem:(id)a3;
- (id)itemAtIndexPath:(id)a3;
- (id)mappingForDataSource:(id)a3;
- (id)mappingForGlobalSection:(int64_t)a3;
- (id)wrapperForView:(id)a3 mapping:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)sectionCount;
- (unint64_t)sectionForDataSource:(id)a3;
- (void)addDataSource:(id)a3 withTag:(id)a4;
- (void)collectionViewDidBecomeInactive:(id)a3;
- (void)collectionViewWillBecomeActive:(id)a3;
- (void)configureCollectionView:(id)a3;
- (void)dataSource:(id)a3 didInsertItemsAtIndexPaths:(id)a4;
- (void)dataSource:(id)a3 didInsertSections:(id)a4;
- (void)dataSource:(id)a3 didMoveItemAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)dataSource:(id)a3 didMoveSection:(int64_t)a4 toSection:(int64_t)a5;
- (void)dataSource:(id)a3 didRefreshItemsAtIndexPaths:(id)a4;
- (void)dataSource:(id)a3 didRefreshSections:(id)a4;
- (void)dataSource:(id)a3 didRemoveItemsAtIndexPaths:(id)a4;
- (void)dataSource:(id)a3 didRemoveSections:(id)a4;
- (void)dataSource:(id)a3 performBatchUpdate:(id)a4 complete:(id)a5;
- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4 updateNotifier:(id)a5;
- (void)removeDataSource:(id)a3;
- (void)removeItemAtIndexPath:(id)a3 completionHandler:(id)a4;
- (void)setDataSourceToMappings:(id)a3;
- (void)setGlobalSectionToMappings:(id)a3;
- (void)setMappings:(id)a3;
- (void)setSectionCount:(unint64_t)a3;
- (void)updateMappings;
@end

@implementation GKCollectionViewAggregateDataSource

- (GKCollectionViewAggregateDataSource)init
{
  v10.receiver = self;
  v10.super_class = (Class)GKCollectionViewAggregateDataSource;
  v2 = [(GKCollectionViewDataSource *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    mappings = v2->_mappings;
    v2->_mappings = v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:0 capacity:1];
    dataSourceToMappings = v2->_dataSourceToMappings;
    v2->_dataSourceToMappings = (NSMapTable *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    globalSectionToMappings = v2->_globalSectionToMappings;
    v2->_globalSectionToMappings = v7;
  }
  return v2;
}

- (id)_gkDescriptionWithChildren:(int64_t)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F28E78] string];
  uint64_t v6 = _gkTabStringForTabLevel();
  v32.receiver = self;
  v32.super_class = (Class)GKCollectionViewAggregateDataSource;
  v7 = [(GKCollectionViewDataSource *)&v32 _gkDescriptionWithChildren:a3];
  v8 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  uint64_t v9 = [v7 stringByTrimmingCharactersInSet:v8];

  v25 = (void *)v9;
  [v5 appendFormat:@"%@\n", v9];
  v27 = (void *)v6;
  [v5 appendFormat:@"%@    sections: {\n", v6];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [(GKCollectionViewAggregateDataSource *)self mappings];
  uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v29;
    int64_t v13 = a3 + 2;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        v15 = v5;
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v17 = [v16 dataSource];
        v18 = [v17 _gkDescriptionWithChildren:v13];
        v19 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
        v20 = [v18 stringByTrimmingCharactersInSet:v19];

        v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "globalSectionForLocalSection:", 0));
        v22 = [v16 dynamicTag];
        uint64_t v5 = v15;
        [v15 appendFormat:@"%@        %@ - %@ - %@\n", v27, v21, v22, v20];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v11);
  }

  [v5 appendFormat:@"    %@}\n", v27];
  [v5 appendFormat:@"%@}\n", v27];
  id v23 = (id)_gkUnicodifyDescription();

  return v5;
}

- (id)_gkDescription
{
  v4.receiver = self;
  v4.super_class = (Class)GKCollectionViewAggregateDataSource;
  v2 = [(GKCollectionViewDataSource *)&v4 description];

  return v2;
}

- (id)wrapperForView:(id)a3 mapping:(id)a4
{
  return +[GKAggregateCollectionViewWrapper wrapperForView:a3 mapping:a4];
}

- (void)addDataSource:(id)a3 withTag:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  if (!v6)
  {
    v7 = NSString;
    v8 = [NSString stringWithFormat:@"Assertion failed"];
    uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewAggregateDataSource.m"];
    id v10 = [v9 lastPathComponent];
    uint64_t v11 = [v7 stringWithFormat:@"%@ (tag != ((void *)0))\n[%s (%s:%d)]", v8, "-[GKCollectionViewAggregateDataSource addDataSource:withTag:]", objc_msgSend(v10, "UTF8String"), 77];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v11 format];
  }
  uint64_t v12 = [(NSMapTable *)self->_dataSourceToMappings objectForKeyedSubscript:v21];
  if (v12)
  {
    int64_t v13 = NSString;
    v14 = [NSString stringWithFormat:@"tried to add data source '%@' more than once: %@", v6, v21];
    v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewAggregateDataSource.m"];
    id v16 = [v15 lastPathComponent];
    v17 = [v13 stringWithFormat:@"%@ (mappingForDataSource == nil)\n[%s (%s:%d)]", v14, "-[GKCollectionViewAggregateDataSource addDataSource:withTag:]", objc_msgSend(v16, "UTF8String"), 80];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v17 format];
  }
  v18 = objc_alloc_init(GKAggregateMapping);

  [(GKAggregateMapping *)v18 setDataSource:v21];
  [(GKAggregateMapping *)v18 setDynamicTag:v6];
  [(NSMutableArray *)self->_mappings addObject:v18];
  [(NSMapTable *)self->_dataSourceToMappings setObject:v18 forKeyedSubscript:v21];
  [v21 setDelegate:self];
  [(GKCollectionViewAggregateDataSource *)self updateMappings];
  v19 = [MEMORY[0x1E4F28E60] indexSet];
  if ([v21 numberOfSectionsInCollectionView:0])
  {
    unint64_t v20 = 0;
    do
      objc_msgSend(v19, "addIndex:", -[GKAggregateMapping globalSectionForLocalSection:](v18, "globalSectionForLocalSection:", v20++));
    while (v20 < [v21 numberOfSectionsInCollectionView:0]);
  }
  [(GKCollectionViewDataSource *)self notifySectionsInserted:v19];
}

- (void)removeDataSource:(id)a3
{
  id v13 = a3;
  objc_super v4 = -[NSMapTable objectForKey:](self->_dataSourceToMappings, "objectForKey:");

  if (!v4)
  {
    uint64_t v5 = NSString;
    id v6 = [NSString stringWithFormat:@"Assertion failed"];
    v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewAggregateDataSource.m"];
    id v8 = [v7 lastPathComponent];
    uint64_t v9 = [v5 stringWithFormat:@"%@ ([_dataSourceToMappings objectForKey:dataSource] != ((void *)0))\n[%s (%s:%d)]", v6, "-[GKCollectionViewAggregateDataSource removeDataSource:]", objc_msgSend(v8, "UTF8String"), 99];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v9 format];
  }
  [v13 setDelegate:0];
  id v10 = [(NSMapTable *)self->_dataSourceToMappings objectForKeyedSubscript:v13];
  uint64_t v11 = [MEMORY[0x1E4F28E60] indexSet];
  if ([v13 numberOfSectionsInCollectionView:0])
  {
    unint64_t v12 = 0;
    do
      objc_msgSend(v11, "addIndex:", objc_msgSend(v10, "globalSectionForLocalSection:", v12++));
    while (v12 < [v13 numberOfSectionsInCollectionView:0]);
  }
  [(NSMapTable *)self->_dataSourceToMappings removeObjectForKey:v13];
  [(NSMutableArray *)self->_mappings removeObject:v10];
  [(GKCollectionViewDataSource *)self notifySectionsRemoved:v11];
  [(GKCollectionViewAggregateDataSource *)self updateMappings];
}

- (void)updateMappings
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  self->_unint64_t sectionCount = 0;
  [(NSMutableDictionary *)self->_globalSectionToMappings removeAllObjects];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = self->_mappings;
  uint64_t v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v14 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v14) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        unint64_t v7 = [v6 updateMappingsStartingWithGlobalSection:self->_sectionCount];
        unint64_t sectionCount = self->_sectionCount;
        if (sectionCount < v7)
        {
          unint64_t v9 = v7;
          do
          {
            globalSectionToMappings = self->_globalSectionToMappings;
            uint64_t v11 = NSNumber;
            self->_unint64_t sectionCount = sectionCount + 1;
            unint64_t v12 = objc_msgSend(v11, "numberWithUnsignedInteger:");
            [(NSMutableDictionary *)globalSectionToMappings setObject:v6 forKeyedSubscript:v12];

            unint64_t sectionCount = self->_sectionCount;
          }
          while (sectionCount < v9);
        }
      }
      uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
}

- (unint64_t)sectionForDataSource:(id)a3
{
  uint64_t v3 = [(GKCollectionViewAggregateDataSource *)self mappingForDataSource:a3];
  unint64_t v4 = [v3 globalSectionForLocalSection:0];

  return v4;
}

- (id)dataSourceForSection:(unint64_t)a3
{
  globalSectionToMappings = self->_globalSectionToMappings;
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v6 = [(NSMutableDictionary *)globalSectionToMappings objectForKeyedSubscript:v5];

  unint64_t v7 = [v6 dataSource];
  id v8 = objc_msgSend(v7, "dataSourceForSection:", objc_msgSend(v6, "localSectionForGlobalSection:", a3));

  return v8;
}

- (id)mappingForGlobalSection:(int64_t)a3
{
  globalSectionToMappings = self->_globalSectionToMappings;
  unint64_t v4 = [NSNumber numberWithInteger:a3];
  uint64_t v5 = [(NSMutableDictionary *)globalSectionToMappings objectForKeyedSubscript:v4];

  return v5;
}

- (id)mappingForDataSource:(id)a3
{
  return (id)[(NSMapTable *)self->_dataSourceToMappings objectForKeyedSubscript:a3];
}

- (id)globalSectionsForLocal:(id)a3 dataSource:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28E60];
  id v7 = a4;
  id v8 = a3;
  unint64_t v9 = [v6 indexSet];
  id v10 = [(GKCollectionViewAggregateDataSource *)self mappingForDataSource:v7];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73__GKCollectionViewAggregateDataSource_globalSectionsForLocal_dataSource___block_invoke;
  v16[3] = &unk_1E5F63468;
  id v11 = v9;
  id v17 = v11;
  long long v18 = v10;
  id v12 = v10;
  [v8 enumerateIndexesUsingBlock:v16];

  id v13 = v18;
  id v14 = v11;

  return v14;
}

uint64_t __73__GKCollectionViewAggregateDataSource_globalSectionsForLocal_dataSource___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) globalSectionForLocalSection:a2];

  return [v2 addIndex:v3];
}

- (id)globalIndexPathsForLocal:(id)a3 dataSource:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  unint64_t v9 = [(GKCollectionViewAggregateDataSource *)self mappingForDataSource:v7];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = objc_msgSend(v9, "globalIndexPathForLocalIndexPath:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
        [v8 addObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v8;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  [(GKCollectionViewAggregateDataSource *)self updateMappings];
  id v7 = [(GKCollectionViewAggregateDataSource *)self mappingForGlobalSection:a4];
  uint64_t v8 = [v7 localSectionForGlobalSection:a4];
  unint64_t v9 = [(GKCollectionViewAggregateDataSource *)self wrapperForView:v6 mapping:v7];

  id v10 = [v7 dataSource];
  uint64_t v11 = [v10 numberOfSectionsInCollectionView:v9];

  if (v8 >= v11)
  {
    uint64_t v12 = NSString;
    uint64_t v13 = [v7 tagForGlobalSection:a4];
    id v14 = [v12 stringWithFormat:@"Internal consistency check failed: localSection index (%ld) in dataSource %@ not less than numberOfSections (%ld)", v8, v13, v11];
    long long v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewAggregateDataSource.m"];
    id v16 = [v15 lastPathComponent];
    long long v17 = [v12 stringWithFormat:@"%@ (localSection < numberOfSections)\n[%s (%s:%d)]", v14, "-[GKCollectionViewAggregateDataSource collectionView:numberOfItemsInSection:]", objc_msgSend(v16, "UTF8String"), 187];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v17 format];
  }
  long long v18 = [v7 dataSource];
  int64_t v19 = [v18 collectionView:v9 numberOfItemsInSection:v8];

  return v19;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = -[GKCollectionViewAggregateDataSource mappingForGlobalSection:](self, "mappingForGlobalSection:", [v6 section]);
  unint64_t v9 = [v8 localIndexPathForGlobalIndexPath:v6];

  id v10 = [v8 dataSource];
  uint64_t v11 = [(GKCollectionViewAggregateDataSource *)self wrapperForView:v7 mapping:v8];

  uint64_t v12 = [v10 collectionView:v11 cellForItemAtIndexPath:v9];

  return v12;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return self->_sectionCount;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(GKCollectionViewAggregateDataSource *)self collectionView:v8 evaluateFactoryForSupplementaryElementOfKind:v9 atIndexPath:v10 isRecursive:1];
  if (!v11)
  {
    uint64_t v12 = -[GKCollectionViewAggregateDataSource mappingForGlobalSection:](self, "mappingForGlobalSection:", [v10 section]);
    uint64_t v13 = [v12 dataSource];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      long long v15 = [v12 localIndexPathForGlobalIndexPath:v10];
      id v16 = [(GKCollectionViewAggregateDataSource *)self wrapperForView:v8 mapping:v12];
      long long v17 = [v12 dataSource];
      uint64_t v11 = [v17 collectionView:v16 viewForSupplementaryElementOfKind:v9 atIndexPath:v15];

      if (v11) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    uint64_t v11 = [(GKCollectionViewDataSource *)self collectionView:v8 defaultViewForSupplementaryElementOfKind:v9 atIndexPath:v10];
  }
LABEL_7:

  return v11;
}

- (id)collectionView:(id)a3 evaluateFactoryForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5 isRecursive:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = v12;
  if (v6)
  {
    char v14 = -[GKCollectionViewAggregateDataSource mappingForGlobalSection:](self, "mappingForGlobalSection:", [v12 section]);
    long long v15 = [v14 dataSource];
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      long long v17 = [v14 localIndexPathForGlobalIndexPath:v13];
      long long v18 = [(GKCollectionViewAggregateDataSource *)self wrapperForView:v10 mapping:v14];
      int64_t v19 = [v14 dataSource];
      long long v20 = [v19 collectionView:v18 evaluateFactoryForSupplementaryElementOfKind:v11 atIndexPath:v17 isRecursive:1];

      if (v20) {
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  v22.receiver = self;
  v22.super_class = (Class)GKCollectionViewAggregateDataSource;
  long long v20 = [(GKCollectionViewDataSource *)&v22 collectionView:v10 evaluateFactoryForSupplementaryElementOfKind:v11 atIndexPath:v13 isRecursive:0];
LABEL_7:

  return v20;
}

- (id)createMetricsTreeWithGridLayout:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)GKCollectionViewAggregateDataSource;
  uint64_t v5 = [(GKCollectionViewDataSource *)&v21 createMetricsTreeWithGridLayout:v4];
  BOOL v6 = [v4 collectionView];
  int64_t v7 = [(GKCollectionViewAggregateDataSource *)self numberOfSectionsInCollectionView:v6];

  id v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableArray count](self->_mappings, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = self->_mappings;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        char v14 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dataSource", (void)v17);
        long long v15 = [v14 createMetricsTreeWithGridLayout:v4];

        [v8 addObject:v15];
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v11);
  }

  [v5 setChildMetrics:v8];
  objc_msgSend(v5, "setLocalSectionRange:", 0, v7);

  return v5;
}

- (void)collectionViewWillBecomeActive:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GKCollectionViewAggregateDataSource;
  [(GKCollectionViewDataSource *)&v15 collectionViewWillBecomeActive:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [(GKCollectionViewAggregateDataSource *)self allDataSources];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v10 collectionViewWillBecomeActive:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)collectionViewDidBecomeInactive:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GKCollectionViewAggregateDataSource;
  [(GKCollectionViewDataSource *)&v15 collectionViewDidBecomeInactive:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [(GKCollectionViewAggregateDataSource *)self allDataSources];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v10 collectionViewDidBecomeInactive:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }
}

- (id)allDataSources
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMapTable count](self->_dataSourceToMappings, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_dataSourceToMappings;
  uint64_t v5 = [(NSMapTable *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = -[NSMapTable objectForKeyedSubscript:](self->_dataSourceToMappings, "objectForKeyedSubscript:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        uint64_t v10 = [v9 dataSource];
        [v3 addObject:v10];
      }
      uint64_t v6 = [(NSMapTable *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)itemAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[GKCollectionViewAggregateDataSource mappingForGlobalSection:](self, "mappingForGlobalSection:", [v4 section]);
  uint64_t v6 = [v5 localIndexPathForGlobalIndexPath:v4];

  uint64_t v7 = [v5 dataSource];
  uint64_t v8 = [v7 itemAtIndexPath:v6];

  return v8;
}

- (id)indexPathsForItem:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v16 = [MEMORY[0x1E4F1CA48] array];
  [(GKCollectionViewAggregateDataSource *)self allDataSources];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = v22 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v11 = [(GKCollectionViewAggregateDataSource *)self mappingForDataSource:v10];
        uint64_t v12 = [v10 indexPathsForItem:v4];
        if (v12)
        {
          long long v13 = (void *)v12;
          v17[0] = MEMORY[0x1E4F143A8];
          v17[1] = 3221225472;
          v17[2] = __57__GKCollectionViewAggregateDataSource_indexPathsForItem___block_invoke;
          v17[3] = &unk_1E5F66FA8;
          id v18 = v11;
          long long v14 = [v13 _gkMapWithBlock:v17];

          [v16 addObjectsFromArray:v14];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  return v16;
}

uint64_t __57__GKCollectionViewAggregateDataSource_indexPathsForItem___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) globalIndexPathForLocalIndexPath:a2];
}

- (BOOL)item:(id)a3 matchesSearchTerms:(id)a4 inSection:(int64_t)a5
{
  globalSectionToMappings = self->_globalSectionToMappings;
  uint64_t v8 = NSNumber;
  id v9 = a4;
  id v10 = a3;
  long long v11 = [v8 numberWithInteger:a5];
  uint64_t v12 = [(NSMutableDictionary *)globalSectionToMappings objectForKeyedSubscript:v11];

  long long v13 = [v12 dataSource];
  LOBYTE(a5) = objc_msgSend(v13, "item:matchesSearchTerms:inSection:", v10, v9, objc_msgSend(v12, "localSectionForGlobalSection:", a5));

  return a5;
}

- (void)configureCollectionView:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(GKCollectionViewAggregateDataSource *)self updateMappings];
  uint64_t v5 = [(GKCollectionViewAggregateDataSource *)self allDataSources];
  v18.receiver = self;
  v18.super_class = (Class)GKCollectionViewAggregateDataSource;
  [(GKCollectionViewDataSource *)&v18 configureCollectionView:v4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v12 = -[GKCollectionViewAggregateDataSource mappingForDataSource:](self, "mappingForDataSource:", v11, (void)v14);
        long long v13 = [(GKCollectionViewAggregateDataSource *)self wrapperForView:v4 mapping:v12];
        [v11 configureCollectionView:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v8);
  }
}

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4 updateNotifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F63828] updateGroup];
  long long v11 = [(GKCollectionViewAggregateDataSource *)self allDataSources];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __90__GKCollectionViewAggregateDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke;
  v19[3] = &unk_1E5F66FD0;
  id v12 = v10;
  unsigned int v22 = a3;
  id v20 = v12;
  id v21 = v8;
  id v13 = v8;
  [v11 enumerateObjectsUsingBlock:v19];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __90__GKCollectionViewAggregateDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke_3;
  v16[3] = &unk_1E5F63350;
  id v17 = v9;
  id v18 = v12;
  id v14 = v12;
  id v15 = v9;
  [v14 join:v16];
}

void __90__GKCollectionViewAggregateDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __90__GKCollectionViewAggregateDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke_2;
  v6[3] = &unk_1E5F65B50;
  id v7 = v3;
  int v9 = *(_DWORD *)(a1 + 48);
  id v4 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 performOnQueue:MEMORY[0x1E4F14428] block:v6];
}

uint64_t __90__GKCollectionViewAggregateDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) refreshContentsForDataType:*(unsigned int *)(a1 + 48) userInfo:*(void *)(a1 + 40) updateNotifier:a2];
}

uint64_t __90__GKCollectionViewAggregateDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) addUpdatesFromGroup:*(void *)(a1 + 40)];
}

- (void)removeItemAtIndexPath:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[GKCollectionViewAggregateDataSource mappingForGlobalSection:](self, "mappingForGlobalSection:", [v7 section]);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [v10 localIndexPathForGlobalIndexPath:v7];

  int v9 = [v10 dataSource];
  [v9 removeItemAtIndexPath:v8 completionHandler:v6];
}

- (void)dataSource:(id)a3 didInsertItemsAtIndexPaths:(id)a4
{
  id v5 = [(GKCollectionViewAggregateDataSource *)self globalIndexPathsForLocal:a4 dataSource:a3];
  [(GKCollectionViewDataSource *)self notifyItemsInsertedAtIndexPaths:v5];
}

- (void)dataSource:(id)a3 didRemoveItemsAtIndexPaths:(id)a4
{
  id v5 = [(GKCollectionViewAggregateDataSource *)self globalIndexPathsForLocal:a4 dataSource:a3];
  [(GKCollectionViewDataSource *)self notifyItemsRemovedAtIndexPaths:v5];
}

- (void)dataSource:(id)a3 didRefreshItemsAtIndexPaths:(id)a4
{
  id v5 = [(GKCollectionViewAggregateDataSource *)self globalIndexPathsForLocal:a4 dataSource:a3];
  [(GKCollectionViewDataSource *)self notifyItemsRefreshedAtIndexPaths:v5];
}

- (void)dataSource:(id)a3 didMoveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v12 = [(GKCollectionViewAggregateDataSource *)self mappingForDataSource:a3];
  id v10 = [v12 globalIndexPathForLocalIndexPath:v9];

  long long v11 = [v12 globalIndexPathForLocalIndexPath:v8];

  [(GKCollectionViewDataSource *)self notifyItemMovedFromIndexPath:v10 toIndexPaths:v11];
}

- (void)dataSource:(id)a3 didInsertSections:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = a3;
    [(GKCollectionViewAggregateDataSource *)self updateMappings];
    id v8 = [(GKCollectionViewAggregateDataSource *)self globalSectionsForLocal:v6 dataSource:v7];

    [(GKCollectionViewDataSource *)self notifySectionsInserted:v8];
  }
}

- (void)dataSource:(id)a3 didRemoveSections:(id)a4
{
  if (a4)
  {
    id v5 = [(GKCollectionViewAggregateDataSource *)self globalSectionsForLocal:a4 dataSource:a3];
    [(GKCollectionViewDataSource *)self notifySectionsRemoved:v5];
    [(GKCollectionViewAggregateDataSource *)self updateMappings];
  }
}

- (void)dataSource:(id)a3 didRefreshSections:(id)a4
{
  if (a4)
  {
    id v5 = [(GKCollectionViewAggregateDataSource *)self globalSectionsForLocal:a4 dataSource:a3];
    [(GKCollectionViewDataSource *)self notifySectionsRefreshed:v5];
    [(GKCollectionViewAggregateDataSource *)self updateMappings];
  }
}

- (void)dataSource:(id)a3 didMoveSection:(int64_t)a4 toSection:(int64_t)a5
{
  id v8 = [(GKCollectionViewAggregateDataSource *)self mappingForDataSource:a3];
  -[GKCollectionViewDataSource notifySectionMovedFrom:to:](self, "notifySectionMovedFrom:to:", [v8 globalSectionForLocalSection:a4], objc_msgSend(v8, "globalSectionForLocalSection:", a5));
  [(GKCollectionViewAggregateDataSource *)self updateMappings];
}

- (void)dataSource:(id)a3 performBatchUpdate:(id)a4 complete:(id)a5
{
}

- (BOOL)containsDataSource:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(GKCollectionViewAggregateDataSource *)self allDataSources];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "containsDataSource:", v4, (void)v10))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSMutableArray)mappings
{
  return self->_mappings;
}

- (void)setMappings:(id)a3
{
}

- (NSMapTable)dataSourceToMappings
{
  return self->_dataSourceToMappings;
}

- (void)setDataSourceToMappings:(id)a3
{
}

- (NSMutableDictionary)globalSectionToMappings
{
  return self->_globalSectionToMappings;
}

- (void)setGlobalSectionToMappings:(id)a3
{
}

- (unint64_t)sectionCount
{
  return self->_sectionCount;
}

- (void)setSectionCount:(unint64_t)a3
{
  self->_unint64_t sectionCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalSectionToMappings, 0);
  objc_storeStrong((id *)&self->_dataSourceToMappings, 0);

  objc_storeStrong((id *)&self->_mappings, 0);
}

@end