@interface ASCompetitionManager
- (ASCompetitionManager)initWithDatabaseClient:(id)a3 isWatch:(BOOL)a4;
- (ASCompetitionManagerSecureCloudDelegate)secureCloudDelegate;
- (BOOL)_shouldSkipLocalLegacyCompetitionList:(id)a3;
- (BOOL)_shouldSkipLocalSecureCloudCompetitionList:(id)a3;
- (BOOL)_shouldSkipRemoteLegacyCompetitionList:(id)a3 contact:(id)a4;
- (BOOL)isReadyToProcessChanges;
- (id)_archivedCompetitionListByMergingCurrentCompetitionList:(id)a3;
- (id)_competitionListsFromContacts:(id)a3 withUpdatedScore:(id)a4 cloudType:(unint64_t)a5;
- (id)_contactsWithActiveCompetitions;
- (id)_loadOrCreateCurrentCompetitionListForFriendWithUUID:(id)a3;
- (id)_localCompetitionForRemoteCompetition:(id)a3 friendUUID:(id)a4;
- (id)_localUserDefaultsDomain;
- (id)_queue_competitionListsToSaveForCloudType:(unint64_t)a3;
- (id)_queue_legacyCompetitionListsToSave;
- (id)_queue_rollCompetitionListForwardForContact:(id)a3;
- (id)_queue_secureCloudCompetitionListsToSave;
- (id)_scoreCapCelebrationAnchor;
- (id)archivedCompetitionListForFriendWithUUID:(id)a3;
- (id)competitionsForFriendWithUUID:(id)a3;
- (id)currentCompetitionListForFriendWithUUID:(id)a3;
- (id)recordForCurrentCompetitionList:(id)a3 contact:(id)a4;
- (id)recordIDsToDelete;
- (id)recordsToSave;
- (id)secureCloudCompetitionListsToSave;
- (int64_t)_queue_rollIndexBackwards:(int64_t)a3 calendar:(id)a4;
- (void)_handleAcceptedCompetitionFromFriendWithUUID:(id)a3 activity:(id)a4 cloudKitGroup:(id)a5;
- (void)_handleCompetitionRequestFromFriendWithUUID:(id)a3 activity:(id)a4 cloudKitGroup:(id)a5;
- (void)_loadCachedCompetitionsAndNotifyObservers;
- (void)_queue_autoAcceptCompetitionRequestFromContact:(id)a3 activity:(id)a4 cloudKitGroup:(id)a5 completion:(id)a6;
- (void)_queue_cleanUpLegacyCompetitionLists:(id)a3 activity:(id)a4 cloudKitGroup:(id)a5;
- (void)_queue_cleanUpSecureCloudCompetitionLists:(id)a3 activity:(id)a4 cloudKitGroup:(id)a5;
- (void)_queue_completeCompetitionIfNecessaryForFriendWithUUID:(id)a3 activity:(id)a4 cloudKitGroup:(id)a5;
- (void)_queue_handleNewRemoteCompetitionList:(id)a3 contact:(id)a4;
- (void)_queue_handleSavedCompetitionListRecords:(id)a3;
- (void)_queue_handleSavedRecords:(id)a3 activity:(id)a4 group:(id)a5;
- (void)_queue_notifyObserversOfCompetitionUpdatesForFriendsWithUUIDs:(id)a3;
- (void)_queue_setActivityDataVisibleIfNecessaryForContact:(id)a3 completion:(id)a4;
- (void)_queue_showCompetitionAcceptedForFriendWithUUID:(id)a3 competition:(id)a4;
- (void)_queue_showCompetitionEndedWithFriendWithUUID:(id)a3;
- (void)_queue_showCompetitionRequestFromFriendWithUUID:(id)a3 competition:(id)a4;
- (void)_queue_showScoreCapCelebrationForFriendsWithCappedInProgressCompetitions:(id)a3;
- (void)_queue_updateLegacyCompetitionsWithScores:(id)a3 forContacts:(id)a4 completion:(id)a5;
- (void)_queue_updateScoresWithTodaySummary:(id)a3 yesterdaySummary:(id)a4 activity:(id)a5 cloudKitGroup:(id)a6;
- (void)_queue_updateSecureCloudCompetitionsWithScores:(id)a3 forContacts:(id)a4 completion:(id)a5;
- (void)_saveCurrentCompetitionList:(id)a3 archivedCompetitionList:(id)a4 contact:(id)a5 activity:(id)a6 cloudKitGroup:(id)a7 completion:(id)a8;
- (void)_saveLegacyCompetitionList:(id)a3 archivedCompetitionList:(id)a4 contact:(id)a5 activity:(id)a6 cloudKitGroup:(id)a7 completion:(id)a8;
- (void)_saveSecureCloudCompetitionList:(id)a3 archivedCompetitionList:(id)a4 contact:(id)a5 cloudKitGroup:(id)a6 completion:(id)a7;
- (void)_scoreCapCelebrationAnchor;
- (void)_setScoreCapCelebrationAnchor:(id)a3;
- (void)acceptCompetitionRequestFromFriendWithUUID:(id)a3 completion:(id)a4;
- (void)activityDataManager:(id)a3 didUpdateTodaySummary:(id)a4 yesterdaySummary:(id)a5;
- (void)activitySharingManagerReady:(id)a3;
- (void)addObserver:(id)a3;
- (void)cloudKitManager:(id)a3 didBeginUpdatesForFetchWithType:(int64_t)a4;
- (void)cloudKitManager:(id)a3 didEndUpdatesForFetchWithType:(int64_t)a4 activity:(id)a5 cloudKitGroup:(id)a6 changesProcessedHandler:(id)a7;
- (void)cloudKitManager:(id)a3 didReceiveNewCompetitionLists:(id)a4 moreComing:(BOOL)a5 changesProcessedHandler:(id)a6;
- (void)cloudKitManager:(id)a3 didReceiveNewCompetitionListsForSelf:(id)a4 moreComing:(BOOL)a5 changesProcessedHandler:(id)a6;
- (void)completeCompetitionWithFriendWithUUID:(id)a3 completion:(id)a4;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)deleteCachedCompetitions;
- (void)ignoreCompetitionRequestFromFriendWithUUID:(id)a3 completion:(id)a4;
- (void)loadCachedCompetitions;
- (void)periodicUpdateManager:(id)a3 didSaveRecords:(id)a4 activity:(id)a5;
- (void)removeObserver:(id)a3;
- (void)rollCompetitionWithFriendWithUUID:(id)a3 completion:(id)a4;
- (void)secureCloudDidFailToSaveRecords:(id)a3;
- (void)secureCloudDidSaveRecords:(id)a3;
- (void)sendCompetitionRequestToFriendWithUUID:(id)a3 completion:(id)a4;
- (void)setSecureCloudDelegate:(id)a3;
- (void)storePushedCompetitionListRecords:(id)a3;
- (void)updateAllActiveCompetitionsWithScores:(id)a3 completion:(id)a4;
@end

@implementation ASCompetitionManager

- (ASCompetitionManager)initWithDatabaseClient:(id)a3 isWatch:(BOOL)a4
{
  id v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ASCompetitionManager;
  v8 = [(ASCompetitionManager *)&v19 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_databaseClient, a3);
    uint64_t v10 = HKCreateSerialUtilityDispatchQueue();
    serialQueue = v9->_serialQueue;
    v9->_serialQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = HKCreateSerialUtilityDispatchQueue();
    observerQueue = v9->_observerQueue;
    v9->_observerQueue = (OS_dispatch_queue *)v12;

    v14 = [[ASAsyncTransactionQueue alloc] initWithDescription:@"CompetitionManagerTransaction" targetSerialQueue:v9->_serialQueue];
    transactionQueue = v9->_transactionQueue;
    v9->_transactionQueue = v14;

    uint64_t v16 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v9->_observers;
    v9->_observers = (NSHashTable *)v16;

    v9->_deviceParticipatesInAutomaticCompetitionManagement = a4;
  }

  return v9;
}

- (void)activitySharingManagerReady:(id)a3
{
  id v4 = a3;
  v5 = [v4 achievementManager];
  objc_storeWeak((id *)&self->_achievementManager, v5);

  v6 = [v4 competitionBulletinManager];
  objc_storeWeak((id *)&self->_competitionBulletinManager, v6);

  id v7 = [v4 contactsManager];
  objc_storeWeak((id *)&self->_contactsManager, v7);

  v8 = [v4 friendListManager];
  objc_storeWeak((id *)&self->_friendListManager, v8);

  v9 = [v4 relationshipManager];
  objc_storeWeak((id *)&self->_relationshipManager, v9);

  uint64_t v10 = [v4 activityDataManager];
  objc_storeWeak((id *)&self->_activityDataManager, v10);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityDataManager);
  [WeakRetained addObserver:self];

  uint64_t v12 = [v4 cloudKitManager];
  objc_storeWeak((id *)&self->_cloudKitManager, v12);

  id v13 = objc_loadWeakRetained((id *)&self->_cloudKitManager);
  [v13 addObserver:self];

  v14 = [v4 periodicUpdateManager];

  objc_storeWeak((id *)&self->_periodicUpdateManager, v14);
  id v15 = objc_loadWeakRetained((id *)&self->_periodicUpdateManager);
  [v15 addProvider:self];

  self->_competitionStore = [[ASCompetitionStore alloc] initWithDatabaseClient:self->_databaseClient];
  MEMORY[0x270F9A758]();
}

- (void)loadCachedCompetitions
{
  ASLoggingInitialize();
  v3 = *MEMORY[0x263F23AB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "CompetitionManager attempting to load cached competitions", v4, 2u);
  }
  [(ASDatabaseClient *)self->_databaseClient addProtectedDataObserver:self];
  [(ASCompetitionManager *)self _loadCachedCompetitionsAndNotifyObservers];
}

- (void)deleteCachedCompetitions
{
  ASLoggingInitialize();
  v3 = *MEMORY[0x263F23AB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "CompetitionManager deleting all cached competitions", v4, 2u);
  }
  [(ASCompetitionStore *)self->_competitionStore deleteCachedCompetitions];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__ASCompetitionManager_addObserver___block_invoke;
  v7[3] = &unk_2652157C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(observerQueue, v7);
}

uint64_t __36__ASCompetitionManager_addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) addObject:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__ASCompetitionManager_removeObserver___block_invoke;
  v7[3] = &unk_2652157C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(observerQueue, v7);
}

uint64_t __39__ASCompetitionManager_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) removeObject:*(void *)(a1 + 40)];
}

- (void)sendCompetitionRequestToFriendWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  ASLoggingInitialize();
  id v8 = *MEMORY[0x263F23AB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v28 = v6;
    _os_log_impl(&dword_2474C9000, v8, OS_LOG_TYPE_DEFAULT, "CompetitionManager attempting to send competition request to friend: %{public}@", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_relationshipManager);
  uint64_t v10 = [WeakRetained insertPlaceholderRelationshipEvent:10 friendUUID:v6];

  id v11 = objc_loadWeakRetained((id *)&self->_relationshipManager);
  uint64_t v12 = [v11 insertPlaceholderRelationshipEvent:6 friendUUID:v6];

  id v13 = ASCloudKitGroupUserActionExplicit();
  id v14 = objc_loadWeakRetained((id *)&self->_cloudKitManager);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __74__ASCompetitionManager_sendCompetitionRequestToFriendWithUUID_completion___block_invoke;
  v20[3] = &unk_265217668;
  v20[4] = self;
  id v21 = v10;
  id v22 = v12;
  id v23 = v6;
  id v24 = v13;
  id v25 = v7;
  __int16 v26 = 10;
  id v15 = v13;
  id v16 = v6;
  id v17 = v7;
  id v18 = v12;
  id v19 = v10;
  [v14 fetchAllChangesWithPriority:2 activity:0 group:v15 completion:v20];
}

void __74__ASCompetitionManager_sendCompetitionRequestToFriendWithUUID_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v5 || (a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v6 + 64));
    [WeakRetained removePlaceholderRelationshipEventWithToken:*(void *)(a1 + 40)];

    id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    [v9 removePlaceholderRelationshipEventWithToken:*(void *)(a1 + 48)];

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    id v7 = *(void **)(v6 + 88);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __74__ASCompetitionManager_sendCompetitionRequestToFriendWithUUID_completion___block_invoke_2;
    v10[3] = &unk_265217640;
    v10[4] = v6;
    id v11 = *(id *)(a1 + 40);
    id v12 = *(id *)(a1 + 48);
    id v15 = *(id *)(a1 + 72);
    id v13 = *(id *)(a1 + 56);
    id v14 = *(id *)(a1 + 64);
    __int16 v16 = *(_WORD *)(a1 + 80);
    [v7 performTransaction:v10];
  }
}

void __74__ASCompetitionManager_sendCompetitionRequestToFriendWithUUID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  ASLoggingInitialize();
  id v4 = *MEMORY[0x263F23AB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v4, OS_LOG_TYPE_DEFAULT, "CompetitionManager fetch complete, proceeding with send competition request", buf, 2u);
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __74__ASCompetitionManager_sendCompetitionRequestToFriendWithUUID_completion___block_invoke_295;
  v17[3] = &unk_2652175C8;
  id v5 = *(void **)(a1 + 40);
  v17[4] = *(void *)(a1 + 32);
  id v18 = v5;
  id v19 = *(id *)(a1 + 48);
  id v20 = *(id *)(a1 + 72);
  id v21 = v3;
  id v6 = v3;
  id v7 = (void *)MEMORY[0x24C557E50](v17);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  id v9 = [WeakRetained contactWithUUID:*(void *)(a1 + 56)];

  uint64_t v10 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74__ASCompetitionManager_sendCompetitionRequestToFriendWithUUID_completion___block_invoke_2_297;
  v12[3] = &unk_265217618;
  id v15 = v7;
  v12[4] = v10;
  id v13 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 64);
  __int16 v16 = *(_WORD *)(a1 + 80);
  id v11 = v7;
  objc_msgSend(v10, "_queue_setActivityDataVisibleIfNecessaryForContact:completion:", v9, v12);
}

uint64_t __74__ASCompetitionManager_sendCompetitionRequestToFriendWithUUID_completion___block_invoke_295(void *a1, uint64_t a2, void *a3)
{
  id v4 = (id *)(a1[4] + 64);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained removePlaceholderRelationshipEventWithToken:a1[5]];

  id v7 = objc_loadWeakRetained((id *)(a1[4] + 64));
  [v7 removePlaceholderRelationshipEventWithToken:a1[6]];

  (*(void (**)(void))(a1[7] + 16))();
  id v8 = *(uint64_t (**)(void))(a1[8] + 16);
  return v8();
}

void __74__ASCompetitionManager_sendCompetitionRequestToFriendWithUUID_completion___block_invoke_2_297(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  ASLoggingInitialize();
  id v9 = (os_log_t *)MEMORY[0x263F23AB0];
  uint64_t v10 = *MEMORY[0x263F23AB0];
  if (v7 || (a2 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_ERROR)) {
      __74__ASCompetitionManager_sendCompetitionRequestToFriendWithUUID_completion___block_invoke_2_297_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v10, OS_LOG_TYPE_DEFAULT, "CompetitionManager checking friend eligibility", buf, 2u);
    }
    uint64_t v51 = 0;
    char v11 = ASValidateEligibilityForOutgoingCompetitionRequest();
    id v12 = 0;
    if (v11)
    {
      id v13 = [*(id *)(a1 + 32) _loadOrCreateCurrentCompetitionListForFriendWithUUID:*(void *)(a1 + 40)];
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
      uint64_t v44 = [WeakRetained friendWithUUID:*(void *)(a1 + 40)];

      id v15 = [v8 primaryRelationship];
      int v16 = [v15 hasCompletedCompetition];

      if (v16)
      {
        ASLoggingInitialize();
        id v17 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2474C9000, v17, OS_LOG_TYPE_DEFAULT, "CompetitionManager relationship has completed competition, archiving and copying previous badge style", buf, 2u);
        }
        id v18 = [v13 currentCompetition];
        v45 = [v18 preferredVictoryBadgeStyles];

        id v19 = [*(id *)(a1 + 32) _archivedCompetitionListByMergingCurrentCompetitionList:v13];
        id v20 = (void *)v44;
      }
      else
      {
        id v21 = [*(id *)(*(void *)(a1 + 32) + 80) archivedCompetitionListForFriendWithUUID:*(void *)(a1 + 40)];
        id v22 = [v21 competitions];
        uint64_t v23 = [v22 count];

        ASLoggingInitialize();
        id v24 = *v9;
        BOOL v25 = os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT);
        if (v23)
        {
          if (v25)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2474C9000, v24, OS_LOG_TYPE_DEFAULT, "CompetitionManager relationship has archived competitions, copying previous badge style", buf, 2u);
          }
          __int16 v26 = [v21 competitions];
          v27 = [v26 lastObject];
          v45 = [v27 preferredVictoryBadgeStyles];
          id v20 = (void *)v44;
        }
        else
        {
          if (v25)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2474C9000, v24, OS_LOG_TYPE_DEFAULT, "CompetitionManager relationship doesn't have a previous competition, generating preferred badge styles", buf, 2u);
          }
          __int16 v26 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
          v27 = [v26 friends];
          id v20 = (void *)v44;
          v45 = ASPreferredCompetitionVictoryBadgeStylesForFriend();
        }

        id v19 = 0;
      }
      ASLoggingInitialize();
      os_log_t v28 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        id v29 = v12;
        v30 = *(void **)(a1 + 40);
        v31 = v28;
        v32 = [v8 displayName];
        *(_DWORD *)buf = 138543618;
        id v54 = v30;
        id v12 = v29;
        id v20 = (void *)v44;
        __int16 v55 = 2112;
        v56 = v32;
        _os_log_impl(&dword_2474C9000, v31, OS_LOG_TYPE_DEFAULT, "CompetitionManager building competition for friend: %{public}@ - %@", buf, 0x16u);
      }
      id v33 = objc_alloc_init(MEMORY[0x263F23BB0]);
      v34 = [MEMORY[0x263F08C38] UUID];
      [v33 setUUID:v34];

      v35 = ASCompetitionCalculateStartDateComponentsForFriend();
      [v33 setStartDateComponents:v35];

      v36 = ASCompetitionDurationDateComponentsForNewCompetitions();
      [v33 setDurationDateComponents:v36];

      [v33 setPreferredVictoryBadgeStyles:v45];
      [v33 setMaximumNumberOfPointsPerDay:ASCompetitionMaximumPointsPerDayForNewCompetitions()];
      id v52 = v33;
      v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v52 count:1];
      [v13 setCompetitions:v37];

      ASLoggingInitialize();
      v38 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v54 = v33;
        _os_log_impl(&dword_2474C9000, v38, OS_LOG_TYPE_DEFAULT, "CompetitionManager built new competition: %@", buf, 0xCu);
      }
      v39 = *(void **)(a1 + 32);
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __74__ASCompetitionManager_sendCompetitionRequestToFriendWithUUID_completion___block_invoke_301;
      v46[3] = &unk_2652175F0;
      uint64_t v40 = *(void *)(a1 + 48);
      id v41 = *(id *)(a1 + 56);
      uint64_t v42 = *(void *)(a1 + 32);
      v43 = *(void **)(a1 + 40);
      id v49 = v41;
      v46[4] = v42;
      __int16 v50 = *(_WORD *)(a1 + 64);
      id v47 = v43;
      id v48 = *(id *)(a1 + 48);
      [v39 _saveCurrentCompetitionList:v13 archivedCompetitionList:v19 contact:v8 activity:0 cloudKitGroup:v40 completion:v46];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

void __74__ASCompetitionManager_sendCompetitionRequestToFriendWithUUID_completion___block_invoke_301(uint64_t a1, char a2, uint64_t a3)
{
  if (a3 || (a2 & 1) == 0)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v4();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    [WeakRetained updateRelationshipWithCompetitionEvent:*(unsigned __int16 *)(a1 + 64) friendUUID:*(void *)(a1 + 40) activity:0 cloudKitGroup:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
}

- (void)acceptCompetitionRequestFromFriendWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  ASLoggingInitialize();
  id v8 = *MEMORY[0x263F23AB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v29 = v6;
    _os_log_impl(&dword_2474C9000, v8, OS_LOG_TYPE_DEFAULT, "CompetitionManager attempting to accept competition request to friend: %{public}@", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_relationshipManager);
  uint64_t v10 = [WeakRetained insertPlaceholderRelationshipEvent:11 friendUUID:v6];

  id v11 = objc_loadWeakRetained((id *)&self->_relationshipManager);
  id v12 = [v11 insertPlaceholderRelationshipEvent:6 friendUUID:v6];

  id v13 = objc_loadWeakRetained((id *)&self->_friendListManager);
  [v13 updateFitnessAppBadgeCount];

  id v14 = ASCloudKitGroupUserActionExplicit();
  id v15 = objc_loadWeakRetained((id *)&self->_cloudKitManager);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __78__ASCompetitionManager_acceptCompetitionRequestFromFriendWithUUID_completion___block_invoke;
  v21[3] = &unk_265217668;
  v21[4] = self;
  id v22 = v10;
  id v23 = v12;
  id v24 = v6;
  id v25 = v14;
  id v26 = v7;
  __int16 v27 = 11;
  id v16 = v14;
  id v17 = v6;
  id v18 = v7;
  id v19 = v12;
  id v20 = v10;
  [v15 fetchAllChangesWithPriority:2 activity:0 group:v16 completion:v21];
}

void __78__ASCompetitionManager_acceptCompetitionRequestFromFriendWithUUID_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v5 || (a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v6 + 64));
    [WeakRetained removePlaceholderRelationshipEventWithToken:*(void *)(a1 + 40)];

    id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    [v9 removePlaceholderRelationshipEventWithToken:*(void *)(a1 + 48)];

    id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
    [v10 updateFitnessAppBadgeCount];

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    id v7 = *(void **)(v6 + 88);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __78__ASCompetitionManager_acceptCompetitionRequestFromFriendWithUUID_completion___block_invoke_2;
    v11[3] = &unk_2652176B8;
    v11[4] = v6;
    id v12 = *(id *)(a1 + 56);
    id v13 = *(id *)(a1 + 40);
    id v14 = *(id *)(a1 + 48);
    id v16 = *(id *)(a1 + 72);
    id v15 = *(id *)(a1 + 64);
    __int16 v17 = *(_WORD *)(a1 + 80);
    [v7 performTransaction:v11];
  }
}

void __78__ASCompetitionManager_acceptCompetitionRequestFromFriendWithUUID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  ASLoggingInitialize();
  id v4 = (os_log_t *)MEMORY[0x263F23AB0];
  id v5 = *MEMORY[0x263F23AB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "CompetitionManager fetch complete, proceeding with accept", buf, 2u);
  }
  ASLoggingInitialize();
  uint64_t v6 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "CompetitionManager unhiding from friend if hidden", buf, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  id v8 = [WeakRetained contactWithUUID:*(void *)(a1 + 40)];

  id v9 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __78__ASCompetitionManager_acceptCompetitionRequestFromFriendWithUUID_completion___block_invoke_304;
  v11[3] = &unk_265217690;
  v11[4] = v9;
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v16 = v3;
  id v17 = *(id *)(a1 + 72);
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 64);
  __int16 v18 = *(_WORD *)(a1 + 80);
  id v10 = v3;
  objc_msgSend(v9, "_queue_setActivityDataVisibleIfNecessaryForContact:completion:", v8, v11);
}

void __78__ASCompetitionManager_acceptCompetitionRequestFromFriendWithUUID_completion___block_invoke_304(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __78__ASCompetitionManager_acceptCompetitionRequestFromFriendWithUUID_completion___block_invoke_2_305;
  v42[3] = &unk_2652175C8;
  id v9 = *(void **)(a1 + 40);
  v42[4] = *(void *)(a1 + 32);
  id v43 = v9;
  id v44 = *(id *)(a1 + 48);
  id v45 = *(id *)(a1 + 72);
  id v46 = *(id *)(a1 + 80);
  id v10 = (void (**)(void, void, void))MEMORY[0x24C557E50](v42);
  ASLoggingInitialize();
  id v11 = (os_log_t *)MEMORY[0x263F23AB0];
  id v12 = *MEMORY[0x263F23AB0];
  if (v7 || (a2 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_ERROR)) {
      __74__ASCompetitionManager_sendCompetitionRequestToFriendWithUUID_completion___block_invoke_2_297_cold_1();
    }
    ((void (**)(void, uint64_t, id))v10)[2](v10, a2, v7);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v12, OS_LOG_TYPE_DEFAULT, "CompetitionManager checking friend eligibility", buf, 2u);
    }
    uint64_t v41 = 0;
    char v13 = ASValidateEligibilityForAcceptingCompetitionRequest();
    id v14 = 0;
    if (v13)
    {
      ASLoggingInitialize();
      os_log_t v15 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = v15;
        id v17 = [v8 displayName];
        *(_DWORD *)buf = 138412290;
        id v49 = v17;
        _os_log_impl(&dword_2474C9000, v16, OS_LOG_TYPE_DEFAULT, "CompetitionManager found friend with incoming request: %@", buf, 0xCu);
      }
      __int16 v18 = [*(id *)(*(void *)(a1 + 32) + 80) currentRemoteCompetitionForContact:v8];
      if (v18)
      {
        id v34 = v14;
        id v19 = [*(id *)(*(void *)(a1 + 32) + 80) currentCompetitionListForFriendWithUUID:*(void *)(a1 + 56)];
        v35 = [v19 currentCompetition];
        id v20 = [v35 UUID];
        id v21 = [v18 UUID];
        char v22 = [v20 isEqual:v21];

        if ((v22 & 1) == 0)
        {
          ASLoggingInitialize();
          if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR)) {
            __78__ASCompetitionManager_acceptCompetitionRequestFromFriendWithUUID_completion___block_invoke_304_cold_2();
          }
          id v23 = [v18 UUID];
          [v35 setUUID:v23];
        }
        ASLoggingInitialize();
        id v24 = *v11;
        if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2474C9000, v24, OS_LOG_TYPE_DEFAULT, "CompetitionManager updating competition start date before accepting", buf, 2u);
        }
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
        id v26 = [WeakRetained friendWithUUID:*(void *)(a1 + 56)];

        __int16 v27 = [v18 startDateComponents];
        os_log_t v28 = ASCompetitionCalculateStartDateComponentsForFriendWithProposedStartDate();
        [v35 setStartDateComponents:v28];

        id v47 = v35;
        id v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v47 count:1];
        [v19 setCompetitions:v29];

        uint64_t v30 = *(void **)(a1 + 32);
        uint64_t v31 = *(void *)(a1 + 64);
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __78__ASCompetitionManager_acceptCompetitionRequestFromFriendWithUUID_completion___block_invoke_307;
        v36[3] = &unk_2652175F0;
        v32 = v10;
        uint64_t v33 = *(void *)(a1 + 32);
        id v39 = v32;
        v36[4] = v33;
        __int16 v40 = *(_WORD *)(a1 + 88);
        id v37 = *(id *)(a1 + 56);
        id v38 = *(id *)(a1 + 64);
        [v30 _saveCurrentCompetitionList:v19 archivedCompetitionList:0 contact:v8 activity:0 cloudKitGroup:v31 completion:v36];

        id v14 = v34;
      }
      else
      {
        ASLoggingInitialize();
        if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR)) {
          __78__ASCompetitionManager_acceptCompetitionRequestFromFriendWithUUID_completion___block_invoke_304_cold_1();
        }
        id v19 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F23CC8] code:6 userInfo:0];
        ((void (**)(void, void, void *))v10)[2](v10, 0, v19);
      }
    }
    else
    {
      ((void (**)(void, void, id))v10)[2](v10, 0, v14);
    }
  }
}

void __78__ASCompetitionManager_acceptCompetitionRequestFromFriendWithUUID_completion___block_invoke_2_305(void *a1, uint64_t a2, void *a3)
{
  id v4 = (id *)(a1[4] + 64);
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained removePlaceholderRelationshipEventWithToken:a1[5]];

  id v6 = objc_loadWeakRetained((id *)(a1[4] + 64));
  [v6 removePlaceholderRelationshipEventWithToken:a1[6]];

  id v7 = objc_loadWeakRetained((id *)(a1[4] + 48));
  [v7 updateFitnessAppBadgeCount];

  (*(void (**)(void))(a1[7] + 16))();
  (*(void (**)(void))(a1[8] + 16))();
}

void __78__ASCompetitionManager_acceptCompetitionRequestFromFriendWithUUID_completion___block_invoke_307(uint64_t a1, char a2, uint64_t a3)
{
  if (a3 || (a2 & 1) == 0)
  {
    id v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v8();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    uint64_t v5 = *(unsigned __int16 *)(a1 + 64);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __78__ASCompetitionManager_acceptCompetitionRequestFromFriendWithUUID_completion___block_invoke_2_308;
    v9[3] = &unk_265215FA8;
    v9[4] = *(void *)(a1 + 32);
    id v10 = *(id *)(a1 + 56);
    [WeakRetained updateRelationshipWithCompetitionEvent:v5 friendUUID:v6 activity:0 cloudKitGroup:v7 completion:v9];
  }
}

void __78__ASCompetitionManager_acceptCompetitionRequestFromFriendWithUUID_completion___block_invoke_2_308(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id *)(*(void *)(a1 + 32) + 8);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained requestTemplateUpdate];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)ignoreCompetitionRequestFromFriendWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  ASLoggingInitialize();
  id v8 = *MEMORY[0x263F23AB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v25 = v6;
    _os_log_impl(&dword_2474C9000, v8, OS_LOG_TYPE_DEFAULT, "CompetitionManager attempting to ignore competition request from friend: %{public}@", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_relationshipManager);
  id v10 = [WeakRetained insertPlaceholderRelationshipEvent:12 friendUUID:v6];

  id v11 = objc_loadWeakRetained((id *)&self->_friendListManager);
  [v11 updateFitnessAppBadgeCount];

  id v12 = ASCloudKitGroupUserActionExplicit();
  id v13 = objc_loadWeakRetained((id *)&self->_cloudKitManager);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __78__ASCompetitionManager_ignoreCompetitionRequestFromFriendWithUUID_completion___block_invoke;
  v18[3] = &unk_265217730;
  v18[4] = self;
  id v19 = v10;
  id v21 = v12;
  id v22 = v7;
  __int16 v23 = 12;
  id v20 = v6;
  id v14 = v12;
  id v15 = v6;
  id v16 = v7;
  id v17 = v10;
  [v13 fetchAllChangesWithPriority:2 activity:0 group:v14 completion:v18];
}

void __78__ASCompetitionManager_ignoreCompetitionRequestFromFriendWithUUID_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v5 || (a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v6 + 64));
    [WeakRetained removePlaceholderRelationshipEventWithToken:*(void *)(a1 + 40)];

    id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
    [v9 updateFitnessAppBadgeCount];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    id v7 = *(void **)(v6 + 88);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __78__ASCompetitionManager_ignoreCompetitionRequestFromFriendWithUUID_completion___block_invoke_2;
    v10[3] = &unk_265217708;
    v10[4] = v6;
    id v11 = *(id *)(a1 + 48);
    id v12 = *(id *)(a1 + 40);
    id v14 = *(id *)(a1 + 64);
    __int16 v15 = *(_WORD *)(a1 + 72);
    id v13 = *(id *)(a1 + 56);
    [v7 performTransaction:v10];
  }
}

void __78__ASCompetitionManager_ignoreCompetitionRequestFromFriendWithUUID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  id v5 = [WeakRetained contactWithUUID:*(void *)(a1 + 40)];

  uint64_t v6 = [v5 primaryRelationship];
  if ([v6 hasIncomingCompetitionRequest]
    && ![v6 isCompetitionActive])
  {
    id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    uint64_t v12 = *(unsigned __int16 *)(a1 + 72);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __78__ASCompetitionManager_ignoreCompetitionRequestFromFriendWithUUID_completion___block_invoke_309;
    v15[3] = &unk_2652176E0;
    uint64_t v13 = *(void *)(a1 + 40);
    v15[4] = *(void *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 56);
    id v16 = *(id *)(a1 + 48);
    id v17 = *(id *)(a1 + 64);
    __int16 v18 = v3;
    [v11 updateRelationshipWithCompetitionEvent:v12 friendUUID:v13 activity:0 cloudKitGroup:v14 completion:v15];
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_ERROR)) {
      __78__ASCompetitionManager_ignoreCompetitionRequestFromFriendWithUUID_completion___block_invoke_2_cold_1();
    }
    id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    [v7 removePlaceholderRelationshipEventWithToken:*(void *)(a1 + 48)];

    id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
    [v8 updateFitnessAppBadgeCount];

    uint64_t v9 = *(void *)(a1 + 64);
    id v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F23CC8] code:0 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);

    v3[2](v3);
  }
}

uint64_t __78__ASCompetitionManager_ignoreCompetitionRequestFromFriendWithUUID_completion___block_invoke_309(void *a1, uint64_t a2, void *a3)
{
  id v4 = (id *)(a1[4] + 64);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained removePlaceholderRelationshipEventWithToken:a1[5]];

  id v7 = objc_loadWeakRetained((id *)(a1[4] + 48));
  [v7 updateFitnessAppBadgeCount];

  (*(void (**)(void))(a1[6] + 16))();
  id v8 = *(uint64_t (**)(void))(a1[7] + 16);
  return v8();
}

- (id)competitionsForFriendWithUUID:(id)a3
{
  competitionStore = self->_competitionStore;
  id v5 = a3;
  uint64_t v6 = [(ASCompetitionStore *)competitionStore archivedCompetitionListForFriendWithUUID:v5];
  id v7 = [v6 competitions];
  id v8 = [MEMORY[0x263EFFA68] arrayByAddingObjectsFromArray:v7];

  uint64_t v9 = [(ASCompetitionStore *)self->_competitionStore currentCompetitionListForFriendWithUUID:v5];

  id v10 = [v9 competitions];
  id v11 = [v8 arrayByAddingObjectsFromArray:v10];

  return v11;
}

- (void)activityDataManager:(id)a3 didUpdateTodaySummary:(id)a4 yesterdaySummary:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__ASCompetitionManager_activityDataManager_didUpdateTodaySummary_yesterdaySummary___block_invoke;
  block[3] = &unk_265216138;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(serialQueue, block);
}

void __83__ASCompetitionManager_activityDataManager_didUpdateTodaySummary_yesterdaySummary___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v3 = a1[6];
  ASCloudKitGroupUserActionImplicit();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_queue_updateScoresWithTodaySummary:yesterdaySummary:activity:cloudKitGroup:", v2, v3, 0, v4);
}

- (BOOL)isReadyToProcessChanges
{
  return self->_hasFetchedProtectedData;
}

- (void)cloudKitManager:(id)a3 didBeginUpdatesForFetchWithType:(int64_t)a4
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__ASCompetitionManager_cloudKitManager_didBeginUpdatesForFetchWithType___block_invoke;
  block[3] = &unk_2652157F0;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

void __72__ASCompetitionManager_cloudKitManager_didBeginUpdatesForFetchWithType___block_invoke(uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  uint64_t v2 = *MEMORY[0x263F23AB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v2, OS_LOG_TYPE_DEFAULT, "CompetitionManager preparing for new records", buf, 2u);
  }
  uint64_t v3 = [MEMORY[0x263EFFA08] set];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 120);
  *(void *)(v4 + 120) = v3;

  uint64_t v6 = [MEMORY[0x263EFFA08] set];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 128);
  *(void *)(v7 + 128) = v6;

  uint64_t v9 = [MEMORY[0x263EFFA08] set];
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(v10 + 136);
  *(void *)(v10 + 136) = v9;

  uint64_t v12 = [MEMORY[0x263EFFA08] set];
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = *(void **)(v13 + 144);
  *(void *)(v13 + 144) = v12;

  uint64_t v15 = [MEMORY[0x263EFFA08] set];
  uint64_t v16 = *(void *)(a1 + 32);
  id v17 = *(void **)(v16 + 168);
  *(void *)(v16 + 168) = v15;

  uint64_t v18 = [MEMORY[0x263EFFA08] set];
  uint64_t v19 = *(void *)(a1 + 32);
  id v20 = *(void **)(v19 + 176);
  *(void *)(v19 + 176) = v18;

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  id v22 = [WeakRetained contacts];

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v23 = v22;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v55 objects:v61 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v56 != v26) {
          objc_enumerationMutation(v23);
        }
        os_log_t v28 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        id v29 = objc_msgSend(v28, "primaryRelationship", (void)v55);
        uint64_t v30 = [v28 primaryRemoteRelationship];
        if ([v30 isAwaitingCompetitionResponse])
        {
          uint64_t v31 = [v30 dateForLatestOutgoingCompetitionRequest];
          char HasExpired = ASCompetitionRequestHasExpired();

          if ((HasExpired & 1) == 0)
          {
            uint64_t v33 = *(void **)(*(void *)(a1 + 32) + 120);
            id v34 = [v28 UUID];
            uint64_t v35 = [v33 setByAddingObject:v34];
            uint64_t v36 = *(void *)(a1 + 32);
            id v37 = *(void **)(v36 + 120);
            *(void *)(v36 + 120) = v35;
          }
        }
        if ([v29 hasOutgoingCompetitionRequest]
          && [v29 isCompetitionActive])
        {
          id v38 = *(void **)(*(void *)(a1 + 32) + 128);
          id v39 = [v28 UUID];
          uint64_t v40 = [v38 setByAddingObject:v39];
          uint64_t v41 = *(void *)(a1 + 32);
          uint64_t v42 = *(void **)(v41 + 128);
          *(void *)(v41 + 128) = v40;
        }
        if ([v29 hasCompletedCompetition]
          && [v30 hasCompletedCompetition])
        {
          id v43 = *(void **)(*(void *)(a1 + 32) + 136);
          id v44 = [v28 UUID];
          uint64_t v45 = [v43 setByAddingObject:v44];
          uint64_t v46 = *(void *)(a1 + 32);
          id v47 = *(void **)(v46 + 136);
          *(void *)(v46 + 136) = v45;
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v55 objects:v61 count:16];
    }
    while (v25);
  }

  ASLoggingInitialize();
  id v48 = (os_log_t *)MEMORY[0x263F23AB0];
  id v49 = *MEMORY[0x263F23AB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v50 = *(void *)(*(void *)(a1 + 32) + 120);
    *(_DWORD *)buf = 138412290;
    uint64_t v60 = v50;
    _os_log_impl(&dword_2474C9000, v49, OS_LOG_TYPE_DEFAULT, "CompetitionManager existing friends awaiting my response: %@", buf, 0xCu);
  }
  ASLoggingInitialize();
  uint64_t v51 = *v48;
  if (os_log_type_enabled(*v48, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v52 = *(void *)(*(void *)(a1 + 32) + 128);
    *(_DWORD *)buf = 138412290;
    uint64_t v60 = v52;
    _os_log_impl(&dword_2474C9000, v51, OS_LOG_TYPE_DEFAULT, "CompetitionManager existing friends that accepted my request: %@", buf, 0xCu);
  }
  ASLoggingInitialize();
  v53 = *v48;
  if (os_log_type_enabled(*v48, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v54 = *(void *)(*(void *)(a1 + 32) + 136);
    *(_DWORD *)buf = 138412290;
    uint64_t v60 = v54;
    _os_log_impl(&dword_2474C9000, v53, OS_LOG_TYPE_DEFAULT, "CompetitionManager existing friends with completed competitions: %@", buf, 0xCu);
  }
}

- (void)cloudKitManager:(id)a3 didReceiveNewCompetitionListsForSelf:(id)a4 moreComing:(BOOL)a5 changesProcessedHandler:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  ASLoggingInitialize();
  uint64_t v10 = *MEMORY[0x263F23AB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v10, OS_LOG_TYPE_DEFAULT, "CompetitionManager received new non-remote competitions", buf, 2u);
  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __112__ASCompetitionManager_cloudKitManager_didReceiveNewCompetitionListsForSelf_moreComing_changesProcessedHandler___block_invoke;
  block[3] = &unk_265215FD0;
  id v15 = v8;
  uint64_t v16 = self;
  id v17 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(serialQueue, block);
}

void __112__ASCompetitionManager_cloudKitManager_didReceiveNewCompetitionListsForSelf_moreComing_changesProcessedHandler___block_invoke(uint64_t a1)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v58;
    uint64_t v7 = (os_log_t *)MEMORY[0x263F23AB0];
    *(void *)&long long v4 = 134218240;
    long long v54 = v4;
    id v55 = v2;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v58 != v6) {
          objc_enumerationMutation(v2);
        }
        id v9 = *(void **)(*((void *)&v57 + 1) + 8 * v8);
        uint64_t v10 = objc_msgSend(v9, "friendUUID", v54);

        if (v10)
        {
          if ([*(id *)(a1 + 40) _shouldSkipLocalLegacyCompetitionList:v9])
          {
            ASLoggingInitialize();
            id v11 = *v7;
            if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2474C9000, v11, OS_LOG_TYPE_DEFAULT, "CompetitionManager received legacy competition to clean up", buf, 2u);
            }
            uint64_t v12 = [*(id *)(*(void *)(a1 + 40) + 168) setByAddingObject:v9];
            uint64_t v13 = *(void *)(a1 + 40);
            id v14 = *(void **)(v13 + 168);
            *(void *)(v13 + 168) = v12;
LABEL_17:

            goto LABEL_18;
          }
          if ([*(id *)(a1 + 40) _shouldSkipLocalSecureCloudCompetitionList:v9])
          {
            ASLoggingInitialize();
            uint64_t v16 = *v7;
            if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2474C9000, v16, OS_LOG_TYPE_DEFAULT, "CompetitionManager received secure cloud competition to clean up", buf, 2u);
            }
            uint64_t v17 = [*(id *)(*(void *)(a1 + 40) + 176) setByAddingObject:v9];
            uint64_t v18 = *(void *)(a1 + 40);
            id v14 = *(void **)(v18 + 176);
            *(void *)(v18 + 176) = v17;
            goto LABEL_17;
          }
          uint64_t v19 = *(void **)(*(void *)(a1 + 40) + 144);
          id v20 = [v9 friendUUID];
          uint64_t v21 = [v19 setByAddingObject:v20];
          uint64_t v22 = *(void *)(a1 + 40);
          id v23 = *(void **)(v22 + 144);
          *(void *)(v22 + 144) = v21;

          if (![v9 type])
          {
            uint64_t v24 = *(void **)(*(void *)(a1 + 40) + 80);
            uint64_t v25 = [v9 friendUUID];
            uint64_t v26 = [v24 currentCompetitionListForFriendWithUUID:v25];

            long long v56 = v26;
            __int16 v27 = [v26 currentCompetition];
            os_log_t v28 = [v9 currentCompetition];
            id v29 = [v27 UUID];
            [v28 UUID];
            v31 = uint64_t v30 = v7;
            int v32 = [v29 isEqual:v31];

            uint64_t v7 = v30;
            if (v32)
            {
              ASLoggingInitialize();
              uint64_t v33 = *v30;
              if (os_log_type_enabled(*v30, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v62 = (uint64_t)v27;
                _os_log_debug_impl(&dword_2474C9000, v33, OS_LOG_TYPE_DEBUG, "CompetitionManager existingCurrentCompetition=%@", buf, 0xCu);
              }
              ASLoggingInitialize();
              id v34 = *v30;
              if (os_log_type_enabled(*v30, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v62 = (uint64_t)v28;
                _os_log_debug_impl(&dword_2474C9000, v34, OS_LOG_TYPE_DEBUG, "CompetitionManager updatedCurrentCompetition=%@", buf, 0xCu);
              }
              unint64_t v35 = [v27 myTotalScore];
              if (v35 > [v28 myTotalScore])
              {
                ASLoggingInitialize();
                os_log_t v36 = *v30;
                if (os_log_type_enabled(*v30, OS_LOG_TYPE_DEFAULT))
                {
                  id v37 = v36;
                  uint64_t v38 = [v27 myTotalScore];
                  uint64_t v39 = [v28 myTotalScore];
                  *(_DWORD *)buf = v54;
                  uint64_t v62 = v38;
                  __int16 v63 = 2048;
                  uint64_t v64 = v39;
                  _os_log_impl(&dword_2474C9000, v37, OS_LOG_TYPE_DEFAULT, "CompetitionManager local view of competition has a higher score, keeping the current local value (%lu vs %lu)", buf, 0x16u);
                }
                uint64_t v40 = [v27 scores];
                [v28 setScores:v40];
              }
              unint64_t v41 = [v27 opponentTotalScore];
              if (v41 > [v28 opponentTotalScore])
              {
                ASLoggingInitialize();
                os_log_t v42 = *v30;
                if (os_log_type_enabled(*v30, OS_LOG_TYPE_DEFAULT))
                {
                  id v43 = v42;
                  uint64_t v44 = [v27 opponentTotalScore];
                  uint64_t v45 = [v28 opponentTotalScore];
                  *(_DWORD *)buf = v54;
                  uint64_t v62 = v44;
                  __int16 v63 = 2048;
                  uint64_t v64 = v45;
                  _os_log_impl(&dword_2474C9000, v43, OS_LOG_TYPE_DEFAULT, "CompetitionManager local view of competition has a higher opponent score, keeping the current local value (%lu vs %lu)", buf, 0x16u);
                }
                uint64_t v46 = [v27 opponentScores];
                [v28 setOpponentScores:v46];
              }
            }

            id v2 = v55;
          }
        }
        else
        {
          ASLoggingInitialize();
          id v15 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v62 = (uint64_t)v9;
            _os_log_error_impl(&dword_2474C9000, v15, OS_LOG_TYPE_ERROR, "CompetitionManager found competition list missing a friendUUID: %@", buf, 0xCu);
          }
        }
LABEL_18:
        ++v8;
      }
      while (v5 != v8);
      uint64_t v47 = [v2 countByEnumeratingWithState:&v57 objects:v65 count:16];
      uint64_t v5 = v47;
    }
    while (v47);
  }

  id v48 = *(void **)(*(void *)(a1 + 40) + 168);
  id v49 = *(id *)(a1 + 32);
  uint64_t v50 = [v48 allObjects];
  uint64_t v51 = [v49 arrayByExcludingObjectsInArray:v50];

  uint64_t v52 = [*(id *)(*(void *)(a1 + 40) + 176) allObjects];
  v53 = [v51 arrayByExcludingObjectsInArray:v52];

  [*(id *)(*(void *)(a1 + 40) + 80) saveCompetitionLists:v53];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)cloudKitManager:(id)a3 didReceiveNewCompetitionLists:(id)a4 moreComing:(BOOL)a5 changesProcessedHandler:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  ASLoggingInitialize();
  id v11 = *MEMORY[0x263F23AB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v11, OS_LOG_TYPE_DEFAULT, "CompetitionManager received new remote competitions", buf, 2u);
  }
  serialQueue = self->_serialQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __105__ASCompetitionManager_cloudKitManager_didReceiveNewCompetitionLists_moreComing_changesProcessedHandler___block_invoke;
  v15[3] = &unk_265215F60;
  id v16 = v9;
  uint64_t v17 = self;
  BOOL v19 = a5;
  id v18 = v10;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(serialQueue, v15);
}

uint64_t __105__ASCompetitionManager_cloudKitManager_didReceiveNewCompetitionLists_moreComing_changesProcessedHandler___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __105__ASCompetitionManager_cloudKitManager_didReceiveNewCompetitionLists_moreComing_changesProcessedHandler___block_invoke_2;
        v23[3] = &unk_265215C30;
        v23[4] = v7;
        id v9 = [WeakRetained contactMatchingCriteriaBlock:v23];

        if (v9)
        {
          if ([*(id *)(a1 + 40) _shouldSkipRemoteLegacyCompetitionList:v7 contact:v9])
          {
            ASLoggingInitialize();
            id v10 = *MEMORY[0x263F23AB0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2474C9000, v10, OS_LOG_TYPE_DEFAULT, "CompetitionManager skipping remote legacy competition list", buf, 2u);
            }
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 40), "_queue_handleNewRemoteCompetitionList:contact:", v7, v9);
            uint64_t v12 = *(void **)(*(void *)(a1 + 40) + 144);
            id v13 = [v9 UUID];
            uint64_t v14 = [v12 setByAddingObject:v13];
            uint64_t v15 = *(void *)(a1 + 40);
            id v16 = *(void **)(v15 + 144);
            *(void *)(v15 + 144) = v14;
          }
        }
        else
        {
          ASLoggingInitialize();
          id v11 = *MEMORY[0x263F23AB0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v29 = v7;
            _os_log_error_impl(&dword_2474C9000, v11, OS_LOG_TYPE_ERROR, "CompetitionManager couldn't find a matching friend for this remote competition list: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v4);
  }

  if (!*(unsigned char *)(a1 + 56))
  {
    uint64_t v17 = *(id **)(a1 + 40);
    id v18 = (void *)[v17[18] copy];
    objc_msgSend(v17, "_queue_notifyObserversOfCompetitionUpdatesForFriendsWithUUIDs:", v18);

    uint64_t v19 = [MEMORY[0x263EFFA08] set];
    uint64_t v20 = *(void *)(a1 + 40);
    uint64_t v21 = *(void **)(v20 + 144);
    *(void *)(v20 + 144) = v19;
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __105__ASCompetitionManager_cloudKitManager_didReceiveNewCompetitionLists_moreComing_changesProcessedHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 primaryRemoteRelationship];
  uint64_t v4 = [v3 UUID];
  uint64_t v5 = [*(id *)(a1 + 32) friendUUID];
  uint64_t v6 = [v4 isEqual:v5];

  return v6;
}

- (void)cloudKitManager:(id)a3 didEndUpdatesForFetchWithType:(int64_t)a4 activity:(id)a5 cloudKitGroup:(id)a6 changesProcessedHandler:(id)a7
{
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  id v14 = a3;
  ASLoggingInitialize();
  uint64_t v15 = (os_log_t *)MEMORY[0x263F23AB0];
  id v16 = *MEMORY[0x263F23AB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v16, OS_LOG_TYPE_DEFAULT, "CompetitionManager CK fetch complete", buf, 2u);
  }
  char v17 = [v14 hasCompletedFirstFetch];

  if ((v17 & 1) == 0)
  {
    ASLoggingInitialize();
    id v18 = *v15;
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v18, OS_LOG_TYPE_DEFAULT, "CompetitionManager CK fetch is the first on this device, avoid notifying about already-processed changes", buf, 2u);
    }
  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __117__ASCompetitionManager_cloudKitManager_didEndUpdatesForFetchWithType_activity_cloudKitGroup_changesProcessedHandler___block_invoke;
  block[3] = &unk_265217758;
  char v27 = v17 ^ 1;
  void block[4] = self;
  id v24 = v11;
  id v25 = v12;
  id v26 = v13;
  id v20 = v13;
  id v21 = v12;
  id v22 = v11;
  dispatch_async(serialQueue, block);
}

void __117__ASCompetitionManager_cloudKitManager_didEndUpdatesForFetchWithType_activity_cloudKitGroup_changesProcessedHandler___block_invoke(uint64_t a1)
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  id v2 = *MEMORY[0x263F23AB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v2, OS_LOG_TYPE_DEFAULT, "CompetitionManager checking each friend for updated competition state", buf, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  uint64_t v4 = [WeakRetained contacts];

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id obj = v4;
  uint64_t v72 = [obj countByEnumeratingWithState:&v76 objects:v88 count:16];
  if (!v72)
  {
    uint64_t v69 = 0;
    char v68 = 0;
    goto LABEL_60;
  }
  uint64_t v69 = 0;
  char v68 = 0;
  uint64_t v5 = *(void *)v77;
  uint64_t v70 = *(void *)v77;
  do
  {
    for (uint64_t i = 0; i != v72; ++i)
    {
      if (*(void *)v77 != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v7 = *(void **)(*((void *)&v76 + 1) + 8 * i);
      uint64_t v8 = [v7 primaryRelationship];
      id v9 = [v7 primaryRemoteRelationship];
      if ([v9 isAwaitingCompetitionResponse])
      {
        id v10 = [v9 dateForLatestOutgoingCompetitionRequest];
        char HasExpired = ASCompetitionRequestHasExpired();

        if ((HasExpired & 1) == 0)
        {
          int v12 = [v8 hasIncomingCompetitionRequest];
          int v13 = ASIgnoredMostRecentCompetitionRequestFromContact();
          id v14 = *(void **)(*(void *)(a1 + 32) + 120);
          uint64_t v15 = [v7 UUID];
          BOOL v16 = ([v14 containsObject:v15] & 1) != 0 || *(unsigned char *)(a1 + 64) != 0;

          ASLoggingInitialize();
          char v17 = (void *)*MEMORY[0x263F23AB0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
          {
            id v18 = v17;
            uint64_t v19 = [v7 displayName];
            *(_DWORD *)buf = 138413058;
            v81 = v19;
            __int16 v82 = 1024;
            int v83 = v12;
            __int16 v84 = 1024;
            BOOL v85 = v13;
            __int16 v86 = 1024;
            BOOL v87 = v16;
            _os_log_impl(&dword_2474C9000, v18, OS_LOG_TYPE_DEFAULT, "CompetitionManager [%@] is awaiting response from me, alreadyProcessed=%d alreadyIgnored=%d alreadyNotified=%d", buf, 0x1Eu);
          }
          if (((v16 | ASPairedDeviceSupportsCompetitions()) & 1) == 0)
          {
            ASLoggingInitialize();
            id v20 = *MEMORY[0x263F23AB0];
            uint64_t v5 = v70;
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_ERROR)) {
              __117__ASCompetitionManager_cloudKitManager_didEndUpdatesForFetchWithType_activity_cloudKitGroup_changesProcessedHandler___block_invoke_cold_1(&v74, v75, v20);
            }
            id v21 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
            [v21 showGizmoVersionTooLowForCompetitionRequestFrom:v7];
            goto LABEL_24;
          }
          uint64_t v5 = v70;
          if (((v12 | v13) & 1) == 0)
          {
            id v22 = *(void **)(*(void *)(a1 + 32) + 120);
            id v23 = (void *)MEMORY[0x263EFFA08];
            id v24 = [v7 UUID];
            id v25 = [v23 setWithObject:v24];
            uint64_t v26 = objc_msgSend(v22, "hk_minus:", v25);
            uint64_t v27 = *(void *)(a1 + 32);
            os_log_t v28 = *(void **)(v27 + 120);
            *(void *)(v27 + 120) = v26;

LABEL_23:
            uint64_t v29 = *(void **)(a1 + 32);
            id v21 = [v7 UUID];
            [v29 _handleCompetitionRequestFromFriendWithUUID:v21 activity:*(void *)(a1 + 40) cloudKitGroup:*(void *)(a1 + 48)];
            char v68 = 1;
LABEL_24:

            goto LABEL_25;
          }
          if (!v16) {
            goto LABEL_23;
          }
          char v68 = 1;
        }
      }
LABEL_25:
      if ([v8 hasOutgoingCompetitionRequest]
        && [v9 isCompetitionActive])
      {
        int v30 = [v8 isAwaitingCompetitionResponse];
        uint64_t v31 = *(void **)(*(void *)(a1 + 32) + 128);
        int v32 = [v7 UUID];
        BOOL v33 = ([v31 containsObject:v32] & 1) != 0 || *(unsigned char *)(a1 + 64) != 0;
        char v34 = v30 ^ 1;

        ASLoggingInitialize();
        unint64_t v35 = (void *)*MEMORY[0x263F23AB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
        {
          os_log_t v36 = v35;
          id v37 = [v7 displayName];
          *(_DWORD *)buf = 138412802;
          v81 = v37;
          __int16 v82 = 1024;
          int v83 = v30 ^ 1;
          __int16 v84 = 1024;
          BOOL v85 = v33;
          _os_log_impl(&dword_2474C9000, v36, OS_LOG_TYPE_DEFAULT, "CompetitionManager [%@] accepted my request, alreadyProcessed=%d alreadyNotified=%d", buf, 0x18u);
        }
        if (v30)
        {
          uint64_t v38 = *(void **)(*(void *)(a1 + 32) + 128);
          uint64_t v39 = (void *)MEMORY[0x263EFFA08];
          uint64_t v40 = [v7 UUID];
          unint64_t v41 = [v39 setWithObject:v40];
          uint64_t v42 = objc_msgSend(v38, "hk_minus:", v41);
          uint64_t v43 = *(void *)(a1 + 32);
          uint64_t v44 = *(void **)(v43 + 128);
          *(void *)(v43 + 128) = v42;

          goto LABEL_35;
        }
        if (!v33)
        {
LABEL_35:
          uint64_t v45 = *(void **)(a1 + 32);
          uint64_t v46 = [v7 UUID];
          [v45 _handleAcceptedCompetitionFromFriendWithUUID:v46 activity:*(void *)(a1 + 40) cloudKitGroup:*(void *)(a1 + 48)];
        }
        BYTE4(v69) = v34 & !v33;
        uint64_t v5 = v70;
      }
      if ([v8 hasIncomingCompetitionRequest]
        && [v9 isCompetitionActive]
        && ([v8 isAwaitingCompetitionResponse] & 1) == 0)
      {
        ASLoggingInitialize();
        uint64_t v47 = (void *)*MEMORY[0x263F23AB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
        {
          id v48 = v47;
          id v49 = [v7 displayName];
          *(_DWORD *)buf = 138412290;
          v81 = v49;
          _os_log_impl(&dword_2474C9000, v48, OS_LOG_TYPE_DEFAULT, "CompetitionManager accepted [%@] request, requesting template update", buf, 0xCu);
        }
        BYTE4(v69) = 1;
      }
      if ([v8 hasCompletedCompetition]
        && [v9 hasCompletedCompetition])
      {
        uint64_t v50 = *(void **)(*(void *)(a1 + 32) + 136);
        uint64_t v51 = [v7 UUID];
        BOOL v52 = ([v50 containsObject:v51] & 1) != 0 || *(unsigned char *)(a1 + 64) != 0;

        ASLoggingInitialize();
        v53 = (void *)*MEMORY[0x263F23AB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
        {
          long long v54 = v53;
          id v55 = [v7 displayName];
          *(_DWORD *)buf = 138412546;
          v81 = v55;
          __int16 v82 = 1024;
          int v83 = v52;
          _os_log_impl(&dword_2474C9000, v54, OS_LOG_TYPE_DEFAULT, "CompetitionManager [%@] competition complete, alreadyNotified=%d", buf, 0x12u);
        }
        if (!v52)
        {
          uint64_t v56 = *(void *)(a1 + 32);
          long long v57 = *(NSObject **)(v56 + 96);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __117__ASCompetitionManager_cloudKitManager_didEndUpdatesForFetchWithType_activity_cloudKitGroup_changesProcessedHandler___block_invoke_312;
          block[3] = &unk_2652157C8;
          void block[4] = v56;
          void block[5] = v7;
          dispatch_async(v57, block);
        }
        LOBYTE(v69) = 1;
      }
      if (([v8 isCompetitionActive] & 1) != 0
        || ASIgnoredMostRecentCompetitionRequestFromContact())
      {
        id v58 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
        long long v59 = [v7 UUID];
        [v58 withdrawCompetitionRequestNotificationForFriendWithUUID:v59];
      }
      long long v60 = *(void **)(a1 + 32);
      v61 = [v7 UUID];
      objc_msgSend(v60, "_queue_completeCompetitionIfNecessaryForFriendWithUUID:activity:cloudKitGroup:", v61, *(void *)(a1 + 40), *(void *)(a1 + 48));
    }
    uint64_t v72 = [obj countByEnumeratingWithState:&v76 objects:v88 count:16];
  }
  while (v72);
LABEL_60:

  objc_msgSend(*(id *)(a1 + 32), "_queue_cleanUpLegacyCompetitionLists:activity:cloudKitGroup:", *(void *)(*(void *)(a1 + 32) + 168), *(void *)(a1 + 40), *(void *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_queue_cleanUpSecureCloudCompetitionLists:activity:cloudKitGroup:", *(void *)(*(void *)(a1 + 32) + 176), *(void *)(a1 + 40), *(void *)(a1 + 48));
  uint64_t v62 = *(id **)(a1 + 32);
  __int16 v63 = (void *)[v62[18] copy];
  objc_msgSend(v62, "_queue_notifyObserversOfCompetitionUpdatesForFriendsWithUUIDs:", v63);

  if (v68)
  {
    id v64 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
    [v64 updateFitnessAppBadgeCount];
  }
  if ((v69 & 0x100000000) != 0)
  {
    id v65 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [v65 requestTemplateUpdate];
  }
  if (v69)
  {
    id v66 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [v66 requestEarnedInstanceUpdate];
  }
  id v67 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [v67 removeAllUnusedTemplates];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __117__ASCompetitionManager_cloudKitManager_didEndUpdatesForFetchWithType_activity_cloudKitGroup_changesProcessedHandler___block_invoke_312(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) UUID];
  objc_msgSend(v1, "_queue_showCompetitionEndedWithFriendWithUUID:", v2);
}

- (id)recordsToSave
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__12;
  id v11 = __Block_byref_object_dispose__12;
  id v12 = objc_alloc_init(MEMORY[0x263EFFA08]);
  serialQueue = self->_serialQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__ASCompetitionManager_recordsToSave__block_invoke;
  v6[3] = &unk_2652161B0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(serialQueue, v6);
  uint64_t v4 = [(id)v8[5] allObjects];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __37__ASCompetitionManager_recordsToSave__block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_legacyCompetitionListsToSave");
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__ASCompetitionManager_recordsToSave__block_invoke_2;
  v6[3] = &unk_265217780;
  v6[4] = *(void *)(a1 + 32);
  uint64_t v3 = objc_msgSend(v2, "hk_map:", v6);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

id __37__ASCompetitionManager_recordsToSave__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  uint64_t v5 = [v3 friendUUID];
  uint64_t v6 = [WeakRetained contactWithUUID:v5];

  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) recordForCurrentCompetitionList:v3 contact:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)recordIDsToDelete
{
  return 0;
}

- (void)periodicUpdateManager:(id)a3 didSaveRecords:(id)a4 activity:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__ASCompetitionManager_periodicUpdateManager_didSaveRecords_activity___block_invoke;
  block[3] = &unk_265216138;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(serialQueue, block);
}

void __70__ASCompetitionManager_periodicUpdateManager_didSaveRecords_activity___block_invoke(uint64_t a1)
{
  ASCloudKitGroupCoreDuetTriggered();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_queue_handleSavedRecords:activity:group:", *(void *)(a1 + 40), *(void *)(a1 + 48), v2);
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  uint64_t v6 = (os_log_t *)MEMORY[0x263F23AB0];
  id v7 = *MEMORY[0x263F23AB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 67109120;
    LODWORD(v13) = v4;
    _os_log_impl(&dword_2474C9000, v7, OS_LOG_TYPE_DEFAULT, "CompetitionManager observed protected data availability: %{BOOL}d", (uint8_t *)&v12, 8u);
  }
  id v8 = [(ASCompetitionManager *)self _scoreCapCelebrationAnchor];
  scoreCapCelebrationAnchor = self->_scoreCapCelebrationAnchor;
  self->_scoreCapCelebrationAnchor = v8;

  ASLoggingInitialize();
  id v10 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = self->_scoreCapCelebrationAnchor;
    int v12 = 138412290;
    id v13 = v11;
    _os_log_impl(&dword_2474C9000, v10, OS_LOG_TYPE_DEFAULT, "CompetitionManager found protected data available, setting current score cap celebration anchor to %@", (uint8_t *)&v12, 0xCu);
  }
  [(ASCompetitionManager *)self _loadCachedCompetitionsAndNotifyObservers];
}

- (void)_handleCompetitionRequestFromFriendWithUUID:(id)a3 activity:(id)a4 cloudKitGroup:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_deviceParticipatesInAutomaticCompetitionManagement)
  {
    transactionQueue = self->_transactionQueue;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __91__ASCompetitionManager__handleCompetitionRequestFromFriendWithUUID_activity_cloudKitGroup___block_invoke;
    v13[3] = &unk_2652177F8;
    v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    [(ASAsyncTransactionQueue *)transactionQueue performTransaction:v13];
  }
  else
  {
    ASLoggingInitialize();
    int v12 = *MEMORY[0x263F23AB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v12, OS_LOG_TYPE_DEFAULT, "CompetitionManager not handling competition request, device does not participate in competition management", buf, 2u);
    }
  }
}

void __91__ASCompetitionManager__handleCompetitionRequestFromFriendWithUUID_activity_cloudKitGroup___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  uint64_t v5 = [WeakRetained contactWithUUID:*(void *)(a1 + 40)];

  ASLoggingInitialize();
  uint64_t v6 = (os_log_t *)MEMORY[0x263F23AB0];
  id v7 = (void *)*MEMORY[0x263F23AB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = *(void **)(a1 + 40);
    id v9 = v7;
    id v10 = [v5 displayName];
    *(_DWORD *)buf = 138543618;
    id v58 = v8;
    __int16 v59 = 2112;
    long long v60 = v10;
    _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "CompetitionManager handling competition request from friend: %{public}@ - %@", buf, 0x16u);
  }
  id v11 = [v5 primaryRelationship];
  int v12 = [v5 primaryRemoteRelationship];
  if (![v11 hasOutgoingCompetitionRequest]
    || ([v12 isCompetitionActive] & 1) != 0
    || ([v12 hasIgnoredCompetitionRequest] & 1) != 0
    || ([v11 dateForLatestOutgoingCompetitionRequest],
        id v13 = objc_claimAutoreleasedReturnValue(),
        char HasExpired = ASCompetitionRequestHasExpired(),
        v13,
        (HasExpired & 1) != 0))
  {
    id v15 = [*(id *)(a1 + 32) _loadOrCreateCurrentCompetitionListForFriendWithUUID:*(void *)(a1 + 40)];
    id v16 = [v5 primaryRelationship];
    int v17 = [v16 hasIncomingCompetitionRequest];

    if (v17)
    {
      ASLoggingInitialize();
      id v18 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2474C9000, v18, OS_LOG_TYPE_DEFAULT, "CompetitionManager friend is not in awaiting response state", buf, 2u);
      }
      ASLoggingInitialize();
      uint64_t v19 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2474C9000, v19, OS_LOG_TYPE_DEFAULT, "CompetitionManager probably from another device saving to CK sooner - just notify", buf, 2u);
      }
      id v21 = *(void **)(a1 + 32);
      uint64_t v20 = *(void *)(a1 + 40);
      id v22 = [v15 currentCompetition];
      objc_msgSend(v21, "_queue_showCompetitionRequestFromFriendWithUUID:competition:", v20, v22);

LABEL_13:
      v3[2](v3);
      goto LABEL_37;
    }
    if ((ASValidateEligibilityForIncomingCompetitionRequest() & 1) == 0)
    {
      ASLoggingInitialize();
      uint64_t v26 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2474C9000, v26, OS_LOG_TYPE_DEFAULT, "CompetitionManager incoming request failed validation, aborting", buf, 2u);
      }
      goto LABEL_13;
    }
    id v23 = [*(id *)(*(void *)(a1 + 32) + 80) currentRemoteCompetitionForContact:v5];
    if (v23)
    {
      id v24 = [v5 primaryRelationship];
      int v25 = [v24 hasCompletedCompetition];

      if (v25)
      {
        uint64_t v45 = [*(id *)(a1 + 32) _archivedCompetitionListByMergingCurrentCompetitionList:v15];
      }
      else
      {
        uint64_t v45 = 0;
      }
      ASLoggingInitialize();
      uint64_t v27 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v58 = v23;
        _os_log_impl(&dword_2474C9000, v27, OS_LOG_TYPE_DEFAULT, "CompetitionManager found remote competition: %@", buf, 0xCu);
      }
      ASLoggingInitialize();
      os_log_t v28 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2474C9000, v28, OS_LOG_TYPE_DEFAULT, "CompetitionManager building local view of competition", buf, 2u);
      }
      uint64_t v29 = objc_msgSend(*(id *)(a1 + 32), "_localCompetitionForRemoteCompetition:friendUUID:", v23, *(void *)(a1 + 40), v45);
      uint64_t v56 = v29;
      int v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v56 count:1];
      [v15 setCompetitions:v30];

      uint64_t v31 = *(void **)(a1 + 32);
      uint64_t v47 = v23;
      uint64_t v33 = *(void *)(a1 + 48);
      uint64_t v32 = *(void *)(a1 + 56);
      v48[0] = MEMORY[0x263EF8330];
      v48[1] = 3221225472;
      v48[2] = __91__ASCompetitionManager__handleCompetitionRequestFromFriendWithUUID_activity_cloudKitGroup___block_invoke_315;
      v48[3] = &unk_2652177D0;
      char v34 = v3;
      uint64_t v35 = *(void *)(a1 + 32);
      os_log_t v36 = *(void **)(a1 + 40);
      id v53 = v34;
      v48[4] = v35;
      id v49 = v36;
      id v50 = *(id *)(a1 + 48);
      id v51 = *(id *)(a1 + 56);
      id v52 = v29;
      id v37 = v29;
      uint64_t v38 = v32;
      id v23 = v47;
      [v31 _saveCurrentCompetitionList:v15 archivedCompetitionList:v46 contact:v5 activity:v33 cloudKitGroup:v38 completion:v48];
    }
    else
    {
      ASLoggingInitialize();
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR)) {
        __91__ASCompetitionManager__handleCompetitionRequestFromFriendWithUUID_activity_cloudKitGroup___block_invoke_cold_1();
      }
      v3[2](v3);
    }
  }
  else
  {
    ASLoggingInitialize();
    uint64_t v39 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v39, OS_LOG_TYPE_DEFAULT, "CompetitionManager already sent a pending competition request to this friend", buf, 2u);
    }
    ASLoggingInitialize();
    uint64_t v40 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v40, OS_LOG_TYPE_DEFAULT, "CompetitionManager this is likely due to simultaneous requests from each side", buf, 2u);
    }
    ASLoggingInitialize();
    unint64_t v41 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v41, OS_LOG_TYPE_DEFAULT, "CompetitionManager attempting to auto-accept this request", buf, 2u);
    }
    uint64_t v42 = *(void **)(a1 + 32);
    uint64_t v44 = *(void *)(a1 + 48);
    uint64_t v43 = *(void *)(a1 + 56);
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __91__ASCompetitionManager__handleCompetitionRequestFromFriendWithUUID_activity_cloudKitGroup___block_invoke_314;
    v54[3] = &unk_265216718;
    id v55 = v3;
    objc_msgSend(v42, "_queue_autoAcceptCompetitionRequestFromContact:activity:cloudKitGroup:completion:", v5, v44, v43, v54);
    id v15 = v55;
  }
LABEL_37:
}

uint64_t __91__ASCompetitionManager__handleCompetitionRequestFromFriendWithUUID_activity_cloudKitGroup___block_invoke_314(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __91__ASCompetitionManager__handleCompetitionRequestFromFriendWithUUID_activity_cloudKitGroup___block_invoke_315(uint64_t a1, char a2, uint64_t a3)
{
  if (a3 || (a2 & 1) == 0)
  {
    id v11 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    v11();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __91__ASCompetitionManager__handleCompetitionRequestFromFriendWithUUID_activity_cloudKitGroup___block_invoke_2;
    v12[3] = &unk_2652177A8;
    id v8 = *(id *)(a1 + 72);
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(a1 + 40);
    id v15 = v8;
    v12[4] = v9;
    id v13 = v10;
    id v14 = *(id *)(a1 + 64);
    [WeakRetained updateRelationshipWithCompetitionEvent:105 friendUUID:v5 activity:v6 cloudKitGroup:v7 completion:v12];
  }
}

void __91__ASCompetitionManager__handleCompetitionRequestFromFriendWithUUID_activity_cloudKitGroup___block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  if (!a3 && a2)
  {
    ASLoggingInitialize();
    uint64_t v6 = *MEMORY[0x263F23AB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "Successfully handled incoming competition request, notifying via BB", buf, 2u);
    }
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(NSObject **)(v7 + 96);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __91__ASCompetitionManager__handleCompetitionRequestFromFriendWithUUID_activity_cloudKitGroup___block_invoke_316;
    block[3] = &unk_265216138;
    void block[4] = v7;
    id v10 = *(id *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    dispatch_async(v8, block);
  }
}

uint64_t __91__ASCompetitionManager__handleCompetitionRequestFromFriendWithUUID_activity_cloudKitGroup___block_invoke_316(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_showCompetitionRequestFromFriendWithUUID:competition:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_handleAcceptedCompetitionFromFriendWithUUID:(id)a3 activity:(id)a4 cloudKitGroup:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_deviceParticipatesInAutomaticCompetitionManagement)
  {
    transactionQueue = self->_transactionQueue;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __92__ASCompetitionManager__handleAcceptedCompetitionFromFriendWithUUID_activity_cloudKitGroup___block_invoke;
    v13[3] = &unk_2652177F8;
    v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    [(ASAsyncTransactionQueue *)transactionQueue performTransaction:v13];
  }
  else
  {
    ASLoggingInitialize();
    int v12 = *MEMORY[0x263F23AB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v12, OS_LOG_TYPE_DEFAULT, "CompetitionManager not handling accepted competition, device does not participate in competition management", buf, 2u);
    }
  }
}

void __92__ASCompetitionManager__handleAcceptedCompetitionFromFriendWithUUID_activity_cloudKitGroup___block_invoke(id *a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)a1[4] + 5);
  uint64_t v5 = [WeakRetained contactWithUUID:a1[5]];

  ASLoggingInitialize();
  uint64_t v6 = (os_log_t *)MEMORY[0x263F23AB0];
  uint64_t v7 = (void *)*MEMORY[0x263F23AB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = a1[5];
    id v9 = v7;
    id v10 = [v5 displayName];
    *(_DWORD *)buf = 138543618;
    uint64_t v38 = v8;
    __int16 v39 = 2112;
    uint64_t v40 = v10;
    _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "CompetitionManager handling accepted competition from friend: %{public}@ - %@", buf, 0x16u);
  }
  id v11 = [*((id *)a1[4] + 10) currentCompetitionListForFriendWithUUID:a1[5]];
  int v12 = [v11 currentCompetition];
  if (v12)
  {
    id v13 = [v5 primaryRelationship];
    int v14 = [v13 isCompetitionActive];

    if (v14)
    {
      ASLoggingInitialize();
      id v15 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2474C9000, v15, OS_LOG_TYPE_DEFAULT, "CompetitionManager local view has already acknowledged remote acceptance - just notify", buf, 2u);
      }
      v3[2](v3);
      objc_msgSend(a1[4], "_queue_showCompetitionAcceptedForFriendWithUUID:competition:", a1[5], v12);
    }
    else
    {
      id v16 = [*((id *)a1[4] + 10) currentRemoteCompetitionForContact:v5];
      ASLoggingInitialize();
      int v17 = *v6;
      id v18 = *v6;
      if (v16)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v38 = v16;
          _os_log_impl(&dword_2474C9000, v17, OS_LOG_TYPE_DEFAULT, "CompetitionManager found remote competition: %@", buf, 0xCu);
        }
        ASLoggingInitialize();
        uint64_t v19 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2474C9000, v19, OS_LOG_TYPE_DEFAULT, "CompetitionManager updating local view of competition", buf, 2u);
        }
        uint64_t v20 = [v16 startDateComponents];
        [v12 setStartDateComponents:v20];

        id v21 = [v16 durationDateComponents];
        [v12 setDurationDateComponents:v21];

        id v22 = [v16 preferredVictoryBadgeStyles];
        [v12 setPreferredVictoryBadgeStyles:v22];

        objc_msgSend(v12, "setMaximumNumberOfPointsPerDay:", objc_msgSend(v16, "maximumNumberOfPointsPerDay"));
        os_log_t v36 = v12;
        id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
        [v11 setCompetitions:v23];

        id v24 = a1[4];
        id v25 = a1[6];
        id v26 = a1[7];
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __92__ASCompetitionManager__handleAcceptedCompetitionFromFriendWithUUID_activity_cloudKitGroup___block_invoke_317;
        v29[3] = &unk_265217820;
        uint64_t v27 = v3;
        id v28 = a1[4];
        id v35 = v27;
        v29[4] = v28;
        id v30 = v5;
        id v31 = a1[6];
        id v32 = a1[7];
        id v33 = a1[5];
        id v34 = v12;
        [v24 _saveCurrentCompetitionList:v11 archivedCompetitionList:0 contact:v30 activity:v25 cloudKitGroup:v26 completion:v29];
      }
      else
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          __92__ASCompetitionManager__handleAcceptedCompetitionFromFriendWithUUID_activity_cloudKitGroup___block_invoke_cold_2();
        }
        v3[2](v3);
      }
    }
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR)) {
      __92__ASCompetitionManager__handleAcceptedCompetitionFromFriendWithUUID_activity_cloudKitGroup___block_invoke_cold_1();
    }
    v3[2](v3);
  }
}

void __92__ASCompetitionManager__handleAcceptedCompetitionFromFriendWithUUID_activity_cloudKitGroup___block_invoke_317(uint64_t a1, char a2, uint64_t a3)
{
  if (a3 || (a2 & 1) == 0)
  {
    id v10 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
    v10();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    uint64_t v5 = [*(id *)(a1 + 40) UUID];
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __92__ASCompetitionManager__handleAcceptedCompetitionFromFriendWithUUID_activity_cloudKitGroup___block_invoke_2;
    v11[3] = &unk_2652177A8;
    id v8 = *(id *)(a1 + 80);
    uint64_t v9 = *(void *)(a1 + 32);
    id v14 = v8;
    v11[4] = v9;
    id v12 = *(id *)(a1 + 64);
    id v13 = *(id *)(a1 + 72);
    [WeakRetained updateRelationshipWithCompetitionEvent:106 friendUUID:v5 activity:v6 cloudKitGroup:v7 completion:v11];
  }
}

void __92__ASCompetitionManager__handleAcceptedCompetitionFromFriendWithUUID_activity_cloudKitGroup___block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  if (!a3 && a2)
  {
    ASLoggingInitialize();
    BOOL v4 = *MEMORY[0x263F23AB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v4, OS_LOG_TYPE_DEFAULT, "Successfully acknowledged accepted competition request, notifying via BB", buf, 2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [WeakRetained requestTemplateUpdate];

    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(NSObject **)(v6 + 96);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __92__ASCompetitionManager__handleAcceptedCompetitionFromFriendWithUUID_activity_cloudKitGroup___block_invoke_318;
    block[3] = &unk_265216138;
    void block[4] = v6;
    id v9 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    dispatch_async(v7, block);
  }
}

uint64_t __92__ASCompetitionManager__handleAcceptedCompetitionFromFriendWithUUID_activity_cloudKitGroup___block_invoke_318(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_showCompetitionAcceptedForFriendWithUUID:competition:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_saveCurrentCompetitionList:(id)a3 archivedCompetitionList:(id)a4 contact:(id)a5 activity:(id)a6 cloudKitGroup:(id)a7 completion:(id)a8
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  id v26 = __118__ASCompetitionManager__saveCurrentCompetitionList_archivedCompetitionList_contact_activity_cloudKitGroup_completion___block_invoke;
  uint64_t v27 = &unk_265217848;
  id v28 = self;
  id v20 = v19;
  id v29 = v20;
  id v21 = (void *)MEMORY[0x24C557E50](&v24);
  if (objc_msgSend(v16, "cloudType", v24, v25, v26, v27, v28))
  {
    if (ASSecureCloudEnabled() && [v16 cloudType] == 1)
    {
      [(ASCompetitionManager *)self _saveSecureCloudCompetitionList:v14 archivedCompetitionList:v15 contact:v16 cloudKitGroup:v18 completion:v21];
    }
    else
    {
      ASLoggingInitialize();
      id v22 = *MEMORY[0x263F23AB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v16;
        _os_log_impl(&dword_2474C9000, v22, OS_LOG_TYPE_DEFAULT, "Invalid cloud type to save competition list for contact %@", buf, 0xCu);
      }
      id v23 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F23CC8] code:9 userInfo:0];
      (*((void (**)(id, void, void *))v20 + 2))(v20, 0, v23);
    }
  }
  else
  {
    [(ASCompetitionManager *)self _saveLegacyCompetitionList:v14 archivedCompetitionList:v15 contact:v16 activity:v17 cloudKitGroup:v18 completion:v21];
  }
}

void __118__ASCompetitionManager__saveCurrentCompetitionList_archivedCompetitionList_contact_activity_cloudKitGroup_completion___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(NSObject **)(v9 + 96);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __118__ASCompetitionManager__saveCurrentCompetitionList_archivedCompetitionList_contact_activity_cloudKitGroup_completion___block_invoke_2;
  block[3] = &unk_265217758;
  char v18 = a2;
  id v14 = v7;
  uint64_t v15 = v9;
  id v16 = v8;
  id v17 = *(id *)(a1 + 40);
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v10, block);
}

uint64_t __118__ASCompetitionManager__saveCurrentCompetitionList_archivedCompetitionList_contact_activity_cloudKitGroup_completion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64) && !*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "_queue_handleSavedCompetitionListRecords:", *(void *)(a1 + 48));
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_saveSecureCloudCompetitionList:(id)a3 archivedCompetitionList:(id)a4 contact:(id)a5 cloudKitGroup:(id)a6 completion:(id)a7
{
  p_secureCloudDelegate = &self->_secureCloudDelegate;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_secureCloudDelegate);
  [WeakRetained competitionManager:self saveCurrentCompetitionList:v17 archivedCompetitionList:v16 contact:v15 group:v14 completion:v13];
}

- (void)_saveLegacyCompetitionList:(id)a3 archivedCompetitionList:(id)a4 contact:(id)a5 activity:(id)a6 cloudKitGroup:(id)a7 completion:(id)a8
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  ASLoggingInitialize();
  id v20 = (os_log_t *)MEMORY[0x263F23AB0];
  id v21 = *MEMORY[0x263F23AB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v37 = v14;
    __int16 v38 = 2112;
    id v39 = v15;
    _os_log_impl(&dword_2474C9000, v21, OS_LOG_TYPE_DEFAULT, "CompetitionManager saving competition lists in CloudKit, current: %@ archived: %@", buf, 0x16u);
  }
  id v22 = [v14 systemFieldsOnlyRecord];

  if (!v22)
  {
    ASLoggingInitialize();
    id v23 = *v20;
    if (os_log_type_enabled(*v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v23, OS_LOG_TYPE_DEFAULT, "CompetitionManager current competition list doesn't exist yet, creating", buf, 2u);
    }
  }
  uint64_t v24 = [(ASCompetitionManager *)self recordForCurrentCompetitionList:v14 contact:v16];
  id v35 = v24;
  uint64_t v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];
  if (v15)
  {
    id v34 = v17;
    id v26 = self;
    id v27 = v16;
    id v28 = [v15 systemFieldsOnlyRecord];

    if (!v28)
    {
      ASLoggingInitialize();
      id v29 = *v20;
      if (os_log_type_enabled(*v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2474C9000, v29, OS_LOG_TYPE_DEFAULT, "CompetitionManager archived competition list doesn't exist yet, creating", buf, 2u);
      }
    }
    id v30 = +[ASCloudKitManager relationshipZone];
    id v31 = [v15 recordWithZoneID:v30 recordEncryptionType:0];

    uint64_t v32 = [v25 arrayByAddingObject:v31];

    uint64_t v25 = (void *)v32;
    id v16 = v27;
    self = v26;
    id v17 = v34;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudKitManager);
  [WeakRetained saveRecordsIntoPrivateDatabase:v25 priority:2 activity:v19 group:v18 completion:v17];
}

- (void)_queue_updateScoresWithTodaySummary:(id)a3 yesterdaySummary:(id)a4 activity:(id)a5 cloudKitGroup:(id)a6
{
  uint64_t v109 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v85 = a5;
  id v84 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v12 = (os_log_t *)MEMORY[0x263F23AB0];
  if (self->_hasFetchedProtectedData)
  {
    id v13 = [(ASCompetitionManager *)self _contactsWithActiveCompetitions];
    [MEMORY[0x263EFFA08] set];
    uint64_t v15 = v14 = v12;
    ASLoggingInitialize();
    id v16 = *v14;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = v16;
      *(_DWORD *)buf = 134218240;
      uint64_t v106 = [v13 count];
      __int16 v107 = 2048;
      uint64_t v108 = [v10 _activitySummaryIndex];
      _os_log_impl(&dword_2474C9000, v17, OS_LOG_TYPE_DEFAULT, "CompetitionManager updating scores for competitions with %lu friends, summaryIndex=%lld", buf, 0x16u);
    }
    uint64_t v89 = (void *)v15;
    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    id obj = v13;
    BOOL v87 = self;
    uint64_t v92 = [obj countByEnumeratingWithState:&v100 objects:v104 count:16];
    if (v92)
    {
      v88 = (void *)MEMORY[0x263EFFA68];
      uint64_t v91 = *(void *)v101;
      int v83 = v95;
      *(void *)&long long v18 = 138543618;
      long long v82 = v18;
      id v19 = (os_log_t *)MEMORY[0x263F23AB0];
      do
      {
        for (uint64_t i = 0; i != v92; ++i)
        {
          if (*(void *)v101 != v91) {
            objc_enumerationMutation(obj);
          }
          id v21 = *(void **)(*((void *)&v100 + 1) + 8 * i);
          competitionStore = self->_competitionStore;
          id v23 = objc_msgSend(v21, "UUID", v82, v83);
          uint64_t v24 = [(ASCompetitionStore *)competitionStore currentCompetitionListForFriendWithUUID:v23];

          uint64_t v25 = [v24 currentCompetition];
          ASLoggingInitialize();
          os_log_t v26 = *v19;
          if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
          {
            id v27 = v26;
            id v28 = [v21 displayName];
            *(_DWORD *)buf = 138412546;
            uint64_t v106 = (uint64_t)v28;
            __int16 v107 = 2112;
            uint64_t v108 = (uint64_t)v25;
            _os_log_impl(&dword_2474C9000, v27, OS_LOG_TYPE_DEFAULT, "Current competition for friend %@ is %@", buf, 0x16u);
          }
          if (v25)
          {
            if (ASCompetitionNeedsScoreUpdateForSummary())
            {
              ASLoggingInitialize();
              os_log_t v29 = *v19;
              if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
              {
                id v30 = v29;
                id v31 = [v21 UUID];
                *(_DWORD *)buf = 138412546;
                uint64_t v106 = (uint64_t)v31;
                __int16 v107 = 2112;
                uint64_t v108 = (uint64_t)v25;
                _os_log_impl(&dword_2474C9000, v30, OS_LOG_TYPE_DEFAULT, "CompetitionManager updating competition score for friend with UUID:%@ with current competition: %@", buf, 0x16u);
              }
              uint64_t v32 = [v25 myTotalScore];
              uint64_t v33 = [v25 currentCacheIndex];
              id v34 = ASCompetitionCalculateUpdatedScores();
              [v25 setScores:v34];

              objc_msgSend(v25, "setCurrentCacheIndex:", objc_msgSend(v10, "_activitySummaryIndex"));
              ASLoggingInitialize();
              os_log_t v35 = *v19;
              if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
              {
                os_log_t v36 = v35;
                [v25 scores];
                uint64_t v86 = v32;
                uint64_t v37 = v33;
                id v38 = v11;
                uint64_t v40 = v39 = v10;
                uint64_t v41 = ASFormattedSequence();
                uint64_t v42 = [v25 myTotalScore];
                *(_DWORD *)buf = 138412546;
                uint64_t v106 = (uint64_t)v41;
                __int16 v107 = 2048;
                uint64_t v108 = v42;
                _os_log_impl(&dword_2474C9000, v36, OS_LOG_TYPE_DEFAULT, "CompetitionManager calculated new scores: %@(=%lu)", buf, 0x16u);

                id v10 = v39;
                id v11 = v38;
                uint64_t v33 = v37;
                uint64_t v32 = v86;

                id v19 = (os_log_t *)MEMORY[0x263F23AB0];
              }
              if ([v25 myTotalScore] == v32 && objc_msgSend(v25, "currentCacheIndex") == v33)
              {
                ASLoggingInitialize();
                uint64_t v43 = *v19;
                self = v87;
                if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_2474C9000, v43, OS_LOG_TYPE_DEFAULT, "CompetitionManager no change in scores, not persisting or notifying", buf, 2u);
                }
              }
              else
              {
                uint64_t v48 = [v88 arrayByAddingObject:v24];

                id v49 = [v21 UUID];
                uint64_t v50 = [v89 setByAddingObject:v49];

                v88 = (void *)v48;
                id v19 = (os_log_t *)MEMORY[0x263F23AB0];
                uint64_t v89 = (void *)v50;
                self = v87;
              }
            }
            else if ([v10 isPaused])
            {
              objc_msgSend(v25, "setCurrentCacheIndex:", objc_msgSend(v10, "_activitySummaryIndex"));
            }
            if (self->_deviceParticipatesInAutomaticCompetitionManagement
              && [v25 hasCalculatedFinalScore]
              && ([v25 hasPushedFinalScore] & 1) == 0)
            {
              ASLoggingInitialize();
              id v51 = *v19;
              if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_2474C9000, v51, OS_LOG_TYPE_DEFAULT, "CompetitionManager competition is ready to push final cache index, pushing immediately", buf, 2u);
              }
              transactionQueue = self->_transactionQueue;
              v94[0] = MEMORY[0x263EF8330];
              v94[1] = 3221225472;
              v95[0] = __100__ASCompetitionManager__queue_updateScoresWithTodaySummary_yesterdaySummary_activity_cloudKitGroup___block_invoke;
              v95[1] = &unk_265217898;
              v95[2] = self;
              id v96 = v24;
              v97 = v21;
              id v98 = v85;
              id v99 = v84;
              [(ASAsyncTransactionQueue *)transactionQueue performTransaction:v94];

              id v19 = (os_log_t *)MEMORY[0x263F23AB0];
            }
          }
          else
          {
            ASLoggingInitialize();
            os_log_t v44 = *v19;
            if (os_log_type_enabled(*v19, OS_LOG_TYPE_ERROR))
            {
              uint64_t v45 = v44;
              uint64_t v46 = [v21 UUID];
              uint64_t v47 = [v21 displayName];
              *(_DWORD *)buf = v82;
              uint64_t v106 = (uint64_t)v46;
              __int16 v107 = 2112;
              uint64_t v108 = (uint64_t)v47;
              _os_log_error_impl(&dword_2474C9000, v45, OS_LOG_TYPE_ERROR, "Competition is active with friend, but couldn't find a current competition: %{public}@ - %@", buf, 0x16u);
            }
          }
        }
        uint64_t v92 = [obj countByEnumeratingWithState:&v100 objects:v104 count:16];
      }
      while (v92);
    }
    else
    {
      v88 = (void *)MEMORY[0x263EFFA68];
    }

    long long v54 = v88;
    id v55 = v89;
    if ([v88 count])
    {
      if (self->_deviceParticipatesInAutomaticCompetitionManagement)
      {
        v93[0] = MEMORY[0x263EF8330];
        v93[1] = 3221225472;
        v93[2] = __100__ASCompetitionManager__queue_updateScoresWithTodaySummary_yesterdaySummary_activity_cloudKitGroup___block_invoke_4;
        v93[3] = &unk_2652178C0;
        v93[4] = self;
        uint64_t v56 = objc_msgSend(obj, "hk_map:", v93);
        long long v57 = objc_msgSend(v56, "hk_filter:", &__block_literal_global_16);
        if ([v57 count])
        {
          id v58 = self;
          id v59 = v11;
          id v60 = v10;
          uint64_t v61 = [v57 anyObject];
          uint64_t v62 = v58->_competitionStore;
          __int16 v63 = [v61 UUID];
          id v64 = [(ASCompetitionStore *)v62 currentCompetitionListForFriendWithUUID:v63];

          id v65 = [v64 currentCompetition];
          ASLoggingInitialize();
          id v66 = (os_log_t *)MEMORY[0x263F23AB0];
          id v67 = (void *)*MEMORY[0x263F23AB0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
          {
            char v68 = v67;
            uint64_t v69 = [v61 UUID];
            *(_DWORD *)buf = 138412546;
            uint64_t v106 = (uint64_t)v69;
            __int16 v107 = 2112;
            uint64_t v108 = (uint64_t)v65;
            _os_log_impl(&dword_2474C9000, v68, OS_LOG_TYPE_DEFAULT, "CompetitionManager is evaluating whether score cap has been hit with friend with UUID: %@, competition: %@", buf, 0x16u);

            id v66 = (os_log_t *)MEMORY[0x263F23AB0];
          }
          ASLoggingInitialize();
          uint64_t v70 = *v66;
          if (os_log_type_enabled(*v66, OS_LOG_TYPE_DEFAULT))
          {
            scoreCapCelebrationAnchor = v87->_scoreCapCelebrationAnchor;
            *(_DWORD *)buf = 138412290;
            uint64_t v106 = (uint64_t)scoreCapCelebrationAnchor;
            _os_log_impl(&dword_2474C9000, v70, OS_LOG_TYPE_DEFAULT, "CompetitionManager current score cap celebration anchor is %@", buf, 0xCu);
          }
          uint64_t v72 = [(NSNumber *)v87->_scoreCapCelebrationAnchor integerValue];
          if (v72 >= [v65 currentCacheIndex])
          {
            ASLoggingInitialize();
            v81 = *MEMORY[0x263F23AB0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2474C9000, v81, OS_LOG_TYPE_DEFAULT, "CompetitionManager score cap celebration has already been alerted about today", buf, 2u);
            }
          }
          else
          {
            [v65 currentCacheIndex];
            unint64_t v73 = ASCompetitionDailyScoreForParticipantWithCacheIndex();
            unint64_t v74 = [v65 maximumNumberOfPointsPerDay];
            v75 = (os_log_t *)MEMORY[0x263F23AB0];
            if (v73 >= v74)
            {
              ASLoggingInitialize();
              os_log_t v76 = *v75;
              if (os_log_type_enabled(*v75, OS_LOG_TYPE_DEFAULT))
              {
                long long v77 = v76;
                uint64_t v78 = [v65 maximumNumberOfPointsPerDay];
                *(_DWORD *)buf = 134218240;
                uint64_t v106 = v73;
                __int16 v107 = 2048;
                uint64_t v108 = v78;
                _os_log_impl(&dword_2474C9000, v77, OS_LOG_TYPE_DEFAULT, "CompetitionManager today score of %lu is greater than score cap of %lu, posting score cap celebration", buf, 0x16u);
              }
              [(ASCompetitionManager *)v87 _queue_showScoreCapCelebrationForFriendsWithCappedInProgressCompetitions:v57];
              long long v79 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v65, "currentCacheIndex"));
              [(ASCompetitionManager *)v87 _setScoreCapCelebrationAnchor:v79];
            }
          }

          id v10 = v60;
          id v11 = v59;
          self = v87;
          long long v54 = v88;
          id v55 = v89;
        }
        else
        {
          ASLoggingInitialize();
          v80 = *MEMORY[0x263F23AB0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2474C9000, v80, OS_LOG_TYPE_DEFAULT, "CompetitionManager not posting score cap celebration, couldn't find any friends with active competitions", buf, 2u);
          }
        }
      }
      [(ASCompetitionStore *)self->_competitionStore saveCompetitionLists:v54];
      [(ASCompetitionManager *)self _queue_notifyObserversOfCompetitionUpdatesForFriendsWithUUIDs:v55];
    }
  }
  else
  {
    ASLoggingInitialize();
    id v53 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v53, OS_LOG_TYPE_DEFAULT, "CompetitionManager not updating scores, protected data not yet fetched", buf, 2u);
    }
  }
}

void __100__ASCompetitionManager__queue_updateScoresWithTodaySummary_yesterdaySummary_activity_cloudKitGroup___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v7 = a1[6];
  uint64_t v6 = (void *)a1[7];
  uint64_t v8 = a1[8];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __100__ASCompetitionManager__queue_updateScoresWithTodaySummary_yesterdaySummary_activity_cloudKitGroup___block_invoke_2;
  v10[3] = &unk_265217870;
  v10[4] = v4;
  void v10[5] = v7;
  id v11 = v6;
  id v12 = (id)a1[8];
  id v13 = v3;
  id v9 = v3;
  [v4 _saveCurrentCompetitionList:v5 archivedCompetitionList:0 contact:v7 activity:v11 cloudKitGroup:v8 completion:v10];
}

void __100__ASCompetitionManager__queue_updateScoresWithTodaySummary_yesterdaySummary_activity_cloudKitGroup___block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  if (a3 || !a2)
  {
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v8();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    uint64_t v5 = [*(id *)(a1 + 40) UUID];
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __100__ASCompetitionManager__queue_updateScoresWithTodaySummary_yesterdaySummary_activity_cloudKitGroup___block_invoke_3;
    v9[3] = &unk_265216718;
    id v10 = *(id *)(a1 + 64);
    [WeakRetained updateRelationshipWithCompetitionEvent:13 friendUUID:v5 activity:v6 cloudKitGroup:v7 completion:v9];
  }
}

uint64_t __100__ASCompetitionManager__queue_updateScoresWithTodaySummary_yesterdaySummary_activity_cloudKitGroup___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __100__ASCompetitionManager__queue_updateScoresWithTodaySummary_yesterdaySummary_activity_cloudKitGroup___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (id *)(*(void *)(a1 + 32) + 48);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = [v3 UUID];

  uint64_t v6 = [WeakRetained friendWithUUID:v5];

  return v6;
}

BOOL __100__ASCompetitionManager__queue_updateScoresWithTodaySummary_yesterdaySummary_activity_cloudKitGroup___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 currentCompetition];
  uint64_t v4 = [v3 stage];

  uint64_t v5 = [v2 currentCompetition];

  uint64_t v6 = [v5 maximumNumberOfPointsPerDay];
  return v4 == 1 && v6 != 0;
}

- (void)_queue_handleSavedCompetitionListRecords:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  serialQueue = self->_serialQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(serialQueue);
  uint64_t v6 = objc_msgSend(v5, "hk_filter:", &__block_literal_global_326);

  ASLoggingInitialize();
  uint64_t v7 = (void *)*MEMORY[0x263F23AB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v7;
    *(_DWORD *)buf = 134217984;
    uint64_t v13 = [v6 count];
    _os_log_impl(&dword_2474C9000, v8, OS_LOG_TYPE_DEFAULT, "CompetitionManager handling %ld competition list records", buf, 0xCu);
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __65__ASCompetitionManager__queue_handleSavedCompetitionListRecords___block_invoke_327;
  v11[3] = &unk_265217908;
  v11[4] = self;
  id v9 = objc_msgSend(v6, "hk_map:", v11);
  [(ASCompetitionStore *)self->_competitionStore saveCompetitionLists:v9];
  id v10 = objc_msgSend(v9, "hk_mapToSet:", &__block_literal_global_333_0);
  [(ASCompetitionManager *)self _queue_notifyObserversOfCompetitionUpdatesForFriendsWithUUIDs:v10];
}

uint64_t __65__ASCompetitionManager__queue_handleSavedCompetitionListRecords___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 recordType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F239B0]];

  return v3;
}

id __65__ASCompetitionManager__queue_handleSavedCompetitionListRecords___block_invoke_327(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F23BB8] competitionListWithRecord:a2];
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 80);
  id v5 = [v3 friendUUID];
  uint64_t v6 = [v4 currentCompetitionListForFriendWithUUID:v5];

  uint64_t v7 = [v3 currentCompetition];
  uint64_t v8 = [v6 currentCompetition];
  id v9 = [v8 UUID];
  id v10 = [v7 UUID];
  if ([v9 isEqual:v10])
  {
    uint64_t v11 = [v8 opponentTotalScore];
    uint64_t v12 = [v7 opponentTotalScore];

    if (v11 == v12) {
      goto LABEL_8;
    }
    ASLoggingInitialize();
    uint64_t v13 = (void *)*MEMORY[0x263F23AB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = v13;
      uint64_t v15 = [v7 UUID];
      int v17 = 138412290;
      long long v18 = v15;
      _os_log_impl(&dword_2474C9000, v14, OS_LOG_TYPE_DEFAULT, "CompetitionManager local view of competition %@ has a more up-to-date opponent score, keeping it", (uint8_t *)&v17, 0xCu);
    }
    id v9 = [v8 opponentScores];
    [v7 setOpponentScores:v9];
  }
  else
  {
  }
LABEL_8:

  return v3;
}

uint64_t __65__ASCompetitionManager__queue_handleSavedCompetitionListRecords___block_invoke_330(uint64_t a1, void *a2)
{
  return [a2 friendUUID];
}

- (void)_queue_handleNewRemoteCompetitionList:(id)a3 contact:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  ASLoggingInitialize();
  uint64_t v8 = (NSObject **)MEMORY[0x263F23AB0];
  id v9 = *MEMORY[0x263F23AB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v6;
    _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "CompetitionManager saving remote competition list: %@", buf, 0xCu);
  }
  [(ASCompetitionStore *)self->_competitionStore saveRemoteCompetitionList:v6];
  id v10 = [v7 primaryRelationship];
  int v11 = [v10 isCompetitionActive];

  if (v11)
  {
    competitionStore = self->_competitionStore;
    uint64_t v13 = [v7 UUID];
    uint64_t v14 = [(ASCompetitionStore *)competitionStore currentCompetitionListForFriendWithUUID:v13];

    uint64_t v15 = [v14 currentCompetition];
    id v16 = [v6 currentCompetition];
    int v17 = [v15 UUID];
    long long v18 = [v16 UUID];
    int v19 = [v17 isEqual:v18];

    ASLoggingInitialize();
    id v20 = *v8;
    id v21 = *v8;
    if (v19)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2474C9000, v20, OS_LOG_TYPE_DEFAULT, "CompetitionManager updating local competition to reflect remote opponent score", buf, 2u);
      }
      id v22 = [v16 scores];
      [v15 setOpponentScores:v22];

      id v23 = self->_competitionStore;
      uint64_t v25 = v14;
      uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
      [(ASCompetitionStore *)v23 saveCompetitionLists:v24];
    }
    else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      -[ASCompetitionManager _queue_handleNewRemoteCompetitionList:contact:]();
    }
  }
}

- (void)_queue_showCompetitionRequestFromFriendWithUUID:(id)a3 competition:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([(NSSet *)self->_existingFriendUUIDsAwaitingMyCompetitionResponse containsObject:v6])
  {
    ASLoggingInitialize();
    uint64_t v8 = *MEMORY[0x263F23AB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_2474C9000, v8, OS_LOG_TYPE_DEFAULT, "Not posting competition request bulletin for friend UUID %@, previously posted", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    id v9 = [(NSSet *)self->_existingFriendUUIDsAwaitingMyCompetitionResponse setByAddingObject:v6];
    existingFriendUUIDsAwaitingMyCompetitionResponse = self->_existingFriendUUIDsAwaitingMyCompetitionResponse;
    self->_existingFriendUUIDsAwaitingMyCompetitionResponse = v9;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_friendListManager);
    uint64_t v12 = [WeakRetained friendWithUUID:v6];

    ASLoggingInitialize();
    uint64_t v13 = (void *)*MEMORY[0x263F23AB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = v13;
      uint64_t v15 = [v12 displayName];
      int v17 = 138543618;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v15;
      _os_log_impl(&dword_2474C9000, v14, OS_LOG_TYPE_DEFAULT, "CompetitionManager posting competition request bulletin for friend: %{public}@ - %@", (uint8_t *)&v17, 0x16u);
    }
    id v16 = objc_loadWeakRetained((id *)&self->_competitionBulletinManager);
    [v16 showCompetitionRequestNotificationForFriend:v12 competition:v7 withPostingStyle:0];
  }
}

- (void)_queue_showCompetitionAcceptedForFriendWithUUID:(id)a3 competition:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([(NSSet *)self->_existingFriendUUIDsWithAcceptedCompetitionRequestsFromMe containsObject:v6])
  {
    ASLoggingInitialize();
    uint64_t v8 = *MEMORY[0x263F23AB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_2474C9000, v8, OS_LOG_TYPE_DEFAULT, "Not posting bulletin competition accepted bulletin for friend UUID %@, previously posted", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    id v9 = [(NSSet *)self->_existingFriendUUIDsWithAcceptedCompetitionRequestsFromMe setByAddingObject:v6];
    existingFriendUUIDsWithAcceptedCompetitionRequestsFromMe = self->_existingFriendUUIDsWithAcceptedCompetitionRequestsFromMe;
    self->_existingFriendUUIDsWithAcceptedCompetitionRequestsFromMe = v9;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_friendListManager);
    uint64_t v12 = [WeakRetained friendWithUUID:v6];

    ASLoggingInitialize();
    uint64_t v13 = (void *)*MEMORY[0x263F23AB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = v13;
      uint64_t v15 = [v12 displayName];
      int v17 = 138543618;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v15;
      _os_log_impl(&dword_2474C9000, v14, OS_LOG_TYPE_DEFAULT, "CompetitionManager posting competition accepted bulletin for friend: %{public}@ - %@", (uint8_t *)&v17, 0x16u);
    }
    id v16 = objc_loadWeakRetained((id *)&self->_competitionBulletinManager);
    [v16 showCompetitionAcceptedNotificationForFriend:v12 competition:v7 withPostingStyle:0];
  }
}

- (void)_queue_showCompetitionEndedWithFriendWithUUID:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([(NSSet *)self->_existingFriendUUIDsWithCompletedCompetitions containsObject:v4])
  {
    ASLoggingInitialize();
    id v5 = *MEMORY[0x263F23AB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v4;
      _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "Not posting bulletin competition completed bulletin for friend UUID %@, previously posted", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    id v6 = [(NSSet *)self->_existingFriendUUIDsWithCompletedCompetitions setByAddingObject:v4];
    existingFriendUUIDsWithCompletedCompetitions = self->_existingFriendUUIDsWithCompletedCompetitions;
    self->_existingFriendUUIDsWithCompletedCompetitions = v6;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_friendListManager);
    id v9 = [WeakRetained friendWithUUID:v4];

    ASLoggingInitialize();
    id v10 = (void *)*MEMORY[0x263F23AB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = v10;
      uint64_t v12 = [v9 displayName];
      int v15 = 138543618;
      id v16 = v4;
      __int16 v17 = 2112;
      id v18 = v12;
      _os_log_impl(&dword_2474C9000, v11, OS_LOG_TYPE_DEFAULT, "CompetitionManager posting competition ended with friend: %{public}@ - %@", (uint8_t *)&v15, 0x16u);
    }
    id v13 = objc_loadWeakRetained((id *)&self->_competitionBulletinManager);
    uint64_t v14 = [v9 mostRecentlyCompletedCompetition];
    [v13 showCompetitionEndedNotificationForFriend:v9 competition:v14 withPostingStyle:0];
  }
}

- (void)_queue_showScoreCapCelebrationForFriendsWithCappedInProgressCompetitions:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  ASLoggingInitialize();
  id v5 = *MEMORY[0x263F23AB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "CompetitionManager posting score cap celebration with friends %@", (uint8_t *)&v7, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_competitionBulletinManager);
  [WeakRetained showCompetitionScoreCapCelebrationForFriends:v4 withPostingStyle:0];
}

- (void)_queue_autoAcceptCompetitionRequestFromContact:(id)a3 activity:(id)a4 cloudKitGroup:(id)a5 completion:(id)a6
{
  v43[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t v14 = [(ASCompetitionStore *)self->_competitionStore currentRemoteCompetitionForContact:v10];
  if (v14)
  {
    competitionStore = self->_competitionStore;
    id v16 = [v10 UUID];
    __int16 v17 = [(ASCompetitionStore *)competitionStore currentCompetitionListForFriendWithUUID:v16];

    id v18 = [v17 competitions];
    uint64_t v19 = [v18 firstObject];

    ASLoggingInitialize();
    id v20 = *MEMORY[0x263F23AB0];
    if (v19)
    {
      id v34 = v12;
      os_log_t v35 = v11;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2474C9000, v20, OS_LOG_TYPE_DEFAULT, "CompetitionManager comparing UUIDs to decide if we should accept", buf, 2u);
      }
      uint64_t v21 = [v14 UUID];
      id v22 = [v21 UUIDString];
      uint64_t v33 = v19;
      id v23 = [v19 UUID];
      uint64_t v24 = [v23 UUIDString];
      uint64_t v25 = [v22 compare:v24];

      ASLoggingInitialize();
      os_log_t v26 = *MEMORY[0x263F23AB0];
      BOOL v27 = os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT);
      if (v25 == -1)
      {
        id v11 = v35;
        if (v27)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2474C9000, v26, OS_LOG_TYPE_DEFAULT, "CompetitionManager this device should accept, rebuilding local competition in accepting role", buf, 2u);
        }
        os_log_t v29 = [v10 UUID];
        id v31 = [(ASCompetitionManager *)self _localCompetitionForRemoteCompetition:v14 friendUUID:v29];

        v43[0] = v31;
        id v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:1];
        [v17 setCompetitions:v30];

        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __105__ASCompetitionManager__queue_autoAcceptCompetitionRequestFromContact_activity_cloudKitGroup_completion___block_invoke;
        v36[3] = &unk_2652177D0;
        id v41 = v13;
        v36[4] = self;
        id v37 = v10;
        id v38 = v35;
        id v12 = v34;
        id v39 = v34;
        id v40 = v31;
        id v32 = v31;
        [(ASCompetitionManager *)self _saveCurrentCompetitionList:v17 archivedCompetitionList:0 contact:v37 activity:v38 cloudKitGroup:v39 completion:v36];
      }
      else
      {
        id v12 = v34;
        id v11 = v35;
        if (v27)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2474C9000, v26, OS_LOG_TYPE_DEFAULT, "CompetitionManager this device should *not* accept", buf, 2u);
        }
        (*((void (**)(id, uint64_t, void))v13 + 2))(v13, 1, 0);
      }
      uint64_t v19 = v33;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_ERROR)) {
        -[ASCompetitionManager _queue_autoAcceptCompetitionRequestFromContact:activity:cloudKitGroup:completion:]();
      }
      uint64_t v28 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F23CC8] code:5 userInfo:0];
      (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v28);
    }
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_ERROR)) {
      -[ASCompetitionManager _queue_autoAcceptCompetitionRequestFromContact:activity:cloudKitGroup:completion:]();
    }
    __int16 v17 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F23CC8] code:6 userInfo:0];
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v17);
  }
}

void __105__ASCompetitionManager__queue_autoAcceptCompetitionRequestFromContact_activity_cloudKitGroup_completion___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  if (a3 || (a2 & 1) == 0)
  {
    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    v9();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    id v5 = [*(id *)(a1 + 40) UUID];
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __105__ASCompetitionManager__queue_autoAcceptCompetitionRequestFromContact_activity_cloudKitGroup_completion___block_invoke_2;
    v10[3] = &unk_265217950;
    id v8 = *(void **)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v11 = v8;
    id v12 = *(id *)(a1 + 64);
    id v13 = *(id *)(a1 + 72);
    [WeakRetained updateRelationshipWithCompetitionEvent:11 friendUUID:v5 activity:v6 cloudKitGroup:v7 completion:v10];
  }
}

void __105__ASCompetitionManager__queue_autoAcceptCompetitionRequestFromContact_activity_cloudKitGroup_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (!v5 && a2)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(NSObject **)(v6 + 96);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __105__ASCompetitionManager__queue_autoAcceptCompetitionRequestFromContact_activity_cloudKitGroup_completion___block_invoke_3;
    block[3] = &unk_265216138;
    void block[4] = v6;
    id v9 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    dispatch_async(v7, block);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __105__ASCompetitionManager__queue_autoAcceptCompetitionRequestFromContact_activity_cloudKitGroup_completion___block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) UUID];
  objc_msgSend(v2, "_queue_showCompetitionAcceptedForFriendWithUUID:competition:", v3, *(void *)(a1 + 48));
}

- (void)_queue_completeCompetitionIfNecessaryForFriendWithUUID:(id)a3 activity:(id)a4 cloudKitGroup:(id)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (self->_deviceParticipatesInAutomaticCompetitionManagement)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_contactsManager);
    id v12 = [WeakRetained contactWithUUID:v8];

    id v13 = [v12 primaryRelationship];
    int v14 = [v13 isCompetitionActive];

    if (v14)
    {
      int v15 = [(ASCompetitionStore *)self->_competitionStore currentRemoteCompetitionForContact:v12];
      competitionStore = self->_competitionStore;
      __int16 v17 = [v12 UUID];
      id v18 = [(ASCompetitionStore *)competitionStore currentCompetitionListForFriendWithUUID:v17];

      uint64_t v19 = [v18 currentCompetition];
      if (v19 && v15)
      {
        if (ASCompetitionIsReadyToComplete())
        {
          ASLoggingInitialize();
          id v20 = (void *)*MEMORY[0x263F23AB0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
          {
            log = v20;
            BOOL v27 = [v12 UUID];
            uint64_t v21 = [v12 displayName];
            *(_DWORD *)buf = 138543618;
            id v39 = v27;
            __int16 v40 = 2112;
            id v41 = v21;
            _os_log_impl(&dword_2474C9000, log, OS_LOG_TYPE_DEFAULT, "CompetitionManager competition with friend is ready to complete: %{public}@ - %@", buf, 0x16u);
          }
          transactionQueue = self->_transactionQueue;
          v29[0] = MEMORY[0x263EF8330];
          v29[1] = 3221225472;
          v29[2] = __102__ASCompetitionManager__queue_completeCompetitionIfNecessaryForFriendWithUUID_activity_cloudKitGroup___block_invoke;
          v29[3] = &unk_2652179A0;
          id v30 = v19;
          id v31 = v15;
          id v32 = self;
          id v33 = v18;
          id v34 = v12;
          id v35 = v9;
          id v36 = v10;
          id v37 = v8;
          [(ASAsyncTransactionQueue *)transactionQueue performTransaction:v29];
        }
      }
      else
      {
        ASLoggingInitialize();
        id v23 = (void *)*MEMORY[0x263F23AB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_ERROR))
        {
          uint64_t v24 = v23;
          uint64_t v25 = [v12 UUID];
          os_log_t v26 = [v12 displayName];
          *(_DWORD *)buf = 138544130;
          id v39 = v25;
          __int16 v40 = 2112;
          id v41 = v26;
          __int16 v42 = 2112;
          uint64_t v43 = v19;
          __int16 v44 = 2112;
          uint64_t v45 = v15;
          _os_log_error_impl(&dword_2474C9000, v24, OS_LOG_TYPE_ERROR, "CompetitionManager tried to check if competition is ready to complete, but couldn't find both a local and remote view of the competition: %{public}@ - %@, localCompetition=%@, remoteCompetition=%@", buf, 0x2Au);
        }
      }
    }
  }
}

void __102__ASCompetitionManager__queue_completeCompetitionIfNecessaryForFriendWithUUID_activity_cloudKitGroup___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  ASLoggingInitialize();
  id v4 = *MEMORY[0x263F23AB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v4, OS_LOG_TYPE_DEFAULT, "CompetitionManager pushing competition one last time with updated opponent score", buf, 2u);
  }
  id v5 = [*(id *)(a1 + 40) scores];
  [*(id *)(a1 + 32) setOpponentScores:v5];

  uint64_t v6 = *(void **)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  id v8 = *(void **)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 72);
  uint64_t v10 = *(void *)(a1 + 80);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __102__ASCompetitionManager__queue_completeCompetitionIfNecessaryForFriendWithUUID_activity_cloudKitGroup___block_invoke_334;
  v12[3] = &unk_2652177D0;
  id v17 = v3;
  v12[4] = v6;
  id v13 = v8;
  id v14 = *(id *)(a1 + 72);
  id v15 = *(id *)(a1 + 80);
  id v16 = *(id *)(a1 + 88);
  id v11 = v3;
  [v6 _saveCurrentCompetitionList:v7 archivedCompetitionList:0 contact:v8 activity:v9 cloudKitGroup:v10 completion:v12];
}

void __102__ASCompetitionManager__queue_completeCompetitionIfNecessaryForFriendWithUUID_activity_cloudKitGroup___block_invoke_334(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_ERROR)) {
      __102__ASCompetitionManager__queue_completeCompetitionIfNecessaryForFriendWithUUID_activity_cloudKitGroup___block_invoke_334_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    uint64_t v7 = [*(id *)(a1 + 40) UUID];
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __102__ASCompetitionManager__queue_completeCompetitionIfNecessaryForFriendWithUUID_activity_cloudKitGroup___block_invoke_335;
    v10[3] = &unk_265217978;
    v10[4] = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 64);
    id v12 = *(id *)(a1 + 72);
    [WeakRetained updateRelationshipWithCompetitionEvent:14 friendUUID:v7 activity:v8 cloudKitGroup:v9 completion:v10];
  }
}

uint64_t __102__ASCompetitionManager__queue_completeCompetitionIfNecessaryForFriendWithUUID_activity_cloudKitGroup___block_invoke_335(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a3 && a2)
  {
    ASLoggingInitialize();
    uint64_t v6 = (os_log_t *)MEMORY[0x263F23AB0];
    uint64_t v7 = *MEMORY[0x263F23AB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v7, OS_LOG_TYPE_DEFAULT, "CompetitionManager successfully completed competition", buf, 2u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
    uint64_t v9 = [WeakRetained contactWithUUID:*(void *)(a1 + 40)];

    uint64_t v10 = [v9 primaryRemoteRelationship];
    int v11 = [v10 hasCompletedCompetition];

    if (v11)
    {
      ASLoggingInitialize();
      id v12 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2474C9000, v12, OS_LOG_TYPE_DEFAULT, "CompetitionManager remote competition is also complete, we can notify", buf, 2u);
      }
      id v13 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
      [v13 requestEarnedInstanceUpdate];

      id v14 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
      [v14 removeUnusedTemplatesForFriendWithUUID:*(void *)(a1 + 40)];

      uint64_t v15 = *(void *)(a1 + 32);
      id v16 = *(NSObject **)(v15 + 96);
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __102__ASCompetitionManager__queue_completeCompetitionIfNecessaryForFriendWithUUID_activity_cloudKitGroup___block_invoke_336;
      v18[3] = &unk_2652157C8;
      v18[4] = v15;
      id v19 = *(id *)(a1 + 40);
      dispatch_async(v16, v18);
    }
  }
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), a2, a3, a4, a5);
}

uint64_t __102__ASCompetitionManager__queue_completeCompetitionIfNecessaryForFriendWithUUID_activity_cloudKitGroup___block_invoke_336(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_showCompetitionEndedWithFriendWithUUID:", *(void *)(a1 + 40));
}

- (void)_queue_notifyObserversOfCompetitionUpdatesForFriendsWithUUIDs:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([v4 count])
  {
    observerQueue = self->_observerQueue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __86__ASCompetitionManager__queue_notifyObserversOfCompetitionUpdatesForFriendsWithUUIDs___block_invoke;
    v6[3] = &unk_2652157C8;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(observerQueue, v6);
  }
}

void __86__ASCompetitionManager__queue_notifyObserversOfCompetitionUpdatesForFriendsWithUUIDs___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 112);
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
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "competitionManager:didUpdateCompetitionsForFriendsWithUUIDs:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)_archivedCompetitionListByMergingCurrentCompetitionList:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  ASLoggingInitialize();
  uint64_t v5 = (os_log_t *)MEMORY[0x263F23AB0];
  uint64_t v6 = *MEMORY[0x263F23AB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
    _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "CompetitionManager building new archived competition list", (uint8_t *)&v25, 2u);
  }
  long long v7 = [v4 currentCompetition];
  if (v7)
  {
    competitionStore = self->_competitionStore;
    long long v9 = [v4 friendUUID];
    long long v10 = [(ASCompetitionStore *)competitionStore archivedCompetitionListForFriendWithUUID:v9];

    if (!v10)
    {
      ASLoggingInitialize();
      os_log_t v11 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = v11;
        id v13 = [v4 friendUUID];
        int v25 = 138543362;
        os_log_t v26 = v13;
        _os_log_impl(&dword_2474C9000, v12, OS_LOG_TYPE_DEFAULT, "CompetitionManager didn't find an existing archived competition list, creating one for friend: %{public}@", (uint8_t *)&v25, 0xCu);
      }
      id v14 = objc_alloc(MEMORY[0x263F23BB8]);
      uint64_t v15 = [v4 friendUUID];
      long long v10 = (void *)[v14 initWithFriendUUID:v15 type:1];
    }
    id v16 = [v10 competitions];
    id v17 = [v16 arrayByAddingObject:v7];
    [v10 setCompetitions:v17];

    id v18 = [v10 competitions];
    id v19 = ASCompetitionsEligibleForArchival();
    [v10 setCompetitions:v19];

    ASLoggingInitialize();
    os_log_t v20 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = v20;
      id v22 = [v10 competitions];
      int v25 = 138412290;
      os_log_t v26 = v22;
      _os_log_impl(&dword_2474C9000, v21, OS_LOG_TYPE_DEFAULT, "CompetitionManager built new archived competition list: %@", (uint8_t *)&v25, 0xCu);
    }
  }
  else
  {
    ASLoggingInitialize();
    id v23 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_2474C9000, v23, OS_LOG_TYPE_DEFAULT, "CompetitionManager didn't find an existing competition to archive", (uint8_t *)&v25, 2u);
    }
    long long v10 = 0;
  }

  return v10;
}

- (id)_loadOrCreateCurrentCompetitionListForFriendWithUUID:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(ASCompetitionStore *)self->_competitionStore currentCompetitionListForFriendWithUUID:v4];
  if (!v5)
  {
    ASLoggingInitialize();
    uint64_t v6 = *MEMORY[0x263F23AB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = v4;
      _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "CompetitionManager didn't find an existing current competition list, creating one for friend: %{public}@", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F23BB8]) initWithFriendUUID:v4 type:0];
  }

  return v5;
}

- (id)_localCompetitionForRemoteCompetition:(id)a3 friendUUID:(id)a4
{
  v25[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = (objc_class *)MEMORY[0x263F23BB0];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  uint64_t v10 = [v8 UUID];
  [v9 setUUID:v10];

  os_log_t v11 = [v8 startDateComponents];
  [v9 setStartDateComponents:v11];

  uint64_t v12 = [v8 durationDateComponents];
  [v9 setDurationDateComponents:v12];

  p_friendListManager = &self->_friendListManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_friendListManager);
  uint64_t v15 = [WeakRetained friendWithUUID:v7];

  id v16 = objc_loadWeakRetained((id *)p_friendListManager);
  id v17 = [v16 friends];
  id v18 = ASPreferredCompetitionVictoryBadgeStylesForFriend();

  id v19 = [v8 preferredVictoryBadgeStyles];
  uint64_t v20 = ASBestCompetitionVictoryBadgeStyleForPreferredStyles();

  uint64_t v21 = [NSNumber numberWithUnsignedInt:v20];
  v25[0] = v21;
  id v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
  [v9 setPreferredVictoryBadgeStyles:v22];

  uint64_t v23 = [v8 maximumNumberOfPointsPerDay];
  [v9 setMaximumNumberOfPointsPerDay:v23];

  return v9;
}

- (void)_loadCachedCompetitionsAndNotifyObservers
{
  if ([(ASDatabaseClient *)self->_databaseClient isProtectedDataAvailable])
  {
    BOOL v3 = [(ASCompetitionStore *)self->_competitionStore loadCachedCompetitions];
    self->_hasFetchedProtectedData = v3;
    if (v3)
    {
      [(ASDatabaseClient *)self->_databaseClient removeProtectedDataObserver:self];
      observerQueue = self->_observerQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __65__ASCompetitionManager__loadCachedCompetitionsAndNotifyObservers__block_invoke;
      block[3] = &unk_2652157F0;
      void block[4] = self;
      dispatch_async(observerQueue, block);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudKitManager);
      [WeakRetained observerDidBecomeReadyToProcessChanges:self];
    }
  }
  else
  {
    ASLoggingInitialize();
    uint64_t v6 = *MEMORY[0x263F23AB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "CompetitionManager not loading cached competitions, protected data is not available", buf, 2u);
    }
  }
}

void __65__ASCompetitionManager__loadCachedCompetitionsAndNotifyObservers__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 112);
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
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "competitionManagerDidLoadCachedCompetitions:", *(void *)(a1 + 32), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_queue_handleSavedRecords:(id)a3 activity:(id)a4 group:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [(ASCompetitionManager *)self _queue_handleSavedCompetitionListRecords:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityDataManager);
  long long v10 = [WeakRetained currentActivitySummary];
  id v11 = objc_loadWeakRetained((id *)&self->_activityDataManager);
  uint64_t v12 = [v11 yesterdayActivitySummary];
  [(ASCompetitionManager *)self _queue_updateScoresWithTodaySummary:v10 yesterdaySummary:v12 activity:v9 cloudKitGroup:v8];
}

- (void)_queue_setActivityDataVisibleIfNecessaryForContact:(id)a3 completion:(id)a4
{
  id v6 = a3;
  long long v7 = (void (**)(id, uint64_t, void, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v8 = [v6 primaryRelationship];
  char v9 = [v8 isHidingActivityData];

  ASLoggingInitialize();
  long long v10 = *MEMORY[0x263F23AB0];
  BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT);
  if ((v9 & 1) == 0)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v10, OS_LOG_TYPE_DEFAULT, "CompetitionManager my activity data is not hidden, proceeding immediately", buf, 2u);
    }
LABEL_10:
    v7[2](v7, 1, 0, v6);
    goto LABEL_12;
  }
  if (v11)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v10, OS_LOG_TYPE_DEFAULT, "CompetitionManager my activity data is hidden, unhiding first", buf, 2u);
  }
  if (![v6 cloudType])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_relationshipManager);
    id v14 = [v6 UUID];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __86__ASCompetitionManager__queue_setActivityDataVisibleIfNecessaryForContact_completion___block_invoke;
    v15[3] = &unk_2652179F0;
    void v15[4] = self;
    id v17 = v7;
    id v16 = v6;
    [WeakRetained setActivityDataVisible:1 toFriendWithUUID:v14 completion:v15];

    goto LABEL_12;
  }
  if (ASSecureCloudEnabled() && [v6 cloudType] == 1) {
    goto LABEL_10;
  }
  uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F23CC8] code:9 userInfo:0];
  ((void (**)(id, uint64_t, void *, id))v7)[2](v7, 0, v12, 0);

LABEL_12:
}

void __86__ASCompetitionManager__queue_setActivityDataVisibleIfNecessaryForContact_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__ASCompetitionManager__queue_setActivityDataVisibleIfNecessaryForContact_completion___block_invoke_2;
  block[3] = &unk_2652179C8;
  id v14 = *(id *)(a1 + 48);
  char v15 = a2;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  id v11 = v5;
  uint64_t v12 = v7;
  id v13 = v8;
  id v9 = v5;
  dispatch_async(v6, block);
}

void __86__ASCompetitionManager__queue_setActivityDataVisibleIfNecessaryForContact_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
  id v5 = [*(id *)(a1 + 48) UUID];
  id v6 = [WeakRetained contactWithUUID:v5];
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v2 + 16))(v2, v3, v4, v6);
}

- (id)recordForCurrentCompetitionList:(id)a3 contact:(id)a4
{
  id v5 = a3;
  id v6 = [a4 relationshipStorage];
  uint64_t v7 = [v6 legacyRelationship];

  id v8 = +[ASCloudKitManager relationshipZone];
  id v9 = [v5 recordWithZoneID:v8 recordEncryptionType:0];

  id v10 = objc_alloc(MEMORY[0x263EFD820]);
  id v11 = [v7 systemFieldsOnlyRecord];
  uint64_t v12 = [v11 recordID];
  id v13 = (void *)[v10 initWithRecordID:v12 action:0];
  [v9 setParent:v13];

  return v9;
}

- (id)_contactsWithActiveCompetitions
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactsManager);
  uint64_t v3 = [WeakRetained contacts];

  uint64_t v4 = objc_msgSend(v3, "hk_filter:", &__block_literal_global_339_0);

  return v4;
}

uint64_t __55__ASCompetitionManager__contactsWithActiveCompetitions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 primaryRelationship];
  uint64_t v3 = [v2 isCompetitionActive];

  return v3;
}

- (id)_scoreCapCelebrationAnchor
{
  uint64_t v2 = [(ASCompetitionManager *)self _localUserDefaultsDomain];
  id v6 = 0;
  uint64_t v3 = [v2 numberForKey:@"ActivitySharingScoreCapCelebrationAnchor" error:&v6];
  id v4 = v6;
  if (v4)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_ERROR)) {
      -[ASCompetitionManager _scoreCapCelebrationAnchor]();
    }

    uint64_t v3 = 0;
  }

  return v3;
}

- (void)_setScoreCapCelebrationAnchor:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(ASCompetitionManager *)self _localUserDefaultsDomain];
  id v9 = 0;
  [v6 setNumber:v5 forKey:@"ActivitySharingScoreCapCelebrationAnchor" error:&v9];
  id v7 = v9;
  if (v7)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_ERROR)) {
      -[ASCompetitionManager _setScoreCapCelebrationAnchor:]();
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_scoreCapCelebrationAnchor, a3);
    ASLoggingInitialize();
    id v8 = *MEMORY[0x263F23AB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_2474C9000, v8, OS_LOG_TYPE_DEFAULT, "CompetitionManager updated score cap celebration anchor is %@", buf, 0xCu);
    }
  }
}

- (id)_localUserDefaultsDomain
{
  return [(ASDatabaseClient *)self->_databaseClient makeASKeyValueDomainWithDomainName:@"ActivitySharing.Notifications" category:3];
}

- (id)secureCloudCompetitionListsToSave
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__12;
  id v11 = __Block_byref_object_dispose__12;
  id v12 = objc_alloc_init(MEMORY[0x263EFFA08]);
  serialQueue = self->_serialQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__ASCompetitionManager_secureCloudCompetitionListsToSave__block_invoke;
  v6[3] = &unk_265215FF8;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(serialQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __57__ASCompetitionManager_secureCloudCompetitionListsToSave__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_secureCloudCompetitionListsToSave");
  return MEMORY[0x270F9A758]();
}

- (void)secureCloudDidSaveRecords:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__ASCompetitionManager_secureCloudDidSaveRecords___block_invoke;
  v7[3] = &unk_2652157C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

uint64_t __50__ASCompetitionManager_secureCloudDidSaveRecords___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleSavedRecords:activity:group:", *(void *)(a1 + 40), 0, 0);
}

- (void)secureCloudDidFailToSaveRecords:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 count])
  {
    ASLoggingInitialize();
    id v4 = (void *)*MEMORY[0x263F23AB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
    {
      id v5 = v4;
      int v6 = 134217984;
      uint64_t v7 = [v3 count];
      _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "CompetitionManager failed to save secure cloud %ld records", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (id)currentCompetitionListForFriendWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  char v15 = __Block_byref_object_copy__12;
  id v16 = __Block_byref_object_dispose__12;
  id v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__ASCompetitionManager_currentCompetitionListForFriendWithUUID___block_invoke;
  block[3] = &unk_265216070;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __64__ASCompetitionManager_currentCompetitionListForFriendWithUUID___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 80) currentCompetitionListForFriendWithUUID:a1[5]];
  return MEMORY[0x270F9A758]();
}

- (id)archivedCompetitionListForFriendWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  char v15 = __Block_byref_object_copy__12;
  id v16 = __Block_byref_object_dispose__12;
  id v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__ASCompetitionManager_archivedCompetitionListForFriendWithUUID___block_invoke;
  block[3] = &unk_265216070;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __65__ASCompetitionManager_archivedCompetitionListForFriendWithUUID___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 80) archivedCompetitionListForFriendWithUUID:a1[5]];
  return MEMORY[0x270F9A758]();
}

- (void)storePushedCompetitionListRecords:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__ASCompetitionManager_storePushedCompetitionListRecords___block_invoke;
  v7[3] = &unk_2652157C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

uint64_t __58__ASCompetitionManager_storePushedCompetitionListRecords___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleSavedCompetitionListRecords:", *(void *)(a1 + 40));
}

- (BOOL)_shouldSkipLocalLegacyCompetitionList:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactsManager);
  id v6 = [v4 friendUUID];
  id v7 = [WeakRetained contactWithUUID:v6];

  if ([v7 cloudType] == 1)
  {
    id v8 = [v4 systemFieldsOnlyRecord];
    uint64_t v9 = [v8 recordID];
    id v10 = [v9 zoneID];
    id v11 = +[ASCloudKitManager relationshipZone];
    char v12 = [v10 isEqual:v11];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)_shouldSkipRemoteLegacyCompetitionList:(id)a3 contact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 cloudType];
  if (v8 == 1)
  {
    uint64_t v9 = [v6 systemFieldsOnlyRecord];
    id v10 = [v9 recordID];
    id v11 = [v10 zoneID];
    id v4 = +[ASCloudKitManager relationshipZone];
    if ([v11 isEqual:v4])
    {
      LOBYTE(v12) = 1;
LABEL_11:

      goto LABEL_12;
    }
    if ([v7 cloudType])
    {
      LOBYTE(v12) = 0;
      goto LABEL_11;
    }
    id v19 = v11;
    uint64_t v21 = v10;
    uint64_t v23 = v9;
  }
  else if ([v7 cloudType])
  {
    LOBYTE(v12) = 0;
    goto LABEL_12;
  }
  int v25 = objc_msgSend(v6, "systemFieldsOnlyRecord", v19, v21, v23);
  id v13 = [v25 recordID];
  uint64_t v14 = [v13 zoneID];
  char v15 = [v14 zoneName];
  id v16 = +[ASCloudKitManager relationshipZone];
  id v17 = [v16 zoneName];
  int v12 = [v15 isEqualToString:v17] ^ 1;

  id v10 = v22;
  uint64_t v9 = v24;
  id v11 = v20;
  if (v8 == 1) {
    goto LABEL_11;
  }
LABEL_12:

  return v12;
}

- (void)_queue_cleanUpLegacyCompetitionLists:(id)a3 activity:(id)a4 cloudKitGroup:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_msgSend(v8, "hk_map:", &__block_literal_global_342);
  if ([v11 count])
  {
    ASLoggingInitialize();
    int v12 = *MEMORY[0x263F23AB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v8;
      _os_log_impl(&dword_2474C9000, v12, OS_LOG_TYPE_DEFAULT, "Removing legacy competition lists that have been migrated %@", (uint8_t *)&v15, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudKitManager);
    uint64_t v14 = [v11 allObjects];
    [WeakRetained saveRecordsIntoPrivateDatabase:MEMORY[0x263EFFA68] recordIDsToDelete:v14 priority:2 activity:v9 group:v10 completion:&__block_literal_global_345];
  }
}

id __84__ASCompetitionManager__queue_cleanUpLegacyCompetitionLists_activity_cloudKitGroup___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 systemFieldsOnlyRecord];
  id v3 = [v2 recordID];

  return v3;
}

void __84__ASCompetitionManager__queue_cleanUpLegacyCompetitionLists_activity_cloudKitGroup___block_invoke_343(uint64_t a1, int a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  ASLoggingInitialize();
  id v5 = *MEMORY[0x263F23AB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = a2;
    __int16 v7 = 2112;
    id v8 = v4;
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "Removed legacy competitions that have been migrated (success %{BOOL}d, error: %@)", (uint8_t *)v6, 0x12u);
  }
}

- (BOOL)_shouldSkipLocalSecureCloudCompetitionList:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactsManager);
  id v6 = [v4 friendUUID];
  __int16 v7 = [WeakRetained contactWithUUID:v6];

  if ([v7 cloudType])
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    uint64_t v9 = [v4 systemFieldsOnlyRecord];
    id v10 = [v9 recordID];
    id v11 = [v10 zoneID];
    int v12 = +[ASCloudKitManager relationshipZone];
    int v8 = [v11 isEqual:v12] ^ 1;
  }
  return v8;
}

- (void)_queue_cleanUpSecureCloudCompetitionLists:(id)a3 activity:(id)a4 cloudKitGroup:(id)a5
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = objc_msgSend(v7, "hk_map:", &__block_literal_global_347_0);
  if ([v9 count])
  {
    ASLoggingInitialize();
    id v10 = *MEMORY[0x263F23AB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_2474C9000, v10, OS_LOG_TYPE_DEFAULT, "Removing secure cloud competition lists that have been downgraded %@", (uint8_t *)&v12, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_secureCloudDelegate);
    [WeakRetained competitionManager:self deleteCompetitionLists:v7 group:v8 completion:&__block_literal_global_350];
  }
}

id __89__ASCompetitionManager__queue_cleanUpSecureCloudCompetitionLists_activity_cloudKitGroup___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 systemFieldsOnlyRecord];
  id v3 = [v2 recordID];

  return v3;
}

void __89__ASCompetitionManager__queue_cleanUpSecureCloudCompetitionLists_activity_cloudKitGroup___block_invoke_348(uint64_t a1, int a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  ASLoggingInitialize();
  id v5 = *MEMORY[0x263F23AB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = a2;
    __int16 v7 = 2112;
    id v8 = v4;
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "Removed secure cloud competitions that have been downgraded (success %{BOOL}d, error: %@)", (uint8_t *)v6, 0x12u);
  }
}

- (id)_queue_legacyCompetitionListsToSave
{
  return [(ASCompetitionManager *)self _queue_competitionListsToSaveForCloudType:0];
}

- (id)_queue_secureCloudCompetitionListsToSave
{
  return [(ASCompetitionManager *)self _queue_competitionListsToSaveForCloudType:1];
}

- (id)_queue_competitionListsToSaveForCloudType:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  id v5 = (NSObject **)MEMORY[0x263F23AB0];
  id v6 = *MEMORY[0x263F23AB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "CompetitionManager responding to periodic update request for records", buf, 2u);
  }
  __int16 v7 = [(ASCompetitionManager *)self _contactsWithActiveCompetitions];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __66__ASCompetitionManager__queue_competitionListsToSaveForCloudType___block_invoke;
  v14[3] = &unk_265217A58;
  v14[4] = self;
  v14[5] = a3;
  id v8 = objc_msgSend(v7, "hk_map:", v14);
  ASLoggingInitialize();
  uint64_t v9 = *v5;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    uint64_t v11 = [v8 count];
    int v12 = NSStringFromASCloudType();
    *(_DWORD *)buf = 134218242;
    uint64_t v16 = v11;
    __int16 v17 = 2112;
    id v18 = v12;
    _os_log_impl(&dword_2474C9000, v10, OS_LOG_TYPE_DEFAULT, "CompetitionManager found %lu %@ competition lists to save", buf, 0x16u);
  }
  return v8;
}

id __66__ASCompetitionManager__queue_competitionListsToSaveForCloudType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 relationshipStorage];
  id v5 = [v4 primaryRelationship];

  if (!v5)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_ERROR)) {
      __66__ASCompetitionManager__queue_competitionListsToSaveForCloudType___block_invoke_cold_1();
    }
    goto LABEL_10;
  }
  if ([v5 cloudType] != *(void *)(a1 + 40))
  {
LABEL_10:
    id v16 = 0;
    goto LABEL_15;
  }
  id v6 = *(void **)(*(void *)(a1 + 32) + 80);
  __int16 v7 = [v3 UUID];
  id v8 = [v6 currentCompetitionListForFriendWithUUID:v7];

  if (v8)
  {
    uint64_t v9 = [v8 currentCompetition];
    id v10 = [MEMORY[0x263EFF910] date];
    uint64_t v11 = [v9 endDate];
    int v12 = objc_msgSend(v10, "hk_isAfterOrEqualToDate:", v11);

    if (v12)
    {
      ASLoggingInitialize();
      id v13 = (void *)*MEMORY[0x263F23AB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = v13;
        int v15 = [v9 UUID];
        int v18 = 138543362;
        uint64_t v19 = v15;
        _os_log_impl(&dword_2474C9000, v14, OS_LOG_TYPE_DEFAULT, "Competition has ended, not including in competition lists to save: %{public}@", (uint8_t *)&v18, 0xCu);
      }
      id v16 = 0;
    }
    else
    {
      id v16 = v8;
    }
  }
  else
  {
    id v16 = 0;
  }

LABEL_15:
  return v16;
}

- (void)completeCompetitionWithFriendWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  ASLoggingInitialize();
  id v8 = *MEMORY[0x263F23AB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v6;
    _os_log_impl(&dword_2474C9000, v8, OS_LOG_TYPE_DEFAULT, "Completing competition with friend: %{public}@", buf, 0xCu);
  }
  transactionQueue = self->_transactionQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __73__ASCompetitionManager_completeCompetitionWithFriendWithUUID_completion___block_invoke;
  v12[3] = &unk_265217AD0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(ASAsyncTransactionQueue *)transactionQueue performTransaction:v12];
}

void __73__ASCompetitionManager_completeCompetitionWithFriendWithUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  id v5 = [WeakRetained contactWithUUID:*(void *)(a1 + 40)];

  id v6 = [v5 primaryRelationship];
  char v7 = [v6 isCompetitionActive];

  if (v7)
  {
    id v8 = [*(id *)(*(void *)(a1 + 32) + 80) currentCompetitionListForFriendWithUUID:*(void *)(a1 + 40)];
    uint64_t v9 = [v8 currentCompetition];
    id v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "setCurrentCacheIndex:", objc_msgSend(v9, "endDateCacheIndex"));
      id v11 = ASCloudKitGroupUserActionExplicit();
      int v12 = *(void **)(a1 + 32);
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __73__ASCompetitionManager_completeCompetitionWithFriendWithUUID_completion___block_invoke_352;
      v21[3] = &unk_265217AA8;
      id v24 = *(id *)(a1 + 48);
      id v13 = v3;
      uint64_t v14 = *(void *)(a1 + 32);
      int v15 = *(void **)(a1 + 40);
      id v25 = v13;
      v21[4] = v14;
      id v22 = v15;
      id v23 = v11;
      id v16 = v11;
      [v12 _saveCurrentCompetitionList:v8 archivedCompetitionList:0 contact:v5 activity:0 cloudKitGroup:v16 completion:v21];
    }
    else
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_ERROR)) {
        __73__ASCompetitionManager_completeCompetitionWithFriendWithUUID_completion___block_invoke_cold_1();
      }
      uint64_t v19 = *(void *)(a1 + 48);
      uint64_t v20 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F23CC8] code:4 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v19 + 16))(v19, 0, v20);

      v3[2](v3);
    }
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_ERROR)) {
      __73__ASCompetitionManager_completeCompetitionWithFriendWithUUID_completion___block_invoke_cold_2();
    }
    uint64_t v17 = *(void *)(a1 + 48);
    int v18 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F23CC8] code:4 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v18);

    v3[2](v3);
  }
}

void __73__ASCompetitionManager_completeCompetitionWithFriendWithUUID_completion___block_invoke_352(uint64_t a1, char a2, uint64_t a3)
{
  if (a3 || (a2 & 1) == 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    char v7 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v7();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __73__ASCompetitionManager_completeCompetitionWithFriendWithUUID_completion___block_invoke_2;
    v8[3] = &unk_265217A80;
    id v9 = *(id *)(a1 + 56);
    id v10 = *(id *)(a1 + 64);
    [WeakRetained updateRelationshipWithCompetitionEvent:13 friendUUID:v5 activity:0 cloudKitGroup:v6 completion:v8];
  }
}

uint64_t __73__ASCompetitionManager_completeCompetitionWithFriendWithUUID_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)updateAllActiveCompetitionsWithScores:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  transactionQueue = self->_transactionQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __73__ASCompetitionManager_updateAllActiveCompetitionsWithScores_completion___block_invoke;
  v11[3] = &unk_265217AD0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(ASAsyncTransactionQueue *)transactionQueue performTransaction:v11];
}

void __73__ASCompetitionManager_updateAllActiveCompetitionsWithScores_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  char v31 = 1;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__12;
  v28[4] = __Block_byref_object_dispose__12;
  id v29 = 0;
  id v4 = [*(id *)(a1 + 32) _contactsWithActiveCompetitions];
  uint64_t v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __73__ASCompetitionManager_updateAllActiveCompetitionsWithScores_completion___block_invoke_2;
  v24[3] = &unk_2652168D0;
  os_log_t v26 = v30;
  uint64_t v27 = v28;
  id v8 = v5;
  id v25 = v8;
  objc_msgSend(v6, "_queue_updateSecureCloudCompetitionsWithScores:forContacts:completion:", v7, v4, v24);
  dispatch_group_enter(v8);
  id v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __73__ASCompetitionManager_updateAllActiveCompetitionsWithScores_completion___block_invoke_3;
  v20[3] = &unk_2652168D0;
  id v22 = v30;
  id v23 = v28;
  id v11 = v8;
  uint64_t v21 = v11;
  objc_msgSend(v9, "_queue_updateLegacyCompetitionsWithScores:forContacts:completion:", v10, v4, v20);
  id v12 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __73__ASCompetitionManager_updateAllActiveCompetitionsWithScores_completion___block_invoke_4;
  v15[3] = &unk_265217AF8;
  id v13 = *(id *)(a1 + 48);
  int v18 = v30;
  uint64_t v19 = v28;
  id v16 = v13;
  id v17 = v3;
  id v14 = v3;
  dispatch_group_notify(v11, v12, v15);

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v30, 8);
}

void __73__ASCompetitionManager_updateAllActiveCompetitionsWithScores_completion___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __73__ASCompetitionManager_updateAllActiveCompetitionsWithScores_completion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v5 + 24)) {
    char v6 = a2;
  }
  else {
    char v6 = 0;
  }
  *(unsigned char *)(v5 + 24) = v6;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = a3;
  if (!a3) {
    id v8 = *(void **)(v7 + 40);
  }
  objc_storeStrong((id *)(v7 + 40), v8);
  id v9 = a3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __73__ASCompetitionManager_updateAllActiveCompetitionsWithScores_completion___block_invoke_4(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24), *(void *)(*(void *)(a1[7] + 8) + 40));
  }
  id v3 = *(uint64_t (**)(void))(a1[5] + 16);
  return v3();
}

- (void)_queue_updateLegacyCompetitionsWithScores:(id)a3 forContacts:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = [(ASCompetitionManager *)self _competitionListsFromContacts:a4 withUpdatedScore:a3 cloudType:0];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __89__ASCompetitionManager__queue_updateLegacyCompetitionsWithScores_forContacts_completion___block_invoke;
  v17[3] = &unk_265217B20;
  v17[4] = self;
  uint64_t v10 = objc_msgSend(v9, "hk_map:", v17);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudKitManager);
  id v12 = [v10 allObjects];
  id v13 = ASCloudKitGroupUserActionExplicit();
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __89__ASCompetitionManager__queue_updateLegacyCompetitionsWithScores_forContacts_completion___block_invoke_2;
  v15[3] = &unk_265217848;
  void v15[4] = self;
  id v16 = v8;
  id v14 = v8;
  [WeakRetained saveRecordsIntoPrivateDatabase:v12 priority:2 activity:0 group:v13 completion:v15];
}

id __89__ASCompetitionManager__queue_updateLegacyCompetitionsWithScores_forContacts_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  uint64_t v5 = [v3 friendUUID];
  char v6 = [WeakRetained contactWithUUID:v5];

  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) recordForCurrentCompetitionList:v3 contact:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void __89__ASCompetitionManager__queue_updateLegacyCompetitionsWithScores_forContacts_completion___block_invoke_2(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(NSObject **)(v9 + 96);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__ASCompetitionManager__queue_updateLegacyCompetitionsWithScores_forContacts_completion___block_invoke_3;
  block[3] = &unk_265217758;
  char v18 = a2;
  id v14 = v7;
  uint64_t v15 = v9;
  id v16 = v8;
  id v17 = *(id *)(a1 + 40);
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v10, block);
}

uint64_t __89__ASCompetitionManager__queue_updateLegacyCompetitionsWithScores_forContacts_completion___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64) && !*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "_queue_handleSavedCompetitionListRecords:", *(void *)(a1 + 48));
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v2();
}

- (void)_queue_updateSecureCloudCompetitionsWithScores:(id)a3 forContacts:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (ASSecureCloudEnabled())
  {
    id v11 = [(ASCompetitionManager *)self _competitionListsFromContacts:v9 withUpdatedScore:v8 cloudType:1];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_secureCloudDelegate);
    id v13 = ASCloudKitGroupUserActionExplicit();
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __94__ASCompetitionManager__queue_updateSecureCloudCompetitionsWithScores_forContacts_completion___block_invoke;
    v14[3] = &unk_265217848;
    v14[4] = self;
    id v15 = v10;
    [WeakRetained competitionManager:self saveCompetitionLists:v11 group:v13 completion:v14];
  }
}

void __94__ASCompetitionManager__queue_updateSecureCloudCompetitionsWithScores_forContacts_completion___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(NSObject **)(v9 + 96);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __94__ASCompetitionManager__queue_updateSecureCloudCompetitionsWithScores_forContacts_completion___block_invoke_2;
  block[3] = &unk_265217758;
  char v18 = a2;
  id v14 = v7;
  uint64_t v15 = v9;
  id v16 = v8;
  id v17 = *(id *)(a1 + 40);
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v10, block);
}

uint64_t __94__ASCompetitionManager__queue_updateSecureCloudCompetitionsWithScores_forContacts_completion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64) && !*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "_queue_handleSavedCompetitionListRecords:", *(void *)(a1 + 48));
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v2();
}

- (id)_competitionListsFromContacts:(id)a3 withUpdatedScore:(id)a4 cloudType:(unint64_t)a5
{
  id v8 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __81__ASCompetitionManager__competitionListsFromContacts_withUpdatedScore_cloudType___block_invoke;
  v12[3] = &unk_265217B48;
  id v13 = v8;
  unint64_t v14 = a5;
  v12[4] = self;
  id v9 = v8;
  id v10 = objc_msgSend(a3, "hk_map:", v12);

  return v10;
}

id __81__ASCompetitionManager__competitionListsFromContacts_withUpdatedScore_cloudType___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if ([v3 cloudType] == a1[6])
  {
    id v4 = *(void **)(a1[4] + 80);
    uint64_t v5 = [v3 UUID];
    char v6 = [v4 currentCompetitionListForFriendWithUUID:v5];

    id v7 = [v6 currentCompetition];
    id v8 = v7;
    if (v7)
    {
      [v7 setScores:a1[5]];
      id v9 = v6;
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)rollCompetitionWithFriendWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  transactionQueue = self->_transactionQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __69__ASCompetitionManager_rollCompetitionWithFriendWithUUID_completion___block_invoke;
  v11[3] = &unk_265217C88;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [(ASAsyncTransactionQueue *)transactionQueue performTransaction:v11];
}

void __69__ASCompetitionManager_rollCompetitionWithFriendWithUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ASCloudKitGroupUserActionExplicit();
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__ASCompetitionManager_rollCompetitionWithFriendWithUUID_completion___block_invoke_2;
  v8[3] = &unk_265217C60;
  void v8[4] = *(void *)(a1 + 32);
  id v11 = *(id *)(a1 + 48);
  id v12 = v3;
  id v9 = *(id *)(a1 + 40);
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  [WeakRetained fetchAllChangesWithPriority:2 activity:0 group:v6 completion:v8];
}

void __69__ASCompetitionManager_rollCompetitionWithFriendWithUUID_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__ASCompetitionManager_rollCompetitionWithFriendWithUUID_completion___block_invoke_3;
  block[3] = &unk_265217C38;
  char v18 = a2;
  id v12 = v5;
  id v16 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v17 = v7;
  uint64_t v13 = v8;
  id v14 = v9;
  id v15 = *(id *)(a1 + 48);
  id v10 = v5;
  dispatch_async(v6, block);
}

void __69__ASCompetitionManager_rollCompetitionWithFriendWithUUID_completion___block_invoke_3(uint64_t a1)
{
  v30[1] = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 80) && !*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
    id v3 = [WeakRetained contactWithUUID:*(void *)(a1 + 48)];

    id v4 = [v3 primaryRelationship];
    char v5 = [v4 isCompetitionActive];

    if (v5)
    {
      id v6 = objc_msgSend(*(id *)(a1 + 40), "_queue_rollCompetitionListForwardForContact:", v3);
      id v7 = *(id **)(a1 + 40);
      id v8 = objc_loadWeakRetained(v7 + 2);
      id v9 = [v8 currentActivitySummary];
      id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
      id v11 = [v10 yesterdayActivitySummary];
      objc_msgSend(v7, "_queue_updateScoresWithTodaySummary:yesterdaySummary:activity:cloudKitGroup:", v9, v11, 0, *(void *)(a1 + 56));

      if ([v3 cloudType])
      {
        if (ASSecureCloudEnabled() && [v3 cloudType] == 1)
        {
          id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 184));
          uint64_t v13 = *(void *)(a1 + 40);
          id v14 = ASCloudKitGroupUserActionExplicit();
          v23[0] = MEMORY[0x263EF8330];
          v23[1] = 3221225472;
          v23[2] = __69__ASCompetitionManager_rollCompetitionWithFriendWithUUID_completion___block_invoke_3_357;
          v23[3] = &unk_265217C10;
          v23[4] = *(void *)(a1 + 40);
          id v24 = *(id *)(a1 + 56);
          id v25 = *(id *)(a1 + 64);
          id v26 = *(id *)(a1 + 72);
          [v12 competitionManager:v13 saveCurrentCompetitionList:v6 archivedCompetitionList:0 contact:v3 group:v14 completion:v23];
        }
        else
        {
          ASLoggingInitialize();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_ERROR)) {
            __69__ASCompetitionManager_rollCompetitionWithFriendWithUUID_completion___block_invoke_3_cold_2();
          }
          uint64_t v17 = *(void *)(a1 + 64);
          char v18 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F23CC8] code:9 userInfo:0];
          (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v18);

          (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
        }
      }
      else
      {
        uint64_t v19 = [*(id *)(a1 + 40) recordForCurrentCompetitionList:v6 contact:v3];
        id v20 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
        v30[0] = v19;
        uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __69__ASCompetitionManager_rollCompetitionWithFriendWithUUID_completion___block_invoke_355;
        v27[3] = &unk_265217B98;
        v27[4] = *(void *)(a1 + 40);
        uint64_t v22 = *(void *)(a1 + 56);
        id v28 = *(id *)(a1 + 64);
        id v29 = *(id *)(a1 + 72);
        [v20 saveRecordsIntoPrivateDatabase:v21 priority:2 activity:0 group:v22 completion:v27];
      }
    }
    else
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_ERROR)) {
        __73__ASCompetitionManager_completeCompetitionWithFriendWithUUID_completion___block_invoke_cold_2();
      }
      uint64_t v15 = *(void *)(a1 + 64);
      id v16 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F23CC8] code:4 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v16);

      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    }
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_ERROR)) {
      __69__ASCompetitionManager_rollCompetitionWithFriendWithUUID_completion___block_invoke_3_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void __69__ASCompetitionManager_rollCompetitionWithFriendWithUUID_completion___block_invoke_355(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(NSObject **)(v9 + 96);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __69__ASCompetitionManager_rollCompetitionWithFriendWithUUID_completion___block_invoke_2_356;
  v13[3] = &unk_265217B70;
  char v19 = a2;
  id v14 = v7;
  uint64_t v15 = v9;
  id v16 = v8;
  id v17 = *(id *)(a1 + 40);
  id v18 = *(id *)(a1 + 48);
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v10, v13);
}

uint64_t __69__ASCompetitionManager_rollCompetitionWithFriendWithUUID_completion___block_invoke_2_356(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72) && !*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "_queue_handleSavedCompetitionListRecords:", *(void *)(a1 + 48));
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);
  return v2();
}

void __69__ASCompetitionManager_rollCompetitionWithFriendWithUUID_completion___block_invoke_3_357(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(NSObject **)(v9 + 96);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__ASCompetitionManager_rollCompetitionWithFriendWithUUID_completion___block_invoke_4;
  block[3] = &unk_265217BE8;
  char v20 = a2;
  id v14 = v7;
  uint64_t v15 = v9;
  id v16 = v8;
  id v17 = *(id *)(a1 + 40);
  id v18 = *(id *)(a1 + 48);
  id v19 = *(id *)(a1 + 56);
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v10, block);
}

void __69__ASCompetitionManager_rollCompetitionWithFriendWithUUID_completion___block_invoke_4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 80))
  {
    if (!*(void *)(a1 + 32))
    {
      objc_msgSend(*(id *)(a1 + 40), "_queue_handleSavedCompetitionListRecords:", *(void *)(a1 + 48));
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 56));
      v4[0] = MEMORY[0x263EF8330];
      v4[1] = 3221225472;
      v4[2] = __69__ASCompetitionManager_rollCompetitionWithFriendWithUUID_completion___block_invoke_5;
      v4[3] = &unk_265217BC0;
      uint64_t v3 = *(void *)(a1 + 56);
      id v6 = *(id *)(a1 + 64);
      char v8 = *(unsigned char *)(a1 + 80);
      id v5 = *(id *)(a1 + 32);
      id v7 = *(id *)(a1 + 72);
      [WeakRetained requestImmediateUpdateWithCloudKitGroup:v3 completion:v4];
    }
  }
}

void __69__ASCompetitionManager_rollCompetitionWithFriendWithUUID_completion___block_invoke_5(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  ASLoggingInitialize();
  id v6 = *MEMORY[0x263F23AB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "Roll competition immediate update (success %{BOOL}d, error: %@)", (uint8_t *)v7, 0x12u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)_queue_rollCompetitionListForwardForContact:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263EFF8F0];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "hk_gregorianCalendar");
  competitionStore = self->_competitionStore;
  __int16 v8 = [v5 UUID];

  id v9 = [(ASCompetitionStore *)competitionStore currentCompetitionListForFriendWithUUID:v8];

  uint64_t v10 = [v9 currentCompetition];
  if (v10)
  {
    ASLoggingInitialize();
    id v11 = (os_log_t *)MEMORY[0x263F23AB0];
    id v12 = *MEMORY[0x263F23AB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v10;
      _os_log_impl(&dword_2474C9000, v12, OS_LOG_TYPE_DEFAULT, "CompetitionManager found competition to roll: %@ ", buf, 0xCu);
    }
    uint64_t v13 = [v10 startDate];
    id v14 = [v6 dateByAddingUnit:16 value:-1 toDate:v13 options:0];

    uint64_t v15 = [v6 components:*MEMORY[0x263F0AC18] fromDate:v14];
    [v10 setStartDateComponents:v15];

    objc_msgSend(v10, "setCurrentCacheIndex:", -[ASCompetitionManager _queue_rollIndexBackwards:calendar:](self, "_queue_rollIndexBackwards:calendar:", objc_msgSend(v10, "currentCacheIndex"), v6));
    objc_msgSend(v10, "setLastPushedCacheIndex:", -[ASCompetitionManager _queue_rollIndexBackwards:calendar:](self, "_queue_rollIndexBackwards:calendar:", objc_msgSend(v10, "lastPushedCacheIndex"), v6));
    ASLoggingInitialize();
    id v16 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v10;
      _os_log_impl(&dword_2474C9000, v16, OS_LOG_TYPE_DEFAULT, "CompetitionManager rolled competition forward: %@", buf, 0xCu);
    }
    char v20 = v10;
    id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
    [v9 setCompetitions:v17];

    id v18 = v9;
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (int64_t)_queue_rollIndexBackwards:(int64_t)a3 calendar:(id)a4
{
  if (!a3) {
    return 0;
  }
  id v4 = a4;
  id v5 = _HKActivityCacheDateComponentsFromCacheIndex();
  id v6 = [v4 dateFromComponents:v5];
  id v7 = [v4 dateByAddingUnit:16 value:-1 toDate:v6 options:0];
  int64_t v8 = _HKCacheIndexFromDate();

  return v8;
}

- (ASCompetitionManagerSecureCloudDelegate)secureCloudDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_secureCloudDelegate);
  return (ASCompetitionManagerSecureCloudDelegate *)WeakRetained;
}

- (void)setSecureCloudDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_secureCloudDelegate);
  objc_storeStrong((id *)&self->_secureCloudCompetitionListsToCleanUp, 0);
  objc_storeStrong((id *)&self->_legacyCompetitionListsToCleanUp, 0);
  objc_storeStrong((id *)&self->_scoreCapCelebrationAnchor, 0);
  objc_storeStrong((id *)&self->_friendUUIDsWithUpdatedCompetitions, 0);
  objc_storeStrong((id *)&self->_existingFriendUUIDsWithCompletedCompetitions, 0);
  objc_storeStrong((id *)&self->_existingFriendUUIDsWithAcceptedCompetitionRequestsFromMe, 0);
  objc_storeStrong((id *)&self->_existingFriendUUIDsAwaitingMyCompetitionResponse, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_transactionQueue, 0);
  objc_storeStrong((id *)&self->_competitionStore, 0);
  objc_storeStrong((id *)&self->_databaseClient, 0);
  objc_destroyWeak((id *)&self->_relationshipManager);
  objc_destroyWeak((id *)&self->_periodicUpdateManager);
  objc_destroyWeak((id *)&self->_friendListManager);
  objc_destroyWeak((id *)&self->_contactsManager);
  objc_destroyWeak((id *)&self->_competitionBulletinManager);
  objc_destroyWeak((id *)&self->_cloudKitManager);
  objc_destroyWeak((id *)&self->_activityDataManager);
  objc_destroyWeak((id *)&self->_achievementManager);
}

void __74__ASCompetitionManager_sendCompetitionRequestToFriendWithUUID_completion___block_invoke_2_297_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "Unable to unhide from friend:%@", v2, v3, v4, v5, v6);
}

void __78__ASCompetitionManager_acceptCompetitionRequestFromFriendWithUUID_completion___block_invoke_304_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2474C9000, v0, v1, "CompetitionManager couldn't find remote competition for friend", v2, v3, v4, v5, v6);
}

void __78__ASCompetitionManager_acceptCompetitionRequestFromFriendWithUUID_completion___block_invoke_304_cold_2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_2474C9000, v0, v1, "CompetitionManager UUID mismatch between local and remote competition: %@ vs %@");
}

void __78__ASCompetitionManager_ignoreCompetitionRequestFromFriendWithUUID_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "CompetitionManager unable to ignore competition request, no incoming request found, relationship=%@", v2, v3, v4, v5, v6);
}

void __117__ASCompetitionManager_cloudKitManager_didEndUpdatesForFetchWithType_activity_cloudKitGroup_changesProcessedHandler___block_invoke_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_2474C9000, log, OS_LOG_TYPE_ERROR, "No paired watch supports competitions, showing upgrade notification", buf, 2u);
}

void __91__ASCompetitionManager__handleCompetitionRequestFromFriendWithUUID_activity_cloudKitGroup___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2474C9000, v0, v1, "CompetitionManager couldn't find remote competition list for friend", v2, v3, v4, v5, v6);
}

void __92__ASCompetitionManager__handleAcceptedCompetitionFromFriendWithUUID_activity_cloudKitGroup___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2474C9000, v0, v1, "CompetitionManager couldn't find a local competition for accepted competition", v2, v3, v4, v5, v6);
}

void __92__ASCompetitionManager__handleAcceptedCompetitionFromFriendWithUUID_activity_cloudKitGroup___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2474C9000, v0, v1, "CompetitionManager found an accepted request but no corresponding competition", v2, v3, v4, v5, v6);
}

- (void)_queue_handleNewRemoteCompetitionList:contact:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_2474C9000, v0, v1, "CompetitionManager competition UUIDs didn't match, not updating score: local=%@ remote=%@");
}

- (void)_queue_autoAcceptCompetitionRequestFromContact:activity:cloudKitGroup:completion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2474C9000, v0, v1, "CompetitionManager couldn't find a remote competition when auto-accepting", v2, v3, v4, v5, v6);
}

- (void)_queue_autoAcceptCompetitionRequestFromContact:activity:cloudKitGroup:completion:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2474C9000, v0, v1, "CompetitionManager couldn't find a local competition when auto-accepting", v2, v3, v4, v5, v6);
}

void __102__ASCompetitionManager__queue_completeCompetitionIfNecessaryForFriendWithUUID_activity_cloudKitGroup___block_invoke_334_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "CompetitionManager failed to complete competition: %@", v2, v3, v4, v5, v6);
}

- (void)_scoreCapCelebrationAnchor
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_2474C9000, v0, v1, "Error: %{public}@ retrieving score cap celebration anchor data from key value domain. anchor: %{public}@");
}

- (void)_setScoreCapCelebrationAnchor:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_2474C9000, v0, v1, "Error:%{public}@ saving score cap celebration anchor data into key value domain. anchor: %@");
}

void __66__ASCompetitionManager__queue_competitionListsToSaveForCloudType___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2474C9000, v0, v1, "Contact with current competition missing relationship", v2, v3, v4, v5, v6);
}

void __73__ASCompetitionManager_completeCompetitionWithFriendWithUUID_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2474C9000, v0, v1, "Unable to complete competition - no competition found", v2, v3, v4, v5, v6);
}

void __73__ASCompetitionManager_completeCompetitionWithFriendWithUUID_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2474C9000, v0, v1, "Unable to complete competition - not currently active", v2, v3, v4, v5, v6);
}

void __69__ASCompetitionManager_rollCompetitionWithFriendWithUUID_completion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2474C9000, v0, v1, "Unable to roll competition - failed to fetch data", v2, v3, v4, v5, v6);
}

void __69__ASCompetitionManager_rollCompetitionWithFriendWithUUID_completion___block_invoke_3_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2474C9000, v0, v1, "Unable to roll competition - invalid cloud type", v2, v3, v4, v5, v6);
}

@end