@interface GKApplicationWorkspace
+ (id)defaultWorkspace;
+ (int64_t)getPlatformForBundleID:(id)a3;
- (id)applicationProxyForBundleID:(id)a3;
- (id)gameDescriptorsWithInstalledBundleVersionsForBundleIDs:(id)a3;
- (id)gameDescriptorsWithInstalledBundleVersionsForGameDescriptors:(id)a3;
- (id)openURL:(id)a3;
- (void)openICloudSettings;
- (void)openNewsApp;
- (void)openSoftwareUpdateSettings;
@end

@implementation GKApplicationWorkspace

- (id)applicationProxyForBundleID:(id)a3
{
  id v3 = a3;
  v4 = [[GKApplicationProxy alloc] initWithBundleID:v3];

  return v4;
}

+ (id)defaultWorkspace
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (id)openURL:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F223E0];
  id v4 = a3;
  v5 = [v3 defaultWorkspace];
  id v8 = 0;
  [v5 openSensitiveURL:v4 withOptions:0 error:&v8];

  id v6 = v8;

  return v6;
}

- (void)openICloudSettings
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C2D22000, a2, OS_LOG_TYPE_ERROR, "cannot openICloudSettings because of error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)openSoftwareUpdateSettings
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C2D22000, a2, OS_LOG_TYPE_ERROR, "cannot openSoftwareUpdateSettings because of error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)openNewsApp
{
  id v4 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://apple.news/puzzles"];
  id v3 = [(GKApplicationWorkspace *)self openURL:v4];
}

- (id)gameDescriptorsWithInstalledBundleVersionsForBundleIDs:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81__GKApplicationWorkspace_gameDescriptorsWithInstalledBundleVersionsForBundleIDs___block_invoke;
  v5[3] = &unk_1E646EF50;
  v5[4] = self;
  id v3 = [a3 _gkMapWithBlock:v5];

  return v3;
}

id __81__GKApplicationWorkspace_gameDescriptorsWithInstalledBundleVersionsForBundleIDs___block_invoke(uint64_t a1, void *a2)
{
  v23[4] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) applicationProxyForBundleID:v3];
  v5 = [v4 bundleVersion];
  id v6 = [v4 bundleShortVersion];
  uint64_t v7 = +[GKGameDescriptor stringForPlatform:](GKGameDescriptor, "stringForPlatform:", +[GKApplicationWorkspace getPlatformForBundleID:v3]);
  id v8 = (void *)v7;
  if (v5) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    v22[0] = @"bundle-id";
    v22[1] = @"bundle-version";
    v23[0] = v3;
    v23[1] = v5;
    v22[2] = @"short-bundle-version";
    v22[3] = @"platform";
    v23[2] = v6;
    v23[3] = v7;
    v10 = (void *)MEMORY[0x1E4F1C9E8];
    v11 = v23;
    v12 = v22;
    uint64_t v13 = 4;
    goto LABEL_11;
  }
  if (v5)
  {
    v20[0] = @"bundle-id";
    v20[1] = @"bundle-version";
    v21[0] = v3;
    v21[1] = v5;
    v20[2] = @"platform";
    v21[2] = v7;
    v10 = (void *)MEMORY[0x1E4F1C9E8];
    v11 = v21;
    v12 = v20;
LABEL_10:
    uint64_t v13 = 3;
    goto LABEL_11;
  }
  if (v6)
  {
    v18[0] = @"bundle-id";
    v18[1] = @"short-bundle-version";
    v19[0] = v3;
    v19[1] = v6;
    v18[2] = @"platform";
    v19[2] = v7;
    v10 = (void *)MEMORY[0x1E4F1C9E8];
    v11 = v19;
    v12 = v18;
    goto LABEL_10;
  }
  v16[0] = @"bundle-id";
  v16[1] = @"platform";
  v17[0] = v3;
  v17[1] = v7;
  v10 = (void *)MEMORY[0x1E4F1C9E8];
  v11 = v17;
  v12 = v16;
  uint64_t v13 = 2;
LABEL_11:
  v14 = [v10 dictionaryWithObjects:v11 forKeys:v12 count:v13];

  return v14;
}

- (id)gameDescriptorsWithInstalledBundleVersionsForGameDescriptors:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __87__GKApplicationWorkspace_gameDescriptorsWithInstalledBundleVersionsForGameDescriptors___block_invoke;
  v5[3] = &unk_1E64710E8;
  v5[4] = self;
  id v3 = [a3 _gkMapWithBlock:v5];

  return v3;
}

id __87__GKApplicationWorkspace_gameDescriptorsWithInstalledBundleVersionsForGameDescriptors___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[v3 mutableCopy];
  v5 = [v3 objectForKeyedSubscript:@"bundle-id"];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) applicationProxyForBundleID:v5];
    uint64_t v7 = [v6 bundleVersion];
    id v8 = [v6 bundleShortVersion];
    if (v7) {
      [v4 setObject:v7 forKeyedSubscript:@"bundle-version"];
    }
    if (v8) {
      [v4 setObject:v8 forKeyedSubscript:@"short-bundle-version"];
    }
  }

  return v4;
}

+ (int64_t)getPlatformForBundleID:(id)a3
{
  id v3 = [MEMORY[0x1E4F223F8] bundleRecordWithBundleIdentifier:a3 allowPlaceholder:0 error:0];
  if ([v3 platform] == 6 || objc_msgSend(v3, "platform") == 1)
  {
    int64_t v4 = 2;
  }
  else if ([v3 platform] == 2 || objc_msgSend(v3, "platform") == 7)
  {
    int64_t v4 = 1;
  }
  else if ([v3 platform] == 3 || objc_msgSend(v3, "platform") == 8)
  {
    int64_t v4 = 3;
  }
  else if ([v3 platform] == 4 || objc_msgSend(v3, "platform") == 9)
  {
    int64_t v4 = 4;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

@end