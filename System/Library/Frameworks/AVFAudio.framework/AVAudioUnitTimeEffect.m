@interface AVAudioUnitTimeEffect
- (AVAudioUnitTimeEffect)initWithAudioComponentDescription:(AudioComponentDescription *)audioComponentDescription;
- (BOOL)bypass;
- (void)setBypass:(BOOL)bypass;
@end

@implementation AVAudioUnitTimeEffect

- (void)setBypass:(BOOL)bypass
{
  BOOL v3 = bypass;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)[(AVAudioNode *)self impl]);
  BOOL v5 = v3;
  (*(void (**)(void *, uint64_t, void, void, BOOL *, uint64_t))(*(void *)self->super.super._impl + 144))(self->super.super._impl, 21, 0, 0, &v5, 4);
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7) {
    std::recursive_mutex::unlock(v6);
  }
}

- (BOOL)bypass
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)[(AVAudioNode *)self impl]);
  int v5 = 0;
  (*(void (**)(void *, uint64_t, void, void, int *, uint64_t))(*(void *)self->super.super._impl + 152))(self->super.super._impl, 21, 0, 0, &v5, 4);
  int v3 = v5;
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7) {
    std::recursive_mutex::unlock(v6);
  }
  return v3 != 0;
}

- (AVAudioUnitTimeEffect)initWithAudioComponentDescription:(AudioComponentDescription *)audioComponentDescription
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (audioComponentDescription->componentType != 1635083875)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    int v5 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v11 = "AVAEInternal.h";
      __int16 v12 = 1024;
      int v13 = 71;
      __int16 v14 = 2080;
      v15 = "AVAudioUnitTimeEffect.mm";
      __int16 v16 = 1024;
      int v17 = 17;
      __int16 v18 = 2080;
      v19 = "-[AVAudioUnitTimeEffect initWithAudioComponentDescription:]";
      __int16 v20 = 2080;
      v21 = "audioComponentDescription.componentType == kAudioUnitType_FormatConverter";
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "audioComponentDescription.componentType == kAudioUnitType_FormatConverter");
  }
  long long v8 = *(_OWORD *)&audioComponentDescription->componentType;
  UInt32 componentFlagsMask = audioComponentDescription->componentFlagsMask;
  v7.receiver = self;
  v7.super_class = (Class)AVAudioUnitTimeEffect;
  return [(AVAudioUnit *)&v7 initWithAudioComponentDescription:&v8];
}

@end