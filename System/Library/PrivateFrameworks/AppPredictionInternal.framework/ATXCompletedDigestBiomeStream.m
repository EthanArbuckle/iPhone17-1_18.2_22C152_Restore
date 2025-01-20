@interface ATXCompletedDigestBiomeStream
- (ATXCompletedDigestBiomeStream)init;
- (id)initFromDigestEventBiomeStream:(id)a3;
- (id)publisherFromStartTime:(double)a3;
@end

@implementation ATXCompletedDigestBiomeStream

- (ATXCompletedDigestBiomeStream)init
{
  v3 = objc_opt_new();
  v4 = [(ATXCompletedDigestBiomeStream *)self initFromDigestEventBiomeStream:v3];

  return v4;
}

- (id)initFromDigestEventBiomeStream:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXCompletedDigestBiomeStream;
  v6 = [(ATXCompletedDigestBiomeStream *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_rawDigestEventStream, a3);
  }

  return v7;
}

- (id)publisherFromStartTime:(double)a3
{
  v3 = [(ATXUserNotificationDigestBiomeStream *)self->_rawDigestEventStream publisherFromStartTime:a3];
  v4 = objc_opt_new();
  id v5 = [v3 scanWithInitial:v4 nextPartialResult:&__block_literal_global_111];
  v6 = [v5 filterWithIsIncluded:&__block_literal_global_67];
  v7 = [v6 mapWithTransform:&__block_literal_global_70];

  return v7;
}

_ATXActiveDigestsTuple *__56__ATXCompletedDigestBiomeStream_publisherFromStartTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  v6 = [_ATXActiveDigestsTuple alloc];
  v7 = [v4 eventBody];

  v8 = [(_ATXActiveDigestsTuple *)v6 initWithPreviousTuple:v5 nextDigestEvent:v7];
  return v8;
}

BOOL __56__ATXCompletedDigestBiomeStream_publisherFromStartTime___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 justCompletedDigest];
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __56__ATXCompletedDigestBiomeStream_publisherFromStartTime___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 justCompletedDigest];
}

- (void).cxx_destruct
{
}

@end