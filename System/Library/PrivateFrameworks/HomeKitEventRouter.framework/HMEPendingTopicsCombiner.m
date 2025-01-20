@interface HMEPendingTopicsCombiner
- (HMEPendingTopicsCombiner)init;
- (NSArray)topicFiltersToAdd;
- (NSArray)topicFiltersToRemove;
- (NSMutableSet)addTopicFilters;
- (NSMutableSet)removeTopicFilters;
- (void)combineOntoPreviousAdditions:(id)a3 removals:(id)a4;
- (void)combineWithAdditions:(id)a3 removals:(id)a4;
- (void)reset;
- (void)setAddTopicFilters:(id)a3;
- (void)setRemoveTopicFilters:(id)a3;
@end

@implementation HMEPendingTopicsCombiner

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removeTopicFilters, 0);
  objc_storeStrong((id *)&self->_addTopicFilters, 0);
}

- (void)setRemoveTopicFilters:(id)a3
{
}

- (NSMutableSet)removeTopicFilters
{
  return (NSMutableSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAddTopicFilters:(id)a3
{
}

- (NSMutableSet)addTopicFilters
{
  return (NSMutableSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)reset
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  [(HMEPendingTopicsCombiner *)self setAddTopicFilters:v3];

  id v4 = [MEMORY[0x1E4F1CA80] set];
  [(HMEPendingTopicsCombiner *)self setRemoveTopicFilters:v4];
}

- (NSArray)topicFiltersToRemove
{
  v2 = [(HMEPendingTopicsCombiner *)self removeTopicFilters];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (NSArray)topicFiltersToAdd
{
  v2 = [(HMEPendingTopicsCombiner *)self addTopicFilters];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)combineOntoPreviousAdditions:(id)a3 removals:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = [(HMEPendingTopicsCombiner *)self topicFiltersToAdd];
  v8 = [(HMEPendingTopicsCombiner *)self topicFiltersToRemove];
  v9 = [MEMORY[0x1E4F1CA80] setWithArray:v7];

  [(HMEPendingTopicsCombiner *)self setAddTopicFilters:v9];
  v10 = [MEMORY[0x1E4F1CA80] setWithArray:v6];

  [(HMEPendingTopicsCombiner *)self setRemoveTopicFilters:v10];
  [(HMEPendingTopicsCombiner *)self combineWithAdditions:v11 removals:v8];
}

- (void)combineWithAdditions:(id)a3 removals:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        v13 = [(HMEPendingTopicsCombiner *)self addTopicFilters];
        int v14 = [v13 containsObject:v12];

        if (v14)
        {
          v15 = [(HMEPendingTopicsCombiner *)self addTopicFilters];
          [v15 removeObject:v12];
        }
        else
        {
          v15 = [(HMEPendingTopicsCombiner *)self removeTopicFilters];
          [v15 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v9);
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v16 = v6;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8 * j);
        v22 = [(HMEPendingTopicsCombiner *)self removeTopicFilters];
        int v23 = [v22 containsObject:v21];

        if (v23)
        {
          v24 = [(HMEPendingTopicsCombiner *)self removeTopicFilters];
          [v24 removeObject:v21];
        }
        else
        {
          v24 = [(HMEPendingTopicsCombiner *)self addTopicFilters];
          [v24 addObject:v21];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v18);
  }
}

- (HMEPendingTopicsCombiner)init
{
  v8.receiver = self;
  v8.super_class = (Class)HMEPendingTopicsCombiner;
  v2 = [(HMEPendingTopicsCombiner *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    addTopicFilters = v2->_addTopicFilters;
    v2->_addTopicFilters = (NSMutableSet *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    removeTopicFilters = v2->_removeTopicFilters;
    v2->_removeTopicFilters = (NSMutableSet *)v5;
  }
  return v2;
}

@end