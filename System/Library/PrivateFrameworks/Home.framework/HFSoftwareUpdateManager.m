@interface HFSoftwareUpdateManager
- (BOOL)hasNewValidSoftwareUpdate:(id)a3;
- (BOOL)hasRequestedSoftwareUpdate:(id)a3;
- (BOOL)hasSoftwareUpdate:(id)a3;
- (BOOL)hasValidSoftwareUpdate:(id)a3;
- (BOOL)isDownloadingSoftwareUpdate:(id)a3;
- (BOOL)isInstallingSoftwareUpdate:(id)a3;
- (BOOL)isReadyToInstallSoftwareUpdate:(id)a3;
- (BOOL)isSoftwareUpdateInProgress:(id)a3;
- (BOOL)isSoftwareUpdateInstalled:(id)a3;
- (BOOL)softwareUpdatePossessesNecessaryDocumentation:(id)a3;
- (HFHomeKitDispatcher)dispatcher;
- (HFSoftwareUpdateManager)init;
- (HFSoftwareUpdateManager)initWithDispatcher:(id)a3;
- (NSMapTable)accessoryUniqueIDToFetchPromisesMapTable;
- (NSMapTable)accessoryUniqueIDToSoftwareUpdateMapTable;
- (NSMapTable)accessoryUniqueIDToSoftwareUpdateProgressMapTable;
- (NSMapTable)documentationMetadataToDocumentationFutureMapTable;
- (NSMapTable)documentationMetadataToDocumentationMapTable;
- (NSMapTable)observedAccessoryUniqueIDToAccessoryMapTable;
- (NSMutableSet)requestedSoftwareUpdateInstalls;
- (id)_fetchNeedsAttentionReasons:(id)a3;
- (id)_fetchSoftwareUpdateDocumentationWithAccessory:(id)a3;
- (id)fetchAvailableSoftwareUpdate:(id)a3 options:(unint64_t)a4;
- (id)softwareUpdateDisplayableVersion:(id)a3;
- (id)softwareUpdateDocumentation:(id)a3;
- (id)softwareUpdateForAccessory:(id)a3;
- (id)softwareUpdatePortionComplete:(id)a3;
- (id)softwareUpdateProgressForAccessory:(id)a3;
- (id)softwareUpdateReleaseDate:(id)a3;
- (id)softwareUpdateVersion:(id)a3;
- (id)startSoftwareUpdate:(id)a3;
- (int64_t)_softwareUpdateStateForAccessory:(id)a3;
- (unint64_t)softwareUpdateDownloadSize:(id)a3;
- (void)_didReceiveUpdateForAccessory:(id)a3 update:(id)a4;
- (void)_finishFetchPromisesWithAccessory:(id)a3;
- (void)_markSoftwareUpdate:(id)a3 asRequested:(BOOL)a4;
- (void)_updateRequestedSoftwareUpdateInstallsWithAccessory:(id)a3 softwareUpdateState:(int64_t)a4 softwareUpdateVersion:(id)a5;
- (void)_waitToFinishPromise:(id)a3 untilSoftwareUpdateDocumentationFetchCompletes:(id)a4;
- (void)accessoryDidUpdateReachability:(id)a3;
- (void)dealloc;
- (void)didUpdateDiagnosticInfo:(id)a3 forAccessory:(id)a4;
- (void)executionEnvironmentDidBecomeActive:(id)a3;
- (void)home:(id)a3 didRemoveAccessory:(id)a4;
- (void)resetCaches;
- (void)setDispatcher:(id)a3;
- (void)softwareUpdate:(id)a3 didUpdateState:(int64_t)a4;
- (void)softwareUpdateController:(id)a3 accessory:(id)a4 didReceiveUpdate:(id)a5;
- (void)softwareUpdateController:(id)a3 accessory:(id)a4 didUpdateProgress:(id)a5;
- (void)startObservingSoftwareUpdatesForAccessories:(id)a3;
- (void)stopObservingSoftwareUpdatesForAccessories:(id)a3;
@end

@implementation HFSoftwareUpdateManager

- (BOOL)hasSoftwareUpdate:(id)a3
{
  id v4 = a3;
  if ([v4 supportsSoftwareUpdateV2])
  {
    v5 = [(HFSoftwareUpdateManager *)self accessoryUniqueIDToSoftwareUpdateMapTable];
    v6 = [v4 uniqueIdentifier];
    v7 = [v5 objectForKey:v6];
  }
  else
  {
    v5 = [v4 softwareUpdateController];
    v6 = [v5 availableUpdate];
    v7 = v6;
  }

  return v7 != 0;
}

- (BOOL)isSoftwareUpdateInstalled:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(HFSoftwareUpdateManager *)self hasSoftwareUpdate:v4]) {
    goto LABEL_9;
  }
  unint64_t v5 = [(HFSoftwareUpdateManager *)self _softwareUpdateStateForAccessory:v4];
  BOOL v6 = 0;
  if (v5 >= 4 && v5 != 5)
  {
    if (v5 == 4)
    {
      BOOL v6 = [(HFSoftwareUpdateManager *)self softwareUpdatePossessesNecessaryDocumentation:v4];
      goto LABEL_10;
    }
    v7 = objc_msgSend(NSString, "stringWithFormat:", @"Yet to handle HMSoftwareUpdateState: %lu", v5);
    v8 = HFLogForCategory(0x40uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    NSLog(&stru_26C081038.isa, v7);
LABEL_9:
    BOOL v6 = 0;
  }
LABEL_10:

  return v6;
}

- (BOOL)isSoftwareUpdateInProgress:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HFSoftwareUpdateManager *)self isDownloadingSoftwareUpdate:v4]
    || [(HFSoftwareUpdateManager *)self isInstallingSoftwareUpdate:v4]
    || [(HFSoftwareUpdateManager *)self hasRequestedSoftwareUpdate:v4];

  return v5;
}

- (BOOL)isReadyToInstallSoftwareUpdate:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(HFSoftwareUpdateManager *)self hasSoftwareUpdate:v4])
  {
    int64_t v5 = [(HFSoftwareUpdateManager *)self _softwareUpdateStateForAccessory:v4];
    BOOL v6 = HFLogForCategory(0x40uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      int64_t v13 = v5;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "[isReadyToInstallSoftwareUpdate] state: %ld for accessory: %@", buf, 0x16u);
    }

    BOOL v7 = 0;
    switch(v5)
    {
      case 0:
        BOOL v7 = [(HFSoftwareUpdateManager *)self softwareUpdatePossessesNecessaryDocumentation:v4];
        break;
      case 1:
      case 3:
      case 4:
      case 5:
        break;
      case 2:
        v11 = [(HFSoftwareUpdateManager *)self requestedSoftwareUpdateInstalls];
        BOOL v7 = ([v11 containsObject:v4] & 1) == 0
          && [(HFSoftwareUpdateManager *)self softwareUpdatePossessesNecessaryDocumentation:v4];

        break;
      default:
        v8 = objc_msgSend(NSString, "stringWithFormat:", @"Yet to handle HMSoftwareUpdateState: %lu", v5);
        v9 = HFLogForCategory(0x40uLL);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          int64_t v13 = (int64_t)v8;
          _os_log_error_impl(&dword_20B986000, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }

        NSLog(&stru_26C081038.isa, v8);
        goto LABEL_9;
    }
  }
  else
  {
LABEL_9:
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isInstallingSoftwareUpdate:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(HFSoftwareUpdateManager *)self hasSoftwareUpdate:v4])
  {
LABEL_11:
    BOOL v7 = 0;
    goto LABEL_12;
  }
  unint64_t v5 = [(HFSoftwareUpdateManager *)self _softwareUpdateStateForAccessory:v4];
  if (v5 > 5)
  {
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"Yet to handle HMSoftwareUpdateState: %lu", v5);
    v9 = HFLogForCategory(0x40uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = v8;
      _os_log_error_impl(&dword_20B986000, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    NSLog(&stru_26C081038.isa, v8);
    goto LABEL_11;
  }
  if (((1 << v5) & 0x33) != 0) {
    goto LABEL_11;
  }
  if (v5 != 2)
  {
    BOOL v7 = [(HFSoftwareUpdateManager *)self softwareUpdatePossessesNecessaryDocumentation:v4];
    goto LABEL_12;
  }
  if ([v4 supportsCHIP]) {
    goto LABEL_11;
  }
  BOOL v6 = [(HFSoftwareUpdateManager *)self requestedSoftwareUpdateInstalls];
  if ([v6 containsObject:v4]) {
    BOOL v7 = [(HFSoftwareUpdateManager *)self softwareUpdatePossessesNecessaryDocumentation:v4];
  }
  else {
    BOOL v7 = 0;
  }

LABEL_12:
  return v7;
}

- (BOOL)isDownloadingSoftwareUpdate:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(HFSoftwareUpdateManager *)self hasSoftwareUpdate:v4]) {
    goto LABEL_9;
  }
  int64_t v5 = [(HFSoftwareUpdateManager *)self _softwareUpdateStateForAccessory:v4];
  BOOL v6 = 0;
  if ((unint64_t)(v5 - 2) >= 4 && v5)
  {
    if (v5 == 1)
    {
      BOOL v6 = [(HFSoftwareUpdateManager *)self softwareUpdatePossessesNecessaryDocumentation:v4];
      goto LABEL_10;
    }
    BOOL v7 = objc_msgSend(NSString, "stringWithFormat:", @"Yet to handle HMSoftwareUpdateState: %lu", v5);
    v8 = HFLogForCategory(0x40uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    NSLog(&stru_26C081038.isa, v7);
LABEL_9:
    BOOL v6 = 0;
  }
LABEL_10:

  return v6;
}

- (BOOL)hasRequestedSoftwareUpdate:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(HFSoftwareUpdateManager *)self hasSoftwareUpdate:v4])
  {
LABEL_11:
    BOOL v7 = 0;
    goto LABEL_12;
  }
  unint64_t v5 = [(HFSoftwareUpdateManager *)self _softwareUpdateStateForAccessory:v4];
  if (v5 > 5)
  {
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"Yet to handle HMSoftwareUpdateState: %lu", v5);
    v9 = HFLogForCategory(0x40uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = v8;
      _os_log_error_impl(&dword_20B986000, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    NSLog(&stru_26C081038.isa, v8);
    goto LABEL_11;
  }
  if (((1 << v5) & 0x1A) != 0) {
    goto LABEL_11;
  }
  if (((1 << v5) & 5) == 0)
  {
    BOOL v7 = [(HFSoftwareUpdateManager *)self softwareUpdatePossessesNecessaryDocumentation:v4];
    goto LABEL_12;
  }
  if (![v4 supportsCHIP]) {
    goto LABEL_11;
  }
  BOOL v6 = [(HFSoftwareUpdateManager *)self requestedSoftwareUpdateInstalls];
  if ([v6 containsObject:v4]) {
    BOOL v7 = [(HFSoftwareUpdateManager *)self softwareUpdatePossessesNecessaryDocumentation:v4];
  }
  else {
    BOOL v7 = 0;
  }

LABEL_12:
  return v7;
}

- (void)startObservingSoftwareUpdatesForAccessories:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    BOOL v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_184);
    if (![v6 count])
    {
LABEL_8:

      goto LABEL_9;
    }
    BOOL v7 = [(HFSoftwareUpdateManager *)self dispatcher];
    v8 = [v7 home];
    v9 = [v8 softwareUpdateController];
    v10 = [v9 delegate];
    if (v10)
    {
    }
    else
    {
      BOOL v11 = +[HFUtilities isInternalTest];

      if (v11) {
        goto LABEL_7;
      }
      BOOL v7 = [MEMORY[0x263F08690] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"HFSoftwareUpdateManager.m" lineNumber:184 description:@"[SUBSCRIBE] softwareUpdateObserverDispatcher is nil"];
    }

LABEL_7:
    uint64_t v12 = [(HFSoftwareUpdateManager *)self dispatcher];
    uint64_t v13 = [v12 home];
    __int16 v14 = [v13 softwareUpdateController];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __71__HFSoftwareUpdateManager_startObservingSoftwareUpdatesForAccessories___block_invoke_2;
    v15[3] = &unk_26408C8C8;
    id v16 = v5;
    v17 = self;
    [v14 subscribe:v6 completion:v15];

    goto LABEL_8;
  }
LABEL_9:
}

id __71__HFSoftwareUpdateManager_startObservingSoftwareUpdatesForAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 supportsSoftwareUpdateV2])
  {
    v3 = [v2 uniqueIdentifier];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __63__HFSoftwareUpdateManager_executionEnvironmentDidBecomeActive___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 supportsSoftwareUpdateV2])
  {
    [*(id *)(a1 + 32) addObject:v3];
  }
  else
  {
    id v4 = [*(id *)(a1 + 40) requestedSoftwareUpdateInstalls];
    int v5 = [v4 containsObject:v3];

    if (v5)
    {
      BOOL v6 = [v3 softwareUpdateController];
      BOOL v7 = [v6 availableUpdate];

      v8 = [*(id *)(a1 + 40) dispatcher];
      v9 = [v8 softwareUpdateObserverDispatcher];
      v10 = [v9 proxy];
      [v7 setDelegate:v10];

      BOOL v11 = [*(id *)(a1 + 40) dispatcher];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __63__HFSoftwareUpdateManager_executionEnvironmentDidBecomeActive___block_invoke_2;
      v13[3] = &unk_2640996A0;
      id v14 = v7;
      id v12 = v7;
      [v11 dispatchSoftwareUpdateMessage:v13 sender:0];
    }
  }
}

- (NSMutableSet)requestedSoftwareUpdateInstalls
{
  return self->_requestedSoftwareUpdateInstalls;
}

- (void)executionEnvironmentDidBecomeActive:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFFA08];
  int v5 = [(HFSoftwareUpdateManager *)self dispatcher];
  BOOL v6 = [v5 home];
  BOOL v7 = [v6 accessories];
  v8 = [v4 setWithArray:v7];

  v9 = [(HFSoftwareUpdateManager *)self observedAccessoryUniqueIDToAccessoryMapTable];
  v10 = [v9 objectEnumerator];
  BOOL v11 = [v10 allObjects];

  if ([v11 count])
  {
    id v12 = (void *)MEMORY[0x263EFF9C0];
    if (v11)
    {
      uint64_t v13 = [MEMORY[0x263EFF9C0] setWithArray:v11];
    }
    else
    {
      id v14 = objc_opt_new();
      uint64_t v13 = [v12 setWithArray:v14];
    }
    [v13 minusSet:v8];
    if ([v13 count]) {
      [(HFSoftwareUpdateManager *)self stopObservingSoftwareUpdatesForAccessories:v13];
    }
  }
  id v15 = objc_opt_new();
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  v19 = __63__HFSoftwareUpdateManager_executionEnvironmentDidBecomeActive___block_invoke;
  v20 = &unk_2640996C8;
  id v21 = v15;
  v22 = self;
  id v16 = v15;
  objc_msgSend(v8, "na_each:", &v17);
  -[HFSoftwareUpdateManager startObservingSoftwareUpdatesForAccessories:](self, "startObservingSoftwareUpdatesForAccessories:", v16, v17, v18, v19, v20);
}

- (void)resetCaches
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = [(HFSoftwareUpdateManager *)self accessoryUniqueIDToSoftwareUpdateMapTable];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    int v5 = HFLogForCategory(0x40uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v21 = [(HFSoftwareUpdateManager *)self accessoryUniqueIDToSoftwareUpdateMapTable];
      v22 = objc_msgSend(v21, "hf_prettyDescription");
      *(_DWORD *)buf = 138412290;
      v30 = v22;
      _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "[RESET] Unexpected entries in accessoryUniqueIDToSoftwareUpdateMapTable: %@", buf, 0xCu);
    }
  }
  BOOL v6 = [(HFSoftwareUpdateManager *)self accessoryUniqueIDToSoftwareUpdateMapTable];
  [v6 removeAllObjects];

  BOOL v7 = [(HFSoftwareUpdateManager *)self accessoryUniqueIDToSoftwareUpdateProgressMapTable];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    v9 = HFLogForCategory(0x40uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v23 = [(HFSoftwareUpdateManager *)self accessoryUniqueIDToSoftwareUpdateProgressMapTable];
      v24 = objc_msgSend(v23, "hf_prettyDescription");
      *(_DWORD *)buf = 138412290;
      v30 = v24;
      _os_log_error_impl(&dword_20B986000, v9, OS_LOG_TYPE_ERROR, "[RESET] Unexpected entries in accessoryUniqueIDToSoftwareUpdateProgressMapTable: %@", buf, 0xCu);
    }
  }
  v10 = [(HFSoftwareUpdateManager *)self accessoryUniqueIDToSoftwareUpdateProgressMapTable];
  [v10 removeAllObjects];

  BOOL v11 = [(HFSoftwareUpdateManager *)self accessoryUniqueIDToFetchPromisesMapTable];
  id v12 = [v11 keyEnumerator];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __38__HFSoftwareUpdateManager_resetCaches__block_invoke;
  v28[3] = &unk_264099650;
  v28[4] = self;
  objc_msgSend(v12, "na_each:", v28);

  uint64_t v13 = [(HFSoftwareUpdateManager *)self accessoryUniqueIDToFetchPromisesMapTable];
  [v13 removeAllObjects];

  id v14 = [(HFSoftwareUpdateManager *)self observedAccessoryUniqueIDToAccessoryMapTable];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    id v16 = HFLogForCategory(0x40uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v25 = [(HFSoftwareUpdateManager *)self observedAccessoryUniqueIDToAccessoryMapTable];
      v26 = objc_msgSend(v25, "hf_prettyDescription");
      *(_DWORD *)buf = 138412290;
      v30 = v26;
      _os_log_error_impl(&dword_20B986000, v16, OS_LOG_TYPE_ERROR, "[RESET] Unexpected entries in observedAccessoryUniqueIDToAccessoryMapTable: %@", buf, 0xCu);
    }
  }
  uint64_t v17 = [(HFSoftwareUpdateManager *)self observedAccessoryUniqueIDToAccessoryMapTable];
  [v17 removeAllObjects];

  uint64_t v18 = [(HFSoftwareUpdateManager *)self documentationMetadataToDocumentationFutureMapTable];
  v19 = [v18 keyEnumerator];
  v20 = [v19 allObjects];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __38__HFSoftwareUpdateManager_resetCaches__block_invoke_13;
  v27[3] = &unk_264099678;
  v27[4] = self;
  objc_msgSend(v20, "na_each:", v27);
}

- (NSMapTable)observedAccessoryUniqueIDToAccessoryMapTable
{
  return self->_observedAccessoryUniqueIDToAccessoryMapTable;
}

- (NSMapTable)accessoryUniqueIDToSoftwareUpdateProgressMapTable
{
  return self->_accessoryUniqueIDToSoftwareUpdateProgressMapTable;
}

- (NSMapTable)accessoryUniqueIDToSoftwareUpdateMapTable
{
  return self->_accessoryUniqueIDToSoftwareUpdateMapTable;
}

- (NSMapTable)accessoryUniqueIDToFetchPromisesMapTable
{
  return self->_accessoryUniqueIDToFetchPromisesMapTable;
}

- (NSMapTable)documentationMetadataToDocumentationFutureMapTable
{
  return self->_documentationMetadataToDocumentationFutureMapTable;
}

- (HFHomeKitDispatcher)dispatcher
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dispatcher);
  return (HFHomeKitDispatcher *)WeakRetained;
}

- (HFSoftwareUpdateManager)initWithDispatcher:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HFSoftwareUpdateManager;
  int v5 = [(HFSoftwareUpdateManager *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    accessoryUniqueIDToSoftwareUpdateMapTable = v5->_accessoryUniqueIDToSoftwareUpdateMapTable;
    v5->_accessoryUniqueIDToSoftwareUpdateMapTable = (NSMapTable *)v6;

    uint64_t v8 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    accessoryUniqueIDToSoftwareUpdateProgressMapTable = v5->_accessoryUniqueIDToSoftwareUpdateProgressMapTable;
    v5->_accessoryUniqueIDToSoftwareUpdateProgressMapTable = (NSMapTable *)v8;

    uint64_t v10 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    accessoryUniqueIDToFetchPromisesMapTable = v5->_accessoryUniqueIDToFetchPromisesMapTable;
    v5->_accessoryUniqueIDToFetchPromisesMapTable = (NSMapTable *)v10;

    uint64_t v12 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    observedAccessoryUniqueIDToAccessoryMapTable = v5->_observedAccessoryUniqueIDToAccessoryMapTable;
    v5->_observedAccessoryUniqueIDToAccessoryMapTable = (NSMapTable *)v12;

    uint64_t v14 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    documentationMetadataToDocumentationMapTable = v5->_documentationMetadataToDocumentationMapTable;
    v5->_documentationMetadataToDocumentationMapTable = (NSMapTable *)v14;

    uint64_t v16 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    documentationMetadataToDocumentationFutureMapTable = v5->_documentationMetadataToDocumentationFutureMapTable;
    v5->_documentationMetadataToDocumentationFutureMapTable = (NSMapTable *)v16;

    uint64_t v18 = objc_opt_new();
    requestedSoftwareUpdateInstalls = v5->_requestedSoftwareUpdateInstalls;
    v5->_requestedSoftwareUpdateInstalls = (NSMutableSet *)v18;

    objc_storeWeak((id *)&v5->_dispatcher, v4);
    [v4 addAccessoryObserver:v5];
    [v4 addHomeObserver:v5];
    [v4 addSoftwareUpdateObserver:v5];
    [v4 addSoftwareUpdateControllerV2Observer:v5];
    [v4 addDiagnosticInfoObserver:v5];
    v20 = +[HFExecutionEnvironment sharedInstance];
    [v20 addObserver:v5];
  }
  return v5;
}

- (HFSoftwareUpdateManager)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  int v5 = NSStringFromSelector(sel_initWithDispatcher_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFSoftwareUpdateManager.m", 113, @"%s is unavailable; use %@ instead",
    "-[HFSoftwareUpdateManager init]",
    v5);

  return 0;
}

- (void)dealloc
{
  id v3 = [(HFSoftwareUpdateManager *)self dispatcher];
  [v3 removeAccessoryObserver:self];

  id v4 = [(HFSoftwareUpdateManager *)self dispatcher];
  [v4 removeHomeObserver:self];

  int v5 = [(HFSoftwareUpdateManager *)self dispatcher];
  [v5 removeSoftwareUpdateObserver:self];

  uint64_t v6 = [(HFSoftwareUpdateManager *)self dispatcher];
  [v6 removeDiagnosticInfoObserver:self];

  BOOL v7 = +[HFExecutionEnvironment sharedInstance];
  [v7 removeObserver:self];

  v8.receiver = self;
  v8.super_class = (Class)HFSoftwareUpdateManager;
  [(HFSoftwareUpdateManager *)&v8 dealloc];
}

void __38__HFSoftwareUpdateManager_resetCaches__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) accessoryUniqueIDToFetchPromisesMapTable];
  int v5 = [v4 objectForKey:v3];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__HFSoftwareUpdateManager_resetCaches__block_invoke_2;
  v7[3] = &unk_26408F0C8;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v6 = v3;
  objc_msgSend(v5, "na_each:", v7);
}

void __38__HFSoftwareUpdateManager_resetCaches__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x40uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = [*(id *)(a1 + 32) observedAccessoryUniqueIDToAccessoryMapTable];
    id v6 = [v5 objectForKey:*(void *)(a1 + 40)];
    BOOL v7 = objc_msgSend(v6, "hf_prettyDescription");
    int v8 = 138412546;
    id v9 = v3;
    __int16 v10 = 2112;
    BOOL v11 = v7;
    _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "[RESET] Unexpectedly finishing promise in accessoryUniqueIDToFetchPromisesMapTable: %@ %@", (uint8_t *)&v8, 0x16u);
  }
  [v3 finishWithNoResult];
}

void __38__HFSoftwareUpdateManager_resetCaches__block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) documentationMetadataToDocumentationFutureMapTable];
  int v5 = [v4 objectForKey:v3];

  id v6 = HFLogForCategory(0x40uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412546;
    int v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "[RESET] Unexpectedly cancelling future in documentationMetadataToDocumentationFutureMapTable: %@ %@", (uint8_t *)&v7, 0x16u);
  }

  [v5 cancel];
}

void __71__HFSoftwareUpdateManager_startObservingSoftwareUpdatesForAccessories___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a2;
  int v5 = HFLogForCategory(0x40uLL);
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = [*(id *)(a1 + 32) count];
      uint64_t v12 = *(void **)(a1 + 32);
      if (v11 == 1)
      {
        a1 = [v12 anyObject];
        objc_msgSend((id)a1, "hf_prettyDescription");
      }
      else
      {
        objc_msgSend(v12, "hf_prettyDescription");
      uint64_t v13 = };
      *(_DWORD *)buf = 138412546;
      id v16 = v4;
      __int16 v17 = 2112;
      uint64_t v18 = v13;
      _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "[SUBSCRIBE] %@: Cannot subscribe to %@", buf, 0x16u);
      if (v11 == 1)
      {

        uint64_t v13 = (void *)a1;
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [*(id *)(a1 + 32) count];
      int v8 = *(void **)(a1 + 32);
      if (v7 == 1)
      {
        id v2 = [v8 anyObject];
        objc_msgSend(v2, "hf_prettyDescription");
      }
      else
      {
        objc_msgSend(v8, "hf_prettyDescription");
      __int16 v9 = };
      *(_DWORD *)buf = 138412290;
      id v16 = v9;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "[SUBSCRIBE] Subscribed to %@", buf, 0xCu);
      if (v7 == 1)
      {

        __int16 v9 = v2;
      }
    }
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __71__HFSoftwareUpdateManager_startObservingSoftwareUpdatesForAccessories___block_invoke_20;
    v14[3] = &unk_26408F388;
    id v10 = *(void **)(a1 + 32);
    v14[4] = *(void *)(a1 + 40);
    objc_msgSend(v10, "na_each:", v14);
  }
}

void __71__HFSoftwareUpdateManager_startObservingSoftwareUpdatesForAccessories___block_invoke_20(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 observedAccessoryUniqueIDToAccessoryMapTable];
  id v4 = [v3 uniqueIdentifier];
  [v5 setObject:v3 forKey:v4];
}

- (void)stopObservingSoftwareUpdatesForAccessories:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_24_9);
    if ([v5 count])
    {
      id v6 = [(HFSoftwareUpdateManager *)self dispatcher];
      uint64_t v7 = [v6 home];
      int v8 = [v7 softwareUpdateController];
      [v8 unsubscribe:v5];

      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __70__HFSoftwareUpdateManager_stopObservingSoftwareUpdatesForAccessories___block_invoke_2;
      v12[3] = &unk_264099650;
      v12[4] = self;
      objc_msgSend(v5, "na_each:", v12);
      __int16 v9 = HFLogForCategory(0x40uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [v4 count];
        if (v10 == 1)
        {
          uint64_t v7 = [v4 anyObject];
          objc_msgSend(v7, "hf_prettyDescription");
        }
        else
        {
          objc_msgSend(v4, "hf_prettyDescription");
        uint64_t v11 = };
        *(_DWORD *)buf = 138412290;
        uint64_t v14 = v11;
        _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "[UNSUBSCRIBE] Unsubscribed from %@", buf, 0xCu);
        if (v10 == 1)
        {

          uint64_t v11 = v7;
        }
      }
    }
  }
}

id __70__HFSoftwareUpdateManager_stopObservingSoftwareUpdatesForAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 supportsSoftwareUpdateV2])
  {
    id v3 = [v2 uniqueIdentifier];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void __70__HFSoftwareUpdateManager_stopObservingSoftwareUpdatesForAccessories___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 accessoryUniqueIDToSoftwareUpdateMapTable];
  [v5 removeObjectForKey:v4];

  id v6 = [*(id *)(a1 + 32) accessoryUniqueIDToSoftwareUpdateProgressMapTable];
  [v6 removeObjectForKey:v4];

  id v7 = [*(id *)(a1 + 32) observedAccessoryUniqueIDToAccessoryMapTable];
  [v7 removeObjectForKey:v4];
}

- (id)softwareUpdateForAccessory:(id)a3
{
  id v4 = a3;
  id v5 = [(HFSoftwareUpdateManager *)self accessoryUniqueIDToSoftwareUpdateMapTable];
  id v6 = [v4 uniqueIdentifier];

  id v7 = [v5 objectForKey:v6];

  return v7;
}

- (id)softwareUpdateProgressForAccessory:(id)a3
{
  id v4 = a3;
  id v5 = [(HFSoftwareUpdateManager *)self accessoryUniqueIDToSoftwareUpdateProgressMapTable];
  id v6 = [v4 uniqueIdentifier];

  id v7 = [v5 objectForKey:v6];

  return v7;
}

- (void)didUpdateDiagnosticInfo:(id)a3 forAccessory:(id)a4
{
  id v6 = a3;
  id v8 = [a4 uniqueIdentifier];
  id v7 = [v6 softwareUpdate];

  [(HFSoftwareUpdateManager *)self _didReceiveUpdateForAccessory:v8 update:v7];
}

- (void)softwareUpdateController:(id)a3 accessory:(id)a4 didReceiveUpdate:(id)a5
{
}

- (void)softwareUpdateController:(id)a3 accessory:(id)a4 didUpdateProgress:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  __int16 v9 = [(HFSoftwareUpdateManager *)self accessoryUniqueIDToSoftwareUpdateProgressMapTable];
  uint64_t v10 = [v9 objectForKey:v7];

  if (([v10 isEqual:v8] & 1) == 0)
  {
    uint64_t v11 = [(HFSoftwareUpdateManager *)self accessoryUniqueIDToSoftwareUpdateProgressMapTable];
    [v11 setObject:v8 forKey:v7];

    uint64_t v12 = [(HFSoftwareUpdateManager *)self observedAccessoryUniqueIDToAccessoryMapTable];
    uint64_t v13 = [v12 objectForKey:v7];

    uint64_t v14 = HFLogForCategory(0x40uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = objc_msgSend(v13, "hf_prettyDescription");
      *(_DWORD *)buf = 138412290;
      id v21 = v15;
      _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "[PROGRESS] %@", buf, 0xCu);
    }
    id v16 = [(HFSoftwareUpdateManager *)self dispatcher];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __80__HFSoftwareUpdateManager_softwareUpdateController_accessory_didUpdateProgress___block_invoke;
    v18[3] = &unk_2640996A0;
    id v19 = v13;
    id v17 = v13;
    [v16 dispatchSoftwareUpdateMessage:v18 sender:0];
  }
}

uint64_t __80__HFSoftwareUpdateManager_softwareUpdateController_accessory_didUpdateProgress___block_invoke(uint64_t a1, void *a2)
{
  return [a2 softwareUpdateV2DidUpdateProgressForAccessory:*(void *)(a1 + 32)];
}

void __63__HFSoftwareUpdateManager_executionEnvironmentDidBecomeActive___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "softwareUpdate:didUpdateState:", v2, objc_msgSend(v2, "state"));
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v7 supportsSoftwareUpdateV2])
  {
    id v8 = HFLogForCategory(0x40uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = objc_msgSend(v7, "hf_prettyDescription");
      uint64_t v10 = objc_msgSend(v6, "hf_prettyDescription");
      int v12 = 138412546;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "[UNSUBSCRIBE] Stopped observing accessory because it was removed from its home: %@ %@", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v11 = [MEMORY[0x263EFFA08] setWithObject:v7];
    [(HFSoftwareUpdateManager *)self stopObservingSoftwareUpdatesForAccessories:v11];
  }
}

- (void)accessoryDidUpdateReachability:(id)a3
{
  id v4 = a3;
  if ([v4 supportsSoftwareUpdateV2] && (objc_msgSend(v4, "isReachable") & 1) == 0)
  {
    id v5 = [v4 uniqueIdentifier];
    id v6 = [(HFSoftwareUpdateManager *)self accessoryUniqueIDToFetchPromisesMapTable];
    id v7 = [v6 objectForKey:v5];

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __58__HFSoftwareUpdateManager_accessoryDidUpdateReachability___block_invoke;
    v9[3] = &unk_26408E4E0;
    id v10 = v4;
    objc_msgSend(v7, "na_each:", v9);
    id v8 = [(HFSoftwareUpdateManager *)self accessoryUniqueIDToFetchPromisesMapTable];
    [v8 removeObjectForKey:v5];
  }
}

void __58__HFSoftwareUpdateManager_accessoryDidUpdateReachability___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x40uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
    int v6 = 138412546;
    id v7 = v3;
    __int16 v8 = 2112;
    __int16 v9 = v5;
    _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "[FETCH] Accessory became unreachable; finishing unmet promise: %@ %@",
      (uint8_t *)&v6,
      0x16u);
  }
  [v3 finishWithNoResult];
}

- (void)softwareUpdate:(id)a3 didUpdateState:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = HFLogForCategory(0x40uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v8 = objc_msgSend(v6, "hf_prettyExpensiveDescription");
    *(_DWORD *)buf = 138412290;
    id v17 = v8;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "[STATUS] %@", buf, 0xCu);
  }
  if (v6)
  {
    __int16 v9 = [(HFSoftwareUpdateManager *)self requestedSoftwareUpdateInstalls];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __57__HFSoftwareUpdateManager_softwareUpdate_didUpdateState___block_invoke;
    v14[3] = &unk_26408D968;
    uint64_t v10 = v6;
    uint64_t v15 = v10;
    uint64_t v11 = objc_msgSend(v9, "na_firstObjectPassingTest:", v14);

    int v12 = [v10 version];
    [(HFSoftwareUpdateManager *)self _updateRequestedSoftwareUpdateInstallsWithAccessory:v11 softwareUpdateState:a4 softwareUpdateVersion:v12];

    uint64_t v13 = v15;
  }
  else
  {
    uint64_t v13 = HFLogForCategory(0x40uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20B986000, v13, OS_LOG_TYPE_ERROR, "[STATUS] softwareUpdate:didUpdateState: invoked with a nil update; ignoring.",
        buf,
        2u);
    }
  }
}

BOOL __57__HFSoftwareUpdateManager_softwareUpdate_didUpdateState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 softwareUpdateController];
  id v4 = [v3 availableUpdate];
  BOOL v5 = v4 == *(void **)(a1 + 32);

  return v5;
}

- (void)_didReceiveUpdateForAccessory:(id)a3 update:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = [(HFSoftwareUpdateManager *)self accessoryUniqueIDToSoftwareUpdateMapTable];
  __int16 v9 = [v8 objectForKey:v6];

  uint64_t v35 = [v9 documentationMetadata];
  if (v35)
  {
    uint64_t v10 = [(HFSoftwareUpdateManager *)self documentationMetadataToDocumentationMapTable];
    uint64_t v11 = [v10 objectForKey:v35];
  }
  else
  {
    uint64_t v11 = 0;
  }
  if (objc_msgSend(v9, "isEqual:", v7, v35)
    && ([v7 error], int v12 = objc_claimAutoreleasedReturnValue(), v12, !v12)
    && v11)
  {
    uint64_t v13 = HFLogForCategory(0x40uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = [v6 UUIDString];
      uint64_t v15 = [v11 description];
      *(_DWORD *)buf = 138412802;
      v43 = v14;
      __int16 v44 = 2112;
      id v45 = v7;
      __int16 v46 = 2112;
      v47 = v15;
      _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEFAULT, "[STATUS] Skipping didReceiveUpdate for accessory: %@, with software update: %@, existingDocumentation: %@", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v16 = [(HFSoftwareUpdateManager *)self observedAccessoryUniqueIDToAccessoryMapTable];
    id v17 = [v16 objectForKey:v6];

    uint64_t updated = HMSoftwareUpdateStateFromHMSoftwareUpdateStatusV2([v7 status]);
    if (updated == 4
      && ([v7 version],
          id v19 = objc_claimAutoreleasedReturnValue(),
          [v17 softwareVersion],
          v20 = objc_claimAutoreleasedReturnValue(),
          char v21 = [v19 isEqualToVersion:v20],
          v20,
          v19,
          (v21 & 1) == 0))
    {
      v26 = [(HFSoftwareUpdateManager *)self accessoryUniqueIDToSoftwareUpdateMapTable];
      v27 = [v26 objectForKey:v6];

      if (v27)
      {
        v28 = HFLogForCategory(0x40uLL);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = objc_msgSend(v17, "hf_prettyDescription");
          *(_DWORD *)buf = 138412290;
          v43 = v29;
          _os_log_impl(&dword_20B986000, v28, OS_LOG_TYPE_DEFAULT, "[STATUS] Removing update from accessoryUniqueIDToSoftwareUpdateMapTable: %@", buf, 0xCu);
        }
        v30 = [(HFSoftwareUpdateManager *)self accessoryUniqueIDToSoftwareUpdateMapTable];
        [v30 removeObjectForKey:v6];
      }
      v25 = 0;
    }
    else
    {
      uint64_t v22 = [(HFSoftwareUpdateManager *)self accessoryUniqueIDToSoftwareUpdateMapTable];
      [v22 setObject:v7 forKey:v6];

      v23 = HFLogForCategory(0x40uLL);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = objc_msgSend(v17, "hf_prettyDescription");
        *(_DWORD *)buf = 138412290;
        v43 = v24;
        _os_log_impl(&dword_20B986000, v23, OS_LOG_TYPE_DEFAULT, "[STATUS] %@", buf, 0xCu);
      }
      v25 = [(HFSoftwareUpdateManager *)self _fetchSoftwareUpdateDocumentationWithAccessory:v17];
    }
    uint64_t v31 = [v7 version];
    [(HFSoftwareUpdateManager *)self _updateRequestedSoftwareUpdateInstallsWithAccessory:v17 softwareUpdateState:updated softwareUpdateVersion:v31];

    objc_initWeak((id *)buf, self);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__HFSoftwareUpdateManager__didReceiveUpdateForAccessory_update___block_invoke;
    aBlock[3] = &unk_26408DB10;
    objc_copyWeak(&v41, (id *)buf);
    uint64_t v13 = v17;
    v40 = v13;
    v32 = (void (**)(void))_Block_copy(aBlock);
    v33 = v32;
    if (v25)
    {
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __64__HFSoftwareUpdateManager__didReceiveUpdateForAccessory_update___block_invoke_3;
      v37[3] = &unk_2640996F0;
      v38 = v32;
      id v34 = (id)[v25 addCompletionBlock:v37];
    }
    else
    {
      v32[2](v32);
    }

    objc_destroyWeak(&v41);
    objc_destroyWeak((id *)buf);
  }
}

void __64__HFSoftwareUpdateManager__didReceiveUpdateForAccessory_update___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _finishFetchPromisesWithAccessory:*(void *)(a1 + 32)];
  id v3 = [WeakRetained dispatcher];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __64__HFSoftwareUpdateManager__didReceiveUpdateForAccessory_update___block_invoke_2;
  v4[3] = &unk_2640996A0;
  id v5 = *(id *)(a1 + 32);
  [v3 dispatchSoftwareUpdateMessage:v4 sender:0];
}

uint64_t __64__HFSoftwareUpdateManager__didReceiveUpdateForAccessory_update___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 softwareUpdateV2DidUpdateForAccessory:*(void *)(a1 + 32)];
}

uint64_t __64__HFSoftwareUpdateManager__didReceiveUpdateForAccessory_update___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_markSoftwareUpdate:(id)a3 asRequested:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v6)
  {
    id v7 = HFLogForCategory(0x40uLL);
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v8)
      {
        __int16 v9 = objc_msgSend(v6, "hf_prettyDescription");
        *(_DWORD *)buf = 138412290;
        id v45 = v9;
        _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "[MARK REQUESTED] Marked as requested: %@", buf, 0xCu);
      }
      uint64_t v10 = [(HFSoftwareUpdateManager *)self requestedSoftwareUpdateInstalls];
      [v10 addObject:v6];

      uint64_t v11 = [(HFSoftwareUpdateManager *)self dispatcher];
      uint64_t v39 = MEMORY[0x263EF8330];
      uint64_t v40 = 3221225472;
      id v41 = __59__HFSoftwareUpdateManager__markSoftwareUpdate_asRequested___block_invoke;
      v42 = &unk_2640996A0;
      int v12 = &v43;
      id v43 = v6;
      uint64_t v13 = &v39;
    }
    else
    {
      if (v8)
      {
        __int16 v14 = objc_msgSend(v6, "hf_prettyDescription");
        *(_DWORD *)buf = 138412290;
        id v45 = v14;
        _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "[MARK REQUESTED] Removed as requested: %@", buf, 0xCu);
      }
      uint64_t v15 = [(HFSoftwareUpdateManager *)self requestedSoftwareUpdateInstalls];
      [v15 removeObject:v6];

      uint64_t v11 = [(HFSoftwareUpdateManager *)self dispatcher];
      uint64_t v34 = MEMORY[0x263EF8330];
      uint64_t v35 = 3221225472;
      v36 = __59__HFSoftwareUpdateManager__markSoftwareUpdate_asRequested___block_invoke_31;
      v37 = &unk_2640996A0;
      int v12 = &v38;
      id v38 = v6;
      uint64_t v13 = &v34;
    }
    [v11 dispatchSoftwareUpdateMessage:v13 sender:0];

    int v16 = [v6 supportsSoftwareUpdateV2];
    id v17 = HFLogForCategory(0x40uLL);
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        id v19 = objc_msgSend(v6, "hf_prettyDescription");
        *(_DWORD *)buf = 138412290;
        id v45 = v19;
        _os_log_impl(&dword_20B986000, v17, OS_LOG_TYPE_DEFAULT, "[MARK REQUESTED] Redispatching softwareUpdateController:accessory:didReceiveUpdate: %@", buf, 0xCu);
      }
      v20 = [(HFSoftwareUpdateManager *)self dispatcher];
      uint64_t v29 = MEMORY[0x263EF8330];
      uint64_t v30 = 3221225472;
      uint64_t v31 = __59__HFSoftwareUpdateManager__markSoftwareUpdate_asRequested___block_invoke_32;
      v32 = &unk_2640996A0;
      char v21 = &v33;
      id v33 = v6;
      uint64_t v22 = &v29;
    }
    else
    {
      if (v18)
      {
        v23 = objc_msgSend(v6, "hf_prettyDescription");
        *(_DWORD *)buf = 138412290;
        id v45 = v23;
        _os_log_impl(&dword_20B986000, v17, OS_LOG_TYPE_DEFAULT, "[MARK REQUESTED] Redispatching softwareUpdate:didUpdateState: %@", buf, 0xCu);
      }
      v20 = [(HFSoftwareUpdateManager *)self dispatcher];
      uint64_t v24 = MEMORY[0x263EF8330];
      uint64_t v25 = 3221225472;
      v26 = __59__HFSoftwareUpdateManager__markSoftwareUpdate_asRequested___block_invoke_33;
      v27 = &unk_2640996A0;
      char v21 = &v28;
      id v28 = v6;
      uint64_t v22 = &v24;
    }
    objc_msgSend(v20, "dispatchSoftwareUpdateMessage:sender:", v22, 0, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38,
      v39,
      v40,
      v41,
      v42,
      v43);
  }
}

uint64_t __59__HFSoftwareUpdateManager__markSoftwareUpdate_asRequested___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didUpdateToInstallingState:1 forAccessory:*(void *)(a1 + 32)];
}

uint64_t __59__HFSoftwareUpdateManager__markSoftwareUpdate_asRequested___block_invoke_31(uint64_t a1, void *a2)
{
  return [a2 didUpdateToInstallingState:0 forAccessory:*(void *)(a1 + 32)];
}

uint64_t __59__HFSoftwareUpdateManager__markSoftwareUpdate_asRequested___block_invoke_32(uint64_t a1, void *a2)
{
  return [a2 softwareUpdateV2DidUpdateForAccessory:*(void *)(a1 + 32)];
}

void __59__HFSoftwareUpdateManager__markSoftwareUpdate_asRequested___block_invoke_33(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v8 = [v3 softwareUpdateController];
  id v5 = [v8 availableUpdate];
  id v6 = [*(id *)(a1 + 32) softwareUpdateController];
  id v7 = [v6 availableUpdate];
  objc_msgSend(v4, "softwareUpdate:didUpdateState:", v5, objc_msgSend(v7, "state"));
}

- (int64_t)_softwareUpdateStateForAccessory:(id)a3
{
  id v4 = a3;
  if ([v4 supportsSoftwareUpdateV2])
  {
    id v5 = [(HFSoftwareUpdateManager *)self accessoryUniqueIDToSoftwareUpdateMapTable];
    id v6 = [v4 uniqueIdentifier];
    id v7 = [v5 objectForKey:v6];

    int64_t updated = HMSoftwareUpdateStateFromHMSoftwareUpdateStatusV2([v7 status]);
  }
  else
  {
    id v7 = [v4 softwareUpdateController];
    __int16 v9 = [v7 availableUpdate];
    int64_t updated = [v9 state];
  }
  return updated;
}

- (id)_fetchSoftwareUpdateDocumentationWithAccessory:(id)a3
{
  location[3] = *(id *)MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HFSoftwareUpdateManager *)self accessoryUniqueIDToSoftwareUpdateMapTable];
  id v6 = [v4 uniqueIdentifier];
  id v7 = [v5 objectForKey:v6];

  id v8 = [v7 documentationMetadata];
  if (v8)
  {
    __int16 v9 = [(HFSoftwareUpdateManager *)self documentationMetadataToDocumentationMapTable];
    uint64_t v10 = [v9 objectForKey:v8];

    if (v10)
    {
      uint64_t v11 = [MEMORY[0x263F58190] futureWithResult:v10];
    }
    else
    {
      uint64_t v15 = [(HFSoftwareUpdateManager *)self documentationMetadataToDocumentationFutureMapTable];
      uint64_t v11 = [v15 objectForKey:v8];

      if (!v11)
      {
        int v16 = (void *)MEMORY[0x263F58190];
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __74__HFSoftwareUpdateManager__fetchSoftwareUpdateDocumentationWithAccessory___block_invoke;
        v25[3] = &unk_26408F0C8;
        id v26 = v4;
        id v17 = v8;
        id v27 = v17;
        uint64_t v11 = [v16 futureWithBlock:v25];
        BOOL v18 = [(HFSoftwareUpdateManager *)self documentationMetadataToDocumentationFutureMapTable];
        [v18 setObject:v11 forKey:v17];

        objc_initWeak(location, self);
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __74__HFSoftwareUpdateManager__fetchSoftwareUpdateDocumentationWithAccessory___block_invoke_37;
        v22[3] = &unk_264099740;
        objc_copyWeak(&v24, location);
        id v23 = v17;
        id v19 = (id)[v11 addCompletionBlock:v22];

        objc_destroyWeak(&v24);
        objc_destroyWeak(location);
      }
    }
  }
  else
  {
    int v12 = HFLogForCategory(0x40uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      char v21 = objc_msgSend(v4, "hf_prettyDescription");
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v21;
      _os_log_error_impl(&dword_20B986000, v12, OS_LOG_TYPE_ERROR, "[DOCUMENTATION] Software update does not contain documentation metadata: %@", (uint8_t *)location, 0xCu);
    }
    uint64_t v13 = (void *)MEMORY[0x263F58190];
    __int16 v14 = objc_msgSend(MEMORY[0x263F087E8], "na_genericError");
    uint64_t v11 = [v13 futureWithError:v14];
  }
  return v11;
}

void __74__HFSoftwareUpdateManager__fetchSoftwareUpdateDocumentationWithAccessory___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x40uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
    *(_DWORD *)buf = 138412290;
    __int16 v14 = v5;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "[DOCUMENTATION] Fetching: %@", buf, 0xCu);
  }
  id v6 = [*(id *)(a1 + 32) home];
  id v7 = [v6 softwareUpdateController];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __74__HFSoftwareUpdateManager__fetchSoftwareUpdateDocumentationWithAccessory___block_invoke_36;
  v10[3] = &unk_264099718;
  uint64_t v8 = *(void *)(a1 + 40);
  id v11 = *(id *)(a1 + 32);
  id v12 = v3;
  id v9 = v3;
  [v7 fetchDocumentationFromMetadata:v8 completion:v10];
}

void __74__HFSoftwareUpdateManager__fetchSoftwareUpdateDocumentationWithAccessory___block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = HFLogForCategory(0x40uLL);
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v9 = objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
      int v11 = 138412546;
      id v12 = v6;
      __int16 v13 = 2112;
      __int16 v14 = v9;
      _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "[DOCUMENTATION] Fetch error: %@ %@", (uint8_t *)&v11, 0x16u);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_msgSend(v5, "hf_prettyDescription");
    uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
    int v11 = 138412546;
    id v12 = v9;
    __int16 v13 = 2112;
    __int16 v14 = v10;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "[DOCUMENTATION] Completed fetch: %@ %@", (uint8_t *)&v11, 0x16u);

    goto LABEL_6;
  }

  [*(id *)(a1 + 40) finishWithResult:v5 error:v6];
}

void __74__HFSoftwareUpdateManager__fetchSoftwareUpdateDocumentationWithAccessory___block_invoke_37(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (!a3)
  {
    id v7 = [WeakRetained documentationMetadataToDocumentationMapTable];
    [v7 setObject:v9 forKey:*(void *)(a1 + 32)];
  }
  uint64_t v8 = [v6 documentationMetadataToDocumentationFutureMapTable];
  [v8 removeObjectForKey:*(void *)(a1 + 32)];
}

- (void)_waitToFinishPromise:(id)a3 untilSoftwareUpdateDocumentationFetchCompletes:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HFSoftwareUpdateManager *)self accessoryUniqueIDToSoftwareUpdateMapTable];
  id v9 = [v7 uniqueIdentifier];
  uint64_t v10 = [v8 objectForKey:v9];

  int v11 = [(HFSoftwareUpdateManager *)self documentationMetadataToDocumentationFutureMapTable];
  id v12 = [v10 documentationMetadata];
  __int16 v13 = [v11 objectForKey:v12];

  __int16 v14 = HFLogForCategory(0x40uLL);
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      int v16 = objc_msgSend(v7, "hf_prettyDescription");
      *(_DWORD *)buf = 138412290;
      id v25 = v16;
      _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "[FETCH] Waiting for documentation future to complete before finishing fetch promise: %@", buf, 0xCu);
    }
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __95__HFSoftwareUpdateManager__waitToFinishPromise_untilSoftwareUpdateDocumentationFetchCompletes___block_invoke;
    v20[3] = &unk_264099768;
    id v21 = v6;
    uint64_t v22 = self;
    id v23 = v7;
    id v17 = (id)[v13 addCompletionBlock:v20];
  }
  else
  {
    if (v15)
    {
      BOOL v18 = [(HFSoftwareUpdateManager *)self isReadyToInstallSoftwareUpdate:v7];
      id v19 = objc_msgSend(v7, "hf_prettyDescription");
      *(_DWORD *)buf = 138412802;
      id v25 = v6;
      __int16 v26 = 1024;
      BOOL v27 = v18;
      __int16 v28 = 2112;
      uint64_t v29 = v19;
      _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "[FETCH] Finishing promise %@; Ready to Install: %{BOOL}d; %@",
        buf,
        0x1Cu);
    }
    [v6 finishWithNoResult];
  }
}

uint64_t __95__HFSoftwareUpdateManager__waitToFinishPromise_untilSoftwareUpdateDocumentationFetchCompletes___block_invoke(id *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = HFLogForCategory(0x40uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    int v4 = [a1[5] isReadyToInstallSoftwareUpdate:a1[6]];
    id v5 = objc_msgSend(a1[6], "hf_prettyDescription");
    int v7 = 138412802;
    id v8 = v3;
    __int16 v9 = 1024;
    int v10 = v4;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "[FETCH] Finishing promise %@; Ready to Install: %{BOOL}d; %@",
      (uint8_t *)&v7,
      0x1Cu);
  }
  return [a1[4] finishWithNoResult];
}

- (void)_finishFetchPromisesWithAccessory:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HFSoftwareUpdateManager *)self accessoryUniqueIDToFetchPromisesMapTable];
  id v6 = [v4 uniqueIdentifier];
  int v7 = [v5 objectForKey:v6];

  if (v7)
  {
    if ([(HFSoftwareUpdateManager *)self _softwareUpdateStateForAccessory:v4] == 4)
    {
      id v8 = HFLogForCategory(0x40uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = [v7 count];
        int v10 = v7;
        if (v9 == 1)
        {
          int v10 = [v7 anyObject];
        }
        BOOL v11 = v9 == 1;
        id v12 = objc_msgSend(v4, "hf_prettyDescription");
        *(_DWORD *)buf = 138412546;
        id v23 = v10;
        __int16 v24 = 2112;
        id v25 = v12;
        _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "[FETCH] Unfinished promises still exist, but we haven't seen the new update yet: %@ %@", buf, 0x16u);

        if (v11) {
      }
        }
    }
    else
    {
      objc_initWeak((id *)buf, self);
      uint64_t v16 = MEMORY[0x263EF8330];
      uint64_t v17 = 3221225472;
      BOOL v18 = __61__HFSoftwareUpdateManager__finishFetchPromisesWithAccessory___block_invoke;
      id v19 = &unk_264092510;
      objc_copyWeak(&v21, (id *)buf);
      id v13 = v4;
      id v20 = v13;
      objc_msgSend(v7, "na_each:", &v16);
      __int16 v14 = [(HFSoftwareUpdateManager *)self accessoryUniqueIDToFetchPromisesMapTable];
      BOOL v15 = [v13 uniqueIdentifier];
      [v14 removeObjectForKey:v15];

      objc_destroyWeak(&v21);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __61__HFSoftwareUpdateManager__finishFetchPromisesWithAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _waitToFinishPromise:v4 untilSoftwareUpdateDocumentationFetchCompletes:*(void *)(a1 + 32)];
}

- (void)_updateRequestedSoftwareUpdateInstallsWithAccessory:(id)a3 softwareUpdateState:(int64_t)a4 softwareUpdateVersion:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  BOOL v11 = [(HFSoftwareUpdateManager *)self requestedSoftwareUpdateInstalls];
  int v12 = [v11 containsObject:v9];

  if (v12)
  {
    if ((unint64_t)(a4 - 3) > 2)
    {
      id v17 = objc_alloc(MEMORY[0x263F42630]);
      BOOL v18 = [v9 firmwareVersion];
      uint64_t v16 = (void *)[v17 initWithVersionString:v18];

      if ([v10 isEqualToVersion:v16])
      {
        id v19 = HFLogForCategory(0x40uLL);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          id v20 = objc_msgSend(v9, "hf_prettyDescription");
          int v30 = 138412546;
          uint64_t v31 = v16;
          __int16 v32 = 2112;
          id v33 = v20;
          _os_log_impl(&dword_20B986000, v19, OS_LOG_TYPE_DEFAULT, "[MARK REQUESTED] Removing accessory from requestedSoftwareUpdateInstalls because accessory and update versions (%@) match: %@", (uint8_t *)&v30, 0x16u);
        }
        id v21 = [(HFSoftwareUpdateManager *)self requestedSoftwareUpdateInstalls];
        [v21 removeObject:v9];
      }
    }
    else
    {
      id v13 = HFLogForCategory(0x40uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v14 = NSStringFromHMSoftwareUpdateState(a4);
        BOOL v15 = objc_msgSend(v9, "hf_prettyDescription");
        int v30 = 138412546;
        uint64_t v31 = v14;
        __int16 v32 = 2112;
        id v33 = v15;
        _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEFAULT, "[MARK REQUESTED] Removing accessory from requestedSoftwareUpdateInstalls because %@ is either Requested, Installing, Installed: %@", (uint8_t *)&v30, 0x16u);
      }
      uint64_t v16 = [(HFSoftwareUpdateManager *)self requestedSoftwareUpdateInstalls];
      [v16 removeObject:v9];
    }
  }
  uint64_t v22 = [(HFSoftwareUpdateManager *)self requestedSoftwareUpdateInstalls];
  uint64_t v23 = [v22 count];

  if (v23)
  {
    __int16 v24 = HFLogForCategory(0x40uLL);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = [(HFSoftwareUpdateManager *)self requestedSoftwareUpdateInstalls];
      uint64_t v26 = [v25 count];
      BOOL v27 = [(HFSoftwareUpdateManager *)self requestedSoftwareUpdateInstalls];
      __int16 v28 = v27;
      if (v26 == 1)
      {
        id v5 = [v27 anyObject];
        objc_msgSend(v5, "hf_prettyDescription");
      }
      else
      {
        objc_msgSend(v27, "hf_prettyDescription");
      uint64_t v29 = };
      int v30 = 138412290;
      uint64_t v31 = v29;
      _os_log_impl(&dword_20B986000, v24, OS_LOG_TYPE_DEFAULT, "[MARK REQUESTED] requestedSoftwareUpdateInstalls still contains accessories: %@", (uint8_t *)&v30, 0xCu);
      if (v26 == 1)
      {

        uint64_t v29 = v5;
      }
    }
  }
}

- (BOOL)hasValidSoftwareUpdate:(id)a3
{
  id v4 = a3;
  char v5 = [v4 isControllable];
  if ((_os_feature_enabled_impl() & 1) != 0
    || CFPreferencesGetAppBooleanValue(@"MatteriPhoneOnlyPairingEnabled", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)|| CFPreferencesGetAppBooleanValue(@"MatteriPhoneOnlyPairingForIPadEnabled", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)|| (_os_feature_enabled_impl() & 1) != 0)
  {
    if (v5)
    {
      char v5 = 1;
      goto LABEL_13;
    }
  }
  else
  {
    if (CFPreferencesGetAppBooleanValue(@"MatteriPhoneOnlyPairingForMacEnabled", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
    {
      char v6 = v5;
    }
    else
    {
      char v6 = 1;
    }
    if (v6)
    {
LABEL_13:
      if ([(HFSoftwareUpdateManager *)self isReadyToInstallSoftwareUpdate:v4]
        && (v5 & 1) != 0)
      {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  if ([v4 supportsCHIP])
  {
    int v7 = +[HFHomeKitDispatcher sharedDispatcher];
    id v8 = [v7 homeManager];
    char v5 = [v8 hasOptedToHH2];

    goto LABEL_13;
  }
  [(HFSoftwareUpdateManager *)self isReadyToInstallSoftwareUpdate:v4];
LABEL_17:
  if (![(HFSoftwareUpdateManager *)self isSoftwareUpdateInProgress:v4])
  {
    BOOL v9 = [(HFSoftwareUpdateManager *)self isSoftwareUpdateInstalled:v4];
    goto LABEL_20;
  }
LABEL_18:
  BOOL v9 = 1;
LABEL_20:

  return v9;
}

- (BOOL)hasNewValidSoftwareUpdate:(id)a3
{
  id v4 = a3;
  char v5 = [v4 isControllable];
  if ((_os_feature_enabled_impl() & 1) != 0
    || CFPreferencesGetAppBooleanValue(@"MatteriPhoneOnlyPairingEnabled", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)|| CFPreferencesGetAppBooleanValue(@"MatteriPhoneOnlyPairingForIPadEnabled", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)|| (_os_feature_enabled_impl() & 1) != 0)
  {
    if (v5)
    {
      char v5 = 1;
      goto LABEL_13;
    }
  }
  else
  {
    if (CFPreferencesGetAppBooleanValue(@"MatteriPhoneOnlyPairingForMacEnabled", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
    {
      char v6 = v5;
    }
    else
    {
      char v6 = 1;
    }
    if (v6) {
      goto LABEL_13;
    }
  }
  if (([v4 supportsCHIP] & 1) == 0)
  {
    [(HFSoftwareUpdateManager *)self isReadyToInstallSoftwareUpdate:v4];
LABEL_17:
    BOOL v9 = [(HFSoftwareUpdateManager *)self isSoftwareUpdateInProgress:v4];
    goto LABEL_18;
  }
  int v7 = +[HFHomeKitDispatcher sharedDispatcher];
  id v8 = [v7 homeManager];
  char v5 = [v8 hasOptedToHH2];

LABEL_13:
  if (![(HFSoftwareUpdateManager *)self isReadyToInstallSoftwareUpdate:v4]
    || (v5 & 1) == 0)
  {
    goto LABEL_17;
  }
  BOOL v9 = 1;
LABEL_18:

  return v9;
}

- (BOOL)softwareUpdatePossessesNecessaryDocumentation:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (objc_msgSend(v4, "hf_isHomePod"))
  {
    char v5 = [(HFSoftwareUpdateManager *)self softwareUpdateDocumentation:v4];
    uint64_t v6 = [v5 licenseAgreement];
    if (v6)
    {
      int v7 = (void *)v6;
      id v8 = [v5 releaseNotes];
      if (v8)
      {

LABEL_7:
        BOOL v9 = 1;
LABEL_13:

        goto LABEL_14;
      }
      id v10 = [v5 releaseNotesSummary];

      if (v10) {
        goto LABEL_7;
      }
    }
    if ([(HFSoftwareUpdateManager *)self hasSoftwareUpdate:v4])
    {
      BOOL v11 = HFLogForCategory(0x40uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v13 = [v5 description];
        __int16 v14 = objc_msgSend(v4, "hf_prettyExpensiveDescription");
        int v15 = 138412546;
        uint64_t v16 = v13;
        __int16 v17 = 2112;
        BOOL v18 = v14;
        _os_log_error_impl(&dword_20B986000, v11, OS_LOG_TYPE_ERROR, "[DOCUMENTATION] Software update does not possess necessary documentation: %@, for accessory: %@", (uint8_t *)&v15, 0x16u);
      }
    }
    BOOL v9 = 0;
    goto LABEL_13;
  }
  BOOL v9 = 1;
LABEL_14:

  return v9;
}

- (id)softwareUpdateDocumentation:(id)a3
{
  id v4 = a3;
  if ([v4 supportsSoftwareUpdateV2])
  {
    char v5 = [(HFSoftwareUpdateManager *)self accessoryUniqueIDToSoftwareUpdateMapTable];
    uint64_t v6 = [v4 uniqueIdentifier];
    int v7 = [v5 objectForKey:v6];

    id v8 = [v7 documentationMetadata];
    if (v8)
    {
      BOOL v9 = [(HFSoftwareUpdateManager *)self documentationMetadataToDocumentationMapTable];
      id v10 = [v9 objectForKey:v8];
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    int v7 = [v4 softwareUpdateController];
    id v8 = [v7 availableUpdate];
    id v10 = [v8 documentation];
  }

  return v10;
}

- (id)softwareUpdateVersion:(id)a3
{
  id v4 = a3;
  if ([v4 supportsSoftwareUpdateV2])
  {
    char v5 = [(HFSoftwareUpdateManager *)self accessoryUniqueIDToSoftwareUpdateMapTable];
    uint64_t v6 = [v4 uniqueIdentifier];
    int v7 = [v5 objectForKey:v6];

    id v8 = [v7 version];
  }
  else
  {
    int v7 = [v4 softwareUpdateController];
    BOOL v9 = [v7 availableUpdate];
    id v8 = [v9 version];
  }
  return v8;
}

- (id)softwareUpdateDisplayableVersion:(id)a3
{
  id v4 = a3;
  if ([v4 supportsSoftwareUpdateV2])
  {
    char v5 = [(HFSoftwareUpdateManager *)self accessoryUniqueIDToSoftwareUpdateMapTable];
    uint64_t v6 = [v4 uniqueIdentifier];
    int v7 = [v5 objectForKey:v6];

    id v8 = [v7 version];
    [v8 localizedDescription];
  }
  else
  {
    int v7 = [v4 softwareUpdateController];
    id v8 = [v7 availableUpdate];
    [v8 displayableVersion];
  BOOL v9 = };

  return v9;
}

- (id)softwareUpdateReleaseDate:(id)a3
{
  id v3 = a3;
  if ([v3 supportsSoftwareUpdateV2])
  {
    id v4 = 0;
  }
  else
  {
    char v5 = [v3 softwareUpdateController];
    uint64_t v6 = [v5 availableUpdate];
    id v4 = [v6 releaseDate];
  }
  return v4;
}

- (unint64_t)softwareUpdateDownloadSize:(id)a3
{
  id v4 = a3;
  if ([v4 supportsSoftwareUpdateV2])
  {
    char v5 = [(HFSoftwareUpdateManager *)self accessoryUniqueIDToSoftwareUpdateMapTable];
    uint64_t v6 = [v4 uniqueIdentifier];
    int v7 = [v5 objectForKey:v6];

    unint64_t v8 = [v7 downloadSize];
  }
  else
  {
    int v7 = [v4 softwareUpdateController];
    BOOL v9 = [v7 availableUpdate];
    unint64_t v8 = [v9 downloadSize];
  }
  return v8;
}

- (id)softwareUpdatePortionComplete:(id)a3
{
  id v4 = a3;
  if ([v4 supportsSoftwareUpdateV2])
  {
    char v5 = [(HFSoftwareUpdateManager *)self accessoryUniqueIDToSoftwareUpdateProgressMapTable];
    uint64_t v6 = [v4 uniqueIdentifier];
    int v7 = [v5 objectForKey:v6];

    [v7 percentageComplete];
    float v9 = fabsf(v8);
    if (v8 <= 0.0 || v9 < 0.00000011921)
    {
      BOOL v11 = 0;
    }
    else
    {
      BOOL v11 = objc_msgSend(NSNumber, "numberWithFloat:");
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)_fetchNeedsAttentionReasons:(id)a3
{
  id v3 = a3;
  if ([v3 supportsSoftwareUpdateV2] & 1) != 0 || (objc_msgSend(v3, "hf_isHomePod"))
  {
    id v4 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  else
  {
    char v5 = (void *)MEMORY[0x263F58190];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __55__HFSoftwareUpdateManager__fetchNeedsAttentionReasons___block_invoke;
    v8[3] = &unk_26408E4E0;
    id v9 = v3;
    uint64_t v6 = [v5 futureWithBlock:v8];
    id v4 = [v6 flatMap:&__block_literal_global_66_5];
  }
  return v4;
}

void __55__HFSoftwareUpdateManager__fetchNeedsAttentionReasons___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) softwareUpdateController];
  char v5 = [v4 availableUpdate];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__HFSoftwareUpdateManager__fetchNeedsAttentionReasons___block_invoke_2;
  v7[3] = &unk_264099790;
  id v8 = v3;
  id v6 = v3;
  [v5 fetchNeedsAttentionReasonsWithCompletionHandler:v7];
}

void __55__HFSoftwareUpdateManager__fetchNeedsAttentionReasons___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__HFSoftwareUpdateManager__fetchNeedsAttentionReasons___block_invoke_3;
  block[3] = &unk_26408D388;
  id v10 = v5;
  id v11 = *(id *)(a1 + 32);
  id v12 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __55__HFSoftwareUpdateManager__fetchNeedsAttentionReasons___block_invoke_3(void *a1)
{
  uint64_t v3 = a1[4];
  id v2 = (void *)a1[5];
  if (v3) {
    return objc_msgSend(v2, "finishWithError:");
  }
  else {
    return [v2 finishWithResult:a1[6]];
  }
}

id __55__HFSoftwareUpdateManager__fetchNeedsAttentionReasons___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if ([v2 unsignedIntegerValue])
  {
    uint64_t v3 = [v2 unsignedIntegerValue];
    if (v3)
    {
      uint64_t v4 = v3;
      if ((v3 & 2) != 0)
      {
        uint64_t v6 = 65;
      }
      else if ((v3 & 4) != 0)
      {
        uint64_t v6 = 66;
      }
      else if ((v3 & 8) != 0)
      {
        uint64_t v6 = 67;
      }
      else if (v3)
      {
        uint64_t v6 = 64;
      }
      else
      {
        id v5 = HFLogForCategory(0x40uLL);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          int v10 = 134217984;
          uint64_t v11 = v4;
          _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "[START UPDATE] Unhandled needsAttentionReasons: %ld", (uint8_t *)&v10, 0xCu);
        }

        uint64_t v6 = 68;
      }
      id v8 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", v6);
    }
    else
    {
      id v8 = 0;
    }
    id v7 = [MEMORY[0x263F58190] futureWithError:v8];
  }
  else
  {
    id v7 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v7;
}

- (id)startSoftwareUpdate:(id)a3
{
  id v4 = a3;
  if ([(HFSoftwareUpdateManager *)self isSoftwareUpdateInProgress:v4]
    || [(HFSoftwareUpdateManager *)self isSoftwareUpdateInstalled:v4])
  {
    id v5 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  else
  {
    uint64_t v6 = [(HFSoftwareUpdateManager *)self _fetchNeedsAttentionReasons:v4];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __47__HFSoftwareUpdateManager_startSoftwareUpdate___block_invoke;
    v14[3] = &unk_26408F1C0;
    id v7 = v4;
    id v15 = v7;
    id v8 = [v6 recover:v14];

    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __47__HFSoftwareUpdateManager_startSoftwareUpdate___block_invoke_2;
    v10[3] = &unk_2640910B0;
    objc_copyWeak(&v12, &location);
    id v11 = v7;
    id v5 = [v8 flatMap:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v5;
}

id __47__HFSoftwareUpdateManager_startSoftwareUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = objc_msgSend(v2, "hf_serviceNameComponents");
  id v5 = [v4 composedString];
  uint64_t v6 = objc_msgSend(v3, "hf_errorWithOperationType:failedItemName:", @"HFOperationStartSoftwareUpdate", v5);

  id v7 = [MEMORY[0x263F58190] futureWithError:v6];

  return v7;
}

id __47__HFSoftwareUpdateManager_startSoftwareUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x263F58190];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __47__HFSoftwareUpdateManager_startSoftwareUpdate___block_invoke_3;
  v14[3] = &unk_2640997B8;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  id v15 = *(id *)(a1 + 32);
  id v5 = [v4 futureWithErrorOnlyHandlerAdapterBlock:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __47__HFSoftwareUpdateManager_startSoftwareUpdate___block_invoke_69;
  v12[3] = &unk_26408CDC8;
  id v13 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 flatMap:v12];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__HFSoftwareUpdateManager_startSoftwareUpdate___block_invoke_71;
  v9[3] = &unk_2640997E0;
  id v10 = *(id *)(a1 + 32);
  objc_copyWeak(&v11, (id *)(a1 + 40));
  id v7 = [v6 recover:v9];
  objc_destroyWeak(&v11);

  objc_destroyWeak(&v16);
  return v7;
}

void __47__HFSoftwareUpdateManager_startSoftwareUpdate___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _markSoftwareUpdate:*(void *)(a1 + 32) asRequested:1];
  id v5 = HFLogForCategory(0x40uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "hf_prettyExpensiveDescription");
    int v13 = 138412290;
    __int16 v14 = v6;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "[START UPDATE] Starting software update: %@", (uint8_t *)&v13, 0xCu);
  }
  if ([*(id *)(a1 + 32) supportsSoftwareUpdateV2])
  {
    id v7 = [WeakRetained accessoryUniqueIDToSoftwareUpdateMapTable];
    id v8 = [*(id *)(a1 + 32) uniqueIdentifier];
    id v9 = [v7 objectForKey:v8];

    id v10 = [*(id *)(a1 + 32) home];
    id v11 = [v10 softwareUpdateController];
    id v12 = [*(id *)(a1 + 32) uniqueIdentifier];
    [v11 applySoftwareUpdate:v9 accessory:v12 completion:v3];
  }
  else
  {
    id v9 = [*(id *)(a1 + 32) softwareUpdateController];
    id v10 = [*(id *)(a1 + 32) softwareUpdateController];
    id v11 = [v10 availableUpdate];
    [v9 startUpdate:v11 completionHandler:v3];
  }
}

id __47__HFSoftwareUpdateManager_startSoftwareUpdate___block_invoke_69(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = HFLogForCategory(0x40uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = objc_msgSend(*(id *)(a1 + 32), "hf_prettyExpensiveDescription");
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "[START UPDATE SUCCEEDED] %@", (uint8_t *)&v6, 0xCu);
  }
  id v4 = [MEMORY[0x263F58190] futureWithNoResult];
  return v4;
}

id __47__HFSoftwareUpdateManager_startSoftwareUpdate___block_invoke_71(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x40uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v11 = objc_msgSend(*(id *)(a1 + 32), "hf_prettyExpensiveDescription");
    int v12 = 138412546;
    id v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v11;
    _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "[START UPDATE FAILED] %@ %@", (uint8_t *)&v12, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _markSoftwareUpdate:*(void *)(a1 + 32) asRequested:0];

  int v6 = objc_msgSend(*(id *)(a1 + 32), "hf_serviceNameComponents");
  id v7 = [v6 composedString];
  uint64_t v8 = objc_msgSend(v3, "hf_errorWithOperationType:failedItemName:", @"HFOperationStartSoftwareUpdate", v7);

  id v9 = [MEMORY[0x263F58190] futureWithError:v8];

  return v9;
}

- (id)fetchAvailableSoftwareUpdate:(id)a3 options:(unint64_t)a4
{
  location[3] = *(id *)MEMORY[0x263EF8340];
  id v6 = a3;
  if (objc_msgSend(v6, "hf_isHomePod") & 1) != 0 || (objc_msgSend(v6, "supportsSoftwareUpdateV2"))
  {
    if ([v6 supportsSoftwareUpdateV2])
    {
      id v7 = [v6 uniqueIdentifier];
      uint64_t v8 = [(HFSoftwareUpdateManager *)self accessoryUniqueIDToSoftwareUpdateMapTable];
      id v9 = [v8 objectForKey:v7];

      if (v9 && HMSoftwareUpdateStateFromHMSoftwareUpdateStatusV2([v9 status]) != 4)
      {
        __int16 v17 = HFLogForCategory(0x40uLL);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v18 = objc_msgSend(v6, "hf_prettyDescription");
          LODWORD(location[0]) = 138412290;
          *(id *)((char *)location + 4) = v18;
          _os_log_impl(&dword_20B986000, v17, OS_LOG_TYPE_DEFAULT, "[FETCH] No scan necessary; we already have an update: %@",
            (uint8_t *)location,
            0xCu);
        }
        objc_initWeak(location, self);
        uint64_t v19 = (void *)MEMORY[0x263F58190];
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __64__HFSoftwareUpdateManager_fetchAvailableSoftwareUpdate_options___block_invoke;
        v32[3] = &unk_264092510;
        objc_copyWeak(&v34, location);
        id v33 = v6;
        id v11 = [v19 futureWithBlock:v32];

        objc_destroyWeak(&v34);
        objc_destroyWeak(location);
      }
      else
      {
        objc_initWeak(location, self);
        id v10 = (void *)MEMORY[0x263F58190];
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __64__HFSoftwareUpdateManager_fetchAvailableSoftwareUpdate_options___block_invoke_2;
        v28[3] = &unk_264099830;
        id v29 = v6;
        id v30 = v7;
        v31[1] = (id)a4;
        objc_copyWeak(v31, location);
        id v11 = [v10 futureWithBlock:v28];
        objc_destroyWeak(v31);

        objc_destroyWeak(location);
      }
    }
    else
    {
      int v12 = (void *)MEMORY[0x263F58190];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __64__HFSoftwareUpdateManager_fetchAvailableSoftwareUpdate_options___block_invoke_73;
      v26[3] = &unk_26408CD50;
      id v13 = v6;
      id v27 = v13;
      __int16 v14 = [v12 futureWithErrorOnlyHandlerAdapterBlock:v26];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __64__HFSoftwareUpdateManager_fetchAvailableSoftwareUpdate_options___block_invoke_2_74;
      v24[3] = &unk_26408F1C0;
      id v15 = v13;
      id v25 = v15;
      uint64_t v16 = [v14 recover:v24];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __64__HFSoftwareUpdateManager_fetchAvailableSoftwareUpdate_options___block_invoke_3_76;
      v21[3] = &unk_26408F238;
      id v22 = v15;
      uint64_t v23 = self;
      id v11 = [v16 addCompletionBlock:v21];
    }
  }
  else
  {
    id v11 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v11;
}

void __64__HFSoftwareUpdateManager_fetchAvailableSoftwareUpdate_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _waitToFinishPromise:v4 untilSoftwareUpdateDocumentationFetchCompletes:*(void *)(a1 + 32)];
}

void __64__HFSoftwareUpdateManager_fetchAvailableSoftwareUpdate_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) home];
  id v5 = [v4 softwareUpdateController];
  id v6 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", *(void *)(a1 + 40));
  uint64_t v7 = *(void *)(a1 + 56);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __64__HFSoftwareUpdateManager_fetchAvailableSoftwareUpdate_options___block_invoke_3;
  v9[3] = &unk_264099808;
  objc_copyWeak(&v13, (id *)(a1 + 48));
  id v10 = *(id *)(a1 + 32);
  id v8 = v3;
  id v11 = v8;
  id v12 = *(id *)(a1 + 40);
  [v5 scanForSoftwareUpdateOnAccessories:v6 withOptions:v7 completion:v9];

  objc_destroyWeak(&v13);
}

void __64__HFSoftwareUpdateManager_fetchAvailableSoftwareUpdate_options___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = WeakRetained;
  if (a2)
  {
    if ([WeakRetained hasSoftwareUpdate:*(void *)(a1 + 32)]
      && ([v5 isSoftwareUpdateInstalled:*(void *)(a1 + 32)] & 1) == 0)
    {
      uint64_t v16 = HFLogForCategory(0x40uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = [v5 isReadyToInstallSoftwareUpdate:*(void *)(a1 + 32)];
        BOOL v18 = objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
        int v19 = 67109378;
        *(_DWORD *)id v20 = v17;
        *(_WORD *)&void v20[4] = 2112;
        *(void *)&v20[6] = v18;
        _os_log_impl(&dword_20B986000, v16, OS_LOG_TYPE_DEFAULT, "[FETCH] Update found; Ready To Install: %{BOOL}d; %@",
          (uint8_t *)&v19,
          0x12u);
      }
      [v5 _waitToFinishPromise:*(void *)(a1 + 40) untilSoftwareUpdateDocumentationFetchCompletes:*(void *)(a1 + 32)];
    }
    else
    {
      id v6 = HFLogForCategory(0x40uLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 40);
        id v8 = objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
        int v19 = 138412546;
        *(void *)id v20 = v7;
        *(_WORD *)&v20[8] = 2112;
        *(void *)&v20[10] = v8;
        _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "[FETCH] Postpoining promise finish until next delegate callback: %@ %@", (uint8_t *)&v19, 0x16u);
      }
      id v9 = [v5 accessoryUniqueIDToFetchPromisesMapTable];
      id v10 = [*(id *)(a1 + 32) uniqueIdentifier];
      id v11 = [v9 objectForKey:v10];

      if (v11)
      {
        id v12 = [v11 setByAddingObject:*(void *)(a1 + 40)];
      }
      else
      {
        id v12 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 40)];
      }
      id v15 = [v5 accessoryUniqueIDToFetchPromisesMapTable];
      [v15 setObject:v12 forKey:*(void *)(a1 + 48)];
    }
  }
  else
  {
    id v13 = HFLogForCategory(0x40uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
      int v19 = 138412290;
      *(void *)id v20 = v14;
      _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEFAULT, "[FETCH] No update found: %@", (uint8_t *)&v19, 0xCu);
    }
    [*(id *)(a1 + 40) finishWithNoResult];
  }
}

void __64__HFSoftwareUpdateManager_fetchAvailableSoftwareUpdate_options___block_invoke_73(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 softwareUpdateController];
  [v4 fetchAvailableUpdateWithCompletionHandler:v3];
}

id __64__HFSoftwareUpdateManager_fetchAvailableSoftwareUpdate_options___block_invoke_2_74(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a2;
  id v5 = [v3 dictionary];
  id v6 = objc_msgSend(*(id *)(a1 + 32), "hf_serviceNameComponents");
  uint64_t v7 = [v6 composedString];
  objc_msgSend(v5, "na_safeSetObject:forKey:", v7, @"HFErrorHandlerOptionFailedItemName");

  [v5 setObject:@"HFOperationCheckForSoftwareUpdates" forKeyedSubscript:@"HFErrorUserInfoOperationKey"];
  id v8 = (void *)MEMORY[0x263F58190];
  id v9 = objc_msgSend(v4, "hf_errorWithAddedUserInfo:", v5);

  id v10 = [v8 futureWithError:v9];

  return v10;
}

void __64__HFSoftwareUpdateManager_fetchAvailableSoftwareUpdate_options___block_invoke_3_76(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    int v7 = objc_msgSend(*(id *)(a1 + 32), "hf_hasSoftwareUpdate");
    id v5 = HFLogForCategory(0x40uLL);
    BOOL v8 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v8) {
        goto LABEL_11;
      }
      int v9 = [*(id *)(a1 + 40) isReadyToInstallSoftwareUpdate:*(void *)(a1 + 32)];
      id v6 = objc_msgSend(*(id *)(a1 + 32), "hf_prettyExpensiveDescription");
      int v13 = 67109378;
      *(_DWORD *)__int16 v14 = v9;
      *(_WORD *)&void v14[4] = 2112;
      *(void *)&v14[6] = v6;
      id v10 = "[FETCH] Update found; Ready To Install: %{BOOL}d; %@";
      id v11 = v5;
      uint32_t v12 = 18;
    }
    else
    {
      if (!v8) {
        goto LABEL_11;
      }
      id v6 = objc_msgSend(*(id *)(a1 + 32), "hf_prettyExpensiveDescription");
      int v13 = 138412290;
      *(void *)__int16 v14 = v6;
      id v10 = "[FETCH] No update found: %@";
      id v11 = v5;
      uint32_t v12 = 12;
    }
    _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, v12);
    goto LABEL_10;
  }
  id v5 = HFLogForCategory(0x40uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = objc_msgSend(*(id *)(a1 + 32), "hf_prettyExpensiveDescription");
    int v13 = 138412546;
    *(void *)__int16 v14 = v4;
    *(_WORD *)&v14[8] = 2112;
    *(void *)&v14[10] = v6;
    _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "[FETCH] Failed: %@ %@", (uint8_t *)&v13, 0x16u);
LABEL_10:
  }
LABEL_11:
}

- (void)setDispatcher:(id)a3
{
}

- (NSMapTable)documentationMetadataToDocumentationMapTable
{
  return self->_documentationMetadataToDocumentationMapTable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedSoftwareUpdateInstalls, 0);
  objc_storeStrong((id *)&self->_documentationMetadataToDocumentationFutureMapTable, 0);
  objc_storeStrong((id *)&self->_documentationMetadataToDocumentationMapTable, 0);
  objc_storeStrong((id *)&self->_observedAccessoryUniqueIDToAccessoryMapTable, 0);
  objc_storeStrong((id *)&self->_accessoryUniqueIDToFetchPromisesMapTable, 0);
  objc_storeStrong((id *)&self->_accessoryUniqueIDToSoftwareUpdateProgressMapTable, 0);
  objc_storeStrong((id *)&self->_accessoryUniqueIDToSoftwareUpdateMapTable, 0);
  objc_destroyWeak((id *)&self->_dispatcher);
}

@end