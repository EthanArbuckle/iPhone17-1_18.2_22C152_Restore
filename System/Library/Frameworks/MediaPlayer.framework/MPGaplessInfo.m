@interface MPGaplessInfo
- (unint64_t)durationInFrames;
- (unint64_t)lastPacketsResync;
- (unsigned)encodingDelayInFrames;
- (unsigned)encodingDrainInFrames;
- (unsigned)heuristicInfo;
- (void)setDurationInFrames:(unint64_t)a3;
- (void)setEncodingDelayInFrames:(unsigned int)a3;
- (void)setEncodingDrainInFrames:(unsigned int)a3;
- (void)setHeuristicInfo:(unsigned int)a3;
- (void)setLastPacketsResync:(unint64_t)a3;
@end

@implementation MPGaplessInfo

- (void)setLastPacketsResync:(unint64_t)a3
{
  self->_lastPacketsResync = a3;
}

- (void)setHeuristicInfo:(unsigned int)a3
{
  self->_heuristicInfo = a3;
}

- (void)setEncodingDrainInFrames:(unsigned int)a3
{
  self->_encodingDrainInFrames = a3;
}

- (void)setEncodingDelayInFrames:(unsigned int)a3
{
  self->_encodingDelayInFrames = a3;
}

- (void)setDurationInFrames:(unint64_t)a3
{
  self->_durationInFrames = a3;
}

- (unint64_t)lastPacketsResync
{
  return self->_lastPacketsResync;
}

- (unsigned)heuristicInfo
{
  return self->_heuristicInfo;
}

- (unsigned)encodingDrainInFrames
{
  return self->_encodingDrainInFrames;
}

- (unsigned)encodingDelayInFrames
{
  return self->_encodingDelayInFrames;
}

- (unint64_t)durationInFrames
{
  return self->_durationInFrames;
}

@end