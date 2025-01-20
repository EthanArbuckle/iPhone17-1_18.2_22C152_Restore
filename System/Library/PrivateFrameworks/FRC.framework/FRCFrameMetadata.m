@interface FRCFrameMetadata
- (int64_t)sequenceAdjusterDisplacement;
- (unint64_t)originalPTSInNanos;
- (unint64_t)ptsInNanos;
- (unint64_t)sequenceAdjusterRecipe;
- (void)setOriginalPTSInNanos:(unint64_t)a3;
- (void)setPtsInNanos:(unint64_t)a3;
- (void)setSequenceAdjusterDisplacement:(int64_t)a3;
- (void)setSequenceAdjusterRecipe:(unint64_t)a3;
@end

@implementation FRCFrameMetadata

- (unint64_t)ptsInNanos
{
  return self->_ptsInNanos;
}

- (void)setPtsInNanos:(unint64_t)a3
{
  self->_ptsInNanos = a3;
}

- (unint64_t)originalPTSInNanos
{
  return self->_originalPTSInNanos;
}

- (void)setOriginalPTSInNanos:(unint64_t)a3
{
  self->_originalPTSInNanos = a3;
}

- (unint64_t)sequenceAdjusterRecipe
{
  return self->_sequenceAdjusterRecipe;
}

- (void)setSequenceAdjusterRecipe:(unint64_t)a3
{
  self->_sequenceAdjusterRecipe = a3;
}

- (int64_t)sequenceAdjusterDisplacement
{
  return self->_sequenceAdjusterDisplacement;
}

- (void)setSequenceAdjusterDisplacement:(int64_t)a3
{
  self->_sequenceAdjusterDisplacement = a3;
}

@end