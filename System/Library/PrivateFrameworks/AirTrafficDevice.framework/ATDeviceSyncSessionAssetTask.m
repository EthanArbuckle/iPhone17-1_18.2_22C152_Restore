@interface ATDeviceSyncSessionAssetTask
- (ATDeviceSyncSessionAssetTask)initWithDataClass:(id)a3 onMessageLink:(id)a4;
- (id)_getMetricsWithCurrentProgressForInflightAssetsFromAssetMetrics:(id)a3;
- (id)_getRawInstalledAssetMetricsFromAssetClient;
- (id)_prepareInstalledAssetMetricsWithSerializedOutputFromClientMetrics:(id)a3;
- (id)_serializedAssetRequestsFromRequestDictionary:(id)a3;
- (id)_serializedAssetSyncProgressFromAssetCacheDictionary:(id)a3;
- (id)_serializedAssetsToDownloadDictionaryWithUpdatedProgressFromDownloadDictionary:(id)a3;
- (id)_serializedDownloadedAssetsDictionaryFromDownloadedAssetsDictionary:(id)a3;
- (id)_updateProgressAndGetFileProgressParamsForAsset:(id)a3;
- (id)sessionGroupingKey;
- (unint64_t)_bytesDownloadedForAsset:(id)a3;
- (void)_assetRequestsCompletedWithError:(id)a3;
- (void)_finishTaskWithError:(id)a3;
- (void)_handleAssetDownloadProgressed:(id)a3 onMessageLink:(id)a4;
- (void)_handleAssetRequest:(id)a3 onMessagLink:(id)a4;
- (void)_handleBeginAssetTaskRequest:(id)a3 onMessagLink:(id)a4;
- (void)_handleEndAssetTaskRequest:(id)a3 onMessagLink:(id)a4;
- (void)_handleFinishedAsset:(id)a3;
- (void)_handleInstalledAssetMetricsChanged:(id)a3 onMessageLink:(id)a4;
- (void)_handleUpdateSessionTaskRequest:(id)a3 onMessageLink:(id)a4;
- (void)_handleUpdatedAsset:(id)a3;
- (void)_loadInstalledAssetMetricsFromSyncClient;
- (void)_removeAssetFromProgressMap:(id)a3;
- (void)_sendUpdatedInstallMetrics;
- (void)_shouldDeviceReportSyncProgress;
- (void)_updateCachedInstalledAssetMetricsWithNewMetrics:(id)a3;
- (void)_updateDetailedProgressForCompletedAsset:(id)a3;
- (void)_updateProgressWithBytesTransferred:(unint64_t)a3 forAsset:(id)a4;
- (void)_updateProperties;
- (void)_updateTaskDescription;
- (void)assetLinkController:(id)a3 didFinishAsset:(id)a4;
- (void)assetLinkController:(id)a3 didProcessFinishedAsset:(id)a4;
- (void)assetLinkController:(id)a3 didUpdateAsset:(id)a4;
- (void)cancel;
- (void)messageLink:(id)a3 didReceiveRequest:(id)a4;
- (void)start;
- (void)updateProgressWithCount:(unint64_t)a3 totalItemCount:(unint64_t)a4;
@end

@implementation ATDeviceSyncSessionAssetTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedAssets, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_progressMap, 0);
  objc_storeStrong((id *)&self->_assetToBytesMap, 0);
  objc_storeStrong((id *)&self->_throughputCalculator, 0);
  objc_storeStrong((id *)&self->_assetStreams, 0);
  objc_storeStrong((id *)&self->_itemsWithEstimatedFileSize, 0);
  objc_storeStrong((id *)&self->_installedAssetMetrics, 0);
  objc_storeStrong((id *)&self->_syncProgresByAssetType, 0);
  objc_storeStrong((id *)&self->_detailedProgress, 0);
  objc_storeStrong((id *)&self->_assetController, 0);
  objc_storeStrong((id *)&self->_serverAssetsInProgress, 0);
  objc_storeStrong((id *)&self->_clientAssetsInProgress, 0);
  objc_storeStrong((id *)&self->_clientAssetsRemaining, 0);

  objc_destroyWeak((id *)&self->_assetClient);
}

- (void)_shouldDeviceReportSyncProgress
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2050000000;
  v3 = (void *)getNRPairedDeviceRegistryClass_softClass;
  v21 = (void *)getNRPairedDeviceRegistryClass_softClass;
  if (!getNRPairedDeviceRegistryClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getNRPairedDeviceRegistryClass_block_invoke;
    *(void *)&buf[24] = &unk_1E6B88D48;
    v23 = &v18;
    __getNRPairedDeviceRegistryClass_block_invoke((uint64_t)buf);
    v3 = (void *)v19[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v18, 8);
  v5 = [v4 sharedInstance];
  v6 = [v5 getActivePairedDevice];

  if (v6)
  {
    id v7 = v6;
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    v8 = (uint64_t (*)(id))getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr;
    v21 = getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr;
    if (!getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getNRWatchOSVersionForRemoteDeviceSymbolLoc_block_invoke;
      *(void *)&buf[24] = &unk_1E6B88D48;
      v23 = &v18;
      v9 = NanoRegistryLibrary();
      v10 = dlsym(v9, "NRWatchOSVersionForRemoteDevice");
      *(void *)(v23[1] + 24) = v10;
      getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr = *(_UNKNOWN **)(v23[1] + 24);
      v8 = (uint64_t (*)(id))v19[3];
    }
    _Block_object_dispose(&v18, 8);
    if (!v8)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      v17 = [NSString stringWithUTF8String:"NRProductVersionWatchOS __ATDeviceSyncSessionAssetTaskNRWatchOSVersionForRemoteDevice(NRDevice *__strong)"];
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, @"ATDeviceSyncSessionAssetTask.m", 27, @"%s", dlerror());

      __break(1u);
    }
    unsigned int v11 = v8(v7);

    self->_BOOL deviceShouldReportSyncProgress = v11 < 0x40000;
  }
  else
  {
    v12 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = self;
      _os_log_impl(&dword_1D9A2D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Paired Sync Registry reports no active paired device", buf, 0xCu);
    }

    unsigned int v11 = -1;
  }
  v13 = _ATLogCategoryDeviceSync();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    BOOL deviceShouldReportSyncProgress = self->_deviceShouldReportSyncProgress;
    *(_DWORD *)buf = 138543874;
    if (deviceShouldReportSyncProgress) {
      v15 = "will";
    }
    else {
      v15 = "will not";
    }
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v11;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = v15;
    _os_log_impl(&dword_1D9A2D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Paired Device is running %u - companion %s report asset metrics", buf, 0x1Cu);
  }
}

- (void)_updateProgressWithBytesTransferred:(unint64_t)a3 forAsset:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([v6 assetParts])
  {
    id v7 = [(ATSessionTask *)self totalBytesTransferred];
    uint64_t v8 = [v7 unsignedLongLongValue];

    v9 = [(ATSessionTask *)self totalBytesToTransfer];
    unint64_t v10 = [v9 unsignedLongLongValue];

    if (v8 + a3 >= v10) {
      unint64_t v11 = v10;
    }
    else {
      unint64_t v11 = v8 + a3;
    }
    v12 = [v6 assetType];
    if (v12)
    {
      v13 = [(NSMutableDictionary *)self->_syncProgresByAssetType objectForKey:v12];
      v14 = v13;
      if (v13) {
        [v13 updateBytesDownloaded:a3];
      }
    }
    [(ATDeviceSyncSessionAssetTask *)self _updateProperties];
    v15 = [NSNumber numberWithUnsignedLongLong:v11];
    [(ATSessionTask *)self setTotalBytesTransferred:v15];

    if (v10) {
      double v16 = (double)v11 / (double)v10;
    }
    else {
      double v16 = 0.0;
    }
    [(ATSessionTask *)self setProgress:v16];
    v17 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      [(ATSessionTask *)self progress];
      int v19 = 134218752;
      unint64_t v20 = v10;
      __int16 v21 = 2048;
      unint64_t v22 = v11;
      __int16 v23 = 2048;
      uint64_t v24 = v18;
      __int16 v25 = 2048;
      unint64_t v26 = [(ATSessionTask *)self completedItemCount];
      _os_log_impl(&dword_1D9A2D000, v17, OS_LOG_TYPE_DEFAULT, "total bytes to transfer:%llu, bytes transferred so far:%llu, progress:%f, completed asset count:%lu", (uint8_t *)&v19, 0x2Au);
    }
  }
}

- (id)_updateProgressAndGetFileProgressParamsForAsset:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4 || ([v4 assetParts] & 1) == 0)
  {
    id v6 = 0;
    goto LABEL_25;
  }
  id v7 = [v5 identifier];
  uint64_t v8 = [v5 assetType];
  if (v8)
  {
    v9 = [(NSMutableDictionary *)self->_progressMap objectForKey:v8];
    if (!v9)
    {
      v9 = [MEMORY[0x1E4F1CA60] dictionary];
      [(NSMutableDictionary *)self->_progressMap setObject:v9 forKey:v8];
    }
    uint64_t v10 = [v5 totalBytes];
    unint64_t v11 = v10;
    if (!v10)
    {
      itemsWithEstimatedFileSize = self->_itemsWithEstimatedFileSize;
      v13 = [v5 identifier];
      v14 = [(NSDictionary *)itemsWithEstimatedFileSize objectForKey:v13];

      unint64_t v11 = [v14 unsignedLongLongValue];
    }
    v15 = [v9 objectForKey:v7];
    unint64_t v16 = [v15 unsignedLongLongValue];

    unint64_t v17 = [v5 bytesRemaining];
    if (!v10)
    {
      if (v11 < v17)
      {
        uint64_t v18 = _ATLogCategoryDeviceSync();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = [v5 identifier];
          *(_DWORD *)buf = 138544130;
          v29 = self;
          __int16 v30 = 2048;
          unint64_t v31 = v11;
          __int16 v32 = 2114;
          v33 = v19;
          __int16 v34 = 2048;
          uint64_t v35 = [v5 bytesRemaining];
          _os_log_impl(&dword_1D9A2D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Undercalculated fileSize (%llu) for %{public}@ - bytesRemaining (%llu) ", buf, 0x2Au);
        }
        unint64_t v20 = v11;
        goto LABEL_17;
      }
      unint64_t v17 = [v5 bytesRemaining];
    }
    unint64_t v20 = v11 - v17;
LABEL_17:
    if (v20 >= v16) {
      unint64_t v21 = v20 - v16;
    }
    else {
      unint64_t v21 = 0;
    }
    if (!v16 || (id v6 = 0, v21 >= 0x40000))
    {
      unint64_t v22 = [NSNumber numberWithUnsignedLongLong:v20];
      [v9 setObject:v22 forKey:v7];

      __int16 v23 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v24 = [NSNumber numberWithUnsignedLongLong:v11];
      __int16 v25 = [NSNumber numberWithUnsignedLongLong:v21];
      unint64_t v26 = [NSNumber numberWithUnsignedLongLong:v20];
      id v6 = objc_msgSend(v23, "dictionaryWithObjectsAndKeys:", v24, @"FileSize", v25, @"AssetProgress", v26, @"ATBytesDownloadedForAsset", v8, @"AssetType", v7, @"ATLibraryIdentifierForAsset", 0);
    }
    goto LABEL_24;
  }
  id v6 = 0;
LABEL_24:

LABEL_25:

  return v6;
}

- (void)_removeAssetFromProgressMap:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 identifier];
    id v7 = [v5 assetType];
    if (v7)
    {
      uint64_t v8 = [(NSMutableDictionary *)self->_progressMap objectForKey:v7];
      if (v8)
      {
        v9 = _ATLogCategoryDeviceSync();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = [v5 shortDescription];
          int v11 = 138543618;
          v12 = self;
          __int16 v13 = 2114;
          v14 = v10;
          _os_log_impl(&dword_1D9A2D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Removed %{public}@ from our progress map", (uint8_t *)&v11, 0x16u);
        }
        [v8 removeObjectForKey:v6];
      }
    }
  }
}

- (unint64_t)_bytesDownloadedForAsset:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 identifier];
    id v7 = [v5 assetType];
    if (v7)
    {
      uint64_t v8 = [(NSMutableDictionary *)self->_progressMap objectForKey:v7];
      v9 = v8;
      if (v8)
      {
        uint64_t v10 = [v8 objectForKey:v6];
        unint64_t v11 = [v10 unsignedIntegerValue];
        v12 = _ATLogCategoryDeviceSync();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v13 = [v5 shortDescription];
          int v15 = 138543874;
          unint64_t v16 = self;
          __int16 v17 = 2048;
          unint64_t v18 = v11;
          __int16 v19 = 2114;
          unint64_t v20 = v13;
          _os_log_impl(&dword_1D9A2D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: %llu bytes have been reported downloaded for %{public}@", (uint8_t *)&v15, 0x20u);
        }
      }
      else
      {
        unint64_t v11 = 0;
      }
    }
    else
    {
      unint64_t v11 = 0;
    }
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

- (void)_loadInstalledAssetMetricsFromSyncClient
{
  id v8 = [(ATDeviceSyncSessionAssetTask *)self _getRawInstalledAssetMetricsFromAssetClient];
  v3 = [(ATDeviceSyncSessionAssetTask *)self _prepareInstalledAssetMetricsWithSerializedOutputFromClientMetrics:v8];
  installedAssetMetrics = self->_installedAssetMetrics;
  self->_installedAssetMetrics = v3;

  v5 = [(NSDictionary *)self->_installedAssetMetrics objectForKey:@"InstalledMediaAssetMetrics"];
  id v6 = [v5 objectForKey:@"ItemsWithEstimatedFileSize"];
  itemsWithEstimatedFileSize = self->_itemsWithEstimatedFileSize;
  self->_itemsWithEstimatedFileSize = v6;
}

- (id)_getRawInstalledAssetMetricsFromAssetClient
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetClient);
  id v4 = WeakRetained;
  if (!WeakRetained)
  {
    v5 = _ATLogCategoryDeviceSync();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    int v12 = 138543362;
    __int16 v13 = self;
    id v8 = "%{public}@: no ATAssetClient to get installed asset metrics";
LABEL_9:
    _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, 0xCu);
    goto LABEL_13;
  }
  if (![WeakRetained conformsToProtocol:&unk_1F33F05F0])
  {
    v5 = _ATLogCategoryDeviceSync();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    int v12 = 138543362;
    __int16 v13 = self;
    id v8 = "%{public}@: client doesn't conform to ATClient";
    goto LABEL_9;
  }
  v5 = v4;
  if (objc_opt_respondsToSelector())
  {
    id v6 = [v5 installedAssetMetrics];
    id v7 = [(ATDeviceSyncSessionAssetTask *)self _getMetricsWithCurrentProgressForInflightAssetsFromAssetMetrics:v6];

    goto LABEL_14;
  }
  v9 = _ATLogCategoryDeviceSync();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    __int16 v13 = self;
    _os_log_impl(&dword_1D9A2D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: client doesn't respond to selector", (uint8_t *)&v12, 0xCu);
  }

LABEL_13:
  id v7 = 0;
LABEL_14:

  uint64_t v10 = _ATLogCategoryDeviceSync_Oversize();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    __int16 v13 = self;
    __int16 v14 = 2114;
    int v15 = v7;
    _os_log_impl(&dword_1D9A2D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: raw installed asset metrics: %{public}@", (uint8_t *)&v12, 0x16u);
  }

  return v7;
}

- (id)_serializedDownloadedAssetsDictionaryFromDownloadedAssetsDictionary:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = objc_msgSend(v3, "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        unint64_t v11 = [v3 objectForKey:v10];
        int v12 = +[ATDetailedRequestInfoForAssetType serializedRequestInfoFromATDetailedRequestInfoForAssetType:v11];
        [v4 setObject:v12 forKey:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_serializedAssetsToDownloadDictionaryWithUpdatedProgressFromDownloadDictionary:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = objc_msgSend(v3, "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        unint64_t v11 = [v3 objectForKey:v10];
        int v12 = +[ATDetailedRequestInfoForAssetType serializedRequestInfoFromATDetailedRequestInfoForAssetType:v11];
        [v4 setObject:v12 forKey:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_getMetricsWithCurrentProgressForInflightAssetsFromAssetMetrics:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[a3 mutableCopy];
  id v4 = [v3 objectForKey:@"InstalledMediaAssetMetrics"];
  v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = [v5 objectForKey:@"DetailedRequestInfoByAssetType"];
  uint64_t v7 = (void *)[v6 mutableCopy];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  unint64_t v26 = v7;
  uint64_t v8 = [v7 allKeys];
  uint64_t v27 = [v8 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v27)
  {
    uint64_t v21 = v5;
    unint64_t v22 = v3;
    char v23 = 0;
    uint64_t v24 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v33 != v24) {
          objc_enumerationMutation(v8);
        }
        uint64_t v10 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        unint64_t v11 = objc_msgSend(v26, "objectForKey:", v10, v21);
        int v12 = [(NSMutableDictionary *)self->_progressMap objectForKey:v10];
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        __int16 v13 = [v12 allValues];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v40 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = 0;
          uint64_t v17 = *(void *)v29;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v29 != v17) {
                objc_enumerationMutation(v13);
              }
              v16 += [*(id *)(*((void *)&v28 + 1) + 8 * j) unsignedLongLongValue];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v40 count:16];
          }
          while (v15);
        }
        else
        {
          uint64_t v16 = 0;
        }

        uint64_t v19 = _ATLogCategoryDeviceSync();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          uint64_t v37 = v16;
          __int16 v38 = 2114;
          uint64_t v39 = v10;
          _os_log_impl(&dword_1D9A2D000, v19, OS_LOG_TYPE_DEFAULT, "Updating bytes downloaded to %llu for assetType %{public}@", buf, 0x16u);
        }

        if (v16 && v11)
        {
          [v11 updateBytesSynced:v16];
          char v23 = 1;
        }
      }
      uint64_t v27 = [v8 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v27);

    v5 = v21;
    id v3 = v22;
    if (v23)
    {
      [v21 setObject:v26 forKey:@"DetailedRequestInfoByAssetType"];
      [v22 setObject:v21 forKey:@"InstalledMediaAssetMetrics"];
    }
  }
  else
  {
  }

  return v3;
}

- (id)_prepareInstalledAssetMetricsWithSerializedOutputFromClientMetrics:(id)a3
{
  if (a3)
  {
    id v4 = (void *)[a3 mutableCopy];
    v5 = [v4 objectForKey:@"InstalledMediaAssetMetrics"];
    uint64_t v6 = (void *)[v5 mutableCopy];

    if (v6)
    {
      uint64_t v7 = [v6 objectForKey:@"DetailedRequestInfoByAssetType"];
      uint64_t v8 = [(ATDeviceSyncSessionAssetTask *)self _serializedAssetsToDownloadDictionaryWithUpdatedProgressFromDownloadDictionary:v7];

      v9 = [v6 objectForKey:@"DetailedDownloadInfoByAssetType"];
      uint64_t v10 = [(ATDeviceSyncSessionAssetTask *)self _serializedDownloadedAssetsDictionaryFromDownloadedAssetsDictionary:v9];

      [v6 setObject:v8 forKey:@"DetailedRequestInfoByAssetType"];
      [v6 setObject:v10 forKey:@"DetailedDownloadInfoByAssetType"];
      [v4 setObject:v6 forKey:@"InstalledMediaAssetMetrics"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_updateCachedInstalledAssetMetricsWithNewMetrics:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKey:@"InstalledMediaAssetMetrics"];
  uint64_t v6 = [v5 objectForKey:@"DetailedRequestInfoByAssetType"];
  if ([v6 count])
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v7 = v6;
    uint64_t v34 = [v7 countByEnumeratingWithState:&v41 objects:v52 count:16];
    if (v34)
    {
      long long v28 = v6;
      long long v29 = v5;
      id v30 = v4;
      uint64_t v31 = *(void *)v42;
      long long v32 = v7;
      long long v33 = self;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v42 != v31) {
            objc_enumerationMutation(v7);
          }
          v9 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          uint64_t v10 = [(NSMutableDictionary *)self->_progressMap objectForKey:v9];
          long long v35 = [v7 objectForKey:v9];
          unint64_t v11 = [v35 getContributors];
          int v12 = [MEMORY[0x1E4F1CA48] array];
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          uint64_t v36 = v10;
          __int16 v13 = [v10 allKeys];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v51 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v38;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v38 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void *)(*((void *)&v37 + 1) + 8 * j);
                uint64_t v19 = [v11 objectForKey:v18];

                if (!v19) {
                  [(NSDictionary *)v12 addObject:v18];
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v37 objects:v51 count:16];
            }
            while (v15);
          }

          unint64_t v20 = _ATLogCategoryDeviceSync();
          self = v33;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            v46 = v33;
            __int16 v47 = 2114;
            v48 = v12;
            __int16 v49 = 2114;
            id v50 = v9;
            _os_log_impl(&dword_1D9A2D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: Removing progress for %{public}@ asetType %{public}@ as they are cancelled assets", buf, 0x20u);
          }

          [v36 removeObjectsForKeys:v12];
          uint64_t v7 = v32;
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v41 objects:v52 count:16];
      }
      while (v34);
      v5 = v29;
      id v4 = v30;
      uint64_t v6 = v28;
    }
  }
  else
  {
    [(NSMutableDictionary *)self->_progressMap removeAllObjects];
    uint64_t v7 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v46 = self;
      _os_log_impl(&dword_1D9A2D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: No active downloads - clearing our progress map", buf, 0xCu);
    }
  }

  uint64_t v21 = [(ATDeviceSyncSessionAssetTask *)self _prepareInstalledAssetMetricsWithSerializedOutputFromClientMetrics:v4];
  unint64_t v22 = _ATLogCategoryDeviceSync_Oversize();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    installedAssetMetrics = self->_installedAssetMetrics;
    *(_DWORD *)buf = 138543874;
    v46 = self;
    __int16 v47 = 2114;
    v48 = installedAssetMetrics;
    __int16 v49 = 2114;
    id v50 = v4;
    _os_log_impl(&dword_1D9A2D000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating installed asset metrics from %{public}@ to %{public}@", buf, 0x20u);
  }

  uint64_t v24 = self->_installedAssetMetrics;
  self->_installedAssetMetrics = v21;
  __int16 v25 = v21;

  unint64_t v26 = [(NSDictionary *)self->_installedAssetMetrics objectForKey:@"ItemsWithEstimatedFileSize"];
  itemsWithEstimatedFileSize = self->_itemsWithEstimatedFileSize;
  self->_itemsWithEstimatedFileSize = v26;
}

- (void)_sendUpdatedInstallMetrics
{
  id v3 = [(ATDeviceSyncSessionTask *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__ATDeviceSyncSessionAssetTask__sendUpdatedInstallMetrics__block_invoke;
  block[3] = &unk_1E6B88B40;
  block[4] = self;
  dispatch_async(v3, block);
}

void __58__ATDeviceSyncSessionAssetTask__sendUpdatedInstallMetrics__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) isFinished] & 1) != 0
    || [*(id *)(a1 + 32) isCancelled])
  {
    v2 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v12 = v3;
      _os_log_impl(&dword_1D9A2D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Not sending installed metrics as the task is cancelled/finished", buf, 0xCu);
    }
  }
  else
  {
    id v4 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v12 = v5;
      _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Sending updated installed metrics", buf, 0xCu);
    }

    v2 = [*(id *)(a1 + 32) _getRawInstalledAssetMetricsFromAssetClient];
    [*(id *)(a1 + 32) _updateCachedInstalledAssetMetricsWithNewMetrics:v2];
    id v6 = objc_alloc(MEMORY[0x1E4F4A2D0]);
    uint64_t v7 = [*(id *)(a1 + 32) dataClass];
    uint64_t v8 = (void *)[v6 initWithCommand:@"AssetMetrics" dataClass:v7 parameters:*(void *)(*(void *)(a1 + 32) + 232)];

    v9 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__ATDeviceSyncSessionAssetTask__sendUpdatedInstallMetrics__block_invoke_209;
    v10[3] = &unk_1E6B87E20;
    v10[4] = v9;
    [v9 sendRequest:v8 withCompletion:v10];
  }
}

void __58__ATDeviceSyncSessionAssetTask__sendUpdatedInstallMetrics__block_invoke_209(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__ATDeviceSyncSessionAssetTask__sendUpdatedInstallMetrics__block_invoke_2;
  block[3] = &unk_1E6B88BB8;
  block[4] = *(void *)(a1 + 32);
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, block);
}

void __58__ATDeviceSyncSessionAssetTask__sendUpdatedInstallMetrics__block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) isFinished] & 1) != 0
    || [*(id *)(a1 + 32) isCancelled])
  {
    v2 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v17 = 138543362;
      uint64_t v18 = v3;
      _os_log_impl(&dword_1D9A2D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Not handling asset metrics response as the link is closed.", (uint8_t *)&v17, 0xCu);
    }
LABEL_5:

    return;
  }
  if (!*(void *)(a1 + 40))
  {
    id v4 = [*(id *)(a1 + 48) error];

    if (!v4)
    {
      *(_DWORD *)(*(void *)(a1 + 32) + 296) = 0;
      return;
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = *(_DWORD *)(v5 + 296);
  if (v6 > 2)
  {
    v2 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v15 = [*(id *)(a1 + 48) error];
      int v16 = *(_DWORD *)(*(void *)(a1 + 32) + 296);
      int v17 = 138544130;
      uint64_t v18 = v13;
      __int16 v19 = 2114;
      uint64_t v20 = v14;
      __int16 v21 = 2114;
      unint64_t v22 = v15;
      __int16 v23 = 1024;
      int v24 = v16;
      _os_log_impl(&dword_1D9A2D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Error %{public}@, response error %{public}@ sending updated asset metrics - will NOT try sending metrics again, _retrySendingAssetMetricsCount=%d", (uint8_t *)&v17, 0x26u);
    }
    goto LABEL_5;
  }
  *(_DWORD *)(v5 + 296) = v6 + 1;
  uint64_t v7 = _ATLogCategoryDeviceSync();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = [*(id *)(a1 + 48) error];
    int v11 = *(_DWORD *)(*(void *)(a1 + 32) + 296);
    int v17 = 138544130;
    uint64_t v18 = v8;
    __int16 v19 = 2114;
    uint64_t v20 = v9;
    __int16 v21 = 2114;
    unint64_t v22 = v10;
    __int16 v23 = 1024;
    int v24 = v11;
    _os_log_impl(&dword_1D9A2D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Error %{public}@, response error %{public}@ sending updated asset metrics - will try again in 1 second, _retrySendingAssetMetricsCount=%d", (uint8_t *)&v17, 0x26u);
  }
  dispatch_time_t v12 = dispatch_time(0, 1000000000);
  dispatch_after(v12, MEMORY[0x1E4F14428], &__block_literal_global_212);
}

void __58__ATDeviceSyncSessionAssetTask__sendUpdatedInstallMetrics__block_invoke_210()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.atc.installedassetmetricschanged", 0, 0, 1u);
}

- (id)_serializedAssetSyncProgressFromAssetCacheDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [v3 allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        int v11 = [v3 objectForKey:v10];
        if (v11)
        {
          dispatch_time_t v12 = +[ATDetailedProgressInfoForAssetType serializedProgressInfoFromATDetailedProgressInfoForAssetType:v11];
          [v4 setObject:v12 forKey:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v7);
  }

  uint64_t v13 = _ATLogCategoryDeviceSync();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v21 = self;
    __int16 v22 = 2114;
    __int16 v23 = v4;
    _os_log_impl(&dword_1D9A2D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: serializedProgressDictionary %{public}@", buf, 0x16u);
  }

  return v4;
}

- (id)_serializedAssetRequestsFromRequestDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [v3 allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        int v11 = [v3 objectForKey:v10];
        if (v11)
        {
          dispatch_time_t v12 = +[ATDetailedRequestInfoForAssetType serializedRequestInfoFromATDetailedRequestInfoForAssetType:v11];
          [v4 setObject:v12 forKey:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v7);
  }

  uint64_t v13 = _ATLogCategoryDeviceSync();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v21 = self;
    __int16 v22 = 2114;
    __int16 v23 = v4;
    _os_log_impl(&dword_1D9A2D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: serializedAssetsDictionary %{public}@", buf, 0x16u);
  }

  return v4;
}

- (void)_finishTaskWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ATDeviceSyncSessionTask *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__ATDeviceSyncSessionAssetTask__finishTaskWithError___block_invoke;
  v7[3] = &unk_1E6B88B68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __53__ATDeviceSyncSessionAssetTask__finishTaskWithError___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isFinished])
  {
    v2 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      double v3 = *(double *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      double v36 = v3;
      id v4 = "%{public}@: is already finished";
LABEL_20:
      _os_log_impl(&dword_1D9A2D000, v2, OS_LOG_TYPE_DEFAULT, v4, buf, 0xCu);
    }
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v5 + 256))
    {
      id v6 = [(id)v5 messageLink];
      uint64_t v7 = [v6 socket];
      [v7 removeTransportUpgradeException];

      *(unsigned char *)(*(void *)(a1 + 32) + 256) = 0;
      uint64_t v5 = *(void *)(a1 + 32);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(v5 + 176));

    if (WeakRetained)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(NSObject **)(v9 + 320);
      uint64_t v29 = MEMORY[0x1E4F143A8];
      uint64_t v30 = 3221225472;
      uint64_t v31 = __53__ATDeviceSyncSessionAssetTask__finishTaskWithError___block_invoke_2;
      long long v32 = &unk_1E6B88B68;
      uint64_t v33 = v9;
      id v34 = *(id *)(a1 + 40);
      dispatch_sync(v10, &v29);
    }
    objc_msgSend(MEMORY[0x1E4F1C9C8], "timeIntervalSinceReferenceDate", v29, v30, v31, v32, v33);
    double v12 = v11 - *(double *)(*(void *)(a1 + 32) + 264);
    uint64_t v13 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v15 = v14 - *(double *)(*(void *)(a1 + 32) + 264);
      *(_DWORD *)buf = 134217984;
      double v36 = v15;
      _os_log_impl(&dword_1D9A2D000, v13, OS_LOG_TYPE_DEFAULT, "Asset Task finished in %.2f seconds", buf, 0xCu);
    }

    double v16 = (double)*(unint64_t *)(*(void *)(a1 + 32) + 272) / v12;
    long long v17 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      long long v18 = *(double **)(a1 + 32);
      double v19 = v18[39];
      uint64_t v20 = [v18 totalItemCount];
      uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 272);
      *(_DWORD *)buf = 134218752;
      double v36 = v19;
      __int16 v37 = 2048;
      uint64_t v38 = v20;
      __int16 v39 = 2048;
      uint64_t v40 = v21;
      __int16 v41 = 2048;
      double v42 = v16;
      _os_log_impl(&dword_1D9A2D000, v17, OS_LOG_TYPE_DEFAULT, "==> synced %lu/%lu total assets of %lld bytes total (%.2f bytes/s)", buf, 0x2Au);
    }

    if ([*(id *)(a1 + 32) totalItemCount])
    {
      __int16 v22 = [*(id *)(a1 + 32) messageLink];
      int v23 = [v22 endpointType];

      if (!v23) {
        ATReportEventAddDoubleToScalarKey();
      }
    }
    [*(id *)(a1 + 32) totalItemCount];
    ATReportEventAddIntToScalarKey();
    ATReportEventAddIntToScalarKey();
    [*(id *)(a1 + 32) setError:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setFinished:1];
    uint64_t v24 = *(void *)(a1 + 40);
    uint64_t v25 = _ATLogCategoryDeviceSync();
    v2 = v25;
    if (v24)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        double v26 = *(double *)(a1 + 32);
        uint64_t v27 = objc_msgSend(*(id *)(a1 + 40), "msv_description");
        *(_DWORD *)buf = 138543618;
        double v36 = v26;
        __int16 v37 = 2114;
        uint64_t v38 = (uint64_t)v27;
        _os_log_impl(&dword_1D9A2D000, v2, OS_LOG_TYPE_ERROR, "%{public}@: finished. error=%{public}@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      double v28 = *(double *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      double v36 = v28;
      id v4 = "%{public}@: finished.";
      goto LABEL_20;
    }
  }
}

void __53__ATDeviceSyncSessionAssetTask__finishTaskWithError___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 176));
  [WeakRetained assetSyncDidCompleteWithError:*(void *)(a1 + 40)];
}

- (void)_updateTaskDescription
{
  double v3 = [(ATDeviceSyncSessionTask *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__ATDeviceSyncSessionAssetTask__updateTaskDescription__block_invoke;
  block[3] = &unk_1E6B88B40;
  block[4] = self;
  dispatch_async(v3, block);
}

void __54__ATDeviceSyncSessionAssetTask__updateTaskDescription__block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 192), "count"));
  double v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 192), "count"));
  id v4 = [*(id *)(*(void *)(a1 + 32) + 192) array];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 200) array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        double v12 = [v11 prettyName];
        [v2 addObject:v12];

        uint64_t v13 = [v11 serializedAsset];
        [v3 addObject:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v8);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v5;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        double v19 = *(void **)(*((void *)&v24 + 1) + 8 * j);
        uint64_t v20 = objc_msgSend(v19, "prettyName", (void)v24);
        [v2 addObject:v20];

        uint64_t v21 = [v19 serializedAsset];
        [v3 addObject:v21];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v16);
  }

  __int16 v22 = _ATLogCategoryDeviceSync();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v33 = v23;
    __int16 v34 = 2114;
    long long v35 = v2;
    _os_log_impl(&dword_1D9A2D000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: currentItemDescriptions=%{public}@", buf, 0x16u);
  }

  [*(id *)(a1 + 32) setCurrentItemDescriptions:v2];
  [*(id *)(a1 + 32) setCurrentItems:v3];
}

- (void)_updateProperties
{
  id v7 = (id)objc_opt_new();
  double v3 = (void *)[(NSMutableDictionary *)self->_detailedProgress copy];
  [v7 setObject:v3 forKeyedSubscript:@"DetailedProgress"];

  id v4 = [(ATDeviceSyncSessionAssetTask *)self _serializedAssetSyncProgressFromAssetCacheDictionary:self->_syncProgresByAssetType];
  [v7 setObject:v4 forKeyedSubscript:@"DetailedProgressByAssetType"];

  [(ATThroughputCalculator *)self->_throughputCalculator throughput];
  if (v5 > 0.0)
  {
    id v6 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v7 setObject:v6 forKeyedSubscript:@"AverageThroughput"];
  }
  [(ATSessionTask *)self setProperties:v7];
}

- (void)_updateDetailedProgressForCompletedAsset:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = [a3 variantOptions];
  double v5 = [v4 objectForKey:@"AssetParts"];
  id v6 = [v5 stringValue];

  if (v6)
  {
    id v7 = [(NSMutableDictionary *)self->_detailedProgress objectForKey:v6];
    uint64_t v8 = [v7 objectForKey:@"CompletedCount"];
    uint64_t v9 = [v8 unsignedIntegerValue] + 1;

    uint64_t v10 = [v7 objectForKey:@"TotalCount"];
    uint64_t v11 = [v10 unsignedIntegerValue];

    v15[0] = @"TotalCount";
    double v12 = [NSNumber numberWithUnsignedInteger:v11];
    v15[1] = @"CompletedCount";
    v16[0] = v12;
    uint64_t v13 = [NSNumber numberWithUnsignedInteger:v9];
    v16[1] = v13;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

    [(NSMutableDictionary *)self->_detailedProgress setObject:v14 forKey:v6];
  }
}

- (void)_assetRequestsCompletedWithError:(id)a3
{
  id v4 = a3;
  double v5 = [(ATDeviceSyncSessionTask *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__ATDeviceSyncSessionAssetTask__assetRequestsCompletedWithError___block_invoke;
  v7[3] = &unk_1E6B88B68;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __65__ATDeviceSyncSessionAssetTask__assetRequestsCompletedWithError___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = _ATLogCategoryDeviceSync();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      id v6 = objc_msgSend(*(id *)(a1 + 32), "msv_description");
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v5;
      __int16 v19 = 2114;
      uint64_t v20 = v6;
      _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: all assets completed - waiting for clients to finish. error=%{public}@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    uint64_t v18 = v7;
    _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: all assets completed - waiting for clients to finish.", buf, 0xCu);
  }

  dispatch_barrier_sync(*(dispatch_queue_t *)(*(void *)(a1 + 40) + 320), &__block_literal_global_199);
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 208), "removeObserver:");
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v9 = *(void **)(a1 + 32);
  if (v9)
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "code"));
    [v8 setObject:v10 forKey:@"_EndAssetTaskError"];
  }
  id v11 = objc_alloc(MEMORY[0x1E4F4A2D0]);
  double v12 = [*(id *)(a1 + 40) dataClass];
  uint64_t v13 = (void *)[v11 initWithCommand:@"EndAssetTask" dataClass:v12 parameters:v8];

  id v14 = *(void **)(a1 + 40);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __65__ATDeviceSyncSessionAssetTask__assetRequestsCompletedWithError___block_invoke_2;
  v15[3] = &unk_1E6B882E0;
  v15[4] = v14;
  id v16 = *(id *)(a1 + 32);
  [v14 sendRequest:v13 withCompletion:v15];
}

void __65__ATDeviceSyncSessionAssetTask__assetRequestsCompletedWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__ATDeviceSyncSessionAssetTask__assetRequestsCompletedWithError___block_invoke_3;
  v11[3] = &unk_1E6B88308;
  id v12 = v6;
  id v13 = v5;
  id v8 = *(void **)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v8;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, v11);
}

void __65__ATDeviceSyncSessionAssetTask__assetRequestsCompletedWithError___block_invoke_3(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32)
    || ([*(id *)(a1 + 40) error], uint64_t v2 = objc_claimAutoreleasedReturnValue(), v2, v2))
  {
    double v3 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 48);
      uint64_t v5 = *(void *)(a1 + 32);
      int v20 = 138543618;
      uint64_t v21 = v4;
      __int16 v22 = 2114;
      *(void *)uint64_t v23 = v5;
      _os_log_impl(&dword_1D9A2D000, v3, OS_LOG_TYPE_ERROR, "%{public}@: failed to send request. err=%{public}@", (uint8_t *)&v20, 0x16u);
    }

    id v6 = *(void **)(a1 + 48);
    if (*(void *)(a1 + 56) || *(void *)(a1 + 32))
    {
      objc_msgSend(*(id *)(a1 + 48), "_finishTaskWithError:");
    }
    else
    {
      uint64_t v17 = [*(id *)(a1 + 40) error];
      [v6 _finishTaskWithError:v17];
    }
  }
  else
  {
    int v7 = 1;
    *(unsigned char *)(*(void *)(a1 + 48) + 300) = 1;
    id v8 = [*(id *)(a1 + 48) session];
    id v9 = v8;
    if (!*(unsigned char *)(*(void *)(a1 + 48) + 301) && !*(void *)(a1 + 56)) {
      int v7 = [v8 isCancelled];
    }
    uint64_t v10 = *(void *)(a1 + 56);
    id v11 = _ATLogCategoryDeviceSync();
    id v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = *(void *)(a1 + 48);
        int v14 = *(unsigned __int8 *)(v13 + 301);
        int v15 = [v9 isCancelled];
        id v16 = objc_msgSend(*(id *)(a1 + 56), "msv_description");
        int v20 = 138544386;
        uint64_t v21 = v13;
        __int16 v22 = 1024;
        *(_DWORD *)uint64_t v23 = v7;
        *(_WORD *)&v23[4] = 1024;
        *(_DWORD *)&v23[6] = v14;
        __int16 v24 = 1024;
        int v25 = v15;
        __int16 v26 = 2114;
        long long v27 = v16;
        _os_log_impl(&dword_1D9A2D000, v12, OS_LOG_TYPE_ERROR, "%{public}@: taskComplete:%d _peerRequestsComplete:%d, session cancelled:%d error=%{public}@", (uint8_t *)&v20, 0x28u);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void *)(a1 + 48);
      int v19 = *(unsigned __int8 *)(v18 + 301);
      int v20 = 138544130;
      uint64_t v21 = v18;
      __int16 v22 = 1024;
      *(_DWORD *)uint64_t v23 = v7;
      *(_WORD *)&v23[4] = 1024;
      *(_DWORD *)&v23[6] = v19;
      __int16 v24 = 1024;
      int v25 = [v9 isCancelled];
      _os_log_impl(&dword_1D9A2D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: taskComplete:%d _peerRequestsComplete:%d, session cancelled:%d", (uint8_t *)&v20, 0x1Eu);
    }

    if (v7) {
      [*(id *)(a1 + 48) _finishTaskWithError:*(void *)(a1 + 56)];
    }
  }
}

- (void)_handleAssetDownloadProgressed:(id)a3 onMessageLink:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 parameters];
  id v9 = [v8 objectForKey:@"AssetProgress"];
  uint64_t v10 = [v9 unsignedLongLongValue];

  id v11 = [v6 parameters];
  id v12 = [v11 objectForKey:@"AssetType"];

  uint64_t v13 = [(NSMutableDictionary *)self->_syncProgresByAssetType objectForKey:v12];
  int v14 = _ATLogCategoryDeviceSync();
  int v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543874;
      uint64_t v18 = self;
      __int16 v19 = 2114;
      int v20 = v12;
      __int16 v21 = 2048;
      uint64_t v22 = v10;
      _os_log_impl(&dword_1D9A2D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating sync progress for asset type: %{public}@, bytesDownloaded:%llu", (uint8_t *)&v17, 0x20u);
    }

    [v13 updateBytesDownloaded:v10];
    [(ATDeviceSyncSessionAssetTask *)self _updateProperties];
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138543618;
      uint64_t v18 = self;
      __int16 v19 = 2114;
      int v20 = v12;
      _os_log_impl(&dword_1D9A2D000, v15, OS_LOG_TYPE_ERROR, "%{public}@: No ATDetailedProgressInfoForAssetType for assetType: %{public}@", (uint8_t *)&v17, 0x16u);
    }
  }
  id v16 = [v6 responseWithError:0 parameters:0];
  [v7 sendResponse:v16 withCompletion:0];
}

- (void)_handleInstalledAssetMetricsChanged:(id)a3 onMessageLink:(id)a4
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 parameters];
  id v8 = [v7 objectForKey:@"InstalledMediaAssetMetrics"];

  id v9 = _ATLogCategoryDeviceSync_Oversize();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v88 = self;
    __int16 v89 = 2114;
    v90 = v8;
    _os_log_impl(&dword_1D9A2D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Installed media metrics changed - media metrics dict %{public}@", buf, 0x16u);
  }

  if (v8)
  {
    uint64_t v10 = [v8 objectForKey:@"KeepLocalAssetByteCountForSyncSettings"];
    uint64_t v11 = [v10 unsignedLongLongValue];
    id v12 = [v8 objectForKey:@"DownloadedAssetByteCountForSyncSettings"];
    uint64_t v13 = [v12 unsignedLongLongValue];

    int v14 = [v8 objectForKey:@"DetailedRequestInfoByAssetType"];
    int v15 = [v8 objectForKey:@"DetailedDownloadInfoByAssetType"];
    v64 = v14;
    v60 = v8;
    v63 = v15;
    if ([v14 count] || objc_msgSend(v15, "count"))
    {
      uint64_t v66 = v13 + v11;
      id v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v6, v5);
      long long v75 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      obuint64_t j = [v15 allKeys];
      uint64_t v17 = [obj countByEnumeratingWithState:&v75 objects:v85 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v76;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v76 != v19) {
              objc_enumerationMutation(obj);
            }
            uint64_t v21 = *(void *)(*((void *)&v75 + 1) + 8 * i);
            uint64_t v22 = [v63 objectForKey:v21];
            uint64_t v23 = [v22 objectForKey:@"TotalBytesToSync"];
            uint64_t v24 = [v23 unsignedLongLongValue];

            int v25 = [v22 objectForKey:@"TotalAssetsToSync"];
            uint64_t v26 = [v25 unsignedLongLongValue];

            long long v27 = [[ATDetailedProgressInfoForAssetType alloc] initWithAssetType:v21 assetCountToSync:v26 byteCountToSync:v66 assetCountSynced:v26 byteCountSyned:v24];
            [v16 setObject:v27 forKey:v21];
          }
          uint64_t v18 = [obj countByEnumeratingWithState:&v75 objects:v85 count:16];
        }
        while (v18);
      }

      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id obja = [v64 allKeys];
      uint64_t v28 = [obja countByEnumeratingWithState:&v71 objects:v84 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v72;
        do
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v72 != v30) {
              objc_enumerationMutation(obja);
            }
            uint64_t v32 = *(void *)(*((void *)&v71 + 1) + 8 * j);
            uint64_t v33 = [v64 objectForKey:v32];
            __int16 v34 = [v33 objectForKey:@"TotalBytesToSync"];
            uint64_t v35 = [v34 unsignedLongLongValue];

            double v36 = [v33 objectForKey:@"TotalAssetsToSync"];
            uint64_t v37 = [v36 unsignedLongLongValue];

            uint64_t v38 = [v33 objectForKey:@"TotalBytesSynced"];
            uint64_t v39 = [v38 unsignedLongLongValue];

            uint64_t v40 = [v16 objectForKey:v32];
            if (v40)
            {
              __int16 v41 = v40;
              [(ATDetailedProgressInfoForAssetType *)v40 updateAssetsToDownload:v37];
              [(ATDetailedProgressInfoForAssetType *)v41 updateBytesDownloaded:v39];
              [(ATDetailedProgressInfoForAssetType *)v41 updateBytesToDownload:v35];
            }
            else
            {
              __int16 v41 = [[ATDetailedProgressInfoForAssetType alloc] initWithAssetType:v32 assetCountToSync:v37 byteCountToSync:v66 assetCountSynced:0 byteCountSyned:v39];
              [v16 setObject:v41 forKey:v32];
            }
          }
          uint64_t v29 = [obja countByEnumeratingWithState:&v71 objects:v84 count:16];
        }
        while (v29);
      }

      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      double v42 = [v16 allKeys];
      uint64_t v43 = [v42 countByEnumeratingWithState:&v67 objects:v83 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        uint64_t v45 = *(void *)v68;
        do
        {
          for (uint64_t k = 0; k != v44; ++k)
          {
            if (*(void *)v68 != v45) {
              objc_enumerationMutation(v42);
            }
            uint64_t v47 = *(void *)(*((void *)&v67 + 1) + 8 * k);
            syncProgresByAssetType = self->_syncProgresByAssetType;
            __int16 v49 = [v16 objectForKey:v47];
            [(NSMutableDictionary *)syncProgresByAssetType setObject:v49 forKey:v47];
          }
          uint64_t v44 = [v42 countByEnumeratingWithState:&v67 objects:v83 count:16];
        }
        while (v44);
      }

      id v6 = v58;
      id v5 = v59;
    }
    else
    {
      id v16 = [(NSMutableDictionary *)self->_syncProgresByAssetType allKeys];
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      uint64_t v51 = [v16 countByEnumeratingWithState:&v79 objects:v86 count:16];
      if (!v51) {
        goto LABEL_32;
      }
      uint64_t v52 = v51;
      id v53 = v6;
      uint64_t v54 = *(void *)v80;
      do
      {
        for (uint64_t m = 0; m != v52; ++m)
        {
          if (*(void *)v80 != v54) {
            objc_enumerationMutation(v16);
          }
          uint64_t v56 = *(void *)(*((void *)&v79 + 1) + 8 * m);
          v57 = [[ATDetailedProgressInfoForAssetType alloc] initWithAssetType:v56 assetCountToSync:0 byteCountToSync:0];
          [(NSMutableDictionary *)self->_syncProgresByAssetType setObject:v57 forKey:v56];
        }
        uint64_t v52 = [v16 countByEnumeratingWithState:&v79 objects:v86 count:16];
      }
      while (v52);
      id v6 = v53;
    }
    id v8 = v60;
    int v15 = v63;
LABEL_32:

    [(ATDeviceSyncSessionAssetTask *)self _updateProperties];
  }
  id v50 = [v5 responseWithError:0 parameters:0];
  [v6 sendResponse:v50 withCompletion:0];
}

- (void)_handleUpdateSessionTaskRequest:(id)a3 onMessageLink:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 parameters];
  id v9 = [v8 objectForKey:@"_TotalItemCount"];

  uint64_t v10 = [v6 parameters];
  uint64_t v11 = [v10 objectForKey:@"_CompletedItemCount"];

  id v12 = [v6 parameters];
  uint64_t v13 = [v12 objectForKey:@"SyncedAssetATAssetType"];

  if (v13)
  {
    uint64_t v35 = v11;
    int v14 = [v6 parameters];
    uint64_t v38 = [v14 objectForKey:@"ATLibraryIdentifierForAsset"];

    int v15 = [v6 parameters];
    id v16 = [v15 objectForKey:@"AssetDownloadedWithError"];

    uint64_t v17 = [v6 parameters];
    uint64_t v18 = [v17 objectForKey:@"AssetProgress"];

    uint64_t v19 = [v6 parameters];
    int v20 = [v19 objectForKey:@"FileSize"];

    if (v18) {
      uint64_t v37 = [v18 unsignedLongLongValue];
    }
    else {
      uint64_t v37 = 0;
    }
    double v36 = v9;
    if (v20) {
      uint64_t v34 = [v20 unsignedLongLongValue];
    }
    else {
      uint64_t v34 = 0;
    }
    uint64_t v21 = v13;
    uint64_t v22 = [(NSMutableDictionary *)self->_syncProgresByAssetType objectForKey:v13];
    id v23 = v7;
    if (v16) {
      uint64_t v24 = [v16 BOOLValue] ^ 1;
    }
    else {
      uint64_t v24 = 1;
    }
    int v25 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544642;
      uint64_t v40 = self;
      __int16 v41 = 2114;
      double v42 = v38;
      __int16 v43 = 2114;
      uint64_t v44 = v21;
      __int16 v45 = 1024;
      int v46 = v24;
      __int16 v47 = 2048;
      uint64_t v48 = v34;
      __int16 v49 = 2048;
      uint64_t v50 = v37;
      _os_log_impl(&dword_1D9A2D000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: Asset id %{public}@ finished - type:%{public}@, succeeded:%d, fileSize:%llu, deltaBytes:%llu", buf, 0x3Au);
    }

    if (v22) {
      [v22 updateAsset:v38 syncedWithSuccess:v24 bytesDownloaded:v37];
    }

    uint64_t v11 = v35;
    id v9 = v36;
    id v7 = v23;
    uint64_t v13 = v21;
  }
  -[ATDeviceSyncSessionAssetTask updateProgressWithCount:totalItemCount:](self, "updateProgressWithCount:totalItemCount:", [v11 unsignedIntegerValue], objc_msgSend(v9, "unsignedIntegerValue"));
  uint64_t v26 = [v6 parameters];
  long long v27 = [v26 objectForKey:@"_DetailedProgress"];
  uint64_t v28 = (NSMutableDictionary *)[v27 mutableCopy];
  detailedProgress = self->_detailedProgress;
  self->_detailedProgress = v28;

  [(ATDeviceSyncSessionAssetTask *)self _updateProperties];
  uint64_t v30 = [v6 responseWithError:0 parameters:0];
  [v7 sendResponse:v30 withCompletion:0];

  if (v9 == v11)
  {
    long long v31 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v40 = self;
      _os_log_impl(&dword_1D9A2D000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: all downloads complete - waiting for task to finish", buf, 0xCu);
    }

    if (self->_addedTransportUpgradeException)
    {
      uint64_t v32 = [(ATDeviceSyncSessionTask *)self messageLink];
      uint64_t v33 = [v32 socket];
      [v33 removeTransportUpgradeException];

      self->_addedTransportUpgradeException = 0;
    }
  }
}

- (void)_handleAssetRequest:(id)a3 onMessagLink:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 parameters];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F4A2B0];
    uint64_t v11 = [v6 parameters];
    id v12 = [v10 assetWithSerializedAsset:v11];

    uint64_t v13 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = self;
      __int16 v30 = 2114;
      id v31 = v12;
      _os_log_impl(&dword_1D9A2D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ - processing download request for asset %{public}@", buf, 0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_assetClient);
    if (WeakRetained)
    {
      if ([v12 isDownload])
      {
        [(NSMutableOrderedSet *)self->_serverAssetsInProgress addObject:v12];
        [(ATDeviceSyncSessionAssetTask *)self _updateTaskDescription];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __65__ATDeviceSyncSessionAssetTask__handleAssetRequest_onMessagLink___block_invoke_2;
        v24[3] = &unk_1E6B87F60;
        v24[4] = self;
        id v25 = v12;
        id v26 = v6;
        id v27 = v7;
        [WeakRetained getDataForAsset:v25 withCompletion:v24];

LABEL_17:
        goto LABEL_18;
      }
      uint64_t v22 = _ATLogCategoryDeviceSync();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v29 = self;
        __int16 v30 = 2114;
        id v31 = v12;
        _os_log_impl(&dword_1D9A2D000, v22, OS_LOG_TYPE_ERROR, "%{public}@ - received unsupported upload request for asset %{public}@", buf, 0x16u);
      }

      id v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:21 userInfo:0];
      int v20 = [v6 responseWithError:v23 parameters:0];

      uint64_t v21 = &__block_literal_global_172;
    }
    else
    {
      uint64_t v17 = _ATLogCategoryDeviceSync();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = [v12 dataclass];
        *(_DWORD *)buf = 138543618;
        uint64_t v29 = self;
        __int16 v30 = 2114;
        id v31 = v18;
        _os_log_impl(&dword_1D9A2D000, v17, OS_LOG_TYPE_ERROR, "%{public}@ - no client handles asset data class '%{public}@'", buf, 0x16u);
      }
      uint64_t v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:21 userInfo:0];
      int v20 = [v6 responseWithError:v19 parameters:0];

      uint64_t v21 = &__block_literal_global_169;
    }
    [v7 sendResponse:v20 withCompletion:v21];

    goto LABEL_17;
  }
  int v15 = _ATLogCategoryDeviceSync();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v29 = self;
    __int16 v30 = 2114;
    id v31 = v6;
    _os_log_impl(&dword_1D9A2D000, v15, OS_LOG_TYPE_ERROR, "%{public}@ - Rejecting asset request with no params: %{public}@", buf, 0x16u);
  }

  id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:23 userInfo:0];
  id v12 = [v6 responseWithError:v16 parameters:0];

  [v7 sendResponse:v12 withCompletion:&__block_literal_global_1976];
LABEL_18:
}

void __65__ATDeviceSyncSessionAssetTask__handleAssetRequest_onMessagLink___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__ATDeviceSyncSessionAssetTask__handleAssetRequest_onMessagLink___block_invoke_3;
  block[3] = &unk_1E6B87F38;
  uint64_t v11 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v16 = v11;
  id v17 = *(id *)(a1 + 48);
  id v18 = v7;
  id v19 = v9;
  id v20 = v8;
  id v21 = *(id *)(a1 + 56);
  id v12 = v8;
  id v13 = v9;
  id v14 = v7;
  dispatch_async(v10, block);
}

void __65__ATDeviceSyncSessionAssetTask__handleAssetRequest_onMessagLink___block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 272) += [*(id *)(a1 + 40) totalBytes];
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  uint64_t v2 = [*(id *)(a1 + 48) responseWithError:*(void *)(a1 + 56) parameters:*(void *)(a1 + 64)];
  uint64_t v3 = *(void *)(a1 + 72);
  if (v3)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 248), "addObject:");
    uint64_t v3 = *(void *)(a1 + 72);
  }
  [v2 setDataStream:v3];
  uint64_t v4 = *(void **)(a1 + 72);
  if (v4) {
    uint64_t v5 = [v4 streamStatus];
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = *(void **)(a1 + 80);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__ATDeviceSyncSessionAssetTask__handleAssetRequest_onMessagLink___block_invoke_4;
  v14[3] = &unk_1E6B87EC0;
  id v7 = *(void **)(a1 + 40);
  v14[4] = *(void *)(a1 + 32);
  id v16 = v17;
  id v15 = v7;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__ATDeviceSyncSessionAssetTask__handleAssetRequest_onMessagLink___block_invoke_6;
  v9[3] = &unk_1E6B87F10;
  id v8 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v8;
  id v12 = v17;
  id v11 = *(id *)(a1 + 72);
  uint64_t v13 = v5;
  [v6 sendResponse:v2 withProgress:v14 completion:v9];

  _Block_object_dispose(v17, 8);
}

void __65__ATDeviceSyncSessionAssetTask__handleAssetRequest_onMessagLink___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(unsigned char **)(a1 + 32);
  if (v3[302])
  {
    uint64_t v5 = [v3 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__ATDeviceSyncSessionAssetTask__handleAssetRequest_onMessagLink___block_invoke_5;
    block[3] = &unk_1E6B87E98;
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v11 = a2;
    block[4] = v6;
    long long v8 = *(_OWORD *)(a1 + 40);
    id v7 = (id)v8;
    long long v10 = v8;
    dispatch_async(v5, block);
  }
}

void __65__ATDeviceSyncSessionAssetTask__handleAssetRequest_onMessagLink___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = [*(id *)(a1 + 40) shortDescription];
      *(_DWORD *)buf = 138543874;
      uint64_t v18 = v5;
      __int16 v19 = 2114;
      id v20 = v6;
      __int16 v21 = 2114;
      id v22 = v3;
      _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: failed to send response for asset %{public}@. err=%{public}@", buf, 0x20u);
    }
  }
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__ATDeviceSyncSessionAssetTask__handleAssetRequest_onMessagLink___block_invoke_174;
  block[3] = &unk_1E6B87EE8;
  uint64_t v8 = *(void *)(a1 + 56);
  id v9 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  uint64_t v15 = v8;
  id v13 = v9;
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 64);
  id v14 = v10;
  uint64_t v16 = v11;
  dispatch_async(v7, block);
}

uint64_t __65__ATDeviceSyncSessionAssetTask__handleAssetRequest_onMessagLink___block_invoke_174(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[302])
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    if (v3) {
      [v2 _updateProgressWithBytesTransferred:v3 forAsset:*(void *)(a1 + 40)];
    }
  }
  uint64_t v4 = *(void **)(a1 + 48);
  if (v4)
  {
    unint64_t v5 = [v4 streamStatus];
    if (*(void *)(a1 + 64))
    {
      unint64_t v6 = v5;
      if (v5)
      {
        if (v5 <= 5)
        {
          id v7 = _ATLogCategoryDeviceSync();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v8 = *(void *)(a1 + 32);
            uint64_t v9 = *(void *)(a1 + 48);
            uint64_t v10 = *(void *)(a1 + 64);
            int v12 = 138544130;
            uint64_t v13 = v8;
            __int16 v14 = 2114;
            uint64_t v15 = v9;
            __int16 v16 = 2048;
            uint64_t v17 = v10;
            __int16 v18 = 2048;
            unint64_t v19 = v6;
            _os_log_impl(&dword_1D9A2D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: input stream %{public}@ will not be closed originalStreamStatus:%lu currentStreamStatus:%lu", (uint8_t *)&v12, 0x2Au);
          }
        }
      }
    }
    [*(id *)(*(void *)(a1 + 32) + 248) removeObject:*(void *)(a1 + 48)];
  }
  [*(id *)(*(void *)(a1 + 32) + 200) removeObject:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 32) _updateTaskDescription];
}

uint64_t __65__ATDeviceSyncSessionAssetTask__handleAssetRequest_onMessagLink___block_invoke_5(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 56);
  if (v1)
  {
    uint64_t v2 = result;
    *(void *)(*(void *)(*(void *)(result + 48) + 8) + 24) += v1;
    if (*(void *)(*(void *)(*(void *)(result + 48) + 8) + 24) > 0x40000uLL)
    {
      result = objc_msgSend(*(id *)(result + 32), "_updateProgressWithBytesTransferred:forAsset:");
      *(void *)(*(void *)(*(void *)(v2 + 48) + 8) + 24) = 0;
    }
  }
  return result;
}

- (void)_handleEndAssetTaskRequest:(id)a3 onMessagLink:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 parameters];
  uint64_t v9 = [v8 objectForKey:@"_EndAssetTaskError"];
  uint64_t v10 = [v9 integerValue];

  if (v10 && !self->_requestsComplete)
  {
    uint64_t v15 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v21 = self;
      __int16 v22 = 2048;
      uint64_t v23 = v10;
      _os_log_impl(&dword_1D9A2D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: cancelling due to error on the peer. err=%ld", buf, 0x16u);
    }

    [(ATDeviceSyncSessionAssetTask *)self cancel];
  }
  else
  {
    self->_peerRequestsComplete = 1;
    BOOL requestsComplete = self->_requestsComplete;
    int v12 = _ATLogCategoryDeviceSync();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (requestsComplete)
    {
      if (v13)
      {
        *(_DWORD *)buf = 138543362;
        __int16 v21 = self;
        _os_log_impl(&dword_1D9A2D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: all asset transfers are completed - finishing task", buf, 0xCu);
      }

      if (v10)
      {
        __int16 v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:v10 userInfo:0];
        [(ATDeviceSyncSessionAssetTask *)self _finishTaskWithError:v14];
      }
      else
      {
        [(ATDeviceSyncSessionAssetTask *)self _finishTaskWithError:0];
      }
    }
    else
    {
      if (v13)
      {
        *(_DWORD *)buf = 138543362;
        __int16 v21 = self;
        _os_log_impl(&dword_1D9A2D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: peer is finished - waiting for our assets to complete", buf, 0xCu);
      }
    }
  }
  __int16 v16 = [v7 responseWithError:0 parameters:0];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __72__ATDeviceSyncSessionAssetTask__handleEndAssetTaskRequest_onMessagLink___block_invoke;
  v18[3] = &unk_1E6B88BE0;
  v18[4] = self;
  id v19 = v16;
  id v17 = v16;
  [v6 sendResponse:v17 withCompletion:v18];
}

void __72__ATDeviceSyncSessionAssetTask__handleEndAssetTaskRequest_onMessagLink___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138543618;
      uint64_t v7 = v5;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: failed to send response. err=%{public}@", (uint8_t *)&v6, 0x16u);
    }

    [*(id *)(a1 + 32) _finishTaskWithError:v3];
  }
}

- (void)_handleBeginAssetTaskRequest:(id)a3 onMessagLink:(id)a4
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetClient);

  if (WeakRetained)
  {
    v59 = v7;
    id v9 = [v6 parameters];
    uint64_t v10 = [v9 objectForKey:@"_BeginAssetTaskTotalCount"];
    uint64_t v11 = [v10 unsignedIntegerValue];

    int v12 = [v6 parameters];
    BOOL v13 = [v12 objectForKey:@"_BeginAssetTaskDetailedCount"];

    __int16 v14 = [v6 parameters];
    uint64_t v15 = [v14 objectForKey:@"InstalledAssetMetrics"];

    [v15 objectForKey:@"InstalledMediaAssetMetrics"];
    v61 = v60 = v6;
    __int16 v16 = [v6 parameters];
    id v17 = [v16 objectForKey:@"_BeginAssetTaskTrackByteCount"];
    uint64_t v18 = [v17 unsignedLongLongValue];

    id v19 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544386;
      v85 = self;
      __int16 v86 = 2048;
      uint64_t v87 = v11;
      __int16 v88 = 2048;
      uint64_t v89 = v18;
      __int16 v90 = 2114;
      uint64_t v91 = (uint64_t)v13;
      __int16 v92 = 2114;
      uint64_t v93 = (uint64_t)v15;
      _os_log_impl(&dword_1D9A2D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: peer is going to request %lu assets, %llu total bytes (for track assets), detailed counts=%{public}@ installedAssetMetrics=%{public}@", buf, 0x34u);
    }
    uint64_t v57 = v11;
    v58 = v15;

    uint64_t v56 = v18;
    uint64_t v20 = [NSNumber numberWithUnsignedLongLong:v18];
    [(ATSessionTask *)self setTotalBytesToTransfer:v20];

    __int16 v21 = [&unk_1F33DCAB8 stringValue];
    __int16 v22 = [v13 objectForKey:v21];
    uint64_t v55 = [v22 unsignedIntegerValue];

    uint64_t v23 = [&unk_1F33DCAD0 stringValue];
    uint64_t v24 = [v13 objectForKey:v23];
    uint64_t v54 = [v24 unsignedIntegerValue];

    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    v65 = v13;
    obuint64_t j = [v13 allKeys];
    uint64_t v25 = [obj countByEnumeratingWithState:&v79 objects:v99 count:16];
    long long v69 = self;
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v80;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v80 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v29 = *(void *)(*((void *)&v79 + 1) + 8 * i);
          v97[0] = @"TotalCount";
          __int16 v30 = objc_msgSend(v65, "objectForKey:", v29, v54);
          v97[1] = @"CompletedCount";
          v98[0] = v30;
          v98[1] = &unk_1F33DCAA0;
          id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v98 forKeys:v97 count:2];

          self = v69;
          [(NSMutableDictionary *)v69->_detailedProgress setObject:v31 forKey:v29];
        }
        uint64_t v26 = [obj countByEnumeratingWithState:&v79 objects:v99 count:16];
      }
      while (v26);
    }

    uint64_t v32 = [v61 objectForKey:@"DetailedRequestInfoByAssetType"];
    uint64_t v33 = [v61 objectForKey:@"DetailedDownloadInfoByAssetType"];
    uint64_t v66 = (void *)[v33 mutableCopy];

    uint64_t v34 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v85 = self;
      __int16 v86 = 2114;
      uint64_t v87 = (uint64_t)v32;
      __int16 v88 = 2114;
      uint64_t v89 = (uint64_t)v66;
      _os_log_impl(&dword_1D9A2D000, v34, OS_LOG_TYPE_ERROR, "%{public}@: detailedRequestDict %{public}@, detailedDownloadDict %{public}@", buf, 0x20u);
    }

    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v62 = [v32 allKeys];
    id obja = (id)[v62 countByEnumeratingWithState:&v75 objects:v96 count:16];
    if (obja)
    {
      uint64_t v63 = *(void *)v76;
      v64 = v32;
      do
      {
        for (uint64_t j = 0; j != obja; uint64_t j = (char *)j + 1)
        {
          if (*(void *)v76 != v63) {
            objc_enumerationMutation(v62);
          }
          double v36 = *(void **)(*((void *)&v75 + 1) + 8 * (void)j);
          uint64_t v37 = objc_msgSend(v32, "objectForKey:", v36, v54);
          uint64_t v38 = [v66 objectForKey:v36];
          uint64_t v39 = v38;
          if (v38)
          {
            uint64_t v40 = [v38 objectForKey:@"TotalAssetsToSync"];
            uint64_t v41 = [v40 unsignedLongLongValue];

            double v42 = [v39 objectForKey:@"TotalBytesToSync"];
            uint64_t v43 = [v42 unsignedLongLongValue];

            if (v37) {
              goto LABEL_20;
            }
          }
          else
          {
            uint64_t v41 = 0;
            uint64_t v43 = 0;
            if (v37)
            {
LABEL_20:
              uint64_t v44 = [v37 objectForKey:@"TotalAssetsToSync"];
              uint64_t v45 = [v44 unsignedLongLongValue];

              int v46 = [v37 objectForKey:@"TotalBytesToSync"];
              uint64_t v47 = [v46 unsignedLongLongValue];

              goto LABEL_23;
            }
          }
          uint64_t v45 = 0;
          uint64_t v47 = 0;
LABEL_23:
          uint64_t v48 = [[ATDetailedProgressInfoForAssetType alloc] initWithAssetType:v36 assetCountToSync:v45 + v41 byteCountToSync:v47 + v43 assetCountSynced:v41 byteCountSyned:v43];
          [(NSMutableDictionary *)v69->_syncProgresByAssetType setObject:v48 forKey:v36];
          __int16 v49 = _ATLogCategoryDeviceSync();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138544642;
            v85 = v69;
            __int16 v86 = 2114;
            uint64_t v87 = (uint64_t)v36;
            __int16 v88 = 2048;
            uint64_t v89 = v41;
            __int16 v90 = 2048;
            uint64_t v91 = v43;
            __int16 v92 = 2048;
            uint64_t v93 = v45;
            __int16 v94 = 2048;
            uint64_t v95 = v47;
            _os_log_impl(&dword_1D9A2D000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@: asset type %{public}@ downloaded asset count %llu, downloaded byte count %llu, asset count to download %llu byte count to download %llu", buf, 0x3Eu);
          }

          uint64_t v32 = v64;
        }
        id obja = (id)[v62 countByEnumeratingWithState:&v75 objects:v96 count:16];
      }
      while (obja);
    }

    [(ATDeviceSyncSessionAssetTask *)v69 _updateProperties];
    [(ATSessionTask *)v69 setTotalItemCount:[(ATSessionTask *)v69 totalItemCount] + v57];
    id v6 = v60;
    uint64_t v50 = [v60 responseWithError:0 parameters:0];
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __74__ATDeviceSyncSessionAssetTask__handleBeginAssetTaskRequest_onMessagLink___block_invoke_162;
    v70[3] = &unk_1E6B87E70;
    v70[4] = v69;
    id v71 = v50;
    uint64_t v72 = v55;
    uint64_t v73 = v54;
    uint64_t v74 = v56;
    id v51 = v50;
    id v7 = v59;
    [v59 sendResponse:v51 withCompletion:v70];

    uint64_t v52 = v65;
    id v53 = v58;
  }
  else
  {
    uint64_t v52 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:21 userInfo:0];
    id v53 = [v6 responseWithError:v52 parameters:0];
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __74__ATDeviceSyncSessionAssetTask__handleBeginAssetTaskRequest_onMessagLink___block_invoke;
    v83[3] = &unk_1E6B88AF0;
    v83[4] = self;
    [v7 sendResponse:v53 withCompletion:v83];
    [(ATDeviceSyncSessionAssetTask *)self _finishTaskWithError:0];
  }
}

void __74__ATDeviceSyncSessionAssetTask__handleBeginAssetTaskRequest_onMessagLink___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138543618;
      uint64_t v7 = v5;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: failed to send response. err=%{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
}

void __74__ATDeviceSyncSessionAssetTask__handleBeginAssetTaskRequest_onMessagLink___block_invoke_162(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v13 = 138543618;
      uint64_t v14 = v5;
      __int16 v15 = 2114;
      id v16 = v3;
      _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: failed to send response. err=%{public}@", (uint8_t *)&v13, 0x16u);
    }

    [*(id *)(a1 + 32) _finishTaskWithError:v3];
  }
  else if (!*(unsigned char *)(*(void *)(a1 + 32) + 256) {
         && (*(void *)(a1 + 48) || *(void *)(a1 + 56) > 0x31uLL || *(void *)(a1 + 64) >= 0x100000uLL))
  }
  {
    int v6 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      __int16 v8 = *(void **)(a1 + 48);
      uint64_t v9 = *(void *)(a1 + 56);
      uint64_t v10 = *(void *)(a1 + 64);
      int v13 = 138544130;
      uint64_t v14 = v7;
      __int16 v15 = 2048;
      id v16 = v8;
      __int16 v17 = 2048;
      uint64_t v18 = v9;
      __int16 v19 = 2048;
      uint64_t v20 = v10;
      _os_log_impl(&dword_1D9A2D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: adding transport upgrade exception to message link - #tracks: %lu, #artwork: %lu, #total bytes requested: %llu", (uint8_t *)&v13, 0x2Au);
    }

    uint64_t v11 = [*(id *)(a1 + 32) messageLink];
    int v12 = [v11 socket];
    [v12 addTransportUpgradeException];

    *(unsigned char *)(*(void *)(a1 + 32) + 256) = 1;
  }
}

- (void)_handleUpdatedAsset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ATDeviceSyncSessionTask *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__ATDeviceSyncSessionAssetTask__handleUpdatedAsset___block_invoke;
  v7[3] = &unk_1E6B88B68;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __52__ATDeviceSyncSessionAssetTask__handleUpdatedAsset___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 184) containsObject:*(void *)(a1 + 40)])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (!*(void *)(v2 + 280))
    {
      id v3 = objc_alloc_init(MEMORY[0x1E4F478F0]);
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void **)(v4 + 280);
      *(void *)(v4 + 280) = v3;

      [*(id *)(*(void *)(a1 + 32) + 280) resume];
      uint64_t v2 = *(void *)(a1 + 32);
    }
    uint64_t v6 = [*(id *)(v2 + 288) objectForKey:*(void *)(a1 + 40)];
    if (!v6)
    {
      uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 40), "totalBytes"));
    }
    id v13 = (id)v6;
    uint64_t v7 = [*(id *)(a1 + 40) bytesRemaining];
    unint64_t v8 = [v13 unsignedLongLongValue] - v7;
    uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 288);
    uint64_t v10 = [NSNumber numberWithUnsignedLongLong:v7];
    [v9 setObject:v10 forKey:*(void *)(a1 + 40)];

    LODWORD(v10) = [*(id *)(*(void *)(a1 + 32) + 280) update:(double)v8];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 176));
    int v12 = *(void **)(a1 + 40);
    [v12 downloadProgress];
    objc_msgSend(WeakRetained, "assetSync:didUpdateProgress:", v12);

    [*(id *)(*(void *)(a1 + 32) + 192) addObject:*(void *)(a1 + 40)];
    if (v10) {
      [*(id *)(a1 + 32) _updateProperties];
    }
  }
}

- (void)_handleFinishedAsset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ATDeviceSyncSessionTask *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__ATDeviceSyncSessionAssetTask__handleFinishedAsset___block_invoke;
  block[3] = &unk_1E6B88B68;
  block[4] = self;
  id v6 = v4;
  id v12 = v6;
  dispatch_sync(v5, block);

  uint64_t v7 = [(ATDeviceSyncSessionTask *)self queue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__ATDeviceSyncSessionAssetTask__handleFinishedAsset___block_invoke_2;
  v9[3] = &unk_1E6B88B68;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);
}

uint64_t __53__ATDeviceSyncSessionAssetTask__handleFinishedAsset___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 328) addObject:*(void *)(a1 + 40)];
}

uint64_t __53__ATDeviceSyncSessionAssetTask__handleFinishedAsset___block_invoke_2(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 184) containsObject:*(void *)(a1 + 40)])
  {
    uint64_t v2 = [*(id *)(a1 + 40) error];
    id v3 = [v2 domain];
    if ([v3 isEqualToString:@"ATError"])
    {
      id v4 = [*(id *)(a1 + 40) error];
      uint64_t v5 = [v4 code];

      if (v5 != 16) {
        goto LABEL_8;
      }
      uint64_t v2 = _ATLogCategoryDeviceSync();
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
LABEL_7:

LABEL_8:
        *(void *)(*(void *)(a1 + 32) + 272) += [*(id *)(a1 + 40) totalBytes];
        objc_msgSend(*(id *)(a1 + 32), "updateProgressWithCount:totalItemCount:", objc_msgSend(*(id *)(a1 + 32), "completedItemCount") + 1, objc_msgSend(*(id *)(a1 + 32), "totalItemCount"));
        [*(id *)(a1 + 32) _updateDetailedProgressForCompletedAsset:*(void *)(a1 + 40)];
        id v8 = [*(id *)(a1 + 40) error];

        if (!v8) {
          ++*(void *)(*(void *)(a1 + 32) + 312);
        }
        uint64_t v9 = (void *)MEMORY[0x1E4F1CA60];
        id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "completedItemCount", @"_CompletedItemCount"));
        v48[0] = v10;
        v47[1] = @"_TotalItemCount";
        uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "totalItemCount"));
        v48[1] = v11;
        v47[2] = @"_DetailedProgress";
        id v12 = (void *)[*(id *)(*(void *)(a1 + 32) + 216) copy];
        v48[2] = v12;
        id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:3];
        uint64_t v14 = [v9 dictionaryWithDictionary:v13];

        __int16 v15 = [*(id *)(a1 + 40) assetType];

        if (v15)
        {
          id v16 = [*(id *)(a1 + 40) assetType];
          [v14 setObject:v16 forKey:@"SyncedAssetATAssetType"];

          __int16 v17 = [*(id *)(a1 + 40) identifier];
          [v14 setObject:v17 forKey:@"ATLibraryIdentifierForAsset"];
        }
        id v18 = objc_alloc(MEMORY[0x1E4F4A2D0]);
        __int16 v19 = [*(id *)(a1 + 32) dataClass];
        uint64_t v20 = (void *)[v18 initWithCommand:@"UpdateAssetSessionTask" dataClass:v19 parameters:v14];

        [*(id *)(a1 + 32) sendRequest:v20 withCompletion:0];
        uint64_t v21 = [*(id *)(a1 + 40) error];
        if (!v21)
        {
LABEL_24:
          [*(id *)(*(void *)(a1 + 32) + 192) removeObject:*(void *)(a1 + 40)];
          [*(id *)(*(void *)(a1 + 32) + 184) removeObject:*(void *)(a1 + 40)];
          [*(id *)(*(void *)(a1 + 32) + 288) removeObjectForKey:*(void *)(a1 + 40)];
          if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
          {
            uint64_t v33 = [*(id *)(*(void *)(a1 + 32) + 184) count];
            uint64_t v34 = *(id **)(a1 + 32);
            if (v33)
            {
              unint64_t v35 = [v34[23] count];
              double v36 = _ATLogCategoryDeviceSync();
              BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
              if (v35 > 5)
              {
                if (v37)
                {
                  uint64_t v44 = *(id **)(a1 + 32);
                  int v45 = [v44[23] count];
                  *(_DWORD *)buf = 138543618;
                  uint64_t v50 = v44;
                  __int16 v51 = 1024;
                  *(_DWORD *)uint64_t v52 = v45;
                  uint64_t v41 = "%{public}@ %d assets remaining.";
                  double v42 = v36;
                  uint32_t v43 = 18;
                  goto LABEL_32;
                }
              }
              else if (v37)
              {
                uint64_t v38 = *(id **)(a1 + 32);
                int v39 = [v38[23] count];
                uint64_t v40 = *(void *)(*(void *)(a1 + 32) + 184);
                *(_DWORD *)buf = 138543874;
                uint64_t v50 = v38;
                __int16 v51 = 1024;
                *(_DWORD *)uint64_t v52 = v39;
                *(_WORD *)&v52[4] = 2114;
                *(void *)&v52[6] = v40;
                uint64_t v41 = "%{public}@ %d assets remaining: %{public}@";
                double v42 = v36;
                uint32_t v43 = 28;
LABEL_32:
                _os_log_impl(&dword_1D9A2D000, v42, OS_LOG_TYPE_DEFAULT, v41, buf, v43);
              }

              goto LABEL_34;
            }
            [v34 _assetRequestsCompletedWithError:0];
          }
LABEL_34:

          return [*(id *)(*(void *)(a1 + 32) + 328) removeObject:*(void *)(a1 + 40)];
        }
        __int16 v22 = (void *)v21;
        uint64_t v23 = [*(id *)(a1 + 40) error];
        uint64_t v24 = [v23 domain];
        if ([v24 isEqualToString:@"ATError"])
        {
          uint64_t v25 = [*(id *)(a1 + 40) error];
          uint64_t v26 = [v25 code];

          if (v26 != 2) {
            goto LABEL_24;
          }
          __int16 v22 = [*(id *)(a1 + 32) session];
          uint64_t v27 = _ATLogCategoryDeviceSync();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            uint64_t v28 = *(void **)(a1 + 32);
            uint64_t v29 = [v28 error];
            __int16 v30 = [v22 error];
            *(_DWORD *)buf = 138543874;
            uint64_t v50 = (id *)v28;
            __int16 v51 = 2114;
            *(void *)uint64_t v52 = v29;
            *(_WORD *)&v52[8] = 2114;
            *(void *)&v52[10] = v30;
            _os_log_impl(&dword_1D9A2D000, v27, OS_LOG_TYPE_ERROR, "%{public}@: got cancelled asset. self.error=%{public}@, self.session.error=%{public}@", buf, 0x20u);
          }
          uint64_t v23 = [*(id *)(a1 + 32) error];
          if (v23)
          {
            [*(id *)(a1 + 40) setError:v23];
LABEL_23:

            goto LABEL_24;
          }
          uint64_t v24 = [v22 error];
          id v31 = *(void **)(a1 + 40);
          if (v24)
          {
            [v31 setError:v24];
          }
          else
          {
            uint64_t v32 = [v31 error];
            [*(id *)(a1 + 40) setError:v32];
          }
        }

        goto LABEL_23;
      }
      id v6 = *(id **)(a1 + 32);
      id v3 = [*(id *)(a1 + 40) shortDescription];
      uint64_t v7 = [*(id *)(a1 + 40) error];
      *(_DWORD *)buf = 138543874;
      uint64_t v50 = v6;
      __int16 v51 = 2114;
      *(void *)uint64_t v52 = v3;
      *(_WORD *)&v52[8] = 2114;
      *(void *)&v52[10] = v7;
      _os_log_impl(&dword_1D9A2D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Will treat asset %{public}@ with error=%{public}@ as finished.", buf, 0x20u);
    }
    goto LABEL_7;
  }
  return [*(id *)(*(void *)(a1 + 32) + 328) removeObject:*(void *)(a1 + 40)];
}

- (void)assetLinkController:(id)a3 didUpdateAsset:(id)a4
{
}

- (void)assetLinkController:(id)a3 didProcessFinishedAsset:(id)a4
{
}

- (void)assetLinkController:(id)a3 didFinishAsset:(id)a4
{
}

- (void)messageLink:(id)a3 didReceiveRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ATDeviceSyncSessionTask *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__ATDeviceSyncSessionAssetTask_messageLink_didReceiveRequest___block_invoke;
  block[3] = &unk_1E6B88BB8;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __62__ATDeviceSyncSessionAssetTask_messageLink_didReceiveRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) command];
  int v3 = [v2 isEqualToString:@"BeginAssetTask"];

  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v4 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    [v4 _handleBeginAssetTaskRequest:v5 onMessagLink:v6];
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) command];
    int v8 = [v7 isEqualToString:@"EndAssetTask"];

    if (v8)
    {
      uint64_t v10 = *(void *)(a1 + 32);
      id v9 = *(void **)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 48);
      [v9 _handleEndAssetTaskRequest:v10 onMessagLink:v11];
    }
    else
    {
      id v12 = [*(id *)(a1 + 32) command];
      int v13 = [v12 isEqualToString:@"RequestAsset"];

      if (v13)
      {
        uint64_t v15 = *(void *)(a1 + 32);
        id v14 = *(void **)(a1 + 40);
        uint64_t v16 = *(void *)(a1 + 48);
        [v14 _handleAssetRequest:v15 onMessagLink:v16];
      }
      else
      {
        __int16 v17 = [*(id *)(a1 + 32) command];
        int v18 = [v17 isEqualToString:@"UpdateAssetSessionTask"];

        if (v18)
        {
          uint64_t v20 = *(void *)(a1 + 32);
          __int16 v19 = *(void **)(a1 + 40);
          uint64_t v21 = *(void *)(a1 + 48);
          [v19 _handleUpdateSessionTaskRequest:v20 onMessageLink:v21];
        }
        else
        {
          __int16 v22 = [*(id *)(a1 + 32) command];
          int v23 = [v22 isEqualToString:@"AssetMetrics"];

          if (v23)
          {
            uint64_t v25 = *(void *)(a1 + 32);
            uint64_t v24 = *(void **)(a1 + 40);
            uint64_t v26 = *(void *)(a1 + 48);
            [v24 _handleInstalledAssetMetricsChanged:v25 onMessageLink:v26];
          }
          else
          {
            uint64_t v27 = [*(id *)(a1 + 32) command];
            int v28 = [v27 isEqualToString:@"FileProgress"];

            if (v28)
            {
              uint64_t v30 = *(void *)(a1 + 32);
              uint64_t v29 = *(void **)(a1 + 40);
              uint64_t v31 = *(void *)(a1 + 48);
              [v29 _handleAssetDownloadProgressed:v30 onMessageLink:v31];
            }
          }
        }
      }
    }
  }
}

- (void)updateProgressWithCount:(unint64_t)a3 totalItemCount:(unint64_t)a4
{
  [(ATSessionTask *)self setCompletedItemCount:a3];
  [(ATSessionTask *)self setTotalItemCount:a4];
  id v9 = [(ATSessionTask *)self totalBytesToTransfer];
  if ([v9 unsignedLongLongValue])
  {
    uint64_t v6 = [(ATSessionTask *)self totalBytesTransferred];
    double v7 = (double)(unint64_t)[v6 unsignedLongLongValue];
    int v8 = [(ATSessionTask *)self totalBytesToTransfer];
    -[ATSessionTask setProgress:](self, "setProgress:", v7 / (double)(unint64_t)[v8 unsignedLongLongValue]);
  }
  else
  {
    [(ATSessionTask *)self setProgress:0.0];
  }
}

- (id)sessionGroupingKey
{
  return @"ATDeviceSyncSessionAssetTaskGroupingKey";
}

- (void)cancel
{
  int v3 = [(ATDeviceSyncSessionTask *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__ATDeviceSyncSessionAssetTask_cancel__block_invoke;
  block[3] = &unk_1E6B88B40;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __38__ATDeviceSyncSessionAssetTask_cancel__block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isFinished]) {
    return;
  }
  uint64_t v2 = [*(id *)(a1 + 32) session];
  int v3 = [*(id *)(a1 + 32) error];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [v2 error];
    double v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:2 userInfo:0];
    }
    id v5 = v8;
  }
  id v9 = _ATLogCategoryDeviceSync();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = [*(id *)(v10 + 184) count];
    id v12 = [*(id *)(a1 + 32) error];
    int v13 = [v2 error];
    *(_DWORD *)buf = 138544386;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v11;
    __int16 v31 = 2114;
    id v32 = v5;
    __int16 v33 = 2114;
    uint64_t v34 = v12;
    __int16 v35 = 2114;
    double v36 = v13;
    _os_log_impl(&dword_1D9A2D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Cancelling task with %d assets remaining with error %{public}@, task error %{public}@, session error %{public}@ .", buf, 0x30u);
  }
  [*(id *)(a1 + 32) setCancelled:1];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 208), "removeObserver:");
  id v14 = [v5 domain];
  if ([v14 isEqualToString:@"ATError"])
  {
    uint64_t v15 = [v5 code];

    if (v15 == 8) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  uint64_t v16 = *(void *)(a1 + 32);
  __int16 v17 = *(void **)(v16 + 208);
  int v18 = [*(id *)(v16 + 184) array];
  __int16 v19 = (void *)[v18 copy];
  [v17 cancelAssets:v19 withError:v5 completion:0];

LABEL_15:
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v20 = *(id *)(*(void *)(a1 + 32) + 248);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        *(_OWORD *)buf = xmmword_1D9BA3030;
        CFReadStreamSignalEvent();
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v22);
  }

  [*(id *)(a1 + 32) _assetRequestsCompletedWithError:v5];
}

- (void)start
{
  int v3 = [(ATDeviceSyncSessionTask *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__ATDeviceSyncSessionAssetTask_start__block_invoke;
  block[3] = &unk_1E6B88B40;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __37__ATDeviceSyncSessionAssetTask_start__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 176));
  int v3 = _ATLogCategoryDeviceSync();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (WeakRetained)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9A2D000, v3, OS_LOG_TYPE_DEFAULT, "Asset Task starting", buf, 2u);
    }

    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    *(void *)(*(void *)(a1 + 32) + 264) = v5;
    [*(id *)(a1 + 32) _shouldDeviceReportSyncProgress];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __37__ATDeviceSyncSessionAssetTask_start__block_invoke_65;
    v8[3] = &unk_1E6B87E48;
    v8[4] = *(void *)(a1 + 32);
    [WeakRetained assetsToSyncWithCompletion:v8];
  }
  else
  {
    if (v4)
    {
      uint64_t v6 = *(void **)(a1 + 32);
      double v7 = [v6 dataClass];
      *(_DWORD *)buf = 138543618;
      uint64_t v10 = v6;
      __int16 v11 = 2114;
      id v12 = v7;
      _os_log_impl(&dword_1D9A2D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: no ATAssetClient for data class %{public}@", buf, 0x16u);
    }
    [*(id *)(a1 + 32) _finishTaskWithError:0];
  }
}

void __37__ATDeviceSyncSessionAssetTask_start__block_invoke_65(uint64_t a1, void *a2, void *a3)
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  __int16 v51 = v6;
  uint64_t v52 = v5;
  if (v5)
  {
    double v7 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v74 = v8;
      __int16 v75 = 2114;
      *(void *)long long v76 = v5;
      _os_log_impl(&dword_1D9A2D000, v7, OS_LOG_TYPE_ERROR, "%{public}@: failed to load assets.err=%{public}@", buf, 0x16u);
    }

    [*(id *)(a1 + 32) _assetRequestsCompletedWithError:v5];
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 184) addObjectsFromArray:v6];
    uint64_t v59 = a1;
    objc_msgSend(*(id *)(a1 + 32), "updateProgressWithCount:totalItemCount:", 0, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 184), "count"));
    uint64_t v53 = [MEMORY[0x1E4F1CA60] dictionary];
    memset(v85, 0, 32);
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    obuint64_t j = v51;
    uint64_t v9 = [obj countByEnumeratingWithState:&v67 objects:v84 count:16];
    if (v9)
    {
      unint64_t v56 = 0;
      uint64_t v57 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v68 != v57) {
            objc_enumerationMutation(obj);
          }
          __int16 v11 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          objc_copyWeak((id *)buf, (id *)(*(void *)(a1 + 32) + 176));
          [v11 setEnqueueSource:1];
          v65[0] = MEMORY[0x1E4F143A8];
          v65[1] = 3221225472;
          v65[2] = __37__ATDeviceSyncSessionAssetTask_start__block_invoke_66;
          v65[3] = &unk_1E6B87DF8;
          v65[4] = *(void *)(a1 + 32);
          objc_copyWeak(&v66, (id *)buf);
          [v11 setCompletionBlock:v65];
          id v12 = [v11 variantOptions];
          uint64_t v13 = [v12 objectForKey:@"AssetParts"];
          int v14 = [v13 charValue];

          ++v85[v14];
          if (v14 == 1)
          {
            uint64_t v15 = [v11 totalBytes];
            uint64_t v16 = [v11 assetType];
            if (v16)
            {
              __int16 v17 = [v53 objectForKey:v16];
              if (!v17)
              {
                __int16 v17 = objc_alloc_init(ATDetailedRequestInfoForAssetType);
                [v53 setObject:v17 forKey:v16];
              }
              uint64_t v18 = [v11 totalBytes];
              __int16 v19 = [v11 identifier];
              [(ATDetailedRequestInfoForAssetType *)v17 updateBytesToSync:v18 forItemIdentifier:v19];

              [(ATDetailedRequestInfoForAssetType *)v17 incrementAssetCountToSync];
            }

            v56 += v15;
          }
          objc_destroyWeak(&v66);
          objc_destroyWeak((id *)buf);
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v67 objects:v84 count:16];
      }
      while (v9);
    }
    else
    {
      unint64_t v56 = 0;
    }

    v58 = [MEMORY[0x1E4F1CA60] dictionary];
    for (uint64_t j = 0; j != 8; ++j)
    {
      if (v85[j])
      {
        uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
        uint64_t v22 = [NSNumber numberWithInt:j];
        uint64_t v23 = [v22 stringValue];
        [v58 setObject:v21 forKey:v23];
      }
    }
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id obja = [v58 allKeys];
    uint64_t v24 = [obja countByEnumeratingWithState:&v61 objects:v83 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v62;
      do
      {
        for (uint64_t k = 0; k != v24; ++k)
        {
          if (*(void *)v62 != v25) {
            objc_enumerationMutation(obja);
          }
          uint64_t v27 = *(void *)(*((void *)&v61 + 1) + 8 * k);
          v81[0] = @"TotalCount";
          long long v28 = [v58 objectForKey:v27];
          v81[1] = @"CompletedCount";
          v82[0] = v28;
          v82[1] = &unk_1F33DCAA0;
          uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:2];

          [*(id *)(*(void *)(a1 + 32) + 216) setObject:v29 forKey:v27];
        }
        uint64_t v24 = [obja countByEnumeratingWithState:&v61 objects:v83 count:16];
      }
      while (v24);
    }

    uint64_t v30 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v30 + 256))
    {
      int v32 = v85[1];
      int v31 = v85[2];
      if (v85[1] || v85[2] > 0x31u || v56 >= 0x100000)
      {
        __int16 v33 = _ATLogCategoryDeviceSync();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v34 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138544386;
          uint64_t v74 = v34;
          __int16 v75 = 1024;
          *(_DWORD *)long long v76 = v32;
          *(_WORD *)&v76[4] = 1024;
          *(_DWORD *)&v76[6] = v31;
          __int16 v77 = 2114;
          long long v78 = v53;
          __int16 v79 = 2048;
          unint64_t v80 = v56;
          _os_log_impl(&dword_1D9A2D000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: adding transport upgrade exception to message link - #total tracks: %u, #artwork: %u, request by assetType: %{public}@, #total bytes requested: %llu", buf, 0x2Cu);
        }

        __int16 v35 = [*(id *)(a1 + 32) messageLink];
        double v36 = [v35 socket];
        [v36 addTransportUpgradeException];

        *(unsigned char *)(*(void *)(a1 + 32) + 256) = 1;
        uint64_t v30 = *(void *)(a1 + 32);
      }
    }
    v71[0] = @"_BeginAssetTaskTotalCount";
    uint64_t v37 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(v30 + 184), "count"));
    v72[0] = v37;
    v72[1] = v58;
    v71[1] = @"_BeginAssetTaskDetailedCount";
    v71[2] = @"DetailedRequestByAssetType";
    uint64_t v38 = [*(id *)(a1 + 32) _serializedAssetRequestsFromRequestDictionary:v53];
    v72[2] = v38;
    v71[3] = @"_BeginAssetTaskTrackByteCount";
    int v39 = [NSNumber numberWithUnsignedLongLong:v56];
    v72[3] = v39;
    v71[4] = @"InstalledAssetMetrics";
    uint64_t v40 = *(void *)(*(void *)(a1 + 32) + 232);
    if (v40)
    {
      uint64_t v41 = *(void **)(*(void *)(v59 + 32) + 232);
    }
    else
    {
      uint64_t v41 = [MEMORY[0x1E4F1CA98] null];
    }
    v72[4] = v41;
    double v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:5];
    if (!v40) {

    }
    id v43 = objc_alloc(MEMORY[0x1E4F4A2D0]);
    uint64_t v44 = [*(id *)(v59 + 32) dataClass];
    int v45 = (void *)[v43 initWithCommand:@"BeginAssetTask" dataClass:v44 parameters:v42];

    int v46 = *(void **)(v59 + 32);
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __37__ATDeviceSyncSessionAssetTask_start__block_invoke_103;
    v60[3] = &unk_1E6B87E20;
    v60[4] = v46;
    [v46 sendRequest:v45 withCompletion:v60];
    if ([*(id *)(*(void *)(v59 + 32) + 184) count])
    {
      objc_msgSend(*(id *)(*(void *)(v59 + 32) + 208), "addObserver:");
      uint64_t v47 = *(void *)(v59 + 32);
      uint64_t v48 = *(void **)(v47 + 208);
      __int16 v49 = [*(id *)(v47 + 184) array];
      uint64_t v50 = (void *)[v49 copy];
      [v48 enqueueAssets:v50];
    }
    else
    {
      [*(id *)(v59 + 32) _assetRequestsCompletedWithError:0];
    }
  }
}

void __37__ATDeviceSyncSessionAssetTask_start__block_invoke_66(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 320);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__ATDeviceSyncSessionAssetTask_start__block_invoke_2;
  block[3] = &unk_1E6B87DD0;
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  dispatch_async(v5, block);
  objc_destroyWeak(&v10);
}

void __37__ATDeviceSyncSessionAssetTask_start__block_invoke_103(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6 || ([v5 error], double v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    id v8 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v12 = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_impl(&dword_1D9A2D000, v8, OS_LOG_TYPE_ERROR, "%{public}@: failed to send request. err=%{public}@", (uint8_t *)&v12, 0x16u);
    }

    id v10 = *(void **)(a1 + 32);
    if (v6)
    {
      [v10 _finishTaskWithError:v6];
    }
    else
    {
      __int16 v11 = [v5 error];
      [v10 _finishTaskWithError:v11];
    }
  }
}

void __37__ATDeviceSyncSessionAssetTask_start__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) error];
  int v3 = ATIsPendingDownloadError();

  if (v3)
  {
    id WeakRetained = _ATLogCategoryFramework();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = v5;
      __int16 v14 = 2114;
      uint64_t v15 = v6;
      _os_log_impl(&dword_1D9A2D000, WeakRetained, OS_LOG_TYPE_DEFAULT, "%{public}@ Not hooking up %{public}@ as it's begin downloading by another source", buf, 0x16u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    double v7 = *(void **)(a1 + 32);
    id v8 = [v7 error];
    [WeakRetained assetSync:v7 didCompleteWithError:v8];

    uint64_t v9 = [MEMORY[0x1E4F47890] sharedInstance];
    uint64_t v11 = *(void *)(a1 + 32);
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
    [v9 installCompleteForAssets:v10];
  }
}

- (ATDeviceSyncSessionAssetTask)initWithDataClass:(id)a3 onMessageLink:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v42.receiver = self;
  v42.super_class = (Class)ATDeviceSyncSessionAssetTask;
  uint64_t v4 = [(ATDeviceSyncSessionTask *)&v42 initWithDataClass:a3 onMessageLink:a4];
  if (v4)
  {
    uint64_t v5 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    clientAssetsRemaining = v4->_clientAssetsRemaining;
    v4->_clientAssetsRemaining = v5;

    double v7 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    clientAssetsInProgress = v4->_clientAssetsInProgress;
    v4->_clientAssetsInProgress = v7;

    uint64_t v9 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    serverAssetsInProgress = v4->_serverAssetsInProgress;
    v4->_serverAssetsInProgress = v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    finishedAssets = v4->_finishedAssets;
    v4->_finishedAssets = (NSMutableArray *)v11;

    uint64_t v13 = [MEMORY[0x1E4F47890] sharedInstance];
    assetController = v4->_assetController;
    v4->_assetController = (ATAssetLinkController *)v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
    detailedProgress = v4->_detailedProgress;
    v4->_detailedProgress = (NSMutableDictionary *)v15;

    uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
    syncProgresByAssetType = v4->_syncProgresByAssetType;
    v4->_syncProgresByAssetType = (NSMutableDictionary *)v17;

    __int16 v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    assetStreams = v4->_assetStreams;
    v4->_assetStreams = v19;

    v4->_addedTransportUpgradeException = 0;
    v4->_totalAssetSize = 0;
    v4->_retrySendingAssetMetricsCount = 0;
    uint64_t v21 = (objc_class *)objc_opt_class();
    Name = class_getName(v21);
    dispatch_queue_t v23 = dispatch_queue_create(Name, 0);
    workQueue = v4->_workQueue;
    v4->_workQueue = (OS_dispatch_queue *)v23;

    uint64_t v25 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    assetToBytesMap = v4->_assetToBytesMap;
    v4->_assetToBytesMap = (NSMapTable *)v25;

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v27 = +[ATClientController sharedInstance];
    long long v28 = [v27 allClients];

    uint64_t v29 = [v28 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v39;
      while (2)
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v39 != v31) {
            objc_enumerationMutation(v28);
          }
          __int16 v33 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          if ([v33 conformsToProtocol:&unk_1F33F0590])
          {
            uint64_t v34 = [v33 assetDataClass];
            __int16 v35 = [(ATSessionTask *)v4 dataClass];
            int v36 = [v34 isEqualToString:v35];

            if (v36)
            {
              objc_storeWeak((id *)&v4->_assetClient, v33);
              goto LABEL_13;
            }
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v38 objects:v43 count:16];
        if (v30) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v4;
}

@end