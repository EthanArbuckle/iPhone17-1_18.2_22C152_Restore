@interface SASAudioAnalytics
@end

@implementation SASAudioAnalytics

void __54__SASAudioAnalytics_AudioAnalytics__af_audioAnalytics__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  objc_msgSend(a3, "af_acousticFeature");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v6 forKey:v5];
}

@end