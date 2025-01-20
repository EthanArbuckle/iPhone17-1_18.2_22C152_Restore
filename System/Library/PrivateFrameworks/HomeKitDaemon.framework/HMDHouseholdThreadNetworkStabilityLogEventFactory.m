@interface HMDHouseholdThreadNetworkStabilityLogEventFactory
- (HMDHouseholdThreadNetworkStabilityLogEventFactory)initWithThreadNetworkObserver:(id)a3;
- (HMDThreadNetworkObserver)threadNetworkObserver;
- (id)coalescedLogEventsFromLogEvents:(id)a3 homeUUID:(id)a4;
- (id)logEventsFromDictionary:(id)a3;
- (id)logEventsPopulatedForHomeWithUUID:(id)a3 associatedWithDate:(id)a4;
- (id)serializeLogEvents:(id)a3;
- (void)deleteCountersAfterDate:(id)a3;
- (void)deleteCountersBeforeDate:(id)a3;
@end

@implementation HMDHouseholdThreadNetworkStabilityLogEventFactory

- (void).cxx_destruct
{
}

- (HMDThreadNetworkObserver)threadNetworkObserver
{
  return self->_threadNetworkObserver;
}

- (void)deleteCountersAfterDate:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHouseholdThreadNetworkStabilityLogEventFactory *)self threadNetworkObserver];
  [v5 deleteCountersAfterDate:v4];
}

- (void)deleteCountersBeforeDate:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHouseholdThreadNetworkStabilityLogEventFactory *)self threadNetworkObserver];
  [v5 deleteCountersBeforeDate:v4];
}

- (id)coalescedLogEventsFromLogEvents:(id)a3 homeUUID:(id)a4
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = v5;
  uint64_t v54 = [v5 countByEnumeratingWithState:&v62 objects:v67 count:16];
  if (v54)
  {
    id v44 = v6;
    unint64_t v49 = 0;
    unint64_t v50 = 0;
    unint64_t v51 = 0;
    unint64_t v52 = 0;
    uint64_t v7 = 0;
    uint64_t v55 = 0;
    uint64_t v56 = 0;
    unint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v59 = 0;
    uint64_t v60 = 0;
    uint64_t v61 = 0;
    uint64_t v57 = 0;
    uint64_t v58 = 0;
    unint64_t v46 = 0;
    unint64_t v47 = 0;
    unint64_t v48 = 0;
    uint64_t v12 = 0;
    uint64_t v53 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v54; ++i)
      {
        if (*(void *)v63 != v53) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(id *)(*((void *)&v62 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v15 = v14;
        }
        else {
          v15 = 0;
        }
        id v16 = v15;

        if (v16)
        {
          v17 = [v16 threadNetworkStatusReport];
          if (v48 <= [v17 numAdvertisedBRs])
          {
            v18 = [v16 threadNetworkStatusReport];
            unint64_t v48 = [v18 numAdvertisedBRs];
          }
          v19 = [v16 threadNetworkStatusReport];
          if (v49 <= [v19 numAppleBRs])
          {
            v20 = [v16 threadNetworkStatusReport];
            unint64_t v49 = [v20 numAppleBRs];
          }
          v21 = [v16 threadNetworkStatusReport];
          if (v50 <= [v21 numThirdPartyBRs])
          {
            v22 = [v16 threadNetworkStatusReport];
            unint64_t v50 = [v22 numThirdPartyBRs];
          }
          v23 = [v16 threadNetworkStatusReport];
          if (v51 <= [v23 numThreadNetworks])
          {
            v24 = [v16 threadNetworkStatusReport];
            unint64_t v51 = [v24 numThreadNetworks];
          }
          v25 = [v16 threadNetworkStatusReport];
          if (v52 <= [v25 maxSimuIPPrefixesDetected])
          {
            v26 = [v16 threadNetworkStatusReport];
            unint64_t v52 = [v26 maxSimuIPPrefixesDetected];
          }
          ++v12;

          v27 = [v16 threadNetworkStatusReport];
          v8 += [v27 txDelayAvg];

          v28 = [v16 threadNetworkStatusReport];
          v7 += [v28 txTotal];

          v29 = [v16 threadNetworkStatusReport];
          v55 += [v29 txSuccess];

          v30 = [v16 threadNetworkStatusReport];
          v9 += [v30 rxTotal];

          v31 = [v16 threadNetworkStatusReport];
          v10 += [v31 rxSuccess];

          v32 = [v16 threadNetworkStatusReport];
          v11 += [v32 reportDuration];

          v59 += [v16 threadNetworkUptime];
          v60 += [v16 threadNetworkDowntime];
          v61 += [v16 numReadWrites];
          v58 += [v16 numReadErrors];
          v57 += [v16 numWriteErrors];
          v56 += [v16 numSessionErrors];
          v33 = [v16 threadNetworkStatusReport];
          uint64_t v34 = [v33 reportDuration];

          if (v34)
          {
            v35 = [v16 threadNetworkStatusReport];
            if (v46 <= [v35 txDelayAvg])
            {
              v36 = [v16 threadNetworkStatusReport];
              unint64_t v46 = [v36 txDelayAvg];
            }
            ++v47;
          }
        }
      }
      uint64_t v54 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
    }
    while (v54);
    if (v12)
    {
      uint64_t v37 = v12;
      if (v47) {
        unint64_t v38 = v8 / v47;
      }
      else {
        unint64_t v38 = v46;
      }
      v39 = [HMDHouseholdThreadNetworkStabilityLogEvent alloc];
      v40 = [[HMDThreadNetworkStatusReport alloc] initWithNumAdvertisedBRs:v48 numAppleBRs:v49 numThirdPartyBRs:v50 numThreadNetworks:v51 maxSimuIPPrefixesDetected:v52 txTotal:v7 txSuccess:v55 txDelayAvg:v38 rxTotal:v9 rxSuccess:v10 reportDuration:v11];
      id v6 = v44;
      v41 = [(HMDHouseholdThreadNetworkStabilityLogEvent *)v39 initWithHomeUUID:v44 numStabilityReporters:v37 threadNetworkStatusReport:v40 threadNetworkUptime:v59 threadNetworkDowntime:v60 numReadWrites:v61 numReadErrors:v58 numWriteErrors:v57 numSessionErrors:v56];
      v66 = v41;
      v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v66 count:1];
    }
    else
    {
      v42 = (void *)MEMORY[0x263EFFA68];
      id v6 = v44;
    }
  }
  else
  {
    v42 = (void *)MEMORY[0x263EFFA68];
  }

  return v42;
}

- (id)logEventsFromDictionary:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  v3 = [a3 objectForKeyedSubscript:@"threadNetworkStabilityLogEvent"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5
    && (id v6 = [[HMDThreadNetworkStabilityLogEvent alloc] initWithDictionary:v5]) != 0)
  {
    uint64_t v7 = v6;
    v10[0] = v6;
    unint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (id)serializeLogEvents:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  v3 = [a3 objectAtIndexedSubscript:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    uint64_t v9 = @"threadNetworkStabilityLogEvent";
    id v6 = [v5 serializedLogEvent];
    v10[0] = v6;
    uint64_t v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)logEventsPopulatedForHomeWithUUID:(id)a3 associatedWithDate:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(HMDHouseholdThreadNetworkStabilityLogEventFactory *)self threadNetworkObserver];
  uint64_t v9 = [v8 logEventForHomeWithUUID:v7 associatedWithDate:v6 isDailySummary:1];

  if (v9)
  {
    v12[0] = v9;
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (HMDHouseholdThreadNetworkStabilityLogEventFactory)initWithThreadNetworkObserver:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDHouseholdThreadNetworkStabilityLogEventFactory;
  id v6 = [(HMDHouseholdThreadNetworkStabilityLogEventFactory *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_threadNetworkObserver, a3);
  }

  return v7;
}

@end