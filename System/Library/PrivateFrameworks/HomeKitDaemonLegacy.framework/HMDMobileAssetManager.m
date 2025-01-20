@interface HMDMobileAssetManager
- (BOOL)indexDownloaded;
- (HMDMobileAssetManager)init;
- (HMDMobileAssetManagerDelegate)delegate;
- (NSBackgroundActivityScheduler)scheduler;
- (OS_dispatch_queue)workQueue;
- (void)_downloadCatalogAndUpdateMetadataIfAble;
- (void)_downloadNewAsset:(id)a3 availableVersion:(unint64_t)a4 newVersion:(unint64_t)a5;
- (void)_handleMetadataAssetUpdated;
- (void)_installAvailableAsset:(id)a3 version:(unint64_t)a4;
- (void)_updateMetadata;
- (void)handleMetadataAssetUpdated;
- (void)purgeAllInstalledAssets;
- (void)setDelegate:(id)a3;
- (void)setIndexDownloaded:(BOOL)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation HMDMobileAssetManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSBackgroundActivityScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setIndexDownloaded:(BOOL)a3
{
  self->_indexDownloaded = a3;
}

- (BOOL)indexDownloaded
{
  return self->_indexDownloaded;
}

- (void)setDelegate:(id)a3
{
}

- (HMDMobileAssetManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDMobileAssetManagerDelegate *)WeakRetained;
}

- (void)_handleMetadataAssetUpdated
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDMobileAssetManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  v4 = (void *)[objc_alloc(MEMORY[0x1E4F77FB8]) initWithType:@"com.apple.MobileAsset.HomeKit"];
  uint64_t v5 = [v4 queryMetaDataSync];
  if (v5)
  {
    uint64_t v6 = v5;
    if (v5 == 2)
    {
      v7 = (void *)MEMORY[0x1D9452090]();
      v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = HMFGetLogIdentifier();
        int v16 = 138543362;
        uint64_t v17 = (uint64_t)v9;
        v10 = "%{public}@XML file not found. Need to download the catalog first.";
LABEL_12:
        _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v16, 0xCu);

        goto LABEL_13;
      }
      goto LABEL_13;
    }
    v11 = (void *)MEMORY[0x1D9452090]();
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      v14 = (void *)v13;
      if ((unint64_t)(v6 - 1) > 9) {
        v15 = @"MAQueryUnknownResult";
      }
      else {
        v15 = off_1E6A18AD8[v6 - 1];
      }
      int v16 = 138543618;
      uint64_t v17 = v13;
      __int16 v18 = 2112;
      v19 = v15;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to query the asset due to %@", (uint8_t *)&v16, 0x16u);
    }
  }
  else
  {
    if (![(HMDMobileAssetManager *)self indexDownloaded])
    {
      v7 = (void *)MEMORY[0x1D9452090]();
      v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = HMFGetLogIdentifier();
        int v16 = 138543362;
        uint64_t v17 = (uint64_t)v9;
        v10 = "%{public}@First time download or periodically update the mobile catalog and metadata asset.";
        goto LABEL_12;
      }
LABEL_13:

      [(HMDMobileAssetManager *)self _downloadCatalogAndUpdateMetadataIfAble];
      goto LABEL_17;
    }
    [(HMDMobileAssetManager *)self _updateMetadata];
  }
LABEL_17:
}

- (void)_downloadCatalogAndUpdateMetadataIfAble
{
  v3 = [(HMDMobileAssetManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  v4 = objc_opt_new();
  [v4 setDiscretionary:0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__HMDMobileAssetManager__downloadCatalogAndUpdateMetadataIfAble__block_invoke;
  v5[3] = &unk_1E6A18980;
  v5[4] = self;
  [MEMORY[0x1E4F77FB0] startCatalogDownload:@"com.apple.MobileAsset.HomeKit" options:v4 then:v5];
}

void __64__HMDMobileAssetManager__downloadCatalogAndUpdateMetadataIfAble__block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [*(id *)(a1 + 32) workQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__HMDMobileAssetManager__downloadCatalogAndUpdateMetadataIfAble__block_invoke_2;
  v5[3] = &unk_1E6A189D0;
  v5[4] = *(void *)(a1 + 32);
  void v5[5] = a2;
  dispatch_async(v4, v5);
}

void __64__HMDMobileAssetManager__downloadCatalogAndUpdateMetadataIfAble__block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 40))
  {
    v2 = (void *)MEMORY[0x1D9452090]();
    v3 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = HMFGetLogIdentifier();
      unint64_t v5 = *(void *)(a1 + 40) - 1;
      if (v5 > 0x1C) {
        uint64_t v6 = @"MADownloadUnknownResult";
      }
      else {
        uint64_t v6 = off_1E6A189F0[v5];
      }
      v8 = v6;
      int v9 = 138543618;
      v10 = v4;
      __int16 v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_1D49D5000, v3, OS_LOG_TYPE_ERROR, "%{public}@Failed to download the cataloag due to %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    [v7 _updateMetadata];
  }
}

- (void)_updateMetadata
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDMobileAssetManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  v4 = (void *)[objc_alloc(MEMORY[0x1E4F77FB8]) initWithType:@"com.apple.MobileAsset.HomeKit"];
  [v4 queryMetaDataSync];
  unint64_t v5 = [v4 results];
  if ([v5 count])
  {
    v37 = v4;
    v35 = self;
    [(HMDMobileAssetManager *)self setIndexDownloaded:1];
    v40 = +[HMDHAPMetadata getSharedInstance];
    uint64_t v6 = [v40 version];
    unint64_t v7 = [v6 unsignedIntegerValue];

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v36 = v5;
    id obj = v5;
    uint64_t v45 = [obj countByEnumeratingWithState:&v49 objects:v65 count:16];
    if (!v45)
    {
      v39 = 0;
      unint64_t v46 = 0;
      v38 = 0;
      goto LABEL_32;
    }
    v39 = 0;
    unint64_t v46 = 0;
    v38 = 0;
    uint64_t v44 = *(void *)v50;
    uint64_t v43 = *MEMORY[0x1E4F77F18];
    uint64_t v8 = *MEMORY[0x1E4F77F20];
    uint64_t v42 = *MEMORY[0x1E4F77F20];
    while (1)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v50 != v44) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v49 + 1) + 8 * v9);
        __int16 v11 = [v10 attributes];
        v12 = [v11 objectForKeyedSubscript:v43];
        int v13 = [v12 intValue];

        v14 = [v10 attributes];
        v15 = [v14 objectForKeyedSubscript:v8];
        unint64_t v16 = (int)[v15 intValue];

        uint64_t v17 = (void *)MEMORY[0x1D9452090]();
        __int16 v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v19 = HMFGetLogIdentifier();
          uint64_t v20 = [v10 state];
          v21 = [v40 version];
          *(_DWORD *)buf = 138544642;
          v54 = v19;
          __int16 v55 = 2048;
          uint64_t v56 = v20;
          __int16 v57 = 2048;
          unint64_t v58 = v16;
          __int16 v59 = 2112;
          v60 = v21;
          __int16 v61 = 2048;
          unint64_t v62 = v7;
          __int16 v63 = 2048;
          unint64_t v64 = v46;
          _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Asset (state %ld  Version %ld)  Current version %@  best installed version %ld  best not installed version %ld", buf, 0x3Eu);

          uint64_t v8 = v42;
        }

        if (v13 == 1)
        {
          if ([v10 state] == 2)
          {
            if (v7 >= v16) {
              goto LABEL_23;
            }
            id v22 = v10;
            if (v46 <= v16)
            {

              id v23 = 0;
              unint64_t v46 = 0;
            }
            else
            {
              id v23 = v39;
            }
            v24 = v38;
            if (v38)
            {
              v25 = [v38 attributes];
              v26 = [v25 objectForKeyedSubscript:v8];

              v27 = (void *)MEMORY[0x1D9452090]();
              v28 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                v29 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v54 = v29;
                __int16 v55 = 2112;
                uint64_t v56 = (uint64_t)v26;
                _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Requesting purge of asset with version %@", buf, 0x16u);

                uint64_t v8 = v42;
              }

              v47[0] = MEMORY[0x1E4F143A8];
              v47[1] = 3221225472;
              v47[2] = __40__HMDMobileAssetManager__updateMetadata__block_invoke;
              v47[3] = &unk_1E6A18980;
              id v48 = v26;
              id v30 = v26;
              [v38 purge:v47];

              v38 = v22;
              unint64_t v7 = v16;
              goto LABEL_22;
            }
            v39 = v23;
            v38 = v22;
            unint64_t v7 = v16;
          }
          else if (v46 < v16 && v7 < v16)
          {
            id v23 = v10;
            unint64_t v46 = v16;
            v24 = v39;
LABEL_22:

            v39 = v23;
          }
        }
LABEL_23:
        ++v9;
      }
      while (v45 != v9);
      uint64_t v31 = [obj countByEnumeratingWithState:&v49 objects:v65 count:16];
      uint64_t v45 = v31;
      if (!v31)
      {
LABEL_32:

        [(HMDMobileAssetManager *)v35 _downloadNewAsset:v39 availableVersion:v7 newVersion:v46];
        [(HMDMobileAssetManager *)v35 _installAvailableAsset:v38 version:v7];

        unint64_t v5 = v36;
        v4 = v37;
        goto LABEL_33;
      }
    }
  }
  v32 = (void *)MEMORY[0x1D9452090]();
  v33 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v54 = v34;
    _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@Empty results for asset update query", buf, 0xCu);
  }
LABEL_33:
}

void __40__HMDMobileAssetManager__updateMetadata__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1D9452090]();
  unint64_t v5 = HMFGetOSLogHandle();
  uint64_t v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 32);
      int v13 = 138543618;
      v14 = v7;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      uint64_t v9 = "%{public}@Failed to purge the asset with version %@";
      v10 = v6;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v10, v11, v9, (uint8_t *)&v13, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unint64_t v7 = HMFGetLogIdentifier();
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = 138543618;
    v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v12;
    uint64_t v9 = "%{public}@Asset with version %@ purged";
    v10 = v6;
    os_log_type_t v11 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }
}

- (void)_installAvailableAsset:(id)a3 version:(unint64_t)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [(HMDMobileAssetManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    uint64_t v8 = +[HMDHAPMetadata getSharedInstance];
    uint64_t v9 = [v6 getLocalFileUrl];
    v10 = (void *)MEMORY[0x1D9452090]();
    os_log_type_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v13 = [v8 version];
      v14 = [v9 path];
      int v21 = 138544130;
      id v22 = v12;
      __int16 v23 = 2112;
      v24 = v13;
      __int16 v25 = 2048;
      unint64_t v26 = a4;
      __int16 v27 = 2112;
      v28 = v14;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Current version: %@,  Best installed asset version: %ld,  path: %@", (uint8_t *)&v21, 0x2Au);
    }
    __int16 v15 = [v9 URLByAppendingPathComponent:@"plain-metadata.config"];
    uint64_t v16 = (void *)MEMORY[0x1D9452090]();
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      __int16 v18 = HMFGetLogIdentifier();
      int v21 = 138543618;
      id v22 = v18;
      __int16 v23 = 2112;
      v24 = v15;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Trying to update metadata in URL %@ from mobile asset.", (uint8_t *)&v21, 0x16u);
    }
    if (v15)
    {
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v15];
      uint64_t v20 = [(HMDMobileAssetManager *)self delegate];
      [v20 mobileAssetManager:self didReceiveMetadata:v19];
    }
  }
}

- (void)_downloadNewAsset:(id)a3 availableVersion:(unint64_t)a4 newVersion:(unint64_t)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [(HMDMobileAssetManager *)self workQueue];
  dispatch_assert_queue_V2(v9);

  if (v8)
  {
    v10 = +[HMDHAPMetadata getSharedInstance];
    os_log_type_t v11 = (void *)MEMORY[0x1D9452090]();
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = HMFGetLogIdentifier();
      v14 = [v10 version];
      *(_DWORD *)buf = 138544130;
      uint64_t v20 = v13;
      __int16 v21 = 2112;
      id v22 = v14;
      __int16 v23 = 2048;
      unint64_t v24 = a4;
      __int16 v25 = 2048;
      unint64_t v26 = a5;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Current version %@  best installed version %ld  best not installed version %ld - requesting download", buf, 0x2Au);
    }
    id v15 = objc_alloc_init(MEMORY[0x1E4F77FE8]);
    [v15 setDiscretionary:0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __71__HMDMobileAssetManager__downloadNewAsset_availableVersion_newVersion___block_invoke;
    v16[3] = &unk_1E6A189A8;
    unint64_t v18 = a5;
    id v17 = v8;
    [v17 startDownload:v15 then:v16];
  }
}

void __71__HMDMobileAssetManager__downloadNewAsset_availableVersion_newVersion___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1D9452090]();
  unint64_t v5 = HMFGetOSLogHandle();
  id v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      unint64_t v7 = HMFGetLogIdentifier();
      if (a2 > 0x1D) {
        id v8 = @"MADownloadUnknownResult";
      }
      else {
        id v8 = off_1E6A189F0[a2 - 1];
      }
      os_log_type_t v11 = v8;
      int v12 = 138543618;
      int v13 = v7;
      __int16 v14 = 2112;
      id v15 = v11;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Asset download failed with result %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    v10 = *(__CFString **)(a1 + 40);
    int v12 = 138543618;
    int v13 = v9;
    __int16 v14 = 2048;
    id v15 = v10;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully download the new asset %ld", (uint8_t *)&v12, 0x16u);
  }
}

- (void)handleMetadataAssetUpdated
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    unint64_t v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Asset installed/updated - processing", buf, 0xCu);
  }
  id v6 = [(HMDMobileAssetManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__HMDMobileAssetManager_handleMetadataAssetUpdated__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v6, block);
}

uint64_t __51__HMDMobileAssetManager_handleMetadataAssetUpdated__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleMetadataAssetUpdated];
}

- (void)purgeAllInstalledAssets
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F77FB8]) initWithType:@"com.apple.MobileAsset.HomeKit"];
  [v2 returnTypes:2];
  if (![v2 queryMetaDataSync])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v15 = v2;
    id obj = [v2 results];
    uint64_t v3 = [obj countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v20;
      uint64_t v6 = *MEMORY[0x1E4F77F20];
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v20 != v5) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v9 = [v8 attributes];
          uint64_t v10 = [v9 objectForKeyedSubscript:v6];

          os_log_type_t v11 = (void *)MEMORY[0x1D9452090]();
          int v12 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            int v13 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            unint64_t v24 = v13;
            __int16 v25 = 2112;
            unint64_t v26 = v10;
            _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Requesting purge of asset with version %@", buf, 0x16u);
          }
          v17[0] = MEMORY[0x1E4F143A8];
          v17[1] = 3221225472;
          v17[2] = __48__HMDMobileAssetManager_purgeAllInstalledAssets__block_invoke;
          v17[3] = &unk_1E6A18980;
          id v18 = v10;
          id v14 = v10;
          [v8 purge:v17];
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v4);
    }

    v2 = v15;
  }
}

void __48__HMDMobileAssetManager_purgeAllInstalledAssets__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1D9452090]();
  uint64_t v5 = HMFGetOSLogHandle();
  uint64_t v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 32);
      int v13 = 138543618;
      id v14 = v7;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      uint64_t v9 = "%{public}@Failed to purge the asset with version %@";
      uint64_t v10 = v6;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v10, v11, v9, (uint8_t *)&v13, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unint64_t v7 = HMFGetLogIdentifier();
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = 138543618;
    id v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v12;
    uint64_t v9 = "%{public}@Asset with version %@ purged successfully";
    uint64_t v10 = v6;
    os_log_type_t v11 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }
}

- (HMDMobileAssetManager)init
{
  v19.receiver = self;
  v19.super_class = (Class)HMDMobileAssetManager;
  v2 = [(HMDMobileAssetManager *)&v19 init];
  if (v2)
  {
    uint64_t v3 = (const char *)HMFDispatchQueueName();
    uint64_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v5 = dispatch_get_global_queue(9, 0);
    dispatch_queue_t v6 = dispatch_queue_create_with_target_V2(v3, v4, v5);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F28B38]) initWithIdentifier:@"com.apple.homed.HMDMobileAssetManager.BackgroundActivityScheduler"];
    scheduler = v2->_scheduler;
    v2->_scheduler = (NSBackgroundActivityScheduler *)v8;

    [(NSBackgroundActivityScheduler *)v2->_scheduler setRepeats:1];
    uint64_t v10 = [MEMORY[0x1E4F65530] sharedPreferences];
    os_log_type_t v11 = [v10 preferenceForKey:@"mobileCatalogUpdatePeriodSeconds"];
    uint64_t v12 = [v11 numberValue];

    if (v12) {
      double v13 = (double)[v12 integerValue];
    }
    else {
      double v13 = 86400.0;
    }
    [(NSBackgroundActivityScheduler *)v2->_scheduler setInterval:v13];
    objc_initWeak(&location, v2);
    id v14 = v2->_scheduler;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __29__HMDMobileAssetManager_init__block_invoke;
    v16[3] = &unk_1E6A18958;
    objc_copyWeak(&v17, &location);
    [(NSBackgroundActivityScheduler *)v14 scheduleWithBlock:v16];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __29__HMDMobileAssetManager_init__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  uint64_t v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleMetadataAssetUpdated];
  v3[2](v3, 1);
}

@end