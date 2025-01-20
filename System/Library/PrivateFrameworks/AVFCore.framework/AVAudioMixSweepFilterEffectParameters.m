@interface AVAudioMixSweepFilterEffectParameters
+ (id)sweepFilterEffectParametersWithMinimumCutOffFrequency:(unsigned int)a3 maximumCutOffFrequency:(unsigned int)a4 bypassThreshold:(float)a5 sweepValue:(float)a6;
- (AVAudioMixSweepFilterEffectParameters)init;
- (AVAudioMixSweepFilterEffectParameters)initWithMinimumCutOffFrequency:(unsigned int)a3 maximumCutOffFrequency:(unsigned int)a4 bypassThreshold:(float)a5 sweepValue:(float)a6;
- (BOOL)isEqual:(id)a3;
- (float)bypassThreshold;
- (float)sweepValue;
- (id)sweepFilterEffectWithSweepValue:(float)a3;
- (int)maximumCutOffFrequency;
- (int)minimumCutOffFrequency;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation AVAudioMixSweepFilterEffectParameters

- (AVAudioMixSweepFilterEffectParameters)init
{
  return self;
}

- (AVAudioMixSweepFilterEffectParameters)initWithMinimumCutOffFrequency:(unsigned int)a3 maximumCutOffFrequency:(unsigned int)a4 bypassThreshold:(float)a5 sweepValue:(float)a6
{
  if (a3 >= a4)
  {
    v15 = (objc_class *)self;
    v16 = a2;
    v17 = self;
    v23 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v24 = *MEMORY[0x1E4F1C3C8];
    v25 = "minimumCutOffFrequency < maximumCutOffFrequency";
    goto LABEL_18;
  }
  if (a5 < 0.0 || a5 > 1.0)
  {
    v15 = (objc_class *)self;
    v16 = a2;
    v26 = self;
    v23 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v24 = *MEMORY[0x1E4F1C3C8];
    v25 = "0. <= bypassThreshold && bypassThreshold <= 1.";
    goto LABEL_18;
  }
  if (a6 < 0.0 || a6 > 1.0)
  {
    v15 = (objc_class *)self;
    v16 = a2;
    v27 = self;
    v23 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v24 = *MEMORY[0x1E4F1C3C8];
    v25 = "0. <= sweepValue && sweepValue <= 1.";
LABEL_18:
    v28 = (void *)[v23 exceptionWithName:v24, AVMethodExceptionReasonWithObjectAndSelector(v15, v16, @"invalid parameter not satisfying: %s", v18, v19, v20, v21, v22, (uint64_t)v25), 0 reason userInfo];
    objc_exception_throw(v28);
  }
  v29.receiver = self;
  v29.super_class = (Class)AVAudioMixSweepFilterEffectParameters;
  v12 = [(AVAudioMixEffect *)&v29 init];
  if (v12)
  {
    v13 = objc_alloc_init(AVAudioMixSweepFilterEffectParametersInternal);
    v12->_sweepFilterAudioEffect = v13;
    if (v13)
    {
      CFRetain(v13);
      v12->_sweepFilterAudioEffect->minimumCutOffFrequency = a3;
      v12->_sweepFilterAudioEffect->maximumCutOffFrequency = a4;
      v12->_sweepFilterAudioEffect->bypassThreshold = a5;
      v12->_sweepFilterAudioEffect->sweepValue = a6;
    }
    else
    {

      return 0;
    }
  }
  return v12;
}

+ (id)sweepFilterEffectParametersWithMinimumCutOffFrequency:(unsigned int)a3 maximumCutOffFrequency:(unsigned int)a4 bypassThreshold:(float)a5 sweepValue:(float)a6
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v9 = *(void *)&a3;
  id v10 = objc_alloc((Class)a1);
  *(float *)&double v11 = a5;
  *(float *)&double v12 = a6;
  v13 = (void *)[v10 initWithMinimumCutOffFrequency:v9 maximumCutOffFrequency:v8 bypassThreshold:v11 sweepValue:v12];
  return v13;
}

- (id)sweepFilterEffectWithSweepValue:(float)a3
{
  v5 = objc_opt_class();
  sweepFilterAudioEffect = (unsigned int *)self->_sweepFilterAudioEffect;
  uint64_t v7 = sweepFilterAudioEffect[2];
  uint64_t v8 = sweepFilterAudioEffect[3];
  LODWORD(v9) = sweepFilterAudioEffect[4];
  *(float *)&double v10 = a3;
  return (id)[v5 sweepFilterEffectParametersWithMinimumCutOffFrequency:v7 maximumCutOffFrequency:v8 bypassThreshold:v9 sweepValue:v10];
}

- (void)dealloc
{
  sweepFilterAudioEffect = self->_sweepFilterAudioEffect;
  if (sweepFilterAudioEffect)
  {

    CFRelease(self->_sweepFilterAudioEffect);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVAudioMixSweepFilterEffectParameters;
  [(AVAudioMixSweepFilterEffectParameters *)&v4 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  [(AVAudioMixSweepFilterEffectParameters *)self sweepValue];
  float v6 = v5;
  [a3 sweepValue];
  if (v6 != v7) {
    return 0;
  }
  int v8 = [(AVAudioMixSweepFilterEffectParameters *)self minimumCutOffFrequency];
  if (v8 != [a3 minimumCutOffFrequency]) {
    return 0;
  }
  int v9 = [(AVAudioMixSweepFilterEffectParameters *)self maximumCutOffFrequency];
  if (v9 != [a3 maximumCutOffFrequency]) {
    return 0;
  }
  [(AVAudioMixSweepFilterEffectParameters *)self bypassThreshold];
  float v11 = v10;
  [a3 bypassThreshold];
  return v11 == v12;
}

- (unint64_t)hash
{
  return (unint64_t)(float)(self->_sweepFilterAudioEffect->bypassThreshold * 1000.0) ^ self->_sweepFilterAudioEffect->maximumCutOffFrequency ^ self->_sweepFilterAudioEffect->minimumCutOffFrequency ^ (unint64_t)(float)(self->_sweepFilterAudioEffect->sweepValue * 1000.0);
}

- (int)minimumCutOffFrequency
{
  return self->_sweepFilterAudioEffect->minimumCutOffFrequency;
}

- (int)maximumCutOffFrequency
{
  return self->_sweepFilterAudioEffect->maximumCutOffFrequency;
}

- (float)bypassThreshold
{
  return self->_sweepFilterAudioEffect->bypassThreshold;
}

- (float)sweepValue
{
  return self->_sweepFilterAudioEffect->sweepValue;
}

@end