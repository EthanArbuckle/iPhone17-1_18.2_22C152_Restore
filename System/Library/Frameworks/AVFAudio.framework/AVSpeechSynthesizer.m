@interface AVSpeechSynthesizer
+ (AVSpeechSynthesisPersonalVoiceAuthorizationStatus)personalVoiceAuthorizationStatus;
+ (void)initialize;
- (BOOL)continueSpeaking;
- (BOOL)isPaused;
- (BOOL)isSpeaking;
- (BOOL)mixToTelephonyUplink;
- (BOOL)pauseSpeakingAtBoundary:(AVSpeechBoundary)boundary;
- (BOOL)stopSpeakingAtBoundary:(AVSpeechBoundary)boundary;
- (BOOL)usesApplicationAudioSession;
- (NSArray)outputChannels;
- (id)delegate;
- (void)setDelegate:(id)delegate;
- (void)setMixToTelephonyUplink:(BOOL)mixToTelephonyUplink;
- (void)setOutputChannels:(NSArray *)outputChannels;
- (void)setUsesApplicationAudioSession:(BOOL)usesApplicationAudioSession;
@end

@implementation AVSpeechSynthesizer

+ (AVSpeechSynthesisPersonalVoiceAuthorizationStatus)personalVoiceAuthorizationStatus
{
  return 2;
}

+ (void)initialize
{
  if (_AVLoadSpeechSynthesisImplementation(void)::onceToken != -1) {
    dispatch_once(&_AVLoadSpeechSynthesisImplementation(void)::onceToken, &__block_literal_global_5009);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputChannels, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setMixToTelephonyUplink:(BOOL)mixToTelephonyUplink
{
  self->_mixToTelephonyUplink = mixToTelephonyUplink;
}

- (BOOL)mixToTelephonyUplink
{
  return self->_mixToTelephonyUplink;
}

- (void)setUsesApplicationAudioSession:(BOOL)usesApplicationAudioSession
{
  self->_usesApplicationAudioSession = usesApplicationAudioSession;
}

- (BOOL)usesApplicationAudioSession
{
  return self->_usesApplicationAudioSession;
}

- (void)setOutputChannels:(NSArray *)outputChannels
{
}

- (NSArray)outputChannels
{
  return self->_outputChannels;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (BOOL)isSpeaking
{
  return self->_speaking;
}

- (void)setDelegate:(id)delegate
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (BOOL)continueSpeaking
{
  return 0;
}

- (BOOL)pauseSpeakingAtBoundary:(AVSpeechBoundary)boundary
{
  return 0;
}

- (BOOL)stopSpeakingAtBoundary:(AVSpeechBoundary)boundary
{
  return 0;
}

@end