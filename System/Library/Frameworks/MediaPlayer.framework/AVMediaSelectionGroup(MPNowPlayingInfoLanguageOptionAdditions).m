@interface AVMediaSelectionGroup(MPNowPlayingInfoLanguageOptionAdditions)
- (MPNowPlayingInfoLanguageOptionGroup)makeNowPlayingInfoLanguageOptionGroup;
@end

@implementation AVMediaSelectionGroup(MPNowPlayingInfoLanguageOptionAdditions)

- (MPNowPlayingInfoLanguageOptionGroup)makeNowPlayingInfoLanguageOptionGroup
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3 = [a1 options];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [*(id *)(*((void *)&v14 + 1) + 8 * i) makeNowPlayingInfoLanguageOption];
        if (v8) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  v9 = [a1 defaultOption];
  if (v9)
  {
    v10 = [a1 defaultOption];
    v11 = [v10 makeNowPlayingInfoLanguageOption];
  }
  else
  {
    v11 = 0;
  }

  v12 = -[MPNowPlayingInfoLanguageOptionGroup initWithLanguageOptions:defaultLanguageOption:allowEmptySelection:]([MPNowPlayingInfoLanguageOptionGroup alloc], "initWithLanguageOptions:defaultLanguageOption:allowEmptySelection:", v2, v11, [a1 allowsEmptySelection]);

  return v12;
}

@end