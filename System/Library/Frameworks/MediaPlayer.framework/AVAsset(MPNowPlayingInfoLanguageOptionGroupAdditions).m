@interface AVAsset(MPNowPlayingInfoLanguageOptionGroupAdditions)
- (id)createLanguageOptionGroups;
@end

@implementation AVAsset(MPNowPlayingInfoLanguageOptionGroupAdditions)

- (id)createLanguageOptionGroups
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [a1 availableMediaCharacteristicsWithMediaSelectionOptions];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(a1, "mediaSelectionGroupForMediaCharacteristic:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        v10 = v9;
        if (v9)
        {
          v11 = [v9 makeNowPlayingInfoLanguageOptionGroup];
          v12 = [v11 languageOptions];
          uint64_t v13 = [v12 count];

          if (v13) {
            [v3 addObject:v11];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v3;
}

@end