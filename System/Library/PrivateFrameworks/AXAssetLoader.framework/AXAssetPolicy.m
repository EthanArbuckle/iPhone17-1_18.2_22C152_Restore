@interface AXAssetPolicy
+ (id)policy;
- (AXAssetPolicy)init;
- (BOOL)_isAssetSupportedBasedOnCompatibilityVersion:(id)a3;
- (BOOL)_isAssetSupportedBasedOnMinMaxFormatVersion:(id)a3;
- (BOOL)daemonShouldDownloadInBackgroundIfNeeded;
- (BOOL)isAssetContentVersion:(id)a3 greatherThanInstalledAssets:(id)a4;
- (BOOL)isAssetSupported:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldCopyLocally;
- (BOOL)shouldUseProductionServerForInternalBuilds;
- (NSNumber)compatibilityVersion;
- (NSNumber)maxSupportedFormatVersion;
- (NSNumber)minSupportedFormatVersion;
- (NSString)assetType;
- (NSString)assetTypeSuffix;
- (NSString)launchActivityIdentifier;
- (double)downloadResourceTimeout;
- (double)downloadRetryInterval;
- (double)refreshRetryInterval;
- (double)updateCatalogTimeout;
- (double)updateInterval;
- (id)assetsToDownloadFromRefreshedAssets:(id)a3;
- (id)assetsToPurgeFromInstalledAssets:(id)a3;
- (id)description;
- (id)downloadOptionsForOperation:(unint64_t)a3 userInitiated:(BOOL)a4;
- (id)newAssetQuery;
- (unint64_t)hash;
- (void)setCompatibilityVersion:(id)a3;
- (void)setDaemonShouldDownloadInBackgroundIfNeeded:(BOOL)a3;
- (void)setDownloadResourceTimeout:(double)a3;
- (void)setDownloadRetryInterval:(double)a3;
- (void)setLaunchActivityIdentifier:(id)a3;
- (void)setMaxSupportedFormatVersion:(id)a3;
- (void)setMinSupportedFormatVersion:(id)a3;
- (void)setRefreshRetryInterval:(double)a3;
- (void)setUpdateCatalogTimeout:(double)a3;
- (void)setUpdateInterval:(double)a3;
@end

@implementation AXAssetPolicy

- (id)newAssetQuery
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2050000000;
  v3 = (void *)getMAAssetQueryClass_softClass;
  uint64_t v13 = getMAAssetQueryClass_softClass;
  if (!getMAAssetQueryClass_softClass)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __getMAAssetQueryClass_block_invoke;
    v9[3] = &unk_1E6C41EC8;
    v9[4] = &v10;
    __getMAAssetQueryClass_block_invoke((uint64_t)v9);
    v3 = (void *)v11[3];
  }
  v4 = v3;
  _Block_object_dispose(&v10, 8);
  id v5 = [v4 alloc];
  v6 = [(AXAssetPolicy *)self assetType];
  v7 = (void *)[v5 initWithType:v6];

  [v7 setDoNotBlockBeforeFirstUnlock:1];
  [v7 returnTypes:2];
  return v7;
}

- (NSString)assetTypeSuffix
{
  v3 = [(AXAssetPolicy *)self assetType];
  v4 = [v3 componentsSeparatedByString:@"."];
  id v5 = [v4 lastObject];

  if (![v5 length])
  {
    uint64_t v6 = [(AXAssetPolicy *)self assetType];

    id v5 = (void *)v6;
  }
  return (NSString *)v5;
}

- (id)downloadOptionsForOperation:(unint64_t)a3 userInitiated:(BOOL)a4
{
  BOOL v8 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2050000000;
  v11 = (void *)getMADownloadOptionsClass_softClass;
  uint64_t v21 = getMADownloadOptionsClass_softClass;
  if (!getMADownloadOptionsClass_softClass)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __getMADownloadOptionsClass_block_invoke;
    v17[3] = &unk_1E6C41EC8;
    v17[4] = &v18;
    __getMADownloadOptionsClass_block_invoke((uint64_t)v17, (uint64_t)a2, a3, a4, v4, v5, v6, v7, v16);
    v11 = (void *)v19[3];
  }
  uint64_t v12 = v11;
  _Block_object_dispose(&v18, 8);
  id v13 = objc_alloc_init(v12);
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_8;
    }
    [(AXAssetPolicy *)self downloadResourceTimeout];
  }
  else
  {
    [(AXAssetPolicy *)self updateCatalogTimeout];
  }
  [v13 setTimeoutIntervalForResource:(uint64_t)v14];
LABEL_8:
  if (v8)
  {
    [v13 setDiscretionary:0];
    [v13 setAllowsExpensiveAccess:1];
  }
  return v13;
}

- (double)updateCatalogTimeout
{
  return self->_updateCatalogTimeout;
}

+ (id)policy
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (AXAssetPolicy)init
{
  v5.receiver = self;
  v5.super_class = (Class)AXAssetPolicy;
  id v2 = [(AXAssetPolicy *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(AXAssetPolicy *)v2 setDownloadResourceTimeout:3600.0];
    [(AXAssetPolicy *)v3 setUpdateCatalogTimeout:90.0];
    [(AXAssetPolicy *)v3 setRefreshRetryInterval:3600.0];
    [(AXAssetPolicy *)v3 setDownloadRetryInterval:43200.0];
    [(AXAssetPolicy *)v3 setUpdateInterval:604800.0];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AXAssetPolicy;
  uint64_t v4 = [(AXAssetPolicy *)&v8 description];
  objc_super v5 = [(AXAssetPolicy *)self assetTypeSuffix];
  uint64_t v6 = [v3 stringWithFormat:@"%@ (assetType=%@)", v4, v5];

  return v6;
}

- (BOOL)shouldCopyLocally
{
  return 0;
}

- (BOOL)shouldUseProductionServerForInternalBuilds
{
  return 1;
}

- (BOOL)isAssetContentVersion:(id)a3 greatherThanInstalledAssets:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        unint64_t v12 = objc_msgSend(v5, "contentVersion", (void)v15);
        if (v12 < [v11 contentVersion])
        {
          BOOL v13 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_11:

  return v13;
}

- (BOOL)isAssetSupported:(id)a3
{
  id v4 = a3;
  if ([(AXAssetPolicy *)self _isAssetSupportedBasedOnCompatibilityVersion:v4])
  {
    BOOL v5 = [(AXAssetPolicy *)self _isAssetSupportedBasedOnMinMaxFormatVersion:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_isAssetSupportedBasedOnMinMaxFormatVersion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXAssetPolicy *)self minSupportedFormatVersion];
  if (v5
    && (id v6 = (void *)v5,
        unint64_t v7 = [v4 formatVersion],
        [(AXAssetPolicy *)self minSupportedFormatVersion],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        unint64_t v9 = [v8 unsignedIntegerValue],
        v8,
        v6,
        v7 < v9))
  {
    char v10 = 0;
  }
  else
  {
    uint64_t v11 = [(AXAssetPolicy *)self maxSupportedFormatVersion];
    if (v11)
    {
      unint64_t v12 = (void *)v11;
      unint64_t v13 = [v4 formatVersion];
      double v14 = [(AXAssetPolicy *)self maxSupportedFormatVersion];
      LOBYTE(v13) = v13 > [v14 unsignedIntegerValue];

      char v10 = v13 ^ 1;
    }
    else
    {
      char v10 = 1;
    }
  }

  return v10 & 1;
}

- (BOOL)_isAssetSupportedBasedOnCompatibilityVersion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXAssetPolicy *)self compatibilityVersion];
  if (v5)
  {
    unint64_t v6 = [v4 compatibilityVersion];
    unint64_t v7 = [(AXAssetPolicy *)self compatibilityVersion];
    BOOL v8 = v6 <= [v7 unsignedIntegerValue];
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (id)assetsToDownloadFromRefreshedAssets:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &__block_literal_global_2);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__AXAssetPolicy_assetsToDownloadFromRefreshedAssets___block_invoke_2;
  v9[3] = &unk_1E6C41F60;
  v9[4] = self;
  id v10 = v5;
  id v6 = v5;
  unint64_t v7 = objc_msgSend(v4, "ax_filteredArrayUsingBlock:", v9);

  return v7;
}

uint64_t __53__AXAssetPolicy_assetsToDownloadFromRefreshedAssets___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isInstalled];
}

uint64_t __53__AXAssetPolicy_assetsToDownloadFromRefreshedAssets___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isInstalled]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = [*(id *)(a1 + 32) shouldDownloadAsset:v3 withInstalledAssets:*(void *)(a1 + 40)];
  }

  return v4;
}

- (id)assetsToPurgeFromInstalledAssets:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v8)
  {
    id v17 = 0;
    long long v18 = v7;
    goto LABEL_17;
  }
  uint64_t v9 = v8;
  id v10 = 0;
  uint64_t v11 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v23 != v11) {
        objc_enumerationMutation(v7);
      }
      unint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      if ([(AXAssetPolicy *)self isAssetSupported:v13])
      {
        if (v10 && (unint64_t v14 = [v10 unsignedIntegerValue], v14 >= objc_msgSend(v13, "contentVersion")))
        {
          long long v16 = v6;
        }
        else
        {
          uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "contentVersion"));

          long long v16 = v6;
          id v10 = (void *)v15;
        }
      }
      else
      {
        long long v16 = v5;
      }
      [v16 addObject:v13];
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v9);

  if (v10)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __50__AXAssetPolicy_assetsToPurgeFromInstalledAssets___block_invoke;
    v20[3] = &unk_1E6C41FC0;
    id v17 = v10;
    id v21 = v17;
    objc_msgSend(v6, "ax_removeObjectsFromArrayUsingBlock:", v20);
    [v5 addObjectsFromArray:v6];
    long long v18 = v21;
LABEL_17:

    goto LABEL_19;
  }
  id v17 = 0;
LABEL_19:

  return v5;
}

BOOL __50__AXAssetPolicy_assetsToPurgeFromInstalledAssets___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 contentVersion];
  return v3 >= [*(id *)(a1 + 32) unsignedIntegerValue];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(AXAssetPolicy *)self assetType];
    id v6 = [v4 assetType];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  id v2 = [(AXAssetPolicy *)self assetType];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)daemonShouldDownloadInBackgroundIfNeeded
{
  return self->_daemonShouldDownloadInBackgroundIfNeeded;
}

- (void)setDaemonShouldDownloadInBackgroundIfNeeded:(BOOL)a3
{
  self->_daemonShouldDownloadInBackgroundIfNeeded = a3;
}

- (NSNumber)minSupportedFormatVersion
{
  return self->_minSupportedFormatVersion;
}

- (void)setMinSupportedFormatVersion:(id)a3
{
}

- (NSNumber)maxSupportedFormatVersion
{
  return self->_maxSupportedFormatVersion;
}

- (void)setMaxSupportedFormatVersion:(id)a3
{
}

- (NSNumber)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (void)setCompatibilityVersion:(id)a3
{
}

- (double)downloadResourceTimeout
{
  return self->_downloadResourceTimeout;
}

- (void)setDownloadResourceTimeout:(double)a3
{
  self->_downloadResourceTimeout = a3;
}

- (void)setUpdateCatalogTimeout:(double)a3
{
  self->_updateCatalogTimeout = a3;
}

- (double)refreshRetryInterval
{
  return self->_refreshRetryInterval;
}

- (void)setRefreshRetryInterval:(double)a3
{
  self->_refreshRetryInterval = a3;
}

- (double)downloadRetryInterval
{
  return self->_downloadRetryInterval;
}

- (void)setDownloadRetryInterval:(double)a3
{
  self->_downloadRetryInterval = a3;
}

- (NSString)launchActivityIdentifier
{
  return self->_launchActivityIdentifier;
}

- (void)setLaunchActivityIdentifier:(id)a3
{
}

- (double)updateInterval
{
  return self->_updateInterval;
}

- (void)setUpdateInterval:(double)a3
{
  self->_updateInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_compatibilityVersion, 0);
  objc_storeStrong((id *)&self->_maxSupportedFormatVersion, 0);
  objc_storeStrong((id *)&self->_minSupportedFormatVersion, 0);
}

- (NSString)assetType
{
  return 0;
}

@end