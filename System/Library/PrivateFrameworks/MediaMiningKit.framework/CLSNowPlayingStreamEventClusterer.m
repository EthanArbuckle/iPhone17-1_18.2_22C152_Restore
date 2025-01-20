@interface CLSNowPlayingStreamEventClusterer
- (CLSNowPlayingStreamEventClusterer)init;
- (CLSNowPlayingStreamEventClusterer)initWithClusteringParameters:(id)a3;
- (CLSNowPlayingStreamEventClusteringParameters)clusteringParameters;
- (NSArray)sessions;
- (id)_dbScanClusterEvents:(id)a3;
- (id)_populateSessionsWithClusters:(id)a3;
- (void)clusterEvents:(id)a3;
- (void)dbScanClusterEvents:(id)a3;
- (void)naiveClusterEvents:(id)a3;
@end

@implementation CLSNowPlayingStreamEventClusterer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusteringParameters, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
}

- (CLSNowPlayingStreamEventClusteringParameters)clusteringParameters
{
  return self->_clusteringParameters;
}

- (NSArray)sessions
{
  return self->_sessions;
}

- (id)_populateSessionsWithClusters:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v11 = [CLSNowPlayingStreamSession alloc];
        v12 = -[CLSNowPlayingStreamSession initWithDataCluster:](v11, "initWithDataCluster:", v10, (void)v15);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  v13 = +[CLSNowPlayingStreamSession playbackStreamSessionDateSortDescriptors];
  [v4 sortUsingDescriptors:v13];

  return v4;
}

- (id)_dbScanClusterEvents:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F8A780];
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithDistanceBlock:&__block_literal_global_4849];
  uint64_t v7 = [(CLSNowPlayingStreamEventClusterer *)self clusteringParameters];
  [v7 minimumClusterTimeInSeconds];
  objc_msgSend(v6, "setMaximumDistance:");

  [v6 setMinimumNumberOfObjects:1];
  uint64_t v8 = [v6 performWithDataset:v5 progressBlock:0];

  v9 = [(CLSNowPlayingStreamEventClusterer *)self _populateSessionsWithClusters:v8];

  return v9;
}

void __58__CLSNowPlayingStreamEventClusterer__dbScanClusterEvents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 localStartDate];
  uint64_t v6 = [v4 localStartDate];

  [v5 timeIntervalSinceDate:v6];
}

- (void)dbScanClusterEvents:(id)a3
{
  id v4 = a3;
  id v5 = +[CLSNowPlayingStreamEvent playbackStreamEventDateSortDescriptors];
  id v10 = [v4 sortedArrayUsingDescriptors:v5];

  uint64_t v6 = [(CLSNowPlayingStreamEventClusterer *)self _dbScanClusterEvents:v10];
  uint64_t v7 = [MEMORY[0x1E4F1CA48] arrayWithArray:v6];
  uint64_t v8 = +[CLSNowPlayingStreamSession playbackStreamSessionDateSortDescriptors];
  [(NSArray *)v7 sortUsingDescriptors:v8];

  sessions = self->_sessions;
  self->_sessions = v7;
}

- (void)naiveClusterEvents:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v21 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v10 = [v9 localStartDate];
        v11 = +[CLSCalendar startOfDayForDate:v10];
        [v11 timeIntervalSince1970];
        double v13 = v12;
        v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:");
        long long v15 = [v4 objectForKeyedSubscript:v14];

        if (v15)
        {
          long long v16 = [MEMORY[0x1E4F28ED0] numberWithDouble:v13];
          long long v17 = [v4 objectForKeyedSubscript:v16];
          [v17 addObject:v9];
        }
        else
        {
          long long v16 = [MEMORY[0x1E4F1CA48] arrayWithObject:v9];
          long long v17 = [MEMORY[0x1E4F28ED0] numberWithDouble:v13];
          [v4 setObject:v16 forKeyedSubscript:v17];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v6);
  }

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __56__CLSNowPlayingStreamEventClusterer_naiveClusterEvents___block_invoke;
  v24[3] = &unk_1E690FCD8;
  long long v18 = v21;
  v25 = v18;
  [v4 enumerateKeysAndObjectsUsingBlock:v24];
  sessions = self->_sessions;
  self->_sessions = v18;
  uint64_t v20 = v18;
}

void __56__CLSNowPlayingStreamEventClusterer_naiveClusterEvents___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [[CLSNowPlayingStreamSession alloc] initWithEvents:v4];

  [*(id *)(a1 + 32) addObject:v5];
}

- (void)clusterEvents:(id)a3
{
  id v5 = a3;
  unint64_t v4 = [(CLSNowPlayingStreamEventClusteringParameters *)self->_clusteringParameters algorithm];
  if (v4 == 1)
  {
    [(CLSNowPlayingStreamEventClusterer *)self naiveClusterEvents:v5];
  }
  else if (!v4)
  {
    [(CLSNowPlayingStreamEventClusterer *)self dbScanClusterEvents:v5];
  }
}

- (CLSNowPlayingStreamEventClusterer)initWithClusteringParameters:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLSNowPlayingStreamEventClusterer;
  uint64_t v6 = [(CLSNowPlayingStreamEventClusterer *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_clusteringParameters, a3);
  }

  return v7;
}

- (CLSNowPlayingStreamEventClusterer)init
{
  id v3 = objc_alloc_init(CLSNowPlayingStreamEventClusteringParameters);
  unint64_t v4 = [(CLSNowPlayingStreamEventClusterer *)self initWithClusteringParameters:v3];

  return v4;
}

@end