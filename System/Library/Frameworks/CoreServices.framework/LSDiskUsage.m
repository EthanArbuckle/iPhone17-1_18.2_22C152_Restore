@interface LSDiskUsage
@end

@implementation LSDiskUsage

uint64_t __32___LSDiskUsage_encodeWithCoder___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 16) forKey:@"knownUsage"];
}

void __27___LSDiskUsage_staticUsage__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:@"static"];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __28___LSDiskUsage_dynamicUsage__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:@"dynamic"];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __38___LSDiskUsage_onDemandResourcesUsage__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:@"ODR"];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __27___LSDiskUsage_sharedUsage__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:@"shared"];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __42___LSDiskUsage_removeAllCachedUsageValues__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:@"static"];
  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  if (v2) {
    [*(id *)(*(void *)(a1 + 32) + 16) setObject:v2 forKeyedSubscript:@"static"];
  }
}

void __32___LSDiskUsage_debugDescription__block_invoke(uint64_t a1)
{
  id v2 = [NSString alloc];
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v2 initWithFormat:@"<%@ %p> { %@ }", v7, *(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __38___LSDiskUsage_Internal___serverQueue__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("Disk usage population queue", v2);
  v1 = (void *)+[_LSDiskUsage(Internal) _serverQueue]::result;
  +[_LSDiskUsage(Internal) _serverQueue]::result = (uint64_t)v0;
}

void __56___LSDiskUsage_Internal___fetchWithXPCConnection_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:@"dynamic"];
  if (v2)
  {
    id v5 = v2;
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:@"ODR"];
    if (v3)
    {
      uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:@"shared"];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4 == 0;
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }

    id v2 = v5;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void __38___LSDiskUsage_Private__propertyQueue__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("Disk usage property queue", v2);
  v1 = (void *)+[_LSDiskUsage(Private) propertyQueue]::result;
  +[_LSDiskUsage(Private) propertyQueue]::result = (uint64_t)v0;
}

void __48___LSDiskUsage_Private__mobileInstallationQueue__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("MobileInstallation callout queue for disk usage", v2);
  v1 = (void *)+[_LSDiskUsage(Private) mobileInstallationQueue]::result;
  +[_LSDiskUsage(Private) mobileInstallationQueue]::result = (uint64_t)v0;
}

void __78___LSDiskUsage_Private__usageFromMobileInstallationForBundleIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x18530F680]();
  v15[0] = @"DynamicDiskUsage";
  v15[1] = @"SharedDiskUsage";
  v16[0] = MEMORY[0x1E4F1CC38];
  v16[1] = MEMORY[0x1E4F1CC38];
  CFDictionaryRef v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v6 = (void *)softLinkMobileInstallationCopyDiskUsageForLaunchServices(*(const void **)(a1 + 32), v5);
  id v7 = v6;
  if (!v6
    || ([v6 objectForKeyedSubscript:*(void *)(a1 + 32)],
        v8 = objc_claimAutoreleasedReturnValue(),
        (v9 = v8) == 0))
  {
    v10 = 0;
    v11 = 0;
LABEL_7:
    v12 = _LSMakeNSErrorImpl(@"LSApplicationWorkspaceErrorDomain", 109, (uint64_t)"+[_LSDiskUsage(Private) usageFromMobileInstallationForBundleIdentifier:error:]_block_invoke", 319, 0);
    v3[2](v3, 0, v12);
    goto LABEL_8;
  }
  v10 = [v8 objectForKeyedSubscript:@"DynamicDiskUsage"];
  v11 = [v9 objectForKeyedSubscript:@"SharedDiskUsage"];

  if (!v10 || !v11) {
    goto LABEL_7;
  }
  v13[0] = @"dynamic";
  v13[1] = @"shared";
  v14[0] = v10;
  v14[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  ((void (**)(id, void *, void *))v3)[2](v3, v12, 0);
LABEL_8:
}

void __38___LSDiskUsage_Private__ODRConnection__block_invoke()
{
  id v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ECB642D0];
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.ondemandd.launchservices" options:4096];
  v1 = (void *)+[_LSDiskUsage(Private) ODRConnection]::result;
  +[_LSDiskUsage(Private) ODRConnection]::result = v0;

  [(id)+[_LSDiskUsage(Private) ODRConnection]::result setRemoteObjectInterface:v2];
  [(id)+[_LSDiskUsage(Private) ODRConnection]::result setInterruptionHandler:&__block_literal_global_140];
  [(id)+[_LSDiskUsage(Private) ODRConnection]::result resume];
}

void __38___LSDiskUsage_Private__ODRConnection__block_invoke_2()
{
  uint64_t v0 = _LSDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_182959000, v0, OS_LOG_TYPE_DEFAULT, "Unable to connect to ondemandd.", v1, 2u);
  }
}

void __59___LSDiskUsage_Private__ODRUsageForBundleIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 40) ODRConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59___LSDiskUsage_Private__ODRUsageForBundleIdentifier_error___block_invoke_2;
  v11[3] = &unk_1E522BD18;
  id v5 = v3;
  id v12 = v5;
  v6 = [v4 remoteObjectProxyWithErrorHandler:v11];

  uint64_t v7 = *(void *)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59___LSDiskUsage_Private__ODRUsageForBundleIdentifier_error___block_invoke_3;
  v9[3] = &unk_1E522E8F0;
  id v8 = v5;
  id v10 = v8;
  [v6 bytesUsedForApplicationWithBundleID:v7 replyBlock:v9];
}

uint64_t __59___LSDiskUsage_Private__ODRUsageForBundleIdentifier_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59___LSDiskUsage_Private__ODRUsageForBundleIdentifier_error___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [NSNumber numberWithInteger:a2];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __61___LSDiskUsage_Private__fetchServerSideWithConnection_error___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addEntriesFromDictionary:*(void *)(a1 + 40)];
}

void __50___LSDiskUsage_Private__fetchClientSideWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _LSDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    int v8 = 138412546;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_182959000, v4, OS_LOG_TYPE_DEFAULT, "Failed to get dynamic/ODR disk usage for app %@, error = %@", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __50___LSDiskUsage_Private__fetchClientSideWithError___block_invoke_144(void *a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [(id)objc_opt_class() propertyQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50___LSDiskUsage_Private__fetchClientSideWithError___block_invoke_2;
    v10[3] = &unk_1E522DCE8;
    v10[4] = a1[4];
    id v11 = v5;
    dispatch_barrier_async(v7, v10);

    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  }
  else
  {
    int v8 = _LSDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1[4] + 8);
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_182959000, v8, OS_LOG_TYPE_DEFAULT, "Failed to get dynamic/ODR disk usage for app %@, error = %@", buf, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
  }
}

uint64_t __50___LSDiskUsage_Private__fetchClientSideWithError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addEntriesFromDictionary:*(void *)(*(void *)(a1 + 40) + 16)];
}

@end