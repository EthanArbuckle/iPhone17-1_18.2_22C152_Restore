@interface BPSRemoveSystemDeletedAppFromSpecifiers
@end

@implementation BPSRemoveSystemDeletedAppFromSpecifiers

void ___BPSRemoveSystemDeletedAppFromSpecifiers_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v6 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
    [v8 rangeOfString:@"com.apple." options:9];
    if (v9)
    {
      v10 = +[BPSBridgeAppContext shared];
      v11 = [v10 watchAppInstallStates];
      v12 = [v11 objectForKey:v8];
      uint64_t v13 = [v12 integerValue];

      if (v13 != 2) {
        [*(id *)(a1 + 32) addIndex:a3];
      }
    }
  }
  else
  {
    id v8 = [v5 identifier];
    [v8 rangeOfString:@"com.apple." options:9];
    if (v14)
    {
      v15 = bps_utility_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        id v17 = v8;
        _os_log_impl(&dword_21C513000, v15, OS_LOG_TYPE_DEFAULT, "Unable to check removal of %@: because there is no bundle ID mapping", (uint8_t *)&v16, 0xCu);
      }
    }
  }
}

@end