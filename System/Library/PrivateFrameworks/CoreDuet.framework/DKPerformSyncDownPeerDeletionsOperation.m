@interface DKPerformSyncDownPeerDeletionsOperation
@end

@implementation DKPerformSyncDownPeerDeletionsOperation

void __72___DKPerformSyncDownPeerDeletionsOperation_performSyncDownPeerDeletions__block_invoke(uint64_t a1, void *a2)
{
}

void __94___DKPerformSyncDownPeerDeletionsOperation_performSyncDownPeerDeletionsWithPreviousUntilDate___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a1[4];
  id v10 = v7;
  if (v7)
  {
    v9 = [v8 errors];
    [v9 addObject:v10];

    [a1[4] endOperation];
  }
  else
  {
    -[_DKPerformSyncDownPeerDeletionsOperation handleFetchedDeletedEventIDs:startDate:endDate:untilDate:]((uint64_t)v8, a2, a1[5], a1[6], a3);
  }
}

uint64_t __96___DKPerformSyncDownPeerDeletionsOperation__updateEventStatsWithPreviousSyncDate_transportType___block_invoke()
{
  uint64_t v0 = +[_DKEventTypeStatsTimerCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsTimerCounter, @"coreduet_sync2", @"sync_down_deletions_cadence", @"transport", &unk_1EDE1E6B0);
  v1 = (void *)_updateEventStatsWithPreviousSyncDate_transportType__syncCadenceByTransportCounter;
  _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceByTransportCounter = v0;

  uint64_t v2 = +[_DKEventStatsTimerCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsTimerCounter, @"coreduet_sync2", @"sync_down_deletions_cadence");
  uint64_t v3 = _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceCounter;
  _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceCounter = v2;
  return MEMORY[0x1F41817F8](v2, v3);
}

uint64_t __101___DKPerformSyncDownPeerDeletionsOperation_handleFetchedDeletedEventIDs_startDate_endDate_untilDate___block_invoke(uint64_t a1)
{
  return -[_DKPerformSyncDownPeerDeletionsOperation performSyncDownPeerDeletionsWithPreviousUntilDate:](*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __85___DKPerformSyncDownPeerDeletionsOperation__updateEventStatsWithTotal_transportType___block_invoke()
{
  uint64_t v0 = +[_DKEventStatsCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsCounter, @"coreduet_sync2", @"sync_down_deletions_total");
  v1 = (void *)_updateEventStatsWithTotal_transportType__syncDownDeletionsTotalCounter;
  _updateEventStatsWithTotal_transportType__syncDownDeletionsTotalCounter = v0;

  uint64_t v2 = +[_DKEventTypeStatsCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsCounter, @"coreduet_sync2", @"sync_down_deletions_total_by_transport", @"transport", &unk_1EDE1E6C8);
  uint64_t v3 = (void *)_updateEventStatsWithTotal_transportType__syncDownDeletionsTotalByTransportCounter;
  _updateEventStatsWithTotal_transportType__syncDownDeletionsTotalByTransportCounter = v2;

  uint64_t v4 = objc_opt_new();
  uint64_t v5 = _updateEventStatsWithTotal_transportType__syncDownDeletionsCountersByStreamName;
  _updateEventStatsWithTotal_transportType__syncDownDeletionsCountersByStreamName = v4;
  return MEMORY[0x1F41817F8](v4, v5);
}

@end