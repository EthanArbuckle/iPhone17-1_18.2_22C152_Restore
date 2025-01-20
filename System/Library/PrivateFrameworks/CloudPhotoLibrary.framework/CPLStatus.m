@interface CPLStatus
- (BOOL)_deleteInitialSyncMarkerWithError:(id *)a3;
- (BOOL)_writeInitialSyncMarkerForDate:(id)a3 error:(id *)a4;
- (BOOL)containerHasBeenWiped;
- (BOOL)hasBatteryBudget;
- (BOOL)hasCellularBudget;
- (BOOL)hasChangesToProcess;
- (BOOL)hasFinishedInitialDownload;
- (BOOL)hasHeavyResourceUsage;
- (BOOL)hasLowBatteryLevel;
- (BOOL)hasModerateThermalPressure;
- (BOOL)hasPoorNetworkQuality;
- (BOOL)hasPoorSystemConditions;
- (BOOL)hasThermalPressure;
- (BOOL)hasValidSystemBudget;
- (BOOL)iCloudLibraryClientIsNotAuthenticated;
- (BOOL)iCloudLibraryClientVersionTooOld;
- (BOOL)iCloudLibraryExists;
- (BOOL)iCloudLibraryHasBeenWiped;
- (BOOL)isBlockedByLowPowerMode;
- (BOOL)isBlockedBySnapshot;
- (BOOL)isCellularRestricted;
- (BOOL)isConnectedToNetwork;
- (BOOL)isConstrainedNetwork;
- (BOOL)isExceedingQuota;
- (BOOL)isExceedingSharedLibraryQuota;
- (BOOL)isInAirplaneMode;
- (BOOL)isKeychainCDPEnabled;
- (BOOL)isStuckInExitForSharedLibrary;
- (BOOL)isUpgradeSuggestedToAccessAllPhotos;
- (BOOL)isWalrusEnabled;
- (BOOL)lowDiskSpace;
- (BOOL)veryLowDiskSpace;
- (BOOL)writeInitialSyncMarker:(id *)a3;
- (CPLAccountFlags)accountFlags;
- (CPLStatus)initWithClientLibraryBaseURL:(id)a3;
- (CPLStatus)initWithClientLibraryBaseURLForCPLEngine:(id)a3;
- (CPLStatusDelegate)delegate;
- (NSArray)disabledFeatures;
- (NSData)accountFlagsData;
- (NSDate)cloudAssetCountPerTypeLastCheckDate;
- (NSDate)exitDeleteTime;
- (NSDate)initialDownloadDate;
- (NSDate)initialSyncDate;
- (NSDate)lastCompletePrefetchDate;
- (NSDate)lastPruneDate;
- (NSDate)lastSuccessfulSyncDate;
- (NSDictionary)cloudAssetCountPerType;
- (id)_statusClient;
- (id)statusDescription;
- (int64_t)blockedReason;
- (int64_t)busyState;
- (int64_t)clientFeatureCompatibleVersion;
- (int64_t)serverFeatureCompatibleVersion;
- (int64_t)unBlockedReason;
- (unint64_t)estimatedCountOfRemainingRecordsDuringSharedLibraryExit;
- (void)_loadIfNecessary;
- (void)_save;
- (void)_setObjectInStatus:(id)a3 forKey:(id)a4;
- (void)_statusDidChange;
- (void)checkInitialSyncMarker;
- (void)preventDelegateWithDelegationClass:(id)a3 selector:(SEL)a4;
- (void)refetchFromDisk;
- (void)setAccountFlagsData:(id)a3;
- (void)setBusyState:(int64_t)a3;
- (void)setCloudAssetCountPerType:(id)a3 updateCheckDate:(BOOL)a4;
- (void)setConnectedToNetwork:(BOOL)a3 cellularIsRestricted:(BOOL)a4 inAirplaneMode:(BOOL)a5;
- (void)setContainerHasBeenWiped:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDisabledFeatures:(id)a3;
- (void)setEstimatedCountOfRemainingRecordsDuringSharedLibraryExit:(unint64_t)a3;
- (void)setExitDeleteTime:(id)a3;
- (void)setHasCellularBudget:(BOOL)a3 hasBatteryBudget:(BOOL)a4 hasLowBatteryLevel:(BOOL)a5 isConstrainedNetwork:(BOOL)a6 isBlockedByLowPowerMode:(BOOL)a7 hasHeavyResourceUsage:(BOOL)a8 hasPoorNetworkQuality:(BOOL)a9 hasModerateThermalPressure:(BOOL)a10 hasThermalPressure:(BOOL)a11 hasPoorSystemConditions:(BOOL)a12 isBudgetValid:(BOOL)a13 blockedReason:(int64_t)a14 unBlockedReason:(int64_t)a15;
- (void)setHasChangesToProcess:(BOOL)a3;
- (void)setICloudLibraryClientIsNotAuthenticated:(BOOL)a3;
- (void)setICloudLibraryClientVersionTooOld:(BOOL)a3;
- (void)setICloudLibraryExists:(BOOL)a3;
- (void)setICloudLibraryHasBeenWiped:(BOOL)a3;
- (void)setInitialDownloadDate:(id)a3;
- (void)setInitialSyncDate:(id)a3;
- (void)setIsExceedingQuota:(BOOL)a3;
- (void)setIsExceedingSharedLibraryQuota:(BOOL)a3;
- (void)setIsStuckInExitForSharedLibrary:(BOOL)a3;
- (void)setKeychainCDPEnabled:(BOOL)a3;
- (void)setLastCompletePrefetchDate:(id)a3;
- (void)setLastPruneDate:(id)a3;
- (void)setLastSuccessfulSyncDate:(id)a3;
- (void)setLowDiskSpace:(BOOL)a3 veryLowDiskSpace:(BOOL)a4;
- (void)setServerFeatureCompatibleVersion:(int64_t)a3;
- (void)setUpgradeSuggestedToAccessAllPhotos:(BOOL)a3;
- (void)setWalrusEnabled:(BOOL)a3;
@end

@implementation CPLStatus

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_delegationProtocol, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_statusFileURL, 0);
  objc_storeStrong((id *)&self->_changedKeys, 0);
}

- (CPLStatusDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CPLStatusDelegate *)WeakRetained;
}

- (void)preventDelegateWithDelegationClass:(id)a3 selector:(SEL)a4
{
  objc_storeStrong((id *)&self->_delegationProtocol, a3);
  if (a4) {
    v6 = a4;
  }
  else {
    v6 = 0;
  }
  self->_delegationSelector = v6;
}

- (void)setDisabledFeatures:(id)a3
{
  id v4 = a3;
  if (![v4 count])
  {

    id v4 = 0;
  }
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__CPLStatus_setDisabledFeatures___block_invoke;
  v7[3] = &unk_1E60A6728;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(lock, v7);
}

void __33__CPLStatus_setDisabledFeatures___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"disabledFeatures"];
  unint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  id v6 = (id)v2;
  if (v4)
  {
    if (v3 | v2)
    {
LABEL_10:
      [*(id *)(a1 + 32) _setObjectInStatus:v3 forKey:@"disabledFeatures"];
      [*(id *)(a1 + 32) _save];
    }
  }
  else
  {
    char v5 = [(id)v3 isEqual:v2];
    if ((v5 & 1) == 0)
    {
      unint64_t v3 = *(void *)(a1 + 40);
      goto LABEL_10;
    }
  }
}

- (NSArray)disabledFeatures
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6188;
  v10 = __Block_byref_object_dispose__6189;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__CPLStatus_disabledFeatures__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __29__CPLStatus_disabledFeatures__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"disabledFeatures"];
  id v4 = (id)v2;
  if (v2) {
    id v3 = (void *)v2;
  }
  else {
    id v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
}

- (void)setAccountFlagsData:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__CPLStatus_setAccountFlagsData___block_invoke;
  v7[3] = &unk_1E60A6728;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(lock, v7);
}

void __33__CPLStatus_setAccountFlagsData___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"accountFlags"];
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  if (!v2)
  {
    if (!v3) {
      goto LABEL_9;
    }
    id v4 = *(void **)(a1 + 32);
    goto LABEL_7;
  }
  if (v3)
  {
    if (objc_msgSend(v2, "isEqual:")) {
      goto LABEL_9;
    }
    id v4 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
LABEL_7:
    [v4 _setObjectInStatus:v3 forKey:@"accountFlags"];
    [*(id *)(a1 + 32) _save];
    goto LABEL_9;
  }
  [*(id *)(a1 + 32) _setObjectInStatus:0 forKey:@"accountFlags"];
LABEL_9:
}

- (NSData)accountFlagsData
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6188;
  v10 = __Block_byref_object_dispose__6189;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__CPLStatus_accountFlagsData__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSData *)v3;
}

uint64_t __29__CPLStatus_accountFlagsData__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"accountFlags"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (CPLAccountFlags)accountFlags
{
  uint64_t v2 = [(CPLStatus *)self accountFlagsData];
  if (v2) {
    uint64_t v3 = [[CPLAccountFlags alloc] initWithData:v2];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)setLowDiskSpace:(BOOL)a3 veryLowDiskSpace:(BOOL)a4
{
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__CPLStatus_setLowDiskSpace_veryLowDiskSpace___block_invoke;
  v5[3] = &unk_1E60A9540;
  v5[4] = self;
  BOOL v6 = a3;
  BOOL v7 = a4;
  dispatch_sync(lock, v5);
}

void __46__CPLStatus_setLowDiskSpace_veryLowDiskSpace___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"lowDiskSpace"];
  unsigned int v3 = [v2 BOOLValue];

  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"veryLowDiskSpace"];
  LODWORD(v2) = [v4 BOOLValue];

  if (__PAIR64__(*(unsigned __int8 *)(a1 + 41), *(unsigned __int8 *)(a1 + 40)) != __PAIR64__(v2, v3))
  {
    uint64_t v5 = MEMORY[0x1E4F1CC38];
    if (*(unsigned char *)(a1 + 40)) {
      uint64_t v6 = MEMORY[0x1E4F1CC38];
    }
    else {
      uint64_t v6 = 0;
    }
    [*(id *)(a1 + 32) _setObjectInStatus:v6 forKey:@"lowDiskSpace"];
    if (*(unsigned char *)(a1 + 41)) {
      uint64_t v7 = v5;
    }
    else {
      uint64_t v7 = 0;
    }
    [*(id *)(a1 + 32) _setObjectInStatus:v7 forKey:@"veryLowDiskSpace"];
    uint64_t v8 = *(void **)(a1 + 32);
    [v8 _save];
  }
}

- (BOOL)veryLowDiskSpace
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__CPLStatus_veryLowDiskSpace__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __29__CPLStatus_veryLowDiskSpace__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"veryLowDiskSpace"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 BOOLValue];
}

- (BOOL)lowDiskSpace
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__CPLStatus_lowDiskSpace__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __25__CPLStatus_lowDiskSpace__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"lowDiskSpace"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 BOOLValue];
}

- (void)setConnectedToNetwork:(BOOL)a3 cellularIsRestricted:(BOOL)a4 inAirplaneMode:(BOOL)a5
{
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__CPLStatus_setConnectedToNetwork_cellularIsRestricted_inAirplaneMode___block_invoke;
  v6[3] = &unk_1E60A7620;
  v6[4] = self;
  BOOL v7 = a3;
  BOOL v8 = a4;
  BOOL v9 = a5;
  dispatch_sync(lock, v6);
}

void __71__CPLStatus_setConnectedToNetwork_cellularIsRestricted_inAirplaneMode___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"connectedToNetwork"];
  id v15 = v2;
  if (v2) {
    int v3 = [v2 BOOLValue];
  }
  else {
    int v3 = 1;
  }
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"cellularIsRestricted"];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"inAirplaneMode"];
  uint64_t v6 = (void *)v5;
  if (!v4)
  {
    unsigned int v7 = 0;
    if (v5) {
      goto LABEL_6;
    }
LABEL_8:
    int v8 = 0;
    goto LABEL_9;
  }
  unsigned int v7 = [v4 BOOLValue];
  if (!v6) {
    goto LABEL_8;
  }
LABEL_6:
  int v8 = [v6 BOOLValue];
LABEL_9:
  unsigned int v9 = *(unsigned __int8 *)(a1 + 40);
  if (__PAIR64__(v7, v3) != __PAIR64__(*(unsigned __int8 *)(a1 + 41), v9) || v8 != *(unsigned __int8 *)(a1 + 42))
  {
    v10 = *(void **)(a1 + 32);
    id v11 = [NSNumber numberWithBool:v9 != 0];
    [v10 _setObjectInStatus:v11 forKey:@"connectedToNetwork"];

    if (*(unsigned char *)(a1 + 41)) {
      uint64_t v12 = MEMORY[0x1E4F1CC38];
    }
    else {
      uint64_t v12 = 0;
    }
    [*(id *)(a1 + 32) _setObjectInStatus:v12 forKey:@"cellularIsRestricted"];
    v13 = *(void **)(a1 + 32);
    v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 42)];
    [v13 _setObjectInStatus:v14 forKey:@"inAirplaneMode"];

    [*(id *)(a1 + 32) _save];
  }
}

- (int64_t)unBlockedReason
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__CPLStatus_unBlockedReason__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __28__CPLStatus_unBlockedReason__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"unBlockedReason"];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 integerValue];
}

- (int64_t)blockedReason
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __26__CPLStatus_blockedReason__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __26__CPLStatus_blockedReason__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"blockedReason"];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 integerValue];
}

- (BOOL)hasPoorSystemConditions
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__CPLStatus_hasPoorSystemConditions__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __36__CPLStatus_hasPoorSystemConditions__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"poorSystemConditions"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 BOOLValue];
}

- (BOOL)hasThermalPressure
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__CPLStatus_hasThermalPressure__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __31__CPLStatus_hasThermalPressure__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"thermalPressure"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 BOOLValue];
}

- (BOOL)hasModerateThermalPressure
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__CPLStatus_hasModerateThermalPressure__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __39__CPLStatus_hasModerateThermalPressure__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"moderateThermalPressure"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 BOOLValue];
}

- (BOOL)hasPoorNetworkQuality
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__CPLStatus_hasPoorNetworkQuality__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __34__CPLStatus_hasPoorNetworkQuality__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"poorNetworkQuality"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 BOOLValue];
}

- (BOOL)hasHeavyResourceUsage
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__CPLStatus_hasHeavyResourceUsage__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __34__CPLStatus_hasHeavyResourceUsage__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"heavyResourceUsage"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 BOOLValue];
}

- (BOOL)isBlockedByLowPowerMode
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__CPLStatus_isBlockedByLowPowerMode__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __36__CPLStatus_isBlockedByLowPowerMode__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"isBlockedByLowPowerModeKey"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 BOOLValue];
}

- (BOOL)isConstrainedNetwork
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__CPLStatus_isConstrainedNetwork__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __33__CPLStatus_isConstrainedNetwork__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"constrainedNetwork"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 BOOLValue];
}

- (BOOL)hasLowBatteryLevel
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__CPLStatus_hasLowBatteryLevel__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __31__CPLStatus_hasLowBatteryLevel__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"lowBatteryLevel"];
  int v3 = [v2 BOOLValue];

  if (v3)
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"lowBatteryLevel"];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 BOOLValue];
  }
}

- (BOOL)isInAirplaneMode
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__CPLStatus_isInAirplaneMode__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __29__CPLStatus_isInAirplaneMode__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"inAirplaneMode"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 BOOLValue];
}

- (BOOL)isCellularRestricted
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__CPLStatus_isCellularRestricted__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __33__CPLStatus_isCellularRestricted__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"cellularIsRestricted"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 BOOLValue];
}

- (BOOL)isConnectedToNetwork
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__CPLStatus_isConnectedToNetwork__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __33__CPLStatus_isConnectedToNetwork__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:@"connectedToNetwork"];
  if (v2)
  {
    char v3 = v2;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 BOOLValue];
    id v2 = v3;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (BOOL)hasBatteryBudget
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__CPLStatus_hasBatteryBudget__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __29__CPLStatus_hasBatteryBudget__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"hasValidSystemBudgetKey"];
  int v3 = [v2 BOOLValue];

  if (v3)
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"hasBatteryBudgetKey"];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 BOOLValue];
  }
}

- (BOOL)hasCellularBudget
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__CPLStatus_hasCellularBudget__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __30__CPLStatus_hasCellularBudget__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"hasValidSystemBudgetKey"];
  int v3 = [v2 BOOLValue];

  if (v3)
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"hasCellularBudgetKey"];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 BOOLValue];
  }
}

- (BOOL)hasValidSystemBudget
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__CPLStatus_hasValidSystemBudget__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __33__CPLStatus_hasValidSystemBudget__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"hasValidSystemBudgetKey"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 BOOLValue];
}

- (void)setHasCellularBudget:(BOOL)a3 hasBatteryBudget:(BOOL)a4 hasLowBatteryLevel:(BOOL)a5 isConstrainedNetwork:(BOOL)a6 isBlockedByLowPowerMode:(BOOL)a7 hasHeavyResourceUsage:(BOOL)a8 hasPoorNetworkQuality:(BOOL)a9 hasModerateThermalPressure:(BOOL)a10 hasThermalPressure:(BOOL)a11 hasPoorSystemConditions:(BOOL)a12 isBudgetValid:(BOOL)a13 blockedReason:(int64_t)a14 unBlockedReason:(int64_t)a15
{
  lock = self->_lock;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __273__CPLStatus_setHasCellularBudget_hasBatteryBudget_hasLowBatteryLevel_isConstrainedNetwork_isBlockedByLowPowerMode_hasHeavyResourceUsage_hasPoorNetworkQuality_hasModerateThermalPressure_hasThermalPressure_hasPoorSystemConditions_isBudgetValid_blockedReason_unBlockedReason___block_invoke;
  block[3] = &unk_1E60A75F8;
  BOOL v17 = a13;
  BOOL v18 = a3;
  BOOL v19 = a4;
  BOOL v20 = a5;
  BOOL v21 = a6;
  BOOL v22 = a7;
  BOOL v23 = a8;
  BOOL v24 = a9;
  BOOL v25 = a10;
  BOOL v26 = a11;
  BOOL v27 = a12;
  block[4] = self;
  block[5] = a14;
  block[6] = a15;
  dispatch_sync(lock, block);
}

uint64_t __273__CPLStatus_setHasCellularBudget_hasBatteryBudget_hasLowBatteryLevel_isConstrainedNetwork_isBlockedByLowPowerMode_hasHeavyResourceUsage_hasPoorNetworkQuality_hasModerateThermalPressure_hasThermalPressure_hasPoorSystemConditions_isBudgetValid_blockedReason_unBlockedReason___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = *(void **)(a1 + 32);
  char v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  [v2 _setObjectInStatus:v3 forKey:@"hasValidSystemBudgetKey"];

  if (*(unsigned char *)(a1 + 57)) {
    uint64_t v4 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v4 = 0;
  }
  [*(id *)(a1 + 32) _setObjectInStatus:v4 forKey:@"hasCellularBudgetKey"];
  if (*(unsigned char *)(a1 + 58)) {
    uint64_t v5 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v5 = 0;
  }
  [*(id *)(a1 + 32) _setObjectInStatus:v5 forKey:@"hasBatteryBudgetKey"];
  if (*(unsigned char *)(a1 + 59)) {
    uint64_t v6 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v6 = 0;
  }
  [*(id *)(a1 + 32) _setObjectInStatus:v6 forKey:@"lowBatteryLevel"];
  if (*(unsigned char *)(a1 + 60)) {
    uint64_t v7 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v7 = 0;
  }
  [*(id *)(a1 + 32) _setObjectInStatus:v7 forKey:@"constrainedNetwork"];
  if (*(unsigned char *)(a1 + 61)) {
    uint64_t v8 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v8 = 0;
  }
  [*(id *)(a1 + 32) _setObjectInStatus:v8 forKey:@"isBlockedByLowPowerModeKey"];
  if (*(unsigned char *)(a1 + 62)) {
    uint64_t v9 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v9 = 0;
  }
  [*(id *)(a1 + 32) _setObjectInStatus:v9 forKey:@"heavyResourceUsage"];
  if (*(unsigned char *)(a1 + 63)) {
    uint64_t v10 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v10 = 0;
  }
  [*(id *)(a1 + 32) _setObjectInStatus:v10 forKey:@"poorNetworkQuality"];
  if (*(unsigned char *)(a1 + 64)) {
    uint64_t v11 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v11 = 0;
  }
  [*(id *)(a1 + 32) _setObjectInStatus:v11 forKey:@"moderateThermalPressure"];
  if (*(unsigned char *)(a1 + 65)) {
    uint64_t v12 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v12 = 0;
  }
  [*(id *)(a1 + 32) _setObjectInStatus:v12 forKey:@"thermalPressure"];
  if (*(unsigned char *)(a1 + 66)) {
    uint64_t v13 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v13 = 0;
  }
  [*(id *)(a1 + 32) _setObjectInStatus:v13 forKey:@"poorSystemConditions"];
  v14 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 40))
  {
    id v15 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v14 _setObjectInStatus:v15 forKey:@"blockedReason"];
  }
  else
  {
    [*(id *)(a1 + 32) _setObjectInStatus:0 forKey:@"blockedReason"];
  }
  v16 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 48))
  {
    BOOL v17 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v16 _setObjectInStatus:v17 forKey:@"unBlockedReason"];
  }
  else
  {
    [*(id *)(a1 + 32) _setObjectInStatus:0 forKey:@"unBlockedReason"];
  }
  BOOL v18 = *(void **)(a1 + 32);
  return [v18 _save];
}

- (id)statusDescription
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6188;
  uint64_t v10 = __Block_byref_object_dispose__6189;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__CPLStatus_statusDescription__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __30__CPLStatus_statusDescription__block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _loadIfNecessary];
  if ([*(id *)(*(void *)(v1 + 32) + 32) count])
  {
    unint64_t v2 = 0x1E4F1C000uLL;
    v31 = [MEMORY[0x1E4F1C9C8] date];
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v4 = [*(id *)(*(void *)(v1 + 32) + 32) allKeys];
    uint64_t v5 = [v4 sortedArrayUsingSelector:sel_compare_];

    id obj = v5;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v40 count:16];
    if (!v6) {
      goto LABEL_25;
    }
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v34;
    v29 = v38;
    unint64_t v9 = 0x1E4F29000;
    id v30 = v3;
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v12 = [*(id *)(*(void *)(v1 + 32) + 32) objectForKey:v11];
        if ([v11 isEqualToString:@"accountFlags"])
        {
          uint64_t v13 = v1;
          uint64_t v14 = v7;
          uint64_t v15 = v8;
          unint64_t v16 = v2;
          id v17 = v12;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (BOOL v18 = [[CPLAccountFlags alloc] initWithData:v17]) != 0)
          {
            BOOL v19 = v18;
            id v20 = [(CPLAccountFlags *)v18 dictionaryRepresentation];
          }
          else
          {
            id v20 = v17;
          }
          unint64_t v2 = v16;

          uint64_t v8 = v15;
          uint64_t v7 = v14;
          uint64_t v1 = v13;
          id v3 = v30;
        }
        else
        {
          if (![v11 isEqualToString:@"cloudAssetCountPerType"]) {
            goto LABEL_19;
          }
          id v21 = v12;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            BOOL v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v21, "count"));
            v37[0] = MEMORY[0x1E4F143A8];
            v37[1] = 3221225472;
            v38[0] = __valueForDictionaryOfCounts_block_invoke;
            v38[1] = &unk_1E60AAEF8;
            id v20 = v22;
            id v39 = v20;
            [v21 enumerateKeysAndObjectsUsingBlock:v37];
          }
          else
          {
            id v20 = v21;
          }
        }
        uint64_t v12 = v20;
        unint64_t v9 = 0x1E4F29000uLL;
LABEL_19:
        if ([v11 isEqualToString:@"serverFeatureCompatibleVersion"])
        {
          BOOL v23 = objc_msgSend(*(id *)(v9 + 24), "stringWithFormat:", @"clientFeatureCompatibleVersion = %ld", objc_msgSend(*(id *)(v1 + 32), "clientFeatureCompatibleVersion"));
          [v3 addObject:v23];
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v24 = +[CPLDateFormatter stringFromDateAgo:v12 now:v31];

          uint64_t v12 = (void *)v24;
        }
        BOOL v25 = [*(id *)(v9 + 24) stringWithFormat:@"%@ = %@", v11, v12, v29];
        [v3 addObject:v25];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
      if (!v7)
      {
LABEL_25:

        uint64_t v26 = [v3 componentsJoinedByString:@"\n"];
        uint64_t v27 = *(void *)(*(void *)(v1 + 40) + 8);
        v28 = *(void **)(v27 + 40);
        *(void *)(v27 + 40) = v26;

        return;
      }
    }
  }
}

- (void)setDelegate:(id)a3
{
  id v5 = a3;
  lock = self->_lock;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__CPLStatus_setDelegate___block_invoke;
  block[3] = &unk_1E60A65C0;
  block[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  dispatch_sync(lock, block);
}

void __25__CPLStatus_setDelegate___block_invoke(uint64_t *a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  if (*(void *)(v2 + 48))
  {
    id v3 = (id)a1[5];
    if (v3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v2 + 64));

      if (v3 != WeakRetained)
      {
        if (!_CPLSilentLogging)
        {
          SEL v10 = __CPLGenericOSLogDomain();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            uint64_t v11 = a1[4];
            uint64_t v12 = a1[5];
            uint64_t v13 = NSStringFromProtocol(*(Protocol **)(v11 + 48));
            if (*(void *)(a1[4] + 56)) {
              uint64_t v14 = *(const char **)(a1[4] + 56);
            }
            else {
              uint64_t v14 = 0;
            }
            uint64_t v15 = NSStringFromSelector(v14);
            *(_DWORD *)buf = 138413058;
            uint64_t v26 = v12;
            __int16 v27 = 2112;
            uint64_t v28 = v11;
            __int16 v29 = 2112;
            id v30 = v13;
            __int16 v31 = 2112;
            v32 = v15;
            _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Tried to set delegate %@ on protected %@ - status changes should be observed through -[%@ %@]", buf, 0x2Au);
          }
        }
        unint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v17 = a1[6];
        uint64_t v18 = a1[4];
        BOOL v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLStatus.m"];
        uint64_t v21 = a1[4];
        uint64_t v20 = a1[5];
        BOOL v22 = NSStringFromProtocol(*(Protocol **)(v21 + 48));
        if (*(void *)(a1[4] + 56)) {
          BOOL v23 = *(const char **)(a1[4] + 56);
        }
        else {
          BOOL v23 = 0;
        }
        uint64_t v24 = NSStringFromSelector(v23);
        [v16 handleFailureInMethod:v17, v18, v19, 825, @"Tried to set delegate %@ on protected %@ - status changes should be observed through -[%@ %@]", v20, v21, v22, v24 object file lineNumber description];

        abort();
      }
    }
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, (const void *)a1[4], (CFNotificationName)_CPLStatusDidChangeNotification, 0);
  objc_storeWeak((id *)(a1[4] + 64), (id)a1[5]);
  id v6 = objc_loadWeakRetained((id *)(a1[4] + 64));

  if (v6)
  {
    id v7 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v7, (const void *)a1[4], (CFNotificationCallback)_statusDidChange, (CFStringRef)_CPLStatusDidChangeNotification, 0, (CFNotificationSuspensionBehavior)1026);
    uint64_t v8 = a1[4];
    id v9 = *(void **)(v8 + 32);
    *(void *)(v8 + 32) = 0;
  }
}

- (void)_statusDidChange
{
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__CPLStatus__statusDidChange__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  v6[4] = self;
  id v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6228;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  uint64_t v4 = lock;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __29__CPLStatus__statusDidChange__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__CPLStatus__statusDidChange__block_invoke_2;
  v6[3] = &unk_1E60A5DD8;
  v6[4] = *(void *)(a1 + 32);
  uint64_t v4 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6228;
  block[3] = &unk_1E60A6978;
  id v8 = v4;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __29__CPLStatus__statusDidChange__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  [WeakRetained statusDidChange:*(void *)(a1 + 32)];
}

- (NSDate)cloudAssetCountPerTypeLastCheckDate
{
  uint64_t v9 = 0;
  SEL v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__6188;
  uint64_t v13 = __Block_byref_object_dispose__6189;
  id v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__CPLStatus_cloudAssetCountPerTypeLastCheckDate__block_invoke;
  v8[3] = &unk_1E60AA7E0;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(lock, v8);
  id v3 = (void *)v10[5];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] distantPast];
    dispatch_block_t v5 = (void *)v10[5];
    v10[5] = v4;

    id v3 = (void *)v10[5];
  }
  id v6 = v3;
  _Block_object_dispose(&v9, 8);

  return (NSDate *)v6;
}

uint64_t __48__CPLStatus_cloudAssetCountPerTypeLastCheckDate__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"cloudAssetCountPerTypeLastCheckDate"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setCloudAssetCountPerType:(id)a3 updateCheckDate:(BOOL)a4
{
  id v6 = (void *)[a3 copy];
  lock = self->_lock;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__CPLStatus_setCloudAssetCountPerType_updateCheckDate___block_invoke;
  block[3] = &unk_1E60AA350;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_sync(lock, block);
}

void __55__CPLStatus_setCloudAssetCountPerType_updateCheckDate___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"cloudAssetCountPerType"];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  id v8 = (id)v2;
  if (v4)
  {
    if (v2 | v3)
    {
LABEL_10:
      [*(id *)(a1 + 32) _setObjectInStatus:v3 forKey:@"cloudAssetCountPerType"];
      [*(id *)(a1 + 32) _save];
    }
  }
  else
  {
    char v5 = objc_msgSend((id)v2, "isEqual:");
    if ((v5 & 1) == 0)
    {
      uint64_t v3 = *(void *)(a1 + 40);
      goto LABEL_10;
    }
  }
  if (*(unsigned char *)(a1 + 48))
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [MEMORY[0x1E4F1C9C8] date];
    [v6 _setObjectInStatus:v7 forKey:@"cloudAssetCountPerTypeLastCheckDate"];
  }
}

- (NSDictionary)cloudAssetCountPerType
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6188;
  id v10 = __Block_byref_object_dispose__6189;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__CPLStatus_cloudAssetCountPerType__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

uint64_t __35__CPLStatus_cloudAssetCountPerType__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"cloudAssetCountPerType"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (int64_t)clientFeatureCompatibleVersion
{
  return 20220;
}

- (void)setServerFeatureCompatibleVersion:(int64_t)a3
{
  lock = self->_lock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__CPLStatus_setServerFeatureCompatibleVersion___block_invoke;
  v4[3] = &unk_1E60A6598;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(lock, v4);
}

void __47__CPLStatus_setServerFeatureCompatibleVersion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"serverFeatureCompatibleVersion"];
  uint64_t v3 = [v2 integerValue];

  uint64_t v4 = *(void *)(a1 + 40);
  if (v3 != v4)
  {
    char v5 = *(void **)(a1 + 32);
    if (v4)
    {
      uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:");
      [v5 _setObjectInStatus:v6 forKey:@"serverFeatureCompatibleVersion"];
    }
    else
    {
      [*(id *)(a1 + 32) _setObjectInStatus:0 forKey:@"serverFeatureCompatibleVersion"];
    }
    id v7 = *(void **)(a1 + 32);
    [v7 _save];
  }
}

- (int64_t)serverFeatureCompatibleVersion
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v4 = [v3 integerForKey:@"CPLSimulatedServerFeatureCompatibleVersion"];

  uint64_t v12 = v4;
  int64_t v5 = v10[3];
  if (v5 <= 0)
  {
    lock = self->_lock;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43__CPLStatus_serverFeatureCompatibleVersion__block_invoke;
    v8[3] = &unk_1E60AA7E0;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(lock, v8);
    int64_t v5 = v10[3];
  }
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __43__CPLStatus_serverFeatureCompatibleVersion__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"serverFeatureCompatibleVersion"];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 integerValue];
}

- (void)setUpgradeSuggestedToAccessAllPhotos:(BOOL)a3
{
  lock = self->_lock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__CPLStatus_setUpgradeSuggestedToAccessAllPhotos___block_invoke;
  v4[3] = &unk_1E60AA7B8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(lock, v4);
}

uint64_t __50__CPLStatus_setUpgradeSuggestedToAccessAllPhotos___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"upgradeSuggestedToAccessAllPhotos"];
  uint64_t v3 = v2;
  if (*(unsigned char *)(a1 + 40)) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v2 == 0;
  }
  if (!v4)
  {
    uint64_t v8 = v2;
    BOOL v5 = *(void **)(a1 + 32);
    uint64_t v6 = 0;
LABEL_9:
    [v5 _setObjectInStatus:v6 forKey:@"upgradeSuggestedToAccessAllPhotos"];
    uint64_t v2 = [*(id *)(a1 + 32) _save];
    uint64_t v3 = v8;
    goto LABEL_10;
  }
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v8 = v2;
    uint64_t v2 = [(id)v2 BOOLValue];
    uint64_t v3 = v8;
    if ((v2 & 1) == 0)
    {
      BOOL v5 = *(void **)(a1 + 32);
      uint64_t v6 = MEMORY[0x1E4F1CC38];
      goto LABEL_9;
    }
  }
LABEL_10:
  return MEMORY[0x1F41817F8](v2, v3);
}

- (BOOL)isUpgradeSuggestedToAccessAllPhotos
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__CPLStatus_isUpgradeSuggestedToAccessAllPhotos__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __48__CPLStatus_isUpgradeSuggestedToAccessAllPhotos__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"upgradeSuggestedToAccessAllPhotos"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 BOOLValue];
}

- (void)setKeychainCDPEnabled:(BOOL)a3
{
  lock = self->_lock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__CPLStatus_setKeychainCDPEnabled___block_invoke;
  v4[3] = &unk_1E60AA7B8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(lock, v4);
}

void __35__CPLStatus_setKeychainCDPEnabled___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"keychainCDPEnabled"];
  id v7 = v2;
  if (!v2)
  {
    int v4 = *(unsigned __int8 *)(a1 + 40);
    goto LABEL_5;
  }
  int v3 = [v2 BOOLValue];
  int v4 = *(unsigned __int8 *)(a1 + 40);
  if (v4 != v3)
  {
LABEL_5:
    BOOL v5 = *(void **)(a1 + 32);
    uint64_t v6 = [NSNumber numberWithBool:v4 != 0];
    [v5 _setObjectInStatus:v6 forKey:@"keychainCDPEnabled"];

    [*(id *)(a1 + 32) _save];
  }
}

- (BOOL)isKeychainCDPEnabled
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__CPLStatus_isKeychainCDPEnabled__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __33__CPLStatus_isKeychainCDPEnabled__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"keychainCDPEnabled"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 BOOLValue];
}

- (void)setWalrusEnabled:(BOOL)a3
{
  lock = self->_lock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__CPLStatus_setWalrusEnabled___block_invoke;
  v4[3] = &unk_1E60AA7B8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(lock, v4);
}

void __30__CPLStatus_setWalrusEnabled___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"walrusEnabled"];
  int v3 = [v2 BOOLValue];

  int v4 = *(unsigned __int8 *)(a1 + 40);
  if (v4 != v3)
  {
    BOOL v5 = *(void **)(a1 + 32);
    uint64_t v6 = [NSNumber numberWithBool:v4 != 0];
    [v5 _setObjectInStatus:v6 forKey:@"walrusEnabled"];

    id v7 = *(void **)(a1 + 32);
    [v7 _save];
  }
}

- (BOOL)isWalrusEnabled
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__CPLStatus_isWalrusEnabled__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __28__CPLStatus_isWalrusEnabled__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"walrusEnabled"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 BOOLValue];
}

- (void)setIsStuckInExitForSharedLibrary:(BOOL)a3
{
  lock = self->_lock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__CPLStatus_setIsStuckInExitForSharedLibrary___block_invoke;
  v4[3] = &unk_1E60AA7B8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(lock, v4);
}

void __46__CPLStatus_setIsStuckInExitForSharedLibrary___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"isStuckInExitForSharedLibrary"];
  int v3 = [v2 BOOLValue];

  int v4 = *(unsigned __int8 *)(a1 + 40);
  if (v4 != v3)
  {
    BOOL v5 = *(void **)(a1 + 32);
    uint64_t v6 = [NSNumber numberWithBool:v4 != 0];
    [v5 _setObjectInStatus:v6 forKey:@"isStuckInExitForSharedLibrary"];

    id v7 = *(void **)(a1 + 32);
    [v7 _save];
  }
}

- (BOOL)isStuckInExitForSharedLibrary
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__CPLStatus_isStuckInExitForSharedLibrary__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __42__CPLStatus_isStuckInExitForSharedLibrary__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"isStuckInExitForSharedLibrary"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 BOOLValue];
}

- (void)setICloudLibraryClientIsNotAuthenticated:(BOOL)a3
{
  lock = self->_lock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__CPLStatus_setICloudLibraryClientIsNotAuthenticated___block_invoke;
  v4[3] = &unk_1E60AA7B8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(lock, v4);
}

void __54__CPLStatus_setICloudLibraryClientIsNotAuthenticated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"iCloudLibraryClientIsNotAuthenticated"];
  int v3 = [v2 BOOLValue];

  int v4 = *(unsigned __int8 *)(a1 + 40);
  if (v4 != v3)
  {
    BOOL v5 = *(void **)(a1 + 32);
    uint64_t v6 = [NSNumber numberWithBool:v4 != 0];
    [v5 _setObjectInStatus:v6 forKey:@"iCloudLibraryClientIsNotAuthenticated"];

    id v7 = *(void **)(a1 + 32);
    [v7 _save];
  }
}

- (BOOL)iCloudLibraryClientIsNotAuthenticated
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__CPLStatus_iCloudLibraryClientIsNotAuthenticated__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __50__CPLStatus_iCloudLibraryClientIsNotAuthenticated__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"iCloudLibraryClientIsNotAuthenticated"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 BOOLValue];
}

- (void)setICloudLibraryClientVersionTooOld:(BOOL)a3
{
  lock = self->_lock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__CPLStatus_setICloudLibraryClientVersionTooOld___block_invoke;
  v4[3] = &unk_1E60AA7B8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(lock, v4);
}

void __49__CPLStatus_setICloudLibraryClientVersionTooOld___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"iCloudLibraryClientVersionTooOld"];
  int v3 = [v2 BOOLValue];

  int v4 = *(unsigned __int8 *)(a1 + 40);
  if (v4 != v3)
  {
    BOOL v5 = *(void **)(a1 + 32);
    uint64_t v6 = [NSNumber numberWithBool:v4 != 0];
    [v5 _setObjectInStatus:v6 forKey:@"iCloudLibraryClientVersionTooOld"];

    id v7 = *(void **)(a1 + 32);
    [v7 _save];
  }
}

- (BOOL)iCloudLibraryClientVersionTooOld
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__CPLStatus_iCloudLibraryClientVersionTooOld__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __45__CPLStatus_iCloudLibraryClientVersionTooOld__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"iCloudLibraryClientVersionTooOld"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 BOOLValue];
}

- (void)setContainerHasBeenWiped:(BOOL)a3
{
  lock = self->_lock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__CPLStatus_setContainerHasBeenWiped___block_invoke;
  v4[3] = &unk_1E60AA7B8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(lock, v4);
}

void __38__CPLStatus_setContainerHasBeenWiped___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"containerHasBeenWiped"];
  int v3 = [v2 BOOLValue];

  int v4 = *(unsigned __int8 *)(a1 + 40);
  if (v4 != v3)
  {
    BOOL v5 = *(void **)(a1 + 32);
    uint64_t v6 = [NSNumber numberWithBool:v4 != 0];
    [v5 _setObjectInStatus:v6 forKey:@"containerHasBeenWiped"];

    id v7 = *(void **)(a1 + 32);
    [v7 _save];
  }
}

- (BOOL)containerHasBeenWiped
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__CPLStatus_containerHasBeenWiped__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __34__CPLStatus_containerHasBeenWiped__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"containerHasBeenWiped"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 BOOLValue];
}

- (void)setICloudLibraryExists:(BOOL)a3
{
  lock = self->_lock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__CPLStatus_setICloudLibraryExists___block_invoke;
  v4[3] = &unk_1E60AA7B8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(lock, v4);
}

void __36__CPLStatus_setICloudLibraryExists___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"iCloudLibraryExists"];
  int v3 = [v2 BOOLValue];

  int v4 = *(unsigned __int8 *)(a1 + 40);
  if (v4 != v3)
  {
    BOOL v5 = *(void **)(a1 + 32);
    uint64_t v6 = [NSNumber numberWithBool:v4 != 0];
    [v5 _setObjectInStatus:v6 forKey:@"iCloudLibraryExists"];

    id v7 = *(void **)(a1 + 32);
    [v7 _save];
  }
}

- (BOOL)iCloudLibraryExists
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__CPLStatus_iCloudLibraryExists__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __32__CPLStatus_iCloudLibraryExists__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"iCloudLibraryExists"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 BOOLValue];
}

- (void)setICloudLibraryHasBeenWiped:(BOOL)a3
{
  lock = self->_lock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__CPLStatus_setICloudLibraryHasBeenWiped___block_invoke;
  v4[3] = &unk_1E60AA7B8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(lock, v4);
}

void __42__CPLStatus_setICloudLibraryHasBeenWiped___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"iCloudLibraryHasBeenWiped"];
  int v3 = [v2 BOOLValue];

  int v4 = *(unsigned __int8 *)(a1 + 40);
  if (v4 != v3)
  {
    BOOL v5 = *(void **)(a1 + 32);
    uint64_t v6 = [NSNumber numberWithBool:v4 != 0];
    [v5 _setObjectInStatus:v6 forKey:@"iCloudLibraryHasBeenWiped"];

    id v7 = *(void **)(a1 + 32);
    [v7 _save];
  }
}

- (BOOL)iCloudLibraryHasBeenWiped
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__CPLStatus_iCloudLibraryHasBeenWiped__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __38__CPLStatus_iCloudLibraryHasBeenWiped__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"iCloudLibraryHasBeenWiped"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 BOOLValue];
}

- (void)setExitDeleteTime:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__CPLStatus_setExitDeleteTime___block_invoke;
  v7[3] = &unk_1E60A6728;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(lock, v7);
}

void __31__CPLStatus_setExitDeleteTime___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"exitDeleteTime"];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  id v6 = (id)v2;
  if (v4)
  {
    if (v2 | v3)
    {
LABEL_10:
      [*(id *)(a1 + 32) _setObjectInStatus:v3 forKey:@"exitDeleteTime"];
      [*(id *)(a1 + 32) _save];
    }
  }
  else
  {
    char v5 = objc_msgSend((id)v2, "isEqual:");
    if ((v5 & 1) == 0)
    {
      uint64_t v3 = *(void *)(a1 + 40);
      goto LABEL_10;
    }
  }
}

- (NSDate)exitDeleteTime
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__6188;
  id v10 = __Block_byref_object_dispose__6189;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__CPLStatus_exitDeleteTime__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

uint64_t __27__CPLStatus_exitDeleteTime__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"exitDeleteTime"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (BOOL)isBlockedBySnapshot
{
  return [(CPLStatus *)self busyState] == 2;
}

- (void)setBusyState:(int64_t)a3
{
  lock = self->_lock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __26__CPLStatus_setBusyState___block_invoke;
  v4[3] = &unk_1E60A6598;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(lock, v4);
}

void __26__CPLStatus_setBusyState___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"busyState"];
  id v7 = (id)v2;
  if (*(void *)(a1 + 40))
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithInteger:");
    BOOL v4 = v7 != 0;
    BOOL v5 = v3 != 0;
    if (v7) {
      BOOL v6 = v3 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      if ([v7 isEqual:v3]) {
        goto LABEL_12;
      }
LABEL_11:
      [*(id *)(a1 + 32) _setObjectInStatus:v3 forKey:@"busyState"];
      [*(id *)(a1 + 32) _save];
      goto LABEL_12;
    }
  }
  else
  {
    BOOL v5 = 0;
    uint64_t v3 = 0;
    BOOL v4 = v2 != 0;
  }
  if (v4 || v5) {
    goto LABEL_11;
  }
LABEL_12:
}

- (int64_t)busyState
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __22__CPLStatus_busyState__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __22__CPLStatus_busyState__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"busyState"];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 integerValue];
}

- (void)setEstimatedCountOfRemainingRecordsDuringSharedLibraryExit:(unint64_t)a3
{
  lock = self->_lock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__CPLStatus_setEstimatedCountOfRemainingRecordsDuringSharedLibraryExit___block_invoke;
  v4[3] = &unk_1E60A6598;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(lock, v4);
}

void __72__CPLStatus_setEstimatedCountOfRemainingRecordsDuringSharedLibraryExit___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"remainingCountInSharedLibraryExit"];
  id v7 = (id)v2;
  if (*(void *)(a1 + 40))
  {
    int64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    BOOL v4 = v7 != 0;
    BOOL v5 = v3 != 0;
    if (v7) {
      BOOL v6 = v3 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      if ([v7 isEqual:v3]) {
        goto LABEL_12;
      }
LABEL_11:
      [*(id *)(a1 + 32) _setObjectInStatus:v3 forKey:@"remainingCountInSharedLibraryExit"];
      [*(id *)(a1 + 32) _save];
      goto LABEL_12;
    }
  }
  else
  {
    BOOL v5 = 0;
    int64_t v3 = 0;
    BOOL v4 = v2 != 0;
  }
  if (v4 || v5) {
    goto LABEL_11;
  }
LABEL_12:
}

- (unint64_t)estimatedCountOfRemainingRecordsDuringSharedLibraryExit
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__CPLStatus_estimatedCountOfRemainingRecordsDuringSharedLibraryExit__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __68__CPLStatus_estimatedCountOfRemainingRecordsDuringSharedLibraryExit__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"remainingCountInSharedLibraryExit"];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 unsignedIntegerValue];
}

- (void)setIsExceedingSharedLibraryQuota:(BOOL)a3
{
  lock = self->_lock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__CPLStatus_setIsExceedingSharedLibraryQuota___block_invoke;
  v4[3] = &unk_1E60AA7B8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(lock, v4);
}

void __46__CPLStatus_setIsExceedingSharedLibraryQuota___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"isExceedingSharedLibraryQuota"];
  int v3 = [v2 BOOLValue];

  int v4 = *(unsigned __int8 *)(a1 + 40);
  if (v4 != v3)
  {
    BOOL v5 = *(void **)(a1 + 32);
    uint64_t v6 = [NSNumber numberWithBool:v4 != 0];
    [v5 _setObjectInStatus:v6 forKey:@"isExceedingSharedLibraryQuota"];

    id v7 = *(void **)(a1 + 32);
    [v7 _save];
  }
}

- (BOOL)isExceedingSharedLibraryQuota
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__CPLStatus_isExceedingSharedLibraryQuota__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __42__CPLStatus_isExceedingSharedLibraryQuota__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"isExceedingSharedLibraryQuota"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 BOOLValue];
}

- (void)setIsExceedingQuota:(BOOL)a3
{
  lock = self->_lock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__CPLStatus_setIsExceedingQuota___block_invoke;
  v4[3] = &unk_1E60AA7B8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(lock, v4);
}

void __33__CPLStatus_setIsExceedingQuota___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"isExceedingQuota"];
  int v3 = [v2 BOOLValue];

  int v4 = *(unsigned __int8 *)(a1 + 40);
  if (v4 != v3)
  {
    BOOL v5 = *(void **)(a1 + 32);
    uint64_t v6 = [NSNumber numberWithBool:v4 != 0];
    [v5 _setObjectInStatus:v6 forKey:@"isExceedingQuota"];

    id v7 = *(void **)(a1 + 32);
    [v7 _save];
  }
}

- (BOOL)isExceedingQuota
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__CPLStatus_isExceedingQuota__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __29__CPLStatus_isExceedingQuota__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"isExceedingQuota"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 BOOLValue];
}

- (void)setHasChangesToProcess:(BOOL)a3
{
  lock = self->_lock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__CPLStatus_setHasChangesToProcess___block_invoke;
  v4[3] = &unk_1E60AA7B8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(lock, v4);
}

void __36__CPLStatus_setHasChangesToProcess___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"hasChangesToProcess"];
  int v3 = [v2 BOOLValue];

  if (*(unsigned __int8 *)(a1 + 40) != v3)
  {
    int v4 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 40))
    {
      BOOL v5 = [NSNumber numberWithBool:1];
      [v4 _setObjectInStatus:v5 forKey:@"hasChangesToProcess"];
    }
    else
    {
      [*(id *)(a1 + 32) _setObjectInStatus:0 forKey:@"hasChangesToProcess"];
    }
    uint64_t v6 = *(void **)(a1 + 32);
    [v6 _save];
  }
}

- (BOOL)hasChangesToProcess
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__CPLStatus_hasChangesToProcess__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __32__CPLStatus_hasChangesToProcess__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"hasChangesToProcess"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 BOOLValue];
}

- (void)setInitialDownloadDate:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__CPLStatus_setInitialDownloadDate___block_invoke;
  v7[3] = &unk_1E60A6728;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(lock, v7);
}

uint64_t __36__CPLStatus_setInitialDownloadDate___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  [*(id *)(a1 + 32) _setObjectInStatus:*(void *)(a1 + 40) forKey:@"initialDownloadDate"];
  id v2 = *(void **)(a1 + 32);
  return [v2 _save];
}

- (NSDate)initialDownloadDate
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__6188;
  id v10 = __Block_byref_object_dispose__6189;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__CPLStatus_initialDownloadDate__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __32__CPLStatus_initialDownloadDate__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"initialDownloadDate"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"initialSyncDate"];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void *)(v6 + 40);
    *(void *)(v6 + 40) = v5;
    MEMORY[0x1F41817F8](v5, v7);
  }
}

- (void)setInitialSyncDate:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__CPLStatus_setInitialSyncDate___block_invoke;
  v7[3] = &unk_1E60A6728;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(lock, v7);
}

uint64_t __32__CPLStatus_setInitialSyncDate___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _loadIfNecessary];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v3 = __CPLStatusOSLogDomain();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        id v4 = +[CPLDateFormatter stringFromDate:*(void *)(a1 + 40)];
        int v7 = 138412290;
        id v8 = v4;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "Storing initial sync date %@ in status", (uint8_t *)&v7, 0xCu);
      }
      uint64_t v2 = *(void *)(a1 + 40);
    }
    [*(id *)(a1 + 32) _setObjectInStatus:v2 forKey:@"initialSyncDate"];
    [*(id *)(a1 + 32) _writeInitialSyncMarkerForDate:*(void *)(a1 + 40) error:0];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v5 = __CPLStatusOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "Dropping initial sync date in status", (uint8_t *)&v7, 2u);
      }
    }
    [*(id *)(a1 + 32) _setObjectInStatus:0 forKey:@"initialSyncDate"];
    [*(id *)(a1 + 32) _deleteInitialSyncMarkerWithError:0];
  }
  return [*(id *)(a1 + 32) _save];
}

- (NSDate)initialSyncDate
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6188;
  id v10 = __Block_byref_object_dispose__6189;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__CPLStatus_initialSyncDate__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

uint64_t __28__CPLStatus_initialSyncDate__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"initialSyncDate"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (BOOL)hasFinishedInitialDownload
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__CPLStatus_hasFinishedInitialDownload__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __39__CPLStatus_hasFinishedInitialDownload__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"initialDownloadDate"];
  if (!v2)
  {
    uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"initialSyncDate"];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

- (void)setLastPruneDate:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__CPLStatus_setLastPruneDate___block_invoke;
  v7[3] = &unk_1E60A6728;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(lock, v7);
}

uint64_t __30__CPLStatus_setLastPruneDate___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  [*(id *)(a1 + 32) _setObjectInStatus:*(void *)(a1 + 40) forKey:@"lastPruneDate"];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _save];
}

- (NSDate)lastPruneDate
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__6188;
  id v10 = __Block_byref_object_dispose__6189;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __26__CPLStatus_lastPruneDate__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

uint64_t __26__CPLStatus_lastPruneDate__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"lastPruneDate"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setLastCompletePrefetchDate:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__CPLStatus_setLastCompletePrefetchDate___block_invoke;
  v7[3] = &unk_1E60A6728;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(lock, v7);
}

uint64_t __41__CPLStatus_setLastCompletePrefetchDate___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  [*(id *)(a1 + 32) _setObjectInStatus:*(void *)(a1 + 40) forKey:@"lastCompletePrefetchDate"];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _save];
}

- (NSDate)lastCompletePrefetchDate
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__6188;
  id v10 = __Block_byref_object_dispose__6189;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__CPLStatus_lastCompletePrefetchDate__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

uint64_t __37__CPLStatus_lastCompletePrefetchDate__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"lastCompletePrefetchDate"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setLastSuccessfulSyncDate:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__CPLStatus_setLastSuccessfulSyncDate___block_invoke;
  v7[3] = &unk_1E60A6728;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(lock, v7);
}

uint64_t __39__CPLStatus_setLastSuccessfulSyncDate___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  [*(id *)(a1 + 32) _setObjectInStatus:*(void *)(a1 + 40) forKey:@"lastSyncDate"];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _save];
}

- (NSDate)lastSuccessfulSyncDate
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__6188;
  id v10 = __Block_byref_object_dispose__6189;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__CPLStatus_lastSuccessfulSyncDate__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(lock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

uint64_t __35__CPLStatus_lastSuccessfulSyncDate__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"lastSyncDate"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)refetchFromDisk
{
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __28__CPLStatus_refetchFromDisk__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  v6[4] = self;
  uint64_t v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6228;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  uint64_t v4 = lock;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __28__CPLStatus_refetchFromDisk__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = 0;
}

- (void)checkInitialSyncMarker
{
  lock = self->_lock;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__CPLStatus_checkInitialSyncMarker__block_invoke;
  block[3] = &unk_1E60A5DD8;
  void block[4] = self;
  dispatch_sync(lock, block);
}

void __35__CPLStatus_checkInitialSyncMarker__block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _loadIfNecessary];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"initialSyncDate"];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"exitDeleteTime"];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 24) URLByDeletingLastPathComponent];
  dispatch_block_t v5 = [v4 URLByAppendingPathComponent:@"initialsync_marker"];

  uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v7 = [v6 cplFileExistsAtURL:v5];

  if (v2) {
    BOOL v8 = v3 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    if ((v7 & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v12 = __CPLStatusOSLogDomain();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          uint64_t v13 = [v5 path];
          *(_DWORD *)buf = 138412290;
          uint64_t v26 = v13;
          _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_ERROR, "Writing initial sync marker at %@ because initial sync date is set", buf, 0xCu);
        }
      }
      id v14 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      [v14 setDateFormat:@"yyyy-MM-dd HH.mm.ss.SSS"];
      uint64_t v15 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US"];
      [v14 setLocale:v15];

      unint64_t v16 = [v14 stringFromDate:v2];
      id v23 = 0;
      char v17 = [v16 writeToURL:v5 atomically:1 encoding:4 error:&v23];
      uint64_t v18 = v23;

      if ((v17 & 1) != 0 || _CPLSilentLogging) {
        goto LABEL_29;
      }
      BOOL v19 = __CPLStatusOSLogDomain();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = [v5 path];
        *(_DWORD *)buf = 138412546;
        uint64_t v26 = v20;
        __int16 v27 = 2112;
        uint64_t v28 = v18;
        _os_log_impl(&dword_1B4CAC000, v19, OS_LOG_TYPE_ERROR, "Failed to write initial sync marker at %@: %@", buf, 0x16u);
      }
      goto LABEL_28;
    }
  }
  else if (v7)
  {
    if (v2)
    {
      if (_CPLSilentLogging) {
        goto LABEL_24;
      }
      char v9 = __CPLStatusOSLogDomain();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
      id v10 = [v5 path];
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v10;
      id v11 = "Removing initial sync marker at %@ because we are in exit mode";
    }
    else
    {
      if (_CPLSilentLogging) {
        goto LABEL_24;
      }
      char v9 = __CPLStatusOSLogDomain();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
LABEL_23:

LABEL_24:
        uint64_t v21 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v24 = 0;
        char v22 = [v21 removeItemAtURL:v5 error:&v24];
        id v14 = v24;

        if ((v22 & 1) != 0 || _CPLSilentLogging) {
          goto LABEL_30;
        }
        uint64_t v18 = __CPLStatusOSLogDomain();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
LABEL_29:

LABEL_30:
          goto LABEL_31;
        }
        BOOL v19 = [v5 path];
        *(_DWORD *)buf = 138412546;
        uint64_t v26 = v19;
        __int16 v27 = 2112;
        uint64_t v28 = v14;
        _os_log_impl(&dword_1B4CAC000, v18, OS_LOG_TYPE_ERROR, "Failed to delete initial sync marker at %@: %@", buf, 0x16u);
LABEL_28:

        goto LABEL_29;
      }
      id v10 = [v5 path];
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v10;
      id v11 = "Removing initial sync marker at %@ because initial sync date is not set";
    }
    _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, v11, buf, 0xCu);

    goto LABEL_23;
  }
LABEL_31:
}

- (BOOL)_deleteInitialSyncMarkerWithError:(id *)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(NSURL *)self->_statusFileURL URLByDeletingLastPathComponent];
  dispatch_block_t v5 = [v4 URLByAppendingPathComponent:@"initialsync_marker"];

  uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v7 = [v6 cplFileExistsAtURL:v5];

  if (v7)
  {
    if (!_CPLSilentLogging)
    {
      BOOL v8 = __CPLStatusOSLogDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        char v9 = [v5 path];
        int v13 = 138412290;
        id v14 = v9;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEFAULT, "Removing initial sync marker at %@", (uint8_t *)&v13, 0xCu);
      }
    }
    id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v11 = [v10 removeItemAtURL:v5 error:a3];
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

- (BOOL)writeInitialSyncMarker:(id *)a3
{
  uint64_t v15 = 0;
  unint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__6188;
  int v13 = __Block_byref_object_dispose__6189;
  id v14 = 0;
  lock = self->_lock;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__CPLStatus_writeInitialSyncMarker___block_invoke;
  block[3] = &unk_1E60AB220;
  void block[4] = self;
  void block[5] = &v15;
  block[6] = &v9;
  dispatch_sync(lock, block);
  int v5 = *((unsigned __int8 *)v16 + 24);
  if (a3 && !*((unsigned char *)v16 + 24))
  {
    *a3 = (id) v10[5];
    int v5 = *((unsigned __int8 *)v16 + 24);
  }
  BOOL v6 = v5 != 0;
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __36__CPLStatus_writeInitialSyncMarker___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"initialSyncDate"];
  if (v2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v4 + 40);
    char v5 = [v3 _writeInitialSyncMarkerForDate:v2 error:&obj];
    objc_storeStrong((id *)(v4 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
  }
}

- (BOOL)_writeInitialSyncMarkerForDate:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [(NSMutableDictionary *)self->_status objectForKeyedSubscript:@"exitDeleteTime"];
  if (v7)
  {
    if (_CPLSilentLogging)
    {
      char v12 = 1;
      goto LABEL_8;
    }
    BOOL v8 = __CPLStatusOSLogDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEFAULT, "Not writing initial sync marker because the engine is in exit mode", buf, 2u);
    }
  }
  else
  {
    uint64_t v9 = [(NSURL *)self->_statusFileURL URLByDeletingLastPathComponent];
    BOOL v8 = [v9 URLByAppendingPathComponent:@"initialsync_marker"];

    id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v11 = [v10 cplFileExistsAtURL:v8];

    if ((v11 & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        id v14 = __CPLStatusOSLogDomain();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = [v8 path];
          *(_DWORD *)buf = 138412290;
          id v24 = v15;
          _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_DEFAULT, "Writing initial sync marker at %@", buf, 0xCu);
        }
      }
      id v16 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      [v16 setDateFormat:@"yyyy-MM-dd HH.mm.ss.SSS"];
      uint64_t v17 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US"];
      [v16 setLocale:v17];

      char v18 = [v16 stringFromDate:v6];
      id v22 = 0;
      char v12 = [v18 writeToURL:v8 atomically:1 encoding:4 error:&v22];
      id v19 = v22;

      if ((v12 & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          uint64_t v20 = __CPLStatusOSLogDomain();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            uint64_t v21 = [v8 path];
            *(_DWORD *)buf = 138412546;
            id v24 = v21;
            __int16 v25 = 2112;
            id v26 = v19;
            _os_log_impl(&dword_1B4CAC000, v20, OS_LOG_TYPE_ERROR, "Failed to write initial sync marker at %@: %@", buf, 0x16u);
          }
        }
        if (a4) {
          *a4 = v19;
        }
      }

      goto LABEL_7;
    }
  }
  char v12 = 1;
LABEL_7:

LABEL_8:
  return v12;
}

- (void)_save
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  changedKeys = self->_changedKeys;
  if (changedKeys)
  {
    status = self->_status;
    if (status)
    {
      if (!_CPLSilentLogging)
      {
        char v5 = __CPLStatusOSLogDomain();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          id v6 = [(CPLStatus *)self _statusClient];
          int v7 = [(NSMutableSet *)self->_changedKeys allObjects];
          BOOL v8 = [v7 componentsJoinedByString:@", "];
          uint64_t v9 = [(NSURL *)self->_statusFileURL path];
          id v10 = self->_status;
          *(_DWORD *)buf = 138413314;
          id v19 = v6;
          __int16 v20 = 2048;
          uint64_t v21 = self;
          __int16 v22 = 2112;
          id v23 = v8;
          __int16 v24 = 2112;
          __int16 v25 = v9;
          __int16 v26 = 2112;
          uint64_t v27 = v10;
          _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "%@ saving CPLStatus %p (changed keys: %@) to %@: %@", buf, 0x34u);
        }
        status = self->_status;
      }
      statusFileURL = self->_statusFileURL;
      id v17 = 0;
      char v12 = [(NSMutableDictionary *)status writeToURL:statusFileURL error:&v17];
      id v13 = v17;
      if ((v12 & 1) == 0 && !_CPLSilentLogging)
      {
        id v14 = __CPLStatusOSLogDomain();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          uint64_t v15 = self->_statusFileURL;
          *(_DWORD *)buf = 134218498;
          id v19 = v15;
          __int16 v20 = 2112;
          uint64_t v21 = self;
          __int16 v22 = 2112;
          id v23 = v13;
          _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_ERROR, "Failed to save CPLStatus %p to %@: %@", buf, 0x20u);
        }
      }
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)_CPLStatusDidChangeNotification, 0, 0, 0);

      changedKeys = self->_changedKeys;
    }
    self->_changedKeys = 0;
  }
}

- (void)_loadIfNecessary
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  p_status = &self->_status;
  if (!self->_status)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1CA60]);
    statusFileURL = self->_statusFileURL;
    id v28 = 0;
    id v6 = (void *)[v4 initWithContentsOfURL:statusFileURL error:&v28];
    int v7 = (NSMutableDictionary *)v28;
    if (v6)
    {
      objc_storeStrong((id *)p_status, v6);
      BOOL v8 = [(NSMutableDictionary *)*p_status objectForKeyedSubscript:@"syncSessionMetrics"];

      if (v8)
      {
        if (self->_forCPL)
        {
          [(CPLStatus *)self _setObjectInStatus:0 forKey:@"syncSessionMetrics"];
          [(CPLStatus *)self _save];
        }
        else
        {
          [(NSMutableDictionary *)*p_status removeObjectForKey:@"syncSessionMetrics"];
        }
      }
      char v18 = [(NSMutableDictionary *)*p_status objectForKeyedSubscript:@"initialSyncDate"];

      if (!v18)
      {
        id v19 = [(NSURL *)self->_statusFileURL URLByDeletingLastPathComponent];
        __int16 v20 = [v19 URLByAppendingPathComponent:@"initialsync_marker"];

        uint64_t v21 = (void *)[[NSString alloc] initWithContentsOfURL:v20 encoding:4 error:0];
        if (v21)
        {
          id v22 = objc_alloc_init(MEMORY[0x1E4F28C10]);
          [v22 setDateFormat:@"yyyy-MM-dd HH.mm.ss.SSS"];
          id v23 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US"];
          [v22 setLocale:v23];

          __int16 v24 = [v22 dateFromString:v21];
          if (v24)
          {
            if (self->_forCPL)
            {
              [(CPLStatus *)self _setObjectInStatus:v24 forKey:@"initialSyncDate"];
              [(CPLStatus *)self _save];
            }
            else
            {
              [(NSMutableDictionary *)*p_status setObject:v24 forKeyedSubscript:@"initialSyncDate"];
            }
          }
        }
      }
      if (self->_forCPL | _CPLSilentLogging) {
        goto LABEL_28;
      }
      id v17 = __CPLStatusOSLogDomain();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v25 = [(CPLStatus *)self _statusClient];
        __int16 v26 = [(NSURL *)self->_statusFileURL path];
        status = self->_status;
        *(_DWORD *)buf = 138413058;
        id v30 = v25;
        __int16 v31 = 2048;
        v32 = self;
        __int16 v33 = 2112;
        long long v34 = v26;
        __int16 v35 = 2112;
        long long v36 = status;
        _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_DEFAULT, "%@ read CPLStatus %p at %@: %@", buf, 0x2Au);
      }
LABEL_27:

LABEL_28:
      return;
    }
    uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v10 = [v9 cplIsFileDoesNotExistError:v7];

    if (v10)
    {
      if (!_CPLSilentLogging)
      {
        char v11 = __CPLStatusOSLogDomain();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          char v12 = [(NSURL *)self->_statusFileURL path];
          id v13 = [(CPLStatus *)self _statusClient];
          *(_DWORD *)buf = 134218498;
          id v30 = self;
          __int16 v31 = 2112;
          v32 = v12;
          __int16 v33 = 2112;
          long long v34 = v13;
          _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEFAULT, "CPLStatus %p at %@ for %@ does not exist - starting empty", buf, 0x20u);
        }
LABEL_13:
      }
    }
    else if (!_CPLSilentLogging)
    {
      char v11 = __CPLStatusOSLogDomain();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v14 = [(CPLStatus *)self _statusClient];
        uint64_t v15 = [(NSURL *)self->_statusFileURL path];
        *(_DWORD *)buf = 138413058;
        id v30 = v14;
        __int16 v31 = 2048;
        v32 = self;
        __int16 v33 = 2112;
        long long v34 = v15;
        __int16 v35 = 2112;
        long long v36 = v7;
        _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_ERROR, "%@ failed to read CPLStatus %p at %@: %@", buf, 0x2Au);
      }
      goto LABEL_13;
    }
    id v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v17 = *p_status;
    *p_status = v16;
    goto LABEL_27;
  }
}

- (id)_statusClient
{
  if (self->_forCPL)
  {
    uint64_t v2 = @"Engine";
  }
  else
  {
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      char v5 = objc_loadWeakRetained((id *)p_delegate);
      id v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
    }
    else
    {
      char v5 = [MEMORY[0x1E4F28F80] processInfo];
      [v5 processName];
    }
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)_setObjectInStatus:(id)a3 forKey:(id)a4
{
  unint64_t v13 = (unint64_t)a3;
  id v6 = a4;
  uint64_t v7 = [(NSMutableDictionary *)self->_status objectForKeyedSubscript:v6];
  BOOL v8 = (void *)v7;
  if (v13 && v7)
  {
    if ([(id)v7 isEqual:v13]) {
      goto LABEL_11;
    }
  }
  else if (!(v13 | v7))
  {
    goto LABEL_11;
  }
  changedKeys = self->_changedKeys;
  if (!changedKeys)
  {
    char v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    char v11 = self->_changedKeys;
    self->_changedKeys = v10;

    changedKeys = self->_changedKeys;
  }
  [(NSMutableSet *)changedKeys addObject:v6];
  status = self->_status;
  if (v13) {
    [(NSMutableDictionary *)status setObject:v13 forKeyedSubscript:v6];
  }
  else {
    [(NSMutableDictionary *)status removeObjectForKey:v6];
  }
LABEL_11:
}

- (CPLStatus)initWithClientLibraryBaseURLForCPLEngine:(id)a3
{
  result = [(CPLStatus *)self initWithClientLibraryBaseURL:a3];
  if (result) {
    result->_forCPL = 1;
  }
  return result;
}

- (CPLStatus)initWithClientLibraryBaseURL:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLStatus;
  char v5 = [(CPLStatus *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 URLByAppendingPathComponent:@"syncstatus.plist"];
    statusFileURL = v5->_statusFileURL;
    v5->_statusFileURL = (NSURL *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.cpl.status", 0);
    lock = v5->_lock;
    v5->_lock = (OS_dispatch_queue *)v8;
  }
  return v5;
}

@end