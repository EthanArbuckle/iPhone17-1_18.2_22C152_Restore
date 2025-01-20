@interface NSDictionary(AVAirMessageExtensions)
- (id)airMessageCanonicalForm;
@end

@implementation NSDictionary(AVAirMessageExtensions)

- (id)airMessageCanonicalForm
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[a1 mutableCopy];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v19;
    *(void *)&long long v5 = 138543362;
    long long v17 = v5;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * v8);
        v10 = objc_msgSend(v2, "objectForKeyedSubscript:", v9, v17, (void)v18);
        v11 = [MEMORY[0x1E4F1CA98] null];
        int v12 = [v10 isEqual:v11];

        if (v12) {
          goto LABEL_7;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v13 = [v10 stringValue];
          [v2 setObject:v13 forKeyedSubscript:v9];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v14 = _avairlog();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v17;
              uint64_t v23 = v9;
              _os_log_impl(&dword_1B05B7000, v14, OS_LOG_TYPE_DEFAULT, "value for '%{public}@' is neither a string nor convertible to one", buf, 0xCu);
            }

LABEL_7:
            [v2 removeObjectForKey:v9];
            goto LABEL_10;
          }
          if ([v10 isEqual:&stru_1F09185C8]) {
            goto LABEL_7;
          }
        }
LABEL_10:

        ++v8;
      }
      while (v6 != v8);
      uint64_t v15 = [v3 countByEnumeratingWithState:&v18 objects:v24 count:16];
      uint64_t v6 = v15;
    }
    while (v15);
  }

  return v2;
}

@end