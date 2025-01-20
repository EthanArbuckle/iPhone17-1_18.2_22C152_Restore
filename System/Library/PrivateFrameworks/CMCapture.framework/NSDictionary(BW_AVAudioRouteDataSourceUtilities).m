@interface NSDictionary(BW_AVAudioRouteDataSourceUtilities)
- (uint64_t)bw_optimalMicPolarPattern;
@end

@implementation NSDictionary(BW_AVAudioRouteDataSourceUtilities)

- (uint64_t)bw_optimalMicPolarPattern
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v2 = (void *)[a1 objectForKeyedSubscript:*MEMORY[0x1E4F767A0]];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  uint64_t v5 = 0;
  uint64_t v6 = *(void *)v14;
  uint64_t v7 = -1;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v14 != v6) {
        objc_enumerationMutation(v2);
      }
      v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned int v10 = [v9 intValue];
        uint64_t v11 = 0;
        while (v10 != *(_DWORD *)&aInmoddrcdcbs[4 * v11])
        {
          if (++v11 == 3)
          {
            uint64_t v11 = 0;
            break;
          }
        }
        if (v11 <= v7) {
          uint64_t v5 = v5;
        }
        else {
          uint64_t v5 = v10;
        }
        if (v11 > v7) {
          uint64_t v7 = v11;
        }
      }
    }
    uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  }
  while (v4);
  return v5;
}

@end