@interface FPInFlightCommandBuffer
- (FPInFlightCommandBuffer)initWithAddress:(void *)a3 creationTime:(double)a4;
- (void)dealloc;
@end

@implementation FPInFlightCommandBuffer

- (FPInFlightCommandBuffer)initWithAddress:(void *)a3 creationTime:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)FPInFlightCommandBuffer;
  result = [(FPInFlightCommandBuffer *)&v7 init];
  if (result)
  {
    result->_address = a3;
    result->_creationTime = a4;
    atomic_fetch_add(&gFPInFlightCommandBufferCount, 1uLL);
  }
  return result;
}

- (void)dealloc
{
  atomic_fetch_add(&gFPInFlightCommandBufferCount, 0xFFFFFFFFFFFFFFFFLL);
  v2.receiver = self;
  v2.super_class = (Class)FPInFlightCommandBuffer;
  [(FPInFlightCommandBuffer *)&v2 dealloc];
}

@end