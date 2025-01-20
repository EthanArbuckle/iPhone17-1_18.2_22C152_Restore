@interface AVAudioInputNode
- (AVAudioVoiceProcessingOtherAudioDuckingConfiguration)voiceProcessingOtherAudioDuckingConfiguration;
- (BOOL)isVoiceProcessingAGCEnabled;
- (BOOL)isVoiceProcessingBypassed;
- (BOOL)isVoiceProcessingInputMuted;
- (BOOL)setManualRenderingInputPCMFormat:(AVAudioFormat *)format inputBlock:(AVAudioIONodeInputBlock)block;
- (BOOL)setMutedSpeechActivityEventListener:(void *)listenerBlock;
- (float)rate;
- (void)setVoiceProcessingAGCEnabled:(BOOL)voiceProcessingAGCEnabled;
- (void)setVoiceProcessingBypassed:(BOOL)voiceProcessingBypassed;
- (void)setVoiceProcessingInputMuted:(BOOL)voiceProcessingInputMuted;
- (void)setVoiceProcessingOtherAudioDuckingConfiguration:(AVAudioVoiceProcessingOtherAudioDuckingConfiguration)voiceProcessingOtherAudioDuckingConfiguration;
@end

@implementation AVAudioInputNode

- (void)setVoiceProcessingOtherAudioDuckingConfiguration:(AVAudioVoiceProcessingOtherAudioDuckingConfiguration)voiceProcessingOtherAudioDuckingConfiguration
{
  int duckingLevel = voiceProcessingOtherAudioDuckingConfiguration.duckingLevel;
  BOOL enableAdvancedDucking = voiceProcessingOtherAudioDuckingConfiguration.enableAdvancedDucking;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)self->super.super._impl);
  if ([(AVAudioIONode *)self isVoiceProcessingEnabled])
  {
    v6[0] = enableAdvancedDucking;
    v6[1] = duckingLevel;
    (*(void (**)(void *, uint64_t, void, void, _DWORD *, uint64_t))(*(void *)self->super.super._impl
                                                                               + 144))(self->super.super._impl, 2108, 0, 0, v6, 8);
  }
  if (v10) {
    std::recursive_mutex::unlock(v9);
  }
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
}

- (AVAudioVoiceProcessingOtherAudioDuckingConfiguration)voiceProcessingOtherAudioDuckingConfiguration
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v9, (uint64_t)self->super.super._impl);
  if ([(AVAudioIONode *)self isVoiceProcessingEnabled])
  {
    uint64_t v8 = 0;
    unsigned int v3 = (*(uint64_t (**)(void *, uint64_t, void, void, uint64_t *, uint64_t))(*(void *)self->super.super._impl
                                                                                        + 152))(self->super.super._impl, 2108, 0, 0, &v8, 8);
    if (v3) {
      AVAudioVoiceProcessingOtherAudioDuckingLevel v4 = (unint64_t)HIDWORD(v8);
    }
    else {
      AVAudioVoiceProcessingOtherAudioDuckingLevel v4 = AVAudioVoiceProcessingOtherAudioDuckingLevelDefault;
    }
    if ((_BYTE)v8) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    AVAudioVoiceProcessingOtherAudioDuckingLevel v4 = AVAudioVoiceProcessingOtherAudioDuckingLevelDefault;
    uint64_t v5 = 0;
  }
  if (v12) {
    std::recursive_mutex::unlock(v11);
  }
  if (v10) {
    std::recursive_mutex::unlock(v9);
  }
  BOOL v6 = v5;
  AVAudioVoiceProcessingOtherAudioDuckingLevel v7 = v4;
  result.int duckingLevel = v7;
  result.BOOL enableAdvancedDucking = v6;
  return result;
}

- (BOOL)setMutedSpeechActivityEventListener:(void *)listenerBlock
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v9, (uint64_t)self->super.super._impl);
  if ([(AVAudioIONode *)self isVoiceProcessingEnabled])
  {
    uint64_t v8 = 0;
    if (listenerBlock)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __56__AVAudioInputNode_setMutedSpeechActivityEventListener___block_invoke;
      v7[3] = &unk_1E5964648;
      v7[4] = listenerBlock;
      uint64_t v8 = v7;
    }
    char v5 = (*(uint64_t (**)(void *, uint64_t, void, void, void **, uint64_t))(*(void *)self->super.super._impl
                                                                                        + 144))(self->super.super._impl, 2106, 0, 0, &v8, 8);
  }
  else
  {
    char v5 = 0;
  }
  if (v12) {
    std::recursive_mutex::unlock(v11);
  }
  if (v10) {
    std::recursive_mutex::unlock(v9);
  }
  return v5;
}

uint64_t __56__AVAudioInputNode_setMutedSpeechActivityEventListener___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setVoiceProcessingInputMuted:(BOOL)voiceProcessingInputMuted
{
  BOOL v3 = voiceProcessingInputMuted;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super.super._impl);
  if ([(AVAudioIONode *)self isVoiceProcessingEnabled])
  {
    BOOL v5 = v3;
    (*(void (**)(void *, uint64_t, void, uint64_t, BOOL *, uint64_t))(*(void *)self->super.super._impl
                                                                                + 144))(self->super.super._impl, 2104, 0, 1, &v5, 4);
  }
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7) {
    std::recursive_mutex::unlock(v6);
  }
}

- (BOOL)isVoiceProcessingInputMuted
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super.super._impl);
  if ([(AVAudioIONode *)self isVoiceProcessingEnabled])
  {
    int v5 = 0;
    (*(void (**)(void *, uint64_t, void, uint64_t, int *, uint64_t))(*(void *)self->super.super._impl + 152))(self->super.super._impl, 2104, 0, 1, &v5, 4);
    BOOL v3 = v5 != 0;
  }
  else
  {
    BOOL v3 = 0;
  }
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7) {
    std::recursive_mutex::unlock(v6);
  }
  return v3;
}

- (void)setVoiceProcessingAGCEnabled:(BOOL)voiceProcessingAGCEnabled
{
  BOOL v3 = voiceProcessingAGCEnabled;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super.super._impl);
  if ([(AVAudioIONode *)self isVoiceProcessingEnabled])
  {
    BOOL v5 = v3;
    (*(void (**)(void *, uint64_t, void, uint64_t, BOOL *, uint64_t))(*(void *)self->super.super._impl
                                                                                + 144))(self->super.super._impl, 2101, 0, 1, &v5, 4);
  }
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7) {
    std::recursive_mutex::unlock(v6);
  }
}

- (BOOL)isVoiceProcessingAGCEnabled
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super.super._impl);
  if ([(AVAudioIONode *)self isVoiceProcessingEnabled])
  {
    int v5 = 0;
    (*(void (**)(void *, uint64_t, void, uint64_t, int *, uint64_t))(*(void *)self->super.super._impl + 152))(self->super.super._impl, 2101, 0, 1, &v5, 4);
    BOOL v3 = v5 != 0;
  }
  else
  {
    BOOL v3 = 0;
  }
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7) {
    std::recursive_mutex::unlock(v6);
  }
  return v3;
}

- (void)setVoiceProcessingBypassed:(BOOL)voiceProcessingBypassed
{
  BOOL v3 = voiceProcessingBypassed;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super.super._impl);
  if ([(AVAudioIONode *)self isVoiceProcessingEnabled])
  {
    BOOL v5 = v3;
    (*(void (**)(void *, uint64_t, void, uint64_t, BOOL *, uint64_t))(*(void *)self->super.super._impl
                                                                                + 144))(self->super.super._impl, 2100, 0, 1, &v5, 4);
  }
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7) {
    std::recursive_mutex::unlock(v6);
  }
}

- (BOOL)isVoiceProcessingBypassed
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super.super._impl);
  if ([(AVAudioIONode *)self isVoiceProcessingEnabled])
  {
    int v5 = 0;
    (*(void (**)(void *, uint64_t, void, uint64_t, int *, uint64_t))(*(void *)self->super.super._impl + 152))(self->super.super._impl, 2100, 0, 1, &v5, 4);
    BOOL v3 = v5 != 0;
  }
  else
  {
    BOOL v3 = 0;
  }
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7) {
    std::recursive_mutex::unlock(v6);
  }
  return v3;
}

- (BOOL)setManualRenderingInputPCMFormat:(AVAudioFormat *)format inputBlock:(AVAudioIONodeInputBlock)block
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v9, (uint64_t)self->super.super._impl);
  if ([(AVAudioIONode *)self isInManualRenderingMode]) {
    char v7 = AVAudioEngineImpl::SetInputNodeRenderCallback(*(AVAudioNodeImplBase ***)([(AVAudioEngine *)[(AVAudioNode *)self engine] implementation]+ 8), (uint64_t)format, (uint64_t)block);
  }
  else {
    char v7 = 0;
  }
  if (v12) {
    std::recursive_mutex::unlock(v11);
  }
  if (v10) {
    std::recursive_mutex::unlock(v9);
  }
  return v7;
}

- (float)rate
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v3, (uint64_t)self->super.super._impl);
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  if (v4) {
    std::recursive_mutex::unlock(v3);
  }
  return 1.0;
}

@end