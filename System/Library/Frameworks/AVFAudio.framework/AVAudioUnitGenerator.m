@interface AVAudioUnitGenerator
- (AVAudioUnitGenerator)initWithAudioComponentDescription:(AudioComponentDescription *)audioComponentDescription;
- (BOOL)bypass;
- (void)setBypass:(BOOL)bypass;
@end

@implementation AVAudioUnitGenerator

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

- (AVAudioUnitGenerator)initWithAudioComponentDescription:(AudioComponentDescription *)audioComponentDescription
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (audioComponentDescription->componentType != 1635084142 && audioComponentDescription->componentType != 1635086951)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v12 = "AVAEInternal.h";
      __int16 v13 = 1024;
      int v14 = 71;
      __int16 v15 = 2080;
      v16 = "AVAudioUnitGenerator.mm";
      __int16 v17 = 1024;
      int v18 = 24;
      __int16 v19 = 2080;
      v20 = "-[AVAudioUnitGenerator initWithAudioComponentDescription:]";
      __int16 v21 = 2080;
      v22 = "(audioComponentDescription.componentType == kAudioUnitType_Generator) || (audioComponentDescription.componen"
            "tType == kAudioUnitType_RemoteGenerator)";
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "(audioComponentDescription.componentType == kAudioUnitType_Generator) || (audioComponentDescription.componentType == kAudioUnitType_RemoteGenerator)");
  }
  long long v9 = *(_OWORD *)&audioComponentDescription->componentType;
  UInt32 componentFlagsMask = audioComponentDescription->componentFlagsMask;
  v8.receiver = self;
  v8.super_class = (Class)AVAudioUnitGenerator;
  return [(AVAudioUnit *)&v8 initWithAudioComponentDescription:&v9];
}

@end