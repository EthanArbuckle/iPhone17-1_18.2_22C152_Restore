@interface ASFriendListManager
- (ASAchievementManager)achievementManager;
- (ASActivityDataManager)activityDataManager;
- (ASCompetitionManager)competitionManager;
- (ASContactsManager)contactsManager;
- (ASFriendListManager)initWithDatabaseClient:(id)a3 isWatch:(BOOL)a4;
- (ASPeriodicUpdateManager)periodicUpdateManager;
- (ASRelationshipManager)relationshipManager;
- (BOOL)_queue_hasFriendsToShareWithForContacts:(id)a3 defaultsKey:(id)a4;
- (BOOL)_queue_hasLegacyFriendsToShareWith;
- (BOOL)_queue_hasSecureCloudFriendsToShareWith;
- (BOOL)hasLegacyFriendsToShareWith;
- (BOOL)hasSecureCloudFriendsToShareWith;
- (BOOL)isWatch;
- (NSSet)friends;
- (id)_allContactsPreferringPlaceholderContacts;
- (id)_queue_friendWithUUID:(id)a3;
- (id)friendWithUUID:(id)a3;
- (unint64_t)badgeCount;
- (void)_handleHasFriendsChanged;
- (void)_queue_friendListDidUpdate;
- (void)_queue_notifyObserversOfCompetitionsLoaded;
- (void)_queue_notifyObserversOfFriendListChanges;
- (void)_queue_updateFriendList;
- (void)activitySharingManagerReady:(id)a3;
- (void)addObserver:(id)a3;
- (void)clearFriendListWithCompletion:(id)a3;
- (void)competitionManager:(id)a3 didUpdateCompetitionsForFriendsWithUUIDs:(id)a4;
- (void)competitionManagerDidLoadCachedCompetitions:(id)a3;
- (void)contactsManagerDidUpdateContacts:(id)a3;
- (void)dealloc;
- (void)endObserving;
- (void)fetchCodableFriendWithRemoteUUID:(id)a3 completion:(id)a4;
- (void)fetchfriendDataWithRemoteUUID:(id)a3 completion:(id)a4;
- (void)initializeFriendListAndBeginObserving;
- (void)queryAppBadgeCountWithCompletion:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setAchievementManager:(id)a3;
- (void)setActivityDataManager:(id)a3;
- (void)setCompetitionManager:(id)a3;
- (void)setContactsManager:(id)a3;
- (void)setIsWatch:(BOOL)a3;
- (void)setPeriodicUpdateManager:(id)a3;
- (void)setRelationshipManager:(id)a3;
- (void)updateFitnessAppBadgeCount;
- (void)updateFriendListWithDeletedWorkoutEvents:(id)a3;
- (void)updateFriendListWithNewSnapshots:(id)a3 achievements:(id)a4 workouts:(id)a5;
@end

@implementation ASFriendListManager

- (NSSet)friends
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  id v11 = 0;
  friendListQueue = self->_friendListQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30__ASFriendListManager_friends__block_invoke;
  v5[3] = &unk_265215FF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(friendListQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

uint64_t __30__ASFriendListManager_friends__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [objc_alloc(MEMORY[0x263EFFA08]) initWithSet:*(void *)(*(void *)(a1 + 32) + 32) copyItems:1];
  return MEMORY[0x270F9A758]();
}

- (void)queryAppBadgeCountWithCompletion:(id)a3
{
  v4 = (void (**)(id, id, uint64_t, void))a3;
  unint64_t v5 = [(ASFriendListManager *)self badgeCount];
  id v6 = [NSNumber numberWithUnsignedInteger:v5];
  v4[2](v4, v6, 1, 0);
}

- (unint64_t)badgeCount
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [(ASFriendListManager *)self _allContactsPreferringPlaceholderContacts];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = [*(id *)(*((void *)&v12 + 1) + 8 * i) primaryRelationship];
        if ([v8 isAwaitingInviteResponse]
          && [v8 hasIncomingInviteRequest]
          && ([v8 isFriendshipActive] & 1) == 0)
        {
          ++v5;
        }
        else if ([v8 hasIncomingCompetitionRequest] {
               && ([v8 isCompetitionActive] & 1) == 0)
        }
        {
          v9 = [v8 dateForLatestIncomingCompetitionRequest];
          uint64_t v10 = ASCompetitionRequestHasExpired() ^ 1;

          v5 += v10;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)_allContactsPreferringPlaceholderContacts
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  p_contactsManager = &self->_contactsManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactsManager);
  uint64_t v4 = [WeakRetained contacts];

  id v5 = objc_loadWeakRetained((id *)p_contactsManager);
  uint64_t v6 = [v5 placeholderContacts];

  v7 = [MEMORY[0x263EFF9A0] dictionary];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v42 objects:v51 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v43 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        long long v14 = [v13 UUID];
        [v7 setObject:v13 forKeyedSubscript:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v42 objects:v51 count:16];
    }
    while (v10);
  }
  v34 = v8;

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = v6;
  uint64_t v15 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v39;
    v18 = (os_log_t *)MEMORY[0x263F23AC8];
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v39 != v17) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v38 + 1) + 8 * j);
        ASLoggingInitialize();
        os_log_t v21 = *v18;
        if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
        {
          log = v21;
          v36 = [v20 relationshipStorage];
          v22 = [v20 UUID];
          v23 = [v7 objectForKeyedSubscript:v22];
          [v23 relationshipStorage];
          v24 = v7;
          uint64_t v25 = v16;
          uint64_t v26 = v17;
          v28 = v27 = v18;
          *(_DWORD *)buf = 138412546;
          v47 = v36;
          __int16 v48 = 2112;
          v49 = v28;
          _os_log_impl(&dword_2474C9000, log, OS_LOG_TYPE_DEFAULT, "Placeholder contact storage %@ replacing %@", buf, 0x16u);

          v18 = v27;
          uint64_t v17 = v26;
          uint64_t v16 = v25;
          v7 = v24;
        }
        v29 = [v20 UUID];
        [v7 setObject:v20 forKeyedSubscript:v29];
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
    }
    while (v16);
  }

  v30 = (void *)MEMORY[0x263EFFA08];
  v31 = [v7 allValues];
  v32 = [v30 setWithArray:v31];

  return v32;
}

- (ASFriendListManager)initWithDatabaseClient:(id)a3 isWatch:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ASFriendListManager;
  id v8 = [(ASFriendListManager *)&v19 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_databaseClient, a3);
    [(ASFriendListManager *)v9 setIsWatch:v4];
    uint64_t v10 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v9->_observers;
    v9->_observers = (NSHashTable *)v10;

    uint64_t v12 = HKCreateSerialDispatchQueue();
    observerQueue = v9->_observerQueue;
    v9->_observerQueue = (OS_dispatch_queue *)v12;

    uint64_t v14 = HKCreateSerialDispatchQueue();
    friendListQueue = v9->_friendListQueue;
    v9->_friendListQueue = (OS_dispatch_queue *)v14;

    uint64_t v16 = HKCreateSerialDispatchQueue();
    biomeDonationQueue = v9->_biomeDonationQueue;
    v9->_biomeDonationQueue = (OS_dispatch_queue *)v16;
  }
  return v9;
}

- (void)activitySharingManagerReady:(id)a3
{
  id v4 = a3;
  id v5 = [v4 activityDataManager];
  [(ASFriendListManager *)self setActivityDataManager:v5];

  uint64_t v6 = [v4 contactsManager];
  [(ASFriendListManager *)self setContactsManager:v6];

  id v7 = [v4 relationshipManager];
  [(ASFriendListManager *)self setRelationshipManager:v7];

  id v8 = [v4 periodicUpdateManager];
  [(ASFriendListManager *)self setPeriodicUpdateManager:v8];

  uint64_t v9 = [v4 competitionManager];
  [(ASFriendListManager *)self setCompetitionManager:v9];

  uint64_t v10 = [v4 achievementManager];

  [(ASFriendListManager *)self setAchievementManager:v10];
  uint64_t v11 = [(ASFriendListManager *)self contactsManager];
  [v11 addObserver:self];

  id v12 = [(ASFriendListManager *)self competitionManager];
  [v12 addObserver:self];
}

- (void)dealloc
{
  [(ASFriendListManager *)self endObserving];
  v3.receiver = self;
  v3.super_class = (Class)ASFriendListManager;
  [(ASFriendListManager *)&v3 dealloc];
}

- (void)initializeFriendListAndBeginObserving
{
  if (self->_isWatch)
  {
    objc_super v3 = (const char *)[@"ActivitySharingHasFriendsChangedNotification" UTF8String];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __60__ASFriendListManager_initializeFriendListAndBeginObserving__block_invoke;
    handler[3] = &unk_265216A48;
    handler[4] = self;
    notify_register_dispatch(v3, &self->_activitySharingHasFriendsChangedToken, MEMORY[0x263EF83A0], handler);
  }
  friendListQueue = self->_friendListQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__ASFriendListManager_initializeFriendListAndBeginObserving__block_invoke_2;
  v5[3] = &unk_2652157F0;
  v5[4] = self;
  dispatch_async(friendListQueue, v5);
}

uint64_t __60__ASFriendListManager_initializeFriendListAndBeginObserving__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleHasFriendsChanged];
}

uint64_t __60__ASFriendListManager_initializeFriendListAndBeginObserving__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_updateFriendList");
  [*(id *)(*(void *)(a1 + 32) + 8) registerFitnessAppBadgeProvider];
  v2 = *(void **)(a1 + 32);
  return [v2 updateFitnessAppBadgeCount];
}

- (void)endObserving
{
  if (self->_isWatch) {
    notify_cancel(self->_activitySharingHasFriendsChangedToken);
  }
}

- (id)friendWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__7;
  uint64_t v16 = __Block_byref_object_dispose__7;
  id v17 = 0;
  friendListQueue = self->_friendListQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__ASFriendListManager_friendWithUUID___block_invoke;
  block[3] = &unk_265216070;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(friendListQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __38__ASFriendListManager_friendWithUUID___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_friendWithUUID:", *(void *)(a1 + 40));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)fetchCodableFriendWithRemoteUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, uint64_t, void))a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__7;
  v18 = __Block_byref_object_dispose__7;
  id v19 = 0;
  friendListQueue = self->_friendListQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__ASFriendListManager_fetchCodableFriendWithRemoteUUID_completion___block_invoke;
  block[3] = &unk_265216A70;
  block[4] = self;
  id v9 = v6;
  id v12 = v9;
  long long v13 = &v14;
  dispatch_sync(friendListQueue, block);
  id v10 = [(id)v15[5] codableFriendIncludingCloudKitFields:0];
  v7[2](v7, v10, 1, 0);

  _Block_object_dispose(&v14, 8);
}

void __67__ASFriendListManager_fetchCodableFriendWithRemoteUUID_completion___block_invoke(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1[4] + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "contact", (void)v12);
        id v9 = [v8 primaryRemoteRelationship];
        id v10 = [v9 UUID];
        int v11 = [v10 isEqual:a1[5]];

        if (v11)
        {
          objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)fetchfriendDataWithRemoteUUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__ASFriendListManager_fetchfriendDataWithRemoteUUID_completion___block_invoke;
  v8[3] = &unk_265216A98;
  id v9 = v6;
  id v7 = v6;
  [(ASFriendListManager *)self fetchCodableFriendWithRemoteUUID:a3 completion:v8];
}

void __64__ASFriendListManager_fetchfriendDataWithRemoteUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 data];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateFitnessAppBadgeCount
{
  unint64_t v3 = [(ASFriendListManager *)self badgeCount];
  databaseClient = self->_databaseClient;
  [(ASDatabaseClient *)databaseClient updateFitnessAppBadgeCount:v3];
}

- (id)_queue_friendWithUUID:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_friendListQueue);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = self->_friends;
  id v6 = (id)[(NSSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "contact", (void)v14);
        int v11 = [v10 UUID];
        char v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_queue_updateFriendList
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_friendListQueue);
  unint64_t v3 = [(ASFriendListManager *)self _allContactsPreferringPlaceholderContacts];
  ASLoggingInitialize();
  id v4 = (void *)*MEMORY[0x263F23AC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = v4;
    *(_DWORD *)buf = 134217984;
    uint64_t v60 = [v3 count];
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "Updating local friend list from %lu contacts", buf, 0xCu);
  }
  friends = self->_friends;
  if (!friends)
  {
    id v6 = [MEMORY[0x263EFFA08] set];
    uint64_t v7 = self->_friends;
    self->_friends = v6;
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  obuint64_t j = v3;
  uint64_t v8 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
  id v9 = (os_log_t *)MEMORY[0x263F23AC8];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v56;
    uint64_t v51 = *(void *)v56;
    do
    {
      uint64_t v12 = 0;
      uint64_t v52 = v10;
      do
      {
        if (*(void *)v56 != v11) {
          objc_enumerationMutation(obj);
        }
        long long v13 = *(void **)(*((void *)&v55 + 1) + 8 * v12);
        long long v14 = (void *)MEMORY[0x24C557C30]();
        ASLoggingInitialize();
        os_log_t v15 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
        {
          long long v41 = v15;
          long long v42 = [v13 UUID];
          [v13 displayName];
          v44 = long long v43 = v14;
          *(_DWORD *)buf = 138543618;
          uint64_t v60 = (uint64_t)v42;
          __int16 v61 = 2112;
          v62 = v44;
          _os_log_debug_impl(&dword_2474C9000, v41, OS_LOG_TYPE_DEBUG, "Updating list for contact %{public}@ (%@)", buf, 0x16u);

          long long v14 = v43;
        }
        long long v16 = objc_msgSend(v13, "UUID", friends);
        long long v17 = [(ASFriendListManager *)self _queue_friendWithUUID:v16];

        if (v17)
        {
          ASLoggingInitialize();
          os_log_t v18 = *v9;
          if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
          {
            long long v45 = v18;
            v46 = [v17 UUID];
            *(_DWORD *)buf = 138543618;
            uint64_t v60 = (uint64_t)v46;
            __int16 v61 = 2112;
            v62 = v17;
            _os_log_debug_impl(&dword_2474C9000, v45, OS_LOG_TYPE_DEBUG, "Found existing friend %{public}@ - %@, updating contact reference", buf, 0x16u);
          }
          [v17 setContact:v13];
        }
        else
        {
          v54 = v14;
          if ([(ASDatabaseClient *)self->_databaseClient isProtectedDataAvailable])
          {
            uint64_t v19 = [(ASFriendListManager *)self activityDataManager];
            v20 = [v13 UUID];
            os_log_t v21 = [v19 fitnessFriendSamplesForFriendWithUUID:v20];

            v22 = [(ASFriendListManager *)self activityDataManager];
            v23 = [v22 activitySnapshotsFromFitnessFriendSamples:v21];

            v24 = [(ASFriendListManager *)self activityDataManager];
            uint64_t v25 = [v24 achievementsFromFitnessFriendSamples:v21];

            uint64_t v26 = [(ASFriendListManager *)self activityDataManager];
            v27 = [v26 workoutsFromFitnessFriendSamples:v21];
          }
          else
          {
            ASLoggingInitialize();
            os_log_t v28 = *v9;
            if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
            {
              v29 = v28;
              v30 = [v13 UUID];
              v31 = [v13 displayName];
              *(_DWORD *)buf = 138543618;
              uint64_t v60 = (uint64_t)v30;
              __int16 v61 = 2112;
              v62 = v31;
              _os_log_impl(&dword_2474C9000, v29, OS_LOG_TYPE_DEFAULT, "Protected data is not available, not getting data for contact %{public}@ (%@)", buf, 0x16u);
            }
            v27 = 0;
            uint64_t v25 = 0;
            v23 = 0;
          }
          if (self->_competitionDataAvailable)
          {
            v32 = [(ASFriendListManager *)self competitionManager];
            v33 = [v13 UUID];
            v34 = [v32 competitionsForFriendWithUUID:v33];

            id v9 = (os_log_t *)MEMORY[0x263F23AC8];
          }
          else
          {
            v34 = (void *)MEMORY[0x263EFFA68];
          }
          v35 = (void *)[objc_alloc(MEMORY[0x263F23BD0]) initWithActivitySnapshots:v23 friendAchievements:v25 friendWorkouts:v27 contact:v13 competitions:v34];
          v36 = [(NSSet *)self->_friends setByAddingObject:v35];
          v37 = self->_friends;
          self->_friends = v36;

          ASLoggingInitialize();
          os_log_t v38 = *v9;
          if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
          {
            long long v39 = v38;
            long long v40 = [v35 UUID];
            *(_DWORD *)buf = 138543618;
            uint64_t v60 = (uint64_t)v40;
            __int16 v61 = 2112;
            v62 = v35;
            _os_log_impl(&dword_2474C9000, v39, OS_LOG_TYPE_DEFAULT, "Friend list loaded %{public}@ - %@", buf, 0x16u);

            id v9 = (os_log_t *)MEMORY[0x263F23AC8];
          }

          uint64_t v11 = v51;
          uint64_t v10 = v52;
          long long v14 = v54;
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
    }
    while (v10);
  }

  ASLoggingInitialize();
  v47 = *v9;
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v47, OS_LOG_TYPE_DEFAULT, "Finished updating local friend list from contacts", buf, 2u);
  }
  [(ASFriendListManager *)self _queue_friendListDidUpdate];
  if (!v50 && self->_competitionDataAvailable)
  {
    ASLoggingInitialize();
    __int16 v48 = *MEMORY[0x263F23AC8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v48, OS_LOG_TYPE_DEFAULT, "Initial friend list update and competition data is available, notifying observers", buf, 2u);
    }
    [(ASFriendListManager *)self _queue_notifyObserversOfCompetitionsLoaded];
  }
}

- (void)updateFriendListWithNewSnapshots:(id)a3 achievements:(id)a4 workouts:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  friendListQueue = self->_friendListQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __78__ASFriendListManager_updateFriendListWithNewSnapshots_achievements_workouts___block_invoke;
  v15[3] = &unk_2652160E8;
  id v16 = v8;
  long long v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(friendListQueue, v15);
}

uint64_t __78__ASFriendListManager_updateFriendListWithNewSnapshots_achievements_workouts___block_invoke(id *a1)
{
  v1 = a1;
  uint64_t v113 = *MEMORY[0x263EF8340];
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  obuint64_t j = a1[4];
  uint64_t v2 = [obj countByEnumeratingWithState:&v95 objects:v112 count:16];
  v86 = v1;
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v96;
    uint64_t v79 = *(void *)v96;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v96 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v95 + 1) + 8 * i);
        id v7 = v1[5];
        id v8 = [v6 friendUUID];
        id v9 = objc_msgSend(v7, "_queue_friendWithUUID:", v8);

        if (v9)
        {
          id v10 = [v9 snapshots];

          if (v10)
          {
            uint64_t v11 = [v9 snapshots];
            id v12 = (id)[v11 mutableCopy];
          }
          else
          {
            id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          }
          id v14 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v6, "snapshotIndex"));
          os_log_t v15 = [v12 objectForKeyedSubscript:v14];

          if (v15)
          {
            id v16 = (void *)MEMORY[0x263F0A9D0];
            v111[0] = v6;
            v111[1] = v15;
            long long v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v111 count:2];
            id v18 = [v16 _mostSignificantSnapshotAmongSnapshots:v17];
          }
          else
          {
            id v18 = v6;
          }
          id v19 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v6, "snapshotIndex"));
          [v12 setObject:v18 forKey:v19];

          v20 = (void *)[v12 copy];
          [v9 setSnapshots:v20];

          ASLoggingInitialize();
          os_log_t v21 = (void *)*MEMORY[0x263F23AC8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_DEFAULT))
          {
            logb = v21;
            v22 = [v9 UUID];
            v23 = [v9 contact];
            [v23 displayName];
            uint64_t v25 = v24 = v3;
            uint64_t v26 = [v6 snapshotIndex];
            *(_DWORD *)buf = 138543874;
            v106 = v22;
            __int16 v107 = 2112;
            v108 = v25;
            __int16 v109 = 2048;
            uint64_t v110 = v26;
            _os_log_impl(&dword_2474C9000, logb, OS_LOG_TYPE_DEFAULT, "Updated friend %{public}@ (%@) with new snapshot with index %lld", buf, 0x20u);

            uint64_t v3 = v24;
            uint64_t v4 = v79;

            v1 = v86;
          }
        }
        else
        {
          ASLoggingInitialize();
          id v13 = (void *)*MEMORY[0x263F23AC8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_ERROR)) {
            __78__ASFriendListManager_updateFriendListWithNewSnapshots_achievements_workouts___block_invoke_cold_2(&v103, v13, v6, &v104);
          }
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v95 objects:v112 count:16];
    }
    while (v3);
  }

  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id obja = v1[6];
  uint64_t v27 = [obja countByEnumeratingWithState:&v91 objects:v102 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    os_log_t log = *(os_log_t *)v92;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(os_log_t *)v92 != log) {
          objc_enumerationMutation(obja);
        }
        v30 = *(void **)(*((void *)&v91 + 1) + 8 * j);
        id v31 = v1[5];
        v32 = [v30 friendUUID];
        v33 = objc_msgSend(v31, "_queue_friendWithUUID:", v32);

        if (v33)
        {
          v34 = [v30 completedDate];
          uint64_t v35 = ASCacheIndexForLocalDate();

          v36 = [v33 friendAchievements];

          if (v36)
          {
            v37 = [v33 friendAchievements];
            id v38 = (id)[v37 mutableCopy];

            long long v39 = [NSNumber numberWithLongLong:v35];
            long long v40 = [v38 objectForKey:v39];

            if (!v40)
            {
LABEL_32:
              long long v40 = [MEMORY[0x263EFFA08] set];
            }
            long long v42 = [v40 setByAddingObject:v30];

            long long v43 = [NSNumber numberWithLongLong:v35];
            [v38 setObject:v42 forKey:v43];

            long long v44 = (void *)[v38 copy];
            [v33 setFriendAchievements:v44];

            ASLoggingInitialize();
            long long v45 = (void *)*MEMORY[0x263F23AC8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_DEFAULT))
            {
              v46 = v45;
              v47 = [v33 UUID];
              __int16 v48 = [v33 contact];
              v49 = [v48 displayName];
              uint64_t v50 = [v30 templateUniqueName];
              *(_DWORD *)buf = 138543874;
              v106 = v47;
              __int16 v107 = 2112;
              v108 = v49;
              __int16 v109 = 2112;
              uint64_t v110 = (uint64_t)v50;
              _os_log_impl(&dword_2474C9000, v46, OS_LOG_TYPE_DEFAULT, "Updated friend %{public}@ (%@) with new achievement with template unique name %@", buf, 0x20u);

              v1 = v86;
            }

            goto LABEL_36;
          }
          id v38 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          goto LABEL_32;
        }
        ASLoggingInitialize();
        long long v41 = (void *)*MEMORY[0x263F23AC8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_ERROR)) {
          __78__ASFriendListManager_updateFriendListWithNewSnapshots_achievements_workouts___block_invoke_cold_1(&v100, v41, v30, &v101);
        }
LABEL_36:
      }
      uint64_t v28 = [obja countByEnumeratingWithState:&v91 objects:v102 count:16];
    }
    while (v28);
  }

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  os_log_t loga = (os_log_t)v1[7];
  uint64_t v51 = [loga countByEnumeratingWithState:&v87 objects:v99 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    id v53 = *(id *)v88;
    id objb = *(id *)v88;
    do
    {
      for (uint64_t k = 0; k != v52; ++k)
      {
        if (*(id *)v88 != v53) {
          objc_enumerationMutation(loga);
        }
        long long v55 = *(void **)(*((void *)&v87 + 1) + 8 * k);
        id v56 = v1[5];
        long long v57 = [v55 friendUUID];
        long long v58 = objc_msgSend(v56, "_queue_friendWithUUID:", v57);

        if (v58)
        {
          v59 = [v55 endDate];
          uint64_t v60 = ASCacheIndexForLocalDate();

          __int16 v61 = [v58 friendWorkouts];

          if (v61)
          {
            v62 = [v58 friendWorkouts];
            id v63 = (id)[v62 mutableCopy];

            uint64_t v64 = [NSNumber numberWithLongLong:v60];
            v65 = [v63 objectForKey:v64];

            if (!v65)
            {
LABEL_50:
              v65 = [MEMORY[0x263EFFA08] set];
            }
            v69 = [v65 setByAddingObject:v55];

            v70 = [NSNumber numberWithLongLong:v60];
            [v63 setObject:v69 forKey:v70];

            v71 = (void *)[v63 copy];
            [v58 setFriendWorkouts:v71];

            ASLoggingInitialize();
            v72 = (void *)*MEMORY[0x263F23AC8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_DEFAULT))
            {
              v73 = v72;
              v74 = [v58 UUID];
              v75 = [v58 contact];
              v76 = [v75 displayName];
              v77 = [v55 UUID];
              *(_DWORD *)buf = 138543874;
              v106 = v74;
              __int16 v107 = 2112;
              v108 = v76;
              __int16 v109 = 2114;
              uint64_t v110 = (uint64_t)v77;
              _os_log_impl(&dword_2474C9000, v73, OS_LOG_TYPE_DEFAULT, "Updated friend %{public}@ (%@) with new workout with UUID %{public}@", buf, 0x20u);

              id v53 = objb;
            }

            v1 = v86;
            goto LABEL_54;
          }
          id v63 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          goto LABEL_50;
        }
        ASLoggingInitialize();
        v66 = (void *)*MEMORY[0x263F23AC8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_DEFAULT))
        {
          v67 = v66;
          v68 = [v55 friendUUID];
          *(_DWORD *)buf = 138543362;
          v106 = v68;
          _os_log_impl(&dword_2474C9000, v67, OS_LOG_TYPE_DEFAULT, "Failed to update friend list with workout with friend UUID %{public}@ because no friend was found with matching UUID", buf, 0xCu);

          id v53 = objb;
        }
LABEL_54:
      }
      uint64_t v52 = [loga countByEnumeratingWithState:&v87 objects:v99 count:16];
    }
    while (v52);
  }

  return objc_msgSend(v1[5], "_queue_notifyObserversOfFriendListChanges");
}

- (void)updateFriendListWithDeletedWorkoutEvents:(id)a3
{
  id v4 = a3;
  friendListQueue = self->_friendListQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__ASFriendListManager_updateFriendListWithDeletedWorkoutEvents___block_invoke;
  v7[3] = &unk_2652157C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(friendListQueue, v7);
}

uint64_t __64__ASFriendListManager_updateFriendListWithDeletedWorkoutEvents___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  uint64_t v2 = (void **)MEMORY[0x263F23AC8];
  uint64_t v3 = (void *)*MEMORY[0x263F23AC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = v3;
    *(_DWORD *)buf = 134217984;
    uint64_t v37 = [v4 count];
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "Updating friend list with %lu deleted workout events", buf, 0xCu);
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v33;
    *(void *)&long long v7 = 138543618;
    long long v27 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v12 = *(void **)(a1 + 40);
        id v13 = objc_msgSend(v11, "friendUUID", v27);
        id v14 = objc_msgSend(v12, "_queue_friendWithUUID:", v13);

        ASLoggingInitialize();
        os_log_t v15 = *v2;
        id v16 = *v2;
        if (v14)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            long long v17 = v15;
            id v18 = [v11 triggerUUID];
            id v19 = [v14 displayName];
            *(_DWORD *)buf = v27;
            uint64_t v37 = (uint64_t)v18;
            __int16 v38 = 2112;
            long long v39 = v19;
            _os_log_impl(&dword_2474C9000, v17, OS_LOG_TYPE_DEFAULT, "Removing deleted workout [%{public}@] for friend: %@", buf, 0x16u);

            uint64_t v2 = (void **)MEMORY[0x263F23AC8];
          }
          v20 = [MEMORY[0x263EFF9A0] dictionary];
          os_log_t v21 = [v14 friendWorkouts];
          v29[0] = MEMORY[0x263EF8330];
          v29[1] = 3221225472;
          v29[2] = __64__ASFriendListManager_updateFriendListWithDeletedWorkoutEvents___block_invoke_303;
          v29[3] = &unk_265216AE8;
          id v30 = v20;
          id v31 = v11;
          id v22 = v20;
          [v21 enumerateKeysAndObjectsUsingBlock:v29];

          [v14 setFriendWorkouts:v22];
        }
        else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v23 = v15;
          uint64_t v24 = [v11 friendUUID];
          uint64_t v25 = [v11 triggerUUID];
          *(_DWORD *)buf = v27;
          uint64_t v37 = (uint64_t)v24;
          __int16 v38 = 2114;
          long long v39 = v25;
          _os_log_error_impl(&dword_2474C9000, v23, OS_LOG_TYPE_ERROR, "Unable to find friend with UUID: %{public}@, skipping deleted workout with UUID: %{public}@", buf, 0x16u);

          uint64_t v2 = (void **)MEMORY[0x263F23AC8];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v8);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_queue_notifyObserversOfFriendListChanges");
}

void __64__ASFriendListManager_updateFriendListWithDeletedWorkoutEvents___block_invoke_303(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = (void *)MEMORY[0x263F08A98];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __64__ASFriendListManager_updateFriendListWithDeletedWorkoutEvents___block_invoke_2;
  v14[3] = &unk_265216AC0;
  v14[4] = *(void *)(a1 + 40);
  id v7 = a3;
  uint64_t v8 = [v6 predicateWithBlock:v14];
  uint64_t v9 = [v7 filteredSetUsingPredicate:v8];
  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v5];

  id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  uint64_t v11 = [v10 count];
  uint64_t v12 = [v7 count];

  if (v11 != v12)
  {
    ASLoggingInitialize();
    id v13 = *MEMORY[0x263F23AC8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v5;
      _os_log_impl(&dword_2474C9000, v13, OS_LOG_TYPE_DEFAULT, "Successfully found deleted workout on snapshotIndex: %@", buf, 0xCu);
    }
  }
}

uint64_t __64__ASFriendListManager_updateFriendListWithDeletedWorkoutEvents___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 UUID];
  id v4 = [*(id *)(a1 + 32) triggerUUID];
  uint64_t v5 = [v3 isEqual:v4] ^ 1;

  return v5;
}

- (BOOL)hasLegacyFriendsToShareWith
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  friendListQueue = self->_friendListQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__ASFriendListManager_hasLegacyFriendsToShareWith__block_invoke;
  v5[3] = &unk_265215FF8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(friendListQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__ASFriendListManager_hasLegacyFriendsToShareWith__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 88);
  return result;
}

- (BOOL)hasSecureCloudFriendsToShareWith
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  friendListQueue = self->_friendListQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__ASFriendListManager_hasSecureCloudFriendsToShareWith__block_invoke;
  v5[3] = &unk_265215FF8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(friendListQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __55__ASFriendListManager_hasSecureCloudFriendsToShareWith__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 89);
  return result;
}

- (BOOL)_queue_hasLegacyFriendsToShareWith
{
  uint64_t v2 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_friendListQueue);
  char v3 = [(ASFriendListManager *)v2 contactsManager];
  id v4 = [v3 legacyContacts];

  LOBYTE(v2) = [(ASFriendListManager *)v2 _queue_hasFriendsToShareWithForContacts:v4 defaultsKey:*MEMORY[0x263F23CF0]];
  return (char)v2;
}

- (BOOL)_queue_hasSecureCloudFriendsToShareWith
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_friendListQueue);
  int v3 = ASSecureCloudEnabled();
  if (v3)
  {
    id v4 = [(ASFriendListManager *)self contactsManager];
    uint64_t v5 = [v4 secureCloudContacts];

    BOOL v6 = [(ASFriendListManager *)self _queue_hasFriendsToShareWithForContacts:v5 defaultsKey:*MEMORY[0x263F23CF8]];
    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)_queue_hasFriendsToShareWithForContacts:(id)a3 defaultsKey:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_friendListQueue);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v43 count:16];
  id v10 = (os_log_t *)MEMORY[0x263F23AC8];
  if (v9)
  {
    uint64_t v11 = v9;
    long long v35 = self;
    id v36 = v7;
    uint64_t v12 = *(void *)v38;
    uint64_t v13 = MEMORY[0x263EFFA68];
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(v8);
        }
        os_log_t v15 = (void *)[objc_alloc(MEMORY[0x263F23BD0]) initWithActivitySnapshots:0 friendAchievements:0 friendWorkouts:0 contact:*(void *)(*((void *)&v37 + 1) + 8 * i) competitions:v13];
        if ([v15 isMyActivityDataCurrentlyHidden])
        {
          ASLoggingInitialize();
          os_log_t v16 = *v10;
          if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v17 = v16;
            [v15 UUID];
            id v19 = v18 = v10;
            *(_DWORD *)buf = 138543618;
            *(void *)long long v42 = v19;
            *(_WORD *)&v42[8] = 2112;
            *(void *)&v42[10] = v15;
            _os_log_impl(&dword_2474C9000, v17, OS_LOG_TYPE_DEFAULT, "Not counting friend toward hasFriendsToShareWith because data is currently hidden: %{public}@ - %@", buf, 0x16u);

            id v10 = v18;
          }
        }
        else if (([v15 isFriendshipCurrentlyActive] & 1) != 0 {
               || ([v15 hasInviteRequestFromMe] & 1) != 0
        }
               || [v15 inviteRequestToMeWasAccepted])
        {

          uint64_t v20 = 1;
          goto LABEL_16;
        }
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v37 objects:v43 count:16];
      if (v11) {
        continue;
      }
      break;
    }
    uint64_t v20 = 0;
LABEL_16:
    self = v35;
  }
  else
  {
    uint64_t v20 = 0;
  }

  id v21 = objc_alloc(MEMORY[0x263EFFA40]);
  CFStringRef v22 = (const __CFString *)*MEMORY[0x263F23CC8];
  v23 = (void *)[v21 initWithSuiteName:*MEMORY[0x263F23CC8]];
  uint64_t v24 = [v23 objectForKey:v7];
  ASLoggingInitialize();
  uint64_t v25 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)long long v42 = v20;
    *(_WORD *)&v42[4] = 2114;
    *(void *)&v42[6] = v24;
    _os_log_impl(&dword_2474C9000, v25, OS_LOG_TYPE_DEFAULT, "Checking current friend list for friends to share with: %{BOOL}d, checking defaults: %{public}@", buf, 0x12u);
  }
  if (self->_isWatch)
  {
    ASLoggingInitialize();
    uint64_t v26 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v26, OS_LOG_TYPE_DEFAULT, "Device is a watch, falling back to phone value if no friends are active currently", buf, 2u);
    }
    if (v20)
    {
LABEL_24:
      LODWORD(v20) = 1;
      goto LABEL_33;
    }
    LODWORD(v20) = [v24 BOOLValue];
  }
  else if (v20 != [v24 BOOLValue])
  {
    ASLoggingInitialize();
    long long v27 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v27, OS_LOG_TYPE_DEFAULT, "Current value is different than defaults", buf, 2u);
    }
    if ((v20 & 1) == 0 && ![v8 count])
    {
      ASLoggingInitialize();
      long long v34 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2474C9000, v34, OS_LOG_TYPE_DEFAULT, "Current value is false, but defaults value was true and the contact set is empty - maintaining defaults value until contacts exist", buf, 2u);
      }
      goto LABEL_24;
    }
    uint64_t v28 = objc_msgSend(NSNumber, "numberWithBool:", v20, v35, v36);
    [v23 setObject:v28 forKey:v7];

    CFPreferencesAppSynchronize(v22);
    id v29 = objc_alloc_init(MEMORY[0x263F57528]);
    id v30 = [MEMORY[0x263EFFA08] setWithObject:v7];
    [v29 synchronizeUserDefaultsDomain:v22 keys:v30];

    ASLoggingInitialize();
    id v31 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)long long v42 = v20;
      _os_log_impl(&dword_2474C9000, v31, OS_LOG_TYPE_DEFAULT, "Updating and syncing default for friends to share with, setting to: %{BOOL}d", buf, 8u);
    }
  }
LABEL_33:
  ASLoggingInitialize();
  long long v32 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)long long v42 = v20;
    _os_log_impl(&dword_2474C9000, v32, OS_LOG_TYPE_DEFAULT, "Checked for friends to share with, found friends: %{BOOL}d", buf, 8u);
  }

  return v20;
}

- (void)clearFriendListWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void *))a3;
  ASLoggingInitialize();
  uint64_t v5 = *MEMORY[0x263F23AC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_ERROR)) {
    -[ASFriendListManager clearFriendListWithCompletion:](v5);
  }
  friendListQueue = self->_friendListQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__ASFriendListManager_clearFriendListWithCompletion___block_invoke;
  block[3] = &unk_2652157F0;
  block[4] = self;
  dispatch_async(friendListQueue, block);
  id v7 = [(ASFriendListManager *)self contactsManager];
  [v7 setContacts:0];

  id v8 = [(ASFriendListManager *)self contactsManager];
  [v8 removeAllPlaceholderContacts];

  uint64_t v9 = [(ASFriendListManager *)self competitionManager];
  [v9 deleteCachedCompetitions];

  id v10 = [(ASFriendListManager *)self achievementManager];
  [v10 removeAllTemplates];

  uint64_t v11 = [(ASFriendListManager *)self achievementManager];
  [v11 requestTemplateUpdate];

  uint64_t v12 = [(ASFriendListManager *)self activityDataManager];
  uint64_t v13 = [v12 deleteAllActivitySharingData];

  [(ASFriendListManager *)self updateFitnessAppBadgeCount];
  if (v4)
  {
    if (v13)
    {
      id v14 = 0;
    }
    else
    {
      id v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F23CC8] code:0 userInfo:0];
    }
    v4[2](v4, v13, v14);
  }
}

void __53__ASFriendListManager_clearFriendListWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = 0;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__ASFriendListManager_addObserver___block_invoke;
  v7[3] = &unk_2652157C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(observerQueue, v7);
}

void __35__ASFriendListManager_addObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) friends];
  [*(id *)(a1 + 40) friendListDidUpdate:v2];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__ASFriendListManager_removeObserver___block_invoke;
  v7[3] = &unk_2652157C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(observerQueue, v7);
}

uint64_t __38__ASFriendListManager_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
}

- (void)_queue_notifyObserversOfFriendListChanges
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_friendListQueue);
  int v3 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithSet:self->_friends copyItems:1];
  ASLoggingInitialize();
  id v4 = (os_log_t *)MEMORY[0x263F23AC8];
  uint64_t v5 = (void *)*MEMORY[0x263F23AC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_DEFAULT))
  {
    observers = self->_observers;
    id v7 = v5;
    *(_DWORD *)buf = 134218240;
    uint64_t v26 = [(NSHashTable *)observers count];
    __int16 v27 = 2048;
    uint64_t v28 = [v3 count];
    _os_log_impl(&dword_2474C9000, v7, OS_LOG_TYPE_DEFAULT, "Notifying %lu observers of friend list changes %lu friends.", buf, 0x16u);
  }
  uint64_t v17 = self;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * v12);
        ASLoggingInitialize();
        id v14 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v26 = v13;
          _os_log_debug_impl(&dword_2474C9000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  if ([v8 count])
  {
    observerQueue = v17->_observerQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__ASFriendListManager__queue_notifyObserversOfFriendListChanges__block_invoke;
    block[3] = &unk_2652157C8;
    block[4] = v17;
    id v19 = v8;
    dispatch_async(observerQueue, block);
  }
  os_log_t v16 = [MEMORY[0x263F087C8] defaultCenter];
  [v16 postNotificationName:*MEMORY[0x263F23C30] object:0];
}

void __64__ASFriendListManager__queue_notifyObserversOfFriendListChanges__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
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
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "friendListDidUpdate:", *(void *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_queue_notifyObserversOfCompetitionsLoaded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_friendListQueue);
  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__ASFriendListManager__queue_notifyObserversOfCompetitionsLoaded__block_invoke;
  block[3] = &unk_2652157F0;
  block[4] = self;
  dispatch_async(observerQueue, block);
  uint64_t v4 = [MEMORY[0x263F087C8] defaultCenter];
  [v4 postNotificationName:*MEMORY[0x263F23C28] object:0];
}

void __65__ASFriendListManager__queue_notifyObserversOfCompetitionsLoaded__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  id v1 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "friendListDidLoadCompetitions", (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)_handleHasFriendsChanged
{
  ASLoggingInitialize();
  uint64_t v3 = *MEMORY[0x263F23AC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "Has Friends default change notification received", buf, 2u);
  }
  friendListQueue = self->_friendListQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__ASFriendListManager__handleHasFriendsChanged__block_invoke;
  block[3] = &unk_2652157F0;
  block[4] = self;
  dispatch_async(friendListQueue, block);
}

void __47__ASFriendListManager__handleHasFriendsChanged__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 88) = objc_msgSend(*(id *)(a1 + 32), "_queue_hasLegacyFriendsToShareWith");
  int v2 = ASSecureCloudEnabled();
  uint64_t v3 = *(id **)(a1 + 32);
  if (v2)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 89) = objc_msgSend(v3, "_queue_hasSecureCloudFriendsToShareWith");
    uint64_t v4 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v4 + 88) && !*(unsigned char *)(v4 + 89)) {
      return;
    }
    uint64_t v5 = (id *)(v4 + 120);
  }
  else
  {
    if (!*((unsigned char *)v3 + 88)) {
      return;
    }
    uint64_t v5 = v3 + 15;
  }
  id WeakRetained = objc_loadWeakRetained(v5);
  long long v6 = ASCloudKitGroupUserActionImplicit();
  [WeakRetained requestImmediateUpdateWithCloudKitGroup:v6 completion:0];
}

- (void)_queue_friendListDidUpdate
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_friendListQueue);
  ASLoggingInitialize();
  uint64_t v3 = (void *)*MEMORY[0x263F23AC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_DEFAULT))
  {
    friends = self->_friends;
    uint64_t v5 = v3;
    int v6 = 134217984;
    uint64_t v7 = [(NSSet *)friends count];
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "Friends List did update: %lu friends", (uint8_t *)&v6, 0xCu);
  }
  self->_hasLegacyFriendsToShareWith = [(ASFriendListManager *)self _queue_hasLegacyFriendsToShareWith];
  self->_hasSecureCloudFriendsToShareWith = [(ASFriendListManager *)self _queue_hasSecureCloudFriendsToShareWith];
  [(ASFriendListManager *)self _queue_notifyObserversOfFriendListChanges];
  ASAnalyticsUpdateWithFriends();
  if ([(NSSet *)self->_friends count]) {
    dispatch_async((dispatch_queue_t)self->_biomeDonationQueue, &__block_literal_global_10);
  }
}

void __49__ASFriendListManager__queue_friendListDidUpdate__block_invoke()
{
  ASLoggingInitialize();
  v0 = (os_log_t *)MEMORY[0x263F23AC8];
  id v1 = *MEMORY[0x263F23AC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v1, OS_LOG_TYPE_DEFAULT, "Donating biome activity sharing friends event", buf, 2u);
  }
  int v2 = (void *)[objc_alloc(MEMORY[0x263F2A780]) initWithIdentifier:@"com.apple.ActivityMonitorApp.activity-shared" bundleID:@"com.apple.ActivityMonitorApp" context:0];
  uint64_t v3 = [MEMORY[0x263F2A9B8] discoverabilitySignal];
  uint64_t v4 = [v3 source];
  [v4 sendEvent:v2];

  ASLoggingInitialize();
  uint64_t v5 = *v0;
  if (os_log_type_enabled(*v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "Donated biome activity sharing friends event", v6, 2u);
  }
}

- (void)contactsManagerDidUpdateContacts:(id)a3
{
  friendListQueue = self->_friendListQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__ASFriendListManager_contactsManagerDidUpdateContacts___block_invoke;
  block[3] = &unk_2652157F0;
  block[4] = self;
  dispatch_async(friendListQueue, block);
}

void __56__ASFriendListManager_contactsManagerDidUpdateContacts___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v34 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) _allContactsPreferringPlaceholderContacts];
  uint64_t v3 = [MEMORY[0x263EFF9C0] set];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = v2;
  uint64_t v28 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v30;
    do
    {
      uint64_t v4 = 0;
      uint64_t v5 = v3;
      do
      {
        if (*(void *)v30 != v27) {
          objc_enumerationMutation(obj);
        }
        int v6 = *(void **)(*((void *)&v29 + 1) + 8 * v4);
        uint64_t v7 = *(void **)(v1 + 32);
        uint64_t v8 = [v6 UUID];
        long long v9 = objc_msgSend(v7, "_queue_friendWithUUID:", v8);

        if (v9)
        {
          [v9 setContact:v6];
        }
        else
        {
          long long v10 = [*(id *)(v1 + 32) activityDataManager];
          uint64_t v11 = [v6 UUID];
          uint64_t v12 = [v10 fitnessFriendSamplesForFriendWithUUID:v11];

          uint64_t v13 = [*(id *)(v1 + 32) activityDataManager];
          uint64_t v26 = [v13 activitySnapshotsFromFitnessFriendSamples:v12];

          id v14 = [*(id *)(v1 + 32) activityDataManager];
          os_log_t v15 = [v14 achievementsFromFitnessFriendSamples:v12];

          os_log_t v16 = [*(id *)(v1 + 32) activityDataManager];
          uint64_t v17 = [v16 workoutsFromFitnessFriendSamples:v12];

          id v18 = [*(id *)(v1 + 32) competitionManager];
          id v19 = [v6 UUID];
          [v18 competitionsForFriendWithUUID:v19];
          long long v21 = v20 = v1;

          long long v9 = (void *)[objc_alloc(MEMORY[0x263F23BD0]) initWithActivitySnapshots:v26 friendAchievements:v15 friendWorkouts:v17 contact:v6 competitions:v21];
          uint64_t v1 = v20;
        }
        uint64_t v3 = [v5 setByAddingObject:v9];

        ++v4;
        uint64_t v5 = v3;
      }
      while (v28 != v4);
      uint64_t v28 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v28);
  }

  uint64_t v22 = *(void *)(v1 + 32);
  long long v23 = *(void **)(v22 + 32);
  *(void *)(v22 + 32) = v3;
  id v24 = v3;

  objc_msgSend(*(id *)(v1 + 32), "_queue_friendListDidUpdate");
}

- (void)competitionManagerDidLoadCachedCompetitions:(id)a3
{
  friendListQueue = self->_friendListQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__ASFriendListManager_competitionManagerDidLoadCachedCompetitions___block_invoke;
  block[3] = &unk_2652157F0;
  block[4] = self;
  dispatch_async(friendListQueue, block);
}

void __67__ASFriendListManager_competitionManagerDidLoadCachedCompetitions___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  int v2 = (os_log_t *)MEMORY[0x263F23AC8];
  uint64_t v3 = *MEMORY[0x263F23AC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "FriendListManager updating with initial competitions", buf, 2u);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 32);
  if (v4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
          id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
          uint64_t v12 = objc_msgSend(v10, "UUID", (void)v15);
          uint64_t v13 = [WeakRetained competitionsForFriendWithUUID:v12];
          [v10 setCompetitions:v13];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v7);
    }

    objc_msgSend(*(id *)(a1 + 32), "_queue_notifyObserversOfCompetitionsLoaded");
  }
  else
  {
    ASLoggingInitialize();
    id v14 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v14, OS_LOG_TYPE_DEFAULT, "Friend list not yet constructed, not updating", buf, 2u);
    }
  }
}

- (void)competitionManager:(id)a3 didUpdateCompetitionsForFriendsWithUUIDs:(id)a4
{
  id v5 = a4;
  friendListQueue = self->_friendListQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __83__ASFriendListManager_competitionManager_didUpdateCompetitionsForFriendsWithUUIDs___block_invoke;
  v8[3] = &unk_2652157C8;
  id v9 = v5;
  long long v10 = self;
  id v7 = v5;
  dispatch_async(friendListQueue, v8);
}

uint64_t __83__ASFriendListManager_competitionManager_didUpdateCompetitionsForFriendsWithUUIDs___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  int v2 = (os_log_t *)MEMORY[0x263F23AC8];
  uint64_t v3 = *MEMORY[0x263F23AC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "FriendListManager updating with new competitions", buf, 2u);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v19;
    *(void *)&long long v6 = 138543362;
    long long v17 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(*(id *)(a1 + 40), "_queue_friendWithUUID:", v10, v17, (void)v18);
        if (v11)
        {
          id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 128));
          uint64_t v13 = [WeakRetained competitionsForFriendWithUUID:v10];
          id v14 = (void *)[v13 copy];
          [v11 setCompetitions:v14];
        }
        else
        {
          ASLoggingInitialize();
          long long v15 = *v2;
          if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            uint64_t v23 = v10;
            _os_log_error_impl(&dword_2474C9000, v15, OS_LOG_TYPE_ERROR, "FriendListManager couldn't find friend with UUID: %{public}@", buf, 0xCu);
          }
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v7);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_queue_notifyObserversOfFriendListChanges");
}

- (ASActivityDataManager)activityDataManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityDataManager);
  return (ASActivityDataManager *)WeakRetained;
}

- (void)setActivityDataManager:(id)a3
{
}

- (ASContactsManager)contactsManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactsManager);
  return (ASContactsManager *)WeakRetained;
}

- (void)setContactsManager:(id)a3
{
}

- (ASRelationshipManager)relationshipManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_relationshipManager);
  return (ASRelationshipManager *)WeakRetained;
}

- (void)setRelationshipManager:(id)a3
{
}

- (ASPeriodicUpdateManager)periodicUpdateManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_periodicUpdateManager);
  return (ASPeriodicUpdateManager *)WeakRetained;
}

- (void)setPeriodicUpdateManager:(id)a3
{
}

- (ASCompetitionManager)competitionManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_competitionManager);
  return (ASCompetitionManager *)WeakRetained;
}

- (void)setCompetitionManager:(id)a3
{
}

- (ASAchievementManager)achievementManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_achievementManager);
  return (ASAchievementManager *)WeakRetained;
}

- (void)setAchievementManager:(id)a3
{
}

- (BOOL)isWatch
{
  return self->_isWatch;
}

- (void)setIsWatch:(BOOL)a3
{
  self->_isWatch = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_achievementManager);
  objc_destroyWeak((id *)&self->_competitionManager);
  objc_destroyWeak((id *)&self->_periodicUpdateManager);
  objc_destroyWeak((id *)&self->_relationshipManager);
  objc_destroyWeak((id *)&self->_contactsManager);
  objc_destroyWeak((id *)&self->_activityDataManager);
  objc_storeStrong((id *)&self->_lastReportedFriendsDate, 0);
  objc_storeStrong((id *)&self->_biomeDonationQueue, 0);
  objc_storeStrong((id *)&self->_friendListQueue, 0);
  objc_storeStrong((id *)&self->_friends, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_databaseClient, 0);
}

void __78__ASFriendListManager_updateFriendListWithNewSnapshots_achievements_workouts___block_invoke_cold_1(_DWORD *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  uint64_t v8 = [a3 friendUUID];
  *a1 = 138543362;
  *a4 = v8;
  OUTLINED_FUNCTION_0_2(&dword_2474C9000, v9, v10, "Failed to update friend list with achievement with friend UUID %{public}@ because no friend was found with matching UUID");
}

void __78__ASFriendListManager_updateFriendListWithNewSnapshots_achievements_workouts___block_invoke_cold_2(_DWORD *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  uint64_t v8 = [a3 friendUUID];
  *a1 = 138543362;
  *a4 = v8;
  OUTLINED_FUNCTION_0_2(&dword_2474C9000, v9, v10, "Failed to update friend list with snapshot with friend UUID %{public}@ because no friend was found with matching UUID");
}

- (void)clearFriendListWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2474C9000, log, OS_LOG_TYPE_ERROR, "Clearing entire friend list!", v1, 2u);
}

@end