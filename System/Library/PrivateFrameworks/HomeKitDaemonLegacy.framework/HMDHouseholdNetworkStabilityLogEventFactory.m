@interface HMDHouseholdNetworkStabilityLogEventFactory
- (HMDHouseholdNetworkStabilityLogEventFactory)initWithNetworkObserver:(id)a3;
- (HMDNetworkObserver)networkObserver;
- (id)coalescedLogEventsFromLogEvents:(id)a3 homeUUID:(id)a4;
- (id)logEventsFromDictionary:(id)a3;
- (id)logEventsPopulatedForHomeWithUUID:(id)a3 associatedWithDate:(id)a4;
- (id)serializeLogEvents:(id)a3;
- (void)deleteCountersAfterDate:(id)a3;
- (void)deleteCountersBeforeDate:(id)a3;
@end

@implementation HMDHouseholdNetworkStabilityLogEventFactory

- (void).cxx_destruct
{
}

- (HMDNetworkObserver)networkObserver
{
  return self->_networkObserver;
}

- (void)deleteCountersAfterDate:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHouseholdNetworkStabilityLogEventFactory *)self networkObserver];
  [v5 deleteCountersAfterDate:v4];
}

- (void)deleteCountersBeforeDate:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHouseholdNetworkStabilityLogEventFactory *)self networkObserver];
  [v5 deleteCountersBeforeDate:v4];
}

- (id)coalescedLogEventsFromLogEvents:(id)a3 homeUUID:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v35 = a4;
  v36 = [MEMORY[0x1E4F1CA80] set];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v5;
  uint64_t v40 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  if (v40)
  {
    uint64_t v48 = 0;
    uint64_t v49 = 0;
    uint64_t v9 = 0;
    uint64_t v50 = 0;
    uint64_t v51 = 0;
    uint64_t v47 = 0;
    uint64_t v39 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v53 != v39) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(id *)(*((void *)&v52 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v12 = v11;
        }
        else {
          v12 = 0;
        }
        id v13 = v12;

        if (v13)
        {
          uint64_t v43 = v7;
          uint64_t v44 = v8;
          uint64_t v45 = v6;
          uint64_t v46 = v9;
          uint64_t v14 = [v13 numWifiAssociations];
          uint64_t v15 = [v13 numWifiDisassociations];
          uint64_t v16 = [v13 numAPChanges];
          uint64_t v17 = [v13 numGatewayChanges];
          uint64_t v18 = [v13 numReadWrites];
          uint64_t v19 = [v13 numReadErrors];
          uint64_t v42 = [v13 numWriteErrors];
          uint64_t v41 = [v13 numSessionErrors];
          v20 = [v13 ssid];
          uint64_t v21 = [v13 gatewayMACAddress];
          v22 = (void *)v21;
          if (v20) {
            BOOL v23 = v21 == 0;
          }
          else {
            BOOL v23 = 1;
          }
          if (!v23)
          {
            [NSString stringWithFormat:@"%@/%@", v20, v21];
            uint64_t v38 = v19;
            uint64_t v24 = v18;
            uint64_t v25 = v17;
            uint64_t v26 = v16;
            uint64_t v27 = v15;
            v29 = uint64_t v28 = v14;
            [v36 addObject:v29];

            uint64_t v14 = v28;
            uint64_t v15 = v27;
            uint64_t v16 = v26;
            uint64_t v17 = v25;
            uint64_t v18 = v24;
            uint64_t v19 = v38;
          }
          v47 += v14;
          v49 += v15;
          v50 += v16;
          ++v51;
          uint64_t v9 = v17 + v46;
          v48 += v18;
          uint64_t v8 = v19 + v44;
          uint64_t v6 = v42 + v45;
          uint64_t v7 = v41 + v43;
        }
      }
      uint64_t v40 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
    }
    while (v40);
  }
  else
  {
    uint64_t v48 = 0;
    uint64_t v49 = 0;
    uint64_t v9 = 0;
    uint64_t v50 = 0;
    uint64_t v51 = 0;
    uint64_t v47 = 0;
  }

  uint64_t v30 = [v36 count];
  if (v51)
  {
    v31 = v35;
    v32 = [[HMDHouseholdNetworkStabilityLogEvent alloc] initWithHomeUUID:v35 numStabilityReporters:v51 WifiAssociations:v47 wifiDisassociations:v49 apChanges:v50 gatewayChanges:v9 numReadWrites:v48 numReadErrors:v8 numWriteErrors:v6 numSessionErrors:v7 numNetworkSignatures:v30];
    v56 = v32;
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
  }
  else
  {
    v33 = (void *)MEMORY[0x1E4F1CBF0];
    v31 = v35;
  }

  return v33;
}

- (id)logEventsFromDictionary:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = [a3 objectForKeyedSubscript:@"networkStabilityLogEvent"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5
    && (uint64_t v6 = [[HMDNetworkStabilityLogEvent alloc] initWithDictionary:v5]) != 0)
  {
    uint64_t v7 = v6;
    v10[0] = v6;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)serializeLogEvents:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
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
    uint64_t v9 = @"networkStabilityLogEvent";
    uint64_t v6 = [v5 serializedLogEvent];
    v10[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)logEventsPopulatedForHomeWithUUID:(id)a3 associatedWithDate:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(HMDHouseholdNetworkStabilityLogEventFactory *)self networkObserver];
  uint64_t v9 = [v8 logEventForHomeWithUUID:v7 associatedWithDate:v6];

  if (v9)
  {
    v12[0] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (HMDHouseholdNetworkStabilityLogEventFactory)initWithNetworkObserver:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDHouseholdNetworkStabilityLogEventFactory;
  id v6 = [(HMDHouseholdNetworkStabilityLogEventFactory *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_networkObserver, a3);
  }

  return v7;
}

@end