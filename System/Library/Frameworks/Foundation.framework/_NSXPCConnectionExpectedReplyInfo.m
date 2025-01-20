@interface _NSXPCConnectionExpectedReplyInfo
- (void)cleanup;
- (void)dealloc;
- (void)initWithSelector:(void *)result;
@end

@implementation _NSXPCConnectionExpectedReplyInfo

- (void)cleanup
{
  if (a1)
  {
    v2 = *(NSObject **)(a1 + 24);
    if (v2)
    {
      dispatch_semaphore_signal(v2);
      dispatch_release(*(dispatch_object_t *)(a1 + 24));
      *(void *)(a1 + 24) = 0;
    }
  }
}

- (void)initWithSelector:(void *)result
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v4.receiver = result;
    v4.super_class = (Class)_NSXPCConnectionExpectedReplyInfo;
    result = objc_msgSendSuper2(&v4, sel_init);
    if (a2) {
      uint64_t v3 = a2;
    }
    else {
      uint64_t v3 = 0;
    }
    result[4] = v3;
  }
  return result;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];

  timeoutSemaphore = self->_timeoutSemaphore;
  if (timeoutSemaphore) {
    dispatch_release(timeoutSemaphore);
  }

  v4.receiver = self;
  v4.super_class = (Class)_NSXPCConnectionExpectedReplyInfo;
  [(_NSXPCConnectionExpectedReplyInfo *)&v4 dealloc];
}

@end