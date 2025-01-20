@interface HDCyclingDistanceDataAggregator
- (HDCyclingDistanceDataAggregator)initWithDataCollectionManager:(id)a3;
- (id)additionalMetadataForCollector:(id)a3;
@end

@implementation HDCyclingDistanceDataAggregator

- (HDCyclingDistanceDataAggregator)initWithDataCollectionManager:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7B0]];
  v10.receiver = self;
  v10.super_class = (Class)HDCyclingDistanceDataAggregator;
  v6 = [(HDActiveQuantityDataAggregator *)&v10 initForQuantityType:v5 dataCollectionManager:v4];
  if (v6)
  {
    v7 = [v4 profile];
    v8 = [v7 workoutManager];
    objc_storeWeak((id *)&v6->_workoutManager, v8);
  }
  return v6;
}

- (id)additionalMetadataForCollector:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 sourceForDataAggregator:self];
  v6 = [v5 bundleIdentifier];
  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F2BCF0]];

  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_workoutManager);
    v9 = [WeakRetained currentWorkoutConfiguration];

    if ([v9 activityType] == 13 && objc_msgSend(v9, "locationType") == 2)
    {
      uint64_t v13 = *MEMORY[0x1E4F2A178];
      v14[0] = MEMORY[0x1E4F1CC38];
      objc_super v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];

      goto LABEL_7;
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)HDCyclingDistanceDataAggregator;
  objc_super v10 = [(HDActiveQuantityDataAggregator *)&v12 additionalMetadataForCollector:v4];
LABEL_7:

  return v10;
}

- (void).cxx_destruct
{
}

@end