@interface VCPMetaSegment
- ($D854FC4CDD8DDEA9B2859E823A7C8A75)timeRange;
- (VCPMetaSegment)init;
- (unint64_t)numOfFrames;
- (void)finalizeAtTime:(id *)a3;
- (void)mergeSegment:(id)a3;
- (void)resetSegment:(id *)a3;
- (void)updateSegment:(id *)a3;
@end

@implementation VCPMetaSegment

- (VCPMetaSegment)init
{
  v8.receiver = self;
  v8.super_class = (Class)VCPMetaSegment;
  v2 = [(VCPMetaSegment *)&v8 init];
  v3 = v2;
  if (v2)
  {
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 32);
    *(_OWORD *)&v2->_timeRange.start.value = *MEMORY[0x1E4F1FA30];
    *(_OWORD *)&v2->_timeRange.start.epoch = v5;
    *(_OWORD *)&v2->_timeRange.duration.timescale = v4;
    v2->_numOfFrames = 0;
    v6 = v2;
  }

  return v3;
}

- (void)updateSegment:(id *)a3
{
  CMTime lhs = *(CMTime *)a3;
  CMTime rhs = (CMTime)self->_timeRange.start;
  CMTimeSubtract(&v4, &lhs, &rhs);
  self->_timeRange.duration = ($95D729B680665BEAEFA1D6FCA8238556)v4;
  ++self->_numOfFrames;
}

- (void)resetSegment:(id *)a3
{
  CMTime start = *(CMTime *)a3;
  CMTime v5 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  CMTimeRangeMake(&v7, &start, &v5);
  long long v4 = *(_OWORD *)&v7.start.epoch;
  *(_OWORD *)&self->_timeRange.start.value = *(_OWORD *)&v7.start.value;
  *(_OWORD *)&self->_timeRange.start.epoch = v4;
  *(_OWORD *)&self->_timeRange.duration.timescale = *(_OWORD *)&v7.duration.timescale;
  self->_numOfFrames = 1;
}

- (void)mergeSegment:(id)a3
{
  id v4 = a3;
  self->_numOfFrames += [v4 numOfFrames];
  long long v5 = *(_OWORD *)&self->_timeRange.start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->_timeRange.start.value;
  *(_OWORD *)&range.start.epoch = v5;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_timeRange.duration.timescale;
  if (v4) {
    [v4 timeRange];
  }
  else {
    memset(&v7, 0, sizeof(v7));
  }
  CMTimeRangeGetUnion(&v9, &range, &v7);
  long long v6 = *(_OWORD *)&v9.start.epoch;
  *(_OWORD *)&self->_timeRange.start.value = *(_OWORD *)&v9.start.value;
  *(_OWORD *)&self->_timeRange.start.epoch = v6;
  *(_OWORD *)&self->_timeRange.duration.timescale = *(_OWORD *)&v9.duration.timescale;
}

- (void)finalizeAtTime:(id *)a3
{
  CMTime lhs = *(CMTime *)a3;
  CMTime rhs = (CMTime)self->_timeRange.start;
  CMTimeSubtract(&v4, &lhs, &rhs);
  self->_timeRange.duration = ($95D729B680665BEAEFA1D6FCA8238556)v4;
}

- ($D854FC4CDD8DDEA9B2859E823A7C8A75)timeRange
{
  long long v3 = *(_OWORD *)&self->var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var0.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var0;
  return self;
}

- (unint64_t)numOfFrames
{
  return self->_numOfFrames;
}

@end