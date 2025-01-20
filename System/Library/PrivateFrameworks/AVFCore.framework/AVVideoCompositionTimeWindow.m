@interface AVVideoCompositionTimeWindow
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)durationAfter;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)durationAfterWhenSeeking;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)durationBefore;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)durationBeforeWhenSeeking;
- (AVVideoCompositionTimeWindow)initWithDurationBefore:(id *)a3 durationAfter:(id *)a4;
- (AVVideoCompositionTimeWindow)initWithDurationBefore:(id *)a3 durationAfter:(id *)a4 durationBeforeWhenSeeking:(id *)a5 durationAfterWhenSeeking:(id *)a6;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation AVVideoCompositionTimeWindow

- (AVVideoCompositionTimeWindow)initWithDurationBefore:(id *)a3 durationAfter:(id *)a4 durationBeforeWhenSeeking:(id *)a5 durationAfterWhenSeeking:(id *)a6
{
  v42.receiver = self;
  v42.super_class = (Class)AVVideoCompositionTimeWindow;
  v11 = [(AVVideoCompositionTimeWindow *)&v42 init];
  v12 = v11;
  if (v11)
  {
    v13 = (long long *)MEMORY[0x1E4F1FA48];
    if ((a3->var2 & 1) == 0)
    {
      *(_OWORD *)&a3->var0 = *MEMORY[0x1E4F1FA48];
      a3->var3 = *((void *)v13 + 2);
    }
    if ((a4->var2 & 1) == 0)
    {
      *(_OWORD *)&a4->var0 = *v13;
      a4->var3 = *((void *)v13 + 2);
    }
    if ((a5->var2 & 1) == 0)
    {
      long long v14 = *(_OWORD *)&a3->var0;
      a5->var3 = a3->var3;
      *(_OWORD *)&a5->var0 = v14;
    }
    if ((a6->var2 & 1) == 0)
    {
      long long v15 = *(_OWORD *)&a4->var0;
      a6->var3 = a4->var3;
      *(_OWORD *)&a6->var0 = v15;
    }
    if ((a3->var2 & 0x1D) == 1)
    {
      if ((a4->var2 & 0x1D) == 1)
      {
        if ((a5->var2 & 0x1D) == 1)
        {
          if ((a6->var2 & 0x1D) == 1)
          {
            CMTime time1 = (CMTime)*a3;
            long long v39 = *v13;
            *(_OWORD *)&time2.value = *v13;
            CMTimeEpoch v16 = *((void *)v13 + 2);
            time2.epoch = v16;
            if (CMTimeCompare(&time1, &time2) < 0)
            {
              v34 = v12;
              v28 = (void *)MEMORY[0x1E4F1CA00];
              uint64_t v29 = *MEMORY[0x1E4F1C3C8];
              v30 = @"durationBefore should not be negative";
            }
            else
            {
              CMTime time1 = (CMTime)*a4;
              *(_OWORD *)&time2.value = v39;
              time2.epoch = v16;
              if (CMTimeCompare(&time1, &time2) < 0)
              {
                v35 = v12;
                v28 = (void *)MEMORY[0x1E4F1CA00];
                uint64_t v29 = *MEMORY[0x1E4F1C3C8];
                v30 = @"durationAfter should not be negative";
              }
              else
              {
                CMTime time1 = (CMTime)*a5;
                *(_OWORD *)&time2.value = v39;
                time2.epoch = v16;
                if (CMTimeCompare(&time1, &time2) < 0)
                {
                  v36 = v12;
                  v28 = (void *)MEMORY[0x1E4F1CA00];
                  uint64_t v29 = *MEMORY[0x1E4F1C3C8];
                  v30 = @"durationBeforeWhenSeeking should not be negative";
                }
                else
                {
                  CMTime time1 = (CMTime)*a6;
                  *(_OWORD *)&time2.value = v39;
                  time2.epoch = v16;
                  if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
                  {
                    long long v17 = *(_OWORD *)&a3->var0;
                    v12->_durationBefore.epoch = a3->var3;
                    *(_OWORD *)&v12->_durationBefore.value = v17;
                    long long v18 = *(_OWORD *)&a4->var0;
                    v12->_durationAfter.epoch = a4->var3;
                    *(_OWORD *)&v12->_durationAfter.value = v18;
                    long long v19 = *(_OWORD *)&a5->var0;
                    v12->_durationBeforeWhenSeeking.epoch = a5->var3;
                    *(_OWORD *)&v12->_durationBeforeWhenSeeking.value = v19;
                    long long v20 = *(_OWORD *)&a6->var0;
                    v12->_durationAfterWhenSeeking.epoch = a6->var3;
                    *(_OWORD *)&v12->_durationAfterWhenSeeking.value = v20;
                    return v12;
                  }
                  v37 = v12;
                  v28 = (void *)MEMORY[0x1E4F1CA00];
                  uint64_t v29 = *MEMORY[0x1E4F1C3C8];
                  v30 = @"durationAfterWhenSeeking should not be negative";
                }
              }
            }
          }
          else
          {
            v33 = v11;
            v28 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v29 = *MEMORY[0x1E4F1C3C8];
            v30 = @"durationAfterWhenSeeking should be numeric";
          }
        }
        else
        {
          v32 = v11;
          v28 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v29 = *MEMORY[0x1E4F1C3C8];
          v30 = @"durationBeforeWhenSeeking should be numeric";
        }
      }
      else
      {
        v31 = v11;
        v28 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v29 = *MEMORY[0x1E4F1C3C8];
        v30 = @"durationAfter should be numeric";
      }
    }
    else
    {
      v22 = v11;
      v28 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v29 = *MEMORY[0x1E4F1C3C8];
      v30 = @"durationBefore should be numeric";
    }
    v38 = objc_msgSend(v28, "exceptionWithName:reason:userInfo:", v29, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v12, a2, (uint64_t)v30, v23, v24, v25, v26, v27, v39), 0);
    objc_exception_throw(v38);
  }
  return v12;
}

- (AVVideoCompositionTimeWindow)initWithDurationBefore:(id *)a3 durationAfter:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a4;
  return [(AVVideoCompositionTimeWindow *)self initWithDurationBefore:&v8 durationAfter:&v7 durationBeforeWhenSeeking:&v6 durationAfterWhenSeeking:&v5];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  uint64_t v16 = v3;
  uint64_t v17 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  memset(&v15[1], 0, sizeof(CMTime));
  if (self)
  {
    [(AVVideoCompositionTimeWindow *)self durationBefore];
    memset(v15, 0, 24);
    [(AVVideoCompositionTimeWindow *)self durationAfter];
    memset(&v14, 0, sizeof(v14));
    [(AVVideoCompositionTimeWindow *)self durationBeforeWhenSeeking];
    memset(&v13, 0, sizeof(v13));
    [(AVVideoCompositionTimeWindow *)self durationAfterWhenSeeking];
  }
  else
  {
    memset(v15, 0, 24);
    memset(&v14, 0, sizeof(v14));
    memset(&v13, 0, sizeof(v13));
  }
  memset(&v12[1], 0, sizeof(CMTime));
  if (a3)
  {
    [a3 durationBefore];
    memset(v12, 0, 24);
    [a3 durationAfter];
    memset(&v11, 0, sizeof(v11));
    [a3 durationBeforeWhenSeeking];
    memset(&v10, 0, sizeof(v10));
    [a3 durationAfterWhenSeeking];
  }
  else
  {
    memset(v12, 0, 24);
    memset(&v11, 0, sizeof(v11));
    memset(&v10, 0, sizeof(v10));
  }
  CMTime time1 = v15[1];
  CMTime v8 = v12[1];
  if (CMTimeCompare(&time1, &v8)) {
    return 0;
  }
  CMTime time1 = v15[0];
  CMTime v8 = v12[0];
  if (CMTimeCompare(&time1, &v8)) {
    return 0;
  }
  CMTime time1 = v14;
  CMTime v8 = v11;
  if (CMTimeCompare(&time1, &v8)) {
    return 0;
  }
  CMTime time1 = v13;
  CMTime v8 = v10;
  return !CMTimeCompare(&time1, &v8);
}

- (unint64_t)hash
{
  if (self)
  {
    [(AVVideoCompositionTimeWindow *)self durationBefore];
    CMTimeEpoch v3 = CMTimeHash(&v10);
    [(AVVideoCompositionTimeWindow *)self durationAfter];
    CMTimeEpoch v4 = CMTimeHash(&v9);
    [(AVVideoCompositionTimeWindow *)self durationBeforeWhenSeeking];
    CMTimeEpoch v5 = CMTimeHash(&v8);
    [(AVVideoCompositionTimeWindow *)self durationAfterWhenSeeking];
  }
  else
  {
    memset(&v10, 0, sizeof(v10));
    CMTimeEpoch v3 = CMTimeHash(&v10);
    memset(&v9, 0, sizeof(v9));
    CMTimeEpoch v4 = CMTimeHash(&v9);
    memset(&v8, 0, sizeof(v8));
    CMTimeEpoch v5 = CMTimeHash(&v8);
    memset(&v7, 0, sizeof(v7));
  }
  return v3 ^ CMTimeHash(&v7) ^ v5 ^ v4;
}

- (id)description
{
  CMTimeEpoch v3 = NSString;
  CMTimeEpoch v4 = (objc_class *)objc_opt_class();
  CMTimeEpoch v5 = NSStringFromClass(v4);
  CMTime time = (CMTime)self->_durationBefore;
  Float64 Seconds = CMTimeGetSeconds(&time);
  CMTime time = (CMTime)self->_durationAfter;
  Float64 v7 = CMTimeGetSeconds(&time);
  CMTime time = (CMTime)self->_durationBeforeWhenSeeking;
  Float64 v8 = CMTimeGetSeconds(&time);
  CMTime time = (CMTime)self->_durationAfterWhenSeeking;
  return (id)[v3 stringWithFormat:@"<%@: %p> [-%1.3f, +%1.3f] (during playing) / [-%1.3f, +%1.3f] (during seeking)", v5, self, *(void *)&Seconds, *(void *)&v7, *(void *)&v8, CMTimeGetSeconds(&time)];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)durationBefore
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var1;
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)durationAfter
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)durationBeforeWhenSeeking
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 56);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)durationAfterWhenSeeking
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 80);
  return self;
}

@end