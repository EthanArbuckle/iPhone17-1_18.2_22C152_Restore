@interface EKObjectChangeSummarizer
+ (id)changeSummaryForObject:(id)a3;
+ (id)diffSummaryBetweenObject:(id)a3 andObject:(id)a4;
@end

@implementation EKObjectChangeSummarizer

+ (id)changeSummaryForObject:(id)a3
{
  id v4 = a3;
  v5 = (void *)[v4 copy];
  [v5 rollback];
  v6 = [a1 diffSummaryBetweenObject:v5 andObject:v4];

  return v6;
}

+ (id)diffSummaryBetweenObject:(id)a3 andObject:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  id v46 = 0;
  v41 = v7;
  if (v7 && v8)
  {
    v43 = objc_opt_class();
    if (v43 != objc_opt_class())
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:a1 file:@"EKObjectChangeSummarizer.m" lineNumber:93 description:@"Diff summary called on objects of different class"];
    }
    v38 = v9;
    v11 = [v7 diffWithObject:v9];
    v12 = [v11 summaryDictionary];

    id v46 = (id)objc_opt_new();
    objc_msgSend(v43, "EKObjectChangeSummarizer_singleValueDiffKeys");
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v40 = long long v58 = 0u;
    v13 = [v40 allKeys];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v55 objects:v61 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v56 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v55 + 1) + 8 * i);
          v19 = [v12 objectForKey:v18];

          if (v19)
          {
            v20 = [v41 valueForKeyPath:v18];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v21 = v20;
            }
            else
            {
              id v21 = [MEMORY[0x1E4F1CA98] null];
            }
            v22 = v21;
            v23 = [v40 objectForKeyedSubscript:v18];
            [v46 setObject:v22 forKeyedSubscript:v23];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v55 objects:v61 count:16];
      }
      while (v15);
    }

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    objc_msgSend(v43, "EKObjectChangeSummarizer_multiValueDiffKeys");
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v44 = [obj countByEnumeratingWithState:&v51 objects:v60 count:16];
    if (v44)
    {
      uint64_t v42 = *(void *)v52;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v52 != v42) {
            objc_enumerationMutation(obj);
          }
          uint64_t v45 = v24;
          uint64_t v25 = *(void *)(*((void *)&v51 + 1) + 8 * v24);
          v26 = objc_msgSend(v43, "EKObjectChangeSummarizer_multiValueDiffKeys");
          v27 = [v26 objectForKeyedSubscript:v25];

          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          uint64_t v28 = [&unk_1EF953198 countByEnumeratingWithState:&v47 objects:v59 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v30 = *(void *)v48;
            do
            {
              for (uint64_t j = 0; j != v29; ++j)
              {
                if (*(void *)v48 != v30) {
                  objc_enumerationMutation(&unk_1EF953198);
                }
                uint64_t v32 = *(void *)(*((void *)&v47 + 1) + 8 * j);
                v33 = [NSString stringWithFormat:@"%@.%@", v25, v32];
                v34 = [v12 objectForKey:v33];

                if (v34)
                {
                  v35 = [v27 objectForKeyedSubscript:v32];
                  if (v35)
                  {
                    v36 = [v12 objectForKeyedSubscript:v33];
                    [v46 setObject:v36 forKeyedSubscript:v35];
                  }
                }
              }
              uint64_t v29 = [&unk_1EF953198 countByEnumeratingWithState:&v47 objects:v59 count:16];
            }
            while (v29);
          }

          uint64_t v24 = v45 + 1;
        }
        while (v45 + 1 != v44);
        uint64_t v44 = [obj countByEnumeratingWithState:&v51 objects:v60 count:16];
      }
      while (v44);
    }

    v9 = v38;
  }

  return v46;
}

@end