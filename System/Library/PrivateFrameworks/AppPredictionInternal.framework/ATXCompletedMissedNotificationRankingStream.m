@interface ATXCompletedMissedNotificationRankingStream
- (ATXCompletedMissedNotificationRankingStream)init;
- (id)initFromMissedNotificationRankingEventBiomeStream:(id)a3;
- (id)publisherFromStartTime:(double)a3;
@end

@implementation ATXCompletedMissedNotificationRankingStream

- (ATXCompletedMissedNotificationRankingStream)init
{
  v3 = objc_opt_new();
  v4 = [(ATXCompletedMissedNotificationRankingStream *)self initFromMissedNotificationRankingEventBiomeStream:v3];

  return v4;
}

- (id)initFromMissedNotificationRankingEventBiomeStream:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXCompletedMissedNotificationRankingStream;
  v6 = [(ATXCompletedMissedNotificationRankingStream *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_rawMNREventStream, a3);
  }

  return v7;
}

- (id)publisherFromStartTime:(double)a3
{
  v3 = [(ATXMissedNotificationRankingBiomeStream *)self->_rawMNREventStream publisherFromStartTime:a3];
  v4 = objc_opt_new();
  id v5 = [v3 scanWithInitial:v4 nextPartialResult:&__block_literal_global_186];
  v6 = [v5 filterWithIsIncluded:&__block_literal_global_63];
  v7 = [v6 mapWithTransform:&__block_literal_global_66_0];

  return v7;
}

_ATXActiveMissedNotificationRankingTuple *__70__ATXCompletedMissedNotificationRankingStream_publisherFromStartTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  v6 = [_ATXActiveMissedNotificationRankingTuple alloc];
  v7 = [v4 eventBody];

  v8 = [(_ATXActiveMissedNotificationRankingTuple *)v6 initWithPreviousTuple:v5 nextRankingEvent:v7];
  return v8;
}

BOOL __70__ATXCompletedMissedNotificationRankingStream_publisherFromStartTime___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 justCompletedRanking];
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __70__ATXCompletedMissedNotificationRankingStream_publisherFromStartTime___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 justCompletedRanking];
}

- (void).cxx_destruct
{
}

@end