@interface CSContinuousVoiceTriggerConfig
- (CSContinuousVoiceTriggerConfig)initWithConfigPathNDAPI:(id)a3 threshold:(float)a4 loggingThreshold:(float)a5 twoShotThreshold:(float)a6 twoShotDecisionWaitTime:(float)a7 voiceTriggerPhIds:(id)a8 silencePhIds:(id)a9;
- (NSArray)silencePhIds;
- (NSArray)voiceTriggerPhIds;
- (NSString)configPathNDAPI;
- (float)loggingThreshold;
- (float)threshold;
- (float)twoShotDecisionWaitTime;
- (float)twoShotThreshold;
@end

@implementation CSContinuousVoiceTriggerConfig

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_silencePhIds, 0);
  objc_storeStrong((id *)&self->_voiceTriggerPhIds, 0);
  objc_storeStrong((id *)&self->_configPathNDAPI, 0);
}

- (NSArray)silencePhIds
{
  return self->_silencePhIds;
}

- (NSArray)voiceTriggerPhIds
{
  return self->_voiceTriggerPhIds;
}

- (float)twoShotDecisionWaitTime
{
  return self->_twoShotDecisionWaitTime;
}

- (float)twoShotThreshold
{
  return self->_twoShotThreshold;
}

- (float)loggingThreshold
{
  return self->_loggingThreshold;
}

- (float)threshold
{
  return self->_threshold;
}

- (NSString)configPathNDAPI
{
  return self->_configPathNDAPI;
}

- (CSContinuousVoiceTriggerConfig)initWithConfigPathNDAPI:(id)a3 threshold:(float)a4 loggingThreshold:(float)a5 twoShotThreshold:(float)a6 twoShotDecisionWaitTime:(float)a7 voiceTriggerPhIds:(id)a8 silencePhIds:(id)a9
{
  id v17 = a3;
  id v18 = a8;
  id v19 = a9;
  v23.receiver = self;
  v23.super_class = (Class)CSContinuousVoiceTriggerConfig;
  v20 = [(CSContinuousVoiceTriggerConfig *)&v23 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_configPathNDAPI, a3);
    v21->_threshold = a4;
    v21->_loggingThreshold = a5;
    v21->_twoShotThreshold = a6;
    v21->_twoShotDecisionWaitTime = a7;
    objc_storeStrong((id *)&v21->_voiceTriggerPhIds, a8);
    objc_storeStrong((id *)&v21->_silencePhIds, a9);
  }

  return v21;
}

@end