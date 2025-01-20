@interface SARDStartServerRequest
- (void)ad_setAFSpeechEvent:(int64_t)a3;
- (void)ad_setAFSpeechRequestOptions:(id)a3;
- (void)ad_setCSSiriRecordingInfo:(id)a3;
@end

@implementation SARDStartServerRequest

- (void)ad_setCSSiriRecordingInfo:(id)a3
{
  id v4 = a3;
  v5 = [v4 source];
  v6 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    v11 = "-[SARDStartServerRequest(ADSAExtensions) ad_setCSSiriRecordingInfo:]";
    __int16 v12 = 2112;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s audioSource = %@", (uint8_t *)&v10, 0x16u);
  }
  [(SARDStartServerRequest *)self setAudioSource:v5];
  v7 = [v4 destination];
  v8 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    v11 = "-[SARDStartServerRequest(ADSAExtensions) ad_setCSSiriRecordingInfo:]";
    __int16 v12 = 2112;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s audioDestination = %@", (uint8_t *)&v10, 0x16u);
  }
  [(SARDStartServerRequest *)self setAudioDestination:v7];
  v9 = [v4 modelName];
  [(SARDStartServerRequest *)self setDeviceModel:v9];
}

- (void)ad_setAFSpeechRequestOptions:(id)a3
{
  id v4 = a3;
  id v11 = v4;
  if (v4) {
    id v5 = [v4 activationEvent];
  }
  else {
    id v5 = 0;
  }
  [(SARDStartServerRequest *)self ad_setAFSpeechEvent:v5];
  v6 = [v11 turnIdentifier];
  if (v6)
  {
    v7 = AFTurnIdentifierGetString();
    [(SARDStartServerRequest *)self setTurnId:v7];
  }
  else
  {
    [(SARDStartServerRequest *)self setTurnId:0];
  }
  if ([v11 isEyesFree]) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = AFPreferencesAlwaysEyesFreeEnabled();
  }
  [(SARDStartServerRequest *)self setEyesFree:v8];
  v9 = [(SARDStartServerRequest *)self voiceTriggerEventInfo];

  if (!v9)
  {
    int v10 = [v11 voiceTriggerEventInfo];
    [(SARDStartServerRequest *)self setVoiceTriggerEventInfo:v10];
  }
}

- (void)ad_setAFSpeechEvent:(int64_t)a3
{
  id v5 = sub_10035C6FC(a3);
  [(SARDStartServerRequest *)self setOrigin:v5];

  sub_10035C6FC(a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(SARDStartServerRequest *)self setInputOrigin:v6];
}

@end