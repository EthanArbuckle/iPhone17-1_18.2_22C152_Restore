@interface NSMutableDictionary(GKAdditions)
- (void)_gkAddEntriesFromFormEncodedString:()GKAdditions;
- (void)_gkSetIfNonNilObject:()GKAdditions forKey:;
@end

@implementation NSMutableDictionary(GKAdditions)

- (void)_gkAddEntriesFromFormEncodedString:()GKAdditions
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v3 = [a3 componentsSeparatedByString:@"&"];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v20 != v6) {
            objc_enumerationMutation(v3);
          }
          v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v8 length])
          {
            uint64_t v9 = [v8 rangeOfString:@"="];
            if (v9 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v11 = [v8 _gkStringByUnescapingFromURLQuery];
              v12 = &stru_1F1E47DF8;
            }
            else
            {
              uint64_t v13 = v9;
              uint64_t v14 = v10;
              v15 = [v8 substringToIndex:v9];
              v11 = [v15 _gkStringByUnescapingFromURLQuery];

              v16 = [v8 substringFromIndex:v13 + v14];
              v12 = [v16 _gkStringByUnescapingFromURLQuery];
            }
            if (v11) {
              BOOL v17 = v12 == 0;
            }
            else {
              BOOL v17 = 1;
            }
            if (!v17) {
              [a1 setObject:v12 forKey:v11];
            }
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v5);
    }
  }
}

- (void)_gkSetIfNonNilObject:()GKAdditions forKey:
{
  if (a3) {
    return objc_msgSend(a1, "setObject:forKeyedSubscript:");
  }
  return a1;
}

@end