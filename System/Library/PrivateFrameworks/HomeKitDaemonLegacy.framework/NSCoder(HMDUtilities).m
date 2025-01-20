@interface NSCoder(HMDUtilities)
- (uint64_t)hmd_isForLocalStore;
@end

@implementation NSCoder(HMDUtilities)

- (uint64_t)hmd_isForLocalStore
{
  if (objc_msgSend(a1, "hmd_isForXPCTransport")) {
    return 0;
  }
  else {
    return objc_msgSend(a1, "hmd_isForRemoteTransport") ^ 1;
  }
}

@end