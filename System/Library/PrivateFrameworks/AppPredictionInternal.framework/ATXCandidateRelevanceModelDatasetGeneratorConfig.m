@interface ATXCandidateRelevanceModelDatasetGeneratorConfig
+ (id)candidatePublisher;
+ (id)candidatePublisherWithStartTime:(id)a3 endTime:(id)a4;
@end

@implementation ATXCandidateRelevanceModelDatasetGeneratorConfig

+ (id)candidatePublisher
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-2592000.0];
  v3 = objc_opt_class();
  [v2 timeIntervalSinceReferenceDate];
  v4 = objc_msgSend(v3, "candidatePublisherFromStartTime:");

  return v4;
}

+ (id)candidatePublisherWithStartTime:(id)a3 endTime:(id)a4
{
  id v5 = a3;
  id result = a4;
  __break(1u);
  return result;
}

@end