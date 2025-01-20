@interface NSDictionary(DiffBuilding)
- (void)diffAgainstObject:()DiffBuilding usingDiffBuilder:withDescription:;
@end

@implementation NSDictionary(DiffBuilding)

- (void)diffAgainstObject:()DiffBuilding usingDiffBuilder:withDescription:
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  v9 = (void *)MEMORY[0x1E4F1CAD0];
  v10 = [a1 allKeys];
  v11 = [v9 setWithArray:v10];

  v12 = (void *)MEMORY[0x1E4F1CAD0];
  v13 = [v8 allKeys];
  v14 = [v12 setWithArray:v13];

  v15 = (void *)[v14 mutableCopy];
  [v15 minusSet:v11];
  v16 = (void *)[v11 mutableCopy];
  [v16 minusSet:v14];
  v42 = v11;
  id v43 = (id)[v11 mutableCopy];
  v41 = v14;
  [v43 intersectSet:v14];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v15;
  uint64_t v17 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v55;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v55 != v19) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v54 + 1) + 8 * v20);
        if (objc_opt_respondsToSelector()) {
          [v21 diffDescription];
        }
        else {
        v22 = [v21 description];
        }
        v23 = [v8 objectForKeyedSubscript:v21];
        [v7 diffObject:0 againstObject:v23 withDescription:v22];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
    }
    while (v18);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v24 = v16;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v51;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v51 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = *(void **)(*((void *)&v50 + 1) + 8 * v28);
        if (objc_opt_respondsToSelector()) {
          [v29 diffDescription];
        }
        else {
        v30 = [v29 description];
        }
        v31 = [a1 objectForKeyedSubscript:v29];
        [v7 diffObject:v31 againstObject:0 withDescription:v30];

        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = [v24 countByEnumeratingWithState:&v50 objects:v59 count:16];
    }
    while (v26);
  }
  v40 = v24;

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v44 = v43;
  uint64_t v32 = [v44 countByEnumeratingWithState:&v46 objects:v58 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v47;
    do
    {
      uint64_t v35 = 0;
      do
      {
        if (*(void *)v47 != v34) {
          objc_enumerationMutation(v44);
        }
        v36 = *(void **)(*((void *)&v46 + 1) + 8 * v35);
        if (objc_opt_respondsToSelector()) {
          [v36 diffDescription];
        }
        else {
        v37 = [v36 description];
        }
        v38 = [a1 objectForKeyedSubscript:v36];
        v39 = [v8 objectForKeyedSubscript:v36];
        [v7 diffObject:v38 againstObject:v39 withDescription:v37];

        ++v35;
      }
      while (v33 != v35);
      uint64_t v33 = [v44 countByEnumeratingWithState:&v46 objects:v58 count:16];
    }
    while (v33);
  }
}

@end