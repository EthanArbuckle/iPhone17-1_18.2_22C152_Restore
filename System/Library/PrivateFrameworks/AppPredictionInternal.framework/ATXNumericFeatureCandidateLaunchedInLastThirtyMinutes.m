@interface ATXNumericFeatureCandidateLaunchedInLastThirtyMinutes
- (ATXNumericFeatureCandidateLaunchedInLastThirtyMinutes)init;
- (id)numericFeatureValueForContext:(id)a3 candidate:(id)a4;
@end

@implementation ATXNumericFeatureCandidateLaunchedInLastThirtyMinutes

- (ATXNumericFeatureCandidateLaunchedInLastThirtyMinutes)init
{
  return [(ATXImmutableCandidateRelevanceModelFeaturizer *)self initWithFeatureValueNames:&unk_1F27F3A50];
}

- (id)numericFeatureValueForContext:(id)a3 candidate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 candidateIdentifiersLaunchAge];
  v8 = [v6 identifier];

  v9 = [v7 objectForKeyedSubscript:v8];

  if (v9
    && ([v5 timeContext],
        v10 = objc_claimAutoreleasedReturnValue(),
        [v10 date],
        v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    v12 = [v5 timeContext];
    v13 = [v12 date];
    [v13 timeIntervalSinceDate:v9];
    double v15 = v14;

    BOOL v16 = v15 <= 1800.0 && v15 > 0.0;
    v17 = [NSNumber numberWithInt:v16];
  }
  else
  {
    v17 = &unk_1F27F2AC0;
  }

  return v17;
}

@end