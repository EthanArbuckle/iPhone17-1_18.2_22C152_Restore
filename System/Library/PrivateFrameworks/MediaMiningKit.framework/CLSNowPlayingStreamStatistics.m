@interface CLSNowPlayingStreamStatistics
- (CLSNowPlayingStreamStatistics)initWithNowPlayingStreamSessions:(id)a3;
- (NSArray)sortedAlbums;
- (NSArray)sortedArtists;
- (NSArray)sortedGenres;
- (NSArray)sortedSessions;
- (NSArray)sortedSources;
- (NSArray)sortedTitles;
- (double)maxDurationInSeconds;
- (double)minDurationInSeconds;
- (void)computeStatistics;
- (void)logStatistics;
@end

@implementation CLSNowPlayingStreamStatistics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedSessions, 0);
  objc_storeStrong((id *)&self->_sortedSources, 0);
  objc_storeStrong((id *)&self->_sortedGenres, 0);
  objc_storeStrong((id *)&self->_sortedTitles, 0);
  objc_storeStrong((id *)&self->_sortedArtists, 0);
  objc_storeStrong((id *)&self->_sortedAlbums, 0);
}

- (double)minDurationInSeconds
{
  return self->_minDurationInSeconds;
}

- (double)maxDurationInSeconds
{
  return self->_maxDurationInSeconds;
}

- (NSArray)sortedSessions
{
  return self->_sortedSessions;
}

- (NSArray)sortedSources
{
  return self->_sortedSources;
}

- (NSArray)sortedGenres
{
  return self->_sortedGenres;
}

- (NSArray)sortedTitles
{
  return self->_sortedTitles;
}

- (NSArray)sortedArtists
{
  return self->_sortedArtists;
}

- (NSArray)sortedAlbums
{
  return self->_sortedAlbums;
}

- (void)logStatistics
{
  statsPrint(@"\n", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v23);
  v9 = [(CLSNowPlayingStreamStatistics *)self sortedGenres];
  __46__CLSNowPlayingStreamStatistics_logStatistics__block_invoke(v9, @"genres");

  v10 = [(CLSNowPlayingStreamStatistics *)self sortedArtists];
  __46__CLSNowPlayingStreamStatistics_logStatistics__block_invoke(v10, @"artists");

  v11 = [(CLSNowPlayingStreamStatistics *)self sortedAlbums];
  __46__CLSNowPlayingStreamStatistics_logStatistics__block_invoke(v11, @"albums");

  v12 = [(CLSNowPlayingStreamStatistics *)self sortedTitles];
  __46__CLSNowPlayingStreamStatistics_logStatistics__block_invoke(v12, @"songs");

  v13 = [(CLSNowPlayingStreamStatistics *)self sortedSources];
  __46__CLSNowPlayingStreamStatistics_logStatistics__block_invoke(v13, @"sources");

  v14 = (void *)MEMORY[0x1E4F28ED0];
  [(CLSNowPlayingStreamStatistics *)self maxDurationInSeconds];
  objc_msgSend(v14, "numberWithDouble:");
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E4F28ED0];
  [(CLSNowPlayingStreamStatistics *)self minDurationInSeconds];
  v24 = objc_msgSend(v15, "numberWithDouble:");
  statsPrint(@"max duration (seconds): %@ - min duration (seconds): %@\n", v16, v17, v18, v19, v20, v21, v22, (uint64_t)v25);
}

void __46__CLSNowPlayingStreamStatistics_logStatistics__block_invoke(void *a1, void *a2)
{
  id v24 = a1;
  id v3 = a2;
  uint64_t v4 = 20;
  uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:20];
  statsPrint(@"Top %@ %@...", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  if ((unint64_t)[v24 count] <= 0x14) {
    uint64_t v4 = [v24 count];
  }
  uint64_t v20 = [MEMORY[0x1E4F28E78] string];
  if (v4)
  {
    for (unint64_t i = 0; i != v4; ++i)
    {
      uint64_t v22 = [v24 objectAtIndexedSubscript:i];
      uint64_t v23 = [v22 description];
      [v20 appendString:v23];

      if (i < v4 - 1) {
        [v20 appendString:@"\n"];
      }
    }
  }
  statsPrint(@"%@\n", v13, v14, v15, v16, v17, v18, v19, (uint64_t)v20);
}

- (void)computeStatistics
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28BD0] set];
  v41 = [MEMORY[0x1E4F28BD0] set];
  v40 = [MEMORY[0x1E4F28BD0] set];
  uint64_t v4 = [MEMORY[0x1E4F28BD0] set];
  v39 = [MEMORY[0x1E4F28BD0] set];
  *(_OWORD *)&self->_maxDurationInSeconds = xmmword_1D21C51D0;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = [(CLSNowPlayingStreamStatistics *)self sortedSessions];
  uint64_t v37 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v47;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v47 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v38 = v5;
        uint64_t v6 = [*(id *)(*((void *)&v46 + 1) + 8 * v5) events];
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v42 objects:v50 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v43;
          do
          {
            uint64_t v10 = 0;
            do
            {
              if (*(void *)v43 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = [*(id *)(*((void *)&v42 + 1) + 8 * v10) metadata];
              uint64_t v12 = [v11 album];

              if (v12)
              {
                uint64_t v13 = [v11 album];
                [v3 addObject:v13];
              }
              uint64_t v14 = [v11 artist];

              if (v14)
              {
                uint64_t v15 = [v11 artist];
                [v41 addObject:v15];
              }
              uint64_t v16 = [v11 title];

              if (v16)
              {
                uint64_t v17 = [v11 title];
                [v40 addObject:v17];
              }
              uint64_t v18 = [v11 genres];
              uint64_t v19 = [v18 allObjects];
              [v4 addObjectsFromArray:v19];

              uint64_t v20 = [v11 source];

              if (v20)
              {
                uint64_t v21 = [v11 source];
                [v39 addObject:v21];
              }
              uint64_t v22 = [v11 durationInSeconds];
              [v22 doubleValue];
              double v24 = v23;

              if (v24 > self->_maxDurationInSeconds) {
                self->_maxDurationInSeconds = v24;
              }
              if (v24 < self->_minDurationInSeconds) {
                self->_minDurationInSeconds = v24;
              }

              ++v10;
            }
            while (v8 != v10);
            uint64_t v8 = [v6 countByEnumeratingWithState:&v42 objects:v50 count:16];
          }
          while (v8);
        }

        uint64_t v5 = v38 + 1;
      }
      while (v38 + 1 != v37);
      uint64_t v37 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v37);
  }

  __50__CLSNowPlayingStreamStatistics_computeStatistics__block_invoke(v3);
  id v25 = (NSArray *)objc_claimAutoreleasedReturnValue();
  sortedAlbums = self->_sortedAlbums;
  self->_sortedAlbums = v25;

  __50__CLSNowPlayingStreamStatistics_computeStatistics__block_invoke(v41);
  v27 = (NSArray *)objc_claimAutoreleasedReturnValue();
  sortedArtists = self->_sortedArtists;
  self->_sortedArtists = v27;

  __50__CLSNowPlayingStreamStatistics_computeStatistics__block_invoke(v40);
  v29 = (NSArray *)objc_claimAutoreleasedReturnValue();
  sortedTitles = self->_sortedTitles;
  self->_sortedTitles = v29;

  __50__CLSNowPlayingStreamStatistics_computeStatistics__block_invoke(v4);
  v31 = (NSArray *)objc_claimAutoreleasedReturnValue();
  sortedGenres = self->_sortedGenres;
  self->_sortedGenres = v31;

  __50__CLSNowPlayingStreamStatistics_computeStatistics__block_invoke(v39);
  v33 = (NSArray *)objc_claimAutoreleasedReturnValue();
  sortedSources = self->_sortedSources;
  self->_sortedSources = v33;
}

id __50__CLSNowPlayingStreamStatistics_computeStatistics__block_invoke(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 allObjects];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__CLSNowPlayingStreamStatistics_computeStatistics__block_invoke_2;
  v6[3] = &unk_1E690FA60;
  id v7 = v1;
  id v3 = v1;
  uint64_t v4 = [v2 sortedArrayUsingComparator:v6];

  return v4;
}

uint64_t __50__CLSNowPlayingStreamStatistics_computeStatistics__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  unint64_t v7 = [v5 countForObject:a2];
  unint64_t v8 = [*(id *)(a1 + 32) countForObject:v6];

  uint64_t v9 = 1;
  if (v7 >= v8) {
    uint64_t v9 = -1;
  }
  if (v7 == v8) {
    return 0;
  }
  else {
    return v9;
  }
}

- (CLSNowPlayingStreamStatistics)initWithNowPlayingStreamSessions:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CLSNowPlayingStreamStatistics;
  uint64_t v5 = [(CLSNowPlayingStreamStatistics *)&v10 init];
  if (v5)
  {
    id v6 = +[CLSNowPlayingStreamSession playbackStreamSessionDateSortDescriptors];
    uint64_t v7 = [v4 sortedArrayUsingDescriptors:v6];
    sortedSessions = v5->_sortedSessions;
    v5->_sortedSessions = (NSArray *)v7;
  }
  return v5;
}

@end