@interface ATXNumericFeatureCandidateBluetoothConnectedInLastThirtyMinutes
- (ATXNumericFeatureCandidateBluetoothConnectedInLastThirtyMinutes)init;
- (id)numericFeatureValueForContext:(id)a3 candidate:(id)a4;
@end

@implementation ATXNumericFeatureCandidateBluetoothConnectedInLastThirtyMinutes

- (ATXNumericFeatureCandidateBluetoothConnectedInLastThirtyMinutes)init
{
  return [(ATXImmutableCandidateRelevanceModelFeaturizer *)self initWithFeatureValueNames:&unk_1F27F3AF8];
}

- (id)numericFeatureValueForContext:(id)a3 candidate:(id)a4
{
  id v4 = a3;
  v5 = [v4 bluetoothEvent];
  if (v5)
  {
    v6 = [v4 timeContext];
    v7 = [v6 date];
    v8 = [v5 startDate];
    [v7 timeIntervalSinceDate:v8];
    double v10 = v9;

    v11 = [v5 endDate];
    v12 = [v4 timeContext];
    v13 = [v12 date];
    [v11 timeIntervalSinceDate:v13];
    double v15 = v14;

    v16 = NSNumber;
    if ([v5 bluetoothState] == 1)
    {
      BOOL v17 = v15 >= 0.0 && v10 >= 0.0;
      BOOL v18 = v10 <= 1800.0 && v17;
    }
    else
    {
      BOOL v18 = 0;
    }
    v19 = [v16 numberWithInt:v18];
  }
  else
  {
    v19 = &unk_1F27F2AC0;
  }

  return v19;
}

@end