@interface CSRemoraSecondPassRequest
- (BOOL)isCancelled;
- (BOOL)isSecondPassRunning;
- (CSAsset)currentAsset;
- (CSAudioProvider)audioProvider;
- (CSAudioStreamHolding)audioStreamHolding;
- (CSRemoraSecondPassRequest)initWithDeviceID:(id)a3;
- (CSVoiceTriggerSecondChanceContext)secondChanceContext;
- (CSVoiceTriggerSecondPass)voiceTriggerSecondPass;
- (CSVoiceTriggerUserSelectedPhrase)multiPhraseSelectedStatus;
- (NSString)firstPassDeviceID;
- (double)firstPassTriggerEndTime;
- (float)goodnessScore;
- (id)_secondPassWorkQueue;
- (unint64_t)timestamp;
- (void)cancelAudioStreamHold;
- (void)cancelRequest;
- (void)dealloc;
- (void)holdAudioStreamWithTimeout:(double)a3;
- (void)reset;
- (void)setAsset:(id)a3;
- (void)setAudioProvider:(id)a3;
- (void)setAudioStreamHolding:(id)a3;
- (void)setCurrentAsset:(id)a3;
- (void)setFirstPassDeviceID:(id)a3;
- (void)setFirstPassTriggerEndTime:(double)a3;
- (void)setGoodnessScore:(float)a3;
- (void)setIsCancelled:(BOOL)a3;
- (void)setIsSecondPassRunning:(BOOL)a3;
- (void)setMultiPhraseSelectedStatus:(id)a3;
- (void)setSecondChanceContext:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setVoiceTriggerSecondPass:(id)a3;
- (void)start;
@end

@implementation CSRemoraSecondPassRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiPhraseSelectedStatus, 0);
  objc_storeStrong((id *)&self->_secondChanceContext, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_audioProvider, 0);
  objc_storeStrong((id *)&self->_audioStreamHolding, 0);
  objc_storeStrong((id *)&self->_voiceTriggerSecondPass, 0);
  objc_storeStrong((id *)&self->_firstPassDeviceID, 0);
}

- (void)setMultiPhraseSelectedStatus:(id)a3
{
}

- (CSVoiceTriggerUserSelectedPhrase)multiPhraseSelectedStatus
{
  return self->_multiPhraseSelectedStatus;
}

- (void)setSecondChanceContext:(id)a3
{
}

- (CSVoiceTriggerSecondChanceContext)secondChanceContext
{
  return self->_secondChanceContext;
}

- (void)setFirstPassTriggerEndTime:(double)a3
{
  self->_firstPassTriggerEndTime = a3;
}

- (double)firstPassTriggerEndTime
{
  return self->_firstPassTriggerEndTime;
}

- (void)setGoodnessScore:(float)a3
{
  self->_goodnessScore = a3;
}

- (float)goodnessScore
{
  return self->_goodnessScore;
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setCurrentAsset:(id)a3
{
}

- (CSAsset)currentAsset
{
  return self->_currentAsset;
}

- (void)setAudioProvider:(id)a3
{
}

- (CSAudioProvider)audioProvider
{
  return self->_audioProvider;
}

- (void)setAudioStreamHolding:(id)a3
{
}

- (CSAudioStreamHolding)audioStreamHolding
{
  return self->_audioStreamHolding;
}

- (void)setIsSecondPassRunning:(BOOL)a3
{
  self->_isSecondPassRunning = a3;
}

- (BOOL)isSecondPassRunning
{
  return self->_isSecondPassRunning;
}

- (void)setVoiceTriggerSecondPass:(id)a3
{
}

- (CSVoiceTriggerSecondPass)voiceTriggerSecondPass
{
  return self->_voiceTriggerSecondPass;
}

- (void)setFirstPassDeviceID:(id)a3
{
}

- (NSString)firstPassDeviceID
{
  return self->_firstPassDeviceID;
}

- (void)cancelAudioStreamHold
{
  v3 = [(CSRemoraSecondPassRequest *)self audioProvider];
  [v3 cancelAudioStreamHold:self->_audioStreamHolding];

  audioStreamHolding = self->_audioStreamHolding;
  self->_audioStreamHolding = 0;
}

- (void)cancelRequest
{
  self->_isCancelled = 1;
  [(CSVoiceTriggerSecondPass *)self->_voiceTriggerSecondPass cancelCurrentRequest];
  [(CSRemoraSecondPassRequest *)self cancelAudioStreamHold];
}

- (void)holdAudioStreamWithTimeout:(double)a3
{
  id v7 = +[CSAudioStreamHoldRequestOption defaultOptionWithTimeout:a3];
  v4 = [(CSRemoraSecondPassRequest *)self audioProvider];
  v5 = [v4 holdAudioStreamWithDescription:@"CSRemoraSecondPassRequest" option:v7];
  audioStreamHolding = self->_audioStreamHolding;
  self->_audioStreamHolding = v5;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_currentAsset, a3);
  id v5 = a3;
  [v5 logAssetVersionForInsight];
  [(CSVoiceTriggerSecondPass *)self->_voiceTriggerSecondPass setAsset:v5];
}

- (void)reset
{
  self->_isSecondPassRunning = 0;
  [(CSVoiceTriggerSecondPass *)self->_voiceTriggerSecondPass reset];
}

- (void)start
{
}

- (void)dealloc
{
  v3 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CSRemoraSecondPassRequest dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s CSRemoraFirstPassRequest is deallocated", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSRemoraSecondPassRequest;
  [(CSRemoraSecondPassRequest *)&v4 dealloc];
}

- (CSRemoraSecondPassRequest)initWithDeviceID:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSRemoraSecondPassRequest;
  v6 = [(CSRemoraSecondPassRequest *)&v13 init];
  if (v6)
  {
    id v7 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[CSRemoraSecondPassRequest initWithDeviceID:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Using high priority queues for remora second pass", buf, 0xCu);
    }
    objc_storeStrong((id *)&v6->_firstPassDeviceID, a3);
    v8 = [CSVoiceTriggerSecondPass alloc];
    v9 = [(CSRemoraSecondPassRequest *)v6 _secondPassWorkQueue];
    v10 = [(CSVoiceTriggerSecondPass *)v8 initWithPHSEnabled:0 speechManager:0 supportsMphDetection:0 secondPassQueue:v9];
    voiceTriggerSecondPass = v6->_voiceTriggerSecondPass;
    v6->_voiceTriggerSecondPass = v10;

    [(CSVoiceTriggerSecondPass *)v6->_voiceTriggerSecondPass setFirstPassSource:7];
    [(CSVoiceTriggerSecondPass *)v6->_voiceTriggerSecondPass setSecondPassClient:5];
    [(CSVoiceTriggerSecondPass *)v6->_voiceTriggerSecondPass setFirstPassDeviceId:v6->_firstPassDeviceID];
    v6->_isSecondPassRunning = 0;
  }

  return v6;
}

- (id)_secondPassWorkQueue
{
  v2 = +[NSString stringWithFormat:@"com.apple.corespeech.remoram.voicetriggersecondpassq.%@,", self->_firstPassDeviceID];
  v3 = +[CSUtils getSerialQueueWithQOS:33 name:v2 fixedPriority:kCSDefaultSerialQueueFixedPriority];

  return v3;
}

@end