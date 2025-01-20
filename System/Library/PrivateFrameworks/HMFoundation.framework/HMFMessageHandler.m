@interface HMFMessageHandler
@end

@implementation HMFMessageHandler

uint64_t __44____HMFMessageHandler_expiredReceiverTarget__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"DEADBEEF-0000-0000-0000-000000000000"];
  uint64_t v1 = qword_1EB4EE9C0;
  qword_1EB4EE9C0 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __47____HMFMessageHandler__canonicalizePolicyList___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = +[HMFObjectCacheHMFMessagePolicy cachedInstanceForMessagePolicy:a2];
  [v2 addObject:v3];
}

BOOL __47____HMFMessageHandler__canonicalizePolicyList___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  unint64_t v4 = objc_opt_class();
  unint64_t v5 = objc_opt_class();

  return v4 < v5;
}

uint64_t __34____HMFMessageHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle(@"Messaging.Handler", @"com.apple.HMFoundation");
  uint64_t v1 = qword_1EB4EE9D0;
  qword_1EB4EE9D0 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end