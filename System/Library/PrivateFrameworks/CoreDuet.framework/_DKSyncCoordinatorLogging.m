@interface _DKSyncCoordinatorLogging
- (_DKSyncCoordinatorLogging)init;
- (id)portraitStreamNames;
- (id)typeValueWithStreamName:(void *)a1;
- (uint64_t)_syncCoordinatorDidCreateChangeSetOfType:(uint64_t)a1;
- (void)_sendDistributedNotificationName:(uint64_t)a1;
- (void)_sendDistributedNotificationName:(void *)a3 object:(void *)a4 throttledActivityName:;
- (void)_sendDistributedNotificationName:(void *)a3 streamNameCounts:;
- (void)_updateSyncCounter:(void *)a3 streamNameCounts:;
- (void)syncCoordinator:(id)a3 didAddRemoteEventsWithStreamNameCounts:(id)a4 events:(id)a5;
- (void)syncCoordinator:(id)a3 didApplyRemoteAdditionChangeSet:(id)a4;
- (void)syncCoordinator:(id)a3 didApplyRemoteDeletionChangeSet:(id)a4;
- (void)syncCoordinator:(id)a3 didCreateAdditionChangeSet:(id)a4;
- (void)syncCoordinator:(id)a3 didCreateDeletionChangeSet:(id)a4;
- (void)syncCoordinator:(id)a3 didDeleteRemoteEventsWithCount:(unint64_t)a4;
- (void)syncCoordinator:(id)a3 didInsertLocalAdditionEventsWithStreamNameCounts:(id)a4;
- (void)syncCoordinator:(id)a3 didInsertLocalDeletionEventsWithCount:(unint64_t)a4;
@end

@implementation _DKSyncCoordinatorLogging

- (_DKSyncCoordinatorLogging)init
{
  v6.receiver = self;
  v6.super_class = (Class)_DKSyncCoordinatorLogging;
  v2 = [(_DKSyncCoordinatorLogging *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.coreduet.SyncCoordinatorLogging.notificationQueue", 0);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (id)portraitStreamNames
{
  if (a1)
  {
    if (portraitStreamNames_initialized_0 != -1) {
      dispatch_once(&portraitStreamNames_initialized_0, &__block_literal_global_3_1);
    }
    a1 = (id)portraitStreamNames_portraitStreamNames_0;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)typeValueWithStreamName:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    if (typeValueWithStreamName__initialized != -1) {
      dispatch_once(&typeValueWithStreamName__initialized, &__block_literal_global_8);
    }
    a1 = [(id)typeValueWithStreamName__typeValueByStreamName objectForKeyedSubscript:v3];
  }

  return a1;
}

- (void)_updateSyncCounter:(void *)a3 streamNameCounts:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = -[_DKSyncCoordinatorLogging portraitStreamNames](a1);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(v6, "countForObject:", v12, (void)v16);
          if (v13)
          {
            uint64_t v14 = v13;
            v15 = -[_DKSyncCoordinatorLogging typeValueWithStreamName:](a1, v12);
            if (v15) {
              -[_DKEventTypeStatsCounter incrementCountByNumber:typeValue:]((uint64_t)v5, v14, v15);
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
  }
}

- (void)_sendDistributedNotificationName:(void *)a3 object:(void *)a4 throttledActivityName:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    id v9 = a4;
    uint64_t v10 = +[_DKThrottledActivity standardInstance];
    uint64_t v11 = *(void *)(a1 + 8);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __91___DKSyncCoordinatorLogging__sendDistributedNotificationName_object_throttledActivityName___block_invoke;
    v12[3] = &unk_1E560D848;
    id v13 = v7;
    id v14 = v8;
    [v10 performWithMinimumIntervalInSecondsOf:v9 name:v11 queue:v12 activityBlock:2.0];
  }
}

- (void)_sendDistributedNotificationName:(uint64_t)a1
{
  if (a1)
  {
    id v3 = NSString;
    id v4 = a2;
    id v5 = [v3 stringWithFormat:@"_DKSyncCoordinatorLogging%@", v4];
    -[_DKSyncCoordinatorLogging _sendDistributedNotificationName:object:throttledActivityName:](a1, v4, 0, v5);
  }
}

- (void)_sendDistributedNotificationName:(void *)a3 streamNameCounts:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = -[_DKSyncCoordinatorLogging portraitStreamNames](a1);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([v6 countForObject:v12])
          {
            id v13 = -[_DKSyncCoordinatorLogging typeValueWithStreamName:](a1, v12);
            if (v13)
            {
              id v14 = [NSString stringWithFormat:@"_DKSyncCoordinatorLogging%@%@", v5, v13, (void)v15];
              -[_DKSyncCoordinatorLogging _sendDistributedNotificationName:object:throttledActivityName:]((uint64_t)a1, v5, v12, v14);
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
}

- (void)syncCoordinator:(id)a3 didInsertLocalAdditionEventsWithStreamNameCounts:(id)a4
{
  uint64_t v5 = syncCoordinator_didInsertLocalAdditionEventsWithStreamNameCounts__syncCounterInitialized;
  id v6 = a4;
  id v8 = v6;
  if (v5 == -1)
  {
    id v7 = v6;
  }
  else
  {
    dispatch_once(&syncCoordinator_didInsertLocalAdditionEventsWithStreamNameCounts__syncCounterInitialized, &__block_literal_global_24_0);
    id v7 = v8;
  }
  -[_DKSyncCoordinatorLogging _updateSyncCounter:streamNameCounts:](self, (void *)syncCoordinator_didInsertLocalAdditionEventsWithStreamNameCounts__syncCounter, v7);
  -[_DKSyncCoordinatorLogging _sendDistributedNotificationName:streamNameCounts:](self, @"_DKSyncCoordinatorDidInsertLocalAdditionEventsNotification", v8);
}

- (void)syncCoordinator:(id)a3 didInsertLocalDeletionEventsWithCount:(unint64_t)a4
{
}

- (void)syncCoordinator:(id)a3 didAddRemoteEventsWithStreamNameCounts:(id)a4 events:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v26 = v8;
  if (syncCoordinator_didAddRemoteEventsWithStreamNameCounts_events__syncCounterInitialized != -1) {
    dispatch_once(&syncCoordinator_didAddRemoteEventsWithStreamNameCounts_events__syncCounterInitialized, &__block_literal_global_36_0);
  }
  v25 = v9;
  -[_DKSyncCoordinatorLogging _updateSyncCounter:streamNameCounts:](self, (void *)syncCoordinator_didAddRemoteEventsWithStreamNameCounts_events__syncCounter, v9);
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v18 = objc_msgSend(v17, "stream", v25, v26, (void)v27);
        long long v19 = [v18 name];

        uint64_t v20 = -[_DKSyncCoordinatorLogging typeValueWithStreamName:](self, v19);
        if (v20)
        {
          uint64_t v21 = [v17 endDate];
          v22 = v21;
          if (v21)
          {
            id v23 = v21;
          }
          else
          {
            id v23 = [v17 startDate];
          }
          v24 = v23;

          -[_DKEventTypeStatsTimerCounter addTimingWithStartDate:endDate:typeValue:](syncCoordinator_didAddRemoteEventsWithStreamNameCounts_events__additionSyncLatencyTimerCounter, (uint64_t)v24, v11, v20);
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v14);
  }

  -[_DKSyncCoordinatorLogging _sendDistributedNotificationName:streamNameCounts:](self, @"_DKSyncCoordinatorDidAddRemoteEventsNotification", v25);
}

- (void)syncCoordinator:(id)a3 didDeleteRemoteEventsWithCount:(unint64_t)a4
{
  if (syncCoordinator_didDeleteRemoteEventsWithCount__syncCounterInitialized != -1) {
    dispatch_once(&syncCoordinator_didDeleteRemoteEventsWithCount__syncCounterInitialized, &__block_literal_global_52);
  }
  -[_DKEventStatsCounter incrementCountByNumber:](syncCoordinator_didDeleteRemoteEventsWithCount__syncCounter, a4);
  -[_DKSyncCoordinatorLogging _sendDistributedNotificationName:]((uint64_t)self, @"_DKSyncCoordinatorDidDeleteRemoteEventsNotification");
}

- (uint64_t)_syncCoordinatorDidCreateChangeSetOfType:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v6 = v3;
    if (_syncCoordinatorDidCreateChangeSetOfType__syncCounterInitialized != -1) {
      dispatch_once(&_syncCoordinatorDidCreateChangeSetOfType__syncCounterInitialized, &__block_literal_global_58);
    }
    -[_DKEventTypeStatsCounter incrementCountWithTypeValue:](_syncCoordinatorDidCreateChangeSetOfType__syncCounter, v6);
    id v4 = v6;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (void)syncCoordinator:(id)a3 didCreateAdditionChangeSet:(id)a4
{
  -[_DKSyncCoordinatorLogging _syncCoordinatorDidCreateChangeSetOfType:]((uint64_t)self, @"addition");
  -[_DKSyncCoordinatorLogging _sendDistributedNotificationName:]((uint64_t)self, @"_DKSyncCoordinatorDidCreateAdditionChangeSetNotification");
}

- (void)syncCoordinator:(id)a3 didCreateDeletionChangeSet:(id)a4
{
  -[_DKSyncCoordinatorLogging _syncCoordinatorDidCreateChangeSetOfType:]((uint64_t)self, @"deletion");
  -[_DKSyncCoordinatorLogging _sendDistributedNotificationName:]((uint64_t)self, @"_DKSyncCoordinatorDidCreateDeletionChangeSetNotification");
}

- (void)syncCoordinator:(id)a3 didApplyRemoteAdditionChangeSet:(id)a4
{
}

- (void)syncCoordinator:(id)a3 didApplyRemoteDeletionChangeSet:(id)a4
{
}

- (void).cxx_destruct
{
}

@end