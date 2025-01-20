@interface DKSync2Coordinator
@end

@implementation DKSync2Coordinator

void __39___DKSync2Coordinator_initWithContext___block_invoke(uint64_t a1, void *a2, int a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  -[_DKSync2Coordinator handleDataProtectionChangeFor:willBeAvailable:]((uint64_t)WeakRetained, v5, a3);
}

void __39___DKSync2Coordinator_initWithContext___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[_DKSync2Coordinator _reregisterPeriodicJob]((uint64_t)WeakRetained);
}

void __39___DKSync2Coordinator_initWithContext___block_invoke_3(uint64_t a1)
{
}

uint64_t __45___DKSync2Coordinator__performEnableAndStart__block_invoke(uint64_t a1)
{
  -[_DKSync2Coordinator configureTracker](*(void **)(a1 + 32));
  [*(id *)(a1 + 32) setupStorage];
  v2 = *(void **)(a1 + 32);
  return [v2 start];
}

void __39___DKSync2Coordinator_configureTracker__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained handleStatusChangeForPeer:v5 previousTransports:a3];
}

uint64_t __88___DKSync2Coordinator_shouldDeferSyncOperationWithClass_syncType_transport_peer_policy___block_invoke()
{
  uint64_t v0 = +[_DKEventTypeStatsCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsCounter, @"SyncCoordinator", @"xpc_activity_should_defer", @"result", &unk_1EDE1E410);
  uint64_t v1 = shouldDeferSyncOperationWithClass_syncType_transport_peer_policy__shouldDeferCounter;
  shouldDeferSyncOperationWithClass_syncType_transport_peer_policy__shouldDeferCounter = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __51___DKSync2Coordinator_fetchSourceDeviceIDFromPeer___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  -[_DKSync2Coordinator handleFetchedSourceDeviceID:version:fromPeer:error:](*(void *)(a1 + 32), a2, a3, *(void **)(a1 + 40), a4);
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(a1 + 48);
  return -[_DKSync2Coordinator removeBusyTransaction:](v5, v6);
}

void __37___DKSync2Coordinator_syncWithReply___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(id **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __37___DKSync2Coordinator_syncWithReply___block_invoke_2;
  v2[3] = &unk_1E560D5F0;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  -[_DKSync2Coordinator _performSyncWithForceSync:completion:](v1, 1, v2);
}

void __37___DKSync2Coordinator_syncWithReply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[_CDLogging syncChannel];
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __37___DKSync2Coordinator_syncWithReply___block_invoke_2_cold_2();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __37___DKSync2Coordinator_syncWithReply___block_invoke_2_cold_1();
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, BOOL, id))(v6 + 16))(v6, v3 == 0, v3);
  }
}

void __59___DKSync2Coordinator_synchronizeWithUrgency_client_reply___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(id **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59___DKSync2Coordinator_synchronizeWithUrgency_client_reply___block_invoke_2;
  v4[3] = &unk_1E560D640;
  unint64_t v3 = *(void *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  -[_DKSync2Coordinator _synchronizeWithUrgency:client:completion:](v1, v3, v2, v4);
}

uint64_t __59___DKSync2Coordinator_synchronizeWithUrgency_client_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a2 == 0, a2);
  }
  return result;
}

void __65___DKSync2Coordinator__synchronizeWithUrgency_client_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[_CDLogging syncChannel];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __37___DKSync2Coordinator_syncWithReply___block_invoke_2_cold_2();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __37___DKSync2Coordinator_syncWithReply___block_invoke_2_cold_1();
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

void __59___DKSync2Coordinator__performSyncWithSyncType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __59___DKSync2Coordinator__performSyncWithSyncType_completion___block_invoke_cold_2();
  }

  -[_DKSync2State finishWithError:](*(void *)(a1 + 40), v3);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = (void *)*((void *)WeakRetained + 12);
    if (v7 == *(void **)(a1 + 40))
    {
      *((void *)WeakRetained + 12) = 0;
    }
  }
  v8 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __59___DKSync2Coordinator__performSyncWithSyncType_completion___block_invoke_cold_1();
  }
}

void __51___DKSync2Coordinator___performSyncWithCompletion___block_invoke()
{
  uint64_t v0 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v0);

  uint64_t v1 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    __51___DKSync2Coordinator___performSyncWithCompletion___block_invoke_cold_1();
  }
}

uint64_t __51___DKSync2Coordinator___performSyncWithCompletion___block_invoke_631(uint64_t a1)
{
  uint64_t WeakRetained = (uint64_t)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    v9 = (void *)WeakRetained;
    uint64_t WeakRetained = [(id)WeakRetained isCancelled];
    uint64_t v3 = (uint64_t)v9;
    if ((WeakRetained & 1) == 0)
    {
      v4 = [v9 errors];
      uint64_t v5 = [v4 count];

      uint64_t v3 = (uint64_t)v9;
      if (!v5)
      {
        id v6 = objc_loadWeakRetained((id *)(a1 + 40));
        v7 = v6;
        if (v6)
        {
          [*((id *)v6 + 27) removeObjectForKey:@"DeletedSyncedEventCount"];
          v7[201] = 1;
        }

        uint64_t v3 = (uint64_t)v9;
      }
    }
  }
  return MEMORY[0x1F41817F8](WeakRetained, v3);
}

void __51___DKSync2Coordinator___performSyncWithCompletion___block_invoke_2(void **a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  -[_DKSync2Coordinator __finishSyncWithTransaction:startDate:completion:]((uint64_t)WeakRetained, a1[4], a1[5], a1[6]);
}

uint64_t __53___DKSync2Coordinator__updateEventStatsWithSyncType___block_invoke()
{
  uint64_t v0 = +[_DKEventTypeStatsCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsCounter, @"coreduet_sync2", @"sync_is_single_device", @"is_single_device", &unk_1EDE1E428);
  uint64_t v1 = _updateEventStatsWithSyncType__isSingleDeviceSyncCounter;
  _updateEventStatsWithSyncType__isSingleDeviceSyncCounter = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __77___DKSync2Coordinator__updateEventStatsWithSyncElapsedTimeStartDate_endDate___block_invoke()
{
  uint64_t v0 = +[_DKEventStatsTimerCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsTimerCounter, @"coreduet_sync2", @"sync_elapsed_time");
  uint64_t v1 = _updateEventStatsWithSyncElapsedTimeStartDate_endDate__syncElapsedTimeCounter;
  _updateEventStatsWithSyncElapsedTimeStartDate_endDate__syncElapsedTimeCounter = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __50___DKSync2Coordinator__possiblyPerformInitialSync__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  -[_DKSync2Coordinator _performInitialSync](WeakRetained);

  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 216);
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  [v3 setDate:v4 forKey:@"InitialSyncWithCloudDate"];
}

void __42___DKSync2Coordinator__performInitialSync__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __42___DKSync2Coordinator__performInitialSync__block_invoke_cold_1();
    }
  }
}

void __42___DKSync2Coordinator__performPeriodicJob__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  -[_DKSync2Coordinator _finishActivityWithError:](*(void *)(a1 + 32), v3);
  id v4 = +[_CDLogging syncChannel];
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __42___DKSync2Coordinator__performPeriodicJob__block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __42___DKSync2Coordinator__performPeriodicJob__block_invoke_cold_1();
  }
}

void __56___DKSync2Coordinator__registerPeriodicJobWithInterval___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    -[_DKSync2Coordinator _performPeriodicJob]((uint64_t)WeakRetained);
    id WeakRetained = v2;
  }
}

void __69___DKSync2Coordinator_handleDataProtectionChangeFor_willBeAvailable___block_invoke(uint64_t a1)
{
}

void __55___DKSync2Coordinator__cloudSyncAvailabilityDidChange___block_invoke(uint64_t a1)
{
}

void __60___DKSync2Coordinator__registerCloudSyncAvailablityObserver__block_invoke(uint64_t a1)
{
  id v2 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v2);

  uint64_t v3 = *(void *)(a1 + 32);
  -[_DKSync2Coordinator _performSyncTogglesChangedActions](v3);
}

void __63___DKSync2Coordinator__registerCloudDeviceCountChangedObserver__block_invoke(uint64_t a1)
{
  id v2 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v2);

  uint64_t v3 = *(void *)(a1 + 32);
  -[_DKSync2Coordinator _reregisterPeriodicJob](v3);
}

void __58___DKSync2Coordinator__registerRapportAvailablityObserver__block_invoke(uint64_t a1)
{
  id v2 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v2);

  uint64_t v3 = *(void *)(a1 + 32);
  -[_DKSync2Coordinator _performSyncTogglesChangedActions](v3);
}

void __60___DKSync2Coordinator__registerRapportLaunchOnDemandHandler__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  string = xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x1E4F14560]);
  if (string)
  {
    if (!strcmp(string, "OnIncomingRequest"))
    {
      id v4 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        __60___DKSync2Coordinator__registerRapportLaunchOnDemandHandler__block_invoke_cold_1();
      }
    }
    if (xpc_dictionary_get_BOOL(v2, "replyRequired"))
    {
      xpc_object_t reply = xpc_dictionary_create_reply(v2);
      if (reply) {
        xpc_dictionary_send_reply();
      }
    }
  }
}

void __44___DKSync2Coordinator__syncPolicyDidChange___block_invoke(uint64_t a1)
{
}

void __77___DKSync2Coordinator__deleteNextBatchOfOurSiriEventsFromCloudWithStartDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __77___DKSync2Coordinator__deleteNextBatchOfOurSiriEventsFromCloudWithStartDate___block_invoke_cold_2();
    }
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) lastObject];
    id v4 = [v5 creationDate];

    if (v4)
    {
      -[_DKSync2Coordinator _deleteNextBatchOfOurSiriEventsFromCloudWithStartDate:](*(void *)(a1 + 40), v4);
    }
    else
    {
      id v6 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        __77___DKSync2Coordinator__deleteNextBatchOfOurSiriEventsFromCloudWithStartDate___block_invoke_cold_1();
      }
    }
  }
}

void __45___DKSync2Coordinator_removeBusyTransaction___block_invoke(uint64_t a1)
{
}

void __49___DKSync2Coordinator__runTriggeredSyncActivity___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[_DKSync2Coordinator _unregisterTriggeredSyncActivity]((uint64_t)WeakRetained);
  id v2 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __49___DKSync2Coordinator__runTriggeredSyncActivity___block_invoke_cold_1();
  }
}

void __67___DKSync2Coordinator__registerTriggeredSyncActivityWithIsStartup___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state != 2)
  {
    if (!state)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __67___DKSync2Coordinator__registerTriggeredSyncActivityWithIsStartup___block_invoke_2;
      v8[3] = &unk_1E560D7F8;
      objc_copyWeak(&v10, (id *)(a1 + 32));
      v9 = v3;
      char v11 = *(unsigned char *)(a1 + 40);
      +[_DKSyncSerializer performSyncBlock:v8];

      objc_destroyWeak(&v10);
    }
    goto LABEL_13;
  }
  if (xpc_activity_set_state(v3, 4))
  {
LABEL_12:
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __67___DKSync2Coordinator__registerTriggeredSyncActivityWithIsStartup___block_invoke_703;
    v5[3] = &unk_1E560D708;
    objc_copyWeak(&v7, (id *)(a1 + 32));
    id v6 = v3;
    +[_DKSyncSerializer performAsyncBlock:v5];

    objc_destroyWeak(&v7);
    goto LABEL_13;
  }
  if (!xpc_activity_should_defer(v3))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      __67___DKSync2Coordinator__registerTriggeredSyncActivityWithIsStartup___block_invoke_cold_1();
    }
    xpc_activity_set_completion_status();
    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v3;
    _os_log_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Warning: deferring activity '%@' before it started", buf, 0xCu);
  }
  xpc_activity_set_state(v3, 3);
LABEL_13:
}

void __67___DKSync2Coordinator__registerTriggeredSyncActivityWithIsStartup___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[_DKSync2Coordinator _checkInTriggeredSyncActivity:isStartup:]((uint64_t)WeakRetained, *(void **)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

void __67___DKSync2Coordinator__registerTriggeredSyncActivityWithIsStartup___block_invoke_703(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[_DKSync2Coordinator _runTriggeredSyncActivity:](WeakRetained, *(void **)(a1 + 32));
}

void __83___DKSync2Coordinator_APSConnectionDelegate__connection_didReceiveIncomingMessage___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[_CDLogging syncChannel];
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __83___DKSync2Coordinator_APSConnectionDelegate__connection_didReceiveIncomingMessage___block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    __83___DKSync2Coordinator_APSConnectionDelegate__connection_didReceiveIncomingMessage___block_invoke_cold_1();
  }
}

void __108___DKSync2Coordinator__DKKnowledgeStorageEventNotificationDelegate___databaseDidDeleteFromStreamNameCounts___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[_CDLogging syncChannel];
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __108___DKSync2Coordinator__DKKnowledgeStorageEventNotificationDelegate___databaseDidDeleteFromStreamNameCounts___block_invoke_cold_2(a1, v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __108___DKSync2Coordinator__DKKnowledgeStorageEventNotificationDelegate___databaseDidDeleteFromStreamNameCounts___block_invoke_cold_1();
  }
}

uint64_t __122___DKSync2Coordinator__DKKnowledgeStorageEventNotificationDelegate__knowledgeStorage_didDeleteEventsWithStreamNameCounts___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _databaseDidDeleteFromStreamNameCounts:*(void *)(a1 + 40)];
}

void __37___DKSync2Coordinator_syncWithReply___block_invoke_2_cold_1()
{
  uint64_t v0 = [(id)OUTLINED_FUNCTION_12() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Syncing succeeded", v3, v4, v5, v6, v7);
}

void __37___DKSync2Coordinator_syncWithReply___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_6();
  [(id)OUTLINED_FUNCTION_16(*MEMORY[0x1E4F143B8]) description];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_10() domain];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_2(&dword_18ECEB000, v2, v3, "%{public}@: Syncing failed: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);
}

void __59___DKSync2Coordinator__performSyncWithSyncType_completion___block_invoke_cold_1()
{
  uint64_t v0 = [(id)OUTLINED_FUNCTION_12() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Finished sync", v3, v4, v5, v6, v7);
}

void __59___DKSync2Coordinator__performSyncWithSyncType_completion___block_invoke_cold_2()
{
  uint64_t v0 = [(id)OUTLINED_FUNCTION_12() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Finishing sync", v3, v4, v5, v6, v7);
}

void __51___DKSync2Coordinator___performSyncWithCompletion___block_invoke_cold_1()
{
  uint64_t v0 = [(id)OUTLINED_FUNCTION_12() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Started sync operations", v3, v4, v5, v6, v7);
}

void __42___DKSync2Coordinator__performInitialSync__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  [(id)OUTLINED_FUNCTION_16(*MEMORY[0x1E4F143B8]) description];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_10() domain];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_2(&dword_18ECEB000, v2, v3, "%{public}@: Failed while attempting initial sync: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);
}

void __42___DKSync2Coordinator__performPeriodicJob__block_invoke_cold_1()
{
  uint64_t v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Periodic sync succeeded", v3, v4, v5, v6, v7);
}

void __42___DKSync2Coordinator__performPeriodicJob__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_6();
  [(id)objc_opt_class() description];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_10() domain];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_2(&dword_18ECEB000, v2, v3, "%{public}@: Periodic sync failed: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);
}

void __60___DKSync2Coordinator__registerRapportLaunchOnDemandHandler__block_invoke_cold_1()
{
  uint64_t v0 = [(id)OUTLINED_FUNCTION_12() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Launched by Rapport to service a request", v3, v4, v5, v6, v7);
}

void __77___DKSync2Coordinator__deleteNextBatchOfOurSiriEventsFromCloudWithStartDate___block_invoke_cold_1()
{
  uint64_t v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_17(&dword_18ECEB000, v1, v2, "%{public}@: Failed to find event creation date while deleting local Siri events", v3, v4, v5, v6, v7);
}

void __77___DKSync2Coordinator__deleteNextBatchOfOurSiriEventsFromCloudWithStartDate___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_6();
  [(id)objc_opt_class() description];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_10() domain];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_2(&dword_18ECEB000, v2, v3, "%{public}@: Failed while deleting Siri events from Cloud: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);
}

void __49___DKSync2Coordinator__runTriggeredSyncActivity___block_invoke_cold_1()
{
  uint64_t v0 = [(id)OUTLINED_FUNCTION_12() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Finished triggered sync", v3, v4, v5, v6, v7);
}

void __67___DKSync2Coordinator__registerTriggeredSyncActivityWithIsStartup___block_invoke_cold_1()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Failed to set activity '%@' state to continue", v0, 0xCu);
}

void __83___DKSync2Coordinator_APSConnectionDelegate__connection_didReceiveIncomingMessage___block_invoke_cold_1()
{
  uint64_t v0 = [(id)OUTLINED_FUNCTION_12() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Push-triggered sync succeeded", v3, v4, v5, v6, v7);
}

void __83___DKSync2Coordinator_APSConnectionDelegate__connection_didReceiveIncomingMessage___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_6();
  [(id)OUTLINED_FUNCTION_16(*MEMORY[0x1E4F143B8]) description];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_10() domain];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_2(&dword_18ECEB000, v2, v3, "%{public}@: Push-triggered sync failed: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);
}

void __108___DKSync2Coordinator__DKKnowledgeStorageEventNotificationDelegate___databaseDidDeleteFromStreamNameCounts___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_20();
  uint64_t v1 = [(id)OUTLINED_FUNCTION_12() description];
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(v0 + 40), "count"));
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v3, v4, "%{public}@: Delete of %@ event streams triggered sync attempt succeeded", v5, v6, v7, v8, v9);
}

void __108___DKSync2Coordinator__DKKnowledgeStorageEventNotificationDelegate___databaseDidDeleteFromStreamNameCounts___block_invoke_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(id)objc_opt_class() description];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count"));
  uint64_t v8 = [a2 domain];
  [a2 code];
  OUTLINED_FUNCTION_9_1();
  _os_log_error_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Delete of %@ event stream triggered sync attempt failed: %{public}@:%lld (%@)", v9, 0x34u);
}

@end