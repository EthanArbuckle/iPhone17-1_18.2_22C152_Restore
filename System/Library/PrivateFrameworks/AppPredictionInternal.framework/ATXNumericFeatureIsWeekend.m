@interface ATXNumericFeatureIsWeekend
- (ATXNumericFeatureIsWeekend)init;
- (id)numericFeatureValueForContext:(id)a3 candidate:(id)a4;
@end

@implementation ATXNumericFeatureIsWeekend

- (ATXNumericFeatureIsWeekend)init
{
  return [(ATXImmutableCandidateRelevanceModelFeaturizer *)self initWithFeatureValueNames:&unk_1F27F3A20];
}

- (id)numericFeatureValueForContext:(id)a3 candidate:(id)a4
{
  v4 = NSNumber;
  v5 = [a3 timeContext];
  v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "dateInWeekend"));

  return v6;
}

@end