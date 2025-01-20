@interface Stop
@end

@implementation Stop

intptr_t __apsink_Stop_block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end