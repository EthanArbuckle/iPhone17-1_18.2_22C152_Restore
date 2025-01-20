@interface VCIDRSchedulerItem
- (NSArray)streams;
- (VCIDRSchedulerItem)init;
- (id)description;
- (int64_t)compareBudget:(id)a3;
- (unsigned)budgetInCaptureFrames;
- (unsigned)framePosition;
- (unsigned)weightFactor;
- (void)addStream:(id)a3;
- (void)dealloc;
- (void)setBudgetInCaptureFrames:(unsigned int)a3;
- (void)setFramePosition:(unsigned int)a3;
- (void)setWeightFactor:(unsigned int)a3;
@end

@implementation VCIDRSchedulerItem

- (VCIDRSchedulerItem)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)VCIDRSchedulerItem;
  v2 = [(VCIDRSchedulerItem *)&v4 init];
  if (v2)
  {
    v2->_streams = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v2->_framePosition = -1;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCIDRSchedulerItem;
  [(VCIDRSchedulerItem *)&v3 dealloc];
}

- (void)addStream:(id)a3
{
  -[NSMutableArray addObject:](self->_streams, "addObject:");
  unsigned int weightFactor = self->_weightFactor;
  if (weightFactor <= [a3 weightFactor]) {
    unsigned int v6 = [a3 weightFactor];
  }
  else {
    unsigned int v6 = self->_weightFactor;
  }
  self->_unsigned int weightFactor = v6;
}

- (int64_t)compareBudget:(id)a3
{
  unsigned int budgetInCaptureFrames = self->_budgetInCaptureFrames;
  if (budgetInCaptureFrames > [a3 budgetInCaptureFrames]) {
    return -1;
  }
  unsigned int v7 = self->_budgetInCaptureFrames;
  return v7 != [a3 budgetInCaptureFrames];
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t budgetInCaptureFrames = self->_budgetInCaptureFrames;
  uint64_t weightFactor = self->_weightFactor;
  if (self->_framePosition == -1) {
    unsigned int v6 = @"N/A";
  }
  else {
    unsigned int v6 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"%d", self->_framePosition);
  }
  return (id)[v3 stringWithFormat:@"IDR Scheduler Item: Budget=%d (frames) weightFactor:%d framePosition:%@ streams:%@", budgetInCaptureFrames, weightFactor, v6, self->_streams];
}

- (unsigned)budgetInCaptureFrames
{
  return self->_budgetInCaptureFrames;
}

- (void)setBudgetInCaptureFrames:(unsigned int)a3
{
  self->_uint64_t budgetInCaptureFrames = a3;
}

- (NSArray)streams
{
  return &self->_streams->super;
}

- (unsigned)weightFactor
{
  return self->_weightFactor;
}

- (void)setWeightFactor:(unsigned int)a3
{
  self->_uint64_t weightFactor = a3;
}

- (unsigned)framePosition
{
  return self->_framePosition;
}

- (void)setFramePosition:(unsigned int)a3
{
  self->_framePosition = a3;
}

@end