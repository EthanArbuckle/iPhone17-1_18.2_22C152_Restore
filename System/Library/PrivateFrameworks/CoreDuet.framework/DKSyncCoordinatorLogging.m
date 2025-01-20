@interface DKSyncCoordinatorLogging
@end

@implementation DKSyncCoordinatorLogging

void __48___DKSyncCoordinatorLogging_portraitStreamNames__block_invoke()
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v1 = +[_CDPortraitStreams topicStream];
  v2 = [v1 name];
  v8[0] = v2;
  v3 = +[_CDPortraitStreams entityStream];
  v4 = [v3 name];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  uint64_t v6 = [v0 setWithArray:v5];
  v7 = (void *)portraitStreamNames_portraitStreamNames_0;
  portraitStreamNames_portraitStreamNames_0 = v6;
}

void __53___DKSyncCoordinatorLogging_typeValueWithStreamName___block_invoke()
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v0 = +[_CDPortraitStreams entityStream];
  v1 = [v0 name];
  v6[0] = v1;
  v7[0] = @"entity";
  v2 = +[_CDPortraitStreams topicStream];
  v3 = [v2 name];
  v6[1] = v3;
  v7[1] = @"topic";
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  v5 = (void *)typeValueWithStreamName__typeValueByStreamName;
  typeValueWithStreamName__typeValueByStreamName = v4;
}

void __91___DKSyncCoordinatorLogging__sendDistributedNotificationName_object_throttledActivityName___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v2 postNotificationName:*(void *)(a1 + 32) object:*(void *)(a1 + 40) userInfo:0 deliverImmediately:0];
}

uint64_t __94___DKSyncCoordinatorLogging_syncCoordinator_didInsertLocalAdditionEventsWithStreamNameCounts___block_invoke()
{
  uint64_t v0 = +[_DKEventTypeStatsCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsCounter, @"portraitknowledge", @"sync_up", @"type", &unk_1EDE1E998);
  uint64_t v1 = syncCoordinator_didInsertLocalAdditionEventsWithStreamNameCounts__syncCounter;
  syncCoordinator_didInsertLocalAdditionEventsWithStreamNameCounts__syncCounter = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __91___DKSyncCoordinatorLogging_syncCoordinator_didAddRemoteEventsWithStreamNameCounts_events___block_invoke()
{
  uint64_t v0 = +[_DKEventTypeStatsCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsCounter, @"portraitknowledge", @"sync_down", @"type", &unk_1EDE1E9B0);
  uint64_t v1 = (void *)syncCoordinator_didAddRemoteEventsWithStreamNameCounts_events__syncCounter;
  syncCoordinator_didAddRemoteEventsWithStreamNameCounts_events__syncCounter = v0;

  uint64_t v2 = +[_DKEventTypeStatsTimerCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsTimerCounter, @"portraitknowledge", @"addition_sync_latency", @"type", &unk_1EDE1E9C8);
  uint64_t v3 = syncCoordinator_didAddRemoteEventsWithStreamNameCounts_events__additionSyncLatencyTimerCounter;
  syncCoordinator_didAddRemoteEventsWithStreamNameCounts_events__additionSyncLatencyTimerCounter = v2;
  return MEMORY[0x1F41817F8](v2, v3);
}

uint64_t __76___DKSyncCoordinatorLogging_syncCoordinator_didDeleteRemoteEventsWithCount___block_invoke()
{
  uint64_t v0 = +[_DKEventStatsCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsCounter, @"portraitknowledge", @"delete");
  uint64_t v1 = syncCoordinator_didDeleteRemoteEventsWithCount__syncCounter;
  syncCoordinator_didDeleteRemoteEventsWithCount__syncCounter = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __70___DKSyncCoordinatorLogging__syncCoordinatorDidCreateChangeSetOfType___block_invoke()
{
  uint64_t v0 = +[_DKEventTypeStatsCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsCounter, @"portraitknowledge", @"create_changeset", @"type", &unk_1EDE1E9E0);
  uint64_t v1 = _syncCoordinatorDidCreateChangeSetOfType__syncCounter;
  _syncCoordinatorDidCreateChangeSetOfType__syncCounter = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end