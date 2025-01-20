@interface DKPerformSyncUpHistoryAdditionsOperation
@end

@implementation DKPerformSyncUpHistoryAdditionsOperation

void __74___DKPerformSyncUpHistoryAdditionsOperation_performSyncUpHistoryAdditions__block_invoke(uint64_t a1, void *a2, void *a3)
{
}

void __100___DKPerformSyncUpHistoryAdditionsOperation_performSyncUpHistoryAdditionsWithPreviousHighWaterMark___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  +[_DKPerformSyncUpHistoryAdditionsOperation _updateEventStatsWithTotal:streamNameCounts:transportType:]((uint64_t)_DKPerformSyncUpHistoryAdditionsOperation, [v3 count], *(void **)(a1 + 40), objc_msgSend(*(id *)(*(void *)(a1 + 48) + 304), "transportType"));
  -[_DKPerformSyncUpHistoryAdditionsOperation handleUpdateStorageWithFetchedWindow:eventsCount:error:](*(void *)(a1 + 48), *(void **)(a1 + 56), *(void *)(a1 + 64), v4);
}

uint64_t __97___DKPerformSyncUpHistoryAdditionsOperation__updateEventStatsWithPreviousSyncDate_transportType___block_invoke()
{
  uint64_t v0 = +[_DKEventTypeStatsTimerCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsTimerCounter, @"coreduet_sync2", @"sync_up_history_additions_cadence", @"transport", &unk_1EDE1E728);
  v1 = (void *)_updateEventStatsWithPreviousSyncDate_transportType__syncCadenceByTransportCounter_0;
  _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceByTransportCounter_0 = v0;

  uint64_t v2 = +[_DKEventStatsTimerCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsTimerCounter, @"coreduet_sync2", @"sync_up_history_additions_cadence");
  uint64_t v3 = _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceCounter_0;
  _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceCounter_0 = v2;
  return MEMORY[0x1F41817F8](v2, v3);
}

void __100___DKPerformSyncUpHistoryAdditionsOperation_handleUpdateStorageWithFetchedWindow_eventsCount_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  -[_DKSyncType urgency](*(void *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKPerformSyncUpHistoryAdditionsOperation performSyncUpHistoryAdditionsWithPreviousHighWaterMark:](v1, v2);
}

uint64_t __103___DKPerformSyncUpHistoryAdditionsOperation__updateEventStatsWithTotal_streamNameCounts_transportType___block_invoke()
{
  uint64_t v0 = +[_DKEventStatsCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsCounter, @"coreduet_sync2", @"sync_up_history_additions_total");
  uint64_t v1 = (void *)_updateEventStatsWithTotal_streamNameCounts_transportType__syncUpHistoryAdditionsTotalCounter;
  _updateEventStatsWithTotal_streamNameCounts_transportType__syncUpHistoryAdditionsTotalCounter = v0;

  uint64_t v2 = +[_DKEventTypeStatsCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsCounter, @"coreduet_sync2", @"sync_up_history_additions_total_by_transport", @"transport", &unk_1EDE1E740);
  uint64_t v3 = (void *)_updateEventStatsWithTotal_streamNameCounts_transportType__syncUpHistoryAdditionsTotalByTransportCounter;
  _updateEventStatsWithTotal_streamNameCounts_transportType__syncUpHistoryAdditionsTotalByTransportCounter = v2;

  uint64_t v4 = objc_opt_new();
  uint64_t v5 = _updateEventStatsWithTotal_streamNameCounts_transportType__syncUpHistoryAdditionsCountersByStreamName;
  _updateEventStatsWithTotal_streamNameCounts_transportType__syncUpHistoryAdditionsCountersByStreamName = v4;
  return MEMORY[0x1F41817F8](v4, v5);
}

@end