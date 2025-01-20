@interface CSHearstSecondPassRequest
- (BOOL)isSecondPassRunning;
- (CSAudioProvider)audioProvider;
- (CSAudioStreamHolding)audioStreamHolding;
- (CSHearstSecondPassRequest)initWithDeviceID:(id)a3;
- (CSHearstSecondPassRequest)initWithDeviceID:(id)a3 speechManager:(id)a4;
- (CSSpeechManager)speechManager;
- (CSVoiceTriggerSecondChanceContext)secondChanceContext;
- (CSVoiceTriggerSecondPass)voiceTriggerSecondPass;
- (NSString)firstPassDeviceID;
- (float)remoteMicVADScore;
- (void)cancelAudioStreamHold;
- (void)dealloc;
- (void)holdAudioStreamWithTimeout:(double)a3;
- (void)reset;
- (void)setAsset:(id)a3;
- (void)setAudioProvider:(id)a3;
- (void)setAudioStreamHolding:(id)a3;
- (void)setFirstPassDeviceID:(id)a3;
- (void)setIsSecondPassRunning:(BOOL)a3;
- (void)setRemoteMicVADScore:(float)a3;
- (void)setSecondChanceContext:(id)a3;
- (void)setSpeechManager:(id)a3;
- (void)setVoiceTriggerSecondPass:(id)a3;
- (void)start;
@end

@implementation CSHearstSecondPassRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondChanceContext, 0);
  objc_storeStrong((id *)&self->_speechManager, 0);
  objc_storeStrong((id *)&self->_audioProvider, 0);
  objc_storeStrong((id *)&self->_audioStreamHolding, 0);
  objc_storeStrong((id *)&self->_voiceTriggerSecondPass, 0);
  objc_storeStrong((id *)&self->_firstPassDeviceID, 0);
}

- (void)setSecondChanceContext:(id)a3
{
}

- (CSVoiceTriggerSecondChanceContext)secondChanceContext
{
  return self->_secondChanceContext;
}

- (void)setSpeechManager:(id)a3
{
}

- (CSSpeechManager)speechManager
{
  return self->_speechManager;
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

- (void)setRemoteMicVADScore:(float)a3
{
  self->_remoteMicVADScore = a3;
}

- (float)remoteMicVADScore
{
  return self->_remoteMicVADScore;
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
  v3 = [(CSHearstSecondPassRequest *)self audioProvider];
  [v3 cancelAudioStreamHold:self->_audioStreamHolding];

  audioStreamHolding = self->_audioStreamHolding;
  self->_audioStreamHolding = 0;
}

- (void)holdAudioStreamWithTimeout:(double)a3
{
  id v7 = +[CSAudioStreamHoldRequestOption defaultOptionWithTimeout:5.0];
  v4 = [(CSHearstSecondPassRequest *)self audioProvider];
  v5 = [v4 holdAudioStreamWithDescription:@"CSHearstSecondPassRequest" option:v7];
  audioStreamHolding = self->_audioStreamHolding;
  self->_audioStreamHolding = v5;
}

- (void)setAsset:(id)a3
{
}

- (void)reset
{
  self->_remoteMicVADScore = -1.0;
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
    v6 = "-[CSHearstSecondPassRequest dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s CSHearstSecondPassRequest is deallocated", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSHearstSecondPassRequest;
  [(CSHearstSecondPassRequest *)&v4 dealloc];
}

- (CSHearstSecondPassRequest)initWithDeviceID:(id)a3
{
  id v4 = a3;
  v5 = +[CSSpeechManager sharedManagerForCoreSpeechDaemon];
  v6 = [(CSHearstSecondPassRequest *)self initWithDeviceID:v4 speechManager:v5];

  return v6;
}

- (CSHearstSecondPassRequest)initWithDeviceID:(id)a3 speechManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CSHearstSecondPassRequest;
  v9 = [(CSHearstSecondPassRequest *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_speechManager, a4);
    objc_storeStrong((id *)&v10->_firstPassDeviceID, a3);
    v11 = [[CSVoiceTriggerSecondPass alloc] initWithPHSEnabled:0 speechManager:v10->_speechManager supportsMphDetection:0 secondPassQueue:0];
    voiceTriggerSecondPass = v10->_voiceTriggerSecondPass;
    v10->_voiceTriggerSecondPass = v11;

    [(CSVoiceTriggerSecondPass *)v10->_voiceTriggerSecondPass setFirstPassSource:3];
    [(CSVoiceTriggerSecondPass *)v10->_voiceTriggerSecondPass setSecondPassClient:2];
    v10->_remoteMicVADScore = -1.0;
    v10->_isSecondPassRunning = 0;
  }

  return v10;
}

@end