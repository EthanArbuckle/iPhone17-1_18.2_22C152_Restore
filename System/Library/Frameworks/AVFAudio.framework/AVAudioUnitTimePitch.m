@interface AVAudioUnitTimePitch
- (AVAudioUnitTimePitch)init;
- (float)overlap;
- (float)pitch;
- (float)rate;
- (void)setOverlap:(float)overlap;
- (void)setPitch:(float)pitch;
- (void)setRate:(float)rate;
@end

@implementation AVAudioUnitTimePitch

- (float)overlap
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)[(AVAudioNode *)self impl]);
  [(AVAudioUnit *)self valueForParam:4];
  float v4 = v3;
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7) {
    std::recursive_mutex::unlock(v6);
  }
  return v4;
}

- (float)pitch
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)[(AVAudioNode *)self impl]);
  [(AVAudioUnit *)self valueForParam:1];
  float v4 = v3;
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7) {
    std::recursive_mutex::unlock(v6);
  }
  return v4;
}

- (float)rate
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)[(AVAudioNode *)self impl]);
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

- (void)setOverlap:(float)overlap
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)[(AVAudioNode *)self impl]);
  *(float *)&double v5 = overlap;
  [(AVAudioUnit *)self setValue:4 forParam:v5];
  if (v10) {
    std::recursive_mutex::unlock(v9);
  }
  if (v8)
  {
    v6 = v7;
    std::recursive_mutex::unlock(v6);
  }
}

- (void)setPitch:(float)pitch
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)[(AVAudioNode *)self impl]);
  *(float *)&double v5 = pitch;
  [(AVAudioUnit *)self setValue:1 forParam:v5];
  if (v10) {
    std::recursive_mutex::unlock(v9);
  }
  if (v8)
  {
    v6 = v7;
    std::recursive_mutex::unlock(v6);
  }
}

- (void)setRate:(float)rate
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)[(AVAudioNode *)self impl]);
  *(float *)&double v5 = rate;
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

- (AVAudioUnitTimePitch)init
{
  long long v4 = xmmword_19D8B1D20;
  int v5 = 0;
  v3.receiver = self;
  v3.super_class = (Class)AVAudioUnitTimePitch;
  return [(AVAudioUnitTimeEffect *)&v3 initWithAudioComponentDescription:&v4];
}

@end