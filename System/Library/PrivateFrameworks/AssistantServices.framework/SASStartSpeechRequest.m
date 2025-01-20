@interface SASStartSpeechRequest
- (void)ad_setAFSpeechRequestOptions:(id)a3;
- (void)ad_setCSSiriRecordingInfo:(id)a3;
@end

@implementation SASStartSpeechRequest

- (void)ad_setCSSiriRecordingInfo:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SASStartSpeechRequest;
  id v4 = a3;
  [(SASStartSpeechRequest *)&v6 ad_setCSSiriRecordingInfo:v4];
  v5 = objc_msgSend(v4, "voiceTriggerEventInfo", v6.receiver, v6.super_class);

  [(SASStartSpeechRequest *)self setVoiceTriggerEventInfo:v5];
}

- (void)ad_setAFSpeechRequestOptions:(id)a3
{
  id v4 = a3;
  if ([v4 isEyesFree]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = AFPreferencesAlwaysEyesFreeEnabled();
  }
  [(SASStartSpeechRequest *)self setEyesFree:v5];
  if ([v4 useStreamingDictation]) {
    uint64_t v6 = AFPreferencesStreamingDictationEnabled();
  }
  else {
    uint64_t v6 = 0;
  }
  [(SASStartSpeechRequest *)self setEnablePartialResults:v6];
  -[SASStartSpeechRequest setWasLaunchedForRequest:](self, "setWasLaunchedForRequest:", [v4 isInitialBringUp]);
  v7.receiver = self;
  v7.super_class = (Class)SASStartSpeechRequest;
  [(SASStartSpeechRequest *)&v7 ad_setAFSpeechRequestOptions:v4];
}

@end