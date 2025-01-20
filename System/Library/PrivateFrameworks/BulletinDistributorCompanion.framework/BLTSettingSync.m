@interface BLTSettingSync
- (BLTSettingSync)initWithSectionConfiguration:(id)a3 queue:(id)a4;
- (BLTSettingSync)initWithSectionConfiguration:(id)a3 queue:(id)a4 watchKitAppList:(id)a5;
- (BOOL)isSectionInfoSentCacheEmpty;
- (BOOL)sectionInfoList:(id)a3 override:(id)a4 shouldApplyToSectionInfoForSectionID:(id)a5;
- (BOOL)sectionInfoListSectionIDHadDisplayedCriticalBulletins:(id)a3;
- (id)_filteredAlertingSectionIDs:(id)a3;
- (id)_overriddenSectionInfoForSectionID:(id)a3;
- (id)originalSettings;
- (id)overriddenSettings;
- (id)settingOverrides;
- (id)settingsDescriptionForSectionIDs:(id)a3;
- (id)universalSectionIDForSectionID:(id)a3;
- (unint64_t)_fetchSettingSyncMaxCountOverride;
- (unint64_t)_fetchSyncState;
- (unint64_t)performSyncIfNeededForSectionID:(id)a3 gizmoSectionInfo:(id)a4 completion:(id)a5;
- (void)_addReloadBBCompletion:(id)a3 sectionID:(id)a4;
- (void)_callAndRemoveReloadBBCompletion:(id)a3 sectionID:(id)a4;
- (void)_callReloadBBCompletionsForSectionID:(id)a3;
- (void)_initSettingSyncSendQueueMaxConcurrentSendCount;
- (void)_sendSectionSubtypeParameterIcons:(id)a3 sectionID:(id)a4 waitForAcknowledgement:(BOOL)a5 spoolToFile:(BOOL)a6 andCompletion:(id)a7;
- (void)_sendSpooledSyncWithCompletion:(id)a3 withProgress:(id)a4;
- (void)_sendSyncSupportedAppListWithInstalled:(id)a3 removed:(id)a4;
- (void)_setupSectionInfoListWithCompletion:(id)a3;
- (void)_spoolInitialSync;
- (void)_storeSyncState:(unint64_t)a3;
- (void)_updateAllBBSectionsWithCompletion:(id)a3 withProgress:(id)a4 spoolToFile:(BOOL)a5;
- (void)clearSectionInfoSentCache;
- (void)dealloc;
- (void)handleAllSyncComplete;
- (void)makeAuthorizationPermanentForSectionID:(id)a3;
- (void)observer:(id)a3 noteSectionParametersChanged:(id)a4 forSectionID:(id)a5;
- (void)performInitialSyncWithProgress:(id)a3 completion:(id)a4;
- (void)removeSectionWithSectionID:(id)a3;
- (void)sectionConfiguration:(id)a3 addedSectionIDs:(id)a4 removedSectionIDs:(id)a5;
- (void)sectionInfoList:(id)a3 makeAuthorizationPermanentForSectionID:(id)a4;
- (void)sectionInfoList:(id)a3 receivedRemoveSectionWithSectionID:(id)a4 transaction:(id)a5;
- (void)sectionInfoList:(id)a3 receivedUpdatedSectionInfoForSectionID:(id)a4 transaction:(id)a5;
- (void)sendAllSectionInfoWithSpool:(BOOL)a3 completion:(id)a4;
- (void)sendOverrideOnly:(id)a3 sectionID:(id)a4 spoolToFile:(BOOL)a5;
- (void)sendRemoveSectionWithSectionID:(id)a3 sent:(id)a4;
- (void)sendSectionInfosWithSectionIDs:(id)a3 completion:(id)a4 spoolToFile:(BOOL)a5;
- (void)setNotificationsLevel:(unint64_t)a3 sectionID:(id)a4 mirror:(BOOL)a5 fromRemote:(BOOL)a6;
- (void)setSectionInfo:(id)a3 completion:(id)a4;
- (void)setSectionInfo:(id)a3 keypaths:(id)a4 completion:(id)a5;
- (void)spoolSectionInfoWithCompletion:(id)a3;
- (void)syncSupportedAppListUpdated:(id)a3;
@end

@implementation BLTSettingSync

- (BLTSettingSync)initWithSectionConfiguration:(id)a3 queue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __assert_rtn("-[BLTSettingSync initWithSectionConfiguration:queue:]", "BLTSettingSync.m", 89, "0");
}

- (BLTSettingSync)initWithSectionConfiguration:(id)a3 queue:(id)a4 watchKitAppList:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v38.receiver = self;
  v38.super_class = (Class)BLTSettingSync;
  v11 = [(BLTSettingSyncInternal *)&v38 initWithSectionConfiguration:v8 queue:v9];
  v12 = v11;
  if (v11)
  {
    [(BLTSettingSyncInternal *)v11 connect];
    if (initWithSectionConfiguration_queue_watchKitAppList__onceToken != -1) {
      dispatch_once(&initWithSectionConfiguration_queue_watchKitAppList__onceToken, &__block_literal_global_17);
    }
    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    reloadBBCompletions = v12->_reloadBBCompletions;
    v12->_reloadBBCompletions = (NSMutableDictionary *)v13;

    objc_storeStrong((id *)&v12->_watchKitAppList, a5);
    v15 = objc_alloc_init(BLTMuteSync);
    [(BLTSettingSyncInternal *)v12 setMuteSync:v15];
    [v8 setDelegate:v12];
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.bulletindistributor.sectionInfoSyncCoordinator", v16);
    sectionInfoSyncCoordinatorQueue = v12->_sectionInfoSyncCoordinatorQueue;
    v12->_sectionInfoSyncCoordinatorQueue = (OS_dispatch_queue *)v17;

    [(BLTSettingSync *)v12 _initSettingSyncSendQueueMaxConcurrentSendCount];
    v19 = [[BLTSettingSyncSendQueue alloc] initWithMaxConcurrentSendCount:v12->_settingSyncSendQueueMaxConcurrentSendCount];
    settingSendQueue = v12->_settingSendQueue;
    v12->_settingSendQueue = v19;

    [(BLTSettingSyncSendQueue *)v12->_settingSendQueue setIconAllowList:sectionParameterSubtypeIconSectionIDAllowList];
    objc_initWeak(&location, v12);
    v21 = v12->_settingSendQueue;
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_2;
    v35[3] = &unk_2646851C0;
    objc_copyWeak(&v36, &location);
    [(BLTSettingSyncSendQueue *)v21 setSectionParametersProvider:v35];
    v22 = v12->_settingSendQueue;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_4;
    v33[3] = &unk_264685288;
    objc_copyWeak(&v34, &location);
    [(BLTSettingSyncSendQueue *)v22 setSectionInfoSender:v33];
    v23 = v12->_settingSendQueue;
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_5;
    v31[3] = &unk_2646852D8;
    objc_copyWeak(&v32, &location);
    [(BLTSettingSyncSendQueue *)v23 setSectionIconSender:v31];
    v24 = v12->_settingSendQueue;
    uint64_t v26 = MEMORY[0x263EF8330];
    uint64_t v27 = 3221225472;
    v28 = __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_2_22;
    v29 = &unk_264685300;
    objc_copyWeak(&v30, &location);
    [(BLTSettingSyncSendQueue *)v24 setSectionRemoveSender:&v26];
    [(BLTSettingSync *)v12 _spoolInitialSync];
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
  return v12;
}

void __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke()
{
  v0 = (void *)sectionParameterSubtypeIconSectionIDAllowList;
  sectionParameterSubtypeIconSectionIDAllowList = (uint64_t)&unk_26D607C08;
}

void __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained observer];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_3;
  v10[3] = &unk_264685198;
  id v11 = v5;
  id v9 = v5;
  [v8 getParametersForSectionID:v6 withCompletion:v10];
}

uint64_t __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_4(uint64_t a1, void *a2, void *a3, char a4, void *a5, uint64_t a6)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v11 = a2;
  id v12 = a3;
  id v13 = a5;
  v14 = (void *)MEMORY[0x223CAC5D0]();
  v15 = blt_settings_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_222F4C000, v15, OS_LOG_TYPE_INFO, "Sending info %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_queue_t v17 = [WeakRetained connection];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_13;
  v25[3] = &unk_264685210;
  id v26 = v12;
  p_long long buf = &buf;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_3_16;
  v20[3] = &unk_264685260;
  id v18 = v26;
  id v21 = v18;
  id v19 = v13;
  char v24 = a4;
  id v22 = v19;
  v23 = &buf;
  [v17 setSectionInfo:v11 withSent:v25 withAcknowledgement:v20 keypaths:0 spoolToFile:a6];

  if (v19 && (a4 & 1) == 0) {
    (*((void (**)(id, uint64_t, uint64_t))v19 + 2))(v19, 1, 1);
  }

  _Block_object_dispose(&buf, 8);
}

void __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_13(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_2_14;
  v3[3] = &unk_2646851E8;
  v2 = *(NSObject **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  char v4 = a2;
  dispatch_async(v2, v3);
}

uint64_t __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_2_14(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(result + 40);
  return result;
}

void __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_3_16(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_4_17;
  block[3] = &unk_264685238;
  char v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  char v10 = *(unsigned char *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  char v11 = a2;
  dispatch_async(v4, block);
}

uint64_t __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_4_17(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (*(unsigned char *)(a1 + 48)) {
      return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), *(unsigned __int8 *)(a1 + 49));
    }
  }
  return result;
}

void __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_5(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, char a6, void *a7, char a8)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v15 = a2;
  id v16 = a3;
  id v17 = a5;
  id v18 = a7;
  context = (void *)MEMORY[0x223CAC5D0]();
  id v19 = blt_settings_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    id v29 = v16;
    __int16 v30 = 2048;
    uint64_t v31 = a4;
    _os_log_impl(&dword_222F4C000, v19, OS_LOG_TYPE_INFO, "Sending section icon for section %@, subtype %ld", buf, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v21 = [WeakRetained connection];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_20;
  v25[3] = &unk_2646852B0;
  id v22 = v18;
  id v26 = v22;
  char v27 = a6;
  LOBYTE(v23) = a8;
  [v21 setSectionSubtypeParametersIcon:v15 forSectionID:v16 forSubtypeID:a4 withQueue:v17 withSent:0 withAcknowledgement:v25 spoolToFile:v23];

  if (v22 && (a6 & 1) == 0) {
    (*((void (**)(id, uint64_t))v22 + 2))(v22, 1);
  }
}

uint64_t __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_20(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (*(unsigned char *)(a1 + 40)) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

void __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_2_22(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = blt_settings_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_222F4C000, v7, OS_LOG_TYPE_INFO, "Sending remove section %@", (uint8_t *)&v10, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v9 = [WeakRetained connection];
  [v9 removeSectionWithSectionID:v5 sent:v6];
}

- (void)_storeSyncState:(unint64_t)a3
{
  if (a3 == 1)
  {
    char v4 = blt_settings_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      id v5 = "Storing send sync state";
      id v6 = (uint8_t *)&v8;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (!a3)
  {
    char v4 = blt_settings_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = 0;
      id v5 = "Storing idle sync state";
      id v6 = (uint8_t *)&v9;
LABEL_7:
      _os_log_impl(&dword_222F4C000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a3, v8);
  CFPreferencesSetAppValue(@"BLTSettingSyncState", v7, @"com.apple.bulletindistributor");
  CFPreferencesAppSynchronize(@"com.apple.bulletindistributor");
}

- (unint64_t)_fetchSyncState
{
  CFPreferencesAppSynchronize(@"com.apple.bulletindistributor");
  return CFPreferencesGetAppIntegerValue(@"BLTSettingSyncState", @"com.apple.bulletindistributor", 0);
}

- (unint64_t)_fetchSettingSyncMaxCountOverride
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesAppSynchronize(@"com.apple.bulletindistributor");
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"BLTSettingSyncSendQueueMaxConcurrentSendCount", @"com.apple.bulletindistributor", &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat) {
    return 2;
  }
  unint64_t v3 = AppIntegerValue;
  char v4 = [MEMORY[0x263EFF910] date];
  [v4 timeIntervalSince1970];
  double v6 = v5;

  v7 = (void *)CFPreferencesCopyAppValue(@"BLTSettingSyncSendQueueMaxConcurrentSendCountTimestamp", @"com.apple.bulletindistributor");
  [v7 doubleValue];
  double v9 = v8;

  int v10 = blt_settings_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 134218496;
    unint64_t v15 = v3;
    __int16 v16 = 2048;
    double v17 = v9;
    __int16 v18 = 2048;
    double v19 = v6;
    _os_log_impl(&dword_222F4C000, v10, OS_LOG_TYPE_INFO, "Found override value: %ld timestamp: %f now: %f", buf, 0x20u);
  }

  if (v6 > v9 + 86400.0)
  {
    CFPreferencesSetAppValue(@"BLTSettingSyncSendQueueMaxConcurrentSendCount", 0, @"com.apple.bulletindistributor");
    return 2;
  }
  unint64_t v12 = 4;
  if (v3 < 4) {
    unint64_t v12 = v3;
  }
  if (v12 <= 1) {
    return 1;
  }
  else {
    return v12;
  }
}

- (void)_initSettingSyncSendQueueMaxConcurrentSendCount
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unint64_t v3 = blt_settings_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_222F4C000, v3, OS_LOG_TYPE_INFO, "Initializing sync send queue max concurrent send count", (uint8_t *)&v10, 2u);
  }

  self->_unint64_t settingSyncSendQueueMaxConcurrentSendCount = 2;
  if ([(BLTSettingSync *)self _fetchSyncState] == 1)
  {
    char v4 = blt_settings_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_222F4C000, v4, OS_LOG_TYPE_INFO, "Detected in section info send", (uint8_t *)&v10, 2u);
    }

    CFPreferencesSetAppValue(@"BLTSettingSyncSendQueueMaxConcurrentSendCount", &unk_26D607DF8, @"com.apple.bulletindistributor");
    double v5 = NSNumber;
    double v6 = [MEMORY[0x263EFF910] date];
    [v6 timeIntervalSince1970];
    v7 = objc_msgSend(v5, "numberWithDouble:");

    CFPreferencesSetAppValue(@"BLTSettingSyncSendQueueMaxConcurrentSendCountTimestamp", v7, @"com.apple.bulletindistributor");
    CFPreferencesAppSynchronize(@"com.apple.bulletindistributor");
    self->_unint64_t settingSyncSendQueueMaxConcurrentSendCount = 1;
    [(BLTSettingSync *)self _storeSyncState:0];
  }
  else
  {
    self->_unint64_t settingSyncSendQueueMaxConcurrentSendCount = [(BLTSettingSync *)self _fetchSettingSyncMaxCountOverride];
  }
  double v8 = blt_settings_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    unint64_t settingSyncSendQueueMaxConcurrentSendCount = self->_settingSyncSendQueueMaxConcurrentSendCount;
    int v10 = 134217984;
    unint64_t v11 = settingSyncSendQueueMaxConcurrentSendCount;
    _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_INFO, "Sync send queue max concurrent send count set to %lu", (uint8_t *)&v10, 0xCu);
  }
}

- (id)universalSectionIDForSectionID:(id)a3
{
  return [(BLTSectionInfoList *)self->_sectionInfoList universalSectionIDForSectionID:a3];
}

- (void)_setupSectionInfoListWithCompletion:(id)a3
{
  id v15 = a3;
  sectionInfoList = self->_sectionInfoList;
  if (!sectionInfoList)
  {
    double v5 = objc_alloc_init(BLTSectionInfoList);
    double v6 = self->_sectionInfoList;
    self->_sectionInfoList = v5;

    v7 = [BLTSectionInfoListBBProvider alloc];
    double v8 = [(BLTSettingSyncInternal *)self settingsGateway];
    double v9 = [(BLTSectionInfoListBBProvider *)v7 initWithSettingsGateway:v8];

    [(BLTSectionInfoList *)self->_sectionInfoList setSectionInfoProvider:v9];
    int v10 = [BLTSectionInfoListBridgeProvider alloc];
    unint64_t v11 = [(BLTSettingSyncInternal *)self sectionConfiguration];
    uint64_t v12 = [(BLTSectionInfoListBridgeProvider *)v10 initWithSectionConfiguration:v11];
    bridgeProvider = self->_bridgeProvider;
    self->_bridgeProvider = v12;

    [(BLTSectionInfoList *)self->_sectionInfoList setOverrideProvider:self->_bridgeProvider];
    [(BLTSectionInfoList *)self->_sectionInfoList setDelegate:self];

    sectionInfoList = self->_sectionInfoList;
  }
  if ([(BLTSectionInfoList *)sectionInfoList hasLoaded])
  {
    v14 = v15;
    if (!v15) {
      goto LABEL_8;
    }
    (*((void (**)(id))v15 + 2))(v15);
  }
  else
  {
    [(BLTSectionInfoList *)self->_sectionInfoList reloadWithCompletion:v15];
  }
  v14 = v15;
LABEL_8:
}

- (void)performInitialSyncWithProgress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = blt_settings_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_DEFAULT, "PSY says sync! sectionInfo push!", buf, 2u);
  }

  self->_initialSyncPerformed = 1;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__BLTSettingSync_performInitialSyncWithProgress_completion___block_invoke;
  v11[3] = &unk_264685350;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [(BLTSettingSync *)self _setupSectionInfoListWithCompletion:v11];
}

void __60__BLTSettingSync_performInitialSyncWithProgress_completion___block_invoke(uint64_t a1)
{
  v2 = BLTWorkQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__BLTSettingSync_performInitialSyncWithProgress_completion___block_invoke_2;
  block[3] = &unk_264685350;
  unint64_t v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);
}

void __60__BLTSettingSync_performInitialSyncWithProgress_completion___block_invoke_2(uint64_t a1)
{
  v2 = blt_settings_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_222F4C000, v2, OS_LOG_TYPE_INFO, "Section info list reloaded due to PSY sync; syncing", buf, 2u);
  }

  char v3 = [MEMORY[0x263F57700] activePairedDeviceSupportsFileSettingSync];
  char v4 = *(void **)(a1 + 32);
  if (v3)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __60__BLTSettingSync_performInitialSyncWithProgress_completion___block_invoke_3;
    v9[3] = &unk_264683CA0;
    id v5 = &v10;
    id v10 = *(id *)(a1 + 40);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __60__BLTSettingSync_performInitialSyncWithProgress_completion___block_invoke_4;
    v7[3] = &unk_264685328;
    id v6 = &v8;
    id v8 = *(id *)(a1 + 48);
    [v4 _sendSpooledSyncWithCompletion:v9 withProgress:v7];
  }
  else
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __60__BLTSettingSync_performInitialSyncWithProgress_completion___block_invoke_40;
    v13[3] = &unk_264683CA0;
    id v5 = &v14;
    id v14 = *(id *)(a1 + 40);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __60__BLTSettingSync_performInitialSyncWithProgress_completion___block_invoke_2_41;
    v11[3] = &unk_264685328;
    id v6 = &v12;
    id v12 = *(id *)(a1 + 48);
    [v4 _updateAllBBSectionsWithCompletion:v13 withProgress:v11 spoolToFile:0];
  }
}

uint64_t __60__BLTSettingSync_performInitialSyncWithProgress_completion___block_invoke_40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __60__BLTSettingSync_performInitialSyncWithProgress_completion___block_invoke_2_41(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __60__BLTSettingSync_performInitialSyncWithProgress_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __60__BLTSettingSync_performInitialSyncWithProgress_completion___block_invoke_4(uint64_t a1, double a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  char v4 = blt_settings_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    double v7 = a2;
    _os_log_impl(&dword_222F4C000, v4, OS_LOG_TYPE_DEFAULT, "Setting sync completion: %f", (uint8_t *)&v6, 0xCu);
  }

  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(a2);
}

- (unint64_t)performSyncIfNeededForSectionID:(id)a3 gizmoSectionInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 1;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __78__BLTSettingSync_performSyncIfNeededForSectionID_gizmoSectionInfo_completion___block_invoke;
  v16[3] = &unk_2646853C8;
  id v11 = v9;
  id v17 = v11;
  __int16 v18 = self;
  id v12 = v8;
  id v19 = v12;
  id v13 = v10;
  id v20 = v13;
  id v21 = &v22;
  [(BLTSettingSync *)self _setupSectionInfoListWithCompletion:v16];
  unint64_t v14 = v23[3];

  _Block_object_dispose(&v22, 8);
  return v14;
}

void __78__BLTSettingSync_performSyncIfNeededForSectionID_gizmoSectionInfo_completion___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  v2 = [*(id *)(a1 + 32) mappedSectionID];
  BOOL v3 = v2 == 0;

  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(NSObject **)(v4 + 104);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __78__BLTSettingSync_performSyncIfNeededForSectionID_gizmoSectionInfo_completion___block_invoke_2;
    block[3] = &unk_264685378;
    void block[4] = v4;
    id v23 = *(id *)(a1 + 48);
    id v6 = *(id *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 64);
    id v24 = v6;
    uint64_t v25 = v7;
    id v26 = &v27;
    dispatch_sync(v5, block);
  }
  if (!*((unsigned char *)v28 + 24))
  {
    [*(id *)(*(void *)(a1 + 40) + 72) mapSection:*(void *)(a1 + 48) map:*(void *)(a1 + 32)];
    id v8 = [*(id *)(a1 + 32) mappedSectionID];
    id v9 = v8;
    if (!v8) {
      id v9 = *(void **)(a1 + 48);
    }
    id v10 = v9;
    id v11 = [*(id *)(*(void *)(a1 + 40) + 72) bbSectionInfoForSectionID:v10];
    if (v11)
    {
      id v12 = *(unsigned char **)(a1 + 40);
      if (!v8 && v12[112])
      {
        *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
        uint64_t v13 = *(void *)(a1 + 56);
        if (v13) {
          (*(void (**)(void))(v13 + 16))();
        }
        goto LABEL_18;
      }
      id v31 = v10;
      id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];
      [v12 sendSectionInfosWithSectionIDs:v18 completion:*(void *)(a1 + 56) spoolToFile:0];
    }
    else
    {
      unint64_t v14 = blt_settings_log();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      {
        *(_DWORD *)long long buf = 138412290;
        id v33 = v10;
        _os_log_impl(&dword_222F4C000, v14, (os_log_type_t)0x90u, "Section needs sync but doesn't exist in BB: %@", buf, 0xCu);
      }

      _BLTCaptureBug(@"SectionInfoDoesNotExist");
      id v15 = (void *)[*(id *)(a1 + 56) copy];
      if (v15) {
        [*(id *)(a1 + 40) _addReloadBBCompletion:v15 sectionID:v10];
      }
      uint64_t v16 = *(void *)(a1 + 40);
      id v17 = *(void **)(v16 + 72);
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __78__BLTSettingSync_performSyncIfNeededForSectionID_gizmoSectionInfo_completion___block_invoke_46;
      v19[3] = &unk_2646853A0;
      v19[4] = v16;
      id v18 = v15;
      id v21 = v18;
      id v20 = v10;
      [v17 reloadBBSection:v20 completion:v19];
    }
LABEL_18:
  }
  _Block_object_dispose(&v27, 8);
}

void __78__BLTSettingSync_performSyncIfNeededForSectionID_gizmoSectionInfo_completion___block_invoke_2(void *a1)
{
  v1 = *(void **)(a1[4] + 96);
  if (v1)
  {
    uint64_t v3 = a1[5];
    uint64_t v4 = BLTWorkQueue();
    uint64_t v5 = [v1 performSyncForSectionID:v3 queue:v4 completion:a1[6]];

    if (v5 == 1)
    {
      uint64_t v6 = 2;
    }
    else
    {
      if (v5 != 3)
      {
LABEL_7:
        *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 1;
        return;
      }
      uint64_t v6 = 0;
    }
    *(void *)(*(void *)(a1[7] + 8) + 24) = v6;
    goto LABEL_7;
  }
}

uint64_t __78__BLTSettingSync_performSyncIfNeededForSectionID_gizmoSectionInfo_completion___block_invoke_46(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return [*(id *)(result + 32) _callAndRemoveReloadBBCompletion:*(void *)(result + 48) sectionID:*(void *)(result + 40)];
  }
  return result;
}

- (void)_spoolInitialSync
{
  if ([MEMORY[0x263F57700] activePairedDeviceSupportsFileSettingSync])
  {
    uint64_t v3 = +[BLTTransaction transactionWithDescription:@"BLTSettingsSync _spoolInitialSync"];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __35__BLTSettingSync__spoolInitialSync__block_invoke;
    v5[3] = &unk_264683BB0;
    v5[4] = self;
    id v6 = v3;
    id v4 = v3;
    [(BLTSettingSync *)self _setupSectionInfoListWithCompletion:v5];
  }
}

void __35__BLTSettingSync__spoolInitialSync__block_invoke(uint64_t a1)
{
  v2 = BLTWorkQueue();
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__BLTSettingSync__spoolInitialSync__block_invoke_2;
  v4[3] = &unk_264683BB0;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

void __35__BLTSettingSync__spoolInitialSync__block_invoke_2(uint64_t a1)
{
  v2 = blt_settings_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_222F4C000, v2, OS_LOG_TYPE_DEFAULT, "Section info list reloaded due to spooling section infos to file", buf, 2u);
  }

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__BLTSettingSync__spoolInitialSync__block_invoke_52;
  v4[3] = &unk_264683BD8;
  uint64_t v3 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v3 _updateAllBBSectionsWithCompletion:v4 withProgress:0 spoolToFile:1];
}

- (void)_sendSpooledSyncWithCompletion:(id)a3 withProgress:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = blt_settings_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_DEFAULT, "Sending spooled settings", buf, 2u);
  }

  settingSendQueue = self->_settingSendQueue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __62__BLTSettingSync__sendSpooledSyncWithCompletion_withProgress___block_invoke;
  v16[3] = &unk_2646853F0;
  void v16[4] = self;
  id v13 = v7;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __62__BLTSettingSync__sendSpooledSyncWithCompletion_withProgress___block_invoke_4;
  v14[3] = &unk_264683CA0;
  id v15 = v6;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__BLTSettingSync__sendSpooledSyncWithCompletion_withProgress___block_invoke_5;
  v12[3] = &unk_264685328;
  id v10 = v7;
  id v11 = v6;
  [(BLTSettingSyncSendQueue *)settingSendQueue sendSpooledRequestsNowWithSender:v16 completion:v14 progress:v12];
}

void __62__BLTSettingSync__sendSpooledSyncWithCompletion_withProgress___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) connection];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__BLTSettingSync__sendSpooledSyncWithCompletion_withProgress___block_invoke_2;
  v12[3] = &unk_2646841B8;
  id v13 = v5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__BLTSettingSync__sendSpooledSyncWithCompletion_withProgress___block_invoke_3;
  v10[3] = &unk_264685328;
  id v11 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 sendSpooledRequestsNowWithSent:v12 withAcknowledgement:v10];
}

uint64_t __62__BLTSettingSync__sendSpooledSyncWithCompletion_withProgress___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __62__BLTSettingSync__sendSpooledSyncWithCompletion_withProgress___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __62__BLTSettingSync__sendSpooledSyncWithCompletion_withProgress___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __62__BLTSettingSync__sendSpooledSyncWithCompletion_withProgress___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_sendSyncSupportedAppListWithInstalled:(id)a3 removed:(id)a4
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = BLTWorkQueue();
  dispatch_assert_queue_V2(v8);

  id v9 = [v6 allKeys];
  uint64_t v10 = [v9 count];
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = [MEMORY[0x263EFF9C0] set];
    settingSendQueue = self->_settingSendQueue;
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __65__BLTSettingSync__sendSyncSupportedAppListWithInstalled_removed___block_invoke;
    v48[3] = &unk_264685418;
    id v49 = v9;
    v50 = self;
    id v51 = v6;
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __65__BLTSettingSync__sendSyncSupportedAppListWithInstalled_removed___block_invoke_57;
    v45[3] = &unk_264685440;
    id v46 = v49;
    id v47 = v12;
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __65__BLTSettingSync__sendSyncSupportedAppListWithInstalled_removed___block_invoke_2;
    v43[3] = &unk_264683BB0;
    v43[4] = self;
    id v44 = v47;
    id v14 = v47;
    [(BLTSettingSyncSendQueue *)settingSendQueue sendEffectiveSectionInfosUsingProvider:v48 count:v11 sectionInfoSendCompleted:v45 completion:v43 progress:&__block_literal_global_61 spoolToFile:0];
  }
  if ([v7 count])
  {
    id v31 = v9;
    id v33 = v6;
    id v15 = dispatch_group_create();
    uint64_t v16 = (void *)[v7 mutableCopy];
    id v32 = v7;
    id v17 = [v7 allObjects];
    id v18 = self;
    uint64_t v19 = [(BLTSettingSync *)self _filteredAlertingSectionIDs:v17];

    [v16 minusSet:v19];
    id v20 = blt_general_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v54 = v19;
      _os_log_impl(&dword_222F4C000, v20, OS_LOG_TYPE_DEFAULT, "Sync supported apps removed but because bundle IDs still alert for notifications, not sending setting/icon removals for %@", buf, 0xCu);
    }
    char v30 = (void *)v19;

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = v16;
    uint64_t v21 = [obj countByEnumeratingWithState:&v39 objects:v52 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v40 != v23) {
            objc_enumerationMutation(obj);
          }
          uint64_t v25 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          dispatch_group_enter(v15);
          id v26 = blt_general_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v54 = v25;
            _os_log_impl(&dword_222F4C000, v26, OS_LOG_TYPE_DEFAULT, "Removing sync supported app %@", buf, 0xCu);
          }

          uint64_t v27 = v18->_settingSendQueue;
          v37[0] = MEMORY[0x263EF8330];
          v37[1] = 3221225472;
          v37[2] = __65__BLTSettingSync__sendSyncSupportedAppListWithInstalled_removed___block_invoke_62;
          v37[3] = &unk_264685468;
          objc_super v38 = v15;
          -[BLTSettingSyncSendQueue sendRemoveSectionWithSectionID:sent:](v27, "sendRemoveSectionWithSectionID:sent:", v25, v37, v30);
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v39 objects:v52 count:16];
      }
      while (v22);
    }

    v28 = BLTWorkQueue();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__BLTSettingSync__sendSyncSupportedAppListWithInstalled_removed___block_invoke_2_63;
    block[3] = &unk_264683BB0;
    void block[4] = v18;
    id v36 = obj;
    id v29 = obj;
    dispatch_group_notify(v15, v28, block);

    id v7 = v32;
    id v6 = v33;
    id v9 = v31;
  }
}

BLTPBSectionInfo *__65__BLTSettingSync__sendSyncSupportedAppListWithInstalled_removed___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  id v4 = [*(id *)(*(void *)(a1 + 40) + 72) effectiveSectionInfoForSectionID:v3];
  id v5 = blt_general_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      int v13 = 138412290;
      uint64_t v14 = (uint64_t)v3;
      _os_log_impl(&dword_222F4C000, v5, OS_LOG_TYPE_INFO, "Sending bb section info for sync supported app %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    if (v6)
    {
      int v13 = 138412290;
      uint64_t v14 = (uint64_t)v3;
      _os_log_impl(&dword_222F4C000, v5, OS_LOG_TYPE_INFO, "Sending fake section info for sync supported app %@", (uint8_t *)&v13, 0xCu);
    }

    id v4 = objc_alloc_init(BLTPBSectionInfo);
    [(BLTPBSectionInfo *)v4 setExcludeFromBulletinBoard:1];
    [(BLTPBSectionInfo *)v4 setSectionID:v3];
    id v7 = [*(id *)(a1 + 48) objectForKeyedSubscript:v3];
    [(BLTPBSectionInfo *)v4 setDisplayName:v7];

    [(BLTPBSectionInfo *)v4 setAuthorizationStatus:0];
    id v5 = BLTPBSectionIconFromBBSectionIcon(0, v3);
    [(BLTPBSectionInfo *)v4 setIcon:v5];
  }

  id v8 = blt_general_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [(BLTPBSectionInfo *)v4 icon];
    uint64_t v10 = [v9 variants];
    uint64_t v11 = [v10 count];
    int v13 = 134217984;
    uint64_t v14 = v11;
    _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_INFO, "Section info contains %lu icons", (uint8_t *)&v13, 0xCu);
  }
  return v4;
}

void __65__BLTSettingSync__sendSyncSupportedAppListWithInstalled_removed___block_invoke_57(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    id v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
    [*(id *)(a1 + 40) addObject:v4];
  }
}

void __65__BLTSettingSync__sendSyncSupportedAppListWithInstalled_removed___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v2 = *(void **)(*(void *)(a1 + 32) + 136);
  id v3 = [MEMORY[0x263EFFA08] set];
  [v2 updateStoreWithInstalled:v1 removed:v3];
}

void __65__BLTSettingSync__sendSyncSupportedAppListWithInstalled_removed___block_invoke_62(uint64_t a1)
{
}

void __65__BLTSettingSync__sendSyncSupportedAppListWithInstalled_removed___block_invoke_2_63(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 136);
  id v3 = [MEMORY[0x263EFFA08] set];
  [v2 updateStoreWithInstalled:v3 removed:*(void *)(a1 + 40)];
}

- (void)handleAllSyncComplete
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = BLTWorkQueue();
  dispatch_assert_queue_V2(v3);

  if ([MEMORY[0x263F57700] activePairedDeviceSupportsSiriActionAppList])
  {
    id v4 = objc_alloc_init(BLTSyncSupportedAppList);
    syncSupportedAppList = self->_syncSupportedAppList;
    self->_syncSupportedAppList = v4;

    [(BLTSyncSupportedAppList *)self->_syncSupportedAppList setDelegate:self];
    BOOL v6 = [(BLTSyncSupportedAppList *)self->_syncSupportedAppList installed];
    id v7 = [(BLTSyncSupportedAppList *)self->_syncSupportedAppList removed];
    id v8 = blt_general_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134218240;
      uint64_t v10 = [v6 count];
      __int16 v11 = 2048;
      uint64_t v12 = [v7 count];
      _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_DEFAULT, "Sending sync supported app action list of %lu apps and removed %lu apps", (uint8_t *)&v9, 0x16u);
    }

    [(BLTSettingSync *)self _sendSyncSupportedAppListWithInstalled:v6 removed:v7];
  }
}

- (void)syncSupportedAppListUpdated:(id)a3
{
  id v4 = BLTWorkQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__BLTSettingSync_syncSupportedAppListUpdated___block_invoke;
  block[3] = &unk_264683BD8;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __46__BLTSettingSync_syncSupportedAppListUpdated___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(*(void *)(a1 + 32) + 136) installed];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 136) removed];
  if ([v2 count] || objc_msgSend(v3, "count"))
  {
    id v4 = blt_general_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 134218240;
      uint64_t v6 = [v2 count];
      __int16 v7 = 2048;
      uint64_t v8 = [v3 count];
      _os_log_impl(&dword_222F4C000, v4, OS_LOG_TYPE_DEFAULT, "Sending updated sync supported app action list of %lu apps and removed %lu apps", (uint8_t *)&v5, 0x16u);
    }

    [*(id *)(a1 + 32) _sendSyncSupportedAppListWithInstalled:v2 removed:v3];
  }
}

- (void)dealloc
{
  id v3 = [(BLTSettingSyncInternal *)self observer];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)BLTSettingSync;
  [(BLTSettingSyncInternal *)&v4 dealloc];
}

- (BOOL)isSectionInfoSentCacheEmpty
{
  v2 = [(BLTSettingSyncInternal *)self connection];
  char v3 = [v2 isSectionInfoSentCacheEmpty];

  return v3;
}

- (void)clearSectionInfoSentCache
{
  id v2 = [(BLTSettingSyncInternal *)self connection];
  [v2 clearSectionInfoSentCache];
}

- (void)_sendSectionSubtypeParameterIcons:(id)a3 sectionID:(id)a4 waitForAcknowledgement:(BOOL)a5 spoolToFile:(BOOL)a6 andCompletion:(id)a7
{
}

- (id)_filteredAlertingSectionIDs:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x263EFF9C0];
  id v5 = a3;
  uint64_t v6 = [v4 set];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __46__BLTSettingSync__filteredAlertingSectionIDs___block_invoke;
  v11[3] = &unk_264685490;
  void v11[4] = self;
  id v7 = v6;
  id v12 = v7;
  [v5 enumerateObjectsUsingBlock:v11];

  uint64_t v8 = v12;
  id v9 = v7;

  return v9;
}

void __46__BLTSettingSync__filteredAlertingSectionIDs___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "willNanoPresentNotificationForSectionID:subsectionIDs:subtype:") & 0xFFFFFFFFFFFFFC7FLL) == 0
    || ([*(id *)(a1 + 32) sectionConfiguration],
        char v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 shouldSectionIDSettingsAlwaysSync:v12],
        v3,
        v4)
    || ([*(id *)(*(void *)(a1 + 32) + 72) universalSectionIDForSectionID:v12],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    [*(id *)(a1 + 40) addObject:v12];
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) _overriddenSectionInfoForSectionID:v12];
    uint64_t v7 = [v6 factorySectionID];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      id v9 = [*(id *)(a1 + 32) sectionConfiguration];
      uint64_t v10 = [v6 factorySectionID];
      int v11 = [v9 shouldSectionIDSettingsAlwaysSync:v10];

      if (v11) {
        [*(id *)(a1 + 40) addObject:v12];
      }
    }
  }
}

- (void)_updateAllBBSectionsWithCompletion:(id)a3 withProgress:(id)a4 spoolToFile:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = BLTWorkQueue();
  dispatch_assert_queue_V2(v10);

  int v11 = [(BLTSectionInfoList *)self->_sectionInfoList sectionIDs];
  id v12 = [(BLTSettingSync *)self _filteredAlertingSectionIDs:v11];

  sectionInfoSyncCoordinatorQueue = self->_sectionInfoSyncCoordinatorQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke;
  block[3] = &unk_264683BB0;
  void block[4] = self;
  id v14 = v12;
  id v32 = v14;
  dispatch_sync(sectionInfoSyncCoordinatorQueue, block);
  [(BLTSettingSync *)self _storeSyncState:1];
  objc_initWeak(&location, self);
  settingSendQueue = self->_settingSendQueue;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_2;
  v29[3] = &unk_264685508;
  v29[4] = self;
  uint64_t v16 = [v14 count];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_2_72;
  v28[3] = &unk_264685530;
  v28[4] = self;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_4;
  v25[3] = &unk_264685558;
  objc_copyWeak(&v27, &location);
  void v25[4] = self;
  id v17 = v8;
  id v26 = v17;
  if (v9)
  {
    id v18 = v23;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_6;
    v23[3] = &unk_264685328;
    id v20 = &v24;
    id v24 = v9;
  }
  else
  {
    id v18 = 0;
  }
  [(BLTSettingSyncSendQueue *)settingSendQueue sendEffectiveSectionInfosUsingProvider:v29 count:v16 sectionInfoSendCompleted:v28 completion:v25 progress:v18 spoolToFile:v5];
  uint64_t v19 = [(BLTSectionInfoList *)self->_sectionInfoList sectionOverridesOnly];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_7;
  v21[3] = &unk_264685580;
  v21[4] = self;
  BOOL v22 = v5;
  [v19 enumerateKeysAndObjectsUsingBlock:v21];

  if (v9) {
  objc_destroyWeak(&v27);
  }
  objc_destroyWeak(&location);
}

void __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 96))
  {
    uint64_t v1 = blt_settings_log();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_cold_1(v1);
    }
  }
  else
  {
    char v3 = [BLTSectionInfoSyncCoordinator alloc];
    int v4 = [*(id *)(a1 + 40) allObjects];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_69;
    v8[3] = &unk_2646854B8;
    v8[4] = *(void *)(a1 + 32);
    uint64_t v5 = [(BLTSectionInfoSyncCoordinator *)v3 initWithAlertingSectionIDs:v4 infoProvider:v8];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 96);
    *(void *)(v6 + 96) = v5;
  }
}

uint64_t __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_69(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) effectiveSectionInfoForSectionID:a2];
}

id __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__8;
  int v11 = __Block_byref_object_dispose__8;
  id v12 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(NSObject **)(v2 + 104);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_71;
  block[3] = &unk_2646854E0;
  void block[4] = v2;
  void block[5] = &v7;
  block[6] = a2;
  dispatch_sync(v3, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_71(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 96) effectiveSectionInfoForSectionIDIndex:a1[6]];
  uint64_t v3 = *(void *)(a1[5] + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

void __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_2_72(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 104);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_3;
  v4[3] = &unk_2646840C0;
  void v4[4] = v2;
  void v4[5] = a2;
  dispatch_sync(v3, v4);
}

uint64_t __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 96) sectionInfoSendCompleted:*(void *)(a1 + 40)];
}

void __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 104);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_5;
  block[3] = &unk_264683BD8;
  id v4 = WeakRetained;
  id v7 = v4;
  dispatch_sync(v3, block);
  [v4 _storeSyncState:0];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

void __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 96);
  *(void *)(v1 + 96) = 0;
}

uint64_t __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) sendOverrideOnly:a3 sectionID:a2 spoolToFile:*(unsigned __int8 *)(a1 + 40)];
}

- (void)sendOverrideOnly:(id)a3 sectionID:(id)a4 spoolToFile:(BOOL)a5
{
  BOOL v5 = a5;
  id v21 = a3;
  id v8 = a4;
  uint64_t v9 = [v21 level];

  if (v9)
  {
    uint64_t v10 = [(BLTSettingSyncInternal *)self connection];
    int v11 = [v21 level];
    objc_msgSend(v10, "setNotificationsLevel:sectionID:mirror:spoolToFile:", BLTPBSetNotificationsAlertLevelToBLTSettingSyncingNotificationsLevel(objc_msgSend(v11, "intValue")), v8, 0, v5);
  }
  id v12 = [v21 grouping];

  if (v12)
  {
    uint64_t v13 = [(BLTSettingSyncInternal *)self connection];
    id v14 = [v21 grouping];
    objc_msgSend(v13, "setNotificationsGrouping:sectionID:spoolToFile:", objc_msgSend(v14, "intValue"), v8, v5);
  }
  uint64_t v15 = [v21 sound];

  if (v15)
  {
    uint64_t v16 = [(BLTSettingSyncInternal *)self connection];
    id v17 = [v21 sound];
    objc_msgSend(v16, "setNotificationsSoundEnabled:sectionID:", objc_msgSend(v17, "intValue"), v8);
  }
  id v18 = [v21 criticalAlert];

  if (v18)
  {
    uint64_t v19 = [(BLTSettingSyncInternal *)self connection];
    id v20 = [v21 criticalAlert];
    objc_msgSend(v19, "setNotificationsCriticalAlertEnabled:sectionID:", objc_msgSend(v20, "intValue"), v8);
  }
}

- (id)_overriddenSectionInfoForSectionID:(id)a3
{
  return [(BLTSectionInfoList *)self->_sectionInfoList overriddenSectionInfoForSectionID:a3];
}

- (void)sendSectionInfosWithSectionIDs:(id)a3 completion:(id)a4 spoolToFile:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = BLTWorkQueue();
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __72__BLTSettingSync_sendSectionInfosWithSectionIDs_completion_spoolToFile___block_invoke;
  v13[3] = &unk_2646855D0;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  BOOL v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __72__BLTSettingSync_sendSectionInfosWithSectionIDs_completion_spoolToFile___block_invoke(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _filteredAlertingSectionIDs:*(void *)(a1 + 40)];
  uint64_t v3 = [MEMORY[0x263EFF9C0] setWithArray:*(void *)(a1 + 40)];
  [v3 minusSet:v2];
  uint64_t v4 = [v2 count];
  long long v40 = v3;
  long long v41 = v2;
  uint64_t v39 = v4;
  if (v4)
  {
    BOOL v5 = [v2 allObjects];
    uint64_t v6 = blt_settings_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v55 = v5;
      _os_log_impl(&dword_222F4C000, v6, OS_LOG_TYPE_DEFAULT, "Sending single section infos %@", buf, 0xCu);
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v49;
      unint64_t v11 = 0x267F97000uLL;
      unint64_t v12 = 0x267F97000uLL;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v49 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v14 = *(void *)(*((void *)&v48 + 1) + 8 * i);
          id v15 = [*(id *)(*(void *)(a1 + 32) + *(int *)(v11 + 3836)) watchKitAppDefinitionWithBundleID:v14];
          BOOL v16 = v15;
          if (v15)
          {
            if ([v15 runsIndependently])
            {
              if ([v16 isInstalled])
              {
                uint64_t v17 = *(int *)(v12 + 3852);
                if (([*(id *)(*(void *)(a1 + 32) + v17) hasCustomSettingsSetForSectionID:v14] & 1) == 0)
                {
                  id v18 = [*(id *)(*(void *)(a1 + 32) + v17) bbSectionInfoForSectionID:v14];
                  uint64_t v19 = (void *)[v18 copy];

                  id v20 = *(void **)(*(void *)(a1 + 32) + 120);
                  [v16 watchKitAppBundleID];
                  id v21 = v7;
                  v23 = unint64_t v22 = v12;
                  [v20 setCustomSettingsWithSectionInfo:v19 watchSectionID:v23];

                  unint64_t v12 = v22;
                  id v7 = v21;
                  unint64_t v11 = 0x267F97000;
                }
              }
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v48 objects:v53 count:16];
      }
      while (v9);
    }

    uint64_t v24 = *(void *)(a1 + 32);
    uint64_t v25 = *(void **)(v24 + 80);
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __72__BLTSettingSync_sendSectionInfosWithSectionIDs_completion_spoolToFile___block_invoke_74;
    v46[3] = &unk_2646855A8;
    v46[4] = v24;
    id v47 = v7;
    uint64_t v26 = *(void *)(a1 + 48);
    uint64_t v27 = *(unsigned __int8 *)(a1 + 56);
    id v28 = v7;
    uint64_t v4 = v39;
    [v25 sendEffectiveSectionInfosUsingProvider:v46 count:v39 sectionInfoSendCompleted:0 completion:v26 progress:0 spoolToFile:v27];

    uint64_t v3 = v40;
    uint64_t v2 = v41;
  }
  if ([v3 count])
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v29 = v3;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v42 objects:v52 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v43 != v32) {
            objc_enumerationMutation(v29);
          }
          uint64_t v34 = *(void **)(*((void *)&v42 + 1) + 8 * j);
          v35 = [*(id *)(*(void *)(a1 + 32) + 72) sectionOverrideOnlyForSectionID:v34];
          id v36 = blt_settings_log();
          BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
          if (v35)
          {
            if (v37)
            {
              *(_DWORD *)long long buf = 138412290;
              uint64_t v55 = v34;
              _os_log_impl(&dword_222F4C000, v36, OS_LOG_TYPE_DEFAULT, "Sending single section settings override for %@", buf, 0xCu);
            }

            [*(id *)(a1 + 32) sendOverrideOnly:v35 sectionID:v34 spoolToFile:*(unsigned __int8 *)(a1 + 56)];
          }
          else
          {
            if (v37)
            {
              *(_DWORD *)long long buf = 138412290;
              uint64_t v55 = v34;
              _os_log_impl(&dword_222F4C000, v36, OS_LOG_TYPE_DEFAULT, "Not sending settings for %@ as it has no override and is not alerting", buf, 0xCu);
            }
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v42 objects:v52 count:16];
      }
      while (v31);
    }

    uint64_t v3 = v40;
    uint64_t v2 = v41;
    uint64_t v4 = v39;
  }
  if (!v4)
  {
    uint64_t v38 = *(void *)(a1 + 48);
    if (v38) {
      (*(void (**)(void))(v38 + 16))();
    }
  }
}

id __72__BLTSettingSync_sendSectionInfosWithSectionIDs_completion_spoolToFile___block_invoke_74(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 72);
  uint64_t v3 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  uint64_t v4 = [v2 effectiveSectionInfoForSectionID:v3];

  return v4;
}

- (void)sendRemoveSectionWithSectionID:(id)a3 sent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = BLTWorkQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__BLTSettingSync_sendRemoveSectionWithSectionID_sent___block_invoke;
  block[3] = &unk_264683E50;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __54__BLTSettingSync_sendRemoveSectionWithSectionID_sent___block_invoke(void *a1)
{
  id v4 = [*(id *)(a1[4] + 144) watchKitAppDefinitionWithBundleID:a1[5]];
  if (v4
    && [v4 runsIndependently]
    && [v4 isInstalled]
    && ([*(id *)(a1[4] + 72) hasCustomSettingsSetForSectionID:a1[5]] & 1) == 0)
  {
    uint64_t v2 = *(void **)(a1[4] + 120);
    uint64_t v3 = [v4 watchKitAppBundleID];
    [v2 enableCustomSettingsForWatchSectionID:v3];
  }
  [*(id *)(a1[4] + 80) sendRemoveSectionWithSectionID:a1[5] sent:a1[6]];
}

- (void)sendAllSectionInfoWithSpool:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v4 && ([MEMORY[0x263F57700] activePairedDeviceSupportsFileSettingSync] & 1) != 0)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __57__BLTSettingSync_sendAllSectionInfoWithSpool_completion___block_invoke_3;
    v10[3] = &unk_264683CA0;
    id v7 = &v11;
    id v11 = v6;
    id v8 = v6;
    [(BLTSettingSync *)self _sendSpooledSyncWithCompletion:v10 withProgress:&__block_literal_global_78_0];
  }
  else
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __57__BLTSettingSync_sendAllSectionInfoWithSpool_completion___block_invoke;
    v12[3] = &unk_264683CA0;
    id v7 = &v13;
    id v13 = v6;
    id v9 = v6;
    [(BLTSettingSync *)self _updateAllBBSectionsWithCompletion:v12 withProgress:&__block_literal_global_76 spoolToFile:0];
  }
}

uint64_t __57__BLTSettingSync_sendAllSectionInfoWithSpool_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __57__BLTSettingSync_sendAllSectionInfoWithSpool_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)spoolSectionInfoWithCompletion:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F57700] activePairedDeviceSupportsFileSettingSync]) {
    [(BLTSettingSync *)self _updateAllBBSectionsWithCompletion:v4 withProgress:0 spoolToFile:1];
  }
}

- (id)settingOverrides
{
  return [(BLTSectionInfoList *)self->_sectionInfoList overrides];
}

- (id)originalSettings
{
  return [(BLTSectionInfoList *)self->_sectionInfoList originalSettings];
}

- (id)overriddenSettings
{
  return [(BLTSectionInfoList *)self->_sectionInfoList overriddenSettings];
}

- (id)settingsDescriptionForSectionIDs:(id)a3
{
  return [(BLTSectionInfoList *)self->_sectionInfoList settingsDescriptionForSectionIDs:a3];
}

- (void)setSectionInfo:(id)a3 completion:(id)a4
{
}

- (void)setSectionInfo:(id)a3 keypaths:(id)a4 completion:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  id v11 = blt_settings_log();
  id v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v37 = v8;
      __int16 v38 = 2112;
      id v39 = v9;
      _os_log_impl(&dword_222F4C000, v12, OS_LOG_TYPE_DEFAULT, "setSectionInfo: %@ keypaths: %@", buf, 0x16u);
    }

    id v13 = BBSectionInfoFromBLTPBSectionInfo(v8);
    uint64_t v14 = [(BLTSettingSyncInternal *)self settingsGateway];
    id v15 = [v8 sectionID];
    BOOL v16 = [v14 sectionInfoForSectionID:v15];

    if ([v9 count])
    {
      [v16 applyKeypaths:v9 from:v13];
      id v17 = v16;

      id v13 = v17;
    }
    id v18 = objc_alloc(MEMORY[0x263F01878]);
    uint64_t v19 = [v13 sectionID];
    id v35 = 0;
    id v20 = (void *)[v18 initWithBundleIdentifier:v19 allowPlaceholder:0 error:&v35];
    id v21 = v35;

    if (v21)
    {
      unint64_t v22 = blt_settings_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[BLTSettingSync setSectionInfo:keypaths:completion:]((uint64_t)v8, (uint64_t)v21, v22);
      }
    }
    if (v20)
    {
      uint64_t v23 = blt_settings_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        id v37 = v8;
        __int16 v38 = 2112;
        id v39 = v20;
        _os_log_impl(&dword_222F4C000, v23, OS_LOG_TYPE_DEFAULT, "setSectionInfo: %@ record: %@", buf, 0x16u);
      }

      uint64_t v24 = (void *)[v13 copy];
      uint64_t v25 = [v16 displayName];

      if (v25)
      {
        uint64_t v26 = [v16 displayName];
        [v24 setDisplayName:v26];
      }
      uint64_t v27 = [(BLTSettingSyncInternal *)self settingsGateway];
      id v28 = [v24 sectionID];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __53__BLTSettingSync_setSectionInfo_keypaths_completion___block_invoke;
      v33[3] = &unk_264683CA0;
      uint64_t v34 = v10;
      [v27 setSectionInfo:v24 forSectionID:v28 withCompletion:v33];
    }
    else
    {
      id v29 = [v8 watchSectionID];

      if (v29)
      {
        uint64_t v30 = [v8 watchSectionID];
        [v13 setSectionID:v30];

        uint64_t v31 = blt_settings_log();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          uint64_t v32 = [v8 watchSectionID];
          *(_DWORD *)long long buf = 138412290;
          id v37 = v32;
          _os_log_impl(&dword_222F4C000, v31, OS_LOG_TYPE_INFO, "Setting custom settings for watch app %@", buf, 0xCu);
        }
        [(BLTSectionInfoListBridgeProvider *)self->_bridgeProvider setCustomSettingsWithSectionInfo:v13];
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[BLTSettingSync setSectionInfo:keypaths:completion:](v12);
    }

    if (v10) {
      v10[2](v10);
    }
  }
}

uint64_t __53__BLTSettingSync_setSectionInfo_keypaths_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)removeSectionWithSectionID:(id)a3
{
}

- (void)setNotificationsLevel:(unint64_t)a3 sectionID:(id)a4 mirror:(BOOL)a5 fromRemote:(BOOL)a6
{
  BOOL v6 = a5;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = a4;
  if (a3 - 4 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    id v10 = blt_settings_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v18 = 138412290;
      id v19 = v9;
      _os_log_impl(&dword_222F4C000, v10, OS_LOG_TYPE_INFO, "Removing section info cache info for %@", (uint8_t *)&v18, 0xCu);
    }

    id v11 = [(BLTSettingSyncInternal *)self connection];
    [v11 removeSectionInfoSentCacheForSectionID:v9];
  }
  if (v6)
  {
    id v12 = [(BLTSectionInfoList *)self->_sectionInfoList bbSectionInfoForSectionID:v9];
    id v13 = (void *)[v12 copy];

    BOOL v14 = v13 == 0;
    id v15 = blt_settings_log();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
    if (v13)
    {
      if (v16)
      {
        id v17 = [NSNumber numberWithUnsignedInteger:a3];
        int v18 = 138412546;
        id v19 = v9;
        __int16 v20 = 2112;
        id v21 = v17;
        _os_log_impl(&dword_222F4C000, v15, OS_LOG_TYPE_INFO, "Setting notification level for %@ to %@", (uint8_t *)&v18, 0x16u);
      }
      [v13 bltApplyNotificationLevel:a3];
      id v15 = [(BLTSettingSyncInternal *)self settingsGateway];
      [v15 setSectionInfo:v13 forSectionID:v9];
    }
    else if (v16)
    {
      int v18 = 138412290;
      id v19 = v9;
      _os_log_impl(&dword_222F4C000, v15, OS_LOG_TYPE_INFO, "Phone section not found: %@. Must be watch section only", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    BOOL v14 = 0;
  }
  if (a3 != 3) {
    [(BLTSectionInfoListBridgeProvider *)self->_bridgeProvider setNotificationsLevel:BLTSettingSyncingNotificationsLevelToBLTPBSetNotificationsAlertLevel(a3) sectionID:v9 forceCustom:v14 || !v6];
  }
  [(BLTSettingSync *)self makeAuthorizationPermanentForSectionID:v9];
}

- (void)makeAuthorizationPermanentForSectionID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BLTSettingSyncInternal *)self settingsGateway];
  BOOL v6 = [v5 sectionInfoForSectionID:v4];
  id v7 = (void *)[v6 copy];

  if (v7 && [v7 authorizationStatus] == 4)
  {
    [v7 makeAuthorizationPermanent];
    objc_initWeak(&location, self);
    id v8 = [(BLTSettingSyncInternal *)self settingsGateway];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __57__BLTSettingSync_makeAuthorizationPermanentForSectionID___block_invoke;
    v9[3] = &unk_2646855F8;
    id v10 = v4;
    objc_copyWeak(&v11, &location);
    [v8 setSectionInfo:v7 forSectionID:v10 withCompletion:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __57__BLTSettingSync_makeAuthorizationPermanentForSectionID___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = blt_settings_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v10 = v3;
    _os_log_impl(&dword_222F4C000, v2, OS_LOG_TYPE_INFO, "makeAuthorizationPermanentForSectionID settingsGateway saved %@", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = *(void *)(a1 + 32);
  BOOL v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v8 count:1];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__BLTSettingSync_makeAuthorizationPermanentForSectionID___block_invoke_81;
  v6[3] = &unk_264683BD8;
  id v7 = *(id *)(a1 + 32);
  [WeakRetained sendSectionInfosWithSectionIDs:v5 completion:v6 spoolToFile:0];
}

void __57__BLTSettingSync_makeAuthorizationPermanentForSectionID___block_invoke_81(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = blt_settings_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_222F4C000, v2, OS_LOG_TYPE_INFO, "makeAuthorizationPermanentForSectionID sendSectionInfosWithSectionIDs complete %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)observer:(id)a3 noteSectionParametersChanged:(id)a4 forSectionID:(id)a5
{
  v15[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  v15[0] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  uint64_t v10 = [(BLTSettingSync *)self _filteredAlertingSectionIDs:v9];

  if ([v10 count])
  {
    uint64_t v11 = [(id)sectionParameterSubtypeIconSectionIDAllowList objectForKey:v8];
    if ([v11 BOOLValue])
    {
      id v12 = blt_settings_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412290;
        id v14 = v8;
        _os_log_impl(&dword_222F4C000, v12, OS_LOG_TYPE_INFO, "Sending sectionSubtypeParameters icons for %@", (uint8_t *)&v13, 0xCu);
      }

      [(BLTSettingSync *)self _sendSectionSubtypeParameterIcons:v7 sectionID:v8 waitForAcknowledgement:0 spoolToFile:!self->_initialSyncPerformed andCompletion:0];
    }
  }
}

- (void)sectionInfoList:(id)a3 receivedUpdatedSectionInfoForSectionID:(id)a4 transaction:(id)a5
{
  v15[1] = *MEMORY[0x263EF8340];
  id v7 = a5;
  v15[0] = a4;
  id v8 = (void *)MEMORY[0x263EFF8C0];
  id v9 = a4;
  uint64_t v10 = [v8 arrayWithObjects:v15 count:1];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __85__BLTSettingSync_sectionInfoList_receivedUpdatedSectionInfoForSectionID_transaction___block_invoke;
  v13[3] = &unk_264683BD8;
  id v14 = v7;
  BOOL v11 = !self->_initialSyncPerformed;
  id v12 = v7;
  [(BLTSettingSync *)self sendSectionInfosWithSectionIDs:v10 completion:v13 spoolToFile:v11];

  [(BLTSettingSync *)self _callReloadBBCompletionsForSectionID:v9];
}

- (void)sectionInfoList:(id)a3 receivedRemoveSectionWithSectionID:(id)a4 transaction:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __81__BLTSettingSync_sectionInfoList_receivedRemoveSectionWithSectionID_transaction___block_invoke;
  v9[3] = &unk_264685468;
  id v10 = v7;
  id v8 = v7;
  [(BLTSettingSync *)self sendRemoveSectionWithSectionID:a4 sent:v9];
}

- (BOOL)sectionInfoListSectionIDHadDisplayedCriticalBulletins:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BLTSettingSyncInternal *)self sectionConfiguration];
  char v6 = [v5 hasSectionIDDisplayedCriticalBulletins:v4];

  return v6;
}

- (BOOL)sectionInfoList:(id)a3 override:(id)a4 shouldApplyToSectionInfoForSectionID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(BLTSettingSyncInternal *)self sectionConfiguration];
  char v10 = [v9 override:v8 appliesToConfigurationForSectionID:v7];

  return v10 ^ 1;
}

- (void)sectionInfoList:(id)a3 makeAuthorizationPermanentForSectionID:(id)a4
{
}

- (void)sectionConfiguration:(id)a3 addedSectionIDs:(id)a4 removedSectionIDs:(id)a5
{
  id v6 = a4;
  if ([v6 count])
  {
    id v7 = +[BLTTransaction transactionWithDescription:@"BLTSettingsSync sectionConfiguration:addedSectionIDs:removedSectionIDs:"];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __73__BLTSettingSync_sectionConfiguration_addedSectionIDs_removedSectionIDs___block_invoke;
    v9[3] = &unk_264683BD8;
    id v10 = v7;
    id v8 = v7;
    [(BLTSettingSync *)self sendSectionInfosWithSectionIDs:v6 completion:v9 spoolToFile:0];
  }
}

- (void)_callReloadBBCompletionsForSectionID:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__BLTSettingSync__callReloadBBCompletionsForSectionID___block_invoke;
  v6[3] = &unk_264683BB0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  BLTDispatchWorkQueue(v6);
}

void __55__BLTSettingSync__callReloadBBCompletionsForSectionID___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 128) objectForKeyedSubscript:*(void *)(a1 + 40)];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v7 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
  [*(id *)(*(void *)(a1 + 32) + 128) removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)_addReloadBBCompletion:(id)a3 sectionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__BLTSettingSync__addReloadBBCompletion_sectionID___block_invoke;
  v10[3] = &unk_264683E50;
  void v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  BLTDispatchWorkQueue(v10);
}

void __51__BLTSettingSync__addReloadBBCompletion_sectionID___block_invoke(void *a1)
{
  id v3 = [*(id *)(a1[4] + 128) objectForKeyedSubscript:a1[5]];
  if (!v3)
  {
    id v3 = [MEMORY[0x263EFF980] array];
    objc_msgSend(*(id *)(a1[4] + 128), "setObject:forKeyedSubscript:");
  }
  uint64_t v2 = (void *)MEMORY[0x223CAC810](a1[6]);
  [v3 addObject:v2];
}

- (void)_callAndRemoveReloadBBCompletion:(id)a3 sectionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__BLTSettingSync__callAndRemoveReloadBBCompletion_sectionID___block_invoke;
  v10[3] = &unk_264683E50;
  void v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  BLTDispatchWorkQueue(v10);
}

void __61__BLTSettingSync__callAndRemoveReloadBBCompletion_sectionID___block_invoke(void *a1)
{
  id v4 = [*(id *)(a1[4] + 128) objectForKeyedSubscript:a1[5]];
  if (v4)
  {
    uint64_t v2 = (void *)MEMORY[0x223CAC810](a1[6]);
    uint64_t v3 = [v4 indexOfObject:v2];

    if (v3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [v4 removeObjectAtIndex:v3];
      (*(void (**)(void))(a1[6] + 16))();
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchKitAppList, 0);
  objc_storeStrong((id *)&self->_syncSupportedAppList, 0);
  objc_storeStrong((id *)&self->_reloadBBCompletions, 0);
  objc_storeStrong((id *)&self->_bridgeProvider, 0);
  objc_storeStrong((id *)&self->_sectionInfoSyncCoordinatorQueue, 0);
  objc_storeStrong((id *)&self->_sectionInfoSyncCoordinator, 0);
  objc_storeStrong((id *)&self->_settingSendQueue, 0);
  objc_storeStrong((id *)&self->_sectionInfoList, 0);
}

void __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_222F4C000, log, OS_LOG_TYPE_ERROR, "Can't call update all bb sections while it is already processing", v1, 2u);
}

- (void)setSectionInfo:(NSObject *)a1 keypaths:completion:.cold.1(NSObject *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F08B88] callStackSymbols];
  int v3 = 138412290;
  id v4 = v2;
  _os_log_error_impl(&dword_222F4C000, a1, OS_LOG_TYPE_ERROR, "**** sectionInfo is nil!\n%@", (uint8_t *)&v3, 0xCu);
}

- (void)setSectionInfo:(uint64_t)a1 keypaths:(uint64_t)a2 completion:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_222F4C000, log, OS_LOG_TYPE_ERROR, "setSectionInfo: %@ error: %@", (uint8_t *)&v3, 0x16u);
}

@end