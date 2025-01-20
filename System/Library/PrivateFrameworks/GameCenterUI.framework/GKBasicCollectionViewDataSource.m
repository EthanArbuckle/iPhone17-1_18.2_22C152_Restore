@interface GKBasicCollectionViewDataSource
- (GKBasicCollectionViewDataSource)init;
- (NSArray)items;
- (NSPredicate)filterPredicate;
- (SEL)showAllAction;
- (_NSRange)preloadedRange;
- (id)_gkDescriptionWithChildren:(int64_t)a3;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)indexPathsForItem:(id)a3;
- (id)itemAtIndexPath:(id)a3;
- (id)itemsAtIndexes:(id)a3;
- (id)sectionTitle;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)countOfItems;
- (unint64_t)pageSize;
- (void)collectionViewDidBecomeInactive:(id)a3;
- (void)configureCollectionView:(id)a3;
- (void)insertItems:(id)a3 atIndexes:(id)a4;
- (void)preloadImagesForItems:(id)a3 startingAtIndex:(unint64_t)a4 loadBlock:(id)a5;
- (void)removeItemAtIndexPath:(id)a3 completionHandler:(id)a4;
- (void)removeItemsAtIndexes:(id)a3;
- (void)replaceItemsAtIndexes:(id)a3 withItems:(id)a4;
- (void)setFilterPredicate:(id)a3;
- (void)setItems:(id)a3;
- (void)setItemsNoNotify:(id)a3;
- (void)setPageSize:(unint64_t)a3;
- (void)setPreloadedRange:(_NSRange)a3;
- (void)setShowAllAction:(SEL)a3;
@end

@implementation GKBasicCollectionViewDataSource

- (GKBasicCollectionViewDataSource)init
{
  v3.receiver = self;
  v3.super_class = (Class)GKBasicCollectionViewDataSource;
  result = [(GKCollectionViewDataSource *)&v3 init];
  if (result) {
    result->_pageSize = 20;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setItemsNoNotify:self->_items];
  [v4 setFilterPredicate:self->_filterPredicate];
  [v4 setPageSize:self->_pageSize];
  objc_msgSend(v4, "setPreloadedRange:", self->_preloadedRange.location, self->_preloadedRange.length);
  return v4;
}

- (id)_gkDescriptionWithChildren:(int64_t)a3
{
  v5 = [MEMORY[0x1E4F28E78] string];
  v6 = _gkTabStringForTabLevel();
  v13.receiver = self;
  v13.super_class = (Class)GKBasicCollectionViewDataSource;
  v7 = [(GKCollectionViewDataSource *)&v13 _gkDescriptionWithChildren:a3];
  v8 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v9 = [v7 stringByTrimmingCharactersInSet:v8];

  [v5 appendFormat:@"%@%@", v6, v9];
  filterPredicate = self->_filterPredicate;
  if (filterPredicate)
  {
    [v5 appendFormat:@"%@    predicate: %@\n", v6, filterPredicate];
    [v5 appendFormat:@"%@}\n", v6];
  }
  id v11 = (id)_gkUnicodifyDescription();

  return v5;
}

- (void)collectionViewDidBecomeInactive:(id)a3
{
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if (a4) {
    return 0;
  }
  else {
    return [(NSArray *)self->_items count];
  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (void)removeItemAtIndexPath:(id)a3 completionHandler:(id)a4
{
  v7 = (void (**)(id, void))a4;
  v6 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(a3, "item"));
  [(GKBasicCollectionViewDataSource *)self removeItemsAtIndexes:v6];
  if (v7) {
    v7[2](v7, 0);
  }
}

- (id)itemAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 item];
  if (v5 >= [(NSArray *)self->_items count])
  {
    v6 = 0;
  }
  else
  {
    v6 = -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", [v4 item]);
  }

  return v6;
}

- (id)indexPathsForItem:(id)a3
{
  id v4 = a3;
  items = self->_items;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__GKBasicCollectionViewDataSource_indexPathsForItem___block_invoke;
  v9[3] = &unk_1E5F645D8;
  id v10 = v4;
  id v6 = v4;
  v7 = [(NSArray *)items _gkFilterWithBlock:v9];

  return v7;
}

id __53__GKBasicCollectionViewDataSource_indexPathsForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if ([a2 isEqual:*(void *)(a1 + 32)])
  {
    id v4 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:0];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)GKBasicCollectionViewDataSource;
  id v11 = [(GKCollectionViewDataSource *)&v17 collectionView:v8 viewForSupplementaryElementOfKind:v9 atIndexPath:v10];
  if (!v11)
  {
    id v11 = [v8 _gkDequeueSupplementaryViewForClass:objc_opt_class() ofKind:v9 forIndexPath:v10];
    v12 = [(GKBasicCollectionViewDataSource *)self sectionTitle];
    [v11 setLeftText:v12];

    if (([v9 isEqualToString:@"SectionHeader"] & 1) == 0)
    {
      objc_super v13 = (NSObject **)MEMORY[0x1E4F63860];
      v14 = *MEMORY[0x1E4F63860];
      if (!*MEMORY[0x1E4F63860])
      {
        id v15 = (id)GKOSLoggers();
        v14 = *v13;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[GKBasicCollectionViewDataSource collectionView:viewForSupplementaryElementOfKind:atIndexPath:]((uint64_t)v9, v14);
      }
    }
  }

  return v11;
}

- (void)configureCollectionView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GKBasicCollectionViewDataSource;
  id v3 = a3;
  [(GKCollectionViewDataSource *)&v4 configureCollectionView:v3];
  objc_msgSend(v3, "_gkRegisterClass:forSupplementaryViewOfKind:", objc_opt_class(), @"SectionHeader", v4.receiver, v4.super_class);
}

- (id)sectionTitle
{
  v2 = NSString;
  id v3 = [NSString stringWithFormat:@"%@ needs to implement me!", objc_opt_class()];
  objc_super v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKBasicCollectionViewDataSource.m"];
  id v5 = [v4 lastPathComponent];
  id v6 = [v2 stringWithFormat:@"%@ (NO)\n[%s (%s:%d)]", v3, "-[GKBasicCollectionViewDataSource sectionTitle]", objc_msgSend(v5, "UTF8String"), 136];

  [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v6 format];
  return 0;
}

- (void)setItemsNoNotify:(id)a3
{
  objc_super v4 = (NSArray *)a3;
  if (self->_items != v4)
  {
    v7 = v4;
    if (self->_filterPredicate)
    {
      -[NSArray filteredArrayUsingPredicate:](v4, "filteredArrayUsingPredicate:");
      id v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v5 = (NSArray *)[(NSArray *)v4 copy];
    }
    items = self->_items;
    self->_items = v5;

    self->_preloadedRange.location = 0;
    self->_preloadedRange.length = 0;
    objc_super v4 = v7;
  }
}

- (void)setItems:(id)a3
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  objc_super v4 = (NSArray *)a3;
  v66 = self;
  if (self->_items != v4)
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:");
    id v6 = [MEMORY[0x1E4F1CA80] setWithArray:v4];
    uint64_t v7 = [(NSArray *)v4 count];
    uint64_t v8 = [v6 count];
    id v9 = (NSObject **)MEMORY[0x1E4F63860];
    if (v7 != v8)
    {
      id v10 = *MEMORY[0x1E4F63860];
      if (!*MEMORY[0x1E4F63860])
      {
        id v11 = (id)GKOSLoggers();
        id v10 = *v9;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v12 = NSNumber;
        objc_super v13 = v10;
        v14 = objc_msgSend(v12, "numberWithUnsignedInteger:", -[NSArray count](v4, "count") - objc_msgSend(v6, "count"));
        id v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](v4, "count"));
        v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
        *(_DWORD *)buf = 138412802;
        v80 = v14;
        __int16 v81 = 2112;
        v82 = v15;
        __int16 v83 = 2112;
        v84 = v16;
        _os_log_impl(&dword_1AF250000, v13, OS_LOG_TYPE_INFO, "duplicate new items detected: %@ (%@ vs %@)", buf, 0x20u);
      }
    }
    NSUInteger v17 = [(NSArray *)self->_items count];
    if (v17 != [v5 count])
    {
      v18 = *v9;
      if (!*v9)
      {
        id v19 = (id)GKOSLoggers();
        v18 = *v9;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v20 = NSNumber;
        items = self->_items;
        v22 = v18;
        v23 = objc_msgSend(v20, "numberWithUnsignedInteger:", -[NSArray count](items, "count") - objc_msgSend(v5, "count"));
        v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self->_items, "count"));
        v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
        *(_DWORD *)buf = 138412802;
        v80 = v23;
        __int16 v81 = 2112;
        v82 = v24;
        __int16 v83 = 2112;
        v84 = v25;
        _os_log_impl(&dword_1AF250000, v22, OS_LOG_TYPE_INFO, "duplicate old items detected: %@ (%@ vs %@)", buf, 0x20u);
      }
    }
    v26 = (void *)[v5 mutableCopy];
    [v26 minusSet:v6];
    v65 = (void *)[v6 mutableCopy];
    [v65 minusSet:v5];
    v27 = (void *)[v6 mutableCopy];
    v62 = v5;
    [v27 intersectSet:v5];
    v63 = (void *)[v27 mutableCopy];
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    obuint64_t j = v27;
    uint64_t v28 = [obj countByEnumeratingWithState:&v75 objects:v95 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v76;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v76 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v32 = *(void *)(*((void *)&v75 + 1) + 8 * i);
          v33 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", -[NSArray indexOfObject:](v66->_items, "indexOfObject:", v32), 0);
          v34 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", -[NSArray indexOfObject:](v4, "indexOfObject:", v32), 0);
          if (v33 == v34)
          {
            [v63 removeObject:v32];
          }
          else
          {
            [v26 addObject:v32];
            [v65 addObject:v32];
          }
        }
        uint64_t v29 = [obj countByEnumeratingWithState:&v75 objects:v95 count:16];
      }
      while (v29);
    }

    v35 = [MEMORY[0x1E4F1CA48] array];
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v36 = v26;
    uint64_t v37 = [v36 countByEnumeratingWithState:&v71 objects:v94 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v72;
      do
      {
        for (uint64_t j = 0; j != v38; ++j)
        {
          if (*(void *)v72 != v39) {
            objc_enumerationMutation(v36);
          }
          v41 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", -[NSArray indexOfObject:](v66->_items, "indexOfObject:", *(void *)(*((void *)&v71 + 1) + 8 * j)), 0);
          [v35 addObject:v41];
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v71 objects:v94 count:16];
      }
      while (v38);
    }
    id v61 = v36;

    v42 = [v35 sortedArrayUsingComparator:&__block_literal_global_18];
    v43 = [v42 reverseObjectEnumerator];
    v44 = [v43 allObjects];
    v45 = (void *)[v44 mutableCopy];

    v46 = [MEMORY[0x1E4F1CA48] array];
    v47 = [MEMORY[0x1E4F1CA48] array];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v48 = v65;
    uint64_t v49 = [v48 countByEnumeratingWithState:&v67 objects:v93 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v68;
      do
      {
        for (uint64_t k = 0; k != v50; ++k)
        {
          if (*(void *)v68 != v51) {
            objc_enumerationMutation(v48);
          }
          v53 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", -[NSArray indexOfObject:](v4, "indexOfObject:", *(void *)(*((void *)&v67 + 1) + 8 * k), v61), 0);
          int v54 = [v45 containsObject:v53];
          v55 = v46;
          if (v54)
          {
            [v45 removeObject:v53];
            v55 = v47;
          }
          [v55 addObject:v53];
        }
        uint64_t v50 = [v48 countByEnumeratingWithState:&v67 objects:v93 count:16];
      }
      while (v50);
    }

    [v46 sortUsingComparator:&__block_literal_global_65];
    if (v66->_filterPredicate)
    {
      uint64_t v56 = -[NSArray filteredArrayUsingPredicate:](v4, "filteredArrayUsingPredicate:");
    }
    else
    {
      uint64_t v56 = [(NSArray *)v4 copy];
    }
    v57 = v61;
    v58 = v66->_items;
    v66->_items = (NSArray *)v56;

    v66->_preloadedRange.location = 0;
    v66->_preloadedRange.length = 0;
    if (!*MEMORY[0x1E4F63860]) {
      id v59 = (id)GKOSLoggers();
    }
    v60 = *MEMORY[0x1E4F63838];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63838], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413826;
      v80 = v62;
      __int16 v81 = 2112;
      v82 = v6;
      __int16 v83 = 2112;
      v84 = v45;
      __int16 v85 = 2112;
      id v86 = v61;
      __int16 v87 = 2112;
      v88 = v46;
      __int16 v89 = 2112;
      id v90 = v48;
      __int16 v91 = 2112;
      v92 = v47;
      _os_log_debug_impl(&dword_1AF250000, v60, OS_LOG_TYPE_DEBUG, "GKBasicCollectionViewDataSource setting items. \noldItems: %@\nnewItems:%@ \ndeletedIndexPath: %@, deletedItems: %@\ninsertedIndexPaths: %@, insertedItems: %@\nrefreshedIndexPaths: %@", buf, 0x48u);
    }
    if (objc_msgSend(v45, "count", v61)) {
      [(GKCollectionViewDataSource *)v66 notifyItemsRemovedAtIndexPaths:v45];
    }
    if ([v46 count]) {
      [(GKCollectionViewDataSource *)v66 notifyItemsInsertedAtIndexPaths:v46];
    }
    if ([v47 count]) {
      [(GKCollectionViewDataSource *)v66 notifyItemsRefreshedAtIndexPaths:v47];
    }
  }
}

uint64_t __44__GKBasicCollectionViewDataSource_setItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __44__GKBasicCollectionViewDataSource_setItems___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (unint64_t)countOfItems
{
  return [(NSArray *)self->_items count];
}

- (id)itemsAtIndexes:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__GKBasicCollectionViewDataSource_itemsAtIndexes___block_invoke;
  v11[3] = &unk_1E5F63468;
  v11[4] = self;
  id v7 = v6;
  id v12 = v7;
  [v5 enumerateIndexesUsingBlock:v11];

  uint64_t v8 = v12;
  id v9 = v7;

  return v9;
}

void __50__GKBasicCollectionViewDataSource_itemsAtIndexes___block_invoke(uint64_t a1, unint64_t a2)
{
  if ([*(id *)(*(void *)(a1 + 32) + 72) count] > a2)
  {
    objc_super v4 = *(void **)(a1 + 40);
    id v5 = [*(id *)(*(void *)(a1 + 32) + 72) objectAtIndexedSubscript:a2];
    [v4 addObject:v5];
  }
}

- (void)insertItems:(id)a3 atIndexes:(id)a4
{
  items = self->_items;
  id v7 = a4;
  id v8 = a3;
  id v9 = (NSArray *)[(NSArray *)items mutableCopy];
  [(NSArray *)v9 insertObjects:v8 atIndexes:v7];

  id v10 = self->_items;
  self->_items = v9;
  id v11 = v9;

  id v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__GKBasicCollectionViewDataSource_insertItems_atIndexes___block_invoke;
  v14[3] = &unk_1E5F64620;
  id v15 = v12;
  id v13 = v12;
  [v7 enumerateIndexesUsingBlock:v14];

  [(GKCollectionViewDataSource *)self notifyItemsInsertedAtIndexPaths:v13];
}

void __57__GKBasicCollectionViewDataSource_insertItems_atIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28D58] indexPathForItem:a2 inSection:0];
  [v2 addObject:v3];
}

- (void)removeItemsAtIndexes:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(NSArray *)self->_items count];
  uint64_t v6 = v5 - [v4 count];
  if (v6 < 1) {
    id v7 = 0;
  }
  else {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v6];
  }
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  id v24 = &__block_literal_global_69;
  uint64_t v8 = [&__block_literal_global_69 copy];
  id v9 = (void *)v20[5];
  v20[5] = v8;

  items = self->_items;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__GKBasicCollectionViewDataSource_removeItemsAtIndexes___block_invoke_2;
  v14[3] = &unk_1E5F64698;
  v18 = &v19;
  id v11 = v4;
  id v15 = v11;
  v16 = self;
  id v12 = v7;
  id v17 = v12;
  [(NSArray *)items enumerateObjectsUsingBlock:v14];
  objc_storeStrong((id *)&self->_items, v7);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__GKBasicCollectionViewDataSource_removeItemsAtIndexes___block_invoke_5;
  v13[3] = &unk_1E5F632D8;
  v13[4] = &v19;
  [(GKCollectionViewDataSource *)self notifyBatchUpdate:v13];

  _Block_object_dispose(&v19, 8);
}

void __56__GKBasicCollectionViewDataSource_removeItemsAtIndexes___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = _Block_copy(*(const void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  if ([*(id *)(a1 + 32) containsIndex:a3])
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __56__GKBasicCollectionViewDataSource_removeItemsAtIndexes___block_invoke_3;
    v20[3] = &unk_1E5F64648;
    id v7 = (id *)v21;
    id v8 = v6;
    v20[4] = *(void *)(a1 + 40);
    v21[0] = v8;
    v21[1] = a3;
    id v9 = v20;
  }
  else
  {
    uint64_t v10 = [*(id *)(a1 + 48) count];
    [*(id *)(a1 + 48) addObject:v5];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__GKBasicCollectionViewDataSource_removeItemsAtIndexes___block_invoke_4;
    aBlock[3] = &unk_1E5F64670;
    id v7 = (id *)v19;
    id v11 = v6;
    aBlock[4] = *(void *)(a1 + 40);
    v19[0] = v11;
    v19[1] = a3;
    v19[2] = v10;
    id v9 = aBlock;
  }
  id v12 = _Block_copy(v9);
  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
  v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  uint64_t v15 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) copy];
  uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
  id v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;
}

void __56__GKBasicCollectionViewDataSource_removeItemsAtIndexes___block_invoke_3(void *a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(a1[5] + 16))();
  v2 = (void *)a1[4];
  id v3 = [MEMORY[0x1E4F28D58] indexPathForItem:a1[6] inSection:0];
  v5[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v2 notifyItemsRemovedAtIndexPaths:v4];
}

void __56__GKBasicCollectionViewDataSource_removeItemsAtIndexes___block_invoke_4(void *a1)
{
  (*(void (**)(void))(a1[5] + 16))();
  v2 = (void *)a1[4];
  id v4 = [MEMORY[0x1E4F28D58] indexPathForItem:a1[6] inSection:0];
  id v3 = [MEMORY[0x1E4F28D58] indexPathForItem:a1[7] inSection:0];
  [v2 notifyItemMovedFromIndexPath:v4 toIndexPaths:v3];
}

uint64_t __56__GKBasicCollectionViewDataSource_removeItemsAtIndexes___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16))();
}

- (void)replaceItemsAtIndexes:(id)a3 withItems:(id)a4
{
  items = self->_items;
  id v7 = a4;
  id v8 = a3;
  id v9 = (NSArray *)[(NSArray *)items mutableCopy];
  [(NSArray *)v9 replaceObjectsAtIndexes:v8 withObjects:v7];

  uint64_t v10 = self->_items;
  self->_items = v9;
  id v11 = v9;

  id v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__GKBasicCollectionViewDataSource_replaceItemsAtIndexes_withItems___block_invoke;
  v14[3] = &unk_1E5F64620;
  id v15 = v12;
  id v13 = v12;
  [v8 enumerateIndexesUsingBlock:v14];

  [(GKCollectionViewDataSource *)self notifyItemsRefreshedAtIndexPaths:v13];
}

void __67__GKBasicCollectionViewDataSource_replaceItemsAtIndexes_withItems___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28D58] indexPathForItem:a2 inSection:0];
  [v2 addObject:v3];
}

- (void)preloadImagesForItems:(id)a3 startingAtIndex:(unint64_t)a4 loadBlock:(id)a5
{
  id v17 = a3;
  id v8 = (void (**)(id, void *))a5;
  if (v8 && [v17 count])
  {
    p_preloadedRange = &self->_preloadedRange;
    NSUInteger location = self->_preloadedRange.location;
    NSUInteger length = self->_preloadedRange.length;
    if (a4 < location || a4 - location >= length)
    {
      NSUInteger v13 = length + location;
      NSUInteger v14 = [(GKBasicCollectionViewDataSource *)self pageSize];
      uint64_t v15 = [v17 count];
      if (v14 >= v15 - v13) {
        NSUInteger v14 = v15 - v13;
      }
      v19.NSUInteger location = v13;
      v19.NSUInteger length = v14;
      _NSRange *p_preloadedRange = NSUnionRange(*p_preloadedRange, v19);
      uint64_t v16 = objc_msgSend(v17, "subarrayWithRange:", v13, v14);
      v8[2](v8, v16);
    }
  }
}

- (NSArray)items
{
  return self->_items;
}

- (SEL)showAllAction
{
  if (self->_showAllAction) {
    return self->_showAllAction;
  }
  else {
    return 0;
  }
}

- (void)setShowAllAction:(SEL)a3
{
  if (a3) {
    id v3 = a3;
  }
  else {
    id v3 = 0;
  }
  self->_showAllAction = v3;
}

- (unint64_t)pageSize
{
  return self->_pageSize;
}

- (void)setPageSize:(unint64_t)a3
{
  self->_pageSize = a3;
}

- (_NSRange)preloadedRange
{
  p_preloadedRange = &self->_preloadedRange;
  NSUInteger location = self->_preloadedRange.location;
  NSUInteger length = p_preloadedRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setPreloadedRange:(_NSRange)a3
{
  self->_preloadedRange = a3;
}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (void)setFilterPredicate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterPredicate, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

- (void)collectionView:(uint64_t)a1 viewForSupplementaryElementOfKind:(NSObject *)a2 atIndexPath:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1AF250000, a2, OS_LOG_TYPE_DEBUG, "unexpected supplementary view kind encountered: %@", (uint8_t *)&v2, 0xCu);
}

@end