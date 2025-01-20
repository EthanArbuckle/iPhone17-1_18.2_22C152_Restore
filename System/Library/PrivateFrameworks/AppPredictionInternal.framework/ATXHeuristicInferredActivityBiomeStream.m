@interface ATXHeuristicInferredActivityBiomeStream
- (ATXHeuristicInferredActivityBiomeStream)init;
- (id)_transitionPublisherFromInferredModePublisher:(id)a3;
- (id)initFromInferredModeStream:(id)a3;
- (id)sessionPublisherFromStartTime:(double)a3;
- (id)transitionPublisherFromStartTime:(double)a3;
- (id)transitionPublisherFromStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 lastN:(id)a6 reversed:(BOOL)a7;
@end

@implementation ATXHeuristicInferredActivityBiomeStream

- (ATXHeuristicInferredActivityBiomeStream)init
{
  v3 = BiomeLibrary();
  v4 = [v3 UserFocus];
  v5 = [v4 InferredMode];
  v6 = [(ATXHeuristicInferredActivityBiomeStream *)self initFromInferredModeStream:v5];

  return v6;
}

- (id)initFromInferredModeStream:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXHeuristicInferredActivityBiomeStream;
  v6 = [(ATXHeuristicInferredActivityBiomeStream *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_heuristicEventBiomeStream, a3);
  }

  return v7;
}

- (id)_transitionPublisherFromInferredModePublisher:(id)a3
{
  return (id)[a3 mapWithTransform:&__block_literal_global_24];
}

id __89__ATXHeuristicInferredActivityBiomeStream__transitionPublisherFromInferredModePublisher___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBody];
  [v2 modeType];
  uint64_t v3 = BMUserFocusInferredModeTypeToActivity();
  if (v3 == 14) {
    double v4 = 0.0;
  }
  else {
    double v4 = 1.0;
  }
  id v5 = [ATXUnifiedInferredActivityTransition alloc];
  v6 = [v2 absoluteTimestamp];
  [v6 timeIntervalSinceReferenceDate];
  id v8 = -[ATXUnifiedInferredActivityTransition initFromTransitionTime:isEntryEvent:source:activityType:confidence:](v5, "initFromTransitionTime:isEntryEvent:source:activityType:confidence:", [v2 isStart], @"heuristicInferredActivity", v3, v7, v4);

  return v8;
}

- (id)sessionPublisherFromStartTime:(double)a3
{
  uint64_t v3 = [(ATXHeuristicInferredActivityBiomeStream *)self transitionPublisherFromStartTime:a3];
  double v4 = +[_ATXUnifiedActivityStreamConversions sessionPublisherFromTransitionPublisher:v3];

  return v4;
}

- (id)transitionPublisherFromStartTime:(double)a3
{
  heuristicEventBiomeStream = self->_heuristicEventBiomeStream;
  id v5 = [NSNumber numberWithDouble:a3];
  v6 = [(BMStream *)heuristicEventBiomeStream atx_publisherFromStartTime:v5];
  double v7 = [(ATXHeuristicInferredActivityBiomeStream *)self _transitionPublisherFromInferredModePublisher:v6];

  return v7;
}

- (id)transitionPublisherFromStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 lastN:(id)a6 reversed:(BOOL)a7
{
  id v8 = [(BMStream *)self->_heuristicEventBiomeStream atx_publisherWithStartTime:a3 endTime:a4 maxEvents:a5 lastN:a6 reversed:a7];
  objc_super v9 = [(ATXHeuristicInferredActivityBiomeStream *)self _transitionPublisherFromInferredModePublisher:v8];

  return v9;
}

- (void).cxx_destruct
{
}

@end