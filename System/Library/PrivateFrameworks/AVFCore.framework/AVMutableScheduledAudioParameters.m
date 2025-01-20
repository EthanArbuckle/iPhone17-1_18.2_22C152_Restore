@interface AVMutableScheduledAudioParameters
+ (id)scheduledAudioParameters;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_setVolumeRampFromStartVolume:(float)a3 toEndVolume:(float)a4 timeRange:(id *)a5 rampMode:(int64_t)a6;
- (void)setVolume:(float)a3 atTime:(id *)a4;
- (void)setVolumeRampFromStartVolume:(float)a3 toEndVolume:(float)a4 timeRange:(id *)a5;
- (void)setVolumeRampFromStartVolume:(float)a3 toEndVolume:(float)a4 timeRange:(id *)a5 rampMode:(int64_t)a6;
@end

@implementation AVMutableScheduledAudioParameters

+ (id)scheduledAudioParameters
{
  v2 = objc_alloc_init(AVMutableScheduledAudioParameters);
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[AVScheduledAudioParameters allocWithZone:a3] init];
  if (v4) {
    [(AVScheduledAudioParameters *)v4 _setRamps:[(AVScheduledAudioParameters *)self _ramps]];
  }
  return v4;
}

- (void)_setVolumeRampFromStartVolume:(float)a3 toEndVolume:(float)a4 timeRange:(id *)a5 rampMode:(int64_t)a6
{
  long long v6 = *(_OWORD *)&a5->var0.var3;
  v7[0] = *(_OWORD *)&a5->var0.var0;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a5->var1.var1;
  [(AVScheduledAudioParameters *)self _setRamp:+[AVScheduledVolumeRamp volumeRampWithStartVolume:endVolume:timeRange:rampMode:](AVScheduledVolumeRamp, "volumeRampWithStartVolume:endVolume:timeRange:rampMode:", v7, a6)];
}

- (void)setVolumeRampFromStartVolume:(float)a3 toEndVolume:(float)a4 timeRange:(id *)a5
{
  if ((a5->var0.var2 & 0x1D) != 1 || (a5->var1.var2 & 0x1D) != 1)
  {
    v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"The timeRange of a volume ramp must have a numeric start time and a numeric duration.", v5, v6, v7, v8, v9, *(uint64_t *)&v12[0]), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  long long v10 = *(_OWORD *)&a5->var0.var3;
  v12[0] = *(_OWORD *)&a5->var0.var0;
  v12[1] = v10;
  v12[2] = *(_OWORD *)&a5->var1.var1;
  -[AVMutableScheduledAudioParameters _setVolumeRampFromStartVolume:toEndVolume:timeRange:rampMode:](self, "_setVolumeRampFromStartVolume:toEndVolume:timeRange:rampMode:", v12, 0);
}

- (void)setVolume:(float)a3 atTime:(id *)a4
{
  if ((a4->var2 & 0x1D) != 1)
  {
    v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"The time of a volume setting must be numeric.", v4, v5, v6, v7, v8, v14.value), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  CMTime start = *(CMTime *)a4;
  CMTime v14 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA10];
  CMTimeRangeMake(&v16, &start, &v14);
  *(float *)&double v11 = a3;
  *(float *)&double v12 = a3;
  [(AVMutableScheduledAudioParameters *)self _setVolumeRampFromStartVolume:&v16 toEndVolume:0 timeRange:v11 rampMode:v12];
}

- (void)setVolumeRampFromStartVolume:(float)a3 toEndVolume:(float)a4 timeRange:(id *)a5 rampMode:(int64_t)a6
{
  if ((a5->var0.var2 & 0x1D) != 1 || (a5->var1.var2 & 0x1D) != 1)
  {
    double v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"The timeRange of a volume ramp must have a numeric start time and a numeric duration.", a6, v6, v7, v8, v9, *(uint64_t *)&v12[0]), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  long long v10 = *(_OWORD *)&a5->var0.var3;
  v12[0] = *(_OWORD *)&a5->var0.var0;
  v12[1] = v10;
  v12[2] = *(_OWORD *)&a5->var1.var1;
  -[AVMutableScheduledAudioParameters _setVolumeRampFromStartVolume:toEndVolume:timeRange:rampMode:](self, "_setVolumeRampFromStartVolume:toEndVolume:timeRange:rampMode:", v12, a6);
}

@end