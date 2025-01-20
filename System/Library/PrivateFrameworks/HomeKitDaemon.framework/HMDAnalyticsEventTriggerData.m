@interface HMDAnalyticsEventTriggerData
- (BOOL)containsRecurrences;
- (BOOL)executeOnce;
- (HMDAnalyticsEventTriggerData)initWithEventTrigger:(id)a3 isAdding:(BOOL)a4;
- (HMDAnalyticsPredicateData)predicate;
- (NSArray)events;
- (int)activationState;
- (int)activationType;
- (void)setActivationState:(int)a3;
- (void)setActivationType:(int)a3;
- (void)setContainsRecurrences:(BOOL)a3;
- (void)setEvents:(id)a3;
- (void)setExecuteOnce:(BOOL)a3;
- (void)setPredicate:(id)a3;
@end

@implementation HMDAnalyticsEventTriggerData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

- (void)setExecuteOnce:(BOOL)a3
{
  self->_executeOnce = a3;
}

- (BOOL)executeOnce
{
  return self->_executeOnce;
}

- (void)setContainsRecurrences:(BOOL)a3
{
  self->_containsRecurrences = a3;
}

- (BOOL)containsRecurrences
{
  return self->_containsRecurrences;
}

- (void)setPredicate:(id)a3
{
}

- (HMDAnalyticsPredicateData)predicate
{
  return self->_predicate;
}

- (void)setEvents:(id)a3
{
}

- (NSArray)events
{
  return self->_events;
}

- (void)setActivationType:(int)a3
{
  self->_activationType = a3;
}

- (int)activationType
{
  return self->_activationType;
}

- (void)setActivationState:(int)a3
{
  self->_activationState = a3;
}

- (int)activationState
{
  return self->_activationState;
}

- (HMDAnalyticsEventTriggerData)initWithEventTrigger:(id)a3 isAdding:(BOOL)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v30.receiver = self;
  v30.super_class = (Class)HMDAnalyticsEventTriggerData;
  v7 = [(HMDAnalyticsEventTriggerData *)&v30 init];
  if (v7)
  {
    v7->_executeOnce = [v6 executeOnce];
    v8 = (void *)MEMORY[0x263EFF980];
    v9 = [v6 events];
    v10 = objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v11 = objc_msgSend(v6, "events", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v27;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v26 + 1) + 8 * v15) analyticsTriggerEventData];
          [v10 addObject:v16];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v13);
    }

    uint64_t v17 = [v10 copy];
    events = v7->_events;
    v7->_events = (NSArray *)v17;

    v7->_containsRecurrences = [v6 containsRecurrences];
    v19 = [v6 evaluationCondition];

    if (v19)
    {
      v20 = [v6 predicateUtilities];
      v21 = [v6 evaluationCondition];
      uint64_t v22 = [v20 generateAnalyticsData:v21];
      predicate = v7->_predicate;
      v7->_predicate = (HMDAnalyticsPredicateData *)v22;
    }
    if (!a4)
    {
      v7->_activationType = [v6 activationType];
      v7->_activationState = [v6 activationState];
    }
    v24 = v7;
  }
  return v7;
}

@end