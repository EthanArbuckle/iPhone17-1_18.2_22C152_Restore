@interface AVAudioUnitReverb
- (AVAudioUnitReverb)init;
- (float)wetDryMix;
- (void)loadFactoryPreset:(AVAudioUnitReverbPreset)preset;
- (void)setWetDryMix:(float)wetDryMix;
@end

@implementation AVAudioUnitReverb

- (float)wetDryMix
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super.super.super._impl);
  [(AVAudioUnit *)self valueForParam:0];
  float v4 = v3;
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7) {
    std::recursive_mutex::unlock(v6);
  }
  return v4;
}

- (void)setWetDryMix:(float)wetDryMix
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)self->super.super.super._impl);
  *(float *)&double v5 = wetDryMix;
  [(AVAudioUnit *)self setValue:0 forParam:v5];
  if (v10) {
    std::recursive_mutex::unlock(v9);
  }
  if (v8)
  {
    v6 = v7;
    std::recursive_mutex::unlock(v6);
  }
}

- (void)loadFactoryPreset:(AVAudioUnitReverbPreset)preset
{
  int v3 = preset;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super.super.super._impl);
  int v5 = v3;
  (*(void (**)(void *, uint64_t, void, void, int *, uint64_t))(*(void *)self->super.super.super._impl
                                                                          + 144))(self->super.super.super._impl, 10, 0, 0, &v5, 4);
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7) {
    std::recursive_mutex::unlock(v6);
  }
}

- (AVAudioUnitReverb)init
{
  long long v6 = xmmword_19D8B1D10;
  int v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)AVAudioUnitReverb;
  v2 = [(AVAudioUnitEffect *)&v5 initWithAudioComponentDescription:&v6];
  int v3 = v2;
  if (v2) {
    [(AVAudioUnitReverb *)v2 loadFactoryPreset:3];
  }
  return v3;
}

@end