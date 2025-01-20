@interface HMFMessage(HMXPC)
- (uint64_t)hm_isXPCTimeoutDisabled;
@end

@implementation HMFMessage(HMXPC)

- (uint64_t)hm_isXPCTimeoutDisabled
{
  v1 = [a1 headers];
  uint64_t v2 = objc_msgSend(v1, "hmf_BOOLForKey:", @"HMXPCMessageHeaderKeyIsXPCTimeoutDisabled");

  return v2;
}

@end