@interface ATLegacyDeviceSyncManager
+ (id)legacyDeviceSyncManager;
- (ATLegacyDeviceSyncManager)init;
- (ATSession)syncSession;
- (BOOL)_currentLinkIsWifiConnection;
- (NSDictionary)currentSyncHostInfo;
- (id)_currentHostType;
- (id)currentSyncState;
- (void)_cancelExistingSyncSession;
- (void)_handleAssetMetricsMessage:(id)a3 fromLink:(id)a4;
- (void)_handleCapabilitiesMessage:(id)a3 fromLink:(id)a4;
- (void)_handleFinishedSyncingMetadataMessage:(id)a3 fromLink:(id)a4;
- (void)_handleHostInfoMessage:(id)a3 fromLink:(id)a4;
- (void)_handleRequestingSyncMessage:(id)a3 fromLink:(id)a4;
- (void)_handleSyncFailedMessage:(id)a3 fromLink:(id)a4;
- (void)_handleSyncStatusMessage:(id)a3 fromLink:(id)a4;
- (void)_reconcileSyncWithMessage:(id)a3;
- (void)_reportLocalProgress;
- (void)_reset;
- (void)_sendDiskUsage;
- (void)_sendDiskUsageWithUpdatedDataClasses:(id)a3;
- (void)_sendInstalledAssets;
- (void)_sendSyncAllowed;
- (void)assetLink:(id)a3 didUpdateOverallProgress:(double)a4;
- (void)cancelSyncOnMessageLink:(id)a3;
- (void)environmentMonitorDidChangePower:(id)a3;
- (void)initiateSyncForLibrary:(id)a3 onMessageLink:(id)a4;
- (void)messageLinkWasClosed:(id)a3;
- (void)messageLinkWasInitialized:(id)a3;
- (void)messageLinkWasOpened:(id)a3;
- (void)session:(id)a3 didBeginSessionTask:(id)a4;
- (void)session:(id)a3 didUpdateSessionTask:(id)a4;
- (void)session:(id)a3 willBeginSessionTask:(id)a4;
- (void)sessionDidFinish:(id)a3;
- (void)sessionWillBegin:(id)a3;
- (void)setCurrentSyncHostInfo:(id)a3;
- (void)setSyncSession:(id)a3;
@end

@implementation ATLegacyDeviceSyncManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSyncHostInfo, 0);
  objc_storeStrong((id *)&self->_syncSession, 0);
  objc_storeStrong((id *)&self->_dataClassesWithUpdatedDiskUsage, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_currentStatus, 0);
  objc_storeStrong((id *)&self->_currentDataclass, 0);
  objc_storeStrong((id *)&self->_dataclassTimers, 0);
  objc_storeStrong(&self->_clientProgressCallback, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_dataclasses, 0);
  objc_storeStrong((id *)&self->_assetLink, 0);
  objc_storeStrong((id *)&self->_currentMessageLink, 0);
  objc_storeStrong((id *)&self->_messageLinks, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_diskUsageProvider, 0);
  objc_storeStrong((id *)&self->_clientController, 0);

  objc_storeStrong((id *)&self->_defaults, 0);
}

- (void)setCurrentSyncHostInfo:(id)a3
{
}

- (NSDictionary)currentSyncHostInfo
{
  return self->_currentSyncHostInfo;
}

- (void)setSyncSession:(id)a3
{
}

- (ATSession)syncSession
{
  return self->_syncSession;
}

- (void)_cancelExistingSyncSession
{
  if (self->_syncSession)
  {
    v3 = _ATLogCategoryiTunesSync();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D9A2D000, v3, OS_LOG_TYPE_DEFAULT, "Canceling existing sync session.", v7, 2u);
    }

    [(ATSession *)self->_syncSession cancel];
    [(ATSession *)self->_syncSession removeObserver:self];
    syncSession = self->_syncSession;
    self->_syncSession = 0;

    assetLink = self->_assetLink;
    if (assetLink)
    {
      [(ATLegacyAssetLink *)assetLink close];
      v6 = self->_assetLink;
      self->_assetLink = 0;
    }
  }
}

- (id)_currentHostType
{
  v3 = [(NSDictionary *)self->_currentSyncHostInfo objectForKey:@"Type"];
  if (!v3)
  {
    v4 = [(NSDictionary *)self->_currentSyncHostInfo objectForKey:@"Version"];
    v5 = v4;
    if (v4 && ([v4 isEqualToString:@"IGNORE"] & 1) != 0) {
      v3 = @"Configurator";
    }
    else {
      v3 = @"iTunes";
    }
  }

  return v3;
}

- (void)_reset
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = _ATLogCategoryiTunesSync();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    v9 = self;
    _os_log_impl(&dword_1D9A2D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Resetting.", (uint8_t *)&v8, 0xCu);
  }

  if (self->_grappaId)
  {
    PIc2v4FsmbHb6FcVO9Fu();
    self->_grappaId = 0;
  }
  self->_localSyncRequest = 0;
  self->_localSyncRequestCanceled = 0;
  self->_automaticSync = 0;
  self->_currentStage = 0;
  currentDataclass = self->_currentDataclass;
  self->_currentDataclass = 0;

  currentStatus = self->_currentStatus;
  self->_currentStatus = 0;

  self->_currentOverallProgress = 0.0;
  currentMessageLink = self->_currentMessageLink;
  self->_currentMessageLink = 0;

  [(ATLegacyDeviceSyncManager *)self _reportLocalProgress];
  dataclasses = self->_dataclasses;
  self->_dataclasses = 0;

  [(ATLegacyDeviceSyncManager *)self _sendSyncAllowed];
}

- (void)_reportLocalProgress
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v3 = +[ATAssetManager sharedInstance];
  currentMessageLink = self->_currentMessageLink;
  if (currentMessageLink)
  {
    v5 = [(ATConcreteMessageLink *)currentMessageLink identifier];

    if (v5)
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      obj = self->_dataclasses;
      uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v46 objects:v52 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v47 != v8) {
              objc_enumerationMutation(obj);
            }
            uint64_t v10 = *(void *)(*((void *)&v46 + 1) + 8 * i);
            id v11 = objc_alloc_init(MEMORY[0x1E4F4A2E8]);
            v12 = [(ATConcreteMessageLink *)self->_currentMessageLink identifier];
            [v11 setLibraryID:v12];

            [v11 setDataClass:v10];
            [v11 setSyncStage:self->_currentStage];
            [v11 setLocalizedDescription:self->_currentStatus];
            uint64_t v51 = v10;
            v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
            objc_msgSend(v11, "setTotalAssetCount:", objc_msgSend(v3, "totalAssetCountForDataClasses:", v13));

            uint64_t v50 = v10;
            v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
            objc_msgSend(v11, "setCompletedAssetCount:", objc_msgSend(v3, "completedAssetCountForDataClasses:", v14));

            [v11 setAutomaticSync:self->_automaticSync];
            objc_msgSend(v11, "setWirelessSync:", -[ATLockdownMessageLink isWifiConnection](self->_currentMessageLink, "isWifiConnection"));
            if ([v11 totalAssetCount])
            {
              float v15 = (float)(unint64_t)[v11 completedAssetCount];
              *(float *)&double v16 = v15 / (float)(unint64_t)[v11 totalAssetCount];
              [v11 setProgress:v16];
            }
            v17 = [MEMORY[0x1E4F478E0] sharedMonitor];
            [v17 updateStatus:v11];
          }
          uint64_t v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v46 objects:v52 count:16];
        }
        while (v7);
      }
    }
  }
  v18 = [MEMORY[0x1E4F1CA60] dictionary];
  v19 = [NSNumber numberWithInt:self->_syncSession != 0];
  [v18 setObject:v19 forKey:@"Enabled"];

  v20 = NSNumber;
  v21 = self->_currentMessageLink;
  if (v21) {
    uint64_t v22 = [(ATLockdownMessageLink *)v21 isWifiConnection];
  }
  else {
    uint64_t v22 = 0;
  }
  v23 = [v20 numberWithInt:v22];
  [v18 setObject:v23 forKey:@"Wireless"];

  v24 = [NSNumber numberWithBool:self->_automaticSync];
  [v18 setObject:v24 forKey:@"AutoSync"];

  v25 = [NSNumber numberWithUnsignedInt:self->_currentStage];
  [v18 setObject:v25 forKey:@"SyncStage"];

  v26 = [(NSMutableArray *)self->_messageLinks valueForKey:@"identifier"];
  [v18 setObject:v26 forKey:@"ConnectedLibraries"];

  v27 = [(ATConcreteMessageLink *)self->_currentMessageLink identifier];

  if (v27)
  {
    v28 = [(ATConcreteMessageLink *)self->_currentMessageLink identifier];
    [v18 setObject:v28 forKey:@"ActiveLibrary"];
  }
  currentDataclass = self->_currentDataclass;
  if (currentDataclass) {
    [v18 setObject:currentDataclass forKey:@"Dataclass"];
  }
  currentStatus = self->_currentStatus;
  if (currentStatus) {
    [v18 setObject:currentStatus forKey:@"StatusMessage"];
  }
  if (self->_currentStage == 4)
  {
    uint64_t v31 = [v3 totalAssetCountForDataClasses:self->_dataclasses];
    uint64_t v32 = [v3 completedAssetCountForDataClasses:self->_dataclasses];
    v33 = [NSNumber numberWithUnsignedInteger:v31];
    [v18 setObject:v33 forKey:@"AssetCount"];

    v34 = [NSNumber numberWithUnsignedInteger:v32];
    [v18 setObject:v34 forKey:@"CurrentAssetNum"];

    v35 = [NSNumber numberWithDouble:self->_currentOverallProgress];
    [v18 setObject:v35 forKey:@"OverallProgress"];

    currentAsset = self->_currentAsset;
    if (currentAsset)
    {
      v37 = NSNumber;
      [(ATAsset *)currentAsset downloadProgress];
      v38 = objc_msgSend(v37, "numberWithFloat:");
      [v18 setObject:v38 forKey:@"AssetProgress"];

      v39 = [(ATAsset *)self->_currentAsset identifier];

      if (v39)
      {
        v40 = [(ATAsset *)self->_currentAsset identifier];
        [v18 setObject:v40 forKey:@"CurrentAssetID"];
      }
      v41 = [(ATAsset *)self->_currentAsset prettyName];

      if (v41)
      {
        v42 = [(ATAsset *)self->_currentAsset prettyName];
        [v18 setObject:v42 forKey:@"CurrentAsset"];
      }
    }
    v43 = [v3 assetProgressForAllDataclasses];
    [v18 setObject:v43 forKey:@"DataclassProgress"];
  }
  v44 = [MEMORY[0x1E4F478E0] sharedMonitor];
  [v44 updateStatusValuesWithDictionary:v18];
}

- (BOOL)_currentLinkIsWifiConnection
{
  return [(ATLockdownMessageLink *)self->_currentMessageLink isWifiConnection];
}

- (void)_reconcileSyncWithMessage:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_currentStage = 3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"Media", @"Book", @"Application", @"Photo", @"Podcasts", 0);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v21 = self;
  id obj = [(ATSession *)self->_syncSession sessionTasksWithGroupingKey:@"ATLegacySyncSessionTaskGroupingKey"];
  uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
        id v11 = [v4 parameterForKey:@"SyncTypes"];
        v12 = [v10 dataClass];
        v13 = [v11 objectForKey:v12];
        uint64_t v14 = [v13 unsignedIntValue];

        float v15 = [v4 parameterForKey:@"DataclassAnchors"];
        double v16 = [v10 dataClass];
        v17 = [v15 objectForKey:v16];

        v18 = [v10 dataClass];
        LODWORD(v16) = [v5 containsObject:v18];

        if (v16 && v14)
        {
          dataClassesWithUpdatedDiskUsage = v21->_dataClassesWithUpdatedDiskUsage;
          v20 = [v10 dataClass];
          [(NSMutableSet *)dataClassesWithUpdatedDiskUsage addObject:v20];
        }
        [v10 reconcileWithAnchor:v17 syncType:v14];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }

  [(ATLegacyDeviceSyncManager *)v21 _reportLocalProgress];
}

- (void)_sendSyncAllowed
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F74230] sharedConnection];
  v34 = ATGetDisabledAssetTypes(self->_clientController);
  id v4 = [MEMORY[0x1E4FB8708] sharedSecurityInfo];
  unsigned int v33 = [v4 isDeviceClassCUnlocked];

  int v31 = [v3 effectiveBoolValueForSetting:*MEMORY[0x1E4F73F00]];
  int v30 = [v3 effectiveBoolValueForSetting:*MEMORY[0x1E4F73F08]];
  unsigned int v29 = [v3 isEphemeralMultiUser];
  unsigned int v28 = _os_feature_enabled_impl();
  long long v25 = v3;
  v5 = [v3 cloudConfigurationDetails];
  uint64_t v6 = [v5 objectForKey:*MEMORY[0x1E4F74270]];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v32 = self;
  id obj = self->_messageLinks;
  uint64_t v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v27 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v36 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(ATLegacyMessageLink **)(*((void *)&v35 + 1) + 8 * i);
        currentMessageLink = v32->_currentMessageLink;
        if (currentMessageLink) {
          BOOL v12 = v10 == currentMessageLink;
        }
        else {
          BOOL v12 = 1;
        }
        if (v12) {
          uint64_t v13 = v33;
        }
        else {
          uint64_t v13 = 0;
        }
        if (v13 == 1)
        {
          uint64_t v14 = [MEMORY[0x1E4FB8618] sharedMonitor];
          uint64_t v15 = [v14 isCharging];
        }
        else
        {
          uint64_t v15 = 0;
        }
        double v16 = objc_opt_new();
        v17 = [NSNumber numberWithBool:v15];
        [v16 setObject:v17 forKey:@"AutoSync"];

        v18 = [NSNumber numberWithBool:v13];
        [v16 setObject:v18 forKey:@"ManualSync"];

        [v16 setObject:v34 forKey:@"DisabledAssetTypes"];
        [v16 setObject:MEMORY[0x1E4F1CC38] forKey:@"PurgeAllowed"];
        v19 = [NSNumber numberWithBool:v33 ^ 1];
        [v16 setObject:v19 forKey:@"DataProtected"];

        v20 = [NSNumber numberWithBool:v31 != 2];
        [v16 setObject:v20 forKey:@"AppInstallationAllowed"];

        v21 = [NSNumber numberWithBool:v30 != 2];
        [v16 setObject:v21 forKey:@"AppRemovalAllowed"];

        uint64_t v22 = [NSNumber numberWithBool:v29];
        [v16 setObject:v22 forKey:@"EducationModeEnabled"];

        long long v23 = [NSNumber numberWithBool:v28];
        [v16 setObject:v23 forKey:@"SupportsFavorites"];

        if (v6) {
          [v16 setObject:v6 forKey:@"ManagedOrganizationName"];
        }
        long long v24 = [MEMORY[0x1E4F4A2C0] messageWithName:@"SyncAllowed" parameters:v16];
        [(ATLegacyMessageLink *)v10 sendMessage:v24 withCompletion:&__block_literal_global_303];
      }
      uint64_t v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v8);
  }
}

- (void)_sendDiskUsageWithUpdatedDataClasses:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _ATLogCategoryiTunesSync();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v4;
    _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "Sending updated disk usage with updated dataclasses %{public}@", buf, 0xCu);
  }

  if (v4)
  {
    diskUsageProvider = self->_diskUsageProvider;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__ATLegacyDeviceSyncManager__sendDiskUsageWithUpdatedDataClasses___block_invoke;
    v10[3] = &unk_1E6B887F8;
    v10[4] = self;
    [(ATDeviceDiskUsageProvider *)diskUsageProvider getCurrentUsageWithUpdatedDataClasses:v4 withCompletion:v10];
  }
  else
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    self->_lastDiskUsageUpdateTime = v7;
    uint64_t v8 = self->_diskUsageProvider;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__ATLegacyDeviceSyncManager__sendDiskUsageWithUpdatedDataClasses___block_invoke_4;
    v9[3] = &unk_1E6B887F8;
    v9[4] = self;
    [(ATDeviceDiskUsageProvider *)v8 getUpdatedUsageWithCompletion:v9];
  }
}

void __66__ATLegacyDeviceSyncManager__sendDiskUsageWithUpdatedDataClasses___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 56);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__ATLegacyDeviceSyncManager__sendDiskUsageWithUpdatedDataClasses___block_invoke_2;
  v7[3] = &unk_1E6B88B68;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __66__ATLegacyDeviceSyncManager__sendDiskUsageWithUpdatedDataClasses___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 56);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__ATLegacyDeviceSyncManager__sendDiskUsageWithUpdatedDataClasses___block_invoke_5;
  v7[3] = &unk_1E6B88B68;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __66__ATLegacyDeviceSyncManager__sendDiskUsageWithUpdatedDataClasses___block_invoke_5(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 64);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        id v8 = objc_msgSend(MEMORY[0x1E4F4A2C0], "messageWithName:parameters:", @"AssetMetrics", *(void *)(a1 + 40), (void)v9);
        [v7 sendMessage:v8 withCompletion:&__block_literal_global_272];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

void __66__ATLegacyDeviceSyncManager__sendDiskUsageWithUpdatedDataClasses___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 64);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        id v8 = objc_msgSend(MEMORY[0x1E4F4A2C0], "messageWithName:parameters:", @"AssetMetrics", *(void *)(a1 + 40), (void)v9);
        [v7 sendMessage:v8 withCompletion:&__block_literal_global_270];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)_sendDiskUsage
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v4 = v3;
  double v5 = v3 - self->_lastDiskUsageUpdateTime;
  uint64_t v6 = _ATLogCategoryiTunesSync();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v26 = v5;
    _os_log_impl(&dword_1D9A2D000, v6, OS_LOG_TYPE_DEFAULT, "Sending disk usage. lastUpdate=%.2fs ago", buf, 0xCu);
  }

  double v7 = [(ATDeviceDiskUsageProvider *)self->_diskUsageProvider getCurrentUsage];
  BOOL v8 = ![v7 count] || self->_lastDiskUsageUpdateTime == 0.0 || v5 > 600.0;
  if ([v7 count])
  {
    BOOL v17 = v8;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v18 = self;
    long long v9 = self->_messageLinks;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v15 = [MEMORY[0x1E4F4A2C0] messageWithName:@"AssetMetrics" parameters:v7];
          [v14 sendMessage:v15 withCompletion:&__block_literal_global_265];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    self = v18;
    BOOL v8 = v17;
  }
  if (v8)
  {
    self->_lastDiskUsageUpdateTime = v4;
    diskUsageProvider = self->_diskUsageProvider;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __43__ATLegacyDeviceSyncManager__sendDiskUsage__block_invoke_2;
    v19[3] = &unk_1E6B887F8;
    v19[4] = self;
    [(ATDeviceDiskUsageProvider *)diskUsageProvider getUpdatedUsageWithCompletion:v19];
  }
}

void __43__ATLegacyDeviceSyncManager__sendDiskUsage__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  double v5 = *(NSObject **)(v4 + 56);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__ATLegacyDeviceSyncManager__sendDiskUsage__block_invoke_3;
  v7[3] = &unk_1E6B88B68;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __43__ATLegacyDeviceSyncManager__sendDiskUsage__block_invoke_3(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 64);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        id v8 = objc_msgSend(MEMORY[0x1E4F4A2C0], "messageWithName:parameters:", @"AssetMetrics", *(void *)(a1 + 40), (void)v9);
        [v7 sendMessage:v8 withCompletion:&__block_literal_global_267];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)_sendInstalledAssets
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"Application", @"Ringtone", @"Media", @"VoiceMemo", @"Book", @"Data", @"Keybag", @"Photo", @"Proofing", @"MessagePart", @"Logs", @"UserData", @"Podcasts", @"File", 0);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        long long v9 = [(ATClientController *)self->_clientController clientForDataclass:v8];
        if (objc_opt_respondsToSelector())
        {
          long long v10 = [v9 installedAssets];
          if (v10) {
            [v3 setObject:v10 forKey:v8];
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v5);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v11 = self->_messageLinks;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = *(void **)(*((void *)&v19 + 1) + 8 * j);
        BOOL v17 = [MEMORY[0x1E4F4A2C0] messageWithName:@"InstalledAssets" parameters:v3];
        [v16 sendMessage:v17 withCompletion:&__block_literal_global_262];
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v13);
  }
}

- (void)_handleSyncStatusMessage:(id)a3 fromLink:(id)a4
{
  objc_msgSend(a3, "parameterForKey:", @"StatusMessage", a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_currentStatus, v5);
  [(ATSession *)self->_syncSession setLocalizedDescription:v5];
  [(ATLegacyDeviceSyncManager *)self _reportLocalProgress];
}

- (void)_handleAssetMetricsMessage:(id)a3 fromLink:(id)a4
{
  objc_msgSend(a3, "parameterForKey:", @"Dataclasses", a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(ATLegacyDeviceSyncManager *)self _sendDiskUsageWithUpdatedDataClasses:v5];
}

- (void)_handleSyncFailedMessage:(id)a3 fromLink:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (self->_syncSession)
  {
    int v7 = [v11 sessionNumber];
    if (v7 == [MEMORY[0x1E4F4A2C0] currentSessionNumber])
    {
      uint64_t v8 = [v11 parameterForKey:@"ErrorCode"];
      uint64_t v9 = [v8 intValue] == 2 ? 8 : 1;

      long long v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:v9 userInfo:0];
      [(ATSession *)self->_syncSession setError:v10];

      [(ATSession *)self->_syncSession cancel];
      if (self->_cacheDeleteToken)
      {
        CacheDeleteCancelPurge();
        self->_cacheDeleteToken = 0;
      }
    }
  }
}

- (void)_handleFinishedSyncingMetadataMessage:(id)a3 fromLink:(id)a4
{
  v26[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  syncSession = self->_syncSession;
  if (!syncSession
    || ([(ATSession *)syncSession isCancelled] & 1) != 0
    || [(ATSession *)self->_syncSession isFinished])
  {
    uint64_t v9 = _ATLogCategoryiTunesSync();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      long long v20 = self;
      _os_log_impl(&dword_1D9A2D000, v9, OS_LOG_TYPE_ERROR, "%{public}@ no active sync session - failing sync", buf, 0xCu);
    }

    long long v10 = objc_msgSend(MEMORY[0x1E4F4A2C0], "messageWithName:parameters:session:", @"SyncFailed", &unk_1F33DCCC0, objc_msgSend(v6, "sessionNumber"));
    [v7 sendMessage:v10 withCompletion:&__block_literal_global_185];
  }
  else
  {
    int v11 = [v6 sessionNumber];
    if (v11 == [MEMORY[0x1E4F4A2C0] currentSessionNumber])
    {
      long long v10 = [v6 parameterForKey:@"PurgeDataBytes"];
      uint64_t v12 = [v10 unsignedLongLongValue];
      if (v12)
      {
        uint64_t v13 = v12;
        [(ATSession *)self->_syncSession setSuspended:1];
        uint64_t v14 = _ATLogCategoryiTunesSync();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          long long v20 = self;
          __int16 v21 = 2048;
          *(void *)long long v22 = v13;
          _os_log_impl(&dword_1D9A2D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Requesting purge for %lld bytes", buf, 0x16u);
        }

        v26[0] = @"/private/var";
        v25[0] = @"CACHE_DELETE_VOLUME";
        v25[1] = @"CACHE_DELETE_AMOUNT";
        uint64_t v15 = [NSNumber numberWithUnsignedLongLong:v13];
        v25[2] = @"CACHE_DELETE_PURGE_TIMEOUT";
        v26[1] = v15;
        v26[2] = &unk_1F33DCB78;
        double v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];

        [MEMORY[0x1E4F79AF8] setAutoFilledTracksArePurgeable:0];
        id v17 = v16;
        self->_cacheDeleteToken = (CacheDeleteToken *)CacheDeletePurgeSpaceWithInfo();
      }
      [(ATLegacyDeviceSyncManager *)self _reconcileSyncWithMessage:v6];
    }
    else
    {
      v18 = _ATLogCategoryiTunesSync();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544130;
        long long v20 = self;
        __int16 v21 = 1024;
        *(_DWORD *)long long v22 = [v6 sessionNumber];
        *(_WORD *)&v22[4] = 1024;
        *(_DWORD *)&v22[6] = [MEMORY[0x1E4F4A2C0] currentSessionNumber];
        __int16 v23 = 2114;
        long long v24 = @"FinishedSyncingMetadata";
        _os_log_impl(&dword_1D9A2D000, v18, OS_LOG_TYPE_ERROR, "%{public}@ Session numbers are different - ATLegacyMessage:(%d), ATLegacySession:(%d), ignoring message %{public}@ and cancelling current sync session", buf, 0x22u);
      }

      long long v10 = objc_msgSend(MEMORY[0x1E4F4A2C0], "messageWithName:parameters:session:", @"SyncFailed", &unk_1F33DCCE8, objc_msgSend(v6, "sessionNumber"));
      [v7 sendMessage:v10 withCompletion:&__block_literal_global_213];
      [(ATLegacyDeviceSyncManager *)self _cancelExistingSyncSession];
    }
  }
}

void __76__ATLegacyDeviceSyncManager__handleFinishedSyncingMetadataMessage_fromLink___block_invoke_204(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F79AF8] setAutoFilledTracksArePurgeable:1];
  uint64_t v4 = _ATLogCategoryiTunesSync();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = v5;
    __int16 v17 = 2114;
    uint64_t v18 = v6;
    _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Captured %{public}@", buf, 0x16u);
  }

  id v7 = [a2 objectForKey:@"CACHE_DELETE_AMOUNT"];
  uint64_t v8 = [v7 longLongValue];

  uint64_t v9 = _ATLogCategoryiTunesSync();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = a1[4];
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = v10;
    __int16 v17 = 2048;
    uint64_t v18 = v8;
    _os_log_impl(&dword_1D9A2D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Purged %lld bytes", buf, 0x16u);
  }

  uint64_t v11 = a1[4];
  uint64_t v12 = *(NSObject **)(v11 + 56);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__ATLegacyDeviceSyncManager__handleFinishedSyncingMetadataMessage_fromLink___block_invoke_205;
  block[3] = &unk_1E6B887A8;
  uint64_t v13 = a1[6];
  block[5] = v8;
  block[6] = v13;
  block[4] = v11;
  dispatch_async(v12, block);
}

uint64_t __76__ATLegacyDeviceSyncManager__handleFinishedSyncingMetadataMessage_fromLink___block_invoke_205(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a1[5] >= a1[6])
  {
    uint64_t v6 = *(void **)(a1[4] + 208);
    return [v6 setSuspended:0];
  }
  else
  {
    id v2 = _ATLogCategoryiTunesSync();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = a1[5];
      uint64_t v4 = a1[6];
      int v7 = 134218240;
      uint64_t v8 = v3;
      __int16 v9 = 2048;
      uint64_t v10 = v4;
      _os_log_impl(&dword_1D9A2D000, v2, OS_LOG_TYPE_DEFAULT, "CacheDelete purged %lli of %lli requested", (uint8_t *)&v7, 0x16u);
    }

    return [*(id *)(a1[4] + 208) setSuspended:0];
  }
}

- (void)_handleRequestingSyncMessage:(id)a3 fromLink:(id)a4
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 parameterForKey:@"HostInfo"];
  if (v8)
  {
    defaults = self->_defaults;
    uint64_t v10 = ATGetDisabledAssetTypes(self->_clientController);
    [(ATUserDefaults *)defaults updateHostInfo:v8 disabledAssetTypes:v10];
  }
  v91 = self;
  [(ATLegacyDeviceSyncManager *)self setCurrentSyncHostInfo:v8];
  uint64_t v11 = [v8 objectForKey:@"Version"];
  uint64_t v12 = v11;
  if (v11)
  {
    if ([v11 isEqualToString:@"IGNORE"])
    {
      uint64_t v13 = _ATLogCategoryiTunesSync();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D9A2D000, v13, OS_LOG_TYPE_INFO, "Explicitly ignoring version check", buf, 2u);
      }

LABEL_12:
      uint64_t v15 = [MEMORY[0x1E4F74230] sharedConnection];
      int v16 = [v15 isEphemeralMultiUser];
      __int16 v17 = [(ATLegacyDeviceSyncManager *)v91 _currentHostType];
      char v18 = [v17 isEqualToString:@"Configurator"];

      if (v16 && (v18 & 1) == 0)
      {
        uint64_t v19 = _ATLogCategoryiTunesSync();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D9A2D000, v19, OS_LOG_TYPE_ERROR, "Sending sync disallowed because we are in multi-user mode", buf, 2u);
        }

        long long v20 = (__CFString *)objc_opt_new();
        [(__CFString *)v20 setObject:&unk_1F33DCB18 forKey:@"ErrorCode"];
        __int16 v21 = [NSNumber numberWithBool:1];
        [(__CFString *)v20 setObject:v21 forKey:@"EducationModeEnabled"];

        long long v22 = [v15 cloudConfigurationDetails];
        __int16 v23 = [v22 objectForKey:*MEMORY[0x1E4F74270]];

        if (v23) {
          [(__CFString *)v20 setObject:v23 forKey:@"ManagedOrganizationName"];
        }
        long long v24 = objc_msgSend(MEMORY[0x1E4F4A2C0], "messageWithName:parameters:session:", @"SyncFailed", v20, objc_msgSend(v6, "sessionNumber"));
        [v7 sendMessage:v24 withCompletion:&__block_literal_global_129];
LABEL_67:

        goto LABEL_68;
      }
      v88 = v15;
      p_id currentMessageLink = (id *)&v91->_currentMessageLink;
      long long v20 = [(ATConcreteMessageLink *)v91->_currentMessageLink identifier];
      long long v26 = [v6 parameterForKey:@"HostInfo"];
      __int16 v23 = [v26 objectForKey:@"LibraryID"];

      id currentMessageLink = v91->_currentMessageLink;
      if (currentMessageLink != v7 && currentMessageLink && v20)
      {
        if (![v23 isEqualToString:v20])
        {
          v39 = _ATLogCategoryiTunesSync();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v111 = v23;
            __int16 v112 = 2114;
            v113 = v20;
            _os_log_impl(&dword_1D9A2D000, v39, OS_LOG_TYPE_ERROR, "Sending sync disallowed message to %{public}@, already syncing with %{public}@", buf, 0x16u);
          }

          long long v24 = objc_msgSend(MEMORY[0x1E4F4A2C0], "messageWithName:parameters:session:", @"SyncFailed", &unk_1F33DCC48, objc_msgSend(v6, "sessionNumber"));
          [v7 sendMessage:v24 withCompletion:&__block_literal_global_136];
          uint64_t v15 = v88;
          goto LABEL_67;
        }
        id currentMessageLink = *p_currentMessageLink;
      }
      v87 = v12;
      if (currentMessageLink == v7 && v91->_localSyncRequestCanceled)
      {
        long long v38 = _ATLogCategoryiTunesSync();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v111 = v23;
          _os_log_impl(&dword_1D9A2D000, v38, OS_LOG_TYPE_ERROR, "Sending sync canceled message to %{public}@, canceled before we started", buf, 0xCu);
        }

        long long v24 = objc_msgSend(MEMORY[0x1E4F4A2C0], "messageWithName:parameters:session:", @"SyncFailed", &unk_1F33DCC70, objc_msgSend(v6, "sessionNumber"));
        [v7 sendMessage:v24 withCompletion:&__block_literal_global_145];
        v91->_localSyncRequestCanceled = 0;
        uint64_t v15 = v88;
      }
      else
      {
        v84 = v23;
        v85 = v8;
        unsigned int v28 = [v6 parameterForKey:@"HostInfo"];
        uint64_t v29 = [v28 objectForKey:@"Grappa"];
        uint64_t v30 = ATGrappaEstablishSession(v29, &v91->_grappaId);

        v86 = (void *)v30;
        if (v30)
        {
          v81 = v20;
          [(ATLegacyDeviceSyncManager *)v91 _cancelExistingSyncSession];
          objc_msgSend(MEMORY[0x1E4F4A2C0], "setSessionNumber:", objc_msgSend(v6, "sessionNumber"));
          objc_storeStrong(p_currentMessageLink, a4);
          int v31 = v91->_defaults;
          uint64_t v32 = [v6 parameterForKey:@"HostInfo"];
          unsigned int v33 = ATGetDisabledAssetTypes(v91->_clientController);
          [(ATUserDefaults *)v31 updateHostInfo:v32 disabledAssetTypes:v33];

          v34 = [v6 parameterForKey:@"Dataclasses"];
          uint64_t v35 = [v34 mutableCopy];
          dataclasses = v91->_dataclasses;
          v91->_dataclasses = (NSMutableArray *)v35;

          v91->_localSyncRequest = 0;
          v82 = v7;
          v83 = v6;
          if ([(ATLegacyDeviceSyncManager *)v91 _currentLinkIsWifiConnection])
          {
            long long v37 = [MEMORY[0x1E4FB8618] sharedMonitor];
            v91->_automaticSync = [v37 isCharging];
          }
          else
          {
            v91->_automaticSync = 1;
          }
          v91->_currentStage = 1;
          [(ATLegacyDeviceSyncManager *)v91 _sendSyncAllowed];
          [(ATLegacyDeviceSyncManager *)v91 _reportLocalProgress];
          id v42 = objc_alloc(MEMORY[0x1E4F4A2E0]);
          uint64_t v43 = [v42 initWithSessionTypeIdentifier:*MEMORY[0x1E4F4A290]];
          syncSession = v91->_syncSession;
          v91->_syncSession = (ATSession *)v43;

          v45 = [MEMORY[0x1E4F478D8] sharedSessionServer];
          [v45 addSession:v91->_syncSession];

          [(ATSession *)v91->_syncSession addObserver:v91];
          long long v102 = 0u;
          long long v103 = 0u;
          long long v100 = 0u;
          long long v101 = 0u;
          uint64_t v80 = 88;
          long long v46 = v91->_dataclasses;
          uint64_t v47 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v100 objects:v109 count:16];
          if (v47)
          {
            uint64_t v48 = v47;
            uint64_t v49 = *(void *)v101;
            do
            {
              for (uint64_t i = 0; i != v48; ++i)
              {
                if (*(void *)v101 != v49) {
                  objc_enumerationMutation(v46);
                }
                uint64_t v51 = -[ATLegacySyncSessionTask initWithDataClass:]([ATLegacySyncSessionTask alloc], "initWithDataClass:", *(void *)(*((void *)&v100 + 1) + 8 * i), v80);
                [(ATLegacySyncSessionTask *)v51 setGrappaSessionID:v91->_grappaId];
                v52 = v91->_syncSession;
                v108 = v51;
                uint64_t v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v108 count:1];
                [(ATSession *)v52 addSessionTasks:v53];
              }
              uint64_t v48 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v100 objects:v109 count:16];
            }
            while (v48);
          }

          [(ATSession *)v91->_syncSession start];
          [(ATLegacyDeviceSyncManager *)v91 _sendInstalledAssets];
          v54 = [v6 parameterForKey:@"HostInfo"];
          uint64_t v90 = [v54 objectForKey:@"Version"];

          long long v98 = 0u;
          long long v99 = 0u;
          long long v96 = 0u;
          long long v97 = 0u;
          id obj = [(ATSession *)v91->_syncSession sessionTasksWithGroupingKey:@"ATLegacySyncSessionTaskGroupingKey"];
          uint64_t v55 = [obj countByEnumeratingWithState:&v96 objects:v107 count:16];
          if (v55)
          {
            uint64_t v56 = v55;
            uint64_t v57 = *(void *)v97;
            while (2)
            {
              for (uint64_t j = 0; j != v56; ++j)
              {
                if (*(void *)v97 != v57) {
                  objc_enumerationMutation(obj);
                }
                v59 = *(void **)(*((void *)&v96 + 1) + 8 * j);
                v60 = objc_msgSend(v83, "parameterForKey:", @"DataclassAnchors", v80);
                v61 = [v59 dataClass];
                v62 = [v60 objectForKey:v61];

                [v59 prepareWithHostAnchor:v62 version:v90];
                v63 = [v59 error];

                if (v63)
                {
                  id v64 = [v59 error];

                  [(ATSession *)v91->_syncSession setError:v64];
                  [(ATSession *)v91->_syncSession cancel];
                  __int16 v23 = v84;
                  id v6 = v83;
                  goto LABEL_65;
                }
              }
              uint64_t v56 = [obj countByEnumeratingWithState:&v96 objects:v107 count:16];
              if (v56) {
                continue;
              }
              break;
            }
          }

          id v64 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          long long v92 = 0u;
          long long v93 = 0u;
          long long v94 = 0u;
          long long v95 = 0u;
          v65 = v91;
          id v66 = *(id *)((char *)&v91->super.super.isa + v80);
          uint64_t v67 = [v66 countByEnumeratingWithState:&v92 objects:v106 count:16];
          if (v67)
          {
            uint64_t v68 = v67;
            uint64_t v69 = *(void *)v93;
            do
            {
              for (uint64_t k = 0; k != v68; ++k)
              {
                if (*(void *)v93 != v69) {
                  objc_enumerationMutation(v66);
                }
                uint64_t v71 = *(void *)(*((void *)&v92 + 1) + 8 * k);
                v72 = -[ATClientController clientForDataclass:](v65->_clientController, "clientForDataclass:", v71, v80);
                if (objc_opt_respondsToSelector())
                {
                  v73 = [v72 currentSyncAnchor];
                  [v64 setObject:v73 forKey:v71];

                  v65 = v91;
                }
              }
              uint64_t v68 = [v66 countByEnumeratingWithState:&v92 objects:v106 count:16];
            }
            while (v68);
          }

          v74 = [MEMORY[0x1E4F1CA60] dictionary];
          [v74 setObject:v86 forKey:@"Grappa"];
          v75 = (void *)MEMORY[0x1E4F4A2C0];
          v104[0] = @"DataclassAnchors";
          v104[1] = @"DeviceInfo";
          v105[0] = v64;
          v105[1] = v74;
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v105 forKeys:v104 count:2];
          v77 = v76 = v65;
          v78 = [v75 messageWithName:@"ReadyForSync" parameters:v77];
          [v82 sendMessage:v78 withCompletion:&__block_literal_global_177];

          v76->_currentStage = 2;
          currentDataclass = v76->_currentDataclass;
          v76->_currentDataclass = (NSString *)&stru_1F33D2380;

          [(ATLegacyDeviceSyncManager *)v76 _reportLocalProgress];
          id v6 = v83;
          __int16 v23 = v84;
LABEL_65:
          uint64_t v15 = v88;

          long long v20 = v81;
          id v7 = v82;
          uint64_t v8 = v85;
          long long v24 = v86;
          uint64_t v12 = v87;
          v41 = (void *)v90;
        }
        else
        {
          uint64_t v40 = _ATLogCategoryiTunesSync();
          uint64_t v12 = v87;
          uint64_t v15 = v88;
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D9A2D000, v40, OS_LOG_TYPE_ERROR, "Grappa session could not be established. Aborting", buf, 2u);
          }

          v41 = objc_msgSend(MEMORY[0x1E4F4A2C0], "messageWithName:parameters:session:", @"SyncFailed", &unk_1F33DCC98, objc_msgSend(v6, "sessionNumber"));
          [v7 sendMessage:v41 withCompletion:&__block_literal_global_157];
          __int16 v23 = v84;
          long long v24 = 0;
        }
      }
      goto LABEL_67;
    }
    if ([@"10.5.0.115" compare:v12 options:64] != 1) {
      goto LABEL_12;
    }
  }
  uint64_t v14 = _ATLogCategoryiTunesSync();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v111 = v12;
    __int16 v112 = 2114;
    v113 = @"10.5.0.115";
    _os_log_impl(&dword_1D9A2D000, v14, OS_LOG_TYPE_ERROR, "Sending sync disallowed, incompatible version: %{public}@ vs. %{public}@ required", buf, 0x16u);
  }

  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F4A2C0], "messageWithName:parameters:session:", @"SyncFailed", &unk_1F33DCC20, objc_msgSend(v6, "sessionNumber"));
  [v7 sendMessage:v15 withCompletion:&__block_literal_global_113];
LABEL_68:
}

void __67__ATLegacyDeviceSyncManager__handleRequestingSyncMessage_fromLink___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = _ATLogCategoryiTunesSync();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138543362;
      id v5 = v2;
      _os_log_impl(&dword_1D9A2D000, v3, OS_LOG_TYPE_ERROR, "failed to send ReadyForSync back to host. err=%{public}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)_handleHostInfoMessage:(id)a3 fromLink:(id)a4
{
  defaults = self->_defaults;
  id v7 = a4;
  id v8 = a3;
  __int16 v9 = [v8 parameterForKey:@"HostInfo"];
  uint64_t v10 = ATGetDisabledAssetTypes(self->_clientController);
  [(ATUserDefaults *)defaults updateHostInfo:v9 disabledAssetTypes:v10];

  uint64_t v11 = [v8 parameterForKey:@"LocalCloudSupport"];

  objc_msgSend(v7, "setHostSupportsLocalCloudDownloads:", objc_msgSend(v11, "BOOLValue"));

  [(ATLegacyDeviceSyncManager *)self _reportLocalProgress];
}

- (void)_handleCapabilitiesMessage:(id)a3 fromLink:(id)a4
{
  id v6 = a4;
  id v7 = [a3 parameterForKey:@"LibraryID"];
  [v6 setIdentifier:v7];

  [(ATLegacyDeviceSyncManager *)self _reportLocalProgress];
}

- (void)assetLink:(id)a3 didUpdateOverallProgress:(double)a4
{
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__ATLegacyDeviceSyncManager_assetLink_didUpdateOverallProgress___block_invoke;
  v5[3] = &unk_1E6B88780;
  v5[4] = self;
  *(double *)&v5[5] = a4;
  dispatch_async(workQueue, v5);
}

uint64_t __64__ATLegacyDeviceSyncManager_assetLink_didUpdateOverallProgress___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 176) = *(void *)(a1 + 40);
  return [*(id *)(a1 + 32) _reportLocalProgress];
}

- (void)sessionDidFinish:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__ATLegacyDeviceSyncManager_sessionDidFinish___block_invoke;
  v7[3] = &unk_1E6B88B68;
  id v8 = v4;
  __int16 v9 = self;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void *__46__ATLegacyDeviceSyncManager_sessionDidFinish___block_invoke(uint64_t a1)
{
  v46[1] = *MEMORY[0x1E4F143B8];
  result = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  if (result != *(void **)(v5 + 208)) {
    return result;
  }
  if (*(void *)(v5 + 80))
  {
    [*(id *)(v5 + 80) close];
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(void **)(v6 + 80);
    *(void *)(v6 + 80) = 0;

    result = *(void **)(*(void *)(a1 + 40) + 208);
  }
  objc_msgSend(result, "removeObserver:");
  uint64_t v8 = *(void *)(a1 + 40);
  __int16 v9 = *(void **)(v8 + 208);
  *(void *)(v8 + 208) = 0;

  uint64_t v10 = [*(id *)(a1 + 32) error];
  if (v10) {

  }
  else {
    [*(id *)(a1 + 32) isCancelled];
  }
  ATReportEventIncrementingScalarKey();
  uint64_t v11 = +[ATClientController sharedInstance];
  [v11 waitToDrain];

  uint64_t v12 = [*(id *)(a1 + 32) error];

  uint64_t v13 = *(void **)(*(void *)(a1 + 40) + 72);
  uint64_t v14 = (void *)MEMORY[0x1E4F4A2C0];
  if (v12)
  {
    uint64_t v15 = [*(id *)(a1 + 32) error];
    if (v15)
    {
      v45 = @"ErrorCode";
      int v16 = NSNumber;
      v1 = [*(id *)(a1 + 32) error];
      id v2 = objc_msgSend(v16, "numberWithInteger:", objc_msgSend(v1, "code"));
      v46[0] = v2;
      __int16 v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
    }
    else
    {
      __int16 v17 = 0;
    }
    char v18 = [v14 messageWithName:@"SyncFailed" parameters:v17];
    [v13 sendMessage:v18 withCompletion:&__block_literal_global_89];

    if (v15)
    {
    }
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F4A2C0] messageWithName:@"SyncFinished" parameters:0];
    [v13 sendMessage:v15 withCompletion:&__block_literal_global_94];
  }

  uint64_t v19 = _ATLogCategoryiTunesSync();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) duration];
    *(_DWORD *)buf = 134217984;
    uint64_t v44 = v20;
    _os_log_impl(&dword_1D9A2D000, v19, OS_LOG_TYPE_DEFAULT, "---Total Sync Time: %.1fs---", buf, 0xCu);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  __int16 v21 = [*(id *)(a1 + 32) sessionTasks];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = 0;
    uint64_t v25 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v39 != v25) {
          objc_enumerationMutation(v21);
        }
        uint64_t v27 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v24 += [v27 failedAssetsCount];
          if ([v27 totalItemCount])
          {
            unsigned int v28 = *(void **)(*(void *)(a1 + 40) + 192);
            uint64_t v29 = [v27 dataClass];
            [v28 addObject:v29];
          }
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v23);

    if (v24) {
      ATDisplayErrorForAssets(v24);
    }
  }
  else
  {
  }
  uint64_t v30 = [*(id *)(a1 + 32) error];
  if (v30) {
    goto LABEL_32;
  }
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    uint64_t v31 = *(void *)(a1 + 40);
    uint64_t v32 = *(void **)(v31 + 32);
    uint64_t v30 = [*(id *)(v31 + 72) identifier];
    [v32 updateLastSyncWithHostLibrary:v30];
LABEL_32:
  }
  uint64_t v33 = [*(id *)(*(void *)(a1 + 40) + 192) count];
  v34 = _ATLogCategoryiTunesSync();
  BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
  if (v33)
  {
    if (v35)
    {
      uint64_t v36 = *(void *)(*(void *)(a1 + 40) + 192);
      *(_DWORD *)buf = 138543362;
      uint64_t v44 = v36;
      _os_log_impl(&dword_1D9A2D000, v34, OS_LOG_TYPE_DEFAULT, "Updating storage metrics after sync changes were applied to dataclasses %{public}@", buf, 0xCu);
    }

    long long v37 = *(id **)(a1 + 40);
    v34 = [v37[24] allObjects];
    [v37 _sendDiskUsageWithUpdatedDataClasses:v34];
  }
  else if (v35)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9A2D000, v34, OS_LOG_TYPE_DEFAULT, "skipping storage metrics update since no changes were made", buf, 2u);
  }

  [*(id *)(a1 + 40) _reset];
  getpid();
  proc_set_cpumon_defaults();
  return (void *)SBSSetStatusBarShowsSyncActivity();
}

- (void)sessionWillBegin:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__ATLegacyDeviceSyncManager_sessionWillBegin___block_invoke;
  v7[3] = &unk_1E6B88B68;
  id v8 = v4;
  __int16 v9 = self;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

uint64_t __46__ATLegacyDeviceSyncManager_sessionWillBegin___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32) == *(void *)(*(void *)(result + 40) + 208))
  {
    uint64_t v1 = result;
    ATReportEventIncrementingScalarKey();
    getpid();
    proc_disable_cpumon();
    SBSSetStatusBarShowsSyncActivity();
    id v2 = [ATLegacyAssetLink alloc];
    uint64_t v3 = *(void *)(v1 + 40);
    uint64_t v4 = *(void *)(v3 + 72);
    uint64_t v5 = [*(id *)(v3 + 216) valueForKey:@"Version"];
    uint64_t v6 = [(ATLegacyAssetLink *)v2 initWithMessageLink:v4 hostVersion:v5];
    uint64_t v7 = *(void *)(v1 + 40);
    id v8 = *(void **)(v7 + 80);
    *(void *)(v7 + 80) = v6;

    [*(id *)(*(void *)(v1 + 40) + 80) setSupportedDataClasses:*(void *)(*(void *)(v1 + 40) + 88)];
    objc_msgSend(*(id *)(*(void *)(v1 + 40) + 80), "setProgressDelegate:");
    [*(id *)(*(void *)(v1 + 40) + 192) removeAllObjects];
    __int16 v9 = [MEMORY[0x1E4F4A2A8] sharedInstance];
    [v9 createAirlockForDataclasses:*(void *)(*(void *)(v1 + 40) + 88)];

    uint64_t v10 = [MEMORY[0x1E4F47890] sharedInstance];
    [v10 addAssetLink:*(void *)(*(void *)(v1 + 40) + 80)];

    uint64_t v11 = *(void **)(*(void *)(v1 + 40) + 80);
    return [v11 open];
  }
  return result;
}

- (void)session:(id)a3 willBeginSessionTask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__ATLegacyDeviceSyncManager_session_willBeginSessionTask___block_invoke;
  block[3] = &unk_1E6B88BB8;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

void __58__ATLegacyDeviceSyncManager_session_willBeginSessionTask___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 208))
  {
    id v2 = [*(id *)(a1 + 48) sessionGroupingKey];
    int v3 = [v2 isEqualToString:@"ATAssetSessionTaskGroupingKey"];

    if (v3)
    {
      *(_DWORD *)(*(void *)(a1 + 40) + 136) = 4;
      uint64_t v4 = *(void **)(a1 + 40);
      [v4 _reportLocalProgress];
    }
  }
}

- (void)session:(id)a3 didBeginSessionTask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__ATLegacyDeviceSyncManager_session_didBeginSessionTask___block_invoke;
  block[3] = &unk_1E6B88BB8;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

void __57__ATLegacyDeviceSyncManager_session_didBeginSessionTask___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 208))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [*(id *)(*(void *)(a1 + 40) + 80) readyDataClasses];
      id v2 = [*(id *)(a1 + 48) dataClass];
      int v3 = [v4 arrayByAddingObject:v2];
      [*(id *)(*(void *)(a1 + 40) + 80) setReadyDataClasses:v3];
    }
  }
}

- (void)session:(id)a3 didUpdateSessionTask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__ATLegacyDeviceSyncManager_session_didUpdateSessionTask___block_invoke;
  block[3] = &unk_1E6B88BB8;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

void __58__ATLegacyDeviceSyncManager_session_didUpdateSessionTask___block_invoke(uint64_t a1)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 208))
  {
    id v2 = [*(id *)(a1 + 48) sessionGroupingKey];
    int v3 = [v2 isEqualToString:@"ATAssetSessionTaskGroupingKey"];

    id v4 = [*(id *)(a1 + 48) dataClass];
    uint64_t v5 = v4;
    if (v3)
    {
      uint64_t v6 = *(void *)(a1 + 40);
      id v7 = *(void **)(v6 + 144);
      *(void *)(v6 + 144) = v5;
    }
    else
    {
      int v8 = [v4 isEqualToString:@"Media"];

      if (v8)
      {
        [*(id *)(a1 + 48) progress];
        double v10 = v9;
        uint64_t v11 = *(void *)(a1 + 40);
        if (*(double *)(v11 + 168) != v9)
        {
          id v12 = *(void **)(v11 + 72);
          uint64_t v13 = (void *)MEMORY[0x1E4F4A2C0];
          char v18 = @"OverallProgress";
          id v14 = NSNumber;
          [*(id *)(a1 + 48) progress];
          uint64_t v15 = objc_msgSend(v14, "numberWithDouble:");
          v19[0] = v15;
          int v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
          __int16 v17 = [v13 messageWithName:@"Progress" parameters:v16];
          [v12 sendMessage:v17 withCompletion:&__block_literal_global_4061];

          *(double *)(*(void *)(a1 + 40) + 168) = v10;
        }
      }
    }
  }
}

- (void)environmentMonitorDidChangePower:(id)a3
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__ATLegacyDeviceSyncManager_environmentMonitorDidChangePower___block_invoke;
  block[3] = &unk_1E6B88B40;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __62__ATLegacyDeviceSyncManager_environmentMonitorDidChangePower___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendSyncAllowed];
}

- (void)messageLinkWasClosed:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__ATLegacyDeviceSyncManager_messageLinkWasClosed___block_invoke;
  v7[3] = &unk_1E6B88B68;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __50__ATLegacyDeviceSyncManager_messageLinkWasClosed___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 64) removeObject:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(a1 + 40) == *(void *)(v2 + 72))
  {
    uint64_t v3 = [*(id *)(v2 + 64) count];
    if (v3)
    {
      id v4 = [*(id *)(*(void *)(a1 + 32) + 64) objectAtIndex:0];
    }
    else
    {
      id v4 = 0;
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), v4);
    if (v3) {
  }
    }
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 208);
  if (v5 && [v5 isRunning] && !*(void *)(*(void *)(a1 + 32) + 72))
  {
    id v6 = _ATLogCategoryiTunesSync();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v10 = 0;
      _os_log_impl(&dword_1D9A2D000, v6, OS_LOG_TYPE_DEFAULT, "message link closed mid sync - cancelling active session", v10, 2u);
    }

    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:8 userInfo:0];
    [*(id *)(*(void *)(a1 + 32) + 208) setError:v7];

    [*(id *)(*(void *)(a1 + 32) + 208) cancel];
  }
  [*(id *)(a1 + 40) removeHandlerForMessage:@"Capabilities"];
  [*(id *)(a1 + 40) removeHandlerForMessage:@"HostInfo"];
  [*(id *)(a1 + 40) removeHandlerForMessage:@"RequestingSync"];
  [*(id *)(a1 + 40) removeHandlerForMessage:@"SyncFailed"];
  [*(id *)(a1 + 40) removeHandlerForMessage:@"FinishedSyncingMetadata"];
  [*(id *)(a1 + 40) removeHandlerForMessage:@"AssetMetrics"];
  [*(id *)(a1 + 40) removeHandlerForMessage:@"SyncStatus"];
  id v8 = [MEMORY[0x1E4F478E0] sharedMonitor];
  double v9 = [*(id *)(*(void *)(a1 + 32) + 64) valueForKey:@"identifier"];
  [v8 updateStatusWithValue:v9 forKey:@"ConnectedLibraries"];
}

- (void)messageLinkWasInitialized:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__ATLegacyDeviceSyncManager_messageLinkWasInitialized___block_invoke;
  v7[3] = &unk_1E6B88B68;
  id v8 = v4;
  double v9 = self;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __55__ATLegacyDeviceSyncManager_messageLinkWasInitialized___block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = ATGrappaDeviceInfo();
  uint64_t v3 = (void *)v2;
  if (v2)
  {
    id v4 = (void *)MEMORY[0x1E4F4A2C0];
    id v12 = @"GrappaSupportInfo";
    v13[0] = v2;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    id v6 = [v4 messageWithName:@"Capabilities" parameters:v5];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __55__ATLegacyDeviceSyncManager_messageLinkWasInitialized___block_invoke_2;
    v11[3] = &unk_1E6B88AF0;
    id v7 = *(void **)(a1 + 32);
    v11[4] = *(void *)(a1 + 40);
    [v7 sendMessage:v6 withCompletion:v11];
  }
  else
  {
    id v6 = _ATLogCategoryiTunesSync();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v10 = 0;
      _os_log_impl(&dword_1D9A2D000, v6, OS_LOG_TYPE_ERROR, "Could not get grappa device info. Don't expect anything to work properly after this point.", v10, 2u);
    }
  }

  id v8 = [MEMORY[0x1E4F478E0] sharedMonitor];
  double v9 = [*(id *)(*(void *)(a1 + 40) + 64) valueForKey:@"identifier"];
  [v8 updateStatusWithValue:v9 forKey:@"ConnectedLibraries"];
}

void __55__ATLegacyDeviceSyncManager_messageLinkWasInitialized___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    void block[5] = v2;
    block[6] = v3;
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(NSObject **)(v4 + 56);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__ATLegacyDeviceSyncManager_messageLinkWasInitialized___block_invoke_3;
    block[3] = &unk_1E6B88B40;
    void block[4] = v4;
    dispatch_async(v5, block);
  }
}

uint64_t __55__ATLegacyDeviceSyncManager_messageLinkWasInitialized___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _sendInstalledAssets];
  [*(id *)(a1 + 32) _sendDiskUsage];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _sendSyncAllowed];
}

- (void)messageLinkWasOpened:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke;
  v7[3] = &unk_1E6B88B68;
  id v8 = v4;
  double v9 = self;
  id v6 = v4;
  dispatch_sync(workQueue, v7);
}

uint64_t __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_2;
  v26[3] = &unk_1E6B88750;
  void v26[4] = *(void *)(a1 + 40);
  [v2 setHandlerForMessage:@"Capabilities" handler:v26];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_4;
  void v25[3] = &unk_1E6B88750;
  uint64_t v3 = *(void **)(a1 + 32);
  v25[4] = *(void *)(a1 + 40);
  [v3 setHandlerForMessage:@"HostInfo" handler:v25];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_6;
  v24[3] = &unk_1E6B88750;
  id v4 = *(void **)(a1 + 32);
  v24[4] = *(void *)(a1 + 40);
  [v4 setHandlerForMessage:@"RequestingSync" handler:v24];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_8;
  v23[3] = &unk_1E6B88750;
  uint64_t v5 = *(void **)(a1 + 32);
  v23[4] = *(void *)(a1 + 40);
  [v5 setHandlerForMessage:@"SyncFailed" handler:v23];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_10;
  v22[3] = &unk_1E6B88750;
  id v6 = *(void **)(a1 + 32);
  v22[4] = *(void *)(a1 + 40);
  [v6 setHandlerForMessage:@"FinishedSyncingMetadata" handler:v22];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_12;
  v21[3] = &unk_1E6B88750;
  id v7 = *(void **)(a1 + 32);
  v21[4] = *(void *)(a1 + 40);
  [v7 setHandlerForMessage:@"AssetMetrics" handler:v21];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_14;
  v20[3] = &unk_1E6B88750;
  id v8 = *(void **)(a1 + 32);
  v20[4] = *(void *)(a1 + 40);
  [v8 setHandlerForMessage:@"SyncStatus" handler:v20];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v9 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 40), "allClients", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v16 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector()) {
          [v14 registerMessageHandlersWithLink:*(void *)(a1 + 32)];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v27 count:16];
    }
    while (v11);
  }

  return [*(id *)(*(void *)(a1 + 40) + 64) addObject:*(void *)(a1 + 32)];
}

void __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 56);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_3;
  block[3] = &unk_1E6B88BB8;
  void block[4] = v7;
  id v12 = v6;
  id v13 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 56);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_5;
  block[3] = &unk_1E6B88BB8;
  void block[4] = v7;
  id v12 = v6;
  id v13 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 56);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_7;
  block[3] = &unk_1E6B88BB8;
  void block[4] = v7;
  id v12 = v6;
  id v13 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 56);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_9;
  block[3] = &unk_1E6B88BB8;
  void block[4] = v7;
  id v12 = v6;
  id v13 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 56);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_11;
  block[3] = &unk_1E6B88BB8;
  void block[4] = v7;
  id v12 = v6;
  id v13 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 56);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_13;
  block[3] = &unk_1E6B88BB8;
  void block[4] = v7;
  id v12 = v6;
  id v13 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 56);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_15;
  block[3] = &unk_1E6B88BB8;
  void block[4] = v7;
  id v12 = v6;
  id v13 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_15(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSyncStatusMessage:*(void *)(a1 + 40) fromLink:*(void *)(a1 + 48)];
}

uint64_t __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_13(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleAssetMetricsMessage:*(void *)(a1 + 40) fromLink:*(void *)(a1 + 48)];
}

uint64_t __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleFinishedSyncingMetadataMessage:*(void *)(a1 + 40) fromLink:*(void *)(a1 + 48)];
}

uint64_t __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSyncFailedMessage:*(void *)(a1 + 40) fromLink:*(void *)(a1 + 48)];
}

uint64_t __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleRequestingSyncMessage:*(void *)(a1 + 40) fromLink:*(void *)(a1 + 48)];
}

uint64_t __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleHostInfoMessage:*(void *)(a1 + 40) fromLink:*(void *)(a1 + 48)];
}

uint64_t __50__ATLegacyDeviceSyncManager_messageLinkWasOpened___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleCapabilitiesMessage:*(void *)(a1 + 40) fromLink:*(void *)(a1 + 48)];
}

- (id)currentSyncState
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  syncSession = self->_syncSession;
  BOOL v3 = [(ATLegacyDeviceSyncManager *)self _currentLinkIsWifiConnection];
  id v4 = [MEMORY[0x1E4FB8618] sharedMonitor];
  if ([v4 isCharging])
  {
    id v5 = [MEMORY[0x1E4FB8708] sharedSecurityInfo];
    uint64_t v6 = [v5 isDeviceClassCUnlocked];
  }
  else
  {
    uint64_t v6 = 0;
  }

  uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
  id v8 = [NSNumber numberWithBool:syncSession != 0];
  id v9 = [NSNumber numberWithBool:v3];
  id v10 = [NSNumber numberWithBool:v6];
  uint64_t v11 = objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, @"Syncing", v9, @"Wireless", v10, @"Automatic", 0);

  id v12 = _ATLogCategoryiTunesSync();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v15 = v11;
    _os_log_impl(&dword_1D9A2D000, v12, OS_LOG_TYPE_DEFAULT, "iTunes Sync State=%{public}@.", buf, 0xCu);
  }

  return v11;
}

- (void)cancelSyncOnMessageLink:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__ATLegacyDeviceSyncManager_cancelSyncOnMessageLink___block_invoke;
  v7[3] = &unk_1E6B88B68;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void *__53__ATLegacyDeviceSyncManager_cancelSyncOnMessageLink___block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (*(void *)(v1 + 72) == result[5])
  {
    result = *(void **)(v1 + 208);
    if (result) {
      return (void *)[result cancel];
    }
  }
  return result;
}

- (void)initiateSyncForLibrary:(id)a3 onMessageLink:(id)a4
{
  id v6 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__ATLegacyDeviceSyncManager_initiateSyncForLibrary_onMessageLink___block_invoke;
  block[3] = &unk_1E6B88728;
  uint64_t v11 = self;
  SEL v12 = a2;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(workQueue, block);
}

void __66__ATLegacyDeviceSyncManager_initiateSyncForLibrary_onMessageLink___block_invoke(void *a1)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v3 = [MEMORY[0x1E4F28B00] currentHandler];
    [v3 handleFailureInMethod:a1[6] object:a1[5] file:@"ATLegacyDeviceSyncManager.m" lineNumber:119 description:&stru_1F33D2380];
  }
  uint64_t v2 = (void *)a1[4];
  id v4 = [MEMORY[0x1E4F4A2C0] messageWithName:@"RequestingSync" parameters:0];
  [v2 sendMessage:v4 withCompletion:0];
}

- (ATLegacyDeviceSyncManager)init
{
  v24.receiver = self;
  v24.super_class = (Class)ATLegacyDeviceSyncManager;
  uint64_t v2 = [(ATDeviceSyncManager *)&v24 init];
  if (v2)
  {
    uint64_t v3 = +[ATUserDefaults sharedInstance];
    defaults = v2->_defaults;
    v2->_defaults = (ATUserDefaults *)v3;

    uint64_t v5 = +[ATClientController sharedInstance];
    clientController = v2->_clientController;
    v2->_clientController = (ATClientController *)v5;

    uint64_t v7 = +[ATDeviceDiskUsageProvider sharedInstance];
    diskUsageProvider = v2->_diskUsageProvider;
    v2->_diskUsageProvider = (ATDeviceDiskUsageProvider *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    messageLinks = v2->_messageLinks;
    v2->_messageLinks = (NSMutableArray *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    dataclasses = v2->_dataclasses;
    v2->_dataclasses = (NSMutableArray *)v11;

    currentAsset = v2->_currentAsset;
    v2->_currentAsset = 0;

    uint64_t v14 = [MEMORY[0x1E4F1CA80] set];
    dataClassesWithUpdatedDiskUsage = v2->_dataClassesWithUpdatedDiskUsage;
    v2->_dataClassesWithUpdatedDiskUsage = (NSMutableSet *)v14;

    dispatch_queue_t v16 = dispatch_queue_create("com.apple.atc.workq", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v16;

    long long v18 = [MEMORY[0x1E4FB8618] sharedMonitor];
    [v18 registerObserver:v2];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_ATBuddyCallback, @"com.apple.purplebuddy.setupdone", 0, (CFNotificationSuspensionBehavior)0);
    uint64_t v20 = [MEMORY[0x1E4FB8708] sharedSecurityInfo];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __33__ATLegacyDeviceSyncManager_init__block_invoke;
    v22[3] = &unk_1E6B88B40;
    uint64_t v23 = v2;
    [v20 performBlockAfterFirstUnlock:v22];
  }
  return v2;
}

uint64_t __33__ATLegacyDeviceSyncManager_init__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 64) count];
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 _sendSyncAllowed];
  }
  return result;
}

+ (id)legacyDeviceSyncManager
{
  uint64_t v2 = objc_alloc_init(ATLegacyDeviceSyncManager);

  return v2;
}

@end