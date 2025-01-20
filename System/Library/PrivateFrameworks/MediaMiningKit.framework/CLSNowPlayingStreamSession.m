@interface CLSNowPlayingStreamSession
+ (id)playbackStreamSessionDateSortDescriptors;
- (CLSNowPlayingStreamSession)initWithDataCluster:(id)a3;
- (CLSNowPlayingStreamSession)initWithEvents:(id)a3;
- (NSArray)events;
- (NSDate)localEndDate;
- (NSDate)localStartDate;
- (id)debugDescription;
- (id)description;
- (void)setEvents:(id)a3;
@end

@implementation CLSNowPlayingStreamSession

+ (id)playbackStreamSessionDateSortDescriptors
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"localStartDate" ascending:1];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"localEndDate" ascending:1];
  v6[1] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_localStartDate, 0);
  objc_storeStrong((id *)&self->_localEndDate, 0);
}

- (void)setEvents:(id)a3
{
}

- (NSArray)events
{
  return self->_events;
}

- (NSDate)localStartDate
{
  return self->_localStartDate;
}

- (NSDate)localEndDate
{
  return self->_localEndDate;
}

- (id)debugDescription
{
  v3 = [(CLSNowPlayingStreamSession *)self localEndDate];
  [v3 timeIntervalSince1970];
  double v5 = v4;
  v6 = [(CLSNowPlayingStreamSession *)self localStartDate];
  [v6 timeIntervalSince1970];
  double v8 = (v5 - v7) / 60.0;

  v9 = NSString;
  v10 = [(CLSNowPlayingStreamSession *)self events];
  uint64_t v11 = [v10 count];
  v12 = [(CLSNowPlayingStreamSession *)self localStartDate];
  v13 = [(CLSNowPlayingStreamSession *)self localEndDate];
  v14 = [(CLSNowPlayingStreamSession *)self events];
  v15 = [v9 stringWithFormat:@"Session (%p) number of events: %u - (%@ - %@), %f minutes\nevents: %@", self, v11, v12, v13, *(void *)&v8, v14];

  return v15;
}

- (id)description
{
  v3 = [(CLSNowPlayingStreamSession *)self localEndDate];
  [v3 timeIntervalSince1970];
  double v5 = v4;
  v6 = [(CLSNowPlayingStreamSession *)self localStartDate];
  [v6 timeIntervalSince1970];
  double v8 = (v5 - v7) / 60.0;

  v9 = NSString;
  v10 = [(CLSNowPlayingStreamSession *)self events];
  uint64_t v11 = [v10 count];
  v12 = [(CLSNowPlayingStreamSession *)self localStartDate];
  v13 = [(CLSNowPlayingStreamSession *)self localEndDate];
  v14 = [v9 stringWithFormat:@"Session (%p) number of events: %u - (%@ - %@), %f minutes", self, v11, v12, v13, *(void *)&v8];

  return v14;
}

- (CLSNowPlayingStreamSession)initWithDataCluster:(id)a3
{
  double v4 = [a3 objects];
  double v5 = [(CLSNowPlayingStreamSession *)self initWithEvents:v4];

  return v5;
}

- (CLSNowPlayingStreamSession)initWithEvents:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CLSNowPlayingStreamSession;
  double v5 = [(CLSNowPlayingStreamSession *)&v29 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F1C9C8] distantFuture];
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] distantPast];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v24 = v4;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        uint64_t v12 = 0;
        v13 = v6;
        v14 = (void *)v7;
        do
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v8);
          }
          v15 = *(void **)(*((void *)&v25 + 1) + 8 * v12);
          v16 = [v15 localStartDate];
          v6 = [(NSDate *)v13 earlierDate:v16];

          v17 = [v15 localEndDate];
          uint64_t v7 = [v14 laterDate:v17];

          ++v12;
          v13 = v6;
          v14 = (void *)v7;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v10);
    }

    uint64_t v18 = [v8 sortedArrayUsingComparator:&__block_literal_global_4080];
    events = v5->_events;
    v5->_events = (NSArray *)v18;

    localStartDate = v5->_localStartDate;
    v5->_localStartDate = v6;
    v21 = v6;

    localEndDate = v5->_localEndDate;
    v5->_localEndDate = (NSDate *)v7;

    id v4 = v24;
  }

  return v5;
}

uint64_t __58__CLSNowPlayingStreamSession_DataCluster__initWithEvents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  double v5 = [a2 localStartDate];
  v6 = [v4 localStartDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

@end