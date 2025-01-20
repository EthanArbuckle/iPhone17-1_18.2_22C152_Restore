@interface AVMutableAudioMixInputParameters
+ (AVMutableAudioMixInputParameters)audioMixInputParameters;
+ (AVMutableAudioMixInputParameters)audioMixInputParametersWithAssetTrack:(id)a3 introFadeDuration:(id *)a4 fadeOutStart:(id *)a5 fadeOutDuration:(id *)a6;
+ (AVMutableAudioMixInputParameters)audioMixInputParametersWithTrack:(AVAssetTrack *)track;
+ (AVMutableAudioMixInputParameters)audioMixInputParametersWithTrack:(id)a3 scheduledAudioParameters:(id)a4;
- (AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm;
- (CMPersistentTrackID)trackID;
- (MTAudioProcessingTapRef)audioTapProcessor;
- (void)addEffect:(id)a3;
- (void)removeAllEffects;
- (void)removeEffectParameters:(id)a3;
- (void)setAmbienceLevel:(float)a3 atTime:(id *)a4;
- (void)setAudioTapProcessor:(MTAudioProcessingTapRef)audioTapProcessor;
- (void)setAudioTimePitchAlgorithm:(AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm;
- (void)setDialogLevel:(float)a3 atTime:(id *)a4;
- (void)setDialogMixBias:(float)a3 atTime:(id *)a4;
- (void)setTrackID:(CMPersistentTrackID)trackID;
- (void)setVolume:(float)volume atTime:(CMTime *)time;
- (void)setVolumeRampFromStartVolume:(float)a3 toEndVolume:(float)a4 timeRange:(id *)a5 rampMode:(int64_t)a6;
- (void)setVolumeRampFromStartVolume:(float)startVolume toEndVolume:(float)endVolume timeRange:(CMTimeRange *)timeRange;
@end

@implementation AVMutableAudioMixInputParameters

+ (AVMutableAudioMixInputParameters)audioMixInputParametersWithTrack:(AVAssetTrack *)track
{
  v4 = objc_alloc_init(AVMutableAudioMixInputParameters);
  if (track) {
    [(AVMutableAudioMixInputParameters *)v4 setTrackID:[(AVAssetTrack *)track trackID]];
  }
  return v4;
}

+ (AVMutableAudioMixInputParameters)audioMixInputParametersWithTrack:(id)a3 scheduledAudioParameters:(id)a4
{
  v5 = +[AVMutableAudioMixInputParameters audioMixInputParametersWithTrack:a3];
  [(AVAudioMixInputParameters *)v5 _setScheduledAudioParameters:a4];
  return v5;
}

+ (AVMutableAudioMixInputParameters)audioMixInputParameters
{
  v2 = objc_alloc_init(AVMutableAudioMixInputParameters);
  return v2;
}

- (CMPersistentTrackID)trackID
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableAudioMixInputParameters;
  return [(AVAudioMixInputParameters *)&v3 trackID];
}

- (void)setTrackID:(CMPersistentTrackID)trackID
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableAudioMixInputParameters;
  [(AVAudioMixInputParameters *)&v3 setTrackID:*(void *)&trackID];
}

- (AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableAudioMixInputParameters;
  return [(AVAudioMixInputParameters *)&v3 audioTimePitchAlgorithm];
}

- (void)setAudioTimePitchAlgorithm:(AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableAudioMixInputParameters;
  [(AVAudioMixInputParameters *)&v3 setAudioTimePitchAlgorithm:audioTimePitchAlgorithm];
}

- (MTAudioProcessingTapRef)audioTapProcessor
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableAudioMixInputParameters;
  return [(AVAudioMixInputParameters *)&v3 audioTapProcessor];
}

- (void)setAudioTapProcessor:(MTAudioProcessingTapRef)audioTapProcessor
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableAudioMixInputParameters;
  [(AVAudioMixInputParameters *)&v3 setAudioTapProcessor:audioTapProcessor];
}

- (void)setVolumeRampFromStartVolume:(float)startVolume toEndVolume:(float)endVolume timeRange:(CMTimeRange *)timeRange
{
  v7.receiver = self;
  v7.super_class = (Class)AVMutableAudioMixInputParameters;
  long long v5 = *(_OWORD *)&timeRange->start.epoch;
  v6[0] = *(_OWORD *)&timeRange->start.value;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&timeRange->duration.timescale;
  -[AVAudioMixInputParameters setVolumeRampFromStartVolume:toEndVolume:timeRange:](&v7, sel_setVolumeRampFromStartVolume_toEndVolume_timeRange_, v6);
}

- (void)setVolumeRampFromStartVolume:(float)a3 toEndVolume:(float)a4 timeRange:(id *)a5 rampMode:(int64_t)a6
{
  v8.receiver = self;
  v8.super_class = (Class)AVMutableAudioMixInputParameters;
  long long v6 = *(_OWORD *)&a5->var0.var3;
  v7[0] = *(_OWORD *)&a5->var0.var0;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a5->var1.var1;
  -[AVAudioMixInputParameters setVolumeRampFromStartVolume:toEndVolume:timeRange:rampMode:](&v8, sel_setVolumeRampFromStartVolume_toEndVolume_timeRange_rampMode_, v7, a6);
}

- (void)setVolume:(float)volume atTime:(CMTime *)time
{
  v5.receiver = self;
  v5.super_class = (Class)AVMutableAudioMixInputParameters;
  CMTime v4 = *time;
  -[AVAudioMixInputParameters setVolume:atTime:](&v5, sel_setVolume_atTime_, &v4);
}

- (void)setDialogLevel:(float)a3 atTime:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)AVMutableAudioMixInputParameters;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = *a4;
  -[AVAudioMixInputParameters setDialogLevel:atTime:](&v5, sel_setDialogLevel_atTime_, &v4);
}

- (void)setAmbienceLevel:(float)a3 atTime:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)AVMutableAudioMixInputParameters;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = *a4;
  -[AVAudioMixInputParameters setAmbienceLevel:atTime:](&v5, sel_setAmbienceLevel_atTime_, &v4);
}

- (void)setDialogMixBias:(float)a3 atTime:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)AVMutableAudioMixInputParameters;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = *a4;
  -[AVAudioMixInputParameters setDialogMixBias:atTime:](&v5, sel_setDialogMixBias_atTime_, &v4);
}

- (void)addEffect:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableAudioMixInputParameters;
  [(AVAudioMixInputParameters *)&v3 addEffect:a3];
}

- (void)removeEffectParameters:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableAudioMixInputParameters;
  [(AVAudioMixInputParameters *)&v3 removeEffect:a3];
}

- (void)removeAllEffects
{
  v2.receiver = self;
  v2.super_class = (Class)AVMutableAudioMixInputParameters;
  [(AVAudioMixInputParameters *)&v2 removeAllEffectParameters];
}

+ (AVMutableAudioMixInputParameters)audioMixInputParametersWithAssetTrack:(id)a3 introFadeDuration:(id *)a4 fadeOutStart:(id *)a5 fadeOutDuration:(id *)a6
{
  if ((a4->var2 & 0x1D) != 1
    || (CMTime time1 = *(CMTime *)a4,
        long long v23 = *MEMORY[0x1E4F1FA48],
        *(_OWORD *)&time2.value = *MEMORY[0x1E4F1FA48],
        CMTimeEpoch v14 = *(void *)(MEMORY[0x1E4F1FA48] + 16),
        time2.epoch = v14,
        CMTimeCompare(&time1, &time2) < 0))
  {
    v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    v21 = @"introFadeDuration must be numeric and >= 0";
    goto LABEL_17;
  }
  if ((a5->var2 & 0x1D) == 1)
  {
    CMTime time1 = (CMTime)*a5;
    *(_OWORD *)&time2.value = v23;
    time2.epoch = v14;
    if (CMTimeCompare(&time1, &time2) < 0)
    {
      v19 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v20 = *MEMORY[0x1E4F1C3C8];
      v21 = @"fadeOutStart must be >= 0 if numeric";
LABEL_17:
      v22 = objc_msgSend(v19, "exceptionWithName:reason:userInfo:", v20, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, (uint64_t)v21, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, v6, v7, v23), 0);
      objc_exception_throw(v22);
    }
  }
  if ((a6->var2 & 0x1D) != 1
    || (CMTime time1 = (CMTime)*a6, *(_OWORD *)&time2.value = v23, time2.epoch = v14, CMTimeCompare(&time1, &time2) < 0))
  {
    v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    v21 = @"fadeOutDuration must be numeric and >= 0";
    goto LABEL_17;
  }
  v15 = objc_alloc_init(AVMutableAudioMixInputParameters);
  if (v15)
  {
    -[AVMutableAudioMixInputParameters setTrackID:](v15, "setTrackID:", [a3 trackID]);
    CMTime time1 = (CMTime)*a4;
    *(_OWORD *)&time2.value = v23;
    time2.epoch = v14;
    if (CMTimeCompare(&time1, &time2) >= 1)
    {
      *(_OWORD *)&time1.value = v23;
      time1.epoch = v14;
      CMTime time2 = (CMTime)*a4;
      CMTimeRangeMake(&v25, &time1, &time2);
      LODWORD(v16) = 1.0;
      [(AVMutableAudioMixInputParameters *)v15 setVolumeRampFromStartVolume:&v25 toEndVolume:1 timeRange:0.0 rampMode:v16];
    }
    if ((a5->var2 & 0x1D) == 1)
    {
      CMTime time1 = (CMTime)*a6;
      *(_OWORD *)&time2.value = v23;
      time2.epoch = v14;
      if (CMTimeCompare(&time1, &time2) >= 1)
      {
        CMTime time1 = (CMTime)*a5;
        CMTime time2 = (CMTime)*a6;
        CMTimeRangeMake(&v24, &time1, &time2);
        LODWORD(v17) = 1.0;
        [(AVMutableAudioMixInputParameters *)v15 setVolumeRampFromStartVolume:&v24 toEndVolume:1 timeRange:v17 rampMode:0.0];
      }
    }
  }
  return v15;
}

@end