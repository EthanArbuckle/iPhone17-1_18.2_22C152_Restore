@interface ATXCandidateRelevanceModelCandidateCacheResult
- (ATXCandidateRelevanceModelCandidateCacheResult)initWithCandidates:(id)a3 featurizationManager:(id)a4;
- (ATXCandidateRelevanceModelFeaturizationManager)featurizationManager;
- (NSArray)candidates;
@end

@implementation ATXCandidateRelevanceModelCandidateCacheResult

- (ATXCandidateRelevanceModelCandidateCacheResult)initWithCandidates:(id)a3 featurizationManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXCandidateRelevanceModelCandidateCacheResult;
  v9 = [(ATXCandidateRelevanceModelCandidateCacheResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_candidates, a3);
    objc_storeStrong((id *)&v10->_featurizationManager, a4);
  }

  return v10;
}

- (NSArray)candidates
{
  return self->_candidates;
}

- (ATXCandidateRelevanceModelFeaturizationManager)featurizationManager
{
  return self->_featurizationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featurizationManager, 0);
  objc_storeStrong((id *)&self->_candidates, 0);
}

@end