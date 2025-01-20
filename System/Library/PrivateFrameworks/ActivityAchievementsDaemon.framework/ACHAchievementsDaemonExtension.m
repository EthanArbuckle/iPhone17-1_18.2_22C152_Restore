@interface ACHAchievementsDaemonExtension
- (ACHAchievementsDaemonExtension)initWithDaemon:(id)a3 mobileAssetProvider:(id)a4;
- (int64_t)purgeSpaceForUrgency:(int)a3 volume:(id)a4;
- (int64_t)purgeableSpaceForUrgency:(int)a3 volume:(id)a4;
- (void)daemonReady:(id)a3;
@end

@implementation ACHAchievementsDaemonExtension

- (int64_t)purgeableSpaceForUrgency:(int)a3 volume:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if ([v6 isEqualToString:@"/private/var"])
  {
    if (a3 == 4) {
      int64_t v7 = [(ACHMobileAssetProvider *)self->_mobileAssetProvider downloadedAssetDiskUsageInBytes];
    }
    else {
      int64_t v7 = 0;
    }
    v8 = ACHLogAssets();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218240;
      int64_t v11 = v7;
      __int16 v12 = 1024;
      int v13 = a3;
      _os_log_impl(&dword_21F5DA000, v8, OS_LOG_TYPE_DEFAULT, "Returning purgable space %llu for urgency %d", (uint8_t *)&v10, 0x12u);
    }
  }
  else
  {
    v8 = ACHLogAssets();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      int64_t v11 = (int64_t)v6;
      _os_log_impl(&dword_21F5DA000, v8, OS_LOG_TYPE_DEFAULT, "No purgable space for requested volume %{public}@", (uint8_t *)&v10, 0xCu);
    }
    int64_t v7 = 0;
  }

  return v7;
}

- (ACHAchievementsDaemonExtension)initWithDaemon:(id)a3 mobileAssetProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ACHAchievementsDaemonExtension;
  v8 = [(ACHAchievementsDaemonExtension *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mobileAssetProvider, a4);
    [v6 registerDaemonReadyObserver:v9 queue:0];
  }

  return v9;
}

- (void)daemonReady:(id)a3
{
  id v4 = [a3 cacheDeleteCoordinator];
  [v4 registerCacheDeleteProvider:self];
}

- (int64_t)purgeSpaceForUrgency:(int)a3 volume:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if ([v6 isEqualToString:@"/private/var"])
  {
    if (a3 == 4) {
      int64_t v7 = [(ACHMobileAssetProvider *)self->_mobileAssetProvider purgeAllDownloadedAssets];
    }
    else {
      int64_t v7 = 0;
    }
    v8 = ACHLogAssets();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218240;
      int64_t v11 = v7;
      __int16 v12 = 1024;
      int v13 = a3;
      _os_log_impl(&dword_21F5DA000, v8, OS_LOG_TYPE_DEFAULT, "Returning purged space %llu for urgency %d", (uint8_t *)&v10, 0x12u);
    }
  }
  else
  {
    v8 = ACHLogAssets();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      int64_t v11 = (int64_t)v6;
      _os_log_impl(&dword_21F5DA000, v8, OS_LOG_TYPE_DEFAULT, "Nothing to purge for requested volume %{public}@", (uint8_t *)&v10, 0xCu);
    }
    int64_t v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end