@interface BLTBulletinDistributor
+ (id)sharedDistributor;
+ (id)stringForSettingsWillPresentBlockedBy:(unint64_t)a3;
- (BBObserver)bbObserver;
- (BLTBulletinDistributor)init;
- (BLTBulletinFetcher)bulletinFetcher;
- (BLTClientReplyTimeoutManager)clientReplyTimeoutManager;
- (BLTGizmoLegacyMap)gizmoLegacyMap;
- (BLTHashCache)attachmentHashCache;
- (BLTHashCache)iconHashCache;
- (BLTPingSubscriberManager)pingSubscriberManager;
- (BLTRemoteGizmoClient)gizmoConnection;
- (BLTSectionConfiguration)sectionConfiguration;
- (BLTSettingSync)settingSync;
- (BLTSimpleCache)mruCacheOfSectionIDs;
- (BLTWatchKitAppList)watchKitAppList;
- (BOOL)_enqueuBulletinUpdate:(unint64_t)a3 bulletin:(id)a4 feed:(unint64_t)a5;
- (BOOL)_notifyGizmoOfBulletin:(id)a3 forFeed:(unint64_t)a4 updateType:(unint64_t)a5 playLightsAndSirens:(BOOL)a6 shouldSendReplyIfNeeded:(BOOL)a7 attachment:(id)a8 attachmentType:(int64_t)a9 replyToken:(id)a10;
- (BOOL)_rememberBulletin:(id)a3 forFeed:(unint64_t)a4 syncChangesToWatch:(BOOL)a5;
- (BOOL)_willNanoPresent:(unint64_t)a3;
- (BOOL)_willNanoPresent:(unint64_t)a3 forBulletin:(id)a4 feed:(unint64_t)a5;
- (BOOL)isLocallyConnectedToRemote;
- (BOOL)isStandaloneTestModeEnabled;
- (BOOL)shouldSuppressLightsAndSirensNow;
- (BOOL)standaloneTestModeEnabled;
- (FBSDisplayLayoutMonitor)layoutMonitor;
- (NSDate)startupTime;
- (NSMutableDictionary)bulletins;
- (NSMutableDictionary)pendingBulletinUpdates;
- (NSMutableSet)bulletinIDsWaitingOnGizmoAdd;
- (NSMutableSet)lockScreenFeed;
- (NSMutableSet)noticesFeed;
- (id)_bulletinWithPublisherBulletinID:(id)a3 recordID:(id)a4 sectionID:(id)a5;
- (id)_obsoletionDateRelativeToNow;
- (id)_replyTokenForSectionID:(id)a3 publisherMatchID:(id)a4;
- (id)_stateDescription;
- (id)originalSettings;
- (id)overriddenSettings;
- (id)settingOverrides;
- (int64_t)summarizationSetting;
- (unint64_t)_nanoPresentableFeedFromPhoneFeed:(unint64_t)a3;
- (void)_addBulletin:(id)a3 forFeed:(unint64_t)a4 playLightsAndSirens:(BOOL)a5 attachment:(id)a6 attachmentType:(int64_t)a7 alwaysSend:(BOOL)a8 completion:(id)a9;
- (void)_attachAttachment:(id)a3 attachmentType:(int64_t)a4 toBulletin:(id)a5;
- (void)_attachIconToBulletin:(id)a3;
- (void)_cleanupForAddedBulletin:(id)a3;
- (void)_handleAddBulletin:(id)a3 feed:(unint64_t)a4 shouldPlayLightsAndSirens:(BOOL)a5 performedWithSuccess:(BOOL)a6 sendAttemptTime:(id)a7 connectionStatus:(unint64_t)a8 isGizmoReady:(BOOL)a9 shouldSendReplyIfNeeded:(BOOL)a10 replyToken:(id)a11;
- (void)_handleAllSyncComplete;
- (void)_handleDidPlayLightsAndSirens:(BOOL)a3 forBulletin:(id)a4 inPhoneSection:(id)a5 finalReply:(BOOL)a6 replyToken:(id)a7;
- (void)_handleDidPlayLightsAndSirens:(BOOL)a3 forBulletin:(id)a4 inPhoneSection:(id)a5 transmissionDate:(id)a6 receptionDate:(id)a7 fromGizmo:(BOOL)a8 finalReply:(BOOL)a9 replyToken:(id)a10;
- (void)_handleInitialSyncStateCompleteChanged:(id)a3;
- (void)_handleSyncStateChanged:(id)a3;
- (void)_mapBulletin:(id)a3;
- (void)_notifyGizmoOfCancelBulletin:(id)a3 sectionID:(id)a4 universalSectionID:(id)a5 feed:(unint64_t)a6 withBulletinDate:(id)a7;
- (void)_performModifyBulletin:(id)a3 forFeed:(unint64_t)a4;
- (void)_performNextPendingBulletinUpdateForBulletinID:(id)a3;
- (void)_performRemoveBulletin:(id)a3 forFeed:(unint64_t)a4;
- (void)_performSync;
- (void)_pingSubscriberWithBulletin:(id)a3 ack:(id)a4;
- (void)_postWillSendBulletinToGizmoNotificationForBulletin:(id)a3;
- (void)_registerForPairedDeviceBuildChanges;
- (void)_reloadBulletinsWithCompletion:(id)a3;
- (void)_removeTranscodedAttachmentIfNeededForBulletin:(id)a3;
- (void)_sendCurrentBulletinIdentifiers;
- (void)_sendPBBulletin:(id)a3 forBulletin:(id)a4 feed:(unint64_t)a5 updateType:(unint64_t)a6 playLightsAndSirens:(BOOL)a7 shouldSendReplyIfNeeded:(BOOL)a8;
- (void)_setupBBObserver;
- (void)_startBulletinListening;
- (void)_subscriberWillAllowBulletin:(id)a3 completion:(id)a4;
- (void)clearReplyBlockForReplyToken:(id)a3;
- (void)clearSectionInfoSentCache;
- (void)dealloc;
- (void)disableStandaloneTestMode;
- (void)enableStandaloneTestModeWithMinimumSendDelay:(unint64_t)a3 maximumSendDelay:(unint64_t)a4 minimumResponseDelay:(unint64_t)a5 maximumResponseDelay:(unint64_t)a6;
- (void)getWillNanoPresentNotificationForSectionID:(id)a3 completion:(id)a4;
- (void)getWillNanoPresentNotificationForSectionID:(id)a3 subsectionIDs:(id)a4 completion:(id)a5;
- (void)getWillNanoPresentNotificationForSectionID:(id)a3 subsectionIDs:(id)a4 subtype:(int64_t)a5 completion:(id)a6;
- (void)handleAction:(id)a3;
- (void)handleDidPlayLightsAndSirens:(BOOL)a3 forBulletin:(id)a4 inPhoneSection:(id)a5 transmissionDate:(id)a6 receptionDate:(id)a7 replyToken:(id)a8;
- (void)observer:(id)a3 addBulletin:(id)a4 forFeed:(unint64_t)a5 playLightsAndSirens:(BOOL)a6 attachment:(id)a7 attachmentType:(int64_t)a8 alwaysSend:(BOOL)a9 withReply:(id)a10;
- (void)observer:(id)a3 addBulletin:(id)a4 forFeed:(unint64_t)a5 playLightsAndSirens:(BOOL)a6 withReply:(id)a7;
- (void)observer:(id)a3 modifyBulletin:(id)a4 forFeed:(unint64_t)a5;
- (void)observer:(id)a3 removeBulletin:(id)a4 forFeed:(unint64_t)a5;
- (void)observer:(id)a3 updateGlobalSettings:(id)a4;
- (void)removeBulletinWithPublisherBulletinID:(id)a3 recordID:(id)a4 sectionID:(id)a5;
- (void)removeSectionID:(id)a3;
- (void)sendAllSectionInfoWithSpool:(BOOL)a3 completion:(id)a4;
- (void)sendBulletinSummary:(id)a3;
- (void)sendSectionInfoWithSectionID:(id)a3 completion:(id)a4;
- (void)setAttachmentHashCache:(id)a3;
- (void)setBbObserver:(id)a3;
- (void)setBulletinFetcher:(id)a3;
- (void)setBulletinIDsWaitingOnGizmoAdd:(id)a3;
- (void)setBulletins:(id)a3;
- (void)setClientReplyTimeoutManager:(id)a3;
- (void)setGizmoConnection:(id)a3;
- (void)setGizmoLegacyMap:(id)a3;
- (void)setIconHashCache:(id)a3;
- (void)setLayoutMonitor:(id)a3;
- (void)setLockScreenFeed:(id)a3;
- (void)setMruCacheOfSectionIDs:(id)a3;
- (void)setNoticesFeed:(id)a3;
- (void)setPendingBulletinUpdates:(id)a3;
- (void)setPingSubscriberManager:(id)a3;
- (void)setReplyBlock:(id)a3 forSection:(id)a4 bulletin:(id)a5 publicationDate:(id)a6 replyToken:(id)a7;
- (void)setSectionConfiguration:(id)a3;
- (void)setSettingSync:(id)a3;
- (void)setStandaloneTestModeEnabled:(BOOL)a3;
- (void)setStartupTime:(id)a3;
- (void)setSummarizationSetting:(int64_t)a3;
- (void)setWatchKitAppList:(id)a3;
- (void)spoolSectionInfoWithCompletion:(id)a3;
- (void)willSendLightsAndSirensWithPublisherBulletinID:(id)a3 recordID:(id)a4 inPhoneSection:(id)a5 systemApp:(BOOL)a6 completion:(id)a7;
@end

@implementation BLTBulletinDistributor

+ (id)sharedDistributor
{
  if (sharedDistributor___onceToken != -1) {
    dispatch_once(&sharedDistributor___onceToken, &__block_literal_global_96);
  }
  v2 = (void *)sharedDistributor___sharedInstance;
  return v2;
}

uint64_t __43__BLTBulletinDistributor_sharedDistributor__block_invoke()
{
  v0 = objc_alloc_init(BLTBulletinDistributor);
  uint64_t v1 = sharedDistributor___sharedInstance;
  sharedDistributor___sharedInstance = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (BLTBulletinDistributor)init
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  v54.receiver = self;
  v54.super_class = (Class)BLTBulletinDistributor;
  v2 = [(BLTBulletinDistributor *)&v54 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF910] date];
    startupTime = v2->_startupTime;
    v2->_startupTime = (NSDate *)v3;

    v2->_standaloneTestModeEnabled = 0;
    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    bulletins = v2->_bulletins;
    v2->_bulletins = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9C0] set];
    noticesFeed = v2->_noticesFeed;
    v2->_noticesFeed = (NSMutableSet *)v7;

    uint64_t v9 = [MEMORY[0x263EFF9C0] set];
    lockScreenFeed = v2->_lockScreenFeed;
    v2->_lockScreenFeed = (NSMutableSet *)v9;

    v11 = objc_alloc_init(BLTHashCache);
    attachmentHashCache = v2->_attachmentHashCache;
    v2->_attachmentHashCache = v11;

    v13 = objc_alloc_init(BLTHashCache);
    iconHashCache = v2->_iconHashCache;
    v2->_iconHashCache = v13;

    v2->_pendingBulletinUpdatesLock._os_unfair_lock_opaque = 0;
    uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
    pendingBulletinUpdates = v2->_pendingBulletinUpdates;
    v2->_pendingBulletinUpdates = (NSMutableDictionary *)v15;

    uint64_t v17 = [MEMORY[0x263EFF9C0] set];
    bulletinIDsWaitingOnGizmoAdd = v2->_bulletinIDsWaitingOnGizmoAdd;
    v2->_bulletinIDsWaitingOnGizmoAdd = (NSMutableSet *)v17;

    v19 = objc_alloc_init(BLTWatchKitAppList);
    watchKitAppList = v2->_watchKitAppList;
    v2->_watchKitAppList = v19;

    v21 = [[BLTSectionConfiguration alloc] initWithWatchKitAppList:v2->_watchKitAppList];
    sectionConfiguration = v2->_sectionConfiguration;
    v2->_sectionConfiguration = v21;

    v23 = [BLTClientReplyTimeoutManager alloc];
    v24 = BLTWorkQueue();
    uint64_t v25 = [(BLTClientReplyTimeoutManager *)v23 initWithQueue:v24];
    clientReplyTimeoutManager = v2->_clientReplyTimeoutManager;
    v2->_clientReplyTimeoutManager = (BLTClientReplyTimeoutManager *)v25;

    v27 = objc_alloc_init(BLTGizmoLegacyMap);
    gizmoLegacyMap = v2->_gizmoLegacyMap;
    v2->_gizmoLegacyMap = v27;

    v29 = [MEMORY[0x263F3F738] configurationForDefaultMainDisplayMonitor];
    uint64_t v30 = [MEMORY[0x263F3F728] monitorWithConfiguration:v29];
    layoutMonitor = v2->_layoutMonitor;
    v2->_layoutMonitor = (FBSDisplayLayoutMonitor *)v30;

    v32 = [[BLTSimpleCache alloc] initWithCapacity:10];
    mruCacheOfSectionIDs = v2->_mruCacheOfSectionIDs;
    v2->_mruCacheOfSectionIDs = v32;

    BLTCleanAttachmentsPath();
    CFPreferencesAppSynchronize(@"com.apple.bulletindistributor");
    v34 = objc_alloc_init(BLTRemoteGizmoClient);
    gizmoConnection = v2->_gizmoConnection;
    v2->_gizmoConnection = v34;

    [(BLTRemoteGizmoClient *)v2->_gizmoConnection setServer:v2];
    [(BLTRemoteGizmoClient *)v2->_gizmoConnection setGizmoLegacyMap:v2->_gizmoLegacyMap];
    v36 = [BLTSettingSync alloc];
    v37 = v2->_sectionConfiguration;
    v38 = BLTWorkQueue();
    uint64_t v39 = [(BLTSettingSync *)v36 initWithSectionConfiguration:v37 queue:v38 watchKitAppList:v2->_watchKitAppList];
    settingSync = v2->_settingSync;
    v2->_settingSync = (BLTSettingSync *)v39;

    v41 = blt_general_log();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222F4C000, v41, OS_LOG_TYPE_DEFAULT, "Getting summarization setting from gateway", buf, 2u);
    }

    v42 = [(BLTSettingSyncInternal *)v2->_settingSync settingsGateway];
    v2->_summarizationSetting = [v42 effectiveGlobalSummarizationSetting];

    v43 = blt_general_log();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v44 = [NSNumber numberWithInteger:v2->_summarizationSetting];
      *(_DWORD *)buf = 138412290;
      v56 = v44;
      _os_log_impl(&dword_222F4C000, v43, OS_LOG_TYPE_DEFAULT, "Gateway returned summarization setting %@", buf, 0xCu);
    }
    v45 = [[BLTPingSubscriberManager alloc] initWithDeviceDelegate:v2];
    pingSubscriberManager = v2->_pingSubscriberManager;
    v2->_pingSubscriberManager = v45;

    +[BLTDebugObserverHolder startWithWKAppList:v2->_watchKitAppList];
    v47 = +[BLTPairedSyncCoordinator syncState];
    if ([v47 isSyncRestricted])
    {
      v48 = [MEMORY[0x263F08A00] defaultCenter];
      [v48 addObserver:v2 selector:sel__handleSyncStateChanged_ name:@"BLTPairedSyncStateChanged" object:0];
    }
    else
    {
      [(BLTBulletinDistributor *)v2 _performSync];
    }
    if ([v47 isInitialSyncComplete])
    {
      [(BLTBulletinDistributor *)v2 _startBulletinListening];
      if (([v47 isSyncRestricted] & 1) == 0) {
        [(BLTBulletinDistributor *)v2 _handleAllSyncComplete];
      }
    }
    else
    {
      v49 = blt_general_log();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222F4C000, v49, OS_LOG_TYPE_DEFAULT, "Waiting for initial sync complete before listening for bulletins", buf, 2u);
      }

      v50 = [MEMORY[0x263F08A00] defaultCenter];
      [v50 addObserver:v2 selector:sel__handleInitialSyncStateCompleteChanged_ name:@"BLTPairedSyncStateInitialSyncCompleteChanged" object:0];
    }
    objc_initWeak((id *)buf, v2);
    v51 = BLTWorkQueue();
    objc_copyWeak(&v53, (id *)buf);
    v2->_stateHandler = os_state_add_handler();

    objc_destroyWeak(&v53);
    objc_destroyWeak((id *)buf);
  }
  return v2;
}

_DWORD *__30__BLTBulletinDistributor_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  v4 = [WeakRetained _stateDescription];
  uint64_t v5 = BLTStateDataWithTitleAndDescription(v3, (uint64_t)v4);

  return v5;
}

- (void)dealloc
{
  [(BBObserver *)self->_bbObserver invalidate];
  [(FBSDisplayLayoutMonitor *)self->_layoutMonitor invalidate];
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  os_state_remove_handler();
  self->_stateHandler = 0;
  v4.receiver = self;
  v4.super_class = (Class)BLTBulletinDistributor;
  [(BLTBulletinDistributor *)&v4 dealloc];
}

- (void)getWillNanoPresentNotificationForSectionID:(id)a3 completion:(id)a4
{
}

- (void)getWillNanoPresentNotificationForSectionID:(id)a3 subsectionIDs:(id)a4 completion:(id)a5
{
}

- (void)getWillNanoPresentNotificationForSectionID:(id)a3 subsectionIDs:(id)a4 subtype:(int64_t)a5 completion:(id)a6
{
  if (a6)
  {
    settingSync = self->_settingSync;
    v11 = (void (**)(id, BOOL))a6;
    v11[2](v11, [(BLTBulletinDistributor *)self _willNanoPresent:[(BLTSettingSyncInternal *)settingSync willNanoPresentNotificationForSectionID:a3 subsectionIDs:a4 subtype:a5]]);
  }
}

- (void)sendBulletinSummary:(id)a3
{
}

- (BOOL)isLocallyConnectedToRemote
{
  return [(BLTRemoteObject *)self->_gizmoConnection connectionStatus] == 1;
}

- (void)sendSectionInfoWithSectionID:(id)a3 completion:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  settingSync = self->_settingSync;
  v14[0] = a3;
  v8 = (void *)MEMORY[0x263EFF8C0];
  id v9 = a3;
  v10 = [v8 arrayWithObjects:v14 count:1];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__BLTBulletinDistributor_sendSectionInfoWithSectionID_completion___block_invoke;
  v12[3] = &unk_264683CA0;
  id v13 = v6;
  id v11 = v6;
  [(BLTSettingSync *)settingSync sendSectionInfosWithSectionIDs:v10 completion:v12 spoolToFile:0];
}

uint64_t __66__BLTBulletinDistributor_sendSectionInfoWithSectionID_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)sendAllSectionInfoWithSpool:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  settingSync = self->_settingSync;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __65__BLTBulletinDistributor_sendAllSectionInfoWithSpool_completion___block_invoke;
  v9[3] = &unk_264683CA0;
  id v10 = v6;
  id v8 = v6;
  [(BLTSettingSync *)settingSync sendAllSectionInfoWithSpool:v4 completion:v9];
}

uint64_t __65__BLTBulletinDistributor_sendAllSectionInfoWithSpool_completion___block_invoke(uint64_t a1)
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
  settingSync = self->_settingSync;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__BLTBulletinDistributor_spoolSectionInfoWithCompletion___block_invoke;
  v7[3] = &unk_264683CA0;
  id v8 = v4;
  id v6 = v4;
  [(BLTSettingSync *)settingSync spoolSectionInfoWithCompletion:v7];
}

uint64_t __57__BLTBulletinDistributor_spoolSectionInfoWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)clearSectionInfoSentCache
{
}

- (BOOL)isStandaloneTestModeEnabled
{
  return self->_standaloneTestModeEnabled;
}

- (void)enableStandaloneTestModeWithMinimumSendDelay:(unint64_t)a3 maximumSendDelay:(unint64_t)a4 minimumResponseDelay:(unint64_t)a5 maximumResponseDelay:(unint64_t)a6
{
  self->_standaloneTestModeEnabled = 1;
  -[BLTRemoteObject enableStandaloneTestModeWithMinimumSendDelay:maximumSendDelay:minimumResponseDelay:maximumResponseDelay:](self->_gizmoConnection, "enableStandaloneTestModeWithMinimumSendDelay:maximumSendDelay:minimumResponseDelay:maximumResponseDelay:");
  settingSync = self->_settingSync;
  [(BLTSettingSyncInternal *)settingSync enableStandaloneTestModeWithMinimumSendDelay:a3 maximumSendDelay:a4 minimumResponseDelay:a5 maximumResponseDelay:a6];
}

- (void)disableStandaloneTestMode
{
  self->_standaloneTestModeEnabled = 0;
  [(BLTRemoteObject *)self->_gizmoConnection disableStandaloneTestMode];
  settingSync = self->_settingSync;
  [(BLTSettingSyncInternal *)settingSync disableStandaloneTestMode];
}

- (id)settingOverrides
{
  return [(BLTSettingSync *)self->_settingSync settingOverrides];
}

- (id)originalSettings
{
  return [(BLTSettingSync *)self->_settingSync originalSettings];
}

- (id)overriddenSettings
{
  return [(BLTSettingSync *)self->_settingSync overriddenSettings];
}

- (void)removeSectionID:(id)a3
{
}

- (void)_handleSyncStateChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = BLTWorkQueue();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__BLTBulletinDistributor__handleSyncStateChanged___block_invoke;
  v7[3] = &unk_264683BB0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __50__BLTBulletinDistributor__handleSyncStateChanged___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) object];
  int v3 = [v2 becameSyncUnrestricted:*(void *)(a1 + 32)];

  if (v3)
  {
    id v4 = *(void **)(a1 + 40);
    [v4 _performSync];
  }
}

- (void)_handleInitialSyncStateCompleteChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = BLTWorkQueue();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__BLTBulletinDistributor__handleInitialSyncStateCompleteChanged___block_invoke;
  v7[3] = &unk_264683BB0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __65__BLTBulletinDistributor__handleInitialSyncStateCompleteChanged___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) object];
  if ([v2 isInitialSyncComplete])
  {
    [*(id *)(a1 + 40) _startBulletinListening];
    if (([v2 isSyncRestricted] & 1) == 0) {
      [*(id *)(a1 + 40) _handleAllSyncComplete];
    }
  }
}

- (void)_performSync
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__BLTBulletinDistributor__performSync__block_invoke;
  block[3] = &unk_264683BD8;
  block[4] = self;
  if (_performSync_onceToken != -1) {
    dispatch_once(&_performSync_onceToken, block);
  }
}

uint64_t __38__BLTBulletinDistributor__performSync__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 96);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__BLTBulletinDistributor__performSync__block_invoke_3;
  v4[3] = &unk_264683BD8;
  v4[4] = v1;
  return [v2 performInitialSyncWithProgress:&__block_literal_global_126 completion:v4];
}

uint64_t __38__BLTBulletinDistributor__performSync__block_invoke_2()
{
  return +[BLTPairedSyncCoordinator reportProgress:](BLTPairedSyncCoordinator, "reportProgress:");
}

uint64_t __38__BLTBulletinDistributor__performSync__block_invoke_3(uint64_t a1)
{
  +[BLTPairedSyncCoordinator syncDidComplete];
  id v2 = +[BLTPairedSyncCoordinator syncState];
  int v3 = [v2 isInitialSyncComplete];

  if (v3) {
    [*(id *)(a1 + 32) _handleAllSyncComplete];
  }
  id v4 = *(void **)(a1 + 32);
  return [v4 _registerForPairedDeviceBuildChanges];
}

- (void)_startBulletinListening
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__BLTBulletinDistributor__startBulletinListening__block_invoke;
  block[3] = &unk_264683BD8;
  block[4] = self;
  if (_startBulletinListening_onceToken != -1) {
    dispatch_once(&_startBulletinListening_onceToken, block);
  }
}

uint64_t __49__BLTBulletinDistributor__startBulletinListening__block_invoke(uint64_t a1)
{
  id v2 = blt_general_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222F4C000, v2, OS_LOG_TYPE_DEFAULT, "Start listening for bulletins", buf, 2u);
  }

  char v3 = [*(id *)(*(void *)(a1 + 32) + 88) isLoaded];
  id v4 = *(void **)(a1 + 32);
  if (v3) {
    return [v4 _setupBBObserver];
  }
  id v6 = (void *)v4[11];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__BLTBulletinDistributor__startBulletinListening__block_invoke_127;
  v7[3] = &unk_264683BD8;
  void v7[4] = v4;
  return [v6 fetchWatchKitInfoWithCompletion:v7];
}

uint64_t __49__BLTBulletinDistributor__startBulletinListening__block_invoke_127(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupBBObserver];
}

- (void)_handleAllSyncComplete
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__BLTBulletinDistributor__handleAllSyncComplete__block_invoke;
  block[3] = &unk_264683BD8;
  block[4] = self;
  if (_handleAllSyncComplete_onceToken != -1) {
    dispatch_once(&_handleAllSyncComplete_onceToken, block);
  }
}

void __48__BLTBulletinDistributor__handleAllSyncComplete__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = blt_general_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222F4C000, v2, OS_LOG_TYPE_INFO, "Sync is not restricted and initial sync complete", buf, 2u);
  }

  char v3 = BLTWorkQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__BLTBulletinDistributor__handleAllSyncComplete__block_invoke_128;
  block[3] = &unk_264683BD8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v3, block);

  id v4 = [MEMORY[0x263EFF910] date];
  [v4 timeIntervalSinceDate:*(void *)(*(void *)(a1 + 32) + 104)];
  double v6 = 60.0 - v5;
  if (v6 >= 0.0) {
    double v7 = v6;
  }
  else {
    double v7 = 0.0;
  }
  id v8 = blt_general_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v14 = v7;
    _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_DEFAULT, "Waiting for %f seconds until we send bulletin metadata", buf, 0xCu);
  }

  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
  id v10 = BLTWorkQueue();
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __48__BLTBulletinDistributor__handleAllSyncComplete__block_invoke_129;
  v11[3] = &unk_264683BD8;
  v11[4] = *(void *)(a1 + 32);
  dispatch_after(v9, v10, v11);
}

uint64_t __48__BLTBulletinDistributor__handleAllSyncComplete__block_invoke_128(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 96) handleAllSyncComplete];
}

uint64_t __48__BLTBulletinDistributor__handleAllSyncComplete__block_invoke_129(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __48__BLTBulletinDistributor__handleAllSyncComplete__block_invoke_2;
  v3[3] = &unk_264683BD8;
  v3[4] = v1;
  return [v1 _reloadBulletinsWithCompletion:v3];
}

uint64_t __48__BLTBulletinDistributor__handleAllSyncComplete__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendCurrentBulletinIdentifiers];
}

- (void)_registerForPairedDeviceBuildChanges
{
  v6[1] = *MEMORY[0x263EF8340];
  char v3 = objc_msgSend(MEMORY[0x263F57730], "blt_boundedWaitForActivePairedDevice");
  v6[0] = *MEMORY[0x263F57658];
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__BLTBulletinDistributor__registerForPairedDeviceBuildChanges__block_invoke;
  v5[3] = &unk_264684DB0;
  v5[4] = self;
  [v3 registerForPropertyChanges:v4 withBlock:v5];
}

void __62__BLTBulletinDistributor__registerForPairedDeviceBuildChanges__block_invoke(uint64_t a1)
{
  id v2 = BLTWorkQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__BLTBulletinDistributor__registerForPairedDeviceBuildChanges__block_invoke_2;
  block[3] = &unk_264683BD8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

uint64_t __62__BLTBulletinDistributor__registerForPairedDeviceBuildChanges__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendAllSectionInfoWithSpool:0 completion:0];
}

- (void)_setupBBObserver
{
  char v3 = blt_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_222F4C000, v3, OS_LOG_TYPE_DEFAULT, "Setting up BB Observer", v8, 2u);
  }

  id v4 = BLTWorkQueue();
  double v5 = BLTWorkQueue();
  double v6 = +[BLTBBObserver surrogateGatewayWithQueue:v4 calloutQueue:v5 name:@"GizmoGateway" priority:2];
  bbObserver = self->_bbObserver;
  self->_bbObserver = v6;

  [(BBObserver *)self->_bbObserver setDelegate:self];
  [(BBObserver *)self->_bbObserver setObserverFeed:33663];
}

- (void)_pingSubscriberWithBulletin:(id)a3 ack:(id)a4
{
  pingSubscriberManager = self->_pingSubscriberManager;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BLTPingSubscriberManager *)pingSubscriberManager subscribers];
  [v8 pingWithBulletin:v7 ack:v6];
}

- (void)_notifyGizmoOfCancelBulletin:(id)a3 sectionID:(id)a4 universalSectionID:(id)a5 feed:(unint64_t)a6 withBulletinDate:(id)a7
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  [a7 timeIntervalSinceNow];
  double v16 = v15 + 86400.0;
  uint64_t v17 = blt_general_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = " not going to send";
    __int16 v30 = 2112;
    int v28 = 138413314;
    id v29 = v12;
    if (v16 > 0.0) {
      v18 = "";
    }
    id v31 = v14;
    __int16 v32 = 2048;
    unint64_t v33 = a6;
    __int16 v34 = 2048;
    double v35 = v16;
    __int16 v36 = 2080;
    v37 = v18;
    _os_log_impl(&dword_222F4C000, v17, OS_LOG_TYPE_DEFAULT, "BLTBulletinDistributor _notifyGizmoOfCancelBulletin with publisherMatchID: %@ in universal section: %@ forFeed: %lu timeout: %f%s", (uint8_t *)&v28, 0x34u);
  }

  if (v16 > 0.0)
  {
    v19 = +[BLTBBBulletinKey bulletinKeyWithSectionID:v13 publisherMatchID:v12];
    v20 = [(BLTGizmoLegacyMap *)self->_gizmoLegacyMap gizmoPublisherBulletinIDForPhoneKey:v19];
    v21 = [(BLTGizmoLegacyMap *)self->_gizmoLegacyMap gizmoSectionInfoForPhoneKey:v19];
    uint64_t v22 = [v21 mappedSectionID];
    v23 = (void *)v22;
    if (v22) {
      v24 = (void *)v22;
    }
    else {
      v24 = v14;
    }
    id v25 = v24;

    gizmoConnection = self->_gizmoConnection;
    v27 = [NSNumber numberWithDouble:v16];
    [(BLTRemoteGizmoClient *)gizmoConnection cancelBulletinWithPublisherMatchID:v20 universalSectionID:v25 feed:a6 withTimeout:v27];
  }
}

- (void)_mapBulletin:(id)a3
{
  id v10 = a3;
  id v4 = [MEMORY[0x263F1DF08] notificationForBulletin:v10];
  sectionConfiguration = self->_sectionConfiguration;
  id v6 = [v10 sectionID];
  uint64_t v7 = [(BLTSectionConfigurationInternal *)sectionConfiguration legacyMapLocationForSectionID:v6];

  if (v7 == 1)
  {
    gizmoLegacyMap = self->_gizmoLegacyMap;
    dispatch_time_t v9 = [v10 sectionID];
    [(BLTGizmoLegacyMap *)gizmoLegacyMap mapNotification:v4 sectionID:v9];
  }
}

- (BOOL)_rememberBulletin:(id)a3 forFeed:(unint64_t)a4 syncChangesToWatch:(BOOL)a5
{
  char v6 = a4;
  id v8 = a3;
  bulletins = self->_bulletins;
  id v10 = [v8 sectionID];
  id v11 = [(NSMutableDictionary *)bulletins objectForKeyedSubscript:v10];

  if (!v11)
  {
    id v11 = [[BLTBulletinStorageSection alloc] initWithMaxContextSize:204800];
    id v12 = self->_bulletins;
    id v13 = [v8 sectionID];
    [(NSMutableDictionary *)v12 setObject:v11 forKeyedSubscript:v13];
  }
  id v14 = [(BLTBulletinStorageSection *)v11 addOrReplaceBulletin:v8];
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 1;
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  v24 = __71__BLTBulletinDistributor__rememberBulletin_forFeed_syncChangesToWatch___block_invoke;
  id v25 = &unk_264684DD8;
  id v15 = v8;
  v27 = self;
  int v28 = &v30;
  BOOL v29 = a5;
  id v26 = v15;
  [v14 enumerateObjectsUsingBlock:&v22];
  if (*((unsigned char *)v31 + 24))
  {
    -[BLTBulletinDistributor _mapBulletin:](self, "_mapBulletin:", v15, v22, v23, v24, v25);
    if ((v6 & 8) != 0)
    {
      lockScreenFeed = self->_lockScreenFeed;
      uint64_t v17 = [v15 bulletinID];
      [(NSMutableSet *)lockScreenFeed addObject:v17];
    }
    if (v6)
    {
      noticesFeed = self->_noticesFeed;
      v19 = [v15 bulletinID];
      [(NSMutableSet *)noticesFeed addObject:v19];
    }
  }
  char v20 = *((unsigned char *)v31 + 24);

  _Block_object_dispose(&v30, 8);
  return v20;
}

void __71__BLTBulletinDistributor__rememberBulletin_forFeed_syncChangesToWatch___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  double v5 = blt_notification_size_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4 == v3)
  {
    if (v6) {
      __71__BLTBulletinDistributor__rememberBulletin_forFeed_syncChangesToWatch___block_invoke_cold_1((id *)(a1 + 32));
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  else
  {
    if (v6) {
      __71__BLTBulletinDistributor__rememberBulletin_forFeed_syncChangesToWatch___block_invoke_cold_2(v3);
    }

    if (*(unsigned char *)(a1 + 56)) {
      [*(id *)(a1 + 40) _performRemoveBulletin:v3 forFeed:65023];
    }
  }
}

- (void)_postWillSendBulletinToGizmoNotificationForBulletin:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F087C8];
  id v4 = a3;
  double v5 = [v3 defaultCenter];
  id v8 = @"sectionID";
  BOOL v6 = [v4 sectionID];

  v9[0] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [v5 postNotificationName:@"BLTWillSendBulletinToGizmoNotification" object:0 userInfo:v7];
}

- (void)_attachAttachment:(id)a3 attachmentType:(int64_t)a4 toBulletin:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (v8)
  {
    [v9 setContainsUpdatedAttachment:1];
    [v10 setAttachment:v8];
    [v10 setAttachmentType:a4];
  }
  else
  {
    uint64_t v32 = self;
    id v11 = [MEMORY[0x263EFF980] array];
    id v12 = [MEMORY[0x263EFF980] array];
    if (([v10 hasAttachment] & 1) != 0 || objc_msgSend(v10, "hasAttachmentURL"))
    {
      id v13 = [v10 attachment];
      id v14 = [v10 attachmentURLURL];
      id v15 = [v10 attachmentID];
      double v16 = +[BLTHashCacheItem hashCacheItemWithData:v13 URL:v14 identifier:v15];

      [v11 addObject:v16];
      char v31 = 1;
    }
    else
    {
      char v31 = 0;
    }
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    char v33 = v10;
    uint64_t v17 = [v10 additionalAttachments];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v39 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          uint64_t v23 = [v22 uRL];

          if (v23)
          {
            v24 = [v22 attachmentURLURL];
            id v25 = [v22 identifier];
            id v26 = +[BLTHashCacheItem hashCacheItemWithData:0 URL:v24 identifier:v25];

            [v11 addObject:v26];
            [v12 addObject:v22];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v19);
    }

    id v10 = v33;
    attachmentHashCache = v32->_attachmentHashCache;
    int v28 = [v33 sectionID];
    BOOL v29 = [v33 publisherMatchID];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __70__BLTBulletinDistributor__attachAttachment_attachmentType_toBulletin___block_invoke;
    v34[3] = &unk_264684E00;
    char v37 = v31;
    id v35 = v33;
    id v36 = v12;
    id v30 = v12;
    [(BLTHashCache *)attachmentHashCache updateCacheWithItems:v11 forSectionID:v28 matchID:v29 result:v34];

    id v8 = 0;
  }
}

void __70__BLTBulletinDistributor__attachAttachment_attachmentType_toBulletin___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = blt_general_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 identifier];
    int v14 = 134218498;
    uint64_t v15 = a3;
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    __int16 v18 = 2048;
    uint64_t v19 = a4;
    _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_DEFAULT, "Attachment hash cache updated item index %lu id %@ with result %lu", (uint8_t *)&v14, 0x20u);
  }
  if (a4 == 2)
  {
    if (!a3 && *(unsigned char *)(a1 + 48)) {
      goto LABEL_14;
    }
    id v11 = objc_alloc_init(BLTPBBulletinAttachment);
    [(BLTPBBulletinAttachment *)v11 setIsUpdated:1];
    id v12 = [v7 identifier];
    [(BLTPBBulletinAttachment *)v11 setIdentifier:v12];

    [*(id *)(a1 + 32) setContainsUpdatedAttachment:1];
    [*(id *)(a1 + 32) addAdditionalAttachments:v11];
    goto LABEL_17;
  }
  uint64_t v10 = a3 - *(unsigned __int8 *)(a1 + 48);
  if (a4 == 1)
  {
    if (!a3 && *(unsigned char *)(a1 + 48))
    {
LABEL_14:
      [*(id *)(a1 + 32) setContainsUpdatedAttachment:1];
      goto LABEL_18;
    }
    id v11 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v10];
    [(BLTPBBulletinAttachment *)v11 setIsUpdated:1];
    [*(id *)(a1 + 32) setContainsUpdatedAttachment:1];
LABEL_17:

    goto LABEL_18;
  }
  if (!a4)
  {
    if (a3 || !*(unsigned char *)(a1 + 48))
    {
      id v13 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v10];
      [v13 setURL:0];
    }
    else
    {
      [*(id *)(a1 + 32) setAttachment:0];
      [*(id *)(a1 + 32) setAttachmentURL:0];
    }
  }
LABEL_18:
}

- (void)_attachIconToBulletin:(id)a3
{
  id v4 = a3;
  double v5 = [v4 icon];
  uint64_t v6 = [v5 variantsCount];

  if (v6)
  {
    id v7 = [v4 icon];
    id v8 = [v7 variantAtIndex:0];

    id v9 = [MEMORY[0x263EFF980] array];
    uint64_t v10 = [v8 imageData];
    id v11 = +[BLTHashCacheItem hashCacheItemWithData:v10 URL:0 identifier:0];

    [v9 addObject:v11];
  }
  else
  {
    id v9 = 0;
  }
  iconHashCache = self->_iconHashCache;
  id v13 = [v4 sectionID];
  int v14 = [v4 publisherMatchID];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __48__BLTBulletinDistributor__attachIconToBulletin___block_invoke;
  v16[3] = &unk_264684E28;
  id v17 = v4;
  id v15 = v4;
  [(BLTHashCache *)iconHashCache updateCacheWithItems:v9 forSectionID:v13 matchID:v14 result:v16];
}

void __48__BLTBulletinDistributor__attachIconToBulletin___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v7 = blt_general_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218240;
    uint64_t v9 = a3;
    __int16 v10 = 2048;
    uint64_t v11 = a4;
    _os_log_impl(&dword_222F4C000, v7, OS_LOG_TYPE_DEFAULT, "Icon hash cache updated item index %lu with result %lu", (uint8_t *)&v8, 0x16u);
  }

  if ((unint64_t)(a4 - 1) >= 2)
  {
    if (!a4) {
      [*(id *)(a1 + 32) setIcon:0];
    }
  }
  else
  {
    [*(id *)(a1 + 32) setContainsUpdateIcon:1];
  }
}

- (void)_handleAddBulletin:(id)a3 feed:(unint64_t)a4 shouldPlayLightsAndSirens:(BOOL)a5 performedWithSuccess:(BOOL)a6 sendAttemptTime:(id)a7 connectionStatus:(unint64_t)a8 isGizmoReady:(BOOL)a9 shouldSendReplyIfNeeded:(BOOL)a10 replyToken:(id)a11
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a11;
  id v17 = blt_general_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    if (v11) {
      __int16 v18 = "Successfully notified";
    }
    else {
      __int16 v18 = "Failed to notify";
    }
    uint64_t v19 = [v15 publisherMatchID];
    uint64_t v20 = (void *)v19;
    v21 = "NO";
    *(_DWORD *)int v28 = 136315906;
    *(void *)&v28[4] = v18;
    *(_WORD *)&v28[12] = 2112;
    if (v12) {
      v21 = "YES";
    }
    *(void *)&v28[14] = v19;
    __int16 v29 = 2048;
    unint64_t v30 = a4;
    __int16 v31 = 2080;
    uint64_t v32 = v21;
    _os_log_impl(&dword_222F4C000, v17, OS_LOG_TYPE_DEFAULT, "%s gizmo of bulletin with publisherMatchID: %@ forFeed: %lu playLightsAndSirens: %s", v28, 0x2Au);
  }
  if (!v11)
  {
    if (a10)
    {
      uint64_t v22 = [v15 publisherMatchID];
      uint64_t v23 = [v15 sectionID];
      [(BLTBulletinDistributor *)self _handleDidPlayLightsAndSirens:0 forBulletin:v22 inPhoneSection:v23 finalReply:1 replyToken:v16];
    }
    v24 = objc_msgSend(v15, "publisherMatchID", *(_OWORD *)v28);
    id v25 = [v15 sectionID];
    id v26 = [v15 sectionMatchID];
    v27 = [v15 dateOrRecencyDate];
    [(BLTBulletinDistributor *)self _notifyGizmoOfCancelBulletin:v24 sectionID:v25 universalSectionID:v26 feed:a4 withBulletinDate:v27];
  }
}

- (void)_sendPBBulletin:(id)a3 forBulletin:(id)a4 feed:(unint64_t)a5 updateType:(unint64_t)a6 playLightsAndSirens:(BOOL)a7 shouldSendReplyIfNeeded:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v29 = a7;
  id v12 = a3;
  id v13 = a4;
  int v14 = [(BLTRemoteObject *)self->_gizmoConnection connectionStatus];
  if (v14 != (void *)1)
  {
    id v15 = blt_general_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_222F4C000, v15, OS_LOG_TYPE_DEFAULT, "Not locally connected to gizmo. Replying to local bulletin board immediately.", (uint8_t *)buf, 2u);
    }

    if (v8)
    {
      id v16 = [v13 publisherMatchID];
      id v17 = [v13 sectionID];
      __int16 v18 = [v12 replyToken];
      [(BLTBulletinDistributor *)self _handleDidPlayLightsAndSirens:0 forBulletin:v16 inPhoneSection:v17 finalReply:0 replyToken:v18];
    }
  }
  BOOL v27 = v8;
  BOOL v26 = [(BLTRemoteObject *)self->_gizmoConnection isPairedDeviceReady];
  uint64_t v19 = [NSNumber numberWithInteger:BLTGetPlayLightsAndSirensTimeout(v14 == (void *)1)];
  uint64_t v20 = [MEMORY[0x263EFF910] date];
  objc_initWeak(buf, self);
  v21 = [v12 replyToken];
  gizmoConnection = self->_gizmoConnection;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __114__BLTBulletinDistributor__sendPBBulletin_forBulletin_feed_updateType_playLightsAndSirens_shouldSendReplyIfNeeded___block_invoke;
  v30[3] = &unk_264684E50;
  objc_copyWeak(v34, buf);
  id v23 = v13;
  id v31 = v23;
  v34[1] = (id)a5;
  BOOL v35 = v29;
  id v24 = v20;
  id v32 = v24;
  v34[2] = v14;
  BOOL v36 = v26;
  BOOL v37 = v27;
  id v25 = v21;
  id v33 = v25;
  [(BLTRemoteGizmoClient *)gizmoConnection addBulletin:v12 playLightsAndSirens:v29 updateType:a6 withTimeout:v19 completion:v30];

  objc_destroyWeak(v34);
  objc_destroyWeak(buf);
}

void __114__BLTBulletinDistributor__sendPBBulletin_forBulletin_feed_updateType_playLightsAndSirens_shouldSendReplyIfNeeded___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  LOWORD(v4) = *(_WORD *)(a1 + 81);
  objc_msgSend(WeakRetained, "_handleAddBulletin:feed:shouldPlayLightsAndSirens:performedWithSuccess:sendAttemptTime:connectionStatus:isGizmoReady:shouldSendReplyIfNeeded:replyToken:", *(void *)(a1 + 32), *(void *)(a1 + 64), *(unsigned __int8 *)(a1 + 80), a2, *(void *)(a1 + 40), *(void *)(a1 + 72), v4, *(void *)(a1 + 48));
}

- (BOOL)_notifyGizmoOfBulletin:(id)a3 forFeed:(unint64_t)a4 updateType:(unint64_t)a5 playLightsAndSirens:(BOOL)a6 shouldSendReplyIfNeeded:(BOOL)a7 attachment:(id)a8 attachmentType:(int64_t)a9 replyToken:(id)a10
{
  BOOL v12 = a6;
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a8;
  id v75 = a10;
  __int16 v18 = blt_general_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = [v16 publisherMatchID];
    uint64_t v20 = "NO";
    *(_DWORD *)buf = 138412802;
    v86 = v19;
    if (v12) {
      uint64_t v20 = "YES";
    }
    __int16 v87 = 2048;
    unint64_t v88 = a4;
    __int16 v89 = 2080;
    v90 = v20;
    _os_log_impl(&dword_222F4C000, v18, OS_LOG_TYPE_DEFAULT, "BLTBulletinDistributor _notifyGizmoOfBulletin with publisherMatchID: %@ forFeed: %lu playLightsAndSirens: %s", buf, 0x20u);
  }
  BOOL v21 = [(BLTBulletinDistributor *)self _rememberBulletin:v16 forFeed:a4 syncChangesToWatch:1];
  BOOL v22 = v21;
  if (v21)
  {
    BOOL v69 = a7;
    BOOL v71 = v21;
    v72 = v17;
    [(BLTBulletinDistributor *)self _postWillSendBulletinToGizmoNotificationForBulletin:v16];
    v66 = [v16 bulletinID];
    -[NSMutableSet addObject:](self->_bulletinIDsWaitingOnGizmoAdd, "addObject:");
    watchKitAppList = self->_watchKitAppList;
    id v24 = [v16 sectionID];
    v74 = [(BLTWatchKitAppList *)watchKitAppList watchKitAppDefinitionWithBundleID:v24];

    id v25 = (void *)MEMORY[0x263F01868];
    BOOL v26 = [v16 sectionID];
    v73 = [v25 applicationProxyForIdentifier:v26];

    BOOL v27 = [v16 sectionID];
    int v28 = [v16 publisherMatchID];
    uint64_t v29 = +[BLTBBBulletinKey bulletinKeyWithSectionID:v27 publisherMatchID:v28];

    unint64_t v30 = (void *)v29;
    id v31 = [(BLTGizmoLegacyMap *)self->_gizmoLegacyMap gizmoSectionInfoForPhoneKey:v29];
    id v32 = [v31 mappedSectionID];
    id v33 = v32;
    unint64_t v67 = a4;
    if (v32)
    {
      id v34 = v32;
    }
    else
    {
      id v34 = [v16 sectionID];
    }
    id v36 = v34;

    v64 = [(BLTSettingSync *)self->_settingSync universalSectionIDForSectionID:v36];
    [(BLTRemoteGizmoClient *)self->_gizmoConnection queuePendingRequests];
    sectionConfiguration = self->_sectionConfiguration;
    long long v38 = [v16 sectionID];
    long long v39 = [(BLTSectionConfigurationInternal *)sectionConfiguration watchVersionThatUsesUserInfoForContextForSectionID:v38];

    v65 = v36;
    if (v39) {
      int v63 = objc_msgSend(MEMORY[0x263F57700], "activePairedDeviceSupportIsGreaterEqualVersion:", objc_msgSend(v39, "unsignedIntegerValue")) ^ 1;
    }
    else {
      LOBYTE(v63) = 0;
    }
    long long v40 = self->_sectionConfiguration;
    long long v41 = [v16 sectionID];
    int v62 = ![(BLTSectionConfigurationInternal *)v40 hasSectionIDOptedOutOfSubtitleRemovalForOlderWatches:v41];

    v42 = self->_sectionConfiguration;
    uint64_t v43 = [v16 sectionID];
    BOOL v61 = [(BLTSectionConfigurationInternal *)v42 shouldUsePhoneExpirationDateForSectionID:v43];

    v44 = self->_sectionConfiguration;
    v45 = [v16 sectionID];
    v46 = [(BLTSectionConfigurationInternal *)v44 watchVersionThatUsesAttachmentURLForSectionID:v45];

    v47 = self->_sectionConfiguration;
    v48 = [v16 sectionID];
    BOOL v49 = [(BLTSectionConfigurationInternal *)v47 hasSectionIDOptedOutOfAttachmentCoordination:v48];

    unint64_t v68 = a5;
    if (v46) {
      uint64_t v50 = objc_msgSend(MEMORY[0x263F57700], "activePairedDeviceSupportIsGreaterEqualVersion:", objc_msgSend(v46, "unsignedIntegerValue")) ^ 1;
    }
    else {
      uint64_t v50 = 0;
    }
    if (v49) {
      uint64_t v50 = 2;
    }
    uint64_t v57 = v50;
    v59 = [v74 watchKitAppBundleID];
    bbObserver = self->_bbObserver;
    v58 = [v73 teamID];
    v51 = [(BLTGizmoLegacyMap *)self->_gizmoLegacyMap gizmoPublisherBulletinIDForPhoneKey:v30];
    v52 = [(BLTGizmoLegacyMap *)self->_gizmoLegacyMap categoryIDForBulletinKey:v30];
    id v53 = [(BLTGizmoLegacyMap *)self->_gizmoLegacyMap sectionSubtypeForBulletinKey:v30];
    v76[0] = MEMORY[0x263EF8330];
    v76[1] = 3221225472;
    v76[2] = __149__BLTBulletinDistributor__notifyGizmoOfBulletin_forFeed_updateType_playLightsAndSirens_shouldSendReplyIfNeeded_attachment_attachmentType_replyToken___block_invoke;
    v76[3] = &unk_264684E78;
    v76[4] = self;
    id v17 = v72;
    id v77 = v72;
    int64_t v80 = a9;
    unint64_t v81 = v67;
    unint64_t v82 = v68;
    BOOL v83 = v12;
    BOOL v84 = v69;
    id v78 = v16;
    id v79 = v66;
    id v70 = v66;
    BYTE1(v56) = v62;
    LOBYTE(v56) = v63;
    LOBYTE(v55) = v61;
    +[BLTPBBulletin bulletinWithBBBulletin:sockPuppetAppBundleID:observer:feed:teamID:universalSectionID:shouldUseExpirationDate:replyToken:gizmoLegacyPublisherBulletinID:gizmoLegacyCategoryID:gizmoSectionID:gizmoSectionSubtype:useUserInfoForContext:removeSubtitleForOlderWatches:attachOption:completion:](BLTPBBulletin, "bulletinWithBBBulletin:sockPuppetAppBundleID:observer:feed:teamID:universalSectionID:shouldUseExpirationDate:replyToken:gizmoLegacyPublisherBulletinID:gizmoLegacyCategoryID:gizmoSectionID:gizmoSectionSubtype:useUserInfoForContext:removeSubtitleForOlderWatches:attachOption:completion:", v78, v59, bbObserver, v67, v58, v64, v55, v75, v51, v52, v65, v53, v56, v57, v76);

    BOOL v35 = v74;
    BOOL v22 = v71;
  }
  else
  {
    BOOL v35 = blt_notification_size_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[BLTBulletinDistributor _notifyGizmoOfBulletin:forFeed:updateType:playLightsAndSirens:shouldSendReplyIfNeeded:attachment:attachmentType:replyToken:](v16);
    }
  }

  return v22;
}

uint64_t __149__BLTBulletinDistributor__notifyGizmoOfBulletin_forFeed_updateType_playLightsAndSirens_shouldSendReplyIfNeeded_attachment_attachmentType_replyToken___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 64);
  id v6 = a2;
  [v3 _attachAttachment:v4 attachmentType:v5 toBulletin:v6];
  [*(id *)(a1 + 32) _attachIconToBulletin:v6];
  [*(id *)(a1 + 32) _sendPBBulletin:v6 forBulletin:*(void *)(a1 + 48) feed:*(void *)(a1 + 72) updateType:*(void *)(a1 + 80) playLightsAndSirens:*(unsigned __int8 *)(a1 + 88) shouldSendReplyIfNeeded:*(unsigned __int8 *)(a1 + 89)];

  [*(id *)(a1 + 32) _performNextPendingBulletinUpdateForBulletinID:*(void *)(a1 + 56)];
  id v7 = *(void **)(*(void *)(a1 + 32) + 120);
  uint64_t v8 = *(void *)(a1 + 56);
  return [v7 removeObject:v8];
}

- (id)_bulletinWithPublisherBulletinID:(id)a3 recordID:(id)a4 sectionID:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v12)
  {
    id v16 = 0;
    goto LABEL_30;
  }
  id v13 = [(NSMutableDictionary *)self->_bulletins objectForKeyedSubscript:v12];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = [v13 bulletins];
  uint64_t v27 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v27)
  {
    id v16 = 0;
    goto LABEL_29;
  }
  uint64_t v14 = *(void *)v29;
  id v24 = v12;
  uint64_t v25 = *(void *)v29;
  id v23 = v13;
  while (2)
  {
    for (uint64_t i = 0; i != v27; ++i)
    {
      if (*(void *)v29 != v14) {
        objc_enumerationMutation(obj);
      }
      id v16 = [*(id *)(*((void *)&v28 + 1) + 8 * i) bulletin];
      id v17 = [v16 publisherBulletinID];
      int v18 = [v17 isEqualToString:v10];
      char v19 = v18;
      if (v18)
      {
        uint64_t v5 = [v16 recordID];
        if ([v5 isEqualToString:v11]) {
          goto LABEL_26;
        }
      }
      if (v11)
      {
        if (v10)
        {
          char v20 = 0;
          goto LABEL_17;
        }
LABEL_15:
        BOOL v21 = [v16 recordID];
        char v20 = [v21 isEqualToString:v11];

        uint64_t v14 = v25;
        if (v11) {
          goto LABEL_17;
        }
        goto LABEL_16;
      }
      id v6 = [v16 publisherBulletinID];
      if ([v6 isEqualToString:v10])
      {

        if (v19) {
LABEL_26:
        }

LABEL_28:
        id v13 = v23;
        id v12 = v24;
        goto LABEL_29;
      }
      if (!v10) {
        goto LABEL_15;
      }
      char v20 = 0;
LABEL_16:

LABEL_17:
      if (v19) {

      }
      if (v20) {
        goto LABEL_28;
      }
    }
    id v16 = 0;
    id v13 = v23;
    id v12 = v24;
    uint64_t v27 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v27) {
      continue;
    }
    break;
  }
LABEL_29:

LABEL_30:
  return v16;
}

- (BOOL)_willNanoPresent:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFE7FLL) == 0;
}

- (unint64_t)_nanoPresentableFeedFromPhoneFeed:(unint64_t)a3
{
  if ((a3 & 0x817E) == 0x10) {
    return a3 | 4;
  }
  else {
    return a3;
  }
}

- (BOOL)_willNanoPresent:(unint64_t)a3 forBulletin:(id)a4 feed:(unint64_t)a5
{
  __int16 v5 = a5;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a4;
  uint64_t v9 = v8;
  if ((v5 & 0x817E) != 0x10) {
    goto LABEL_6;
  }
  id v10 = [v8 message];
  uint64_t v11 = [MEMORY[0x263EFF9D0] null];
  if (v10 == (void *)v11)
  {
    char v14 = [v9 isLoading];

    if (v14) {
      goto LABEL_6;
    }
  }
  else
  {
    id v12 = (void *)v11;
    id v13 = [v9 message];
    if ([v13 length])
    {

LABEL_6:
      char v15 = 1;
      goto LABEL_7;
    }
    char v18 = [v9 isLoading];

    if (v18) {
      goto LABEL_6;
    }
  }
  char v19 = blt_general_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    char v20 = [v9 bulletinID];
    int v21 = 138412290;
    BOOL v22 = v20;
    _os_log_impl(&dword_222F4C000, v19, OS_LOG_TYPE_DEFAULT, "Bulletin with id: %@ has no message and was sent to sounds feed only. Should not coordinate", (uint8_t *)&v21, 0xCu);
  }
  char v15 = 0;
LABEL_7:
  BOOL v16 = [(BLTBulletinDistributor *)self _willNanoPresent:a3];

  return v15 & v16;
}

- (void)_reloadBulletinsWithCompletion:(id)a3
{
  id v4 = a3;
  __int16 v5 = [(BLTBulletinDistributor *)self _obsoletionDateRelativeToNow];
  bbObserver = self->_bbObserver;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__BLTBulletinDistributor__reloadBulletinsWithCompletion___block_invoke;
  v8[3] = &unk_264684F18;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(BBObserver *)bbObserver getPublisherMatchIDsOfBulletinsPublishedAfterDate:v5 withCompletion:v8];
}

void __57__BLTBulletinDistributor__reloadBulletinsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__BLTBulletinDistributor__reloadBulletinsWithCompletion___block_invoke_2;
  v7[3] = &unk_264684EF0;
  uint64_t v8 = *(void *)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__BLTBulletinDistributor__reloadBulletinsWithCompletion___block_invoke_5;
  v5[3] = &unk_264684118;
  v5[4] = v8;
  id v6 = *(id *)(a1 + 40);
  id v4 = +[BLTBulletinFetcher batchBulletinFetchForBulletinIDs:a2 fetcher:v7 completion:v5];
  [*(id *)(a1 + 32) setBulletinFetcher:v4];
}

void __57__BLTBulletinDistributor__reloadBulletinsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 40);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __57__BLTBulletinDistributor__reloadBulletinsWithCompletion___block_invoke_3;
  v11[3] = &unk_264684EC8;
  v11[4] = v8;
  id v12 = v7;
  id v10 = v7;
  [v9 getBulletinsForPublisherMatchIDs:a2 sectionID:a3 withCompletion:v11];
}

uint64_t __57__BLTBulletinDistributor__reloadBulletinsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__BLTBulletinDistributor__reloadBulletinsWithCompletion___block_invoke_4;
  v4[3] = &unk_264684EA0;
  v4[4] = *(void *)(a1 + 32);
  [a2 enumerateObjectsUsingBlock:v4];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __57__BLTBulletinDistributor__reloadBulletinsWithCompletion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _rememberBulletin:a2 forFeed:0 syncChangesToWatch:0];
}

uint64_t __57__BLTBulletinDistributor__reloadBulletinsWithCompletion___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setBulletinFetcher:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (id)_obsoletionDateRelativeToNow
{
  id v2 = [MEMORY[0x263EFF910] date];
  id v3 = [v2 dateByAddingTimeInterval:-86400.0];

  return v3;
}

- (void)_sendCurrentBulletinIdentifiers
{
  id v3 = objc_alloc_init(BLTPBFullBulletinList);
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  bulletins = self->_bulletins;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__BLTBulletinDistributor__sendCurrentBulletinIdentifiers__block_invoke;
  v10[3] = &unk_264684F68;
  v10[4] = self;
  id v11 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)bulletins enumerateKeysAndObjectsUsingBlock:v10];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__BLTBulletinDistributor__sendCurrentBulletinIdentifiers__block_invoke_3;
  v8[3] = &unk_264684FB8;
  id v9 = v3;
  id v7 = v3;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];
  [(BLTRemoteGizmoClient *)self->_gizmoConnection updateBulletinList:v7];
}

void __57__BLTBulletinDistributor__sendCurrentBulletinIdentifiers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 bulletins];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __57__BLTBulletinDistributor__sendCurrentBulletinIdentifiers__block_invoke_2;
  v6[3] = &unk_264684F40;
  __int16 v5 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v4 enumerateObjectsUsingBlock:v6];
}

void __57__BLTBulletinDistributor__sendCurrentBulletinIdentifiers__block_invoke_2(uint64_t a1, void *a2)
{
  id v15 = [a2 bulletin];
  id v3 = [v15 sectionID];
  id v4 = [v15 publisherMatchID];
  __int16 v5 = +[BLTBBBulletinKey bulletinKeyWithSectionID:v3 publisherMatchID:v4];

  id v6 = [*(id *)(*(void *)(a1 + 32) + 160) gizmoSectionInfoForPhoneKey:v5];
  id v7 = [v6 mappedSectionID];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v15 sectionID];
  }
  id v10 = v9;

  id v11 = [*(id *)(a1 + 40) objectForKeyedSubscript:v10];
  if (!v11)
  {
    id v11 = [MEMORY[0x263EFF980] array];
    [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:v10];
  }
  id v12 = objc_alloc_init(BLTPBBulletinIdentifier);
  id v13 = [v15 recordID];
  [(BLTPBBulletinIdentifier *)v12 setRecordID:v13];

  char v14 = [*(id *)(*(void *)(a1 + 32) + 160) gizmoPublisherBulletinIDForPhoneKey:v5];
  [(BLTPBBulletinIdentifier *)v12 setPublisherBulletinID:v14];

  [v11 addObject:v12];
}

void __57__BLTBulletinDistributor__sendCurrentBulletinIdentifiers__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = objc_alloc_init(BLTPBSectionBulletinList);
  [(BLTPBSectionBulletinList *)v7 setSectionID:v6];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __57__BLTBulletinDistributor__sendCurrentBulletinIdentifiers__block_invoke_4;
  v9[3] = &unk_264684F90;
  id v10 = v7;
  uint64_t v8 = v7;
  [v5 enumerateObjectsUsingBlock:v9];

  [*(id *)(a1 + 32) addSectionBulletinList:v8];
}

uint64_t __57__BLTBulletinDistributor__sendCurrentBulletinIdentifiers__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addBulletinIdentifier:a2];
}

- (void)_performNextPendingBulletinUpdateForBulletinID:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_pendingBulletinUpdatesLock);
  id v5 = [(NSMutableDictionary *)self->_pendingBulletinUpdates objectForKeyedSubscript:v4];
  os_unfair_lock_unlock(&self->_pendingBulletinUpdatesLock);
  if ([v5 count])
  {
    id v6 = [v5 objectAtIndexedSubscript:0];
    [v5 removeObjectAtIndex:0];
    id v7 = blt_general_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v6 updateType];
      id v9 = @"remove";
      if (v8 != 1) {
        id v9 = 0;
      }
      if (!v8) {
        id v9 = @"modify";
      }
      id v10 = v9;
      int v14 = 138412546;
      id v15 = v10;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl(&dword_222F4C000, v7, OS_LOG_TYPE_DEFAULT, "Performing pending update type %@ for %@", (uint8_t *)&v14, 0x16u);
    }
    uint64_t v11 = [v6 updateType];
    if (v11 == 1)
    {
      id v13 = [v6 bulletin];
      -[BLTBulletinDistributor _performRemoveBulletin:forFeed:](self, "_performRemoveBulletin:forFeed:", v13, [v6 feed]);

      [(BLTBulletinDistributor *)self _performNextPendingBulletinUpdateForBulletinID:v4];
    }
    else if (!v11)
    {
      id v12 = [v6 bulletin];
      -[BLTBulletinDistributor _performModifyBulletin:forFeed:](self, "_performModifyBulletin:forFeed:", v12, [v6 feed]);
    }
  }
}

- (BOOL)_enqueuBulletinUpdate:(unint64_t)a3 bulletin:(id)a4 feed:(unint64_t)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = [v8 bulletinID];
  int v10 = [(NSMutableSet *)self->_bulletinIDsWaitingOnGizmoAdd containsObject:v9];
  if (v10)
  {
    os_unfair_lock_lock(&self->_pendingBulletinUpdatesLock);
    uint64_t v11 = [(NSMutableDictionary *)self->_pendingBulletinUpdates objectForKeyedSubscript:v9];
    os_unfair_lock_unlock(&self->_pendingBulletinUpdatesLock);
    if (!v11)
    {
      uint64_t v11 = [MEMORY[0x263EFF980] array];
      os_unfair_lock_lock(&self->_pendingBulletinUpdatesLock);
      [(NSMutableDictionary *)self->_pendingBulletinUpdates setObject:v11 forKeyedSubscript:v9];
      os_unfair_lock_unlock(&self->_pendingBulletinUpdatesLock);
    }
    id v12 = blt_general_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = @"remove";
      if (a3 != 1) {
        id v13 = 0;
      }
      if (!a3) {
        id v13 = @"modify";
      }
      int v14 = v13;
      int v17 = 138412802;
      uint64_t v18 = v14;
      __int16 v19 = 2112;
      id v20 = v8;
      __int16 v21 = 2048;
      unint64_t v22 = a5;
      _os_log_impl(&dword_222F4C000, v12, OS_LOG_TYPE_DEFAULT, "Enqueuing bulletin update: %@ for bulletin: %@ feed: %lu", (uint8_t *)&v17, 0x20u);
    }
    id v15 = +[BLTBulletinDistributorBulletinUpdate bulletinUpdateWithType:a3 bulletin:v8 feed:a5];
    [v11 addObject:v15];
  }
  return v10;
}

- (void)_removeTranscodedAttachmentIfNeededForBulletin:(id)a3
{
  id v3 = a3;
  id v4 = [v3 bulletinID];

  if (v4)
  {
    id v5 = BLTBulletinAttachmentsURL(v3);
    if (v5)
    {
      id v6 = [MEMORY[0x263F08850] defaultManager];
      id v10 = 0;
      char v7 = [v6 removeItemAtURL:v5 error:&v10];
      id v8 = v10;

      if ((v7 & 1) == 0)
      {
        id v9 = blt_general_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          [(BLTBulletinDistributor *)(uint64_t)v5 _removeTranscodedAttachmentIfNeededForBulletin:v9];
        }
      }
    }
  }
}

- (void)_cleanupForAddedBulletin:(id)a3
{
  id v4 = a3;
  [(BLTBulletinDistributor *)self _removeTranscodedAttachmentIfNeededForBulletin:v4];
  id v7 = [MEMORY[0x263F1DF08] notificationForBulletin:v4];
  gizmoLegacyMap = self->_gizmoLegacyMap;
  id v6 = [v4 sectionID];

  [(BLTGizmoLegacyMap *)gizmoLegacyMap unmapNotification:v7 sectionID:v6];
}

+ (id)stringForSettingsWillPresentBlockedBy:(unint64_t)a3
{
  return _stringForSettingsWillPresentBlockedBy(a3);
}

- (void)setReplyBlock:(id)a3 forSection:(id)a4 bulletin:(id)a5 publicationDate:(id)a6 replyToken:(id)a7
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  id v14 = a6;
  id v15 = a3;
  __int16 v16 = blt_general_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412546;
    id v20 = v11;
    __int16 v21 = 2112;
    id v22 = v12;
    _os_log_impl(&dword_222F4C000, v16, OS_LOG_TYPE_DEFAULT, "BLTBulletinDistributor setReplyBlock: forSection: %@ bulletin: %@", (uint8_t *)&v19, 0x16u);
  }

  int v17 = +[BLTLightsAndSirensReplyInfoCache sharedReplyCache];
  [v17 cacheReply:v15 withSectionID:v11 bulletinID:v12 publicationDate:v14 replyToken:v13];

  uint64_t v18 = blt_general_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v19) = 0;
    _os_log_impl(&dword_222F4C000, v18, OS_LOG_TYPE_DEFAULT, "BLTBulletinDistributor saved new reply", (uint8_t *)&v19, 2u);
  }
}

- (void)clearReplyBlockForReplyToken:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = blt_general_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_222F4C000, v4, OS_LOG_TYPE_DEFAULT, "BLTBulletinDistributor clearReplyBlockForReplyToken: %@", (uint8_t *)&v8, 0xCu);
  }

  id v5 = +[BLTLightsAndSirensReplyInfoCache sharedReplyCache];
  id v6 = [v5 cacheDidPlayLightsAndSirens:0 withReplyToken:v3];

  id v7 = +[BLTLightsAndSirensReplyInfoCache sharedReplyCache];
  [v7 purgeReplyInfo:v6 withReplyToken:v3];
}

- (void)observer:(id)a3 addBulletin:(id)a4 forFeed:(unint64_t)a5 playLightsAndSirens:(BOOL)a6 withReply:(id)a7
{
  LOBYTE(v7) = 0;
  [(BLTBulletinDistributor *)self observer:a3 addBulletin:a4 forFeed:a5 playLightsAndSirens:a6 attachment:0 attachmentType:0 alwaysSend:v7 withReply:a7];
}

- (id)_replyTokenForSectionID:(id)a3 publisherMatchID:(id)a4
{
  id v4 = +[BLTBBBulletinKey bulletinKeyWithSectionID:a3 publisherMatchID:a4];
  id v5 = [v4 keyString];

  return v5;
}

- (void)_subscriberWillAllowBulletin:(id)a3 completion:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x3032000000;
  long long v30 = __Block_byref_object_copy__6;
  long long v31 = __Block_byref_object_dispose__6;
  id v32 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  char v26 = 0;
  int v8 = blt_general_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:8.0];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_DEFAULT, "BLTBulletinDistributor _subscriberWillAllowBulletin with timeout %@", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v10 = [(BLTBulletinDistributor *)self clientReplyTimeoutManager];
  id v11 = [v6 publisherMatchID];
  id v12 = [v6 sectionID];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __66__BLTBulletinDistributor__subscriberWillAllowBulletin_completion___block_invoke;
  v22[3] = &unk_264684FE0;
  id v24 = v25;
  id v13 = v7;
  id v23 = v13;
  uint64_t v14 = [v10 addClientReplyTimeoutForBulletin:v11 sectionID:v12 timeout:v22 handler:8.0];
  id v15 = (void *)v28[5];
  v28[5] = v14;

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __66__BLTBulletinDistributor__subscriberWillAllowBulletin_completion___block_invoke_172;
  v17[3] = &unk_264685030;
  p_long long buf = &buf;
  id v20 = v25;
  v17[4] = self;
  __int16 v21 = &v27;
  id v16 = v13;
  id v18 = v16;
  [(BLTBulletinDistributor *)self _pingSubscriberWithBulletin:v6 ack:v17];

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);
}

uint64_t __66__BLTBulletinDistributor__subscriberWillAllowBulletin_completion___block_invoke(uint64_t a1)
{
  id v2 = blt_general_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_222F4C000, v2, OS_LOG_TYPE_DEFAULT, "BLTBulletinDistributor _subscriberWillAllowBulletin timed out waiting for subscriber, returning allow bulletin", v4, 2u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66__BLTBulletinDistributor__subscriberWillAllowBulletin_completion___block_invoke_172(uint64_t a1, uint64_t a2)
{
  id v4 = BLTWorkQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__BLTBulletinDistributor__subscriberWillAllowBulletin_completion___block_invoke_2;
  block[3] = &unk_264685008;
  uint64_t v10 = a2;
  block[4] = *(void *)(a1 + 32);
  long long v9 = *(_OWORD *)(a1 + 56);
  long long v6 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v6;
  long long v8 = v6;
  dispatch_async(v4, block);
}

void __66__BLTBulletinDistributor__subscriberWillAllowBulletin_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = blt_general_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_222F4C000, v2, OS_LOG_TYPE_DEFAULT, "BLTBulletinDistributor _subscriberWillAllowBulletin received ack from subscriber", (uint8_t *)&v7, 2u);
  }

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v3 = blt_general_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_222F4C000, v3, OS_LOG_TYPE_INFO, "BLTBulletinDistributor _subscriberWillAllowBulletin this is first ack", (uint8_t *)&v7, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      id v4 = blt_general_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 72)];
        int v7 = 138412290;
        long long v8 = v5;
        _os_log_impl(&dword_222F4C000, v4, OS_LOG_TYPE_DEFAULT, "BLTBulletinDistributor _subscriberWillAllowBulletin not timed out, returning %@", (uint8_t *)&v7, 0xCu);
      }
      long long v6 = [*(id *)(a1 + 32) clientReplyTimeoutManager];
      [v6 invalidateClientReplyTimeout:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

      (*(void (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 72) == 1);
    }
  }
}

- (void)observer:(id)a3 addBulletin:(id)a4 forFeed:(unint64_t)a5 playLightsAndSirens:(BOOL)a6 attachment:(id)a7 attachmentType:(int64_t)a8 alwaysSend:(BOOL)a9 withReply:(id)a10
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v43 = a3;
  id v16 = a4;
  id v44 = a7;
  id v17 = a10;
  id v18 = [v16 sectionID];

  if (v18)
  {
    mruCacheOfSectionIDs = self->_mruCacheOfSectionIDs;
    id v20 = [v16 sectionID];
    [(BLTSimpleCache *)mruCacheOfSectionIDs cacheObject:v20];

    kdebug_trace();
    v59[0] = MEMORY[0x263EF8330];
    v59[1] = 3221225472;
    v59[2] = __122__BLTBulletinDistributor_observer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_withReply___block_invoke;
    v59[3] = &unk_264685080;
    BOOL v65 = a9;
    v59[4] = self;
    id v21 = v16;
    id v60 = v21;
    unint64_t v63 = a5;
    BOOL v66 = a6;
    id v62 = v17;
    id v61 = v44;
    int64_t v64 = a8;
    id v22 = (void (**)(void))MEMORY[0x223CAC810](v59);
    [(BLTBulletinDistributor *)self _mapBulletin:v21];
    if (a9)
    {
      v22[2](v22);
    }
    else
    {
      id v24 = [v21 sectionID];
      uint64_t v25 = [v21 publisherMatchID];
      v42 = +[BLTBBBulletinKey bulletinKeyWithSectionID:v24 publisherMatchID:v25];

      char v26 = [(BLTGizmoLegacyMap *)self->_gizmoLegacyMap gizmoSectionInfoForPhoneKey:v42];
      uint64_t v27 = [v21 icon];
      [v26 setIcon:v27];

      long long v28 = [v21 sectionDisplayName];
      [v26 setDisplayName:v28];

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v68 = 0x3032000000;
      BOOL v69 = __Block_byref_object_copy__6;
      id v70 = __Block_byref_object_dispose__6;
      id v71 = 0;
      uint64_t v55 = 0;
      uint64_t v56 = &v55;
      uint64_t v57 = 0x2020000000;
      char v58 = 0;
      uint64_t v29 = [(BLTBulletinDistributor *)self clientReplyTimeoutManager];
      long long v30 = [v21 publisherMatchID];
      long long v31 = [v21 sectionID];
      double v32 = BLTGetSettingSyncForNotificationTimeout();
      v52[0] = MEMORY[0x263EF8330];
      v52[1] = 3221225472;
      v52[2] = __122__BLTBulletinDistributor_observer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_withReply___block_invoke_2;
      v52[3] = &unk_264684FE0;
      objc_super v54 = &v55;
      uint64_t v33 = v22;
      id v53 = v33;
      uint64_t v34 = [v29 addClientReplyTimeoutForBulletin:v30 sectionID:v31 timeout:v52 handler:v32];
      char v35 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v34;

      v48[0] = MEMORY[0x263EF8330];
      v48[1] = 3221225472;
      v48[2] = __122__BLTBulletinDistributor_observer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_withReply___block_invoke_188;
      v48[3] = &unk_2646850A8;
      uint64_t v50 = &v55;
      v48[4] = self;
      p_long long buf = &buf;
      BOOL v49 = v33;
      uint64_t v36 = (void *)MEMORY[0x223CAC810](v48);
      settingSync = self->_settingSync;
      long long v38 = [v21 sectionID];
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __122__BLTBulletinDistributor_observer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_withReply___block_invoke_2_189;
      v45[3] = &unk_264684FE0;
      v47 = &v55;
      long long v39 = v36;
      id v46 = v39;
      uint64_t v40 = [(BLTSettingSync *)settingSync performSyncIfNeededForSectionID:v38 gizmoSectionInfo:v26 completion:v45];

      if (v40 == 2 && !*((unsigned char *)v56 + 24))
      {
        long long v41 = blt_general_log();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
          -[BLTBulletinDistributor observer:addBulletin:forFeed:playLightsAndSirens:attachment:attachmentType:alwaysSend:withReply:]();
        }

        v39[2](v39);
      }

      _Block_object_dispose(&v55, 8);
      _Block_object_dispose(&buf, 8);
    }
  }
  else
  {
    id v23 = blt_general_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v16;
      _os_log_impl(&dword_222F4C000, v23, OS_LOG_TYPE_ERROR, "Serious error adding bulletin: bulletin has no section ID.  Dropping bulletin.\n%@", (uint8_t *)&buf, 0xCu);
    }

    _BLTCaptureBug(@"BBAddBulletinSectionNil");
  }
}

void __122__BLTBulletinDistributor_observer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_withReply___block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 80))
  {
    uint64_t v2 = 0;
  }
  else
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 96);
    id v4 = [*(id *)(a1 + 40) sectionID];
    id v5 = [*(id *)(a1 + 40) subsectionIDs];
    uint64_t v6 = [*(id *)(a1 + 40) sectionSubtype];
    int v7 = [*(id *)(a1 + 40) categoryID];
    uint64_t v2 = objc_msgSend(v3, "willNanoPresentNotificationForSectionID:subsectionIDs:subtype:category:ignoresDowntime:isCritical:", v4, v5, v6, v7, objc_msgSend(*(id *)(a1 + 40), "ignoresDowntime"), objc_msgSend(*(id *)(a1 + 40), "hasCriticalIcon"));
  }
  long long v8 = blt_general_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void **)(a1 + 40);
    uint64_t v10 = [v9 publisherMatchID];
    uint64_t v11 = *(void *)(a1 + 64);
    id v12 = "NO";
    if (*(unsigned char *)(a1 + 81)) {
      id v13 = "YES";
    }
    else {
      id v13 = "NO";
    }
    if ([*(id *)(a1 + 40) turnsOnDisplay]) {
      id v12 = "YES";
    }
    uint64_t v14 = _stringForSettingsWillPresentBlockedBy(v2);
    *(_DWORD *)long long buf = 138413570;
    v42 = (const char *)v9;
    __int16 v43 = 2112;
    id v44 = v10;
    __int16 v45 = 2048;
    uint64_t v46 = v11;
    __int16 v47 = 2080;
    v48 = v13;
    __int16 v49 = 2080;
    uint64_t v50 = v12;
    __int16 v51 = 2112;
    v52 = v14;
    _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_DEFAULT, "BLTBulletinDistributor addBulletin: %@ (publisherMatchID: %@) forFeed: %lu playLightsAndSirens: %s turnsOnDisplay: %s willPresentNotification: %@", buf, 0x3Eu);
  }
  if (![*(id *)(a1 + 32) _willNanoPresent:v2 forBulletin:*(void *)(a1 + 40) feed:*(void *)(a1 + 64)])
  {
    [*(id *)(a1 + 32) _cleanupForAddedBulletin:*(void *)(a1 + 40)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    return;
  }
  uint64_t v15 = *(void *)(a1 + 64) & 0x817ELL;
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __122__BLTBulletinDistributor_observer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_withReply___block_invoke_177;
  v31[3] = &unk_264685058;
  BOOL v39 = v15 != 0;
  uint64_t v36 = v2;
  id v16 = *(id *)(a1 + 40);
  uint64_t v17 = *(void *)(a1 + 32);
  id v32 = v16;
  uint64_t v33 = v17;
  id v18 = *(void **)(a1 + 56);
  uint64_t v37 = *(void *)(a1 + 64);
  id v35 = v18;
  char v40 = *(unsigned char *)(a1 + 81);
  id v19 = *(id *)(a1 + 48);
  uint64_t v20 = *(void *)(a1 + 72);
  id v34 = v19;
  uint64_t v38 = v20;
  id v21 = (void (**)(void, void))MEMORY[0x223CAC810](v31);
  id v22 = [*(id *)(*(void *)(a1 + 32) + 152) subscribers];
  id v23 = [*(id *)(a1 + 40) sectionID];
  int v24 = [v22 hasSubscribersForSectionID:v23];

  uint64_t v25 = blt_general_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    char v26 = "NO";
    if (v24) {
      char v26 = "YES";
    }
    *(_DWORD *)long long buf = 136315138;
    v42 = v26;
    _os_log_impl(&dword_222F4C000, v25, OS_LOG_TYPE_INFO, "BLTBulletinDistributor addBulletin hasSubscribers: %s", buf, 0xCu);
  }

  if (!v24) {
    goto LABEL_21;
  }
  long long v28 = *(void **)(a1 + 32);
  uint64_t v27 = *(void *)(a1 + 40);
  if (!v15)
  {
    [v28 _pingSubscriberWithBulletin:v27 ack:0];
LABEL_21:
    v21[2](v21, 1);
    goto LABEL_22;
  }
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __122__BLTBulletinDistributor_observer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_withReply___block_invoke_187;
  v29[3] = &unk_264684828;
  long long v30 = v21;
  [v28 _subscriberWillAllowBulletin:v27 completion:v29];

LABEL_22:
}

void __122__BLTBulletinDistributor_observer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_withReply___block_invoke_177(uint64_t a1, int a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a2 && *(unsigned char *)(a1 + 88))
  {
    uint64_t v4 = *(void *)(a1 + 64);
    if ([*(id *)(a1 + 32) hasCriticalIcon]) {
      int v5 = [MEMORY[0x263F57700] activePairedDeviceSupportsCriticalAndGroupingSettings] ^ 1;
    }
    else {
      int v5 = 0;
    }
    int v9 = objc_msgSend(*(id *)(a1 + 32), "blt_isVOIPCall");
    int v10 = v9;
    int v11 = 1;
    if (v4 != 128 && v4 != 256) {
      int v11 = v5 | v9;
    }
    uint64_t v12 = [*(id *)(a1 + 40) _nanoPresentableFeedFromPhoneFeed:*(void *)(a1 + 72)];
    id v13 = [*(id *)(a1 + 32) sectionID];
    if ([MEMORY[0x263F57700] activePairedDeviceSupportsAddBulletinReplyToken])
    {
      uint64_t v14 = [MEMORY[0x263F08C38] UUID];
      [v14 UUIDString];
    }
    else
    {
      uint64_t v15 = *(void **)(a1 + 40);
      uint64_t v14 = [*(id *)(a1 + 32) publisherMatchID];
      [v15 _replyTokenForSectionID:v13 publisherMatchID:v14];
    id v16 = };

    if (v11)
    {
      if (v4 == 128)
      {
        uint64_t v17 = "Wrist detection disabled";
      }
      else if (v4 == 256)
      {
        uint64_t v17 = "Forwarded only";
      }
      else
      {
        id v22 = "Alerting everywhere";
        if (v10) {
          id v22 = "Ringtone call";
        }
        if (v5) {
          uint64_t v17 = "Critical icon";
        }
        else {
          uint64_t v17 = v22;
        }
      }
      id v23 = blt_general_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        uint64_t v29 = v17;
        _os_log_impl(&dword_222F4C000, v23, OS_LOG_TYPE_INFO, "BLTBulletinDistributor: %s so lie to Companion that Gizmo won't alert.", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      uint64_t v18 = *(void *)(a1 + 56);
      id v19 = *(void **)(a1 + 40);
      uint64_t v20 = [*(id *)(a1 + 32) publisherMatchID];
      id v21 = [*(id *)(a1 + 32) publishDate];
      [v19 setReplyBlock:v18 forSection:v13 bulletin:v20 publicationDate:v21 replyToken:v16];
    }
    uint64_t v25 = *(void **)(a1 + 32);
    int v24 = *(void **)(a1 + 40);
    uint64_t v26 = [v25 turnsOnDisplay];
    if (((v26 ^ 1 | v11) & 1) == 0) {
      uint64_t v26 = *(unsigned char *)(a1 + 89) != 0;
    }
    if (([v24 _notifyGizmoOfBulletin:v25 forFeed:v12 updateType:0 playLightsAndSirens:v26 shouldSendReplyIfNeeded:v11 ^ 1u attachment:*(void *)(a1 + 48) attachmentType:*(void *)(a1 + 80) replyToken:v16] & 1) == 0)
    {
      uint64_t v27 = blt_general_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_222F4C000, v27, OS_LOG_TYPE_DEFAULT, "Will not notify gizmo", buf, 2u);
      }

      [*(id *)(a1 + 40) _cleanupForAddedBulletin:*(void *)(a1 + 32)];
      if ((v11 & 1) == 0)
      {
        [*(id *)(a1 + 40) clearReplyBlockForReplyToken:v16];
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }
    }
  }
  else
  {
    uint64_t v6 = blt_general_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = "subscriber suppressed";
      if (a2) {
        int v7 = "unknown reason";
      }
      if (*(unsigned char *)(a1 + 88)) {
        long long v8 = v7;
      }
      else {
        long long v8 = "Not in interrupting feed";
      }
      *(_DWORD *)long long buf = 136315138;
      uint64_t v29 = v8;
      _os_log_impl(&dword_222F4C000, v6, OS_LOG_TYPE_INFO, "BLTBulletinDistributor: %s so not going to coordinate.", buf, 0xCu);
    }

    [*(id *)(a1 + 40) _cleanupForAddedBulletin:*(void *)(a1 + 32)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __122__BLTBulletinDistributor_observer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_withReply___block_invoke_187(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __122__BLTBulletinDistributor_observer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_withReply___block_invoke_2(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v1 = result;
    uint64_t v2 = blt_general_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __122__BLTBulletinDistributor_observer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_withReply___block_invoke_2_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = 1;
    return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16))();
  }
  return result;
}

uint64_t __122__BLTBulletinDistributor_observer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_withReply___block_invoke_188(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  uint64_t v2 = [*(id *)(a1 + 32) clientReplyTimeoutManager];
  [v2 invalidateClientReplyTimeout:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

uint64_t __122__BLTBulletinDistributor_observer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_withReply___block_invoke_2_189(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v1 = result;
    uint64_t v2 = blt_general_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_222F4C000, v2, OS_LOG_TYPE_DEFAULT, "Sync'ing section info completed. Performing add bulletin now", v3, 2u);
    }

    return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16))();
  }
  return result;
}

- (void)observer:(id)a3 modifyBulletin:(id)a4 forFeed:(unint64_t)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a4;
  long long v8 = [v7 sectionID];

  if (v8)
  {
    bulletins = self->_bulletins;
    int v10 = [v7 sectionID];
    int v11 = [(NSMutableDictionary *)bulletins objectForKeyedSubscript:v10];
    uint64_t v12 = [v11 bulletinIDToBulletin];
    id v13 = [v7 bulletinID];
    uint64_t v14 = [v12 objectForKeyedSubscript:v13];

    if (v14
      && ![(BLTBulletinDistributor *)self _enqueuBulletinUpdate:0 bulletin:v7 feed:a5])
    {
      [(BLTBulletinDistributor *)self _performModifyBulletin:v7 forFeed:a5];
    }
  }
  else
  {
    uint64_t v15 = blt_general_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412290;
      id v17 = v7;
      _os_log_impl(&dword_222F4C000, v15, OS_LOG_TYPE_ERROR, "Serious error modifying bulletin: bulletin has no section ID.  Dropping bulletin.\n%@", (uint8_t *)&v16, 0xCu);
    }

    _BLTCaptureBug(@"BBModifyBulletinSectionNil");
  }
}

- (void)_performModifyBulletin:(id)a3 forFeed:(unint64_t)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = blt_general_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218242;
    unint64_t v9 = a4;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_222F4C000, v7, OS_LOG_TYPE_DEFAULT, "Modifying bulletin for feed: %lu %@", buf, 0x16u);
  }

  [(BLTBulletinDistributor *)self _notifyGizmoOfBulletin:v6 forFeed:a4 updateType:1 playLightsAndSirens:0 shouldSendReplyIfNeeded:0 attachment:0 attachmentType:0 replyToken:0];
}

- (void)observer:(id)a3 removeBulletin:(id)a4 forFeed:(unint64_t)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a4;
  long long v8 = [v7 sectionID];

  if (v8)
  {
    bulletins = self->_bulletins;
    __int16 v10 = [v7 sectionID];
    id v11 = [(NSMutableDictionary *)bulletins objectForKeyedSubscript:v10];
    uint64_t v12 = [v11 bulletinIDToBulletin];
    id v13 = [v7 bulletinID];
    uint64_t v14 = [v12 objectForKeyedSubscript:v13];

    if (v14
      && ![(BLTBulletinDistributor *)self _enqueuBulletinUpdate:1 bulletin:v7 feed:a5])
    {
      [(BLTBulletinDistributor *)self _performRemoveBulletin:v7 forFeed:a5];
    }
  }
  else
  {
    uint64_t v15 = blt_general_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412290;
      id v17 = v7;
      _os_log_impl(&dword_222F4C000, v15, OS_LOG_TYPE_ERROR, "Serious error removing bulletin: bulletin has no section ID.  Dropping bulletin.\n%@", (uint8_t *)&v16, 0xCu);
    }

    _BLTCaptureBug(@"BBRemoveBulletinSectionNil");
  }
}

- (void)_performRemoveBulletin:(id)a3 forFeed:(unint64_t)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = blt_general_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v41 = 134218242;
    unint64_t v42 = a4;
    __int16 v43 = 2112;
    id v44 = v6;
    _os_log_impl(&dword_222F4C000, v7, OS_LOG_TYPE_DEFAULT, "Removing bulletin for feed: %lu %@", (uint8_t *)&v41, 0x16u);
  }

  if ((a4 & 8) != 0)
  {
    lockScreenFeed = self->_lockScreenFeed;
    unint64_t v9 = [v6 bulletinID];
    [(NSMutableSet *)lockScreenFeed removeObject:v9];
  }
  if (a4)
  {
    noticesFeed = self->_noticesFeed;
    id v11 = [v6 bulletinID];
    [(NSMutableSet *)noticesFeed removeObject:v11];
  }
  uint64_t v12 = self->_lockScreenFeed;
  id v13 = [v6 bulletinID];
  if ([(NSMutableSet *)v12 containsObject:v13]) {
    goto LABEL_16;
  }
  uint64_t v14 = self->_noticesFeed;
  uint64_t v15 = [v6 bulletinID];
  LOBYTE(v14) = [(NSMutableSet *)v14 containsObject:v15];

  if ((v14 & 1) == 0)
  {
    id v13 = [MEMORY[0x263EFF910] date];
    int v16 = [v6 dateOrRecencyDate];
    id v17 = [v16 dateByAddingTimeInterval:86400.0];
    [v17 timeIntervalSinceDate:v13];
    double v19 = v18;

    if (v19 <= 0.0)
    {
      uint64_t v20 = 0;
    }
    else
    {
      uint64_t v20 = [NSNumber numberWithDouble:v19];
    }
    id v21 = [v6 sectionID];
    id v22 = [v6 publisherMatchID];
    id v23 = +[BLTBBBulletinKey bulletinKeyWithSectionID:v21 publisherMatchID:v22];

    int v24 = [(BLTGizmoLegacyMap *)self->_gizmoLegacyMap gizmoSectionInfoForPhoneKey:v23];
    uint64_t v25 = [v24 mappedSectionID];
    uint64_t v26 = v25;
    if (v25)
    {
      id v27 = v25;
    }
    else
    {
      id v27 = [v6 sectionID];
    }
    long long v28 = v27;

    gizmoConnection = self->_gizmoConnection;
    uint64_t v30 = [(BLTGizmoLegacyMap *)self->_gizmoLegacyMap gizmoPublisherBulletinIDForPhoneKey:v23];
    long long v31 = [v6 recordID];
    [(BLTRemoteGizmoClient *)gizmoConnection removeBulletinWithPublisherBulletinID:v30 recordID:v31 sectionID:v28 withTimeout:v20];

    [(BLTBulletinDistributor *)self _cleanupForAddedBulletin:v6];
    bulletins = self->_bulletins;
    uint64_t v33 = [v6 sectionID];
    id v34 = [(NSMutableDictionary *)bulletins objectForKeyedSubscript:v33];
    [v34 removeBulletin:v6];

    attachmentHashCache = self->_attachmentHashCache;
    uint64_t v36 = [v6 sectionID];
    uint64_t v37 = [v6 publisherMatchID];
    [(BLTHashCache *)attachmentHashCache updateCacheWithItems:0 forSectionID:v36 matchID:v37 result:0];

    iconHashCache = self->_iconHashCache;
    BOOL v39 = [v6 sectionID];
    char v40 = [v6 publisherMatchID];
    [(BLTHashCache *)iconHashCache updateCacheWithItems:0 forSectionID:v39 matchID:v40 result:0];

LABEL_16:
  }
}

- (void)observer:(id)a3 updateGlobalSettings:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  -[BLTBulletinDistributor setSummarizationSetting:](self, "setSummarizationSetting:", objc_msgSend(a4, "globalSummarizationSetting", a3));
  int v5 = blt_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[BLTBulletinDistributor summarizationSetting](self, "summarizationSetting"));
    int v7 = 138412290;
    long long v8 = v6;
    _os_log_impl(&dword_222F4C000, v5, OS_LOG_TYPE_DEFAULT, "Updated summarization setting to %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_handleDidPlayLightsAndSirens:(BOOL)a3 forBulletin:(id)a4 inPhoneSection:(id)a5 finalReply:(BOOL)a6 replyToken:(id)a7
{
  BOOL v10 = a3;
  uint64_t v12 = (void *)MEMORY[0x263EFF910];
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v17 = [v12 date];
  LOBYTE(v16) = a6;
  [(BLTBulletinDistributor *)self _handleDidPlayLightsAndSirens:v10 forBulletin:v15 inPhoneSection:v14 transmissionDate:v17 receptionDate:v17 fromGizmo:0 finalReply:v16 replyToken:v13];
}

- (void)handleDidPlayLightsAndSirens:(BOOL)a3 forBulletin:(id)a4 inPhoneSection:(id)a5 transmissionDate:(id)a6 receptionDate:(id)a7 replyToken:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  double v19 = BLTWorkQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __124__BLTBulletinDistributor_handleDidPlayLightsAndSirens_forBulletin_inPhoneSection_transmissionDate_receptionDate_replyToken___block_invoke;
  block[3] = &unk_2646850D0;
  BOOL v31 = a3;
  block[4] = self;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v29 = v17;
  id v30 = v18;
  id v20 = v18;
  id v21 = v17;
  id v22 = v16;
  id v23 = v15;
  id v24 = v14;
  dispatch_async(v19, block);
}

uint64_t __124__BLTBulletinDistributor_handleDidPlayLightsAndSirens_forBulletin_inPhoneSection_transmissionDate_receptionDate_replyToken___block_invoke(uint64_t a1)
{
  LOBYTE(v2) = 1;
  return [*(id *)(a1 + 32) _handleDidPlayLightsAndSirens:*(unsigned __int8 *)(a1 + 80) forBulletin:*(void *)(a1 + 40) inPhoneSection:*(void *)(a1 + 48) transmissionDate:*(void *)(a1 + 56) receptionDate:*(void *)(a1 + 64) fromGizmo:1 finalReply:v2 replyToken:*(void *)(a1 + 72)];
}

- (void)_handleDidPlayLightsAndSirens:(BOOL)a3 forBulletin:(id)a4 inPhoneSection:(id)a5 transmissionDate:(id)a6 receptionDate:(id)a7 fromGizmo:(BOOL)a8 finalReply:(BOOL)a9 replyToken:(id)a10
{
  BOOL v10 = a8;
  BOOL v13 = a3;
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a10;
  if (([MEMORY[0x263F57700] activePairedDeviceSupportsAddBulletinReplyToken] & 1) == 0)
  {
    uint64_t v19 = [(BLTBulletinDistributor *)self _replyTokenForSectionID:v16 publisherMatchID:v15];

    id v18 = v19;
  }
  if (v18)
  {
    if (v13) {
      uint64_t v20 = 1;
    }
    else {
      uint64_t v20 = 2;
    }
    id v21 = +[BLTLightsAndSirensReplyInfoCache sharedReplyCache];
    id v22 = [v21 cacheDidPlayLightsAndSirens:v20 withReplyToken:v18];

    if (!v22)
    {
      id v23 = blt_general_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[BLTBulletinDistributor _handleDidPlayLightsAndSirens:forBulletin:inPhoneSection:transmissionDate:receptionDate:fromGizmo:finalReply:replyToken:]((uint64_t)v18, v23);
      }
      goto LABEL_31;
    }
    id v23 = [v22 publisherMatchID];
    id v24 = [v22 sectionID];
    uint64_t v25 = blt_general_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = "NO";
      *(_DWORD *)uint64_t v37 = 136315906;
      if (v13) {
        id v26 = "YES";
      }
      *(void *)&v37[4] = v26;
      __int16 v38 = 2112;
      BOOL v39 = v18;
      __int16 v40 = 2112;
      int v41 = v23;
      __int16 v42 = 2112;
      __int16 v43 = v24;
      _os_log_impl(&dword_222F4C000, v25, OS_LOG_TYPE_DEFAULT, "BLTBulletinDistributor handleDidPlayLightsAndSirens: %s forReplyToken: %@ bulletin: %@ inSection: %@", v37, 0x2Au);
    }

    if (v10)
    {
      id v27 = blt_perf_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        id v28 = [MEMORY[0x263EFF910] date];
        [v28 timeIntervalSinceDate:v17];
        *(_DWORD *)uint64_t v37 = 138412802;
        *(void *)&v37[4] = v24;
        __int16 v38 = 2112;
        BOOL v39 = v23;
        __int16 v40 = 2048;
        int v41 = v29;
        _os_log_impl(&dword_222F4C000, v27, OS_LOG_TYPE_INFO, "%@.%@.GizmoToCompanionDelay: %f", v37, 0x20u);
      }
      id v30 = blt_perf_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        BOOL v31 = [MEMORY[0x263EFF910] date];
        id v32 = [v22 bulletinPublicationDate];
        [v31 timeIntervalSinceDate:v32];
        *(_DWORD *)uint64_t v37 = 138412802;
        *(void *)&v37[4] = v24;
        __int16 v38 = 2112;
        BOOL v39 = v23;
        __int16 v40 = 2048;
        int v41 = v33;
        _os_log_impl(&dword_222F4C000, v30, OS_LOG_TYPE_INFO, "%@.%@.PublicationToReplayDelay: %f", v37, 0x20u);
      }
    }
    int v34 = [v22 sendReply];
    id v35 = blt_general_log();
    BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
    if (v34)
    {
      if (v36)
      {
        *(_WORD *)uint64_t v37 = 0;
        _os_log_impl(&dword_222F4C000, v35, OS_LOG_TYPE_DEFAULT, "BLTBulletinDistributor sending reply", v37, 2u);
      }

      if (!a9) {
        goto LABEL_30;
      }
      id v35 = +[BLTLightsAndSirensReplyInfoCache sharedReplyCache];
      [v35 purgeReplyInfo:v22 withReplyToken:v18];
    }
    else if (v36)
    {
      *(_WORD *)uint64_t v37 = 0;
      _os_log_impl(&dword_222F4C000, v35, OS_LOG_TYPE_DEFAULT, "BLTBulletinDistributor saved didPlayLightsAndSirens state", v37, 2u);
    }

LABEL_30:
LABEL_31:

    goto LABEL_32;
  }
  id v22 = blt_general_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    -[BLTBulletinDistributor _handleDidPlayLightsAndSirens:forBulletin:inPhoneSection:transmissionDate:receptionDate:fromGizmo:finalReply:replyToken:]();
  }
LABEL_32:
}

- (void)handleAction:(id)a3
{
  id v4 = a3;
  int v5 = BLTWorkQueue();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__BLTBulletinDistributor_handleAction___block_invoke;
  v7[3] = &unk_264683BB0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __39__BLTBulletinDistributor_handleAction___block_invoke(uint64_t a1)
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  uint64_t v2 = blt_general_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = BLTNameForActionType([*(id *)(a1 + 32) actionType]);
    id v4 = [*(id *)(a1 + 32) publisherBulletinID];
    int v5 = [*(id *)(a1 + 32) recordID];
    id v6 = [*(id *)(a1 + 32) sectionID];
    *(_DWORD *)long long buf = 138413058;
    v73 = v3;
    __int16 v74 = 2112;
    id v75 = v4;
    __int16 v76 = 2112;
    id v77 = v5;
    __int16 v78 = 2112;
    id v79 = v6;
    _os_log_impl(&dword_222F4C000, v2, OS_LOG_TYPE_DEFAULT, "Received %@ action for publisherBulletinD: %@, recordID: %@, sectionID: %@", buf, 0x2Au);
  }
  id v8 = *(void **)(a1 + 40);
  int v7 = (id *)(a1 + 40);
  uint64_t v9 = v7 - 1;
  BOOL v10 = [*(v7 - 1) publisherBulletinID];
  id v11 = [*(v7 - 1) recordID];
  uint64_t v12 = [*(v7 - 1) sectionID];
  BOOL v13 = [v8 _bulletinWithPublisherBulletinID:v10 recordID:v11 sectionID:v12];

  id v14 = blt_general_log();
  id v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      v73 = v13;
      _os_log_impl(&dword_222F4C000, v15, OS_LOG_TYPE_INFO, "Found matching bulletin: %@", buf, 0xCu);
    }

    unint64_t v16 = 0x263F57000uLL;
    id v17 = objc_msgSend(MEMORY[0x263F57730], "blt_boundedWaitForActivePairedDevice");
    id v15 = v17;
    if (v17 && (unint64_t)[v17 bltVersion] <= 3)
    {
      id v18 = [v13 sectionID];
      int v19 = [v18 isEqualToString:@"com.apple.mobiletimer"];
    }
    else
    {
      int v19 = 0;
    }
    switch([*v9 actionType])
    {
      case 3:
        uint64_t v20 = [v13 responseForAcknowledgeAction];
        if (v20)
        {
          id v21 = (void *)v20;
          int v19 = 0;
          goto LABEL_49;
        }
        uint64_t v46 = blt_general_log();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_222F4C000, v46, OS_LOG_TYPE_DEFAULT, "Did not find acknowledgeAction. Synthesizing action.", buf, 2u);
        }

        uint64_t v37 = [MEMORY[0x263F2BC40] actionWithIdentifier:@"BLTAcknowledgeActionIdentifier"];
        id v21 = [v13 responseForAction:v37];
        goto LABEL_48;
      case 6:
        id v21 = [v13 responseForSnoozeAction];
        if (!v21) {
          goto LABEL_56;
        }
        goto LABEL_49;
      case 7:
        id v61 = v15;
        id v62 = v7;
        id v24 = *v9;
        uint64_t v25 = blt_general_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          id v26 = [v24 identifier];
          *(_DWORD *)long long buf = 138412290;
          v73 = v26;
          _os_log_impl(&dword_222F4C000, v25, OS_LOG_TYPE_INFO, "Looking for action with identifier: %@", buf, 0xCu);
        }
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        unint64_t v63 = v13;
        id v27 = [v13 supplementaryActions];
        uint64_t v28 = [v27 countByEnumeratingWithState:&v67 objects:v71 count:16];
        if (!v28) {
          goto LABEL_30;
        }
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v68;
        break;
      case 8:
        BOOL v36 = [v13 dismissAction];
        id v21 = [v13 responseForAction:v36];

        if (!v21) {
          goto LABEL_56;
        }
        goto LABEL_49;
      case 11:
        uint64_t v37 = [v13 followActivityAction];
        if (v37)
        {
          id v21 = [v13 responseForAction:v37];
          __int16 v38 = blt_general_log();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            id v39 = *v7;
            *(_DWORD *)long long buf = 138412802;
            v73 = v39;
            __int16 v74 = 2112;
            id v75 = v37;
            __int16 v76 = 2112;
            id v77 = v21;
            _os_log_impl(&dword_222F4C000, v38, OS_LOG_TYPE_INFO, "%@ handleAction: followActivityAction: %@ response: %@", buf, 0x20u);
          }
        }
        else
        {
          __int16 v38 = blt_general_log();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            __39__BLTBulletinDistributor_handleAction___block_invoke_cold_4();
          }
          id v21 = 0;
        }

LABEL_48:
        int v19 = 0;
        if (v21) {
          goto LABEL_49;
        }
        goto LABEL_56;
      default:
        id v22 = v13;
        id v23 = blt_general_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          __39__BLTBulletinDistributor_handleAction___block_invoke_cold_3(v7 - 1);
        }

        BOOL v13 = v22;
        goto LABEL_56;
    }
LABEL_24:
    uint64_t v31 = 0;
    while (1)
    {
      if (*(void *)v68 != v30) {
        objc_enumerationMutation(v27);
      }
      id v32 = *(void **)(*((void *)&v67 + 1) + 8 * v31);
      uint64_t v33 = objc_msgSend(v32, "identifier", v61, v62);
      int v34 = [v24 identifier];
      char v35 = [v33 isEqualToString:v34];

      if (v35) {
        break;
      }
      if (v29 == ++v31)
      {
        uint64_t v29 = [v27 countByEnumeratingWithState:&v67 objects:v71 count:16];
        if (v29) {
          goto LABEL_24;
        }
LABEL_30:

        int v7 = v62;
        BOOL v13 = v63;
        id v15 = v61;
        goto LABEL_37;
      }
    }
    BOOL v13 = v63;
    id v21 = [v63 responseForAction:v32];

    id v15 = v61;
    int v7 = v62;
    if (v21) {
      goto LABEL_55;
    }
LABEL_37:
    __int16 v40 = objc_msgSend(v24, "identifier", v61, v62);

    if (v40)
    {
      int v41 = blt_general_log();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v42 = [v24 identifier];
        *(_DWORD *)long long buf = 138412290;
        v73 = v42;
        _os_log_impl(&dword_222F4C000, v41, OS_LOG_TYPE_DEFAULT, "Did not find action with identifier: %@. Synthesizing action.", buf, 0xCu);
      }
      __int16 v43 = (void *)MEMORY[0x263F2BC40];
      uint64_t v44 = [v24 identifier];
      uint64_t v45 = [v43 actionWithIdentifier:v44];

      id v21 = [v13 responseForAction:v45];
    }
    else
    {
      id v21 = 0;
    }
LABEL_55:

    int v19 = 0;
    unint64_t v16 = 0x263F57000;
    if (v21)
    {
LABEL_49:
      unint64_t v47 = v16;
      v48 = v15;
      __int16 v49 = v7;
      uint64_t v50 = [*v9 context];
      __int16 v51 = (void *)[v50 mutableCopy];

      if (!v51)
      {
        __int16 v51 = [MEMORY[0x263EFF9A0] dictionary];
      }
      v52 = objc_msgSend(*(id *)(v47 + 1840), "blt_boundedWaitForActivePairedDevice");
      uint64_t v53 = [NSNumber numberWithUnsignedInt:NRWatchOSVersionForRemoteDevice()];
      [v51 setObject:v53 forKey:@"BLTNRWatchOSVersion"];

      [v21 setContext:v51];
      id v54 = *v49;
      uint64_t v55 = (void *)*((void *)*v49 + 5);
      v64[0] = MEMORY[0x263EF8330];
      v64[1] = 3221225472;
      v64[2] = __39__BLTBulletinDistributor_handleAction___block_invoke_200;
      v64[3] = &unk_2646850F8;
      v64[4] = v54;
      id v65 = *v9;
      uint64_t v56 = v21;
      BOOL v66 = v56;
      [v55 sendResponse:v56 withCompletion:v64];
      if (v19)
      {
        uint64_t v57 = (void *)*((void *)*v49 + 5);
        [MEMORY[0x263EFFA08] setWithObject:v13];
        v59 = char v58 = v13;
        id v60 = [v58 sectionID];
        [v57 clearBulletins:v59 inSection:v60];

        BOOL v13 = v58;
      }

      id v15 = v48;
    }
    else
    {
LABEL_56:
      uint64_t v56 = blt_general_log();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        __39__BLTBulletinDistributor_handleAction___block_invoke_cold_2(v9);
      }
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    __39__BLTBulletinDistributor_handleAction___block_invoke_cold_1();
  }
}

void __39__BLTBulletinDistributor_handleAction___block_invoke_200(void *a1, int a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = blt_general_log();
  int v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[4];
      uint64_t v7 = a1[5];
      uint64_t v8 = a1[6];
      int v9 = 138412802;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      _os_log_impl(&dword_222F4C000, v5, OS_LOG_TYPE_DEFAULT, "%@ handleAction: SUCCESS: actionInfo: %@ at sending response %@", (uint8_t *)&v9, 0x20u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __39__BLTBulletinDistributor_handleAction___block_invoke_200_cold_1();
  }
}

- (void)removeBulletinWithPublisherBulletinID:(id)a3 recordID:(id)a4 sectionID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = BLTWorkQueue();
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __83__BLTBulletinDistributor_removeBulletinWithPublisherBulletinID_recordID_sectionID___block_invoke;
  v15[3] = &unk_264684048;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  int v19 = self;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __83__BLTBulletinDistributor_removeBulletinWithPublisherBulletinID_recordID_sectionID___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = blt_general_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v11 = 138412802;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    __int16 v15 = 2112;
    uint64_t v16 = v5;
    _os_log_impl(&dword_222F4C000, v2, OS_LOG_TYPE_DEFAULT, "Received remove bulletin for publisherBulletinID: %@, recordID: %@, sectionID %@", (uint8_t *)&v11, 0x20u);
  }

  uint64_t v6 = [*(id *)(a1 + 56) _bulletinWithPublisherBulletinID:*(void *)(a1 + 32) recordID:*(void *)(a1 + 40) sectionID:*(void *)(a1 + 48)];
  uint64_t v7 = blt_general_log();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_INFO, "Found matching bulletin: %@", (uint8_t *)&v11, 0xCu);
    }

    id v9 = *(void **)(*(void *)(a1 + 56) + 40);
    id v8 = [MEMORY[0x263EFFA08] setWithObject:v6];
    id v10 = [v6 sectionID];
    [v9 clearBulletins:v8 inSection:v10];
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_DEFAULT, "Could not find matching bulletin", (uint8_t *)&v11, 2u);
  }
}

- (BOOL)shouldSuppressLightsAndSirensNow
{
  uint64_t v2 = [MEMORY[0x263EFA6F8] currentCarPlayExternalDevice];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)willSendLightsAndSirensWithPublisherBulletinID:(id)a3 recordID:(id)a4 inPhoneSection:(id)a5 systemApp:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v16 = BLTWorkQueue();
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __118__BLTBulletinDistributor_willSendLightsAndSirensWithPublisherBulletinID_recordID_inPhoneSection_systemApp_completion___block_invoke;
  v21[3] = &unk_264685120;
  v21[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  BOOL v26 = a6;
  id v25 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(v16, v21);
}

void __118__BLTBulletinDistributor_willSendLightsAndSirensWithPublisherBulletinID_recordID_inPhoneSection_systemApp_completion___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _bulletinWithPublisherBulletinID:*(void *)(a1 + 40) recordID:*(void *)(a1 + 48) sectionID:*(void *)(a1 + 56)];
  if (v2)
  {
    BOOL v3 = blt_general_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 56);
      uint64_t v5 = *(void *)(a1 + 40);
      if (!v5) {
        uint64_t v5 = *(void *)(a1 + 48);
      }
      *(_DWORD *)long long buf = 138412546;
      *(void *)uint64_t v28 = v4;
      *(_WORD *)&v28[8] = 2112;
      *(void *)&v28[10] = v5;
      _os_log_impl(&dword_222F4C000, v3, OS_LOG_TYPE_DEFAULT, "willSendLightsAndSirensWithPublisherBulletinID: found a stored bulletin for sectionID: %@ publisherMatchID: %@", buf, 0x16u);
    }
    uint64_t v6 = 0;
LABEL_7:
    int v7 = 1;
LABEL_8:

    goto LABEL_9;
  }
  if (!*(unsigned char *)(a1 + 72))
  {
    BOOL v3 = [*(id *)(*(void *)(a1 + 32) + 168) currentLayout];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v13 = [v3 elements];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v23;
      uint64_t v16 = *MEMORY[0x263F3F560];
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v13);
          }
          id v18 = [*(id *)(*((void *)&v22 + 1) + 8 * i) identifier];
          char v19 = [v18 isEqualToString:v16];

          if (v19)
          {
            LODWORD(v14) = 1;
            goto LABEL_29;
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_29:

    uint64_t v20 = [v3 displayBacklightLevel];
    id v21 = blt_general_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109376;
      *(_DWORD *)uint64_t v28 = v20 != 0;
      *(_WORD *)&v28[4] = 1024;
      *(_DWORD *)&v28[6] = v14;
      _os_log_impl(&dword_222F4C000, v21, OS_LOG_TYPE_DEFAULT, "willSendLightsAndSirensWithPublisherBulletinID: no stored bulletin and not for a system app. willSend based on screenIsOn: %{BOOL}u isUILocked: %{BOOL}u", buf, 0xEu);
    }

    uint64_t v6 = 0;
    if (v20) {
      int v7 = v14 ^ 1;
    }
    else {
      int v7 = 0;
    }
    goto LABEL_8;
  }
  id v9 = blt_general_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_222F4C000, v9, OS_LOG_TYPE_DEFAULT, "willSendLightsAndSirensWithPublisherBulletinID: no stored bulletin but this is for a system app", buf, 2u);
  }

  id v10 = [*(id *)(*(void *)(a1 + 32) + 152) subscribers];
  int v11 = [v10 hasSubscribersForSectionID:*(void *)(a1 + 56)];

  if (v11)
  {
    uint64_t v6 = 120;
    id v12 = [*(id *)(*(void *)(a1 + 32) + 152) subscribers];
    [v12 pingWithRecordID:*(void *)(a1 + 48) forSectionID:*(void *)(a1 + 56)];

    BOOL v3 = blt_general_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      *(void *)uint64_t v28 = 120;
      _os_log_impl(&dword_222F4C000, v3, OS_LOG_TYPE_DEFAULT, "willSendLightsAndSirensWithPublisherBulletinID: found subscribers sending response with additional time: %lu", buf, 0xCu);
    }
    goto LABEL_7;
  }
  uint64_t v6 = 0;
  int v7 = 1;
LABEL_9:
  id v8 = blt_general_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109376;
    *(_DWORD *)uint64_t v28 = v7;
    *(_WORD *)&v28[4] = 2048;
    *(void *)&v28[6] = v6;
    _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_DEFAULT, "willSendLightsAndSirensWithPublisherBulletinID: sending back response willSend: %{BOOL}u additionalTime: %lu", buf, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)_addBulletin:(id)a3 forFeed:(unint64_t)a4 playLightsAndSirens:(BOOL)a5 attachment:(id)a6 attachmentType:(int64_t)a7 alwaysSend:(BOOL)a8 completion:(id)a9
{
  BOOL v12 = a5;
  id v16 = a9;
  bbObserver = self->_bbObserver;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __115__BLTBulletinDistributor__addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_completion___block_invoke;
  v20[3] = &unk_264684828;
  id v21 = v16;
  id v18 = v16;
  LOBYTE(v19) = a8;
  [(BLTBulletinDistributor *)self observer:bbObserver addBulletin:a3 forFeed:a4 playLightsAndSirens:v12 attachment:a6 attachmentType:a7 alwaysSend:v19 withReply:v20];
}

uint64_t __115__BLTBulletinDistributor__addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_stateDescription
{
  BOOL v3 = [(BLTBulletinDistributor *)self settingSync];
  uint64_t v4 = [(BLTSimpleCache *)self->_mruCacheOfSectionIDs objects];
  uint64_t v5 = [v3 settingsDescriptionForSectionIDs:v4];

  return v5;
}

- (BLTRemoteGizmoClient)gizmoConnection
{
  return self->_gizmoConnection;
}

- (void)setGizmoConnection:(id)a3
{
}

- (int64_t)summarizationSetting
{
  return self->_summarizationSetting;
}

- (void)setSummarizationSetting:(int64_t)a3
{
  self->_summarizationSetting = a3;
}

- (BBObserver)bbObserver
{
  return self->_bbObserver;
}

- (void)setBbObserver:(id)a3
{
}

- (NSMutableDictionary)bulletins
{
  return self->_bulletins;
}

- (void)setBulletins:(id)a3
{
}

- (NSMutableSet)noticesFeed
{
  return self->_noticesFeed;
}

- (void)setNoticesFeed:(id)a3
{
}

- (NSMutableSet)lockScreenFeed
{
  return self->_lockScreenFeed;
}

- (void)setLockScreenFeed:(id)a3
{
}

- (BLTHashCache)attachmentHashCache
{
  return self->_attachmentHashCache;
}

- (void)setAttachmentHashCache:(id)a3
{
}

- (BLTHashCache)iconHashCache
{
  return self->_iconHashCache;
}

- (void)setIconHashCache:(id)a3
{
}

- (BLTWatchKitAppList)watchKitAppList
{
  return self->_watchKitAppList;
}

- (void)setWatchKitAppList:(id)a3
{
}

- (BLTSettingSync)settingSync
{
  return self->_settingSync;
}

- (void)setSettingSync:(id)a3
{
}

- (NSDate)startupTime
{
  return self->_startupTime;
}

- (void)setStartupTime:(id)a3
{
}

- (BOOL)standaloneTestModeEnabled
{
  return self->_standaloneTestModeEnabled;
}

- (void)setStandaloneTestModeEnabled:(BOOL)a3
{
  self->_standaloneTestModeEnabled = a3;
}

- (NSMutableDictionary)pendingBulletinUpdates
{
  return self->_pendingBulletinUpdates;
}

- (void)setPendingBulletinUpdates:(id)a3
{
}

- (NSMutableSet)bulletinIDsWaitingOnGizmoAdd
{
  return self->_bulletinIDsWaitingOnGizmoAdd;
}

- (void)setBulletinIDsWaitingOnGizmoAdd:(id)a3
{
}

- (BLTClientReplyTimeoutManager)clientReplyTimeoutManager
{
  return self->_clientReplyTimeoutManager;
}

- (void)setClientReplyTimeoutManager:(id)a3
{
}

- (BLTSectionConfiguration)sectionConfiguration
{
  return self->_sectionConfiguration;
}

- (void)setSectionConfiguration:(id)a3
{
}

- (BLTBulletinFetcher)bulletinFetcher
{
  return self->_bulletinFetcher;
}

- (void)setBulletinFetcher:(id)a3
{
}

- (BLTPingSubscriberManager)pingSubscriberManager
{
  return self->_pingSubscriberManager;
}

- (void)setPingSubscriberManager:(id)a3
{
}

- (BLTGizmoLegacyMap)gizmoLegacyMap
{
  return self->_gizmoLegacyMap;
}

- (void)setGizmoLegacyMap:(id)a3
{
}

- (FBSDisplayLayoutMonitor)layoutMonitor
{
  return self->_layoutMonitor;
}

- (void)setLayoutMonitor:(id)a3
{
}

- (BLTSimpleCache)mruCacheOfSectionIDs
{
  return self->_mruCacheOfSectionIDs;
}

- (void)setMruCacheOfSectionIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mruCacheOfSectionIDs, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_gizmoLegacyMap, 0);
  objc_storeStrong((id *)&self->_pingSubscriberManager, 0);
  objc_storeStrong((id *)&self->_bulletinFetcher, 0);
  objc_storeStrong((id *)&self->_sectionConfiguration, 0);
  objc_storeStrong((id *)&self->_clientReplyTimeoutManager, 0);
  objc_storeStrong((id *)&self->_bulletinIDsWaitingOnGizmoAdd, 0);
  objc_storeStrong((id *)&self->_pendingBulletinUpdates, 0);
  objc_storeStrong((id *)&self->_startupTime, 0);
  objc_storeStrong((id *)&self->_settingSync, 0);
  objc_storeStrong((id *)&self->_watchKitAppList, 0);
  objc_storeStrong((id *)&self->_iconHashCache, 0);
  objc_storeStrong((id *)&self->_attachmentHashCache, 0);
  objc_storeStrong((id *)&self->_lockScreenFeed, 0);
  objc_storeStrong((id *)&self->_noticesFeed, 0);
  objc_storeStrong((id *)&self->_bulletins, 0);
  objc_storeStrong((id *)&self->_bbObserver, 0);
  objc_storeStrong((id *)&self->_gizmoConnection, 0);
}

void __71__BLTBulletinDistributor__rememberBulletin_forFeed_syncChangesToWatch___block_invoke_cold_1(id *a1)
{
  uint64_t v2 = [*a1 sectionID];
  BOOL v3 = [*a1 publisherMatchID];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_222F4C000, v4, v5, "Not going to store/coordinate bulletin sectionID: %@ publisherMatch: %@", v6, v7, v8, v9, v10);
}

void __71__BLTBulletinDistributor__rememberBulletin_forFeed_syncChangesToWatch___block_invoke_cold_2(void *a1)
{
  uint64_t v2 = [a1 sectionID];
  BOOL v3 = [a1 publisherMatchID];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_222F4C000, v4, v5, "Exceeded space for bulletins. Dropping bulletin from coordination sectionID: %@ publisherMatch: %@", v6, v7, v8, v9, v10);
}

- (void)_notifyGizmoOfBulletin:(void *)a1 forFeed:updateType:playLightsAndSirens:shouldSendReplyIfNeeded:attachment:attachmentType:replyToken:.cold.1(void *a1)
{
  uint64_t v2 = [a1 sectionID];
  BOOL v3 = [a1 publisherMatchID];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_222F4C000, v4, v5, "Couldn't store bulletin. Not sending to gizmo sectionID: %@ publisherMatch: %@", v6, v7, v8, v9, v10);
}

- (void)_removeTranscodedAttachmentIfNeededForBulletin:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_222F4C000, log, OS_LOG_TYPE_ERROR, "Unable to remove transcoded attachment file at %@: %@", (uint8_t *)&v3, 0x16u);
}

- (void)observer:addBulletin:forFeed:playLightsAndSirens:attachment:attachmentType:alwaysSend:withReply:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_222F4C000, v0, v1, "Section sync has been waiting. Performing add bulletin anyway!", v2, v3, v4, v5, v6);
}

void __122__BLTBulletinDistributor_observer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_withReply___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_222F4C000, v0, v1, "Sync'ing section info timed out. Performing add bulletin anyway!", v2, v3, v4, v5, v6);
}

- (void)_handleDidPlayLightsAndSirens:forBulletin:inPhoneSection:transmissionDate:receptionDate:fromGizmo:finalReply:replyToken:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_222F4C000, v0, v1, "Received did play lights and sirens message for nil replyToken!", v2, v3, v4, v5, v6);
}

- (void)_handleDidPlayLightsAndSirens:(uint64_t)a1 forBulletin:(NSObject *)a2 inPhoneSection:transmissionDate:receptionDate:fromGizmo:finalReply:replyToken:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222F4C000, a2, OS_LOG_TYPE_ERROR, "Error: Trying to cache lights and sirens value for unknown replyToken: %@", (uint8_t *)&v2, 0xCu);
}

void __39__BLTBulletinDistributor_handleAction___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_222F4C000, v0, v1, "Could not find matching bulletin", v2, v3, v4, v5, v6);
}

void __39__BLTBulletinDistributor_handleAction___block_invoke_cold_2(id *a1)
{
  uint64_t v2 = BLTNameForActionType([*a1 actionType]);
  uint64_t v3 = [*a1 publisherBulletinID];
  uint64_t v4 = [*a1 recordID];
  uint64_t v5 = [*a1 sectionID];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4(&dword_222F4C000, v6, v7, "Failed to find matching action for %@ for publisherBulletinD: %@, recordID: %@, sectionID: %@", v8, v9, v10, v11, v12);
}

void __39__BLTBulletinDistributor_handleAction___block_invoke_cold_3(id *a1)
{
  uint64_t v2 = BLTNameForActionType([*a1 actionType]);
  uint64_t v3 = [*a1 publisherBulletinID];
  uint64_t v4 = [*a1 recordID];
  uint64_t v5 = [*a1 sectionID];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4(&dword_222F4C000, v6, v7, "No handler for %@ for publisherBulletinD: %@, recordID: %@, sectionID: %@", v8, v9, v10, v11, v12);
}

void __39__BLTBulletinDistributor_handleAction___block_invoke_cold_4()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6();
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_222F4C000, v0, OS_LOG_TYPE_ERROR, "%@ handleAction: no followActivityAction for response: %@", v1, 0x16u);
}

void __39__BLTBulletinDistributor_handleAction___block_invoke_200_cold_1()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6();
  uint64_t v5 = v0;
  __int16 v6 = v1;
  uint64_t v7 = v2;
  _os_log_error_impl(&dword_222F4C000, v3, OS_LOG_TYPE_ERROR, "%@ handleAction: FAILED: actionInfo: %@ at sending response %@", v4, 0x20u);
}

@end