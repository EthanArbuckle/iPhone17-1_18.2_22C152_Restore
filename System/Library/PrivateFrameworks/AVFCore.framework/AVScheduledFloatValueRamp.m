@interface AVScheduledFloatValueRamp
+ (float)defaultFloatValue;
+ (id)defaultValue;
+ (id)scheduledFloatValueRampWithStartValue:(float)a3 endValue:(float)a4 timeRange:(id *)a5;
- (AVScheduledFloatValueRamp)initWithPropertyList:(id)a3;
- (AVScheduledFloatValueRamp)initWithStartValue:(float)a3 endValue:(float)a4 timeRange:(id *)a5;
- (float)_interpolatedValueAtTime:(id *)a3;
- (float)endFloatValue;
- (float)startFloatValue;
- (id)_makeRampWithTruncatedTimeRange:(id *)a3 endValue:(float)a4;
- (id)endValue;
- (id)propertyList;
- (id)scheduledParameterRampInterpolatedToTime:(id *)a3;
- (id)startValue;
- (int64_t)_parameterRampMode;
@end

@implementation AVScheduledFloatValueRamp

+ (id)defaultValue
{
  v2 = (void *)MEMORY[0x1E4F28ED0];
  [a1 defaultFloatValue];
  return (id)objc_msgSend(v2, "numberWithFloat:");
}

+ (float)defaultFloatValue
{
  return 1.0;
}

+ (id)scheduledFloatValueRampWithStartValue:(float)a3 endValue:(float)a4 timeRange:(id *)a5
{
  id v8 = objc_alloc((Class)objc_opt_class());
  long long v9 = *(_OWORD *)&a5->var0.var3;
  v11[0] = *(_OWORD *)&a5->var0.var0;
  v11[1] = v9;
  *(float *)&long long v9 = a4;
  return (id)objc_msgSend(v8, "initWithStartValue:endValue:timeRange:", v11, COERCE_DOUBLE(__PAIR64__(HIDWORD(*(void *)&a5->var1.var1), LODWORD(a3))), *(double *)&v9);
}

- (AVScheduledFloatValueRamp)initWithStartValue:(float)a3 endValue:(float)a4 timeRange:(id *)a5
{
  v17.receiver = self;
  v17.super_class = (Class)AVScheduledFloatValueRamp;
  long long v7 = *(_OWORD *)&a5->var0.var3;
  v16[0] = *(_OWORD *)&a5->var0.var0;
  v16[1] = v7;
  v16[2] = *(_OWORD *)&a5->var1.var1;
  id v8 = [(AVScheduledParameterRamp *)&v17 initWithTimeRange:v16];
  if (v8)
  {
    long long v9 = objc_opt_class();
    *(float *)&double v10 = a3;
    [v9 boundsAdjustedFloatValue:v10];
    v8->_startValue = v11;
    v12 = objc_opt_class();
    *(float *)&double v13 = a4;
    [v12 boundsAdjustedFloatValue:v13];
    v8->_endValue = v14;
  }
  return v8;
}

- (id)startValue
{
  *(float *)&double v2 = self->_startValue;
  return (id)[MEMORY[0x1E4F28ED0] numberWithFloat:v2];
}

- (float)startFloatValue
{
  return self->_startValue;
}

- (id)endValue
{
  *(float *)&double v2 = self->_endValue;
  return (id)[MEMORY[0x1E4F28ED0] numberWithFloat:v2];
}

- (float)endFloatValue
{
  return self->_endValue;
}

- (int64_t)_parameterRampMode
{
  return 0;
}

- (float)_interpolatedValueAtTime:(id *)a3
{
  memset(v21, 0, sizeof(v21));
  long long v20 = 0u;
  if (self && ([(AVScheduledParameterRamp *)self timeRange], (BYTE4(v21[1]) & 0x1D) == 1))
  {
    CMTime time = *(CMTime *)((char *)v21 + 8);
    double Seconds = CMTimeGetSeconds(&time);
    CMTime time = (CMTime)*a3;
    *(_OWORD *)&v17.value = v20;
    v17.epoch = *(void *)&v21[0];
    CMTimeSubtract(&v18, &time, &v17);
    double v6 = CMTimeGetSeconds(&v18) / Seconds;
    int64_t v7 = [(AVScheduledFloatValueRamp *)self _parameterRampMode];
    if (v7)
    {
      float result = 0.0;
      if (v7 != 1) {
        return result;
      }
      [(AVScheduledFloatValueRamp *)self endFloatValue];
      float v10 = v9;
      [(AVScheduledFloatValueRamp *)self startFloatValue];
      if (v10 <= v11) {
        double v6 = sin((v6 + -1.0) * 0.5 * 3.14159265) + 1.0;
      }
      else {
        double v6 = sin(v6 * 0.5 * 3.14159265);
      }
    }
    [(AVScheduledFloatValueRamp *)self endFloatValue];
    float v13 = v12;
    [(AVScheduledFloatValueRamp *)self startFloatValue];
    double v15 = (float)(v13 - v14);
    [(AVScheduledFloatValueRamp *)self startFloatValue];
    return v16 + v15 * v6;
  }
  else
  {
    [(AVScheduledFloatValueRamp *)self endFloatValue];
  }
  return result;
}

- (id)_makeRampWithTruncatedTimeRange:(id *)a3 endValue:(float)a4
{
  double v6 = objc_opt_class();
  [(AVScheduledFloatValueRamp *)self startFloatValue];
  long long v7 = *(_OWORD *)&a3->var0.var3;
  v9[0] = *(_OWORD *)&a3->var0.var0;
  v9[1] = v7;
  v9[2] = *(_OWORD *)&a3->var1.var1;
  return (id)objc_msgSend(v6, "scheduledFloatValueRampWithStartValue:endValue:timeRange:", v9);
}

- (id)scheduledParameterRampInterpolatedToTime:(id *)a3
{
  memset(&v19, 0, sizeof(v19));
  if (self) {
    [(AVScheduledParameterRamp *)self timeRange];
  }
  CMTimeRange range = v19;
  CMTimeRangeGetEnd(&time2, &range);
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0;
  range.start.epoch = a3->var3;
  if (!CMTimeCompare(&range.start, &time2)) {
    return (id)[(AVScheduledFloatValueRamp *)self copy];
  }
  CMTimeRange range = v19;
  CMTime time = (CMTime)*a3;
  if (!CMTimeRangeContainsTime(&range, &time))
  {
    float v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"can't interpolate outside of the timeRange of the receiver", v6, v7, v8, v9, v10, start.value), 0 reason userInfo];
    objc_exception_throw(v14);
  }
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0;
  range.start.epoch = a3->var3;
  [(AVScheduledFloatValueRamp *)self _interpolatedValueAtTime:&range];
  unsigned int v12 = v11;
  CMTime time = (CMTime)*a3;
  CMTime start = v19.start;
  CMTimeSubtract(&range.start, &time, &start);
  v19.duration = range.start;
  CMTimeRange range = v19;
  return [(AVScheduledFloatValueRamp *)self _makeRampWithTruncatedTimeRange:&range endValue:COERCE_DOUBLE(__PAIR64__(v19.duration.flags, v12))];
}

- (AVScheduledFloatValueRamp)initWithPropertyList:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v26 = self;
    v23 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v24 = *MEMORY[0x1E4F1C3C8];
    v25 = "[propertyList isKindOfClass:[NSDictionary class]]";
LABEL_15:
    v27 = (void *)[v23 exceptionWithName:v24, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v18, v19, v20, v21, v22, (uint64_t)v25), 0 reason userInfo];
    objc_exception_throw(v27);
  }
  uint64_t v6 = MEMORY[0x1E4F1FA20];
  CMTimeValue value = *MEMORY[0x1E4F1FA20];
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 8);
  CFDictionaryRef v7 = (const __CFDictionary *)[a3 objectForKey:@"timeRange"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CMTimeRangeMakeFromDictionary(&v31, v7);
    goto LABEL_6;
  }
  CFDictionaryRef v8 = (const __CFDictionary *)[a3 objectForKey:@"time"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CMTimeMakeFromDictionary(&start, v8);
    CMTime duration = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA10];
    CMTimeRangeMake(&v31, &start, &duration);
LABEL_6:
    CMTimeValue value = v31.start.value;
    CMTimeFlags flags = v31.start.flags;
    CMTimeScale timescale = v31.start.timescale;
    CMTimeEpoch epoch = v31.start.epoch;
    CMTimeValue v11 = v31.duration.value;
    double v12 = *(double *)&v31.duration.timescale;
    CMTimeEpoch v13 = v31.duration.epoch;
    if ((v31.start.flags & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_9;
  }
  CMTimeFlags flags = *(_DWORD *)(v6 + 12);
  CMTimeEpoch epoch = *(void *)(v6 + 16);
  CMTimeValue v11 = *(void *)(v6 + 24);
  double v12 = *(double *)(v6 + 32);
  CMTimeEpoch v13 = *(void *)(v6 + 40);
  if ((flags & 1) == 0)
  {
LABEL_13:
    CMTime v17 = self;
    v23 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v24 = *MEMORY[0x1E4F1C3C8];
    v25 = "CMTIMERANGE_IS_VALID(timeRange)";
    goto LABEL_15;
  }
LABEL_9:
  if ((BYTE4(v12) & 1) == 0 || v13 || v11 < 0) {
    goto LABEL_13;
  }
  double v28 = v12;
  objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"startValue"), "floatValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"endValue"), "floatValue");
  LODWORD(v15) = v14;
  v31.start.CMTimeValue value = value;
  v31.start.CMTimeScale timescale = timescale;
  v31.start.CMTimeFlags flags = flags;
  v31.start.CMTimeEpoch epoch = epoch;
  v31.duration.CMTimeValue value = v11;
  *(double *)&v31.duration.CMTimeScale timescale = v28;
  v31.duration.CMTimeEpoch epoch = 0;
  return [(AVScheduledFloatValueRamp *)self initWithStartValue:&v31 endValue:v28 timeRange:v15];
}

- (id)propertyList
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  if (self)
  {
    [(AVScheduledParameterRamp *)self timeRange];
    BOOL v3 = (BYTE4(v15) & 0x1D) == 1;
  }
  else
  {
    BOOL v3 = 0;
  }
  v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = [(AVScheduledFloatValueRamp *)self startValue];
  id v6 = [(AVScheduledFloatValueRamp *)self endValue];
  if (v3)
  {
    long long v10 = v13;
    long long v11 = v14;
    long long v12 = v15;
    CFDictionaryRef v7 = AVDictionaryWithTimeRange(&v10);
    CFDictionaryRef v8 = @"timeRange";
  }
  else
  {
    long long v10 = v13;
    *(void *)&long long v11 = v14;
    CFDictionaryRef v7 = AVDictionaryWithTime((CMTime *)&v10);
    CFDictionaryRef v8 = @"time";
  }
  return (id)objc_msgSend(v4, "dictionaryWithObjectsAndKeys:", v5, @"startValue", v6, @"endValue", v7, v8, 0);
}

@end