@interface ATXNumericFeatureCandidateBluetoothConnected
- (ATXNumericFeatureCandidateBluetoothConnected)init;
- (id)numericFeatureValueForContext:(id)a3 candidate:(id)a4;
@end

@implementation ATXNumericFeatureCandidateBluetoothConnected

- (ATXNumericFeatureCandidateBluetoothConnected)init
{
  return [(ATXImmutableCandidateRelevanceModelFeaturizer *)self initWithFeatureValueNames:&unk_1F27F3AE0];
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
    uint64_t v17 = [v5 bluetoothState];
    BOOL v19 = v10 >= 0.0 && v17 == 1;
    BOOL v20 = v15 >= 0.0 && v19;
    v21 = [v16 numberWithInt:v20];
  }
  else
  {
    v21 = &unk_1F27F2AC0;
  }

  return v21;
}

@end