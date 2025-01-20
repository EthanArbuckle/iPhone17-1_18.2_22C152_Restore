@interface AVAudioUnitDistortion
- (AUPreset)FillOutAUPreset:(int64_t)a3;
- (AVAudioUnitDistortion)init;
- (float)preGain;
- (float)wetDryMix;
- (void)loadFactoryPreset:(AVAudioUnitDistortionPreset)preset;
- (void)setPreGain:(float)preGain;
- (void)setWetDryMix:(float)wetDryMix;
@end

@implementation AVAudioUnitDistortion

- (float)wetDryMix
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super.super.super._impl);
  [(AVAudioUnit *)self valueForParam:15];
  float v4 = v3;
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7) {
    std::recursive_mutex::unlock(v6);
  }
  return v4;
}

- (float)preGain
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super.super.super._impl);
  [(AVAudioUnit *)self valueForParam:14];
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
  [(AVAudioUnit *)self setValue:15 forParam:v5];
  if (v10) {
    std::recursive_mutex::unlock(v9);
  }
  if (v8)
  {
    v6 = v7;
    std::recursive_mutex::unlock(v6);
  }
}

- (void)setPreGain:(float)preGain
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)self->super.super.super._impl);
  *(float *)&double v5 = preGain;
  [(AVAudioUnit *)self setValue:14 forParam:v5];
  if (v10) {
    std::recursive_mutex::unlock(v9);
  }
  if (v8)
  {
    v6 = v7;
    std::recursive_mutex::unlock(v6);
  }
}

- (void)loadFactoryPreset:(AVAudioUnitDistortionPreset)preset
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)self->super.super.super._impl);
  v6[0] = [(AVAudioUnitDistortion *)self FillOutAUPreset:preset];
  v6[1] = v5;
  (*(void (**)(void *, uint64_t, void, void, void *, uint64_t))(*(void *)self->super.super.super._impl
                                                                             + 144))(self->super.super.super._impl, 36, 0, 0, v6, 16);
  if (v10) {
    std::recursive_mutex::unlock(v9);
  }
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
}

- (AUPreset)FillOutAUPreset:(int64_t)a3
{
  if ((unint64_t)a3 > 0x15)
  {
    CFStringRef v4 = 0;
    int64_t v3 = 0xFFFFFFFFLL;
  }
  else
  {
    int64_t v3 = a3;
    CFStringRef v4 = (const __CFString *)*((void *)&off_1E5964AC0 + a3);
  }
  result.presetName = v4;
  result.presetNumber = v3;
  return result;
}

- (AVAudioUnitDistortion)init
{
  long long v6 = xmmword_19D8B1D60;
  int v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)AVAudioUnitDistortion;
  v2 = [(AVAudioUnitEffect *)&v5 initWithAudioComponentDescription:&v6];
  int64_t v3 = v2;
  if (v2) {
    [(AVAudioUnitDistortion *)v2 loadFactoryPreset:0];
  }
  return v3;
}

@end