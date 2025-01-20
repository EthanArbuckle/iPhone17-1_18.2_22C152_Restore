@interface AXUpdateAssetTask
- (AXUpdateAssetTask)initWithPolicy:(id)a3 context:(id)a4;
- (void)_housekeeping_op1_refreshAssets;
- (void)_housekeeping_op2_purgeAssets:(id)a3;
- (void)_housekeeping_op3_downloadAssets:(id)a3;
- (void)assetController:(id)a3 asset:(id)a4 downloadProgressTotalWritten:(int64_t)a5 totalExpected:(int64_t)a6 isStalled:(BOOL)a7 expectedTimeRemaining:(double)a8;
- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7;
- (void)assetController:(id)a3 didFinishPurgingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6;
- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6;
@end

@implementation AXUpdateAssetTask

- (AXUpdateAssetTask)initWithPolicy:(id)a3 context:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000F2EC;
  v10[3] = &unk_100020CC8;
  id v11 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXUpdateAssetTask;
  id v6 = v11;
  v7 = [(AXManagedAssetTask *)&v9 initWithName:@"Update Assets" policy:v6 context:a4 block:v10];

  return v7;
}

- (void)_housekeeping_op1_refreshAssets
{
  v3 = [(AXUpdateAssetTask *)self _restorationState];
  unsigned int v4 = [v3 hasCompletedRefreshingAssets];

  v5 = AXLogAssetDaemon();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_DWORD *)buf = 138412290;
      v13 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Restoration state: 'hasCompletedRefreshingAssets'. Moving on to next step", buf, 0xCu);
    }
  }
  else
  {
    if (v6)
    {
      v7 = [(AXManagedAssetTask *)self restorationState];
      *(_DWORD *)buf = 138412546;
      v13 = self;
      __int16 v14 = 2112;
      v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: About to refresh assets. Restoration: %@", buf, 0x16u);
    }
    v5 = [(AXManagedAssetTask *)self restorationState];
    v8 = +[AXAssetMetadataStore store];
    [v5 updatePhase:@"Refreshing Assets" saveToStore:v8];
  }
  objc_initWeak((id *)buf, self);
  objc_super v9 = [(AXManagedAssetTask *)self assetController];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000F624;
  v10[3] = &unk_100020CF0;
  objc_copyWeak(&v11, (id *)buf);
  void v10[4] = self;
  [v9 refreshAssetsByForceUpdatingCatalog:v4 ^ 1 updatingCatalogIfNeeded:v4 ^ 1 catalogRefreshOverrideTimeout:&off_100021A58 completion:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (void)_housekeeping_op2_purgeAssets:(id)a3
{
  id v23 = a3;
  val = self;
  unsigned int v4 = [(AXUpdateAssetTask *)self _restorationState];
  unsigned int v5 = [v4 hasCompletedPurgingAssets];

  if (v5)
  {
    BOOL v6 = AXLogAssetDaemon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: Restoration state: 'hasCompletedPurgingAssets'. Moving on to next step", buf, 0xCu);
    }

    [(AXUpdateAssetTask *)self _housekeeping_op3_downloadAssets:v23];
  }
  else
  {
    objc_initWeak(&location, self);
    v7 = AXLogAssetDaemon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(AXManagedAssetTask *)self restorationState];
      *(_DWORD *)buf = 138412546;
      v35 = self;
      __int16 v36 = 2112;
      v37 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: About to purge installed assets. Restoration: %@", buf, 0x16u);
    }
    objc_super v9 = [(AXManagedAssetTask *)self restorationState];
    v10 = +[AXAssetMetadataStore store];
    [v9 updatePhase:@"Purging Assets" saveToStore:v10];

    v21 = +[AXAsset installedAssets:v23];
    id v11 = [(AXManagedAssetTask *)self policy];
    v22 = [v11 assetsToPurgeFromInstalledAssets:v21 withRefreshedAssets:v23];

    if ([v22 count])
    {
      v12 = AXLogAssetDaemon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = self;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@: Assets that will be purged", buf, 0xCu);
      }

      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v13 = v22;
      id v14 = [v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v29;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v29 != v15) {
              objc_enumerationMutation(v13);
            }
            v17 = *(AXUpdateAssetTask **)(*((void *)&v28 + 1) + 8 * i);
            v18 = AXLogAssetDaemon();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v35 = v17;
              __int16 v36 = 2112;
              v37 = val;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@:   %@", buf, 0x16u);
            }
          }
          id v14 = [v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v14);
      }

      v19 = [(AXManagedAssetTask *)val assetController];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10000FD40;
      v25[3] = &unk_100020CF0;
      objc_copyWeak(&v27, &location);
      id v26 = v23;
      [v19 purgeAssets:v13 completion:v25];

      objc_destroyWeak(&v27);
    }
    else
    {
      v20 = AXLogAssetDaemon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = self;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@: No assets found that need to be purged", buf, 0xCu);
      }

      [(AXUpdateAssetTask *)self _housekeeping_op3_downloadAssets:v23];
    }

    objc_destroyWeak(&location);
  }
}

- (void)_housekeeping_op3_downloadAssets:(id)a3
{
  id v41 = a3;
  val = self;
  unsigned int v4 = [(AXManagedAssetTask *)self policy];
  unsigned __int8 v5 = [v4 daemonShouldDownloadInBackgroundIfNeeded];

  BOOL v6 = AXLogAssetDaemon();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v8 = [(AXManagedAssetTask *)self restorationState];
      *(_DWORD *)buf = 138412546;
      v56 = self;
      __int16 v57 = 2112;
      v58 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: About to kick off downloadable assets. Restoration: %@", buf, 0x16u);
    }
    objc_super v9 = [(AXManagedAssetTask *)self restorationState];
    v10 = +[AXAssetMetadataStore store];
    [v9 updatePhase:@"Downloading Assets" saveToStore:v10];

    id v11 = AXLogAssetDaemon();
    LODWORD(v10) = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);

    if (v10)
    {
      v12 = AXLogAssetDaemon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_100015078(v12);
      }

      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v13 = v41;
      id v14 = [v13 countByEnumeratingWithState:&v49 objects:v54 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v50;
        do
        {
          v16 = 0;
          do
          {
            if (*(void *)v50 != v15) {
              objc_enumerationMutation(v13);
            }
            v17 = *(AXUpdateAssetTask **)(*((void *)&v49 + 1) + 8 * (void)v16);
            v18 = AXLogAssetDaemon();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v56 = v17;
              _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "  %@", buf, 0xCu);
            }

            v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          id v14 = [v13 countByEnumeratingWithState:&v49 objects:v54 count:16];
        }
        while (v14);
      }
    }
    v19 = [(AXManagedAssetTask *)val policy];
    v40 = [v19 assetsToDownloadFromRefreshedAssets:v41];

    if ([v40 count])
    {
      v20 = AXLogAssetDaemon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v56 = val;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@: Assets that will be downloaded", buf, 0xCu);
      }

      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v21 = v40;
      id v22 = [v21 countByEnumeratingWithState:&v45 objects:v53 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v46;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v46 != v23) {
              objc_enumerationMutation(v21);
            }
            v25 = *(AXUpdateAssetTask **)(*((void *)&v45 + 1) + 8 * i);
            id v26 = AXLogAssetDaemon();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v56 = v25;
              __int16 v57 = 2112;
              v58 = val;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%@:   %@", buf, 0x16u);
            }
          }
          id v22 = [v21 countByEnumeratingWithState:&v45 objects:v53 count:16];
        }
        while (v22);
      }

      objc_initWeak((id *)buf, val);
      id v27 = [(AXManagedAssetTask *)val assetController];
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_1000104D4;
      v43[3] = &unk_100020D18;
      objc_copyWeak(&v44, (id *)buf);
      [v27 downloadAssets:v21 successStartBlock:v43];

      objc_destroyWeak(&v44);
      objc_destroyWeak((id *)buf);
LABEL_42:

      goto LABEL_43;
    }
    long long v28 = [v41 firstObject];
    long long v29 = [v28 properties];
    long long v30 = [v29 objectForKeyedSubscript:kTTSResourceBuildKey];

    long long v31 = [(AXManagedAssetTask *)val policy];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v32 = +[TTSAXResourceManager sharedInstance];
      v33 = [v32 catalogBuildVersion];
      unsigned __int8 v34 = [(AXUpdateAssetTask *)v30 isEqualToString:v33];

      if (v34)
      {
LABEL_39:
        v39 = AXLogAssetDaemon();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v56 = val;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%@: No assets found that need to be downloaded", buf, 0xCu);
        }

        [(AXManagedAssetTask *)val _completeWithResult:0];
        goto LABEL_42;
      }
      v35 = AXLogAssetDaemon();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v56 = val;
        __int16 v57 = 2112;
        v58 = v30;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%@: No new assets to download and build numbers didn't match, refreshing resource cache and updating build number %@", buf, 0x16u);
      }

      __int16 v36 = +[TTSAXResourceManager sharedInstance];
      [v36 updateCatalogBuildVersion:v30];

      v37 = +[TTSAXResourceManager sharedInstance];
      id v38 = [v37 refreshResourcesCacheForManagerType:1];

      long long v31 = +[TTSAXResourceManager sharedInstance];
      [v31 downloadSamplesIfNecessary];
    }

    goto LABEL_39;
  }
  if (v7)
  {
    *(_DWORD *)buf = 138412290;
    v56 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: Honoring asset policy to not proceed with downloads", buf, 0xCu);
  }

  [(AXManagedAssetTask *)self _completeWithResult:0];
LABEL_43:
}

- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  id v8 = a6;
  objc_super v9 = AXLogAssetDaemon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412802;
    id v11 = self;
    __int16 v12 = 2048;
    BOOL v13 = v6;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: didFinishRefreshingAssets. success:%ld error:%@", (uint8_t *)&v10, 0x20u);
  }
}

- (void)assetController:(id)a3 didFinishPurgingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  id v8 = a6;
  objc_super v9 = AXLogAssetDaemon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412802;
    id v11 = self;
    __int16 v12 = 2048;
    BOOL v13 = v6;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: didFinishPurgingAssets. success:%ld error:%@", (uint8_t *)&v10, 0x20u);
  }
}

- (void)assetController:(id)a3 asset:(id)a4 downloadProgressTotalWritten:(int64_t)a5 totalExpected:(int64_t)a6 isStalled:(BOOL)a7 expectedTimeRemaining:(double)a8
{
  BOOL v8 = a7;
  id v12 = a4;
  BOOL v13 = AXLogAssetDaemon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138413314;
    id v15 = self;
    __int16 v16 = 2048;
    int64_t v17 = a5;
    __int16 v18 = 2048;
    int64_t v19 = a6;
    __int16 v20 = 2048;
    BOOL v21 = v8;
    __int16 v22 = 2112;
    id v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@: Asset D/L progress: %lld / %lld. stalled: %ld. asset: %@", (uint8_t *)&v14, 0x34u);
  }
}

- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7
{
  BOOL v8 = a5;
  id v10 = a4;
  id v11 = a6;
  id v12 = AXLogAssetDaemon();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v13)
    {
      int v17 = 138412546;
      __int16 v18 = self;
      __int16 v19 = 2112;
      id v20 = v10;
      int v14 = "%@: Asset download finished: %@";
      id v15 = v12;
      uint32_t v16 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v17, v16);
    }
  }
  else if (v13)
  {
    int v17 = 138412802;
    __int16 v18 = self;
    __int16 v19 = 2112;
    id v20 = v10;
    __int16 v21 = 2112;
    id v22 = v11;
    int v14 = "%@: Asset download failed: %@ - %@";
    id v15 = v12;
    uint32_t v16 = 32;
    goto LABEL_6;
  }
}

@end