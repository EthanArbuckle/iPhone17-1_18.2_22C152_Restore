@interface CSVoiceTriggerSecondPassConfig
- (BOOL)useKeywordSpotting;
- (BOOL)useRecognizerCombination;
- (BOOL)useTimeBasedTriggerLength;
- (CSVoiceTriggerAirPodWearerDetectionConfig)wearerDetectionConfig;
- (CSVoiceTriggerSecondPassConfig)initWithPreTriggerAudioTime:(float)a3 prependingAudioTime:(float)a4 trailingAudioTime:(float)a5 resourcePath:(id)a6 configPathNDAPI:(id)a7 useRecognizerCombination:(BOOL)a8 configPathRecognizer:(id)a9 useKeywordSpotting:(BOOL)a10 phraseConfigs:(id)a11 wearerDetectionConfig:(id)a12 quasarCheckerResultCutOffCount:(id)a13 useTimeBasedTriggerLength:(BOOL)a14;
- (NSArray)phraseConfigs;
- (NSNumber)quasarCheckerResultCutOffCount;
- (NSString)configPathNDAPI;
- (NSString)configPathRecognizer;
- (NSString)resourcePath;
- (float)preTriggerAudioTime;
- (float)prependingAudioTime;
- (float)trailingAudioTime;
@end

@implementation CSVoiceTriggerSecondPassConfig

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quasarCheckerResultCutOffCount, 0);
  objc_storeStrong((id *)&self->_wearerDetectionConfig, 0);
  objc_storeStrong((id *)&self->_phraseConfigs, 0);
  objc_storeStrong((id *)&self->_configPathRecognizer, 0);
  objc_storeStrong((id *)&self->_configPathNDAPI, 0);
  objc_storeStrong((id *)&self->_resourcePath, 0);
}

- (BOOL)useTimeBasedTriggerLength
{
  return self->_useTimeBasedTriggerLength;
}

- (NSNumber)quasarCheckerResultCutOffCount
{
  return self->_quasarCheckerResultCutOffCount;
}

- (CSVoiceTriggerAirPodWearerDetectionConfig)wearerDetectionConfig
{
  return self->_wearerDetectionConfig;
}

- (NSArray)phraseConfigs
{
  return self->_phraseConfigs;
}

- (BOOL)useKeywordSpotting
{
  return self->_useKeywordSpotting;
}

- (NSString)configPathRecognizer
{
  return self->_configPathRecognizer;
}

- (BOOL)useRecognizerCombination
{
  return self->_useRecognizerCombination;
}

- (NSString)configPathNDAPI
{
  return self->_configPathNDAPI;
}

- (NSString)resourcePath
{
  return self->_resourcePath;
}

- (float)trailingAudioTime
{
  return self->_trailingAudioTime;
}

- (float)prependingAudioTime
{
  return self->_prependingAudioTime;
}

- (float)preTriggerAudioTime
{
  return self->_preTriggerAudioTime;
}

- (CSVoiceTriggerSecondPassConfig)initWithPreTriggerAudioTime:(float)a3 prependingAudioTime:(float)a4 trailingAudioTime:(float)a5 resourcePath:(id)a6 configPathNDAPI:(id)a7 useRecognizerCombination:(BOOL)a8 configPathRecognizer:(id)a9 useKeywordSpotting:(BOOL)a10 phraseConfigs:(id)a11 wearerDetectionConfig:(id)a12 quasarCheckerResultCutOffCount:(id)a13 useTimeBasedTriggerLength:(BOOL)a14
{
  id v22 = a6;
  id v32 = a7;
  id v31 = a9;
  id v30 = a11;
  id v23 = a12;
  id v24 = a13;
  v33.receiver = self;
  v33.super_class = (Class)CSVoiceTriggerSecondPassConfig;
  v25 = [(CSVoiceTriggerSecondPassConfig *)&v33 init];
  v26 = v25;
  if (v25)
  {
    v25->_preTriggerAudioTime = a3;
    v25->_prependingAudioTime = a4;
    v25->_trailingAudioTime = a5;
    objc_storeStrong((id *)&v25->_resourcePath, a6);
    objc_storeStrong((id *)&v26->_configPathNDAPI, a7);
    v26->_useRecognizerCombination = a8;
    objc_storeStrong((id *)&v26->_configPathRecognizer, a9);
    v26->_useKeywordSpotting = a10;
    objc_storeStrong((id *)&v26->_phraseConfigs, a11);
    objc_storeStrong((id *)&v26->_wearerDetectionConfig, a12);
    objc_storeStrong((id *)&v26->_quasarCheckerResultCutOffCount, a13);
    v26->_useTimeBasedTriggerLength = a14;
  }

  return v26;
}

@end