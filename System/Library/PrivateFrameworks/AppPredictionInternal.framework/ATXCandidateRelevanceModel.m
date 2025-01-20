@interface ATXCandidateRelevanceModel
+ (BOOL)supportsSecureCoding;
- (ATXCandidateRelevanceModel)initWithCoder:(id)a3;
- (float)predictForContext:(id)a3 candidate:(id)a4 featurizationManager:(id)a5;
- (id)featureContributionsDuringInferenceDescriptionForContext:(id)a3 candidate:(id)a4 featurizationManager:(id)a5;
- (id)featureContributionsDuringInferenceForContext:(id)a3 candidate:(id)a4 featurizationManager:(id)a5;
- (id)featureImportanceDescriptionForFeaturizationManager:(id)a3;
- (id)featureImportancesForFeaturizationManager:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXCandidateRelevanceModel

- (float)predictForContext:(id)a3 candidate:(id)a4 featurizationManager:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  __break(1u);
  return result;
}

- (id)featureImportanceDescriptionForFeaturizationManager:(id)a3
{
  id result = a3;
  __break(1u);
  return result;
}

- (id)featureImportancesForFeaturizationManager:(id)a3
{
  id result = a3;
  __break(1u);
  return result;
}

- (id)featureContributionsDuringInferenceForContext:(id)a3 candidate:(id)a4 featurizationManager:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id result = a5;
  __break(1u);
  return result;
}

- (id)featureContributionsDuringInferenceDescriptionForContext:(id)a3 candidate:(id)a4 featurizationManager:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id result = a5;
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v3 = a3;
  __break(1u);
}

- (ATXCandidateRelevanceModel)initWithCoder:(id)a3
{
  id result = (ATXCandidateRelevanceModel *)a3;
  __break(1u);
  return result;
}

@end