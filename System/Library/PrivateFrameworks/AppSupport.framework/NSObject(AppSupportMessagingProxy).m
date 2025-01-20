@interface NSObject(AppSupportMessagingProxy)
- (CapturedInvocationTrampoline)pep_getInvocation:()AppSupportMessagingProxy;
- (DelayedInvocationTrampoline)pep_afterDelay:()AppSupportMessagingProxy;
- (OperationQueueInvocationTrampoline)pep_onOperationQueue:()AppSupportMessagingProxy priority:;
- (ThreadedInvocationTrampoline)pep_onThread:()AppSupportMessagingProxy immediateForMatchingThread:;
- (uint64_t)pep_onMainThread;
- (uint64_t)pep_onMainThreadIfNecessary;
- (uint64_t)pep_onOperationQueue:()AppSupportMessagingProxy;
- (uint64_t)pep_onThread:()AppSupportMessagingProxy;
@end

@implementation NSObject(AppSupportMessagingProxy)

- (uint64_t)pep_onMainThread
{
  uint64_t v2 = [MEMORY[0x1E4F29060] mainThread];
  return objc_msgSend(a1, "pep_onThread:", v2);
}

- (uint64_t)pep_onMainThreadIfNecessary
{
  uint64_t v2 = [MEMORY[0x1E4F29060] mainThread];
  return objc_msgSend(a1, "pep_onThread:immediateForMatchingThread:", v2, 1);
}

- (ThreadedInvocationTrampoline)pep_onThread:()AppSupportMessagingProxy immediateForMatchingThread:
{
  v4 = [[ThreadedInvocationTrampoline alloc] initWithTarget:a1 thread:a3 immediateForMatchingThread:a4];
  return v4;
}

- (uint64_t)pep_onThread:()AppSupportMessagingProxy
{
  return objc_msgSend(a1, "pep_onThread:immediateForMatchingThread:", a3, 0);
}

- (DelayedInvocationTrampoline)pep_afterDelay:()AppSupportMessagingProxy
{
  uint64_t v2 = [[DelayedInvocationTrampoline alloc] initWithTarget:a1 delay:a2];
  return v2;
}

- (uint64_t)pep_onOperationQueue:()AppSupportMessagingProxy
{
  return objc_msgSend(a1, "pep_onOperationQueue:priority:", a3, 0);
}

- (OperationQueueInvocationTrampoline)pep_onOperationQueue:()AppSupportMessagingProxy priority:
{
  v4 = [[OperationQueueInvocationTrampoline alloc] initWithTarget:a1 operationQueue:a3 priority:a4];
  return v4;
}

- (CapturedInvocationTrampoline)pep_getInvocation:()AppSupportMessagingProxy
{
  v3 = [[CapturedInvocationTrampoline alloc] initWithTarget:a1 outInvocation:a3];
  return v3;
}

@end