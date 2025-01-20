@interface NSMutableSet(HMFMerging)
- (uint64_t)mergeObject:()HMFMerging;
- (uint64_t)shouldMergeObject:()HMFMerging;
@end

@implementation NSMutableSet(HMFMerging)

- (uint64_t)shouldMergeObject:()HMFMerging
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v4 = (v3 != 0) & objc_opt_isKindOfClass();

  return v4;
}

- (uint64_t)mergeObject:()HMFMerging
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  v28 = v4;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  v7 = (void *)[a1 mutableCopy];
  [v7 minusSet:v6];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v43 count:16];
  int v10 = v9 != 0;
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(v8);
        }
        [a1 removeObject:*(void *)(*((void *)&v37 + 1) + 8 * i)];
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v11);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v14 = a1;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v33 + 1) + 8 * j);
        v20 = [v6 member:v19];
        if (v20
          && [v19 conformsToProtocol:&unk_1EEF30378]
          && [v19 shouldMergeObject:v20])
        {
          v10 |= [v19 mergeObject:v20];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v16);
  }

  v21 = (void *)[v6 mutableCopy];
  [v21 minusSet:v14];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v22 = v21;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v29 objects:v41 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v30;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v22);
        }
        [v14 addObject:*(void *)(*((void *)&v29 + 1) + 8 * k)];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v29 objects:v41 count:16];
    }
    while (v24);
    LOBYTE(v10) = 1;
  }

  return v10 & 1;
}

@end