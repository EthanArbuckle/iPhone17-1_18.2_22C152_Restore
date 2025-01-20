@interface ATXExpiredDataRemover
+ (void)removeExpiredBundleIdsFrom:(id)a3 removeExpiredActionKeysFrom:(id)a4 expiredDataProvider:(id)a5;
@end

@implementation ATXExpiredDataRemover

+ (void)removeExpiredBundleIdsFrom:(id)a3 removeExpiredActionKeysFrom:(id)a4 expiredDataProvider:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v9 expiredBundleIdsAndActionKeys];
  v11 = [v10 expiredBundleIds];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    id v33 = v8;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v13 = v7;
    id v14 = v7;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v40;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v40 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v39 + 1) + 8 * v18);
          v20 = (void *)MEMORY[0x1D25F6CC0]();
          v21 = [v10 expiredBundleIds];
          [v19 removeBundleIds:v21];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v16);
    }

    id v7 = v13;
    id v8 = v33;
  }
  v22 = [v10 expiredActionKeys];
  uint64_t v23 = [v22 count];

  if (v23)
  {
    id v34 = v7;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v24 = v8;
    id v25 = v8;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v36;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v36 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = *(void **)(*((void *)&v35 + 1) + 8 * v29);
          v31 = (void *)MEMORY[0x1D25F6CC0]();
          v32 = [v10 expiredActionKeys];
          [v30 removeActionKeys:v32];

          ++v29;
        }
        while (v27 != v29);
        uint64_t v27 = [v25 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v27);
    }

    id v7 = v34;
    id v8 = v24;
  }
}

@end