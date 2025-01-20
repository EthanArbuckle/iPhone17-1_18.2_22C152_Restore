@interface DKPerformSyncUpHistoryDeletionsOperation
@end

@implementation DKPerformSyncUpHistoryDeletionsOperation

void __74___DKPerformSyncUpHistoryDeletionsOperation_performSyncUpHistoryDeletions__block_invoke_17(uint64_t a1, void *a2, void *a3)
{
}

void __100___DKPerformSyncUpHistoryDeletionsOperation_performSyncUpHistoryDeletionsWithPreviousHighWaterMark___block_invoke(void *a1, void *a2)
{
  uint64_t v2 = a1[4];
  v3 = (void *)a1[5];
  v4 = (void *)a1[6];
  uint64_t v5 = a1[7];
  id v7 = a2;
  uint64_t v6 = -[_DKSyncDeletedEventIDs count](v5);
  -[_DKPerformSyncUpHistoryDeletionsOperation handleUpdateStorageWithStartDate:endDate:deletedEventIDsCount:orError:](v2, v3, v4, v6, v7);
}

uint64_t __97___DKPerformSyncUpHistoryDeletionsOperation__updateEventStatsWithPreviousSyncDate_transportType___block_invoke()
{
  uint64_t v0 = +[_DKEventTypeStatsTimerCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsTimerCounter, @"coreduet_sync2", @"sync_up_history_deletions_cadence", @"transport", &unk_1EDE1E758);
  v1 = (void *)_updateEventStatsWithPreviousSyncDate_transportType__syncCadenceByTransportCounter_1;
  _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceByTransportCounter_1 = v0;

  uint64_t v2 = +[_DKEventStatsTimerCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsTimerCounter, @"coreduet_sync2", @"sync_up_history_deletions_cadence");
  uint64_t v3 = _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceCounter_1;
  _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceCounter_1 = v2;
  return MEMORY[0x1F41817F8](v2, v3);
}

uint64_t __115___DKPerformSyncUpHistoryDeletionsOperation_handleUpdateStorageWithStartDate_endDate_deletedEventIDsCount_orError___block_invoke(uint64_t a1)
{
  return -[_DKPerformSyncUpHistoryDeletionsOperation performSyncUpHistoryDeletionsWithPreviousHighWaterMark:](*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __86___DKPerformSyncUpHistoryDeletionsOperation__updateEventStatsWithTotal_transportType___block_invoke()
{
  uint64_t v0 = +[_DKEventStatsCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsCounter, @"coreduet_sync2", @"sync_up_history_deletions_total");
  v1 = (void *)_updateEventStatsWithTotal_transportType__syncUpHistoryDeletionsTotalCounter;
  _updateEventStatsWithTotal_transportType__syncUpHistoryDeletionsTotalCounter = v0;

  uint64_t v2 = +[_DKEventTypeStatsCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsCounter, @"coreduet_sync2", @"sync_up_history_deletions_total_by_transport", @"transport", &unk_1EDE1E770);
  uint64_t v3 = (void *)_updateEventStatsWithTotal_transportType__syncUpHistoryDeletionsTotalByTransportCounter;
  _updateEventStatsWithTotal_transportType__syncUpHistoryDeletionsTotalByTransportCounter = v2;

  uint64_t v4 = objc_opt_new();
  uint64_t v5 = _updateEventStatsWithTotal_transportType__syncUpHistoryDeletionsCountersByStreamName;
  _updateEventStatsWithTotal_transportType__syncUpHistoryDeletionsCountersByStreamName = v4;
  return MEMORY[0x1F41817F8](v4, v5);
}

void __74___DKPerformSyncUpHistoryDeletionsOperation_performSyncUpHistoryDeletions__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf, int a12, __int16 a13, __int16 a14, void *a15, long long a16, long long a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  OUTLINED_FUNCTION_4();
  a30 = v31;
  a31 = v32;
  v34 = v33;
  uint64_t v36 = v35;
  a19 = *MEMORY[0x1E4F143B8];
  v37 = [(id)objc_opt_class() description];
  v38 = -[NSDate dk_localtimeString](*(void **)(v36 + 40));
  v39 = -[NSDate dk_localtimeString](*(void **)(v36 + 48));
  v40 = &stru_1EDDE58B8;
  if ([*(id *)(*(void *)(v36 + 32) + 320) me]) {
    v41 = @"pseudo ";
  }
  else {
    v41 = &stru_1EDDE58B8;
  }
  v42 = [(id)OUTLINED_FUNCTION_9_4() identifier];
  v43 = [(id)OUTLINED_FUNCTION_9_4() model];
  if (v43)
  {
    v44 = NSString;
    uint64_t v36 = [(id)OUTLINED_FUNCTION_9_4() model];
    v40 = [v44 stringWithFormat:@" (%@)"];
  }
  LODWORD(buf) = 138544642;
  *(void *)((char *)&buf + 4) = v37;
  WORD6(buf) = 2114;
  *(void *)((char *)&buf + 14) = v38;
  a14 = 2114;
  a15 = v39;
  LOWORD(a16) = 2114;
  *(void *)((char *)&a16 + 2) = v41;
  WORD5(a16) = 2114;
  *(void *)((char *)&a16 + 12) = v42;
  WORD2(a17) = 2114;
  *(void *)((char *)&a17 + 6) = v40;
  _os_log_debug_impl(&dword_18ECEB000, v34, OS_LOG_TYPE_DEBUG, "%{public}@: Successfully fast forwarded bookmark [%{public}@ ending %{public}@] for %{public}@peer %{public}@%{public}@", (uint8_t *)&buf, 0x3Eu);
  if (v43)
  {
  }
  OUTLINED_FUNCTION_3_2();
}

void __74___DKPerformSyncUpHistoryDeletionsOperation_performSyncUpHistoryDeletions__block_invoke_cold_2(uint64_t a1, void *a2)
{
  uint64_t v4 = [(id)objc_opt_class() description];
  uint64_t v5 = -[NSDate dk_localtimeString](*(void **)(a1 + 40));
  uint64_t v6 = -[NSDate dk_localtimeString](*(void **)(a1 + 48));
  id v7 = [a2 domain];
  [a2 code];
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_12_3();
  _os_log_debug_impl(v8, v9, v10, v11, v12, 0x3Eu);
}

void __74___DKPerformSyncUpHistoryDeletionsOperation_performSyncUpHistoryDeletions__block_invoke_cold_3(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(id)objc_opt_class() description];
  id v7 = -[NSDate dk_localtimeString](*(void **)(a1 + 40));
  v8 = -[NSDate dk_localtimeString](*(void **)(a1 + 48));
  os_log_t v9 = [a2 domain];
  [a2 code];
  OUTLINED_FUNCTION_1_9();
  _os_log_error_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Failed while fast forwarding bookmark [%{public}@ ending %{public}@]: %{public}@:%lld (%@)", v10, 0x3Eu);
}

@end