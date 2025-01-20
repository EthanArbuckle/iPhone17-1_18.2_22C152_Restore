@interface AVAudioMixerNode
- (AVAudioMixerNode)init;
- (AVAudioNodeBus)nextAvailableInputBus;
- (float)outputVolume;
- (void)didAttachToEngine:(id)a3;
- (void)inputConnected:(unint64_t)a3;
- (void)setInputPan:(float)a3 bus:(unint64_t)a4;
- (void)setInputVolume:(float)a3 bus:(unint64_t)a4;
- (void)setOutputVolume:(float)outputVolume;
@end

@implementation AVAudioMixerNode

- (void)didAttachToEngine:(id)a3
{
  uint64_t v5 = [a3 implementation];
  v6 = (std::recursive_mutex *)((char *)self->super._impl + 104);
  v7 = (std::recursive_mutex *)(v5 + 112);
  std::lock[abi:ne180100]<std::recursive_mutex,std::recursive_mutex>(v6, (std::recursive_mutex *)(v5 + 112));
  v8.receiver = self;
  v8.super_class = (Class)AVAudioMixerNode;
  [(AVAudioNode *)&v8 didAttachToEngine:a3];
  (*(void (**)(void *, void, uint64_t, void, float))(*(void *)self->super._impl + 128))(self->super._impl, 0, 2, 0, 1.0);
  std::recursive_mutex::unlock(v6);
  std::recursive_mutex::unlock(v7);
}

- (AVAudioNodeBus)nextAvailableInputBus
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v8, (uint64_t)self->super._impl);
  impl = self->super._impl;
  AVAudioNodeBus v4 = impl[4];
  if (v4)
  {
    AVAudioNodeBus v5 = 0;
    uint64_t v6 = impl[3];
    while (((*(void *)(v6 + ((v5 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
    {
      if (v4 == ++v5)
      {
        AVAudioNodeBus v5 = v4;
        break;
      }
    }
  }
  else
  {
    AVAudioNodeBus v5 = 0;
  }
  if (v11) {
    std::recursive_mutex::unlock(v10);
  }
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  return v5;
}

- (void)inputConnected:(unint64_t)a3
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super._impl);
  (*(void (**)(void *, void, uint64_t, unint64_t, float))(*(void *)self->super._impl + 128))(self->super._impl, 0, 1, a3, 1.0);
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7)
  {
    AVAudioNodeBus v5 = v6;
    std::recursive_mutex::unlock(v5);
  }
}

- (void)setInputPan:(float)a3 bus:(unint64_t)a4
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v8, (uint64_t)self->super._impl);
  (*(void (**)(void *, uint64_t, uint64_t, unint64_t, float))(*(void *)self->super._impl + 128))(self->super._impl, 2, 1, a4, a3);
  if (v11) {
    std::recursive_mutex::unlock(v10);
  }
  if (v9)
  {
    char v7 = v8;
    std::recursive_mutex::unlock(v7);
  }
}

- (void)setInputVolume:(float)a3 bus:(unint64_t)a4
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v8, (uint64_t)self->super._impl);
  (*(void (**)(void *, void, uint64_t, unint64_t, float))(*(void *)self->super._impl + 128))(self->super._impl, 0, 1, a4, a3);
  if (v11) {
    std::recursive_mutex::unlock(v10);
  }
  if (v9)
  {
    char v7 = v8;
    std::recursive_mutex::unlock(v7);
  }
}

- (float)outputVolume
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super._impl);
  float v5 = 0.0;
  (*(void (**)(void *, void, uint64_t, void, float *))(*(void *)self->super._impl + 136))(self->super._impl, 0, 2, 0, &v5);
  float v3 = v5;
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7) {
    std::recursive_mutex::unlock(v6);
  }
  return v3;
}

- (void)setOutputVolume:(float)outputVolume
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super._impl);
  (*(void (**)(void *, void, uint64_t, void, float))(*(void *)self->super._impl + 128))(self->super._impl, 0, 2, 0, outputVolume);
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7)
  {
    float v5 = v6;
    std::recursive_mutex::unlock(v5);
  }
}

- (AVAudioMixerNode)init
{
}

@end