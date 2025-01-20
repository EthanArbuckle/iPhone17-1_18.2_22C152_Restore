@interface AXFrontBoardGetFrontmostAppProcessesAndScenes
@end

@implementation AXFrontBoardGetFrontmostAppProcessesAndScenes

void ___AXFrontBoardGetFrontmostAppProcessesAndScenes_block_invoke(uint64_t a1)
{
  v18[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = AXFrontBoardSystemAppProcess();
  v3 = (void *)v2;
  if (v2)
  {
    v18[0] = v2;
    uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    v7 = [MEMORY[0x263EFF9D0] null];
    v17 = v7;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  int v11 = [*(id *)(a1 + 32) isPasscodeLockVisible];
  v12 = AXLogUIA();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = [*(id *)(a1 + 32) isAppSwitcherVisible];
    v14[0] = 67109376;
    v14[1] = v13;
    __int16 v15 = 1024;
    int v16 = v11;
    _os_log_impl(&dword_224D52000, v12, OS_LOG_TYPE_INFO, "System app process frontmost (app switcher: %d, passocde: %d", (uint8_t *)v14, 0xEu);
  }
}

uint64_t ___AXFrontBoardGetFrontmostAppProcessesAndScenes_block_invoke_437(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 objectForKey:@"process"];
  v3 = [v2 bundleIdentifier];
  uint64_t v4 = [v3 isEqualToString:*MEMORY[0x263F227D0]];

  return v4;
}

uint64_t ___AXFrontBoardGetFrontmostAppProcessesAndScenes_block_invoke_439(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKey:@"process"];
  uint64_t v4 = [v3 bundleIdentifier];
  uint64_t v5 = [*(id *)(a1 + 32) bundleIdentifier];
  uint64_t v6 = [v4 isEqualToString:v5] ^ 1;

  return v6;
}

@end