@interface HKMedicationsDeviceInfo(HealthMedicationsDaemonPlugin)
+ (id)deviceInfoFromStorageGroup:()HealthMedicationsDaemonPlugin syncIdentityManager:;
+ (id)localDeviceInfo;
@end

@implementation HKMedicationsDeviceInfo(HealthMedicationsDaemonPlugin)

+ (id)localDeviceInfo
{
  id v0 = objc_alloc(MEMORY[0x1E4F66BA8]);
  v1 = [MEMORY[0x1E4F2B860] sharedBehavior];
  v2 = [v1 currentDeviceDisplayName];
  v3 = [MEMORY[0x1E4F2B860] sharedBehavior];
  v4 = [v3 currentDeviceProductType];
  v5 = [MEMORY[0x1E4F2B860] sharedBehavior];
  v6 = v5;
  if (v5) {
    [v5 currentOSVersionStruct];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  v7 = (void *)[v0 _initLocalDeviceWithName:v2 model:v4 operatingSystemVersion:v9 scheduleCompatibilityVersion:1];

  return v7;
}

+ (id)deviceInfoFromStorageGroup:()HealthMedicationsDaemonPlugin syncIdentityManager:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v34 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v7 = [v5 storageEntries];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v13 = [v12 key];
        [v6 setObject:v12 forKeyedSubscript:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v9);
  }

  v14 = [v5 deviceContext];
  v15 = [v14 syncIdentity];
  v16 = [v15 hardwareIdentifier];

  v17 = [v6 objectForKeyedSubscript:@"_Name"];
  v18 = [v17 stringValue:0];

  v19 = [v6 objectForKeyedSubscript:@"_Model"];
  v20 = [v19 stringValue:0];

  v21 = [v6 objectForKeyedSubscript:@"_OperatingSystemVersion"];
  v22 = [v21 stringValue:0];

  v23 = [v6 objectForKeyedSubscript:@"_ScheduleCompatibilityVersion"];
  v24 = [v23 numberValue:0];

  v25 = 0;
  if (v16 && v18 && v20 && v22 && v24)
  {
    long long v37 = 0uLL;
    uint64_t v38 = 0;
    HKNSOperatingSystemVersionFromString();
    uint64_t v32 = [v24 integerValue];
    [v5 deviceContext];
    v26 = id v33 = v5;
    v27 = [v26 syncIdentity];
    v28 = [v34 currentSyncIdentity];
    v29 = [v28 identity];
    unsigned int v31 = [v27 isEqual:v29];

    id v5 = v33;
    long long v35 = 0uLL;
    uint64_t v36 = 0;
    v25 = (void *)[objc_alloc(MEMORY[0x1E4F66BA8]) initWithHardwareIdentifier:v16 name:v18 model:v20 operatingSystemVersion:&v35 scheduleCompatibilityVersion:v32 localDevice:v31];
  }

  return v25;
}

@end