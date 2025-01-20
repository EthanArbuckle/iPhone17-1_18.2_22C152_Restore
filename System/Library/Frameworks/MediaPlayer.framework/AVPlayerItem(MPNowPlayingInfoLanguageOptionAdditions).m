@interface AVPlayerItem(MPNowPlayingInfoLanguageOptionAdditions)
- (id)createLanguageOptions;
@end

@implementation AVPlayerItem(MPNowPlayingInfoLanguageOptionAdditions)

- (id)createLanguageOptions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [a1 asset];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [v2 availableMediaCharacteristicsWithMediaSelectionOptions];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [v2 mediaSelectionGroupForMediaCharacteristic:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        v10 = [a1 selectedMediaOptionInMediaSelectionGroup:v9];
        v11 = v10;
        if (v10)
        {
          v12 = [v10 makeNowPlayingInfoLanguageOption];
          [v3 addObject:v12];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

@end