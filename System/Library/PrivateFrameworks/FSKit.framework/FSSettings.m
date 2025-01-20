@interface FSSettings
+ (id)defaultSettings;
- (NSURL)enabledModulesArray;
- (NSURL)probeOrderArray;
- (NSURL)settingsContainer;
@end

@implementation FSSettings

+ (id)defaultSettings
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__FSSettings_defaultSettings__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultSettings_onceToken != -1) {
    dispatch_once(&defaultSettings_onceToken, block);
  }
  v2 = (void *)defaultSettings_def;
  return v2;
}

uint64_t __29__FSSettings_defaultSettings__block_invoke(uint64_t a1)
{
  defaultSettings_def = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (NSURL)settingsContainer
{
  if (settingsContainer_onceToken != -1) {
    dispatch_once(&settingsContainer_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)settingsContainer_containerURL;
  return (NSURL *)v2;
}

void __31__FSSettings_settingsContainer__block_invoke()
{
  v0 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v1 = [v0 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.fskit.settings"];
  v2 = (void *)settingsContainer_containerURL;
  settingsContainer_containerURL = v1;

  if (settingsContainer_containerURL)
  {
    v3 = [MEMORY[0x263F08850] defaultManager];
    char v10 = 0;
    v4 = [(id)settingsContainer_containerURL path];
    char v5 = [v3 fileExistsAtPath:v4 isDirectory:&v10];

    if (v5)
    {
      id v6 = 0;
    }
    else
    {
      id v9 = 0;
      char v7 = [v3 createDirectoryAtURL:settingsContainer_containerURL withIntermediateDirectories:1 attributes:0 error:&v9];
      id v6 = v9;
      if ((v7 & 1) == 0)
      {
        v8 = fskit_std_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          __31__FSSettings_settingsContainer__block_invoke_cold_1((uint64_t)v6, v8);
        }
      }
    }
  }
}

- (NSURL)probeOrderArray
{
  v2 = [(FSSettings *)self settingsContainer];
  v3 = [v2 URLByAppendingPathComponent:@"probeOrder.plist" isDirectory:0];

  return (NSURL *)v3;
}

- (NSURL)enabledModulesArray
{
  v2 = [(FSSettings *)self settingsContainer];
  v3 = [v2 URLByAppendingPathComponent:@"enabledModules.plist" isDirectory:0];

  return (NSURL *)v3;
}

void __31__FSSettings_settingsContainer__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_24DDB2000, a2, OS_LOG_TYPE_ERROR, "Error creating container: %@", (uint8_t *)&v2, 0xCu);
}

@end