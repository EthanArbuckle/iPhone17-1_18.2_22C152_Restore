@interface NSExpression(_NSCoreDataSQLPredicateCategories)
- (id)_keypathsForDerivedPropertyValidation:()_NSCoreDataSQLPredicateCategories;
@end

@implementation NSExpression(_NSCoreDataSQLPredicateCategories)

- (id)_keypathsForDerivedPropertyValidation:()_NSCoreDataSQLPredicateCategories
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v26 = 0;
  uint64_t v6 = [a1 expressionType];
  if (v6 > 9)
  {
    if (v6 == 10)
    {
      uint64_t v7 = [a1 keyPath];
      goto LABEL_19;
    }
    if (v6 != 14) {
      goto LABEL_27;
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v8 = objc_msgSend(a1, "collection", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v23;
      int v11 = 1;
LABEL_9:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v8);
        }
        v13 = (void *)[*(id *)(*((void *)&v22 + 1) + 8 * v12) _keypathsForDerivedPropertyValidation:&v26];
        v14 = v13;
        if (!v13) {
          goto LABEL_30;
        }
        if ([v13 count]) {
          objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(v14, "allObjects"));
        }
        if (v9 == ++v12)
        {
          uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v29 count:16];
          v14 = 0;
          if (v9) {
            goto LABEL_9;
          }
          goto LABEL_21;
        }
      }
    }
  }
  else if ((unint64_t)v6 >= 2)
  {
    if (v6 == 2)
    {
      uint64_t v7 = [a1 predicateFormat];
LABEL_19:
      [v5 addObject:v7];
      goto LABEL_20;
    }
LABEL_27:
    if (a3)
    {
      v20 = (void *)MEMORY[0x1E4F28C58];
      v27 = @"expression";
      v28 = a1;
      uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      v14 = 0;
      int v11 = 0;
      *a3 = (id)[v20 errorWithDomain:*MEMORY[0x1E4F281F8] code:134097 userInfo:v21];
      goto LABEL_21;
    }
    v14 = 0;
LABEL_30:
    int v11 = 0;
    goto LABEL_21;
  }
LABEL_20:
  v14 = 0;
  int v11 = 1;
LABEL_21:
  id v15 = v26;
  if (a3 && v26) {
    *a3 = v26;
  }
  [0 drain];
  id v16 = v14;
  id v17 = v26;
  id v18 = v5;
  if (v11) {
    return v5;
  }
  else {
    return 0;
  }
}

@end