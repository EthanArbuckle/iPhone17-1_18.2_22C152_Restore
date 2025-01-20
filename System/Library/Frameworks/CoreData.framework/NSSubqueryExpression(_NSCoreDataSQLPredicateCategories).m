@interface NSSubqueryExpression(_NSCoreDataSQLPredicateCategories)
- (id)_keypathsForDerivedPropertyValidation:()_NSCoreDataSQLPredicateCategories;
- (uint64_t)minimalFormInContext:()_NSCoreDataSQLPredicateCategories;
@end

@implementation NSSubqueryExpression(_NSCoreDataSQLPredicateCategories)

- (uint64_t)minimalFormInContext:()_NSCoreDataSQLPredicateCategories
{
  id v5 = (id)[a1 predicate];
  id v6 = (id)[a1 collection];
  id v7 = (id)[v5 minimalFormInContext:a3];
  id v8 = (id)[v6 minimalFormInContext:a3];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29068], "defaultInstance"), "isEqual:", v7)) {
    return (uint64_t)v8;
  }
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28C90], "defaultInstance"), "isEqual:", v7))
  {
    v10 = (void *)MEMORY[0x1E4F28C68];
    uint64_t v11 = NSArray_EmptyArray;
    return [v10 expressionForConstantValue:v11];
  }
  else
  {
    if (v7 == v5 && v8 == v6) {
      return (uint64_t)a1;
    }
    if (v7 == v5) {
      id v7 = (id)[v5 copy];
    }
    if (v8 == v6) {
      id v8 = (id)[v6 copy];
    }
    v12 = objc_msgSend((id)objc_msgSend(a1, "variableExpression"), "copy");
    id v13 = (id)[objc_alloc((Class)objc_opt_class()) initWithExpression:v8 usingIteratorExpression:v12 predicate:v7];

    return (uint64_t)v13;
  }
}

- (id)_keypathsForDerivedPropertyValidation:()_NSCoreDataSQLPredicateCategories
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v31 = 0;
  id v25 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  id v5 = objc_msgSend((id)objc_msgSend(a1, "collection"), "_keypathsForDerivedPropertyValidation:", &v31);
  id v6 = v5;
  if (v5)
  {
    if ([v5 count] != 1)
    {
      int v19 = 0;
      id v31 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134097 userInfo:&unk_1ED7E1790];
      goto LABEL_24;
    }
    uint64_t v7 = [v6 anyObject];
    [v4 addObject:v7];
    uint64_t v8 = objc_msgSend((id)objc_msgSend(a1, "variableExpression"), "predicateFormat");
    v9 = objc_msgSend((id)objc_msgSend(a1, "predicate"), "_keypathsForDerivedPropertyValidation:", &v31);
    v10 = v9;
    if (v9)
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (!v11)
      {
        int v19 = 1;
        goto LABEL_24;
      }
      uint64_t v12 = *(void *)v28;
LABEL_6:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v27 + 1) + 8 * v13);
        uint64_t v15 = [v14 localizedStandardRangeOfString:v8];
        uint64_t v16 = v15;
        if (v15 && v15 != 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        objc_msgSend(v4, "addObject:", objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", v8, v7));
        if (v16 != 0x7FFFFFFFFFFFFFFFLL && v16 != 0) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
          int v19 = 1;
          if (v11) {
            goto LABEL_6;
          }
          goto LABEL_24;
        }
      }
    }
  }
  int v19 = 0;
LABEL_24:
  id v20 = v31;
  if (a3 && v31) {
    *a3 = v31;
  }
  [v25 drain];
  id v21 = 0;
  id v22 = v31;
  id v23 = v4;
  if (v19) {
    return v4;
  }
  else {
    return 0;
  }
}

@end