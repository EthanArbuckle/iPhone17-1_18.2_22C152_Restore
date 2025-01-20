@interface GKCollectionViewDataSource
- (BOOL)containsDataSource:(id)a3;
- (BOOL)isRootDataSource;
- (BOOL)isSearchable;
- (BOOL)item:(id)a3 matchesSearchTerms:(id)a4 inSection:(int64_t)a5;
- (GKCollectionViewDataSource)init;
- (GKCollectionViewDataSourceDelegate)delegate;
- (GKGridLayoutMetrics)dataSourceMetrics;
- (GKGridLayoutMetrics)dataSourceMetricsInternal;
- (GKSectionMetrics)defaultSectionMetrics;
- (GKSectionMetrics)defaultSectionMetricsInternal;
- (NSHashTable)listeners;
- (NSMutableDictionary)kindsToFactories;
- (NSMutableDictionary)sectionsToMetrics;
- (NSMutableDictionary)sectionsToSearchKeys;
- (NSString)defaultSearchKey;
- (NSString)description;
- (id)_gkDescriptionWithChildren:(int64_t)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 defaultViewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)collectionView:(id)a3 evaluateFactoryForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5 isRecursive:(BOOL)a6;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)createMetricsTreeWithGridLayout:(id)a3;
- (id)indexPathsForItem:(id)a3;
- (id)itemAtIndexPath:(id)a3;
- (id)localDescription;
- (id)metricsForSection:(int64_t)a3;
- (id)metricsForSectionInternal:(int64_t)a3;
- (id)searchKeyForSection:(int64_t)a3;
- (id)supplementaryViewFactoryForKind:(id)a3;
- (id)targetForAction:(SEL)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)totalItemCount;
- (unint64_t)sectionForDataSource:(id)a3;
- (void)configureCollectionView:(id)a3;
- (void)enumerateItemsAndIndexPathsUsingBlock:(id)a3;
- (void)loadDataWithCompletionHandlerAndError:(id)a3;
- (void)notifyBatchUpdate:(id)a3;
- (void)notifyBatchUpdate:(id)a3 complete:(id)a4;
- (void)notifyDidReloadData;
- (void)notifyItemMovedFromIndexPath:(id)a3 toIndexPaths:(id)a4;
- (void)notifyItemsInsertedAtIndexPaths:(id)a3;
- (void)notifyItemsRefreshedAtIndexPaths:(id)a3;
- (void)notifyItemsRemovedAtIndexPaths:(id)a3;
- (void)notifyPlaceholderUpdated:(BOOL)a3;
- (void)notifySectionMovedFrom:(int64_t)a3 to:(int64_t)a4;
- (void)notifySectionsInserted:(id)a3;
- (void)notifySectionsMovedWithItems;
- (void)notifySectionsRefreshed:(id)a3;
- (void)notifySectionsRemoved:(id)a3;
- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4 updateNotifier:(id)a5;
- (void)registerSupplementaryViewOfKind:(id)a3 withClass:(Class)a4 target:(id)a5 configurator:(SEL)a6;
- (void)registerSupplementaryViewOfKind:(id)a3 withFactory:(id)a4;
- (void)removeItemAtIndexPath:(id)a3 completionHandler:(id)a4;
- (void)setDataSourceMetrics:(id)a3;
- (void)setDataSourceMetricsInternal:(id)a3;
- (void)setDefaultSearchKey:(id)a3;
- (void)setDefaultSectionMetrics:(id)a3;
- (void)setDefaultSectionMetricsInternal:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setKindsToFactories:(id)a3;
- (void)setListeners:(id)a3;
- (void)setMetrics:(id)a3 forSection:(int64_t)a4;
- (void)setSearchKey:(id)a3 forSection:(int64_t)a4;
- (void)setSectionsToMetrics:(id)a3;
- (void)setSectionsToSearchKeys:(id)a3;
- (void)updateSupplementaryMetricsForKey:(id)a3 usingBlock:(id)a4;
@end

@implementation GKCollectionViewDataSource

- (GKCollectionViewDataSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)GKCollectionViewDataSource;
  v2 = [(GKCollectionViewDataSource *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    listeners = v2->_listeners;
    v2->_listeners = (NSHashTable *)v3;
  }
  return v2;
}

- (id)localDescription
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] string];
  v19.receiver = self;
  v19.super_class = (Class)GKCollectionViewDataSource;
  uint64_t v4 = [(GKCollectionViewDataSource *)&v19 description];
  v5 = (void *)v4;
  if (self->_defaultSearchKey)
  {
    objc_super v6 = NSString;
    v7 = _gkBeautifyVariableName();
    v8 = [v6 stringWithFormat:@" %@: %@", v7, self->_defaultSearchKey];
    [v3 appendFormat:@"%@%@", v5, v8];
  }
  else
  {
    [v3 appendFormat:@"%@%@", v4, &stru_1F07B2408];
  }

  int64_t v9 = [(GKCollectionViewDataSource *)self numberOfSectionsInCollectionView:0];
  if (v9 == 1)
  {
    v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[GKCollectionViewDataSource collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", 0, 0));
    [v3 appendFormat:@" %@ item(s)", v12];
  }
  else
  {
    uint64_t v10 = v9;
    if (v9)
    {
      v13 = [NSNumber numberWithInteger:v9];
      [v3 appendFormat:@" %@ sections: <", v13];

      if (v10 >= 1)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          int64_t v15 = [(GKCollectionViewDataSource *)self collectionView:0 numberOfItemsInSection:i];
          if (i) {
            v16 = @", ";
          }
          else {
            v16 = &stru_1F07B2408;
          }
          v17 = [NSNumber numberWithInteger:v15];
          [v3 appendFormat:@"%@%@", v16, v17];
        }
      }
      v11 = @">";
    }
    else
    {
      v11 = @" no sections";
    }
    [v3 appendString:v11];
  }

  return v3;
}

- (NSString)description
{
  return (NSString *)[(GKCollectionViewDataSource *)self _gkDescriptionWithChildren:0];
}

- (id)_gkDescriptionWithChildren:(int64_t)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  v5 = _gkTabStringForTabLevel();
  objc_super v6 = [MEMORY[0x1E4F28E78] string];
  v69.receiver = self;
  v69.super_class = (Class)GKCollectionViewDataSource;
  uint64_t v7 = [(GKCollectionViewDataSource *)&v69 description];
  v8 = (void *)v7;
  if (self->_defaultSearchKey)
  {
    int64_t v9 = NSString;
    uint64_t v10 = _gkBeautifyVariableName();
    v11 = [v9 stringWithFormat:@" %@: %@", v10, self->_defaultSearchKey];
    [v6 appendFormat:@"%@%@%@", v5, v8, v11];
  }
  else
  {
    [v6 appendFormat:@"%@%@%@", v5, v7, &stru_1F07B2408];
  }

  int64_t v12 = [(GKCollectionViewDataSource *)self numberOfSectionsInCollectionView:0];
  int64_t v57 = a3;
  if (v12 == 1)
  {
    v14 = objc_msgSend(NSNumber, "numberWithInteger:", -[GKCollectionViewDataSource collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", 0, 0));
    [v6 appendFormat:@" %@ item(s)", v14];
  }
  else
  {
    uint64_t v13 = v12;
    if (v12)
    {
      int64_t v15 = [NSNumber numberWithInteger:v12];
      [v6 appendFormat:@" %@ sections: <", v15];

      if (v13 >= 1)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          int64_t v17 = [(GKCollectionViewDataSource *)self collectionView:0 numberOfItemsInSection:i];
          if (i) {
            v18 = @", ";
          }
          else {
            v18 = &stru_1F07B2408;
          }
          objc_super v19 = [NSNumber numberWithInteger:v17];
          [v6 appendFormat:@"%@%@", v18, v19];
        }
      }
      [v6 appendString:@">"];
    }
    else
    {
      [v6 appendString:@" no sections"];
    }
  }
  v20 = [(NSMutableDictionary *)self->_sectionsToSearchKeys allKeys];
  v21 = @" {\n";
  v60 = v6;
  if ([v20 count])
  {
    v22 = [NSString stringWithFormat:@"%@    %@sectionSearchKeys:\n", @" {\n", v5];
    [v6 appendString:v22];

    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v23 = v20;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v65 objects:v71 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v66;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v66 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v65 + 1) + 8 * j);
          v29 = [(NSMutableDictionary *)self->_sectionsToSearchKeys objectForKeyedSubscript:v28];
          uint64_t v54 = v28;
          objc_super v6 = v60;
          [v60 appendFormat:@"    %@%@ - %@", v5, v54, v29];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v65 objects:v71 count:16];
      }
      while (v25);
    }

    v21 = &stru_1F07B2408;
    a3 = v57;
  }
  dataSourceMetricsInternal = self->_dataSourceMetricsInternal;
  if (dataSourceMetricsInternal)
  {
    v31 = NSString;
    v32 = [(GKGridLayoutMetrics *)dataSourceMetricsInternal _gkDescriptionWithChildren:a3 + 2];
    v33 = [v31 stringWithFormat:@"%@    %@overallMetrics: {\n%@", v21, v5, v32];
    [v6 appendString:v33];

    [v6 appendFormat:@"%@    }\n", v5];
    v21 = &stru_1F07B2408;
  }
  defaultSectionMetricsInternal = self->_defaultSectionMetricsInternal;
  if (defaultSectionMetricsInternal)
  {
    v35 = NSString;
    v36 = [(GKGridLayoutMetrics *)defaultSectionMetricsInternal _gkDescriptionWithChildren:a3 + 2];
    v37 = [v35 stringWithFormat:@"%@    %@defaultSectionMetrics: {\n%@", v21, v5, v36];
    [v6 appendString:v37];

    [v6 appendFormat:@"%@    }\n", v5];
    v21 = &stru_1F07B2408;
  }
  v38 = [(NSMutableDictionary *)self->_sectionsToMetrics allKeys];

  if ([v38 count])
  {
    v59 = self;
    v39 = v5;
    v40 = [NSString stringWithFormat:@"%@    %@sectionMetrics: {\n", v21, v5];
    [v6 appendString:v40];

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    v56 = v38;
    obuint64_t j = v38;
    uint64_t v41 = [obj countByEnumeratingWithState:&v61 objects:v70 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v62;
      int64_t v44 = a3 + 2;
      do
      {
        for (uint64_t k = 0; k != v42; ++k)
        {
          if (*(void *)v62 != v43) {
            objc_enumerationMutation(obj);
          }
          uint64_t v46 = *(void *)(*((void *)&v61 + 1) + 8 * k);
          v47 = [(NSMutableDictionary *)v59->_sectionsToMetrics objectForKeyedSubscript:v46];
          v48 = [v47 _gkDescriptionWithChildren:v44];
          v49 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
          v50 = [v48 stringByTrimmingCharactersInSet:v49];

          uint64_t v55 = v46;
          objc_super v6 = v60;
          [v60 appendFormat:@"        %@%@ - %@", v39, v55, v50];
        }
        uint64_t v42 = [obj countByEnumeratingWithState:&v61 objects:v70 count:16];
      }
      while (v42);
    }

    v5 = v39;
    [v6 appendFormat:@"%@    }\n", v39];
    v21 = &stru_1F07B2408;
    v38 = v56;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v6, "appendFormat:", &stru_1F07B2408, v53);
  }
  else if (![(__CFString *)v21 length])
  {
    [v6 appendFormat:@"%@}\n", v5];
  }
  id v51 = (id)_gkUnicodifyDescription();

  return v6;
}

- (id)itemAtIndexPath:(id)a3
{
  uint64_t v3 = NSString;
  uint64_t v4 = [NSString stringWithFormat:@"%@ needs to implement me!", objc_opt_class()];
  v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewDataSource.m"];
  id v6 = [v5 lastPathComponent];
  uint64_t v7 = [v3 stringWithFormat:@"%@ (NO)\n[%s (%s:%d)]", v4, "-[GKCollectionViewDataSource itemAtIndexPath:]", objc_msgSend(v6, "UTF8String"), 310];

  [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v7 format];
  return 0;
}

- (id)indexPathsForItem:(id)a3
{
  uint64_t v3 = NSString;
  uint64_t v4 = [NSString stringWithFormat:@"%@ needs to implement me!", objc_opt_class()];
  v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewDataSource.m"];
  id v6 = [v5 lastPathComponent];
  uint64_t v7 = [v3 stringWithFormat:@"%@ (NO)\n[%s (%s:%d)]", v4, "-[GKCollectionViewDataSource indexPathsForItem:]", objc_msgSend(v6, "UTF8String"), 316];

  [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v7 format];
  return 0;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v4 = NSString;
  v5 = [NSString stringWithFormat:@"%@ needs to implement me!", objc_opt_class()];
  id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewDataSource.m"];
  id v7 = [v6 lastPathComponent];
  v8 = [v4 stringWithFormat:@"%@ (NO)\n[%s (%s:%d)]", v5, "-[GKCollectionViewDataSource collectionView:numberOfItemsInSection:]", objc_msgSend(v7, "UTF8String"), 327];

  [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v8 format];
  return 0;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v4 = NSString;
  v5 = [NSString stringWithFormat:@"%@ needs to implement me!", objc_opt_class()];
  id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewDataSource.m"];
  id v7 = [v6 lastPathComponent];
  v8 = [v4 stringWithFormat:@"%@ (NO)\n[%s (%s:%d)]", v5, "-[GKCollectionViewDataSource collectionView:cellForItemAtIndexPath:]", objc_msgSend(v7, "UTF8String"), 333];

  [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v8 format];
  return 0;
}

- (void)removeItemAtIndexPath:(id)a3 completionHandler:(id)a4
{
  uint64_t v4 = NSString;
  v5 = [NSString stringWithFormat:@"%@ needs to implement me!", objc_opt_class()];
  id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewDataSource.m"];
  id v7 = [v6 lastPathComponent];
  id v8 = [v4 stringWithFormat:@"%@ (NO)\n[%s (%s:%d)]", v5, "-[GKCollectionViewDataSource removeItemAtIndexPath:completionHandler:]", objc_msgSend(v7, "UTF8String"), 339];

  [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v8 format];
}

- (void)configureCollectionView:(id)a3
{
  id v4 = a3;
  if ([(GKCollectionViewDataSource *)self isRootDataSource])
  {
    [(id)objc_opt_class() registerSupplementaryViewClassesForKind:@"IncrementalReveal" withCollectionView:v4];
    [(id)objc_opt_class() registerSupplementaryViewClassesForKind:@"SearchBar" withCollectionView:v4];
    [v4 _gkRegisterClass:objc_opt_class() forSupplementaryViewOfKind:@"ClipArea"];
    [v4 _gkRegisterClass:objc_opt_class() forSupplementaryViewOfKind:@"SearchPlaceholderMetricKey"];
  }
}

- (unint64_t)sectionForDataSource:(id)a3
{
  return 0;
}

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4 updateNotifier:(id)a5
{
  id v6 = a5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__GKCollectionViewDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke;
  v8[3] = &unk_1E5F63240;
  id v9 = v6;
  id v7 = v6;
  [(GKCollectionViewDataSource *)self loadDataWithCompletionHandlerAndError:v8];
}

uint64_t __81__GKCollectionViewDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateError:a2];
}

- (BOOL)containsDataSource:(id)a3
{
  return a3 == self;
}

- (void)loadDataWithCompletionHandlerAndError:(id)a3
{
  uint64_t v3 = NSString;
  id v4 = [NSString stringWithFormat:@"%@ needs to implement me!", objc_opt_class()];
  v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewDataSource.m"];
  id v6 = [v5 lastPathComponent];
  id v7 = [v3 stringWithFormat:@"%@ (NO)\n[%s (%s:%d)]", v4, "-[GKCollectionViewDataSource loadDataWithCompletionHandlerAndError:]", objc_msgSend(v6, "UTF8String"), 378];

  [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v7 format];
}

- (id)searchKeyForSection:(int64_t)a3
{
  sectionsToSearchKeys = self->_sectionsToSearchKeys;
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  id v7 = [(NSMutableDictionary *)sectionsToSearchKeys objectForKeyedSubscript:v6];

  if (!v7)
  {
    id v7 = self->_defaultSearchKey;
    if (!v7)
    {
      id v8 = [(GKCollectionViewDataSource *)self delegate];
      while (1)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        id v7 = [v8 searchKeyForSection:a3];
        uint64_t v9 = [v8 delegate];

        id v8 = (void *)v9;
        if (v7)
        {
          id v8 = (void *)v9;
          goto LABEL_8;
        }
      }
      id v7 = 0;
LABEL_8:
    }
  }

  return v7;
}

- (void)setSearchKey:(id)a3 forSection:(int64_t)a4
{
  id v9 = a3;
  sectionsToSearchKeys = self->_sectionsToSearchKeys;
  if (!sectionsToSearchKeys)
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[GKCollectionViewDataSource numberOfSectionsInCollectionView:](self, "numberOfSectionsInCollectionView:", 0));
    [(GKCollectionViewDataSource *)self setSectionsToSearchKeys:v7];

    sectionsToSearchKeys = self->_sectionsToSearchKeys;
  }
  id v8 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)sectionsToSearchKeys setObject:v9 forKeyedSubscript:v8];
}

- (BOOL)item:(id)a3 matchesSearchTerms:(id)a4 inSection:(int64_t)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v8 && [v8 count])
  {
    v22 = v9;
    id v23 = [(GKCollectionViewDataSource *)self searchKeyForSection:a5];
    uint64_t v10 = v23;
    if ([v23 length])
    {
      v11 = [v24 valueForKeyPath:v23];
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v12 = v9;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v31;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v31 != v14) {
              objc_enumerationMutation(v12);
            }
            v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            if ([v16 length])
            {
              uint64_t v26 = 0;
              v27 = &v26;
              uint64_t v28 = 0x2020000000;
              char v29 = 0;
              uint64_t v17 = [v11 length];
              v25[0] = MEMORY[0x1E4F143A8];
              v25[1] = 3221225472;
              v25[2] = __64__GKCollectionViewDataSource_item_matchesSearchTerms_inSection___block_invoke;
              v25[3] = &unk_1E5F67070;
              v25[4] = v16;
              v25[5] = &v26;
              objc_msgSend(v11, "enumerateSubstringsInRange:options:usingBlock:", 0, v17, 1027, v25);
              int v18 = *((unsigned __int8 *)v27 + 24);
              _Block_object_dispose(&v26, 8);
              if (v18)
              {
                int v19 = 1;
                goto LABEL_17;
              }
            }
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
      int v19 = 0;
LABEL_17:

      uint64_t v10 = v23;
    }
    else
    {
      int v19 = 0;
    }

    BOOL v20 = v19 != 0;
    id v9 = v22;
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

uint64_t __64__GKCollectionViewDataSource_item_matchesSearchTerms_inSection___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t result = [a2 rangeOfString:*(void *)(a1 + 32) options:897];
  if (!result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a7 = 1;
  }
  return result;
}

- (void)enumerateItemsAndIndexPathsUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *, void *, unsigned char *))a3;
  uint64_t v21 = [(GKCollectionViewDataSource *)self numberOfSectionsInCollectionView:0];
  if (v21 >= 1)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0x1E4F28000uLL;
    id v23 = self;
    v22 = v4;
    while (1)
    {
      uint64_t v7 = [(GKCollectionViewDataSource *)self collectionView:0 numberOfItemsInSection:v5];
      if (v7 >= 1) {
        break;
      }
LABEL_9:
      if (++v5 == v21) {
        goto LABEL_10;
      }
    }
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    while (1)
    {
      unsigned __int8 v24 = 0;
      uint64_t v10 = [*(id *)(v6 + 3416) indexPathForItem:v9 inSection:v5];
      v11 = [(GKCollectionViewDataSource *)self itemAtIndexPath:v10];
      if (!v11)
      {
        id v12 = NSString;
        uint64_t v13 = [NSString stringWithFormat:@"Assertion failed"];
        [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewDataSource.m"];
        uint64_t v14 = v8;
        uint64_t v15 = v5;
        uint64_t v17 = v16 = v6;
        id v18 = [v17 lastPathComponent];
        int v19 = [v12 stringWithFormat:@"%@ (item != ((void *)0))\n[%s (%s:%d)]", v13, "-[GKCollectionViewDataSource enumerateItemsAndIndexPathsUsingBlock:]", objc_msgSend(v18, "UTF8String"), 456];

        unint64_t v6 = v16;
        uint64_t v5 = v15;
        uint64_t v8 = v14;
        id v4 = v22;

        [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v19 format];
        self = v23;
      }
      v4[2](v4, v11, v10, &v24);
      int v20 = v24;

      if (v20) {
        break;
      }
      if (v8 == ++v9) {
        goto LABEL_9;
      }
    }
  }
LABEL_10:
}

- (BOOL)isSearchable
{
  if ([(NSString *)self->_defaultSearchKey length]) {
    return 1;
  }
  uint64_t v3 = [(NSMutableDictionary *)self->_sectionsToSearchKeys allValues];
  uint64_t v4 = [v3 count];

  if (v4) {
    return 1;
  }
  uint64_t v6 = [(GKCollectionViewDataSource *)self numberOfSectionsInCollectionView:0];
  if (v6 >= 1)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    while (1)
    {
      uint64_t v9 = [(GKCollectionViewDataSource *)self dataSourceForSection:v8];
      uint64_t v10 = v9;
      if (v9 != self)
      {
        if ([(GKCollectionViewDataSource *)v9 isSearchable]) {
          break;
        }
      }

      if (v7 == ++v8) {
        return 0;
      }
    }

    return 1;
  }
  return 0;
}

- (GKGridLayoutMetrics)dataSourceMetrics
{
  dataSourceMetricsInternal = self->_dataSourceMetricsInternal;
  if (!dataSourceMetricsInternal)
  {
    uint64_t v4 = +[GKGridLayoutMetrics metrics];
    [(GKCollectionViewDataSource *)self setDataSourceMetricsInternal:v4];

    dataSourceMetricsInternal = self->_dataSourceMetricsInternal;
  }

  return dataSourceMetricsInternal;
}

- (void)setDataSourceMetrics:(id)a3
{
  id v4 = (id)[a3 copy];
  [(GKCollectionViewDataSource *)self setDataSourceMetricsInternal:v4];
}

- (void)updateSupplementaryMetricsForKey:(id)a3 usingBlock:(id)a4
{
  uint64_t v6 = (void (**)(id, void *))a4;
  id v7 = a3;
  id v9 = [(GKCollectionViewDataSource *)self dataSourceMetrics];
  uint64_t v8 = [v9 supplementaryMetricsForKey:v7];
  v6[2](v6, v8);

  [v9 replaceSupplementaryMetrics:v8 forKey:v7];
}

- (GKSectionMetrics)defaultSectionMetrics
{
  defaultSectionMetricsInternal = self->_defaultSectionMetricsInternal;
  if (!defaultSectionMetricsInternal)
  {
    id v4 = +[GKGridLayoutMetrics metrics];
    [(GKCollectionViewDataSource *)self setDefaultSectionMetricsInternal:v4];

    defaultSectionMetricsInternal = self->_defaultSectionMetricsInternal;
  }

  return defaultSectionMetricsInternal;
}

- (void)setDefaultSectionMetrics:(id)a3
{
  id v4 = (id)[a3 copy];
  [(GKCollectionViewDataSource *)self setDefaultSectionMetricsInternal:v4];
}

- (id)metricsForSection:(int64_t)a3
{
  if (a3 < 0)
  {
    uint64_t v5 = NSString;
    uint64_t v6 = [NSString stringWithFormat:@"Assertion failed"];
    id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewDataSource.m"];
    id v8 = [v7 lastPathComponent];
    id v9 = [v5 stringWithFormat:@"%@ (section >= 0)\n[%s (%s:%d)]", v6, "-[GKCollectionViewDataSource metricsForSection:]", objc_msgSend(v8, "UTF8String"), 530];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v9 format];
  }
  sectionsToMetrics = self->_sectionsToMetrics;
  v11 = [NSNumber numberWithInteger:a3];
  id v12 = [(NSMutableDictionary *)sectionsToMetrics objectForKeyedSubscript:v11];

  if (!v12)
  {
    id v12 = [(GKCollectionViewDataSource *)self defaultSectionMetrics];
  }

  return v12;
}

- (id)metricsForSectionInternal:(int64_t)a3
{
  if (a3 < 0)
  {
    uint64_t v5 = NSString;
    uint64_t v6 = [NSString stringWithFormat:@"Assertion failed"];
    id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewDataSource.m"];
    id v8 = [v7 lastPathComponent];
    id v9 = [v5 stringWithFormat:@"%@ (section >= 0)\n[%s (%s:%d)]", v6, "-[GKCollectionViewDataSource metricsForSectionInternal:]", objc_msgSend(v8, "UTF8String"), 539];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v9 format];
  }
  sectionsToMetrics = self->_sectionsToMetrics;
  v11 = [NSNumber numberWithInteger:a3];
  id v12 = [(NSMutableDictionary *)sectionsToMetrics objectForKeyedSubscript:v11];

  if (!v12)
  {
    id v12 = [(GKCollectionViewDataSource *)self defaultSectionMetricsInternal];
  }

  return v12;
}

- (void)setMetrics:(id)a3 forSection:(int64_t)a4
{
  id v10 = a3;
  sectionsToMetrics = self->_sectionsToMetrics;
  if (!sectionsToMetrics)
  {
    id v7 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    id v8 = self->_sectionsToMetrics;
    self->_sectionsToMetrics = v7;

    sectionsToMetrics = self->_sectionsToMetrics;
  }
  id v9 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)sectionsToMetrics setObject:v10 forKeyedSubscript:v9];
}

- (id)createMetricsTreeWithGridLayout:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GKCollectionViewDataSource *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(GKCollectionViewDataSource *)self delegate];
    [v7 updateMetrics];
  }
  id v8 = +[GKDataSourceMetrics dataSourceMetricsWithMetrics:self->_dataSourceMetricsInternal dataSource:self];
  id v9 = [v4 collectionView];
  [v8 configureCollectionView:v9];

  id v10 = [v4 collectionView];
  uint64_t v11 = [(GKCollectionViewDataSource *)self numberOfSectionsInCollectionView:v10];

  if (v11 >= 1)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      uint64_t v13 = [(GKCollectionViewDataSource *)self metricsForSectionInternal:i];
      if (v13)
      {
        [v8 setMetrics:v13 forSection:i];
        uint64_t v14 = [v4 collectionView];
        [v13 configureCollectionView:v14];
      }
    }
  }
  objc_msgSend(v8, "setLocalSectionRange:", 0, v11);

  return v8;
}

- (BOOL)isRootDataSource
{
  v2 = [(GKCollectionViewDataSource *)self delegate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)collectionView:(id)a3 defaultViewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(GKCollectionViewDataSource *)self isRootDataSource])
  {
LABEL_16:
    uint64_t v11 = 0;
    goto LABEL_17;
  }
  if ([v9 isEqualToString:@"IncrementalReveal"])
  {
    uint64_t v11 = [v8 _gkDequeueSupplementaryViewForClass:objc_opt_class() ofKind:v9 forIndexPath:v10];
    [v11 setShowMoreAction:sel_didTouchShowMore_];
    goto LABEL_17;
  }
  if (![v9 isEqualToString:@"SearchBar"])
  {
    if ([v9 isEqualToString:@"ClipArea"])
    {
      uint64_t v11 = [v8 _gkDequeueSupplementaryViewForClass:objc_opt_class() ofKind:v9 forIndexPath:v10];
      goto LABEL_17;
    }
    if ([v9 isEqualToString:@"SearchPlaceholderMetricKey"])
    {
      uint64_t v11 = [v8 _gkDequeueSupplementaryViewForClass:objc_opt_class() ofKind:v9 forIndexPath:v10];
      [v11 setNoContentTitle:@" "];
      long long v31 = GKGameCenterUIFrameworkBundle();
      long long v32 = GKGetLocalizedStringFromTableInBundle();
      [v11 setNoContentMessage:v32];

      [v11 setLoadingState:@"NoContentState"];
      [v11 setAlignment:1];
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  uint64_t v11 = [v8 _gkDequeueSupplementaryViewForClass:objc_opt_class() ofKind:v9 forIndexPath:v10];
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v14 = [WeakRetained conformsToProtocol:&unk_1F0857DB0];

  if ((v14 & 1) == 0)
  {
    uint64_t v15 = NSString;
    id v16 = objc_loadWeakRetained((id *)p_delegate);
    uint64_t v17 = [v15 stringWithFormat:@"%@ doesn't conform to UISearchBarDelegate", v16];
    id v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewDataSource.m"];
    id v19 = [v18 lastPathComponent];
    int v20 = [v15 stringWithFormat:@"%@ ([_delegate conformsToProtocol:@protocol(UISearchBarDelegate)])\n[%s (%s:%d)]", v17, "-[GKCollectionViewDataSource collectionView:defaultViewForSupplementaryElementOfKind:atIndexPath:]", objc_msgSend(v19, "UTF8String"), 592];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v20 format];
  }
  id v21 = objc_loadWeakRetained((id *)p_delegate);
  [v11 setDelegate:v21];

  id v22 = objc_loadWeakRetained((id *)p_delegate);
  char v23 = objc_opt_respondsToSelector();

  if (v23)
  {
    id v24 = objc_loadWeakRetained((id *)p_delegate);
    uint64_t v25 = [v24 performSelector:sel_activeSearchBar];

    [v25 resignFirstResponder];
    if (v25)
    {
      uint64_t v26 = [v25 text];
      uint64_t v27 = [v26 length];

      if (v27)
      {
        uint64_t v28 = [v25 text];
        char v29 = [v11 searchBar];
        [v29 setText:v28];

        long long v30 = [v11 searchBar];
        [v30 becomeFirstResponder];
      }
    }
  }
LABEL_17:

  return v11;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(GKCollectionViewDataSource *)self collectionView:v8 evaluateFactoryForSupplementaryElementOfKind:v9 atIndexPath:v10 isRecursive:0];
  if (!v11)
  {
    uint64_t v11 = [(GKCollectionViewDataSource *)self collectionView:v8 defaultViewForSupplementaryElementOfKind:v9 atIndexPath:v10];
  }

  return v11;
}

- (id)collectionView:(id)a3 evaluateFactoryForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5 isRecursive:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v9 collectionViewLayout];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [v12 attributesForSupplementaryIndexPath:v11];
    char v14 = [v13 supplementaryMetrics];
    if ([v14 reusableViewClass])
    {
      uint64_t v15 = [v14 reusableViewClass];
      id v16 = [v14 kind];
      uint64_t v17 = [v9 _gkDequeueSupplementaryViewForClass:v15 ofKind:v16 forIndexPath:v11];

      if (v17) {
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  id v18 = [(GKCollectionViewDataSource *)self supplementaryViewFactoryForKind:v10];
  uint64_t v17 = [v18 collectionView:v9 viewForSupplementaryElementOfKind:v10 atIndexPath:v11];

LABEL_7:

  return v17;
}

- (int64_t)totalItemCount
{
  int64_t v3 = [(GKCollectionViewDataSource *)self numberOfSectionsInCollectionView:0];
  if (!v3) {
    return 0;
  }
  int64_t v4 = v3;
  uint64_t v5 = 0;
  int64_t v6 = 0;
  do
    v6 += [(GKCollectionViewDataSource *)self collectionView:0 numberOfItemsInSection:v5++];
  while (v4 != v5);
  return v6;
}

- (void)notifyItemsInsertedAtIndexPaths:(id)a3
{
  id v5 = a3;
  int64_t v4 = [(GKCollectionViewDataSource *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 dataSource:self didInsertItemsAtIndexPaths:v5];
  }
}

- (void)notifyItemsRemovedAtIndexPaths:(id)a3
{
  id v5 = a3;
  int64_t v4 = [(GKCollectionViewDataSource *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 dataSource:self didRemoveItemsAtIndexPaths:v5];
  }
}

- (void)notifyItemsRefreshedAtIndexPaths:(id)a3
{
  id v5 = a3;
  int64_t v4 = [(GKCollectionViewDataSource *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 dataSource:self didRefreshItemsAtIndexPaths:v5];
  }
}

- (void)notifyItemMovedFromIndexPath:(id)a3 toIndexPaths:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(GKCollectionViewDataSource *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 dataSource:self didMoveItemAtIndexPath:v8 toIndexPath:v6];
  }
}

- (void)notifySectionsInserted:(id)a3
{
  id v5 = a3;
  int64_t v4 = [(GKCollectionViewDataSource *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 dataSource:self didInsertSections:v5];
  }
}

- (void)notifySectionsRemoved:(id)a3
{
  id v5 = a3;
  int64_t v4 = [(GKCollectionViewDataSource *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 dataSource:self didRemoveSections:v5];
  }
}

- (void)notifySectionsRefreshed:(id)a3
{
  id v5 = a3;
  int64_t v4 = [(GKCollectionViewDataSource *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 dataSource:self didRefreshSections:v5];
  }
}

- (void)notifySectionMovedFrom:(int64_t)a3 to:(int64_t)a4
{
  id v7 = [(GKCollectionViewDataSource *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 dataSource:self didMoveSection:a3 toSection:a4];
  }
}

- (void)notifySectionsMovedWithItems
{
  id v3 = [(GKCollectionViewDataSource *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 dataSourceDidMoveSectionsWithItems:self];
  }
}

- (void)notifyDidReloadData
{
  id v3 = [(GKCollectionViewDataSource *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 dataSourceDidReloadData:self];
  }
}

- (void)notifyPlaceholderUpdated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(GKCollectionViewDataSource *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 dataSource:self didUpdatePlaceholderVisibility:v3];
  }
}

- (void)notifyBatchUpdate:(id)a3
{
  id v5 = a3;
  int64_t v4 = [(GKCollectionViewDataSource *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 dataSource:self performBatchUpdate:v5 complete:0];
  }
}

- (void)notifyBatchUpdate:(id)a3 complete:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = [(GKCollectionViewDataSource *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v8 dataSource:self performBatchUpdate:v6 complete:v7];
  }
  else if (v7)
  {
    id v9 = (NSObject **)MEMORY[0x1E4F63860];
    id v10 = *MEMORY[0x1E4F63860];
    if (!*MEMORY[0x1E4F63860])
    {
      id v11 = (id)GKOSLoggers();
      id v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412546;
      uint64_t v13 = self;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      _os_log_impl(&dword_1AF250000, v10, OS_LOG_TYPE_INFO, "no delegate, completing immediately! (self:%@ delegate:%@)", (uint8_t *)&v12, 0x16u);
    }
    v7[2](v7);
  }
}

- (id)targetForAction:(SEL)a3
{
  int64_t v4 = [(GKCollectionViewDataSource *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = v4;
LABEL_5:
    id v6 = v5;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 targetForAction:a3];
    goto LABEL_5;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

- (GKCollectionViewDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GKCollectionViewDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)kindsToFactories
{
  return self->_kindsToFactories;
}

- (void)setKindsToFactories:(id)a3
{
}

- (NSHashTable)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
}

- (NSMutableDictionary)sectionsToMetrics
{
  return self->_sectionsToMetrics;
}

- (void)setSectionsToMetrics:(id)a3
{
}

- (NSMutableDictionary)sectionsToSearchKeys
{
  return self->_sectionsToSearchKeys;
}

- (void)setSectionsToSearchKeys:(id)a3
{
}

- (GKGridLayoutMetrics)dataSourceMetricsInternal
{
  return self->_dataSourceMetricsInternal;
}

- (void)setDataSourceMetricsInternal:(id)a3
{
}

- (GKSectionMetrics)defaultSectionMetricsInternal
{
  return self->_defaultSectionMetricsInternal;
}

- (void)setDefaultSectionMetricsInternal:(id)a3
{
}

- (NSString)defaultSearchKey
{
  return self->_defaultSearchKey;
}

- (void)setDefaultSearchKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultSearchKey, 0);
  objc_storeStrong((id *)&self->_defaultSectionMetricsInternal, 0);
  objc_storeStrong((id *)&self->_dataSourceMetricsInternal, 0);
  objc_storeStrong((id *)&self->_sectionsToSearchKeys, 0);
  objc_storeStrong((id *)&self->_sectionsToMetrics, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_kindsToFactories, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)registerSupplementaryViewOfKind:(id)a3 withFactory:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  kindsToFactories = self->_kindsToFactories;
  if (!kindsToFactories)
  {
    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v9 = self->_kindsToFactories;
    self->_kindsToFactories = v8;

    kindsToFactories = self->_kindsToFactories;
  }
  [(NSMutableDictionary *)kindsToFactories setObject:v6 forKeyedSubscript:v10];
}

- (void)registerSupplementaryViewOfKind:(id)a3 withClass:(Class)a4 target:(id)a5 configurator:(SEL)a6
{
  id v10 = a3;
  id v11 = +[GKSupplementaryViewFactory factoryForClass:a4 target:a5 configurator:a6];
  [(GKCollectionViewDataSource *)self registerSupplementaryViewOfKind:v10 withFactory:v11];
}

- (id)supplementaryViewFactoryForKind:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_kindsToFactories objectForKeyedSubscript:a3];
}

@end