@interface ASRelationshipManager
- (ASRelationshipManager)initWithIsWatch:(BOOL)a3;
- (ASRelationshipManagerSecureCloudDelegate)secureCloudDelegate;
- (BOOL)_appIsInstalled;
- (BOOL)isReadyToProcessChanges;
- (NSDictionary)messageCenters;
- (id)_contactWithIncomingHandshakeToken:(id)a3;
- (id)_contactWithInviteRequest:(id)a3 fromSender:(id)a4;
- (id)_contactWithOutgoingHandshakeToken:(id)a3;
- (id)_contactWithRemoteRelationshipRecordZoneID:(id)a3;
- (id)_contactWithUUIDPreferringPlaceholders:(id)a3;
- (id)_currentActivityDataPreview;
- (id)_queue_handleSavedRecords:(id)a3 forContact:(id)a4;
- (id)_relationshipFromContact:(id)a3;
- (id)_remoteRelationshipFromContact:(id)a3;
- (id)insertPlaceholderRelationshipEvent:(unsigned __int16)a3 friendUUID:(id)a4;
- (void)_contactStoreDidChangeNotification:(id)a3;
- (void)_insertInviteForContact:(id)a3 destination:(id)a4 serviceIdentifier:(id)a5;
- (void)_performBlockWaitingForFriendshipBeganForFriendWithUUID:(id)a3 block:(id)a4;
- (void)_processActivityDataPreview:(id)a3 friendUUID:(id)a4;
- (void)_processPersistedMessagesIfNeeded;
- (void)_queue_acceptShares:(id)a3 forRelationship:(id)a4 contact:(id)a5 cloudKitGroup:(id)a6 completion:(id)a7;
- (void)_queue_addPersonWithCloudKitAddress:(id)a3 toShares:(id)a4 cloudKitGroup:(id)a5 completion:(id)a6;
- (void)_queue_fetchSharesForRelationship:(id)a3 cloudKitGroup:(id)a4 completion:(id)a5;
- (void)_queue_insertPlaceholderFriendshipDidBeginForContactWithUUID:(id)a3;
- (void)_queue_processEndRelationshipIfNeededForPreviousRemoteRelationship:(id)a3 newRemoteRelationship:(id)a4 contact:(id)a5 xpcActivity:(id)a6 cloudKitGroup:(id)a7 processGroup:(id)a8;
- (void)_queue_processRemoteRelationships:(id)a3 activity:(id)a4 cloudKitGroup:(id)a5 completion:(id)a6;
- (void)_queue_reconcileCloudKitRelationships:(id)a3;
- (void)_queue_removeFriendWithUUID:(id)a3 eventType:(unsigned __int16)a4 activity:(id)a5 cloudKitGroup:(id)a6 completion:(id)a7;
- (void)_queue_removeLegacyFriendWithUUID:(id)a3 eventType:(unsigned __int16)a4 activity:(id)a5 cloudKitGroup:(id)a6 completion:(id)a7;
- (void)_queue_removePlaceholderRelationshipBeganForContactWithUUID:(id)a3 success:(BOOL)a4;
- (void)_queue_saveRelationship:(id)a3 contact:(id)a4 activity:(id)a5 cloudKitGroup:(id)a6 completion:(id)a7;
- (void)_queue_saveRelationship:(id)a3 contact:(id)a4 extraRecordsToSave:(id)a5 extraRecordIDsToDelete:(id)a6 activity:(id)a7 cloudKitGroup:(id)a8 completion:(id)a9;
- (void)_queue_saveRelationship:(id)a3 contact:(id)a4 withExtraRecords:(id)a5 activity:(id)a6 cloudKitGroup:(id)a7 completion:(id)a8;
- (void)_queue_saveRelationshipAndFetchOrCreateShares:(id)a3 contact:(id)a4 cloudKitGroup:(id)a5 completion:(id)a6;
- (void)acceptInviteRequestFromFriendWithUUID:(id)a3 completion:(id)a4;
- (void)acceptShares:(id)a3 forRelationship:(id)a4 contact:(id)a5 cloudKitGroup:(id)a6 completion:(id)a7;
- (void)activitySharingManagerReady:(id)a3;
- (void)beginReceivingMessages;
- (void)cloudKitManager:(id)a3 didBeginUpdatesForFetchWithType:(int64_t)a4;
- (void)cloudKitManager:(id)a3 didReceiveNewRelationships:(id)a4 fromRecordZoneWithID:(id)a5 moreComing:(BOOL)a6 changesProcessedHandler:(id)a7;
- (void)cloudKitManager:(id)a3 didReceiveNewRemoteRelationships:(id)a4 fromRecordZoneWithID:(id)a5 moreComing:(BOOL)a6 activity:(id)a7 cloudKitGroup:(id)a8 changesProcessedHandler:(id)a9;
- (void)dealloc;
- (void)endReceivingMessages;
- (void)friendInviteBulletinManagerDidReceiveActionResponse:(int64_t)a3 fromContactWithUUID:(id)a4;
- (void)handleSavedRecords:(id)a3 forContact:(id)a4 completion:(id)a5;
- (void)ignoreInviteRequestFromFriendWithUUID:(id)a3 completion:(id)a4;
- (void)messageCenter:(id)a3 didReceiveFinalizeHandshake:(id)a4 fromSenderAddress:(id)a5 receiverAddress:(id)a6 messageHandledCompletion:(id)a7;
- (void)messageCenter:(id)a3 didReceiveInviteRequest:(id)a4 fromSenderAddress:(id)a5 receiverAddress:(id)a6 messageHandledCompletion:(id)a7;
- (void)messageCenter:(id)a3 didReceiveInviteResponse:(id)a4 fromSenderAddress:(id)a5 receiverAddress:(id)a6 messageHandledCompletion:(id)a7;
- (void)messageCenter:(id)a3 didReceiveWithdrawInviteRequest:(id)a4 fromSenderAddress:(id)a5 receiverAddress:(id)a6 messageHandledCompletion:(id)a7;
- (void)notificationManager:(id)a3 didReceiveActionResponse:(int64_t)a4 fromContactWithUUID:(id)a5;
- (void)processRetryMessages;
- (void)removeFriendWithUUID:(id)a3 completion:(id)a4;
- (void)removeLegacyFriendWithUUID:(id)a3 event:(unsigned __int16)a4 cloudKitGroup:(id)a5 completion:(id)a6;
- (void)removePlaceholderRelationshipEventWithToken:(id)a3;
- (void)saveRelationship:(id)a3 contact:(id)a4 cloudKitGroup:(id)a5 activity:(id)a6 completion:(id)a7;
- (void)saveRelationship:(id)a3 contact:(id)a4 extraRecordsToSave:(id)a5 extraRecordIDsToDelete:(id)a6 cloudKitGroup:(id)a7 activity:(id)a8 completion:(id)a9;
- (void)saveRelationshipAndFetchOrCreateShares:(id)a3 contact:(id)a4 cloudKitGroup:(id)a5 completion:(id)a6;
- (void)saveRelationships:(id)a3 extraRecordsToSave:(id)a4 cloudKitGroup:(id)a5 activity:(id)a6 completion:(id)a7;
- (void)sendInviteToPersonWithDestination:(id)a3 callerID:(id)a4 serviceIdentifier:(id)a5 completion:(id)a6;
- (void)sendWithdrawInviteRequestToFriendWithUUID:(id)a3 completion:(id)a4;
- (void)setActivityDataVisible:(BOOL)a3 toFriendWithUUID:(id)a4 completion:(id)a5;
- (void)setActivityDataVisible:(BOOL)a3 toFriendWithUUID:(id)a4 eventType:(unsigned __int16)a5 cloudKitGroup:(id)a6 completion:(id)a7;
- (void)setMessageCenters:(id)a3;
- (void)setMuteEnabled:(BOOL)a3 forFriendWithUUID:(id)a4 completion:(id)a5;
- (void)setSecureCloudDelegate:(id)a3;
- (void)updateRelationshipWithCompetitionEvent:(unsigned __int16)a3 friendUUID:(id)a4 activity:(id)a5 cloudKitGroup:(id)a6 completion:(id)a7;
- (void)updateRelationshipsForCurrentFeatureSupportWithActivity:(id)a3 cloudKitGroup:(id)a4 completion:(id)a5;
@end

@implementation ASRelationshipManager

- (ASRelationshipManager)initWithIsWatch:(BOOL)a3
{
  v36[2] = *MEMORY[0x263EF8340];
  v32.receiver = self;
  v32.super_class = (Class)ASRelationshipManager;
  v3 = [(ASRelationshipManager *)&v32 init];
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFEA68]);
    v5 = (void *)tcc_identity_create();
    [v4 setAssumedIdentity:v5];

    uint64_t v6 = [objc_alloc(MEMORY[0x263EFEA58]) initWithConfiguration:v4];
    contactStore = v3->_contactStore;
    v3->_contactStore = (CNContactStore *)v6;

    uint64_t v8 = HKCreateSerialDispatchQueue();
    serialQueue = v3->_serialQueue;
    v3->_serialQueue = (OS_dispatch_queue *)v8;

    v10 = [[ASAsyncTransactionQueue alloc] initWithDescription:@"RelationshipManagerTransaction" targetSerialQueue:v3->_serialQueue];
    transactionQueue = v3->_transactionQueue;
    v3->_transactionQueue = v10;

    uint64_t v12 = objc_opt_new();
    relationshipRecordsToReconcile = v3->_relationshipRecordsToReconcile;
    v3->_relationshipRecordsToReconcile = (NSMutableDictionary *)v12;

    uint64_t v14 = objc_opt_new();
    remoteRelationshipRecordsToProcess = v3->_remoteRelationshipRecordsToProcess;
    v3->_remoteRelationshipRecordsToProcess = (NSMutableDictionary *)v14;

    uint64_t v16 = objc_opt_new();
    placeholderFriendshipBeganTokens = v3->_placeholderFriendshipBeganTokens;
    v3->_placeholderFriendshipBeganTokens = (NSMutableDictionary *)v16;

    uint64_t v34 = *MEMORY[0x263F23E08];
    v18 = [[ASIDSMessageCenter alloc] initWithServiceIdentifier:v34];
    v36[0] = v18;
    uint64_t v35 = *MEMORY[0x263F23E10];
    v19 = [[ASIDSMessageCenter alloc] initWithServiceIdentifier:v35];
    v36[1] = v19;
    uint64_t v20 = [NSDictionary dictionaryWithObjects:v36 forKeys:&v34 count:2];
    messageCenters = v3->_messageCenters;
    v3->_messageCenters = (NSDictionary *)v20;

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v22 = [(NSDictionary *)v3->_messageCenters allValues];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v29 != v25) {
            objc_enumerationMutation(v22);
          }
          [*(id *)(*((void *)&v28 + 1) + 8 * i) setDelegate:v3];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v24);
    }
  }
  return v3;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gatewayManager);
  [WeakRetained removeObserver:self];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)ASRelationshipManager;
  [(ASRelationshipManager *)&v5 dealloc];
}

- (void)activitySharingManagerReady:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 fitnessAppsStateObserver];
  fitnessAppsStateObserver = self->_fitnessAppsStateObserver;
  self->_fitnessAppsStateObserver = v5;

  v7 = [v4 achievementManager];
  objc_storeWeak((id *)&self->_achievementManager, v7);

  uint64_t v8 = [v4 activityDataManager];
  objc_storeWeak((id *)&self->_activityDataManager, v8);

  v9 = [v4 contactsManager];
  objc_storeWeak((id *)&self->_contactsManager, v9);

  v10 = [v4 friendListManager];
  objc_storeWeak((id *)&self->_friendListManager, v10);

  v11 = [v4 cloudKitManager];
  objc_storeWeak((id *)&self->_cloudKitManager, v11);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudKitManager);
  [WeakRetained addObserver:self];

  v13 = [v4 gatewayManager];
  objc_storeWeak((id *)&self->_gatewayManager, v13);

  id v14 = objc_loadWeakRetained((id *)&self->_gatewayManager);
  [v14 addObserver:self];

  v15 = [v4 friendInviteBulletinManager];
  objc_storeWeak((id *)&self->_friendInviteBulletinManager, v15);

  id v16 = objc_loadWeakRetained((id *)&self->_friendInviteBulletinManager);
  [v16 setDelegate:self];

  self->_isWatch = [v4 isWatch];
  v17 = [v4 bulletinPostingManager];

  objc_storeWeak((id *)&self->_bulletinPostingManager, v17);
  v18 = [ASRelationshipFinalizationStore alloc];
  id v21 = objc_loadWeakRetained((id *)&self->_contactsManager);
  v19 = [(ASRelationshipFinalizationStore *)v18 initWithCloudType:0 contactsManager:v21 clientQueue:self->_serialQueue];
  finalizingStore = self->_finalizingStore;
  self->_finalizingStore = v19;
}

- (BOOL)_appIsInstalled
{
  if (self->_isWatch) {
    v2 = (void *)MEMORY[0x263F3D120];
  }
  else {
    v2 = (void *)MEMORY[0x263F3D138];
  }
  return [(FIFitnessAppsStateObserver *)self->_fitnessAppsStateObserver installStateForBundleIdentifier:*v2] == 1;
}

- (void)beginReceivingMessages
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [(ASRelationshipManager *)self _processPersistedMessagesIfNeeded];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = [(NSDictionary *)self->_messageCenters allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) beginReceivingMessages];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  uint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 addObserver:self selector:sel__contactStoreDidChangeNotification_ name:*MEMORY[0x263EFE118] object:0];
}

- (void)endReceivingMessages
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(NSDictionary *)self->_messageCenters allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) endReceivingMessages];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  uint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 removeObserver:self name:*MEMORY[0x263EFE118] object:0];
}

- (void)processRetryMessages
{
}

uint64_t __45__ASRelationshipManager_processRetryMessages__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 processRetryMessageQueue];
}

- (void)setActivityDataVisible:(BOOL)a3 toFriendWithUUID:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v6) {
    uint64_t v10 = 6;
  }
  else {
    uint64_t v10 = 5;
  }
  long long v11 = [(ASRelationshipManager *)self insertPlaceholderRelationshipEvent:v10 friendUUID:v8];
  objc_copyWeak(&to, (id *)&self->_contactsManager);
  long long v12 = ASCloudKitGroupUserActionExplicit();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudKitManager);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __76__ASRelationshipManager_setActivityDataVisible_toFriendWithUUID_completion___block_invoke;
  v18[3] = &unk_265218138;
  objc_copyWeak(&v24, &to);
  id v14 = v11;
  id v19 = v14;
  id v15 = v9;
  id v23 = v15;
  uint64_t v20 = self;
  id v16 = v8;
  id v21 = v16;
  BOOL v26 = v6;
  __int16 v25 = v10;
  id v17 = v12;
  id v22 = v17;
  [WeakRetained fetchAllChangesWithPriority:2 activity:0 group:v17 completion:v18];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&to);
}

void __76__ASRelationshipManager_setActivityDataVisible_toFriendWithUUID_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    [WeakRetained removePlaceholderContactWithToken:*(void *)(a1 + 32)];

    _NotifyOnMainQueue(0, v5, *(void **)(a1 + 64));
  }
  id v8 = *(void **)(a1 + 40);
  uint64_t v7 = *(void **)(a1 + 48);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __76__ASRelationshipManager_setActivityDataVisible_toFriendWithUUID_completion___block_invoke_2;
  v9[3] = &unk_265218110;
  v9[4] = v8;
  char v16 = *(unsigned char *)(a1 + 82);
  id v10 = v7;
  __int16 v15 = *(_WORD *)(a1 + 80);
  id v11 = *(id *)(a1 + 56);
  objc_copyWeak(&v14, (id *)(a1 + 72));
  id v12 = *(id *)(a1 + 32);
  id v13 = *(id *)(a1 + 64);
  [v8 _performBlockWaitingForFriendshipBeganForFriendWithUUID:v10 block:v9];

  objc_destroyWeak(&v14);
}

void __76__ASRelationshipManager_setActivityDataVisible_toFriendWithUUID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 82);
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(unsigned __int16 *)(a1 + 80);
  uint64_t v6 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __76__ASRelationshipManager_setActivityDataVisible_toFriendWithUUID_completion___block_invoke_3;
  v7[3] = &unk_2652180E8;
  objc_copyWeak(&v10, (id *)(a1 + 72));
  id v8 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 64);
  [v3 setActivityDataVisible:v2 toFriendWithUUID:v4 eventType:v5 cloudKitGroup:v6 completion:v7];

  objc_destroyWeak(&v10);
}

void __76__ASRelationshipManager_setActivityDataVisible_toFriendWithUUID_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (id *)(a1 + 48);
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained removePlaceholderContactWithToken:*(void *)(a1 + 32)];

  (*(void (**)(void, BOOL, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2 != 0, v7);
}

- (void)setActivityDataVisible:(BOOL)a3 toFriendWithUUID:(id)a4 eventType:(unsigned __int16)a5 cloudKitGroup:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __100__ASRelationshipManager_setActivityDataVisible_toFriendWithUUID_eventType_cloudKitGroup_completion___block_invoke;
  v26[3] = &unk_265218188;
  id v27 = v14;
  id v15 = v14;
  char v16 = (void *)MEMORY[0x24C557E50](v26);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __100__ASRelationshipManager_setActivityDataVisible_toFriendWithUUID_eventType_cloudKitGroup_completion___block_invoke_3;
  v20[3] = &unk_2652182C8;
  BOOL v25 = a3;
  v20[4] = self;
  id v21 = v12;
  unsigned __int16 v24 = a5;
  id v22 = v13;
  id v23 = v16;
  id v17 = v16;
  id v18 = v13;
  id v19 = v12;
  [(ASRelationshipManager *)self _performBlockWaitingForFriendshipBeganForFriendWithUUID:v19 block:v20];
}

void __100__ASRelationshipManager_setActivityDataVisible_toFriendWithUUID_eventType_cloudKitGroup_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __100__ASRelationshipManager_setActivityDataVisible_toFriendWithUUID_eventType_cloudKitGroup_completion___block_invoke_2;
  block[3] = &unk_265218160;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __100__ASRelationshipManager_setActivityDataVisible_toFriendWithUUID_eventType_cloudKitGroup_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __100__ASRelationshipManager_setActivityDataVisible_toFriendWithUUID_eventType_cloudKitGroup_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 80);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __100__ASRelationshipManager_setActivityDataVisible_toFriendWithUUID_eventType_cloudKitGroup_completion___block_invoke_4;
  v5[3] = &unk_2652182A0;
  char v11 = *(unsigned char *)(a1 + 66);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  id v8 = *(id *)(a1 + 48);
  __int16 v10 = *(_WORD *)(a1 + 64);
  id v9 = *(id *)(a1 + 56);
  [v2 performTransaction:v5];
}

void __100__ASRelationshipManager_setActivityDataVisible_toFriendWithUUID_eventType_cloudKitGroup_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  ASLoggingInitialize();
  uint64_t v4 = (os_log_t *)MEMORY[0x263F23AE0];
  id v5 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = *(unsigned __int8 *)(a1 + 66);
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 67109378;
    int v23 = v6;
    __int16 v24 = 2114;
    uint64_t v25 = v7;
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "RelationshipManager setting activity data visibility to %{BOOL}d for friend with UUID: %{public}@", buf, 0x12u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
  id v9 = [WeakRetained contactWithUUID:*(void *)(a1 + 32)];

  __int16 v10 = [*(id *)(a1 + 40) _relationshipFromContact:v9];
  char v11 = v10;
  if (v9 && *(unsigned __int8 *)(a1 + 66) != [v10 isActivityDataVisible])
  {
    id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __100__ASRelationshipManager_setActivityDataVisible_toFriendWithUUID_eventType_cloudKitGroup_completion___block_invoke_325;
    v14[3] = &unk_265218278;
    uint64_t v13 = *(void *)(a1 + 48);
    v14[4] = *(void *)(a1 + 40);
    id v15 = v11;
    id v16 = *(id *)(a1 + 48);
    char v21 = *(unsigned char *)(a1 + 66);
    __int16 v20 = *(_WORD *)(a1 + 64);
    id v17 = v9;
    id v18 = v3;
    id v19 = *(id *)(a1 + 56);
    [v12 fetchOrCreateActivityDataShareWithGroup:v13 activity:0 completion:v14];
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR)) {
      __100__ASRelationshipManager_setActivityDataVisible_toFriendWithUUID_eventType_cloudKitGroup_completion___block_invoke_4_cold_1();
    }
    v3[2](v3);
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __100__ASRelationshipManager_setActivityDataVisible_toFriendWithUUID_eventType_cloudKitGroup_completion___block_invoke_325(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  __int16 v10 = *(NSObject **)(v9 + 96);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __100__ASRelationshipManager_setActivityDataVisible_toFriendWithUUID_eventType_cloudKitGroup_completion___block_invoke_2_326;
  block[3] = &unk_265218250;
  char v23 = a2;
  id v14 = v7;
  uint64_t v15 = v9;
  id v16 = *(id *)(a1 + 40);
  id v17 = *(id *)(a1 + 48);
  id v18 = v8;
  char v24 = *(unsigned char *)(a1 + 82);
  __int16 v22 = *(_WORD *)(a1 + 80);
  id v19 = *(id *)(a1 + 56);
  id v20 = *(id *)(a1 + 64);
  id v21 = *(id *)(a1 + 72);
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v10, block);
}

void __100__ASRelationshipManager_setActivityDataVisible_toFriendWithUUID_eventType_cloudKitGroup_completion___block_invoke_2_326(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 98) && !*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
    id v3 = [*(id *)(a1 + 48) cloudKitAddress];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __100__ASRelationshipManager_setActivityDataVisible_toFriendWithUUID_eventType_cloudKitGroup_completion___block_invoke_3_327;
    v5[3] = &unk_265218228;
    void v5[4] = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 56);
    id v6 = *(id *)(a1 + 64);
    char v13 = *(unsigned char *)(a1 + 99);
    id v7 = *(id *)(a1 + 48);
    __int16 v12 = *(_WORD *)(a1 + 96);
    id v8 = *(id *)(a1 + 72);
    id v9 = *(id *)(a1 + 56);
    id v10 = *(id *)(a1 + 80);
    id v11 = *(id *)(a1 + 88);
    [WeakRetained fetchShareParticipantWithCloudKitAddress:v3 group:v4 completion:v5];
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR)) {
      __100__ASRelationshipManager_setActivityDataVisible_toFriendWithUUID_eventType_cloudKitGroup_completion___block_invoke_2_326_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
  }
}

void __100__ASRelationshipManager_setActivityDataVisible_toFriendWithUUID_eventType_cloudKitGroup_completion___block_invoke_3_327(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __100__ASRelationshipManager_setActivityDataVisible_toFriendWithUUID_eventType_cloudKitGroup_completion___block_invoke_4_328;
  v14[3] = &unk_265218200;
  char v25 = a2;
  id v15 = v7;
  id v16 = *(id *)(a1 + 40);
  id v17 = v8;
  char v26 = *(unsigned char *)(a1 + 90);
  id v10 = *(id *)(a1 + 48);
  __int16 v24 = *(_WORD *)(a1 + 88);
  uint64_t v11 = *(void *)(a1 + 32);
  id v18 = v10;
  uint64_t v19 = v11;
  id v20 = *(id *)(a1 + 56);
  id v21 = *(id *)(a1 + 64);
  id v22 = *(id *)(a1 + 72);
  id v23 = *(id *)(a1 + 80);
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v9, v14);
}

void __100__ASRelationshipManager_setActivityDataVisible_toFriendWithUUID_eventType_cloudKitGroup_completion___block_invoke_4_328(uint64_t a1)
{
  v21[1] = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 106) && !*(void *)(a1 + 32))
  {
    id v3 = [*(id *)(a1 + 40) participants];
    uint64_t v4 = (void *)MEMORY[0x263F08A98];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __100__ASRelationshipManager_setActivityDataVisible_toFriendWithUUID_eventType_cloudKitGroup_completion___block_invoke_5;
    v19[3] = &unk_2652181B0;
    id v20 = *(id *)(a1 + 48);
    id v5 = [v4 predicateWithBlock:v19];
    id v6 = [v3 filteredArrayUsingPredicate:v5];
    id v7 = [v6 firstObject];

    if (v7)
    {
      if (*(unsigned char *)(a1 + 107)) {
        uint64_t v8 = 2;
      }
      else {
        uint64_t v8 = 1;
      }
      [v7 setPermission:v8];
      [*(id *)(a1 + 56) insertEventWithType:*(unsigned __int16 *)(a1 + 104)];
      uint64_t v10 = *(void *)(a1 + 56);
      id v9 = *(void **)(a1 + 64);
      uint64_t v11 = *(void *)(a1 + 72);
      v21[0] = *(void *)(a1 + 40);
      id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __100__ASRelationshipManager_setActivityDataVisible_toFriendWithUUID_eventType_cloudKitGroup_completion___block_invoke_6;
      v16[3] = &unk_2652181D8;
      uint64_t v13 = *(void *)(a1 + 80);
      id v17 = *(id *)(a1 + 88);
      id v18 = *(id *)(a1 + 96);
      objc_msgSend(v9, "_queue_saveRelationship:contact:withExtraRecords:activity:cloudKitGroup:completion:", v10, v11, v12, 0, v13, v16);

      id v14 = v17;
    }
    else
    {
      ASLoggingInitialize();
      id v15 = (void *)*MEMORY[0x263F23AE0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR)) {
        __100__ASRelationshipManager_setActivityDataVisible_toFriendWithUUID_eventType_cloudKitGroup_completion___block_invoke_4_328_cold_2(a1, v15);
      }
      (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
      id v14 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.RelationshipManager" code:8 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
    }
  }
  else
  {
    ASLoggingInitialize();
    uint64_t v2 = (void *)*MEMORY[0x263F23AE0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR)) {
      __100__ASRelationshipManager_setActivityDataVisible_toFriendWithUUID_eventType_cloudKitGroup_completion___block_invoke_4_328_cold_1(a1, v2);
    }
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
  }
}

uint64_t __100__ASRelationshipManager_setActivityDataVisible_toFriendWithUUID_eventType_cloudKitGroup_completion___block_invoke_5(uint64_t a1, void *a2)
{
  return ASCloudKitShareParticipantsAreEqual(*(void **)(a1 + 32), a2);
}

void __100__ASRelationshipManager_setActivityDataVisible_toFriendWithUUID_eventType_cloudKitGroup_completion___block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void (**)(uint64_t))(v6 + 16);
  id v8 = a4;
  id v9 = a3;
  v7(v6);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setMuteEnabled:(BOOL)a3 forFriendWithUUID:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v6) {
    uint64_t v10 = 8;
  }
  else {
    uint64_t v10 = 9;
  }
  uint64_t v11 = [(ASRelationshipManager *)self insertPlaceholderRelationshipEvent:v10 friendUUID:v8];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __69__ASRelationshipManager_setMuteEnabled_forFriendWithUUID_completion___block_invoke;
  v15[3] = &unk_2652182C8;
  BOOL v20 = v6;
  v15[4] = self;
  id v16 = v8;
  __int16 v19 = v10;
  id v17 = v11;
  id v18 = v9;
  id v12 = v9;
  id v13 = v11;
  id v14 = v8;
  [(ASRelationshipManager *)self _performBlockWaitingForFriendshipBeganForFriendWithUUID:v14 block:v15];
}

void __69__ASRelationshipManager_setMuteEnabled_forFriendWithUUID_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 80);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __69__ASRelationshipManager_setMuteEnabled_forFriendWithUUID_completion___block_invoke_2;
  v5[3] = &unk_2652182A0;
  char v11 = *(unsigned char *)(a1 + 66);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  __int16 v10 = *(_WORD *)(a1 + 64);
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  [v2 performTransaction:v5];
}

void __69__ASRelationshipManager_setMuteEnabled_forFriendWithUUID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  ASLoggingInitialize();
  uint64_t v4 = (os_log_t *)MEMORY[0x263F23AE0];
  id v5 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = *(unsigned __int8 *)(a1 + 66);
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 67109378;
    int v23 = v6;
    __int16 v24 = 2114;
    uint64_t v25 = v7;
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "RelationshipManager setting muting to %{BOOL}d for friend with UUID: %{public}@", buf, 0x12u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
  id v9 = [WeakRetained contactWithUUID:*(void *)(a1 + 32)];

  __int16 v10 = [*(id *)(a1 + 40) _relationshipFromContact:v9];
  char v11 = v10;
  if (v9)
  {
    if (*(unsigned __int8 *)(a1 + 66) != [v10 isMuteEnabled])
    {
      [v11 insertEventWithType:*(unsigned __int16 *)(a1 + 64)];
      id v15 = *(void **)(a1 + 40);
      id v16 = ASCloudKitGroupUserActionExplicit();
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __69__ASRelationshipManager_setMuteEnabled_forFriendWithUUID_completion___block_invoke_337;
      v18[3] = &unk_2652182F0;
      id v17 = *(void **)(a1 + 48);
      void v18[4] = *(void *)(a1 + 40);
      id v19 = v17;
      BOOL v20 = v3;
      id v21 = *(id *)(a1 + 56);
      objc_msgSend(v15, "_queue_saveRelationship:contact:activity:cloudKitGroup:completion:", v11, v9, 0, v16, v18);

      goto LABEL_13;
    }
    ASLoggingInitialize();
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR)) {
      __69__ASRelationshipManager_setMuteEnabled_forFriendWithUUID_completion___block_invoke_2_cold_2();
    }
    uint64_t v12 = 5;
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR)) {
      __69__ASRelationshipManager_setMuteEnabled_forFriendWithUUID_completion___block_invoke_2_cold_1();
    }
    uint64_t v12 = 3;
  }
  id v13 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.RelationshipManager" code:v12 userInfo:0];
  id v14 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
  [v14 removePlaceholderContactWithToken:*(void *)(a1 + 48)];

  v3[2](v3);
  _NotifyOnMainQueue(0, v13, *(void **)(a1 + 56));

LABEL_13:
}

void __69__ASRelationshipManager_setMuteEnabled_forFriendWithUUID_completion___block_invoke_337(uint64_t a1, char a2, void *a3)
{
  id v5 = (id *)(*(void *)(a1 + 32) + 32);
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained removePlaceholderContactWithToken:*(void *)(a1 + 40)];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  _NotifyOnMainQueue(a2, v7, *(void **)(a1 + 56));
}

- (void)removeFriendWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__ASRelationshipManager_removeFriendWithUUID_completion___block_invoke;
  block[3] = &unk_265215FD0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serialQueue, block);
}

void __57__ASRelationshipManager_removeFriendWithUUID_completion___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  ASCloudKitGroupUserActionExplicit();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_queue_removeFriendWithUUID:eventType:activity:cloudKitGroup:completion:", v3, 4, 0, v4, a1[6]);
}

- (void)removeLegacyFriendWithUUID:(id)a3 event:(unsigned __int16)a4 cloudKitGroup:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__ASRelationshipManager_removeLegacyFriendWithUUID_event_cloudKitGroup_completion___block_invoke;
  block[3] = &unk_265218318;
  void block[4] = self;
  id v18 = v10;
  unsigned __int16 v21 = a4;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(serialQueue, block);
}

uint64_t __83__ASRelationshipManager_removeLegacyFriendWithUUID_event_cloudKitGroup_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeLegacyFriendWithUUID:eventType:activity:cloudKitGroup:completion:", *(void *)(a1 + 40), *(unsigned __int16 *)(a1 + 64), 0, *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)updateRelationshipWithCompetitionEvent:(unsigned __int16)a3 friendUUID:(id)a4 activity:(id)a5 cloudKitGroup:(id)a6 completion:(id)a7
{
  uint64_t v10 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactsManager);
  id v17 = [WeakRetained contactWithUUID:v12];

  if ([v17 cloudType] == 1)
  {
    id v18 = objc_loadWeakRetained((id *)&self->_secureCloudDelegate);
    [v18 relationshipManager:self updateActiveFriendWithUUID:v12 eventType:v10 cloudKitGroup:v14 completion:v15];
  }
  else
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __109__ASRelationshipManager_updateRelationshipWithCompetitionEvent_friendUUID_activity_cloudKitGroup_completion___block_invoke;
    v19[3] = &unk_265218368;
    void v19[4] = self;
    id v20 = v12;
    id v23 = v15;
    __int16 v24 = v10;
    id v21 = v13;
    id v22 = v14;
    [(ASRelationshipManager *)self _performBlockWaitingForFriendshipBeganForFriendWithUUID:v20 block:v19];
  }
}

void __109__ASRelationshipManager_updateRelationshipWithCompetitionEvent_friendUUID_activity_cloudKitGroup_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 80);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __109__ASRelationshipManager_updateRelationshipWithCompetitionEvent_friendUUID_activity_cloudKitGroup_completion___block_invoke_2;
  v4[3] = &unk_265218340;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 64);
  __int16 v9 = *(_WORD *)(a1 + 72);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v3 performTransaction:v4];
}

void __109__ASRelationshipManager_updateRelationshipWithCompetitionEvent_friendUUID_activity_cloudKitGroup_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  id v5 = [WeakRetained contactWithUUID:*(void *)(a1 + 40)];

  id v6 = [*(id *)(a1 + 32) _relationshipFromContact:v5];
  if (([v6 isFriendshipActive] & 1) == 0)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR)) {
      __109__ASRelationshipManager_updateRelationshipWithCompetitionEvent_friendUUID_activity_cloudKitGroup_completion___block_invoke_2_cold_1();
    }
    v3[2](v3);
    id v7 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.RelationshipManager" code:9 userInfo:0];
    _NotifyOnMainQueue(0, v7, *(void **)(a1 + 64));
  }
  [v6 insertEventWithType:*(unsigned __int16 *)(a1 + 72)];
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __109__ASRelationshipManager_updateRelationshipWithCompetitionEvent_friendUUID_activity_cloudKitGroup_completion___block_invoke_338;
  v12[3] = &unk_2652181D8;
  id v13 = v3;
  id v14 = *(id *)(a1 + 64);
  id v11 = v3;
  objc_msgSend(v8, "_queue_saveRelationship:contact:activity:cloudKitGroup:completion:", v6, v5, v9, v10, v12);
}

void __109__ASRelationshipManager_updateRelationshipWithCompetitionEvent_friendUUID_activity_cloudKitGroup_completion___block_invoke_338(uint64_t a1, char a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void (**)(uint64_t))(v5 + 16);
  id v7 = a3;
  v6(v5);
  _NotifyOnMainQueue(a2, v7, *(void **)(a1 + 40));
}

- (void)updateRelationshipsForCurrentFeatureSupportWithActivity:(id)a3 cloudKitGroup:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  transactionQueue = self->_transactionQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __106__ASRelationshipManager_updateRelationshipsForCurrentFeatureSupportWithActivity_cloudKitGroup_completion___block_invoke;
  v15[3] = &unk_2652183B0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(ASAsyncTransactionQueue *)transactionQueue performTransaction:v15];
}

void __106__ASRelationshipManager_updateRelationshipsForCurrentFeatureSupportWithActivity_cloudKitGroup_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  long long v28 = a2;
  ASLoggingInitialize();
  uint64_t v3 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "RelationshipManager checking for contacts that require a supported feature update", buf, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  uint64_t v5 = [WeakRetained contacts];

  id v6 = [MEMORY[0x263EFFA08] set];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v13 = [*(id *)(a1 + 32) _relationshipFromContact:v12];
        if (ASRelationshipNeedsSupportedFeaturesUpdate())
        {
          ASLoggingInitialize();
          id v14 = (void *)*MEMORY[0x263F23AE0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
          {
            id v15 = v14;
            id v16 = [v13 UUID];
            id v17 = [v12 displayName];
            *(_DWORD *)buf = 138543618;
            v37 = v16;
            __int16 v38 = 2112;
            v39 = v17;
            _os_log_impl(&dword_2474C9000, v15, OS_LOG_TYPE_DEFAULT, "Relationship requires supported feature update: %{public}@ - %@", buf, 0x16u);
          }
          ASUpdateSupportedFeaturesForRelationship();
          uint64_t v18 = [v6 setByAddingObject:v13];

          id v6 = (void *)v18;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v9);
  }

  uint64_t v19 = [v6 count];
  ASLoggingInitialize();
  id v20 = *MEMORY[0x263F23AE0];
  BOOL v21 = os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v21)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v20, OS_LOG_TYPE_DEFAULT, "RelationshipManager serializing relationship records and saving to CloudKit", buf, 2u);
    }
    id v22 = [v6 allObjects];
    id v23 = objc_msgSend(v22, "hk_map:", &__block_literal_global_342_0);

    id v24 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    uint64_t v25 = *(void *)(a1 + 40);
    uint64_t v26 = *(void *)(a1 + 48);
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __106__ASRelationshipManager_updateRelationshipsForCurrentFeatureSupportWithActivity_cloudKitGroup_completion___block_invoke_2;
    v29[3] = &unk_265217B98;
    v29[4] = *(void *)(a1 + 32);
    id v30 = *(id *)(a1 + 56);
    id v27 = v28;
    long long v31 = v28;
    [v24 saveRecordsIntoPrivateDatabase:v23 priority:2 activity:v25 group:v26 completion:v29];
  }
  else
  {
    if (v21)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v20, OS_LOG_TYPE_DEFAULT, "RelationshipManager didn't find any relationships requiring a supported feature update", buf, 2u);
    }
    _NotifyOnMainQueue(1, 0, *(void **)(a1 + 56));
    id v27 = v28;
    v28[2](v28);
  }
}

id __106__ASRelationshipManager_updateRelationshipsForCurrentFeatureSupportWithActivity_cloudKitGroup_completion___block_invoke_339(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[ASCloudKitManager relationshipZone];
  id v4 = [v2 recordWithZoneID:v3 recordEncryptionType:0];

  return v4;
}

void __106__ASRelationshipManager_updateRelationshipsForCurrentFeatureSupportWithActivity_cloudKitGroup_completion___block_invoke_2(uint64_t a1, int a2, void *a3, uint64_t a4)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (!v7 && a2)
  {
    char v24 = a2;
    uint64_t v8 = (void *)MEMORY[0x263F23BF0];
    uint64_t v9 = [MEMORY[0x263EFFA08] setWithArray:a4];
    uint64_t v10 = [v8 relationshipsWithRelationshipAndEventRecords:v9];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v26;
      id v15 = (os_log_t *)MEMORY[0x263F23AE0];
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v11);
          }
          id v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
          uint64_t v19 = [v17 UUID];
          id v20 = [WeakRetained contactWithUUID:v19];

          if (v20)
          {
            BOOL v21 = [v20 relationshipStorage];
            [v21 setLegacyRelationship:v17];
            [v20 setRelationshipStorage:v21];
            id v22 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
            [v22 saveContact:v20];
          }
          else
          {
            ASLoggingInitialize();
            os_log_t v23 = *v15;
            if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR)) {
              __106__ASRelationshipManager_updateRelationshipsForCurrentFeatureSupportWithActivity_cloudKitGroup_completion___block_invoke_2_cold_1(&v29, v23, v17, &v30);
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v13);
    }

    id v7 = 0;
    LOBYTE(a2) = v24;
  }
  _NotifyOnMainQueue(a2, v7, *(void **)(a1 + 40));
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)sendInviteToPersonWithDestination:(id)a3 callerID:(id)a4 serviceIdentifier:(id)a5 completion:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  ASLoggingInitialize();
  uint64_t v14 = (os_log_t *)MEMORY[0x263F23AE0];
  id v15 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v26 = v10;
    __int16 v27 = 2114;
    id v28 = v12;
    _os_log_impl(&dword_2474C9000, v15, OS_LOG_TYPE_DEFAULT, "RelationshipManager starting invite flow for person with destination: %@, serviceIdentifier: %{public}@", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gatewayManager);
  int v17 = [WeakRetained hasReachedMaximumNumberOfFriends];

  if (v17)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR)) {
      -[ASRelationshipManager sendInviteToPersonWithDestination:callerID:serviceIdentifier:completion:]();
    }
    uint64_t v18 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.RelationshipManager" code:6 userInfo:0];
    _NotifyOnMainQueue(0, v18, v13);
  }
  else
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __97__ASRelationshipManager_sendInviteToPersonWithDestination_callerID_serviceIdentifier_completion___block_invoke;
    block[3] = &unk_2652184F0;
    void block[4] = self;
    id v21 = v10;
    id v22 = v12;
    id v24 = v13;
    id v23 = v11;
    dispatch_async(serialQueue, block);
  }
}

void __97__ASRelationshipManager_sendInviteToPersonWithDestination_callerID_serviceIdentifier_completion___block_invoke(id *a1)
{
  v27[1] = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  id v2 = (os_log_t *)MEMORY[0x263F23AE0];
  uint64_t v3 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "RelationshipManager looking up placeholder contact", buf, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)a1[4] + 4);
  v27[0] = a1[5];
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
  id v6 = [WeakRetained contactWithDestinations:v5];

  if (!v6)
  {
    ASLoggingInitialize();
    id v7 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v7, OS_LOG_TYPE_DEFAULT, "RelationshipManager didn't find existing contact, creating new placeholder", buf, 2u);
    }
    id v8 = objc_loadWeakRetained((id *)a1[4] + 4);
    id v26 = a1[5];
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
    id v6 = [v8 createContactWithDestinations:v9];
  }
  [a1[4] _insertInviteForContact:v6 destination:a1[5] serviceIdentifier:a1[6]];
  id v10 = objc_loadWeakRetained((id *)a1[4] + 4);
  id v11 = [v10 savePlaceholderContact:v6];

  id v12 = ASCloudKitGroupSharingSetup();
  id v13 = objc_loadWeakRetained((id *)a1[4] + 3);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __97__ASRelationshipManager_sendInviteToPersonWithDestination_callerID_serviceIdentifier_completion___block_invoke_346;
  v17[3] = &unk_2652184C8;
  v17[4] = a1[4];
  id v18 = v12;
  id v19 = v11;
  id v24 = a1[8];
  id v20 = a1[5];
  id v21 = v6;
  id v22 = a1[6];
  id v23 = a1[7];
  id v14 = v6;
  id v15 = v11;
  id v16 = v12;
  [v13 fetchCloudKitAddressWithCompletion:v17];
}

void __97__ASRelationshipManager_sendInviteToPersonWithDestination_callerID_serviceIdentifier_completion___block_invoke_346(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __97__ASRelationshipManager_sendInviteToPersonWithDestination_callerID_serviceIdentifier_completion___block_invoke_2;
  v7[3] = &unk_2652184A0;
  uint64_t v5 = *(void *)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 88);
  id v9 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 64);
  id v11 = *(id *)(a1 + 72);
  id v12 = v3;
  id v13 = *(id *)(a1 + 80);
  id v14 = *(id *)(a1 + 40);
  id v6 = v3;
  [WeakRetained fetchAllChangesWithPriority:2 activity:0 group:v5 completion:v7];
}

void __97__ASRelationshipManager_sendInviteToPersonWithDestination_callerID_serviceIdentifier_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v5 || (a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v6 + 32));
    [WeakRetained removePlaceholderContactWithToken:*(void *)(a1 + 40)];

    _NotifyOnMainQueue(a2, v5, *(void **)(a1 + 96));
  }
  else
  {
    id v7 = *(void **)(v6 + 80);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __97__ASRelationshipManager_sendInviteToPersonWithDestination_callerID_serviceIdentifier_completion___block_invoke_3;
    v9[3] = &unk_265218478;
    v9[4] = v6;
    id v10 = *(id *)(a1 + 48);
    id v11 = *(id *)(a1 + 56);
    id v12 = *(id *)(a1 + 64);
    id v13 = *(id *)(a1 + 40);
    id v17 = *(id *)(a1 + 96);
    id v14 = *(id *)(a1 + 72);
    id v15 = *(id *)(a1 + 80);
    id v16 = *(id *)(a1 + 88);
    [v7 performTransaction:v9];
  }
}

void __97__ASRelationshipManager_sendInviteToPersonWithDestination_callerID_serviceIdentifier_completion___block_invoke_3(uint64_t a1, void *a2)
{
  v35[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  ASLoggingInitialize();
  id v4 = (os_log_t *)MEMORY[0x263F23AE0];
  id v5 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "RelationshipManager fetch complete, looking up contact again", buf, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  v35[0] = *(void *)(a1 + 40);
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:1];
  id v8 = [WeakRetained contactWithDestinations:v7];

  ASLoggingInitialize();
  id v9 = *v4;
  BOOL v10 = os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "RelationshipManager contact already exists, just update it with the invite data", buf, 2u);
    }
    [*(id *)(a1 + 32) _insertInviteForContact:v8 destination:*(void *)(a1 + 40) serviceIdentifier:*(void *)(a1 + 56)];
  }
  else
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "RelationshipManager didn't find existing contact, copying the placeholder to save so the UUIDs match", buf, 2u);
    }
    id v8 = (void *)[*(id *)(a1 + 48) copy];
  }
  id v11 = [*(id *)(a1 + 32) _remoteRelationshipFromContact:v8];
  if ([v11 isFriendshipActive] && (objc_msgSend(v11, "isActivityDataVisible") & 1) == 0)
  {
    ASLoggingInitialize();
    id v22 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v22, OS_LOG_TYPE_DEFAULT, "RelationshipManager friendship already active, but activity data is not visible", buf, 2u);
    }
    ASLoggingInitialize();
    id v23 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v23, OS_LOG_TYPE_DEFAULT, "RelationshipManager not sending invite to avoid triggering an unhide on the remote device", buf, 2u);
    }
    id v24 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    [v24 removePlaceholderContactWithToken:*(void *)(a1 + 64)];

    id v18 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.RelationshipManager" code:7 userInfo:0];
    _NotifyOnMainQueue(0, v18, *(void **)(a1 + 96));
    v3[2](v3);
  }
  else
  {
    id v12 = objc_alloc_init(MEMORY[0x263F23B80]);
    id v13 = [*(id *)(a1 + 32) _relationshipFromContact:v8];
    id v14 = [v13 outgoingHandshakeToken];
    [v12 setHandshakeToken:v14];

    [v12 setInviterCloudKitAddress:*(void *)(a1 + 72)];
    [v12 setInviterCallerID:*(void *)(a1 + 80)];
    id v15 = _DeviceBuildNumber();
    [v12 setInviterBuildNumber:v15];

    id v16 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
    objc_msgSend(v12, "setInviterVersion:", objc_msgSend(v16, "inviteCompatibilityVersion"));

    id v17 = [*(id *)(a1 + 32) _currentActivityDataPreview];
    [v12 setActivityDataPreview:v17];

    id v18 = [*(id *)(a1 + 32) _relationshipFromContact:v8];
    id v19 = *(void **)(a1 + 32);
    uint64_t v20 = *(void *)(a1 + 88);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __97__ASRelationshipManager_sendInviteToPersonWithDestination_callerID_serviceIdentifier_completion___block_invoke_348;
    v25[3] = &unk_265218450;
    v25[4] = v19;
    id v26 = *(id *)(a1 + 64);
    uint64_t v32 = v3;
    id v33 = *(id *)(a1 + 96);
    id v27 = v12;
    id v28 = *(id *)(a1 + 40);
    id v29 = *(id *)(a1 + 56);
    id v30 = v8;
    id v31 = *(id *)(a1 + 88);
    id v21 = v12;
    objc_msgSend(v19, "_queue_saveRelationshipAndFetchOrCreateShares:contact:cloudKitGroup:completion:", v18, v30, v20, v25);
  }
}

void __97__ASRelationshipManager_sendInviteToPersonWithDestination_callerID_serviceIdentifier_completion___block_invoke_348(uint64_t a1, char a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  [WeakRetained removePlaceholderContactWithToken:*(void *)(a1 + 40)];

  if (v9 || (a2 & 1) == 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    _NotifyOnMainQueue(a2, v9, *(void **)(a1 + 96));
  }
  else
  {
    ASLoggingInitialize();
    id v12 = (void *)*MEMORY[0x263F23AE0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
    {
      id v13 = *(void **)(a1 + 48);
      id v14 = v12;
      id v15 = [v13 handshakeToken];
      uint64_t v16 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      id v27 = v15;
      __int16 v28 = 2112;
      uint64_t v29 = v16;
      _os_log_impl(&dword_2474C9000, v14, OS_LOG_TYPE_DEFAULT, "RelationshipManager sending invite with token %@ to destination: %@", buf, 0x16u);
    }
    id v17 = [*(id *)(*(void *)(a1 + 32) + 160) objectForKeyedSubscript:*(void *)(a1 + 64)];
    uint64_t v18 = *(void *)(a1 + 48);
    id v19 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 56)];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __97__ASRelationshipManager_sendInviteToPersonWithDestination_callerID_serviceIdentifier_completion___block_invoke_349;
    v20[3] = &unk_265218428;
    v20[4] = *(void *)(a1 + 32);
    id v21 = v10;
    id v22 = *(id *)(a1 + 72);
    id v23 = *(id *)(a1 + 80);
    id v24 = *(id *)(a1 + 88);
    id v25 = *(id *)(a1 + 96);
    [v17 sendInviteRequest:v18 toDestinations:v19 completion:v20];
  }
}

void __97__ASRelationshipManager_sendInviteToPersonWithDestination_callerID_serviceIdentifier_completion___block_invoke_349(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 96);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __97__ASRelationshipManager_sendInviteToPersonWithDestination_callerID_serviceIdentifier_completion___block_invoke_2_350;
    block[3] = &unk_265218400;
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 32);
    id v10 = v7;
    uint64_t v11 = v8;
    id v12 = *(id *)(a1 + 48);
    id v13 = *(id *)(a1 + 56);
    id v15 = *(id *)(a1 + 64);
    id v14 = v5;
    id v16 = *(id *)(a1 + 72);
    dispatch_async(v6, block);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    _NotifyOnMainQueue(1, 0, *(void **)(a1 + 72));
  }
}

void __97__ASRelationshipManager_sendInviteToPersonWithDestination_callerID_serviceIdentifier_completion___block_invoke_2_350(uint64_t a1)
{
  [*(id *)(a1 + 32) insertEventWithType:3];
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __97__ASRelationshipManager_sendInviteToPersonWithDestination_callerID_serviceIdentifier_completion___block_invoke_3_351;
  v6[3] = &unk_2652183D8;
  id v8 = *(id *)(a1 + 72);
  id v7 = *(id *)(a1 + 64);
  id v9 = *(id *)(a1 + 80);
  objc_msgSend(v2, "_queue_saveRelationship:contact:activity:cloudKitGroup:completion:", v3, v4, 0, v5, v6);
}

void __97__ASRelationshipManager_sendInviteToPersonWithDestination_callerID_serviceIdentifier_completion___block_invoke_3_351(void *a1)
{
  (*(void (**)(void))(a1[5] + 16))();
  id v2 = (void *)a1[4];
  uint64_t v3 = (void *)a1[6];
  _NotifyOnMainQueue(0, v2, v3);
}

- (void)acceptInviteRequestFromFriendWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gatewayManager);
  int v9 = [WeakRetained hasReachedMaximumNumberOfFriends];

  if (v9)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR)) {
      -[ASRelationshipManager sendInviteToPersonWithDestination:callerID:serviceIdentifier:completion:]();
    }
    id v10 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.RelationshipManager" code:6 userInfo:0];
    _NotifyOnMainQueue(0, v10, v7);
  }
  else
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __74__ASRelationshipManager_acceptInviteRequestFromFriendWithUUID_completion___block_invoke;
    block[3] = &unk_265215FD0;
    void block[4] = self;
    id v13 = v6;
    id v14 = v7;
    dispatch_async(serialQueue, block);
  }
}

void __74__ASRelationshipManager_acceptInviteRequestFromFriendWithUUID_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_insertPlaceholderFriendshipDidBeginForContactWithUUID:", *(void *)(a1 + 40));
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  [WeakRetained updateFitnessAppBadgeCount];

  id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __74__ASRelationshipManager_acceptInviteRequestFromFriendWithUUID_completion___block_invoke_2;
  v5[3] = &unk_2652185E0;
  uint64_t v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 fetchCloudKitAddressWithCompletion:v5];
}

void __74__ASRelationshipManager_acceptInviteRequestFromFriendWithUUID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 80);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74__ASRelationshipManager_acceptInviteRequestFromFriendWithUUID_completion___block_invoke_3;
  v9[3] = &unk_2652185B8;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v5;
  uint64_t v11 = v6;
  id v7 = *(id *)(a1 + 48);
  id v12 = v3;
  id v13 = v7;
  id v8 = v3;
  [v4 performTransaction:v9];
}

void __74__ASRelationshipManager_acceptInviteRequestFromFriendWithUUID_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = a2;
  ASLoggingInitialize();
  uint64_t v4 = (os_log_t *)MEMORY[0x263F23AE0];
  id v5 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v43 = v6;
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "RelationshipManager preparing to accept invite from friend with UUID: %{public}@", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
  id v8 = [WeakRetained contactWithUUID:*(void *)(a1 + 32)];

  if (v8)
  {
    int v9 = [*(id *)(a1 + 40) _relationshipFromContact:v8];
    id v10 = [v9 incomingHandshakeToken];

    if (v10)
    {
      uint64_t v11 = [v9 cloudKitAddress];

      if (v11) {
        goto LABEL_15;
      }
      uint64_t v12 = 0;
    }
    else
    {
      uint64_t v12 = 1;
    }
    uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.RelationshipManager" code:v12 userInfo:0];
    if (v13)
    {
      id v14 = (void *)v13;
      ASLoggingInitialize();
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR)) {
        __74__ASRelationshipManager_acceptInviteRequestFromFriendWithUUID_completion___block_invoke_3_cold_2();
      }
      _NotifyOnMainQueue(0, v14, *(void **)(a1 + 56));
      objc_msgSend(*(id *)(a1 + 40), "_queue_removePlaceholderRelationshipBeganForContactWithUUID:success:", *(void *)(a1 + 32), 0);
      v3[2](v3);
      goto LABEL_16;
    }
LABEL_15:
    id v15 = objc_alloc_init(MEMORY[0x263F23B88]);
    id v16 = [v9 incomingHandshakeToken];
    [v15 setHandshakeToken:v16];

    [v15 setResponseCode:1];
    [v15 setInviteeCloudKitAddress:*(void *)(a1 + 48)];
    id v17 = _DeviceBuildNumber();
    [v15 setInviteeBuildNumber:v17];

    id v18 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 56));
    objc_msgSend(v15, "setInviteeVersion:", objc_msgSend(v18, "inviteCompatibilityVersion"));

    id v19 = [*(id *)(a1 + 40) _currentActivityDataPreview];
    [v15 setActivityDataPreview:v19];

    uint64_t v20 = (void *)MEMORY[0x263EFFA08];
    id v21 = [v9 preferredReachableAddress];
    [v20 setWithObject:v21];
    v22 = uint64_t v30 = v3;

    id v14 = [v9 preferredReachableService];
    id v23 = [*(id *)(*(void *)(a1 + 40) + 160) objectForKeyedSubscript:v14];
    [v9 insertEventWithType:2];
    id v24 = ASCloudKitGroupSharingSetup();
    id v25 = *(void **)(a1 + 40);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __74__ASRelationshipManager_acceptInviteRequestFromFriendWithUUID_completion___block_invoke_355;
    v31[3] = &unk_265218590;
    v31[4] = v25;
    id v32 = *(id *)(a1 + 32);
    id v39 = v30;
    id v40 = *(id *)(a1 + 56);
    id v33 = v9;
    id v34 = v24;
    id v35 = v15;
    id v36 = v22;
    uint64_t v41 = 1;
    id v37 = v23;
    id v38 = v8;
    id v26 = v23;
    id v27 = v22;
    id v28 = v15;
    id v29 = v24;
    objc_msgSend(v25, "_queue_fetchSharesForRelationship:cloudKitGroup:completion:", v33, v29, v31);

    id v3 = (void (**)(void))v30;
LABEL_16:

    goto LABEL_17;
  }
  ASLoggingInitialize();
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR)) {
    __74__ASRelationshipManager_acceptInviteRequestFromFriendWithUUID_completion___block_invoke_3_cold_1();
  }
  int v9 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.RelationshipManager" code:3 userInfo:0];
  _NotifyOnMainQueue(0, v9, *(void **)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "_queue_removePlaceholderRelationshipBeganForContactWithUUID:success:", *(void *)(a1 + 32), 0);
  v3[2](v3);
LABEL_17:
}

void __74__ASRelationshipManager_acceptInviteRequestFromFriendWithUUID_completion___block_invoke_355(uint64_t a1, char a2, void *a3, void *a4, void *a5)
{
  v32[2] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = *(void **)(a1 + 32);
  if (v9 || (a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_removePlaceholderRelationshipBeganForContactWithUUID:success:", *(void *)(a1 + 40), 0);
    (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
    _NotifyOnMainQueue(a2, v9, *(void **)(a1 + 104));
  }
  else
  {
    uint64_t v13 = [*(id *)(a1 + 48) cloudKitAddress];
    v32[0] = v10;
    v32[1] = v11;
    id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
    uint64_t v15 = *(void *)(a1 + 56);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __74__ASRelationshipManager_acceptInviteRequestFromFriendWithUUID_completion___block_invoke_2_356;
    v19[3] = &unk_265218568;
    id v16 = *(void **)(a1 + 40);
    void v19[4] = *(void *)(a1 + 32);
    id v20 = v16;
    id v29 = *(id *)(a1 + 96);
    id v30 = *(id *)(a1 + 104);
    id v21 = v10;
    id v22 = v11;
    id v17 = *(id *)(a1 + 64);
    uint64_t v18 = *(void *)(a1 + 112);
    id v23 = v17;
    uint64_t v31 = v18;
    id v24 = *(id *)(a1 + 72);
    id v25 = *(id *)(a1 + 80);
    id v26 = *(id *)(a1 + 88);
    id v27 = *(id *)(a1 + 48);
    id v28 = *(id *)(a1 + 56);
    objc_msgSend(v12, "_queue_addPersonWithCloudKitAddress:toShares:cloudKitGroup:completion:", v13, v14, v15, v19);
  }
}

void __74__ASRelationshipManager_acceptInviteRequestFromFriendWithUUID_completion___block_invoke_2_356(uint64_t a1, char a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_removePlaceholderRelationshipBeganForContactWithUUID:success:", *(void *)(a1 + 40), 0);
    (*(void (**)(void))(*(void *)(a1 + 112) + 16))();
    _NotifyOnMainQueue(a2, v5, *(void **)(a1 + 120));
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x263F23BA0]);
    id v7 = [*(id *)(a1 + 48) URL];
    id v8 = [v7 absoluteString];
    [v6 setActivityShareURL:v8];

    id v9 = [*(id *)(a1 + 56) URL];
    id v10 = [v9 absoluteString];
    [v6 setRelationshipShareURL:v10];

    [*(id *)(a1 + 64) setInviteeShareLocations:v6];
    ASLoggingInitialize();
    id v11 = (void *)*MEMORY[0x263F23AE0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 128);
      uint64_t v13 = *(void **)(a1 + 64);
      id v14 = v11;
      uint64_t v15 = [v13 handshakeToken];
      uint64_t v16 = *(void *)(a1 + 72);
      *(_DWORD *)buf = 134218498;
      uint64_t v29 = v12;
      __int16 v30 = 2112;
      uint64_t v31 = v15;
      __int16 v32 = 2112;
      uint64_t v33 = v16;
      _os_log_impl(&dword_2474C9000, v14, OS_LOG_TYPE_DEFAULT, "RelationshipManager sending invite response %ld with token %@ to %@", buf, 0x20u);
    }
    uint64_t v18 = *(void *)(a1 + 72);
    id v17 = *(void **)(a1 + 80);
    uint64_t v19 = *(void *)(a1 + 64);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    void v21[2] = __74__ASRelationshipManager_acceptInviteRequestFromFriendWithUUID_completion___block_invoke_358;
    v21[3] = &unk_265218540;
    id v20 = *(void **)(a1 + 40);
    v21[4] = *(void *)(a1 + 32);
    id v22 = v20;
    id v26 = *(id *)(a1 + 112);
    id v27 = *(id *)(a1 + 120);
    id v23 = *(id *)(a1 + 88);
    id v24 = *(id *)(a1 + 96);
    id v25 = *(id *)(a1 + 104);
    [v17 sendInviteResponse:v19 toDestinations:v18 fromAddress:0 completion:v21];
  }
}

void __74__ASRelationshipManager_acceptInviteRequestFromFriendWithUUID_completion___block_invoke_358(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 96);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__ASRelationshipManager_acceptInviteRequestFromFriendWithUUID_completion___block_invoke_2_359;
  block[3] = &unk_265218518;
  char v18 = a2;
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = *(id *)(a1 + 40);
  id v16 = *(id *)(a1 + 72);
  id v17 = *(id *)(a1 + 80);
  id v13 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  id v15 = *(id *)(a1 + 64);
  id v8 = v5;
  dispatch_async(v7, block);
}

void __74__ASRelationshipManager_acceptInviteRequestFromFriendWithUUID_completion___block_invoke_2_359(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 96) && !*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
    [WeakRetained withdrawInviteNotificationsForContact:*(void *)(a1 + 56)];

    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 64);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __74__ASRelationshipManager_acceptInviteRequestFromFriendWithUUID_completion___block_invoke_3_360;
    v10[3] = &unk_2652181D8;
    uint64_t v9 = *(void *)(a1 + 72);
    id v11 = *(id *)(a1 + 80);
    id v12 = *(id *)(a1 + 88);
    objc_msgSend(v6, "_queue_saveRelationship:contact:activity:cloudKitGroup:completion:", v7, v8, 0, v9, v10);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_queue_removePlaceholderRelationshipBeganForContactWithUUID:success:", *(void *)(a1 + 48), 0);
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    char v2 = *(unsigned char *)(a1 + 96);
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void **)(a1 + 88);
    _NotifyOnMainQueue(v2, v3, v4);
  }
}

void __74__ASRelationshipManager_acceptInviteRequestFromFriendWithUUID_completion___block_invoke_3_360(uint64_t a1, char a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void (**)(uint64_t))(v5 + 16);
  id v7 = a3;
  v6(v5);
  _NotifyOnMainQueue(a2, v7, *(void **)(a1 + 40));
}

- (void)sendWithdrawInviteRequestToFriendWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  ASLoggingInitialize();
  uint64_t v8 = (os_log_t *)MEMORY[0x263F23AE0];
  uint64_t v9 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = v6;
    _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "RelationshipManager attempting to withdraw invite request to friend with UUID: %{public}@", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactsManager);
  id v11 = [WeakRetained contactWithUUID:v6];

  if (v11)
  {
    id v12 = [(ASRelationshipManager *)self _relationshipFromContact:v11];
    if ([v12 isFriendshipActive])
    {
      ASLoggingInitialize();
      id v13 = *v8;
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
LABEL_14:
        serialQueue = self->_serialQueue;
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __78__ASRelationshipManager_sendWithdrawInviteRequestToFriendWithUUID_completion___block_invoke;
        v17[3] = &unk_265218630;
        v17[4] = self;
        id v18 = v6;
        id v19 = v12;
        id v20 = v7;
        id v15 = v12;
        dispatch_async(serialQueue, v17);

        goto LABEL_15;
      }
      *(_WORD *)buf = 0;
      id v14 = "RelationshipManager detected friendship is already active";
    }
    else
    {
      if ([v12 hasOutgoingInviteRequest]) {
        goto LABEL_14;
      }
      ASLoggingInitialize();
      id v13 = *v8;
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      *(_WORD *)buf = 0;
      id v14 = "RelationshipManager didn't find a pending outgoing request to this contact";
    }
    _os_log_impl(&dword_2474C9000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
    goto LABEL_14;
  }
  ASLoggingInitialize();
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
    -[ASRelationshipManager sendWithdrawInviteRequestToFriendWithUUID:completion:]();
  }
  id v15 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.RelationshipManager" code:3 userInfo:0];
  _NotifyOnMainQueue(0, v15, v7);
LABEL_15:
}

void __78__ASRelationshipManager_sendWithdrawInviteRequestToFriendWithUUID_completion___block_invoke(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = ASCloudKitGroupSharingSetup();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __78__ASRelationshipManager_sendWithdrawInviteRequestToFriendWithUUID_completion___block_invoke_2;
  v7[3] = &unk_265218608;
  id v10 = *(id *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v9 = v6;
  objc_msgSend(v2, "_queue_removeFriendWithUUID:eventType:activity:cloudKitGroup:completion:", v3, 3, 0, v4, v7);
}

void __78__ASRelationshipManager_sendWithdrawInviteRequestToFriendWithUUID_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  _NotifyOnMainQueue(a2, a3, *(void **)(a1 + 48));
  if (!a3 && a2)
  {
    id v12 = objc_alloc_init(MEMORY[0x263F23BA8]);
    uint64_t v6 = [*(id *)(a1 + 32) outgoingHandshakeToken];
    [v12 setHandshakeToken:v6];

    id v7 = (void *)MEMORY[0x263EFFA08];
    id v8 = [*(id *)(a1 + 32) preferredReachableAddress];
    uint64_t v9 = [v7 setWithObject:v8];

    id v10 = [*(id *)(a1 + 32) preferredReachableService];
    id v11 = [*(id *)(*(void *)(a1 + 40) + 160) objectForKeyedSubscript:v10];
    [v11 sendWithdrawInviteRequest:v12 toDestinations:v9 completion:0];
  }
}

- (void)ignoreInviteRequestFromFriendWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ASRelationshipManager *)self insertPlaceholderRelationshipEvent:7 friendUUID:v6];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_friendListManager);
  [WeakRetained updateFitnessAppBadgeCount];

  transactionQueue = self->_transactionQueue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __74__ASRelationshipManager_ignoreInviteRequestFromFriendWithUUID_completion___block_invoke;
  v14[3] = &unk_2652185B8;
  id v15 = v6;
  id v16 = self;
  id v17 = v8;
  id v18 = v7;
  id v11 = v8;
  id v12 = v7;
  id v13 = v6;
  [(ASAsyncTransactionQueue *)transactionQueue performTransaction:v14];
}

void __74__ASRelationshipManager_ignoreInviteRequestFromFriendWithUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  ASLoggingInitialize();
  uint64_t v4 = (os_log_t *)MEMORY[0x263F23AE0];
  id v5 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v22 = v6;
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "RelationshipManager attempting to ignore incoming invite from friend with UUID: %{public}@", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
  id v8 = [WeakRetained contactWithUUID:*(void *)(a1 + 32)];

  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 40) _relationshipFromContact:v8];
    if ([v9 isAwaitingInviteResponse])
    {
      [v9 insertEventWithType:7];
      id v10 = *(void **)(a1 + 40);
      id v11 = ASCloudKitGroupSharingSetup();
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __74__ASRelationshipManager_ignoreInviteRequestFromFriendWithUUID_completion___block_invoke_363;
      v16[3] = &unk_265218658;
      void v16[4] = *(void *)(a1 + 40);
      id v17 = v8;
      id v18 = *(id *)(a1 + 48);
      id v19 = v3;
      id v20 = *(id *)(a1 + 56);
      objc_msgSend(v10, "_queue_saveRelationship:contact:activity:cloudKitGroup:completion:", v9, v17, 0, v11, v16);
    }
    else
    {
      ASLoggingInitialize();
      id v13 = *v4;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __74__ASRelationshipManager_ignoreInviteRequestFromFriendWithUUID_completion___block_invoke_cold_2(v13);
      }
      id v14 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.RelationshipManager" code:4 userInfo:0];
      _NotifyOnMainQueue(0, v14, *(void **)(a1 + 56));
      id v15 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
      [v15 removePlaceholderContactWithToken:*(void *)(a1 + 48)];

      v3[2](v3);
    }
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR)) {
      -[ASRelationshipManager sendWithdrawInviteRequestToFriendWithUUID:completion:]();
    }
    uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.RelationshipManager" code:3 userInfo:0];
    _NotifyOnMainQueue(0, v9, *(void **)(a1 + 56));
    id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
    [v12 removePlaceholderContactWithToken:*(void *)(a1 + 48)];

    v3[2](v3);
  }
}

void __74__ASRelationshipManager_ignoreInviteRequestFromFriendWithUUID_completion___block_invoke_363(uint64_t a1, int a2, void *a3)
{
  id v8 = a3;
  if (!v8 && a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
    [WeakRetained updateFitnessAppBadgeCount];

    id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
    [v6 withdrawInviteNotificationsForContact:*(void *)(a1 + 40)];
  }
  id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  [v7 removePlaceholderContactWithToken:*(void *)(a1 + 48)];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  _NotifyOnMainQueue(a2, v8, *(void **)(a1 + 64));
}

- (void)messageCenter:(id)a3 didReceiveInviteRequest:(id)a4 fromSenderAddress:(id)a5 receiverAddress:(id)a6 messageHandledCompletion:(id)a7
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v29 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  ASLoggingInitialize();
  id v16 = (os_log_t *)MEMORY[0x263F23AE0];
  id v17 = (void *)*MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    id v18 = v17;
    id v19 = [v12 inviterCloudKitAddress];
    id v20 = [v12 inviterCallerID];
    *(_DWORD *)buf = 138412802;
    id v37 = v13;
    __int16 v38 = 2112;
    id v39 = v19;
    __int16 v40 = 2112;
    uint64_t v41 = v20;
    _os_log_impl(&dword_2474C9000, v18, OS_LOG_TYPE_DEFAULT, "RelationshipManager received invite request from %@, cloudKitAddress=%@, callerID=%@", buf, 0x20u);
  }
  ASLoggingInitialize();
  os_log_t v21 = *v16;
  if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = v21;
    uint64_t v23 = [v12 handshakeToken];
    id v24 = [v12 inviterBuildNumber];
    int v25 = [v12 inviterVersion];
    *(_DWORD *)buf = 138412802;
    id v37 = v23;
    __int16 v38 = 2114;
    id v39 = v24;
    __int16 v40 = 1024;
    LODWORD(v41) = v25;
    _os_log_impl(&dword_2474C9000, v22, OS_LOG_TYPE_DEFAULT, "RelationshipManager invite info: handshakeToken=%@, buildNumber=%{public}@, version=%d", buf, 0x1Cu);
  }
  if ([(ASRelationshipManager *)self _appIsInstalled])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_gatewayManager);
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __122__ASRelationshipManager_messageCenter_didReceiveInviteRequest_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke;
    v30[3] = &unk_2652186F8;
    id v35 = v15;
    v30[4] = self;
    id v31 = v12;
    id v32 = v13;
    id v27 = v29;
    id v33 = v29;
    id v34 = v14;
    [WeakRetained gatewayStatusWithCompletion:v30];
  }
  else
  {
    ASLoggingInitialize();
    id v28 = *v16;
    id v27 = v29;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v28, OS_LOG_TYPE_DEFAULT, "RelationshipManager not processing invite because activity app is not installed, persisting for later delivery", buf, 2u);
    }
    (*((void (**)(id, uint64_t))v15 + 2))(v15, 1);
  }
}

void __122__ASRelationshipManager_messageCenter_didReceiveInviteRequest_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke(id *a1, int a2, int a3, char a4, void *a5)
{
  id v9 = a5;
  if (v9 && (a4 & 1) == 0)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR)) {
      __122__ASRelationshipManager_messageCenter_didReceiveInviteRequest_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_cold_1();
    }
    (*((void (**)(void))a1[9] + 2))();
    goto LABEL_17;
  }
  if (a3)
  {
    id v10 = [a1[4] _contactWithInviteRequest:a1[5] fromSender:a1[6]];
    id WeakRetained = objc_loadWeakRetained((id *)a1[4] + 6);
    [WeakRetained updateFitnessAppBadgeCount];

    id v12 = objc_loadWeakRetained((id *)a1[4] + 5);
    [v12 showInviteAttemptNeedToUpgradeFrom:v10];
LABEL_14:

    (*((void (**)(void))a1[9] + 2))();
    goto LABEL_17;
  }
  if (!a2)
  {
    id v10 = [a1[4] _contactWithInviteRequest:a1[5] fromSender:a1[6]];
    id v17 = objc_loadWeakRetained((id *)a1[4] + 6);
    [v17 updateFitnessAppBadgeCount];

    id v12 = objc_loadWeakRetained((id *)a1[4] + 5);
    [v12 showInviteAttemptNeedToSignInFrom:v10];
    goto LABEL_14;
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __122__ASRelationshipManager_messageCenter_didReceiveInviteRequest_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_364;
  v19[3] = &unk_2652186D0;
  void v19[4] = a1[4];
  id v24 = a1[9];
  id v20 = a1[5];
  id v21 = a1[6];
  id v22 = a1[7];
  id v23 = a1[8];
  uint64_t v13 = MEMORY[0x24C557E50](v19);
  id v14 = (void *)v13;
  if (*((unsigned char *)a1[4] + 137))
  {
    ASLoggingInitialize();
    id v15 = *MEMORY[0x263F23AE0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v18 = 0;
      _os_log_impl(&dword_2474C9000, v15, OS_LOG_TYPE_DEFAULT, "RelationshipManager device is a watch, processing invite block with delay", v18, 2u);
    }
    dispatch_time_t v16 = dispatch_time(0, 8000000000);
    dispatch_after(v16, MEMORY[0x263EF83A0], v14);
  }
  else
  {
    (*(void (**)(uint64_t))(v13 + 16))(v13);
  }

LABEL_17:
}

void __122__ASRelationshipManager_messageCenter_didReceiveInviteRequest_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_364(uint64_t a1)
{
  char v2 = ASCloudKitGroupSharingSetup();
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __122__ASRelationshipManager_messageCenter_didReceiveInviteRequest_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_2;
  v8[3] = &unk_265217820;
  id v4 = *(id *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v14 = v4;
  v8[4] = v5;
  id v9 = v6;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 64);
  id v13 = v2;
  id v7 = v2;
  [WeakRetained fetchAllChangesWithPriority:2 activity:0 group:v7 completion:v8];
}

void __122__ASRelationshipManager_messageCenter_didReceiveInviteRequest_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_2(uint64_t a1, char a2, uint64_t a3)
{
  if (a3 || (a2 & 1) == 0)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
    v6();
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 80);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __122__ASRelationshipManager_messageCenter_didReceiveInviteRequest_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_3;
    v7[3] = &unk_2652186A8;
    void v7[4] = v4;
    id v8 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    id v13 = *(id *)(a1 + 80);
    id v10 = *(id *)(a1 + 56);
    id v11 = *(id *)(a1 + 64);
    id v12 = *(id *)(a1 + 72);
    [v5 performTransaction:v7];
  }
}

void __122__ASRelationshipManager_messageCenter_didReceiveInviteRequest_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  uint64_t v4 = (id *)(a1 + 40);
  uint64_t v5 = (id *)(a1 + 32);
  id v6 = [*(id *)(a1 + 32) _contactWithInviteRequest:*(void *)(a1 + 40) fromSender:*(void *)(a1 + 48)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  int v8 = [WeakRetained shouldFilterIncomingMessageFromContact:v6];

  if (!v8)
  {
    id v10 = [*v5 _relationshipFromContact:v6];
    id v11 = objc_loadWeakRetained((id *)*v5 + 7);
    char v12 = objc_msgSend(v11, "isInviteVersionCompatible:", objc_msgSend(*v4, "inviterVersion"));

    if ((v12 & 1) == 0)
    {
      ASLoggingInitialize();
      id v17 = (void *)*MEMORY[0x263F23AE0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR)) {
        __122__ASRelationshipManager_messageCenter_didReceiveInviteRequest_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_3_cold_1((void *)(a1 + 32), v17, (id *)(a1 + 40));
      }
      id v18 = objc_alloc_init(MEMORY[0x263F23B88]);
      id v19 = [*(id *)(a1 + 40) handshakeToken];
      [v18 setHandshakeToken:v19];

      [v18 setResponseCode:2];
      id v20 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
      objc_msgSend(v18, "setInviteeVersion:", objc_msgSend(v20, "inviteCompatibilityVersion"));

      id v21 = *(void **)(a1 + 56);
      id v22 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 48)];
      [v21 sendInviteResponse:v18 toDestinations:v22 fromAddress:*(void *)(a1 + 64) completion:0];

      id v23 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
      LODWORD(v22) = [v23 inviteCompatibilityVersion];
      unsigned int v24 = [*(id *)(a1 + 40) inviterVersion];

      if (v22 < v24)
      {
        id v25 = objc_loadWeakRetained((id *)*v5 + 5);
        [v25 showVersionTooLowForIncomingInviteFrom:v6];
      }
      (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
      v3[2](v3);
      goto LABEL_26;
    }
    id v13 = [v10 addresses];
    id v14 = (void *)[v13 mutableCopy];
    id v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      id v16 = [MEMORY[0x263EFF9C0] set];
    }
    id v18 = v16;

    [v18 addObject:*(void *)(a1 + 48)];
    id v26 = [*(id *)(a1 + 40) inviterCallerID];

    if (v26)
    {
      id v27 = [*v4 inviterCallerID];
      [v18 addObject:v27];
    }
    id v28 = [*(id *)(a1 + 40) handshakeToken];
    [v10 setIncomingHandshakeToken:v28];

    id v29 = [*(id *)(a1 + 40) inviterCloudKitAddress];
    [v10 setCloudKitAddress:v29];

    [v10 setAddresses:v18];
    [v10 setPreferredReachableAddress:*(void *)(a1 + 48)];
    __int16 v30 = [*(id *)(a1 + 56) serviceIdentifier];
    [v10 setPreferredReachableService:v30];

    id v31 = [v6 relationshipStorage];
    id v32 = [v31 legacyRemoteRelationship];
    [v32 insertEventWithType:1];
    uint64_t v44 = v31;
    [v31 setLegacyRemoteRelationship:v32];
    id v33 = [v6 relationshipStorage];
    [v33 setLegacyRemoteRelationship:v32];

    id v34 = (void *)MEMORY[0x263EFF910];
    id v35 = [*(id *)(a1 + 40) activityDataPreview];
    [v35 date];
    id v36 = objc_msgSend(v34, "dateWithTimeIntervalSinceReferenceDate:");

    id v37 = [v10 dateForLatestIncomingInviteRequest];
    if ([v37 isEqualToDate:v36])
    {
      if ([v10 isAwaitingInviteResponse])
      {

LABEL_21:
        ASLoggingInitialize();
        id v39 = *MEMORY[0x263F23AE0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v53 = v36;
          _os_log_impl(&dword_2474C9000, v39, OS_LOG_TYPE_DEFAULT, "RelationshipManager already notified for invite request at %@; not notifying again",
            buf,
            0xCu);
        }
        (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
        v3[2](v3);
        goto LABEL_25;
      }
      char v38 = [v10 sentInviteResponse];

      if (v38) {
        goto LABEL_21;
      }
    }
    else
    {
    }
    [v10 insertEventWithType:100 timestamp:v36];
    __int16 v40 = *(void **)(a1 + 32);
    uint64_t v43 = *(void *)(a1 + 72);
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __122__ASRelationshipManager_messageCenter_didReceiveInviteRequest_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_367;
    v45[3] = &unk_265218680;
    v50 = v3;
    id v51 = *(id *)(a1 + 80);
    id v41 = v10;
    uint64_t v42 = *(void *)(a1 + 32);
    id v46 = v41;
    uint64_t v47 = v42;
    id v48 = v6;
    id v49 = *(id *)(a1 + 40);
    objc_msgSend(v40, "_queue_saveRelationshipAndFetchOrCreateShares:contact:cloudKitGroup:completion:", v41, v48, v43, v45);

LABEL_25:
LABEL_26:

    goto LABEL_27;
  }
  ASLoggingInitialize();
  id v9 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "RelationshipManager not processing invite because contact is a filtered contact.", buf, 2u);
  }
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  v3[2](v3);
LABEL_27:
}

void __122__ASRelationshipManager_messageCenter_didReceiveInviteRequest_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_367(uint64_t a1, char a2, uint64_t a3)
{
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  if (!a3 && (a2 & 1) != 0)
  {
    if ([*(id *)(a1 + 32) isFriendshipActive]
      && ([*(id *)(a1 + 32) isActivityDataVisible] & 1) == 0)
    {
      ASLoggingInitialize();
      id v17 = (os_log_t *)MEMORY[0x263F23AE0];
      id v18 = *MEMORY[0x263F23AE0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2474C9000, v18, OS_LOG_TYPE_DEFAULT, "RelationshipManager friendship already active, but activity data is not visible", buf, 2u);
      }
      ASLoggingInitialize();
      id v19 = *v17;
      if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2474C9000, v19, OS_LOG_TYPE_DEFAULT, "RelationshipManager not notifying via BB and not auto-accepting", buf, 2u);
      }
    }
    else
    {
      int v6 = [*(id *)(a1 + 32) isFriendshipActive];
      ASLoggingInitialize();
      id v7 = *MEMORY[0x263F23AE0];
      BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (v8)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2474C9000, v7, OS_LOG_TYPE_DEFAULT, "RelationshipManager friendship already active for this person, automatically accepting", buf, 2u);
        }
        id v9 = *(void **)(a1 + 40);
        id v10 = [*(id *)(a1 + 48) UUID];
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __122__ASRelationshipManager_messageCenter_didReceiveInviteRequest_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_368;
        v20[3] = &unk_265216718;
        id v21 = *(id *)(a1 + 72);
        [v9 acceptInviteRequestFromFriendWithUUID:v10 completion:v20];

        return;
      }
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2474C9000, v7, OS_LOG_TYPE_DEFAULT, "RelationshipManager notifying via user notifications", buf, 2u);
      }
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 48));
      [WeakRetained updateFitnessAppBadgeCount];

      id v13 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
      [v13 showInviteRequestFromContact:*(void *)(a1 + 48) withPostingStyle:0];

      id v14 = *(void **)(a1 + 40);
      id v15 = [*(id *)(a1 + 56) activityDataPreview];
      id v16 = [*(id *)(a1 + 48) UUID];
      [v14 _processActivityDataPreview:v15 friendUUID:v16];
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    return;
  }
  id v11 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
  v11();
}

uint64_t __122__ASRelationshipManager_messageCenter_didReceiveInviteRequest_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_368(uint64_t a1, unsigned __int8 a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (((a3 == 0) & a2) != 0) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 2;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

- (void)messageCenter:(id)a3 didReceiveInviteResponse:(id)a4 fromSenderAddress:(id)a5 receiverAddress:(id)a6 messageHandledCompletion:(id)a7
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  ASLoggingInitialize();
  id v15 = (os_log_t *)MEMORY[0x263F23AE0];
  id v16 = (void *)*MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    id v17 = v16;
    id v18 = [v12 inviteeCloudKitAddress];
    *(_DWORD *)buf = 138412546;
    id v35 = v13;
    __int16 v36 = 2112;
    id v37 = v18;
    _os_log_impl(&dword_2474C9000, v17, OS_LOG_TYPE_DEFAULT, "RelationshipManager received invite response from %@, cloudKitAddress=%@", buf, 0x16u);
  }
  ASLoggingInitialize();
  os_log_t v19 = *v15;
  if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = v19;
    id v21 = [v12 handshakeToken];
    id v22 = [v12 inviteeBuildNumber];
    int v23 = [v12 inviteeVersion];
    *(_DWORD *)buf = 138412802;
    id v35 = v21;
    __int16 v36 = 2114;
    id v37 = v22;
    __int16 v38 = 1024;
    int v39 = v23;
    _os_log_impl(&dword_2474C9000, v20, OS_LOG_TYPE_DEFAULT, "RelationshipManager response info: handshakeToken=%@, buildNumber=%{public}@, version=%d", buf, 0x1Cu);
  }
  if ([(ASRelationshipManager *)self _appIsInstalled])
  {
    unsigned int v24 = ASCloudKitGroupSharingSetup();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudKitManager);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __123__ASRelationshipManager_messageCenter_didReceiveInviteResponse_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke;
    v28[3] = &unk_2652177D0;
    id v33 = v14;
    v28[4] = self;
    id v29 = v12;
    id v30 = v24;
    id v31 = v11;
    id v32 = v13;
    id v26 = v24;
    [WeakRetained fetchAllChangesWithPriority:2 activity:0 group:v26 completion:v28];
  }
  else
  {
    ASLoggingInitialize();
    id v27 = *v15;
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v27, OS_LOG_TYPE_DEFAULT, "RelationshipManager not processing response because activity app is not installed, persisting for later delivery", buf, 2u);
    }
    (*((void (**)(id, uint64_t))v14 + 2))(v14, 1);
  }
}

void __123__ASRelationshipManager_messageCenter_didReceiveInviteResponse_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  if (a3 || (a2 & 1) == 0)
  {
    int v6 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    v6();
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 80);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __123__ASRelationshipManager_messageCenter_didReceiveInviteResponse_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_2;
    v7[3] = &unk_2652187C0;
    void v7[4] = v4;
    id v8 = *(id *)(a1 + 40);
    id v12 = *(id *)(a1 + 72);
    id v9 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 56);
    id v11 = *(id *)(a1 + 64);
    [v5 performTransaction:v7];
  }
}

void __123__ASRelationshipManager_messageCenter_didReceiveInviteResponse_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_2(id *a1, void *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = a1 + 5;
  int v6 = a1 + 4;
  id v5 = a1[4];
  id v7 = [a1[5] handshakeToken];
  id v8 = [v5 _contactWithOutgoingHandshakeToken:v7];

  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)*v6 + 7);
    char v10 = objc_msgSend(WeakRetained, "isInviteVersionCompatible:", objc_msgSend(*v4, "inviteeVersion"));

    if ((v10 & 1) == 0)
    {
      ASLoggingInitialize();
      id v18 = (void *)*MEMORY[0x263F23AE0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR)) {
        __123__ASRelationshipManager_messageCenter_didReceiveInviteResponse_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_2_cold_3(a1 + 4, v18, a1 + 5);
      }
      id v19 = objc_loadWeakRetained((id *)*v6 + 7);
      unsigned int v20 = [v19 inviteCompatibilityVersion];
      unsigned int v21 = [*v4 inviteeVersion];

      id v22 = objc_loadWeakRetained((id *)*v6 + 5);
      int v23 = v22;
      if (v20 >= v21) {
        [v22 showVersionTooHighForOutgoingInviteTo:v8];
      }
      else {
        [v22 showVersionTooLowForOutgoingInviteTo:v8];
      }

      v3[2](v3);
      (*((void (**)(void))a1[9] + 2))();
      id v24 = a1[4];
      id v11 = [v8 UUID];
      [v24 sendWithdrawInviteRequestToFriendWithUUID:v11 completion:0];
      goto LABEL_19;
    }
    if ([*v4 responseCode] == 1)
    {
      id v11 = [*v6 _relationshipFromContact:v8];
      if ([v11 hasOutgoingInviteRequest])
      {
        [v11 insertEventWithType:101];
        id v12 = a1[4];
        id v13 = a1[6];
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __123__ASRelationshipManager_messageCenter_didReceiveInviteResponse_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_370;
        v25[3] = &unk_265218798;
        id v32 = a1[9];
        id v14 = v3;
        id v15 = a1[4];
        id v16 = a1[5];
        id v33 = v14;
        v25[4] = v15;
        id v26 = v16;
        id v27 = a1[6];
        id v28 = v11;
        id v29 = v8;
        id v30 = a1[7];
        id v31 = a1[8];
        objc_msgSend(v12, "_queue_fetchSharesForRelationship:cloudKitGroup:completion:", v28, v13, v25);
      }
      else
      {
        ASLoggingInitialize();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR)) {
          __123__ASRelationshipManager_messageCenter_didReceiveInviteResponse_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_2_cold_2();
        }
        (*((void (**)(void))a1[9] + 2))();
        v3[2](v3);
      }
LABEL_19:

      goto LABEL_20;
    }
    v3[2](v3);
    (*((void (**)(void))a1[9] + 2))();
  }
  else
  {
    ASLoggingInitialize();
    id v17 = (void *)*MEMORY[0x263F23AE0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR)) {
      __123__ASRelationshipManager_messageCenter_didReceiveInviteResponse_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_2_cold_1((uint64_t)(a1 + 5), v17);
    }
    (*((void (**)(void))a1[9] + 2))();
    v3[2](v3);
  }
LABEL_20:
}

void __123__ASRelationshipManager_messageCenter_didReceiveInviteResponse_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_370(uint64_t a1, char a2, uint64_t a3, void *a4, void *a5)
{
  v29[2] = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  if (a3 || (a2 & 1) == 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
  }
  else
  {
    id v11 = *(void **)(a1 + 32);
    id v12 = [*(id *)(a1 + 40) inviteeCloudKitAddress];
    v29[0] = v9;
    v29[1] = v10;
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
    uint64_t v14 = *(void *)(a1 + 48);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __123__ASRelationshipManager_messageCenter_didReceiveInviteResponse_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_2_371;
    v18[3] = &unk_265218770;
    id v27 = *(id *)(a1 + 88);
    id v15 = *(id *)(a1 + 96);
    uint64_t v16 = *(void *)(a1 + 32);
    id v17 = *(void **)(a1 + 40);
    id v28 = v15;
    void v18[4] = v16;
    id v19 = v17;
    id v20 = *(id *)(a1 + 56);
    id v21 = *(id *)(a1 + 64);
    id v22 = *(id *)(a1 + 48);
    id v23 = v9;
    id v24 = v10;
    id v25 = *(id *)(a1 + 72);
    id v26 = *(id *)(a1 + 80);
    objc_msgSend(v11, "_queue_addPersonWithCloudKitAddress:toShares:cloudKitGroup:completion:", v12, v13, v14, v18);
  }
}

void __123__ASRelationshipManager_messageCenter_didReceiveInviteResponse_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_2_371(uint64_t a1, char a2, uint64_t a3)
{
  if (a3 || (a2 & 1) == 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 104) + 16))();
    id v11 = *(void (**)(void))(*(void *)(a1 + 112) + 16);
    v11();
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) inviteeShareLocations];
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 64);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __123__ASRelationshipManager_messageCenter_didReceiveInviteResponse_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_3;
    v12[3] = &unk_265218748;
    id v21 = *(id *)(a1 + 104);
    id v22 = *(id *)(a1 + 112);
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 32);
    id v13 = v9;
    uint64_t v14 = v10;
    id v15 = *(id *)(a1 + 56);
    id v16 = *(id *)(a1 + 64);
    id v17 = *(id *)(a1 + 72);
    id v18 = *(id *)(a1 + 80);
    id v19 = *(id *)(a1 + 88);
    id v20 = *(id *)(a1 + 96);
    objc_msgSend(v4, "_queue_acceptShares:forRelationship:contact:cloudKitGroup:completion:", v5, v6, v7, v8, v12);
  }
}

void __123__ASRelationshipManager_messageCenter_didReceiveInviteResponse_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_3(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if (a3 || (a2 & 1) == 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
    (*(void (**)(void))(*(void *)(a1 + 104) + 16))();
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 32) inviteeCloudKitAddress];
    [v7 setCloudKitAddress:v8];

    char v9 = [v7 isFriendshipActive];
    [v7 insertEventWithType:103];
    uint64_t v10 = *(void **)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 56);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __123__ASRelationshipManager_messageCenter_didReceiveInviteResponse_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_4;
    v16[3] = &unk_265218720;
    id v24 = *(id *)(a1 + 104);
    id v25 = *(id *)(a1 + 96);
    id v17 = *(id *)(a1 + 64);
    id v18 = *(id *)(a1 + 72);
    id v13 = *(id *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = *(void **)(a1 + 48);
    id v19 = v13;
    uint64_t v20 = v14;
    char v26 = v9;
    id v21 = v15;
    id v22 = *(id *)(a1 + 80);
    id v23 = *(id *)(a1 + 88);
    objc_msgSend(v10, "_queue_saveRelationship:contact:activity:cloudKitGroup:completion:", v7, v11, 0, v12, v16);
  }
}

void __123__ASRelationshipManager_messageCenter_didReceiveInviteResponse_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_4(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
  if (a3 || (a2 & 1) == 0)
  {
    id v18 = *(void (**)(void))(*(void *)(a1 + 96) + 16);
    v18();
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x263F23BA0]);
    id v7 = [*(id *)(a1 + 32) URL];
    uint64_t v8 = [v7 absoluteString];
    [v6 setActivityShareURL:v8];

    char v9 = [*(id *)(a1 + 40) URL];
    uint64_t v10 = [v9 absoluteString];
    [v6 setRelationshipShareURL:v10];

    id v11 = objc_alloc_init(MEMORY[0x263F23B68]);
    uint64_t v12 = [*(id *)(a1 + 48) handshakeToken];
    [v11 setHandshakeToken:v12];

    [v11 setInviterShareLocations:v6];
    id v13 = [*(id *)(a1 + 56) _currentActivityDataPreview];
    [v11 setActivityDataPreview:v13];

    uint64_t v14 = (os_log_t *)MEMORY[0x263F23AE0];
    if (!*(unsigned char *)(a1 + 104))
    {
      id v15 = [*(id *)(a1 + 56) _remoteRelationshipFromContact:*(void *)(a1 + 64)];
      int v16 = [v15 isFriendshipActive];

      if (v16)
      {
        ASLoggingInitialize();
        id v17 = *v14;
        if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2474C9000, v17, OS_LOG_TYPE_DEFAULT, "RelationshipManager not inserting a placeholder began - remote side is already active", buf, 2u);
        }
      }
      else
      {
        id v19 = *(void **)(a1 + 56);
        uint64_t v20 = [*(id *)(a1 + 64) UUID];
        objc_msgSend(v19, "_queue_insertPlaceholderFriendshipDidBeginForContactWithUUID:", v20);
      }
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 56) + 48));
      [WeakRetained updateFitnessAppBadgeCount];

      ASLoggingInitialize();
      id v22 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2474C9000, v22, OS_LOG_TYPE_DEFAULT, "RelationshipManager accept received and processed, notify via BB", buf, 2u);
      }
      id v23 = objc_loadWeakRetained((id *)(*(void *)(a1 + 56) + 40));
      [v23 showInviteAcceptResponseFrom:*(void *)(a1 + 64)];
    }
    id v24 = *(void **)(a1 + 56);
    id v25 = [*(id *)(a1 + 48) activityDataPreview];
    char v26 = [*(id *)(a1 + 64) UUID];
    [v24 _processActivityDataPreview:v25 friendUUID:v26];

    ASLoggingInitialize();
    os_log_t v27 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
    {
      id v28 = v27;
      id v29 = [v11 handshakeToken];
      *(_DWORD *)buf = 138412290;
      id v35 = v29;
      _os_log_impl(&dword_2474C9000, v28, OS_LOG_TYPE_DEFAULT, "RelationshipManager sending finalize handshake with token: %@", buf, 0xCu);
    }
    id v30 = *(void **)(a1 + 72);
    id v31 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 80)];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __123__ASRelationshipManager_messageCenter_didReceiveInviteResponse_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_373;
    void v32[3] = &unk_265216718;
    id v33 = *(id *)(a1 + 96);
    [v30 sendFinalizeHandshake:v11 toDestinations:v31 completion:v32];
  }
}

uint64_t __123__ASRelationshipManager_messageCenter_didReceiveInviteResponse_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_373(uint64_t a1, unsigned __int8 a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (((a3 == 0) & a2) != 0) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 2;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

- (void)messageCenter:(id)a3 didReceiveFinalizeHandshake:(id)a4 fromSenderAddress:(id)a5 receiverAddress:(id)a6 messageHandledCompletion:(id)a7
{
  id v9 = a4;
  id v10 = a7;
  transactionQueue = self->_transactionQueue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __126__ASRelationshipManager_messageCenter_didReceiveFinalizeHandshake_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke;
  v14[3] = &unk_265217AD0;
  id v15 = v9;
  int v16 = self;
  id v17 = v10;
  id v12 = v10;
  id v13 = v9;
  [(ASAsyncTransactionQueue *)transactionQueue performTransaction:v14];
}

void __126__ASRelationshipManager_messageCenter_didReceiveFinalizeHandshake_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke(id *a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  ASLoggingInitialize();
  uint64_t v4 = (os_log_t *)MEMORY[0x263F23AE0];
  id v5 = (void *)*MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = a1[4];
    id v7 = v5;
    uint64_t v8 = [v6 handshakeToken];
    *(_DWORD *)buf = 138412290;
    os_log_t v27 = v8;
    _os_log_impl(&dword_2474C9000, v7, OS_LOG_TYPE_DEFAULT, "RelationshipManager received final handshake, token: %@", buf, 0xCu);
  }
  id v9 = a1[5];
  id v10 = [a1[4] handshakeToken];
  id v11 = [v9 _contactWithIncomingHandshakeToken:v10];

  if (v11)
  {
    id v12 = [a1[5] _relationshipFromContact:v11];
    if ([v12 hasIncomingInviteRequest])
    {
      id v13 = a1[5];
      uint64_t v14 = [a1[4] activityDataPreview];
      id v15 = [v11 UUID];
      [v13 _processActivityDataPreview:v14 friendUUID:v15];

      int v16 = ASCloudKitGroupSharingSetup();
      id v17 = a1[5];
      id v18 = [a1[4] inviterShareLocations];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      void v21[2] = __126__ASRelationshipManager_messageCenter_didReceiveFinalizeHandshake_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_374;
      v21[3] = &unk_2652187E8;
      v21[4] = a1[5];
      id v22 = v11;
      id v24 = a1[6];
      id v25 = v3;
      id v23 = v16;
      id v19 = v16;
      objc_msgSend(v17, "_queue_acceptShares:forRelationship:contact:cloudKitGroup:completion:", v18, v12, v22, v19, v21);
    }
    else
    {
      ASLoggingInitialize();
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR)) {
        __126__ASRelationshipManager_messageCenter_didReceiveFinalizeHandshake_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_cold_2();
      }
      (*((void (**)(void))a1[6] + 2))();
      v3[2](v3);
    }
  }
  else
  {
    ASLoggingInitialize();
    os_log_t v20 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR)) {
      __123__ASRelationshipManager_messageCenter_didReceiveInviteResponse_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_2_cold_1((uint64_t)(a1 + 4), v20);
    }
    (*((void (**)(void))a1[6] + 2))();
    v3[2](v3);
  }
}

void __126__ASRelationshipManager_messageCenter_didReceiveFinalizeHandshake_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_374(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  uint64_t v8 = v7;
  if (a3 || (a2 & 1) == 0)
  {
    id v12 = *(void **)(a1 + 32);
    id v13 = [*(id *)(a1 + 40) UUID];
    objc_msgSend(v12, "_queue_removePlaceholderRelationshipBeganForContactWithUUID:success:", v13, 0);

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    [v7 insertEventWithType:103];
    id v10 = *(void **)(a1 + 32);
    id v9 = *(void **)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __126__ASRelationshipManager_messageCenter_didReceiveFinalizeHandshake_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_2;
    v14[3] = &unk_2652182F0;
    void v14[4] = v10;
    id v15 = v9;
    id v16 = *(id *)(a1 + 56);
    id v17 = *(id *)(a1 + 64);
    objc_msgSend(v10, "_queue_saveRelationship:contact:activity:cloudKitGroup:completion:", v8, v15, 0, v11, v14);
  }
}

uint64_t __126__ASRelationshipManager_messageCenter_didReceiveFinalizeHandshake_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_2(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  if (a3 || (a2 & 1) == 0)
  {
    uint64_t v11 = [*(id *)(a1 + 40) UUID];
    objc_msgSend(v4, "_queue_removePlaceholderRelationshipBeganForContactWithUUID:success:", v11, 0);

    id v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) _remoteRelationshipFromContact:*(void *)(a1 + 40)];
    int v6 = [v5 isFriendshipActive];

    if (v6)
    {
      ASLoggingInitialize();
      id v7 = *MEMORY[0x263F23AE0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl(&dword_2474C9000, v7, OS_LOG_TYPE_DEFAULT, "RelationshipManager remote relationship is already active, remove placeholder", v13, 2u);
      }
      uint64_t v8 = *(void **)(a1 + 32);
      id v9 = [*(id *)(a1 + 40) UUID];
      objc_msgSend(v8, "_queue_removePlaceholderRelationshipBeganForContactWithUUID:success:", v9, 1);
    }
    id v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v10();
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)messageCenter:(id)a3 didReceiveWithdrawInviteRequest:(id)a4 fromSenderAddress:(id)a5 receiverAddress:(id)a6 messageHandledCompletion:(id)a7
{
  id v9 = a4;
  id v10 = a7;
  uint64_t v11 = ASCloudKitGroupSharingSetup();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudKitManager);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __130__ASRelationshipManager_messageCenter_didReceiveWithdrawInviteRequest_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke;
  v15[3] = &unk_265218608;
  id v16 = v9;
  id v17 = v10;
  v15[4] = self;
  id v13 = v9;
  id v14 = v10;
  [WeakRetained fetchAllChangesWithPriority:2 activity:0 group:v11 completion:v15];
}

void __130__ASRelationshipManager_messageCenter_didReceiveWithdrawInviteRequest_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  if (a3 || (a2 & 1) == 0)
  {
    int v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v6();
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(NSObject **)(v4 + 96);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __130__ASRelationshipManager_messageCenter_didReceiveWithdrawInviteRequest_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_2;
    block[3] = &unk_265215FD0;
    void block[4] = v4;
    id v8 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    dispatch_async(v5, block);
  }
}

void __130__ASRelationshipManager_messageCenter_didReceiveWithdrawInviteRequest_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_2(id *a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v2 = a1[4];
  uint64_t v3 = [a1[5] handshakeToken];
  uint64_t v4 = [v2 _contactWithIncomingHandshakeToken:v3];

  ASLoggingInitialize();
  id v5 = (os_log_t *)MEMORY[0x263F23AE0];
  int v6 = (void *)*MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = a1[5];
    id v8 = v6;
    id v9 = [v7 handshakeToken];
    id v10 = [v4 displayName];
    *(_DWORD *)buf = 138412546;
    char v26 = v9;
    __int16 v27 = 2112;
    uint64_t v28 = v10;
    _os_log_impl(&dword_2474C9000, v8, OS_LOG_TYPE_DEFAULT, "RelationshipManager received withdraw invite, token: %@, person: %@", buf, 0x16u);
  }
  uint64_t v11 = [a1[4] _relationshipFromContact:v4];
  id v12 = v11;
  if (v11)
  {
    if (([v11 isAwaitingInviteResponse] & 1) == 0)
    {
      ASLoggingInitialize();
      id v13 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2474C9000, v13, OS_LOG_TYPE_DEFAULT, "RelationshipManager didn't find a pending invite to withdraw - this invite may already have been acted upon", buf, 2u);
      }
      ASLoggingInitialize();
      id v14 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        char v26 = v12;
        _os_log_impl(&dword_2474C9000, v14, OS_LOG_TYPE_DEFAULT, "RelationshipManager current state is %{public}@", buf, 0xCu);
      }
      ASLoggingInitialize();
      id v15 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2474C9000, v15, OS_LOG_TYPE_DEFAULT, "RelationshipManager processing withdraw will continue anyway", buf, 2u);
      }
    }
    id v16 = a1[4];
    id v17 = [v12 UUID];
    id v18 = ASCloudKitGroupSharingSetup();
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __130__ASRelationshipManager_messageCenter_didReceiveWithdrawInviteRequest_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_375;
    v22[3] = &unk_265218608;
    id v19 = a1[6];
    id v20 = a1[4];
    id v24 = v19;
    v22[4] = v20;
    id v23 = v4;
    objc_msgSend(v16, "_queue_removeFriendWithUUID:eventType:activity:cloudKitGroup:completion:", v17, 102, 0, v18, v22);
  }
  else
  {
    ASLoggingInitialize();
    id v21 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v21, OS_LOG_TYPE_DEFAULT, "Withdraw invite token doesn't match any relationship, ignoring", buf, 2u);
    }
    (*((void (**)(void))a1[6] + 2))();
  }
}

uint64_t __130__ASRelationshipManager_messageCenter_didReceiveWithdrawInviteRequest_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_375(void *a1, char a2, uint64_t a3)
{
  if (a3 || (a2 & 1) == 0)
  {
    int v6 = *(uint64_t (**)(void))(a1[6] + 16);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 48));
    [WeakRetained updateFitnessAppBadgeCount];

    id v5 = objc_loadWeakRetained((id *)(a1[4] + 40));
    [v5 withdrawInviteNotificationsForContact:a1[5]];

    int v6 = *(uint64_t (**)(void))(a1[6] + 16);
  }
  return v6();
}

- (BOOL)isReadyToProcessChanges
{
  return 1;
}

- (void)cloudKitManager:(id)a3 didBeginUpdatesForFetchWithType:(int64_t)a4
{
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __73__ASRelationshipManager_cloudKitManager_didBeginUpdatesForFetchWithType___block_invoke;
  v5[3] = &unk_265216F78;
  void v5[4] = self;
  void v5[5] = a4;
  dispatch_async(serialQueue, v5);
}

uint64_t __73__ASRelationshipManager_cloudKitManager_didBeginUpdatesForFetchWithType___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 128) = *(void *)(result + 40);
  return result;
}

- (void)cloudKitManager:(id)a3 didReceiveNewRelationships:(id)a4 fromRecordZoneWithID:(id)a5 moreComing:(BOOL)a6 changesProcessedHandler:(id)a7
{
  BOOL v8 = a6;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a7;
  ASLoggingInitialize();
  id v12 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v22 = v8;
    _os_log_impl(&dword_2474C9000, v12, OS_LOG_TYPE_DEFAULT, "RelationshipManager received new relationship records from CloudKit, more coming: %{BOOL}d", buf, 8u);
  }
  transactionQueue = self->_transactionQueue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __124__ASRelationshipManager_cloudKitManager_didReceiveNewRelationships_fromRecordZoneWithID_moreComing_changesProcessedHandler___block_invoke;
  v16[3] = &unk_265218810;
  id v17 = v10;
  id v18 = self;
  BOOL v20 = v8;
  id v19 = v11;
  id v14 = v11;
  id v15 = v10;
  [(ASAsyncTransactionQueue *)transactionQueue performTransaction:v16];
}

void __124__ASRelationshipManager_cloudKitManager_didReceiveNewRelationships_fromRecordZoneWithID_moreComing_changesProcessedHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v21 = a2;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v9 = [v8 systemFieldsOnlyRecord];
        id v10 = [v9 recordID];

        id v11 = [*(id *)(*(void *)(a1 + 40) + 104) objectForKeyedSubscript:v10];

        if (v11)
        {
          ASLoggingInitialize();
          id v12 = *MEMORY[0x263F23AE0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            __int16 v27 = v10;
            __int16 v28 = 2112;
            uint64_t v29 = v8;
            _os_log_error_impl(&dword_2474C9000, v12, OS_LOG_TYPE_ERROR, "RelationshipManager received multiple local relationships on a single record ID: %@, relationship: %@", buf, 0x16u);
          }
        }
        [*(id *)(*(void *)(a1 + 40) + 104) setObject:v8 forKeyedSubscript:v10];
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
        id v14 = [v8 UUID];
        id v15 = [WeakRetained contactWithUUID:v14];

        id v16 = [v15 primaryRelationship];
        if ([v16 isAwaitingInviteResponse])
        {
          char v17 = [v8 isAwaitingInviteResponse];

          if (v17) {
            goto LABEL_13;
          }
          id v16 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
          [v16 withdrawInviteNotificationsForContact:v15];
        }

LABEL_13:
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v5);
  }

  if (!*(unsigned char *)(a1 + 56))
  {
    id v18 = *(void **)(a1 + 40);
    id v19 = [NSDictionary dictionaryWithDictionary:v18[13]];
    objc_msgSend(v18, "_queue_reconcileCloudKitRelationships:", v19);

    [*(id *)(*(void *)(a1 + 40) + 104) removeAllObjects];
    id v20 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 48));
    [v20 updateFitnessAppBadgeCount];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v21[2](v21);
}

- (void)cloudKitManager:(id)a3 didReceiveNewRemoteRelationships:(id)a4 fromRecordZoneWithID:(id)a5 moreComing:(BOOL)a6 activity:(id)a7 cloudKitGroup:(id)a8 changesProcessedHandler:(id)a9
{
  id v13 = a4;
  id v14 = a7;
  id v15 = a8;
  id v16 = a9;
  ASLoggingInitialize();
  char v17 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v17, OS_LOG_TYPE_DEFAULT, "RelationshipManager received new remote relationship records from CloudKit", buf, 2u);
  }
  transactionQueue = self->_transactionQueue;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __153__ASRelationshipManager_cloudKitManager_didReceiveNewRemoteRelationships_fromRecordZoneWithID_moreComing_activity_cloudKitGroup_changesProcessedHandler___block_invoke;
  v23[3] = &unk_265218838;
  id v24 = v13;
  long long v25 = self;
  BOOL v29 = a6;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v19 = v16;
  id v20 = v15;
  id v21 = v14;
  id v22 = v13;
  [(ASAsyncTransactionQueue *)transactionQueue performTransaction:v23];
}

void __153__ASRelationshipManager_cloudKitManager_didReceiveNewRemoteRelationships_fromRecordZoneWithID_moreComing_activity_cloudKitGroup_changesProcessedHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) firstObject];
  if ((unint64_t)[*(id *)(a1 + 32) count] >= 2)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR)) {
      __153__ASRelationshipManager_cloudKitManager_didReceiveNewRemoteRelationships_fromRecordZoneWithID_moreComing_activity_cloudKitGroup_changesProcessedHandler___block_invoke_cold_1();
    }
    long long v23 = v3;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v11 = objc_msgSend(v10, "timestampForMostRecentRelationshipEvent", v23);
          id v12 = [v4 timestampForMostRecentRelationshipEvent];
          uint64_t v13 = [v11 compare:v12];

          if (v13 == 1)
          {
            id v14 = v10;

            uint64_t v4 = v14;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v7);
    }

    id v3 = v23;
  }
  id v15 = *(void **)(*(void *)(a1 + 40) + 112);
  id v16 = objc_msgSend(v4, "systemFieldsOnlyRecord", v23);
  char v17 = [v16 recordID];
  [v15 setObject:v4 forKeyedSubscript:v17];

  if (*(unsigned char *)(a1 + 72))
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    id v18 = *(void **)(a1 + 40);
    id v19 = [NSDictionary dictionaryWithDictionary:v18[14]];
    uint64_t v20 = *(void *)(a1 + 48);
    uint64_t v21 = *(void *)(a1 + 56);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __153__ASRelationshipManager_cloudKitManager_didReceiveNewRemoteRelationships_fromRecordZoneWithID_moreComing_activity_cloudKitGroup_changesProcessedHandler___block_invoke_376;
    v24[3] = &unk_2652157A0;
    id v25 = *(id *)(a1 + 64);
    objc_msgSend(v18, "_queue_processRemoteRelationships:activity:cloudKitGroup:completion:", v19, v20, v21, v24);

    [*(id *)(*(void *)(a1 + 40) + 112) removeAllObjects];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 48));
    [WeakRetained updateFitnessAppBadgeCount];
  }
  v3[2](v3);
}

uint64_t __153__ASRelationshipManager_cloudKitManager_didReceiveNewRemoteRelationships_fromRecordZoneWithID_moreComing_activity_cloudKitGroup_changesProcessedHandler___block_invoke_376(uint64_t a1)
{
  ASLoggingInitialize();
  id v2 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_2474C9000, v2, OS_LOG_TYPE_DEFAULT, "RelationshipManager finished processing remote relationships", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)notificationManager:(id)a3 didReceiveActionResponse:(int64_t)a4 fromContactWithUUID:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a5;
  ASLoggingInitialize();
  uint64_t v8 = (os_log_t *)MEMORY[0x263F23AE0];
  id v9 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v18 = a4;
    _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "RelationshipManager received BB response: %ld in ASActivitySharingManager", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactsManager);
  id v11 = [WeakRetained contactWithUUID:v7];

  if (v11)
  {
    if (a4 == 1)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_gatewayManager);
      int v13 = [v12 hasReachedMaximumNumberOfFriends];

      if (v13)
      {
        id v14 = objc_loadWeakRetained((id *)&self->_friendInviteBulletinManager);
        [v14 showMaxNumberOfFriendsError];
      }
      else
      {
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __90__ASRelationshipManager_notificationManager_didReceiveActionResponse_fromContactWithUUID___block_invoke;
        v15[3] = &unk_2652168A8;
        v15[4] = self;
        id v16 = v11;
        [(ASRelationshipManager *)self acceptInviteRequestFromFriendWithUUID:v7 completion:v15];
      }
    }
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
      -[ASRelationshipManager notificationManager:didReceiveActionResponse:fromContactWithUUID:]();
    }
  }
}

void __90__ASRelationshipManager_notificationManager_didReceiveActionResponse_fromContactWithUUID___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  if (a3 || (a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
    [WeakRetained showErrorAcceptingInviteFrom:*(void *)(a1 + 40)];
  }
}

- (void)_processPersistedMessagesIfNeeded
{
  if ([(ASRelationshipManager *)self _appIsInstalled])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_gatewayManager);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __58__ASRelationshipManager__processPersistedMessagesIfNeeded__block_invoke;
    v5[3] = &unk_265218860;
    void v5[4] = self;
    [WeakRetained gatewayStatusWithCompletion:v5];
  }
  else
  {
    ASLoggingInitialize();
    uint64_t v4 = *MEMORY[0x263F23AE0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v4, OS_LOG_TYPE_DEFAULT, "RelationshipManager not processing persisted messages, activity app is not installed", buf, 2u);
    }
  }
}

void __58__ASRelationshipManager__processPersistedMessagesIfNeeded__block_invoke(uint64_t a1, int a2, char a3, int a4, void *a5)
{
  id v9 = a5;
  ASLoggingInitialize();
  id v10 = *MEMORY[0x263F23AE0];
  if (!a2 || !a4 || v9 || (a3 & 1) != 0)
  {
    id v11 = *MEMORY[0x263F23AE0];
    if (v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __58__ASRelationshipManager__processPersistedMessagesIfNeeded__block_invoke_cold_1();
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_2474C9000, v10, OS_LOG_TYPE_DEFAULT, "RelationshipManager not processing persisted invitation messages at this time", v12, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v10, OS_LOG_TYPE_DEFAULT, "RelationshipManager processing persisted invitation messages if available", buf, 2u);
    }
    [*(id *)(*(void *)(a1 + 32) + 160) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_379];
  }
}

uint64_t __58__ASRelationshipManager__processPersistedMessagesIfNeeded__block_invoke_377(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 processPersistedMessageQueue];
}

- (void)_queue_removeFriendWithUUID:(id)a3 eventType:(unsigned __int16)a4 activity:(id)a5 cloudKitGroup:(id)a6 completion:(id)a7
{
  uint64_t v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (ASSecureCloudEnabled())
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __97__ASRelationshipManager__queue_removeFriendWithUUID_eventType_activity_cloudKitGroup_completion___block_invoke;
    block[3] = &unk_265218318;
    void block[4] = self;
    id v18 = v12;
    __int16 v21 = v10;
    id v19 = v14;
    id v20 = v15;
    dispatch_async(serialQueue, block);
  }
  else
  {
    [(ASRelationshipManager *)self _queue_removeLegacyFriendWithUUID:v12 eventType:v10 activity:v13 cloudKitGroup:v14 completion:v15];
  }
}

void __97__ASRelationshipManager__queue_removeFriendWithUUID_eventType_activity_cloudKitGroup_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 152));
  [WeakRetained relationshipManager:*(void *)(a1 + 32) removeFriendWithUUID:*(void *)(a1 + 40) eventType:*(unsigned __int16 *)(a1 + 64) cloudKitGroup:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)_queue_removeLegacyFriendWithUUID:(id)a3 eventType:(unsigned __int16)a4 activity:(id)a5 cloudKitGroup:(id)a6 completion:(id)a7
{
  uint64_t v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  ASLoggingInitialize();
  id v16 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v16, OS_LOG_TYPE_DEFAULT, "RelationshipManager ending friendship, checking for existing relationship began placeholders", buf, 2u);
  }
  [(ASRelationshipManager *)self _queue_removePlaceholderRelationshipBeganForContactWithUUID:v12 success:0];
  char v17 = [(ASRelationshipManager *)self insertPlaceholderRelationshipEvent:v10 friendUUID:v12];
  transactionQueue = self->_transactionQueue;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __103__ASRelationshipManager__queue_removeLegacyFriendWithUUID_eventType_activity_cloudKitGroup_completion___block_invoke;
  v24[3] = &unk_265217640;
  id v25 = v12;
  long long v26 = self;
  __int16 v31 = v10;
  id v27 = v17;
  id v28 = v13;
  id v29 = v14;
  id v30 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v15;
  id v22 = v17;
  id v23 = v12;
  [(ASAsyncTransactionQueue *)transactionQueue performTransaction:v24];
}

void __103__ASRelationshipManager__queue_removeLegacyFriendWithUUID_eventType_activity_cloudKitGroup_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = a2;
  ASLoggingInitialize();
  uint64_t v4 = (os_log_t *)MEMORY[0x263F23AE0];
  id v5 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v43 = v6;
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "RelationshipManager ending friendship with friend with UUID: %{public}@", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
  uint64_t v8 = [WeakRetained contactWithUUID:*(void *)(a1 + 32)];

  if (v8)
  {
    id v9 = [*(id *)(a1 + 40) _relationshipFromContact:v8];
    if (([v9 isFriendshipActive] & 1) == 0)
    {
      ASLoggingInitialize();
      uint64_t v10 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2474C9000, v10, OS_LOG_TYPE_DEFAULT, "RelationshipManager found friendship is not currently active. Still attempting to remove person from shares, just to be safe", buf, 2u);
      }
    }
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __103__ASRelationshipManager__queue_removeLegacyFriendWithUUID_eventType_activity_cloudKitGroup_completion___block_invoke_380;
    v31[3] = &unk_265218888;
    id v11 = v9;
    __int16 v41 = *(_WORD *)(a1 + 80);
    uint64_t v12 = *(void *)(a1 + 40);
    id v32 = v11;
    uint64_t v33 = v12;
    id v34 = v8;
    id v35 = *(id *)(a1 + 56);
    id v36 = *(id *)(a1 + 64);
    id v37 = *(id *)(a1 + 48);
    id v13 = v3;
    id v39 = v13;
    id v40 = *(id *)(a1 + 72);
    id v38 = *(id *)(a1 + 32);
    id v14 = (void (**)(void))MEMORY[0x24C557E50](v31);
    id v15 = [v11 cloudKitAddress];

    ASLoggingInitialize();
    id v16 = *v4;
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v17)
      {
        id v18 = v16;
        id v19 = [v11 cloudKitAddress];
        *(_DWORD *)buf = 138412290;
        uint64_t v43 = v19;
        _os_log_impl(&dword_2474C9000, v18, OS_LOG_TYPE_DEFAULT, "RelationshipManager removing contact with cloudKitAddress %@ from activity data share", buf, 0xCu);
      }
      id v20 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
      uint64_t v22 = *(void *)(a1 + 56);
      uint64_t v21 = *(void *)(a1 + 64);
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __103__ASRelationshipManager__queue_removeLegacyFriendWithUUID_eventType_activity_cloudKitGroup_completion___block_invoke_381;
      v24[3] = &unk_265218900;
      void v24[4] = *(void *)(a1 + 40);
      id v25 = v11;
      id v26 = *(id *)(a1 + 64);
      id v27 = *(id *)(a1 + 48);
      id v28 = v13;
      id v29 = *(id *)(a1 + 72);
      id v30 = v14;
      [v20 fetchOrCreateActivityDataShareWithGroup:v21 activity:v22 completion:v24];
    }
    else
    {
      if (v17)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2474C9000, v16, OS_LOG_TYPE_DEFAULT, "RelationshipManager contact does not have a cloudKitAddress, not attempting to remove from share", buf, 2u);
      }
      v14[2](v14);
    }
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR)) {
      -[ASRelationshipManager sendWithdrawInviteRequestToFriendWithUUID:completion:]();
    }
    id v11 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.RelationshipManager" code:3 userInfo:0];
    id v23 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
    [v23 removePlaceholderContactWithToken:*(void *)(a1 + 48)];

    v3[2](v3);
    _NotifyOnMainQueue(0, v11, *(void **)(a1 + 72));
  }
}

void __103__ASRelationshipManager__queue_removeLegacyFriendWithUUID_eventType_activity_cloudKitGroup_completion___block_invoke_380(uint64_t a1)
{
  [*(id *)(a1 + 32) insertEventWithType:*(unsigned __int16 *)(a1 + 104)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __103__ASRelationshipManager__queue_removeLegacyFriendWithUUID_eventType_activity_cloudKitGroup_completion___block_invoke_2;
  v7[3] = &unk_2652187E8;
  void v7[4] = v2;
  uint64_t v6 = *(void *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  id v10 = *(id *)(a1 + 88);
  id v11 = *(id *)(a1 + 96);
  id v9 = *(id *)(a1 + 80);
  objc_msgSend(v2, "_queue_saveRelationship:contact:activity:cloudKitGroup:completion:", v3, v4, v5, v6, v7);
}

void __103__ASRelationshipManager__queue_removeLegacyFriendWithUUID_eventType_activity_cloudKitGroup_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v5 = (id *)(*(void *)(a1 + 32) + 32);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained removePlaceholderContactWithToken:*(void *)(a1 + 40)];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  _NotifyOnMainQueue(a2, v6, *(void **)(a1 + 64));

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __103__ASRelationshipManager__queue_removeLegacyFriendWithUUID_eventType_activity_cloudKitGroup_completion___block_invoke_3;
  v8[3] = &unk_2652157C8;
  v8[4] = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

void __103__ASRelationshipManager__queue_removeLegacyFriendWithUUID_eventType_activity_cloudKitGroup_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained deleteActivityDataForFriendWithUUID:*(void *)(a1 + 40)];

  id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [v3 removeUnusedTemplatesForFriendWithUUID:*(void *)(a1 + 40)];
}

void __103__ASRelationshipManager__queue_removeLegacyFriendWithUUID_eventType_activity_cloudKitGroup_completion___block_invoke_381(uint64_t a1, int a2, void *a3, void *a4)
{
  v20[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7 && a2 && v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    id v11 = [*(id *)(a1 + 40) cloudKitAddress];
    v20[0] = v9;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __103__ASRelationshipManager__queue_removeLegacyFriendWithUUID_eventType_activity_cloudKitGroup_completion___block_invoke_2_382;
    v15[3] = &unk_2652188D8;
    v15[4] = *(void *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 48);
    id v16 = *(id *)(a1 + 56);
    id v17 = *(id *)(a1 + 64);
    id v18 = *(id *)(a1 + 72);
    id v19 = *(id *)(a1 + 80);
    [WeakRetained removeParticipantWithCloudKitAddress:v11 fromShares:v12 group:v13 completion:v15];
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR)) {
      __103__ASRelationshipManager__queue_removeLegacyFriendWithUUID_eventType_activity_cloudKitGroup_completion___block_invoke_381_cold_1();
    }
    id v14 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    [v14 removePlaceholderContactWithToken:*(void *)(a1 + 56)];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    _NotifyOnMainQueue(0, v7, *(void **)(a1 + 72));
  }
}

void __103__ASRelationshipManager__queue_removeLegacyFriendWithUUID_eventType_activity_cloudKitGroup_completion___block_invoke_2_382(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 96);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __103__ASRelationshipManager__queue_removeLegacyFriendWithUUID_eventType_activity_cloudKitGroup_completion___block_invoke_3_383;
  block[3] = &unk_2652188B0;
  char v16 = a2;
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  id v15 = *(id *)(a1 + 64);
  id v8 = v5;
  dispatch_async(v7, block);
}

void __103__ASRelationshipManager__queue_removeLegacyFriendWithUUID_eventType_activity_cloudKitGroup_completion___block_invoke_3_383(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 80) && !*(void *)(a1 + 32))
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    v3();
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR)) {
      __103__ASRelationshipManager__queue_removeLegacyFriendWithUUID_eventType_activity_cloudKitGroup_completion___block_invoke_3_383_cold_1();
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
    [WeakRetained removePlaceholderContactWithToken:*(void *)(a1 + 48)];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    _NotifyOnMainQueue(0, *(void **)(a1 + 32), *(void **)(a1 + 64));
  }
}

- (id)_contactWithInviteRequest:(id)a3 fromSender:(id)a4
{
  v35[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v35[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:1];
  id v9 = [v6 inviterCloudKitAddress];

  if (v9)
  {
    id v10 = [v6 inviterCloudKitAddress];
    uint64_t v11 = [v8 arrayByAddingObject:v10];

    id v8 = (void *)v11;
  }
  id v12 = [v6 inviterCallerID];

  if (v12)
  {
    id v13 = [v6 inviterCallerID];
    uint64_t v14 = [v8 arrayByAddingObject:v13];

    id v8 = (void *)v14;
  }
  p_contactsManager = &self->_contactsManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactsManager);
  id v17 = [WeakRetained contactWithDestinations:v8];

  if (!v17)
  {
    ASLoggingInitialize();
    __int16 v31 = *MEMORY[0x263F23AE0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v33 = 0;
      _os_log_impl(&dword_2474C9000, v31, OS_LOG_TYPE_DEFAULT, "RelationshipManager couldn't find match, creating new contact", v33, 2u);
    }
    id v27 = objc_loadWeakRetained((id *)&self->_contactsManager);
    uint64_t v30 = [v27 createContactWithDestinations:v8];
    goto LABEL_16;
  }
  uint64_t v18 = [v6 inviterCloudKitAddress];
  if (v18)
  {
    id v19 = (void *)v18;
    id v20 = [(ASRelationshipManager *)self _relationshipFromContact:v17];
    uint64_t v21 = [v20 cloudKitAddress];
    uint64_t v22 = [v6 inviterCloudKitAddress];
    char v23 = [v21 isEqualToString:v22];

    if ((v23 & 1) == 0)
    {
      ASLoggingInitialize();
      id v24 = (os_log_t *)MEMORY[0x263F23AE0];
      id v25 = *MEMORY[0x263F23AE0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v33 = 0;
        _os_log_impl(&dword_2474C9000, v25, OS_LOG_TYPE_DEFAULT, "RelationshipManager found a match, but the cloudKit address was different", v33, 2u);
      }
      ASLoggingInitialize();
      id v26 = *v24;
      if (os_log_type_enabled(*v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v33 = 0;
        _os_log_impl(&dword_2474C9000, v26, OS_LOG_TYPE_DEFAULT, "RelationshipManager creating a new contact for this unique cloudKit address", v33, 2u);
      }
      id v27 = objc_loadWeakRetained((id *)p_contactsManager);
      id v28 = [v6 inviterCloudKitAddress];
      id v34 = v28;
      id v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
      uint64_t v30 = [v27 createContactWithDestinations:v29];

LABEL_16:
      id v17 = (void *)v30;
    }
  }

  return v17;
}

- (id)_contactWithOutgoingHandshakeToken:(id)a3
{
  p_contactsManager = &self->_contactsManager;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_contactsManager);
  id v6 = ASContactForOutgoingHandshakeTokenWithManager(v4, WeakRetained, 0);

  return v6;
}

- (id)_contactWithIncomingHandshakeToken:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactsManager);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__ASRelationshipManager__contactWithIncomingHandshakeToken___block_invoke;
  v9[3] = &unk_265218928;
  void v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = [WeakRetained contactMatchingCriteriaBlock:v9];

  return v7;
}

uint64_t __60__ASRelationshipManager__contactWithIncomingHandshakeToken___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _relationshipFromContact:a2];
  id v4 = [v3 incomingHandshakeToken];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 40)];

  return v5;
}

- (id)_contactWithRemoteRelationshipRecordZoneID:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactsManager);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __68__ASRelationshipManager__contactWithRemoteRelationshipRecordZoneID___block_invoke;
  v9[3] = &unk_265218928;
  void v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = [WeakRetained contactMatchingCriteriaBlock:v9];

  return v7;
}

uint64_t __68__ASRelationshipManager__contactWithRemoteRelationshipRecordZoneID___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _relationshipFromContact:a2];
  id v4 = [v3 remoteRelationshipShareID];
  uint64_t v5 = [v4 zoneID];
  uint64_t v6 = [v5 isEqual:*(void *)(a1 + 40)];

  return v6;
}

- (void)_insertInviteForContact:(id)a3 destination:(id)a4 serviceIdentifier:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [(ASRelationshipManager *)self _relationshipFromContact:v8];
  id v12 = [v8 destinations];
  [v11 setAddresses:v12];

  id v13 = ASSanitizedContactDestination();

  [v11 setPreferredReachableAddress:v13];
  [v11 setPreferredReachableService:v9];

  uint64_t v14 = [v11 outgoingHandshakeToken];

  if (v14)
  {
    ASLoggingInitialize();
    id v15 = (void *)*MEMORY[0x263F23AE0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
    {
      char v16 = v15;
      id v17 = [v11 outgoingHandshakeToken];
      *(_DWORD *)char v23 = 138412290;
      *(void *)&void v23[4] = v17;
      uint64_t v18 = "RelationshipManager outgoing handshake token already exists for this person: %@";
LABEL_6:
      _os_log_impl(&dword_2474C9000, v16, OS_LOG_TYPE_DEFAULT, v18, v23, 0xCu);
    }
  }
  else
  {
    id v19 = [MEMORY[0x263F08C38] UUID];
    id v20 = [v19 UUIDString];
    [v11 setOutgoingHandshakeToken:v20];

    ASLoggingInitialize();
    uint64_t v21 = (void *)*MEMORY[0x263F23AE0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
    {
      char v16 = v21;
      id v17 = [v11 outgoingHandshakeToken];
      *(_DWORD *)char v23 = 138412290;
      *(void *)&void v23[4] = v17;
      uint64_t v18 = "RelationshipManager creating new outgoing handshake token: %@";
      goto LABEL_6;
    }
  }
  objc_msgSend(v11, "insertEventWithType:", 1, *(_OWORD *)v23);
  uint64_t v22 = [v8 relationshipStorage];
  [v22 setLegacyRelationship:v11];
  [v8 setRelationshipStorage:v22];
}

- (id)insertPlaceholderRelationshipEvent:(unsigned __int16)a3 friendUUID:(id)a4
{
  uint64_t v4 = a3;
  p_contactsManager = &self->_contactsManager;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_contactsManager);
  id v8 = ASInsertPlaceholderRelationshipEventForFriend(v4, v6, WeakRetained, &unk_26FBA7E80);

  return v8;
}

- (void)removePlaceholderRelationshipEventWithToken:(id)a3
{
  p_contactsManager = &self->_contactsManager;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_contactsManager);
  ASRemovePlaceholderForToken((uint64_t)v4, WeakRetained);
}

- (void)_queue_removePlaceholderRelationshipBeganForContactWithUUID:(id)a3 success:(BOOL)a4
{
  BOOL v4 = a4;
  serialQueue = self->_serialQueue;
  id v7 = a3;
  dispatch_assert_queue_V2(serialQueue);
  [(ASRelationshipFinalizationStore *)self->_finalizingStore removePlaceholderWithContactUUID:v7 shouldNotify:v4];
}

- (id)_contactWithUUIDPreferringPlaceholders:(id)a3
{
  p_contactsManager = &self->_contactsManager;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_contactsManager);
  id v6 = ASContactPreferringPlaceholderForUUID(v4, WeakRetained);

  return v6;
}

- (void)_queue_insertPlaceholderFriendshipDidBeginForContactWithUUID:(id)a3
{
  serialQueue = self->_serialQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(serialQueue);
  [(ASRelationshipFinalizationStore *)self->_finalizingStore insertPlaceholderForEventTypes:&unk_26FBA7F88 contactUUID:v5];
}

- (void)_performBlockWaitingForFriendshipBeganForFriendWithUUID:(id)a3 block:(id)a4
{
}

- (void)saveRelationship:(id)a3 contact:(id)a4 cloudKitGroup:(id)a5 activity:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  serialQueue = self->_serialQueue;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __84__ASRelationshipManager_saveRelationship_contact_cloudKitGroup_activity_completion___block_invoke;
  v23[3] = &unk_265218978;
  void v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v15;
  id v27 = v14;
  id v28 = v16;
  id v18 = v16;
  id v19 = v14;
  id v20 = v15;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(serialQueue, v23);
}

void __84__ASRelationshipManager_saveRelationship_contact_cloudKitGroup_activity_completion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __84__ASRelationshipManager_saveRelationship_contact_cloudKitGroup_activity_completion___block_invoke_2;
  v6[3] = &unk_265218950;
  uint64_t v5 = *(void *)(a1 + 64);
  id v7 = *(id *)(a1 + 72);
  objc_msgSend(v1, "_queue_saveRelationship:contact:activity:cloudKitGroup:completion:", v2, v3, v4, v5, v6);
}

uint64_t __84__ASRelationshipManager_saveRelationship_contact_cloudKitGroup_activity_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)saveRelationship:(id)a3 contact:(id)a4 extraRecordsToSave:(id)a5 extraRecordIDsToDelete:(id)a6 cloudKitGroup:(id)a7 activity:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  serialQueue = self->_serialQueue;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __126__ASRelationshipManager_saveRelationship_contact_extraRecordsToSave_extraRecordIDsToDelete_cloudKitGroup_activity_completion___block_invoke;
  v30[3] = &unk_2652189C8;
  v30[4] = self;
  id v31 = v15;
  id v32 = v16;
  id v33 = v17;
  id v34 = v18;
  id v35 = v20;
  id v36 = v19;
  id v37 = v21;
  id v23 = v21;
  id v24 = v19;
  id v25 = v20;
  id v26 = v18;
  id v27 = v17;
  id v28 = v16;
  id v29 = v15;
  dispatch_async(serialQueue, v30);
}

void __126__ASRelationshipManager_saveRelationship_contact_extraRecordsToSave_extraRecordIDsToDelete_cloudKitGroup_activity_completion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 72);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __126__ASRelationshipManager_saveRelationship_contact_extraRecordsToSave_extraRecordIDsToDelete_cloudKitGroup_activity_completion___block_invoke_2;
  v8[3] = &unk_2652189A0;
  uint64_t v7 = *(void *)(a1 + 80);
  id v9 = *(id *)(a1 + 88);
  objc_msgSend(v1, "_queue_saveRelationship:contact:extraRecordsToSave:extraRecordIDsToDelete:activity:cloudKitGroup:completion:", v2, v3, v4, v5, v6, v7, v8);
}

uint64_t __126__ASRelationshipManager_saveRelationship_contact_extraRecordsToSave_extraRecordIDsToDelete_cloudKitGroup_activity_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)saveRelationships:(id)a3 extraRecordsToSave:(id)a4 cloudKitGroup:(id)a5 activity:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([v12 count])
  {
    transactionQueue = self->_transactionQueue;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    void v20[2] = __96__ASRelationshipManager_saveRelationships_extraRecordsToSave_cloudKitGroup_activity_completion___block_invoke;
    v20[3] = &unk_265218A18;
    id v21 = v12;
    id v22 = v13;
    id v23 = self;
    id v24 = v15;
    id v25 = v14;
    id v26 = v16;
    [(ASAsyncTransactionQueue *)transactionQueue performTransaction:v20];

    id v18 = v21;
  }
  else
  {
    ASLoggingInitialize();
    id v19 = *MEMORY[0x263F23AE0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v19, OS_LOG_TYPE_DEFAULT, "RelationshipManager didn't find any relationships to save", buf, 2u);
    }
    id v18 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.RelationshipManager" code:10 userInfo:0];
    (*((void (**)(id, void, void *, void))v16 + 2))(v16, 0, v18, 0);
  }
}

void __96__ASRelationshipManager_saveRelationships_extraRecordsToSave_cloudKitGroup_activity_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  ASLoggingInitialize();
  uint64_t v4 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v4, OS_LOG_TYPE_DEFAULT, "RelationshipManager serializing relationship records and saving to CloudKit", buf, 2u);
  }
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "hk_map:", &__block_literal_global_392);
  uint64_t v6 = [v5 arrayByAddingObjectsFromArray:*(void *)(a1 + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 24));
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 64);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __96__ASRelationshipManager_saveRelationships_extraRecordsToSave_cloudKitGroup_activity_completion___block_invoke_2;
  v11[3] = &unk_265217B98;
  v11[4] = *(void *)(a1 + 48);
  id v12 = *(id *)(a1 + 72);
  id v13 = v3;
  id v10 = v3;
  [WeakRetained saveRecordsIntoPrivateDatabase:v6 priority:2 activity:v8 group:v9 completion:v11];
}

id __96__ASRelationshipManager_saveRelationships_extraRecordsToSave_cloudKitGroup_activity_completion___block_invoke_390(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[ASCloudKitManager relationshipZone];
  uint64_t v4 = [v2 recordWithZoneID:v3 recordEncryptionType:0];

  return v4;
}

void __96__ASRelationshipManager_saveRelationships_extraRecordsToSave_cloudKitGroup_activity_completion___block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v7 && a2)
  {
    char v29 = a2;
    uint64_t v9 = (void *)MEMORY[0x263F23BF0];
    id v28 = v8;
    id v10 = [MEMORY[0x263EFFA08] setWithArray:v8];
    uint64_t v11 = [v9 relationshipsWithRelationshipAndEventRecords:v10];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v36;
      id v16 = (os_log_t *)MEMORY[0x263F23AE0];
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v36 != v15) {
            objc_enumerationMutation(v12);
          }
          id v18 = *(void **)(*((void *)&v35 + 1) + 8 * v17);
          id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
          id v20 = [v18 UUID];
          id v21 = [WeakRetained contactWithUUID:v20];

          if (v21)
          {
            id v22 = [v21 relationshipStorage];
            [v22 setLegacyRelationship:v18];
            [v21 setRelationshipStorage:v22];
            id v23 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
            [v23 saveContact:v21];
          }
          else
          {
            ASLoggingInitialize();
            os_log_t v24 = *v16;
            if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR)) {
              __106__ASRelationshipManager_updateRelationshipsForCurrentFeatureSupportWithActivity_cloudKitGroup_completion___block_invoke_2_cold_1(&v39, v24, v18, &v40);
            }
          }

          ++v17;
        }
        while (v14 != v17);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v14);
    }

    id v7 = 0;
    LOBYTE(a2) = v29;
    id v8 = v28;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __96__ASRelationshipManager_saveRelationships_extraRecordsToSave_cloudKitGroup_activity_completion___block_invoke_393;
  block[3] = &unk_2652189F0;
  id v25 = *(id *)(a1 + 40);
  id v32 = v8;
  id v33 = v25;
  char v34 = a2;
  id v31 = v7;
  id v26 = v8;
  id v27 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __96__ASRelationshipManager_saveRelationships_extraRecordsToSave_cloudKitGroup_activity_completion___block_invoke_393(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)saveRelationshipAndFetchOrCreateShares:(id)a3 contact:(id)a4 cloudKitGroup:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __97__ASRelationshipManager_saveRelationshipAndFetchOrCreateShares_contact_cloudKitGroup_completion___block_invoke;
  block[3] = &unk_265218A40;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(serialQueue, block);
}

uint64_t __97__ASRelationshipManager_saveRelationshipAndFetchOrCreateShares_contact_cloudKitGroup_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_saveRelationshipAndFetchOrCreateShares:contact:cloudKitGroup:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64));
}

- (void)acceptShares:(id)a3 forRelationship:(id)a4 contact:(id)a5 cloudKitGroup:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  serialQueue = self->_serialQueue;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __87__ASRelationshipManager_acceptShares_forRelationship_contact_cloudKitGroup_completion___block_invoke;
  v23[3] = &unk_265218978;
  void v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(serialQueue, v23);
}

uint64_t __87__ASRelationshipManager_acceptShares_forRelationship_contact_cloudKitGroup_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_acceptShares:forRelationship:contact:cloudKitGroup:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72));
}

- (void)_queue_fetchSharesForRelationship:(id)a3 cloudKitGroup:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v11 = dispatch_group_create();
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__14;
  v43[4] = __Block_byref_object_dispose__14;
  id v44 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__14;
  v41[4] = __Block_byref_object_dispose__14;
  id v42 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__14;
  v39[4] = __Block_byref_object_dispose__14;
  id v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__14;
  v37[4] = __Block_byref_object_dispose__14;
  id v38 = 0;
  ASLoggingInitialize();
  id v12 = (os_log_t *)MEMORY[0x263F23AE0];
  id v13 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v13, OS_LOG_TYPE_DEFAULT, "RelationshipManager fetching activity data share", buf, 2u);
  }
  dispatch_group_enter(v11);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudKitManager);
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __84__ASRelationshipManager__queue_fetchSharesForRelationship_cloudKitGroup_completion___block_invoke;
  void v32[3] = &unk_265218A68;
  char v34 = v39;
  long long v35 = v43;
  id v15 = v11;
  id v33 = v15;
  [WeakRetained fetchOrCreateActivityDataShareWithGroup:v9 activity:0 completion:v32];

  dispatch_group_enter(v15);
  id v16 = [v8 relationshipShareID];

  if (v16)
  {
    id v17 = objc_loadWeakRetained((id *)&self->_cloudKitManager);
    id v18 = [v8 relationshipShareID];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __84__ASRelationshipManager__queue_fetchSharesForRelationship_cloudKitGroup_completion___block_invoke_394;
    v28[3] = &unk_265218A68;
    uint64_t v30 = v37;
    id v31 = v41;
    char v29 = v15;
    [v17 fetchShareWithShareRecordID:v18 activity:0 group:v9 completion:v28];
  }
  else
  {
    ASLoggingInitialize();
    id v19 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v19, OS_LOG_TYPE_DEFAULT, "RelationshipManager failed to fetch relationship share because relationship had no archived share ID", buf, 2u);
    }
  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__ASRelationshipManager__queue_fetchSharesForRelationship_cloudKitGroup_completion___block_invoke_395;
  block[3] = &unk_265216E60;
  id v25 = v37;
  id v26 = v43;
  id v27 = v41;
  id v23 = v10;
  id v24 = v39;
  id v21 = v10;
  dispatch_group_notify(v15, serialQueue, block);

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v43, 8);
}

void __84__ASRelationshipManager__queue_fetchSharesForRelationship_cloudKitGroup_completion___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  ASLoggingInitialize();
  id v9 = *MEMORY[0x263F23AE0];
  if (!v7 && a2 && v8)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "RelationshipManager successfully fetched activity data share", v14, 2u);
    }
    id v10 = (void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v11 = v8;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR)) {
      __84__ASRelationshipManager__queue_fetchSharesForRelationship_cloudKitGroup_completion___block_invoke_cold_1();
    }
    id v10 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v11 = v7;
  }
  id v12 = v11;
  id v13 = *v10;
  void *v10 = v12;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __84__ASRelationshipManager__queue_fetchSharesForRelationship_cloudKitGroup_completion___block_invoke_394(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  ASLoggingInitialize();
  id v9 = *MEMORY[0x263F23AE0];
  if (!v7 && a2 && v8)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "RelationshipManager successfully fetched relationship share", v14, 2u);
    }
    id v10 = (void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v11 = v8;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR)) {
      __84__ASRelationshipManager__queue_fetchSharesForRelationship_cloudKitGroup_completion___block_invoke_394_cold_1();
    }
    id v10 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v11 = v7;
  }
  id v12 = v11;
  id v13 = *v10;
  void *v10 = v12;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __84__ASRelationshipManager__queue_fetchSharesForRelationship_cloudKitGroup_completion___block_invoke_395(void *a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1[5] + 8) + 40);
  if (!v1) {
    uint64_t v1 = *(void *)(*(void *)(a1[6] + 8) + 40);
  }
  if (*(void *)(*(void *)(a1[7] + 8) + 40)) {
    BOOL v2 = *(void *)(*(void *)(a1[8] + 8) + 40) == 0;
  }
  else {
    BOOL v2 = 1;
  }
  uint64_t v3 = a1[4];
  uint64_t v4 = !v2;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v3, v4, v1);
}

- (void)handleSavedRecords:(id)a3 forContact:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  serialQueue = self->_serialQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __66__ASRelationshipManager_handleSavedRecords_forContact_completion___block_invoke;
  v15[3] = &unk_265218A90;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(serialQueue, v15);
}

void __66__ASRelationshipManager_handleSavedRecords_forContact_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_handleSavedRecords:forContact:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    BOOL v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.RelationshipManager" code:12 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (id)_queue_handleSavedRecords:(id)a3 forContact:(id)a4
{
  p_contactsManager = &self->_contactsManager;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_contactsManager);
  id v9 = ASSaveRelationshipRecordForContact((uint64_t)v7, v6, WeakRetained);

  return v9;
}

- (void)_queue_saveRelationshipAndFetchOrCreateShares:(id)a3 contact:(id)a4 cloudKitGroup:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v34 = a4;
  id v11 = a5;
  id v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x3032000000;
  v63[3] = __Block_byref_object_copy__14;
  v63[4] = __Block_byref_object_dispose__14;
  id v64 = 0;
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x3032000000;
  v61[3] = __Block_byref_object_copy__14;
  v61[4] = __Block_byref_object_dispose__14;
  id v62 = 0;
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x3032000000;
  v59[3] = __Block_byref_object_copy__14;
  v59[4] = __Block_byref_object_dispose__14;
  id v60 = 0;
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x3032000000;
  v57[3] = __Block_byref_object_copy__14;
  v57[4] = __Block_byref_object_dispose__14;
  id v58 = 0;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = __Block_byref_object_copy__14;
  v55[4] = __Block_byref_object_dispose__14;
  id v56 = 0;
  id v13 = +[ASCloudKitManager relationshipZone];
  id v14 = [v10 recordWithZoneID:v13 recordEncryptionType:0];

  id v15 = dispatch_group_create();
  dispatch_group_enter(v15);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudKitManager);
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __104__ASRelationshipManager__queue_saveRelationshipAndFetchOrCreateShares_contact_cloudKitGroup_completion___block_invoke;
  v51[3] = &unk_265218A68;
  v53 = v63;
  uint64_t v54 = v57;
  id v17 = v15;
  v52 = v17;
  [WeakRetained fetchOrCreateActivityDataShareWithGroup:v11 activity:0 completion:v51];

  id v18 = [v14 share];

  if (v18)
  {
    dispatch_group_enter(v17);
    id v19 = objc_loadWeakRetained((id *)&self->_cloudKitManager);
    id v20 = [v14 share];
    id v21 = [v20 recordID];
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __104__ASRelationshipManager__queue_saveRelationshipAndFetchOrCreateShares_contact_cloudKitGroup_completion___block_invoke_396;
    v47[3] = &unk_265218B08;
    v47[4] = self;
    v50[1] = v55;
    id v48 = v17;
    v50[2] = v61;
    id v49 = v10;
    v50[0] = v34;
    v50[3] = v59;
    [v19 fetchShareWithShareRecordID:v21 activity:0 group:v11 completion:v47];
    id v32 = self;
    id v33 = v17;
    id v22 = v14;
    id v23 = v12;
    id v24 = v10;
    id v25 = v11;
    id v26 = (id *)&v48;
    id v27 = &v49;
    id v28 = (id *)v50;

LABEL_7:
    id v11 = v25;
    id v10 = v24;
    id v12 = v23;
    id v14 = v22;
    self = v32;
    id v17 = v33;
    goto LABEL_8;
  }
  if (v14)
  {
    ASLoggingInitialize();
    char v29 = *MEMORY[0x263F23AE0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v29, OS_LOG_TYPE_DEFAULT, "RelationshipManager creating new relationship share", buf, 2u);
    }
    dispatch_group_enter(v17);
    id v19 = objc_loadWeakRetained((id *)&self->_cloudKitManager);
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __104__ASRelationshipManager__queue_saveRelationshipAndFetchOrCreateShares_contact_cloudKitGroup_completion___block_invoke_398;
    v42[3] = &unk_265218B58;
    v42[4] = self;
    v45[1] = v55;
    id v43 = v10;
    v45[2] = v59;
    id v44 = v34;
    v45[3] = v61;
    v45[0] = v17;
    [v19 createShareWithRootRecord:v14 otherRecordsToSave:0 completion:v42];
    id v32 = self;
    id v33 = v17;
    id v22 = v14;
    id v23 = v12;
    id v24 = v10;
    id v25 = v11;
    id v26 = &v43;
    id v27 = &v44;
    id v28 = (id *)v45;
    goto LABEL_7;
  }
LABEL_8:
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __104__ASRelationshipManager__queue_saveRelationshipAndFetchOrCreateShares_contact_cloudKitGroup_completion___block_invoke_401;
  block[3] = &unk_265218B80;
  id v36 = v12;
  long long v37 = v57;
  id v38 = v55;
  int v39 = v59;
  id v40 = v63;
  __int16 v41 = v61;
  id v31 = v12;
  dispatch_group_notify(v17, serialQueue, block);

  _Block_object_dispose(v55, 8);
  _Block_object_dispose(v57, 8);

  _Block_object_dispose(v59, 8);
  _Block_object_dispose(v61, 8);

  _Block_object_dispose(v63, 8);
}

void __104__ASRelationshipManager__queue_saveRelationshipAndFetchOrCreateShares_contact_cloudKitGroup_completion___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v8 && a2 && v9)
  {
    id v11 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v12 = a4;
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR)) {
      __104__ASRelationshipManager__queue_saveRelationshipAndFetchOrCreateShares_contact_cloudKitGroup_completion___block_invoke_cold_1();
    }
    id v11 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v12 = a3;
  }
  objc_storeStrong(v11, v12);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __104__ASRelationshipManager__queue_saveRelationshipAndFetchOrCreateShares_contact_cloudKitGroup_completion___block_invoke_396(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __104__ASRelationshipManager__queue_saveRelationshipAndFetchOrCreateShares_contact_cloudKitGroup_completion___block_invoke_2;
  v16[3] = &unk_265218AE0;
  char v26 = a2;
  id v17 = v7;
  id v18 = v8;
  uint64_t v23 = *(void *)(a1 + 64);
  id v10 = *(id *)(a1 + 40);
  uint64_t v24 = *(void *)(a1 + 72);
  uint64_t v11 = *(void *)(a1 + 32);
  id v19 = v10;
  uint64_t v20 = v11;
  id v21 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 80);
  id v22 = v12;
  uint64_t v25 = v13;
  id v14 = v8;
  id v15 = v7;
  dispatch_async(v9, v16);
}

void __104__ASRelationshipManager__queue_saveRelationshipAndFetchOrCreateShares_contact_cloudKitGroup_completion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 104) && !*(void *)(a1 + 32) && *(void *)(a1 + 40))
  {
    ASLoggingInitialize();
    BOOL v2 = *MEMORY[0x263F23AE0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v2, OS_LOG_TYPE_DEFAULT, "RelationshipManager successfully fetched relationship share", buf, 2u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), *(id *)(a1 + 40));
    id v3 = *(void **)(a1 + 56);
    uint64_t v4 = *(void *)(a1 + 64);
    uint64_t v5 = *(void *)(a1 + 72);
    id v6 = ASCloudKitGroupSharingSetup();
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __104__ASRelationshipManager__queue_saveRelationshipAndFetchOrCreateShares_contact_cloudKitGroup_completion___block_invoke_397;
    v8[3] = &unk_265218AB8;
    uint64_t v7 = *(void *)(a1 + 96);
    uint64_t v10 = *(void *)(a1 + 80);
    uint64_t v11 = v7;
    id v9 = *(id *)(a1 + 48);
    objc_msgSend(v3, "_queue_saveRelationship:contact:activity:cloudKitGroup:completion:", v4, v5, 0, v6, v8);
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR)) {
      __104__ASRelationshipManager__queue_saveRelationshipAndFetchOrCreateShares_contact_cloudKitGroup_completion___block_invoke_2_cold_1();
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), *(id *)(a1 + 32));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

void __104__ASRelationshipManager__queue_saveRelationshipAndFetchOrCreateShares_contact_cloudKitGroup_completion___block_invoke_397(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  ASLoggingInitialize();
  id v8 = (void *)*MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    uint64_t v10 = [v7 UUID];
    int v17 = 138543362;
    id v18 = v10;
    _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "RelationshipManager successfully saved relationship record in CloudKit for UUID %{public}@", (uint8_t *)&v17, 0xCu);
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
  id v13 = v6;

  uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v7;
  id v16 = v7;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __104__ASRelationshipManager__queue_saveRelationshipAndFetchOrCreateShares_contact_cloudKitGroup_completion___block_invoke_398(uint64_t a1, char a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __104__ASRelationshipManager__queue_saveRelationshipAndFetchOrCreateShares_contact_cloudKitGroup_completion___block_invoke_2_399;
  v24[3] = &unk_265218B30;
  char v36 = a2;
  id v25 = v11;
  id v26 = v12;
  uint64_t v33 = *(void *)(a1 + 64);
  id v16 = *(id *)(a1 + 40);
  uint64_t v34 = *(void *)(a1 + 72);
  uint64_t v17 = *(void *)(a1 + 32);
  id v27 = v16;
  uint64_t v28 = v17;
  id v29 = v13;
  id v30 = v14;
  id v18 = *(id *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 80);
  id v31 = v18;
  uint64_t v35 = v19;
  id v32 = *(id *)(a1 + 56);
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  id v23 = v11;
  dispatch_async(v15, v24);
}

void __104__ASRelationshipManager__queue_saveRelationshipAndFetchOrCreateShares_contact_cloudKitGroup_completion___block_invoke_2_399(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 120) && !*(void *)(a1 + 32) && *(void *)(a1 + 40))
  {
    ASLoggingInitialize();
    id v7 = (void *)*MEMORY[0x263F23AE0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = *(void **)(a1 + 48);
      id v9 = v7;
      uint64_t v10 = [v8 UUID];
      int v17 = 138543362;
      id v18 = v10;
      _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "RelationshipManager successfully saved relationship record for share in CloudKit for UUID %{public}@", (uint8_t *)&v17, 0xCu);
    }
    id v11 = *(void **)(a1 + 56);
    id v12 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 64)];
    id v13 = [v12 setByAddingObjectsFromArray:*(void *)(a1 + 72)];
    uint64_t v14 = objc_msgSend(v11, "_queue_handleSavedRecords:forContact:", v13, *(void *)(a1 + 80));
    uint64_t v15 = *(void *)(*(void *)(a1 + 104) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    BOOL v2 = *(void **)(a1 + 40);
    uint64_t v3 = *(void *)(a1 + 112);
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR)) {
      __104__ASRelationshipManager__queue_saveRelationshipAndFetchOrCreateShares_contact_cloudKitGroup_completion___block_invoke_2_399_cold_1();
    }
    BOOL v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 96);
  }
  uint64_t v4 = (void **)(*(void *)(v3 + 8) + 40);
  id v5 = v2;
  id v6 = *v4;
  *uint64_t v4 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 88));
}

void __104__ASRelationshipManager__queue_saveRelationshipAndFetchOrCreateShares_contact_cloudKitGroup_completion___block_invoke_401(void *a1)
{
  if (a1[4])
  {
    BOOL v2 = *(void **)(*(void *)(a1[5] + 8) + 40);
    if (v2)
    {
      id v3 = v2;
      BOOL v4 = 0;
      uint64_t v5 = a1[4];
    }
    else
    {
      id v3 = *(id *)(*(void *)(a1[6] + 8) + 40);
      uint64_t v5 = a1[4];
      if (v3) {
        BOOL v4 = 0;
      }
      else {
        BOOL v4 = *(void *)(*(void *)(a1[7] + 8) + 40) != 0;
      }
    }
    id v6 = v3;
    (*(void (**)(uint64_t, BOOL))(v5 + 16))(v5, v4);
  }
}

- (void)_queue_saveRelationship:(id)a3 contact:(id)a4 activity:(id)a5 cloudKitGroup:(id)a6 completion:(id)a7
{
  id v12 = a7;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __91__ASRelationshipManager__queue_saveRelationship_contact_activity_cloudKitGroup_completion___block_invoke;
  v14[3] = &unk_265218950;
  id v15 = v12;
  id v13 = v12;
  [(ASRelationshipManager *)self _queue_saveRelationship:a3 contact:a4 withExtraRecords:0 activity:a5 cloudKitGroup:a6 completion:v14];
}

uint64_t __91__ASRelationshipManager__queue_saveRelationship_contact_activity_cloudKitGroup_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_queue_saveRelationship:(id)a3 contact:(id)a4 withExtraRecords:(id)a5 activity:(id)a6 cloudKitGroup:(id)a7 completion:(id)a8
{
  id v14 = a4;
  id v15 = a8;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __108__ASRelationshipManager__queue_saveRelationship_contact_withExtraRecords_activity_cloudKitGroup_completion___block_invoke;
  v18[3] = &unk_265218BA8;
  id v19 = v14;
  id v20 = v15;
  void v18[4] = self;
  id v16 = v14;
  id v17 = v15;
  [(ASRelationshipManager *)self _queue_saveRelationship:a3 contact:v16 extraRecordsToSave:a5 extraRecordIDsToDelete:0 activity:a6 cloudKitGroup:a7 completion:v18];
}

void __108__ASRelationshipManager__queue_saveRelationship_contact_withExtraRecords_activity_cloudKitGroup_completion___block_invoke(void *a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (v7 || (a2 & 1) == 0)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR)) {
      __108__ASRelationshipManager__queue_saveRelationship_contact_withExtraRecords_activity_cloudKitGroup_completion___block_invoke_cold_1();
    }
    uint64_t v13 = a1[6];
    if (v13) {
      (*(void (**)(uint64_t, void, id, void))(v13 + 16))(v13, 0, v7, 0);
    }
  }
  else
  {
    id v9 = (void *)a1[4];
    uint64_t v10 = [MEMORY[0x263EFFA08] setWithArray:v8];
    id v11 = objc_msgSend(v9, "_queue_handleSavedRecords:forContact:", v10, a1[5]);

    uint64_t v12 = a1[6];
    if (v12) {
      (*(void (**)(uint64_t, BOOL, void, void *))(v12 + 16))(v12, v11 != 0, 0, v11);
    }
  }
}

- (void)_queue_saveRelationship:(id)a3 contact:(id)a4 extraRecordsToSave:(id)a5 extraRecordIDsToDelete:(id)a6 activity:(id)a7 cloudKitGroup:(id)a8 completion:(id)a9
{
  v35[1] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a5;
  id v16 = a9;
  serialQueue = self->_serialQueue;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  dispatch_assert_queue_V2(serialQueue);
  int v21 = ASRelationshipNeedsSupportedFeaturesUpdate();
  id v22 = (os_log_t *)MEMORY[0x263F23AE0];
  if (v21)
  {
    ASLoggingInitialize();
    id v23 = *v22;
    if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v23, OS_LOG_TYPE_DEFAULT, "RelationshipManager saving relationship that requires a supported feature update, updating now", buf, 2u);
    }
    ASUpdateSupportedFeaturesForRelationship();
  }
  ASLoggingInitialize();
  uint64_t v24 = *v22;
  if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v24, OS_LOG_TYPE_DEFAULT, "RelationshipManager serializing relationship records and saving to CloudKit", buf, 2u);
  }
  id v25 = +[ASCloudKitManager relationshipZone];
  id v26 = [v14 recordWithZoneID:v25 recordEncryptionType:0];

  if (v15)
  {
    v35[0] = v26;
    id v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:1];
    uint64_t v28 = [v27 arrayByAddingObjectsFromArray:v15];
  }
  else
  {
    uint64_t v34 = v26;
    uint64_t v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudKitManager);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __133__ASRelationshipManager__queue_saveRelationship_contact_extraRecordsToSave_extraRecordIDsToDelete_activity_cloudKitGroup_completion___block_invoke;
  v31[3] = &unk_265217848;
  void v31[4] = self;
  id v32 = v16;
  id v30 = v16;
  [WeakRetained saveRecordsIntoPrivateDatabase:v28 recordIDsToDelete:v20 priority:2 activity:v19 group:v18 completion:v31];
}

void __133__ASRelationshipManager__queue_saveRelationship_contact_extraRecordsToSave_extraRecordIDsToDelete_activity_cloudKitGroup_completion___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __133__ASRelationshipManager__queue_saveRelationship_contact_extraRecordsToSave_extraRecordIDsToDelete_activity_cloudKitGroup_completion___block_invoke_2;
  v13[3] = &unk_2652189F0;
  id v10 = *(id *)(a1 + 40);
  id v15 = v8;
  id v16 = v10;
  char v17 = a2;
  id v14 = v7;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v9, v13);
}

uint64_t __133__ASRelationshipManager__queue_saveRelationship_contact_extraRecordsToSave_extraRecordIDsToDelete_activity_cloudKitGroup_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  return result;
}

- (void)_queue_addPersonWithCloudKitAddress:(id)a3 toShares:(id)a4 cloudKitGroup:(id)a5 completion:(id)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  serialQueue = self->_serialQueue;
  id v13 = a5;
  id v14 = a4;
  dispatch_assert_queue_V2(serialQueue);
  ASLoggingInitialize();
  id v15 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v10;
    _os_log_impl(&dword_2474C9000, v15, OS_LOG_TYPE_DEFAULT, "RelationshipManager adding person with cloudKitAddress %@ to my shares", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudKitManager);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __95__ASRelationshipManager__queue_addPersonWithCloudKitAddress_toShares_cloudKitGroup_completion___block_invoke;
  v18[3] = &unk_265215FA8;
  void v18[4] = self;
  id v19 = v11;
  id v17 = v11;
  [WeakRetained addParticipantWithCloudKitAddress:v10 toShares:v14 group:v13 completion:v18];
}

void __95__ASRelationshipManager__queue_addPersonWithCloudKitAddress_toShares_cloudKitGroup_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __95__ASRelationshipManager__queue_addPersonWithCloudKitAddress_toShares_cloudKitGroup_completion___block_invoke_2;
  block[3] = &unk_265218BD0;
  char v11 = a2;
  id v9 = v5;
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __95__ASRelationshipManager__queue_addPersonWithCloudKitAddress_toShares_cloudKitGroup_completion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48) && !*(void *)(a1 + 32))
  {
    ASLoggingInitialize();
    id v3 = *MEMORY[0x263F23AE0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v4 = 0;
      _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "RelationshipManager succesfully added person to shares", v4, 2u);
    }
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR)) {
      __95__ASRelationshipManager__queue_addPersonWithCloudKitAddress_toShares_cloudKitGroup_completion___block_invoke_2_cold_1();
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_queue_acceptShares:(id)a3 forRelationship:(id)a4 contact:(id)a5 cloudKitGroup:(id)a6 completion:(id)a7
{
  v42[2] = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  serialQueue = self->_serialQueue;
  id v16 = a6;
  id v17 = a3;
  dispatch_assert_queue_V2(serialQueue);
  id v18 = NSURL;
  id v19 = [v17 activityShareURL];
  id v20 = [v18 URLWithString:v19];

  id v21 = NSURL;
  uint64_t v22 = [v17 relationshipShareURL];

  id v23 = [v21 URLWithString:v22];

  v42[0] = v20;
  v42[1] = v23;
  uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:2];
  ASLoggingInitialize();
  id v25 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v41 = v24;
    _os_log_impl(&dword_2474C9000, v25, OS_LOG_TYPE_DEFAULT, "RelationshipManager accepting shares: %@", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudKitManager);
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __94__ASRelationshipManager__queue_acceptShares_forRelationship_contact_cloudKitGroup_completion___block_invoke;
  v33[3] = &unk_265218C20;
  v33[4] = self;
  id v34 = v24;
  id v38 = v13;
  id v39 = v14;
  id v35 = v12;
  id v36 = v20;
  id v37 = v23;
  id v27 = v13;
  id v28 = v23;
  id v29 = v20;
  id v30 = v12;
  id v31 = v14;
  id v32 = v24;
  [WeakRetained acceptSharesWithURLs:v32 cloudKitGroup:v16 completion:v33];
}

void __94__ASRelationshipManager__queue_acceptShares_forRelationship_contact_cloudKitGroup_completion___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __94__ASRelationshipManager__queue_acceptShares_forRelationship_contact_cloudKitGroup_completion___block_invoke_2;
  v14[3] = &unk_265218BF8;
  char v24 = a2;
  id v15 = v7;
  id v16 = *(id *)(a1 + 40);
  id v23 = *(id *)(a1 + 80);
  id v17 = *(id *)(a1 + 48);
  id v18 = v8;
  id v19 = *(id *)(a1 + 56);
  id v20 = *(id *)(a1 + 64);
  id v10 = *(id *)(a1 + 72);
  uint64_t v11 = *(void *)(a1 + 32);
  id v21 = v10;
  uint64_t v22 = v11;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v9, v14);
}

void __94__ASRelationshipManager__queue_acceptShares_forRelationship_contact_cloudKitGroup_completion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 104) && !*(void *)(a1 + 32))
  {
    ASLoggingInitialize();
    BOOL v2 = *MEMORY[0x263F23AE0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_2474C9000, v2, OS_LOG_TYPE_DEFAULT, "RelationshipManager success accepting shares", v12, 2u);
    }
    id v3 = [*(id *)(a1 + 56) objectForKeyedSubscript:*(void *)(a1 + 64)];
    BOOL v4 = [*(id *)(a1 + 56) objectForKeyedSubscript:*(void *)(a1 + 72)];
    id v5 = [v3 recordID];
    [*(id *)(a1 + 48) setRemoteActivityDataShareID:v5];

    id v6 = [v4 recordID];
    [*(id *)(a1 + 48) setRemoteRelationshipShareID:v6];

    id v7 = *(id *)(a1 + 80);
    if (!v7)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 88) + 32));
      id v9 = [*(id *)(a1 + 48) UUID];
      id v7 = [WeakRetained contactWithUUID:v9];
    }
    id v10 = [*(id *)(a1 + 80) relationshipStorage];
    [v10 setLegacyRelationship:*(void *)(a1 + 48)];
    [v7 setRelationshipStorage:v10];
    id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 88) + 32));
    [v11 saveContact:v7];

    (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR)) {
      __94__ASRelationshipManager__queue_acceptShares_forRelationship_contact_cloudKitGroup_completion___block_invoke_2_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
  }
}

- (void)_queue_reconcileCloudKitRelationships:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  ASLoggingInitialize();
  id v5 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    id v21 = v4;
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "RelationshipManager reconciling new cloudKit relationships %@", (uint8_t *)&v20, 0xCu);
  }
  id v7 = ASFilterInvalidCloudKitRelationships(v4, v6);
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  p_contactsManager = &self->_contactsManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactsManager);
  id v11 = [WeakRetained contacts];
  id v12 = ASReconcileCloudKitRelationshipsForCloudType(v7, v11, self->_currentFetchType, 0);
  id v13 = (void *)[v12 mutableCopy];

  if (ASSecureCloudEnabled())
  {
    id v14 = objc_loadWeakRetained((id *)&self->_contactsManager);
    id v15 = [v14 contacts];
    id v16 = ASReconcileCloudKitRelationshipsForCloudType(v7, v15, self->_currentFetchType, 1);
    id v17 = (void *)[v16 mutableCopy];

    uint64_t v18 = objc_msgSend(v13, "hk_dictionaryByAddingEntriesFromDictionary:", v17);

    id v13 = (void *)v18;
  }
  id v19 = objc_loadWeakRetained((id *)p_contactsManager);
  ASReconcileRelationshipsAgainstAddressBook(v13, v19);
}

- (void)_queue_processRemoteRelationships:(id)a3 activity:(id)a4 cloudKitGroup:(id)a5 completion:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  serialQueue = self->_serialQueue;
  id v14 = a6;
  dispatch_assert_queue_V2(serialQueue);
  ASLoggingInitialize();
  id v15 = (os_log_t *)MEMORY[0x263F23AE0];
  id v16 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v10;
    _os_log_impl(&dword_2474C9000, v16, OS_LOG_TYPE_DEFAULT, "RelationshipManager processing remote relationships %@", buf, 0xCu);
  }
  dispatch_group_t v17 = dispatch_group_create();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactsManager);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __93__ASRelationshipManager__queue_processRemoteRelationships_activity_cloudKitGroup_completion___block_invoke;
  v24[3] = &unk_265218CC0;
  void v24[4] = self;
  id v19 = v10;
  id v25 = v19;
  id v20 = v11;
  id v26 = v20;
  id v21 = v12;
  id v27 = v21;
  uint64_t v22 = v17;
  id v28 = v22;
  [WeakRetained setContactsUsingTransaction:v24];

  ASLoggingInitialize();
  id v23 = *v15;
  if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v23, OS_LOG_TYPE_DEFAULT, "RelationshipManager waiting for asynchronous remote processing", buf, 2u);
  }
  dispatch_group_notify(v22, (dispatch_queue_t)self->_serialQueue, v14);
}

id __93__ASRelationshipManager__queue_processRemoteRelationships_activity_cloudKitGroup_completion___block_invoke(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  id v3 = [WeakRetained contacts];

  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v42 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        id v11 = [v10 UUID];
        [v4 setObject:v10 forKeyedSubscript:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v7);
  }
  uint64_t v31 = v5;

  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __93__ASRelationshipManager__queue_processRemoteRelationships_activity_cloudKitGroup_completion___block_invoke_2;
  void v36[3] = &unk_265218C98;
  id v12 = *(void **)(a1 + 40);
  v36[4] = *(void *)(a1 + 32);
  id v13 = v4;
  id v37 = v13;
  id v38 = *(id *)(a1 + 48);
  id v39 = *(id *)(a1 + 56);
  id v40 = *(id *)(a1 + 64);
  [v12 enumerateKeysAndObjectsUsingBlock:v36];
  ASLoggingInitialize();
  id v14 = (os_log_t *)MEMORY[0x263F23AE0];
  id v15 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v15, OS_LOG_TYPE_DEFAULT, "Finished processing remote relationships, with updated contacts:", buf, 2u);
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v16 = objc_msgSend(v13, "allValues", v13);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v49 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v32 + 1) + 8 * j);
        ASLoggingInitialize();
        os_log_t v22 = *v14;
        if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
        {
          id v23 = v22;
          char v24 = [v21 displayName];
          id v25 = [v21 relationshipStorage];
          *(_DWORD *)buf = 138412546;
          id v46 = v24;
          __int16 v47 = 2112;
          id v48 = v25;
          _os_log_impl(&dword_2474C9000, v23, OS_LOG_TYPE_DEFAULT, "%@ -> %@", buf, 0x16u);
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v49 count:16];
    }
    while (v18);
  }

  id v26 = (void *)MEMORY[0x263EFFA08];
  id v27 = [v30 allValues];
  id v28 = [v26 setWithArray:v27];

  return v28;
}

void __93__ASRelationshipManager__queue_processRemoteRelationships_activity_cloudKitGroup_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (ASSecureCloudEnabled())
  {
    if ([v6 cloudType] == 1)
    {
      uint64_t v7 = [v5 zoneID];
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
      id v9 = ASContactForSecureCloudRelationshipZone(v7, WeakRetained);
    }
    else
    {
      id v13 = *(void **)(a1 + 32);
      uint64_t v7 = [v5 zoneID];
      id v9 = [v13 _contactWithRemoteRelationshipRecordZoneID:v7];
    }

    if (v9)
    {
      id v14 = *(void **)(a1 + 40);
      id v15 = [v9 UUID];
      id v11 = [v14 objectForKeyedSubscript:v15];
    }
    else
    {
      id v11 = 0;
    }
    if (v11) {
      id v16 = v11;
    }
    else {
      id v16 = v9;
    }
    id v12 = v16;
  }
  else
  {
    id v10 = *(void **)(a1 + 32);
    id v11 = [v5 zoneID];
    id v12 = [v10 _contactWithRemoteRelationshipRecordZoneID:v11];
  }

  if (v12)
  {
    uint64_t v17 = [v12 relationshipStorage];
    v61 = objc_msgSend(v17, "relationshipForCloudType:", objc_msgSend(v6, "cloudType"));

    uint64_t v18 = [v12 relationshipStorage];
    uint64_t v19 = objc_msgSend(v18, "remoteRelationshipForCloudType:", objc_msgSend(v6, "cloudType"));

    id v20 = [v12 relationshipStorage];
    id v60 = [v20 primaryRemoteRelationship];

    id v21 = [v12 relationshipStorage];
    objc_msgSend(v21, "updateRemoteRelationship:cloudType:", v6, objc_msgSend(v6, "cloudType"));
    if (ASSecureCloudEnabled())
    {
      uint64_t v22 = [v21 storageWithSynchronizedRelationshipIdentifiers];

      id v21 = (void *)v22;
    }
    [v12 setRelationshipStorage:v21];
    id v23 = *(void **)(a1 + 40);
    char v24 = [v12 UUID];
    [v23 setObject:v12 forKeyedSubscript:v24];

    ASLoggingInitialize();
    id v25 = (os_log_t *)MEMORY[0x263F23AE0];
    id v26 = (void *)*MEMORY[0x263F23AE0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
    {
      id v27 = v26;
      id v28 = [v12 UUID];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v28;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      _os_log_impl(&dword_2474C9000, v27, OS_LOG_TYPE_DEFAULT, "RelationshipManager evaluating new remote relationship for contact: %{public}@ - %@", buf, 0x16u);
    }
    ASLoggingInitialize();
    id v29 = *v25;
    if (os_log_type_enabled(*v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v6;
      _os_log_impl(&dword_2474C9000, v29, OS_LOG_TYPE_DEFAULT, "RelationshipManager new remote relationship: %@", buf, 0xCu);
    }
    ASLoggingInitialize();
    id v30 = *v25;
    if (os_log_type_enabled(*v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v19;
      _os_log_impl(&dword_2474C9000, v30, OS_LOG_TYPE_DEFAULT, "RelationshipManager previous remote relationship: %@", buf, 0xCu);
    }
    id v31 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    char v32 = [v31 hasCompletedFirstFetch];

    if ((v32 & 1) == 0)
    {
      ASLoggingInitialize();
      id v37 = *v25;
      if (os_log_type_enabled(*v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2474C9000, v37, OS_LOG_TYPE_DEFAULT, "RelationshipManager does not need to process remote relationship events, this is the first CK fetch", buf, 2u);
      }
      goto LABEL_57;
    }
    long long v33 = [v12 relationshipStorage];
    v59 = [v33 primaryRelationship];

    uint64_t v34 = [v61 cloudType];
    if (v34 != [v59 cloudType])
    {
      uint64_t v38 = [v19 cloudType];
      uint64_t v39 = [v60 cloudType];
      int v40 = [v19 secureCloudNeedsRepair];
      if ([v61 isFriendshipActive]
        && (BOOL v41 = v38 == v39, ![v6 cloudType])
        && v41 | v40)
      {
        ASLoggingInitialize();
        long long v42 = *v25;
        if (os_log_type_enabled(*v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v6;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v61;
          *(_WORD *)&buf[22] = 2112;
          v70 = v59;
          LOWORD(v71) = 2112;
          *(void *)((char *)&v71 + 2) = v60;
          _os_log_impl(&dword_2474C9000, v42, OS_LOG_TYPE_DEFAULT, "RelationshipManager received non primary relationship to process (NEW: %@\nLOCAL: %@\nPRIMARY: %@\nPRIMARY REMOTE: %@)", buf, 0x2Au);
        }
        objc_msgSend(*(id *)(a1 + 32), "_queue_processEndRelationshipIfNeededForPreviousRemoteRelationship:newRemoteRelationship:contact:xpcActivity:cloudKitGroup:processGroup:", v19, v6, v12, *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), v59);
      }
      else
      {
        ASLoggingInitialize();
        long long v43 = *v25;
        if (os_log_type_enabled(*v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v6;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v61;
          *(_WORD *)&buf[22] = 2112;
          v70 = v59;
          _os_log_impl(&dword_2474C9000, v43, OS_LOG_TYPE_DEFAULT, "RelationshipManager not processing remote relationship, not primary (NEW: %@\nLOCAL: %@\nPRIMARY: %@)", buf, 0x20u);
        }
      }
      goto LABEL_56;
    }
    if ([v61 isFriendshipActive])
    {
      objc_msgSend(*(id *)(a1 + 32), "_queue_processEndRelationshipIfNeededForPreviousRemoteRelationship:newRemoteRelationship:contact:xpcActivity:cloudKitGroup:processGroup:", v19, v6, v12, *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64));
      if (([v19 isFriendshipActive] & 1) == 0 && objc_msgSend(v6, "isFriendshipActive"))
      {
        ASLoggingInitialize();
        long long v44 = *v25;
        if (os_log_type_enabled(*v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2474C9000, v44, OS_LOG_TYPE_DEFAULT, "RelationshipManager determined this relationship began remotely", buf, 2u);
        }
        v45 = *(void **)(a1 + 32);
        id v46 = objc_msgSend(v12, "UUID", v59);
        objc_msgSend(v45, "_queue_removePlaceholderRelationshipBeganForContactWithUUID:success:", v46, 1);

        if ((ASSecureCloudEnabled() & 1) == 0) {
          goto LABEL_53;
        }
        id v47 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 152));
        uint64_t v48 = *(void *)(a1 + 32);
        id v49 = [v12 UUID];
        [v47 relationshipManager:v48 relationshipBeganForFriend:v49 completion:&__block_literal_global_406];

        goto LABEL_47;
      }
      if (ASSecureCloudEnabled())
      {
LABEL_47:
        if (((objc_msgSend(v61, "hasOutgoingSecureCloudUpgradeRequest", v59) & 1) != 0
           || [v61 secureCloudUpgradeCompleted])
          && [v6 secureCloudUpgradeFailed])
        {
          ASLoggingInitialize();
          v50 = *v25;
          if (os_log_type_enabled(*v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2474C9000, v50, OS_LOG_TYPE_DEFAULT, "RelationshipManager determined upgrade failed remotely, updating local relationship", buf, 2u);
          }
          [v61 insertEventWithType:302];
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 64));
          uint64_t v51 = *(void **)(a1 + 32);
          uint64_t v52 = *(void *)(a1 + 48);
          uint64_t v53 = *(void *)(a1 + 56);
          v67[0] = MEMORY[0x263EF8330];
          v67[1] = 3221225472;
          v67[2] = __93__ASRelationshipManager__queue_processRemoteRelationships_activity_cloudKitGroup_completion___block_invoke_407;
          v67[3] = &unk_265218C48;
          id v68 = *(id *)(a1 + 64);
          objc_msgSend(v51, "_queue_saveRelationship:contact:activity:cloudKitGroup:completion:", v61, v12, v52, v53, v67);
        }
      }
    }
LABEL_53:
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v70 = __Block_byref_object_copy__14;
    *(void *)&long long v71 = __Block_byref_object_dispose__14;
    *((void *)&v71 + 1) = v19;
    uint64_t v63 = 0;
    id v64 = &v63;
    uint64_t v65 = 0x2020000000;
    char v66 = 0;
    uint64_t v54 = [*(id *)(*(void *)&buf[8] + 40) currentRelationshipEventAnchor];
    v62[0] = MEMORY[0x263EF8330];
    v62[1] = 3221225472;
    v62[2] = __93__ASRelationshipManager__queue_processRemoteRelationships_activity_cloudKitGroup_completion___block_invoke_2_408;
    v62[3] = &unk_265218C70;
    v62[4] = buf;
    v62[5] = &v63;
    [v6 traverseRelationshipHistoryStartingAtEventWithAnchor:v54 + 1 block:v62];
    if (*((unsigned char *)v64 + 24))
    {
      id v55 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
      id v56 = [v12 UUID];
      [v55 deleteActivityDataForFriendWithUUID:v56];

      id v57 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
      id v58 = [v12 UUID];
      [v57 removeUnusedTemplatesForFriendWithUUID:v58];
    }
    _Block_object_dispose(&v63, 8);
    _Block_object_dispose(buf, 8);

LABEL_56:
LABEL_57:

    goto LABEL_58;
  }
  ASLoggingInitialize();
  long long v35 = (os_log_t *)MEMORY[0x263F23AE0];
  id v36 = (void *)*MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR)) {
    __93__ASRelationshipManager__queue_processRemoteRelationships_activity_cloudKitGroup_completion___block_invoke_2_cold_2(v36, v5);
  }
  ASLoggingInitialize();
  if (os_log_type_enabled(*v35, OS_LOG_TYPE_ERROR)) {
    __93__ASRelationshipManager__queue_processRemoteRelationships_activity_cloudKitGroup_completion___block_invoke_2_cold_1();
  }
LABEL_58:
}

void __93__ASRelationshipManager__queue_processRemoteRelationships_activity_cloudKitGroup_completion___block_invoke_404(uint64_t a1, int a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  ASLoggingInitialize();
  id v5 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = a2;
    __int16 v7 = 2112;
    id v8 = v4;
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "RelationshipManager handled relationship began on secure cloud %{BOOL}d, %@", (uint8_t *)v6, 0x12u);
  }
}

void __93__ASRelationshipManager__queue_processRemoteRelationships_activity_cloudKitGroup_completion___block_invoke_407(uint64_t a1)
{
}

void __93__ASRelationshipManager__queue_processRemoteRelationships_activity_cloudKitGroup_completion___block_invoke_2_408(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  ASLoggingInitialize();
  id v4 = (os_log_t *)MEMORY[0x263F23AE0];
  id v5 = (void *)*MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    int v10 = 134217984;
    uint64_t v11 = [v3 currentRelationshipEventAnchor];
    _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "RelationshipManager traversing new events at anchor %lu", (uint8_t *)&v10, 0xCu);
  }
  if (_IsRelationshipTransitioningToInactive(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v3))
  {
    ASLoggingInitialize();
    __int16 v7 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_2474C9000, v7, OS_LOG_TYPE_DEFAULT, "RelationshipManager detected a friendship that was ended remotely, local activity data should be deleted", (uint8_t *)&v10, 2u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

- (void)_queue_processEndRelationshipIfNeededForPreviousRemoteRelationship:(id)a3 newRemoteRelationship:(id)a4 contact:(id)a5 xpcActivity:(id)a6 cloudKitGroup:(id)a7 processGroup:(id)a8
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = a8;
  id v18 = a4;
  id v19 = a3;
  ASLoggingInitialize();
  id v20 = (os_log_t *)MEMORY[0x263F23AE0];
  id v21 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v21, OS_LOG_TYPE_DEFAULT, "RelationshipManager local friendship is active, comparing final remote state with previous remote relationship", buf, 2u);
  }
  int IsRelationshipTransitioningToInactive = _IsRelationshipTransitioningToInactive(v19, v18);

  int v23 = [v18 hasIncomingInviteRequest];
  ASLoggingInitialize();
  char v24 = *v20;
  if (os_log_type_enabled(*v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v30 = v23;
    _os_log_impl(&dword_2474C9000, v24, OS_LOG_TYPE_DEFAULT, "RelationshipManager checking if another invite flow is in progress: %d", buf, 8u);
  }
  if (((IsRelationshipTransitioningToInactive ^ 1 | v23) & 1) == 0)
  {
    ASLoggingInitialize();
    id v25 = *v20;
    if (os_log_type_enabled(*v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v25, OS_LOG_TYPE_DEFAULT, "RelationshipManager determined this relationship was ended remotely", buf, 2u);
    }
    dispatch_group_enter(v17);
    id v26 = [v14 UUID];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    void v27[2] = __161__ASRelationshipManager__queue_processEndRelationshipIfNeededForPreviousRemoteRelationship_newRemoteRelationship_contact_xpcActivity_cloudKitGroup_processGroup___block_invoke;
    v27[3] = &unk_2652167B8;
    id v28 = v17;
    [(ASRelationshipManager *)self _queue_removeFriendWithUUID:v26 eventType:104 activity:v15 cloudKitGroup:v16 completion:v27];
  }
}

void __161__ASRelationshipManager__queue_processEndRelationshipIfNeededForPreviousRemoteRelationship_newRemoteRelationship_contact_xpcActivity_cloudKitGroup_processGroup___block_invoke(uint64_t a1)
{
}

- (void)_contactStoreDidChangeNotification:(id)a3
{
  ASLoggingInitialize();
  id v4 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v4, OS_LOG_TYPE_DEFAULT, "RelationshipManager observed contact store change", buf, 2u);
  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__ASRelationshipManager__contactStoreDidChangeNotification___block_invoke;
  block[3] = &unk_2652157F0;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

void __60__ASRelationshipManager__contactStoreDidChangeNotification___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 136);
  ASLoggingInitialize();
  id v3 = *MEMORY[0x263F23AE0];
  BOOL v4 = os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "RelationshipManager reconcile for new contacts already scheduled", buf, 2u);
    }
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "RelationshipManager scheduling new reconcile for contact store change", buf, 2u);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 136) = 1;
    dispatch_time_t v5 = dispatch_time(0, 3000000000);
    uint64_t v6 = *(void *)(a1 + 32);
    __int16 v7 = *(NSObject **)(v6 + 96);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__ASRelationshipManager__contactStoreDidChangeNotification___block_invoke_412;
    block[3] = &unk_2652157F0;
    void block[4] = v6;
    dispatch_after(v5, v7, block);
  }
}

uint64_t __60__ASRelationshipManager__contactStoreDidChangeNotification___block_invoke_412(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(void **)(v1 + 80);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__ASRelationshipManager__contactStoreDidChangeNotification___block_invoke_2;
  v4[3] = &unk_265218CE8;
  v4[4] = v1;
  return [v2 performTransaction:v4];
}

void __60__ASRelationshipManager__contactStoreDidChangeNotification___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  ASLoggingInitialize();
  BOOL v4 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_2474C9000, v4, OS_LOG_TYPE_DEFAULT, "RelationshipManager firing new reconcile for contact store change", v11, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  uint64_t v6 = [WeakRetained contacts];

  __int16 v7 = ASAllRelationshipsByRecordIDForCloudType(v6, 0);
  if (ASSecureCloudEnabled())
  {
    uint64_t v8 = ASAllRelationshipsByRecordIDForCloudType(v6, 1);
    uint64_t v9 = objc_msgSend(v7, "hk_dictionaryByAddingEntriesFromDictionary:", v8);

    __int16 v7 = (void *)v9;
  }
  id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  ASReconcileRelationshipsAgainstAddressBook(v7, v10);

  *(unsigned char *)(*(void *)(a1 + 32) + 136) = 0;
  v3[2](v3);
}

- (void)_processActivityDataPreview:(id)a3 friendUUID:(id)a4
{
  p_activityDataManager = &self->_activityDataManager;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_activityDataManager);
  ASProcessActivityDataPreviewWithManager(v7, v6, WeakRetained);
}

- (id)_currentActivityDataPreview
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityDataManager);
  id v3 = ASMakeActivityDataPreviewWithManager(WeakRetained);

  return v3;
}

- (void)friendInviteBulletinManagerDidReceiveActionResponse:(int64_t)a3 fromContactWithUUID:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  ASLoggingInitialize();
  id v7 = (os_log_t *)MEMORY[0x263F23AE0];
  uint64_t v8 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v21 = a3;
    _os_log_impl(&dword_2474C9000, v8, OS_LOG_TYPE_DEFAULT, "RelationshipManager received notification action response: %ld in ASActivitySharingManager", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactsManager);
  id v10 = [WeakRetained contactWithUUID:v6];

  if (v10)
  {
    if (a3 == 1)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_gatewayManager);
      int v12 = [v11 hasReachedMaximumNumberOfFriends];

      if (v12)
      {
        id v13 = objc_loadWeakRetained((id *)&self->_friendInviteBulletinManager);
        [v13 showMaxNumberOfFriendsError];
      }
      else
      {
        if ([v10 cloudType] == 1)
        {
          id v14 = objc_loadWeakRetained((id *)&self->_secureCloudDelegate);
          v18[0] = MEMORY[0x263EF8330];
          v18[1] = 3221225472;
          v18[2] = __97__ASRelationshipManager_friendInviteBulletinManagerDidReceiveActionResponse_fromContactWithUUID___block_invoke;
          v18[3] = &unk_2652168A8;
          void v18[4] = self;
          id v19 = v10;
          [v14 relationshipManager:self acceptedInviteForFriend:v6 completion:v18];

          id v15 = v19;
        }
        else
        {
          v16[0] = MEMORY[0x263EF8330];
          v16[1] = 3221225472;
          v16[2] = __97__ASRelationshipManager_friendInviteBulletinManagerDidReceiveActionResponse_fromContactWithUUID___block_invoke_2;
          v16[3] = &unk_2652168A8;
          void v16[4] = self;
          id v17 = v10;
          [(ASRelationshipManager *)self acceptInviteRequestFromFriendWithUUID:v6 completion:v16];
          id v15 = v17;
        }
      }
    }
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
      -[ASRelationshipManager notificationManager:didReceiveActionResponse:fromContactWithUUID:]();
    }
  }
}

void __97__ASRelationshipManager_friendInviteBulletinManagerDidReceiveActionResponse_fromContactWithUUID___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  if (a3 || (a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
    [WeakRetained showErrorAcceptingInviteFrom:*(void *)(a1 + 40)];
  }
}

void __97__ASRelationshipManager_friendInviteBulletinManagerDidReceiveActionResponse_fromContactWithUUID___block_invoke_2(uint64_t a1, char a2, uint64_t a3)
{
  if (a3 || (a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
    [WeakRetained showErrorAcceptingInviteFrom:*(void *)(a1 + 40)];
  }
}

- (id)_relationshipFromContact:(id)a3
{
  id v3 = [a3 relationshipStorage];
  BOOL v4 = [v3 legacyRelationship];

  return v4;
}

- (id)_remoteRelationshipFromContact:(id)a3
{
  id v3 = [a3 relationshipStorage];
  BOOL v4 = [v3 legacyRemoteRelationship];

  return v4;
}

- (ASRelationshipManagerSecureCloudDelegate)secureCloudDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_secureCloudDelegate);
  return (ASRelationshipManagerSecureCloudDelegate *)WeakRetained;
}

- (void)setSecureCloudDelegate:(id)a3
{
}

- (NSDictionary)messageCenters
{
  return self->_messageCenters;
}

- (void)setMessageCenters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageCenters, 0);
  objc_destroyWeak((id *)&self->_secureCloudDelegate);
  objc_storeStrong((id *)&self->_finalizingStore, 0);
  objc_storeStrong((id *)&self->_placeholderFriendshipBeganTokens, 0);
  objc_storeStrong((id *)&self->_remoteRelationshipRecordsToProcess, 0);
  objc_storeStrong((id *)&self->_relationshipRecordsToReconcile, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_transactionQueue, 0);
  objc_storeStrong((id *)&self->_fitnessAppsStateObserver, 0);
  objc_destroyWeak((id *)&self->_bulletinPostingManager);
  objc_destroyWeak((id *)&self->_gatewayManager);
  objc_destroyWeak((id *)&self->_friendListManager);
  objc_destroyWeak((id *)&self->_friendInviteBulletinManager);
  objc_destroyWeak((id *)&self->_contactsManager);
  objc_destroyWeak((id *)&self->_cloudKitManager);
  objc_destroyWeak((id *)&self->_activityDataManager);
  objc_destroyWeak((id *)&self->_achievementManager);
}

void __100__ASRelationshipManager_setActivityDataVisible_toFriendWithUUID_eventType_cloudKitGroup_completion___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2474C9000, v0, v1, "RelationshipManager not changing activity data visibility - already matches current visibility", v2, v3, v4, v5, v6);
}

void __100__ASRelationshipManager_setActivityDataVisible_toFriendWithUUID_eventType_cloudKitGroup_completion___block_invoke_2_326_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2474C9000, v0, v1, "Failed to fetch activity data share.", v2, v3, v4, v5, v6);
}

void __100__ASRelationshipManager_setActivityDataVisible_toFriendWithUUID_eventType_cloudKitGroup_completion___block_invoke_4_328_cold_1(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_7() cloudKitAddress];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_3(&dword_2474C9000, v2, v5, "Failed to fetch share participant with email %@.", v6);
}

void __100__ASRelationshipManager_setActivityDataVisible_toFriendWithUUID_eventType_cloudKitGroup_completion___block_invoke_4_328_cold_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_7() cloudKitAddress];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_3(&dword_2474C9000, v2, v5, "Could not find participant with email %@ on share.", v6);
}

void __69__ASRelationshipManager_setMuteEnabled_forFriendWithUUID_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2474C9000, v0, v1, "RelationshipManager could not change muting - contact not found.", v2, v3, v4, v5, v6);
}

void __69__ASRelationshipManager_setMuteEnabled_forFriendWithUUID_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2474C9000, v0, v1, "RelationshipManager not changing muting - already matches current state", v2, v3, v4, v5, v6);
}

void __109__ASRelationshipManager_updateRelationshipWithCompetitionEvent_friendUUID_activity_cloudKitGroup_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2474C9000, v0, v1, "RelationshipManager cannot insert competition for friendship that is not active", v2, v3, v4, v5, v6);
}

void __106__ASRelationshipManager_updateRelationshipsForCurrentFeatureSupportWithActivity_cloudKitGroup_completion___block_invoke_2_cold_1(_DWORD *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  uint64_t v8 = [a3 UUID];
  *a1 = 138543362;
  *a4 = v8;
  OUTLINED_FUNCTION_0_2(&dword_2474C9000, v9, v10, "RelationshipManager error processing saved relationship, couldn't find contact with relationship UUID: %{public}@");
}

- (void)sendInviteToPersonWithDestination:callerID:serviceIdentifier:completion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2474C9000, v0, v1, "RelationshipManager error: max number of friends reached", v2, v3, v4, v5, v6);
}

void __74__ASRelationshipManager_acceptInviteRequestFromFriendWithUUID_completion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2474C9000, v0, v1, "RelationshipManager couldn't find a contact with the given UUID", v2, v3, v4, v5, v6);
}

void __74__ASRelationshipManager_acceptInviteRequestFromFriendWithUUID_completion___block_invoke_3_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "RelationshipManager error sending invite response: %{public}@", v2, v3, v4, v5, v6);
}

- (void)sendWithdrawInviteRequestToFriendWithUUID:completion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2474C9000, v0, v1, "RelationshipManager couldn't find a person with the given UUID", v2, v3, v4, v5, v6);
}

void __74__ASRelationshipManager_ignoreInviteRequestFromFriendWithUUID_completion___block_invoke_cold_2(void *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_7() relationshipEvents];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_3(&dword_2474C9000, v1, v4, "RelationshipManager not able to ignore invite, relationship doesn't have pending incoming request, status: %@", v5);
}

void __122__ASRelationshipManager_messageCenter_didReceiveInviteRequest_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "Could not determine gateway status: %{public}@, persisting message", v2, v3, v4, v5, v6);
}

void __122__ASRelationshipManager_messageCenter_didReceiveInviteRequest_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_3_cold_1(void *a1, void *a2, id *a3)
{
  uint64_t v4 = (id *)(*a1 + 56);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained inviteCompatibilityVersion];
  [*a3 inviterVersion];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_10(&dword_2474C9000, v7, v8, "RelationshipManager received an incompatible invite (current version = %d, inviter version = %d)", v9, v10, v11, v12, v13);
}

void __123__ASRelationshipManager_messageCenter_didReceiveInviteResponse_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_7() handshakeToken];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_3(&dword_2474C9000, v2, v5, "RelationshipManager couldn't find previously invited friend with token: %@", v6);
}

void __123__ASRelationshipManager_messageCenter_didReceiveInviteResponse_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "RelationshipManager rejecting invite response because relationship doesn't have a pending outgoing invite request, current state is: %{public}@", v2, v3, v4, v5, v6);
}

void __123__ASRelationshipManager_messageCenter_didReceiveInviteResponse_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_2_cold_3(void *a1, void *a2, id *a3)
{
  uint64_t v4 = (id *)(*a1 + 56);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained inviteCompatibilityVersion];
  [*a3 inviteeVersion];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_10(&dword_2474C9000, v7, v8, "RelationshipManager received an incompatible response (current version = %d, invitee version = %d)", v9, v10, v11, v12, v13);
}

void __126__ASRelationshipManager_messageCenter_didReceiveFinalizeHandshake_fromSenderAddress_receiverAddress_messageHandledCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "RelationshipManager not finalizing, relationship doesn't has incoming invite request: %@", v2, v3, v4, v5, v6);
}

void __153__ASRelationshipManager_cloudKitManager_didReceiveNewRemoteRelationships_fromRecordZoneWithID_moreComing_activity_cloudKitGroup_changesProcessedHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2474C9000, v0, v1, "RelationshipManager received multiple remote relationship records for a single share from CloudKitManager, taking only the newest", v2, v3, v4, v5, v6);
}

- (void)notificationManager:didReceiveActionResponse:fromContactWithUUID:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "Relationship manager couldn't find person with UUID: %{public}@", v2, v3, v4, v5, v6);
}

void __58__ASRelationshipManager__processPersistedMessagesIfNeeded__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "RelationshipManager could not determine status for processing persisted invitations: %{public}@", v2, v3, v4, v5, v6);
}

void __103__ASRelationshipManager__queue_removeLegacyFriendWithUUID_eventType_activity_cloudKitGroup_completion___block_invoke_381_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "RelationshipManager error removing friend from activity data share (could not fetch share): %{public}@", v2, v3, v4, v5, v6);
}

void __103__ASRelationshipManager__queue_removeLegacyFriendWithUUID_eventType_activity_cloudKitGroup_completion___block_invoke_3_383_cold_1()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "RelationshipManager error removing friend from activity data share (could not remove participant): %{public}@", v2, v3, v4, v5, v6);
}

void __84__ASRelationshipManager__queue_fetchSharesForRelationship_cloudKitGroup_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "RelationshipManager error fetching activity data share: %{public}@", v2, v3, v4, v5, v6);
}

void __84__ASRelationshipManager__queue_fetchSharesForRelationship_cloudKitGroup_completion___block_invoke_394_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "RelationshipManager error fetching relationship share: %{public}@", v2, v3, v4, v5, v6);
}

void __104__ASRelationshipManager__queue_saveRelationshipAndFetchOrCreateShares_contact_cloudKitGroup_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "RelationshipManager error fetching/creating activity data share when saving new relationship: %{public}@", v2, v3, v4, v5, v6);
}

void __104__ASRelationshipManager__queue_saveRelationshipAndFetchOrCreateShares_contact_cloudKitGroup_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "RelationshipManager error creating or fetching relationship share: %{public}@", v2, v3, v4, v5, v6);
}

void __104__ASRelationshipManager__queue_saveRelationshipAndFetchOrCreateShares_contact_cloudKitGroup_completion___block_invoke_2_399_cold_1()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "RelationshipManager error saving relationship record for share in CloudKit: %{public}@", v2, v3, v4, v5, v6);
}

void __108__ASRelationshipManager__queue_saveRelationship_contact_withExtraRecords_activity_cloudKitGroup_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "RelationshipManager error saving relationship record in CloudKit: %{public}@", v2, v3, v4, v5, v6);
}

void __95__ASRelationshipManager__queue_addPersonWithCloudKitAddress_toShares_cloudKitGroup_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "RelationshipManager error adding person to shares: %{public}@", v2, v3, v4, v5, v6);
}

void __94__ASRelationshipManager__queue_acceptShares_forRelationship_contact_cloudKitGroup_completion___block_invoke_2_cold_1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6_0();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_2474C9000, v1, OS_LOG_TYPE_ERROR, "RelationshipManager error accepting invitee shares %@, error: %{public}@", v2, 0x16u);
}

void __93__ASRelationshipManager__queue_processRemoteRelationships_activity_cloudKitGroup_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "RelationshipManager orphaned remote relationship: %@", v2, v3, v4, v5, v6);
}

void __93__ASRelationshipManager__queue_processRemoteRelationships_activity_cloudKitGroup_completion___block_invoke_2_cold_2(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 zoneID];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_3(&dword_2474C9000, v3, v5, "RelationshipManager unable to find contact with remote relationship zone ID: %@", v6);
}

@end