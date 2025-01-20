@interface CADCalendarItemsWithExternalIdentifierPredicate(EKPredicateEvaluating)
- (id)ekPredicateEvaluateWithObject:()EKPredicateEvaluating;
- (void)expandWithObjectsPendingCommit:()EKPredicateEvaluating deletedObjectIDs:andResultArray:;
@end

@implementation CADCalendarItemsWithExternalIdentifierPredicate(EKPredicateEvaluating)

- (id)ekPredicateEvaluateWithObject:()EKPredicateEvaluating
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 uniqueID];
    v7 = [a1 externalIdentifier];
    int v8 = [v6 isEqualToString:v7];

    if (v8)
    {
      v11.receiver = a1;
      v11.super_class = (Class)&off_1EF984780;
      id v9 = objc_msgSendSuper2(&v11, sel_ekPredicateEvaluateWithObject_, v5);
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)expandWithObjectsPendingCommit:()EKPredicateEvaluating deletedObjectIDs:andResultArray:
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v39 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v49 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        v17 = [v16 objectID];
        [v10 setObject:v16 forKeyedSubscript:v17];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v13);
  }

  v18 = (void *)MEMORY[0x1E4F28F60];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __137__CADCalendarItemsWithExternalIdentifierPredicate_EKPredicateEvaluating__expandWithObjectsPendingCommit_deletedObjectIDs_andResultArray___block_invoke;
  v44[3] = &unk_1E5B97FE8;
  id v19 = v9;
  id v45 = v19;
  id v20 = v10;
  id v46 = v20;
  v47 = a1;
  v21 = [v18 predicateWithBlock:v44];
  [v39 filterUsingPredicate:v21];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v22 = v20;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v41;
    id v38 = v22;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v41 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(*((void *)&v40 + 1) + 8 * j);
        v28 = objc_msgSend(v22, "objectForKeyedSubscript:", v27, v38);
        if ([a1 ekPredicateEvaluateWithObject:v28]
          && ([v19 containsObject:v27] & 1) == 0)
        {
          v29 = [EKEvent alloc];
          [v28 persistentObject];
          uint64_t v30 = v24;
          uint64_t v31 = v25;
          v32 = a1;
          id v33 = v19;
          v35 = id v34 = v11;
          v36 = [v28 startDate];
          v37 = [(EKEvent *)v29 initWithPersistentObject:v35 occurrenceDate:v36];

          id v11 = v34;
          id v19 = v33;
          a1 = v32;
          uint64_t v25 = v31;
          uint64_t v24 = v30;
          id v22 = v38;
          [v39 addObject:v37];
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v40 objects:v52 count:16];
    }
    while (v24);
  }
}

@end