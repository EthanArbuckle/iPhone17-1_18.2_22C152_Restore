@interface NSMutableDictionary(CDMJSONSerialization)
- (void)_cdm_safeJSONTraverse;
@end

@implementation NSMutableDictionary(CDMJSONSerialization)

- (void)_cdm_safeJSONTraverse
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = objc_msgSend(a1, "allKeys", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        v8 = [a1 objectForKeyedSubscript:v7];
        if (objc_opt_respondsToSelector())
        {
          v9 = objc_msgSend(v8, "_cdm_safeJSONString");
          [a1 setObject:v9 forKeyedSubscript:v7];
        }
        else if (objc_opt_respondsToSelector())
        {
          objc_msgSend(v8, "_cdm_safeJSONTraverse");
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

@end