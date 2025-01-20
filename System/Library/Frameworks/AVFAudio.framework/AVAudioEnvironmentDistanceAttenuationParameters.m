@interface AVAudioEnvironmentDistanceAttenuationParameters
- (AVAudioEnvironmentDistanceAttenuationModel)distanceAttenuationModel;
- (AVAudioEnvironmentDistanceAttenuationParameters)init;
- (AVAudioEnvironmentDistanceAttenuationParameters)initWithEnvironment:(void *)a3;
- (float)maximumDistance;
- (float)referenceDistance;
- (float)rolloffFactor;
- (void)dealloc;
- (void)setDistanceAttenuationModel:(AVAudioEnvironmentDistanceAttenuationModel)distanceAttenuationModel;
- (void)setMaximumDistance:(float)maximumDistance;
- (void)setReferenceDistance:(float)referenceDistance;
- (void)setRolloffFactor:(float)rolloffFactor;
@end

@implementation AVAudioEnvironmentDistanceAttenuationParameters

- (void)dealloc
{
  self->_impl = 0;
  v2.receiver = self;
  v2.super_class = (Class)AVAudioEnvironmentDistanceAttenuationParameters;
  [(AVAudioEnvironmentDistanceAttenuationParameters *)&v2 dealloc];
}

- (float)rolloffFactor
{
  return *((float *)self->_impl + 89);
}

- (void)setRolloffFactor:(float)rolloffFactor
{
  impl = (float *)self->_impl;
  if (impl[89] != rolloffFactor)
  {
    impl[89] = rolloffFactor;
    AVAudioEnvironmentNodeImpl::SetMixerDistanceParameters((AVAudioEnvironmentNodeImpl *)impl);
  }
}

- (float)referenceDistance
{
  return *((float *)self->_impl + 88);
}

- (void)setReferenceDistance:(float)referenceDistance
{
  impl = (float *)self->_impl;
  if (impl[88] != referenceDistance)
  {
    impl[88] = referenceDistance;
    AVAudioEnvironmentNodeImpl::SetMixerDistanceParameters((AVAudioEnvironmentNodeImpl *)impl);
  }
}

- (float)maximumDistance
{
  return *((float *)self->_impl + 87);
}

- (void)setMaximumDistance:(float)maximumDistance
{
  impl = (float *)self->_impl;
  if (impl[87] != maximumDistance)
  {
    impl[87] = maximumDistance;
    AVAudioEnvironmentNodeImpl::SetMixerDistanceParameters((AVAudioEnvironmentNodeImpl *)impl);
  }
}

- (AVAudioEnvironmentDistanceAttenuationModel)distanceAttenuationModel
{
  return (unint64_t)*((unsigned int *)self->_impl + 86);
}

- (void)setDistanceAttenuationModel:(AVAudioEnvironmentDistanceAttenuationModel)distanceAttenuationModel
{
  impl = self->_impl;
  int v9 = distanceAttenuationModel;
  if (impl[86] != distanceAttenuationModel && (distanceAttenuationModel - 1) <= 2)
  {
    impl[86] = distanceAttenuationModel;
    v5 = (void *)*((void *)impl + 39);
    if (v5 != (void *)(impl + 80))
    {
      do
      {
        (*(void (**)(_DWORD *, uint64_t, uint64_t, void, int *, uint64_t))(*(void *)impl + 144))(impl, 3013, 1, *((unsigned int *)v5 + 10), &v9, 4);
        v6 = (void *)v5[1];
        if (v6)
        {
          do
          {
            v7 = v6;
            v6 = (void *)*v6;
          }
          while (v6);
        }
        else
        {
          do
          {
            v7 = (void *)v5[2];
            BOOL v8 = *v7 == (void)v5;
            v5 = v7;
          }
          while (!v8);
        }
        v5 = v7;
      }
      while (v7 != (void *)(impl + 80));
    }
    AVAudioEnvironmentNodeImpl::SetMixerDistanceParameters((AVAudioEnvironmentNodeImpl *)impl);
  }
}

- (AVAudioEnvironmentDistanceAttenuationParameters)initWithEnvironment:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVAudioEnvironmentDistanceAttenuationParameters;
  result = [(AVAudioEnvironmentDistanceAttenuationParameters *)&v5 init];
  if (result) {
    result->_impl = a3;
  }
  return result;
}

- (AVAudioEnvironmentDistanceAttenuationParameters)init
{
  return 0;
}

@end