@interface AVAudioIONode
- (AVAudioIONode)initWithIOUnit:(void *)a3 isInput:(BOOL)a4;
- (AudioUnit)audioUnit;
- (BOOL)enableManualRenderingMode:(int64_t)a3 isInput:(BOOL)a4;
- (BOOL)enableRealtimeRenderingModeWithIOUnit:(void *)a3 isInput:(BOOL)a4 forceIOUnitReset:(BOOL)a5;
- (BOOL)isInManualRenderingMode;
- (BOOL)isVoiceProcessingEnabled;
- (BOOL)setVoiceProcessingEnabled:(BOOL)enabled error:(NSError *)outError;
- (NSTimeInterval)presentationLatency;
- (int64_t)manualRenderingMode;
- (void)didAttachToEngine:(id)a3;
- (void)didDetachFromEngine:(id)a3 error:(id *)a4;
@end

@implementation AVAudioIONode

- (BOOL)enableRealtimeRenderingModeWithIOUnit:(void *)a3 isInput:(BOOL)a4 forceIOUnitReset:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v10, (uint64_t)self->super._impl);
  if (!a3)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    v8 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v15 = "AVAEInternal.h";
      __int16 v16 = 1024;
      int v17 = 71;
      __int16 v18 = 2080;
      v19 = "AVAudioIONode.mm";
      __int16 v20 = 1024;
      int v21 = 108;
      __int16 v22 = 2080;
      v23 = "-[AVAudioIONode enableRealtimeRenderingModeWithIOUnit:isInput:forceIOUnitReset:]";
      __int16 v24 = 2080;
      v25 = "ioUnit != nil";
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "ioUnit != nil");
  }
  if ([(AVAudioIONode *)self isInManualRenderingMode] || v5) {
    operator new();
  }
  if (v13) {
    std::recursive_mutex::unlock(v12);
  }
  if (v11) {
    std::recursive_mutex::unlock(v10);
  }
  return 1;
}

- (BOOL)enableManualRenderingMode:(int64_t)a3 isInput:(BOOL)a4
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v9, (uint64_t)self->super._impl);
  if ([(AVAudioIONode *)self isVoiceProcessingEnabled])
  {
    BOOL v6 = 0;
  }
  else if ([(AVAudioIONode *)self isInManualRenderingMode] {
         && [(AVAudioIONode *)self manualRenderingMode] == a3)
  }
  {
    BOOL v6 = 1;
  }
  else
  {
    if (![(AVAudioIONode *)self isInManualRenderingMode]) {
      operator new();
    }
    impl = self->super._impl;
    BOOL v6 = 1;
    (*(void (**)(void *, uint64_t, int64_t))(*(void *)impl + 288))(impl, 1, a3);
  }
  if (v12) {
    std::recursive_mutex::unlock(v11);
  }
  if (v10) {
    std::recursive_mutex::unlock(v9);
  }
  return v6;
}

- (BOOL)isVoiceProcessingEnabled
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)self->super._impl);
  v3 = (_DWORD *)(*(uint64_t (**)(void *))(*(void *)self->super._impl + 256))(self->super._impl);
  BOOL v5 = *v3 == 1635086197 && v3[1] == 1987078511 && v3[2] == 1634758764;
  if (v10) {
    std::recursive_mutex::unlock(v9);
  }
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  return v5;
}

- (BOOL)setVoiceProcessingEnabled:(BOOL)enabled error:(NSError *)outError
{
  int v5 = enabled;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v20, (uint64_t)self->super._impl);
  if ([(AVAudioIONode *)self isVoiceProcessingEnabled] == v5)
  {
    BOOL v10 = 1;
    goto LABEL_26;
  }
  v7 = [(AVAudioEngine *)[(AVAudioNode *)self engine] implementation];
  if ([(id)AVAudioEngineImpl::GetOutputNode((AVAudioEngineImpl *)v7) isVoiceProcessingEnabled] != v5)
  {
    uint64_t v8 = *((void *)v7 + 1);
    if (v5) {
      int v9 = -10863;
    }
    else {
      int v9 = 0;
    }
    if (!*(unsigned char *)(v8 + 187))
    {
      if (!*(unsigned char *)(v8 + 185))
      {
        char v11 = (AVAudioNode *)*((void *)v7 + 5);
        if (v11)
        {
          AVAudioEngineImpl::GetInputConnectionPointForNode((AVAudioEngineImpl *)v7, v11, 0);
          id v12 = *((id *)v7 + 5);
          AVAudioEngineGraph::RemoveIONode(*((AVAudioEngineGraph **)v7 + 1), *((AVAudioNode **)v7 + 5), 0, 0);
          AVAudioEngineImpl::DetachNode((id *)v7, *((AVAudioNode **)v7 + 5), 1, 0);
        }
        char v13 = (AVAudioNode *)*((void *)v7 + 4);
        if (v13)
        {
          AVAudioEngineImpl::GetOutputConnectionPointsForNode((AVAudioEngineImpl *)v7, v13, 0);
          id v14 = *((id *)v7 + 4);
          AVAudioEngineGraph::RemoveIONode(*((AVAudioEngineGraph **)v7 + 1), *((AVAudioNode **)v7 + 4), 1, 0);
          AVAudioEngineImpl::DetachNode((id *)v7, *((AVAudioNode **)v7 + 4), 1, 0);
        }
        uint64_t v15 = *((void *)v7 + 7);
        *((void *)v7 + 7) = 0;
        if (v15) {
          (*(void (**)(uint64_t))(*(void *)v15 + 8))(v15);
        }
        unsigned __int8 AudioSession = AVAudioEngineImpl::GetAudioSession((AVAudioEngineImpl *)v7);
        AVAudioIOUnit::Create((AVAudioIOUnit *)buf, (AVAudioEngineImpl *)v7, v5, AudioSession, v17);
      }
      int v9 = -10849;
      if (!outError) {
        goto LABEL_25;
      }
      goto LABEL_22;
    }
    if (!outError) {
      goto LABEL_25;
    }
LABEL_21:
    if (!v9)
    {
      __int16 v18 = 0;
      goto LABEL_24;
    }
LABEL_22:
    __int16 v18 = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.coreaudio.avfaudio" code:v9 userInfo:0];
LABEL_24:
    *outError = v18;
    goto LABEL_25;
  }
  int v9 = 0;
  if (outError) {
    goto LABEL_21;
  }
LABEL_25:
  BOOL v10 = v9 == 0;
LABEL_26:
  if (v23) {
    std::recursive_mutex::unlock(v22);
  }
  if (v21) {
    std::recursive_mutex::unlock(v20);
  }
  return v10;
}

- (int64_t)manualRenderingMode
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->super._impl);
  int64_t v3 = *((void *)self->super._impl + 10);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (BOOL)isInManualRenderingMode
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->super._impl);
  int v3 = *((unsigned __int8 *)self->super._impl + 72);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3 != 0;
}

- (void)didDetachFromEngine:(id)a3 error:(id *)a4
{
  uint64_t v6 = [a3 implementation];
  v7 = (std::recursive_mutex *)((char *)self->super._impl + 104);
  char v8 = (std::recursive_mutex *)(v6 + 112);
  std::lock[abi:ne180100]<std::recursive_mutex,std::recursive_mutex>(v7, (std::recursive_mutex *)(v6 + 112));
  (*(void (**)(void *, id))(*(void *)self->super._impl + 24))(self->super._impl, a3);
  std::recursive_mutex::unlock(v7);

  std::recursive_mutex::unlock(v8);
}

- (void)didAttachToEngine:(id)a3
{
  uint64_t v5 = [a3 implementation];
  uint64_t v6 = (std::recursive_mutex *)((char *)self->super._impl + 104);
  v7 = (std::recursive_mutex *)(v5 + 112);
  std::lock[abi:ne180100]<std::recursive_mutex,std::recursive_mutex>(v6, (std::recursive_mutex *)(v5 + 112));
  (*(void (**)(void *, id))(*(void *)self->super._impl + 16))(self->super._impl, a3);
  std::recursive_mutex::unlock(v6);

  std::recursive_mutex::unlock(v7);
}

- (AudioUnit)audioUnit
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->super._impl);
  int v3 = (OpaqueAudioComponentInstance *)(*(uint64_t (**)(void *))(*(void *)self->super._impl + 224))(self->super._impl);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (NSTimeInterval)presentationLatency
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->super._impl);
  double v3 = (*(double (**)(void *))(*(void *)self->super._impl + 216))(self->super._impl);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (AVAudioIONode)initWithIOUnit:(void *)a3 isInput:(BOOL)a4
{
  if (a3) {
    operator new();
  }
  operator new();
}

@end