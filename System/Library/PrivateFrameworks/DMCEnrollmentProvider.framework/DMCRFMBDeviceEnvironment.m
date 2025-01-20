@interface DMCRFMBDeviceEnvironment
- (BOOL)_shouldIncludeApp:(id)a3;
- (id)installedAppBundleIdentifiers;
@end

@implementation DMCRFMBDeviceEnvironment

- (id)installedAppBundleIdentifiers
{
  v32[2] = *MEMORY[0x263EF8340];
  v3 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221CC5000, v3, OS_LOG_TYPE_DEFAULT, "managed restore, installedAppBundleIdentifiers begin", buf, 2u);
  }
  *(void *)buf = 0;
  v27 = buf;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  id v31 = (id)objc_opt_new();
  v4 = objc_opt_new();
  [v4 setType:2];
  v32[0] = @"Identifier";
  v32[1] = @"Installing";
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
  [v4 setPropertyKeys:v5];

  v6 = (void *)[objc_alloc(MEMORY[0x263F08748]) initWithCondition:1];
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  char v25 = 0;
  v7 = dispatch_queue_create("installed_app_bundle_id_queue", 0);
  dispatch_time_t v8 = dispatch_time(0, 30000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__DMCRFMBDeviceEnvironment_installedAppBundleIdentifiers__block_invoke;
  block[3] = &unk_2645E94A8;
  block[4] = v24;
  dispatch_after(v8, v7, block);
  v9 = [MEMORY[0x263F39D18] currentUserConnection];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __57__DMCRFMBDeviceEnvironment_installedAppBundleIdentifiers__block_invoke_18;
  v17[3] = &unk_2645E99B8;
  v10 = v7;
  v18 = v10;
  v19 = self;
  v21 = v24;
  v22 = buf;
  id v11 = v6;
  id v20 = v11;
  [v9 performRequest:v4 completion:v17];

  v12 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_221CC5000, v12, OS_LOG_TYPE_DEFAULT, "managed restore, installedAppBundleIdentifiers waiting on main lock", v16, 2u);
  }
  [v11 lockWhenCondition:0];
  [v11 unlock];
  v13 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_221CC5000, v13, OS_LOG_TYPE_DEFAULT, "managed restore, installedAppBundleIdentifiers waiting on main lock - DONE", v16, 2u);
  }
  v14 = (void *)[*((id *)v27 + 5) copy];

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(buf, 8);

  return v14;
}

void __57__DMCRFMBDeviceEnvironment_installedAppBundleIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    v1 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      v6 = "installed_app_bundle_id";
      __int16 v7 = 2048;
      uint64_t v8 = 0x403E000000000000;
      _os_log_impl(&dword_221CC5000, v1, OS_LOG_TYPE_ERROR, "Task %s hasn't finished within %.1f seconds", (uint8_t *)&v5, 0x16u);
    }
    v2 = [@"installed_app_bundle_id" stringByAppendingString:@"_stackshot.ips"];
    v3 = (void *)MEMORY[0x263F38B48];
    v4 = DMCHangTracerDirectory();
    [v3 dumpStackshotToPath:v4 fileName:v2];
  }
}

void __57__DMCRFMBDeviceEnvironment_installedAppBundleIdentifiers__block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  __int16 v7 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__DMCRFMBDeviceEnvironment_installedAppBundleIdentifiers__block_invoke_2;
  block[3] = &unk_2645E94A8;
  block[4] = *(void *)(a1 + 56);
  dispatch_async(v7, block);
  uint64_t v8 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221CC5000, v8, OS_LOG_TYPE_DEFAULT, "managed restore, installedAppBundleIdentifiers completion", buf, 2u);
  }
  if (v6)
  {
    uint64_t v9 = *(NSObject **)(DMCLogObjects() + 32);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v26 = v6;
      _os_log_impl(&dword_221CC5000, v9, OS_LOG_TYPE_ERROR, "Error retrieving the list of apps on this device: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    v10 = [v5 appsByBundleIdentifier];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          v16 = [v10 objectForKeyedSubscript:v15];
          if ([*(id *)(a1 + 40) _shouldIncludeApp:v16]) {
            [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v12);
    }
  }
  v17 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221CC5000, v17, OS_LOG_TYPE_DEFAULT, "managed restore, installedAppBundleIdentifiers waiting on completion lock", buf, 2u);
  }
  [*(id *)(a1 + 48) lock];
  [*(id *)(a1 + 48) unlockWithCondition:0];
  v18 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221CC5000, v18, OS_LOG_TYPE_DEFAULT, "managed restore, installedAppBundleIdentifiers waiting on completion lock - DONE", buf, 2u);
  }
}

uint64_t __57__DMCRFMBDeviceEnvironment_installedAppBundleIdentifiers__block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (BOOL)_shouldIncludeApp:(id)a3
{
  return 1;
}

@end