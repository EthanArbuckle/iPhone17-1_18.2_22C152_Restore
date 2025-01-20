@interface VCPVideoCNNHighlightTimeRangePredictor
- ($D854FC4CDD8DDEA9B2859E823A7C8A75)timeRangeAtTime:(SEL)a3;
- (BOOL)needsAnalysisResultsAtTime:(id *)a3;
- (VCPVideoCNNHighlightTimeRangePredictor)initWithHightlightEnabled:(BOOL)a3 postInference:(BOOL)a4 minProcessingInterval:(float)a5 startTime:(id *)a6;
- (void)updateForTime:(id *)a3;
@end

@implementation VCPVideoCNNHighlightTimeRangePredictor

- (VCPVideoCNNHighlightTimeRangePredictor)initWithHightlightEnabled:(BOOL)a3 postInference:(BOOL)a4 minProcessingInterval:(float)a5 startTime:(id *)a6
{
  v14.receiver = self;
  v14.super_class = (Class)VCPVideoCNNHighlightTimeRangePredictor;
  result = [(VCPVideoCNNHighlightTimeRangePredictor *)&v14 init];
  if (result)
  {
    result->_enableHighlight = a3;
    result->_postInference = a4;
    result->_enoughFrames = 0;
    result->_validFrames = 0;
    int64_t v11 = *(void *)(MEMORY[0x1E4F1FA08] + 16);
    *(_OWORD *)&result->_timeLastProcess.value = *MEMORY[0x1E4F1FA08];
    result->_timeLastProcess.epoch = v11;
    uint64_t v12 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&result->_timeLastDetection.value = *MEMORY[0x1E4F1F9F8];
    result->_timeLastDetection.epoch = *(void *)(v12 + 16);
    int64_t var3 = a6->var3;
    *(_OWORD *)&result->_timeStart.value = *(_OWORD *)&a6->var0;
    result->_timeStart.epoch = var3;
    result->_minProcessingInterval = a5;
  }
  return result;
}

- (BOOL)needsAnalysisResultsAtTime:(id *)a3
{
  if (self->_enableHighlight
    && self->_validFrames >= 15
    && (CMTime lhs = *(CMTime *)a3,
        CMTime rhs = (CMTime)self->_timeLastProcess,
        CMTimeSubtract(&time, &lhs, &rhs),
        CMTimeGetSeconds(&time) >= 0.125))
  {
    return self->_timeLastDetection.flags & 1;
  }
  else
  {
    return 0;
  }
}

- ($D854FC4CDD8DDEA9B2859E823A7C8A75)timeRangeAtTime:(SEL)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a4;
  result = ($D854FC4CDD8DDEA9B2859E823A7C8A75 *)[(VCPVideoCNNHighlightTimeRangePredictor *)self needsAnalysisResultsAtTime:&v12];
  if (result)
  {
    CMTime start = (CMTime)self->_timeLastDetection;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a4;
    return ($D854FC4CDD8DDEA9B2859E823A7C8A75 *)CMTimeRangeFromTimeToTime((CMTimeRange *)retstr, &start, (CMTime *)&v10);
  }
  else
  {
    uint64_t v8 = MEMORY[0x1E4F1FA20];
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
    *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E4F1FA20];
    *(_OWORD *)&retstr->var0.int64_t var3 = v9;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v8 + 32);
  }
  return result;
}

- (void)updateForTime:(id *)a3
{
  CMTime lhs = *(CMTime *)a3;
  CMTime rhs = (CMTime)self->_timeLastProcess;
  CMTimeSubtract(&time, &lhs, &rhs);
  if (CMTimeGetSeconds(&time) < self->_minProcessingInterval
    || (lhs = (CMTime)*a3, CMTime rhs = (CMTime)self->_timeStart, CMTimeCompare(&lhs, &rhs) < 0))
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = !self->_enoughFrames || !self->_postInference;
  }
  p_timeLastDetection = &self->_timeLastDetection;
  if ((self->_timeLastDetection.flags & 1) == 0)
  {
    long long v7 = *(_OWORD *)&a3->var0;
    self->_timeLastDetection.epoch = a3->var3;
    *(_OWORD *)&p_timeLastDetection->value = v7;
  }
  if (v5)
  {
    int validFrames = self->_validFrames;
    self->_int validFrames = validFrames + 1;
    if (validFrames >= 15)
    {
      self->_enoughFrames = 1;
      if (!self->_postInference)
      {
        self->_enoughFrames = 0;
        self->_int validFrames = 0;
        long long v9 = *(_OWORD *)&a3->var0;
        self->_timeLastDetection.epoch = a3->var3;
        *(_OWORD *)&p_timeLastDetection->value = v9;
      }
    }
    long long v10 = *(_OWORD *)&a3->var0;
    self->_timeLastProcess.epoch = a3->var3;
    *(_OWORD *)&self->_timeLastProcess.value = v10;
  }
}

@end