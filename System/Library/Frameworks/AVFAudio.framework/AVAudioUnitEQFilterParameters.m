@interface AVAudioUnitEQFilterParameters
- (AVAudioUnitEQFilterParameters)init;
- (AVAudioUnitEQFilterParameters)initWithImpl:(AVAudioUnitEQFilterParametersImpl *)a3;
- (AVAudioUnitEQFilterType)filterType;
- (BOOL)bypass;
- (float)bandwidth;
- (float)frequency;
- (float)gain;
- (void)dealloc;
- (void)setBandwidth:(float)bandwidth;
- (void)setBypass:(BOOL)bypass;
- (void)setFilterType:(AVAudioUnitEQFilterType)filterType;
- (void)setFrequency:(float)frequency;
- (void)setGain:(float)gain;
@end

@implementation AVAudioUnitEQFilterParameters

- (BOOL)bypass
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((void *)self->_impl + 1));
  char v3 = (*(uint64_t (**)(void *))(*(void *)self->_impl + 88))(self->_impl);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (void)setBypass:(BOOL)bypass
{
  BOOL v3 = bypass;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, *((void *)self->_impl + 1));
  (*(void (**)(void *, BOOL))(*(void *)self->_impl + 48))(self->_impl, v3);
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7)
  {
    v5 = v6;
    std::recursive_mutex::unlock(v5);
  }
}

- (float)gain
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((void *)self->_impl + 1));
  float v3 = (*(float (**)(void *))(*(void *)self->_impl + 80))(self->_impl);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (void)setGain:(float)gain
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, *((void *)self->_impl + 1));
  (*(void (**)(void *, float))(*(void *)self->_impl + 40))(self->_impl, gain);
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7)
  {
    v5 = v6;
    std::recursive_mutex::unlock(v5);
  }
}

- (float)bandwidth
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((void *)self->_impl + 1));
  float v3 = (*(float (**)(void *))(*(void *)self->_impl + 72))(self->_impl);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (void)setBandwidth:(float)bandwidth
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, *((void *)self->_impl + 1));
  (*(void (**)(void *, float))(*(void *)self->_impl + 32))(self->_impl, bandwidth);
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7)
  {
    v5 = v6;
    std::recursive_mutex::unlock(v5);
  }
}

- (float)frequency
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((void *)self->_impl + 1));
  float v3 = (*(float (**)(void *))(*(void *)self->_impl + 64))(self->_impl);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (void)setFrequency:(float)frequency
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, *((void *)self->_impl + 1));
  (*(void (**)(void *, float))(*(void *)self->_impl + 24))(self->_impl, frequency);
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7)
  {
    v5 = v6;
    std::recursive_mutex::unlock(v5);
  }
}

- (AVAudioUnitEQFilterType)filterType
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((void *)self->_impl + 1));
  AVAudioUnitEQFilterType v3 = (*(uint64_t (**)(void *))(*(void *)self->_impl + 56))(self->_impl);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (void)setFilterType:(AVAudioUnitEQFilterType)filterType
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, *((void *)self->_impl + 1));
  (*(void (**)(void *, AVAudioUnitEQFilterType))(*(void *)self->_impl + 16))(self->_impl, filterType);
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7)
  {
    v5 = v6;
    std::recursive_mutex::unlock(v5);
  }
}

- (void)dealloc
{
  impl = self->_impl;
  if (impl) {
    (*(void (**)(void *, SEL))(*(void *)impl + 8))(impl, a2);
  }
  self->_impl = 0;
  v4.receiver = self;
  v4.super_class = (Class)AVAudioUnitEQFilterParameters;
  [(AVAudioUnitEQFilterParameters *)&v4 dealloc];
}

- (AVAudioUnitEQFilterParameters)initWithImpl:(AVAudioUnitEQFilterParametersImpl *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVAudioUnitEQFilterParameters;
  result = [(AVAudioUnitEQFilterParameters *)&v5 init];
  if (result) {
    result->_impl = a3;
  }
  return result;
}

- (AVAudioUnitEQFilterParameters)init
{
  return 0;
}

@end