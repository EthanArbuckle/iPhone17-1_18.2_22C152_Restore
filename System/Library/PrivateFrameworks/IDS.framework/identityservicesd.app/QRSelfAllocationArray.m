@interface QRSelfAllocationArray
- (QRSelfAllocationArray)init;
- (id)getAllocation;
- (void)addAllocation:(id)a3;
@end

@implementation QRSelfAllocationArray

- (QRSelfAllocationArray)init
{
  v6.receiver = self;
  v6.super_class = (Class)QRSelfAllocationArray;
  v2 = [(QRSelfAllocationArray *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    allocations = v2->_allocations;
    v2->_allocations = v3;

    v2->_nextIndex = 0;
  }
  return v2;
}

- (id)getAllocation
{
  unsigned int nextIndex = self->_nextIndex;
  if (nextIndex >= [(NSMutableArray *)self->_allocations count])
  {
    v5 = 0;
  }
  else
  {
    allocations = self->_allocations;
    ++self->_nextIndex;
    v5 = -[NSMutableArray objectAtIndex:](allocations, "objectAtIndex:");
  }

  return v5;
}

- (void)addAllocation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end