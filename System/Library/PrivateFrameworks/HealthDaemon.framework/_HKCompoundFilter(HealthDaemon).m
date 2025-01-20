@interface _HKCompoundFilter(HealthDaemon)
- (id)filterIgnoringActivityCacheIndexFilter;
- (id)filterIgnoringPrivateMetadata;
- (id)predicateWithProfile:()HealthDaemon;
@end

@implementation _HKCompoundFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v7 = objc_msgSend(a1, "subfilters", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [*(id *)(*((void *)&v24 + 1) + 8 * i) predicateWithProfile:v5];
        if (!v12)
        {
          _HKInitializeLogging();
          v16 = (void *)*MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
          {
            v22 = v16;
            v23 = HKLogSafeDescription();
            *(_DWORD *)buf = 138543362;
            v29 = v23;
            _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "Unable to construct predicate for filter: %{public}@", buf, 0xCu);
          }
          v17 = [MEMORY[0x1E4F65D58] falsePredicate];

          goto LABEL_21;
        }
        v13 = (void *)v12;
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  uint64_t v14 = [a1 compoundPredicateType];
  if (v14)
  {
    if (v14 == 2)
    {
      uint64_t v15 = [MEMORY[0x1E4F65D08] predicateMatchingAnyPredicates:v6];
    }
    else
    {
      if (v14 == 1)
      {
        [MEMORY[0x1E4F65D08] predicateMatchingAllPredicates:v6];
      }
      else
      {
        v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:a2 object:a1 file:@"HKFilter+HealthDaemon.m" lineNumber:73 description:@"Unreachable code has been executed"];

        [MEMORY[0x1E4F65D58] falsePredicate];
      uint64_t v15 = };
    }
    v17 = (void *)v15;
  }
  else
  {
    v18 = (void *)MEMORY[0x1E4F65D08];
    v19 = [v6 lastObject];
    v17 = [v18 negatedPredicate:v19];
  }
LABEL_21:

  return v17;
}

- (id)filterIgnoringPrivateMetadata
{
  return -[_HKCompoundFilter _filterByApplyingTransformationToSubfilters:](a1, &__block_literal_global_91);
}

- (id)filterIgnoringActivityCacheIndexFilter
{
  return -[_HKCompoundFilter _filterByApplyingTransformationToSubfilters:](a1, &__block_literal_global_291_0);
}

@end