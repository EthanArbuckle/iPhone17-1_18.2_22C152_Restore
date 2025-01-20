@interface SYLegacyStore
+ (id)fullSyncActivityDictionary;
- (BOOL)_allowDeltaSyncWithContext:(id)a3 error:(id *)a4;
- (BOOL)_checkMessageHeader:(id)a3 messageID:(id)a4;
- (BOOL)_isPairedWithDevice:(id)a3;
- (BOOL)_isUsingGenericCache;
- (BOOL)_shouldIgnoreSyncID:(id)a3;
- (BOOL)_shouldSkipNonSyncMessages;
- (BOOL)addObject:(id)a3 context:(id)a4 idsOptions:(id)a5 error:(id *)a6;
- (BOOL)alwaysWins;
- (BOOL)deleteObject:(id)a3 context:(id)a4 idsOptions:(id)a5 error:(id *)a6;
- (BOOL)encryptPayloads;
- (BOOL)fullSyncWasRequestedBySlave;
- (BOOL)hasCompletedFullSync;
- (BOOL)inDeltaSync;
- (BOOL)inFullSync;
- (BOOL)isPaired;
- (BOOL)objectChanged:(id)a3 sinceVersion:(unint64_t)a4;
- (BOOL)peerState:(id)a3 fromPeer:(id)a4 matchesExpectationForChangeCount:(unint64_t)a5 offsetAmount:(unint64_t *)a6;
- (BOOL)performBatchedSyncToCurrentDBVersion;
- (BOOL)processBatchChunkAtIndex:(unsigned int)a3 encodedObjects:(id)a4 error:(id *)a5;
- (BOOL)registeredNotificationHandlers;
- (BOOL)tracksChanges;
- (BOOL)updateObject:(id)a3 context:(id)a4 idsOptions:(id)a5 error:(id *)a6;
- (NMSMessageCenter)messageCenter;
- (NSString)databaseFileName;
- (NSString)service;
- (NSUUID)pairedDeviceID;
- (OS_dispatch_queue)queue;
- (SYLegacyStore)initWithService:(id)a3;
- (SYLegacyStore)initWithService:(id)a3 isGStore:(BOOL)a4 highPriority:(BOOL)a5;
- (SYLegacyStore)initWithService:(id)a3 isGStore:(BOOL)a4 highPriority:(BOOL)a5 isMasterStore:(BOOL)a6;
- (SYLegacyStore)initWithService:(id)a3 isGStore:(BOOL)a4 highPriority:(BOOL)a5 isMasterStore:(BOOL)a6 tracksChanges:(BOOL)a7;
- (SYLegacyStore)initWithService:(id)a3 isGStore:(BOOL)a4 priority:(int64_t)a5 isMasterStore:(BOOL)a6;
- (SYLegacyStore)initWithService:(id)a3 isGStore:(BOOL)a4 priority:(int64_t)a5 isMasterStore:(BOOL)a6 tracksChanges:(BOOL)a7;
- (SYPersistentStore)persistentStore;
- (SYVectorClock)vectorClock;
- (__CFString)loggingFacility;
- (double)timeToLive;
- (id)_batchChunkUnackedIndices;
- (id)_getPairedDeviceID;
- (id)_getPairingStorePath;
- (id)_pathForMessageCenterCache;
- (id)newFullSyncContext;
- (id)newMessageHeader;
- (id)nextBatchStep;
- (id)wrapMessage:(id)a3 ofType:(unsigned __int16)a4 respondingTo:(id)a5 userInfo:(id)a6;
- (int64_t)maxBytesInFlight;
- (int64_t)priority;
- (int64_t)state;
- (void)_copyPeerClockFromMessageHeaderIfNecessary:(id)a3;
- (void)_devicePaired:(id)a3;
- (void)_deviceUnpaired:(id)a3;
- (void)_handleIDSOverflowWithError:(id)a3;
- (void)_handleObjectChanges:(id)a3 contextInfo:(id)a4 idsOptions:(id)a5 blockUntilSent:(BOOL)a6 reportError:(id)a7 notifyingTransaction:(id)a8;
- (void)_listenForPrefsChangeNotifications;
- (void)_postBatchEndMessageWithState:(id)a3 error:(id)a4 then:(id)a5;
- (void)_postBatchStartMessageWithState:(id)a3 then:(id)a4;
- (void)_postVersionRejectedForMessageID:(id)a3;
- (void)_prefsChanged;
- (void)_recordLastSeqNo:(id)a3;
- (void)_restartBatchSyncWithState:(id)a3 then:(id)a4;
- (void)_retrySync;
- (void)_sendBatchChunk:(id)a3 withState:(id)a4 then:(id)a5;
- (void)_setupMessageCenter_LOCKED;
- (void)_syncEndedWithSyncID:(id)a3;
- (void)_transaction:(id)a3 context:(id)a4 idsOptions:(id)a5 blockUntilSent:(BOOL)a6 reportError:(id)a7;
- (void)_updateMessageCenterPrefs:(id)a3;
- (void)_vectorClockUpdated;
- (void)dealloc;
- (void)didEndDeltaSync;
- (void)handleBatchSyncChunk:(id)a3 response:(id)a4;
- (void)handleBatchSyncEnd:(id)a3 response:(id)a4;
- (void)handleBatchSyncStart:(id)a3;
- (void)handleChangeMessage:(id)a3;
- (void)handleFullSyncRequest:(id)a3 response:(id)a4;
- (void)handleObjectChanges:(id)a3 contextInfo:(id)a4 idsOptions:(id)a5 blockUntilSent:(BOOL)a6 reportError:(id)a7;
- (void)handleSyncAllObjects:(id)a3 response:(id)a4;
- (void)logChanges:(id)a3;
- (void)messageCenter:(id)a3 didReceiveUnknownRequest:(id)a4;
- (void)messageCenter:(id)a3 didResolveIDSIdentifier:(id)a4 forResponse:(id)a5;
- (void)messageCenter:(id)a3 didResolveIDSIdentifierForRequest:(id)a4;
- (void)messageCenter:(id)a3 didSuccessfullyDeliverRequestWithIdentifier:(id)a4 userInfo:(id)a5;
- (void)messageCenter:(id)a3 didSuccessfullySendRequestWithIdentifier:(id)a4 userInfo:(id)a5;
- (void)performFullSync;
- (void)performFullSyncIfNecessary;
- (void)performFullSyncIfNecessaryAskingDelegate:(BOOL)a3;
- (void)performFullSyncToCurrentDBVersion;
- (void)postUserNotification:(id)a3 message:(id)a4;
- (void)processBatchChunkAck:(unsigned int)a3;
- (void)processBatchSyncEnd:(unint64_t)a3;
- (void)processBatchSyncStart;
- (void)remoteStoreAllObjects:(id)a3 fromPeer:(id)a4 clock:(id)a5;
- (void)remoteStoreRequestFullSync;
- (void)sendChanges:(id)a3 context:(id)a4 options:(id)a5 sentSignal:(id)a6;
- (void)sendMessage:(id)a3 ofType:(unsigned __int16)a4 respondingTo:(id)a5 userInfo:(id)a6 idsOptions:(id)a7;
- (void)setAlwaysWins:(BOOL)a3;
- (void)setDatabaseFileName:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeliveryQOS:(unsigned int)a3;
- (void)setEncryptPayloads:(BOOL)a3;
- (void)setFullSyncWasRequestedBySlave:(BOOL)a3;
- (void)setLoggingFacility:(__CFString *)a3;
- (void)setMaxBytesInFlight:(int64_t)a3;
- (void)setMessageCenter:(id)a3;
- (void)setNeedsFullSyncWithContext:(id)a3 idsOptions:(id)a4;
- (void)setNextBatchStep:(id)a3;
- (void)setPairedDeviceID:(id)a3;
- (void)setPersistentStore:(id)a3;
- (void)setPriority:(int64_t)a3;
- (void)setQueue:(id)a3;
- (void)setRegisteredNotificationHandlers:(BOOL)a3;
- (void)setService:(id)a3;
- (void)setTimeToLive:(double)a3;
- (void)setTracksChanges:(BOOL)a3;
- (void)setVectorClock:(id)a3;
- (void)setupDatabase;
- (void)setupMessageCenter;
- (void)setupPairingNotifications;
- (void)willBeginDeltaSync;
@end

@implementation SYLegacyStore

+ (id)fullSyncActivityDictionary
{
  if (fullSyncActivityDictionary_onceToken != -1) {
    dispatch_once(&fullSyncActivityDictionary_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)fullSyncActivityDictionary___dict;
  return v2;
}

uint64_t __43__SYLegacyStore_fullSyncActivityDictionary__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:1];
  uint64_t v1 = fullSyncActivityDictionary___dict;
  fullSyncActivityDictionary___dict = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (SYLegacyStore)initWithService:(id)a3
{
  return [(SYLegacyStore *)self initWithService:a3 isGStore:0 highPriority:0];
}

- (SYLegacyStore)initWithService:(id)a3 isGStore:(BOOL)a4 highPriority:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v9 = (void *)MGCopyAnswer();
  v10 = -[SYLegacyStore initWithService:isGStore:highPriority:isMasterStore:](self, "initWithService:isGStore:highPriority:isMasterStore:", v8, v6, v5, [v9 intValue] != 6);

  return v10;
}

- (SYLegacyStore)initWithService:(id)a3 isGStore:(BOOL)a4 highPriority:(BOOL)a5 isMasterStore:(BOOL)a6
{
  return [(SYLegacyStore *)self initWithService:a3 isGStore:a4 priority:a5 isMasterStore:a6];
}

- (SYLegacyStore)initWithService:(id)a3 isGStore:(BOOL)a4 priority:(int64_t)a5 isMasterStore:(BOOL)a6
{
  return [(SYLegacyStore *)self initWithService:a3 isGStore:a4 priority:a5 isMasterStore:a6 tracksChanges:1];
}

- (SYLegacyStore)initWithService:(id)a3 isGStore:(BOOL)a4 highPriority:(BOOL)a5 isMasterStore:(BOOL)a6 tracksChanges:(BOOL)a7
{
  return [(SYLegacyStore *)self initWithService:a3 isGStore:a4 priority:a5 isMasterStore:a6 tracksChanges:a7];
}

- (SYLegacyStore)initWithService:(id)a3 isGStore:(BOOL)a4 priority:(int64_t)a5 isMasterStore:(BOOL)a6 tracksChanges:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v13 = a3;
  v39.receiver = self;
  v39.super_class = (Class)SYLegacyStore;
  v14 = [(SYStore *)&v39 init];
  v15 = v14;
  if (v14)
  {
    [(SYLegacyStore *)v14 setTracksChanges:v7];
    objc_storeStrong((id *)&v15->_service, a3);
    v15->_priority = a5;
    if ((unint64_t)a5 > 2) {
      v16 = 0;
    }
    else {
      v16 = off_264423190[a5];
    }
    v17 = [(SYLegacyStore *)v15 service];
    uint64_t v18 = [v17 stringByAppendingPathExtension:v16];
    databaseFileName = v15->_databaseFileName;
    v15->_databaseFileName = (NSString *)v18;

    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    v20 = _sync_log_facilities;
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v41 = v15;
      _os_log_impl(&dword_21C7C9000, v20, OS_LOG_TYPE_INFO, "Initializing new second-generation SYStore %p", buf, 0xCu);
    }
    v15->_alwaysWins = a6;
    uint64_t v21 = objc_opt_new();
    sendSignals = v15->_sendSignals;
    v15->_sendSignals = (NSMutableDictionary *)v21;

    v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"companionsync_serial.%p", v15);
    v24 = objc_msgSend([NSString alloc], "initWithFormat:", @"companionsync_serial_qos.%p", v15);
    id v25 = v23;
    dispatch_queue_t v26 = dispatch_queue_create((const char *)[v25 UTF8String], 0);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v26;

    id v28 = v24;
    v29 = (const char *)[v28 UTF8String];
    v30 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v31 = dispatch_queue_attr_make_with_qos_class(v30, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v32 = dispatch_queue_create(v29, v31);
    qosTargetQueue = v15->super._qosTargetQueue;
    v15->super._qosTargetQueue = (OS_dispatch_queue *)v32;

    dispatch_set_target_queue((dispatch_object_t)v15->_queue, (dispatch_queue_t)v15->super._qosTargetQueue);
    v34 = v15->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __79__SYLegacyStore_initWithService_isGStore_priority_isMasterStore_tracksChanges___block_invoke;
    block[3] = &unk_264422ED8;
    v37 = v15;
    BOOL v38 = a4;
    dispatch_sync(v34, block);
  }
  return v15;
}

uint64_t __79__SYLegacyStore_initWithService_isGStore_priority_isMasterStore_tracksChanges___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAllowsDeletes:1];
  [*(id *)(a1 + 32) setupPairingNotifications];
  v2 = [*(id *)(a1 + 32) _getPairedDeviceID];
  [*(id *)(a1 + 32) setPairedDeviceID:v2];

  v3 = [*(id *)(a1 + 32) pairedDeviceID];

  if (v3)
  {
    [*(id *)(a1 + 32) setupDatabase];
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    v4 = _sync_log_facilities;
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_21C7C9000, v4, OS_LOG_TYPE_DEFAULT, "No device available from NanoRegistry at present-- SYStore will be inoperative until pairing completes.", v8, 2u);
    }
  }
  [*(id *)(a1 + 32) setTimeToLive:3600.0];
  BOOL v5 = [MEMORY[0x263F57730] sharedInstance];
  BOOL v6 = [v5 pairingStorePath];

  if (v6) {
    objc_msgSend(*(id *)(a1 + 32), "_setupMessageCenter_LOCKED");
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 168) = *(unsigned char *)(a1 + 40);
  return [*(id *)(a1 + 32) _listenForPrefsChangeNotifications];
}

- (void)dealloc
{
  if (self->_service)
  {
    v3 = +[SYLegacyStore fullSyncActivityDictionary];
    [v3 removeObjectForKey:self->_service];
  }
  overflowRetryTimer = self->_overflowRetryTimer;
  if (overflowRetryTimer) {
    dispatch_source_cancel(overflowRetryTimer);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  BOOL v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)SYLegacyStore;
  [(SYLegacyStore *)&v7 dealloc];
}

- (id)_getPairedDeviceID
{
  v2 = [MEMORY[0x263F57730] sharedInstance];
  v3 = [v2 pairingID];

  return v3;
}

- (id)_getPairingStorePath
{
  v2 = [MEMORY[0x263F57730] sharedInstance];
  v3 = [v2 pairingStorePath];

  return v3;
}

- (id)_batchChunkUnackedIndices
{
  v2 = (void *)[(NSMutableIndexSet *)self->_batchChunkUnackedIndices copy];
  return v2;
}

- (void)_prefsChanged
{
  v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v4 = [v3 persistentDomainForName:@"com.apple.companionsync"];

  if (self->_messageCenter) {
    [(SYLegacyStore *)self _updateMessageCenterPrefs:v4];
  }
}

- (void)_updateMessageCenterPrefs:(id)a3
{
  id v11 = a3;
  id v4 = [v11 objectForKeyedSubscript:@"EnableTransmitWindow"];
  BOOL v5 = v4;
  if (!v4 || [v4 BOOLValue])
  {
    [(NMSMessageCenter *)self->_messageCenter setEnableTransmissionWindow:1];
    BOOL v6 = [v11 objectForKeyedSubscript:@"MaxMessagesInFlight"];

    if (v6) {
      uint64_t v7 = [v6 unsignedIntegerValue];
    }
    else {
      uint64_t v7 = 20;
    }
    [(NMSMessageCenter *)self->_messageCenter setMaxMessagesInFlight:v7];
    id v8 = [v11 objectForKeyedSubscript:@"MinMessagesInFlight"];

    if (v8) {
      uint64_t v9 = [v8 unsignedIntegerValue];
    }
    else {
      uint64_t v9 = 10;
    }
    [(NMSMessageCenter *)self->_messageCenter setMinMessagesInFlight:v9];
    BOOL v5 = [v11 objectForKeyedSubscript:@"MaxBytesInFlight"];

    if (v5) {
      uint64_t v10 = [v5 unsignedIntegerValue];
    }
    else {
      uint64_t v10 = 1000000;
    }
    [(NMSMessageCenter *)self->_messageCenter setMaxBytesInFlight:v10];
  }
}

- (void)_listenForPrefsChangeNotifications
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_PrefsChangedNotificationCallback, @"com.apple.companionsync.prefsupdated", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)setupPairingNotifications
{
  if (![(SYLegacyStore *)self registeredNotificationHandlers])
  {
    [(SYLegacyStore *)self setRegisteredNotificationHandlers:1];
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:self selector:sel__devicePaired_ name:*MEMORY[0x263F576A8] object:0];

    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:self selector:sel__deviceUnpaired_ name:*MEMORY[0x263F576B8] object:0];
  }
}

- (BOOL)isPaired
{
  v2 = [(SYLegacyStore *)self pairedDeviceID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setDeliveryQOS:(unsigned int)a3
{
  if ([(SYStore *)self deliveryQOS] != a3)
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __32__SYLegacyStore_setDeliveryQOS___block_invoke;
    v6[3] = &unk_264422B80;
    v6[4] = self;
    unsigned int v7 = a3;
    dispatch_async(queue, v6);
  }
}

void __32__SYLegacyStore_setDeliveryQOS___block_invoke(uint64_t a1)
{
  label = dispatch_queue_get_label(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 8));
  BOOL v3 = dispatch_queue_attr_make_with_qos_class(0, *(dispatch_qos_class_t *)(a1 + 40), 0);
  id v4 = dispatch_queue_create(label, v3);

  dispatch_set_target_queue(*(dispatch_object_t *)(*(void *)(a1 + 32) + 208), v4);
  uint64_t v5 = *(void *)(a1 + 32);
  BOOL v6 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v4;
}

- (int64_t)state
{
  if (![(SYPersistentStore *)self->_persistentStore inFullSync]) {
    return 0;
  }
  if ([(SYPersistentStore *)self->_persistentStore currentSyncSendComplete]) {
    return 2;
  }
  return 1;
}

- (int64_t)maxBytesInFlight
{
  v2 = [(SYLegacyStore *)self messageCenter];
  int64_t v3 = [v2 maxBytesInFlight];

  return v3;
}

- (void)setMaxBytesInFlight:(int64_t)a3
{
  id v4 = [(SYLegacyStore *)self messageCenter];
  [v4 setMaxBytesInFlight:a3];
}

- (BOOL)hasCompletedFullSync
{
  return [(SYPersistentStore *)self->_persistentStore completedSync];
}

- (BOOL)_isPairedWithDevice:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._qosTargetQueue);
  uint64_t v5 = [(SYLegacyStore *)self pairedDeviceID];
  BOOL v6 = (void *)v5;
  if (v4)
  {
    unsigned int v7 = [v4 valueForProperty:*MEMORY[0x263F57620]];
    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = v5 != 0;
  }

  return v8;
}

- (BOOL)_isUsingGenericCache
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._qosTargetQueue);
  int64_t v3 = [(SYLegacyStore *)self pairedDeviceID];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    uint64_t v5 = [(SYLegacyStore *)self persistentStore];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (void)_deviceUnpaired:(id)a3
{
  id v4 = a3;
  [(NMSMessageCenter *)self->_messageCenter _obliterate];
  qosTargetQueue = self->super._qosTargetQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__SYLegacyStore__deviceUnpaired___block_invoke;
  v7[3] = &unk_264422990;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(qosTargetQueue, v7);
}

void __33__SYLegacyStore__deviceUnpaired___block_invoke(uint64_t a1)
{
  os_activity_t v2 = _os_activity_create(&dword_21C7C9000, "CompanionSync Unpairing", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  int64_t v3 = [*(id *)(a1 + 32) userInfo];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F57680]];

  if (([*(id *)(a1 + 40) _isUsingGenericCache] & 1) != 0
    || [*(id *)(a1 + 40) _isPairedWithDevice:v4])
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v5 = _sync_log_facilities;
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C7C9000, v5, OS_LOG_TYPE_DEFAULT, "NR Device Unpaired", buf, 2u);
    }
    id v6 = [*(id *)(a1 + 40) queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __33__SYLegacyStore__deviceUnpaired___block_invoke_87;
    block[3] = &unk_264422AB0;
    void block[4] = *(void *)(a1 + 40);
    dispatch_async(v6, block);
  }
}

void __33__SYLegacyStore__deviceUnpaired___block_invoke_87(uint64_t a1)
{
  [*(id *)(a1 + 32) setPersistentStore:0];
  [*(id *)(a1 + 32) setPairedDeviceID:0];
  uint64_t v2 = *(void *)(a1 + 32);
  int64_t v3 = *(void **)(v2 + 232);
  *(void *)(v2 + 232) = 0;

  id v4 = *(_WORD **)(a1 + 32);
  if ((v4[8] & 0x1000) != 0)
  {
    id v5 = [v4 delegate];
    [v5 syncStoreDidUnpair:*(void *)(a1 + 32)];
  }
}

- (void)_devicePaired:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __31__SYLegacyStore__devicePaired___block_invoke;
  v7[3] = &unk_264422990;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __31__SYLegacyStore__devicePaired___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) pairedDeviceID];

  if (!v2)
  {
    id v5 = _os_activity_create(&dword_21C7C9000, "CompanionSync Pairing", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __31__SYLegacyStore__devicePaired___block_invoke_88;
    block[3] = &unk_264422AB0;
    void block[4] = *(void *)(a1 + 32);
    os_activity_apply(v5, block);
    uint64_t v10 = *(_WORD **)(a1 + 32);
    if ((v10[8] & 0x800) != 0)
    {
      id v11 = [v10 delegate];
      [v11 syncStoreDidSetupAfterPairing:*(void *)(a1 + 32)];
    }
    goto LABEL_8;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  int64_t v3 = (void *)_sync_log_facilities;
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = *(void **)(a1 + 40);
    id v5 = v3;
    id v6 = [v4 userInfo];
    unsigned int v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F57680]];
    id v8 = [v7 valueForProperty:*MEMORY[0x263F57620]];
    uint64_t v9 = [*(id *)(a1 + 32) pairedDeviceID];
    *(_DWORD *)buf = 138412546;
    v14 = v8;
    __int16 v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_21C7C9000, v5, OS_LOG_TYPE_DEFAULT, "Ignoring newly-paired device '%@' when already paired with device '%@'. Please file an enhancement request against Pepper CompanionSync for multiple-paired-device support if you see this message.", buf, 0x16u);

LABEL_8:
  }
}

uint64_t __31__SYLegacyStore__devicePaired___block_invoke_88(uint64_t a1)
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  uint64_t v2 = _sync_log_facilities;
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_DEFAULT, "NR Device Paired", v6, 2u);
  }
  int64_t v3 = [MEMORY[0x263F57730] sharedInstance];
  id v4 = [v3 pairingID];
  [*(id *)(a1 + 32) setPairedDeviceID:v4];

  [*(id *)(a1 + 32) setupDatabase];
  return objc_msgSend(*(id *)(a1 + 32), "_setupMessageCenter_LOCKED");
}

- (void)_vectorClockUpdated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(SYVectorClock *)self->_vectorClock jsonRepresentation];
  [(SYPersistentStore *)self->_persistentStore setVectorClockJSON:v3];
}

- (id)_pathForMessageCenterCache
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F57730] sharedInstance];
  id v3 = [v2 pairingStorePath];
  id v4 = [v3 stringByAppendingPathComponent:@"CompanionSync"];

  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v5 = _sync_log_facilities;
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl(&dword_21C7C9000, v5, OS_LOG_TYPE_DEFAULT, "Got pairing store path: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return v4;
}

- (BOOL)_checkMessageHeader:(id)a3 messageID:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 sequenceNumber];
  uint64_t v9 = (void *)MEMORY[0x263EFF910];
  [v6 timestamp];
  uint64_t v45 = objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
  uint64_t v10 = [(SYPersistentStore *)self->_persistentStore lastMessageReceived];
  id v11 = [(SYLegacyStore *)self persistentStore];
  v12 = [v6 sender];
  id v13 = [v12 peerID];
  int v14 = [v11 sequenceNumberIsDuplicate:v8 forPeer:v13];

  if (v14)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    __int16 v15 = v7;
    v16 = (void *)v45;
    uint64_t v17 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v47 = v8;
      __int16 v48 = 2114;
      uint64_t v49 = (uint64_t)v7;
      _os_log_impl(&dword_21C7C9000, v17, OS_LOG_TYPE_DEFAULT, "Possible duplicate message received with seqno %qu and ID %{public}@. Comparing timestamps.", buf, 0x16u);
    }
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v18 = (void *)qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      [v6 timestamp];
      uint64_t v21 = v20;
      [v10 timeIntervalSinceReferenceDate];
      *(_DWORD *)buf = 134218754;
      uint64_t v47 = v21;
      __int16 v48 = 2114;
      uint64_t v49 = v45;
      __int16 v50 = 2048;
      uint64_t v51 = v22;
      __int16 v52 = 2114;
      v53 = v10;
      _os_log_impl(&dword_21C7C9000, v19, OS_LOG_TYPE_DEFAULT, "This message timestamp = %.04g (%{public}@) vs. last message timestamp = %.04g (%{public}@)", buf, 0x2Au);
    }
    v23 = [v10 earlierDate:v45];

    if (v23 != v10)
    {
      v24 = +[SYTransportLog sharedInstance];
      id v25 = [v24 oslog];

      if (os_log_type_enabled(v25, (os_log_type_t)0x90u)) {
        -[SYLegacyStore _checkMessageHeader:messageID:]((uint64_t)v7, v8, v25);
      }

LABEL_35:
      BOOL v42 = 0;
      goto LABEL_36;
    }
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    dispatch_queue_t v26 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C7C9000, v26, OS_LOG_TYPE_DEFAULT, "Sequence numbers were reset; clearing our received seqno set.",
        buf,
        2u);
    }
    persistentStore = self->_persistentStore;
    id v28 = [v6 sender];
    v29 = [v28 peerID];
    [(SYPersistentStore *)persistentStore resetSequenceNumbersForPeer:v29];
  }
  v30 = [(SYLegacyStore *)self persistentStore];
  v31 = [v6 sender];
  dispatch_queue_t v32 = [v31 peerID];
  uint64_t v33 = [v30 lastSequenceNumberForPeerID:v32];

  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  __int16 v15 = v7;
  v34 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v47 = v8;
    __int16 v48 = 2048;
    uint64_t v49 = v33;
    _os_log_impl(&dword_21C7C9000, v34, OS_LOG_TYPE_INFO, "Received seqno=%llu, last seen=%llu", buf, 0x16u);
  }
  if (v8 != v33 + 1)
  {
    v35 = +[SYTransportLog sharedInstance];
    v36 = [v35 oslog];

    if (os_log_type_enabled(v36, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138543874;
      uint64_t v47 = (uint64_t)v7;
      __int16 v48 = 2048;
      uint64_t v49 = v8;
      __int16 v50 = 2048;
      uint64_t v51 = v33;
      _os_log_error_impl(&dword_21C7C9000, v36, (os_log_type_t)0x90u, "Out of order delivery or dropped message detected on receipt of message with ID %{public}@. Message sequence number = %llu, last received sequence number = %llu", buf, 0x20u);
    }

    if (+[SYLogs shouldDisplaySyncErrorMessage])
    {
      v37 = [(SYLegacyStore *)self service];
      BOOL v38 = _ClientNameForServiceName(v37);
      objc_super v39 = [@"Message out of order in " stringByAppendingString:v38];
      [(SYLegacyStore *)self postUserNotification:v39 message:@"File against Pepper CompanionSync|1.0, attach all logs"];
    }
  }
  if ([v6 version] >= 2)
  {
    v16 = (void *)v45;
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    v43 = (void *)qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR)) {
      -[SYLegacyStore _checkMessageHeader:messageID:](v43);
    }
    [(SYLegacyStore *)self _postVersionRejectedForMessageID:v7];
    goto LABEL_35;
  }
  v40 = objc_opt_new();
  v41 = [(SYLegacyStore *)self persistentStore];
  [v41 setLastMessageReceived:v40];

  BOOL v42 = 1;
  v16 = (void *)v45;
LABEL_36:

  return v42;
}

- (void)_postVersionRejectedForMessageID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__SYLegacyStore__postVersionRejectedForMessageID___block_invoke;
  v7[3] = &unk_264422990;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __50__SYLegacyStore__postVersionRejectedForMessageID___block_invoke(uint64_t a1)
{
  id v3 = (id)objc_opt_new();
  uint64_t v2 = (void *)[*(id *)(a1 + 32) newMessageHeader];
  [v3 setHeader:v2];

  [v3 setInReplyTo:*(void *)(a1 + 40)];
  [v3 setSupportedVersions:&_postVersionRejectedForMessageID__supportedVersions count:2];
  [*(id *)(a1 + 32) sendMessage:v3 ofType:0x7FFFLL respondingTo:0 userInfo:0 idsOptions:0];
}

- (void)_recordLastSeqNo:(id)a3
{
  id v4 = a3;
  id v5 = [(SYLegacyStore *)self persistentStore];
  uint64_t v6 = [v4 sequenceNumber];
  id v7 = [v4 sender];

  id v8 = [v7 peerID];
  id v12 = 0;
  char v9 = [v5 setLastSequenceNumber:v6 fromPeer:v8 error:&v12];
  id v10 = v12;

  if ((v9 & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v11 = (void *)_sync_log_facilities;
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_ERROR)) {
      -[SYLegacyStore _recordLastSeqNo:](v11);
    }
  }
}

- (void)_handleIDSOverflowWithError:(id)a3
{
  id v5 = a3;
  if (!self->_overflowRetryTimer)
  {
    uint64_t v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_queue);
    overflowRetryTimer = self->_overflowRetryTimer;
    self->_overflowRetryTimer = v6;

    objc_storeStrong((id *)&self->_overflowRetryError, a3);
    objc_initWeak(&location, self);
    id v8 = self->_overflowRetryTimer;
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    int v14 = __45__SYLegacyStore__handleIDSOverflowWithError___block_invoke;
    __int16 v15 = &unk_264422C90;
    objc_copyWeak(&v16, &location);
    dispatch_source_set_event_handler(v8, &v12);
    char v9 = self->_overflowRetryTimer;
    dispatch_time_t v10 = dispatch_time(0, 300000000000);
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x6FC23AC00uLL);
    dispatch_resume((dispatch_object_t)self->_overflowRetryTimer);
    id v11 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceNow:", 300.0, v12, v13, v14, v15);
    [(SYPersistentStore *)self->_persistentStore setOverflowResyncTime:v11];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __45__SYLegacyStore__handleIDSOverflowWithError___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained;
    [WeakRetained[23] setOverflowResyncTime:0];
    [v2 setNeedsFullSync];
    WeakRetained = v2;
  }
}

- (void)setupMessageCenter
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__SYLegacyStore_setupMessageCenter__block_invoke;
  block[3] = &unk_264422AB0;
  void block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __35__SYLegacyStore_setupMessageCenter__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupMessageCenter_LOCKED");
}

- (void)_setupMessageCenter_LOCKED
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_21C7C9000, v0, v1, "Creating NanoMessageCenter", v2, v3, v4, v5, v6);
}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke(uint64_t a1, void *a2)
{
  id v19 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = +[SYStatisticStore sharedInstance];
    uint64_t v5 = [WeakRetained service];
    [v4 recordIncomingMessage:v19 forService:v5];

    uint8_t v6 = [v19 pbRequest];
    id v7 = [v6 header];
    id v8 = [v19 idsIdentifier];
    char v9 = [WeakRetained _checkMessageHeader:v7 messageID:v8];

    if (v9)
    {
      dispatch_time_t v10 = objc_opt_new();
      id v11 = [v6 syncID];
      [v10 setRequestSyncID:v11];

      uint64_t v12 = [v19 pbRequest];
      [WeakRetained handleFullSyncRequest:v12 response:v10];

      uint64_t v13 = [v19 response];
      [v13 setPbResponse:v10];

      int v14 = +[SYStatisticStore sharedInstance];
      __int16 v15 = [v19 response];
      id v16 = [WeakRetained service];
      [v14 recordOutgoingMessage:v15 forService:v16];

      uint64_t v17 = [v19 response];
      [v17 send];

      uint64_t v18 = [v6 header];
      [WeakRetained _recordLastSeqNo:v18];
    }
    else
    {
      [v19 setExpectsResponse:0];
    }
  }
}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_2(uint64_t a1, void *a2)
{
  id v18 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = +[SYStatisticStore sharedInstance];
    uint64_t v5 = [WeakRetained service];
    [v4 recordIncomingMessage:v18 forService:v5];

    uint8_t v6 = [v18 pbRequest];
    id v7 = [v6 header];
    id v8 = [v18 idsIdentifier];
    char v9 = [WeakRetained _checkMessageHeader:v7 messageID:v8];

    if (v9)
    {
      dispatch_time_t v10 = objc_opt_new();
      id v11 = [v6 syncID];
      [v10 setSyncID:v11];

      [WeakRetained handleSyncAllObjects:v6 response:v10];
      uint64_t v12 = [v18 response];
      [v12 setPbResponse:v10];

      uint64_t v13 = +[SYStatisticStore sharedInstance];
      int v14 = [v18 response];
      __int16 v15 = [WeakRetained service];
      [v13 recordOutgoingMessage:v14 forService:v15];

      id v16 = [v18 response];
      [v16 send];

      uint64_t v17 = [v6 header];
      [WeakRetained _recordLastSeqNo:v17];
    }
    else
    {
      [v18 setExpectsResponse:0];
    }
  }
}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_3(uint64_t a1, void *a2)
{
  id v11 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = +[SYStatisticStore sharedInstance];
    uint64_t v5 = [WeakRetained service];
    [v4 recordIncomingMessage:v11 forService:v5];

    uint8_t v6 = [v11 pbRequest];
    id v7 = [v6 header];
    id v8 = [v11 idsIdentifier];
    int v9 = [WeakRetained _checkMessageHeader:v7 messageID:v8];

    if (v9)
    {
      [WeakRetained handleBatchSyncStart:v6];
      dispatch_time_t v10 = [v6 header];
      [WeakRetained _recordLastSeqNo:v10];
    }
  }
}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_4(uint64_t a1, void *a2)
{
  id v18 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = +[SYStatisticStore sharedInstance];
    uint64_t v5 = [WeakRetained service];
    [v4 recordIncomingMessage:v18 forService:v5];

    uint8_t v6 = [v18 pbRequest];
    id v7 = [v6 header];
    id v8 = [v18 idsIdentifier];
    char v9 = [WeakRetained _checkMessageHeader:v7 messageID:v8];

    if (v9)
    {
      dispatch_time_t v10 = objc_opt_new();
      id v11 = [v6 syncID];
      [v10 setSyncID:v11];

      [WeakRetained handleBatchSyncEnd:v6 response:v10];
      uint64_t v12 = [v18 response];
      [v12 setPbResponse:v10];

      uint64_t v13 = +[SYStatisticStore sharedInstance];
      int v14 = [v18 response];
      __int16 v15 = [WeakRetained service];
      [v13 recordOutgoingMessage:v14 forService:v15];

      id v16 = [v18 response];
      [v16 send];

      uint64_t v17 = [v6 header];
      [WeakRetained _recordLastSeqNo:v17];
    }
    else
    {
      [v18 setExpectsResponse:0];
    }
  }
}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_5(uint64_t a1, void *a2)
{
  id v18 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = +[SYStatisticStore sharedInstance];
    uint64_t v5 = [WeakRetained service];
    [v4 recordIncomingMessage:v18 forService:v5];

    uint8_t v6 = [v18 pbRequest];
    id v7 = [v6 header];
    id v8 = [v18 idsIdentifier];
    char v9 = [WeakRetained _checkMessageHeader:v7 messageID:v8];

    if (v9)
    {
      dispatch_time_t v10 = objc_opt_new();
      id v11 = [v6 syncID];
      [v10 setSyncID:v11];

      [WeakRetained handleBatchSyncChunk:v6 response:v10];
      uint64_t v12 = [v18 response];
      [v12 setPbResponse:v10];

      uint64_t v13 = +[SYStatisticStore sharedInstance];
      int v14 = [v18 response];
      __int16 v15 = [WeakRetained service];
      [v13 recordOutgoingMessage:v14 forService:v15];

      id v16 = [v18 response];
      [v16 send];

      uint64_t v17 = [v6 header];
      [WeakRetained _recordLastSeqNo:v17];
    }
    else
    {
      [v18 setExpectsResponse:0];
    }
  }
}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_6(uint64_t a1, void *a2)
{
  id v11 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = +[SYStatisticStore sharedInstance];
    uint64_t v5 = [WeakRetained service];
    [v4 recordIncomingMessage:v11 forService:v5];

    uint8_t v6 = [v11 pbRequest];
    id v7 = [v6 header];
    id v8 = [v11 idsIdentifier];
    int v9 = [WeakRetained _checkMessageHeader:v7 messageID:v8];

    if (v9)
    {
      [WeakRetained handleChangeMessage:v6];
      dispatch_time_t v10 = [v6 header];
      [WeakRetained _recordLastSeqNo:v10];
    }
  }
}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = +[SYStatisticStore sharedInstance];
    uint8_t v6 = [WeakRetained service];
    [v5 recordIncomingMessage:v3 forService:v6];

    id v7 = [v3 pbRequest];
    id v8 = objc_opt_new();
    if ([v7 supportedVersionsCount])
    {
      unint64_t v9 = 0;
      do
        objc_msgSend(v8, "addIndex:", objc_msgSend(v7, "supportedVersionsAtIndex:", v9++));
      while (v9 < [v7 supportedVersionsCount]);
    }
    dispatch_time_t v10 = +[SYTransportLog sharedInstance];
    id v11 = [v10 oslog];

    if (os_log_type_enabled(v11, (os_log_type_t)0x90u)) {
      __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_7_cold_1();
    }

    uint64_t v12 = [WeakRetained persistentStore];
    uint64_t v13 = [v7 header];
    int v14 = [v13 sender];
    __int16 v15 = [v14 peerID];
    uint64_t v16 = [v12 lastSequenceNumberForPeerID:v15];

    uint64_t v17 = [v7 header];
    uint64_t v18 = [v17 sequenceNumber];

    if (v18 == v16 + 1)
    {
      id v19 = [v7 header];
      [WeakRetained _recordLastSeqNo:v19];
    }
  }
}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_115(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = +[SYStatisticStore sharedInstance];
    uint8_t v6 = [WeakRetained service];
    [v5 recordIncomingMessage:v3 forService:v6];

    id v7 = [v3 pbResponse];
    id v8 = [v7 header];
    unint64_t v9 = [v3 idsIdentifier];
    int v10 = [WeakRetained _checkMessageHeader:v8 messageID:v9];

    if (v10)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v11 = (void *)qword_26AB04788;
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
        __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_115_cold_1(v11, v7);
      }
      if (([v7 accepted] & 1) == 0 && objc_msgSend(v7, "hasInProgressSyncID"))
      {
        uint64_t v12 = [*((id *)WeakRetained + 23) lastSyncEndID];
        uint64_t v13 = [v7 inProgressSyncID];
        int v14 = [v12 isEqualToString:v13];

        if (v14)
        {
          if (_sync_log_facilities_pred != -1) {
            _os_once();
          }
          __int16 v15 = qword_26AB04788;
          if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21C7C9000, v15, OS_LOG_TYPE_DEFAULT, "In-progress sync has finished, now requesting another.", buf, 2u);
          }
          dispatch_time_t v16 = dispatch_time(0, 200000000);
          uint64_t v17 = *((void *)WeakRetained + 26);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_121;
          block[3] = &unk_264422AB0;
          uint64_t v18 = &v30;
          id v30 = WeakRetained;
          dispatch_after(v16, v17, block);
        }
        else
        {
          id v19 = [v7 inProgressSyncID];
          [*((id *)WeakRetained + 23) setWaitingForSyncEndID:v19];

          if (_sync_log_facilities_pred != -1) {
            _os_once();
          }
          uint64_t v20 = (void *)qword_26AB04788;
          if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v21 = v20;
            uint64_t v22 = [v7 inProgressSyncID];
            *(_DWORD *)buf = 138543362;
            dispatch_queue_t v32 = v22;
            _os_log_impl(&dword_21C7C9000, v21, OS_LOG_TYPE_DEFAULT, "Waiting for in-progress sync %{public}@ to end before re-sending sync request.", buf, 0xCu);
          }
          dispatch_time_t v23 = dispatch_time(0, 3600000000000);
          v24 = *((void *)WeakRetained + 26);
          v26[0] = MEMORY[0x263EF8330];
          v26[1] = 3221225472;
          v26[2] = __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_122;
          v26[3] = &unk_264422990;
          uint64_t v18 = &v27;
          id v27 = WeakRetained;
          id v28 = v7;
          dispatch_after(v23, v24, v26);
        }
      }
      id v25 = [v7 header];
      [WeakRetained _recordLastSeqNo:v25];
    }
  }
}

uint64_t __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_121(uint64_t a1)
{
  return [*(id *)(a1 + 32) performFullSyncToCurrentDBVersion];
}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_122(uint64_t a1)
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  uint64_t v2 = (void *)qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR)) {
    __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_122_cold_1(a1, v2);
  }
  id v3 = [*(id *)(*(void *)(a1 + 32) + 184) waitingForSyncEndID];
  uint64_t v4 = [*(id *)(a1 + 40) inProgressSyncID];
  char v5 = [v3 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 184) setWaitingForSyncEndID:0];
    [*(id *)(a1 + 32) performFullSyncToCurrentDBVersion];
  }
}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_124(uint64_t a1, void *a2)
{
  id v11 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = +[SYStatisticStore sharedInstance];
    char v5 = [WeakRetained service];
    [v4 recordIncomingMessage:v11 forService:v5];

    uint8_t v6 = [v11 pbResponse];
    id v7 = [v6 header];
    id v8 = [v11 idsIdentifier];
    int v9 = [WeakRetained _checkMessageHeader:v7 messageID:v8];

    if (v9)
    {
      objc_msgSend(WeakRetained, "processBatchChunkAck:", objc_msgSend(v6, "chunkIndex"));
      int v10 = [v6 header];
      [WeakRetained _recordLastSeqNo:v10];
    }
  }
}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_2_125(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    char v5 = +[SYStatisticStore sharedInstance];
    uint8_t v6 = [WeakRetained service];
    [v5 recordIncomingMessage:v3 forService:v6];

    id v7 = [v3 pbResponse];
    id v8 = [v7 header];
    int v9 = [v3 idsIdentifier];
    int v10 = [WeakRetained _checkMessageHeader:v8 messageID:v9];

    if (v10)
    {
      id v11 = [v7 syncID];
      uint64_t v12 = [WeakRetained[23] currentFullSyncID];
      int v13 = [v11 isEqualToString:v12];

      if (v13)
      {
        int v14 = (void *)MEMORY[0x263F087E8];
        __int16 v15 = [v7 error];
        dispatch_time_t v16 = [v14 errorFromSYErrorInfo:v15];

        if (([v7 hasError] & 1) == 0 && objc_msgSend(WeakRetained[13], "count"))
        {
          if (+[SYLogs shouldDisplaySyncErrorMessage])
          {
            uint64_t v17 = *(void **)(a1 + 32);
            uint64_t v18 = [WeakRetained service];
            id v19 = _ClientNameForServiceName(v18);
            uint64_t v20 = [@"Unacked batch while syncing " stringByAppendingString:v19];
            [v17 postUserNotification:v20 message:@"File against Pepper CompanionSync|1.0"];
          }
          uint64_t v21 = +[SYTransportLog sharedInstance];
          uint64_t v22 = [v21 oslog];

          if (os_log_type_enabled(v22, (os_log_type_t)0x90u)) {
            __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_2_125_cold_1();
          }

          uint64_t v23 = [MEMORY[0x263F087E8] errorWithSYError:1003 userInfo:0];

          [WeakRetained[13] removeAllIndexes];
          dispatch_time_t v16 = (void *)v23;
        }
        [WeakRetained[23] clearAllChanges];
        [WeakRetained[23] setCompletedSync:1];
        id v24 = WeakRetained[23];
        id v25 = [v7 syncID];
        [v24 exitFullSyncWithID:v25 error:v16];

        if (((_WORD)WeakRetained[2] & 8) != 0)
        {
          dispatch_queue_t v26 = [WeakRetained delegate];
          [v26 syncStoreDidCompleteFullSync:WeakRetained];
        }
        if (v16) {
          [WeakRetained _retrySync];
        }
      }
      id v27 = [v7 header];
      [WeakRetained _recordLastSeqNo:v27];
    }
  }
}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_133(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    goto LABEL_34;
  }
  char v5 = [v3 domain];
  if (![v5 isEqualToString:*MEMORY[0x263F49E40]])
  {

    goto LABEL_8;
  }
  if ([v3 code] == 32)
  {
  }
  else
  {
    uint64_t v6 = [v3 code];

    if (v6 != 33) {
      goto LABEL_8;
    }
  }
  [WeakRetained _handleIDSOverflowWithError:v3];
LABEL_8:
  id v7 = [v3 domain];
  if (![v7 isEqualToString:@"NMSErrorDomain"])
  {

    goto LABEL_16;
  }
  uint64_t v8 = [v3 code];

  if (v8 != 1)
  {
LABEL_16:
    uint64_t v12 = [v3 domain];
    if (![v12 isEqualToString:@"NMSErrorDomain"])
    {

      goto LABEL_23;
    }
    uint64_t v13 = [v3 code];

    if (v13 != 2) {
      goto LABEL_23;
    }
    int v14 = [v3 idsIdentifier];

    if (!v14) {
      goto LABEL_23;
    }
    int v9 = +[SYStatisticStore sharedInstance];
    int v10 = [v3 idsIdentifier];
    [v9 updateOutgoingMessageWithIdentifier:v10 didReceiveResponse:0 error:v3];
    goto LABEL_20;
  }
  int v9 = [v3 idsIdentifier];
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG))
  {
    __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_133_cold_2();
    if (!v9) {
      goto LABEL_21;
    }
    goto LABEL_14;
  }
  if (v9)
  {
LABEL_14:
    int v10 = +[SYStatisticStore sharedInstance];
    id v11 = [WeakRetained service];
    [v10 updateOutgoingMessageWithIdentifier:v9 forService:v11 sentSuccessfully:0 sendError:v3];

LABEL_20:
  }
LABEL_21:

LABEL_23:
  if ((*((_WORD *)WeakRetained + 8) & 0x400) != 0)
  {
    __int16 v15 = [WeakRetained delegate];
    dispatch_time_t v16 = [v3 persistentUserInfo];
    [v15 syncStore:WeakRetained encounteredError:v3 context:v16];
  }
  if ([WeakRetained inFullSync])
  {
    uint64_t v17 = (void *)*((void *)WeakRetained + 23);
    uint64_t v18 = [v17 currentFullSyncID];
    [v17 exitFullSyncWithID:v18 error:v3];

    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v19 = (void *)qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR)) {
      __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_133_cold_1(v19);
    }
  }
  if (*(unsigned __int16 *)(a1 + 40) - 3 > 2)
  {
    [WeakRetained _retrySync];
  }
  else
  {
    uint64_t v20 = [WeakRetained nextBatchStep];

    if (v20)
    {
      uint64_t v21 = [WeakRetained nextBatchStep];
      ((void (**)(void, id, void))v21)[2](v21, v3, 0);
    }
  }
LABEL_34:
}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_135(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    goto LABEL_16;
  }
  char v5 = [v3 domain];
  if (![v5 isEqualToString:*MEMORY[0x263F49E40]])
  {

    goto LABEL_8;
  }
  if ([v3 code] == 32)
  {
  }
  else
  {
    uint64_t v6 = [v3 code];

    if (v6 != 33) {
      goto LABEL_8;
    }
  }
  [WeakRetained _handleIDSOverflowWithError:v3];
LABEL_8:
  id v7 = [v3 idsIdentifier];
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG))
  {
    __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_133_cold_2();
    if (!v7) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v7)
  {
LABEL_12:
    uint64_t v8 = +[SYStatisticStore sharedInstance];
    int v9 = [WeakRetained service];
    [v8 updateOutgoingMessageWithIdentifier:v7 forService:v9 sentSuccessfully:0 sendError:v3];
  }
LABEL_13:
  if ((WeakRetained[8] & 0x400) != 0)
  {
    int v10 = [WeakRetained delegate];
    id v11 = [v3 persistentUserInfo];
    [v10 syncStore:WeakRetained encounteredError:v3 context:v11];
  }
LABEL_16:
}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_136(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained;
    [WeakRetained[23] setOverflowResyncTime:0];
    [v2 setNeedsFullSync];
    id WeakRetained = v2;
  }
}

- (void)setupDatabase
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_21C7C9000, v0, v1, "SYStore has a NIL PERSISTENT STORE !!", v2, v3, v4, v5, v6);
}

- (void)setDelegate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SYLegacyStore;
  -[SYStore setDelegate:](&v6, sel_setDelegate_);
  messageCenter = self->_messageCenter;
  if (a3)
  {
    if (messageCenter)
    {
      [(NMSMessageCenter *)messageCenter resume];
      [(SYLegacyStore *)self performFullSyncIfNecessaryAskingDelegate:1];
    }
  }
  else
  {
    self->_messageCenter = 0;
  }
}

- (double)timeToLive
{
  uint64_t v2 = [(SYLegacyStore *)self persistentStore];
  [v2 timeToLive];
  double v4 = v3;

  return v4;
}

- (void)setTimeToLive:(double)a3
{
  id v4 = [(SYLegacyStore *)self persistentStore];
  [v4 setTimeToLive:a3];
}

- (BOOL)inFullSync
{
  return [(SYPersistentStore *)self->_persistentStore inFullSync];
}

- (void)postUserNotification:(id)a3 message:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = (__CFString *)a3;
  objc_super v6 = (__CFString *)a4;
  if (+[SYLogs shouldDumpIDSOnSyncError]
    && MGGetBoolAnswer()
    && (_shouldDumpIDSOnSyncErrorOnce & 1) == 0)
  {
    _shouldDumpIDSOnSyncErrorOnce = 1;
    CFUserNotificationDisplayNotice(0.0, 0, 0, 0, 0, v5, v6, 0);
    *(_OWORD *)__argv = xmmword_264422FC0;
    uint64_t v10 = 0;
    pid_t v8 = 0;
    id v7 = _NSGetEnviron();
    posix_spawn(&v8, "/usr/local/bin/idstool", 0, 0, __argv, *v7);
  }
}

- (void)_copyPeerClockFromMessageHeaderIfNecessary:(id)a3
{
  id v4 = a3;
  vectorClock = self->_vectorClock;
  id v11 = v4;
  objc_super v6 = [v4 sender];
  LOBYTE(vectorClock) = [(SYVectorClock *)vectorClock hasClockForPeer:v6];

  if ((vectorClock & 1) == 0)
  {
    id v7 = self->_vectorClock;
    pid_t v8 = [v11 state];
    int v9 = [v11 sender];
    uint64_t v10 = [v8 clockForPeer:v9];
    [(SYVectorClock *)v7 addClocks:v10];

    [(SYLegacyStore *)self _vectorClockUpdated];
  }
}

- (BOOL)peerState:(id)a3 fromPeer:(id)a4 matchesExpectationForChangeCount:(unint64_t)a5 offsetAmount:(unint64_t *)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  p_vectorClock = &self->_vectorClock;
  if ([(SYVectorClock *)self->_vectorClock hasClockForPeer:v11])
  {
    uint64_t v13 = [(SYPersistentStore *)self->_persistentStore peerID];
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
      -[SYLegacyStore peerState:fromPeer:matchesExpectationForChangeCount:offsetAmount:]();
    }
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    unint64_t v26 = a5;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
      -[SYLegacyStore peerState:fromPeer:matchesExpectationForChangeCount:offsetAmount:]();
    }
    unint64_t v14 = -[SYVectorClock clockValueForPeerID:](*p_vectorClock, "clockValueForPeerID:", v13, a6);
    unint64_t v15 = [v10 clockValueForPeerID:v13];
    uint64_t v16 = [(SYVectorClock *)*p_vectorClock clockValueForPeer:v11];
    uint64_t v17 = [v10 clockValueForPeer:v11];
    if (v15 > v14)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR)) {
        -[SYLegacyStore peerState:fromPeer:matchesExpectationForChangeCount:offsetAmount:]();
      }
      goto LABEL_15;
    }
    uint64_t v19 = v17;
    if (v15 != v14)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      uint64_t v20 = qword_26AB04788;
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        unint64_t v28 = v14;
        __int16 v29 = 2048;
        unint64_t v30 = v15;
        _os_log_impl(&dword_21C7C9000, v20, OS_LOG_TYPE_DEFAULT, "Accepting change list from peer that has not received my latest updates: %llu vs. %llu", buf, 0x16u);
      }
    }
    BOOL v21 = [(SYVectorClock *)*p_vectorClock hasClockForPeer:v11];
    BOOL v18 = 1;
    if (!v21 || v19 == v16 + v26 || v19 == v16 + 1) {
      goto LABEL_32;
    }
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v22 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      unint64_t v28 = v16;
      __int16 v29 = 2048;
      unint64_t v30 = v19;
      __int16 v31 = 1024;
      int v32 = v26;
      _os_log_error_impl(&dword_21C7C9000, v22, OS_LOG_TYPE_ERROR, "Peer state doesn't match my expectation-- likely a message is missing. I have %llu, they sent %llu, there are %u changes incoming", buf, 0x1Cu);
      if (v25) {
        goto LABEL_29;
      }
    }
    else if (v25)
    {
LABEL_29:
      BOOL v18 = 0;
      uint64_t v23 = v16 - (v19 + v26);
      if (v23 < 0) {
        uint64_t v23 = v19 + v26 - v16;
      }
      *id v25 = v23;
      goto LABEL_32;
    }
LABEL_15:
    BOOL v18 = 0;
LABEL_32:

    goto LABEL_33;
  }
  BOOL v18 = 1;
LABEL_33:

  return v18;
}

- (void)handleFullSyncRequest:(id)a3 response:(id)a4
{
  id v6 = a3;
  persistentStore = self->_persistentStore;
  id v8 = a4;
  int v9 = [(SYPersistentStore *)persistentStore currentFullSyncID];

  if (v9)
  {
    id v10 = [(SYLegacyStore *)self newMessageHeader];
    [v8 setHeader:v10];

    [v8 setAccepted:0];
    id v11 = [SYErrorInfo alloc];
    uint64_t v12 = [MEMORY[0x263F087E8] errorWithSYError:1002 userInfo:0];
    uint64_t v13 = [(SYErrorInfo *)v11 initWithError:v12];
    [v8 setError:v13];

    unint64_t v14 = [(SYPersistentStore *)self->_persistentStore currentFullSyncID];
    [v8 setInProgressSyncID:v14];
  }
  else
  {
    unint64_t v15 = self->_persistentStore;
    uint64_t v16 = [v6 syncID];
    [(SYPersistentStore *)v15 enterFullSyncWithID:v16 ignoring:0];

    id v17 = [(SYLegacyStore *)self newMessageHeader];
    [v8 setHeader:v17];

    [v8 setAccepted:1];
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__SYLegacyStore_handleFullSyncRequest_response___block_invoke;
    block[3] = &unk_264422AB0;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

uint64_t __48__SYLegacyStore_handleFullSyncRequest_response___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) remoteStoreRequestFullSync];
}

- (BOOL)_shouldIgnoreSyncID:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(SYPersistentStore *)self->_persistentStore currentFullSyncID];
  id v6 = v5;
  if (!v5
    || ([v5 hasPrefix:@"InitialSync"] & 1) != 0
    || ([v6 isEqualToString:v4] & 1) != 0
    || [(SYPersistentStore *)self->_persistentStore canStartNewSyncSession])
  {
    BOOL v7 = 0;
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    int v9 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543618;
      id v11 = v4;
      __int16 v12 = 2114;
      uint64_t v13 = v6;
      _os_log_impl(&dword_21C7C9000, v9, OS_LOG_TYPE_DEFAULT, "Skipping one sync message (syncID %{public}@) while waiting for another (syncID %{public}@)", (uint8_t *)&v10, 0x16u);
    }
    BOOL v7 = 1;
  }

  return v7;
}

- (BOOL)_shouldSkipNonSyncMessages
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(SYPersistentStore *)self->_persistentStore currentFullSyncID];
  if (v3)
  {
    id v4 = (void *)v3;
    BOOL v5 = [(SYPersistentStore *)self->_persistentStore canStartNewSyncSession];

    if (v5)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v6 = (void *)qword_26AB04788;
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
      {
        persistentStore = self->_persistentStore;
        id v8 = v6;
        int v9 = [(SYPersistentStore *)persistentStore currentFullSyncID];
        int v11 = 138543362;
        __int16 v12 = v9;
        _os_log_impl(&dword_21C7C9000, v8, OS_LOG_TYPE_DEFAULT, "Skipping while waiting for sync; fullSyncIdentifier == '%{public}@'",
          (uint8_t *)&v11,
          0xCu);
      }
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)_syncEndedWithSyncID:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(SYPersistentStore *)self->_persistentStore exitFullSyncWithID:v4 error:0];
  [(SYPersistentStore *)self->_persistentStore clearAllChanges];
  BOOL v5 = [(SYPersistentStore *)self->_persistentStore waitingForSyncEndID];
  int v6 = [v5 isEqualToString:v4];

  if (v6)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    BOOL v7 = (void *)qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      persistentStore = self->_persistentStore;
      int v9 = v7;
      int v10 = [(SYPersistentStore *)persistentStore waitingForSyncEndID];
      *(_DWORD *)buf = 138543618;
      id v14 = v4;
      __int16 v15 = 2114;
      uint64_t v16 = v10;
      _os_log_impl(&dword_21C7C9000, v9, OS_LOG_TYPE_DEFAULT, "Sync %{public}@ has finished, and I'm waiting for sync %{public}@ to finish, and they match. Triggering full-sync now.", buf, 0x16u);
    }
    [(SYPersistentStore *)self->_persistentStore setWaitingForSyncEndID:0];
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __38__SYLegacyStore__syncEndedWithSyncID___block_invoke;
    block[3] = &unk_264422AB0;
    void block[4] = self;
    dispatch_async(queue, block);
  }
  else
  {
    [(SYPersistentStore *)self->_persistentStore setFullSyncUserInfo:0];
    [(SYPersistentStore *)self->_persistentStore setFullSyncIDSOptions:0];
    if (![(SYLegacyStore *)self alwaysWins]) {
      [(SYPersistentStore *)self->_persistentStore setCompletedSync:1];
    }
  }
}

uint64_t __38__SYLegacyStore__syncEndedWithSyncID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performFullSyncToCurrentDBVersion];
}

- (void)handleSyncAllObjects:(id)a3 response:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 syncID];
  BOOL v9 = [(SYLegacyStore *)self _shouldIgnoreSyncID:v8];

  if (v9)
  {
    id v10 = [(SYLegacyStore *)self newMessageHeader];
    [v7 setHeader:v10];

    int v11 = [v6 syncID];
    [v7 setSyncID:v11];

    __int16 v12 = [SYErrorInfo alloc];
    uint64_t v13 = [MEMORY[0x263F087E8] errorWithSYError:1001 userInfo:0];
    id v14 = [(SYErrorInfo *)v12 initWithError:v13];
    [v7 setError:v14];

    __int16 v15 = [v6 syncID];
    [(SYLegacyStore *)self _syncEndedWithSyncID:v15];

    goto LABEL_13;
  }
  uint64_t v16 = [(SYPersistentStore *)self->_persistentStore currentFullSyncID];

  persistentStore = self->_persistentStore;
  if (!v16)
  {
    BOOL v21 = [v6 syncID];
    [(SYPersistentStore *)persistentStore enterFullSyncWithID:v21 ignoring:0];
    goto LABEL_7;
  }
  BOOL v18 = [(SYPersistentStore *)self->_persistentStore currentFullSyncID];
  int v19 = [v18 hasPrefix:@"InitialSync"];

  if (v19)
  {
    uint64_t v20 = self->_persistentStore;
    BOOL v21 = [v6 syncID];
    [(SYPersistentStore *)v20 reassignCurrentSyncID:v21];
LABEL_7:
  }
  uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "allObjectsCount"));
  uint64_t v23 = [v6 allObjects];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __47__SYLegacyStore_handleSyncAllObjects_response___block_invoke;
  v38[3] = &unk_264422FE0;
  v38[4] = self;
  id v24 = v22;
  id v39 = v24;
  id v25 = v6;
  id v40 = v25;
  [v23 enumerateObjectsUsingBlock:v38];

  unint64_t v26 = [v25 header];
  id v27 = [v26 sender];

  unint64_t v28 = [v25 header];
  __int16 v29 = [v28 state];
  unint64_t v30 = [v29 clockForPeer:v27];

  [(SYLegacyStore *)self remoteStoreAllObjects:v24 fromPeer:v27 clock:v30];
  __int16 v31 = [(SYPersistentStore *)self->_persistentStore peerID];
  -[SYVectorClock setClockValue:forPeer:](self->_vectorClock, "setClockValue:forPeer:", [v30 version], v27);
  [(SYLegacyStore *)self _vectorClockUpdated];
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  int v32 = (void *)qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
  {
    vectorClock = self->_vectorClock;
    v34 = v32;
    v35 = [(SYVectorClock *)vectorClock jsonRepresentation];
    *(_DWORD *)buf = 138543618;
    BOOL v42 = v35;
    __int16 v43 = 2114;
    v44 = v31;
    _os_log_impl(&dword_21C7C9000, v34, OS_LOG_TYPE_INFO, "Copied peer clock into our vector. Value is now: %{public}@ (my PeerID is %{public}@)", buf, 0x16u);
  }
  id v36 = [(SYLegacyStore *)self newMessageHeader];
  [v7 setHeader:v36];

  v37 = [v25 syncID];
  [(SYLegacyStore *)self _syncEndedWithSyncID:v37];

LABEL_13:
}

void __47__SYLegacyStore_handleSyncAllObjects_response___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5 = a1 + 32;
  id v6 = [*(id *)(a1 + 32) decodeSYObject:a2];
  if (v6)
  {
    [*(id *)(a1 + 40) addObject:v6];
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v7 = (void *)qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_FAULT)) {
      __47__SYLegacyStore_handleSyncAllObjects_response___block_invoke_cold_2(v5, v7);
    }
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v8 = (void *)_sync_log_facilities;
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEBUG)) {
      __47__SYLegacyStore_handleSyncAllObjects_response___block_invoke_cold_1(a3, a1, v8);
    }
  }
}

- (void)handleBatchSyncStart:(id)a3
{
  id v9 = a3;
  id v4 = [v9 syncID];
  BOOL v5 = [(SYLegacyStore *)self _shouldIgnoreSyncID:v4];

  if (!v5)
  {
    id v6 = [(SYPersistentStore *)self->_persistentStore currentFullSyncID];

    if (!v6)
    {
      persistentStore = self->_persistentStore;
      id v8 = [v9 syncID];
      [(SYPersistentStore *)persistentStore enterFullSyncWithID:v8 ignoring:0];
    }
    [(SYLegacyStore *)self processBatchSyncStart];
  }
}

- (void)handleBatchSyncChunk:(id)a3 response:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 syncID];
  BOOL v9 = [(SYLegacyStore *)self _shouldIgnoreSyncID:v8];

  if (v9)
  {
    id v10 = [(SYLegacyStore *)self newMessageHeader];
    [v6 setHeader:v10];

    int v11 = [v7 syncID];

    [v6 setSyncID:v11];
    __int16 v12 = [SYErrorInfo alloc];
    uint64_t v13 = [MEMORY[0x263F087E8] errorWithSYError:1001 userInfo:0];
    id v14 = [(SYErrorInfo *)v12 initWithError:v13];
    [v6 setError:v14];
  }
  else
  {
    uint64_t v15 = [v7 chunkIndex];
    uint64_t v16 = [v7 objects];
    id v21 = 0;
    [(SYLegacyStore *)self processBatchChunkAtIndex:v15 encodedObjects:v16 error:&v21];
    id v17 = v21;

    id v18 = [(SYLegacyStore *)self newMessageHeader];
    [v6 setHeader:v18];

    uint64_t v19 = [v7 chunkIndex];
    [v6 setChunkIndex:v19];
    if (v17)
    {
      uint64_t v20 = [[SYErrorInfo alloc] initWithError:v17];
      [v6 setError:v20];
    }
  }
}

- (void)handleBatchSyncEnd:(id)a3 response:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 syncID];
  BOOL v9 = [(SYLegacyStore *)self _shouldIgnoreSyncID:v8];

  if (v9)
  {
    id v10 = [(SYLegacyStore *)self newMessageHeader];
    [v7 setHeader:v10];

    int v11 = [v6 syncID];
    [v7 setSyncID:v11];

    __int16 v12 = [SYErrorInfo alloc];
    uint64_t v13 = [MEMORY[0x263F087E8] errorWithSYError:1001 userInfo:0];
    id v14 = [(SYErrorInfo *)v12 initWithError:v13];
    [v7 setError:v14];

    uint64_t v15 = [v6 syncID];
    [(SYLegacyStore *)self _syncEndedWithSyncID:v15];
  }
  else
  {
    uint64_t v16 = [v6 header];
    id v17 = [v16 state];
    id v18 = [v6 header];
    uint64_t v19 = [v18 sender];
    uint64_t v20 = [v17 clockValueForPeer:v19];

    [(SYLegacyStore *)self processBatchSyncEnd:v20];
    id v21 = [v6 header];
    uint64_t v22 = [v21 sender];

    uint64_t v23 = [v6 header];
    id v24 = [v23 state];
    id v25 = [v24 clockForPeer:v22];

    unint64_t v26 = [(SYPersistentStore *)self->_persistentStore peerID];
    -[SYVectorClock setClockValue:forPeer:](self->_vectorClock, "setClockValue:forPeer:", [v25 version], v22);
    [(SYLegacyStore *)self _vectorClockUpdated];
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v27 = (void *)qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
    {
      vectorClock = self->_vectorClock;
      __int16 v29 = v27;
      unint64_t v30 = [(SYVectorClock *)vectorClock jsonRepresentation];
      int v33 = 138543618;
      v34 = v30;
      __int16 v35 = 2114;
      id v36 = v26;
      _os_log_impl(&dword_21C7C9000, v29, OS_LOG_TYPE_INFO, "Copied peer clock into our vector. Value is now: %{public}@ (my PeerID is %{public}@)", (uint8_t *)&v33, 0x16u);
    }
    id v31 = [(SYLegacyStore *)self newMessageHeader];
    [v7 setHeader:v31];

    int v32 = [v6 syncID];
    [(SYLegacyStore *)self _syncEndedWithSyncID:v32];
  }
}

- (void)handleChangeMessage:(id)a3
{
  *(void *)((char *)&v52[1] + 4) = *MEMORY[0x263EF8340];
  id v39 = a3;
  if (![(SYLegacyStore *)self _shouldSkipNonSyncMessages])
  {
    os_activity_t v38 = _os_activity_create(&dword_21C7C9000, "CompanionSync Change Application", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DETACHED);
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v4 = (id)qword_26AB04788;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v52[0]) = [v39 changesCount];
      _os_log_impl(&dword_21C7C9000, v4, OS_LOG_TYPE_DEFAULT, "Applying %d incoming changes", buf, 8u);
    }

    BOOL v5 = [v39 header];
    uint64_t v6 = [v5 sequenceNumber];

    id v7 = [(SYLegacyStore *)self persistentStore];
    id v8 = [v39 header];
    BOOL v9 = [v8 sender];
    id v10 = [v9 peerID];
    uint64_t v11 = [v7 lastSequenceNumberForPeerID:v10];

    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
      -[SYLegacyStore handleChangeMessage:].cold.7();
    }
    if (v11) {
      uint64_t v12 = v6 + ~v11;
    }
    else {
      uint64_t v12 = 0;
    }
    uint64_t v13 = [(SYStore *)self delegate];
    if (v12)
    {
      if ([(SYLegacyStore *)self tracksChanges])
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        id v14 = (id)qword_26AB04788;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = [v39 changesCount];
          *(_DWORD *)buf = 134217984;
          v52[0] = v15;
          _os_log_impl(&dword_21C7C9000, v14, OS_LOG_TYPE_DEFAULT, "-handleChangeMessage:<%zu objects> -- changes are not consecutive, triggering full sync", buf, 0xCu);
        }

        [(SYLegacyStore *)self performFullSync];
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        uint64_t v16 = qword_26AB04788;
        if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21C7C9000, v16, OS_LOG_TYPE_DEFAULT, "handleChangeMessage - done, change-list bubble detected", buf, 2u);
        }
        id v17 = +[SYStatisticStore sharedInstance];
        [v17 updateLastIncomingMessageWithError:@"Change-list bubble detected"];
LABEL_35:

        goto LABEL_74;
      }
      if (objc_opt_respondsToSelector()) {
        [v13 syncStore:self detectedChangeListBubbleOfSize:v12];
      }
    }
    if (!v13)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR)) {
        -[SYLegacyStore handleChangeMessage:]();
      }
      id v17 = +[SYStatisticStore sharedInstance];
      [v17 updateLastIncomingMessageWithError:@"No delegate"];
      goto LABEL_35;
    }
    double Current = CFAbsoluteTimeGetCurrent();
    __int16 flags = (__int16)self->super._flags;
    if ((flags & 2) != 0)
    {
      objc_msgSend(v13, "syncStoreWillUpdate:objectCount:", self, objc_msgSend(v39, "changesCount"));
    }
    else if (flags)
    {
      [v13 syncStoreWillUpdate:self];
    }
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v20 = objc_msgSend(v39, "changes", 16);
    uint64_t v21 = [v20 countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v47;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v47 != v22) {
            objc_enumerationMutation(v20);
          }
          id v24 = *(void **)(*((void *)&v46 + 1) + 8 * v23);
          id v25 = [v24 objectForStore:self];
          if (v25)
          {
            if ([v24 type])
            {
              if ([v24 type] == 1)
              {
                if (_sync_log_facilities_pred != -1) {
                  _os_once();
                }
                if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
                  -[SYLegacyStore handleChangeMessage:].cold.5(&v42, v43);
                }
                [v13 syncStore:self objectUpdated:v25];
              }
              else if ([v24 type] == 2)
              {
                if (_sync_log_facilities_pred != -1) {
                  _os_once();
                }
                if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
                  -[SYLegacyStore handleChangeMessage:].cold.6(&v40, v41);
                }
                [v13 syncStore:self objectDeleted:v25];
              }
            }
            else
            {
              if (_sync_log_facilities_pred != -1) {
                _os_once();
              }
              if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
                -[SYLegacyStore handleChangeMessage:].cold.4(&v44, v45);
              }
              [v13 syncStore:self objectAdded:v25];
            }
          }
          else
          {
            if (_sync_log_facilities_pred != -1) {
              _os_once();
            }
            unint64_t v26 = (id)qword_26AB04788;
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              id v27 = _SYObfuscate(v24);
              -[SYLegacyStore handleChangeMessage:](v27, buf, v52, v26);
            }
          }
          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [v20 countByEnumeratingWithState:&v46 objects:v50 count:16];
      }
      while (v21);
    }

    vectorClock = self->_vectorClock;
    __int16 v29 = [v39 header];
    unint64_t v30 = [v29 state];
    id v31 = [v39 header];
    int v32 = [v31 sender];
    uint64_t v33 = [v30 clockValueForPeer:v32];
    v34 = [v39 header];
    __int16 v35 = [v34 sender];
    [(SYVectorClock *)vectorClock setClockValue:v33 forPeer:v35];

    [(SYLegacyStore *)self _vectorClockUpdated];
    if ((*(_WORD *)((unsigned char *)&self->super.super.isa + v37) & 4) != 0) {
      [v13 syncStoreDidUpdate:self];
    }
    id v36 = +[SYStatisticStore sharedInstance];
    [v36 updateLastIncomingMessageWithProcessingTime:CFAbsoluteTimeGetCurrent() - Current];

    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
      -[SYLegacyStore handleChangeMessage:]();
    }
  }
LABEL_74:
}

- (void)messageCenter:(id)a3 didReceiveUnknownRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v8 = (void *)qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR)) {
    -[SYLegacyStore messageCenter:didReceiveUnknownRequest:](v8);
  }
  BOOL v9 = [v7 idsIdentifier];
  [(SYLegacyStore *)self _postVersionRejectedForMessageID:v9];

  [v7 setExpectsResponse:0];
}

- (void)messageCenter:(id)a3 didResolveIDSIdentifierForRequest:(id)a4
{
  id v5 = a4;
  id v6 = [v5 idsIdentifier];

  if (v6)
  {
    id v7 = +[SYStatisticStore sharedInstance];
    id v8 = [v5 idsIdentifier];
    [v7 assignIdentifier:v8 toOutgoingMessage:v5];

    if ([(SYLegacyStore *)self alwaysWins])
    {
      if ([v5 messageID] - 3 <= 2)
      {
        BOOL v9 = [(SYLegacyStore *)self nextBatchStep];

        if (v9)
        {
          id v10 = [(SYLegacyStore *)self nextBatchStep];
          v10[2](v10, 0, 0);
        }
      }
      if ((*(_WORD *)&self->super._flags & 0x80000000) != 0)
      {
        uint64_t v11 = [(SYStore *)self delegate];
        int v12 = [v5 messageID];
        if (v12 == 5)
        {
          uint64_t v13 = [v5 persistentUserInfo];
          id v14 = [v13 objectForKeyedSubscript:@"UserInfo"];
          [v11 syncStoreEnqueuedAllFullSyncMessages:self context:v14];
        }
        else
        {
          if (v12 != 2)
          {
LABEL_12:

            goto LABEL_13;
          }
          uint64_t v13 = [v5 persistentUserInfo];
          [v11 syncStoreEnqueuedAllFullSyncMessages:self context:v13];
        }

        goto LABEL_12;
      }
    }
  }
LABEL_13:
  uint64_t v15 = [v5 pbRequest];
  uint64_t v16 = [v15 header];
  uint64_t v17 = [v16 sequenceNumber];

  sendSignals = self->_sendSignals;
  uint64_t v19 = [NSNumber numberWithUnsignedLongLong:v17];
  uint64_t v20 = [(NSMutableDictionary *)sendSignals objectForKeyedSubscript:v19];

  if (v20)
  {
    dispatch_semaphore_signal(v20);
    uint64_t v21 = self->_sendSignals;
    uint64_t v22 = [NSNumber numberWithUnsignedLongLong:v17];
    [(NSMutableDictionary *)v21 removeObjectForKey:v22];
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  uint64_t v23 = (void *)qword_26AB047A0;
  if (os_log_type_enabled((os_log_t)qword_26AB047A0, OS_LOG_TYPE_DEBUG)) {
    -[SYLegacyStore messageCenter:didResolveIDSIdentifierForRequest:](v23);
  }
  transaction = self->_transaction;
  self->_transaction = 0;
}

- (void)messageCenter:(id)a3 didResolveIDSIdentifier:(id)a4 forResponse:(id)a5
{
  if (a4)
  {
    id v6 = a5;
    id v7 = a4;
    id v8 = +[SYStatisticStore sharedInstance];
    [v8 assignIdentifier:v7 toOutgoingMessage:v6];
  }
}

- (void)messageCenter:(id)a3 didSuccessfullySendRequestWithIdentifier:(id)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
    -[SYLegacyStore messageCenter:didSuccessfullySendRequestWithIdentifier:userInfo:]();
  }
  uint64_t v11 = +[SYStatisticStore sharedInstance];
  int v12 = [(SYLegacyStore *)self service];
  [v11 updateOutgoingMessageWithIdentifier:v9 forService:v12 sentSuccessfully:1 sendError:0];

  if ((*(_WORD *)&self->super._flags & 0x2000) != 0)
  {
    uint64_t v13 = [(SYStore *)self delegate];
    [v13 syncStore:self sentMessageWithContext:v10];
  }
}

- (void)messageCenter:(id)a3 didSuccessfullyDeliverRequestWithIdentifier:(id)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
    -[SYLegacyStore messageCenter:didSuccessfullyDeliverRequestWithIdentifier:userInfo:]();
  }
  uint64_t v11 = +[SYStatisticStore sharedInstance];
  [v11 confirmDeliveryOfOutgoingMessage:v9];

  if ((*(_WORD *)&self->super._flags & 0x4000) != 0)
  {
    int v12 = [(SYStore *)self delegate];
    [v12 syncStore:self peerFinishedProcessingMessageWithContext:v10];
  }
}

- (id)wrapMessage:(id)a3 ofType:(unsigned __int16)a4 respondingTo:(id)a5 userInfo:(id)a6
{
  uint64_t v6 = a4;
  if (a5)
  {
    id v10 = a6;
    id v11 = a3;
    int v12 = [a5 response];
    [v12 setPbResponse:v11];

    [v12 setPersistentUserInfo:v10];
    if ((v6 - 1) >= 5) {
      [(SYLegacyStore *)self timeToLive];
    }
    else {
      double v13 = 3600.0;
    }
    uint64_t v19 = v12;
    goto LABEL_15;
  }
  id v14 = a6;
  id v15 = a3;
  int v12 = +[NMSOutgoingRequest requestWithMessageID:v6];
  [v12 setPbRequest:v15];

  [v12 setPersistentUserInfo:v14];
  int64_t v16 = [(SYLegacyStore *)self priority];
  if (v16 == 2) {
    uint64_t v17 = 2;
  }
  else {
    uint64_t v17 = v16 != 1;
  }
  [v12 setPriority:v17];
  [v12 setShouldEncrypt:1];
  if (v6 > 5) {
    goto LABEL_13;
  }
  uint64_t v18 = 0x40AC200000000000;
  if (((1 << v6) & 0x36) == 0)
  {
    if (v6 == 3) {
      goto LABEL_14;
    }
LABEL_13:
    [(SYLegacyStore *)self timeToLive];
    uint64_t v18 = v20;
    goto LABEL_14;
  }
  [v12 setResponseTimeout:7200.0];
LABEL_14:
  uint64_t v19 = v12;
  double v13 = *(double *)&v18;
LABEL_15:
  [v19 setSendTimeout:v13];
  return v12;
}

- (void)sendMessage:(id)a3 ofType:(unsigned __int16)a4 respondingTo:(id)a5 userInfo:(id)a6 idsOptions:(id)a7
{
  uint64_t v10 = a4;
  id v12 = a3;
  id v13 = a7;
  id v14 = [(SYLegacyStore *)self wrapMessage:v12 ofType:v10 respondingTo:a5 userInfo:a6];
  if (v14)
  {
    id v15 = [(SYStore *)self customIDSDeliveryOptions];
    uint64_t v16 = [v15 count];

    if (v16)
    {
      uint64_t v17 = [(SYStore *)self customIDSDeliveryOptions];
      uint64_t v18 = v17;
      if (v13)
      {
        uint64_t v19 = (void *)[v17 mutableCopy];

        [v19 addEntriesFromDictionary:v13];
        id v13 = v19;
      }
      else
      {
        id v13 = v17;
      }
    }
    if ((*(_WORD *)&self->super._flags & 0x4000) == 0)
    {
      uint64_t v21 = *MEMORY[0x263F49F90];
      uint64_t v22 = [v13 objectForKeyedSubscript:*MEMORY[0x263F49F90]];

      if (v22)
      {
        uint64_t v23 = (void *)[v13 mutableCopy];
        [v23 removeObjectForKey:v21];

        id v13 = v23;
      }
    }
    [v14 setExtraIDSOptions:v13];
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB047A0, OS_LOG_TYPE_DEBUG)) {
      -[SYLegacyStore sendMessage:ofType:respondingTo:userInfo:idsOptions:]();
    }
    id v24 = (OS_os_transaction *)os_transaction_create();
    transaction = self->_transaction;
    self->_transaction = v24;

    if (a5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        _os_assumes_log();
      }
      unint64_t v26 = +[SYStatisticStore sharedInstance];
      id v27 = [(SYLegacyStore *)self service];
      [v26 recordOutgoingMessage:v14 forService:v27];

      [v14 send];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        _os_assumes_log();
      }
      unint64_t v28 = +[SYStatisticStore sharedInstance];
      __int16 v29 = [(SYLegacyStore *)self service];
      [v28 recordOutgoingMessage:v14 forService:v29];

      [(NMSMessageCenter *)self->_messageCenter sendRequest:v14];
    }
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v20 = (void *)_sync_log_facilities;
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_ERROR)) {
      -[SYLegacyStore sendMessage:ofType:respondingTo:userInfo:idsOptions:](v20);
    }
  }
}

- (id)newMessageHeader
{
  uint64_t v3 = objc_opt_new();
  [v3 setTimestamp:CFAbsoluteTimeGetCurrent()];
  id v4 = [SYPeer alloc];
  id v5 = [(SYLegacyStore *)self persistentStore];
  uint64_t v6 = [v5 peerID];
  id v7 = [(SYPeer *)v4 initWithPeerID:v6 generation:0];
  [v3 setSender:v7];

  id v8 = [(SYLegacyStore *)self vectorClock];
  id v9 = (void *)[v8 copy];
  [v3 setState:v9];

  [v3 setVersion:1];
  uint64_t v10 = [(SYLegacyStore *)self persistentStore];
  objc_msgSend(v3, "setSequenceNumber:", objc_msgSend(v10, "nextSequenceNumber"));

  return v3;
}

- (void)_transaction:(id)a3 context:(id)a4 idsOptions:(id)a5 blockUntilSent:(BOOL)a6 reportError:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if ([(SYPersistentStore *)self->_persistentStore completedSync])
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __76__SYLegacyStore__transaction_context_idsOptions_blockUntilSent_reportError___block_invoke;
    v17[3] = &unk_264423008;
    v17[4] = self;
    id v18 = v13;
    id v19 = v14;
    id v20 = v12;
    BOOL v22 = a6;
    id v21 = v15;
    _os_activity_initiate(&dword_21C7C9000, "CompanionSync Transaction", OS_ACTIVITY_FLAG_DEFAULT, v17);
  }
  else if (v15)
  {
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:1005 userInfo:0];
    (*((void (**)(id, void *))v15 + 2))(v15, v16);
  }
}

void __76__SYLegacyStore__transaction_context_idsOptions_blockUntilSent_reportError___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x21D4B1560]();
  uint64_t v3 = [[SYTransaction alloc] initWithStore:*(void *)(a1 + 32)];
  [(SYTransaction *)v3 setContextInfo:*(void *)(a1 + 40)];
  [(SYTransaction *)v3 setIdsOptions:*(void *)(a1 + 48)];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [(SYTransaction *)v3 commitBlocking:*(unsigned __int8 *)(a1 + 72) reportError:*(void *)(a1 + 64)];
}

- (BOOL)_allowDeltaSyncWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SYLegacyStore *)self pairedDeviceID];

  if (v7) {
    id v8 = 0;
  }
  else {
    id v8 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:1008 userInfo:0];
  }
  if ([(SYPersistentStore *)self->_persistentStore completedSync])
  {
    if (!self->_deferredFullSync) {
      goto LABEL_9;
    }
    uint64_t v9 = 1007;
  }
  else
  {
    uint64_t v9 = 1005;
  }
  uint64_t v10 = [objc_alloc(MEMORY[0x263F087E8]) initWithSYError:v9 userInfo:0];

  id v8 = (void *)v10;
LABEL_9:
  if (v8)
  {
    if (a4)
    {
      *a4 = v8;
    }
    else if ((*(_WORD *)&self->super._flags & 0x400) != 0)
    {
      id v11 = [(SYLegacyStore *)self queue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __50__SYLegacyStore__allowDeltaSyncWithContext_error___block_invoke;
      block[3] = &unk_264422BF8;
      void block[4] = self;
      id v14 = v8;
      id v15 = v6;
      dispatch_async(v11, block);
    }
  }

  return v8 == 0;
}

void __50__SYLegacyStore__allowDeltaSyncWithContext_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 syncStore:*(void *)(a1 + 32) encounteredError:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
}

- (BOOL)addObject:(id)a3 context:(id)a4 idsOptions:(id)a5 error:(id *)a6
{
  v20[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  BOOL v13 = [(SYLegacyStore *)self _allowDeltaSyncWithContext:v11 error:a6];
  if (v13)
  {
    os_activity_t v14 = _os_activity_create(&dword_21C7C9000, "CompanionSync AddObject", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v15 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v19 = 0;
      _os_log_impl(&dword_21C7C9000, v15, OS_LOG_TYPE_INFO, "addObject", v19, 2u);
    }
    uint64_t v16 = +[SYChange changeWithObject:v10 updateType:0 store:self];
    v20[0] = v16;
    uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
    [(SYLegacyStore *)self handleObjectChanges:v17 contextInfo:v11 idsOptions:v12 blockUntilSent:0 reportError:0];
  }
  return v13;
}

- (BOOL)updateObject:(id)a3 context:(id)a4 idsOptions:(id)a5 error:(id *)a6
{
  v20[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  BOOL v13 = [(SYLegacyStore *)self _allowDeltaSyncWithContext:v11 error:a6];
  if (v13)
  {
    os_activity_t v14 = _os_activity_create(&dword_21C7C9000, "CompanionSync UpdateObject", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v15 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v19 = 0;
      _os_log_impl(&dword_21C7C9000, v15, OS_LOG_TYPE_INFO, "updateObject", v19, 2u);
    }
    uint64_t v16 = +[SYChange changeWithObject:v10 updateType:1 store:self];
    v20[0] = v16;
    uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
    [(SYLegacyStore *)self handleObjectChanges:v17 contextInfo:v11 idsOptions:v12 blockUntilSent:0 reportError:0];
  }
  return v13;
}

- (BOOL)deleteObject:(id)a3 context:(id)a4 idsOptions:(id)a5 error:(id *)a6
{
  v25[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([(SYLegacyStore *)self _allowDeltaSyncWithContext:v11 error:a6])
  {
    BOOL v13 = [(SYStore *)self allowsDeletes];
    if (v13)
    {
      os_activity_t v14 = _os_activity_create(&dword_21C7C9000, "CompanionSync DeleteObject", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v15 = qword_26AB04788;
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v21 = 0;
        _os_log_impl(&dword_21C7C9000, v15, OS_LOG_TYPE_INFO, "deleteObject", v21, 2u);
      }
      uint64_t v16 = +[SYChange changeWithObject:v10 updateType:2 store:self];
      v25[0] = v16;
      uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
      [(SYLegacyStore *)self handleObjectChanges:v17 contextInfo:v11 idsOptions:v12 blockUntilSent:0 reportError:0];
    }
    else
    {
      [(SYLegacyStore *)self postUserNotification:@"Delete Denied" message:@"A client attempted to send a delete message while deletes were denied."];
      id v18 = [objc_alloc(MEMORY[0x263F087E8]) initWithSYError:1006 userInfo:0];
      os_activity_t v14 = v18;
      if (a6)
      {
        os_activity_t v14 = v18;
        *a6 = v14;
      }
      else if ((*(_WORD *)&self->super._flags & 0x400) != 0)
      {
        id v19 = [(SYLegacyStore *)self queue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __55__SYLegacyStore_deleteObject_context_idsOptions_error___block_invoke;
        block[3] = &unk_264422BF8;
        void block[4] = self;
        os_activity_t v14 = v14;
        os_activity_t v23 = v14;
        id v24 = v11;
        dispatch_async(v19, block);
      }
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

void __55__SYLegacyStore_deleteObject_context_idsOptions_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 syncStore:*(void *)(a1 + 32) encounteredError:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
}

- (void)handleObjectChanges:(id)a3 contextInfo:(id)a4 idsOptions:(id)a5 blockUntilSent:(BOOL)a6 reportError:(id)a7
{
}

- (void)_handleObjectChanges:(id)a3 contextInfo:(id)a4 idsOptions:(id)a5 blockUntilSent:(BOOL)a6 reportError:(id)a7 notifyingTransaction:(id)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  uint64_t v17 = (void (**)(id, NSError *))a7;
  id v18 = a8;
  if (self->_overflowRetryTimer)
  {
    if (v17)
    {
      v17[2](v17, self->_overflowRetryError);
    }
    else if ((*(_WORD *)&self->super._flags & 0x400) != 0)
    {
      id v20 = [(SYLegacyStore *)self queue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __109__SYLegacyStore__handleObjectChanges_contextInfo_idsOptions_blockUntilSent_reportError_notifyingTransaction___block_invoke;
      block[3] = &unk_264422990;
      void block[4] = self;
      id v35 = v15;
      dispatch_async(v20, block);
    }
  }
  else if ([(SYPersistentStore *)self->_persistentStore completedSync])
  {
    if (v10) {
      dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
    }
    else {
      dispatch_semaphore_t v19 = 0;
    }
    BOOL v22 = [(SYLegacyStore *)self queue];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    void v25[2] = __109__SYLegacyStore__handleObjectChanges_contextInfo_idsOptions_blockUntilSent_reportError_notifyingTransaction___block_invoke_3;
    v25[3] = &unk_264423058;
    v25[4] = self;
    id v26 = v18;
    id v27 = v14;
    id v28 = v15;
    id v29 = v16;
    os_activity_t v23 = v19;
    unint64_t v30 = v23;
    dispatch_async(v22, v25);

    if (v23) {
      dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  else
  {
    id v21 = (NSError *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:1005 userInfo:0];
    if (v17)
    {
      v17[2](v17, v21);
    }
    else if ((*(_WORD *)&self->super._flags & 0x400) != 0)
    {
      id v24 = [(SYLegacyStore *)self queue];
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __109__SYLegacyStore__handleObjectChanges_contextInfo_idsOptions_blockUntilSent_reportError_notifyingTransaction___block_invoke_2;
      v31[3] = &unk_264422BF8;
      v31[4] = self;
      int v32 = v21;
      id v33 = v15;
      dispatch_async(v24, v31);
    }
  }
}

void __109__SYLegacyStore__handleObjectChanges_contextInfo_idsOptions_blockUntilSent_reportError_notifyingTransaction___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 syncStore:*(void *)(a1 + 32) encounteredError:*(void *)(*(void *)(a1 + 32) + 144) context:*(void *)(a1 + 40)];
}

void __109__SYLegacyStore__handleObjectChanges_contextInfo_idsOptions_blockUntilSent_reportError_notifyingTransaction___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 syncStore:*(void *)(a1 + 32) encounteredError:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
}

uint64_t __109__SYLegacyStore__handleObjectChanges_contextInfo_idsOptions_blockUntilSent_reportError_notifyingTransaction___block_invoke_3(id *a1)
{
  uint64_t v2 = [a1[4] persistentStore];
  if (!v2) {
    goto LABEL_8;
  }
  uint64_t v3 = (void *)v2;
  id v4 = [a1[4] messageCenter];
  id v5 = [v4 service];

  if (v5)
  {
    if ([a1[4] alwaysWins]
      && [*((id *)a1[4] + 23) lastSyncFailed])
    {
      [a1[4] setNeedsFullSync];
    }
    if ([a1[6] count])
    {
      activity_block[0] = MEMORY[0x263EF8330];
      activity_block[1] = 3221225472;
      activity_block[2] = __109__SYLegacyStore__handleObjectChanges_contextInfo_idsOptions_blockUntilSent_reportError_notifyingTransaction___block_invoke_183;
      activity_block[3] = &unk_264423030;
      activity_void block[4] = a1[4];
      id v12 = a1[6];
      id v13 = a1[7];
      id v14 = a1[8];
      id v15 = a1[9];
      _os_activity_initiate(&dword_21C7C9000, "CompanionSync HandleChangeList", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
    }
    else
    {
      uint64_t v9 = a1[9];
      if (v9) {
        dispatch_semaphore_signal(v9);
      }
    }
    uint64_t v8 = 1;
  }
  else
  {
LABEL_8:
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v6 = _sync_log_facilities;
    BOOL v7 = os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT);
    uint64_t v8 = 0;
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C7C9000, v6, OS_LOG_TYPE_DEFAULT, "No persistent store or message center set up yet; probably we're not paired. Therefore: I'm dumping this change on the ground.",
        buf,
        2u);
      uint64_t v8 = 0;
    }
  }
  return [a1[5] _transactionDidComplete:v8];
}

uint64_t __109__SYLegacyStore__handleObjectChanges_contextInfo_idsOptions_blockUntilSent_reportError_notifyingTransaction___block_invoke_183(uint64_t a1)
{
  [*(id *)(a1 + 32) logChanges:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  return [v2 sendChanges:v3 context:v4 options:v5 sentSignal:v6];
}

- (void)sendChanges:(id)a3 context:(id)a4 options:(id)a5 sentSignal:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(SYLegacyStore *)self queue];
  dispatch_assert_queue_V2(v14);

  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = __56__SYLegacyStore_sendChanges_context_options_sentSignal___block_invoke;
  activity_block[3] = &unk_264423030;
  id v20 = v10;
  id v21 = self;
  id v22 = v13;
  id v23 = v11;
  id v24 = v12;
  id v15 = v12;
  id v16 = v11;
  id v17 = v13;
  id v18 = v10;
  _os_activity_initiate(&dword_21C7C9000, "CompanionSync SendChanges", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __56__SYLegacyStore_sendChanges_context_options_sentSignal___block_invoke(uint64_t a1)
{
  id v12 = objc_alloc_init(SYChangeMessage);
  uint64_t v2 = (void *)[*(id *)(a1 + 32) mutableCopy];
  uint64_t v3 = [*(id *)(a1 + 40) vectorClock];
  uint64_t v4 = [*(id *)(a1 + 40) persistentStore];
  uint64_t v5 = [v4 peerID];
  objc_msgSend(v3, "increaseClockForPeerID:by:", v5, objc_msgSend(v2, "count"));

  [*(id *)(a1 + 40) _vectorClockUpdated];
  uint64_t v6 = (void *)[*(id *)(a1 + 40) newMessageHeader];
  [(SYChangeMessage *)v12 setHeader:v6];

  [(SYChangeMessage *)v12 setChanges:v2];
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7)
  {
    uint64_t v8 = *(void **)(*(void *)(a1 + 40) + 120);
    uint64_t v9 = NSNumber;
    id v10 = [(SYChangeMessage *)v12 header];
    id v11 = objc_msgSend(v9, "numberWithUnsignedLongLong:", objc_msgSend(v10, "sequenceNumber"));
    [v8 setObject:v7 forKeyedSubscript:v11];
  }
  [*(id *)(a1 + 40) sendMessage:v12 ofType:6 respondingTo:0 userInfo:*(void *)(a1 + 56) idsOptions:*(void *)(a1 + 64)];
}

- (void)logChanges:(id)a3
{
  id v4 = a3;
  if ([(SYLegacyStore *)self tracksChanges])
  {
    os_activity_t v5 = _os_activity_create(&dword_21C7C9000, "CompanionSync LogChanges", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v6 = [(SYLegacyStore *)self persistentStore];
    id v13 = 0;
    char v7 = [v6 logChanges:v4 error:&v13];
    id v8 = v13;

    if ((v7 & 1) == 0)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR)) {
        -[SYLegacyStore logChanges:]();
      }
      uint64_t v9 = [v8 localizedDescription];

      if (v9)
      {
        id v10 = [v8 localizedDescription];
        id v11 = [@"DB changelog failure. " stringByAppendingString:v10];
      }
      else
      {
        id v11 = @"DB changelog failure. ";
      }
      id v12 = +[SYStatisticStore sharedInstance];
      [v12 updateLastIncomingMessageWithError:v11];
    }
  }
}

- (void)setNeedsFullSyncWithContext:(id)a3 idsOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_overflowRetryTimer)
  {
    id v8 = [(SYLegacyStore *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__SYLegacyStore_setNeedsFullSyncWithContext_idsOptions___block_invoke;
    block[3] = &unk_264422AB0;
    void block[4] = self;
    dispatch_async(v8, block);
  }
  else
  {
    [(SYRetryTimer *)self->_syncRetryTimer cancel];
    syncRetryTimer = self->_syncRetryTimer;
    self->_syncRetryTimer = 0;

    if ([(SYLegacyStore *)self inDeltaSync])
    {
      self->_deferredFullSync = 1;
    }
    else
    {
      id v10 = [(SYLegacyStore *)self queue];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __56__SYLegacyStore_setNeedsFullSyncWithContext_idsOptions___block_invoke_2;
      v11[3] = &unk_264422BF8;
      v11[4] = self;
      id v12 = v6;
      id v13 = v7;
      dispatch_async(v10, v11);
    }
  }
}

void __56__SYLegacyStore_setNeedsFullSyncWithContext_idsOptions___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(_WORD **)(a1 + 32);
  if ((v2[8] & 0x200) != 0)
  {
    id v3 = [v2 delegate];
    [v3 syncStore:*(void *)(a1 + 32) encounteredErrorInFullSync:*(void *)(*(void *)(a1 + 32) + 144)];
  }
}

void __56__SYLegacyStore_setNeedsFullSyncWithContext_idsOptions___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) persistentStore];
  if (!v3) {
    goto LABEL_12;
  }
  id v4 = (void *)v3;
  os_activity_t v5 = [*v2 messageCenter];
  id v6 = [v5 service];

  if (v6)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v7 = (void *)qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
      __56__SYLegacyStore_setNeedsFullSyncWithContext_idsOptions___block_invoke_2_cold_2((uint64_t *)v2, v7);
    }
    if ([*v2 inFullSync])
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
        __56__SYLegacyStore_setNeedsFullSyncWithContext_idsOptions___block_invoke_2_cold_1();
      }
    }
    else
    {
      if ([*v2 alwaysWins]) {
        [*v2 setFullSyncWasRequestedBySlave:0];
      }
      id v10 = [*(id *)(a1 + 32) persistentStore];
      [v10 setCompletedSync:0];

      uint64_t v11 = *(void *)(a1 + 40);
      id v12 = [*(id *)(a1 + 32) persistentStore];
      [v12 setFullSyncUserInfo:v11];

      uint64_t v13 = *(void *)(a1 + 48);
      id v14 = [*(id *)(a1 + 32) persistentStore];
      [v14 setFullSyncIDSOptions:v13];

      [*(id *)(a1 + 32) performFullSyncIfNecessary];
    }
  }
  else
  {
LABEL_12:
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v8 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl(&dword_21C7C9000, v8, OS_LOG_TYPE_DEFAULT, "No persistent store or message center set up yet; probably we're not paired. Therefore: I'm dumping this change on the ground.",
        v15,
        2u);
    }
    if ((*((_WORD *)*v2 + 8) & 0x200) != 0)
    {
      uint64_t v9 = [*v2 delegate];
      [v9 syncStore:*v2 encounteredErrorInFullSync:*((void *)*v2 + 18)];
    }
  }
}

- (void)remoteStoreAllObjects:(id)a3 fromPeer:(id)a4 clock:(id)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_activity_t v11 = _os_activity_create(&dword_21C7C9000, "CompanionSync remoteStoreAllObjects", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v12 = (void *)qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG))
  {
    id v27 = v12;
    [v9 peerID];
    v29 = id v28 = v8;
    *(_DWORD *)buf = 138543874;
    uint64_t v37 = v29;
    __int16 v38 = 2048;
    uint64_t v39 = [v28 count];
    __int16 v40 = 2048;
    uint64_t v41 = [v10 version];
    _os_log_debug_impl(&dword_21C7C9000, v27, OS_LOG_TYPE_DEBUG, "remoteStoreAllObjects from %{public}@, %lu objects, version %qu", buf, 0x20u);

    id v8 = v28;
  }
  if ([(SYLegacyStore *)self alwaysWins])
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR)) {
      -[SYLegacyStore remoteStoreAllObjects:fromPeer:clock:]();
    }
    uint64_t v13 = +[SYStatisticStore sharedInstance];
    [v13 updateLastIncomingMessageWithError:@"Sync sent to master"];

    [MEMORY[0x263EFF940] raise:@"Full sync sent to master device" format:@"Only the slave device should receive a full sync (from the master)"];
  }
  id v14 = [(SYStore *)self delegate];
  if (v14)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    __int16 flags = (__int16)self->super._flags;
    unint64_t v30 = v11;
    id v17 = v10;
    if ((flags & 2) != 0)
    {
      objc_msgSend(v14, "syncStoreWillUpdate:objectCount:", self, objc_msgSend(v8, "count"));
    }
    else if (flags)
    {
      [v14 syncStoreWillUpdate:self];
    }
    id v18 = v9;
    if ((*(_WORD *)&self->super._flags & 0x10) != 0) {
      [v14 syncStoreAllObjectsDeleted:self];
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v19 = v8;
    id v20 = v8;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v32 != v23) {
            objc_enumerationMutation(v20);
          }
          [v14 syncStore:self objectAdded:*(void *)(*((void *)&v31 + 1) + 8 * i)];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v22);
    }

    __int16 v25 = (__int16)self->super._flags;
    if ((v25 & 4) != 0)
    {
      [v14 syncStoreDidUpdate:self];
      __int16 v25 = (__int16)self->super._flags;
    }
    id v9 = v18;
    id v10 = v17;
    if ((v25 & 8) != 0) {
      [v14 syncStoreDidCompleteFullSync:self];
    }
    id v26 = +[SYStatisticStore sharedInstance];
    [v26 updateLastIncomingMessageWithProcessingTime:CFAbsoluteTimeGetCurrent() - Current];

    os_activity_t v11 = v30;
    id v8 = v19;
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR)) {
      -[SYLegacyStore remoteStoreAllObjects:fromPeer:clock:]();
    }
  }
}

- (void)remoteStoreRequestFullSync
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_21C7C9000, v0, v1, "Full sync requested from a slave device", v2, v3, v4, v5, v6);
}

- (void)performFullSyncIfNecessaryAskingDelegate:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(SYLegacyStore *)self inFullSync]) {
    goto LABEL_9;
  }
  if (v3 && [(SYLegacyStore *)self alwaysWins])
  {
    if ([(SYPersistentStore *)self->_persistentStore currentSyncSendComplete])
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
        -[SYLegacyStore performFullSyncIfNecessaryAskingDelegate:]();
      }
      return;
    }
    uint8_t v6 = [MEMORY[0x263F087E8] errorWithSYError:1004 userInfo:0];
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__SYLegacyStore_performFullSyncIfNecessaryAskingDelegate___block_invoke;
    block[3] = &unk_264422990;
    void block[4] = self;
    id v12 = v6;
    id v8 = v6;
    dispatch_async(queue, block);

LABEL_9:
    uint64_t v5 = self->_queue;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __58__SYLegacyStore_performFullSyncIfNecessaryAskingDelegate___block_invoke_206;
    v9[3] = &unk_264422ED8;
    v9[4] = self;
    BOOL v10 = v3;
    dispatch_async(v5, v9);
    return;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
    -[SYLegacyStore performFullSyncIfNecessaryAskingDelegate:]();
  }
}

void __58__SYLegacyStore_performFullSyncIfNecessaryAskingDelegate___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _postBatchEndMessageWithState:0 error:*(void *)(a1 + 40) then:0];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 184);
  id v3 = [v2 currentFullSyncID];
  [v2 exitFullSyncWithID:v3 error:*(void *)(a1 + 40)];
}

void __58__SYLegacyStore_performFullSyncIfNecessaryAskingDelegate___block_invoke_206(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) persistentStore];
  char v3 = [v2 completedSync];

  if (v3) {
    return;
  }
  if (!*(unsigned char *)(a1 + 40) || (uint64_t v4 = *(_WORD **)(a1 + 32), (v4[8] & 0x40) == 0))
  {
    if (*(unsigned char *)(a1 + 40)) {
      return;
    }
    goto LABEL_11;
  }
  uint64_t v5 = [v4 delegate];
  char v6 = [v5 syncStoreShouldPerformInitialFullSync:*(void *)(a1 + 32)];

  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
    __58__SYLegacyStore_performFullSyncIfNecessaryAskingDelegate___block_invoke_206_cold_2();
  }
  if (v6)
  {
LABEL_11:
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
      __58__SYLegacyStore_performFullSyncIfNecessaryAskingDelegate___block_invoke_206_cold_1();
    }
    [*(id *)(a1 + 32) performFullSyncToCurrentDBVersion];
  }
}

- (void)performFullSyncIfNecessary
{
}

- (void)performFullSyncToCurrentDBVersion
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_21C7C9000, v0, v1, "performFullSync", v2, v3, v4, v5, v6);
}

- (void)performFullSync
{
  if (![(SYLegacyStore *)self fullSyncWasRequestedBySlave])
  {
    if ([(SYLegacyStore *)self inFullSync]) {
      return;
    }
    uint64_t v3 = objc_opt_new();
    uint64_t v4 = [v3 UUIDString];

    [(SYPersistentStore *)self->_persistentStore enterFullSyncWithID:v4 ignoring:0];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__SYLegacyStore_performFullSync__block_invoke;
  block[3] = &unk_264422AB0;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __32__SYLegacyStore_performFullSync__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performFullSyncToCurrentDBVersion];
}

- (BOOL)objectChanged:(id)a3 sinceVersion:(unint64_t)a4
{
  id v6 = a3;
  if ([(SYLegacyStore *)self tracksChanges])
  {
    id v7 = [(SYLegacyStore *)self persistentStore];
    char v8 = [v7 objectChanged:v6 sinceVersion:a4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (SYPersistentStore)persistentStore
{
  return self->_persistentStore;
}

- (void)setPersistentStore:(id)a3
{
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (NSString)databaseFileName
{
  return self->_databaseFileName;
}

- (void)setDatabaseFileName:(id)a3
{
}

- (BOOL)encryptPayloads
{
  return self->_encryptPayloads;
}

- (void)setEncryptPayloads:(BOOL)a3
{
  self->_encryptPayloads = a3;
}

- (BOOL)alwaysWins
{
  return self->_alwaysWins;
}

- (void)setAlwaysWins:(BOOL)a3
{
  self->_alwaysWins = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (__CFString)loggingFacility
{
  return self->_loggingFacility;
}

- (void)setLoggingFacility:(__CFString *)a3
{
  self->_loggingFacility = a3;
}

- (NSUUID)pairedDeviceID
{
  return self->_pairedDeviceID;
}

- (void)setPairedDeviceID:(id)a3
{
}

- (BOOL)registeredNotificationHandlers
{
  return self->_registeredNotificationHandlers;
}

- (void)setRegisteredNotificationHandlers:(BOOL)a3
{
  self->_registeredNotificationHandlers = a3;
}

- (NMSMessageCenter)messageCenter
{
  return self->_messageCenter;
}

- (void)setMessageCenter:(id)a3
{
}

- (SYVectorClock)vectorClock
{
  return self->_vectorClock;
}

- (void)setVectorClock:(id)a3
{
}

- (BOOL)fullSyncWasRequestedBySlave
{
  return self->_fullSyncWasRequestedBySlave;
}

- (void)setFullSyncWasRequestedBySlave:(BOOL)a3
{
  self->_fullSyncWasRequestedBySlave = a3;
}

- (id)nextBatchStep
{
  return self->_nextBatchStep;
}

- (void)setNextBatchStep:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_nextBatchStep, 0);
  objc_storeStrong((id *)&self->_vectorClock, 0);
  objc_storeStrong((id *)&self->_messageCenter, 0);
  objc_storeStrong((id *)&self->_pairedDeviceID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_databaseFileName, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_persistentStore, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_overflowRetryError, 0);
  objc_storeStrong((id *)&self->_overflowRetryTimer, 0);
  objc_storeStrong((id *)&self->_syncRetryTimer, 0);
  objc_storeStrong((id *)&self->_sendSignals, 0);
  objc_storeStrong((id *)&self->_batchChunkUnackedIndices, 0);
}

- (id)newFullSyncContext
{
  id v2 = objc_alloc(MEMORY[0x263EFF9A0]);
  return (id)[v2 initWithCapacity:4];
}

- (void)_retrySync
{
  syncRetryTimer = self->_syncRetryTimer;
  if (syncRetryTimer)
  {
    if (![(SYRetryTimer *)syncRetryTimer incrementBackoff])
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR)) {
        -[SYLegacyStore(FullSyncSupport) _retrySync]();
      }
      uint64_t v4 = self->_syncRetryTimer;
      self->_syncRetryTimer = 0;
    }
  }
  else
  {
    objc_initWeak(&location, self);
    uint64_t v5 = [SYRetryTimer alloc];
    id v6 = [(SYLegacyStore *)self queue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __44__SYLegacyStore_FullSyncSupport___retrySync__block_invoke;
    v9[3] = &unk_264422C90;
    objc_copyWeak(&v10, &location);
    id v7 = [(SYRetryTimer *)v5 initWithInterval:3 backoffFactor:v6 maxRetries:v9 queue:15.0 callout:2.0];
    char v8 = self->_syncRetryTimer;
    self->_syncRetryTimer = v7;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __44__SYLegacyStore_FullSyncSupport___retrySync__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained performFullSyncToCurrentDBVersion];
}

- (void)_postBatchStartMessageWithState:(id)a3 then:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = (id)objc_opt_new();
  id v8 = [(SYLegacyStore *)self newMessageHeader];
  [v11 setHeader:v8];

  id v9 = [v7 objectForKeyedSubscript:@"SyncID"];
  [v11 setSyncID:v9];

  [(SYLegacyStore *)self setNextBatchStep:v6];
  id v10 = [v7 objectForKeyedSubscript:@"IDSOptions"];
  [(SYLegacyStore *)self sendMessage:v11 ofType:3 respondingTo:0 userInfo:v7 idsOptions:v10];
}

- (void)_postBatchEndMessageWithState:(id)a3 error:(id)a4 then:(id)a5
{
  v27[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_opt_new();
  id v12 = [(SYLegacyStore *)self newMessageHeader];
  [v11 setHeader:v12];

  uint64_t v13 = [v8 objectForKeyedSubscript:@"SyncID"];
  [v11 setSyncID:v13];

  if (!v9) {
    goto LABEL_5;
  }
  id v14 = [[SYErrorInfo alloc] initWithError:v9];
  [v11 setError:v14];

  uint64_t v15 = [v11 syncID];
  if (v15)
  {
    id v16 = (void *)v15;
    id v17 = [v11 header];
    uint64_t v18 = [v17 sender];
    if (v18)
    {
      id v19 = (void *)v18;
      id v20 = [v11 header];
      uint64_t v21 = [v20 state];

      if (v21)
      {
LABEL_5:
        [(SYLegacyStore *)self setNextBatchStep:v10];
        uint64_t v22 = [v8 objectForKeyedSubscript:@"IDSOptions"];
        [(SYLegacyStore *)self sendMessage:v11 ofType:5 respondingTo:0 userInfo:v8 idsOptions:v22];
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
    }
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
    -[SYLegacyStore(BatchedSyncSupport) _postBatchEndMessageWithState:error:then:]();
  }
  if ((*(_WORD *)&self->super._flags & 0x200) != 0)
  {
    id v23 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v26 = *MEMORY[0x263F08608];
    v27[0] = v9;
    id v24 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
    uint64_t v22 = (void *)[v23 initWithSYError:2017 userInfo:v24];

    __int16 v25 = [(SYStore *)self delegate];
    [v25 syncStore:self encounteredErrorInFullSync:v22];

    goto LABEL_13;
  }
LABEL_14:
}

- (void)_restartBatchSyncWithState:(id)a3 then:(id)a4
{
  batchChunkUnackedIndices = self->_batchChunkUnackedIndices;
  id v7 = a4;
  id v8 = a3;
  [(NSMutableIndexSet *)batchChunkUnackedIndices removeAllIndexes];
  [(SYLegacyStore *)self _postBatchStartMessageWithState:v8 then:v7];
}

- (void)_sendBatchChunk:(id)a3 withState:(id)a4 then:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = -[SYStore encodeSYObject:](self, "encodeSYObject:", *(void *)(*((void *)&v25 + 1) + 8 * i), (void)v25);
        if (v17) {
          [v11 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v14);
  }

  uint64_t v18 = [MEMORY[0x263F08C38] UUID];
  id v19 = [v18 UUIDString];

  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
    -[SYLegacyStore(BatchedSyncSupport) _sendBatchChunk:withState:then:]();
  }
  id v20 = objc_opt_new();
  id v21 = [(SYLegacyStore *)self newMessageHeader];
  [v20 setHeader:v21];

  uint64_t v22 = [v9 objectForKeyedSubscript:@"SyncID"];
  [v20 setSyncID:v22];

  id v23 = [v9 objectForKeyedSubscript:@"BatchIndex"];
  objc_msgSend(v20, "setChunkIndex:", objc_msgSend(v23, "unsignedIntValue"));

  [v20 setObjects:v11];
  [(SYLegacyStore *)self setNextBatchStep:v10];
  id v24 = [v9 objectForKeyedSubscript:@"IDSOptions"];
  [(SYLegacyStore *)self sendMessage:v20 ofType:4 respondingTo:0 userInfo:v9 idsOptions:v24];
}

- (BOOL)performBatchedSyncToCurrentDBVersion
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  __int16 v40 = [MEMORY[0x263F08C38] UUID];
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  uint64_t v3 = (void *)qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = v3;
    uint64_t v5 = [v40 UUIDString];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_21C7C9000, v4, OS_LOG_TYPE_DEFAULT, "performBatchedSync: assigned UUID %{public}@", (uint8_t *)&buf, 0xCu);
  }
  os_activity_t v38 = _os_activity_create(&dword_21C7C9000, "CompanionSync BatchedFullSync", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  id v6 = [(SYStore *)self delegate];
  uint64_t v41 = [v6 beginSyncingAllObjectsForStore:self];

  if (v41)
  {
    id v7 = [(SYPersistentStore *)self->_persistentStore currentFullSyncID];
    id v8 = [(SYLegacyStore *)self persistentStore];
    [v8 setCompletedSync:0];

    id v9 = [(SYPersistentStore *)self->_persistentStore currentFullSyncID];
    LODWORD(v8) = v9 == 0;

    if (v8)
    {
      id v10 = objc_opt_new();
      uint64_t v39 = [v10 UUIDString];

      [(SYPersistentStore *)self->_persistentStore enterFullSyncWithID:v39 ignoring:0];
    }
    else
    {
      uint64_t v39 = v7;
    }
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v11 = (void *)qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v11;
      uint64_t v13 = [v40 UUIDString];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v13;
      _os_log_impl(&dword_21C7C9000, v12, OS_LOG_TYPE_DEFAULT, "Entering batch sync loop for UUID %{public}@", (uint8_t *)&buf, 0xCu);
    }
    id v14 = [(SYLegacyStore *)self newFullSyncContext];
    [v14 setObject:v39 forKeyedSubscript:@"SyncID"];
    uint64_t v15 = [(SYPersistentStore *)self->_persistentStore fullSyncUserInfo];
    BOOL v16 = v15 == 0;

    if (!v16)
    {
      id v17 = [(SYPersistentStore *)self->_persistentStore fullSyncUserInfo];
      [v14 setObject:v17 forKeyedSubscript:@"UserInfo"];
    }
    uint64_t v18 = [(SYPersistentStore *)self->_persistentStore fullSyncIDSOptions];
    BOOL v19 = v18 == 0;

    if (!v19)
    {
      id v20 = [(SYPersistentStore *)self->_persistentStore fullSyncIDSOptions];
      [v14 setObject:v20 forKeyedSubscript:@"IDSOptions"];
    }
    batchChunkUnackedIndices = self->_batchChunkUnackedIndices;
    if (batchChunkUnackedIndices)
    {
      [(NSMutableIndexSet *)batchChunkUnackedIndices removeAllIndexes];
    }
    else
    {
      uint64_t v22 = (NSMutableIndexSet *)objc_opt_new();
      id v23 = self->_batchChunkUnackedIndices;
      self->_batchChunkUnackedIndices = v22;
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v66 = 0x2020000000;
    int v67 = 0;
    v64[0] = 0;
    v64[1] = v64;
    v64[2] = 0x2020000000;
    v64[3] = 0;
    id v24 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:25];
    v62[0] = 0;
    v62[1] = v62;
    v62[2] = 0x2020000000;
    char v63 = 0;
    objc_initWeak(&location, self);
    v59[0] = MEMORY[0x263EF8330];
    v59[1] = 3221225472;
    v59[2] = __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke;
    v59[3] = &unk_264423080;
    objc_copyWeak(&v60, &location);
    long long v25 = (void *)MEMORY[0x21D4B17C0](v59);
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_2;
    v55[3] = &unk_2644230D0;
    objc_copyWeak(&v58, &location);
    id v26 = v14;
    id v56 = v26;
    id v27 = v25;
    id v57 = v27;
    long long v28 = (void *)MEMORY[0x21D4B17C0](v55);
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_546;
    v53[3] = &unk_2644230F8;
    id v29 = v28;
    id v54 = v29;
    uint64_t v30 = (void *)MEMORY[0x21D4B17C0](v53);
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_2_547;
    v42[3] = &unk_264423148;
    objc_copyWeak(&v52, &location);
    v42[4] = self;
    id v31 = v26;
    id v43 = v31;
    p_long long buf = &buf;
    id v32 = v29;
    id v45 = v32;
    id v33 = v24;
    id v44 = v33;
    __int16 v50 = v64;
    id v46 = v41;
    uint64_t v51 = v62;
    id v34 = v30;
    id v47 = v34;
    id v35 = v27;
    id v48 = v35;
    id v36 = (void *)MEMORY[0x21D4B17C0](v42);
    [(SYLegacyStore *)self _postBatchStartMessageWithState:v31 then:v36];

    objc_destroyWeak(&v52);
    objc_destroyWeak(&v58);

    objc_destroyWeak(&v60);
    objc_destroyWeak(&location);
    _Block_object_dispose(v62, 8);

    _Block_object_dispose(v64, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
      -[SYLegacyStore(BatchedSyncSupport) performBatchedSyncToCurrentDBVersion]();
    }
  }

  return v41 != 0;
}

void __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!a2 && WeakRetained)
  {
    id v7 = WeakRetained;
    uint64_t v4 = [WeakRetained persistentStore];
    uint64_t v5 = [v7 persistentStore];
    id v6 = [v5 currentFullSyncID];
    [v4 sendCompletedForSyncWithID:v6];

    id WeakRetained = v7;
  }
}

void __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (a3)
    {
      uint64_t v9 = MEMORY[0x263EF8330];
      uint64_t v10 = 3221225472;
      id v11 = __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_3;
      id v12 = &unk_2644230A8;
      id v13 = WeakRetained;
      id v14 = *(id *)(a1 + 32);
      [v13 _postBatchEndMessageWithState:v8 error:v5 then:&v9];

      if (!v5) {
        goto LABEL_11;
      }
    }
    else
    {
      [WeakRetained _postBatchEndMessageWithState:*(void *)(a1 + 32) error:v5 then:*(void *)(a1 + 40)];
      if (!v5) {
        goto LABEL_11;
      }
    }
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR)) {
      __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_2_cold_1();
    }
    objc_msgSend(v7, "_retrySync", v9, v10, v11, v12);
  }
LABEL_11:
}

void __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_3(uint64_t a1)
{
  id v8 = (id)objc_opt_new();
  id v2 = (void *)[*(id *)(a1 + 32) newMessageHeader];
  [v8 setHeader:v2];

  uint64_t v3 = objc_opt_new();
  [v8 setAllObjects:v3];

  [v8 setVersion:0];
  uint64_t v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"SyncID"];
  [v8 setSyncID:v4];

  id v6 = *(id **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = [v6[23] fullSyncIDSOptions];
  [v6 sendMessage:v8 ofType:2 respondingTo:0 userInfo:v5 idsOptions:v7];
}

uint64_t __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_546(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_2_547(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
  if (WeakRetained)
  {
    id v7 = [*(id *)(*(void *)(a1 + 32) + 184) currentFullSyncID];

    if (v7) {
      goto LABEL_6;
    }
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR))
    {
      __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_2_547_cold_3();
      if (!v5)
      {
LABEL_13:
        [*(id *)(a1 + 48) removeAllObjects];
        uint64_t v32 = 0;
        id v33 = &v32;
        uint64_t v34 = 0x3032000000;
        id v35 = __Block_byref_object_copy__3;
        id v36 = __Block_byref_object_dispose__3;
        id v37 = 0;
        activity_block[0] = MEMORY[0x263EF8330];
        activity_block[1] = 3221225472;
        activity_block[2] = __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_548;
        activity_block[3] = &unk_264423120;
        uint64_t v30 = *(void *)(a1 + 96);
        id v29 = *(id *)(a1 + 64);
        id v28 = *(id *)(a1 + 48);
        id v31 = &v32;
        _os_activity_initiate(&dword_21C7C9000, "Fetching sync batch", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

        uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
        if (v10 == 3)
        {

          if (_sync_log_facilities_pred != -1) {
            _os_once();
          }
          id v14 = qword_26AB04788;
          if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v26 = 0;
            _os_log_impl(&dword_21C7C9000, v14, OS_LOG_TYPE_DEFAULT, "CompanionSync: batched full-sync restart requested", v26, 2u);
          }
          uint64_t v15 = *(void *)(a1 + 40);
          id v12 = [WeakRetained nextBatchStep];
          [WeakRetained _restartBatchSyncWithState:v15 then:v12];
          id v5 = 0;
          goto LABEL_52;
        }
        if (v10 == 4 && v33[5])
        {
          if (_sync_log_facilities_pred != -1) {
            _os_once();
          }
          if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR)) {
            __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_2_547_cold_1();
          }
          *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 1;
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
          goto LABEL_53;
        }
        id v11 = [WeakRetained delegate];
        id v12 = v11;
        uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
        if (v13 == 2 || v13 == 4)
        {
          if ((WeakRetained[8] & 0x100) != 0) {
            [v11 syncStoreShouldDeleteRemoteObjectsOnFailedFullSync:*(void *)(a1 + 32)];
          }
          if (!v33[5])
          {
            if (*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) == 2) {
              [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3072 userInfo:0];
            }
            else {
            uint64_t v21 = [MEMORY[0x263F087E8] errorWithSYError:1004 userInfo:0];
            }
            uint64_t v22 = (void *)v33[5];
            v33[5] = v21;
          }
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        }
        else
        {

          if ([*(id *)(a1 + 48) count])
          {
            BOOL v16 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)];
            [*(id *)(a1 + 40) setObject:v16 forKeyedSubscript:@"BatchIndex"];

            uint64_t v18 = *(void *)(a1 + 40);
            uint64_t v17 = *(void *)(a1 + 48);
            uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
            if (v19 == 1)
            {
              id v20 = *(void **)(a1 + 72);
            }
            else
            {
              id v20 = [WeakRetained nextBatchStep];
            }
            [WeakRetained _sendBatchChunk:v17 withState:v18 then:v20];
            if (v19 != 1) {

            }
            id v23 = *(void **)(*(void *)(a1 + 32) + 104);
            ++*(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
            objc_msgSend(v23, "addIndex:");
            id v5 = 0;
          }
          else
          {
            [*(id *)(a1 + 32) _postBatchEndMessageWithState:*(void *)(a1 + 40) error:0 then:*(void *)(a1 + 80)];
            id v5 = 0;
          }
        }
        uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
        if (v24 == 4)
        {
          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24)
            || (*(_WORD *)(*(void *)(a1 + 32) + 16) & 0x200) == 0)
          {
LABEL_52:

LABEL_53:
            _Block_object_dispose(&v32, 8);

            goto LABEL_54;
          }
          [v12 syncStore:WeakRetained encounteredErrorInFullSync:v33[5]];
          uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
        }
        if (v24 == 1)
        {
          long long v25 = [WeakRetained persistentStore];
          [v25 setCompletedSync:1];
        }
        goto LABEL_52;
      }
    }
    else
    {
LABEL_6:
      if (!v5) {
        goto LABEL_13;
      }
    }
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR)) {
      __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_2_547_cold_2();
    }
    if (a3 == 1)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = [WeakRetained nextBatchStep];
      [WeakRetained _restartBatchSyncWithState:v8 then:v9];

      *(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
      goto LABEL_13;
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
LABEL_54:
}

void __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_548(void *a1)
{
  uint64_t v2 = a1[5];
  id v6 = 0;
  uint64_t v3 = (*(uint64_t (**)(void))(v2 + 16))();
  id v4 = v6;
  id v5 = v6;
  *(void *)(*(void *)(a1[6] + 8) + 24) = v3;
  if (v5) {
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v4);
  }
}

- (void)processBatchSyncStart
{
  if ([(SYLegacyStore *)self alwaysWins])
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR)) {
      -[SYLegacyStore(BatchedSyncSupport) processBatchSyncStart]();
    }
    [MEMORY[0x263EFF940] raise:@"Full batched sync sent to master device" format:@"Only the slave device should receive a full sync (from the master)"];
  }
  double Current = CFAbsoluteTimeGetCurrent();
  id v4 = [(SYStore *)self delegate];
  id v5 = _os_activity_create(&dword_21C7C9000, "CompanionSync ProcessBatchSyncStart", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __58__SYLegacyStore_BatchedSyncSupport__processBatchSyncStart__block_invoke;
  id v11 = &unk_264422990;
  id v12 = self;
  id v13 = v4;
  id v6 = v4;
  os_activity_apply(v5, &v8);
  id v7 = +[SYStatisticStore sharedInstance];
  [v7 updateLastIncomingMessageWithProcessingTime:CFAbsoluteTimeGetCurrent() - Current];
}

void __58__SYLegacyStore_BatchedSyncSupport__processBatchSyncStart__block_invoke(uint64_t a1)
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
    __58__SYLegacyStore_BatchedSyncSupport__processBatchSyncStart__block_invoke_cold_1();
  }
  __int16 v2 = *(_WORD *)(*(void *)(a1 + 32) + 16);
  if ((v2 & 2) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "syncStoreWillUpdate:objectCount:");
  }
  else if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "syncStoreWillUpdate:");
  }
  __int16 v3 = *(_WORD *)(*(void *)(a1 + 32) + 16);
  if ((v3 & 0x10) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "syncStoreAllObjectsDeleted:");
    __int16 v3 = *(_WORD *)(*(void *)(a1 + 32) + 16);
  }
  if ((v3 & 4) != 0) {
    objc_msgSend(*(id *)(a1 + 40), "syncStoreDidUpdate:");
  }
}

- (void)processBatchSyncEnd:(unint64_t)a3
{
  os_activity_t v4 = _os_activity_create(&dword_21C7C9000, "CompanionSync ProcessBatchSyncEnd", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
    -[SYLegacyStore(BatchedSyncSupport) processBatchSyncEnd:]();
  }
  if ((*(_WORD *)&self->super._flags & 8) != 0)
  {
    id v5 = [(SYStore *)self delegate];
    [v5 syncStoreDidCompleteFullSync:self];
  }
}

- (BOOL)processBatchChunkAtIndex:(unsigned int)a3 encodedObjects:(id)a4 error:(id *)a5
{
  id v6 = a4;
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v7 = (void *)qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
    -[SYLegacyStore(BatchedSyncSupport) processBatchChunkAtIndex:encodedObjects:error:](v7, v6);
  }
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v9 = _os_activity_create(&dword_21C7C9000, "CompanionSync Delivering Batch Chunk", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __83__SYLegacyStore_BatchedSyncSupport__processBatchChunkAtIndex_encodedObjects_error___block_invoke;
  BOOL v16 = &unk_264422990;
  id v17 = v6;
  uint64_t v18 = self;
  id v10 = v6;
  os_activity_apply(v9, &v13);
  id v11 = +[SYStatisticStore sharedInstance];
  [v11 updateLastIncomingMessageWithProcessingTime:CFAbsoluteTimeGetCurrent() - Current];

  return 1;
}

uint64_t __83__SYLegacyStore_BatchedSyncSupport__processBatchChunkAtIndex_encodedObjects_error___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __83__SYLegacyStore_BatchedSyncSupport__processBatchChunkAtIndex_encodedObjects_error___block_invoke_2;
  v3[3] = &unk_264423170;
  uint64_t v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateObjectsUsingBlock:v3];
}

void __83__SYLegacyStore_BatchedSyncSupport__processBatchChunkAtIndex_encodedObjects_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  __int16 v2 = (id *)(a1 + 32);
  __int16 v3 = [*(id *)(a1 + 32) decodeSYObject:a2];
  if (v3)
  {
    os_activity_t v4 = [*v2 delegate];
    [v4 syncStore:*v2 objectAdded:v3];
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v5 = (void *)qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR)) {
      __83__SYLegacyStore_BatchedSyncSupport__processBatchChunkAtIndex_encodedObjects_error___block_invoke_2_cold_1((uint64_t)v2, v5);
    }
  }
}

- (void)processBatchChunkAck:(unsigned int)a3
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v5 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
    -[SYLegacyStore(BatchedSyncSupport) processBatchChunkAck:](a3, v5);
  }
  if ([(NSMutableIndexSet *)self->_batchChunkUnackedIndices containsIndex:a3])
  {
    [(NSMutableIndexSet *)self->_batchChunkUnackedIndices removeIndex:a3];
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v6 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR)) {
      -[SYLegacyStore(BatchedSyncSupport) processBatchChunkAck:](a3, v6);
    }
  }
}

- (void)willBeginDeltaSync
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  __int16 v3 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_activity_t v4 = 0;
    _os_log_impl(&dword_21C7C9000, v3, OS_LOG_TYPE_DEFAULT, "Beginning SYLegacyStore delta sync", v4, 2u);
  }
  [(SYPersistentStore *)self->_persistentStore setPerformingDeltaSync:1];
}

- (void)didEndDeltaSync
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  __int16 v3 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_activity_t v4 = 0;
    _os_log_impl(&dword_21C7C9000, v3, OS_LOG_TYPE_DEFAULT, "Ended SYLegacyStore delta sync", v4, 2u);
  }
  [(SYPersistentStore *)self->_persistentStore setPerformingDeltaSync:0];
  if (self->_deferredFullSync)
  {
    self->_deferredFullSync = 0;
    [(SYLegacyStore *)self performFullSync];
  }
}

- (BOOL)inDeltaSync
{
  return [(SYPersistentStore *)self->_persistentStore isPerformingDeltaSync];
}

- (BOOL)tracksChanges
{
  return self->_tracksChanges;
}

- (void)setTracksChanges:(BOOL)a3
{
  if (self->_tracksChanges != a3)
  {
    self->_tracksChanges = a3;
    -[SYPersistentStore changeTrackingToggled:](self->_persistentStore, "changeTrackingToggled:");
  }
}

- (void)_checkMessageHeader:(void *)a1 messageID:.cold.1(void *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  id v2 = a1;
  v3[0] = 67109120;
  v3[1] = [(id)OUTLINED_FUNCTION_5() version];
  _os_log_error_impl(&dword_21C7C9000, v1, OS_LOG_TYPE_ERROR, "Received message from unknown protocol version '%u'", (uint8_t *)v3, 8u);
}

- (void)_checkMessageHeader:(os_log_t)log messageID:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  _os_log_error_impl(&dword_21C7C9000, log, (os_log_type_t)0x90u, "Message repeated (bubble): seqno = %qu, messageID: %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)_recordLastSeqNo:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  int v3 = (void *)OUTLINED_FUNCTION_5();
  uint64_t v4 = _SYObfuscate(v3);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3(&dword_21C7C9000, v5, v6, "Failed to store latest incoming sequence number: %{public}@", v7, v8, v9, v10, v11);
}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_7_cold_1()
{
  OUTLINED_FUNCTION_16();
  uint64_t v1 = v0;
  id v2 = [v0 inReplyTo];
  int v3 = [v1 header];
  [v3 version];
  OUTLINED_FUNCTION_13(&dword_21C7C9000, v4, v5, "Peer responded to message %{public}@ with a version rejection. Peer is using version %u, and supports versions %{public}@", v6, v7, v8, v9, 2u);
}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_115_cold_1(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v3 = a1;
  if ([a2 accepted]) {
    uint64_t v4 = "YES";
  }
  else {
    uint64_t v4 = "NO";
  }
  uint64_t v5 = [a2 inProgressSyncID];
  uint64_t v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = (__CFString *)v5;
  }
  else {
    uint64_t v7 = @"nil";
  }
  uint64_t v8 = [a2 error];
  uint64_t v9 = (void *)v8;
  int v11 = 136315650;
  if (v8) {
    uint64_t v10 = (__CFString *)v8;
  }
  else {
    uint64_t v10 = @"nil";
  }
  id v12 = v4;
  __int16 v13 = 2114;
  uint64_t v14 = v7;
  __int16 v15 = 2112;
  BOOL v16 = v10;
  _os_log_debug_impl(&dword_21C7C9000, v3, OS_LOG_TYPE_DEBUG, "SyncRequest response: accepted=%s, inProgressSyncID=%{public}@, error=%@", (uint8_t *)&v11, 0x20u);
}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_122_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_5() waitingForSyncEndID];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3(&dword_21C7C9000, v5, v6, "Wait for in-progress sync %{public}@ timed out, re-sending sync request now.", v7, v8, v9, v10, v11);
}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_2_125_cold_1()
{
  OUTLINED_FUNCTION_16();
  id v2 = [v1 idsIdentifier];
  [*v0 count];
  OUTLINED_FUNCTION_13(&dword_21C7C9000, v3, v4, "Dropped messages detected upon receipt of message with ID %{public}@: missing %u ACKs of full-sync batches, specifically: %{public}@", v5, v6, v7, v8, 2u);
}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_133_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_5();
  uint64_t v4 = _SYObfuscate(v3);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3(&dword_21C7C9000, v5, v6, "Failed to send full-sync initiation message; dropping it on the floor and leaving sync mode. Next change will trigge"
    "r a full sync. Error = %{public}@",
    v7,
    v8,
    v9,
    v10,
    v11);
}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_133_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_21C7C9000, v0, v1, "dataIdentifier: %{public}@ didSendWithSuccess: NO error: %@");
}

- (void)peerState:fromPeer:matchesExpectationForChangeCount:offsetAmount:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_9();
  _os_log_error_impl(&dword_21C7C9000, v0, OS_LOG_TYPE_ERROR, "Peer has a future version of my data ?? It has: %llu, I have: %llu", v1, 0x16u);
}

- (void)peerState:fromPeer:matchesExpectationForChangeCount:offsetAmount:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_6(&dword_21C7C9000, v0, v1, "My vector clock: %{public}@", v2, v3, v4, v5, v6);
}

- (void)peerState:fromPeer:matchesExpectationForChangeCount:offsetAmount:.cold.3()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6(&dword_21C7C9000, v0, v1, "Incoming vector clock: %{public}@", v2, v3, v4, v5, v6);
}

void __47__SYLegacyStore_handleSyncAllObjects_response___block_invoke_cold_1(int a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void **)(a2 + 48);
  uint64_t v5 = a3;
  uint8_t v6 = _SYObfuscate(v4);
  v7[0] = 67109378;
  v7[1] = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v6;
  _os_log_debug_impl(&dword_21C7C9000, v5, OS_LOG_TYPE_DEBUG, "Failed to decode data object at index %u of message: %{public}@", (uint8_t *)v7, 0x12u);
}

void __47__SYLegacyStore_handleSyncAllObjects_response___block_invoke_cold_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_5() service];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_12_0(&dword_21C7C9000, v5, v6, "Decoded nil object from change data for service %{public}@., Enable debug logging (on debug builds only) to see full info.", v7, v8, v9, v10, v11);
}

- (void)handleChangeMessage:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_21C7C9000, v0, v1, "No delegate for -handleChangeMessage:, so I have to ignore the change!! This will likely cause problems...", v2, v3, v4, v5, v6);
}

- (void)handleChangeMessage:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_21C7C9000, v0, v1, "handleChangeMessage - done", v2, v3, v4, v5, v6);
}

- (void)handleChangeMessage:(void *)a3 .cold.3(void *a1, uint8_t *buf, void *a3, os_log_t log)
{
  *(_DWORD *)long long buf = 138543362;
  *a3 = a1;
  _os_log_error_impl(&dword_21C7C9000, log, OS_LOG_TYPE_ERROR, "No object decoded from payload for change '%{public}@'", buf, 0xCu);
}

- (void)handleChangeMessage:(unsigned char *)a1 .cold.4(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_10(a1, a2);
  OUTLINED_FUNCTION_11(&dword_21C7C9000, v2, v3, "remoteStoreDidChange, objectAdded", v4);
}

- (void)handleChangeMessage:(unsigned char *)a1 .cold.5(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_10(a1, a2);
  OUTLINED_FUNCTION_11(&dword_21C7C9000, v2, v3, "remoteStoreDidChange, objectUpdated", v4);
}

- (void)handleChangeMessage:(unsigned char *)a1 .cold.6(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_10(a1, a2);
  OUTLINED_FUNCTION_11(&dword_21C7C9000, v2, v3, "remoteStoreDidChange, objectDeleted", v4);
}

- (void)handleChangeMessage:.cold.7()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7(&dword_21C7C9000, v0, v1, "New message seqno: %qu, last message seqno: %qu", v2, v3);
}

- (void)messageCenter:(void *)a1 didReceiveUnknownRequest:.cold.1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_5();
  uint64_t v4 = _SYObfuscate(v3);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3(&dword_21C7C9000, v5, v6, "Received an unknown message: %{public}@", v7, v8, v9, v10, v11);
}

- (void)messageCenter:(void *)a1 didResolveIDSIdentifierForRequest:.cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_5() idsIdentifier];
  OUTLINED_FUNCTION_1_2();
  _os_log_debug_impl(&dword_21C7C9000, v1, OS_LOG_TYPE_DEBUG, "Ending XPC transaction around (asynchronous) message send (%s)", v4, 0xCu);
}

- (void)messageCenter:didSuccessfullySendRequestWithIdentifier:userInfo:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6(&dword_21C7C9000, v0, v1, "dataIdentifier: %{public}@ didSendWithSuccess: YES error: nil", v2, v3, v4, v5, v6);
}

- (void)messageCenter:didSuccessfullyDeliverRequestWithIdentifier:userInfo:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6(&dword_21C7C9000, v0, v1, "Remote delivery confirmation for %{public}@", v2, v3, v4, v5, v6);
}

- (void)sendMessage:(void *)a1 ofType:respondingTo:userInfo:idsOptions:.cold.1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_5();
  uint64_t v4 = _SYObfuscate(v3);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3(&dword_21C7C9000, v5, v6, "Failed to wrap message: %{public}@", v7, v8, v9, v10, v11);
}

- (void)sendMessage:ofType:respondingTo:userInfo:idsOptions:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_21C7C9000, v0, v1, "Entering XPC transaction around (asynchronous) message-send", v2, v3, v4, v5, v6);
}

- (void)logChanges:.cold.1()
{
  OUTLINED_FUNCTION_16();
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = v2;
  int v4 = 134218242;
  uint64_t v5 = [v1 count];
  __int16 v6 = 2112;
  uint64_t v7 = v0;
  _os_log_error_impl(&dword_21C7C9000, v3, OS_LOG_TYPE_ERROR, "Failed to log %zu changes: %@", (uint8_t *)&v4, 0x16u);
}

void __56__SYLegacyStore_setNeedsFullSyncWithContext_idsOptions___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_21C7C9000, v0, v1, "Skipping full sync, already in progress", v2, v3, v4, v5, v6);
}

void __56__SYLegacyStore_setNeedsFullSyncWithContext_idsOptions___block_invoke_2_cold_2(uint64_t *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  id v4 = a2;
  int v5 = [(id)OUTLINED_FUNCTION_5() alwaysWins];
  uint8_t v6 = "NO";
  if (v5) {
    uint8_t v6 = "YES";
  }
  int v7 = 134218242;
  uint64_t v8 = v3;
  __int16 v9 = 2080;
  uint64_t v10 = v6;
  _os_log_debug_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_DEBUG, "-setNeedsFullSync called by client - SYStore %p, alwaysWins %s", (uint8_t *)&v7, 0x16u);
}

- (void)remoteStoreAllObjects:fromPeer:clock:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_21C7C9000, v0, v1, "No delegate set, so changes will be ignored.", v2, v3, v4, v5, v6);
}

- (void)remoteStoreAllObjects:fromPeer:clock:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_21C7C9000, v0, v1, "Full sync sent to the master device!", v2, v3, v4, v5, v6);
}

- (void)performFullSyncIfNecessaryAskingDelegate:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_21C7C9000, v0, v1, "Already in full-sync, send was complete, ignoring this request", v2, v3, v4, v5, v6);
}

- (void)performFullSyncIfNecessaryAskingDelegate:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_21C7C9000, v0, v1, "Already in full-sync, ignoring this request", v2, v3, v4, v5, v6);
}

void __58__SYLegacyStore_performFullSyncIfNecessaryAskingDelegate___block_invoke_206_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_21C7C9000, v0, v1, "No full-sync sent, so triggering full sync now", v2, v3, v4, v5, v6);
}

void __58__SYLegacyStore_performFullSyncIfNecessaryAskingDelegate___block_invoke_206_cold_2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_6(&dword_21C7C9000, v0, v1, "delegate shouldPerformInitialFullSync returned %s", v2, v3, v4, v5, v6);
}

void __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_21C7C9000, v0, v1, "Error detected during batched full-sync: scheduling retry", v2, v3, v4, v5, v6);
}

void __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_2_547_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_2();
  _os_log_error_impl(&dword_21C7C9000, v0, OS_LOG_TYPE_ERROR, "Batch sync client reported error: %{public}@", v1, 0xCu);
}

void __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_2_547_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4_0();
  _os_log_error_impl(&dword_21C7C9000, v0, OS_LOG_TYPE_ERROR, "Error during batched sync: %{public}@", v1, 0xCu);
}

void __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_2_547_cold_3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_21C7C9000, v0, v1, "I'm doing a batched sync, but I have no current sync ID?", v2, v3, v4, v5, v6);
}

void __58__SYLegacyStore_BatchedSyncSupport__processBatchSyncStart__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_21C7C9000, v0, v1, "Starting batched full-sync", v2, v3, v4, v5, v6);
}

void __83__SYLegacyStore_BatchedSyncSupport__processBatchChunkAtIndex_encodedObjects_error___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_5() service];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3(&dword_21C7C9000, v5, v6, "Decoded nil object from change data for service %{public}@., Enable debug logging (on debug builds only) to see full info.", v7, v8, v9, v10, v11);
}

@end