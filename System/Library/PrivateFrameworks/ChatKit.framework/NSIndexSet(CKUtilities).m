@interface NSIndexSet(CKUtilities)
- (id)__ck_indexPathItemsInSection:()CKUtilities;
- (id)__ck_indexPathRowsInSection:()CKUtilities;
- (id)__ck_indexSetShiftedForInsertedIndexes:()CKUtilities removedIndexes:;
- (void)__ck_enumerateIndexesByProximityToIndex:()CKUtilities usingBlock:;
@end

@implementation NSIndexSet(CKUtilities)

- (id)__ck_indexPathRowsInSection:()CKUtilities
{
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__NSIndexSet_CKUtilities____ck_indexPathRowsInSection___block_invoke;
  v8[3] = &unk_1E56240B8;
  id v6 = v5;
  id v9 = v6;
  uint64_t v10 = a3;
  [a1 enumerateIndexesUsingBlock:v8];

  return v6;
}

- (id)__ck_indexPathItemsInSection:()CKUtilities
{
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__NSIndexSet_CKUtilities____ck_indexPathItemsInSection___block_invoke;
  v8[3] = &unk_1E56240B8;
  id v6 = v5;
  id v9 = v6;
  uint64_t v10 = a3;
  [a1 enumerateIndexesUsingBlock:v8];

  return v6;
}

- (void)__ck_enumerateIndexesByProximityToIndex:()CKUtilities usingBlock:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  unint64_t v7 = [a1 count];
  v8 = (char *)&v16 - ((8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v8, 8 * v7);
  [a1 getIndexes:v8 maxCount:v7 inIndexRange:0];
  unint64_t v9 = 0;
  if (!v7)
  {
LABEL_6:
    uint64_t v11 = v9 - 1;
    HIBYTE(v16) = 0;
    while (1)
    {
LABEL_7:
      if (v9 >= v7 && v11 < 0) {
        goto LABEL_24;
      }
      if (v9 >= v7 || v11 < 0)
      {
        if (v9 >= v7)
        {
          uint64_t v14 = *(void *)&v8[8 * v11];
LABEL_22:
          v6[2](v6, v14, (char *)&v16 + 7);
          --v11;
          goto LABEL_23;
        }
        uint64_t v12 = *(void *)&v8[8 * v9];
      }
      else
      {
        uint64_t v12 = *(void *)&v8[8 * v9];
        if ((uint64_t)(v12 - a3) >= 0) {
          unint64_t v13 = v12 - a3;
        }
        else {
          unint64_t v13 = a3 - v12;
        }
        uint64_t v14 = *(void *)&v8[8 * v11];
        unint64_t v15 = v14 - a3;
        if ((uint64_t)(v14 - a3) < 0) {
          unint64_t v15 = a3 - v14;
        }
        if (v13 > v15) {
          goto LABEL_22;
        }
      }
      v6[2](v6, v12, (char *)&v16 + 7);
      ++v9;
LABEL_23:
      if (HIBYTE(v16)) {
        goto LABEL_24;
      }
    }
  }
  while (1)
  {
    unint64_t v10 = *(void *)&v8[8 * v9];
    if (v10 == a3) {
      break;
    }
    if (v10 > a3) {
      goto LABEL_6;
    }
    if (v7 == ++v9)
    {
      unint64_t v9 = v7;
      goto LABEL_6;
    }
  }
  HIBYTE(v16) = 0;
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = 0x7FFFFFFFFFFFFFFELL;
    unint64_t v9 = 0x8000000000000000;
    goto LABEL_7;
  }
  v6[2](v6, a3, (char *)&v16 + 7);
  if (!HIBYTE(v16))
  {
    uint64_t v11 = v9++ - 1;
    goto LABEL_7;
  }
LABEL_24:
}

- (id)__ck_indexSetShiftedForInsertedIndexes:()CKUtilities removedIndexes:
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[a1 mutableCopy];
  if ([v7 count])
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    unint64_t v10 = [v7 firstIndex];
    uint64_t v11 = [v8 firstIndex];
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v12 = v11;
      uint64_t v13 = 0;
      do
      {
        for (; v10 < v12; unint64_t v10 = [v7 indexGreaterThanIndex:v10])
          ++v13;
        if (v10 != v12) {
          [v9 addIndex:v12 - v13];
        }
        unint64_t v12 = [v8 indexGreaterThanIndex:v12];
      }
      while (v12 != 0x7FFFFFFFFFFFFFFFLL);
    }
  }
  else
  {
    id v9 = v8;
  }
  if ([v6 count])
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    unint64_t v15 = [v6 firstIndex];
    uint64_t v16 = [v9 firstIndex];
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v17 = v16;
      uint64_t v18 = 0;
      do
      {
        while (v17 + v18 >= v15)
        {
          ++v18;
          unint64_t v15 = [v6 indexGreaterThanIndex:v15];
        }
        objc_msgSend(v14, "addIndex:");
        uint64_t v17 = [v9 indexGreaterThanIndex:v17];
      }
      while (v17 != 0x7FFFFFFFFFFFFFFFLL);
      [v6 indexGreaterThanIndex:v15];
    }
  }
  else
  {
    id v14 = v9;
  }

  return v14;
}

@end