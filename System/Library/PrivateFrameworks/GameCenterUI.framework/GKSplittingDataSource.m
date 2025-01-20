@interface GKSplittingDataSource
- (GKBasicCollectionViewDataSource)underlyingDataSource;
- (GKSplittingDataSource)init;
- (NSMutableDictionary)sectionToSectionInfo;
- (id)_gkDescriptionWithChildren:(int64_t)a3;
- (id)filteredItemsForRawItems:(id)a3;
- (id)indexPathsForItem:(id)a3;
- (id)itemAtIndexPath:(id)a3;
- (id)itemsForSection:(int64_t)a3;
- (id)sectionInfoForSection:(int64_t)a3;
- (id)titleForSection:(int64_t)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)sectionCount;
- (void)addSectionWithTitle:(id)a3 sortDescriptors:(id)a4;
- (void)collectionViewDidBecomeInactive:(id)a3;
- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4 updateNotifier:(id)a5;
- (void)removeAllSections;
- (void)removeItemAtIndexPath:(id)a3 completionHandler:(id)a4;
- (void)removeSection:(int64_t)a3;
- (void)setFilterPredicate:(id)a3 forSection:(int64_t)a4;
- (void)setItems:(id)a3 forSection:(int64_t)a4;
- (void)setSectionToSectionInfo:(id)a3;
- (void)setSortDescriptors:(id)a3 forSection:(int64_t)a4;
- (void)setUnderlyingDataSource:(id)a3;
@end

@implementation GKSplittingDataSource

- (GKSplittingDataSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)GKSplittingDataSource;
  v2 = [(GKCollectionViewDataSource *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sectionToSectionInfo = v2->_sectionToSectionInfo;
    v2->_sectionToSectionInfo = v3;
  }
  return v2;
}

- (id)_gkDescriptionWithChildren:(int64_t)a3
{
  v5 = [MEMORY[0x1E4F28E78] string];
  objc_super v6 = _gkTabStringForTabLevel();
  v19.receiver = self;
  v19.super_class = (Class)GKSplittingDataSource;
  v7 = [(GKCollectionViewDataSource *)&v19 _gkDescriptionWithChildren:a3];
  [v5 appendString:v7];

  underlyingDataSource = self->_underlyingDataSource;
  if (underlyingDataSource)
  {
    v9 = [(GKBasicCollectionViewDataSource *)underlyingDataSource _gkDescriptionWithChildren:a3 + 2];
    v10 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    v11 = [v9 stringByTrimmingCharactersInSet:v10];

    [v5 appendFormat:@"%@    filter source: %@", v6, v11];
  }
  uint64_t v12 = [(NSMutableDictionary *)self->_sectionToSectionInfo count];
  if (v12 >= 1)
  {
    uint64_t v13 = v12;
    [v5 appendFormat:@"\n%@    sections {\n", v6];
    for (uint64_t i = 0; i != v13; ++i)
    {
      v15 = [(GKSplittingDataSource *)self sectionInfoForSection:i];
      v16 = [v15 description];
      [v5 appendFormat:@"%@        %ld %@\n", v6, i, v16];
    }
    [v5 appendFormat:@"%@    }\n", v6];
  }
  [v5 appendFormat:@"%@}\n", v6];
  id v17 = (id)_gkUnicodifyDescription();

  return v5;
}

- (void)setUnderlyingDataSource:(id)a3
{
}

- (int64_t)sectionCount
{
  return [(NSMutableDictionary *)self->_sectionToSectionInfo count];
}

- (id)sectionInfoForSection:(int64_t)a3
{
  sectionToSectionInfo = self->_sectionToSectionInfo;
  v4 = [NSNumber numberWithInteger:a3];
  v5 = [(NSMutableDictionary *)sectionToSectionInfo objectForKeyedSubscript:v4];

  return v5;
}

- (void)addSectionWithTitle:(id)a3 sortDescriptors:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = NSString;
      v8 = [NSString stringWithFormat:@"Assertion failed"];
      v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKSplittingDataSource.m"];
      id v10 = [v9 lastPathComponent];
      v11 = [v7 stringWithFormat:@"%@ (sortDescriptors == ((void *)0) || [sortDescriptors isKindOfClass:[NSArray class]])\n[%s (%s:%d)]", v8, "-[GKSplittingDataSource addSectionWithTitle:sortDescriptors:]", objc_msgSend(v10, "UTF8String"), 106];

      [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v11 format];
    }
  }
  uint64_t v12 = [(NSMutableDictionary *)self->_sectionToSectionInfo count];
  uint64_t v13 = objc_alloc_init(GKSectionInfo);
  [(GKSectionInfo *)v13 setSection:v12];
  [(GKSectionInfo *)v13 setSortDescriptors:v6];
  [(GKSectionInfo *)v13 setTitle:v17];
  sectionToSectionInfo = self->_sectionToSectionInfo;
  v15 = [NSNumber numberWithInteger:v12];
  [(NSMutableDictionary *)sectionToSectionInfo setObject:v13 forKeyedSubscript:v15];

  v16 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v12];
  [(GKCollectionViewDataSource *)self notifySectionsInserted:v16];
}

- (void)setFilterPredicate:(id)a3 forSection:(int64_t)a4
{
  id v12 = a3;
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v6 = NSString;
      v7 = [NSString stringWithFormat:@"Assertion failed"];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKSplittingDataSource.m"];
      id v9 = [v8 lastPathComponent];
      id v10 = [v6 stringWithFormat:@"%@ (predicate == ((void *)0) || [predicate isKindOfClass:[NSPredicate class]])\n[%s (%s:%d)]", v7, "-[GKSplittingDataSource setFilterPredicate:forSection:]", objc_msgSend(v9, "UTF8String"), 118];

      [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v10 format];
    }
  }
  v11 = [(GKSplittingDataSource *)self sectionInfoForSection:a4];
  [v11 setPredicate:v12];
}

- (void)setSortDescriptors:(id)a3 forSection:(int64_t)a4
{
  id v12 = a3;
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v6 = NSString;
      v7 = [NSString stringWithFormat:@"Assertion failed"];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKSplittingDataSource.m"];
      id v9 = [v8 lastPathComponent];
      id v10 = [v6 stringWithFormat:@"%@ (sortDescriptors == ((void *)0) || [sortDescriptors isKindOfClass:[NSArray class]])\n[%s (%s:%d)]", v7, "-[GKSplittingDataSource setSortDescriptors:forSection:]", objc_msgSend(v9, "UTF8String"), 126];

      [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v10 format];
    }
  }
  v11 = [(GKSplittingDataSource *)self sectionInfoForSection:a4];
  [v11 setSortDescriptors:v12];
}

- (void)removeSection:(int64_t)a3
{
  int64_t v5 = [(NSMutableDictionary *)self->_sectionToSectionInfo count];
  int64_t v19 = a3;
  if (v5 > a3)
  {
    int64_t v6 = v5;
    id v7 = (id)(v5 - 1);
    int64_t v8 = a3;
    id v20 = (id)(v5 - 1);
    do
    {
      int64_t v9 = v8 + 1;
      id v10 = [(GKSplittingDataSource *)self sectionInfoForSection:v8 + 1];
      if (v10)
      {
        sectionToSectionInfo = self->_sectionToSectionInfo;
        id v12 = [NSNumber numberWithInteger:v8];
        [(NSMutableDictionary *)sectionToSectionInfo setObject:v10 forKeyedSubscript:v12];
      }
      else
      {
        if (v7 != (id)v8)
        {
          uint64_t v13 = NSString;
          v14 = [NSString stringWithFormat:@"consistency error with sectionInfos %@", self->_sectionToSectionInfo];
          v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKSplittingDataSource.m"];
          id v16 = [v15 lastPathComponent];
          id v17 = [v13 stringWithFormat:@"%@ (section == numSections-1)\n[%s (%s:%d)]", v14, "-[GKSplittingDataSource removeSection:]", objc_msgSend(v16, "UTF8String"), 141];

          id v7 = v20;
          [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v17 format];
        }
        v18 = self->_sectionToSectionInfo;
        id v12 = [NSNumber numberWithInteger:v8];
        [(NSMutableDictionary *)v18 removeObjectForKey:v12];
      }

      int64_t v8 = v9;
    }
    while (v6 != v9);
  }
  id v21 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v19];
  [(GKCollectionViewDataSource *)self notifySectionsRemoved:v21];
}

- (void)removeAllSections
{
  objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, -[GKSplittingDataSource sectionCount](self, "sectionCount"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableDictionary *)self->_sectionToSectionInfo removeAllObjects];
  [(GKCollectionViewDataSource *)self notifySectionsRemoved:v3];
}

- (id)itemsForSection:(int64_t)a3
{
  id v3 = [(GKSplittingDataSource *)self sectionInfoForSection:a3];
  v4 = [v3 items];

  return v4;
}

- (id)filteredItemsForRawItems:(id)a3
{
  id v3 = a3;

  return v3;
}

- (void)setItems:(id)a3 forSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(GKSplittingDataSource *)self sectionInfoForSection:a4];
  id v17 = v7;
  if (!v7)
  {
    int64_t v8 = NSString;
    int64_t v9 = [NSString stringWithFormat:@"Assertion failed"];
    id v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKSplittingDataSource.m"];
    id v11 = [v10 lastPathComponent];
    id v12 = [v8 stringWithFormat:@"%@ (sectionInfo != ((void *)0))\n[%s (%s:%d)]", v9, "-[GKSplittingDataSource setItems:forSection:]", objc_msgSend(v11, "UTF8String"), 174];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v12 format];
    id v7 = 0;
  }
  uint64_t v13 = [v7 items];
  v14 = (void *)[v6 copy];
  [v17 setItems:v14];
  char v15 = [v13 isEqual:v6];

  if ((v15 & 1) == 0)
  {
    id v16 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a4];
    [(GKCollectionViewDataSource *)self notifySectionsRefreshed:v16];
  }
}

- (id)titleForSection:(int64_t)a3
{
  id v3 = [(GKSplittingDataSource *)self sectionInfoForSection:a3];
  v4 = [v3 title];

  return v4;
}

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4 updateNotifier:(id)a5
{
  id v7 = a5;
  int64_t v8 = [MEMORY[0x1E4F63828] updateGroup];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__GKSplittingDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke;
  v16[3] = &unk_1E5F64E38;
  v16[4] = self;
  [v8 perform:v16];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__GKSplittingDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke_2;
  v11[3] = &unk_1E5F64EB0;
  id v12 = v8;
  uint64_t v13 = self;
  unsigned int v15 = a3;
  id v14 = v7;
  id v9 = v7;
  id v10 = v8;
  [v10 join:v11];
}

uint64_t __76__GKSplittingDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) refreshContentsForDataType:0 userInfo:0 updateNotifier:a2];
}

void __76__GKSplittingDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) applyUpdates];
  v2 = [MEMORY[0x1E4F63828] updateGroup];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__GKSplittingDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke_3;
  v7[3] = &unk_1E5F64E60;
  v7[4] = *(void *)(a1 + 40);
  int v8 = *(_DWORD *)(a1 + 56);
  [v2 perform:v7];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__GKSplittingDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke_4;
  v4[3] = &unk_1E5F63E80;
  id v3 = *(void **)(a1 + 48);
  v4[4] = *(void *)(a1 + 40);
  id v5 = v3;
  id v6 = *(id *)(a1 + 32);
  [v2 join:v4];
}

uint64_t __76__GKSplittingDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) refreshAdditionalInfoForDataType:*(unsigned int *)(a1 + 40) updateNotifier:a2];
}

void __76__GKSplittingDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke_4(id *a1)
{
  v2 = [*((id *)a1[4] + 9) items];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = a1[5];
  id v5 = [a1[6] error];
  [v4 updateError:v5];

  id v6 = a1[4];
  id v7 = (void *)v6[10];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__GKSplittingDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke_5;
  v10[3] = &unk_1E5F64E88;
  v10[4] = v6;
  id v11 = v2;
  id v12 = v3;
  id v13 = a1[5];
  id v14 = a1[6];
  id v8 = v3;
  id v9 = v2;
  [v7 enumerateKeysAndObjectsUsingBlock:v10];
  [a1[4] willUpdateSectionsWithItems:v8];
}

void __76__GKSplittingDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) filteredItemsForRawItems:*(void *)(a1 + 40)];
  id v8 = [v6 predicate];

  if (v8)
  {
    id v9 = *(void **)(a1 + 40);
    id v10 = [v6 predicate];
    uint64_t v11 = [v9 filteredArrayUsingPredicate:v10];

    id v7 = (void *)v11;
  }
  id v12 = [v6 sortDescriptors];

  if (v12)
  {
    id v13 = [v6 sortDescriptors];
    uint64_t v14 = [v7 sortedArrayUsingDescriptors:v13];

    id v7 = (void *)v14;
  }
  unsigned int v15 = objc_msgSend(*(id *)(a1 + 32), "itemsForSection:", objc_msgSend(v5, "integerValue"));
  if (([v7 isEqual:v15] & 1) == 0)
  {
    if (v7) {
      id v16 = v7;
    }
    else {
      id v16 = (void *)MEMORY[0x1E4F1CBF0];
    }
    [*(id *)(a1 + 48) setObject:v16 forKeyedSubscript:v5];
    id v17 = *(void **)(a1 + 56);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __76__GKSplittingDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke_6;
    v19[3] = &unk_1E5F63E80;
    v19[4] = *(void *)(a1 + 32);
    id v20 = v7;
    id v21 = v5;
    v18 = [*(id *)(a1 + 64) error];
    [v17 addUpdate:v19 error:v18];
  }
}

uint64_t __76__GKSplittingDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke_6(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 48) integerValue];

  return [v1 setItems:v2 forSection:v3];
}

- (void)collectionViewDidBecomeInactive:(id)a3
{
}

uint64_t __57__GKSplittingDataSource_collectionViewDidBecomeInactive___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setPredicate:0];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v4 = [(GKSplittingDataSource *)self sectionInfoForSection:a4];
  id v5 = [v4 items];
  int64_t v6 = [v5 count];

  return v6;
}

- (void)removeItemAtIndexPath:(id)a3 completionHandler:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = -[GKSplittingDataSource sectionInfoForSection:](self, "sectionInfoForSection:", [v6 section]);
  if (!v8)
  {
    id v9 = NSString;
    id v10 = [NSString stringWithFormat:@"couldn't section for %@", v6];
    uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKSplittingDataSource.m"];
    id v12 = [v11 lastPathComponent];
    id v13 = [v9 stringWithFormat:@"%@ (sectionInfo != nil)\n[%s (%s:%d)]", v10, "-[GKSplittingDataSource removeItemAtIndexPath:completionHandler:]", objc_msgSend(v12, "UTF8String"), 258];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v13 format];
  }
  uint64_t v14 = [v6 item];
  unsigned int v15 = [v8 items];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __65__GKSplittingDataSource_removeItemAtIndexPath_completionHandler___block_invoke;
  v18[3] = &__block_descriptor_40_e11__24__0_8Q16l;
  v18[4] = v14;
  id v16 = [v15 _gkFilterWithBlock:v18];
  [v8 setItems:v16];

  v19[0] = v6;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [(GKCollectionViewDataSource *)self notifyItemsRemovedAtIndexPaths:v17];

  if (v7) {
    v7[2](v7, 0);
  }
}

id __65__GKSplittingDataSource_removeItemAtIndexPath_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (*(void *)(a1 + 32) == a3) {
    return 0;
  }
  else {
    return a2;
  }
}

- (id)itemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = -[GKSplittingDataSource sectionInfoForSection:](self, "sectionInfoForSection:", [v4 section]);
  if (v5
    && (unint64_t v6 = [v4 item],
        [v5 items],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unint64_t v8 = [v7 count],
        v7,
        v6 < v8))
  {
    id v9 = [v5 items];
    id v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)indexPathsForItem:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [(GKSplittingDataSource *)self sectionCount];
  if (v6 >= 1)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
    {
      id v9 = [(GKSplittingDataSource *)self sectionInfoForSection:i];
      id v10 = [v9 items];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __43__GKSplittingDataSource_indexPathsForItem___block_invoke;
      v12[3] = &unk_1E5F64EF8;
      id v13 = v4;
      id v14 = v5;
      uint64_t v15 = i;
      [v10 enumerateObjectsUsingBlock:v12];
    }
  }

  return v5;
}

void __43__GKSplittingDataSource_indexPathsForItem___block_invoke(void *a1, void *a2, uint64_t a3)
{
  if ([a2 isEqual:a1[4]])
  {
    id v5 = (void *)a1[5];
    id v6 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:a1[6]];
    [v5 addObject:v6];
  }
}

- (GKBasicCollectionViewDataSource)underlyingDataSource
{
  return self->_underlyingDataSource;
}

- (NSMutableDictionary)sectionToSectionInfo
{
  return self->_sectionToSectionInfo;
}

- (void)setSectionToSectionInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionToSectionInfo, 0);

  objc_storeStrong((id *)&self->_underlyingDataSource, 0);
}

@end