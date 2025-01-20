@interface ATXUserFocusComputedActivityBiomeStream
- (ATXUserFocusComputedActivityBiomeStream)init;
- (id)_transitionPublisherFromComputedModeStreamPublisher:(id)a3;
- (id)initFromUserFocusComputedModeStream:(id)a3;
- (id)sessionPublisherFromStartTime:(double)a3;
- (id)transitionPublisherFromStartTime:(double)a3;
- (id)transitionPublisherFromStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 lastN:(id)a6 reversed:(BOOL)a7;
@end

@implementation ATXUserFocusComputedActivityBiomeStream

- (ATXUserFocusComputedActivityBiomeStream)init
{
  v3 = BiomeLibrary();
  v4 = [v3 UserFocus];
  v5 = [v4 ComputedMode];
  v6 = [(ATXUserFocusComputedActivityBiomeStream *)self initFromUserFocusComputedModeStream:v5];

  return v6;
}

- (id)initFromUserFocusComputedModeStream:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXUserFocusComputedActivityBiomeStream;
  v6 = [(ATXUserFocusComputedActivityBiomeStream *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_computedModeStream, a3);
  }

  return v7;
}

- (id)_transitionPublisherFromComputedModeStreamPublisher:(id)a3
{
  v3 = [a3 filterWithIsIncluded:&__block_literal_global_170];
  v4 = [v3 mapWithTransform:&__block_literal_global_7_0];

  return v4;
}

BOOL __95__ATXUserFocusComputedActivityBiomeStream__transitionPublisherFromComputedModeStreamPublisher___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBody];
  BOOL v3 = v2 != 0;

  return v3;
}

id __95__ATXUserFocusComputedActivityBiomeStream__transitionPublisherFromComputedModeStreamPublisher___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 eventBody];
  [v3 semanticType];
  BMUserFocusInferredModeTypeFromBMUserFocusModeComputedSemanticType();
  uint64_t v4 = BMUserFocusInferredModeTypeToActivity();
  if (v4 == 14) {
    double v5 = 0.0;
  }
  else {
    double v5 = 1.0;
  }
  v6 = [ATXUnifiedInferredActivityTransition alloc];
  [v2 timestamp];
  double v8 = v7;

  id v9 = -[ATXUnifiedInferredActivityTransition initFromTransitionTime:isEntryEvent:source:activityType:confidence:](v6, "initFromTransitionTime:isEntryEvent:source:activityType:confidence:", [v3 starting], @"computedModeActivity", v4, v8, v5);
  return v9;
}

- (id)sessionPublisherFromStartTime:(double)a3
{
  BOOL v3 = [(ATXUserFocusComputedActivityBiomeStream *)self transitionPublisherFromStartTime:a3];
  uint64_t v4 = +[_ATXUnifiedActivityStreamConversions sessionPublisherFromTransitionPublisher:v3];

  return v4;
}

- (id)transitionPublisherFromStartTime:(double)a3
{
  computedModeStream = self->_computedModeStream;
  double v5 = [NSNumber numberWithDouble:a3];
  v6 = [(BMStream *)computedModeStream atx_publisherFromStartTime:v5];
  double v7 = [(ATXUserFocusComputedActivityBiomeStream *)self _transitionPublisherFromComputedModeStreamPublisher:v6];

  return v7;
}

- (id)transitionPublisherFromStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 lastN:(id)a6 reversed:(BOOL)a7
{
  double v8 = [(BMStream *)self->_computedModeStream atx_publisherWithStartTime:a3 endTime:a4 maxEvents:a5 lastN:a6 reversed:a7];
  id v9 = [(ATXUserFocusComputedActivityBiomeStream *)self _transitionPublisherFromComputedModeStreamPublisher:v8];

  return v9;
}

- (void).cxx_destruct
{
}

@end