@interface ATXNumericFeatureAirplaneModeEnabled
- (ATXNumericFeatureAirplaneModeEnabled)init;
- (id)numericFeatureValueForContext:(id)a3 candidate:(id)a4;
@end

@implementation ATXNumericFeatureAirplaneModeEnabled

- (ATXNumericFeatureAirplaneModeEnabled)init
{
  return [(ATXImmutableCandidateRelevanceModelFeaturizer *)self initWithFeatureValueNames:&unk_1F27F3A08];
}

- (id)numericFeatureValueForContext:(id)a3 candidate:(id)a4
{
  v4 = NSNumber;
  v5 = [a3 deviceStateContext];
  v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "inAirplaneMode"));

  return v6;
}

@end