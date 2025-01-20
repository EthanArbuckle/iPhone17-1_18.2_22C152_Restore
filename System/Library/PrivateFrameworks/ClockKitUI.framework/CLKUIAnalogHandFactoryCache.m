@interface CLKUIAnalogHandFactoryCache
+ (id)sharedInstance;
+ (void)purge;
@end

@implementation CLKUIAnalogHandFactoryCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_9);
  }
  v2 = (void *)sharedInstance_cache;
  return v2;
}

void __45__CLKUIAnalogHandFactoryCache_sharedInstance__block_invoke()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v0 = objc_opt_new();
  v1 = [MEMORY[0x1E4F4F8C8] optionsWithContainerPathProvider:v0];
  v2 = [[CLKUIAnalogHandFactoryCache alloc] initWithUniqueIdentifier:@"com.apple.ClockKitUI.configurableHands" options:v1];
  v3 = (void *)sharedInstance_cache;
  sharedInstance_cache = (uint64_t)v2;

  v4 = CLKBuildVersion();
  v5 = (void *)CFPreferencesCopyAppValue(@"HandFactoryCachedBuild", (CFStringRef)*MEMORY[0x1E4F19668]);
  if (!v5 || ([v4 isEqual:v5] & 1) == 0)
  {
    v6 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v11 = v5;
      __int16 v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_1D3174000, v6, OS_LOG_TYPE_DEFAULT, "Clearing hand cache (%@ -> %@)", buf, 0x16u);
    }

    v7 = (void *)sharedInstance_cache;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__CLKUIAnalogHandFactoryCache_sharedInstance__block_invoke_60;
    v8[3] = &unk_1E697BF48;
    id v9 = v4;
    [v7 removeAllImagesWithCompletion:v8];
  }
}

void __45__CLKUIAnalogHandFactoryCache_sharedInstance__block_invoke_60(uint64_t a1)
{
}

+ (void)purge
{
  id v2 = [a1 sharedInstance];
  [v2 removeAllImagesWithCompletion:0];
}

@end