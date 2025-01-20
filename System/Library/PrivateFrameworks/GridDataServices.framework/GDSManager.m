@interface GDSManager
@end

@implementation GDSManager

uint64_t __48___GDSManager_managerWithID_locationBundlePath___block_invoke(uint64_t result)
{
  if (!managerWithID_locationBundlePath__instance)
  {
    managerWithID_locationBundlePath__instance = [[_GDSManager alloc] initWithID:*(void *)(result + 32) locationBundlePath:*(void *)(result + 40)];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

void __51___GDSManager_registerClientID_locationBundlePath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __51___GDSManager_registerClientID_locationBundlePath___block_invoke_cold_1();
  }
}

void __51___GDSManager_registerClientID_locationBundlePath___block_invoke_62(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __51___GDSManager_registerClientID_locationBundlePath___block_invoke_62_cold_1();
    }
  }
}

void __42___GDSManager_triggerBAUpdateWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __51___GDSManager_registerClientID_locationBundlePath___block_invoke_cold_1();
  }
}

void __42___GDSManager_triggerBAUpdateWithHandler___block_invoke_63(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __42___GDSManager_triggerBAUpdateWithHandler___block_invoke_63_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void *__49___GDSManager_latestBalancingAuthorityWithError___block_invoke()
{
  return &unk_27018F2A8;
}

void *__49___GDSManager_latestBalancingAuthorityWithError___block_invoke_83()
{
  return &unk_27018F2D0;
}

void *__49___GDSManager_latestBalancingAuthorityWithError___block_invoke_96()
{
  return &unk_27018F2F8;
}

void *__49___GDSManager_latestBalancingAuthorityWithError___block_invoke_112()
{
  return &unk_27018F320;
}

void *__49___GDSManager_latestBalancingAuthorityWithError___block_invoke_2()
{
  return &unk_27018F348;
}

void __51___GDSManager_registerClientID_locationBundlePath___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  v1 = NSStringFromSelector(*(SEL *)(v0 + 40));
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2504C2000, v2, v3, "Error calling %@: %@", v4, v5, v6, v7, v8);
}

void __51___GDSManager_registerClientID_locationBundlePath___block_invoke_62_cold_1()
{
  OUTLINED_FUNCTION_2();
  v1 = NSStringFromSelector(*(SEL *)(v0 + 40));
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2504C2000, v2, v3, "Error executing %@: %@", v4, v5, v6, v7, v8);
}

void __42___GDSManager_triggerBAUpdateWithHandler___block_invoke_63_cold_1()
{
  OUTLINED_FUNCTION_2();
  v1 = NSStringFromSelector(*(SEL *)(v0 + 48));
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2504C2000, v2, v3, "Error executing %@: %@", v4, v5, v6, v7, v8);
}

@end