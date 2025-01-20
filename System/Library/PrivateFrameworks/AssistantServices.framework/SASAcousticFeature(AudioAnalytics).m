@interface SASAcousticFeature(AudioAnalytics)
- (AFSpeechAcousticFeature)af_acousticFeature;
@end

@implementation SASAcousticFeature(AudioAnalytics)

- (AFSpeechAcousticFeature)af_acousticFeature
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v3 = [a1 acousticFeaturePerFrame];
  v4 = objc_msgSend(v2, "initWithCapacity:", objc_msgSend(v3, "count"));

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = objc_msgSend(a1, "acousticFeaturePerFrame", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 addObject:*(void *)(*((void *)&v14 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  v10 = [AFSpeechAcousticFeature alloc];
  v11 = [a1 frameDuration];
  [v11 doubleValue];
  v12 = -[AFSpeechAcousticFeature initWithAcousticFeatureValue:frameDuration:](v10, "initWithAcousticFeatureValue:frameDuration:", v4);

  return v12;
}

@end