@interface BLDownloadPipelineQueue
- (BLDownloadPipelineQueue)initWithQueue:(id)a3;
- (BOOL)alreadyHaveCellularDownloadWithDownloadID:(id)a3;
- (BOOL)alreadyHaveDiscretionaryDownloadWithDownloadID:(id)a3;
- (BOOL)alreadyHaveNondiscretionaryDownloadWithDownloadID:(id)a3;
- (BOOL)alreadyHaveSampleDownloadWithDownloadID:(id)a3;
- (BOOL)downloadIsHighPriorityWithDownloadID:(id)a3;
- (NSMutableSet)highPriorityDownloadIds;
- (NSMutableSet)mutableInFlightCellularDownloadIDs;
- (NSMutableSet)mutableInFlightDiscretionaryDownloadIDs;
- (NSMutableSet)mutableInFlightNondiscretionaryDownloadIDs;
- (NSMutableSet)mutableInFlightSampleDownloadIDs;
- (NSSet)inFlightCellularDownloadIDs;
- (NSSet)inFlightDiscretionaryDownloadIDs;
- (NSSet)inFlightNondiscretionaryDownloadIDs;
- (NSSet)inFlightSampleDownloadIDs;
- (OS_dispatch_queue)queue;
- (id)inFlightCellularDownloadsDescription;
- (id)inFlightDiscretionaryDownloadsDescription;
- (id)inFlightNondiscretionaryDownloadsDescription;
- (id)inFlightSampleDownloadsDescription;
- (unint64_t)availableCellularDownloads;
- (unint64_t)availableDiscretionaryDownloads;
- (unint64_t)availableNondiscretionaryDownloads;
- (unint64_t)availableSampleDownloads;
- (unint64_t)inFlightCellularDownloadsCount;
- (unint64_t)inFlightDiscretionaryDownloadsCount;
- (unint64_t)inFlightNondiscretionaryDownloadsCount;
- (unint64_t)inFlightSampleDownloadsCount;
- (void)addDownloadWithDownloadID:(id)a3 discretionary:(BOOL)a4 sample:(BOOL)a5 cellular:(BOOL)a6;
- (void)markDownloadAsHighPriorityWithDownloadID:(id)a3;
- (void)markDownloadAsStandardPriorityWithDownloadID:(id)a3;
- (void)removeDownloadWithDownloadID:(id)a3;
- (void)setHighPriorityDownloadIds:(id)a3;
- (void)setMutableInFlightCellularDownloadIDs:(id)a3;
- (void)setMutableInFlightDiscretionaryDownloadIDs:(id)a3;
- (void)setMutableInFlightNondiscretionaryDownloadIDs:(id)a3;
- (void)setMutableInFlightSampleDownloadIDs:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation BLDownloadPipelineQueue

- (BLDownloadPipelineQueue)initWithQueue:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BLDownloadPipelineQueue;
  v6 = [(BLDownloadPipelineQueue *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    mutableInFlightDiscretionaryDownloadIDs = v7->_mutableInFlightDiscretionaryDownloadIDs;
    v7->_mutableInFlightDiscretionaryDownloadIDs = v8;

    v10 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    mutableInFlightNondiscretionaryDownloadIDs = v7->_mutableInFlightNondiscretionaryDownloadIDs;
    v7->_mutableInFlightNondiscretionaryDownloadIDs = v10;

    v12 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    mutableInFlightSampleDownloadIDs = v7->_mutableInFlightSampleDownloadIDs;
    v7->_mutableInFlightSampleDownloadIDs = v12;

    v14 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    mutableInFlightCellularDownloadIDs = v7->_mutableInFlightCellularDownloadIDs;
    v7->_mutableInFlightCellularDownloadIDs = v14;

    v16 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    highPriorityDownloadIds = v7->_highPriorityDownloadIds;
    v7->_highPriorityDownloadIds = v16;
  }
  return v7;
}

- (unint64_t)availableDiscretionaryDownloads
{
  v3 = [(BLDownloadPipelineQueue *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(BLDownloadPipelineQueue *)self mutableInFlightDiscretionaryDownloadIDs];
  unint64_t v5 = 3 - (void)[v4 count];

  return v5;
}

- (unint64_t)availableNondiscretionaryDownloads
{
  v3 = [(BLDownloadPipelineQueue *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(BLDownloadPipelineQueue *)self mutableInFlightNondiscretionaryDownloadIDs];
  unint64_t v5 = 3 - (void)[v4 count];

  return v5;
}

- (unint64_t)availableSampleDownloads
{
  v3 = [(BLDownloadPipelineQueue *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(BLDownloadPipelineQueue *)self mutableInFlightSampleDownloadIDs];
  unint64_t v5 = 1 - (void)[v4 count];

  return v5;
}

- (unint64_t)availableCellularDownloads
{
  v3 = [(BLDownloadPipelineQueue *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(BLDownloadPipelineQueue *)self mutableInFlightCellularDownloadIDs];
  unint64_t v5 = 3 - (void)[v4 count];

  return v5;
}

- (NSSet)inFlightDiscretionaryDownloadIDs
{
  v3 = [(BLDownloadPipelineQueue *)self queue];
  dispatch_assert_queue_V2(v3);

  return (NSSet *)[(BLDownloadPipelineQueue *)self mutableInFlightDiscretionaryDownloadIDs];
}

- (NSSet)inFlightNondiscretionaryDownloadIDs
{
  v3 = [(BLDownloadPipelineQueue *)self queue];
  dispatch_assert_queue_V2(v3);

  return (NSSet *)[(BLDownloadPipelineQueue *)self mutableInFlightNondiscretionaryDownloadIDs];
}

- (NSSet)inFlightSampleDownloadIDs
{
  v3 = [(BLDownloadPipelineQueue *)self queue];
  dispatch_assert_queue_V2(v3);

  return (NSSet *)[(BLDownloadPipelineQueue *)self mutableInFlightSampleDownloadIDs];
}

- (NSSet)inFlightCellularDownloadIDs
{
  v3 = [(BLDownloadPipelineQueue *)self queue];
  dispatch_assert_queue_V2(v3);

  return (NSSet *)[(BLDownloadPipelineQueue *)self mutableInFlightCellularDownloadIDs];
}

- (void)addDownloadWithDownloadID:(id)a3 discretionary:(BOOL)a4 sample:(BOOL)a5 cellular:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v13 = a3;
  v10 = [(BLDownloadPipelineQueue *)self queue];
  dispatch_assert_queue_V2(v10);

  if (v7)
  {
    v11 = [(BLDownloadPipelineQueue *)self mutableInFlightSampleDownloadIDs];
  }
  else if (v6)
  {
    v11 = [(BLDownloadPipelineQueue *)self mutableInFlightCellularDownloadIDs];
  }
  else
  {
    if (v8) {
      [(BLDownloadPipelineQueue *)self mutableInFlightDiscretionaryDownloadIDs];
    }
    else {
    v11 = [(BLDownloadPipelineQueue *)self mutableInFlightNondiscretionaryDownloadIDs];
    }
  }
  v12 = v11;
  [v11 addObject:v13];
}

- (void)removeDownloadWithDownloadID:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(BLDownloadPipelineQueue *)self queue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = [(BLDownloadPipelineQueue *)self mutableInFlightSampleDownloadIDs];
  [v6 removeObject:v4];

  BOOL v7 = [(BLDownloadPipelineQueue *)self mutableInFlightCellularDownloadIDs];
  [v7 removeObject:v4];

  BOOL v8 = [(BLDownloadPipelineQueue *)self mutableInFlightDiscretionaryDownloadIDs];
  [v8 removeObject:v4];

  id v9 = [(BLDownloadPipelineQueue *)self mutableInFlightNondiscretionaryDownloadIDs];
  [v9 removeObject:v4];
}

- (BOOL)alreadyHaveDiscretionaryDownloadWithDownloadID:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(BLDownloadPipelineQueue *)self queue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = [(BLDownloadPipelineQueue *)self mutableInFlightDiscretionaryDownloadIDs];
  LOBYTE(v5) = [v6 containsObject:v4];

  return (char)v5;
}

- (BOOL)alreadyHaveNondiscretionaryDownloadWithDownloadID:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(BLDownloadPipelineQueue *)self queue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = [(BLDownloadPipelineQueue *)self mutableInFlightNondiscretionaryDownloadIDs];
  LOBYTE(v5) = [v6 containsObject:v4];

  return (char)v5;
}

- (BOOL)alreadyHaveSampleDownloadWithDownloadID:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(BLDownloadPipelineQueue *)self queue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = [(BLDownloadPipelineQueue *)self mutableInFlightSampleDownloadIDs];
  LOBYTE(v5) = [v6 containsObject:v4];

  return (char)v5;
}

- (BOOL)alreadyHaveCellularDownloadWithDownloadID:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(BLDownloadPipelineQueue *)self queue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = [(BLDownloadPipelineQueue *)self mutableInFlightCellularDownloadIDs];
  LOBYTE(v5) = [v6 containsObject:v4];

  return (char)v5;
}

- (unint64_t)inFlightDiscretionaryDownloadsCount
{
  v3 = [(BLDownloadPipelineQueue *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(BLDownloadPipelineQueue *)self mutableInFlightDiscretionaryDownloadIDs];
  id v5 = [v4 count];

  return (unint64_t)v5;
}

- (unint64_t)inFlightNondiscretionaryDownloadsCount
{
  v3 = [(BLDownloadPipelineQueue *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(BLDownloadPipelineQueue *)self mutableInFlightNondiscretionaryDownloadIDs];
  id v5 = [v4 count];

  return (unint64_t)v5;
}

- (unint64_t)inFlightSampleDownloadsCount
{
  v3 = [(BLDownloadPipelineQueue *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(BLDownloadPipelineQueue *)self mutableInFlightSampleDownloadIDs];
  id v5 = [v4 count];

  return (unint64_t)v5;
}

- (unint64_t)inFlightCellularDownloadsCount
{
  v3 = [(BLDownloadPipelineQueue *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(BLDownloadPipelineQueue *)self mutableInFlightCellularDownloadIDs];
  id v5 = [v4 count];

  return (unint64_t)v5;
}

- (id)inFlightDiscretionaryDownloadsDescription
{
  v3 = [(BLDownloadPipelineQueue *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(BLDownloadPipelineQueue *)self mutableInFlightDiscretionaryDownloadIDs];
  id v5 = [v4 description];

  return v5;
}

- (id)inFlightNondiscretionaryDownloadsDescription
{
  v3 = [(BLDownloadPipelineQueue *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(BLDownloadPipelineQueue *)self mutableInFlightNondiscretionaryDownloadIDs];
  id v5 = [v4 description];

  return v5;
}

- (id)inFlightSampleDownloadsDescription
{
  v3 = [(BLDownloadPipelineQueue *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(BLDownloadPipelineQueue *)self mutableInFlightSampleDownloadIDs];
  id v5 = [v4 description];

  return v5;
}

- (id)inFlightCellularDownloadsDescription
{
  v3 = [(BLDownloadPipelineQueue *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(BLDownloadPipelineQueue *)self mutableInFlightCellularDownloadIDs];
  id v5 = [v4 description];

  return v5;
}

- (BOOL)downloadIsHighPriorityWithDownloadID:(id)a3
{
  id v4 = a3;
  id v5 = [(BLDownloadPipelineQueue *)self queue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = [(BLDownloadPipelineQueue *)self highPriorityDownloadIds];
  LOBYTE(v5) = [v6 containsObject:v4];

  return (char)v5;
}

- (void)markDownloadAsHighPriorityWithDownloadID:(id)a3
{
  id v4 = a3;
  id v5 = [(BLDownloadPipelineQueue *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(BLDownloadPipelineQueue *)self highPriorityDownloadIds];
  [v6 addObject:v4];
}

- (void)markDownloadAsStandardPriorityWithDownloadID:(id)a3
{
  id v4 = a3;
  id v5 = [(BLDownloadPipelineQueue *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(BLDownloadPipelineQueue *)self highPriorityDownloadIds];
  [v6 removeObject:v4];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableSet)mutableInFlightNondiscretionaryDownloadIDs
{
  return self->_mutableInFlightNondiscretionaryDownloadIDs;
}

- (void)setMutableInFlightNondiscretionaryDownloadIDs:(id)a3
{
}

- (NSMutableSet)mutableInFlightDiscretionaryDownloadIDs
{
  return self->_mutableInFlightDiscretionaryDownloadIDs;
}

- (void)setMutableInFlightDiscretionaryDownloadIDs:(id)a3
{
}

- (NSMutableSet)mutableInFlightSampleDownloadIDs
{
  return self->_mutableInFlightSampleDownloadIDs;
}

- (void)setMutableInFlightSampleDownloadIDs:(id)a3
{
}

- (NSMutableSet)mutableInFlightCellularDownloadIDs
{
  return self->_mutableInFlightCellularDownloadIDs;
}

- (void)setMutableInFlightCellularDownloadIDs:(id)a3
{
}

- (NSMutableSet)highPriorityDownloadIds
{
  return self->_highPriorityDownloadIds;
}

- (void)setHighPriorityDownloadIds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highPriorityDownloadIds, 0);
  objc_storeStrong((id *)&self->_mutableInFlightCellularDownloadIDs, 0);
  objc_storeStrong((id *)&self->_mutableInFlightSampleDownloadIDs, 0);
  objc_storeStrong((id *)&self->_mutableInFlightDiscretionaryDownloadIDs, 0);
  objc_storeStrong((id *)&self->_mutableInFlightNondiscretionaryDownloadIDs, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end