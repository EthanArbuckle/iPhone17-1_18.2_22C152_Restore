@interface MPChangeDetails
+ (MPChangeDetails)changeDetailsWithPreviousCount:(int64_t)a3 finalCount:(int64_t)a4 isEqualBlock:(id)a5 isUpdatedBlock:(id)a6;
+ (MPChangeDetails)empty;
- (BOOL)hasChanges;
- (BOOL)isValidForPreviousCount:(int64_t)a3 finalCount:(int64_t)a4 reason:(id *)a5;
- (MPChangeDetails)initWithBlock:(id)a3;
- (NSArray)deletedItemIndexPaths;
- (NSArray)insertedItemIndexPaths;
- (NSArray)updatedItemIndexPaths;
- (NSIndexSet)deletedSections;
- (NSIndexSet)insertedSections;
- (NSIndexSet)updatedSections;
- (id)debugDescription;
- (id)description;
- (void)appendItemMoveFromIndexPath:(id)a3 toIndexPath:(id)a4 updated:(BOOL)a5;
- (void)appendItemUpdateForPreviousIndexPath:(id)a3 finalIndexPath:(id)a4;
- (void)appendSectionMoveFromIndex:(int64_t)a3 toIndex:(int64_t)a4 updated:(BOOL)a5;
- (void)appendSectionUpdateForPreviousIndex:(int64_t)a3 finalIndex:(int64_t)a4;
- (void)applyUIKitWorkarounds;
- (void)enumerateItemMovesUsingBlock:(id)a3;
- (void)enumerateItemMovesWithBlock:(id)a3;
- (void)enumerateItemUpdatesUsingBlock:(id)a3;
- (void)enumerateMovesWithBlock:(id)a3;
- (void)enumerateSectionMovesUsingBlock:(id)a3;
- (void)enumerateSectionMovesWithBlock:(id)a3;
- (void)enumerateSectionUpdatesUsingBlock:(id)a3;
- (void)removeItemMoveFromIndexPath:(id)a3;
- (void)removeItemUpdateForPreviousIndexPath:(id)a3;
- (void)removeSectionMoveFromIndex:(int64_t)a3;
- (void)removeSectionUpdateForPreviousIndex:(int64_t)a3;
- (void)setDeletedItemIndexPaths:(id)a3;
- (void)setDeletedSections:(id)a3;
- (void)setInsertedItemIndexPaths:(id)a3;
- (void)setInsertedSections:(id)a3;
- (void)setUpdatedItemIndexPaths:(id)a3;
- (void)setUpdatedSections:(id)a3;
@end

@implementation MPChangeDetails

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedItemIndexPaths, 0);
  objc_storeStrong((id *)&self->_insertedItemIndexPaths, 0);
  objc_storeStrong((id *)&self->_deletedSections, 0);
  objc_storeStrong((id *)&self->_insertedSections, 0);
  objc_storeStrong((id *)&self->_updatedItemMoveFromIndexPaths, 0);
  objc_storeStrong((id *)&self->_itemUpdates, 0);
  objc_storeStrong((id *)&self->_itemMoves, 0);
  objc_storeStrong((id *)&self->_updatedSectionMoveFromIndexes, 0);
  objc_storeStrong((id *)&self->_sectionUpdates, 0);

  objc_storeStrong((id *)&self->_sectionMoves, 0);
}

+ (MPChangeDetails)changeDetailsWithPreviousCount:(int64_t)a3 finalCount:(int64_t)a4 isEqualBlock:(id)a5 isUpdatedBlock:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = objc_alloc((Class)a1);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __89__MPChangeDetails_changeDetailsWithPreviousCount_finalCount_isEqualBlock_isUpdatedBlock___block_invoke;
  v22 = &unk_1E57F5A48;
  int64_t v25 = a3;
  int64_t v26 = a4;
  id v23 = v10;
  id v24 = v11;
  id v13 = v11;
  id v14 = v10;
  v15 = (void *)[v12 initWithBlock:&v19];
  if (objc_msgSend(v15, "hasChanges", v19, v20, v21, v22)) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  v17 = v16;

  return v17;
}

- (MPChangeDetails)initWithBlock:(id)a3
{
  v4 = (void (**)(id, MPChangeDetails *))a3;
  v26.receiver = self;
  v26.super_class = (Class)MPChangeDetails;
  v5 = [(MPChangeDetails *)&v26 init];
  if (v5)
  {
    v6 = (NSIndexSet *)objc_alloc_init(MEMORY[0x1E4F28D60]);
    deletedSections = v5->_deletedSections;
    v5->_deletedSections = v6;

    v8 = (NSIndexSet *)objc_alloc_init(MEMORY[0x1E4F28D60]);
    insertedSections = v5->_insertedSections;
    v5->_insertedSections = v8;

    deletedItemIndexPaths = v5->_deletedItemIndexPaths;
    id v11 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v5->_deletedItemIndexPaths = (NSArray *)MEMORY[0x1E4F1CBF0];

    insertedItemIndexPaths = v5->_insertedItemIndexPaths;
    v5->_insertedItemIndexPaths = v11;

    id v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sectionMoves = v5->_sectionMoves;
    v5->_sectionMoves = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sectionUpdates = v5->_sectionUpdates;
    v5->_sectionUpdates = v15;

    v17 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    updatedSectionMoveFromIndexes = v5->_updatedSectionMoveFromIndexes;
    v5->_updatedSectionMoveFromIndexes = v17;

    uint64_t v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    itemMoves = v5->_itemMoves;
    v5->_itemMoves = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    itemUpdates = v5->_itemUpdates;
    v5->_itemUpdates = v21;

    id v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    updatedItemMoveFromIndexPaths = v5->_updatedItemMoveFromIndexPaths;
    v5->_updatedItemMoveFromIndexPaths = v23;

    v4[2](v4, v5);
    v5->_isFinalized = 1;
  }

  return v5;
}

void __89__MPChangeDetails_changeDetailsWithPreviousCount_finalCount_isEqualBlock_isUpdatedBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x1E4F28E60] indexSet];
  v5 = [MEMORY[0x1E4F28E60] indexSet];
  unint64_t v32 = 0;
  v6 = MPChangeDetailOperationGenerateEx(*(void *)(a1 + 48), *(void *)(a1 + 56), &v32, v33, *(void **)(a1 + 32));
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __89__MPChangeDetails_changeDetailsWithPreviousCount_finalCount_isEqualBlock_isUpdatedBlock___block_invoke_2;
  v26[3] = &unk_1E57F5A20;
  id v7 = v5;
  id v27 = v7;
  id v30 = *(id *)(a1 + 32);
  id v8 = v4;
  id v28 = v8;
  id v9 = v3;
  id v29 = v9;
  id v31 = *(id *)(a1 + 40);
  id v10 = (void (**)(void, void))MEMORY[0x19971E0F0](v26);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __89__MPChangeDetails_changeDetailsWithPreviousCount_finalCount_isEqualBlock_isUpdatedBlock___block_invoke_4;
  v20[3] = &unk_1E57F5A20;
  id v19 = v8;
  id v21 = v19;
  id v24 = *(id *)(a1 + 32);
  id v18 = v7;
  id v22 = v18;
  id v11 = v9;
  id v23 = v11;
  id v25 = *(id *)(a1 + 40);
  id v12 = (void (**)(void, void))MEMORY[0x19971E0F0](v20);
  if (v32)
  {
    for (unint64_t i = 0; i < v32; ++i)
    {
      unint64_t v14 = v6[i];
      unint64_t v15 = v14 >> 62;
      if (v14 >> 62 == 1)
      {
        uint64_t v16 = (v14 >> 31) & 0x7FFFFFFF;
        uint64_t v17 = v6[i] & 0x7FFFFFFFLL;
        if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
        {
          if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
            [v11 appendSectionUpdateForPreviousIndex:v16 finalIndex:v17];
          }
        }
        else
        {
          v12[2](v12, v16);
          v10[2](v10, v17);
        }
      }
      else if (v15 == 3)
      {
        v10[2](v10, v6[i] & 0x7FFFFFFFLL);
      }
      else if (v15 == 2)
      {
        v12[2](v12, (v14 >> 31) & 0x7FFFFFFF);
      }
    }
  }
  free(v6);
  v11[56] = 1;
  [v11 setInsertedSections:v19];
  [v11 setDeletedSections:v18];
}

- (void)setInsertedSections:(id)a3
{
}

- (void)setDeletedSections:(id)a3
{
}

- (BOOL)hasChanges
{
  return [(NSIndexSet *)self->_insertedSections count]
      || [(NSIndexSet *)self->_deletedSections count]
      || [(NSMutableDictionary *)self->_sectionUpdates count]
      || [(NSMutableDictionary *)self->_sectionMoves count]
      || [(NSArray *)self->_insertedItemIndexPaths count]
      || [(NSArray *)self->_deletedItemIndexPaths count]
      || [(NSMutableDictionary *)self->_itemUpdates count]
      || [(NSMutableDictionary *)self->_itemMoves count] != 0;
}

- (void)setDeletedItemIndexPaths:(id)a3
{
}

- (NSArray)deletedItemIndexPaths
{
  return self->_deletedItemIndexPaths;
}

- (void)setInsertedItemIndexPaths:(id)a3
{
}

- (NSArray)insertedItemIndexPaths
{
  return self->_insertedItemIndexPaths;
}

- (NSIndexSet)deletedSections
{
  return self->_deletedSections;
}

- (NSIndexSet)insertedSections
{
  return self->_insertedSections;
}

- (BOOL)isValidForPreviousCount:(int64_t)a3 finalCount:(int64_t)a4 reason:(id *)a5
{
  if (!self->_isFlatCollection)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"MPChangeDetails.m" lineNumber:518 description:@"-isValidForPreviousCount:finalCount:reason: can only be used with a flat collection change details"];
  }
  if ([(NSIndexSet *)self->_deletedSections count]
    && [(NSIndexSet *)self->_deletedSections lastIndex] >= a3)
  {
    if (a5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"[INVALID CHANGE DETAILS] deletedSections.lastIndex out of bounds: %ld/%ld", -[NSIndexSet lastIndex](self->_deletedSections, "lastIndex"), a3);
LABEL_15:
      BOOL v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      return v10;
    }
    return 0;
  }
  if ([(NSIndexSet *)self->_insertedSections count]
    && [(NSIndexSet *)self->_insertedSections lastIndex] >= a4)
  {
    if (a5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"[INVALID CHANGE DETAILS] insertedSections.lastIndex out of bounds: %ld/%ld", -[NSIndexSet lastIndex](self->_insertedSections, "lastIndex"), a4);
      goto LABEL_15;
    }
    return 0;
  }
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__38031;
  id v19 = __Block_byref_object_dispose__38032;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__MPChangeDetails_isValidForPreviousCount_finalCount_reason___block_invoke;
  v14[3] = &unk_1E57F5CC8;
  v14[4] = &v21;
  v14[5] = &v15;
  v14[6] = a3;
  v14[7] = a4;
  [(MPChangeDetails *)self enumerateSectionMovesUsingBlock:v14];
  if (a5)
  {
    id v9 = (void *)v16[5];
    if (v9) {
      *a5 = v9;
    }
  }
  BOOL v10 = *((unsigned char *)v22 + 24) != 0;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v10;
}

void __61__MPChangeDetails_isValidForPreviousCount_finalCount_reason___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(*(void *)(a1[4] + 8) + 24))
  {
    uint64_t v5 = a1[6];
    if (v5 <= a2)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"[INVALID CHANGE DETAILS] move.fromIndex out of bounds: %ld/%ld", a2, v5);
      uint64_t v7 = *(void *)(a1[5] + 8);
      id v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 0;
    }
    uint64_t v9 = a1[7];
    if (v9 <= a3)
    {
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"[INVALID CHANGE DETAILS] move.toIndex out of bounds: %ld/%ld", a3, v9);
      uint64_t v11 = *(void *)(a1[5] + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 0;
    }
  }
}

- (void)applyUIKitWorkarounds
{
  if (self->_isFinalized)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"MPChangeDetails.m" lineNumber:427 description:@"Attempt to mutate immutable change details"];
  }
  id v3 = (void *)[(NSIndexSet *)self->_deletedSections mutableCopy];
  v4 = (void *)[(NSIndexSet *)self->_insertedSections mutableCopy];
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_sectionMoves copy];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __40__MPChangeDetails_applyUIKitWorkarounds__block_invoke;
  v32[3] = &unk_1E57F5BB0;
  v32[4] = self;
  id v6 = v3;
  id v33 = v6;
  id v7 = v4;
  id v34 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v32];
  [(NSMutableIndexSet *)self->_updatedSectionMoveFromIndexes removeAllIndexes];
  if ([(NSMutableDictionary *)self->_sectionMoves count])
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __40__MPChangeDetails_applyUIKitWorkarounds__block_invoke_2;
    v29[3] = &unk_1E57F5C28;
    v29[4] = self;
    id v30 = v6;
    id v31 = v7;
    [(MPChangeDetails *)self enumerateSectionUpdatesUsingBlock:v29];
    [(NSMutableDictionary *)self->_sectionUpdates removeAllObjects];
  }
  objc_storeStrong((id *)&self->_deletedSections, v3);
  objc_storeStrong((id *)&self->_insertedSections, v4);
  id v8 = (void *)[(NSArray *)self->_deletedItemIndexPaths mutableCopy];
  uint64_t v9 = (void *)[(NSArray *)self->_insertedItemIndexPaths mutableCopy];
  uint64_t v10 = (void *)[(NSMutableDictionary *)self->_itemMoves copy];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __40__MPChangeDetails_applyUIKitWorkarounds__block_invoke_6;
  v26[3] = &unk_1E57F5C50;
  void v26[4] = self;
  uint64_t v11 = v8;
  id v27 = v11;
  id v12 = v9;
  id v28 = v12;
  [v10 enumerateKeysAndObjectsUsingBlock:v26];
  [(NSMutableSet *)self->_updatedItemMoveFromIndexPaths removeAllObjects];
  if ([(NSMutableDictionary *)self->_itemMoves count])
  {
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __40__MPChangeDetails_applyUIKitWorkarounds__block_invoke_7;
    id v22 = &unk_1E57F5CA0;
    uint64_t v23 = self;
    char v24 = v11;
    id v25 = v12;
    [(MPChangeDetails *)self enumerateItemUpdatesUsingBlock:&v19];
    [(NSMutableDictionary *)self->_itemUpdates removeAllObjects];
  }
  deletedItemIndexPaths = self->_deletedItemIndexPaths;
  self->_deletedItemIndexPaths = v11;
  unint64_t v14 = v11;

  insertedItemIndexPaths = self->_insertedItemIndexPaths;
  self->_insertedItemIndexPaths = v12;
  uint64_t v16 = v12;
}

uint64_t __40__MPChangeDetails_applyUIKitWorkarounds__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 integerValue];
  uint64_t v7 = [v5 integerValue];

  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) containsIndex:v6];
  if (result)
  {
    [*(id *)(a1 + 32) removeSectionMoveFromIndex:v6];
    [*(id *)(a1 + 40) addIndex:v6];
    uint64_t v9 = *(void **)(a1 + 48);
    return [v9 addIndex:v7];
  }
  return result;
}

void __40__MPChangeDetails_applyUIKitWorkarounds__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = a2;
  v4 = *(void **)(*(void *)(a1 + 32) + 72);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__MPChangeDetails_applyUIKitWorkarounds__block_invoke_3;
  v9[3] = &unk_1E57F5BD8;
  v9[4] = &v10;
  [v4 enumerateIndexesUsingBlock:v9];
  id v5 = *(void **)(*(void *)(a1 + 32) + 64);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__MPChangeDetails_applyUIKitWorkarounds__block_invoke_4;
  v8[3] = &unk_1E57F5BD8;
  v8[4] = &v10;
  [v5 enumerateIndexesUsingBlock:v8];
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__MPChangeDetails_applyUIKitWorkarounds__block_invoke_5;
  v7[3] = &unk_1E57F5C00;
  v7[4] = &v10;
  [v6 enumerateKeysAndObjectsUsingBlock:v7];
  [*(id *)(a1 + 40) removeIndex:a2];
  [*(id *)(a1 + 48) addIndex:v11[3]];
  _Block_object_dispose(&v10, 8);
}

void __40__MPChangeDetails_applyUIKitWorkarounds__block_invoke_6(id *a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([*((id *)a1[4] + 6) containsObject:v6])
  {
    [a1[4] removeItemMoveFromIndexPath:v6];
    [a1[5] addObject:v6];
    [a1[6] addObject:v5];
  }
}

void __40__MPChangeDetails_applyUIKitWorkarounds__block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0;
  uint64_t v44 = [v5 item];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v7 = *(id *)(*(void *)(a1 + 32) + 88);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v12 = [v11 section];
        if (v12 == [v5 section])
        {
          uint64_t v13 = [v11 item];
          uint64_t v14 = v42[3];
          if (v13 <= v14) {
            v42[3] = v14 - 1;
          }
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v8);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v15 = *(id *)(*(void *)(a1 + 32) + 80);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v19 = *(void **)(*((void *)&v33 + 1) + 8 * j);
        uint64_t v20 = [v19 section];
        if (v20 == [v5 section])
        {
          uint64_t v21 = [v19 item];
          uint64_t v22 = v42[3];
          if (v21 <= v22) {
            v42[3] = v22 + 1;
          }
        }
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v16);
  }

  uint64_t v23 = *(void **)(*(void *)(a1 + 32) + 32);
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  id v29 = __40__MPChangeDetails_applyUIKitWorkarounds__block_invoke_8;
  id v30 = &unk_1E57F5C78;
  id v24 = v5;
  id v31 = v24;
  unint64_t v32 = &v41;
  [v23 enumerateKeysAndObjectsUsingBlock:&v27];
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v24, v27, v28, v29, v30);
  id v25 = *(void **)(a1 + 48);
  objc_super v26 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", v42[3], objc_msgSend(v24, "section"));
  [v25 addObject:v26];

  _Block_object_dispose(&v41, 8);
}

void __40__MPChangeDetails_applyUIKitWorkarounds__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  uint64_t v6 = [v14 section];
  if (v6 == [*(id *)(a1 + 32) section])
  {
    uint64_t v7 = [v14 item];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void *)(v8 + 24);
    if (v7 <= v9) {
      *(void *)(v8 + 24) = v9 - 1;
    }
  }
  uint64_t v10 = [v5 section];
  if (v10 == [*(id *)(a1 + 32) section])
  {
    uint64_t v11 = [v5 item];
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v13 = *(void *)(v12 + 24);
    if (v11 <= v13) {
      *(void *)(v12 + 24) = v13 + 1;
    }
  }
}

uint64_t __40__MPChangeDetails_applyUIKitWorkarounds__block_invoke_3(uint64_t result, unint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v3 >= a2) {
    *(void *)(v2 + 24) = v3 - 1;
  }
  return result;
}

uint64_t __40__MPChangeDetails_applyUIKitWorkarounds__block_invoke_4(uint64_t result, unint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v3 >= a2) {
    *(void *)(v2 + 24) = v3 + 1;
  }
  return result;
}

void __40__MPChangeDetails_applyUIKitWorkarounds__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 integerValue];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void *)(v7 + 24);
  if (v6 <= v8) {
    *(void *)(v7 + 24) = v8 - 1;
  }
  uint64_t v9 = [v5 integerValue];

  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v11 = *(void *)(v10 + 24);
  if (v9 <= v11) {
    *(void *)(v10 + 24) = v11 + 1;
  }
}

- (void)enumerateMovesWithBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__MPChangeDetails_enumerateMovesWithBlock___block_invoke;
  v6[3] = &unk_1E57F5AC0;
  id v7 = v4;
  id v5 = v4;
  [(MPChangeDetails *)self enumerateSectionMovesUsingBlock:v6];
}

uint64_t __43__MPChangeDetails_enumerateMovesWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateItemUpdatesUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[(NSMutableDictionary *)self->_itemUpdates copy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__MPChangeDetails_enumerateItemUpdatesUsingBlock___block_invoke;
  v7[3] = &unk_1E57F5B88;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __50__MPChangeDetails_enumerateItemUpdatesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeItemUpdateForPreviousIndexPath:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (self->_isFinalized)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"MPChangeDetails.m" lineNumber:385 description:@"Attempt to mutate immutable change details"];

    id v5 = v7;
  }
  [(NSMutableDictionary *)self->_itemUpdates removeObjectForKey:v5];
}

- (void)appendItemUpdateForPreviousIndexPath:(id)a3 finalIndexPath:(id)a4
{
  id v9 = a3;
  id v7 = a4;
  if (self->_isFinalized)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MPChangeDetails.m" lineNumber:380 description:@"Attempt to mutate immutable change details"];
  }
  [(NSMutableDictionary *)self->_itemUpdates setObject:v7 forKey:v9];
}

- (void)enumerateItemMovesUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[(NSMutableDictionary *)self->_itemMoves copy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__MPChangeDetails_enumerateItemMovesUsingBlock___block_invoke;
  v7[3] = &unk_1E57F5B60;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

void __48__MPChangeDetails_enumerateItemMovesUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 48);
  id v6 = a3;
  id v7 = a2;
  [v5 containsObject:v7];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)enumerateItemMovesWithBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__MPChangeDetails_enumerateItemMovesWithBlock___block_invoke;
  v6[3] = &unk_1E57F5B38;
  id v7 = v4;
  id v5 = v4;
  [(MPChangeDetails *)self enumerateItemMovesUsingBlock:v6];
}

uint64_t __47__MPChangeDetails_enumerateItemMovesWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeItemMoveFromIndexPath:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (self->_isFinalized)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"MPChangeDetails.m" lineNumber:360 description:@"Attempt to mutate immutable change details"];

    id v5 = v7;
  }
  [(NSMutableDictionary *)self->_itemMoves removeObjectForKey:v5];
  [(NSMutableSet *)self->_updatedItemMoveFromIndexPaths removeObject:v7];
}

- (void)appendItemMoveFromIndexPath:(id)a3 toIndexPath:(id)a4 updated:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v9 = a4;
  if (self->_isFinalized)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"MPChangeDetails.m" lineNumber:352 description:@"Attempt to mutate immutable change details"];
  }
  [(NSMutableDictionary *)self->_itemMoves setObject:v9 forKey:v11];
  if (v5) {
    [(NSMutableSet *)self->_updatedItemMoveFromIndexPaths addObject:v11];
  }
}

- (void)enumerateSectionUpdatesUsingBlock:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)[(NSMutableDictionary *)self->_sectionUpdates copy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__MPChangeDetails_enumerateSectionUpdatesUsingBlock___block_invoke;
  v7[3] = &unk_1E57F5B10;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __53__MPChangeDetails_enumerateSectionUpdatesUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  uint64_t v6 = [a2 integerValue];
  uint64_t v7 = [v5 integerValue];

  id v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);

  return v8(v4, v6, v7);
}

- (void)removeSectionUpdateForPreviousIndex:(int64_t)a3
{
  if (self->_isFinalized)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"MPChangeDetails.m" lineNumber:340 description:@"Attempt to mutate immutable change details"];
  }
  sectionUpdates = self->_sectionUpdates;
  id v8 = [NSNumber numberWithInteger:a3];
  [(NSMutableDictionary *)sectionUpdates removeObjectForKey:v8];
}

- (void)appendSectionUpdateForPreviousIndex:(int64_t)a3 finalIndex:(int64_t)a4
{
  if (self->_isFinalized)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"MPChangeDetails.m" lineNumber:335 description:@"Attempt to mutate immutable change details"];
  }
  sectionUpdates = self->_sectionUpdates;
  id v11 = [NSNumber numberWithInteger:a4];
  id v8 = [NSNumber numberWithInteger:a3];
  [(NSMutableDictionary *)sectionUpdates setObject:v11 forKey:v8];
}

- (void)enumerateSectionMovesUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[(NSMutableDictionary *)self->_sectionMoves copy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__MPChangeDetails_enumerateSectionMovesUsingBlock___block_invoke;
  v7[3] = &unk_1E57F5AE8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __51__MPChangeDetails_enumerateSectionMovesUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 integerValue];
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 24) containsIndex:v6];
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = [v5 integerValue];

  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16);

  return v10(v8, v6, v9, v7);
}

- (void)enumerateSectionMovesWithBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__MPChangeDetails_enumerateSectionMovesWithBlock___block_invoke;
  v6[3] = &unk_1E57F5AC0;
  id v7 = v4;
  id v5 = v4;
  [(MPChangeDetails *)self enumerateSectionMovesUsingBlock:v6];
}

uint64_t __50__MPChangeDetails_enumerateSectionMovesWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeSectionMoveFromIndex:(int64_t)a3
{
  if (self->_isFinalized)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MPChangeDetails.m" lineNumber:314 description:@"Attempt to mutate immutable change details"];
  }
  sectionMoves = self->_sectionMoves;
  uint64_t v6 = [NSNumber numberWithInteger:a3];
  [(NSMutableDictionary *)sectionMoves removeObjectForKey:v6];

  updatedSectionMoveFromIndexes = self->_updatedSectionMoveFromIndexes;

  [(NSMutableIndexSet *)updatedSectionMoveFromIndexes removeIndex:a3];
}

- (void)appendSectionMoveFromIndex:(int64_t)a3 toIndex:(int64_t)a4 updated:(BOOL)a5
{
  BOOL v5 = a5;
  if (self->_isFinalized)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"MPChangeDetails.m" lineNumber:306 description:@"Attempt to mutate immutable change details"];
  }
  sectionMoves = self->_sectionMoves;
  uint64_t v10 = [NSNumber numberWithInteger:a4];
  id v11 = [NSNumber numberWithInteger:a3];
  [(NSMutableDictionary *)sectionMoves setObject:v10 forKey:v11];

  if (v5)
  {
    updatedSectionMoveFromIndexes = self->_updatedSectionMoveFromIndexes;
    [(NSMutableIndexSet *)updatedSectionMoveFromIndexes addIndex:a3];
  }
}

- (NSArray)updatedItemIndexPaths
{
  unint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableDictionary count](self->_itemUpdates, "count"));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__MPChangeDetails_updatedItemIndexPaths__block_invoke;
  v7[3] = &unk_1E57F5A98;
  id v8 = v3;
  id v4 = v3;
  [(MPChangeDetails *)self enumerateItemUpdatesUsingBlock:v7];
  BOOL v5 = (void *)[v4 copy];

  return (NSArray *)v5;
}

uint64_t __40__MPChangeDetails_updatedItemIndexPaths__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)setUpdatedItemIndexPaths:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self->_isFinalized)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"MPChangeDetails.m" lineNumber:287 description:@"Attempt to mutate immutable change details"];
  }
  [(NSMutableDictionary *)self->_itemUpdates removeAllObjects];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        -[NSMutableDictionary setObject:forKey:](self->_itemUpdates, "setObject:forKey:", *(void *)(*((void *)&v12 + 1) + 8 * i), *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (NSIndexSet)updatedSections
{
  unint64_t v3 = [MEMORY[0x1E4F28E60] indexSet];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__MPChangeDetails_updatedSections__block_invoke;
  v7[3] = &unk_1E57F5A70;
  id v8 = v3;
  id v4 = v3;
  [(MPChangeDetails *)self enumerateSectionUpdatesUsingBlock:v7];
  id v5 = (void *)[v4 copy];

  return (NSIndexSet *)v5;
}

uint64_t __34__MPChangeDetails_updatedSections__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addIndex:a2];
}

- (void)setUpdatedSections:(id)a3
{
  id v5 = a3;
  if (self->_isFinalized)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"MPChangeDetails.m" lineNumber:267 description:@"Attempt to mutate immutable change details"];
  }
  [(NSMutableDictionary *)self->_sectionUpdates removeAllObjects];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__MPChangeDetails_setUpdatedSections___block_invoke;
  v7[3] = &unk_1E57F6610;
  void v7[4] = self;
  [v5 enumerateIndexesUsingBlock:v7];
}

void __38__MPChangeDetails_setUpdatedSections___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [NSNumber numberWithUnsignedInteger:a2];
  [*(id *)(*(void *)(a1 + 32) + 16) setObject:v3 forKey:v3];
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  if (self->_isFlatCollection) {
    uint64_t v7 = @"index";
  }
  else {
    uint64_t v7 = @"section";
  }
  id v8 = v7;
  if (self->_isFlatCollection) {
    uint64_t v9 = @"indexes";
  }
  else {
    uint64_t v9 = @"sections";
  }
  uint64_t v10 = v9;
  if ([(NSIndexSet *)self->_insertedSections count]) {
    [v6 appendFormat:@"; inserted %@ %@", v10, self->_insertedSections];
  }
  if ([(NSIndexSet *)self->_deletedSections count]) {
    [v6 appendFormat:@"; deleted %@ %@", v10, self->_deletedSections];
  }
  if ([(NSMutableDictionary *)self->_sectionUpdates count]) {
    [v6 appendFormat:@"; updated %@ %@", v10, self->_sectionUpdates];
  }
  if ([(NSMutableDictionary *)self->_sectionMoves count]) {
    [v6 appendFormat:@"; %@ moves %@", v8, self->_sectionMoves];
  }
  if ([(NSMutableIndexSet *)self->_updatedSectionMoveFromIndexes count]) {
    [v6 appendFormat:@"; %@ updated moves %@", v8, self->_updatedSectionMoveFromIndexes];
  }
  if ([(NSArray *)self->_insertedItemIndexPaths count]) {
    [v6 appendFormat:@"; inserted items %@", self->_insertedItemIndexPaths];
  }
  if ([(NSArray *)self->_deletedItemIndexPaths count]) {
    [v6 appendFormat:@"; deleted items %@", self->_deletedItemIndexPaths];
  }
  if ([(NSMutableDictionary *)self->_itemUpdates count]) {
    [v6 appendFormat:@"; updated items %@", self->_itemUpdates];
  }
  if ([(NSMutableDictionary *)self->_itemMoves count]) {
    [v6 appendFormat:@"; item moves %@", self->_itemMoves];
  }
  if ([(NSMutableSet *)self->_updatedItemMoveFromIndexPaths count]) {
    [v6 appendFormat:@"; updated item moves %@", self->_updatedItemMoveFromIndexPaths];
  }
  if (![(MPChangeDetails *)self hasChanges]) {
    [v6 appendString:@"; none [UNNECESSARY]"];
  }
  [v6 appendString:@">"];

  return v6;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  if (self->_isFlatCollection) {
    uint64_t v7 = @"index";
  }
  else {
    uint64_t v7 = @"section";
  }
  id v8 = v7;
  if (self->_isFlatCollection) {
    uint64_t v9 = @"indexes";
  }
  else {
    uint64_t v9 = @"sections";
  }
  uint64_t v10 = v9;
  NSUInteger v11 = [(NSIndexSet *)self->_insertedSections count];
  if (v11)
  {
    if (v11 == 1) {
      long long v12 = v8;
    }
    else {
      long long v12 = v10;
    }
    [v6 appendFormat:@"; %lu inserted %@", v11, v12];
  }
  NSUInteger v13 = [(NSIndexSet *)self->_deletedSections count];
  if (v13)
  {
    if (v13 == 1) {
      long long v14 = v8;
    }
    else {
      long long v14 = v10;
    }
    [v6 appendFormat:@"; %lu deleted %@", v13, v14];
  }
  uint64_t v15 = [(NSMutableDictionary *)self->_sectionUpdates count];
  if (v15)
  {
    if (v15 == 1) {
      uint64_t v16 = v8;
    }
    else {
      uint64_t v16 = v10;
    }
    [v6 appendFormat:@"; %lu updated %@", v15, v16];
  }
  uint64_t v17 = [(NSMutableDictionary *)self->_sectionMoves count];
  if (v17)
  {
    if (v17 == 1) {
      id v18 = v8;
    }
    else {
      id v18 = v10;
    }
    [v6 appendFormat:@"; %lu moved %@", v17, v18];
  }
  uint64_t v19 = [(NSMutableIndexSet *)self->_updatedSectionMoveFromIndexes count];
  if (v19)
  {
    if (v19 == 1) {
      uint64_t v20 = v8;
    }
    else {
      uint64_t v20 = v10;
    }
    [v6 appendFormat:@"; %lu updated moves %@", v19, v20];
  }
  NSUInteger v21 = [(NSArray *)self->_insertedItemIndexPaths count];
  if (v21)
  {
    if (v21 == 1) {
      uint64_t v22 = @"item";
    }
    else {
      uint64_t v22 = @"items";
    }
    [v6 appendFormat:@"; %lu inserted %@", v21, v22];
  }
  NSUInteger v23 = [(NSArray *)self->_deletedItemIndexPaths count];
  if (v23)
  {
    if (v23 == 1) {
      id v24 = @"item";
    }
    else {
      id v24 = @"items";
    }
    [v6 appendFormat:@"; %lu deleted %@", v23, v24];
  }
  uint64_t v25 = [(NSMutableDictionary *)self->_itemUpdates count];
  if (v25)
  {
    if (v25 == 1) {
      objc_super v26 = @"item";
    }
    else {
      objc_super v26 = @"items";
    }
    [v6 appendFormat:@"; %lu updated %@", v25, v26];
  }
  uint64_t v27 = [(NSMutableDictionary *)self->_itemMoves count];
  if (v27)
  {
    if (v27 == 1) {
      uint64_t v28 = @"item";
    }
    else {
      uint64_t v28 = @"items";
    }
    [v6 appendFormat:@"; %lu moved %@", v27, v28];
  }
  uint64_t v29 = [(NSMutableSet *)self->_updatedItemMoveFromIndexPaths count];
  if (v29)
  {
    if (v29 == 1) {
      id v30 = @"item";
    }
    else {
      id v30 = @"items";
    }
    [v6 appendFormat:@"; %lu updated moves %@", v29, v30];
  }
  if (![(MPChangeDetails *)self hasChanges]) {
    [v6 appendString:@"; none [UNNECESSARY]"];
  }
  [v6 appendString:@">"];

  return v6;
}

void __89__MPChangeDetails_changeDetailsWithPreviousCount_finalCount_isEqualBlock_isUpdatedBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = 0;
  NSUInteger v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __89__MPChangeDetails_changeDetailsWithPreviousCount_finalCount_isEqualBlock_isUpdatedBlock___block_invoke_3;
  v6[3] = &unk_1E57F59F8;
  id v5 = *(id *)(a1 + 56);
  id v8 = &v10;
  uint64_t v9 = a2;
  id v7 = v5;
  [v4 enumerateIndexesUsingBlock:v6];
  if (v11[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    [*(id *)(a1 + 40) addIndex:a2];
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "removeIndex:");
    [*(id *)(a1 + 48) appendSectionMoveFromIndex:v11[3] toIndex:a2 updated:(*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))()];
  }

  _Block_object_dispose(&v10, 8);
}

void __89__MPChangeDetails_changeDetailsWithPreviousCount_finalCount_isEqualBlock_isUpdatedBlock___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = 0;
  NSUInteger v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __89__MPChangeDetails_changeDetailsWithPreviousCount_finalCount_isEqualBlock_isUpdatedBlock___block_invoke_5;
  v6[3] = &unk_1E57F59F8;
  id v5 = *(id *)(a1 + 56);
  id v8 = &v10;
  uint64_t v9 = a2;
  id v7 = v5;
  [v4 enumerateIndexesUsingBlock:v6];
  if (v11[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    [*(id *)(a1 + 40) addIndex:a2];
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "removeIndex:");
    [*(id *)(a1 + 48) appendSectionMoveFromIndex:a2 toIndex:v11[3] updated:(*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))()];
  }

  _Block_object_dispose(&v10, 8);
}

uint64_t __89__MPChangeDetails_changeDetailsWithPreviousCount_finalCount_isEqualBlock_isUpdatedBlock___block_invoke_5(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    *a3 = 1;
  }
  return result;
}

uint64_t __89__MPChangeDetails_changeDetailsWithPreviousCount_finalCount_isEqualBlock_isUpdatedBlock___block_invoke_3(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    *a3 = 1;
  }
  return result;
}

+ (MPChangeDetails)empty
{
  uint64_t v2 = (void *)[objc_alloc((Class)a1) initWithBlock:&__block_literal_global_38179];

  return (MPChangeDetails *)v2;
}

@end