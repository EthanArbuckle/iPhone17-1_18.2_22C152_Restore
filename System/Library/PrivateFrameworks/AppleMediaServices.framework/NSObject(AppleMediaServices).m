@interface NSObject(AppleMediaServices)
- (id)ams_generateDescriptionWithSubObjects:()AppleMediaServices;
@end

@implementation NSObject(AppleMediaServices)

- (id)ams_generateDescriptionWithSubObjects:()AppleMediaServices
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p>", objc_opt_class(), a1];
  if ([v4 count])
  {
    [v5 appendString:@" {\n"];
    v6 = [v4 allKeys];
    v7 = [v6 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = v7;
    uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      unint64_t v10 = 0x1E4F1C000uLL;
      uint64_t v11 = *(void *)v32;
      uint64_t v24 = *(void *)v32;
      do
      {
        uint64_t v12 = 0;
        uint64_t v25 = v9;
        do
        {
          if (*(void *)v32 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v31 + 1) + 8 * v12);
          v14 = [v4 objectForKeyedSubscript:v13];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = v4;
            unint64_t v16 = v10;
            [v5 appendFormat:@" %@ = {\n", v13];
            long long v29 = 0u;
            long long v30 = 0u;
            long long v27 = 0u;
            long long v28 = 0u;
            id v17 = v14;
            uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
            if (v18)
            {
              uint64_t v19 = v18;
              uint64_t v20 = *(void *)v28;
              do
              {
                for (uint64_t i = 0; i != v19; ++i)
                {
                  if (*(void *)v28 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  [v5 appendFormat:@"  %@,\n", *(void *)(*((void *)&v27 + 1) + 8 * i)];
                }
                uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
              }
              while (v19);
            }

            [v5 appendString:@"}"];
            unint64_t v10 = v16;
            id v4 = v15;
            uint64_t v11 = v24;
            uint64_t v9 = v25;
          }
          else
          {
            v22 = [v4 objectForKeyedSubscript:v13];
            [v5 appendFormat:@"  %@ = %@,\n", v13, v22];
          }
          ++v12;
        }
        while (v12 != v9);
        uint64_t v9 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v9);
    }

    [v5 appendString:@"}"];
  }

  return v5;
}

@end