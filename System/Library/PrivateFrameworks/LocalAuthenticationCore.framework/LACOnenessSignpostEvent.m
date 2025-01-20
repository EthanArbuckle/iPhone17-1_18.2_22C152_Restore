@interface LACOnenessSignpostEvent
+ (LACSignpostEvent)authenticationRequestDidFinish;
+ (LACSignpostEvent)authenticationRequestWillStart;
+ (LACSignpostEvent)eligibleDevicesRequestDidFinish;
+ (LACSignpostEvent)eligibleDevicesRequestWillStart;
@end

@implementation LACOnenessSignpostEvent

+ (LACSignpostEvent)authenticationRequestWillStart
{
  v2 = [[LACSignpostEvent alloc] initWithSendBlock:&__block_literal_global_3_0];
  return v2;
}

void __57__LACOnenessSignpostEvent_authenticationRequestWillStart__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = LACLogABM();
  if (os_signpost_enabled(v3))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_signpost_emit_with_name_impl(&dword_254F14000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MacAuthenticationRequest", "%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

+ (LACSignpostEvent)authenticationRequestDidFinish
{
  id v2 = [[LACSignpostEvent alloc] initWithSendBlock:&__block_literal_global_7_1];
  return v2;
}

void __57__LACOnenessSignpostEvent_authenticationRequestDidFinish__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = LACLogABM();
  if (os_signpost_enabled(v3))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_signpost_emit_with_name_impl(&dword_254F14000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MacAuthenticationRequest", "%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

+ (LACSignpostEvent)eligibleDevicesRequestWillStart
{
  id v2 = [[LACSignpostEvent alloc] initWithSendBlock:&__block_literal_global_11_1];
  return v2;
}

void __58__LACOnenessSignpostEvent_eligibleDevicesRequestWillStart__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = LACLogABM();
  if (os_signpost_enabled(v3))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_signpost_emit_with_name_impl(&dword_254F14000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MacEligibleDevicesRequest", "%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

+ (LACSignpostEvent)eligibleDevicesRequestDidFinish
{
  id v2 = [[LACSignpostEvent alloc] initWithSendBlock:&__block_literal_global_15];
  return v2;
}

void __58__LACOnenessSignpostEvent_eligibleDevicesRequestDidFinish__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = LACLogABM();
  if (os_signpost_enabled(v3))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_signpost_emit_with_name_impl(&dword_254F14000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MacEligibleDevicesRequest", "%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

@end