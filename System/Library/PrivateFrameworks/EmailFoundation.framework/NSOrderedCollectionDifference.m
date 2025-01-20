@interface NSOrderedCollectionDifference
- (id)_groupedInsertionsByObjectForCollection:(int)a3 inferMoves:;
- (void)_groupedInsertionAndMoves:(void *)a1;
- (void)_groupedInsertionsWithObjectsToInsert:(void *)a3 insertGroup:;
@end

@implementation NSOrderedCollectionDifference

void __79__NSOrderedCollectionDifference_EmailFoundationAdditions__ef_groupedInsertions__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  v6 = [[EFOrderedCollectionGroupedInsertion alloc] initWithObjects:v7 index:a2];
  [*(id *)(a1 + 32) addObject:v6];
}

- (void)_groupedInsertionsWithObjectsToInsert:(void *)a3 insertGroup:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v18 = a3;
  if (!a1) {
    goto LABEL_21;
  }
  v6 = [a1 insertions];
  uint64_t v7 = [v6 count];

  if (!v7) {
    goto LABEL_21;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v8 = [a1 insertions];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v9)
  {

    goto LABEL_21;
  }
  uint64_t v10 = 0;
  uint64_t v11 = *(void *)v20;
  v17 = (char *)(v18 + 2);
  uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(v8);
      }
      v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v12 = [*(id *)(*((void *)&v19 + 1) + 8 * i) index];
        v15 = [v14 object];
        [v5 addObject:v15];
      }
      else
      {
        if ([*(id *)(*((void *)&v19 + 1) + 8 * i) index] == v10 + v12)
        {
          v15 = [v14 object];
          [v5 addObject:v15];
          ++v10;
          goto LABEL_16;
        }
        if (v10)
        {
          v16 = (void *)[v5 copy];
          v18[2](v18, v12, v10, v16);
        }
        uint64_t v12 = objc_msgSend(v14, "index", v17);
        [v5 removeAllObjects];
        v15 = [v14 object];
        [v5 addObject:v15];
      }
      uint64_t v10 = 1;
LABEL_16:
    }
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v9);

  if (v10) {
    v18[2](v18, v12, v10, v5);
  }
LABEL_21:
}

BOOL __84__NSOrderedCollectionDifference_EmailFoundationAdditions__ef_removalsExcludingMoves__block_invoke(uint64_t a1, void *a2)
{
  return [a2 associatedIndex] == 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_groupedInsertionsByObjectForCollection:(int)a3 inferMoves:
{
  id v5 = a2;
  if (a1)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    if (a3)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __110__NSOrderedCollectionDifference_EmailFoundationAdditions___groupedInsertionsByObjectForCollection_inferMoves___block_invoke;
      v13[3] = &unk_1E6122748;
      uint64_t v7 = &v14;
      id v14 = v5;
      v8 = &v15;
      id v15 = v6;
      -[NSOrderedCollectionDifference _groupedInsertionAndMoves:](a1, v13);
    }
    else
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __110__NSOrderedCollectionDifference_EmailFoundationAdditions___groupedInsertionsByObjectForCollection_inferMoves___block_invoke_2;
      v10[3] = &unk_1E6122770;
      uint64_t v7 = &v11;
      id v11 = v5;
      v8 = &v12;
      id v12 = v6;
      -[NSOrderedCollectionDifference _groupedInsertionsWithObjectsToInsert:insertGroup:](a1, 0, v10);
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __110__NSOrderedCollectionDifference_EmailFoundationAdditions___groupedInsertionsByObjectForCollection_inferMoves___block_invoke(uint64_t a1, char *a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "ef_subarrayWithRange:", a2, a3);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    uint64_t v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v7 - 1];
  }
  if ([*(id *)(a1 + 32) count] <= a4)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a4];
  }
  uint64_t v10 = [[EFOrderedCollectionGroupedInsertionByObject alloc] initWithObjects:v11 previousObject:v7 nextObject:v9 isMove:a5];
  [*(id *)(a1 + 40) addObject:v10];
}

- (void)_groupedInsertionAndMoves:(void *)a1
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    v4 = [a1 insertions];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      id v21 = v3;
      id v6 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      uint64_t v33 = 0;
      v34 = &v33;
      uint64_t v35 = 0x3010000000;
      v36 = &unk_1B5ADDE1D;
      long long v37 = xmmword_1B5AD33D0;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __85__NSOrderedCollectionDifference_EmailFoundationAdditions___groupedInsertionAndMoves___block_invoke;
      aBlock[3] = &unk_1E6122798;
      v32 = &v33;
      id v7 = v6;
      id v31 = v7;
      v8 = (void (**)(void *, void *))_Block_copy(aBlock);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __85__NSOrderedCollectionDifference_EmailFoundationAdditions___groupedInsertionAndMoves___block_invoke_2;
      v26[3] = &unk_1E61227E8;
      v29 = &v33;
      id v20 = v7;
      id v27 = v20;
      id v28 = v3;
      uint64_t v9 = (void (**)(void))_Block_copy(v26);
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      uint64_t v10 = [a1 insertions];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v38 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v23;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v23 != v12) {
              objc_enumerationMutation(v10);
            }
            id v14 = *(void **)(*((void *)&v22 + 1) + 8 * v13);
            if (v34[4] == 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v15 = [*(id *)(*((void *)&v22 + 1) + 8 * v13) index];
              v34[4] = v15;
            }
            else
            {
              uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v13), "index", v20);
              uint64_t v17 = v34[5];
              if (v16 != v17 + v34[4])
              {
                if (v17) {
                  v9[2](v9);
                }
                uint64_t v18 = [v14 index];
                long long v19 = v34;
                v34[4] = v18;
                v19[5] = 0;
              }
            }
            v8[2](v8, v14);
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v38 count:16];
        }
        while (v11);
      }

      if (v34[5]) {
        v9[2](v9);
      }

      _Block_object_dispose(&v33, 8);
      id v3 = v21;
    }
  }
}

void __110__NSOrderedCollectionDifference_EmailFoundationAdditions___groupedInsertionsByObjectForCollection_inferMoves___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "ef_subarrayWithRange:", a2, a3);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  if (a2)
  {
    v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2 - 1];
  }
  else
  {
    v8 = 0;
  }
  if (a2 + a3 >= (unint64_t)[*(id *)(a1 + 32) count])
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
  }
  uint64_t v10 = [[EFOrderedCollectionGroupedInsertionByObject alloc] initWithObjects:v11 previousObject:v8 nextObject:v9 isMove:0];
  [*(id *)(a1 + 40) addObject:v10];
}

void __85__NSOrderedCollectionDifference_EmailFoundationAdditions___groupedInsertionAndMoves___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v4 = v3;
  if ([v3 associatedIndex] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(v4, "index"));
  }
}

void __85__NSOrderedCollectionDifference_EmailFoundationAdditions___groupedInsertionAndMoves___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v3 = *(void *)(v2 + 32);
  uint64_t v4 = *(void *)(v2 + 40);
  uint64_t v5 = [*(id *)(a1 + 32) firstIndex];
  uint64_t v6 = v4;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "firstIndex", v4) - *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32);
  }
  uint64_t v7 = v4 + v3;
  if (v6) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__NSOrderedCollectionDifference_EmailFoundationAdditions___groupedInsertionAndMoves___block_invoke_3;
  v9[3] = &unk_1E61227C0;
  v8 = *(void **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  uint64_t v12 = v7;
  id v10 = *(id *)(a1 + 32);
  [v8 enumerateRangesUsingBlock:v9];
  [*(id *)(a1 + 32) removeAllIndexes];
}

uint64_t __85__NSOrderedCollectionDifference_EmailFoundationAdditions___groupedInsertionAndMoves___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v7 = a2 + a3;
  if (v7 != *(void *)(a1 + 48))
  {
    uint64_t v8 = [*(id *)(a1 + 32) indexGreaterThanIndex:v7];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v9 = *(void *)(a1 + 48);
    }
    else {
      uint64_t v9 = v8;
    }
    id v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16);
    uint64_t v11 = *(void *)(a1 + 40);
    return v10(v11, v7, v9 - v7);
  }
  return result;
}

@end