@interface LACDTOSignpostEvent
@end

@implementation LACDTOSignpostEvent

LACSignpostEvent *__49__LACDTOSignpostEvent_environmentUpdateWillStart__block_invoke()
{
  v0 = [[LACSignpostEvent alloc] initWithSendBlock:&__block_literal_global_5_0];
  return v0;
}

void __49__LACDTOSignpostEvent_environmentUpdateWillStart__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = LACLogDTO();
  if (os_signpost_enabled(v3))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_signpost_emit_with_name_impl(&dword_254F14000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DTOEnvironmentUpdate", "%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

LACSignpostEvent *__49__LACDTOSignpostEvent_environmentUpdateDidFinish__block_invoke()
{
  v0 = [[LACSignpostEvent alloc] initWithSendBlock:&__block_literal_global_11];
  return v0;
}

void __49__LACDTOSignpostEvent_environmentUpdateDidFinish__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = LACLogDTO();
  if (os_signpost_enabled(v3))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_signpost_emit_with_name_impl(&dword_254F14000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DTOEnvironmentUpdate", "%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

LACSignpostEvent *__51__LACDTOSignpostEvent_locationStatusQueryWillStart__block_invoke()
{
  v0 = [[LACSignpostEvent alloc] initWithSendBlock:&__block_literal_global_17];
  return v0;
}

void __51__LACDTOSignpostEvent_locationStatusQueryWillStart__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = LACLogDTO();
  if (os_signpost_enabled(v3))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_signpost_emit_with_name_impl(&dword_254F14000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DTOLocationStateQuery", "%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

LACSignpostEvent *__51__LACDTOSignpostEvent_locationStatusQueryDidFinish__block_invoke()
{
  v0 = [[LACSignpostEvent alloc] initWithSendBlock:&__block_literal_global_23];
  return v0;
}

void __51__LACDTOSignpostEvent_locationStatusQueryDidFinish__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = LACLogDTO();
  if (os_signpost_enabled(v3))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_signpost_emit_with_name_impl(&dword_254F14000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DTOLocationStateQuery", "%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

LACSignpostEvent *__45__LACDTOSignpostEvent_lostModeQueryWillStart__block_invoke()
{
  v0 = [[LACSignpostEvent alloc] initWithSendBlock:&__block_literal_global_29];
  return v0;
}

void __45__LACDTOSignpostEvent_lostModeQueryWillStart__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = LACLogDTO();
  if (os_signpost_enabled(v3))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_signpost_emit_with_name_impl(&dword_254F14000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DTOLostModeQuery", "%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

LACSignpostEvent *__45__LACDTOSignpostEvent_lostModeQueryDidFinish__block_invoke()
{
  v0 = [[LACSignpostEvent alloc] initWithSendBlock:&__block_literal_global_35];
  return v0;
}

void __45__LACDTOSignpostEvent_lostModeQueryDidFinish__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = LACLogDTO();
  if (os_signpost_enabled(v3))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_signpost_emit_with_name_impl(&dword_254F14000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DTOLostModeQuery", "%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

LACSignpostEvent *__49__LACDTOSignpostEvent_repairStatusQueryWillStart__block_invoke()
{
  v0 = [[LACSignpostEvent alloc] initWithSendBlock:&__block_literal_global_41];
  return v0;
}

void __49__LACDTOSignpostEvent_repairStatusQueryWillStart__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = LACLogDTO();
  if (os_signpost_enabled(v3))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_signpost_emit_with_name_impl(&dword_254F14000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DTORepairStateQuery", "%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

LACSignpostEvent *__49__LACDTOSignpostEvent_repairStatusQueryDidFinish__block_invoke()
{
  v0 = [[LACSignpostEvent alloc] initWithSendBlock:&__block_literal_global_47];
  return v0;
}

void __49__LACDTOSignpostEvent_repairStatusQueryDidFinish__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = LACLogDTO();
  if (os_signpost_enabled(v3))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_signpost_emit_with_name_impl(&dword_254F14000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DTORepairStateQuery", "%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

@end