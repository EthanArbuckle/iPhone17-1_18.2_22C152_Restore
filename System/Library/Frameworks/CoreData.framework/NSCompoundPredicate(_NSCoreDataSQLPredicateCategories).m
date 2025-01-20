@interface NSCompoundPredicate(_NSCoreDataSQLPredicateCategories)
- (id)_keypathsForDerivedPropertyValidation:()_NSCoreDataSQLPredicateCategories;
- (id)minimalFormInContext:()_NSCoreDataSQLPredicateCategories;
@end

@implementation NSCompoundPredicate(_NSCoreDataSQLPredicateCategories)

- (id)minimalFormInContext:()_NSCoreDataSQLPredicateCategories
{
  v5 = (void *)MEMORY[0x18C127630]();
  v6 = objc_msgSend((id)objc_msgSend(a1, "predicateOperator"), "minimalFormInContext:ofPredicates:", a3, objc_msgSend(a1, "subpredicates"));
  id v7 = v6;

  return v6;
}

- (id)_keypathsForDerivedPropertyValidation:()_NSCoreDataSQLPredicateCategories
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v21 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v4 = objc_msgSend(a1, "subpredicates", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (!v5) {
    goto LABEL_14;
  }
  id v6 = 0;
  uint64_t v7 = *(void *)v18;
  while (2)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v18 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = (void *)[*(id *)(*((void *)&v17 + 1) + 8 * i) _keypathsForDerivedPropertyValidation:&v21];
      v10 = v9;
      if (!v9)
      {
        id v11 = 0;
        goto LABEL_17;
      }
      if ([v9 count])
      {
        if (v6) {
          objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend(v10, "allObjects"));
        }
        else {
          id v6 = v10;
        }
      }
    }
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v5) {
      continue;
    }
    break;
  }
  if (!v6) {
LABEL_14:
  }
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v11 = v6;
LABEL_17:
  id v12 = v21;
  if (a3 && v21) {
    *a3 = v21;
  }
  [0 drain];
  id v13 = 0;
  id v14 = v21;
  id v15 = v6;
  return v11;
}

@end