@interface CSVoiceTriggerFirstPassConfig
- (CSVoiceTriggerFirstPassConfig)initWithConfigPathNDAPI:(id)a3 threshold:(float)a4 delaySecondsForChannelSelection:(float)a5 masterChannelScoreBoost:(float)a6 voiceIsolationChannelScoreBoost:(float)a7 processingChunkSeconds:(float)a8 processingChannelsBitset:(unint64_t)a9 masterChannel:(int)a10 voiceIsolationChannel:(int)a11;
- (NSString)configPathNDAPI;
- (float)delaySecondsForChannelSelection;
- (float)masterChannelScoreBoost;
- (float)processingChunkSeconds;
- (float)threshold;
- (float)voiceIsolationChannelScoreBoost;
- (int)masterChannel;
- (int)voiceIsolationChannel;
- (unint64_t)processingChannelsBitset;
@end

@implementation CSVoiceTriggerFirstPassConfig

- (void).cxx_destruct
{
}

- (int)voiceIsolationChannel
{
  return self->_voiceIsolationChannel;
}

- (int)masterChannel
{
  return self->_masterChannel;
}

- (unint64_t)processingChannelsBitset
{
  return self->_processingChannelsBitset;
}

- (float)processingChunkSeconds
{
  return self->_processingChunkSeconds;
}

- (float)voiceIsolationChannelScoreBoost
{
  return self->_voiceIsolationChannelScoreBoost;
}

- (float)masterChannelScoreBoost
{
  return self->_masterChannelScoreBoost;
}

- (float)delaySecondsForChannelSelection
{
  return self->_delaySecondsForChannelSelection;
}

- (float)threshold
{
  return self->_threshold;
}

- (NSString)configPathNDAPI
{
  return self->_configPathNDAPI;
}

- (CSVoiceTriggerFirstPassConfig)initWithConfigPathNDAPI:(id)a3 threshold:(float)a4 delaySecondsForChannelSelection:(float)a5 masterChannelScoreBoost:(float)a6 voiceIsolationChannelScoreBoost:(float)a7 processingChunkSeconds:(float)a8 processingChannelsBitset:(unint64_t)a9 masterChannel:(int)a10 voiceIsolationChannel:(int)a11
{
  id v21 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CSVoiceTriggerFirstPassConfig;
  v22 = [(CSVoiceTriggerFirstPassConfig *)&v25 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_configPathNDAPI, a3);
    v23->_threshold = a4;
    v23->_delaySecondsForChannelSelection = a5;
    v23->_masterChannelScoreBoost = a6;
    v23->_voiceIsolationChannelScoreBoost = a7;
    v23->_processingChunkSeconds = a8;
    v23->_processingChannelsBitset = a9;
    v23->_masterChannel = a10;
    v23->_voiceIsolationChannel = a11;
  }

  return v23;
}

@end