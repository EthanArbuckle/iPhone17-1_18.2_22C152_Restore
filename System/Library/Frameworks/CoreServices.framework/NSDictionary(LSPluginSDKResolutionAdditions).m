@interface NSDictionary(LSPluginSDKResolutionAdditions)
- (id)ls_resolvePlugInKitInfoPlistWithDictionary:()LSPluginSDKResolutionAdditions;
@end

@implementation NSDictionary(LSPluginSDKResolutionAdditions)

- (id)ls_resolvePlugInKitInfoPlistWithDictionary:()LSPluginSDKResolutionAdditions
{
  id v4 = a3;
  v5 = (void *)[a1 mutableCopy];
  if (![v4 count])
  {
    v6 = _LSDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(NSDictionary(LSPluginSDKResolutionAdditions) *)(uint64_t)a1 ls_resolvePlugInKitInfoPlistWithDictionary:v6];
    }
  }
  [v5 removeObjectForKey:@"NSExtensionSandboxProfile"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __91__NSDictionary_LSPluginSDKResolutionAdditions__ls_resolvePlugInKitInfoPlistWithDictionary___block_invoke;
  v12[3] = &unk_1E522CFA0;
  id v7 = v5;
  id v13 = v7;
  id v14 = v4;
  id v8 = v4;
  [v8 enumerateKeysAndObjectsUsingBlock:v12];
  v9 = v14;
  id v10 = v7;

  return v10;
}

- (void)ls_resolvePlugInKitInfoPlistWithDictionary:()LSPluginSDKResolutionAdditions .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_182959000, log, OS_LOG_TYPE_ERROR, "Attempting to merge SDK dictionary into PlugInKit plist %@ but SDK is %@", (uint8_t *)&v3, 0x16u);
}

@end