@interface DKSyncLocalKnowledgeStorage
@end

@implementation DKSyncLocalKnowledgeStorage

uint64_t __109___DKSyncLocalKnowledgeStorage_sortedEventsFromSyncWindows_streamNames_compatibility_limit_fetchOrder_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __84___DKSyncLocalKnowledgeStorage_tombstonesSinceDate_streamNames_limit_endDate_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __87___DKSyncLocalKnowledgeStorage__updateEventStatsWithFetchEventsTotal_streamNameCounts___block_invoke()
{
  uint64_t v0 = +[_DKEventStatsCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsCounter, @"coreduet_sync2", @"sync_fetch_local_events_total");
  v1 = (void *)_updateEventStatsWithFetchEventsTotal_streamNameCounts__fetchEventsTotalCounter;
  _updateEventStatsWithFetchEventsTotal_streamNameCounts__fetchEventsTotalCounter = v0;

  uint64_t v2 = objc_opt_new();
  uint64_t v3 = _updateEventStatsWithFetchEventsTotal_streamNameCounts__fetchEventsCountersByStreamName;
  _updateEventStatsWithFetchEventsTotal_streamNameCounts__fetchEventsCountersByStreamName = v2;
  return MEMORY[0x1F41817F8](v2, v3);
}

uint64_t __91___DKSyncLocalKnowledgeStorage__updateEventStatsWithFetchTombstonesTotal_streamNameCounts___block_invoke()
{
  uint64_t v0 = +[_DKEventStatsCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsCounter, @"coreduet_sync2", @"sync_fetch_local_tombstones_total");
  v1 = (void *)_updateEventStatsWithFetchTombstonesTotal_streamNameCounts__fetchTombstonesTotalCounter;
  _updateEventStatsWithFetchTombstonesTotal_streamNameCounts__fetchTombstonesTotalCounter = v0;

  uint64_t v2 = objc_opt_new();
  uint64_t v3 = _updateEventStatsWithFetchTombstonesTotal_streamNameCounts__fetchTombstonesCountersByStreamName;
  _updateEventStatsWithFetchTombstonesTotal_streamNameCounts__fetchTombstonesCountersByStreamName = v2;
  return MEMORY[0x1F41817F8](v2, v3);
}

uint64_t __95___DKSyncLocalKnowledgeStorage_sortedSyncDownWindowsOverlappingBetweenDate_andDate_peer_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __84___DKSyncLocalKnowledgeStorage_lastSyncDownDeletionDateForPeer_transportName_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __87___DKSyncLocalKnowledgeStorage_syncHistoryForPeer_streamName_transportName_type_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __87___DKSyncLocalKnowledgeStorage_syncHistoryForPeer_streamName_transportName_type_error___block_invoke_89(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

@end