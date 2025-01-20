@interface ATXNumericFeatureTimeCosine
- (ATXNumericFeatureTimeCosine)init;
- (id)numericFeatureValueForContext:(id)a3 candidate:(id)a4;
@end

@implementation ATXNumericFeatureTimeCosine

- (ATXNumericFeatureTimeCosine)init
{
  return [(ATXImmutableCandidateRelevanceModelFeaturizer *)self initWithFeatureValueNames:&unk_1F27F39D8];
}

- (id)numericFeatureValueForContext:(id)a3 candidate:(id)a4
{
  v4 = [a3 timeContext];
  v5 = [v4 date];

  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v12 = 0;
  v6 = (void *)MEMORY[0x1E4F1C9A8];
  id v7 = v5;
  v8 = [v6 currentCalendar];
  [v8 getHour:&v14 minute:&v13 second:&v12 nanosecond:0 fromDate:v7];

  unint64_t v9 = 3600 * v14 + 60 * v13 + v12;
  v10 = [NSNumber numberWithDouble:(double)cos((double)v9 * 6.28318531 / 86400.0)];

  return v10;
}

@end