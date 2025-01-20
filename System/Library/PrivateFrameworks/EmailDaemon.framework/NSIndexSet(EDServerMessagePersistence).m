@interface NSIndexSet(EDServerMessagePersistence)
- (__CFString)_uidQueryExpressionForRanges:()EDServerMessagePersistence andSingleUIDs:withTableName:;
- (id)_uidRangesAndSingleUIDs:()EDServerMessagePersistence;
- (id)ed_logDescription;
- (id)ed_nextRangesWithRangeCountLimit:()EDServerMessagePersistence reverseEnumeration:;
- (id)ed_uidQueryExpressionWithTableName:()EDServerMessagePersistence;
- (uint64_t)ed_enumerateUIDsWithLimit:()EDServerMessagePersistence reverseEnumeration:usingBlock:;
- (uint64_t)ed_uidQueryExpression;
- (void)_addUIDsFromRange:()EDServerMessagePersistence toArray:;
- (void)ed_enumerateUIDsWithLimit:()EDServerMessagePersistence reverseEnumeration:queryRangeCountLimit:batchLimit:usingBlock:;
@end

@implementation NSIndexSet(EDServerMessagePersistence)

- (uint64_t)ed_enumerateUIDsWithLimit:()EDServerMessagePersistence reverseEnumeration:usingBlock:
{
  return objc_msgSend(a1, "ed_enumerateUIDsWithLimit:reverseEnumeration:queryRangeCountLimit:batchLimit:usingBlock:", a3, a4, 900, 500, a5);
}

- (void)ed_enumerateUIDsWithLimit:()EDServerMessagePersistence reverseEnumeration:queryRangeCountLimit:batchLimit:usingBlock:
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  if (a3) {
    uint64_t v12 = a3;
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v33 = v12;
  v34 = (void (**)(void, void, void))v11;
  v13 = +[EDServerMessagePersistence log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134219264;
    uint64_t v36 = (uint64_t)a1;
    __int16 v37 = 2048;
    uint64_t v38 = [a1 count];
    __int16 v39 = 2048;
    unint64_t v40 = v33;
    __int16 v41 = 1024;
    int v42 = a4;
    __int16 v43 = 2048;
    uint64_t v44 = a5;
    __int16 v45 = 2048;
    unint64_t v46 = a6;
    _os_log_debug_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEBUG, "%p: fetching %llu UIDs, limit %llu, reverse %{BOOL}d, range count limit %llu, batch limit %llu.", buf, 0x3Au);
  }
  uint64_t v31 = (uint64_t)a1;

  v14 = (void *)[a1 mutableCopy];
  unint64_t v15 = 0;
  *(void *)&long long v16 = 134218496;
  long long v30 = v16;
  while (objc_msgSend(v14, "count", v30) && v33 > v15)
  {
    v17 = (void *)MEMORY[0x1E0190280]();
    if (v33 - v15 >= a6) {
      unint64_t v18 = a6;
    }
    else {
      unint64_t v18 = v33 - v15;
    }
    v19 = objc_msgSend(v14, "ed_nextRangesWithRangeCountLimit:reverseEnumeration:", a5, a4);
    v20 = +[EDServerMessagePersistence log];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v27 = objc_msgSend(v19, "ed_logDescription");
      *(_DWORD *)buf = 134218498;
      uint64_t v36 = v31;
      __int16 v37 = 2114;
      uint64_t v38 = (uint64_t)v27;
      __int16 v39 = 2048;
      unint64_t v40 = v18;
      _os_log_debug_impl(&dword_1DB39C000, v20, OS_LOG_TYPE_DEBUG, "%p: fetching UIDs {%{public}@} with limit %llu", buf, 0x20u);
    }
    v21 = ((void (**)(void, void *, unint64_t))v34)[2](v34, v19, v18);
    v22 = +[EDServerMessagePersistence log];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v28 = objc_msgSend(v21, "ed_logDescription");
      *(_DWORD *)buf = 134218242;
      uint64_t v36 = v31;
      __int16 v37 = 2114;
      uint64_t v38 = (uint64_t)v28;
      _os_log_debug_impl(&dword_1DB39C000, v22, OS_LOG_TYPE_DEBUG, "%p: got UIDs {%{public}@}", buf, 0x16u);
    }
    unint64_t v23 = [v21 count];
    unint64_t v24 = v23;
    if (v23 >= v18)
    {
      if (v23 > v18)
      {
        v25 = +[EDServerMessagePersistence log];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v30;
          uint64_t v36 = v31;
          __int16 v37 = 2048;
          uint64_t v38 = v24;
          __int16 v39 = 2048;
          unint64_t v40 = v18;
          _os_log_error_impl(&dword_1DB39C000, v25, OS_LOG_TYPE_ERROR, "%p: got more UIDs in batch (%lu) than allowed (%lu)", buf, 0x20u);
        }
      }
      if (a4)
      {
        uint64_t v26 = [v21 firstIndex];
        objc_msgSend(v14, "removeIndexesInRange:", v26, objc_msgSend(v14, "lastIndex") - v26 + 1);
      }
      else
      {
        objc_msgSend(v14, "removeIndexesInRange:", 0, objc_msgSend(v21, "lastIndex") + 1);
      }
    }
    else if ([v14 isEqualToIndexSet:v19])
    {
      [v14 removeAllIndexes];
    }
    else
    {
      [v14 removeIndexes:v19];
    }

    v15 += v24;
  }
  v29 = +[EDServerMessagePersistence log];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
    -[NSIndexSet(EDServerMessagePersistence) ed_enumerateUIDsWithLimit:reverseEnumeration:queryRangeCountLimit:batchLimit:usingBlock:](v31, v29);
  }
}

- (id)ed_nextRangesWithRangeCountLimit:()EDServerMessagePersistence reverseEnumeration:
{
  if ([a1 count])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v15[3] = 0;
    if (a4) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 0;
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __94__NSIndexSet_EDServerMessagePersistence__ed_nextRangesWithRangeCountLimit_reverseEnumeration___block_invoke;
    v11[3] = &unk_1E6C06580;
    v13 = v15;
    uint64_t v14 = a3;
    id v9 = v7;
    id v12 = v9;
    [a1 enumerateRangesWithOptions:v8 usingBlock:v11];

    _Block_object_dispose(v15, 8);
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28D60] indexSet];
  }

  return v9;
}

- (uint64_t)ed_uidQueryExpression
{
  return objc_msgSend(a1, "ed_uidQueryExpressionWithTableName:", 0);
}

- (id)ed_uidQueryExpressionWithTableName:()EDServerMessagePersistence
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6 = [a1 _uidRangesAndSingleUIDs:v5];
  if ((unint64_t)[v6 count] >= 0x3DF)
  {
    id v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_580];

    objc_msgSend(v7, "ef_suffix:", objc_msgSend(v7, "count") - 990);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "rangeValue", (void)v16);
          objc_msgSend(a1, "_addUIDsFromRange:toArray:", v12, v13, v5);
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    v6 = objc_msgSend(v7, "ef_prefix:", 990);
  }
  uint64_t v14 = objc_msgSend(a1, "_uidQueryExpressionForRanges:andSingleUIDs:withTableName:", v6, v5, v4, (void)v16);

  return v14;
}

- (id)_uidRangesAndSingleUIDs:()EDServerMessagePersistence
{
  id v4 = a3;
  if ([a1 count])
  {
    id v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__NSIndexSet_EDServerMessagePersistence___uidRangesAndSingleUIDs___block_invoke;
    v9[3] = &unk_1E6C065C8;
    v9[4] = a1;
    id v10 = v4;
    id v6 = v5;
    id v11 = v6;
    [a1 enumerateRangesUsingBlock:v9];
    id v7 = objc_msgSend(v6, "ef_notEmpty");
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_addUIDsFromRange:()EDServerMessagePersistence toArray:
{
  id v8 = a5;
  if (a3 < a3 + a4)
  {
    do
    {
      id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a3);
      [v8 addObject:v7];

      ++a3;
      --a4;
    }
    while (a4);
  }
}

- (__CFString)_uidQueryExpressionForRanges:()EDServerMessagePersistence andSingleUIDs:withTableName:
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 stringByAppendingString:@".remote_id"];
  }
  else
  {
    id v11 = @"remote_id";
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __99__NSIndexSet_EDServerMessagePersistence___uidQueryExpressionForRanges_andSingleUIDs_withTableName___block_invoke;
  v20[3] = &unk_1E6C065F0;
  uint64_t v12 = v11;
  uint64_t v21 = v12;
  uint64_t v13 = objc_msgSend(v7, "ef_map:", v20);
  if ([v8 count])
  {
    uint64_t v14 = NSString;
    unint64_t v15 = [v8 componentsJoinedByString:@", "];
    long long v16 = [v14 stringWithFormat:@"(%@ IN (%@))", v12, v15];

    if (v13)
    {
      uint64_t v17 = [v13 arrayByAddingObject:v16];

      uint64_t v13 = (void *)v17;
    }
    else
    {
      v22[0] = v16;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    }
  }
  if ([v13 count])
  {
    if ([v13 count] == 1) {
      [v13 firstObject];
    }
    else {
    long long v18 = [v13 componentsJoinedByString:@" OR "];
    }
  }
  else
  {
    long long v18 = @"0";
  }

  return v18;
}

- (id)ed_logDescription
{
  v2 = (void *)MEMORY[0x1E0190280]();
  v3 = [MEMORY[0x1E4F1CA48] array];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__NSIndexSet_EDServerMessagePersistence__ed_logDescription__block_invoke;
  v7[3] = &unk_1E6C06618;
  id v4 = v3;
  id v8 = v4;
  [a1 enumerateRangesWithOptions:0 usingBlock:v7];
  id v5 = [v4 componentsJoinedByString:@","];

  return v5;
}

- (void)ed_enumerateUIDsWithLimit:()EDServerMessagePersistence reverseEnumeration:queryRangeCountLimit:batchLimit:usingBlock:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_DEBUG, "%p: done.", (uint8_t *)&v2, 0xCu);
}

@end