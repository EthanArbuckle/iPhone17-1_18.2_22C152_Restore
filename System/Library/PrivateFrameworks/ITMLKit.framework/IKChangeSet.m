@interface IKChangeSet
- (BOOL)isReducing;
- (IKChangeSet)initWithAddedIndexes:(id)a3 removedIndexes:(id)a4 movedIndexesByNewIndex:(id)a5 updatedIndexesByNewIndex:(id)a6;
- (NSDictionary)movedIndexesByNewIndex;
- (NSDictionary)updatedIndexesByNewIndex;
- (NSIndexSet)addedIndexes;
- (NSIndexSet)removedIndexes;
- (id)changeSetByConcatenatingChangeSet:(id)a3;
- (id)changeSetByConvertingOldIndexesUsingChangeSet:(id)a3 andNewIndexesUsingChangeSet:(id)a4;
- (id)changeSetBySubtractingChangeSet:(id)a3;
- (id)inverseChangeSet;
- (int64_t)newIndexByShiftingOldIndex:(int64_t)a3 grouped:(BOOL)a4;
- (int64_t)newIndexForOldIndex:(int64_t)a3;
- (int64_t)oldIndexForNewIndex:(int64_t)a3;
@end

@implementation IKChangeSet

- (IKChangeSet)initWithAddedIndexes:(id)a3 removedIndexes:(id)a4 movedIndexesByNewIndex:(id)a5 updatedIndexesByNewIndex:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)IKChangeSet;
  v14 = [(IKChangeSet *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    addedIndexes = v14->_addedIndexes;
    v14->_addedIndexes = (NSIndexSet *)v15;

    uint64_t v17 = [v11 copy];
    removedIndexes = v14->_removedIndexes;
    v14->_removedIndexes = (NSIndexSet *)v17;

    uint64_t v19 = [v12 copy];
    movedIndexesByNewIndex = v14->_movedIndexesByNewIndex;
    v14->_movedIndexesByNewIndex = (NSDictionary *)v19;

    uint64_t v21 = [v13 copy];
    updatedIndexesByNewIndex = v14->_updatedIndexesByNewIndex;
    v14->_updatedIndexesByNewIndex = (NSDictionary *)v21;
  }
  return v14;
}

- (int64_t)newIndexForOldIndex:(int64_t)a3
{
  v5 = [(IKChangeSet *)self removedIndexes];
  char v6 = [v5 containsIndex:a3];

  int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  if ((v6 & 1) == 0)
  {
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2020000000;
    uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
    v8 = [(IKChangeSet *)self movedIndexesByNewIndex];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __35__IKChangeSet_newIndexForOldIndex___block_invoke;
    v28[3] = &unk_1E6DE5D00;
    v28[4] = &v29;
    v28[5] = a3;
    [v8 enumerateKeysAndObjectsUsingBlock:v28];

    int64_t v7 = v30[3];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v30[3] = a3;
      v9 = [(IKChangeSet *)self removedIndexes];
      if (v9)
      {
        id v10 = [(IKChangeSet *)self removedIndexes];
        id v11 = (void *)[v10 mutableCopy];
      }
      else
      {
        id v11 = [MEMORY[0x1E4F28E60] indexSet];
      }

      id v12 = [(IKChangeSet *)self addedIndexes];
      if (v12)
      {
        id v13 = [(IKChangeSet *)self addedIndexes];
        v14 = (void *)[v13 mutableCopy];
      }
      else
      {
        v14 = [MEMORY[0x1E4F28E60] indexSet];
      }

      uint64_t v15 = [(IKChangeSet *)self movedIndexesByNewIndex];
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      objc_super v24 = __35__IKChangeSet_newIndexForOldIndex___block_invoke_2;
      v25 = &unk_1E6DE5D28;
      id v16 = v11;
      id v26 = v16;
      id v17 = v14;
      id v27 = v17;
      [v15 enumerateKeysAndObjectsUsingBlock:&v22];

      for (uint64_t i = objc_msgSend(v16, "indexLessThanIndex:", a3, v22, v23, v24, v25);
            i != 0x7FFFFFFFFFFFFFFFLL;
            uint64_t i = objc_msgSend(v16, "indexLessThanIndex:"))
      {
        --v30[3];
      }
      for (uint64_t j = [v17 firstIndex]; j != 0x7FFFFFFFFFFFFFFFLL; uint64_t j = objc_msgSend(v17, "indexGreaterThanIndex:"))
      {
        uint64_t v20 = v30[3];
        if (j > v20) {
          break;
        }
        v30[3] = v20 + 1;
      }

      int64_t v7 = v30[3];
    }
    _Block_object_dispose(&v29, 8);
  }
  return v7;
}

void __35__IKChangeSet_newIndexForOldIndex___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  if ([a3 integerValue] == *(void *)(a1 + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v7 integerValue];
    *a4 = 1;
  }
}

uint64_t __35__IKChangeSet_newIndexForOldIndex___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  objc_msgSend(v5, "addIndex:", objc_msgSend(a3, "integerValue"));
  id v7 = *(void **)(a1 + 40);
  uint64_t v8 = [v6 integerValue];

  return [v7 addIndex:v8];
}

- (int64_t)oldIndexForNewIndex:(int64_t)a3
{
  v5 = [(IKChangeSet *)self addedIndexes];
  char v6 = [v5 containsIndex:a3];

  if (v6) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v8 = [(IKChangeSet *)self movedIndexesByNewIndex];
  v9 = [NSNumber numberWithInteger:a3];
  id v10 = [v8 objectForKeyedSubscript:v9];

  if (!v10) {
    goto LABEL_5;
  }
  id v11 = [(IKChangeSet *)self movedIndexesByNewIndex];
  id v12 = [NSNumber numberWithInteger:a3];
  id v13 = [v11 objectForKeyedSubscript:v12];
  int64_t v7 = [v13 integerValue];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_5:
    v14 = [(IKChangeSet *)self removedIndexes];
    if (v14)
    {
      uint64_t v15 = [(IKChangeSet *)self removedIndexes];
      id v16 = (void *)[v15 mutableCopy];
    }
    else
    {
      id v16 = [MEMORY[0x1E4F28E60] indexSet];
    }

    id v17 = [(IKChangeSet *)self addedIndexes];
    if (v17)
    {
      v18 = [(IKChangeSet *)self addedIndexes];
      uint64_t v19 = (void *)[v18 mutableCopy];
    }
    else
    {
      uint64_t v19 = [MEMORY[0x1E4F28E60] indexSet];
    }

    uint64_t v20 = [(IKChangeSet *)self movedIndexesByNewIndex];
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    uint64_t v31 = __35__IKChangeSet_oldIndexForNewIndex___block_invoke;
    uint64_t v32 = &unk_1E6DE5D28;
    id v21 = v16;
    id v33 = v21;
    id v22 = v19;
    id v34 = v22;
    [v20 enumerateKeysAndObjectsUsingBlock:&v29];

    uint64_t v23 = objc_msgSend(v22, "indexLessThanIndex:", a3, v29, v30, v31, v32);
    if (v23 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (uint64_t i = v23; i != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = [v22 indexLessThanIndex:i])
        --a3;
    }
    int64_t v25 = [v21 firstIndex];
    if (v25 != 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v26 = v25;
      if (v25 <= a3)
      {
        do
        {
          ++a3;
          int64_t v27 = [v21 indexGreaterThanIndex:v26];
          if (v27 == 0x7FFFFFFFFFFFFFFFLL) {
            break;
          }
          int64_t v26 = v27;
        }
        while (v27 <= a3);
      }
    }

    return a3;
  }
  return v7;
}

uint64_t __35__IKChangeSet_oldIndexForNewIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  objc_msgSend(v5, "addIndex:", objc_msgSend(a3, "integerValue"));
  int64_t v7 = *(void **)(a1 + 40);
  uint64_t v8 = [v6 integerValue];

  return [v7 addIndex:v8];
}

- (int64_t)newIndexByShiftingOldIndex:(int64_t)a3 grouped:(BOOL)a4
{
  int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v5 = a4;
    uint64_t v8 = [(IKChangeSet *)self removedIndexes];
    if (v8)
    {
      v9 = [(IKChangeSet *)self removedIndexes];
      id v10 = (void *)[v9 mutableCopy];
    }
    else
    {
      id v10 = [MEMORY[0x1E4F28E60] indexSet];
    }

    id v11 = [(IKChangeSet *)self addedIndexes];
    if (v11)
    {
      id v12 = [(IKChangeSet *)self addedIndexes];
      id v13 = (void *)[v12 mutableCopy];
    }
    else
    {
      id v13 = [MEMORY[0x1E4F28E60] indexSet];
    }

    v14 = [(IKChangeSet *)self movedIndexesByNewIndex];
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    int64_t v25 = __50__IKChangeSet_newIndexByShiftingOldIndex_grouped___block_invoke;
    int64_t v26 = &unk_1E6DE5D28;
    id v15 = v10;
    id v27 = v15;
    id v16 = v13;
    id v28 = v16;
    [v14 enumerateKeysAndObjectsUsingBlock:&v23];

    int64_t v17 = objc_msgSend(v15, "firstIndex", v23, v24, v25, v26);
    if (v17 >= a3)
    {
      int64_t v4 = a3;
    }
    else
    {
      int64_t v18 = v17;
      int64_t v4 = a3;
      do
      {
        --v4;
        int64_t v18 = [v15 indexGreaterThanIndex:v18];
      }
      while (v18 < a3);
    }
    uint64_t v19 = objc_msgSend(v16, "firstIndex", v18);
    if (v19 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (uint64_t i = v19; i != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = objc_msgSend(v16, "indexGreaterThanIndex:"))
      {
        BOOL v21 = v4 == i && v5;
        if (i >= v4 && !v21) {
          break;
        }
        ++v4;
      }
    }
  }
  return v4;
}

uint64_t __50__IKChangeSet_newIndexByShiftingOldIndex_grouped___block_invoke(uint64_t a1, void *a2, void *a3)
{
  BOOL v5 = *(void **)(a1 + 32);
  id v6 = a2;
  objc_msgSend(v5, "addIndex:", objc_msgSend(a3, "integerValue"));
  int64_t v7 = *(void **)(a1 + 40);
  uint64_t v8 = [v6 integerValue];

  return [v7 addIndex:v8];
}

- (id)inverseChangeSet
{
  v3 = [(IKChangeSet *)self removedIndexes];
  int64_t v4 = [(IKChangeSet *)self addedIndexes];
  BOOL v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = [(IKChangeSet *)self movedIndexesByNewIndex];
  int64_t v7 = objc_msgSend(v5, "dictionaryWithCapacity:", objc_msgSend(v6, "count"));

  uint64_t v8 = [(IKChangeSet *)self movedIndexesByNewIndex];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __31__IKChangeSet_inverseChangeSet__block_invoke;
  v26[3] = &unk_1E6DE5D50;
  id v9 = v7;
  id v27 = v9;
  [v8 enumerateKeysAndObjectsUsingBlock:v26];

  id v10 = (void *)MEMORY[0x1E4F1CA60];
  id v11 = [(IKChangeSet *)self updatedIndexesByNewIndex];
  id v12 = objc_msgSend(v10, "dictionaryWithCapacity:", objc_msgSend(v11, "count"));

  id v13 = [(IKChangeSet *)self updatedIndexesByNewIndex];
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  uint64_t v23 = __31__IKChangeSet_inverseChangeSet__block_invoke_2;
  uint64_t v24 = &unk_1E6DE5D50;
  id v14 = v12;
  id v25 = v14;
  [v13 enumerateKeysAndObjectsUsingBlock:&v21];

  id v15 = [IKChangeSet alloc];
  uint64_t v16 = objc_msgSend(v9, "count", v21, v22, v23, v24);
  if (v16) {
    int64_t v17 = (void *)[v9 copy];
  }
  else {
    int64_t v17 = 0;
  }
  if ([v14 count])
  {
    int64_t v18 = (void *)[v14 copy];
    uint64_t v19 = [(IKChangeSet *)v15 initWithAddedIndexes:v3 removedIndexes:v4 movedIndexesByNewIndex:v17 updatedIndexesByNewIndex:v18];

    if (!v16) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v19 = [(IKChangeSet *)v15 initWithAddedIndexes:v3 removedIndexes:v4 movedIndexesByNewIndex:v17 updatedIndexesByNewIndex:0];
  if (v16) {
LABEL_6:
  }

LABEL_7:
  v19->_reducing = 1;

  return v19;
}

uint64_t __31__IKChangeSet_inverseChangeSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:a3];
}

uint64_t __31__IKChangeSet_inverseChangeSet__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:a3];
}

- (id)changeSetByConcatenatingChangeSet:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 addedIndexes];
  if (v5)
  {
    id v6 = [v4 addedIndexes];
    int64_t v7 = (void *)[v6 mutableCopy];
  }
  else
  {
    int64_t v7 = [MEMORY[0x1E4F28E60] indexSet];
  }

  uint64_t v8 = [(IKChangeSet *)self addedIndexes];
  if (v8)
  {
    id v9 = [(IKChangeSet *)self addedIndexes];
    uint64_t v10 = [v9 firstIndex];

    while (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = [v4 newIndexForOldIndex:v10];
      if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
        [v7 addIndex:v11];
      }
      id v12 = [(IKChangeSet *)self addedIndexes];
      uint64_t v10 = [v12 indexGreaterThanIndex:v10];
    }
  }
  else
  {
  }
  id v13 = [(IKChangeSet *)self removedIndexes];
  if (v13)
  {
    id v14 = [(IKChangeSet *)self removedIndexes];
    id v15 = (void *)[v14 mutableCopy];
  }
  else
  {
    id v15 = [MEMORY[0x1E4F28E60] indexSet];
  }

  uint64_t v16 = [v4 removedIndexes];
  if (v16)
  {
    int64_t v17 = [v4 removedIndexes];
    uint64_t v18 = [v17 firstIndex];

    while (v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v19 = [(IKChangeSet *)self oldIndexForNewIndex:v18];
      if (v19 != 0x7FFFFFFFFFFFFFFFLL) {
        [v15 addIndex:v19];
      }
      uint64_t v20 = [v4 removedIndexes];
      uint64_t v18 = [v20 indexGreaterThanIndex:v18];
    }
  }
  else
  {
  }
  uint64_t v21 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v22 = [(IKChangeSet *)self movedIndexesByNewIndex];
  uint64_t v23 = [v22 count];
  uint64_t v24 = [v4 movedIndexesByNewIndex];
  id v25 = objc_msgSend(v21, "dictionaryWithCapacity:", objc_msgSend(v24, "count") + v23);

  int64_t v26 = [(IKChangeSet *)self movedIndexesByNewIndex];
  v86[0] = MEMORY[0x1E4F143A8];
  v86[1] = 3221225472;
  v86[2] = __49__IKChangeSet_changeSetByConcatenatingChangeSet___block_invoke;
  v86[3] = &unk_1E6DE5D28;
  id v27 = v4;
  id v87 = v27;
  id v28 = v25;
  id v88 = v28;
  [v26 enumerateKeysAndObjectsUsingBlock:v86];

  uint64_t v29 = [v27 movedIndexesByNewIndex];
  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = __49__IKChangeSet_changeSetByConcatenatingChangeSet___block_invoke_2;
  v84[3] = &unk_1E6DE5D28;
  v84[4] = self;
  id v71 = v28;
  id v85 = v71;
  [v29 enumerateKeysAndObjectsUsingBlock:v84];

  v68 = v15;
  v69 = v7;
  if ([v27 isReducing])
  {
    id v66 = v27;
    v67 = [v27 addedIndexes];
    v70 = [(IKChangeSet *)self removedIndexes];
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __49__IKChangeSet_changeSetByConcatenatingChangeSet___block_invoke_3;
    v81[3] = &unk_1E6DE5D28;
    id v30 = v15;
    id v82 = v30;
    id v31 = v7;
    id v83 = v31;
    uint64_t v32 = v71;
    [v71 enumerateKeysAndObjectsUsingBlock:v81];
    uint64_t v33 = [v30 firstIndex];
    if (v33 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (uint64_t i = v33; i != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = [v30 indexGreaterThanIndex:i])
      {
        uint64_t v35 = [v30 indexLessThanIndex:i];
        uint64_t v36 = i;
        if (v35 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v37 = v35;
          uint64_t v36 = i;
          do
          {
            --v36;
            uint64_t v37 = [v30 indexLessThanIndex:v37];
          }
          while (v37 != 0x7FFFFFFFFFFFFFFFLL);
        }
        uint64_t v38 = [v31 firstIndex];
        if (v38 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v39 = v38;
          while (v39 < v36)
          {
            ++v36;
            uint64_t v39 = [v31 indexGreaterThanIndex:v39];
            if (v39 == 0x7FFFFFFFFFFFFFFFLL) {
              goto LABEL_36;
            }
          }
          if ([v70 containsIndex:i]
            && ([v67 containsIndex:v39] & 1) != 0)
          {
            goto LABEL_35;
          }
          v40 = [NSNumber numberWithInteger:v39];
          v41 = [v32 objectForKeyedSubscript:v40];
          v42 = [NSNumber numberWithInteger:i];
          int v43 = [v41 isEqualToNumber:v42];

          uint64_t v32 = v71;
          if (v43)
          {
LABEL_35:
            [v30 removeIndex:i];
            [v31 removeIndex:v36];
            v44 = [NSNumber numberWithInteger:i];
            [v32 removeObjectForKey:v44];
          }
        }
LABEL_36:
        ;
      }
    }
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __49__IKChangeSet_changeSetByConcatenatingChangeSet___block_invoke_4;
    v78[3] = &unk_1E6DE5D28;
    id v79 = v30;
    id v80 = v31;
    [v32 enumerateKeysAndObjectsUsingBlock:v78];

    id v15 = v68;
    int64_t v7 = v69;
    id v27 = v66;
  }
  v45 = (void *)MEMORY[0x1E4F1CA60];
  v46 = [(IKChangeSet *)self updatedIndexesByNewIndex];
  uint64_t v47 = [v46 count];
  v48 = [v27 updatedIndexesByNewIndex];
  v49 = objc_msgSend(v45, "dictionaryWithCapacity:", objc_msgSend(v48, "count") + v47);

  v50 = [(IKChangeSet *)self updatedIndexesByNewIndex];
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __49__IKChangeSet_changeSetByConcatenatingChangeSet___block_invoke_5;
  v75[3] = &unk_1E6DE5D28;
  id v51 = v27;
  id v76 = v51;
  id v52 = v49;
  id v77 = v52;
  [v50 enumerateKeysAndObjectsUsingBlock:v75];

  v53 = [v51 updatedIndexesByNewIndex];
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __49__IKChangeSet_changeSetByConcatenatingChangeSet___block_invoke_6;
  v72[3] = &unk_1E6DE5D78;
  v72[4] = self;
  id v54 = v52;
  id v73 = v54;
  id v55 = v51;
  id v74 = v55;
  [v53 enumerateKeysAndObjectsUsingBlock:v72];

  v56 = [IKChangeSet alloc];
  uint64_t v57 = [v7 count];
  if (v57) {
    v58 = (void *)[v7 copy];
  }
  else {
    v58 = 0;
  }
  uint64_t v59 = [v15 count];
  if (v59) {
    v60 = (void *)[v15 copy];
  }
  else {
    v60 = 0;
  }
  uint64_t v61 = [v71 count];
  if (v61) {
    v62 = (void *)[v71 copy];
  }
  else {
    v62 = 0;
  }
  if ([v54 count])
  {
    v63 = (void *)[v54 copy];
    v64 = [(IKChangeSet *)v56 initWithAddedIndexes:v58 removedIndexes:v60 movedIndexesByNewIndex:v62 updatedIndexesByNewIndex:v63];

    if (!v61) {
      goto LABEL_50;
    }
    goto LABEL_49;
  }
  v64 = [(IKChangeSet *)v56 initWithAddedIndexes:v58 removedIndexes:v60 movedIndexesByNewIndex:v62 updatedIndexesByNewIndex:0];
  if (v61) {
LABEL_49:
  }

LABEL_50:
  if (v59) {

  }
  if (v57) {
  return v64;
  }
}

void __49__IKChangeSet_changeSetByConcatenatingChangeSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "newIndexForOldIndex:", objc_msgSend(a2, "integerValue"));
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = *(void **)(a1 + 40);
    int64_t v7 = [NSNumber numberWithInteger:v5];
    [v6 setObject:v8 forKeyedSubscript:v7];
  }
}

void __49__IKChangeSet_changeSetByConcatenatingChangeSet___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "oldIndexForNewIndex:", objc_msgSend(a3, "integerValue"));
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [NSNumber numberWithInteger:v5];
    [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v7];
  }
}

uint64_t __49__IKChangeSet_changeSetByConcatenatingChangeSet___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  objc_msgSend(v5, "addIndex:", objc_msgSend(a3, "integerValue"));
  id v7 = *(void **)(a1 + 40);
  uint64_t v8 = [v6 integerValue];

  return [v7 addIndex:v8];
}

uint64_t __49__IKChangeSet_changeSetByConcatenatingChangeSet___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  objc_msgSend(v5, "removeIndex:", objc_msgSend(a3, "integerValue"));
  id v7 = *(void **)(a1 + 40);
  uint64_t v8 = [v6 integerValue];

  return [v7 removeIndex:v8];
}

void __49__IKChangeSet_changeSetByConcatenatingChangeSet___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "newIndexForOldIndex:", objc_msgSend(a2, "integerValue"));
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = [NSNumber numberWithInteger:v5];
    [v6 setObject:v8 forKeyedSubscript:v7];
  }
}

void __49__IKChangeSet_changeSetByConcatenatingChangeSet___block_invoke_6(id *a1, void *a2, void *a3)
{
  id v11 = a2;
  uint64_t v5 = objc_msgSend(a1[4], "oldIndexForNewIndex:", objc_msgSend(a3, "integerValue"));
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = v5;
    uint64_t v7 = [a1[5] objectForKeyedSubscript:v11];
    if (v7 && (id v8 = (void *)v7, v9 = [a1[6] isReducing], v8, v9))
    {
      [a1[5] removeObjectForKey:v11];
    }
    else
    {
      uint64_t v10 = [NSNumber numberWithInteger:v6];
      [a1[5] setObject:v10 forKeyedSubscript:v11];
    }
  }
}

- (id)changeSetBySubtractingChangeSet:(id)a3
{
  id v4 = [a3 inverseChangeSet];
  uint64_t v5 = [(IKChangeSet *)self changeSetByConcatenatingChangeSet:v4];

  return v5;
}

- (id)changeSetByConvertingOldIndexesUsingChangeSet:(id)a3 andNewIndexesUsingChangeSet:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(IKChangeSet *)self changeSetByConcatenatingChangeSet:a4];
  id v8 = [v6 inverseChangeSet];

  int v9 = [v8 changeSetByConcatenatingChangeSet:v7];

  return v9;
}

- (NSIndexSet)addedIndexes
{
  return self->_addedIndexes;
}

- (NSIndexSet)removedIndexes
{
  return self->_removedIndexes;
}

- (NSDictionary)movedIndexesByNewIndex
{
  return self->_movedIndexesByNewIndex;
}

- (NSDictionary)updatedIndexesByNewIndex
{
  return self->_updatedIndexesByNewIndex;
}

- (BOOL)isReducing
{
  return self->_reducing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedIndexesByNewIndex, 0);
  objc_storeStrong((id *)&self->_movedIndexesByNewIndex, 0);
  objc_storeStrong((id *)&self->_removedIndexes, 0);
  objc_storeStrong((id *)&self->_addedIndexes, 0);
}

@end