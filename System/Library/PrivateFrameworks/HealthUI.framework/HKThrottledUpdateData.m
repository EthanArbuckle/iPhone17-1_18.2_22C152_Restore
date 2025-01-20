@interface HKThrottledUpdateData
- (HKSampleType)throttledSampleType;
- (HKThrottledUpdateData)initWithSampleType:(id)a3;
- (NSHashTable)throttledObservers;
- (NSMutableArray)throttledDeletedObjects;
- (NSMutableArray)throttledSamplesAdded;
- (double)lastDrainTime;
- (int64_t)incomingUpdateCountSinceLastDrain;
- (void)addThrottledObservers:(id)a3 samplesAdded:(id)a4 objectsRemoved:(id)a5;
- (void)clearThrottlingData;
- (void)updateDrainTime;
@end

@implementation HKThrottledUpdateData

- (HKThrottledUpdateData)initWithSampleType:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKThrottledUpdateData;
  v6 = [(HKThrottledUpdateData *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_throttledSampleType, a3);
    v7->_incomingUpdateCountSinceLastDrain = 0;
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:512 capacity:5];
    throttledObservers = v7->_throttledObservers;
    v7->_throttledObservers = (NSHashTable *)v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    throttledSamplesAdded = v7->_throttledSamplesAdded;
    v7->_throttledSamplesAdded = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    throttledDeletedObjects = v7->_throttledDeletedObjects;
    v7->_throttledDeletedObjects = v12;

    v7->_lastDrainTime = CACurrentMediaTime();
  }

  return v7;
}

- (void)addThrottledObservers:(id)a3 samplesAdded:(id)a4 objectsRemoved:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v11 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * v14);
        v16 = [(HKThrottledUpdateData *)self throttledObservers];
        char v17 = [v16 containsObject:v15];

        if ((v17 & 1) == 0)
        {
          v18 = [(HKThrottledUpdateData *)self throttledObservers];
          [v18 addObject:v15];
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }
  v19 = [(HKThrottledUpdateData *)self throttledSamplesAdded];
  [v19 addObjectsFromArray:v9];

  v20 = [(HKThrottledUpdateData *)self throttledDeletedObjects];
  [v20 addObjectsFromArray:v10];

  ++self->_incomingUpdateCountSinceLastDrain;
}

- (void)clearThrottlingData
{
  v3 = [(HKThrottledUpdateData *)self throttledObservers];
  [v3 removeAllObjects];

  v4 = [(HKThrottledUpdateData *)self throttledSamplesAdded];
  [v4 removeAllObjects];

  id v5 = [(HKThrottledUpdateData *)self throttledDeletedObjects];
  [v5 removeAllObjects];
}

- (void)updateDrainTime
{
  self->_lastDrainTime = CACurrentMediaTime();
  self->_incomingUpdateCountSinceLastDrain = 0;
}

- (HKSampleType)throttledSampleType
{
  return self->_throttledSampleType;
}

- (int64_t)incomingUpdateCountSinceLastDrain
{
  return self->_incomingUpdateCountSinceLastDrain;
}

- (NSHashTable)throttledObservers
{
  return self->_throttledObservers;
}

- (NSMutableArray)throttledSamplesAdded
{
  return self->_throttledSamplesAdded;
}

- (NSMutableArray)throttledDeletedObjects
{
  return self->_throttledDeletedObjects;
}

- (double)lastDrainTime
{
  return self->_lastDrainTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throttledDeletedObjects, 0);
  objc_storeStrong((id *)&self->_throttledSamplesAdded, 0);
  objc_storeStrong((id *)&self->_throttledObservers, 0);
  objc_storeStrong((id *)&self->_throttledSampleType, 0);
}

@end