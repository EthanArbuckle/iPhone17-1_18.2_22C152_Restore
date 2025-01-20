@interface AVAudioEnvironmentReverbParameters
- (AVAudioEnvironmentReverbParameters)init;
- (AVAudioEnvironmentReverbParameters)initWithEnvironment:(void *)a3;
- (AVAudioUnitEQFilterParameters)filterParameters;
- (BOOL)enable;
- (float)level;
- (void)dealloc;
- (void)loadFactoryReverbPreset:(AVAudioUnitReverbPreset)preset;
- (void)setEnable:(BOOL)enable;
- (void)setLevel:(float)level;
@end

@implementation AVAudioEnvironmentReverbParameters

- (void)dealloc
{
  self->_impl = 0;
  v2.receiver = self;
  v2.super_class = (Class)AVAudioEnvironmentReverbParameters;
  [(AVAudioEnvironmentReverbParameters *)&v2 dealloc];
}

- (void)loadFactoryReverbPreset:(AVAudioUnitReverbPreset)preset
{
  unsigned int v3 = preset;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->_impl);
  impl = self->_impl;
  unsigned int v10 = v3;
  if (v3 <= 0xC) {
    (*(void (**)(void *, uint64_t, void, void, unsigned int *, uint64_t))(*(void *)impl + 144))(impl, 10, 0, 0, &v10, 4);
  }
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7) {
    std::recursive_mutex::unlock(v6);
  }
}

- (AVAudioUnitEQFilterParameters)filterParameters
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  unsigned int v3 = (AVAudioUnitEQFilterParameters *)*((void *)self->_impl + 46);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (float)level
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  float v3 = *((float *)self->_impl + 95);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (void)setLevel:(float)level
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v8, (uint64_t)self->_impl);
  impl = (float *)self->_impl;
  if (impl[95] != level)
  {
    float v6 = 40.0;
    if (level < 40.0) {
      float v6 = level;
    }
    if (level <= -40.0) {
      float v6 = -40.0;
    }
    impl[95] = v6;
    (*(void (**)(float *, uint64_t, void, void))(*(void *)impl + 128))(impl, 9, 0, 0);
  }
  if (v11) {
    std::recursive_mutex::unlock(v10);
  }
  if (v9)
  {
    char v7 = v8;
    std::recursive_mutex::unlock(v7);
  }
}

- (BOOL)enable
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  int v3 = *((unsigned __int8 *)self->_impl + 376);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3 != 0;
}

- (void)setEnable:(BOOL)enable
{
  int v3 = enable;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->_impl);
  impl = (unsigned __int8 *)self->_impl;
  if (impl[376] != v3)
  {
    impl[376] = v3;
    int v10 = v3;
    (*(void (**)(unsigned __int8 *, uint64_t, void, void, int *, uint64_t))(*(void *)impl + 144))(impl, 1005, 0, 0, &v10, 4);
    AVAudioEnvironmentNodeImpl::ResetRenderingFlags((AVAudioEnvironmentNodeImpl *)impl);
  }
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7) {
    std::recursive_mutex::unlock(v6);
  }
}

- (AVAudioEnvironmentReverbParameters)initWithEnvironment:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVAudioEnvironmentReverbParameters;
  result = [(AVAudioEnvironmentReverbParameters *)&v5 init];
  if (result) {
    result->_impl = a3;
  }
  return result;
}

- (AVAudioEnvironmentReverbParameters)init
{
  return 0;
}

@end