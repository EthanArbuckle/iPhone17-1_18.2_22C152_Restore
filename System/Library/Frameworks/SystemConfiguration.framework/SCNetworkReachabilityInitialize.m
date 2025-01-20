@interface SCNetworkReachabilityInitialize
@end

@implementation SCNetworkReachabilityInitialize

uint64_t ____SCNetworkReachabilityInitialize_block_invoke()
{
  __kSCNetworkReachabilityTypeID = _CFRuntimeRegisterClass();
  pthread_mutexattr_init(&lock_attr);

  return pthread_mutexattr_settype(&lock_attr, 1);
}

@end