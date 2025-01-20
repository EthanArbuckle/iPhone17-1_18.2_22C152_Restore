@interface SenderLargeFrameInfo
- (BOOL)isLargeFrameRequestDisabled;
- (BOOL)isLastFrameProbingSequence;
- (double)lastProbingSequenceTimeActual;
- (double)lastProbingSequenceTimeExpect;
- (double)startTime;
- (int)probingSequenceCount;
- (int)totalLargeFrameWaste;
- (unsigned)largeFrameSizeAtCurrentBandwidth;
- (unsigned)largeFrameSizeRequested;
- (unsigned)probingSequencePacketCount;
- (unsigned)probingSequencePacketSize;
- (void)setIsLargeFrameRequestDisabled:(BOOL)a3;
- (void)setIsLastFrameProbingSequence:(BOOL)a3;
- (void)setLargeFrameSizeAtCurrentBandwidth:(unsigned int)a3;
- (void)setLargeFrameSizeRequested:(unsigned int)a3;
- (void)setLastProbingSequenceTimeActual:(double)a3;
- (void)setLastProbingSequenceTimeExpect:(double)a3;
- (void)setProbingSequenceCount:(int)a3;
- (void)setProbingSequencePacketCount:(unsigned int)a3;
- (void)setProbingSequencePacketSize:(unsigned int)a3;
- (void)setStartTime:(double)a3;
- (void)setTotalLargeFrameWaste:(int)a3;
@end

@implementation SenderLargeFrameInfo

- (double)startTime
{
  return self->startTime;
}

- (void)setStartTime:(double)a3
{
  self->startTime = a3;
}

- (double)lastProbingSequenceTimeExpect
{
  return self->lastProbingSequenceTimeExpect;
}

- (void)setLastProbingSequenceTimeExpect:(double)a3
{
  self->lastProbingSequenceTimeExpect = a3;
}

- (double)lastProbingSequenceTimeActual
{
  return self->lastProbingSequenceTimeActual;
}

- (void)setLastProbingSequenceTimeActual:(double)a3
{
  self->lastProbingSequenceTimeActual = a3;
}

- (unsigned)largeFrameSizeRequested
{
  return self->largeFrameSizeRequested;
}

- (void)setLargeFrameSizeRequested:(unsigned int)a3
{
  self->largeFrameSizeRequested = a3;
}

- (unsigned)largeFrameSizeAtCurrentBandwidth
{
  return self->largeFrameSizeAtCurrentBandwidth;
}

- (void)setLargeFrameSizeAtCurrentBandwidth:(unsigned int)a3
{
  self->largeFrameSizeAtCurrentBandwidth = a3;
}

- (unsigned)probingSequencePacketSize
{
  return self->probingSequencePacketSize;
}

- (void)setProbingSequencePacketSize:(unsigned int)a3
{
  self->probingSequencePacketSize = a3;
}

- (unsigned)probingSequencePacketCount
{
  return self->probingSequencePacketCount;
}

- (void)setProbingSequencePacketCount:(unsigned int)a3
{
  self->probingSequencePacketCount = a3;
}

- (int)probingSequenceCount
{
  return self->probingSequenceCount;
}

- (void)setProbingSequenceCount:(int)a3
{
  self->probingSequenceCount = a3;
}

- (int)totalLargeFrameWaste
{
  return self->totalLargeFrameWaste;
}

- (void)setTotalLargeFrameWaste:(int)a3
{
  self->totalLargeFrameWaste = a3;
}

- (BOOL)isLastFrameProbingSequence
{
  return self->isLastFrameProbingSequence;
}

- (void)setIsLastFrameProbingSequence:(BOOL)a3
{
  self->isLastFrameProbingSequence = a3;
}

- (BOOL)isLargeFrameRequestDisabled
{
  return self->isLargeFrameRequestDisabled;
}

- (void)setIsLargeFrameRequestDisabled:(BOOL)a3
{
  self->isLargeFrameRequestDisabled = a3;
}

@end