@interface AVAudioOutputNode
- (BOOL)setManualRenderingPCMFormat:(id)a3 maximumFrameCount:(unsigned int)a4;
- (id)manualRenderingFormat;
- (unsigned)manualRenderingMaximumFrameCount;
@end

@implementation AVAudioOutputNode

- (unsigned)manualRenderingMaximumFrameCount
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)self->super.super._impl);
  if (![(AVAudioIONode *)self isInManualRenderingMode])
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    v3 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v12 = "AVAEInternal.h";
      __int16 v13 = 1024;
      int v14 = 71;
      __int16 v15 = 2080;
      v16 = "AVAudioIONode.mm";
      __int16 v17 = 1024;
      int v18 = 148;
      __int16 v19 = 2080;
      v20 = "-[AVAudioOutputNode manualRenderingMaximumFrameCount]";
      __int16 v21 = 2080;
      v22 = "self.isInManualRenderingMode";
      _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "self.isInManualRenderingMode");
  }
  uint64_t v4 = (*(uint64_t (**)(void *))(*(void *)self->super.super._impl + 40))(self->super.super._impl);
  unsigned int v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 152))(v4);
  if (v10) {
    std::recursive_mutex::unlock(v9);
  }
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  return v5;
}

- (id)manualRenderingFormat
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super.super._impl);
  if (![(AVAudioIONode *)self isInManualRenderingMode])
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    v3 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v11 = "AVAEInternal.h";
      __int16 v12 = 1024;
      int v13 = 71;
      __int16 v14 = 2080;
      __int16 v15 = "AVAudioIONode.mm";
      __int16 v16 = 1024;
      int v17 = 140;
      __int16 v18 = 2080;
      __int16 v19 = "-[AVAudioOutputNode manualRenderingFormat]";
      __int16 v20 = 2080;
      __int16 v21 = "self.isInManualRenderingMode";
      _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "self.isInManualRenderingMode");
  }
  uint64_t v4 = [(AVAudioNode *)self outputFormatForBus:0];
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7) {
    std::recursive_mutex::unlock(v6);
  }
  return v4;
}

- (BOOL)setManualRenderingPCMFormat:(id)a3 maximumFrameCount:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v11, (uint64_t)self->super.super._impl);
  if (![(AVAudioIONode *)self isInManualRenderingMode])
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    char v7 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      __int16 v16 = "AVAEInternal.h";
      __int16 v17 = 1024;
      int v18 = 71;
      __int16 v19 = 2080;
      __int16 v20 = "AVAudioIONode.mm";
      __int16 v21 = 1024;
      int v22 = 124;
      __int16 v23 = 2080;
      v24 = "-[AVAudioOutputNode setManualRenderingPCMFormat:maximumFrameCount:]";
      __int16 v25 = 2080;
      v26 = "self.isInManualRenderingMode";
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "self.isInManualRenderingMode");
  }
  if (objc_msgSend(-[AVAudioOutputNode manualRenderingFormat](self, "manualRenderingFormat"), "isEqual:", a3)&& -[AVAudioOutputNode manualRenderingMaximumFrameCount](self, "manualRenderingMaximumFrameCount") == v4)
  {
    goto LABEL_11;
  }
  if ((*(unsigned int (**)(void *, void, id))(*(void *)self->super.super._impl + 64))(self->super.super._impl, 0, a3))
  {
    uint64_t v8 = (*(uint64_t (**)(void *))(*(void *)self->super.super._impl + 40))(self->super.super._impl);
    (*(void (**)(uint64_t, uint64_t))(*(void *)v8 + 160))(v8, v4);
LABEL_11:
    BOOL v9 = 1;
    goto LABEL_13;
  }
  BOOL v9 = 0;
LABEL_13:
  if (v14) {
    std::recursive_mutex::unlock(v13);
  }
  if (v12) {
    std::recursive_mutex::unlock(v11);
  }
  return v9;
}

@end