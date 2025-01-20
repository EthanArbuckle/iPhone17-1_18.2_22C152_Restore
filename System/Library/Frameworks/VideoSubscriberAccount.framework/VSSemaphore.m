@interface VSSemaphore
- (VSSemaphore)init;
- (void)signal;
- (void)wait;
@end

@implementation VSSemaphore

- (VSSemaphore)init
{
  v6.receiver = self;
  v6.super_class = (Class)VSSemaphore;
  v2 = [(VSSemaphore *)&v6 init];
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    semaphore = v2->_semaphore;
    v2->_semaphore = (OS_dispatch_semaphore *)v3;
  }
  return v2;
}

- (void)signal
{
}

- (void)wait
{
}

- (void).cxx_destruct
{
}

@end