@interface AVAudioUnitDelay
- (AVAudioUnitDelay)init;
- (NSTimeInterval)delayTime;
- (float)feedback;
- (float)lowPassCutoff;
- (float)wetDryMix;
- (void)setDelayTime:(NSTimeInterval)delayTime;
- (void)setFeedback:(float)feedback;
- (void)setLowPassCutoff:(float)lowPassCutoff;
- (void)setWetDryMix:(float)wetDryMix;
@end

@implementation AVAudioUnitDelay

- (float)lowPassCutoff
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)[(AVAudioNode *)self impl]);
  [(AVAudioUnit *)self valueForParam:3];
  float v4 = v3;
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7) {
    std::recursive_mutex::unlock(v6);
  }
  return v4;
}

- (float)feedback
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)[(AVAudioNode *)self impl]);
  [(AVAudioUnit *)self valueForParam:2];
  float v4 = v3;
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7) {
    std::recursive_mutex::unlock(v6);
  }
  return v4;
}

- (NSTimeInterval)delayTime
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

- (float)wetDryMix
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

- (void)setLowPassCutoff:(float)lowPassCutoff
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)[(AVAudioNode *)self impl]);
  *(float *)&double v5 = lowPassCutoff;
  [(AVAudioUnit *)self setValue:3 forParam:v5];
  if (v10) {
    std::recursive_mutex::unlock(v9);
  }
  if (v8)
  {
    v6 = v7;
    std::recursive_mutex::unlock(v6);
  }
}

- (void)setFeedback:(float)feedback
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)[(AVAudioNode *)self impl]);
  *(float *)&double v5 = feedback;
  [(AVAudioUnit *)self setValue:2 forParam:v5];
  if (v10) {
    std::recursive_mutex::unlock(v9);
  }
  if (v8)
  {
    v6 = v7;
    std::recursive_mutex::unlock(v6);
  }
}

- (void)setDelayTime:(NSTimeInterval)delayTime
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)[(AVAudioNode *)self impl]);
  *(float *)&double v5 = delayTime;
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

- (void)setWetDryMix:(float)wetDryMix
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)[(AVAudioNode *)self impl]);
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

- (AVAudioUnitDelay)init
{
  long long v4 = xmmword_19D8B1CD0;
  int v5 = 0;
  v3.receiver = self;
  v3.super_class = (Class)AVAudioUnitDelay;
  return [(AVAudioUnitEffect *)&v3 initWithAudioComponentDescription:&v4];
}

@end