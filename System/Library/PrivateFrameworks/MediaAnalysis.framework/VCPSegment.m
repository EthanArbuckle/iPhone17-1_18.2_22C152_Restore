@interface VCPSegment
- ($D854FC4CDD8DDEA9B2859E823A7C8A75)timeRange;
- (BOOL)isContentTooShort;
- (VCPSegment)init;
- (VCPSegment)initWithTimestamp:(id *)a3 score:(float)a4 valid:(BOOL)a5;
- (float)curationScore;
- (float)score;
- (float)sumOfScore;
- (unint64_t)numOfFrames;
- (unint64_t)numOfValidFrames;
- (void)copyFrom:(id)a3;
- (void)mergeSegment:(id)a3;
- (void)setCurationScore:(float)a3;
- (void)setTimeRange:(id *)a3;
- (void)trimSegment:(id *)a3 fromStart:(BOOL)a4;
- (void)updateDuration:(id *)a3;
- (void)updateSegment:(id *)a3 score:(float)a4 valid:(BOOL)a5;
- (void)updateWithFirstFrame:(id *)a3 score:(float)a4 valid:(BOOL)a5;
@end

@implementation VCPSegment

- (VCPSegment)init
{
  v8.receiver = self;
  v8.super_class = (Class)VCPSegment;
  v2 = [(VCPSegment *)&v8 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = MEMORY[0x1E4F1FA30];
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
    *(_OWORD *)&v2->_timeRange.start.value = *MEMORY[0x1E4F1FA30];
    *(_OWORD *)&v2->_timeRange.start.epoch = v5;
    *(_OWORD *)&v2->_timeRange.duration.timescale = *(_OWORD *)(v4 + 32);
    v2->_sumOfScore = 0.0;
    v2->_numOfFrames = 0;
    v2->_numOfValidFrames = 0;
    v6 = v2;
  }

  return v3;
}

- (VCPSegment)initWithTimestamp:(id *)a3 score:(float)a4 valid:(BOOL)a5
{
  BOOL v5 = a5;
  v16.receiver = self;
  v16.super_class = (Class)VCPSegment;
  objc_super v8 = [(VCPSegment *)&v16 init];
  if (v8)
  {
    CMTime start = (CMTime)*a3;
    CMTime v13 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    CMTimeRangeMake(&v15, &start, &v13);
    long long v10 = *(_OWORD *)&v15.start.epoch;
    long long v9 = *(_OWORD *)&v15.duration.timescale;
    *(_OWORD *)&v8->_timeRange.start.value = *(_OWORD *)&v15.start.value;
    *(_OWORD *)&v8->_timeRange.start.epoch = v10;
    *(_OWORD *)&v8->_timeRange.duration.timescale = v9;
    v8->_numOfFrames = 1;
    if (v5)
    {
      v8->_numOfValidFrames = 1;
      v8->_sumOfScore = a4;
    }
    v11 = v8;
  }

  return v8;
}

- (void)updateWithFirstFrame:(id *)a3 score:(float)a4 valid:(BOOL)a5
{
  if ((a3->var0.var2 & 1) != 0
    && (a3->var1.var2 & 1) != 0
    && !a3->var1.var3
    && (a3->var1.var0 & 0x8000000000000000) == 0)
  {
    long long v5 = *(_OWORD *)&a3->var0.var0;
    long long v6 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&self->_timeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&self->_timeRange.duration.timescale = v6;
    *(_OWORD *)&self->_timeRange.start.value = v5;
    self->_numOfFrames = 1;
    if (a5)
    {
      self->_numOfValidFrames = 1;
      self->_sumOfScore = a4;
    }
  }
}

- (void)updateSegment:(id *)a3 score:(float)a4 valid:(BOOL)a5
{
  if ((a3->var0.var2 & 1) != 0
    && (a3->var1.var2 & 1) != 0
    && !a3->var1.var3
    && (a3->var1.var0 & 0x8000000000000000) == 0)
  {
    BOOL v5 = a5;
    long long v8 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&range.start.epoch = v8;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
    CMTimeRangeGetEnd(&lhs, &range);
    $95D729B680665BEAEFA1D6FCA8238556 start = self->_timeRange.start;
    CMTimeSubtract(&range.start, &lhs, (CMTime *)&start);
    self->_timeRange.duration = ($95D729B680665BEAEFA1D6FCA8238556)range.start;
    ++self->_numOfFrames;
    if (v5)
    {
      ++self->_numOfValidFrames;
      self->_sumOfScore = self->_sumOfScore + a4;
    }
  }
}

- (void)mergeSegment:(id)a3
{
  id v4 = a3;
  float v5 = (float)(unint64_t)[v4 numOfFrames];
  [v4 score];
  self->_sumOfScore = self->_sumOfScore + (float)(v5 * v6);
  self->_numOfFrames += [v4 numOfFrames];
  self->_numOfValidFrames += [v4 numOfValidFrames];
  if (v4) {
    [v4 timeRange];
  }
  else {
    memset(&otherRange, 0, sizeof(otherRange));
  }
  long long v7 = *(_OWORD *)&self->_timeRange.start.epoch;
  *(_OWORD *)&v9.start.value = *(_OWORD *)&self->_timeRange.start.value;
  *(_OWORD *)&v9.start.epoch = v7;
  *(_OWORD *)&v9.duration.timescale = *(_OWORD *)&self->_timeRange.duration.timescale;
  CMTimeRangeGetUnion(&v11, &v9, &otherRange);
  long long v8 = *(_OWORD *)&v11.start.epoch;
  *(_OWORD *)&self->_timeRange.start.value = *(_OWORD *)&v11.start.value;
  *(_OWORD *)&self->_timeRange.start.epoch = v8;
  *(_OWORD *)&self->_timeRange.duration.timescale = *(_OWORD *)&v11.duration.timescale;
}

- (void)copyFrom:(id)a3
{
  id v4 = a3;
  [v4 sumOfScore];
  self->_sumOfScore = v5;
  self->_numOfFrames = [v4 numOfFrames];
  self->_numOfValidFrames = [v4 numOfValidFrames];
  if (v4)
  {
    [v4 timeRange];
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
    long long v7 = 0u;
  }
  *(_OWORD *)&self->_timeRange.start.value = v7;
  *(_OWORD *)&self->_timeRange.start.epoch = v8;
  *(_OWORD *)&self->_timeRange.duration.timescale = v9;
  objc_msgSend(v4, "curationScore", v7, v8, v9);
  self->_curationScore = v6;
}

- (void)updateDuration:(id *)a3
{
  CMTime lhs = *(CMTime *)a3;
  $95D729B680665BEAEFA1D6FCA8238556 start = self->_timeRange.start;
  CMTimeSubtract(&v6, &lhs, (CMTime *)&start);
  self->_timeRange.duration = ($95D729B680665BEAEFA1D6FCA8238556)v6;
}

- (void)trimSegment:(id *)a3 fromStart:(BOOL)a4
{
  p_timeRange = &self->_timeRange;
  p_duration = &self->_timeRange.duration;
  if (a4)
  {
    long long v7 = *(_OWORD *)&self->_timeRange.start.epoch;
    *(_OWORD *)&range.start.value = *(_OWORD *)&p_timeRange->start.value;
    *(_OWORD *)&range.start.epoch = v7;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_timeRange.duration.timescale;
    CMTimeRangeGetEnd(&lhs, &range);
    CMTime rhs = (CMTime)*a3;
    CMTimeSubtract(&range.start, &lhs, &rhs);
    *(_OWORD *)&p_duration->value = *(_OWORD *)&range.start.value;
    p_duration->epoch = range.start.epoch;
    long long v8 = *(_OWORD *)&a3->var0;
    p_timeRange->start.epoch = a3->var3;
    *(_OWORD *)&p_timeRange->start.value = v8;
  }
  else
  {
    CMTime rhs = *(CMTime *)a3;
    *(_OWORD *)&v9.value = *(_OWORD *)&p_timeRange->start.value;
    v9.epoch = self->_timeRange.start.epoch;
    CMTimeSubtract(&range.start, &rhs, &v9);
    *(_OWORD *)&p_duration->value = *(_OWORD *)&range.start.value;
    p_duration->epoch = range.start.epoch;
  }
}

- (BOOL)isContentTooShort
{
  $95D729B680665BEAEFA1D6FCA8238556 duration = self->_timeRange.duration;
  return CMTimeGetSeconds((CMTime *)&duration) < 0.5;
}

- (float)score
{
  unint64_t numOfValidFrames = self->_numOfValidFrames;
  if (numOfValidFrames) {
    return self->_sumOfScore / (float)numOfValidFrames;
  }
  else {
    return 0.0;
  }
}

- (float)sumOfScore
{
  return self->_sumOfScore;
}

- ($D854FC4CDD8DDEA9B2859E823A7C8A75)timeRange
{
  long long v3 = *(_OWORD *)&self[1].var0.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var3;
  return self;
}

- (void)setTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_timeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_timeRange.duration.timescale = v4;
  *(_OWORD *)&self->_timeRange.start.value = v3;
}

- (unint64_t)numOfFrames
{
  return self->_numOfFrames;
}

- (unint64_t)numOfValidFrames
{
  return self->_numOfValidFrames;
}

- (float)curationScore
{
  return self->_curationScore;
}

- (void)setCurationScore:(float)a3
{
  self->_curationScore = a3;
}

@end