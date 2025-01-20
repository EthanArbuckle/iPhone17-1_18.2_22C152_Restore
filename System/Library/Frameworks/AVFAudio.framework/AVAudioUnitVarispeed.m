@interface AVAudioUnitVarispeed
- (AVAudioUnitVarispeed)init;
- (float)rate;
- (void)setRate:(float)rate;
@end

@implementation AVAudioUnitVarispeed

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

- (AVAudioUnitVarispeed)init
{
  long long v4 = xmmword_19D8B1CE0;
  int v5 = 0;
  v3.receiver = self;
  v3.super_class = (Class)AVAudioUnitVarispeed;
  return [(AVAudioUnitTimeEffect *)&v3 initWithAudioComponentDescription:&v4];
}

@end