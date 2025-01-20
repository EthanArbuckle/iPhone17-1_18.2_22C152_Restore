@interface CLSNowPlayingStreamEvent
+ (id)playbackStreamEventDateSortDescriptors;
- (CLSNowPlayingStreamEvent)initWithDuetKnowledgeEvent:(id)a3;
- (CLSNowPlayingStreamEventMetadata)metadata;
- (NSDate)localEndDate;
- (NSDate)localStartDate;
- (id)description;
@end

@implementation CLSNowPlayingStreamEvent

+ (id)playbackStreamEventDateSortDescriptors
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
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_localEndDate, 0);
  objc_storeStrong((id *)&self->_localStartDate, 0);
}

- (CLSNowPlayingStreamEventMetadata)metadata
{
  return self->_metadata;
}

- (NSDate)localEndDate
{
  return self->_localEndDate;
}

- (NSDate)localStartDate
{
  return self->_localStartDate;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28C18]);
  v4 = [(CLSNowPlayingStreamEvent *)self localStartDate];
  v5 = [(CLSNowPlayingStreamEvent *)self localEndDate];
  v6 = (void *)[v3 initWithStartDate:v4 endDate:v5];

  [v6 duration];
  v7 = NSString;
  double v9 = v8 / 60.0;
  v10 = [(CLSNowPlayingStreamEvent *)self metadata];
  v11 = [(CLSNowPlayingStreamEvent *)self localStartDate];
  v12 = [(CLSNowPlayingStreamEvent *)self localEndDate];
  v13 = [v7 stringWithFormat:@"(%p) metadata: %@, (%@ - %@), duration: %f minutes", self, v10, v11, v12, *(void *)&v9];

  return v13;
}

- (CLSNowPlayingStreamEvent)initWithDuetKnowledgeEvent:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CLSNowPlayingStreamEvent;
  v5 = [(CLSNowPlayingStreamEvent *)&v16 init];
  if (v5)
  {
    v6 = [[CLSNowPlayingStreamEventMetadata alloc] initWithDuetKnowledgeEvent:v4];
    metadata = v5->_metadata;
    v5->_metadata = v6;

    double v8 = [v4 startDate];
    double v9 = [v4 endDate];
    v10 = [v4 timeZone];
    uint64_t v11 = +[CLSCalendar localDateFromUniversalDate:v8 inTimeZone:v10];
    localStartDate = v5->_localStartDate;
    v5->_localStartDate = (NSDate *)v11;

    uint64_t v13 = +[CLSCalendar localDateFromUniversalDate:v9 inTimeZone:v10];
    localEndDate = v5->_localEndDate;
    v5->_localEndDate = (NSDate *)v13;
  }
  return v5;
}

@end