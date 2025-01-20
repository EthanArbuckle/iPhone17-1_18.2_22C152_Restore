@interface ATXCandidateRelevanceModelNumericFeaturizer
- (id)featureVectorForContext:(id)a3 candidate:(id)a4;
- (id)numericFeatureValueForContext:(id)a3 candidate:(id)a4;
- (unint64_t)dimensions;
@end

@implementation ATXCandidateRelevanceModelNumericFeaturizer

- (id)featureVectorForContext:(id)a3 candidate:(id)a4
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v4 = [(ATXCandidateRelevanceModelNumericFeaturizer *)self numericFeatureValueForContext:a3 candidate:a4];
  v7[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

  return v5;
}

- (unint64_t)dimensions
{
  return 1;
}

- (id)numericFeatureValueForContext:(id)a3 candidate:(id)a4
{
  id v5 = a3;
  id result = a4;
  __break(1u);
  return result;
}

@end