@interface ATXAppLaunchBasedInferredActivityBiomeStream
- (ATXAppLaunchBasedInferredActivityBiomeStream)init;
- (ATXAppLaunchBasedInferredActivityBiomeStream)initWithInferredModeSessionStream:(id)a3;
- (id)sessionPublisherFromStartTime:(double)a3;
- (id)transitionPublisherFromStartTime:(double)a3;
@end

@implementation ATXAppLaunchBasedInferredActivityBiomeStream

- (ATXAppLaunchBasedInferredActivityBiomeStream)init
{
  v3 = objc_opt_new();
  v4 = [(ATXAppLaunchBasedInferredActivityBiomeStream *)self initWithInferredModeSessionStream:v3];

  return v4;
}

- (ATXAppLaunchBasedInferredActivityBiomeStream)initWithInferredModeSessionStream:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXAppLaunchBasedInferredActivityBiomeStream;
  v6 = [(ATXAppLaunchBasedInferredActivityBiomeStream *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_modeSessionStream, a3);
  }

  return v7;
}

- (id)sessionPublisherFromStartTime:(double)a3
{
  v3 = [(ATXAppLaunchInferredModeSessionBiomeStream *)self->_modeSessionStream publisherFromStartTime:a3];
  v4 = [v3 mapWithTransform:&__block_literal_global_73];
  id v5 = [v4 mapWithTransform:&__block_literal_global_7];

  return v5;
}

uint64_t __78__ATXAppLaunchBasedInferredActivityBiomeStream_sessionPublisherFromStartTime___block_invoke(uint64_t a1, void *a2)
{
  return [a2 eventBody];
}

id __78__ATXAppLaunchBasedInferredActivityBiomeStream_sessionPublisherFromStartTime___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [ATXUnifiedInferredActivitySession alloc];
  [v2 startTime];
  double v5 = v4;
  [v2 endTime];
  double v7 = v6;
  uint64_t v8 = [v2 inferredActivityType];
  [v2 confidence];
  double v10 = v9;

  id v11 = [(ATXUnifiedInferredActivitySession *)v3 initFromStartTime:@"appLaunchInferredActivity" endTime:v8 source:v5 activityType:v7 confidence:v10];
  return v11;
}

- (id)transitionPublisherFromStartTime:(double)a3
{
  v3 = [(ATXAppLaunchBasedInferredActivityBiomeStream *)self sessionPublisherFromStartTime:a3];
  double v4 = +[_ATXUnifiedActivityStreamConversions transitionPublisherFromSessionPublisher:v3];

  return v4;
}

- (void).cxx_destruct
{
}

@end