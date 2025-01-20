@interface SASAudioAnalytics(AudioAnalytics)
- (AFSpeechAudioAnalytics)af_audioAnalytics;
@end

@implementation SASAudioAnalytics(AudioAnalytics)

- (AFSpeechAudioAnalytics)af_audioAnalytics
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v3 = [a1 acousticFeatures];
  v4 = objc_msgSend(v2, "initWithCapacity:", objc_msgSend(v3, "count"));

  v5 = [a1 acousticFeatures];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__SASAudioAnalytics_AudioAnalytics__af_audioAnalytics__block_invoke;
  v11[3] = &unk_1E592B710;
  id v12 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v11];

  v7 = [AFSpeechAudioAnalytics alloc];
  v8 = [a1 speechRecognitionFeatures];
  v9 = [(AFSpeechAudioAnalytics *)v7 initWithSpeechRecognitionFeatures:v8 acousticFeatures:v6];

  return v9;
}

@end