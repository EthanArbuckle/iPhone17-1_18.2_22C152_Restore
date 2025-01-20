@interface ATXNumericFeatureCandidateBluetoothDisconnectedInLastThirtyMinutes
- (ATXNumericFeatureCandidateBluetoothDisconnectedInLastThirtyMinutes)init;
- (id)numericFeatureValueForContext:(id)a3 candidate:(id)a4;
@end

@implementation ATXNumericFeatureCandidateBluetoothDisconnectedInLastThirtyMinutes

- (ATXNumericFeatureCandidateBluetoothDisconnectedInLastThirtyMinutes)init
{
  return [(ATXImmutableCandidateRelevanceModelFeaturizer *)self initWithFeatureValueNames:&unk_1F27F3B10];
}

- (id)numericFeatureValueForContext:(id)a3 candidate:(id)a4
{
  id v4 = a3;
  v5 = [v4 bluetoothEvent];
  if (v5)
  {
    v6 = [v4 timeContext];
    v7 = [v6 date];
    v8 = [v5 endDate];
    [v7 timeIntervalSinceDate:v8];
    double v10 = v9;

    v11 = NSNumber;
    uint64_t v12 = [v5 bluetoothState];
    BOOL v14 = v10 > 0.0 && v12 == 1;
    BOOL v15 = v10 <= 1800.0 && v14;
    v16 = [v11 numberWithInt:v15];
  }
  else
  {
    v16 = &unk_1F27F2AC0;
  }

  return v16;
}

@end