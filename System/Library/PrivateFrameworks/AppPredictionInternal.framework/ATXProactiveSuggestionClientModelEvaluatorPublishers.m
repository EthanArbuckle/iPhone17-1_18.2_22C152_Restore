@interface ATXProactiveSuggestionClientModelEvaluatorPublishers
- (ATXProactiveSuggestionClientModelEvaluatorPublishers)initWithStartTime:(id)a3 endTime:(id)a4;
- (BPSPublisher)clientModelCacheUpdatePublisher;
- (BPSPublisher)shadowCandidatePublisher;
- (BPSPublisher)uiPublisher;
- (NSNumber)endTime;
- (NSNumber)startTime;
@end

@implementation ATXProactiveSuggestionClientModelEvaluatorPublishers

- (ATXProactiveSuggestionClientModelEvaluatorPublishers)initWithStartTime:(id)a3 endTime:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXProactiveSuggestionClientModelEvaluatorPublishers;
  v8 = [(ATXProactiveSuggestionClientModelEvaluatorPublishers *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    startTime = v8->_startTime;
    v8->_startTime = (NSNumber *)v9;

    uint64_t v11 = [v7 copy];
    endTime = v8->_endTime;
    v8->_endTime = (NSNumber *)v11;
  }
  return v8;
}

- (BPSPublisher)shadowCandidatePublisher
{
  v3 = +[ATXCandidateRelevanceModelDatasetGeneratorConfigApp candidatePublisherWithStartTime:self->_startTime endTime:self->_endTime];
  v4 = +[ATXCandidateRelevanceModelDatasetGeneratorConfigMinimalAction candidatePublisherWithStartTime:self->_startTime endTime:self->_endTime];
  v5 = [v3 orderedMergeWithOther:v4 comparator:&__block_literal_global_153];

  return (BPSPublisher *)v5;
}

uint64_t __80__ATXProactiveSuggestionClientModelEvaluatorPublishers_shadowCandidatePublisher__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a3;
  [a2 timestamp];
  id v6 = objc_msgSend(v4, "numberWithDouble:");
  id v7 = NSNumber;
  [v5 timestamp];
  double v9 = v8;

  v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

- (BPSPublisher)uiPublisher
{
  v3 = objc_opt_new();
  v4 = [v3 publisherWithStartTime:self->_startTime endTime:self->_endTime];

  return (BPSPublisher *)v4;
}

- (BPSPublisher)clientModelCacheUpdatePublisher
{
  v3 = objc_opt_new();
  v4 = [v3 publisherWithStartTime:self->_startTime endTime:self->_endTime];

  return (BPSPublisher *)v4;
}

- (NSNumber)startTime
{
  return self->_startTime;
}

- (NSNumber)endTime
{
  return self->_endTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end