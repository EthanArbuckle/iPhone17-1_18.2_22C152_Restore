@interface AVAudioUnitEQ
- (AVAudioUnitEQ)init;
- (AVAudioUnitEQ)initWithNumberOfBands:(NSUInteger)numberOfBands;
- (NSArray)bands;
- (float)globalGain;
- (void)setGlobalGain:(float)globalGain;
@end

@implementation AVAudioUnitEQ

- (void)setGlobalGain:(float)globalGain
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)self->super.super.super._impl);
  *(float *)&double v5 = globalGain;
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

- (float)globalGain
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

- (NSArray)bands
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->super.super.super._impl);
  float v3 = (NSArray *)*((void *)self->super.super.super._impl + 23);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (AVAudioUnitEQ)initWithNumberOfBands:(NSUInteger)numberOfBands
{
  if (numberOfBands >= 0x3E8) {
    int v3 = 999;
  }
  else {
    int v3 = numberOfBands;
  }
  int v5 = v3;
  operator new();
}

- (AVAudioUnitEQ)init
{
  return [(AVAudioUnitEQ *)self initWithNumberOfBands:16];
}

@end