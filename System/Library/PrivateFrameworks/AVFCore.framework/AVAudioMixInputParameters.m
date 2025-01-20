@interface AVAudioMixInputParameters
- (AVAudioMixInputParameters)init;
- (AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm;
- (BOOL)getAmbienceLevelRampForTime:(id *)a3 startValue:(float *)a4 endValue:(float *)a5 timeRange:(id *)a6;
- (BOOL)getAmbienceLoudnessRampForTime:(id *)a3 startValue:(float *)a4 endValue:(float *)a5 timeRange:(id *)a6;
- (BOOL)getDialogLevelRampForTime:(id *)a3 startValue:(float *)a4 endValue:(float *)a5 timeRange:(id *)a6;
- (BOOL)getDialogLoudnessRampForTime:(id *)a3 startValue:(float *)a4 endValue:(float *)a5 timeRange:(id *)a6;
- (BOOL)getDialogMixBiasRampForTime:(id *)a3 startValue:(float *)a4 endValue:(float *)a5 timeRange:(id *)a6;
- (BOOL)getRecordingLoudnessRampForTime:(id *)a3 startValue:(float *)a4 endValue:(float *)a5 timeRange:(id *)a6;
- (BOOL)getRenderingStyleRampForTime:(id *)a3 startValue:(float *)a4 endValue:(float *)a5 timeRange:(id *)a6;
- (BOOL)getVolumeRampForTime:(CMTime *)time startVolume:(float *)startVolume endVolume:(float *)endVolume timeRange:(CMTimeRange *)timeRange;
- (BOOL)getVolumeRampForTime:(id *)a3 startVolume:(float *)a4 endVolume:(float *)a5 timeRange:(id *)a6 rampMode:(int64_t *)a7;
- (BOOL)isEqual:(id)a3;
- (CMPersistentTrackID)trackID;
- (MTAudioProcessingTapRef)audioTapProcessor;
- (id)_audioVolumeCurve;
- (id)_figAudioCurves;
- (id)_figProcessingEffectsScheduledParameters;
- (id)_scheduledAudioParameters;
- (id)_volumeCurveAsString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)effectParameters;
- (id)effects;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_setScheduledAudioParameters:(id)a3;
- (void)_setVolume:(float)a3 atTime:(id *)a4;
- (void)_setVolumeRampFromStartVolume:(float)a3 toEndVolume:(float)a4 timeRange:(id *)a5 rampMode:(int64_t)a6;
- (void)addEffect:(id)a3;
- (void)checkEffectPrecondition:(id)a3;
- (void)checkEffectsPrecondition:(id)a3;
- (void)dealloc;
- (void)removeAllEffectParameters;
- (void)removeEffect:(id)a3;
- (void)setAmbienceLevel:(float)a3 atTime:(id *)a4;
- (void)setAmbienceLoudness:(float)a3 atTime:(id *)a4;
- (void)setAudioTapProcessor:(opaqueMTAudioProcessingTap *)a3;
- (void)setAudioTimePitchAlgorithm:(id)a3;
- (void)setDialogLevel:(float)a3 atTime:(id *)a4;
- (void)setDialogLoudness:(float)a3 atTime:(id *)a4;
- (void)setDialogMixBias:(float)a3 atTime:(id *)a4;
- (void)setEffectParameters:(id)a3;
- (void)setRecordingLoudness:(float)a3 atTime:(id *)a4;
- (void)setRenderingStyle:(float)a3 atTime:(id *)a4;
- (void)setTrackID:(int)a3;
- (void)setVolume:(float)a3 atTime:(id *)a4;
- (void)setVolumeRampFromStartVolume:(float)a3 toEndVolume:(float)a4 timeRange:(id *)a5;
- (void)setVolumeRampFromStartVolume:(float)a3 toEndVolume:(float)a4 timeRange:(id *)a5 rampMode:(int64_t)a6;
@end

@implementation AVAudioMixInputParameters

- (AVAudioMixInputParameters)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVAudioMixInputParameters;
  v2 = [(AVAudioMixInputParameters *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(AVAudioMixInputParametersInternal);
    v2->_inputParameters = v3;
    if (v3)
    {
      CFRetain(v3);
      v2->_inputParameters->scheduledAudioParameters = 0;
      v2->_inputParameters->trackID = 0;
      v2->_inputParameters->tap = 0;
      v2->_inputParameters->effects = (NSMutableArray *)(id)[MEMORY[0x1E4F1CA48] array];
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  inputParameters = self->_inputParameters;
  if (inputParameters)
  {
    tap = inputParameters->tap;
    if (tap)
    {
      CFRelease(tap);
      inputParameters = self->_inputParameters;
    }

    CFRelease(self->_inputParameters);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVAudioMixInputParameters;
  [(AVAudioMixInputParameters *)&v5 dealloc];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, track ID = %d, audioTimePitchAlgorithm: %@, audioTapProcessor: %p, volume mix: %@>", NSStringFromClass(v4), self, -[AVAudioMixInputParameters trackID](self, "trackID"), -[AVAudioMixInputParameters audioTimePitchAlgorithm](self, "audioTimePitchAlgorithm"), -[AVAudioMixInputParameters audioTapProcessor](self, "audioTapProcessor"), -[AVAudioMixInputParameters _volumeCurveAsString](self, "_volumeCurveAsString")];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(AVAudioMixInputParameters *)self isMemberOfClass:objc_opt_class()])
  {
    return self;
  }
  else
  {
    objc_super v5 = [+[AVAudioMixInputParameters allocWithZone:a3] init];
    v6 = v5;
    if (v5)
    {
      [(AVAudioMixInputParameters *)v5 setTrackID:self->_inputParameters->trackID];
      [(AVAudioMixInputParameters *)v6 _setScheduledAudioParameters:self->_inputParameters->scheduledAudioParameters];
      [(AVAudioMixInputParameters *)v6 setAudioTimePitchAlgorithm:self->_inputParameters->audioTimePitchAlgorithm];
      [(AVAudioMixInputParameters *)v6 setAudioTapProcessor:self->_inputParameters->tap];
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      effects = self->_inputParameters->effects;
      uint64_t v8 = [(NSMutableArray *)effects countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(effects);
            }
            [(AVAudioMixInputParameters *)v6 addEffect:*(void *)(*((void *)&v13 + 1) + 8 * i)];
          }
          uint64_t v9 = [(NSMutableArray *)effects countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v9);
      }
    }
    return v6;
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = [(AVAudioMixInputParameters *)+[AVMutableAudioMixInputParameters allocWithZone:a3] init];
  objc_super v5 = v4;
  if (v4)
  {
    [(AVMutableAudioMixInputParameters *)v4 setTrackID:self->_inputParameters->trackID];
    [(AVAudioMixInputParameters *)v5 _setScheduledAudioParameters:self->_inputParameters->scheduledAudioParameters];
    [(AVMutableAudioMixInputParameters *)v5 setAudioTimePitchAlgorithm:self->_inputParameters->audioTimePitchAlgorithm];
    [(AVMutableAudioMixInputParameters *)v5 setAudioTapProcessor:self->_inputParameters->tap];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    effects = self->_inputParameters->effects;
    uint64_t v7 = [(NSMutableArray *)effects countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(effects);
          }
          [(AVMutableAudioMixInputParameters *)v5 addEffect:*(void *)(*((void *)&v12 + 1) + 8 * v10++)];
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)effects countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  inputParameters = self->_inputParameters;
  uint64_t v6 = *((void *)a3 + 1);
  if (inputParameters->trackID != *(_DWORD *)(v6 + 8)) {
    goto LABEL_12;
  }
  scheduledAudioParameters = inputParameters->scheduledAudioParameters;
  uint64_t v8 = *(void *)(v6 + 16);
  if (scheduledAudioParameters)
  {
    int v9 = [(AVScheduledAudioParameters *)scheduledAudioParameters isEqual:v8];
    if (!v9) {
      return v9;
    }
    inputParameters = self->_inputParameters;
  }
  else if (v8)
  {
    goto LABEL_12;
  }
  audioTimePitchAlgorithm = inputParameters->audioTimePitchAlgorithm;
  v11 = (void *)*((void *)a3 + 1);
  uint64_t v12 = v11[3];
  if (audioTimePitchAlgorithm)
  {
    int v9 = [(NSString *)audioTimePitchAlgorithm isEqualToString:v12];
    if (!v9) {
      return v9;
    }
    inputParameters = self->_inputParameters;
    v11 = (void *)*((void *)a3 + 1);
    goto LABEL_11;
  }
  if (v12)
  {
LABEL_12:
    LOBYTE(v9) = 0;
    return v9;
  }
LABEL_11:
  if (inputParameters->tap != (opaqueMTAudioProcessingTap *)v11[4]) {
    goto LABEL_12;
  }
  effects = inputParameters->effects;
  if (effects == (NSMutableArray *)v11[5] || (int v9 = -[NSMutableArray isEqual:](effects, "isEqual:")) != 0) {
    LOBYTE(v9) = 1;
  }
  return v9;
}

- (unint64_t)hash
{
  inputParameters = self->_inputParameters;
  uint64_t trackID = inputParameters->trackID;
  uint64_t v5 = [(AVScheduledAudioParameters *)inputParameters->scheduledAudioParameters hash];
  uint64_t v6 = self->_inputParameters;
  tap = v6->tap;
  if (tap)
  {
    CFHashCode v8 = CFHash(tap);
    uint64_t v6 = self->_inputParameters;
  }
  else
  {
    CFHashCode v8 = 0;
  }
  uint64_t v9 = v5 ^ trackID ^ v8 ^ [(NSString *)v6->audioTimePitchAlgorithm hash];
  return v9 ^ [(NSMutableArray *)self->_inputParameters->effects hash];
}

- (CMPersistentTrackID)trackID
{
  return self->_inputParameters->trackID;
}

- (void)setTrackID:(int)a3
{
  self->_inputParameters->uint64_t trackID = a3;
}

- (AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm
{
  return self->_inputParameters->audioTimePitchAlgorithm;
}

- (void)setAudioTimePitchAlgorithm:(id)a3
{
  v4 = (NSString *)[a3 copy];

  self->_inputParameters->audioTimePitchAlgorithm = v4;
}

- (MTAudioProcessingTapRef)audioTapProcessor
{
  return self->_inputParameters->tap;
}

- (void)setAudioTapProcessor:(opaqueMTAudioProcessingTap *)a3
{
  if (a3) {
    CFRetain(a3);
  }
  inputParameters = self->_inputParameters;
  tap = inputParameters->tap;
  if (tap)
  {
    CFRelease(tap);
    inputParameters = self->_inputParameters;
  }
  inputParameters->tap = a3;
}

- (void)checkEffectPrecondition:(id)a3
{
  if (a3
    && ([a3 isMemberOfClass:objc_opt_class()] & 1) == 0
    && ([a3 isMemberOfClass:objc_opt_class()] & 1) == 0
    && ([a3 isMemberOfClass:objc_opt_class()] & 1) == 0)
  {
    v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Sent unknown effect type", v6, v7, v8, v9, v10, v12), 0 reason userInfo];
    objc_exception_throw(v11);
  }
}

- (id)effectParameters
{
  id result = (id)[(NSMutableArray *)self->_inputParameters->effects count];
  if (result)
  {
    id v4 = (id)[(NSMutableArray *)self->_inputParameters->effects objectAtIndexedSubscript:0];
    return v4;
  }
  return result;
}

- (void)setEffectParameters:(id)a3
{
  -[AVAudioMixInputParameters checkEffectPrecondition:](self, "checkEffectPrecondition:");
  id v6 = (id)[a3 copy];
  [(NSMutableArray *)self->_inputParameters->effects removeAllObjects];
  uint64_t v5 = v6;
  if (v6)
  {
    [(NSMutableArray *)self->_inputParameters->effects addObject:v6];
    uint64_t v5 = v6;
  }
}

- (id)effects
{
  v2 = self->_inputParameters->effects;
  return v2;
}

- (void)checkEffectsPrecondition:(id)a3
{
  -[AVAudioMixInputParameters checkEffectPrecondition:](self, "checkEffectPrecondition:");
  int v6 = [a3 isMemberOfClass:objc_opt_class()];
  id v7 = [(AVAudioMixInputParameters *)self effects];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = (uint64_t)__54__AVAudioMixInputParameters_checkEffectsPrecondition___block_invoke;
  v15[3] = (uint64_t)&unk_1E57B5FA8;
  char v16 = v6;
  v15[4] = (uint64_t)a3;
  if (objc_msgSend((id)objc_msgSend(v7, "indexesOfObjectsPassingTest:", v15), "count"))
  {
    if (v6) {
      long long v13 = @"Sent same instance of AVAudioMixProcessingEffect multiple times";
    }
    else {
      long long v13 = @"Sent multiple instance of an effect type";
    }
    long long v14 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v13, v8, v9, v10, v11, v12, v15[0]), 0);
    objc_exception_throw(v14);
  }
}

uint64_t __54__AVAudioMixInputParameters_checkEffectsPrecondition___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 40))
  {
    v3 = *(void **)(a1 + 32);
    return [v3 isEqual:a2];
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    return [v2 isMemberOfClass:v5];
  }
}

- (void)addEffect:(id)a3
{
  -[AVAudioMixInputParameters checkEffectsPrecondition:](self, "checkEffectsPrecondition:");
  id v5 = (id)[a3 copy];
  [(NSMutableArray *)self->_inputParameters->effects addObject:v5];
}

- (void)removeEffect:(id)a3
{
}

- (void)removeAllEffectParameters
{
}

- (void)_setVolumeRampFromStartVolume:(float)a3 toEndVolume:(float)a4 timeRange:(id *)a5 rampMode:(int64_t)a6
{
  scheduledAudioParameters = self->_inputParameters->scheduledAudioParameters;
  if (!scheduledAudioParameters)
  {
    self->_inputParameters->scheduledAudioParameters = objc_alloc_init(AVMutableScheduledAudioParameters);
    scheduledAudioParameters = self->_inputParameters->scheduledAudioParameters;
  }
  long long v12 = *(_OWORD *)&a5->var0.var3;
  v13[0] = *(_OWORD *)&a5->var0.var0;
  v13[1] = v12;
  *(float *)&long long v12 = a4;
  [(AVMutableScheduledAudioParameters *)scheduledAudioParameters setVolumeRampFromStartVolume:v13 toEndVolume:a6 == 1 timeRange:COERCE_DOUBLE(__PAIR64__(HIDWORD(*(void *)&a5->var1.var1), LODWORD(a3))) rampMode:*(double *)&v12];
}

- (void)_setVolume:(float)a3 atTime:(id *)a4
{
  scheduledAudioParameters = self->_inputParameters->scheduledAudioParameters;
  if (!scheduledAudioParameters)
  {
    self->_inputParameters->scheduledAudioParameters = objc_alloc_init(AVMutableScheduledAudioParameters);
    scheduledAudioParameters = self->_inputParameters->scheduledAudioParameters;
  }
  long long v8 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  [(AVMutableScheduledAudioParameters *)scheduledAudioParameters setVolume:&v8 atTime:COERCE_DOUBLE(__PAIR64__(DWORD1(v8), LODWORD(a3)))];
}

- (void)setVolumeRampFromStartVolume:(float)a3 toEndVolume:(float)a4 timeRange:(id *)a5
{
  if ((a5->var0.var2 & 0x1D) != 1 || (a5->var1.var2 & 0x1D) != 1)
  {
    uint64_t v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"The timeRange of a volume ramp must have a numeric start time and a numeric duration.", v5, v6, v7, v8, v9, *(uint64_t *)&v12[0]), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  long long v10 = *(_OWORD *)&a5->var0.var3;
  v12[0] = *(_OWORD *)&a5->var0.var0;
  v12[1] = v10;
  v12[2] = *(_OWORD *)&a5->var1.var1;
  -[AVAudioMixInputParameters _setVolumeRampFromStartVolume:toEndVolume:timeRange:rampMode:](self, "_setVolumeRampFromStartVolume:toEndVolume:timeRange:rampMode:", v12, 0);
}

- (void)setVolumeRampFromStartVolume:(float)a3 toEndVolume:(float)a4 timeRange:(id *)a5 rampMode:(int64_t)a6
{
  if ((a5->var0.var2 & 0x1D) != 1 || (a5->var1.var2 & 0x1D) != 1)
  {
    uint64_t v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"The timeRange of a volume ramp must have a numeric start time and a numeric duration.", a6, v6, v7, v8, v9, *(uint64_t *)&v12[0]), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  long long v10 = *(_OWORD *)&a5->var0.var3;
  v12[0] = *(_OWORD *)&a5->var0.var0;
  v12[1] = v10;
  v12[2] = *(_OWORD *)&a5->var1.var1;
  -[AVAudioMixInputParameters _setVolumeRampFromStartVolume:toEndVolume:timeRange:rampMode:](self, "_setVolumeRampFromStartVolume:toEndVolume:timeRange:rampMode:", v12, a6);
}

- (void)setVolume:(float)a3 atTime:(id *)a4
{
  if ((a4->var2 & 0x1D) != 1)
  {
    uint64_t v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"The time of a volume setting must be numeric.", v4, v5, v6, v7, v8, v10.var0), 0 reason userInfo];
    objc_exception_throw(v9);
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a4;
  -[AVAudioMixInputParameters _setVolume:atTime:](self, "_setVolume:atTime:", &v10);
}

- (BOOL)getVolumeRampForTime:(CMTime *)time startVolume:(float *)startVolume endVolume:(float *)endVolume timeRange:(CMTimeRange *)timeRange
{
  CMTime v7 = *time;
  return [(AVAudioMixInputParameters *)self getVolumeRampForTime:&v7 startVolume:startVolume endVolume:endVolume timeRange:timeRange rampMode:0];
}

- (BOOL)getVolumeRampForTime:(id *)a3 startVolume:(float *)a4 endVolume:(float *)a5 timeRange:(id *)a6 rampMode:(int64_t *)a7
{
  uint64_t v11 = 0;
  scheduledAudioParameters = self->_inputParameters->scheduledAudioParameters;
  if (scheduledAudioParameters)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a3;
    LODWORD(scheduledAudioParameters) = [(AVScheduledAudioParameters *)scheduledAudioParameters getVolumeRampForTime:&v10 startVolume:a4 endVolume:a5 timeRange:a6 rampMode:&v11];
    if (a7)
    {
      if (scheduledAudioParameters)
      {
        *a7 = v11 == 1;
        LOBYTE(scheduledAudioParameters) = 1;
      }
    }
  }
  return (char)scheduledAudioParameters;
}

- (void)setDialogLevel:(float)a3 atTime:(id *)a4
{
  CMTime time1 = *(CMTime *)a4;
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  if (CMTimeCompare(&time1, &time2))
  {
    long long v15 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v8, v9, v10, v11, v12, (uint64_t)"CMTIME_COMPARE_INLINE(time, ==, kCMTimeZero)"), 0 reason userInfo];
    objc_exception_throw(v15);
  }
  if (!self->_inputParameters->scheduledAudioParameters) {
    self->_inputParameters->scheduledAudioParameters = objc_alloc_init(AVMutableScheduledAudioParameters);
  }
  CMTime time1 = (CMTime)*a4;
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA10];
  CMTimeRangeMake(&v16, &time1, &time2);
  *(float *)&double v13 = a3;
  *(float *)&double v14 = a3;
  [(AVScheduledAudioParameters *)self->_inputParameters->scheduledAudioParameters _setRamp:+[AVDialogLevelRamp dialogLevelRampWithStartValue:&v16 endValue:v13 timeRange:v14]];
}

- (BOOL)getDialogLevelRampForTime:(id *)a3 startValue:(float *)a4 endValue:(float *)a5 timeRange:(id *)a6
{
  scheduledAudioParameters = self->_inputParameters->scheduledAudioParameters;
  uint64_t v11 = objc_opt_class();
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = *a3;
  id v12 = [(AVScheduledAudioParameters *)scheduledAudioParameters _getRampOfClass:v11 forTime:&v17 timeRange:a6];
  double v13 = v12;
  if (v12)
  {
    if (a4)
    {
      [v12 startFloatValue];
      *(_DWORD *)a4 = v14;
    }
    if (a5)
    {
      [v13 endFloatValue];
      *(_DWORD *)a5 = v15;
    }
  }
  return v13 != 0;
}

- (void)setAmbienceLevel:(float)a3 atTime:(id *)a4
{
  CMTime time1 = *(CMTime *)a4;
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  if (CMTimeCompare(&time1, &time2))
  {
    int v15 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v8, v9, v10, v11, v12, (uint64_t)"CMTIME_COMPARE_INLINE(time, ==, kCMTimeZero)"), 0 reason userInfo];
    objc_exception_throw(v15);
  }
  if (!self->_inputParameters->scheduledAudioParameters) {
    self->_inputParameters->scheduledAudioParameters = objc_alloc_init(AVMutableScheduledAudioParameters);
  }
  CMTime time1 = (CMTime)*a4;
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA10];
  CMTimeRangeMake(&v16, &time1, &time2);
  *(float *)&double v13 = a3;
  *(float *)&double v14 = a3;
  [(AVScheduledAudioParameters *)self->_inputParameters->scheduledAudioParameters _setRamp:+[AVAmbienceLevelRamp ambienceLevelRampWithStartValue:&v16 endValue:v13 timeRange:v14]];
}

- (BOOL)getAmbienceLevelRampForTime:(id *)a3 startValue:(float *)a4 endValue:(float *)a5 timeRange:(id *)a6
{
  scheduledAudioParameters = self->_inputParameters->scheduledAudioParameters;
  uint64_t v11 = objc_opt_class();
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = *a3;
  id v12 = [(AVScheduledAudioParameters *)scheduledAudioParameters _getRampOfClass:v11 forTime:&v17 timeRange:a6];
  double v13 = v12;
  if (v12)
  {
    if (a4)
    {
      [v12 startFloatValue];
      *(_DWORD *)a4 = v14;
    }
    if (a5)
    {
      [v13 endFloatValue];
      *(_DWORD *)a5 = v15;
    }
  }
  return v13 != 0;
}

- (void)setDialogMixBias:(float)a3 atTime:(id *)a4
{
  CMTime time1 = *(CMTime *)a4;
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  if (CMTimeCompare(&time1, &time2))
  {
    int v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = "CMTIME_COMPARE_INLINE(time, ==, kCMTimeZero)";
    goto LABEL_9;
  }
  if (a3 < 0.0 || a3 > 1.0)
  {
    int v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = "dialogMixBias >= 0.0 && dialogMixBias <= 1.0";
LABEL_9:
    uint64_t v18 = (void *)[v15 exceptionWithName:v16, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v8, v9, v10, v11, v12, (uint64_t)v17), 0 reason userInfo];
    objc_exception_throw(v18);
  }
  if (!self->_inputParameters->scheduledAudioParameters) {
    self->_inputParameters->scheduledAudioParameters = objc_alloc_init(AVMutableScheduledAudioParameters);
  }
  CMTime time1 = (CMTime)*a4;
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA10];
  CMTimeRangeMake(&v19, &time1, &time2);
  *(float *)&double v13 = a3;
  *(float *)&double v14 = a3;
  [(AVScheduledAudioParameters *)self->_inputParameters->scheduledAudioParameters _setRamp:+[AVDialogMixBiasRamp dialogMixBiasRampWithStartValue:&v19 endValue:v13 timeRange:v14]];
}

- (BOOL)getDialogMixBiasRampForTime:(id *)a3 startValue:(float *)a4 endValue:(float *)a5 timeRange:(id *)a6
{
  scheduledAudioParameters = self->_inputParameters->scheduledAudioParameters;
  uint64_t v11 = objc_opt_class();
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = *a3;
  id v12 = [(AVScheduledAudioParameters *)scheduledAudioParameters _getRampOfClass:v11 forTime:&v17 timeRange:a6];
  double v13 = v12;
  if (v12)
  {
    if (a4)
    {
      [v12 startFloatValue];
      *(_DWORD *)a4 = v14;
    }
    if (a5)
    {
      [v13 endFloatValue];
      *(_DWORD *)a5 = v15;
    }
  }
  return v13 != 0;
}

- (void)setDialogLoudness:(float)a3 atTime:(id *)a4
{
  CMTime time1 = *(CMTime *)a4;
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  if (CMTimeCompare(&time1, &time2))
  {
    int v15 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v8, v9, v10, v11, v12, (uint64_t)"CMTIME_COMPARE_INLINE(time, ==, kCMTimeZero)"), 0 reason userInfo];
    objc_exception_throw(v15);
  }
  if (!self->_inputParameters->scheduledAudioParameters) {
    self->_inputParameters->scheduledAudioParameters = objc_alloc_init(AVMutableScheduledAudioParameters);
  }
  CMTime time1 = (CMTime)*a4;
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA10];
  CMTimeRangeMake(&v16, &time1, &time2);
  *(float *)&double v13 = a3;
  *(float *)&double v14 = a3;
  [(AVScheduledAudioParameters *)self->_inputParameters->scheduledAudioParameters _setRamp:+[AVDialogLoudnessRamp dialogLoudnessRampWithStartValue:&v16 endValue:v13 timeRange:v14]];
}

- (BOOL)getDialogLoudnessRampForTime:(id *)a3 startValue:(float *)a4 endValue:(float *)a5 timeRange:(id *)a6
{
  scheduledAudioParameters = self->_inputParameters->scheduledAudioParameters;
  uint64_t v11 = objc_opt_class();
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = *a3;
  id v12 = [(AVScheduledAudioParameters *)scheduledAudioParameters _getRampOfClass:v11 forTime:&v17 timeRange:a6];
  double v13 = v12;
  if (v12)
  {
    if (a4)
    {
      [v12 startFloatValue];
      *(_DWORD *)a4 = v14;
    }
    if (a5)
    {
      [v13 endFloatValue];
      *(_DWORD *)a5 = v15;
    }
  }
  return v13 != 0;
}

- (void)setAmbienceLoudness:(float)a3 atTime:(id *)a4
{
  CMTime time1 = *(CMTime *)a4;
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  if (CMTimeCompare(&time1, &time2))
  {
    int v15 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v8, v9, v10, v11, v12, (uint64_t)"CMTIME_COMPARE_INLINE(time, ==, kCMTimeZero)"), 0 reason userInfo];
    objc_exception_throw(v15);
  }
  if (!self->_inputParameters->scheduledAudioParameters) {
    self->_inputParameters->scheduledAudioParameters = objc_alloc_init(AVMutableScheduledAudioParameters);
  }
  CMTime time1 = (CMTime)*a4;
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA10];
  CMTimeRangeMake(&v16, &time1, &time2);
  *(float *)&double v13 = a3;
  *(float *)&double v14 = a3;
  [(AVScheduledAudioParameters *)self->_inputParameters->scheduledAudioParameters _setRamp:+[AVAmbienceLoudnessRamp ambienceLoudnessRampWithStartValue:&v16 endValue:v13 timeRange:v14]];
}

- (BOOL)getAmbienceLoudnessRampForTime:(id *)a3 startValue:(float *)a4 endValue:(float *)a5 timeRange:(id *)a6
{
  scheduledAudioParameters = self->_inputParameters->scheduledAudioParameters;
  uint64_t v11 = objc_opt_class();
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = *a3;
  id v12 = [(AVScheduledAudioParameters *)scheduledAudioParameters _getRampOfClass:v11 forTime:&v17 timeRange:a6];
  double v13 = v12;
  if (v12)
  {
    if (a4)
    {
      [v12 startFloatValue];
      *(_DWORD *)a4 = v14;
    }
    if (a5)
    {
      [v13 endFloatValue];
      *(_DWORD *)a5 = v15;
    }
  }
  return v13 != 0;
}

- (void)setRecordingLoudness:(float)a3 atTime:(id *)a4
{
  CMTime time1 = *(CMTime *)a4;
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  if (CMTimeCompare(&time1, &time2))
  {
    int v15 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v8, v9, v10, v11, v12, (uint64_t)"CMTIME_COMPARE_INLINE(time, ==, kCMTimeZero)"), 0 reason userInfo];
    objc_exception_throw(v15);
  }
  if (!self->_inputParameters->scheduledAudioParameters) {
    self->_inputParameters->scheduledAudioParameters = objc_alloc_init(AVMutableScheduledAudioParameters);
  }
  CMTime time1 = (CMTime)*a4;
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA10];
  CMTimeRangeMake(&v16, &time1, &time2);
  *(float *)&double v13 = a3;
  *(float *)&double v14 = a3;
  [(AVScheduledAudioParameters *)self->_inputParameters->scheduledAudioParameters _setRamp:+[AVRecordingLoudnessRamp recordingLoudnessRampWithStartValue:&v16 endValue:v13 timeRange:v14]];
}

- (BOOL)getRecordingLoudnessRampForTime:(id *)a3 startValue:(float *)a4 endValue:(float *)a5 timeRange:(id *)a6
{
  scheduledAudioParameters = self->_inputParameters->scheduledAudioParameters;
  uint64_t v11 = objc_opt_class();
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = *a3;
  id v12 = [(AVScheduledAudioParameters *)scheduledAudioParameters _getRampOfClass:v11 forTime:&v17 timeRange:a6];
  double v13 = v12;
  if (v12)
  {
    if (a4)
    {
      [v12 startFloatValue];
      *(_DWORD *)a4 = v14;
    }
    if (a5)
    {
      [v13 endFloatValue];
      *(_DWORD *)a5 = v15;
    }
  }
  return v13 != 0;
}

- (void)setRenderingStyle:(float)a3 atTime:(id *)a4
{
  CMTime time1 = *(CMTime *)a4;
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  if (CMTimeCompare(&time1, &time2))
  {
    int v15 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v8, v9, v10, v11, v12, (uint64_t)"CMTIME_COMPARE_INLINE(time, ==, kCMTimeZero)"), 0 reason userInfo];
    objc_exception_throw(v15);
  }
  if (!self->_inputParameters->scheduledAudioParameters) {
    self->_inputParameters->scheduledAudioParameters = objc_alloc_init(AVMutableScheduledAudioParameters);
  }
  CMTime time1 = (CMTime)*a4;
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA10];
  CMTimeRangeMake(&v16, &time1, &time2);
  *(float *)&double v13 = a3;
  *(float *)&double v14 = a3;
  [(AVScheduledAudioParameters *)self->_inputParameters->scheduledAudioParameters _setRamp:+[AVRenderingStyleRamp renderingStyleRampWithStartValue:&v16 endValue:v13 timeRange:v14]];
}

- (BOOL)getRenderingStyleRampForTime:(id *)a3 startValue:(float *)a4 endValue:(float *)a5 timeRange:(id *)a6
{
  scheduledAudioParameters = self->_inputParameters->scheduledAudioParameters;
  uint64_t v11 = objc_opt_class();
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = *a3;
  id v12 = [(AVScheduledAudioParameters *)scheduledAudioParameters _getRampOfClass:v11 forTime:&v17 timeRange:a6];
  double v13 = v12;
  if (v12)
  {
    if (a4)
    {
      [v12 startFloatValue];
      *(_DWORD *)a4 = v14;
    }
    if (a5)
    {
      [v13 endFloatValue];
      *(_DWORD *)a5 = v15;
    }
  }
  return v13 != 0;
}

- (void)_setScheduledAudioParameters:(id)a3
{
  uint64_t v4 = (AVMutableScheduledAudioParameters *)[a3 mutableCopy];

  self->_inputParameters->scheduledAudioParameters = v4;
}

- (id)_scheduledAudioParameters
{
  v2 = (void *)[(AVMutableScheduledAudioParameters *)self->_inputParameters->scheduledAudioParameters copy];
  return v2;
}

- (id)_audioVolumeCurve
{
  return [(AVScheduledAudioParameters *)self->_inputParameters->scheduledAudioParameters _audioVolumeCurve];
}

- (id)_figProcessingEffectsScheduledParameters
{
  v3 = (void *)[(NSMutableArray *)self->_inputParameters->effects indexesOfObjectsPassingTest:&__block_literal_global_23];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__AVAudioMixInputParameters__figProcessingEffectsScheduledParameters__block_invoke_2;
  v6[3] = &unk_1E57B5FD0;
  v6[4] = self;
  v6[5] = v4;
  [v3 enumerateIndexesUsingBlock:v6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObject:v4 forKey:*MEMORY[0x1E4F32680]];
}

uint64_t __69__AVAudioMixInputParameters__figProcessingEffectsScheduledParameters__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_opt_class();
  return [a2 isMemberOfClass:v3];
}

uint64_t __69__AVAudioMixInputParameters__figProcessingEffectsScheduledParameters__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectAtIndexedSubscript:a2];
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = [v3 _figSchedule];
  uint64_t v6 = [v3 _figIdentifier];
  return [v4 setObject:v5 forKey:v6];
}

- (id)_figAudioCurves
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", -[AVAudioMixInputParameters _figProcessingEffectsScheduledParameters](self, "_figProcessingEffectsScheduledParameters"));
  objc_msgSend(v3, "addEntriesFromDictionary:", -[AVScheduledAudioParameters _figAudioCurves](self->_inputParameters->scheduledAudioParameters, "_figAudioCurves"));
  return v3;
}

- (id)_volumeCurveAsString
{
  return [(AVScheduledAudioParameters *)self->_inputParameters->scheduledAudioParameters _volumeCurveAsString];
}

@end