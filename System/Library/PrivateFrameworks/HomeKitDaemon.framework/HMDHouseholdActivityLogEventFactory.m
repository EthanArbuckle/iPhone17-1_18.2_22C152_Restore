@interface HMDHouseholdActivityLogEventFactory
- (HMDHouseholdActivityLogEventFactory)initWithContributors:(id)a3;
- (NSArray)contributors;
- (id)coalescedLogEventsFromLogEvents:(id)a3 homeUUID:(id)a4;
- (id)logEventsFromDictionary:(id)a3;
- (id)logEventsPopulatedForHomeWithUUID:(id)a3 associatedWithDate:(id)a4;
- (id)serializeLogEvents:(id)a3;
- (void)deleteCountersAfterDate:(id)a3;
- (void)deleteCountersBeforeDate:(id)a3;
@end

@implementation HMDHouseholdActivityLogEventFactory

- (void).cxx_destruct
{
}

- (NSArray)contributors
{
  return self->_contributors;
}

- (void)deleteCountersAfterDate:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(HMDHouseholdActivityLogEventFactory *)self contributors];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) deleteCountersAfterDate:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)deleteCountersBeforeDate:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(HMDHouseholdActivityLogEventFactory *)self contributors];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) deleteCountersBeforeDate:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)coalescedLogEventsFromLogEvents:(id)a3 homeUUID:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(id *)(*((void *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v15 = v14;
        }
        else {
          uint64_t v15 = 0;
        }
        id v16 = v15;

        if (v16) {
          objc_msgSend(v8, "addObject:", v16, (void)v21);
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v11);
  }

  v17 = [(HMDHouseholdActivityLogEventFactory *)self contributors];
  v18 = +[HMDHouseholdActivityLogEvent coalescedEventFromHouseholdActivityLogEvents:v8 homeUUID:v7 contributors:v17];
  v25 = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];

  return v19;
}

- (id)logEventsFromDictionary:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [HMDHouseholdActivityLogEvent alloc];
  id v6 = [(HMDHouseholdActivityLogEventFactory *)self contributors];
  id v7 = [(HMDHouseholdActivityLogEvent *)v5 initWithDictionary:v4 contributors:v6];

  if (v7)
  {
    v10[0] = v7;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)serializeLogEvents:(id)a3
{
  v3 = [a3 objectAtIndexedSubscript:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = [v5 serializedMetric];

  return v6;
}

- (id)logEventsPopulatedForHomeWithUUID:(id)a3 associatedWithDate:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [HMDHouseholdActivityLogEvent alloc];
  id v9 = [(HMDHouseholdActivityLogEventFactory *)self contributors];
  id v10 = [(HMDHouseholdActivityLogEvent *)v8 initPopulatedFromDate:v6 homeUUID:v7 contributors:v9];

  v13[0] = v10;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];

  return v11;
}

- (HMDHouseholdActivityLogEventFactory)initWithContributors:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDHouseholdActivityLogEventFactory;
  id v6 = [(HMDHouseholdActivityLogEventFactory *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contributors, a3);
  }

  return v7;
}

@end