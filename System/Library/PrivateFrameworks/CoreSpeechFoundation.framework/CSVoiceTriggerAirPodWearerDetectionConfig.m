@interface CSVoiceTriggerAirPodWearerDetectionConfig
- (CSVoiceTriggerAirPodWearerDetectionConfig)initWithThreshold:(float)a3 minimumPhraseLength:(float)a4 shadowMicScoreThreshold:(float)a5 myriadThreshold:(float)a6 phrasesToSkipBoronDecisionMaking:(id)a7;
- (NSArray)phrasesToSkipBoronDecisionMaking;
- (float)minimumPhraseLength;
- (float)myriadThreshold;
- (float)shadowMicScoreThreshold;
- (float)threshold;
@end

@implementation CSVoiceTriggerAirPodWearerDetectionConfig

- (void).cxx_destruct
{
}

- (NSArray)phrasesToSkipBoronDecisionMaking
{
  return self->_phrasesToSkipBoronDecisionMaking;
}

- (float)myriadThreshold
{
  return self->_myriadThreshold;
}

- (float)shadowMicScoreThreshold
{
  return self->_shadowMicScoreThreshold;
}

- (float)minimumPhraseLength
{
  return self->_minimumPhraseLength;
}

- (float)threshold
{
  return self->_threshold;
}

- (CSVoiceTriggerAirPodWearerDetectionConfig)initWithThreshold:(float)a3 minimumPhraseLength:(float)a4 shadowMicScoreThreshold:(float)a5 myriadThreshold:(float)a6 phrasesToSkipBoronDecisionMaking:(id)a7
{
  id v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)CSVoiceTriggerAirPodWearerDetectionConfig;
  v14 = [(CSVoiceTriggerAirPodWearerDetectionConfig *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_threshold = a3;
    v14->_minimumPhraseLength = a4;
    v14->_shadowMicScoreThreshold = a5;
    v14->_myriadThreshold = a6;
    objc_storeStrong((id *)&v14->_phrasesToSkipBoronDecisionMaking, a7);
  }

  return v15;
}

@end