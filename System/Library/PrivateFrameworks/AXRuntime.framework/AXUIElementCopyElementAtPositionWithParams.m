@interface AXUIElementCopyElementAtPositionWithParams
@end

@implementation AXUIElementCopyElementAtPositionWithParams

void ___AXUIElementCopyElementAtPositionWithParams_block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  v5 = AXRuntimeLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109378;
    v6[1] = a3;
    __int16 v7 = 2112;
    id v8 = v4;
    _os_log_impl(&dword_1BA657000, v5, OS_LOG_TYPE_INFO, "\t%d: %@", (uint8_t *)v6, 0x12u);
  }
}

BOOL ___AXUIElementCopyElementAtPositionWithParams_block_invoke_22(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 contextId] == *(_DWORD *)(a1 + 40))
  {
    int v4 = [v3 remotePid];
    BOOL v5 = v4 == [*(id *)(a1 + 32) unsignedIntValue];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

@end