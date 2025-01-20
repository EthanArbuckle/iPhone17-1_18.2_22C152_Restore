@interface AVConferenceCallState
- (BOOL)isAudioPaused;
- (BOOL)isAudioSending;
- (BOOL)isVideoPaused;
- (VCCapabilities)capabilities;
- (unsigned)relayedCallType;
- (void)dealloc;
- (void)setAudioIsPaused:(BOOL)a3;
- (void)setCapabilities:(id)a3;
- (void)setIsAudioSending:(BOOL)a3;
- (void)setIsVideoPaused:(BOOL)a3;
- (void)setRelayedCallType:(unsigned __int8)a3;
@end

@implementation AVConferenceCallState

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)AVConferenceCallState;
  [(AVConferenceCallState *)&v3 dealloc];
}

- (BOOL)isAudioPaused
{
  return self->_audioIsPaused;
}

- (void)setAudioIsPaused:(BOOL)a3
{
  self->_audioIsPaused = a3;
}

- (BOOL)isVideoPaused
{
  return self->_isVideoPaused;
}

- (void)setIsVideoPaused:(BOOL)a3
{
  self->_isVideoPaused = a3;
}

- (BOOL)isAudioSending
{
  return self->_isAudioSending;
}

- (void)setIsAudioSending:(BOOL)a3
{
  self->_isAudioSending = a3;
}

- (VCCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (unsigned)relayedCallType
{
  return self->_relayedCallType;
}

- (void)setRelayedCallType:(unsigned __int8)a3
{
  self->_relayedCallType = a3;
}

@end