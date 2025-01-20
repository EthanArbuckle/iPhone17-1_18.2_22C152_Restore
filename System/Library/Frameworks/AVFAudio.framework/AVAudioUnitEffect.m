@interface AVAudioUnitEffect
- (AVAudioUnitEffect)initWithAudioComponentDescription:(AudioComponentDescription *)audioComponentDescription;
- (BOOL)bypass;
- (void)setBypass:(BOOL)bypass;
@end

@implementation AVAudioUnitEffect

- (void)setBypass:(BOOL)bypass
{
  BOOL v3 = bypass;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super.super._impl);
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
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super.super._impl);
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

- (AVAudioUnitEffect)initWithAudioComponentDescription:(AudioComponentDescription *)audioComponentDescription
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  OSType componentType = audioComponentDescription->componentType;
  if ((int)audioComponentDescription->componentType <= 1635086445)
  {
    BOOL v6 = componentType == 1635083896;
    unsigned __int16 v7 = 28006;
  }
  else
  {
    BOOL v6 = componentType == 1635086446 || componentType == 1635086957;
    unsigned __int16 v7 = 29304;
  }
  int v8 = v7 | 0x61750000;
  if (!v6 && componentType != v8)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    v11 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v16 = "AVAEInternal.h";
      __int16 v17 = 1024;
      int v18 = 71;
      __int16 v19 = 2080;
      v20 = "AVAudioUnitEffect.mm";
      __int16 v21 = 1024;
      int v22 = 26;
      __int16 v23 = 2080;
      v24 = "-[AVAudioUnitEffect initWithAudioComponentDescription:]";
      __int16 v25 = 2080;
      v26 = "(audioComponentDescription.componentType == kAudioUnitType_Effect) || (audioComponentDescription.componentTy"
            "pe == kAudioUnitType_MusicEffect) || (audioComponentDescription.componentType == kAudioUnitType_Panner) || ("
            "audioComponentDescription.componentType == kAudioUnitType_RemoteEffect) || (audioComponentDescription.compon"
            "entType == kAudioUnitType_RemoteMusicEffect)";
      _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "(audioComponentDescription.componentType == kAudioUnitType_Effect) || (audioComponentDescription.componentType == kAudioUnitType_MusicEffect) || (audioComponentDescription.componentType == kAudioUnitType_Panner) || (audioComponentDescription.componentType == kAudioUnitType_RemoteEffect) || (audioComponentDescription.componentType == kAudioUnitType_RemoteMusicEffect)");
  }
  long long v13 = *(_OWORD *)&audioComponentDescription->componentType;
  UInt32 componentFlagsMask = audioComponentDescription->componentFlagsMask;
  v12.receiver = self;
  v12.super_class = (Class)AVAudioUnitEffect;
  return [(AVAudioUnit *)&v12 initWithAudioComponentDescription:&v13];
}

@end