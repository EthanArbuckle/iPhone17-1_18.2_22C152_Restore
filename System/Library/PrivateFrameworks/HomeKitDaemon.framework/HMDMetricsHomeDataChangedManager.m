@interface HMDMetricsHomeDataChangedManager
+ (id)logCategory;
- (BOOL)_shouldExcludeUpdateForModelName:(id)a3 propertyName:(id)a4;
- (BOOL)started;
- (HMDCurrentResidentDeviceDataSource)currentHomeDataSource;
- (HMDEventCountersManager)countersManager;
- (HMDMetricsHomeDataChangedManager)initWithCountersManager:(id)a3 currentHomeDataSource:(id)a4 dateProvider:(id)a5;
- (HMDMetricsHomeDataChangedManager)initWithCountersManager:(id)a3 currentHomeDataSource:(id)a4 dateProvider:(id)a5 notificationCenter:(id)a6 maxNumberEventsToReport:(unint64_t)a7 workQueue:(id)a8;
- (HMMDateProvider)dateProvider;
- (NSNotificationCenter)notificationCenter;
- (OS_dispatch_queue)workQueue;
- (id)coalescedLogEventsFromLogEvents:(id)a3 homeUUID:(id)a4;
- (id)logEventsFromDictionary:(id)a3;
- (id)logEventsPopulatedForHomeWithUUID:(id)a3 associatedWithDate:(id)a4;
- (id)serializeLogEvents:(id)a3;
- (unint64_t)maxNumberEventsToReport;
- (void)_handleChangeSetSummary:(id)a3 homeUUID:(id)a4;
- (void)_handleGeneratedHomeDataChangedNotification:(id)a3;
- (void)_handleHDCDueToBecamePrimaryForHome:(id)a3;
- (void)_handleHomeDataChangedReasonBecamePrimaryLogEvent:(id)a3 becamePrimaryHouseholdLogEventsByName:(id)a4 homeUUID:(id)a5;
- (void)_handleHomeDataChangedReasonInsertedLogEvent:(id)a3 insertedHouseholdLogEventsByName:(id)a4 homeUUID:(id)a5;
- (void)_handleHomeDataChangedReasonUpdatedLogEvent:(id)a3 updatedHouseholdLogEventsByName:(id)a4 homeUUID:(id)a5;
- (void)deleteCountersAfterDate:(id)a3;
- (void)deleteCountersBeforeDate:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation HMDMetricsHomeDataChangedManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_dateProvider);
  objc_destroyWeak((id *)&self->_currentHomeDataSource);
  objc_destroyWeak((id *)&self->_notificationCenter);
  objc_destroyWeak((id *)&self->_countersManager);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (BOOL)started
{
  return self->_started;
}

- (unint64_t)maxNumberEventsToReport
{
  return self->_maxNumberEventsToReport;
}

- (HMMDateProvider)dateProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dateProvider);
  return (HMMDateProvider *)WeakRetained;
}

- (HMDCurrentResidentDeviceDataSource)currentHomeDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentHomeDataSource);
  return (HMDCurrentResidentDeviceDataSource *)WeakRetained;
}

- (NSNotificationCenter)notificationCenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_notificationCenter);
  return (NSNotificationCenter *)WeakRetained;
}

- (HMDEventCountersManager)countersManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_countersManager);
  return (HMDEventCountersManager *)WeakRetained;
}

- (BOOL)_shouldExcludeUpdateForModelName:(id)a3 propertyName:(id)a4
{
  uint64_t v4 = _shouldExcludeUpdateForModelName_propertyName__onceToken;
  id v5 = a4;
  if (v4 != -1) {
    dispatch_once(&_shouldExcludeUpdateForModelName_propertyName__onceToken, &__block_literal_global_44_19945);
  }
  char v6 = [(id)_shouldExcludeUpdateForModelName_propertyName__propertyNamesToExclude containsObject:v5];

  return v6;
}

void __82__HMDMetricsHomeDataChangedManager__shouldExcludeUpdateForModelName_propertyName___block_invoke()
{
  v0 = (void *)_shouldExcludeUpdateForModelName_propertyName__propertyNamesToExclude;
  _shouldExcludeUpdateForModelName_propertyName__propertyNamesToExclude = (uint64_t)&unk_26E473E70;
}

- (void)_handleHomeDataChangedReasonBecamePrimaryLogEvent:(id)a3 becamePrimaryHouseholdLogEventsByName:(id)a4 homeUUID:(id)a5
{
  id v11 = a3;
  id v7 = a4;
  id v8 = a5;
  v9 = [v7 objectForKeyedSubscript:@"becamePrimary"];
  if (v9)
  {
    id v10 = v9;
    objc_msgSend(v9, "incrementCountWithValue:", objc_msgSend(v11, "count"));
  }
  else
  {
    id v10 = -[HMDHouseholdHomeDataChangedLogEvent initAsBecamePrimaryEventWithCount:homeUUID:]([HMDHouseholdHomeDataChangedLogEvent alloc], "initAsBecamePrimaryEventWithCount:homeUUID:", [v11 count], v8);
    [v7 setObject:v10 forKeyedSubscript:@"becamePrimary"];
  }
}

- (void)_handleHomeDataChangedReasonUpdatedLogEvent:(id)a3 updatedHouseholdLogEventsByName:(id)a4 homeUUID:(id)a5
{
  id v14 = a3;
  id v7 = a4;
  id v8 = a5;
  v9 = [v14 modelName];
  id v10 = [v14 propertyName];
  id v11 = [NSString stringWithFormat:@"%@_%@", v9, v10];
  v12 = [v7 objectForKeyedSubscript:v11];
  if (v12)
  {
    id v13 = v12;
    objc_msgSend(v12, "incrementCountWithValue:", objc_msgSend(v14, "count"));
  }
  else
  {
    id v13 = -[HMDHouseholdHomeDataChangedLogEvent initAsUpdateEventForModelName:propertyName:count:homeUUID:]([HMDHouseholdHomeDataChangedLogEvent alloc], "initAsUpdateEventForModelName:propertyName:count:homeUUID:", v9, v10, [v14 count], v8);
    [v7 setObject:v13 forKeyedSubscript:v11];
  }
}

- (void)_handleHomeDataChangedReasonInsertedLogEvent:(id)a3 insertedHouseholdLogEventsByName:(id)a4 homeUUID:(id)a5
{
  id v12 = a3;
  id v7 = a4;
  id v8 = a5;
  v9 = [v12 modelName];
  id v10 = [v7 objectForKeyedSubscript:v9];
  if (v10)
  {
    id v11 = v10;
    objc_msgSend(v10, "incrementCountWithValue:", objc_msgSend(v12, "count"));
  }
  else
  {
    id v11 = -[HMDHouseholdHomeDataChangedLogEvent initAsInsertEventForModelName:count:homeUUID:]([HMDHouseholdHomeDataChangedLogEvent alloc], "initAsInsertEventForModelName:count:homeUUID:", v9, [v12 count], v8);
    [v7 setObject:v11 forKeyedSubscript:v9];
  }
}

- (void)_handleHDCDueToBecamePrimaryForHome:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDMetricsHomeDataChangedManager *)self dateProvider];
  id v9 = [v5 startOfCurrentDay];

  char v6 = +[HMDHouseholdDataEventCounterGroupSpecifier specifierWithGroupName:@"HMDHomeDataChangedReasonsBecamePrimaryEventGroup" homeUUID:v4 date:v9];

  id v7 = [(HMDMetricsHomeDataChangedManager *)self countersManager];
  id v8 = [v7 objectForKeyedSubscript:v6];

  [v8 incrementEventCounterForEventName:@"becamePrimary"];
}

- (void)_handleChangeSetSummary:(id)a3 homeUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDMetricsHomeDataChangedManager *)self dateProvider];
  id v9 = [v8 startOfCurrentDay];

  id v10 = +[HMDHouseholdDataEventCounterGroupSpecifier specifierWithGroupName:@"HMDHomeDataChangedReasonsInsertedEventGroup" homeUUID:v6 date:v9];
  id v11 = +[HMDHouseholdDataEventCounterGroupSpecifier specifierWithGroupName:@"HMDHomeDataChangedReasonsUpdatedEventGroup" homeUUID:v6 date:v9];

  id v12 = [(HMDMetricsHomeDataChangedManager *)self countersManager];
  id v13 = [v12 objectForKeyedSubscript:v10];
  id v14 = [v7 insertedObjectNames];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __69__HMDMetricsHomeDataChangedManager__handleChangeSetSummary_homeUUID___block_invoke;
  v21[3] = &unk_264A29350;
  id v22 = v13;
  id v15 = v13;
  objc_msgSend(v14, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v21);

  v16 = [v12 objectForKeyedSubscript:v11];
  v17 = [v7 modifiedObjectPropertyNames];

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __69__HMDMetricsHomeDataChangedManager__handleChangeSetSummary_homeUUID___block_invoke_2;
  v19[3] = &unk_264A29350;
  id v20 = v16;
  id v18 = v16;
  objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v19);
}

uint64_t __69__HMDMetricsHomeDataChangedManager__handleChangeSetSummary_homeUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) incrementEventCounterForEventName:a2];
}

uint64_t __69__HMDMetricsHomeDataChangedManager__handleChangeSetSummary_homeUUID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) incrementEventCounterForEventName:a2];
}

- (void)_handleGeneratedHomeDataChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDMetricsHomeDataChangedManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __80__HMDMetricsHomeDataChangedManager__handleGeneratedHomeDataChangedNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __80__HMDMetricsHomeDataChangedManager__handleGeneratedHomeDataChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) userInfo];
    int v16 = 138543618;
    v17 = v5;
    __int16 v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Handling HMDGeneratedHomeDataChangedNotification with userInfo: %@", (uint8_t *)&v16, 0x16u);
  }
  id v7 = [*(id *)(a1 + 40) userInfo];
  id v8 = [v7 objectForKeyedSubscript:@"HMDGeneratedHomeDataChangedSummaryNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  id v11 = [*(id *)(a1 + 40) userInfo];
  id v12 = [v11 objectForKeyedSubscript:@"HMDGeneratedHomeDataChangedHomeUUIDNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;

  id v15 = *(void **)(a1 + 32);
  if (v10) {
    [v15 _handleChangeSetSummary:v10 homeUUID:v14];
  }
  else {
    [v15 _handleHDCDueToBecamePrimaryForHome:v14];
  }
}

- (id)serializeLogEvents:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263EFF980];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__HMDMetricsHomeDataChangedManager_serializeLogEvents___block_invoke;
  v11[3] = &unk_264A17A68;
  v11[4] = self;
  id v7 = v6;
  id v12 = v7;
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v11);

  if ([v7 count])
  {
    id v13 = @"HMDMetricsHomeDataChangedLogEvents";
    id v8 = (void *)[v7 copy];
    v14[0] = v8;
    id v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __55__HMDMetricsHomeDataChangedManager_serializeLogEvents___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
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
    id v6 = *(void **)(a1 + 40);
    id v7 = [v5 serializedLogEvent];
    [v6 addObject:v7];
  }
  else
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v12 = 138543618;
      id v13 = v11;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Skipping unexpected log event during encoding: %@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (id)logEventsFromDictionary:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"HMDMetricsHomeDataChangedLogEvents"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    id v13 = __60__HMDMetricsHomeDataChangedManager_logEventsFromDictionary___block_invoke;
    __int16 v14 = &unk_264A2F140;
    id v15 = self;
    id v16 = v7;
    id v8 = v7;
    objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v11);
    id v9 = objc_msgSend(v8, "copy", v11, v12, v13, v14, v15);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __60__HMDMetricsHomeDataChangedManager_logEventsFromDictionary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [[HMDHouseholdHomeDataChangedLogEvent alloc] initWithDictionary:v3];
  if (v4)
  {
    [*(id *)(a1 + 40) addObject:v4];
  }
  else
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v9 = 138543618;
      id v10 = v8;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode log event: %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (id)coalescedLogEventsFromLogEvents:(id)a3 homeUUID:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFF9A0] dictionary];
  int v9 = [MEMORY[0x263EFF9A0] dictionary];
  id v10 = [MEMORY[0x263EFF9A0] dictionary];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __77__HMDMetricsHomeDataChangedManager_coalescedLogEventsFromLogEvents_homeUUID___block_invoke;
  v30[3] = &unk_264A17A40;
  v30[4] = self;
  id v11 = v8;
  id v31 = v11;
  id v12 = v7;
  id v32 = v12;
  id v13 = v9;
  id v33 = v13;
  id v14 = v10;
  id v34 = v14;
  v29 = v6;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v30);
  id v15 = [MEMORY[0x263EFF980] array];
  id v16 = [v11 allValues];
  [v15 addObjectsFromArray:v16];

  v17 = [v13 allValues];
  [v15 addObjectsFromArray:v17];

  [v15 sortUsingComparator:&__block_literal_global_32_19977];
  uint64_t v18 = [v14 objectForKeyedSubscript:@"becamePrimary"];
  v19 = (void *)v18;
  if (v18) {
    uint64_t v18 = [v15 insertObject:v18 atIndex:0];
  }
  uint64_t v20 = (void *)MEMORY[0x230FBD990](v18);
  v21 = self;
  id v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v36 = v23;
    __int16 v37 = 2112;
    v38 = v15;
    _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_DEBUG, "%{public}@CoalescedLogEvents before truncating: %@", buf, 0x16u);
  }
  unint64_t v24 = [(HMDMetricsHomeDataChangedManager *)v21 maxNumberEventsToReport];
  unint64_t v25 = [v15 count];
  if (v24 >= v25) {
    unint64_t v26 = v25;
  }
  else {
    unint64_t v26 = v24;
  }
  v27 = objc_msgSend(v15, "subarrayWithRange:", 0, v26);

  return v27;
}

void __77__HMDMetricsHomeDataChangedManager_coalescedLogEventsFromLogEvents_homeUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
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
    uint64_t v6 = [v5 changeType];
    if (v6)
    {
      if (v6 == 2)
      {
        [*(id *)(a1 + 32) _handleHomeDataChangedReasonUpdatedLogEvent:v5 updatedHouseholdLogEventsByName:*(void *)(a1 + 56) homeUUID:*(void *)(a1 + 48)];
      }
      else if (v6 == 1)
      {
        [*(id *)(a1 + 32) _handleHomeDataChangedReasonInsertedLogEvent:v5 insertedHouseholdLogEventsByName:*(void *)(a1 + 40) homeUUID:*(void *)(a1 + 48)];
      }
    }
    else
    {
      [*(id *)(a1 + 32) _handleHomeDataChangedReasonBecamePrimaryLogEvent:v5 becamePrimaryHouseholdLogEventsByName:*(void *)(a1 + 64) homeUUID:*(void *)(a1 + 48)];
    }
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    int v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = 138543618;
      id v12 = v10;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Skipping unexpected log event during coalescing: %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

uint64_t __77__HMDMetricsHomeDataChangedManager_coalescedLogEventsFromLogEvents_homeUUID___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 count];
  if (v6 <= [v5 count])
  {
    unint64_t v8 = [v4 count];
    uint64_t v7 = v8 < [v5 count];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

- (void)deleteCountersBeforeDate:(id)a3
{
  v14[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFFA08];
  v14[0] = @"HMDHomeDataChangedReasonsInsertedEventGroup";
  v14[1] = @"HMDHomeDataChangedReasonsUpdatedEventGroup";
  void v14[2] = @"HMDHomeDataChangedReasonsBecamePrimaryEventGroup";
  unint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];
  uint64_t v7 = [v5 setWithArray:v6];

  unint64_t v8 = [(HMDMetricsHomeDataChangedManager *)self countersManager];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__HMDMetricsHomeDataChangedManager_deleteCountersBeforeDate___block_invoke;
  v11[3] = &unk_264A18F50;
  id v12 = v4;
  id v13 = v7;
  id v9 = v7;
  id v10 = v4;
  [v8 removeCounterGroupsBasedOnPredicate:v11];
}

uint64_t __61__HMDMetricsHomeDataChangedManager_deleteCountersBeforeDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  unint64_t v6 = [v5 groupName];
  if (v5)
  {
    uint64_t v7 = [v5 date];
    if ([v7 compare:*(void *)(a1 + 32)] == -1) {
      uint64_t v8 = [*(id *)(a1 + 40) containsObject:v6];
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)deleteCountersAfterDate:(id)a3
{
  v14[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFFA08];
  v14[0] = @"HMDHomeDataChangedReasonsInsertedEventGroup";
  v14[1] = @"HMDHomeDataChangedReasonsUpdatedEventGroup";
  void v14[2] = @"HMDHomeDataChangedReasonsBecamePrimaryEventGroup";
  unint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];
  uint64_t v7 = [v5 setWithArray:v6];

  uint64_t v8 = [(HMDMetricsHomeDataChangedManager *)self countersManager];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__HMDMetricsHomeDataChangedManager_deleteCountersAfterDate___block_invoke;
  v11[3] = &unk_264A18F50;
  id v12 = v4;
  id v13 = v7;
  id v9 = v7;
  id v10 = v4;
  [v8 removeCounterGroupsBasedOnPredicate:v11];
}

uint64_t __60__HMDMetricsHomeDataChangedManager_deleteCountersAfterDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  unint64_t v6 = [v5 groupName];
  if (v5)
  {
    uint64_t v7 = [v5 date];
    if ([v7 compare:*(void *)(a1 + 32)] == 1) {
      uint64_t v8 = [*(id *)(a1 + 40) containsObject:v6];
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)logEventsPopulatedForHomeWithUUID:(id)a3 associatedWithDate:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDMetricsHomeDataChangedManager *)self currentHomeDataSource];
  id v9 = [v8 homeUUIDForCurrentResidentDevice];
  int v10 = objc_msgSend(v6, "hmf_isEqualToUUID:", v9);

  if (v10)
  {
    uint64_t v11 = +[HMDHouseholdDataEventCounterGroupSpecifier specifierWithGroupName:@"HMDHomeDataChangedReasonsInsertedEventGroup" homeUUID:v6 date:v7];
    id v12 = +[HMDHouseholdDataEventCounterGroupSpecifier specifierWithGroupName:@"HMDHomeDataChangedReasonsUpdatedEventGroup" homeUUID:v6 date:v7];
    uint64_t v13 = +[HMDHouseholdDataEventCounterGroupSpecifier specifierWithGroupName:@"HMDHomeDataChangedReasonsBecamePrimaryEventGroup" homeUUID:v6 date:v7];
    context = (void *)MEMORY[0x230FBD990]();
    id v14 = [MEMORY[0x263EFF980] array];
    uint64_t v15 = [(HMDMetricsHomeDataChangedManager *)self countersManager];
    __int16 v37 = (void *)v11;
    v35 = [v15 objectForKeyedSubscript:v11];
    id v16 = [v35 eventCounters];
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __89__HMDMetricsHomeDataChangedManager_logEventsPopulatedForHomeWithUUID_associatedWithDate___block_invoke;
    v43[3] = &unk_264A19720;
    id v17 = v6;
    id v44 = v17;
    id v18 = v14;
    id v45 = v18;
    [v16 enumerateKeysAndObjectsUsingBlock:v43];

    id v34 = [v15 objectForKeyedSubscript:v12];
    v19 = [v34 eventCounters];
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __89__HMDMetricsHomeDataChangedManager_logEventsPopulatedForHomeWithUUID_associatedWithDate___block_invoke_2;
    v40[3] = &unk_264A26368;
    v40[4] = self;
    id v20 = v17;
    id v41 = v20;
    id v21 = v18;
    id v42 = v21;
    [v19 enumerateKeysAndObjectsUsingBlock:v40];

    [v21 sortUsingComparator:&__block_literal_global_19985];
    v36 = v15;
    uint64_t v39 = (void *)v13;
    id v22 = [v15 objectForKeyedSubscript:v13];
    id v23 = -[HMDHouseholdHomeDataChangedLogEvent initAsBecamePrimaryEventWithCount:homeUUID:]([HMDHouseholdHomeDataChangedLogEvent alloc], "initAsBecamePrimaryEventWithCount:homeUUID:", [v22 fetchEventCounterForEventName:@"becamePrimary"], v20);
    unint64_t v24 = (void *)MEMORY[0x230FBD990]([v21 insertObject:v23 atIndex:0]);
    unint64_t v25 = self;
    unint64_t v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v27 = id v33 = v7;
      *(_DWORD *)buf = 138543618;
      v47 = v27;
      __int16 v48 = 2112;
      id v49 = v21;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_DEBUG, "%{public}@PopulatedLogEvents before truncating: %@", buf, 0x16u);
    }
    unint64_t v28 = [(HMDMetricsHomeDataChangedManager *)v25 maxNumberEventsToReport];
    unint64_t v29 = [v21 count];
    if (v28 >= v29) {
      unint64_t v30 = v29;
    }
    else {
      unint64_t v30 = v28;
    }
    id v31 = objc_msgSend(v21, "subarrayWithRange:", 0, v30, v33);
  }
  else
  {
    id v31 = 0;
  }

  return v31;
}

void __89__HMDMetricsHomeDataChangedManager_logEventsPopulatedForHomeWithUUID_associatedWithDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [HMDHouseholdHomeDataChangedLogEvent alloc];
  uint64_t v8 = [v5 unsignedIntegerValue];

  id v9 = [(HMDHouseholdHomeDataChangedLogEvent *)v7 initAsInsertEventForModelName:v6 count:v8 homeUUID:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) addObject:v9];
}

void __89__HMDMetricsHomeDataChangedManager_logEventsPopulatedForHomeWithUUID_associatedWithDate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 componentsSeparatedByString:@"_"];
  if ([v7 count] == 2)
  {
    uint64_t v8 = [v7 objectAtIndexedSubscript:0];
    id v9 = [v7 objectAtIndexedSubscript:1];
    if ([*(id *)(a1 + 32) _shouldExcludeUpdateForModelName:v8 propertyName:v9])
    {
      int v10 = (void *)MEMORY[0x230FBD990]();
      id v11 = *(id *)(a1 + 32);
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v13 = HMFGetLogIdentifier();
        int v19 = 138543874;
        id v20 = v13;
        __int16 v21 = 2112;
        id v22 = v8;
        __int16 v23 = 2112;
        unint64_t v24 = v9;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Excluding update for modelName: %@ propertyName: %@ from HMDHomeDataChangedLogEvent", (uint8_t *)&v19, 0x20u);
      }
    }
    else
    {
      id v18 = -[HMDHouseholdHomeDataChangedLogEvent initAsUpdateEventForModelName:propertyName:count:homeUUID:]([HMDHouseholdHomeDataChangedLogEvent alloc], "initAsUpdateEventForModelName:propertyName:count:homeUUID:", v8, v9, [v6 unsignedIntegerValue], *(void *)(a1 + 40));
      [*(id *)(a1 + 48) addObject:v18];
    }
  }
  else
  {
    id v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = *(id *)(a1 + 32);
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      int v19 = 138543618;
      id v20 = v17;
      __int16 v21 = 2112;
      id v22 = v5;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Expected 2 event name components from eventName: %@", (uint8_t *)&v19, 0x16u);
    }
  }
}

uint64_t __89__HMDMetricsHomeDataChangedManager_logEventsPopulatedForHomeWithUUID_associatedWithDate___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 count];
  if (v6 <= [v5 count])
  {
    unint64_t v8 = [v4 count];
    uint64_t v7 = v8 < [v5 count];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

- (void)stop
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (self->_started)
  {
    id v3 = (void *)MEMORY[0x230FBD990]();
    id v4 = self;
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      unint64_t v6 = HMFGetLogIdentifier();
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 removeObserver:v4 name:@"HMDGeneratedHomeDataChangedNotification" object:0];

    self->_started = 0;
  }
}

- (void)start
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (!self->_started)
  {
    id v3 = (void *)MEMORY[0x230FBD990]();
    id v4 = self;
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      unint64_t v6 = HMFGetLogIdentifier();
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v4 selector:sel__handleGeneratedHomeDataChangedNotification_ name:@"HMDGeneratedHomeDataChangedNotification" object:0];

    self->_started = 1;
  }
}

- (HMDMetricsHomeDataChangedManager)initWithCountersManager:(id)a3 currentHomeDataSource:(id)a4 dateProvider:(id)a5 notificationCenter:(id)a6 maxNumberEventsToReport:(unint64_t)a7 workQueue:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v22.receiver = self;
  v22.super_class = (Class)HMDMetricsHomeDataChangedManager;
  int v19 = [(HMDMetricsHomeDataChangedManager *)&v22 init];
  id v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_countersManager, v14);
    objc_storeWeak((id *)&v20->_currentHomeDataSource, v15);
    objc_storeWeak((id *)&v20->_notificationCenter, v17);
    objc_storeWeak((id *)&v20->_dateProvider, v16);
    v20->_maxNumberEventsToReport = a7;
    objc_storeStrong((id *)&v20->_workQueue, a8);
  }

  return v20;
}

- (HMDMetricsHomeDataChangedManager)initWithCountersManager:(id)a3 currentHomeDataSource:(id)a4 dateProvider:(id)a5
{
  int v8 = (void *)MEMORY[0x263F08A00];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 defaultCenter];
  uint64_t v13 = dispatch_get_global_queue(-32768, 0);
  id v14 = [(HMDMetricsHomeDataChangedManager *)self initWithCountersManager:v11 currentHomeDataSource:v10 dateProvider:v9 notificationCenter:v12 maxNumberEventsToReport:50 workQueue:v13];

  return v14;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t19_20004 != -1) {
    dispatch_once(&logCategory__hmf_once_t19_20004, &__block_literal_global_49);
  }
  v2 = (void *)logCategory__hmf_once_v20_20005;
  return v2;
}

void __47__HMDMetricsHomeDataChangedManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v20_20005;
  logCategory__hmf_once_v20_20005 = v0;
}

@end