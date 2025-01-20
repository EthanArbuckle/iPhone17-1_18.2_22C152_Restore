@interface PKInputPointReduceFramerateFilter
- (void)addInputPoint:(id *)a3;
@end

@implementation PKInputPointReduceFramerateFilter

- (void)addInputPoint:(id *)a3
{
  if (self)
  {
    int64_t numInputPoints = self->super._numInputPoints;
    self->super._int64_t numInputPoints = numInputPoints + 1;
    if (numInputPoints)
    {
      unint64_t coalescingCounter = self->_coalescingCounter;
      if (coalescingCounter < self->_numPointsToCoalesce)
      {
        self->_unint64_t coalescingCounter = coalescingCounter + 1;
        return;
      }
    }
    memmove(&self->super._filteredPoint, a3, 0x80uLL);
  }
  self->_unint64_t coalescingCounter = 0;
}

@end