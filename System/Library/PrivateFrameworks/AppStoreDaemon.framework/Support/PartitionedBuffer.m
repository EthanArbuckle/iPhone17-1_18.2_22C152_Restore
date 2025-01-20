@interface PartitionedBuffer
- (void)dealloc;
@end

@implementation PartitionedBuffer

- (void)dealloc
{
  p_allocationBase = &self->_allocationBase;
  allocationBase = self->_allocationBase;
  if (allocationBase) {
    free(allocationBase);
  }
  *(_OWORD *)p_allocationBase = 0u;
  *((_OWORD *)p_allocationBase + 1) = 0u;
  v5.receiver = self;
  v5.super_class = (Class)PartitionedBuffer;
  [(PartitionedBuffer *)&v5 dealloc];
}

@end