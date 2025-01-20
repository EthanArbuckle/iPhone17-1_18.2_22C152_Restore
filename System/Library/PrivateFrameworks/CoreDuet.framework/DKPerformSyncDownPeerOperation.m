@interface DKPerformSyncDownPeerOperation
@end

@implementation DKPerformSyncDownPeerOperation

uint64_t __70___DKPerformSyncDownPeerOperation__updateEventStatsWithTransportType___block_invoke()
{
  uint64_t v0 = +[_DKEventTypeStatsCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsCounter, @"coreduet_sync2", @"sync_rapport_vs_cloud", @"transport", &unk_1EDE1E4D0);
  uint64_t v1 = _updateEventStatsWithTransportType__rapportVsCloudOptimizationCounter;
  _updateEventStatsWithTransportType__rapportVsCloudOptimizationCounter = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end