@interface CSPhraseDetectorInfo
- (BOOL)hasPendingNearMiss;
- (CSPhraseDetectorInfo)initWithPhraseConfig:(id)a3;
- (CSVoiceTriggerPhraseConfig)phraseConfig;
- (float)effectiveKeywordThreshold;
- (void)setEffectiveKeywordThreshold:(float)a3;
- (void)setHasPendingNearMiss:(BOOL)a3;
- (void)setPhraseConfig:(id)a3;
@end

@implementation CSPhraseDetectorInfo

- (void).cxx_destruct
{
}

- (void)setPhraseConfig:(id)a3
{
}

- (CSVoiceTriggerPhraseConfig)phraseConfig
{
  return self->_phraseConfig;
}

- (void)setHasPendingNearMiss:(BOOL)a3
{
  self->_hasPendingNearMiss = a3;
}

- (BOOL)hasPendingNearMiss
{
  return self->_hasPendingNearMiss;
}

- (void)setEffectiveKeywordThreshold:(float)a3
{
  self->_effectiveKeywordThreshold = a3;
}

- (float)effectiveKeywordThreshold
{
  return self->_effectiveKeywordThreshold;
}

- (CSPhraseDetectorInfo)initWithPhraseConfig:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSPhraseDetectorInfo;
  v6 = [(CSPhraseDetectorInfo *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_phraseConfig, a3);
    v7->_effectiveKeywordThreshold = INFINITY;
    v7->_hasPendingNearMiss = 0;
  }

  return v7;
}

@end