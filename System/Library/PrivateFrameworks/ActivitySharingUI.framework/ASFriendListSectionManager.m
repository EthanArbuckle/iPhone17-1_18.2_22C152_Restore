@interface ASFriendListSectionManager
- (ASFriendListSectionManager)init;
- (ASFriendListSectionManager)initWithModel:(id)a3 activitySharingClient:(id)a4 workoutDataProvider:(id)a5;
- (ASFriendListSectionManager)initWithModel:(id)a3 andWorkoutDataProvider:(id)a4;
- (BOOL)_isWheelchairUserDisplayModeValidForFriends:(id)a3 filter:(int64_t)a4;
- (BOOL)hasAnyFriendsSetup;
- (BOOL)hasInitializedFriendData;
- (BOOL)hasReachedMaxNumberOfFriends;
- (id)_copyFriends;
- (id)_createSectionsForFriends:(id)a3 withDisplayContext:(id)a4;
- (id)_datesToShowSnapshotsForFriend:(id)a3 startingFromCurrentDateComponents:(id)a4;
- (id)_filterFriends:(id)a3 withActiveFriendshipAtEndOfDay:(id)a4;
- (id)_filterFriends:(id)a3 withSnapshotDataAtCacheIndex:(id)a4;
- (id)_filterFriends:(id)a3 withWheelchairUseAtCacheIndex:(id)a4;
- (id)_friendWithUUID:(id)a3 fromFriends:(id)a4;
- (id)_queue_me;
- (id)_sectionForDataVisibilityConditionalUsingBlock:(id)a3;
- (id)_sectionForDataVisibilityConditionalUsingBlock:(id)a3 comparator:(id)a4;
- (id)_sortFriends:(id)a3 forDisplayMode:(int64_t)a4 cacheIndex:(id)a5;
- (id)allActiveFriendsAsRecipients;
- (id)allDestinationsForActiveOrPendingFriends;
- (id)allFriends;
- (id)friendWithUUID:(id)a3;
- (id)me;
- (id)sectionForFriendsCompetingWithMe;
- (id)sectionForFriendsHidingDataFromMe;
- (id)sectionForFriendsInvitedByMe;
- (id)sectionForFriendsInvitingMe;
- (id)sectionForFriendsMyDataIsHiddenFrom;
- (id)sectionForFriendsRequestedToCompeteByMe;
- (id)sectionForFriendsRequestedToDowngradeByMe;
- (id)sectionForFriendsRequestingMeToCompete;
- (id)sectionForFriendsWithNoHiding;
- (id)sectionsForDisplayContext:(id)a3;
- (int64_t)numberOfNewFriendsAllowed;
- (unint64_t)numberOfFriendsWithCompetitionRequestsAwaitingResponseFromMe;
- (unint64_t)numberOfFriendsWithInvitesAwaitingResponseFromMe;
- (unint64_t)totalNumberOfPendingRequests;
- (void)_applicationWillEnterForegroundNotification:(id)a3;
- (void)_calendarDayChangedNotification:(id)a3;
- (void)_createFakeFriends;
- (void)_enumerateVisibleDaysForFriends:(id)a3 usingBlock:(id)a4;
- (void)_postFriendsListChangedNotification;
- (void)_queue_handleActivitySummaryUpdate:(id)a3;
- (void)_queue_handleMyWorkoutsUpdate;
- (void)_queue_restartQueryAfterErrorCount:(int64_t)a3 withBlock:(id)a4;
- (void)_queue_startFriendsQuery;
- (void)_queue_startMeQuery;
- (void)_queue_stopQueries;
- (void)_queue_updateWithNewData;
- (void)_startQueries;
- (void)_startQueriesIfRequired;
- (void)_stopQueries;
- (void)dealloc;
- (void)enumerateValidDisplayModesForFilter:(int64_t)a3 usingBlock:(id)a4;
- (void)fetchActivitySharingDataIfTimeSinceLastFetchIsGreaterThan:(unint64_t)a3 completion:(id)a4;
@end

@implementation ASFriendListSectionManager

- (id)sectionForFriendsInvitedByMe
{
  return [(ASFriendListSectionManager *)self _sectionForDataVisibilityConditionalUsingBlock:&__block_literal_global_342];
}

- (id)sectionForFriendsCompetingWithMe
{
  return [(ASFriendListSectionManager *)self _sectionForDataVisibilityConditionalUsingBlock:&__block_literal_global_354 comparator:&__block_literal_global_357];
}

uint64_t __54__ASFriendListSectionManager_hasInitializedFriendData__block_invoke(uint64_t result)
{
  v1 = *(unsigned char **)(result + 32);
  BOOL v2 = v1[105] && v1[106] || v1[104] != 0;
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v2;
  return result;
}

void __86__ASFriendListSectionManager_initWithModel_activitySharingClient_workoutDataProvider___block_invoke_3(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __86__ASFriendListSectionManager_initWithModel_activitySharingClient_workoutDataProvider___block_invoke_4;
  v3[3] = &unk_264C19830;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

uint64_t __75__ASFriendListSectionManager__createSectionsForFriends_withDisplayContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isActivityDataCurrentlyVisibleToMe]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 isMe];
  }

  return v3;
}

uint64_t __75__ASFriendListSectionManager__createSectionsForFriends_withDisplayContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isFriendshipCurrentlyActive]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 isMe];
  }

  return v3;
}

void __54__ASFriendListSectionManager__queue_startFriendsQuery__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  ASLoggingInitialize();
  v7 = (os_log_t *)MEMORY[0x263F23AC8];
  v8 = (void *)*MEMORY[0x263F23AC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    *(_DWORD *)buf = 134349314;
    uint64_t v21 = [v5 count];
    __int16 v22 = 2114;
    id v23 = v6;
    _os_log_impl(&dword_234DE2000, v9, OS_LOG_TYPE_DEFAULT, "Friend Query returned results, friend count: %{public}lu, error: %{public}@.", buf, 0x16u);
  }
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    ASLoggingInitialize();
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      __54__ASFriendListSectionManager__queue_startFriendsQuery__block_invoke_cold_1();
      if (!WeakRetained) {
        goto LABEL_10;
      }
    }
    else if (!WeakRetained)
    {
LABEL_10:

      goto LABEL_11;
    }
    v11 = WeakRetained[4];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __54__ASFriendListSectionManager__queue_startFriendsQuery__block_invoke_377;
    v16[3] = &unk_264C197E0;
    v16[4] = WeakRetained;
    dispatch_async(v11, v16);
    goto LABEL_10;
  }
  if (v5)
  {
    id v12 = objc_loadWeakRetained((id *)(a1 + 40));
    WeakRetained = v12;
    if (v12)
    {
      v13 = *((void *)v12 + 4);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __54__ASFriendListSectionManager__queue_startFriendsQuery__block_invoke_376;
      block[3] = &unk_264C199A8;
      block[4] = v12;
      id v14 = v5;
      uint64_t v15 = *(void *)(a1 + 32);
      id v18 = v14;
      uint64_t v19 = v15;
      dispatch_async(v13, block);
    }
    goto LABEL_10;
  }
LABEL_11:
}

void __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke_382(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 80) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_queue_handleActivitySummaryUpdate:", *(void *)(a1 + 40));
  id v2 = *(void **)(*(void *)(a1 + 32) + 72);
  id v3 = [*(id *)(a1 + 48) startOfDayForDate:*(void *)(a1 + 56)];
  [v2 startFetchingFromDate:v3];
}

- (id)sectionsForDisplayContext:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  readWriteQueue = self->_readWriteQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__ASFriendListSectionManager_sectionsForDisplayContext___block_invoke;
  block[3] = &unk_264C198A8;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(readWriteQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __43__ASFriendListSectionManager__startQueries__block_invoke(uint64_t a1)
{
  ASLoggingInitialize();
  id v2 = *MEMORY[0x263F23AC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_234DE2000, v2, OS_LOG_TYPE_DEFAULT, "Application is active, starting me and friend queries if needed.", v4, 2u);
  }
  *(void *)(*(void *)(a1 + 32) + 80) = 0;
  *(void *)(*(void *)(a1 + 32) + 88) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_queue_startMeQuery");
  return objc_msgSend(*(id *)(a1 + 32), "_queue_startFriendsQuery");
}

- (void)_queue_startMeQuery
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_readWriteQueue);
  if (!self->_meQuery)
  {
    id v3 = [MEMORY[0x263EFF910] date];
    id v4 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    id v5 = [v4 dateByAddingUnit:16 value:1 - *MEMORY[0x263F23D60] toDate:v3 options:0];
    id v6 = objc_msgSend(v4, "hk_activitySummaryDateComponentsFromDate:", v5);
    id v7 = objc_msgSend(v4, "hk_activitySummaryDateComponentsFromDate:", v3);
    v8 = [MEMORY[0x263F0A668] predicateForActivitySummariesBetweenStartDateComponents:v6 endDateComponents:v7];
    objc_initWeak(&location, self);
    id v9 = objc_alloc(MEMORY[0x263F0A098]);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke;
    v21[3] = &unk_264C19A20;
    objc_copyWeak(&v24, &location);
    id v10 = v4;
    id v22 = v10;
    id v11 = v5;
    id v23 = v11;
    uint64_t v12 = (HKActivitySummaryQuery *)[v9 initWithPredicate:v8 resultsHandler:v21];
    meQuery = self->_meQuery;
    self->_meQuery = v12;

    uint64_t v14 = self->_meQuery;
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    id v17 = __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke_3;
    id v18 = &unk_264C19A70;
    uint64_t v19 = self;
    objc_copyWeak(&v20, &location);
    [(HKActivitySummaryQuery *)v14 setUpdateHandler:&v15];
    -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", self->_meQuery, v15, v16, v17, v18, v19);
    objc_destroyWeak(&v20);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
}

- (void)_queue_startFriendsQuery
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_readWriteQueue);
  if (!self->_friendQuery)
  {
    objc_initWeak(&location, self);
    id v3 = objc_alloc(MEMORY[0x263F24018]);
    activitySharingClient = self->_activitySharingClient;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __54__ASFriendListSectionManager__queue_startFriendsQuery__block_invoke;
    v7[3] = &unk_264C199D0;
    objc_copyWeak(&v8, &location);
    v7[4] = self;
    id v5 = (ASActivitySharingFriendQuery *)[v3 initWithActivitySharingClient:activitySharingClient updateHandler:v7];
    friendQuery = self->_friendQuery;
    self->_friendQuery = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (BOOL)hasInitializedFriendData
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  readWriteQueue = self->_readWriteQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__ASFriendListSectionManager_hasInitializedFriendData__block_invoke;
  v10[3] = &unk_264C19880;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(readWriteQueue, v10);
  ASLoggingInitialize();
  id v4 = *MEMORY[0x263F23AC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *((unsigned __int8 *)v12 + 24);
    BOOL hasReceivedFriendListQueryResult = self->_hasReceivedFriendListQueryResult;
    BOOL hasReceivedMeQueryResult = self->_hasReceivedMeQueryResult;
    *(_DWORD *)buf = 67109632;
    int v16 = v5;
    __int16 v17 = 1024;
    BOOL v18 = hasReceivedFriendListQueryResult;
    __int16 v19 = 1024;
    BOOL v20 = hasReceivedMeQueryResult;
    _os_log_impl(&dword_234DE2000, v4, OS_LOG_TYPE_DEFAULT, "Returning hasInitializedFriendData value: %d, _hasReceivedFriendListQueryResult: %d, _hasReceivedMeQueryResult: %d", buf, 0x14u);
  }
  char v8 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v8;
}

- (ASFriendListSectionManager)initWithModel:(id)a3 activitySharingClient:(id)a4 workoutDataProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v36.receiver = self;
  v36.super_class = (Class)ASFriendListSectionManager;
  uint64_t v12 = [(ASFriendListSectionManager *)&v36 init];
  if (v12)
  {
    uint64_t v13 = HKCreateSerialDispatchQueue();
    readWriteQueue = v12->_readWriteQueue;
    v12->_readWriteQueue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v12->_model, a3);
    uint64_t v15 = [v9 healthStore];
    healthStore = v12->_healthStore;
    v12->_healthStore = (HKHealthStore *)v15;

    objc_storeStrong((id *)&v12->_activitySharingClient, a4);
    if (v11) {
      __int16 v17 = (FIUIWorkoutDataProvider *)v11;
    }
    else {
      __int16 v17 = (FIUIWorkoutDataProvider *)[objc_alloc(MEMORY[0x263F3F190]) initWithHealthStore:v12->_healthStore];
    }
    workoutDataProvider = v12->_workoutDataProvider;
    v12->_workoutDataProvider = v17;

    objc_initWeak(&location, v12);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __86__ASFriendListSectionManager_initWithModel_activitySharingClient_workoutDataProvider___block_invoke;
    aBlock[3] = &unk_264C19808;
    objc_copyWeak(&v34, &location);
    __int16 v19 = _Block_copy(aBlock);
    [(FIUIWorkoutDataProvider *)v12->_workoutDataProvider addUpdateHandler:v19];
    uint64_t v20 = [MEMORY[0x263EFF9C0] set];
    allFriends = v12->_allFriends;
    v12->_allFriends = (NSSet *)v20;

    v12->_meQueryRetries = 0;
    v12->_friendQueryRetries = 0;
    id v22 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    displayContextToSortedSectionsCache = v12->_displayContextToSortedSectionsCache;
    v12->_displayContextToSortedSectionsCache = v22;

    id v24 = [MEMORY[0x263F08A00] defaultCenter];
    [v24 addObserver:v12 selector:sel__calendarDayChangedNotification_ name:*MEMORY[0x263EFF3C8] object:0];
    [v24 addObserver:v12 selector:sel__applicationWillEnterForegroundNotification_ name:*MEMORY[0x263F833B8] object:0];
    id v25 = objc_alloc(MEMORY[0x263EFFA40]);
    v26 = (void *)[v25 initWithSuiteName:*MEMORY[0x263F23CC8]];
    if ([MEMORY[0x263F82438] isRunningInStoreDemoMode]) {
      char v27 = 1;
    }
    else {
      char v27 = [v26 BOOLForKey:*MEMORY[0x263F23CE8]];
    }
    v12->_shouldGenerateDemoData = v27;
    v28 = v12->_healthStore;
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __86__ASFriendListSectionManager_initWithModel_activitySharingClient_workoutDataProvider___block_invoke_3;
    v31[3] = &unk_264C19858;
    v29 = v12;
    v32 = v29;
    [(HKHealthStore *)v28 _shouldGenerateDemoDataPreferenceIsSet:v31];
    [(ASFriendListSectionManager *)v29 _startQueriesIfRequired];

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __65__ASFriendListSectionManager__postFriendsListChangedNotification__block_invoke()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:*MEMORY[0x263F23CD8] object:0];
}

- (id)allDestinationsForActiveOrPendingFriends
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFFA08] set];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = [(ASFriendListSectionManager *)self _copyFriends];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v5) {
    goto LABEL_18;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v21;
  do
  {
    uint64_t v8 = 0;
    do
    {
      if (*(void *)v21 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = *(void **)(*((void *)&v20 + 1) + 8 * v8);
      if ((objc_msgSend(v9, "isMe", (void)v20) & 1) == 0)
      {
        id v10 = [v9 contact];
        uint64_t v11 = [v10 destinations];
        if (!v11) {
          goto LABEL_12;
        }
        uint64_t v12 = (void *)v11;
        if (([v9 isFriendshipCurrentlyActive] & 1) != 0
          || [v9 isAwaitingInviteResponseFromMe])
        {

LABEL_11:
          id v10 = [v9 contact];
          uint64_t v13 = [v10 destinations];
          uint64_t v14 = [v3 setByAddingObjectsFromSet:v13];

          id v3 = (void *)v14;
LABEL_12:

          goto LABEL_13;
        }
        int v15 = [v9 hasInviteRequestFromMe];

        if (v15) {
          goto LABEL_11;
        }
      }
LABEL_13:
      ++v8;
    }
    while (v6 != v8);
    uint64_t v16 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    uint64_t v6 = v16;
  }
  while (v16);
LABEL_18:

  if ([v3 count]) {
    __int16 v17 = v3;
  }
  else {
    __int16 v17 = 0;
  }
  id v18 = v17;

  return v18;
}

- (void)_queue_handleActivitySummaryUpdate:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_readWriteQueue);
  uint64_t v5 = [(ASFriendListSectionManager *)self _queue_me];
  if (!v5)
  {
    uint64_t v6 = (void *)[(NSSet *)self->_allFriends mutableCopy];
    id v7 = objc_alloc(MEMORY[0x263F23BD0]);
    uint64_t v5 = (void *)[v7 initWithActivitySnapshots:0 friendAchievements:0 friendWorkouts:0 contact:0 competitions:MEMORY[0x263EFFA68]];
    [v6 addObject:v5];
    uint64_t v8 = [MEMORY[0x263EFFA08] setWithSet:v6];
    allFriends = self->_allFriends;
    self->_allFriends = v8;
  }
  long long v23 = self;
  id v10 = objc_msgSend(v5, "snapshots", v5);
  uint64_t v11 = (void *)[v10 mutableCopy];

  if (!v11) {
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v4, "count"));
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v12 = v4;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        __int16 v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v18 = [MEMORY[0x263F0A9D0] snapshotWithActivitySummary:v17];
        __int16 v19 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v17, "_activitySummaryIndex"));
        [v11 setObject:v18 forKey:v19];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v14);
  }

  [v22 setSnapshots:v11];
  v23->_BOOL hasReceivedMeQueryResult = 1;
  ASLoggingInitialize();
  long long v20 = *MEMORY[0x263F23AC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_DEFAULT))
  {
    BOOL hasReceivedMeQueryResult = v23->_hasReceivedMeQueryResult;
    *(_DWORD *)buf = 67109120;
    BOOL v29 = hasReceivedMeQueryResult;
    _os_log_impl(&dword_234DE2000, v20, OS_LOG_TYPE_DEFAULT, "Updating _hasReceivedMeQueryResult: %d", buf, 8u);
  }
  [(ASFriendListSectionManager *)v23 _queue_updateWithNewData];
}

void __54__ASFriendListSectionManager__queue_startFriendsQuery__block_invoke_376(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  *(void *)(*(void *)(a1 + 32) + 88) = 0;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_me");
  uint64_t v3 = [*(id *)(a1 + 40) copy];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = v3;

  if (v2)
  {
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 48) setByAddingObject:v2];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 48);
    *(void *)(v7 + 48) = v6;
  }
  *(unsigned char *)(*(void *)(a1 + 48) + 105) = 1;
  ASLoggingInitialize();
  id v9 = *MEMORY[0x263F23AC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = *(unsigned __int8 *)(*(void *)(a1 + 48) + 105);
    v11[0] = 67109120;
    v11[1] = v10;
    _os_log_impl(&dword_234DE2000, v9, OS_LOG_TYPE_DEFAULT, "Updating _hasReceivedFriendListQueryResult: %d", (uint8_t *)v11, 8u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_queue_updateWithNewData");
}

uint64_t __42__ASFriendListSectionManager__copyFriends__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 48) copy];
  return MEMORY[0x270F9A758]();
}

- (void)_queue_updateWithNewData
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_readWriteQueue);
  [(NSCache *)self->_displayContextToSortedSectionsCache removeAllObjects];
  [(ASFriendListSectionManager *)self _postFriendsListChangedNotification];
}

- (id)_queue_me
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_readWriteQueue);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = self->_allFriends;
  id v4 = (id)[(NSSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "isMe", (void)v9))
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[(NSSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)_postFriendsListChangedNotification
{
  ASLoggingInitialize();
  id v2 = *MEMORY[0x263F23AC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_234DE2000, v2, OS_LOG_TYPE_DEFAULT, "Updating _postFriendsListChangedNotification", v3, 2u);
  }
  dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_373);
}

void __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke(id *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  ASLoggingInitialize();
  uint64_t v8 = (os_log_t *)MEMORY[0x263F23AC8];
  long long v9 = (void *)*MEMORY[0x263F23AC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_DEFAULT))
  {
    long long v10 = v9;
    *(_DWORD *)buf = 134349314;
    uint64_t v22 = [v6 count];
    __int16 v23 = 2114;
    id v24 = v7;
    _os_log_impl(&dword_234DE2000, v10, OS_LOG_TYPE_DEFAULT, "Me Query returned results, result count: %{public}lu, error: %{public}@.", buf, 0x16u);
  }
  if (v7)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
      __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke_cold_1();
    }
    WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 6);
    long long v12 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v13 = WeakRetained[4];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke_383;
      block[3] = &unk_264C197E0;
      block[4] = v12;
      dispatch_async(v13, block);
    }
LABEL_11:

    goto LABEL_12;
  }
  if ([v6 count])
  {
    uint64_t v14 = (NSObject **)objc_loadWeakRetained(a1 + 6);
    long long v12 = v14;
    if (v14)
    {
      uint64_t v15 = v14[4];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke_382;
      v17[3] = &unk_264C199F8;
      v17[4] = v14;
      id v18 = v6;
      id v19 = a1[4];
      id v20 = a1[5];
      dispatch_async(v15, v17);
    }
    goto LABEL_11;
  }
LABEL_12:
}

- (BOOL)hasAnyFriendsSetup
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = [(ASFriendListSectionManager *)self _sectionForDataVisibilityConditionalUsingBlock:&__block_literal_global_365];
  ASLoggingInitialize();
  uint64_t v3 = (NSObject **)MEMORY[0x263F23AC0];
  id v4 = (void *)*MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = v4;
    id v6 = [v2 rows];
    int v15 = 134217984;
    uint64_t v16 = [v6 count];
    _os_log_impl(&dword_234DE2000, v5, OS_LOG_TYPE_DEFAULT, "Fitness Friends Framework checking if any friends are setup, filtered to friends that are active, invited, or inviting me: %lu", (uint8_t *)&v15, 0xCu);
  }
  id v7 = [v2 rows];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x263EFFA40]);
    long long v11 = (void *)[v10 initWithSuiteName:*MEMORY[0x263F23CC8]];
    long long v12 = [v11 objectForKey:*MEMORY[0x263F23CF0]];
    int v9 = [v12 BOOLValue];
    ASLoggingInitialize();
    uint64_t v13 = *v3;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 67109120;
      LODWORD(v16) = v9;
      _os_log_impl(&dword_234DE2000, v13, OS_LOG_TYPE_DEFAULT, "Fitness Friends Framework checking defaults if any friends are setup: %{BOOL}d", (uint8_t *)&v15, 8u);
    }
  }
  return v9;
}

- (id)_sectionForDataVisibilityConditionalUsingBlock:(id)a3
{
  return [(ASFriendListSectionManager *)self _sectionForDataVisibilityConditionalUsingBlock:a3 comparator:&__block_literal_global_361];
}

void __56__ASFriendListSectionManager_sectionsForDisplayContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v5 = [*(id *)(a1 + 32) _createSectionsForFriends:*(void *)(*(void *)(a1 + 32) + 48) withDisplayContext:*(void *)(a1 + 40)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = *(void **)(a1 + 40);
    int v9 = *(void **)(*(void *)(a1 + 32) + 40);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v11 = (id)[v8 copy];
    [v9 setObject:v10 forKey:v11];
  }
}

- (id)_createSectionsForFriends:(id)a3 withDisplayContext:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v30 = a3;
  id v6 = a4;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy_;
  v42 = __Block_byref_object_dispose_;
  id v43 = [MEMORY[0x263EFF980] array];
  id v7 = [v30 allObjects];
  uint64_t v8 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_403];
  int v9 = [v7 filteredArrayUsingPredicate:v8];

  if ([v6 displayFilter] == 1)
  {
    uint64_t v10 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_405];
    BOOL v29 = [v9 filteredArrayUsingPredicate:v10];

    id v11 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    long long v12 = [MEMORY[0x263EFF910] date];
    v28 = [v11 startOfDayForDate:v12];

    uint64_t v13 = -[ASFriendListSectionManager _sortFriends:forDisplayMode:cacheIndex:](self, "_sortFriends:forDisplayMode:cacheIndex:", v29, [v6 displayMode], 0);
    uint64_t v14 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v13, "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v44 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v35 != v17) {
            objc_enumerationMutation(v15);
          }
          id v19 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          id v20 = objc_opt_new();
          [v20 setFriend:v19];
          long long v21 = [v19 currentSnapshotWithGoalsCarriedForward];
          [v20 setSnapshot:v21];

          [v14 addObject:v20];
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v44 count:16];
      }
      while (v16);
    }

    uint64_t v22 = [ASFriendListSection alloc];
    __int16 v23 = [MEMORY[0x263EFF8C0] arrayWithArray:v14];
    id v24 = [(ASFriendListSection *)v22 initWithDate:v28 andRows:v23];

    [(id)v39[5] insertObject:v24 atIndex:0];
  }
  else
  {
    uint64_t v25 = [MEMORY[0x263EFFA08] setWithArray:v9];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __75__ASFriendListSectionManager__createSectionsForFriends_withDisplayContext___block_invoke_3;
    v31[3] = &unk_264C19B28;
    void v31[4] = self;
    id v32 = v6;
    v33 = &v38;
    [(ASFriendListSectionManager *)self _enumerateVisibleDaysForFriends:v25 usingBlock:v31];
  }
  long long v26 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:", v39[5], v28);

  _Block_object_dispose(&v38, 8);
  return v26;
}

- (id)_sortFriends:(id)a3 forDisplayMode:(int64_t)a4 cacheIndex:(id)a5
{
  id v7 = a5;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  id v15 = __69__ASFriendListSectionManager__sortFriends_forDisplayMode_cacheIndex___block_invoke;
  uint64_t v16 = &unk_264C19B78;
  id v17 = v7;
  int64_t v18 = a4;
  id v8 = v7;
  int v9 = [a3 sortedArrayUsingComparator:&v13];
  uint64_t v10 = objc_msgSend(v9, "reverseObjectEnumerator", v13, v14, v15, v16);
  id v11 = [v10 allObjects];

  return v11;
}

- (void)_applicationWillEnterForegroundNotification:(id)a3
{
  [(ASFriendListSectionManager *)self _startQueriesIfRequired];
  if ([(ASFriendListSectionManager *)self hasAnyFriendsSetup])
  {
    ASLoggingInitialize();
    id v4 = *MEMORY[0x263F23AC8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_234DE2000, v4, OS_LOG_TYPE_DEFAULT, "Fetching data because app came into foreground.", v5, 2u);
    }
    [(ASFriendListSectionManager *)self fetchActivitySharingDataIfTimeSinceLastFetchIsGreaterThan:600 completion:0];
  }
}

- (void)_startQueries
{
  readWriteQueue = self->_readWriteQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__ASFriendListSectionManager__startQueries__block_invoke;
  block[3] = &unk_264C197E0;
  block[4] = self;
  dispatch_async(readWriteQueue, block);
}

- (void)_startQueriesIfRequired
{
  if (self->_shouldGenerateDemoData)
  {
    ASLoggingInitialize();
    uint64_t v3 = *MEMORY[0x263F23AC8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_234DE2000, v3, OS_LOG_TYPE_DEFAULT, "Generating fake friends.", v4, 2u);
    }
    [(ASFriendListSectionManager *)self _stopQueries];
    [(ASFriendListSectionManager *)self _createFakeFriends];
  }
  else
  {
    [(ASFriendListSectionManager *)self _startQueries];
  }
}

- (id)allFriends
{
  id v2 = [(ASFriendListSectionManager *)self _copyFriends];
  return v2;
}

- (id)_sectionForDataVisibilityConditionalUsingBlock:(id)a3 comparator:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = (unsigned int (**)(id, void *))a3;
  id v20 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = [(ASFriendListSectionManager *)self _copyFriends];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    id v11 = (void *)MEMORY[0x263EFFA68];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (([v13 isMe] & 1) == 0 && v6[2](v6, v13))
        {
          uint64_t v14 = objc_alloc_init(ASFriendListRow);
          [(ASFriendListRow *)v14 setFriend:v13];
          if ([v13 isActivityDataCurrentlyVisibleToMe])
          {
            id v15 = [v13 currentSnapshotWithGoalsCarriedForward];
            [(ASFriendListRow *)v14 setSnapshot:v15];
          }
          uint64_t v16 = [v11 arrayByAddingObject:v14];

          id v11 = (void *)v16;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }
  else
  {
    id v11 = (void *)MEMORY[0x263EFFA68];
  }

  id v17 = [v11 sortedArrayUsingComparator:v20];

  int64_t v18 = [[ASFriendListSection alloc] initWithDate:0 andRows:v17];
  return v18;
}

- (id)_copyFriends
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy_;
  uint64_t v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  readWriteQueue = self->_readWriteQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__ASFriendListSectionManager__copyFriends__block_invoke;
  v5[3] = &unk_264C19880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(readWriteQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __86__ASFriendListSectionManager_initWithModel_activitySharingClient_workoutDataProvider___block_invoke_4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 104) |= *(unsigned char *)(a1 + 40);
  return [*(id *)(a1 + 32) _startQueriesIfRequired];
}

- (ASFriendListSectionManager)init
{
  return 0;
}

- (ASFriendListSectionManager)initWithModel:(id)a3 andWorkoutDataProvider:(id)a4
{
  uint64_t v6 = (objc_class *)MEMORY[0x263F24010];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  [v9 activateWithCompletionHandler:&__block_literal_global];
  uint64_t v10 = [(ASFriendListSectionManager *)self initWithModel:v8 activitySharingClient:v9 workoutDataProvider:v7];

  return v10;
}

void __86__ASFriendListSectionManager_initWithModel_activitySharingClient_workoutDataProvider___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained[4];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __86__ASFriendListSectionManager_initWithModel_activitySharingClient_workoutDataProvider___block_invoke_2;
    block[3] = &unk_264C197E0;
    uint64_t v5 = WeakRetained;
    dispatch_async(v3, block);
  }
}

uint64_t __86__ASFriendListSectionManager_initWithModel_activitySharingClient_workoutDataProvider___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleMyWorkoutsUpdate");
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ASFriendListSectionManager;
  [(ASFriendListSectionManager *)&v4 dealloc];
}

- (void)_stopQueries
{
  readWriteQueue = self->_readWriteQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__ASFriendListSectionManager__stopQueries__block_invoke;
  block[3] = &unk_264C197E0;
  void block[4] = self;
  dispatch_async(readWriteQueue, block);
}

uint64_t __42__ASFriendListSectionManager__stopQueries__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_stopQueries");
}

- (void)enumerateValidDisplayModesForFilter:(int64_t)a3 usingBlock:(id)a4
{
  id v8 = (void (**)(id, void))a4;
  id v6 = [(ASFriendListSectionManager *)self _copyFriends];
  for (uint64_t i = 0; i != 5; ++i)
    v8[2](v8, i);
  if ([(ASFriendListSectionManager *)self _isWheelchairUserDisplayModeValidForFriends:v6 filter:a3])
  {
    v8[2](v8, 5);
  }
}

- (id)sectionForFriendsInvitingMe
{
  return [(ASFriendListSectionManager *)self _sectionForDataVisibilityConditionalUsingBlock:&__block_literal_global_340];
}

uint64_t __57__ASFriendListSectionManager_sectionForFriendsInvitingMe__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 sentInviteRequestToMe]) {
    uint64_t v3 = [v2 isFriendshipCurrentlyActive] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __58__ASFriendListSectionManager_sectionForFriendsInvitedByMe__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 hasInviteRequestFromMe]) {
    uint64_t v3 = [v2 isFriendshipCurrentlyActive] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)sectionForFriendsHidingDataFromMe
{
  return [(ASFriendListSectionManager *)self _sectionForDataVisibilityConditionalUsingBlock:&__block_literal_global_344];
}

uint64_t __63__ASFriendListSectionManager_sectionForFriendsHidingDataFromMe__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isFriendshipCurrentlyActive]) {
    uint64_t v3 = [v2 isCurrentlyHidingActivityDataFromMe];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)sectionForFriendsMyDataIsHiddenFrom
{
  return [(ASFriendListSectionManager *)self _sectionForDataVisibilityConditionalUsingBlock:&__block_literal_global_346];
}

uint64_t __65__ASFriendListSectionManager_sectionForFriendsMyDataIsHiddenFrom__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isFriendshipCurrentlyActive]) {
    uint64_t v3 = [v2 isMyActivityDataCurrentlyHidden];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)sectionForFriendsWithNoHiding
{
  return [(ASFriendListSectionManager *)self _sectionForDataVisibilityConditionalUsingBlock:&__block_literal_global_348];
}

uint64_t __59__ASFriendListSectionManager_sectionForFriendsWithNoHiding__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isFriendshipCurrentlyActive]
    && [v2 canSeeMyActivityData])
  {
    uint64_t v3 = [v2 isActivityDataCurrentlyVisibleToMe];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)sectionForFriendsRequestingMeToCompete
{
  return [(ASFriendListSectionManager *)self _sectionForDataVisibilityConditionalUsingBlock:&__block_literal_global_350];
}

uint64_t __68__ASFriendListSectionManager_sectionForFriendsRequestingMeToCompete__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isFriendshipCurrentlyActive]) {
    uint64_t v3 = [v2 isAwaitingCompetitionResponseFromMe];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)sectionForFriendsRequestedToCompeteByMe
{
  return [(ASFriendListSectionManager *)self _sectionForDataVisibilityConditionalUsingBlock:&__block_literal_global_352];
}

uint64_t __69__ASFriendListSectionManager_sectionForFriendsRequestedToCompeteByMe__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isFriendshipCurrentlyActive]
    && [v2 hasCompetitionRequestFromMe]
    && ([v2 isCompetitionActive] & 1) == 0)
  {
    uint64_t v5 = [v2 dateForLatestOutgoingCompetitionRequest];
    uint64_t IsStillVisible = ASCompetitionRequestIsStillVisible();
  }
  else
  {
    uint64_t IsStillVisible = 0;
  }

  return IsStillVisible;
}

uint64_t __62__ASFriendListSectionManager_sectionForFriendsCompetingWithMe__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCompetitionActive];
}

uint64_t __62__ASFriendListSectionManager_sectionForFriendsCompetingWithMe__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 friend];
  id v7 = [v6 currentCompetition];
  id v8 = [v7 endDate];
  id v9 = [v5 friend];
  uint64_t v10 = [v9 currentCompetition];
  id v11 = [v10 endDate];
  uint64_t v12 = [v8 compare:v11];

  if (!v12)
  {
    uint64_t v13 = [v4 friend];
    uint64_t v14 = [v13 displayName];
    id v15 = [v14 uppercaseString];
    uint64_t v16 = [v5 friend];
    id v17 = [v16 displayName];
    int64_t v18 = [v17 uppercaseString];
    uint64_t v12 = [v15 compare:v18];

    if (!v12)
    {
      id v19 = [v4 friend];
      id v20 = [v19 dateForLatestRelationshipStart];
      long long v21 = [v5 friend];
      long long v22 = [v21 dateForLatestRelationshipStart];
      uint64_t v12 = [v20 compare:v22];
    }
  }

  return v12;
}

- (id)sectionForFriendsRequestedToDowngradeByMe
{
  return [(ASFriendListSectionManager *)self _sectionForDataVisibilityConditionalUsingBlock:&__block_literal_global_359];
}

uint64_t __71__ASFriendListSectionManager_sectionForFriendsRequestedToDowngradeByMe__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isFriendshipCurrentlyActive]) {
    uint64_t v3 = [v2 needsDowngradeRequestAcknowledgment];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __77__ASFriendListSectionManager__sectionForDataVisibilityConditionalUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 friend];
  id v6 = [v5 fullName];
  id v7 = [v6 uppercaseString];
  id v8 = [v4 friend];

  id v9 = [v8 fullName];
  uint64_t v10 = [v9 uppercaseString];
  uint64_t v11 = [v7 compare:v10];

  return v11;
}

- (id)friendWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(ASFriendListSectionManager *)self _copyFriends];
  id v6 = [(ASFriendListSectionManager *)self _friendWithUUID:v4 fromFriends:v5];

  return v6;
}

- (id)_friendWithUUID:(id)a3 fromFriends:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a4;
  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "UUID", (void)v14);
        char v12 = [v11 isEqual:v5];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)me
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy_;
  uint64_t v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  readWriteQueue = self->_readWriteQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __32__ASFriendListSectionManager_me__block_invoke;
  v5[3] = &unk_264C19880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(readWriteQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __32__ASFriendListSectionManager_me__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_me");
  return MEMORY[0x270F9A758]();
}

uint64_t __48__ASFriendListSectionManager_hasAnyFriendsSetup__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (([v2 isFriendshipCurrentlyActive] & 1) != 0
    || ([v2 hasInviteRequestFromMe] & 1) != 0)
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = [v2 sentInviteRequestToMe];
  }

  return v3;
}

- (id)allActiveFriendsAsRecipients
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = [(ASFriendListSectionManager *)self _copyFriends];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v3)
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_16;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)v17;
  uint64_t v6 = (void *)MEMORY[0x263EFFA68];
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v17 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
      if ((objc_msgSend(v8, "isMe", (void)v16) & 1) == 0)
      {
        id v9 = [v8 contact];
        uint64_t v10 = [v9 primaryDestinationForMessaging];
        if (v10 && [v8 isFriendshipCurrentlyActive])
        {
          int v11 = [v8 isActivityDataCurrentlyVisibleToMe];

          if (!v11) {
            continue;
          }
          id v9 = [v8 contact];
          uint64_t v10 = [v9 primaryDestinationForMessaging];
          uint64_t v12 = [v6 arrayByAddingObject:v10];

          uint64_t v6 = (void *)v12;
        }
      }
    }
    uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  }
  while (v4);
LABEL_16:

  if ([v6 count]) {
    uint64_t v13 = v6;
  }
  else {
    uint64_t v13 = 0;
  }
  id v14 = v13;

  return v14;
}

- (unint64_t)numberOfFriendsWithInvitesAwaitingResponseFromMe
{
  id v2 = [(ASFriendListSectionManager *)self sectionForFriendsInvitingMe];
  uint64_t v3 = [v2 rows];

  uint64_t v4 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_370];
  uint64_t v5 = [v3 filteredArrayUsingPredicate:v4];

  unint64_t v6 = [v5 count];
  return v6;
}

uint64_t __78__ASFriendListSectionManager_numberOfFriendsWithInvitesAwaitingResponseFromMe__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 friend];
  uint64_t v3 = [v2 isAwaitingInviteResponseFromMe];

  return v3;
}

- (unint64_t)numberOfFriendsWithCompetitionRequestsAwaitingResponseFromMe
{
  id v2 = [(ASFriendListSectionManager *)self sectionForFriendsRequestingMeToCompete];
  uint64_t v3 = [v2 rows];
  unint64_t v4 = [v3 count];

  return v4;
}

- (unint64_t)totalNumberOfPendingRequests
{
  unint64_t v3 = [(ASFriendListSectionManager *)self numberOfFriendsWithInvitesAwaitingResponseFromMe];
  return [(ASFriendListSectionManager *)self numberOfFriendsWithCompetitionRequestsAwaitingResponseFromMe]+ v3;
}

- (void)fetchActivitySharingDataIfTimeSinceLastFetchIsGreaterThan:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  activitySharingClient = self->_activitySharingClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __99__ASFriendListSectionManager_fetchActivitySharingDataIfTimeSinceLastFetchIsGreaterThan_completion___block_invoke;
  v9[3] = &unk_264C19930;
  id v10 = v6;
  id v8 = v6;
  [(ASActivitySharingClient *)activitySharingClient fetchActivityDataIfGreaterThanLastFetchElapsedMinimum:a3 completion:v9];
}

void __99__ASFriendListSectionManager_fetchActivitySharingDataIfTimeSinceLastFetchIsGreaterThan_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  ASLoggingInitialize();
  id v6 = *MEMORY[0x263F23AC8];
  if (v5 || !a2)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_ERROR)) {
      __99__ASFriendListSectionManager_fetchActivitySharingDataIfTimeSinceLastFetchIsGreaterThan_completion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_234DE2000, v6, OS_LOG_TYPE_DEFAULT, "Finished fetching new friend data successfully.", v8, 2u);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

- (int64_t)numberOfNewFriendsAllowed
{
  id v2 = [(ASFriendListSectionManager *)self _copyFriends];
  int64_t v3 = ASNumberOfNewFriendsAllowedForFriends();

  return v3;
}

- (BOOL)hasReachedMaxNumberOfFriends
{
  return [(ASFriendListSectionManager *)self numberOfNewFriendsAllowed] < 1;
}

- (void)_calendarDayChangedNotification:(id)a3
{
  readWriteQueue = self->_readWriteQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__ASFriendListSectionManager__calendarDayChangedNotification___block_invoke;
  block[3] = &unk_264C197E0;
  void block[4] = self;
  dispatch_async(readWriteQueue, block);
}

uint64_t __62__ASFriendListSectionManager__calendarDayChangedNotification___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_stopQueries");
  id v2 = *(void **)(a1 + 32);
  return [v2 _startQueriesIfRequired];
}

- (BOOL)_isWheelchairUserDisplayModeValidForFriends:(id)a3 filter:(int64_t)a4
{
  id v5 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__ASFriendListSectionManager__isWheelchairUserDisplayModeValidForFriends_filter___block_invoke;
  v7[3] = &unk_264C19958;
  v7[4] = self;
  void v7[5] = &v8;
  [(ASFriendListSectionManager *)self _enumerateVisibleDaysForFriends:v5 usingBlock:v7];
  LOBYTE(self) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)self;
}

void __81__ASFriendListSectionManager__isWheelchairUserDisplayModeValidForFriends_filter___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = [*(id *)(a1 + 32) _filterFriends:a4 withWheelchairUseAtCacheIndex:a3];
  if ([v5 count]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)_queue_restartQueryAfterErrorCount:(int64_t)a3 withBlock:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_readWriteQueue);
  int64_t v7 = 5;
  if (a3 < 5) {
    int64_t v7 = a3;
  }
  dispatch_time_t v8 = dispatch_time(0, 1000000000 * v7);
  readWriteQueue = self->_readWriteQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  _DWORD v11[2] = __75__ASFriendListSectionManager__queue_restartQueryAfterErrorCount_withBlock___block_invoke;
  v11[3] = &unk_264C19980;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  dispatch_after(v8, readWriteQueue, v11);
}

uint64_t __75__ASFriendListSectionManager__queue_restartQueryAfterErrorCount_withBlock___block_invoke(uint64_t a1)
{
  ASLoggingInitialize();
  id v2 = *MEMORY[0x263F23AC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_ERROR)) {
    __75__ASFriendListSectionManager__queue_restartQueryAfterErrorCount_withBlock___block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __54__ASFriendListSectionManager__queue_startFriendsQuery__block_invoke_377(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  ++v1[11];
  uint64_t v3 = MEMORY[0x263EF8330];
  uint64_t v4 = 3221225472;
  uint64_t v5 = __54__ASFriendListSectionManager__queue_startFriendsQuery__block_invoke_2;
  uint64_t v6 = &unk_264C197E0;
  uint64_t v7 = *(void *)(a1 + 32);
  return objc_msgSend(v1, "_queue_restartQueryAfterErrorCount:withBlock:");
}

uint64_t __54__ASFriendListSectionManager__queue_startFriendsQuery__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = 0;

  uint64_t v4 = *(void **)(a1 + 32);
  return objc_msgSend(v4, "_queue_startFriendsQuery");
}

uint64_t __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke_383(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) stopQuery:*(void *)(*(void *)(a1 + 32) + 64)];
  uint64_t v2 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v3 = [v2 applicationState];

  uint64_t v4 = *(void **)(a1 + 32);
  if (v3)
  {
    v4[8] = 0;
    return MEMORY[0x270F9A758]();
  }
  else
  {
    ++v4[10];
    return objc_msgSend(v4, "_queue_restartQueryAfterErrorCount:withBlock:");
  }
}

uint64_t __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 64);
  *(void *)(v2 + 64) = 0;

  uint64_t v4 = *(void **)(a1 + 32);
  return objc_msgSend(v4, "_queue_startMeQuery");
}

void __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  ASLoggingInitialize();
  uint64_t v8 = (os_log_t *)MEMORY[0x263F23AC8];
  id v9 = (void *)*MEMORY[0x263F23AC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    *(_DWORD *)buf = 134349314;
    uint64_t v20 = [v6 count];
    __int16 v21 = 2114;
    id v22 = v7;
    _os_log_impl(&dword_234DE2000, v10, OS_LOG_TYPE_DEFAULT, "Me Query received updates, object count: %{public}lu, error: %{public}@.", buf, 0x16u);
  }
  if (v7)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
      __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke_cold_1();
    }
    WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
    id v12 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v13 = WeakRetained[4];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke_386;
      block[3] = &unk_264C197E0;
      void block[4] = v12;
      dispatch_async(v13, block);
    }
LABEL_11:

    goto LABEL_12;
  }
  *(void *)(*(void *)(a1 + 32) + 80) = 0;
  if ([v6 count])
  {
    id v14 = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
    id v12 = v14;
    if (v14)
    {
      long long v15 = v14[4];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke_385;
      v17[3] = &unk_264C19A48;
      v17[4] = v14;
      id v18 = v6;
      dispatch_async(v15, v17);
    }
    goto LABEL_11;
  }
LABEL_12:
}

uint64_t __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke_385(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleActivitySummaryUpdate:", *(void *)(a1 + 40));
}

uint64_t __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke_386(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) stopQuery:*(void *)(*(void *)(a1 + 32) + 64)];
  uint64_t v2 = *(void **)(a1 + 32);
  ++v2[10];
  uint64_t v4 = MEMORY[0x263EF8330];
  uint64_t v5 = 3221225472;
  id v6 = __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke_2_387;
  id v7 = &unk_264C197E0;
  uint64_t v8 = *(void *)(a1 + 32);
  return objc_msgSend(v2, "_queue_restartQueryAfterErrorCount:withBlock:");
}

uint64_t __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke_2_387(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 64);
  *(void *)(v2 + 64) = 0;

  uint64_t v4 = *(void **)(a1 + 32);
  return objc_msgSend(v4, "_queue_startMeQuery");
}

- (void)_queue_stopQueries
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_readWriteQueue);
  if (self->_meQuery)
  {
    -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:");
    [(FIUIWorkoutDataProvider *)self->_workoutDataProvider stopFetching];
  }
  if (self->_modelQueryToken) {
    -[FIUIModel stopCurrentActivitySummaryQueryForClientToken:](self->_model, "stopCurrentActivitySummaryQueryForClientToken:");
  }
  self->_meQueryRetries = 0;
  self->_friendQueryRetries = 0;
  friendQuery = self->_friendQuery;
  self->_friendQuery = 0;

  meQuery = self->_meQuery;
  self->_meQuery = 0;

  modelQueryToken = self->_modelQueryToken;
  self->_modelQueryToken = 0;
}

- (void)_queue_handleMyWorkoutsUpdate
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_readWriteQueue);
  uint64_t v13 = [(ASFriendListSectionManager *)self _queue_me];
  if (!v13)
  {
    uint64_t v3 = (void *)[(NSSet *)self->_allFriends mutableCopy];
    id v4 = objc_alloc(MEMORY[0x263F23BD0]);
    uint64_t v13 = (void *)[v4 initWithActivitySnapshots:0 friendAchievements:0 friendWorkouts:0 contact:0 competitions:MEMORY[0x263EFFA68]];
    objc_msgSend(v3, "addObject:");
    uint64_t v5 = [MEMORY[0x263EFFA08] setWithSet:v3];
    allFriends = self->_allFriends;
    self->_allFriends = v5;
  }
  long long v15 = [MEMORY[0x263EFF9A0] dictionary];
  id v7 = [(FIUIWorkoutDataProvider *)self->_workoutDataProvider allWorkouts];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [v7 allKeys];
  uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v17 = 0;
        id v18 = &v17;
        uint64_t v19 = 0x3032000000;
        uint64_t v20 = __Block_byref_object_copy_;
        __int16 v21 = __Block_byref_object_dispose_;
        id v22 = [MEMORY[0x263EFFA08] set];
        id v12 = [v7 objectForKeyedSubscript:v11];
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __59__ASFriendListSectionManager__queue_handleMyWorkoutsUpdate__block_invoke;
        v16[3] = &unk_264C19A98;
        v16[4] = &v17;
        [v12 enumerateObjectsUsingBlock:v16];
        [v15 setObject:v18[5] forKey:v11];

        _Block_object_dispose(&v17, 8);
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }

  [v13 setFriendWorkouts:v15];
  [(ASFriendListSectionManager *)self _queue_updateWithNewData];
}

void __59__ASFriendListSectionManager__queue_handleMyWorkoutsUpdate__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v7 = [MEMORY[0x263F0A9D8] fitnessFriendWorkoutFromHKWorkout:a2];
  uint64_t v4 = [v3 setByAddingObject:v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)_enumerateVisibleDaysForFriends:(id)a3 usingBlock:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v31 = a4;
  id v6 = [MEMORY[0x263EFF9A0] dictionary];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v5;
  uint64_t v35 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v35)
  {
    uint64_t v33 = *(void *)v50;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v50 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = v7;
        uint64_t v8 = *(void **)(*((void *)&v49 + 1) + 8 * v7);
        long long v36 = [v8 currentDateComponents];
        uint64_t v9 = -[ASFriendListSectionManager _datesToShowSnapshotsForFriend:startingFromCurrentDateComponents:](self, "_datesToShowSnapshotsForFriend:startingFromCurrentDateComponents:", v8);
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v45 objects:v54 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v46;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v46 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v45 + 1) + 8 * i);
              long long v15 = [v6 objectForKeyedSubscript:v14];
              if (!v15)
              {
                long long v15 = [MEMORY[0x263EFFA08] set];
              }
              long long v16 = [v15 setByAddingObject:v8];

              [v6 setObject:v16 forKeyedSubscript:v14];
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v45 objects:v54 count:16];
          }
          while (v11);
        }

        uint64_t v7 = v37 + 1;
      }
      while (v37 + 1 != v35);
      uint64_t v35 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v35);
  }

  uint64_t v17 = [v6 allKeys];
  id v18 = [v17 sortedArrayUsingComparator:&__block_literal_global_396];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v19 = v18;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v41 objects:v53 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v42;
    while (2)
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v42 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v41 + 1) + 8 * j);
        long long v25 = [v6 objectForKeyedSubscript:v24];
        if ([v25 count] != 1)
        {

          goto LABEL_29;
        }
        long long v26 = [v25 anyObject];
        if ([v26 isMe]) {
          [v6 removeObjectForKey:v24];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v41 objects:v53 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }
LABEL_29:

  long long v27 = [v6 allKeys];
  uint64_t v28 = [v27 sortedArrayUsingComparator:&__block_literal_global_398];

  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __73__ASFriendListSectionManager__enumerateVisibleDaysForFriends_usingBlock___block_invoke_3;
  v38[3] = &unk_264C19AE0;
  id v39 = v6;
  id v40 = v31;
  id v29 = v6;
  id v30 = v31;
  [v28 enumerateObjectsUsingBlock:v38];
}

uint64_t __73__ASFriendListSectionManager__enumerateVisibleDaysForFriends_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __73__ASFriendListSectionManager__enumerateVisibleDaysForFriends_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __73__ASFriendListSectionManager__enumerateVisibleDaysForFriends_usingBlock___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a2;
  id v5 = objc_msgSend(v3, "hk_gregorianCalendar");
  _HKActivityCacheDateComponentsFromDate();
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [NSNumber numberWithLongLong:_HKCacheIndexFromDateComponents()];
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
  uint64_t v9 = [v8 allObjects];
  (*(void (**)(uint64_t, id, void *, void *))(v7 + 16))(v7, v4, v6, v9);
}

- (id)_datesToShowSnapshotsForFriend:(id)a3 startingFromCurrentDateComponents:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263EFF9C0] set];
  uint64_t v8 = *MEMORY[0x263F23D60];
  uint64_t v9 = 1 - *MEMORY[0x263F23D60];
  id v10 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  objc_msgSend(v6, "setDay:", objc_msgSend(v6, "day") + 1);
  id v32 = v6;
  uint64_t v11 = [v10 dateFromComponents:v6];
  uint64_t v12 = [v10 startOfDayForDate:v11];

  id v31 = (void *)v12;
  uint64_t v13 = [v10 dateByAddingUnit:128 value:-1 toDate:v12 options:0];
  uint64_t v14 = [MEMORY[0x263EFF910] date];
  uint64_t v15 = [v10 startOfDayForDate:v14];

  id v30 = (void *)v15;
  long long v16 = [v10 dateByAddingUnit:16 value:2 - v8 toDate:v15 options:0];
  uint64_t v17 = [v10 startOfDayForDate:v16];

  id v29 = (void *)v17;
  id v18 = [v10 dateByAddingUnit:128 value:-1 toDate:v17 options:0];
  if ([v5 isMe])
  {
    id v19 = [MEMORY[0x263EFF910] distantPast];
  }
  else
  {
    uint64_t v20 = [v5 dateForLatestRelationshipStart];
    id v19 = [v10 startOfDayForDate:v20];
  }
  uint64_t v21 = [v10 dateFromComponents:v32];
  uint64_t v22 = [v10 startOfDayForDate:v21];

  if (v9 <= 0)
  {
    uint64_t v26 = 0;
    while (!objc_msgSend(v13, "hk_isBeforeDate:", v19)
         || (objc_msgSend(v13, "hk_isBeforeDate:", v22) & 1) == 0)
    {
      if (([v5 isMe] & 1) != 0
        || [v5 isActivityDataVisibleToMeForDate:v13])
      {
        long long v27 = [v10 startOfDayForDate:v13];
        [v7 addObject:v27];
      }
      long long v23 = [v10 dateByAddingUnit:16 value:-1 toDate:v13 options:0];

      if ((objc_msgSend(v23, "hk_isBeforeDate:", v18) & 1) == 0)
      {
        uint64_t v13 = v23;
        if (v26-- > v9) {
          continue;
        }
      }
      goto LABEL_6;
    }
  }
  long long v23 = v13;
LABEL_6:
  uint64_t v24 = [MEMORY[0x263EFFA08] setWithSet:v7];

  return v24;
}

void __75__ASFriendListSectionManager__createSectionsForFriends_withDisplayContext___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v22 = a2;
  id v7 = a3;
  id v21 = a4;
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "_sortFriends:forDisplayMode:cacheIndex:", v21, objc_msgSend(*(id *)(a1 + 40), "displayMode"), v7);
  uint64_t v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v24;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v23 + 1) + 8 * v14);
        long long v16 = objc_opt_new();
        [v16 setFriend:v15];
        uint64_t v17 = [v15 snapshotWithGoalsCarriedForwardForSnapshotIndex:v7];
        [v16 setSnapshot:v17];

        [v9 addObject:v16];
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v12);
  }

  id v18 = [ASFriendListSection alloc];
  id v19 = [MEMORY[0x263EFF8C0] arrayWithArray:v9];
  uint64_t v20 = [(ASFriendListSection *)v18 initWithDate:v22 andRows:v19];

  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) insertObject:v20 atIndex:0];
}

- (id)_filterFriends:(id)a3 withSnapshotDataAtCacheIndex:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x263F08A98];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74__ASFriendListSectionManager__filterFriends_withSnapshotDataAtCacheIndex___block_invoke;
  v12[3] = &unk_264C19B50;
  id v13 = v5;
  id v7 = v5;
  id v8 = a3;
  uint64_t v9 = [v6 predicateWithBlock:v12];
  id v10 = [v8 filteredArrayUsingPredicate:v9];

  return v10;
}

BOOL __74__ASFriendListSectionManager__filterFriends_withSnapshotDataAtCacheIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 snapshots];
  id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  BOOL v5 = v4 != 0;

  return v5;
}

- (id)_filterFriends:(id)a3 withActiveFriendshipAtEndOfDay:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x263F08A98];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __76__ASFriendListSectionManager__filterFriends_withActiveFriendshipAtEndOfDay___block_invoke;
  v12[3] = &unk_264C19B50;
  id v13 = v5;
  id v7 = v5;
  id v8 = a3;
  uint64_t v9 = [v6 predicateWithBlock:v12];
  id v10 = [v8 filteredArrayUsingPredicate:v9];

  return v10;
}

uint64_t __76__ASFriendListSectionManager__filterFriends_withActiveFriendshipAtEndOfDay___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isMe]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [v3 isActivityDataVisibleToMeForDate:*(void *)(a1 + 32)];
  }

  return v4;
}

- (id)_filterFriends:(id)a3 withWheelchairUseAtCacheIndex:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x263F08A98];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __75__ASFriendListSectionManager__filterFriends_withWheelchairUseAtCacheIndex___block_invoke;
  v12[3] = &unk_264C19B50;
  id v13 = v5;
  id v7 = v5;
  id v8 = a3;
  uint64_t v9 = [v6 predicateWithBlock:v12];
  id v10 = [v8 filteredArrayUsingPredicate:v9];

  return v10;
}

uint64_t __75__ASFriendListSectionManager__filterFriends_withWheelchairUseAtCacheIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 snapshots];
  uint64_t v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];

  [v4 wheelchairUse];
  uint64_t v5 = FIUIIsWheelchairUserForWheelchairUse();

  return v5;
}

uint64_t __69__ASFriendListSectionManager__sortFriends_forDisplayMode_cacheIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 32))
  {
    id v7 = [v5 snapshots];
    id v8 = [v7 objectForKeyedSubscript:*(void *)(a1 + 32)];

    uint64_t v9 = [v6 snapshots];
    id v10 = [v9 objectForKeyedSubscript:*(void *)(a1 + 32)];
  }
  else
  {
    id v8 = [v5 currentSnapshot];
    id v10 = [v6 currentSnapshot];
  }
  switch(*(void *)(a1 + 40))
  {
    case 1:
      uint64_t v11 = NSNumber;
      [v8 energyBurnedGoalPercentage];
      double v13 = v12;
      [v8 mmgp];
      uint64_t v15 = [v11 numberWithDouble:v13 + v14];
      long long v16 = NSNumber;
      [v10 energyBurnedGoalPercentage];
      double v18 = v17;
      [v10 mmgp];
      double v20 = v18 + v19;
      goto LABEL_12;
    case 2:
      id v22 = NSNumber;
      [v8 briskMinutesGoalPercentage];
      uint64_t v15 = objc_msgSend(v22, "numberWithDouble:");
      long long v16 = NSNumber;
      [v10 briskMinutesGoalPercentage];
      goto LABEL_12;
    case 3:
      long long v23 = NSNumber;
      [v8 stepCount];
      uint64_t v15 = objc_msgSend(v23, "numberWithDouble:");
      long long v16 = NSNumber;
      [v10 stepCount];
      goto LABEL_12;
    case 4:
      long long v24 = *(void **)(a1 + 32);
      if (v24)
      {
        id v25 = v24;
      }
      else
      {
        objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v8, "snapshotIndex"));
        id v25 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v28 = v25;
      id v29 = *(void **)(a1 + 32);
      v68 = v8;
      if (v29)
      {
        id v30 = v29;
      }
      else
      {
        objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v10, "snapshotIndex"));
        id v30 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v31 = v30;
      v67 = v10;
      id v69 = v5;
      id v32 = [v5 friendWorkouts];
      uint64_t v33 = [v32 objectForKeyedSubscript:v28];

      long long v34 = [v6 friendWorkouts];
      v65 = v31;
      v64 = [v34 objectForKeyedSubscript:v31];

      uint64_t v35 = (void *)MEMORY[0x263F0A630];
      long long v36 = [MEMORY[0x263F0A830] kilocalorieUnit];
      uint64_t v37 = [v35 quantityWithUnit:v36 doubleValue:0.0];

      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v38 = v33;
      uint64_t v39 = [v38 countByEnumeratingWithState:&v74 objects:v79 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v75;
        do
        {
          uint64_t v42 = 0;
          long long v43 = v37;
          do
          {
            if (*(void *)v75 != v41) {
              objc_enumerationMutation(v38);
            }
            long long v44 = objc_msgSend(*(id *)(*((void *)&v74 + 1) + 8 * v42), "totalEnergyBurned", v64);
            uint64_t v37 = [v43 _quantityByAddingQuantity:v44];

            ++v42;
            long long v43 = v37;
          }
          while (v40 != v42);
          uint64_t v40 = [v38 countByEnumeratingWithState:&v74 objects:v79 count:16];
        }
        while (v40);
      }
      v66 = v28;

      long long v45 = NSNumber;
      long long v46 = [MEMORY[0x263F0A830] kilocalorieUnit];
      [v37 doubleValueForUnit:v46];
      uint64_t v15 = objc_msgSend(v45, "numberWithDouble:");

      long long v47 = (void *)MEMORY[0x263F0A630];
      long long v48 = [MEMORY[0x263F0A830] kilocalorieUnit];
      long long v49 = [v47 quantityWithUnit:v48 doubleValue:0.0];

      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      id v50 = v64;
      uint64_t v51 = [v50 countByEnumeratingWithState:&v70 objects:v78 count:16];
      if (v51)
      {
        uint64_t v52 = v51;
        uint64_t v53 = *(void *)v71;
        do
        {
          uint64_t v54 = 0;
          v55 = v49;
          do
          {
            if (*(void *)v71 != v53) {
              objc_enumerationMutation(v50);
            }
            uint64_t v56 = objc_msgSend(*(id *)(*((void *)&v70 + 1) + 8 * v54), "totalEnergyBurned", v64);
            long long v49 = [v55 _quantityByAddingQuantity:v56];

            ++v54;
            v55 = v49;
          }
          while (v52 != v54);
          uint64_t v52 = [v50 countByEnumeratingWithState:&v70 objects:v78 count:16];
        }
        while (v52);
      }

      v57 = NSNumber;
      v58 = [MEMORY[0x263F0A830] kilocalorieUnit];
      [v49 doubleValueForUnit:v58];
      id v21 = objc_msgSend(v57, "numberWithDouble:");

      id v8 = v68;
      id v5 = v69;
      id v10 = v67;
      if (!v15) {
        goto LABEL_35;
      }
      goto LABEL_13;
    case 5:
      long long v26 = NSNumber;
      [v8 pushCount];
      uint64_t v15 = objc_msgSend(v26, "numberWithDouble:");
      long long v16 = NSNumber;
      [v10 pushCount];
LABEL_12:
      id v21 = [v16 numberWithDouble:v20];
      if (!v15) {
        goto LABEL_35;
      }
LABEL_13:
      if (!v21 || (uint64_t v27 = [v15 compare:v21]) == 0)
      {
LABEL_35:
        v59 = objc_msgSend(v5, "displayName", v64);
        v60 = [v6 displayName];
        uint64_t v27 = [v60 caseInsensitiveCompare:v59];

        if (!v27)
        {
          v61 = [v5 dateForLatestRelationshipStart];
          v62 = [v6 dateForLatestRelationshipStart];
          uint64_t v27 = [v61 compare:v62];
        }
      }

      return v27;
    default:
      id v21 = 0;
      uint64_t v15 = 0;
      goto LABEL_35;
  }
}

- (void)_createFakeFriends
{
  id v3 = [MEMORY[0x263F23BC8] fakeAppFriendListForMarketing];
  uint64_t v4 = (void *)[v3 mutableCopy];

  readWriteQueue = self->_readWriteQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__ASFriendListSectionManager__createFakeFriends__block_invoke;
  block[3] = &unk_264C197E0;
  void block[4] = self;
  dispatch_async(readWriteQueue, block);
  id v6 = self->_readWriteQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__ASFriendListSectionManager__createFakeFriends__block_invoke_2;
  v8[3] = &unk_264C19A48;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

uint64_t __48__ASFriendListSectionManager__createFakeFriends__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_startMeQuery");
}

uint64_t __48__ASFriendListSectionManager__createFakeFriends__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "_queue_updateWithNewData");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelQueryToken, 0);
  objc_storeStrong((id *)&self->_workoutDataProvider, 0);
  objc_storeStrong((id *)&self->_meQuery, 0);
  objc_storeStrong((id *)&self->_friendQuery, 0);
  objc_storeStrong((id *)&self->_allFriends, 0);
  objc_storeStrong((id *)&self->_displayContextToSortedSectionsCache, 0);
  objc_storeStrong((id *)&self->_readWriteQueue, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_activitySharingClient, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __99__ASFriendListSectionManager_fetchActivitySharingDataIfTimeSinceLastFetchIsGreaterThan_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_234DE2000, v0, v1, "Failed to fetch new friend data, error: %{public}@", v2, v3, v4, v5, v6);
}

void __75__ASFriendListSectionManager__queue_restartQueryAfterErrorCount_withBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __54__ASFriendListSectionManager__queue_startFriendsQuery__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_234DE2000, v0, v1, "Error returned from Fitness Friends Query: %{public}@", v2, v3, v4, v5, v6);
}

void __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_234DE2000, v0, v1, "Error returned from HKActivitySummaryQuery: %{public}@", v2, v3, v4, v5, v6);
}

@end