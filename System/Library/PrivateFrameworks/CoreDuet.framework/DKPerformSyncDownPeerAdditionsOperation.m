@interface DKPerformSyncDownPeerAdditionsOperation
@end

@implementation DKPerformSyncDownPeerAdditionsOperation

void __72___DKPerformSyncDownPeerAdditionsOperation_performSyncDownPeerAdditions__block_invoke(uint64_t a1, void *a2)
{
}

void __95___DKPerformSyncDownPeerAdditionsOperation_performSyncDownPeerAdditionsWithDidPrewarm_orError___block_invoke(uint64_t a1, void *a2, void *a3)
{
}

void __93___DKPerformSyncDownPeerAdditionsOperation_performSyncDownPeerAdditionsWithCompletedWindows___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    v10 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __93___DKPerformSyncDownPeerAdditionsOperation_performSyncDownPeerAdditionsWithCompletedWindows___block_invoke_cold_2(a1, v9, v10);
    }

    v11 = [*(id *)(a1 + 32) errors];
    [v11 addObject:v9];
LABEL_10:

    [*(id *)(a1 + 32) endOperation];
    goto LABEL_11;
  }
  if (!v7 || !v8)
  {
    v11 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __93___DKPerformSyncDownPeerAdditionsOperation_performSyncDownPeerAdditionsWithCompletedWindows___block_invoke_cold_1(a1, v11);
    }
    goto LABEL_10;
  }
  -[_DKPerformSyncDownPeerAdditionsOperation handleFetchedEvents:completedWindows:missingWindows:](*(void *)(a1 + 32), v7, v8, *(void **)(a1 + 40));
LABEL_11:
}

uint64_t __87___DKPerformSyncDownPeerAdditionsOperation__updateEventStatsWithIsNewestMissingWindow___block_invoke()
{
  uint64_t v0 = +[_DKEventTypeStatsCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsCounter, @"coreduet_sync2", @"sync_down_additions_window", @"age", &unk_1EDE1E7E8);
  uint64_t v1 = _updateEventStatsWithIsNewestMissingWindow__syncDownAdditionsWindowAgeCounter;
  _updateEventStatsWithIsNewestMissingWindow__syncDownAdditionsWindowAgeCounter = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __96___DKPerformSyncDownPeerAdditionsOperation__updateEventStatsWithPreviousSyncDate_transportType___block_invoke()
{
  uint64_t v0 = +[_DKEventTypeStatsTimerCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsTimerCounter, @"coreduet_sync2", @"sync_down_additions_cadence", @"transport", &unk_1EDE1E800);
  uint64_t v1 = (void *)_updateEventStatsWithPreviousSyncDate_transportType__syncCadenceByTransportCounter_2;
  _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceByTransportCounter_2 = v0;

  uint64_t v2 = +[_DKEventStatsTimerCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsTimerCounter, @"coreduet_sync2", @"sync_down_additions_cadence");
  uint64_t v3 = _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceCounter_2;
  _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceCounter_2 = v2;
  return MEMORY[0x1F41817F8](v2, v3);
}

uint64_t __96___DKPerformSyncDownPeerAdditionsOperation_handleFetchedEvents_completedWindows_missingWindows___block_invoke(uint64_t a1)
{
  return -[_DKPerformSyncDownPeerAdditionsOperation performSyncDownPeerAdditionsWithCompletedWindows:](*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __110___DKPerformSyncDownPeerAdditionsOperation__updateEventStatsWithSyncLatencyOfEvent_ingressDate_transportType___block_invoke()
{
  uint64_t v0 = +[_DKEventTypeStatsTimerCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsTimerCounter, @"coreduet_sync2", @"sync_down_additions_latency", @"transport", &unk_1EDE1E818);
  uint64_t v1 = (void *)_updateEventStatsWithSyncLatencyOfEvent_ingressDate_transportType__syncDownAdditionsLatencyByTransportCounter;
  _updateEventStatsWithSyncLatencyOfEvent_ingressDate_transportType__syncDownAdditionsLatencyByTransportCounter = v0;

  uint64_t v2 = +[_DKEventStatsTimerCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsTimerCounter, @"coreduet_sync2", @"sync_down_additions_latency");
  uint64_t v3 = _updateEventStatsWithSyncLatencyOfEvent_ingressDate_transportType__syncDownAdditionsLatencyCounter;
  _updateEventStatsWithSyncLatencyOfEvent_ingressDate_transportType__syncDownAdditionsLatencyCounter = v2;
  return MEMORY[0x1F41817F8](v2, v3);
}

uint64_t __102___DKPerformSyncDownPeerAdditionsOperation__updateEventStatsWithTotal_streamNameCounts_transportType___block_invoke()
{
  uint64_t v0 = +[_DKEventStatsCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsCounter, @"coreduet_sync2", @"sync_down_additions_total");
  uint64_t v1 = (void *)_updateEventStatsWithTotal_streamNameCounts_transportType__syncDownAdditionsTotalCounter;
  _updateEventStatsWithTotal_streamNameCounts_transportType__syncDownAdditionsTotalCounter = v0;

  uint64_t v2 = +[_DKEventTypeStatsCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsCounter, @"coreduet_sync2", @"sync_down_additions_total_by_transport", @"transport", &unk_1EDE1E830);
  uint64_t v3 = (void *)_updateEventStatsWithTotal_streamNameCounts_transportType__syncDownAdditionsTotalByTransportCounter;
  _updateEventStatsWithTotal_streamNameCounts_transportType__syncDownAdditionsTotalByTransportCounter = v2;

  uint64_t v4 = objc_opt_new();
  uint64_t v5 = _updateEventStatsWithTotal_streamNameCounts_transportType__syncDownAdditionsCountersByStreamName;
  _updateEventStatsWithTotal_streamNameCounts_transportType__syncDownAdditionsCountersByStreamName = v4;
  return MEMORY[0x1F41817F8](v4, v5);
}

void __93___DKPerformSyncDownPeerAdditionsOperation_performSyncDownPeerAdditionsWithCompletedWindows___block_invoke_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(id)objc_opt_class() description];
  if ([*(id *)(*(void *)(a1 + 32) + 304) transportType] == 8) {
    v6 = "up to";
  }
  else {
    v6 = "down from";
  }
  id v7 = &stru_1EDDE58B8;
  if ([*(id *)(*(void *)(a1 + 32) + 312) me]) {
    id v8 = @"pseudo ";
  }
  else {
    id v8 = &stru_1EDDE58B8;
  }
  id v9 = [(id)OUTLINED_FUNCTION_14_4(*(void *)(a1 + 32)) identifier];
  v10 = [(id)OUTLINED_FUNCTION_14_4(*(void *)(a1 + 32)) model];
  if (v10)
  {
    v11 = NSString;
    [(id)OUTLINED_FUNCTION_14_4(*(void *)(a1 + 32)) model];
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_43();
    id v7 = [v11 stringWithFormat:@" (%@)"];
  }
  v12 = [*(id *)(*(void *)(a1 + 32) + 304) name];
  v13 = [a2 domain];
  [a2 code];
  *(_DWORD *)buf = 138545410;
  v18 = v5;
  __int16 v19 = 2082;
  v20 = v6;
  __int16 v21 = 2114;
  v22 = v8;
  OUTLINED_FUNCTION_12_4();
  __int16 v23 = v14;
  v24 = v12;
  __int16 v25 = v14;
  v26 = v13;
  __int16 v27 = 2048;
  uint64_t v28 = v15;
  __int16 v29 = 2112;
  v30 = a2;
  _os_log_error_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Failed during additions sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@: %{public}@:%lld (%@)", buf, 0x5Cu);

  if (v10)
  {
  }
}

@end