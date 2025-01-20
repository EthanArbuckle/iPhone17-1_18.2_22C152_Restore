@interface AVPlayerItem(AVMediaContentRating)
- (id)mediaContentRating;
@end

@implementation AVPlayerItem(AVMediaContentRating)

- (id)mediaContentRating
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v2 = [a1 asset];
  uint64_t v3 = [v2 metadata];
  v4 = (void *)v3;
  uint64_t v5 = MEMORY[0x1E4F1CBF0];
  if (v3) {
    v6 = (void *)v3;
  }
  else {
    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v7 = v6;

  uint64_t v8 = [a1 externalMetadata];
  v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = v5;
  }
  v11 = [v7 arrayByAddingObjectsFromArray:v10];

  v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F15DA0], *MEMORY[0x1E4F15D38], 0);
  v31 = [MEMORY[0x1E4F1CA48] array];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v11;
  uint64_t v13 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        v18 = [v17 identifier];
        int v19 = [v12 containsObject:v18];

        if (v19)
        {
          v20 = [v17 locale];
          v21 = [v20 countryCode];

          v22 = [v17 stringValue];
          memset(&v34, 0, sizeof(v34));
          [a1 duration];
          double Seconds = 0.0;
          if ((~v34.flags & 0x11) != 0)
          {
            CMTime time = v34;
            double Seconds = CMTimeGetSeconds(&time);
          }
          BOOL v24 = Seconds < 4200.0 && Seconds > 0.0;
          uint64_t v25 = [a1 avkitMediaType];
          if (v25 == 5) {
            uint64_t v26 = 1;
          }
          else {
            uint64_t v26 = 2 * (v25 == 6);
          }
          v27 = +[AVRatingProviders shared];
          v28 = [v27 findRatingString:v22 domain:v26 country:v21 shouldPreferTVDomain:v24];

          if (v28) {
            [v31 addObject:v28];
          }
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v14);
  }

  v29 = [v31 firstObject];

  return v29;
}

@end