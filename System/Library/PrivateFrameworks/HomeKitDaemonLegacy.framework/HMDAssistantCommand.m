@interface HMDAssistantCommand
+ (id)logCategory;
+ (void)initialize;
- (BOOL)completionHandlerCalled;
- (BOOL)isAttributeValue:(id)a3 equalTo:(id)a4;
- (BOOL)populateColorResult:(id)a3 serviceType:(id)a4 service:(id)a5 action:(id)a6 responses:(id)a7 forObjects:(id)a8;
- (BOOL)populateMediaProfileWriteResult:(id)a3 withValue:(id)a4 serviceType:(id)a5 action:(id)a6;
- (BOOL)populateResult:(id)a3 fromResponse:(id)a4 responses:(id)a5 forAction:(id)a6 serviceType:(id)a7 forObjects:(id)a8;
- (BOOL)populateResult:(id)a3 withObject:(id)a4 serviceType:(id)a5 action:(id)a6;
- (BOOL)populateResult:(id)a3 withService:(id)a4 serviceType:(id)a5 characteristic:(id)a6 resultAttribute:(id)a7 action:(id)a8;
- (BOOL)populateResultWithEntity:(id)a3 action:(id)a4 entity:(id)a5;
- (HMDAssistantCommandHelper)assistantCommandHelper;
- (HMDAssistantGather)gather;
- (HMDHome)home;
- (HMDHomeManager)homeManager;
- (NSArray)homeKitObjects;
- (NSString)currentHomeAssistantIdentifier;
- (NSString)currentHomeName;
- (NSString)primaryHomeAssistantIdentifier;
- (NSString)primaryHomeName;
- (OS_dispatch_queue)queue;
- (id)_evaluateHomeOptionallyMatchingHomeName:(id)a3;
- (id)_homeWithSearchFilter:(id)a3;
- (id)actionOutcomeFromError:(id)a3;
- (id)actionResultForCharacteristic:(id)a3 actionSet:(id)a4 action:(id)a5 objects:(id)a6 error:(id)a7;
- (id)actionResultForMediaProfile:(id)a3 action:(id)a4 objects:(id)a5 error:(id)a6;
- (id)addCharacteristicsFromRelatedServicesFor:(id)a3 assistantObjects:(id)a4;
- (id)addStatusCharacteristicsIfNeeded:(id)a3;
- (id)adjustGetValue:(id)a3 type:(id)a4 units:(id)a5 attribute:(id)a6;
- (id)adjustSetValue:(id)a3 type:(id)a4 units:(id)a5 attribute:(id)a6;
- (id)compareCurrentValue:(id)a3 newValue:(id)a4 withMetadata:(id)a5;
- (id)compareForBoundary:(id)a3 withMetadata:(id)a4;
- (id)entityFromActionSet:(id)a3;
- (id)failedActionResultsFromResponse:(id)a3 inActionSet:(id)a4 withAction:(id)a5;
- (id)filterObjects:(id)a3 forCharacteristicTypes:(id)a4;
- (id)filterObjects:(id)a3 forCharacteristics:(id)a4;
- (id)filteredObjectsFromObjects:(id)a3 byAttribute:(id)a4 forActionType:(id)a5;
- (id)filteredObjectsFromObjects:(id)a3 byCharacteristicType:(id)a4;
- (id)filteredObjectsFromObjects:(id)a3 forGroup:(id)a4;
- (id)filteredObjectsFromObjects:(id)a3 forHomeName:(id)a4 roomName:(id)a5 zoneName:(id)a6;
- (id)getLocaleUnits:(id)a3;
- (id)getValueOfType:(id)a3 action:(id)a4;
- (id)handleReadWriteResponses:(id)a3 error:(id)a4 forAction:(id)a5 inServiceType:(id)a6 results:(id)a7 forObjects:(id)a8;
- (id)mediaProfileFromObject:(id)a3;
- (id)objectsWithIdentifierList:(id)a3 error:(id *)a4;
- (id)objectsWithSearchFilter:(id)a3 inHome:(id)a4 serviceTypeIsATV:(BOOL)a5 overrideServiceTypeIfNeeded:(id *)a6;
- (id)parseColorEncoding:(id)a3;
- (id)readRequestsForCharacteristic:(id)a3;
- (id)serviceFromObject:(id)a3;
- (id)updateValue:(id)a3 forAction:(id)a4;
- (id)updateValueToBoundary:(id)a3 valueType:(id)a4 fudgeMinimum:(BOOL)a5 metadata:(id)a6;
- (int64_t)numberOfHomes;
- (unint64_t)startTime;
- (void)_handleCommandForHAPAction:(id)a3 serviceType:(id)a4 objects:(id)a5 completionHandler:(id)a6;
- (void)_handleCommandForMediaAccessoryAction:(id)a3 objects:(id)a4 serviceType:(id)a5 completionHandler:(id)a6;
- (void)_logEvent:(id)a3;
- (void)addActivationCharacteristicsIfNeeded:(id)a3 forCharacteristic:(id)a4;
- (void)addBridgedAccessoryCharacteristicsFor:(id)a3 toCollection:(id)a4 assistantObjects:(id)a5;
- (void)addCharacteristicWithType:(id)a3 fromService:(id)a4 toCollection:(id)a5 assistantObjects:(id)a6;
- (void)addIfNeededActivationCharacteristic:(id)a3 fromService:(id)a4 toCollection:(id)a5;
- (void)addLinkedServiceCharacteristicsFor:(id)a3 toCollection:(id)a4 assistantObjects:(id)a5;
- (void)executeActionSet:(id)a3 action:(id)a4 withCompletionHandler:(id)a5;
- (void)handleCommandWithCompletionHandler:(id)a3;
- (void)handleGetActionTypes:(id)a3 serviceType:(id)a4 forObjects:(id)a5 completionHandler:(id)a6;
- (void)handleGetColor:(id)a3 forObjects:(id)a4 serviceType:(id)a5 completionHandler:(id)a6;
- (void)handleGetMetadataActionTypes:(id)a3 serviceType:(id)a4 forObjects:(id)a5 completionHandler:(id)a6;
- (void)handleGetNaturalLightingAction:(id)a3 forObjects:(id)a4 serviceType:(id)a5 completionHandler:(id)a6;
- (void)handleMediaAccessorySetActionType:(id)a3 forObjects:(id)a4 withServiceType:(id)a5 completionHandler:(id)a6;
- (void)handleMediaReadWriteResponse:(id)a3 forAction:(id)a4 inServiceType:(id)a5 inHome:(id)a6 requestProperty:(id)a7 results:(id)a8 forObjects:(id)a9;
- (void)handleSetActionTypes:(id)a3 serviceType:(id)a4 forObjects:(id)a5 completionHandler:(id)a6;
- (void)handleSetColor:(id)a3 forObjects:(id)a4 service:(id)a5 completionHandler:(id)a6;
- (void)handleSetNaturalLightingAction:(id)a3 serviceType:(id)a4 forObjects:(id)a5 completionHandler:(id)a6;
- (void)handleUpdateActionTypes:(id)a3 serviceType:(id)a4 forObjects:(id)a5 completionHandler:(id)a6;
- (void)performWithGather:(id)a3 queue:(id)a4 msgDispatcher:(id)a5 completion:(id)a6;
- (void)reportOutcome:(id)a3 results:(id)a4 handler:(id)a5;
- (void)reportResults:(id)a3 handler:(id)a4;
- (void)reportUnlockRequired:(id)a3;
- (void)returnResults:(id)a3 serviceType:(id)a4 forAction:(id)a5 completionHandler:(id)a6;
- (void)setAssistantCommandHelper:(id)a3;
- (void)setCompletionHandlerCalled:(BOOL)a3;
- (void)setCurrentHomeAssistantIdentifier:(id)a3;
- (void)setCurrentHomeName:(id)a3;
- (void)setGather:(id)a3;
- (void)setHome:(id)a3;
- (void)setHomeKitObjects:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setNumberOfHomes:(int64_t)a3;
- (void)setPrimaryHomeAssistantIdentifier:(id)a3;
- (void)setPrimaryHomeName:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStartTime:(unint64_t)a3;
- (void)timeoutAndReportResults;
@end

@implementation HMDAssistantCommand

+ (void)initialize
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (!+[HMDDeviceCapabilities supportsDeviceLock]) {
    unlockErrorCode = 1;
  }
  v2 = [MEMORY[0x1E4F1CA48] array];
  v3 = [HMDAssistantColorCharacteristic alloc];
  uint64_t v4 = *MEMORY[0x1E4F2CDF8];
  v5 = [(HMDAssistantColorCharacteristic *)v3 initWithReadCharacteristicType:*MEMORY[0x1E4F2CEF8] writeCharacteristicType:*MEMORY[0x1E4F2CEF8] format:*MEMORY[0x1E4F2CDF8] mandatory:1];
  [v2 addObject:v5];
  v6 = [HMDAssistantColorCharacteristic alloc];
  v7 = [(HMDAssistantColorCharacteristic *)v6 initWithReadCharacteristicType:*MEMORY[0x1E4F2CF90] writeCharacteristicType:*MEMORY[0x1E4F2CF90] format:v4 mandatory:1];

  [v2 addObject:v7];
  v8 = [HMDAssistantColorCharacteristic alloc];
  v9 = [(HMDAssistantColorCharacteristic *)v8 initWithReadCharacteristicType:*MEMORY[0x1E4F2CE60] writeCharacteristicType:*MEMORY[0x1E4F2CE60] format:*MEMORY[0x1E4F2CE00] mandatory:1];

  [v2 addObject:v9];
  v13 = @"HSB";
  v10 = (void *)[v2 copy];
  v14[0] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v12 = (void *)supportedColorSpaces;
  supportedColorSpaces = v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_13022 != -1) {
    dispatch_once(&logCategory__hmf_once_t2_13022, &__block_literal_global_13023);
  }
  v2 = (void *)logCategory__hmf_once_v3_13024;
  return v2;
}

uint64_t __34__HMDAssistantCommand_logCategory__block_invoke()
{
  logCategory__hmf_once_v3_13024 = HMFCreateOSLogHandle();
  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_assistantCommandHelper, 0);
  objc_storeStrong((id *)&self->_currentHomeAssistantIdentifier, 0);
  objc_storeStrong((id *)&self->_currentHomeName, 0);
  objc_storeStrong((id *)&self->_primaryHomeAssistantIdentifier, 0);
  objc_storeStrong((id *)&self->_primaryHomeName, 0);
  objc_storeStrong((id *)&self->_homeKitObjects, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_gather, 0);
  objc_destroyWeak((id *)&self->_homeManager);
}

- (void)setStartTime:(unint64_t)a3
{
  self->_startTime = a3;
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  return self->_home;
}

- (void)setCompletionHandlerCalled:(BOOL)a3
{
  self->_completionHandlerCalled = a3;
}

- (BOOL)completionHandlerCalled
{
  return self->_completionHandlerCalled;
}

- (void)setAssistantCommandHelper:(id)a3
{
}

- (HMDAssistantCommandHelper)assistantCommandHelper
{
  return self->_assistantCommandHelper;
}

- (void)setCurrentHomeAssistantIdentifier:(id)a3
{
}

- (NSString)currentHomeAssistantIdentifier
{
  return self->_currentHomeAssistantIdentifier;
}

- (void)setCurrentHomeName:(id)a3
{
}

- (NSString)currentHomeName
{
  return self->_currentHomeName;
}

- (void)setPrimaryHomeAssistantIdentifier:(id)a3
{
}

- (NSString)primaryHomeAssistantIdentifier
{
  return self->_primaryHomeAssistantIdentifier;
}

- (void)setPrimaryHomeName:(id)a3
{
}

- (NSString)primaryHomeName
{
  return self->_primaryHomeName;
}

- (void)setNumberOfHomes:(int64_t)a3
{
  self->_numberOfHomes = a3;
}

- (int64_t)numberOfHomes
{
  return self->_numberOfHomes;
}

- (void)setHomeKitObjects:(id)a3
{
}

- (NSArray)homeKitObjects
{
  return self->_homeKitObjects;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setGather:(id)a3
{
}

- (HMDAssistantGather)gather
{
  return self->_gather;
}

- (void)setHomeManager:(id)a3
{
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (void)timeoutAndReportResults
{
  id v2 = [(HMDAssistantCommand *)self assistantCommandHelper];
  [v2 timeoutAndReportResults];
}

- (void)performWithGather:(id)a3 queue:(id)a4 msgDispatcher:(id)a5 completion:(id)a6
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v55 = a5;
  id v13 = a6;
  id v14 = objc_alloc(MEMORY[0x1E4F653F0]);
  v15 = NSString;
  SEL v16 = a2;
  v17 = v12;
  v18 = MEMORY[0x1D94505D0](self, v16);
  v19 = [v15 stringWithFormat:@"%@, %s:%ld", v18, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables_legacy/Sources/homed/Assistant/HMDAssistantCommand.m", 3730];
  v54 = (void *)[v14 initWithName:v19];

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  v21 = v20;
  [(HMDAssistantCommand *)self setGather:v11];
  [(HMDAssistantCommand *)self setQueue:v12];
  [(HMDAssistantCommand *)self setCompletionHandlerCalled:0];
  v22 = [(HMDAssistantCommand *)self actions];
  v57 = [v22 firstObject];

  [v57 aceId];
  [v57 actionType];

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__HMDAssistantCommand_performWithGather_queue_msgDispatcher_completion___block_invoke;
  aBlock[3] = &unk_1E6A078A8;
  objc_copyWeak(v60, &location);
  v60[1] = v21;
  id v53 = v13;
  id v59 = v53;
  v56 = _Block_copy(aBlock);
  uint64_t v23 = [v11 homeCount];
  if (!v23)
  {
    v45 = (void *)MEMORY[0x1D9452090]();
    v46 = self;
    HMFGetOSLogHandle();
    v47 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      v48 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v63 = v48;
      _os_log_impl(&dword_1D49D5000, v47, OS_LOG_TYPE_INFO, "%{public}@There are no homes, reporting the result right away", buf, 0xCu);
    }
    goto LABEL_10;
  }
  [(HMDAssistantCommand *)self setNumberOfHomes:v23];
  v24 = [(HMDAssistantCommand *)self gather];
  v25 = [v24 primaryHomeName];
  [(HMDAssistantCommand *)self setPrimaryHomeName:v25];

  v26 = [(HMDAssistantCommand *)self gather];
  v27 = [v26 primaryHomeAssistantIdentifier];
  [(HMDAssistantCommand *)self setPrimaryHomeAssistantIdentifier:v27];

  v28 = [(HMDAssistantCommand *)self gather];
  v29 = [v28 currentHomeName];
  [(HMDAssistantCommand *)self setCurrentHomeName:v29];

  v30 = [(HMDAssistantCommand *)self gather];
  v31 = [v30 currentHomeAssistantIdentifier];
  [(HMDAssistantCommand *)self setCurrentHomeAssistantIdentifier:v31];

  v32 = (void *)MEMORY[0x1D9452090]();
  v33 = self;
  HMFGetOSLogHandle();
  v34 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    id v51 = v12;
    id v52 = v11;
    HMFGetLogIdentifier();
    id v35 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v36 = [(HMDAssistantCommand *)v33 numberOfHomes];
    v37 = [(HMDAssistantCommand *)v33 primaryHomeName];
    v38 = [(HMDAssistantCommand *)v33 primaryHomeAssistantIdentifier];
    v39 = [(HMDAssistantCommand *)v33 currentHomeName];
    v40 = [(HMDAssistantCommand *)v33 currentHomeAssistantIdentifier];
    *(_DWORD *)buf = 138544642;
    id v63 = v35;
    __int16 v64 = 2048;
    uint64_t v65 = v36;
    __int16 v66 = 2112;
    v67 = v37;
    __int16 v68 = 2112;
    v69 = v38;
    __int16 v70 = 2112;
    v71 = v39;
    __int16 v72 = 2112;
    v73 = v40;
    _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_INFO, "%{public}@Number of homes: %tu, Primary home: %@, Primary home ID: %@, Current home: %@, Current home ID: %@", buf, 0x3Eu);

    v17 = v51;
    id v11 = v52;
  }
  v41 = [(HMDAssistantCommand *)v33 gather];
  v42 = [v41 homeKitObjects];
  [(HMDAssistantCommand *)v33 setHomeKitObjects:v42];

  v43 = [(HMDAssistantCommand *)v33 homeKitObjects];
  LODWORD(v42) = [v43 count] == 0;

  if (v42)
  {
    v45 = (void *)MEMORY[0x1D9452090]();
    v49 = v33;
    HMFGetOSLogHandle();
    v47 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      v50 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v63 = v50;
      _os_log_impl(&dword_1D49D5000, v47, OS_LOG_TYPE_INFO, "%{public}@There are no homekit objects, calling completion", buf, 0xCu);
    }
LABEL_10:

    [(HMDAssistantCommand *)self reportResults:0 handler:v56];
    goto LABEL_11;
  }
  v44 = [[HMDAssistantCommandHelper alloc] initWithQueue:v17 msgDispatcher:v55];
  [(HMDAssistantCommand *)v33 setAssistantCommandHelper:v44];

  [(HMDAssistantCommand *)v33 handleCommandWithCompletionHandler:v56];
LABEL_11:

  objc_destroyWeak(v60);
  objc_destroyWeak(&location);
}

void __72__HMDAssistantCommand_performWithGather_queue_msgDispatcher_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v7 = v6;
    double v8 = *(double *)(a1 + 48);
    v9 = (void *)MEMORY[0x1D9452090](v5);
    id v10 = WeakRetained;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v22 = v12;
      __int16 v23 = 2048;
      double v24 = v7 - v8;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Siri command took %.4f seconds", buf, 0x16u);
    }
    if ([v10 completionHandlerCalled])
    {
      id v13 = (void *)MEMORY[0x1D9452090]();
      id v14 = v10;
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        SEL v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v22 = v16;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Completion handler already called, not calling again", buf, 0xCu);
      }
    }
    else
    {
      [v10 setCompletionHandlerCalled:1];
      v17 = [v10 queue];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __72__HMDAssistantCommand_performWithGather_queue_msgDispatcher_completion___block_invoke_134;
      v18[3] = &unk_1E6A19530;
      id v20 = *(id *)(a1 + 32);
      id v19 = v3;
      dispatch_async(v17, v18);
    }
  }
}

uint64_t __72__HMDAssistantCommand_performWithGather_queue_msgDispatcher_completion___block_invoke_134(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)handleGetColor:(id)a3 forObjects:(id)a4 serviceType:(id)a5 completionHandler:(id)a6
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  id v61 = a3;
  id v11 = a4;
  id v60 = a5;
  id v63 = a6;
  id v12 = objc_alloc(MEMORY[0x1E4F653F0]);
  id v13 = NSString;
  id v14 = MEMORY[0x1D94505D0](self, a2);
  v15 = [v13 stringWithFormat:@"%@, %s:%ld", v14, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables_legacy/Sources/homed/Assistant/HMDAssistantCommand.m", 3630];
  v62 = (void *)[v12 initWithName:v15];

  id v55 = v11;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  obuint64_t j = [(id)supportedColorSpaces allKeys];
  uint64_t v16 = [obj countByEnumeratingWithState:&v105 objects:v120 count:16];
  v17 = v55;
  if (v16)
  {
    uint64_t v68 = *(void *)v106;
    v17 = v55;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v106 != v68) {
          objc_enumerationMutation(obj);
        }
        id v19 = [(id)supportedColorSpaces objectForKeyedSubscript:*(void *)(*((void *)&v105 + 1) + 8 * i)];
        long long v103 = 0u;
        long long v104 = 0u;
        long long v101 = 0u;
        long long v102 = 0u;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v101 objects:v119 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v102;
          do
          {
            uint64_t v22 = 0;
            __int16 v23 = v17;
            do
            {
              if (*(void *)v102 != v21) {
                objc_enumerationMutation(v19);
              }
              double v24 = [*(id *)(*((void *)&v101 + 1) + 8 * v22) readCharacteristicType];
              v17 = [(HMDAssistantCommand *)self filteredObjectsFromObjects:v23 byCharacteristicType:v24];

              ++v22;
              __int16 v23 = v17;
            }
            while (v20 != v22);
            uint64_t v20 = [v19 countByEnumeratingWithState:&v101 objects:v119 count:16];
          }
          while (v20);
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v105 objects:v120 count:16];
    }
    while (v16);
  }

  v69 = [MEMORY[0x1E4F1CA48] array];
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v56 = [(id)supportedColorSpaces allKeys];
  v58 = (char *)[v56 countByEnumeratingWithState:&v97 objects:v118 count:16];
  if (v58)
  {
    uint64_t v57 = *(void *)v98;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v98 != v57)
        {
          v26 = v25;
          objc_enumerationMutation(v56);
          uint64_t v25 = v26;
        }
        obja = v25;
        v27 = [(id)supportedColorSpaces objectForKeyedSubscript:*(void *)(*((void *)&v97 + 1) + 8 * (void)v25)];
        long long v95 = 0u;
        long long v96 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v93 objects:v117 count:16];
        if (v28)
        {
          uint64_t v29 = *(void *)v94;
          do
          {
            for (uint64_t j = 0; j != v28; ++j)
            {
              if (*(void *)v94 != v29) {
                objc_enumerationMutation(v27);
              }
              v31 = [*(id *)(*((void *)&v93 + 1) + 8 * j) readCharacteristicType];
              v116 = v31;
              v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v116 count:1];
              v33 = [(HMDAssistantCommand *)self filterObjects:v17 forCharacteristicTypes:v32];

              [v69 addObjectsFromArray:v33];
            }
            uint64_t v28 = [v27 countByEnumeratingWithState:&v93 objects:v117 count:16];
          }
          while (v28);
        }

        uint64_t v25 = obja + 1;
      }
      while (obja + 1 != v58);
      v58 = (char *)[v56 countByEnumeratingWithState:&v97 objects:v118 count:16];
    }
    while (v58);
  }

  if ([v69 count])
  {
    v34 = dispatch_group_create();
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v112 = 0x3032000000;
    v113 = __Block_byref_object_copy__13203;
    v114 = __Block_byref_object_dispose__13204;
    id v115 = [MEMORY[0x1E4F1CA48] array];
    id v35 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id v59 = v69;
    uint64_t v36 = [v59 countByEnumeratingWithState:&v89 objects:v110 count:16];
    if (v36)
    {
      id objb = *(id *)v90;
      do
      {
        for (uint64_t k = 0; k != v36; ++k)
        {
          if (*(id *)v90 != objb) {
            objc_enumerationMutation(v59);
          }
          v38 = *(void **)(*((void *)&v89 + 1) + 8 * k);
          v39 = [v38 service];
          v40 = [v39 accessory];
          v41 = [v40 home];

          v42 = [v35 objectForKey:v41];
          if (!v42)
          {
            v42 = [MEMORY[0x1E4F1CA48] array];
            [v35 setObject:v42 forKey:v41];
          }
          v43 = +[HMDCharacteristicRequest requestWithCharacteristic:v38];
          [v42 addObject:v43];
        }
        uint64_t v36 = [v59 countByEnumeratingWithState:&v89 objects:v110 count:16];
      }
      while (v36);
    }

    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v44 = v35;
    uint64_t v45 = [v44 countByEnumeratingWithState:&v85 objects:v109 count:16];
    if (v45)
    {
      id objc = *(id *)v86;
      do
      {
        for (uint64_t m = 0; m != v45; ++m)
        {
          if (*(id *)v86 != objc) {
            objc_enumerationMutation(v44);
          }
          uint64_t v47 = *(void *)(*((void *)&v85 + 1) + 8 * m);
          dispatch_group_enter(v34);
          v48 = [v44 objectForKey:v47];
          objc_initWeak(&location, self);
          v49 = [(HMDAssistantCommand *)self assistantCommandHelper];
          v75[0] = MEMORY[0x1E4F143A8];
          v75[1] = 3221225472;
          v75[2] = __79__HMDAssistantCommand_handleGetColor_forObjects_serviceType_completionHandler___block_invoke;
          v75[3] = &unk_1E6A07808;
          objc_copyWeak(&v83, &location);
          v76 = v34;
          id v81 = v63;
          id v77 = v61;
          id v78 = v60;
          p_long long buf = &buf;
          id v79 = v17;
          id v80 = v62;
          [v49 addReadRequests:v48 home:v47 completion:v75];

          objc_destroyWeak(&v83);
          objc_destroyWeak(&location);
        }
        uint64_t v45 = [v44 countByEnumeratingWithState:&v85 objects:v109 count:16];
      }
      while (v45);
    }

    v50 = [(HMDAssistantCommand *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__HMDAssistantCommand_handleGetColor_forObjects_serviceType_completionHandler___block_invoke_128;
    block[3] = &unk_1E6A17150;
    id v71 = v62;
    __int16 v72 = self;
    uint64_t v74 = &buf;
    id v73 = v63;
    dispatch_group_notify(v34, v50, block);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v51 = (void *)MEMORY[0x1D9452090]();
    id v52 = self;
    id v53 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      v54 = HMFGetLogIdentifier();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v54;
      _os_log_impl(&dword_1D49D5000, v53, OS_LOG_TYPE_INFO, "%{public}@No characteristics found after filtering objects", (uint8_t *)&buf, 0xCu);
    }
    [(HMDAssistantCommand *)v52 returnResults:0 serviceType:v60 forAction:v61 completionHandler:v63];
  }
}

void __79__HMDAssistantCommand_handleGetColor_forObjects_serviceType_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    double v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = WeakRetained;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v17 = 138543874;
      v18 = v11;
      __int16 v19 = 2112;
      id v20 = v5;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Received error %@ for read request with response tuples: %@", (uint8_t *)&v17, 0x20u);
    }
    id v12 = [v9 handleReadWriteResponses:v6 error:v5 forAction:*(void *)(a1 + 40) inServiceType:*(void *)(a1 + 48) results:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) forObjects:*(void *)(a1 + 56)];
    uint64_t v13 = [v5 code];
    uint64_t v14 = 82;
    if (unlockErrorCode) {
      uint64_t v14 = 2003;
    }
    if (v13 == v14) {
      goto LABEL_10;
    }
    uint64_t v15 = [v12 code];
    uint64_t v16 = 82;
    if (unlockErrorCode) {
      uint64_t v16 = 2003;
    }
    if (v15 == v16)
    {
LABEL_10:
      [*(id *)(a1 + 64) begin];
      [v9 reportUnlockRequired:*(void *)(a1 + 72)];
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
      [*(id *)(a1 + 64) end];
    }
    else
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

uint64_t __79__HMDAssistantCommand_handleGetColor_forObjects_serviceType_completionHandler___block_invoke_128(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]([*(id *)(a1 + 32) begin]);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    double v8 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@All results have been received for set-action-types, calling result handler", (uint8_t *)&v7, 0xCu);
  }
  [*(id *)(a1 + 40) reportResults:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) handler:*(void *)(a1 + 48)];
  return [*(id *)(a1 + 32) end];
}

- (void)handleSetColor:(id)a3 forObjects:(id)a4 service:(id)a5 completionHandler:(id)a6
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v64 = a3;
  id v59 = a4;
  id v63 = a5;
  id v55 = a6;
  id v11 = objc_alloc(MEMORY[0x1E4F653F0]);
  id v12 = NSString;
  val = self;
  uint64_t v13 = MEMORY[0x1D94505D0](self, a2);
  uint64_t v14 = [v12 stringWithFormat:@"%@, %s:%ld", v13, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables_legacy/Sources/homed/Assistant/HMDAssistantCommand.m", 3508];
  v54 = (void *)[v11 initWithName:v14];

  v62 = [(HMDAssistantCommand *)self parseColorEncoding:v64];
  if ([v62 count])
  {
    v49 = [v62 allKeys];
    uint64_t v15 = [(HMDAssistantCommand *)self filterObjects:v59 forCharacteristics:v49];
    id v65 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    uint64_t v99 = 0;
    long long v100 = &v99;
    uint64_t v101 = 0x3032000000;
    long long v102 = __Block_byref_object_copy__13203;
    long long v103 = __Block_byref_object_dispose__13204;
    id v104 = [MEMORY[0x1E4F1CA48] array];
    int v58 = [v64 includeCompleteInformation];
    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    obuint64_t j = v15;
    uint64_t v52 = [obj countByEnumeratingWithState:&v95 objects:v108 count:16];
    if (v52)
    {
      uint64_t v51 = *(void *)v96;
      uint64_t v57 = *MEMORY[0x1E4F2CDF8];
      uint64_t v56 = *MEMORY[0x1E4F96D18];
      do
      {
        for (uint64_t i = 0; i != v52; ++i)
        {
          if (*(void *)v96 != v51) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void **)(*((void *)&v95 + 1) + 8 * i);
          long long v91 = 0u;
          long long v92 = 0u;
          long long v93 = 0u;
          long long v94 = 0u;
          int v17 = [v16 allKeys];
          uint64_t v18 = [v17 countByEnumeratingWithState:&v91 objects:v107 count:16];
          if (v18)
          {
            uint64_t v19 = *(void *)v92;
            id v60 = v17;
            do
            {
              for (uint64_t j = 0; j != v18; ++j)
              {
                if (*(void *)v92 != v19) {
                  objc_enumerationMutation(v60);
                }
                uint64_t v21 = *(void *)(*((void *)&v91 + 1) + 8 * j);
                id v22 = [v16 objectForKey:v21];
                uint64_t v23 = objc_msgSend(v62, "hmf_numberForKey:", v21);
                double v24 = [v22 metadata];
                if (([v22 properties] & 4) != 0)
                {
                  uint64_t v28 = [(HMDAssistantCommand *)val updateValueToBoundary:v23 valueType:v57 fudgeMinimum:0 metadata:v24];

                  [v65 setObject:v28 forKey:v22];
                  uint64_t v23 = (void *)v28;
                }
                else
                {
                  uint64_t v25 = actionResultForAction(v64);
                  v26 = [v22 service];
                  [v25 setOutcome:v56];
                  v27 = entityForService(v26, v63, v59, v58);
                  [v25 setEntity:v27];

                  [(HMDAssistantCommand *)val populateResult:v25 withService:v26 serviceType:v63 characteristic:v22 resultAttribute:0 action:v64];
                  [(id)v100[5] addObject:v25];
                }
                [(HMDAssistantCommand *)val addActivationCharacteristicsIfNeeded:v65 forCharacteristic:v22];
              }
              int v17 = v60;
              uint64_t v18 = [v60 countByEnumeratingWithState:&v91 objects:v107 count:16];
            }
            while (v18);
          }
        }
        uint64_t v52 = [obj countByEnumeratingWithState:&v95 objects:v108 count:16];
      }
      while (v52);
    }

    id v61 = dispatch_group_create();
    uint64_t v29 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v66 = v65;
    uint64_t v30 = [v66 countByEnumeratingWithState:&v87 objects:v106 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v88;
      do
      {
        for (uint64_t k = 0; k != v30; ++k)
        {
          if (*(void *)v88 != v31) {
            objc_enumerationMutation(v66);
          }
          v33 = *(void **)(*((void *)&v87 + 1) + 8 * k);
          v34 = [v33 service];
          id v35 = [v34 accessory];
          uint64_t v36 = [v35 home];

          v37 = [v66 objectForKey:v33];
          v38 = [v29 objectForKey:v36];
          if (!v38)
          {
            v38 = [MEMORY[0x1E4F1CA48] array];
            [v29 setObject:v38 forKey:v36];
          }
          v39 = [v33 authorizationData];
          v40 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v33 value:v37 authorizationData:v39 type:0];

          [v38 addObject:v40];
        }
        uint64_t v30 = [v66 countByEnumeratingWithState:&v87 objects:v106 count:16];
      }
      while (v30);
    }

    objc_initWeak(&location, val);
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v41 = v29;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v82 objects:v105 count:16];
    if (v42)
    {
      uint64_t v43 = *(void *)v83;
      do
      {
        for (uint64_t m = 0; m != v42; ++m)
        {
          if (*(void *)v83 != v43) {
            objc_enumerationMutation(v41);
          }
          uint64_t v45 = *(void *)(*((void *)&v82 + 1) + 8 * m);
          dispatch_group_enter(v61);
          v46 = [v41 objectForKey:v45];
          uint64_t v47 = [(HMDAssistantCommand *)val assistantCommandHelper];
          v73[0] = MEMORY[0x1E4F143A8];
          v73[1] = 3221225472;
          v73[2] = __75__HMDAssistantCommand_handleSetColor_forObjects_service_completionHandler___block_invoke;
          v73[3] = &unk_1E6A07808;
          objc_copyWeak(&v81, &location);
          uint64_t v74 = v61;
          id v79 = v55;
          id v75 = v64;
          id v76 = v63;
          id v80 = &v99;
          id v77 = v59;
          id v78 = v54;
          [v47 addWriteRequests:v46 home:v45 completion:v73];

          objc_destroyWeak(&v81);
        }
        uint64_t v42 = [v41 countByEnumeratingWithState:&v82 objects:v105 count:16];
      }
      while (v42);
    }

    v48 = [(HMDAssistantCommand *)val queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__HMDAssistantCommand_handleSetColor_forObjects_service_completionHandler___block_invoke_127;
    block[3] = &unk_1E6A17150;
    id v69 = v54;
    __int16 v70 = val;
    __int16 v72 = &v99;
    id v71 = v55;
    dispatch_group_notify(v61, v48, block);

    objc_destroyWeak(&location);
    _Block_object_dispose(&v99, 8);
  }
  else
  {
    [(HMDAssistantCommand *)self reportOutcome:*MEMORY[0x1E4F96EB8] results:0 handler:v55];
  }
}

void __75__HMDAssistantCommand_handleSetColor_forObjects_service_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    double v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = WeakRetained;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v17 = 138543874;
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v5;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Received response %@ for write request with %@", (uint8_t *)&v17, 0x20u);
    }
    id v12 = [v9 handleReadWriteResponses:v6 error:v5 forAction:*(void *)(a1 + 40) inServiceType:*(void *)(a1 + 48) results:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) forObjects:*(void *)(a1 + 56)];
    uint64_t v13 = [v5 code];
    uint64_t v14 = 82;
    if (unlockErrorCode) {
      uint64_t v14 = 2003;
    }
    if (v13 == v14) {
      goto LABEL_10;
    }
    uint64_t v15 = [v12 code];
    uint64_t v16 = 82;
    if (unlockErrorCode) {
      uint64_t v16 = 2003;
    }
    if (v15 == v16)
    {
LABEL_10:
      [*(id *)(a1 + 64) begin];
      [v9 reportUnlockRequired:*(void *)(a1 + 72)];
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
      [*(id *)(a1 + 64) end];
    }
    else
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

uint64_t __75__HMDAssistantCommand_handleSetColor_forObjects_service_completionHandler___block_invoke_127(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]([*(id *)(a1 + 32) begin]);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    double v8 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@All results have been received for set-action-types, calling result handler", (uint8_t *)&v7, 0xCu);
  }
  [*(id *)(a1 + 40) reportResults:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) handler:*(void *)(a1 + 48)];
  return [*(id *)(a1 + 32) end];
}

- (id)readRequestsForCharacteristic:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 type];
  id v5 = [v3 service];
  id v6 = +[HMDCharacteristicRequest requestWithCharacteristic:v3];
  int v7 = [MEMORY[0x1E4F1CA48] arrayWithObject:v6];
  if ([v4 isEqual:@"00000064-0000-1000-8000-0026BB765291"])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    double v8 = [v5 characteristics];
    uint64_t v9 = (void *)[v8 copy];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      __int16 v19 = v7;
      id v20 = v5;
      __int16 v21 = v4;
      uint64_t v12 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v15 = [v14 type];
          int v16 = [v15 isEqual:@"00000065-0000-1000-8000-0026BB765291"];

          if (v16)
          {
            uint64_t v17 = +[HMDCharacteristicRequest requestWithCharacteristic:v14];

            int v7 = v19;
            [v19 addObject:v17];
            id v6 = (void *)v17;
            id v5 = v20;
            uint64_t v4 = v21;
            goto LABEL_12;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v11) {
          continue;
        }
        break;
      }
      id v5 = v20;
      uint64_t v4 = v21;
      int v7 = v19;
    }
LABEL_12:
  }
  return v7;
}

- (id)addStatusCharacteristicsIfNeeded:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v35 = (void *)[v3 mutableCopy];
  uint64_t v29 = +[HMDHAPMetadata getSharedInstance];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = v3;
  uint64_t v30 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v30)
  {
    uint64_t v28 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v46 != v28) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        id v6 = [v5 type];
        int v7 = [v5 service];
        double v8 = [v7 type];
        uint64_t v9 = [v29 getStatusCharacteristicTypes:v6 forServiceType:v8];

        uint64_t v36 = v9;
        if ([v9 count])
        {
          v32 = v6;
          uint64_t v33 = i;
          uint64_t v10 = [v5 service];
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          uint64_t v31 = v10;
          uint64_t v11 = [v10 characteristics];
          uint64_t v12 = (void *)[v11 copy];

          id v34 = v12;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v41 objects:v50 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v42;
            do
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v42 != v15) {
                  objc_enumerationMutation(v34);
                }
                uint64_t v17 = *(void **)(*((void *)&v41 + 1) + 8 * j);
                long long v37 = 0u;
                long long v38 = 0u;
                long long v39 = 0u;
                long long v40 = 0u;
                id v18 = v36;
                uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v49 count:16];
                if (v19)
                {
                  uint64_t v20 = v19;
                  uint64_t v21 = *(void *)v38;
                  while (2)
                  {
                    for (uint64_t k = 0; k != v20; ++k)
                    {
                      if (*(void *)v38 != v21) {
                        objc_enumerationMutation(v18);
                      }
                      uint64_t v23 = *(void *)(*((void *)&v37 + 1) + 8 * k);
                      long long v24 = [v17 type];
                      LODWORD(v23) = [v24 isEqual:v23];

                      if (v23)
                      {
                        if (([v35 containsObject:v17] & 1) == 0) {
                          [v35 addObject:v17];
                        }
                        goto LABEL_23;
                      }
                    }
                    uint64_t v20 = [v18 countByEnumeratingWithState:&v37 objects:v49 count:16];
                    if (v20) {
                      continue;
                    }
                    break;
                  }
                }
LABEL_23:
              }
              uint64_t v14 = [v34 countByEnumeratingWithState:&v41 objects:v50 count:16];
            }
            while (v14);
          }

          id v6 = v32;
          uint64_t i = v33;
        }
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v30);
  }

  long long v25 = (void *)[v35 copy];
  return v25;
}

- (void)addLinkedServiceCharacteristicsFor:(id)a3 toCollection:(id)a4 assistantObjects:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v32 = a4;
  id v31 = a5;
  double v8 = [v7 service];
  uint64_t v9 = +[HMDHAPMetadata getSharedInstance];
  uint64_t v10 = [v9 mapReadCharacteristicFromAssistantName:*MEMORY[0x1E4F96E38]];
  uint64_t v11 = [v9 mapFromAssistantServiceName:*MEMORY[0x1E4F971A8]];
  uint64_t v12 = [v9 mapFromAssistantServiceName:*MEMORY[0x1E4F971B8]];
  uint64_t v13 = [v7 type];
  if ([v13 isEqual:v10])
  {
    uint64_t v14 = [v8 type];
    int v15 = [v14 isEqual:v11];

    if (v15)
    {
      v26 = v11;
      uint64_t v27 = v9;
      id v29 = v7;
      int v16 = [v7 accessory];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v28 = v8;
      uint64_t v17 = [v8 linkedServices];
      id v18 = (void *)[v17 copy];

      uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v34;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v34 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = [v16 findService:*(void *)(*((void *)&v33 + 1) + 8 * v22)];
            long long v24 = [v23 type];
            int v25 = [v24 isEqual:v12];

            if (v25) {
              [(HMDAssistantCommand *)self addCharacteristicWithType:v10 fromService:v23 toCollection:v32 assistantObjects:v31];
            }

            ++v22;
          }
          while (v20 != v22);
          uint64_t v20 = [v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v20);
      }

      double v8 = v28;
      id v7 = v29;
      uint64_t v11 = v26;
      uint64_t v9 = v27;
    }
  }
  else
  {
  }
}

- (void)addBridgedAccessoryCharacteristicsFor:(id)a3 toCollection:(id)a4 assistantObjects:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v42 = a4;
  id v41 = a5;
  uint64_t v9 = [v8 service];
  uint64_t v10 = +[HMDHAPMetadata getSharedInstance];
  uint64_t v11 = [v10 mapReadCharacteristicFromAssistantName:*MEMORY[0x1E4F96E38]];
  uint64_t v12 = [v10 mapFromAssistantServiceName:*MEMORY[0x1E4F971B8]];
  uint64_t v13 = [v10 mapFromAssistantServiceName:*MEMORY[0x1E4F971A8]];
  uint64_t v14 = [v8 type];
  if ([v14 isEqual:v11])
  {
    int v15 = [v9 type];
    int v16 = [v15 isEqual:v13];

    if (v16)
    {
      id v31 = v13;
      id v32 = v10;
      long long v33 = v9;
      id v34 = v8;
      [v8 accessory];
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v37 = v50 = 0u;
      obuint64_t j = [v37 identifiersForBridgedAccessories];
      uint64_t v38 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
      if (v38)
      {
        uint64_t v36 = *(void *)v48;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v48 != v36) {
              objc_enumerationMutation(obj);
            }
            uint64_t v40 = v17;
            uint64_t v18 = *(void *)(*((void *)&v47 + 1) + 8 * v17);
            uint64_t v19 = [v37 home];
            uint64_t v20 = [v19 accessoryWithUUID:v18];

            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v21 = v20;
            }
            else {
              uint64_t v21 = 0;
            }
            id v22 = v21;

            long long v45 = 0u;
            long long v46 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            long long v39 = v22;
            uint64_t v23 = [v22 services];
            uint64_t v24 = [v23 countByEnumeratingWithState:&v43 objects:v51 count:16];
            if (v24)
            {
              uint64_t v25 = v24;
              uint64_t v26 = *(void *)v44;
              do
              {
                for (uint64_t i = 0; i != v25; ++i)
                {
                  if (*(void *)v44 != v26) {
                    objc_enumerationMutation(v23);
                  }
                  uint64_t v28 = *(void **)(*((void *)&v43 + 1) + 8 * i);
                  id v29 = [v28 type];
                  int v30 = [v29 isEqual:v12];

                  if (v30) {
                    [(HMDAssistantCommand *)self addCharacteristicWithType:v11 fromService:v28 toCollection:v42 assistantObjects:v41];
                  }
                }
                uint64_t v25 = [v23 countByEnumeratingWithState:&v43 objects:v51 count:16];
              }
              while (v25);
            }

            uint64_t v17 = v40 + 1;
          }
          while (v40 + 1 != v38);
          uint64_t v38 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
        }
        while (v38);
      }

      uint64_t v9 = v33;
      id v8 = v34;
      uint64_t v13 = v31;
      uint64_t v10 = v32;
    }
  }
  else
  {
  }
}

- (id)addCharacteristicsFromRelatedServicesFor:(id)a3 assistantObjects:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[v6 mutableCopy];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        -[HMDAssistantCommand addBridgedAccessoryCharacteristicsFor:toCollection:assistantObjects:](self, "addBridgedAccessoryCharacteristicsFor:toCollection:assistantObjects:", v14, v8, v7, (void)v17);
        [(HMDAssistantCommand *)self addLinkedServiceCharacteristicsFor:v14 toCollection:v8 assistantObjects:v7];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  int v15 = (void *)[v8 copy];
  return v15;
}

- (void)addCharacteristicWithType:(id)a3 fromService:(id)a4 toCollection:(id)a5 assistantObjects:(id)a6
{
  id v13 = a4;
  id v9 = a5;
  id v10 = a6;
  uint64_t v11 = [v13 findCharacteristicWithType:a3];
  if (v11)
  {
    if (([v9 containsObject:v11] & 1) == 0)
    {
      [v9 addObject:v11];
      if (v10)
      {
        uint64_t v12 = [v13 assistantObject];
        if (v12 && ([v10 containsObject:v12] & 1) == 0) {
          [v10 addObject:v12];
        }
      }
    }
  }
}

- (void)addActivationCharacteristicsIfNeeded:(id)a3 forCharacteristic:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  id v7 = [v6 type];
  if ((isActivationCharacteristicType(v7) & 1) == 0)
  {
    id v8 = [v6 service];
    id v9 = [v8 type];
    if ([v9 isEqual:*MEMORY[0x1E4F2DE78]])
    {
      id v10 = v7;
      if (([v10 isEqual:*MEMORY[0x1E4F2CE60]] & 1) == 0
        && ([v10 isEqual:*MEMORY[0x1E4F2CEF8]] & 1) == 0
        && ([v10 isEqual:*MEMORY[0x1E4F2CF90]] & 1) == 0)
      {
        uint64_t v11 = (void *)MEMORY[0x1E4F2CE78];
LABEL_23:
        char v14 = [v10 isEqual:*v11];

        if ((v14 & 1) == 0) {
          goto LABEL_18;
        }
        uint64_t v12 = (void *)MEMORY[0x1E4F2CF70];
LABEL_17:
        [(HMDAssistantCommand *)self addIfNeededActivationCharacteristic:*v12 fromService:v8 toCollection:v16];
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      if (![v9 isEqual:*MEMORY[0x1E4F2DE28]])
      {
        if (([v9 isEqual:*MEMORY[0x1E4F2DF10]] & 1) == 0
          && ([v9 isEqual:*MEMORY[0x1E4F2DDC0]] & 1) == 0
          && ![v9 isEqual:*MEMORY[0x1E4F2DE40]])
        {
          goto LABEL_18;
        }
        id v13 = v7;
        if (([v13 isEqual:*MEMORY[0x1E4F2CF80]] & 1) == 0
          && ([v13 isEqual:*MEMORY[0x1E4F2CF88]] & 1) == 0)
        {
          char v15 = [v13 isEqual:*MEMORY[0x1E4F2CFD8]];

          if ((v15 & 1) == 0) {
            goto LABEL_18;
          }
          uint64_t v12 = (void *)MEMORY[0x1E4F2CE48];
          goto LABEL_17;
        }
        uint64_t v12 = (void *)MEMORY[0x1E4F2CE48];
        goto LABEL_16;
      }
      id v10 = v7;
      if (([v10 isEqual:*MEMORY[0x1E4F2CF80]] & 1) == 0)
      {
        uint64_t v11 = (void *)MEMORY[0x1E4F2CF88];
        goto LABEL_23;
      }
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F2CF70];
LABEL_16:

    goto LABEL_17;
  }
LABEL_19:
}

- (void)addIfNeededActivationCharacteristic:(id)a3 fromService:(id)a4 toCollection:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = objc_msgSend(a4, "characteristics", 0);
  id v10 = (void *)[v9 copy];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        char v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v16 = [v15 type];
        int v17 = [v16 isEqual:v7];

        if (v17)
        {
          long long v18 = [v8 objectForKey:v15];

          if (!v18) {
            [v8 setObject:MEMORY[0x1E4F1CC38] forKey:v15];
          }
          goto LABEL_12;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (void)handleMediaReadWriteResponse:(id)a3 forAction:(id)a4 inServiceType:(id)a5 inHome:(id)a6 requestProperty:(id)a7 results:(id)a8 forObjects:(id)a9
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v49 = a5;
  id v48 = a6;
  id v16 = (__CFString *)a7;
  id v17 = a8;
  id v47 = a9;
  if (!v16)
  {
    id v16 = @"HMDMediaProfileSetValueUnsupportedAttributeKey";
    long long v18 = @"HMDMediaProfileSetValueUnsupportedAttributeKey";
  }
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  uint64_t v43 = [v14 countByEnumeratingWithState:&v60 objects:v65 count:16];
  if (v43)
  {
    id v55 = 0;
    uint64_t v41 = *(void *)v61;
    uint64_t v45 = *MEMORY[0x1E4F96D58];
    id v46 = v17;
    id v42 = v14;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v61 != v41) {
          objc_enumerationMutation(v14);
        }
        uint64_t v44 = v19;
        long long v20 = *(void **)(*((void *)&v60 + 1) + 8 * v19);
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v21 = v20;
        uint64_t v54 = [v21 countByEnumeratingWithState:&v56 objects:v64 count:16];
        if (v54)
        {
          uint64_t v53 = *(void *)v57;
          id v50 = v21;
          do
          {
            for (uint64_t i = 0; i != v54; ++i)
            {
              if (*(void *)v57 != v53) {
                objc_enumerationMutation(v21);
              }
              uint64_t v23 = *(void *)(*((void *)&v56 + 1) + 8 * i);
              uint64_t v24 = [v21 objectForKeyedSubscript:v23];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                uint64_t v25 = v24;
              }
              else {
                uint64_t v25 = 0;
              }
              id v26 = v25;

              if (v26)
              {
                uint64_t v27 = actionResultForAction(v15);
                uint64_t v28 = [v26 objectForKeyedSubscript:v16];
                if (v28)
                {
                  objc_opt_class();
                  char isKindOfClass = objc_opt_isKindOfClass();
                  if (isKindOfClass) {
                    int v30 = v28;
                  }
                  else {
                    int v30 = 0;
                  }
                  id v51 = v30;
                  if (isKindOfClass)
                  {
                    id v31 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v28 error:0];
                    id v32 = [(HMDAssistantCommand *)self actionOutcomeFromError:v31];
                    [v27 setOutcome:v32];

                    id v17 = v46;
                    uint64_t v33 = [(HMDAssistantCommand *)self getValueOfType:0 action:v15];

                    id v34 = (id)v33;
                  }
                  else
                  {
                    id v35 = v28;
                    objc_opt_class();
                    if (objc_opt_isKindOfClass()) {
                      uint64_t v36 = v35;
                    }
                    else {
                      uint64_t v36 = 0;
                    }
                    id v37 = v36;

                    [v27 setOutcome:v45];
                    id v34 = v37;
                  }
                }
                else
                {
                  id v34 = v55;
                }
                id v55 = v34;
                -[HMDAssistantCommand populateMediaProfileWriteResult:withValue:serviceType:action:](self, "populateMediaProfileWriteResult:withValue:serviceType:action:", v27);
                uint64_t v38 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v23];
                long long v39 = [v48 mediaProfileWithUUID:v38];

                uint64_t v40 = entityForMediaProfile(v39, v47, [v15 includeCompleteInformation]);
                [v27 setEntity:v40];

                [v17 addObject:v27];
                id v21 = v50;
              }
            }
            uint64_t v54 = [v21 countByEnumeratingWithState:&v56 objects:v64 count:16];
          }
          while (v54);
        }

        uint64_t v19 = v44 + 1;
        id v14 = v42;
      }
      while (v44 + 1 != v43);
      uint64_t v43 = [v42 countByEnumeratingWithState:&v60 objects:v65 count:16];
    }
    while (v43);
  }
  else
  {
    id v55 = 0;
  }
}

- (id)handleReadWriteResponses:(id)a3 error:(id)a4 forAction:(id)a5 inServiceType:(id)a6 results:(id)a7 forObjects:(id)a8
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v85 = a6;
  id v17 = a7;
  id v18 = a8;
  uint64_t v19 = [v15 code];
  uint64_t v20 = 82;
  if (unlockErrorCode) {
    uint64_t v20 = 2003;
  }
  if (v19 == v20)
  {
    id v21 = 0;
  }
  else
  {
    id v62 = v15;
    long long v83 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    id v63 = v14;
    obuint64_t j = v14;
    uint64_t v22 = [obj countByEnumeratingWithState:&v98 objects:v117 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v81 = *(void *)v99;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v99 != v81) {
            objc_enumerationMutation(obj);
          }
          uint64_t v25 = *(void **)(*((void *)&v98 + 1) + 8 * i);
          id v26 = [v25 request];
          uint64_t v27 = [v26 characteristic];
          uint64_t v28 = [v27 service];

          id v29 = [v83 objectForKey:v28];
          if (!v29)
          {
            id v29 = [MEMORY[0x1E4F1CA48] array];
            [v83 setObject:v29 forKey:v28];
          }
          [v29 addObject:v25];
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v98 objects:v117 count:16];
      }
      while (v23);
    }

    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id v75 = v83;
    uint64_t v74 = [v75 countByEnumeratingWithState:&v94 objects:v116 count:16];
    if (v74)
    {
      id v78 = 0;
      uint64_t v73 = *(void *)v95;
      uint64_t v82 = *MEMORY[0x1E4F96D58];
      uint64_t v72 = *MEMORY[0x1E4F96E08];
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v95 != v73) {
            objc_enumerationMutation(v75);
          }
          id v76 = *(void **)(*((void *)&v94 + 1) + 8 * v30);
          uint64_t v77 = v30;
          id v31 = objc_msgSend(v75, "objectForKey:");
          id v32 = (void *)[v31 mutableCopy];

          long long v84 = actionResultForAction(v16);
          long long v90 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
          long long v93 = 0u;
          id v33 = v32;
          uint64_t v34 = [v33 countByEnumeratingWithState:&v90 objects:v115 count:16];
          if (v34)
          {
            uint64_t v35 = v34;
            uint64_t v36 = *(void *)v91;
            id v37 = v78;
            id obja = v33;
            while (2)
            {
              for (uint64_t j = 0; j != v35; ++j)
              {
                if (*(void *)v91 != v36) {
                  objc_enumerationMutation(obja);
                }
                long long v39 = *(void **)(*((void *)&v90 + 1) + 8 * j);
                uint64_t v40 = [v39 error];

                if (v40)
                {
                  uint64_t v41 = (void *)MEMORY[0x1D9452090]();
                  id v42 = self;
                  uint64_t v43 = HMFGetOSLogHandle();
                  id v78 = v40;
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    v71 = __int16 v70 = v41;
                    uint64_t v65 = [v40 code];
                    id v69 = [v76 accessory];
                    [v69 name];
                    v44 = uint64_t v68 = v42;
                    v67 = [v76 accessory];
                    uint64_t v66 = [v67 uuid];
                    uint64_t v45 = [v66 UUIDString];
                    id v46 = [v76 instanceID];
                    id v64 = [v39 request];
                    id v47 = [v64 characteristic];
                    id v48 = [v47 instanceID];
                    *(_DWORD *)long long buf = 138544642;
                    id v104 = v71;
                    __int16 v105 = 2048;
                    uint64_t v106 = v65;
                    __int16 v107 = 2112;
                    long long v108 = v44;
                    __int16 v109 = 2112;
                    v110 = v45;
                    __int16 v111 = 2112;
                    uint64_t v112 = v46;
                    __int16 v113 = 2112;
                    v114 = v48;
                    _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_INFO, "%{public}@Error %tu for %@/%@/%@/%@", buf, 0x3Eu);

                    id v42 = v68;
                    uint64_t v40 = v78;

                    uint64_t v41 = v70;
                  }

                  uint64_t v49 = [v40 code];
                  uint64_t v50 = 82;
                  if (unlockErrorCode) {
                    uint64_t v50 = 2003;
                  }
                  id v33 = obja;
                  if (v49 != v50)
                  {
                    id v51 = [(HMDAssistantCommand *)v42 actionOutcomeFromError:v40];
                    [v84 setOutcome:v51];
                  }
                  goto LABEL_34;
                }
                [v84 setOutcome:v82];
                id v37 = 0;
              }
              id v33 = obja;
              uint64_t v35 = [obja countByEnumeratingWithState:&v90 objects:v115 count:16];
              id v37 = 0;
              id v78 = 0;
              if (v35) {
                continue;
              }
              break;
            }
          }
LABEL_34:

          uint64_t v52 = [v16 attribute];
          int v53 = [v52 isEqual:v72];

          if (v53)
          {
            [(HMDAssistantCommand *)self populateColorResult:v84 serviceType:v85 service:v76 action:v16 responses:v33 forObjects:v18];
            [v17 addObject:v84];
          }
          long long v88 = 0u;
          long long v89 = 0u;
          long long v86 = 0u;
          long long v87 = 0u;
          id v54 = v33;
          uint64_t v55 = [v54 countByEnumeratingWithState:&v86 objects:v102 count:16];
          if (v55)
          {
            uint64_t v56 = v55;
            uint64_t v57 = *(void *)v87;
            do
            {
              for (uint64_t k = 0; k != v56; ++k)
              {
                if (*(void *)v87 != v57) {
                  objc_enumerationMutation(v54);
                }
                uint64_t v59 = *(void *)(*((void *)&v86 + 1) + 8 * k);
                long long v60 = actionResultForAction(v16);
                [(HMDAssistantCommand *)self populateResult:v60 fromResponse:v59 responses:v54 forAction:v16 serviceType:v85 forObjects:v18];
                [v17 addObject:v60];
              }
              uint64_t v56 = [v54 countByEnumeratingWithState:&v86 objects:v102 count:16];
            }
            while (v56);
          }

          uint64_t v30 = v77 + 1;
        }
        while (v77 + 1 != v74);
        uint64_t v74 = [v75 countByEnumeratingWithState:&v94 objects:v116 count:16];
      }
      while (v74);
    }
    else
    {
      id v78 = 0;
    }

    id v15 = v62;
    id v14 = v63;
    id v21 = v78;
  }

  return v21;
}

- (BOOL)populateColorResult:(id)a3 serviceType:(id)a4 service:(id)a5 action:(id)a6 responses:(id)a7 forObjects:(id)a8
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v53 = a4;
  id v52 = a5;
  id v14 = a6;
  id v64 = a7;
  id v51 = a8;
  id v15 = [MEMORY[0x1E4F28E78] string];
  id v16 = [v14 attribute];
  long long v60 = v13;
  [v13 setResultAttribute:v16];

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  obuint64_t j = [(id)supportedColorSpaces allKeys];
  uint64_t v59 = v15;
  uint64_t v56 = [obj countByEnumeratingWithState:&v76 objects:v82 count:16];
  if (v56)
  {
    uint64_t v55 = *(void *)v77;
    uint64_t v63 = *MEMORY[0x1E4F96DA8];
    id v61 = v14;
    while (2)
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v77 != v55) {
          objc_enumerationMutation(obj);
        }
        uint64_t v57 = v17;
        uint64_t v58 = *(void *)(*((void *)&v76 + 1) + 8 * v17);
        id v18 = objc_msgSend((id)supportedColorSpaces, "objectForKeyedSubscript:");
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        id v19 = v18;
        uint64_t v66 = [v19 countByEnumeratingWithState:&v72 objects:v81 count:16];
        if (v66)
        {
          uint64_t v65 = *(void *)v73;
          id v62 = v19;
          do
          {
            for (uint64_t i = 0; i != v66; ++i)
            {
              if (*(void *)v73 != v65) {
                objc_enumerationMutation(v19);
              }
              id v21 = *(void **)(*((void *)&v72 + 1) + 8 * i);
              uint64_t v22 = [v14 actionType];
              int v23 = [v22 isEqualToString:v63];

              if (v23) {
                [v21 readCharacteristicType];
              }
              else {
              uint64_t v24 = [v21 writeCharacteristicType];
              }
              long long v70 = 0u;
              long long v71 = 0u;
              long long v68 = 0u;
              long long v69 = 0u;
              id v25 = v64;
              id v26 = (void *)[v25 countByEnumeratingWithState:&v68 objects:v80 count:16];
              if (v26)
              {
                uint64_t v67 = i;
                uint64_t v27 = *(void *)v69;
                while (2)
                {
                  for (uint64_t j = 0; j != v26; uint64_t j = (char *)j + 1)
                  {
                    if (*(void *)v69 != v27) {
                      objc_enumerationMutation(v25);
                    }
                    id v29 = *(void **)(*((void *)&v68 + 1) + 8 * (void)j);
                    uint64_t v30 = [v29 request];
                    id v31 = [v30 characteristic];
                    id v32 = [v31 characteristicType];
                    char v33 = [v32 isEqualToString:v24];

                    if (v33)
                    {
                      id v34 = v29;
                      uint64_t v35 = [v34 request];
                      id v26 = [v35 characteristic];

                      if (v26)
                      {
                        uint64_t v36 = [v60 outcome];
                        int v37 = isOutcomeSuccess(v36);

                        id v14 = v61;
                        if (v37)
                        {
                          [v25 removeObject:v34];
                          id v19 = v62;
                          if ([v59 length]) {
                            [v59 appendString:@","];
                          }
                          else {
                            [v59 appendFormat:@"%@%@", v58, @":"];
                          }
                          id v25 = [v26 value];
                          [v59 appendFormat:@"%@", v25];
                          goto LABEL_32;
                        }
                      }
                      else
                      {
                        id v14 = v61;
                      }
                      id v19 = v62;
                      uint64_t i = v67;
                      goto LABEL_34;
                    }
                  }
                  id v26 = (void *)[v25 countByEnumeratingWithState:&v68 objects:v80 count:16];
                  if (v26) {
                    continue;
                  }
                  break;
                }
                id v34 = 0;
                id v14 = v61;
                id v19 = v62;
LABEL_32:
                uint64_t i = v67;
              }
              else
              {
                id v34 = 0;
              }

LABEL_34:
            }
            uint64_t v66 = [v19 countByEnumeratingWithState:&v72 objects:v81 count:16];
          }
          while (v66);
        }

        id v15 = v59;
        if ([v59 length])
        {
          [v59 appendString:@";"];

          goto LABEL_41;
        }

        uint64_t v17 = v57 + 1;
      }
      while (v57 + 1 != v56);
      uint64_t v56 = [obj countByEnumeratingWithState:&v76 objects:v82 count:16];
      if (v56) {
        continue;
      }
      break;
    }
  }
LABEL_41:

  if ([v15 length])
  {
    id v38 = objc_alloc_init(MEMORY[0x1E4F966C0]);
    [v38 setValue:v15];
    [v60 setResultValue:v38];
    uint64_t v39 = [v14 value];
    if (v39)
    {
      uint64_t v40 = (void *)v39;
      uint64_t v41 = [v14 actionType];
      if (v41)
      {
        id v42 = (void *)v41;
        uint64_t v43 = [v14 actionType];
        int v44 = [v43 isEqualToString:*MEMORY[0x1E4F96DA8]];

        if (!v44) {
          goto LABEL_45;
        }
      }
      else
      {
      }
      id v46 = [v14 value];
      id v47 = [v60 resultValue];
      BOOL v45 = [(HMDAssistantCommand *)self isAttributeValue:v46 equalTo:v47];

      goto LABEL_49;
    }
LABEL_45:
    BOOL v45 = 1;
LABEL_49:

    goto LABEL_50;
  }
  BOOL v45 = 1;
LABEL_50:
  id v48 = entityForService(v52, v53, v51, [v14 includeCompleteInformation]);
  [v60 setEntity:v48];

  return v45;
}

- (id)parseColorEncoding:(id)a3
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)*MEMORY[0x1E4F96DA8];
  id v6 = [v4 actionType];
  long long v89 = v5;
  if ([v5 isEqualToString:v6])
  {
  }
  else
  {
    id v7 = (void *)*MEMORY[0x1E4F96DD8];
    id v8 = [v4 actionType];
    LOBYTE(v7) = [v7 isEqualToString:v8];

    if ((v7 & 1) == 0)
    {
      uint64_t v59 = (void *)MEMORY[0x1D9452090]();
      long long v60 = self;
      id v61 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        id v62 = HMFGetLogIdentifier();
        uint64_t v66 = [v4 actionType];
        *(_DWORD *)long long buf = 138543618;
        long long v99 = v62;
        __int16 v100 = 2112;
        long long v101 = v66;
        _os_log_impl(&dword_1D49D5000, v61, OS_LOG_TYPE_DEFAULT, "%{public}@Action type for COLOR attribute is not GET/SET - %@", buf, 0x16u);

        goto LABEL_68;
      }
LABEL_69:

      id v67 = 0;
      goto LABEL_76;
    }
  }
  id v9 = [v4 value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v59 = (void *)MEMORY[0x1D9452090]();
    long long v60 = self;
    id v61 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      id v62 = HMFGetLogIdentifier();
      uint64_t v63 = [v4 value];
      id v64 = [v4 value];
      *(_DWORD *)long long buf = 138543874;
      long long v99 = v62;
      __int16 v100 = 2112;
      long long v101 = v63;
      __int16 v102 = 2112;
      id v103 = (id)objc_opt_class();
      id v65 = v103;
      _os_log_impl(&dword_1D49D5000, v61, OS_LOG_TYPE_DEFAULT, "%{public}@Value %@ for COLOR attribute is not string but %@", buf, 0x20u);

LABEL_68:
      goto LABEL_69;
    }
    goto LABEL_69;
  }
  uint64_t v11 = [v4 value];
  uint64_t v12 = [v11 value];

  id v80 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v74 = v12;
  id v13 = [v12 componentsSeparatedByString:@";"];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v94 objects:v106 count:16];
  if (!v14) {
    goto LABEL_74;
  }
  uint64_t v15 = v14;
  id v16 = &logCategory__hmf_once_t4;
  long long v88 = (void *)*MEMORY[0x1E4F2CDF8];
  uint64_t v82 = (void *)*MEMORY[0x1E4F2CE00];
  uint64_t v83 = *(void *)v95;
  long long v79 = (void *)*MEMORY[0x1E4F2CDF0];
  long long v87 = self;
  id v77 = v4;
  long long v75 = v13;
LABEL_7:
  uint64_t v17 = 0;
  uint64_t v76 = v15;
LABEL_8:
  if (*(void *)v95 != v83) {
    objc_enumerationMutation(v13);
  }
  id v18 = *(void **)(*((void *)&v94 + 1) + 8 * v17);
  if (![v18 length]) {
    goto LABEL_61;
  }
  uint64_t v85 = v17;
  id v19 = [v18 componentsSeparatedByString:@":"];
  if ([v19 count] == 2)
  {
    uint64_t v20 = [v19 firstObject];
    long long v86 = [(id)v16[65] allKeys];
    long long v90 = (void *)v20;
    if (([v86 containsObject:v20] & 1) == 0)
    {
      uint64_t v49 = (void *)MEMORY[0x1D9452090]();
      uint64_t v50 = self;
      id v51 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        id v52 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543874;
        long long v99 = v52;
        __int16 v100 = 2112;
        long long v101 = v90;
        __int16 v102 = 2112;
        id v103 = v86;
        _os_log_impl(&dword_1D49D5000, v51, OS_LOG_TYPE_INFO, "%{public}@Unsupported color space: %@; only support %@. Ignoring...",
          buf,
          0x20u);
      }
      id v16 = &logCategory__hmf_once_t4;
      goto LABEL_60;
    }
    id v21 = [(id)v16[65] objectForKey:v20];
    uint64_t v81 = [v19 objectAtIndex:1];
    uint64_t v22 = [v81 componentsSeparatedByString:@","];
    uint64_t v23 = [v22 count];
    long long v92 = v21;
    long long v91 = v22;
    if (v23 != [v21 count])
    {
      id v53 = (void *)MEMORY[0x1D9452090]();
      id v54 = self;
      uint64_t v55 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        uint64_t v56 = HMFGetLogIdentifier();
        uint64_t v57 = (void *)[v92 count];
        uint64_t v58 = [v91 count];
        *(_DWORD *)long long buf = 138544130;
        long long v99 = v56;
        __int16 v100 = 2112;
        long long v101 = v90;
        __int16 v102 = 2048;
        id v103 = v57;
        __int16 v104 = 2048;
        uint64_t v105 = v58;
        _os_log_impl(&dword_1D49D5000, v55, OS_LOG_TYPE_INFO, "%{public}@Color space %@ requires %tu values - %tu provided. Ignoring...", buf, 0x2Au);

        uint64_t v22 = v91;
      }

      id v16 = &logCategory__hmf_once_t4;
      goto LABEL_59;
    }
    if (![v22 count]) {
      goto LABEL_73;
    }
    long long v78 = v19;
    int v24 = 0;
    uint64_t v25 = 0;
    while (1)
    {
      id v26 = (void *)MEMORY[0x1E4F28FE8];
      uint64_t v27 = [v22 objectAtIndex:v25];
      uint64_t v28 = [v26 scannerWithString:v27];

      id v29 = [v92 objectAtIndex:v25];
      uint64_t v30 = [v29 format];
      id v31 = [v4 actionType];
      LODWORD(v27) = [v89 isEqualToString:v31];

      if (v27) {
        [v29 readCharacteristicType];
      }
      else {
      id v32 = [v29 writeCharacteristicType];
      }
      if (v32)
      {
        if ([v30 isEqualToString:v88])
        {
          double v93 = 0.0;
          if ([v28 scanDouble:&v93])
          {
            int v84 = v24;
            uint64_t v33 = [NSNumber numberWithDouble:v93];
            goto LABEL_33;
          }
          id v34 = (void *)MEMORY[0x1D9452090]();
          uint64_t v35 = self;
          uint64_t v36 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            int v37 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138544130;
            long long v99 = v37;
            __int16 v100 = 2112;
            long long v101 = v90;
            __int16 v102 = 2112;
            id v103 = v32;
            __int16 v104 = 2112;
            uint64_t v105 = (uint64_t)v88;
            id v38 = v36;
            uint64_t v39 = "%{public}@Color space %@ value for attribute %@ is not of format '%@'. Ignoring...";
            goto LABEL_46;
          }
        }
        else if ([v30 isEqualToString:v82])
        {
          double v93 = 0.0;
          if ([v28 scanLongLong:&v93])
          {
            int v84 = v24;
            uint64_t v33 = [NSNumber numberWithLongLong:*(void *)&v93];
            goto LABEL_33;
          }
          id v34 = (void *)MEMORY[0x1D9452090]();
          uint64_t v35 = self;
          uint64_t v36 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            int v37 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138544130;
            long long v99 = v37;
            __int16 v100 = 2112;
            long long v101 = v90;
            __int16 v102 = 2112;
            id v103 = v32;
            __int16 v104 = 2112;
            uint64_t v105 = (uint64_t)v82;
            id v38 = v36;
            uint64_t v39 = "%{public}@Color space %@ value for attribute %@ is not of format '%@'. Ignoring...";
            goto LABEL_46;
          }
        }
        else if ([v30 isEqualToString:v79])
        {
          LODWORD(v93) = 0;
          if ([v28 scanInt:&v93])
          {
            int v84 = v24;
            uint64_t v33 = [NSNumber numberWithBool:LODWORD(v93) != 0];
LABEL_33:
            uint64_t v41 = (void *)v33;
            id v42 = (void *)MEMORY[0x1D9452090]();
            uint64_t v43 = self;
            int v44 = HMFGetOSLogHandle();
            BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_INFO);
            if (v41)
            {
              if (v45)
              {
                id v46 = HMFGetLogIdentifier();
                *(_DWORD *)long long buf = 138544130;
                long long v99 = v46;
                __int16 v100 = 2112;
                long long v101 = v90;
                __int16 v102 = 2112;
                id v103 = v32;
                __int16 v104 = 2112;
                uint64_t v105 = (uint64_t)v41;
                _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_INFO, "%{public}@Color space %@:  %@=%@", buf, 0x2Au);

                id v4 = v77;
              }

              [v80 setObject:v41 forKey:v32];

              char v47 = 1;
              self = v87;
              int v24 = v84;
            }
            else
            {
              if (v45)
              {
                id v48 = HMFGetLogIdentifier();
                *(_DWORD *)long long buf = 138543874;
                long long v99 = v48;
                __int16 v100 = 2112;
                long long v101 = v90;
                __int16 v102 = 2112;
                id v103 = v32;
                _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_INFO, "%{public}@Color space %@ characteristicType %@ value is nil", buf, 0x20u);
              }
              char v47 = 0;
              int v24 = 1;
              self = v87;
            }
            goto LABEL_49;
          }
          id v34 = (void *)MEMORY[0x1D9452090]();
          uint64_t v35 = self;
          uint64_t v36 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            int v37 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138544130;
            long long v99 = v37;
            __int16 v100 = 2112;
            long long v101 = v90;
            __int16 v102 = 2112;
            id v103 = v32;
            __int16 v104 = 2112;
            uint64_t v105 = (uint64_t)v79;
            id v38 = v36;
            uint64_t v39 = "%{public}@Color space %@ value for attribute %@ is not of format '%@'. Ignoring...";
LABEL_46:
            uint32_t v40 = 42;
LABEL_47:
            _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_INFO, v39, buf, v40);

            self = v87;
          }
        }
        else
        {
          id v34 = (void *)MEMORY[0x1D9452090]();
          uint64_t v35 = self;
          uint64_t v36 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            int v37 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138544130;
            long long v99 = v37;
            __int16 v100 = 2112;
            long long v101 = v90;
            __int16 v102 = 2112;
            id v103 = v32;
            __int16 v104 = 2112;
            uint64_t v105 = (uint64_t)v30;
            id v38 = v36;
            uint64_t v39 = "%{public}@Color space %@ value for attribute %@ is not of a recognized format: %@. Ignoring...";
            goto LABEL_46;
          }
        }
      }
      else
      {
        id v34 = (void *)MEMORY[0x1D9452090]();
        uint64_t v35 = self;
        uint64_t v36 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          int v37 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543874;
          long long v99 = v37;
          __int16 v100 = 2112;
          long long v101 = v90;
          __int16 v102 = 2112;
          id v103 = v4;
          id v38 = v36;
          uint64_t v39 = "%{public}@Color space %@ characteristicType is nil for action %@.";
          uint32_t v40 = 32;
          goto LABEL_47;
        }
      }

      char v47 = 0;
      int v24 = 1;
LABEL_49:

      uint64_t v22 = v91;
      if ((v47 & 1) != 0 && ++v25 < (unint64_t)[v91 count]) {
        continue;
      }
      id v13 = v75;
      uint64_t v15 = v76;
      id v19 = v78;
      id v16 = &logCategory__hmf_once_t4;
      if ((v24 & 1) == 0)
      {
LABEL_73:

        goto LABEL_74;
      }
LABEL_59:

LABEL_60:
      uint64_t v17 = v85;
LABEL_61:
      if (++v17 == v15)
      {
        uint64_t v15 = [v13 countByEnumeratingWithState:&v94 objects:v106 count:16];
        if (!v15)
        {
LABEL_74:

          long long v72 = v80;
          id v67 = v80;
          goto LABEL_75;
        }
        goto LABEL_7;
      }
      goto LABEL_8;
    }
  }
  long long v68 = (void *)MEMORY[0x1D9452090]();
  long long v69 = self;
  long long v70 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
  {
    long long v71 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    long long v99 = v71;
    __int16 v100 = 2112;
    long long v101 = v19;
    _os_log_impl(&dword_1D49D5000, v70, OS_LOG_TYPE_ERROR, "%{public}@Color space encoding does not have two components: %@", buf, 0x16u);
  }

  id v67 = 0;
  long long v72 = v80;
LABEL_75:

LABEL_76:
  return v67;
}

- (void)handleCommandWithCompletionHandler:(id)a3
{
  uint64_t v154 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDAssistantCommand *)self actions];
  id v6 = [v5 firstObject];

  mach_absolute_time();
  uint64_t v7 = [(HMDAssistantCommand *)self setStartTime:UpTicksToMilliseconds()];
  id v8 = (void *)MEMORY[0x1D9452090](v7);
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    uint64_t v12 = [v6 aceId];
    id v13 = [(HMDAssistantCommand *)v9 serverValidity];
    uint64_t v14 = [(HMDAssistantCommand *)v9 hm_shortDescription];
    *(_DWORD *)long long buf = 138544130;
    v147 = v11;
    __int16 v148 = 2114;
    id v149 = v12;
    __int16 v150 = 2114;
    v151 = v13;
    __int16 v152 = 2112;
    v153 = v14;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Executing Siri command(%{public}@) serverValidity %{public}@:\n%@", buf, 0x2Au);
  }
  uint64_t v15 = [v6 actionType];

  if (v15)
  {
    id v16 = [(HMDAssistantCommand *)v9 homeManager];
    uint64_t v17 = [(HMDAssistantCommand *)v9 filter];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v18 = v17;
    }
    else {
      id v18 = 0;
    }
    id v19 = v18;

    if (v19)
    {
      uint64_t v20 = v16;
      id v21 = [v19 serviceType];
      uint64_t v22 = [v21 isEqualToString:*MEMORY[0x1E4F97190]];

      uint64_t v23 = [v6 attribute];
      int v24 = [v23 isEqualToString:*MEMORY[0x1E4F96E20]];

      if (v24)
      {
        uint64_t v25 = [v6 actionType];
        int v26 = [v25 isEqualToString:*MEMORY[0x1E4F96DD8]];

        [v19 entityType];
        uint64_t v28 = v27 = v19;
        int v29 = [v28 isEqualToString:*MEMORY[0x1E4F96FE0]];

        uint64_t v30 = [v27 sceneName];

        uint64_t v31 = [v27 sceneType];
        id v32 = v4;
        uint64_t v33 = v30 | v31;
        id v19 = v27;

        BOOL v34 = v33 == 0;
        id v4 = v32;
        BOOL v35 = !v34;
        if (!v26 || !v29 || !v35)
        {
          uint64_t v76 = (void *)MEMORY[0x1D9452090]();
          id v77 = v9;
          long long v78 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            long long v79 = v129 = v76;
            id v80 = [v6 actionType];
            uint64_t v81 = [v27 sceneName];
            [v27 sceneType];
            uint64_t v83 = v82 = v6;
            *(_DWORD *)long long buf = 138544130;
            v147 = v79;
            __int16 v148 = 2112;
            id v149 = v80;
            __int16 v150 = 2112;
            v151 = v81;
            __int16 v152 = 2112;
            v153 = v83;
            _os_log_impl(&dword_1D49D5000, v78, OS_LOG_TYPE_INFO, "%{public}@entityType is SCENE with ENABLED action attribute but either action(%@) is not SET action/empty sceneName(%@)/Type(%@)", buf, 0x2Au);

            id v6 = v82;
            id v4 = v32;

            id v19 = v27;
            uint64_t v76 = v129;
          }

          [(HMDAssistantCommand *)v77 reportOutcome:*MEMORY[0x1E4F96EB8] results:0 handler:v4];
          id v16 = v20;
          goto LABEL_85;
        }
      }
      uint64_t v36 = [v19 homeIdentifier];
      if (v36 || ([v19 homeName], (uint64_t v36 = objc_claimAutoreleasedReturnValue()) != 0))
      {

        id v16 = v20;
      }
      else
      {
        id v103 = [v6 actionType];
        char v104 = [v103 isEqualToString:*MEMORY[0x1E4F96DA8]];

        id v16 = v20;
        if ((v104 & 1) == 0)
        {
          id v105 = v4;
          id v106 = v19;
          uint64_t v107 = (void *)MEMORY[0x1D9452090]();
          long long v108 = v9;
          __int16 v109 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v109, OS_LOG_TYPE_FAULT))
          {
            v110 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138543362;
            v147 = v110;
            _os_log_impl(&dword_1D49D5000, v109, OS_LOG_TYPE_FAULT, "%{public}@Search filter must specify homeName or homeIdentifier for actions not of type GET", buf, 0xCu);
          }
          id v19 = v106;
          id v4 = v105;
        }
      }
      uint64_t v37 = [(HMDAssistantCommand *)v9 _homeWithSearchFilter:v19];
      if (v37)
      {
        id v38 = (void *)v37;
        id v140 = 0;
        id v39 = [(HMDAssistantCommand *)v9 objectsWithSearchFilter:v19 inHome:v37 serviceTypeIsATV:v22 overrideServiceTypeIfNeeded:&v140];
        id v40 = v140;
LABEL_20:

        if ([v39 count])
        {
          id v41 = v4;
          v133 = v6;
          id v42 = [(HMDAssistantCommand *)v9 home];

          if (!v42)
          {
            id v124 = v40;
            v125 = [v39 firstObject];
            objc_msgSend(v125, "hmf_stringForKey:", @"objectHomeIdentifier");
            id v43 = (id)objc_claimAutoreleasedReturnValue();
            long long v141 = 0u;
            long long v142 = 0u;
            long long v143 = 0u;
            long long v144 = 0u;
            int v44 = [v16 homes];
            id v45 = (id)[v44 countByEnumeratingWithState:&v141 objects:buf count:16];
            if (v45)
            {
              id v123 = v39;
              id v128 = v19;
              v131 = v16;
              id v126 = v41;
              uint64_t v46 = *(void *)v142;
              while (2)
              {
                for (uint64_t i = 0; i != v45; uint64_t i = (char *)i + 1)
                {
                  if (*(void *)v142 != v46) {
                    objc_enumerationMutation(v44);
                  }
                  id v48 = *(void **)(*((void *)&v141 + 1) + 8 * i);
                  uint64_t v49 = [v48 urlString];
                  char v50 = [v43 isEqualToString:v49];

                  if (v50)
                  {
                    id v45 = v48;
                    goto LABEL_70;
                  }
                }
                id v45 = (id)[v44 countByEnumeratingWithState:&v141 objects:buf count:16];
                if (v45) {
                  continue;
                }
                break;
              }
LABEL_70:
              id v41 = v126;
              id v19 = v128;
              id v16 = v131;
              id v39 = v123;
            }

            [(HMDAssistantCommand *)v9 setHome:v45];
            __int16 v111 = [(HMDAssistantCommand *)v9 home];

            if (!v111)
            {
              uint64_t v112 = (void *)MEMORY[0x1D9452090]();
              __int16 v113 = v9;
              v114 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                id v115 = v130 = v112;
                *(_DWORD *)long long buf = 138543618;
                v147 = v115;
                __int16 v148 = 2112;
                id v149 = v125;
                _os_log_impl(&dword_1D49D5000, v114, OS_LOG_TYPE_ERROR, "%{public}@Cannot evaluate home for Siri command with filtered result: %@", buf, 0x16u);

                uint64_t v112 = v130;
              }
            }

            id v40 = v124;
          }
          v116 = (void *)MEMORY[0x1D9452090]();
          v117 = v9;
          uint64_t v118 = HMFGetOSLogHandle();
          BOOL v119 = os_log_type_enabled(v118, OS_LOG_TYPE_INFO);
          if (v22)
          {
            if (v119)
            {
              v120 = HMFGetLogIdentifier();
              *(_DWORD *)long long buf = 138543362;
              v147 = v120;
              _os_log_impl(&dword_1D49D5000, v118, OS_LOG_TYPE_INFO, "%{public}@Start handling command for Apple Media Accessory", buf, 0xCu);
            }
            uint64_t v121 = [v19 serviceType];
            id v6 = v133;
            [(HMDAssistantCommand *)v117 _handleCommandForMediaAccessoryAction:v133 objects:v39 serviceType:v121 completionHandler:v41];

            id v4 = v41;
          }
          else
          {
            if (v119)
            {
              v122 = HMFGetLogIdentifier();
              *(_DWORD *)long long buf = 138543362;
              v147 = v122;
              _os_log_impl(&dword_1D49D5000, v118, OS_LOG_TYPE_INFO, "%{public}@Start handling command for HAP Characteristic", buf, 0xCu);
            }
            id v6 = v133;
            id v4 = v41;
            [(HMDAssistantCommand *)v117 _handleCommandForHAPAction:v133 serviceType:v40 objects:v39 completionHandler:v41];
          }
        }
        else
        {
          int v84 = v40;
          uint64_t v85 = (void *)MEMORY[0x1D9452090]();
          long long v86 = v9;
          long long v87 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v89 = id v88 = v4;
            *(_DWORD *)long long buf = 138543362;
            v147 = v89;
            _os_log_impl(&dword_1D49D5000, v87, OS_LOG_TYPE_INFO, "%{public}@No matches found after filtering, bailing out", buf, 0xCu);

            id v4 = v88;
          }

          [(HMDAssistantCommand *)v86 returnResults:0 serviceType:v84 forAction:v6 completionHandler:v4];
        }
        goto LABEL_85;
      }
      uint64_t v66 = (void *)MEMORY[0x1D9452090]();
      id v67 = v9;
      long long v74 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
      {
        long long v75 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        v147 = v75;
        _os_log_impl(&dword_1D49D5000, v74, OS_LOG_TYPE_INFO, "%{public}@Could not figure out the home to apply the command to", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v55 = [(HMDAssistantCommand *)v9 filter];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v38 = [(HMDAssistantCommand *)v9 filter];
        uint64_t v57 = [v38 identifiers];
        id v139 = 0;
        uint64_t v58 = [(HMDAssistantCommand *)v9 objectsWithIdentifierList:v57 error:&v139];
        id v59 = v139;

        v132 = v16;
        if (!v59)
        {
          if (![v58 count])
          {
            long long v90 = (void *)MEMORY[0x1D9452090]();
            long long v91 = v9;
            long long v92 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              id v93 = v4;
              v95 = long long v94 = v6;
              *(_DWORD *)long long buf = 138543362;
              v147 = v95;
              _os_log_impl(&dword_1D49D5000, v92, OS_LOG_TYPE_INFO, "%{public}@Identifier list filter results in no matches - re-generating sync data and requesting re-sync", buf, 0xCu);

              id v6 = v94;
              id v4 = v93;
            }

            [v16 assistantSyncDataChanged:@"HMDIdentifierListFilterNoMatches"];
          }
          v134 = v6;
          long long v137 = 0u;
          long long v138 = 0u;
          long long v135 = 0u;
          long long v136 = 0u;
          id v39 = v58;
          uint64_t v96 = [v39 countByEnumeratingWithState:&v135 objects:v145 count:16];
          if (v96)
          {
            uint64_t v97 = v96;
            long long v98 = v39;
            id v127 = v4;
            uint64_t v99 = *(void *)v136;
            uint64_t v100 = *MEMORY[0x1E4F97190];
LABEL_58:
            uint64_t v101 = 0;
            while (1)
            {
              if (*(void *)v136 != v99) {
                objc_enumerationMutation(v98);
              }
              __int16 v102 = [*(id *)(*((void *)&v135 + 1) + 8 * v101) objectForKeyedSubscript:@"objectServiceType"];
              LODWORD(v22) = [v102 isEqualToString:v100];

              if (v22) {
                break;
              }
              if (v97 == ++v101)
              {
                uint64_t v97 = [v98 countByEnumeratingWithState:&v135 objects:v145 count:16];
                if (v97) {
                  goto LABEL_58;
                }
                break;
              }
            }
            id v39 = v98;

            id v40 = 0;
            id v4 = v127;
          }
          else
          {

            LODWORD(v22) = 0;
            id v40 = 0;
          }
          id v16 = v132;
          id v6 = v134;
          id v19 = 0;
          goto LABEL_20;
        }
        long long v60 = (void *)MEMORY[0x1D9452090]();
        id v61 = v9;
        id v62 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          id v63 = v4;
          v65 = id v64 = v6;
          *(_DWORD *)long long buf = 138543618;
          v147 = v65;
          __int16 v148 = 2114;
          id v149 = v59;
          _os_log_impl(&dword_1D49D5000, v62, OS_LOG_TYPE_INFO, "%{public}@Identifier list filter resolution failed with error %{public}@", buf, 0x16u);

          id v6 = v64;
          id v4 = v63;
        }

        [(HMDAssistantCommand *)v61 reportOutcome:*MEMORY[0x1E4F96EB8] results:0 handler:v4];

        id v19 = 0;
LABEL_85:

        goto LABEL_86;
      }
      uint64_t v66 = (void *)MEMORY[0x1D9452090]();
      id v67 = v9;
      long long v68 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        long long v70 = v69 = v4;
        long long v71 = [(HMDAssistantCommand *)v67 filter];
        long long v72 = objc_opt_class();
        *(_DWORD *)long long buf = 138543618;
        v147 = v70;
        __int16 v148 = 2112;
        id v149 = v72;
        id v73 = v72;
        _os_log_impl(&dword_1D49D5000, v68, OS_LOG_TYPE_INFO, "%{public}@Unsupported filter type - %@", buf, 0x16u);

        id v19 = 0;
        id v4 = v69;
      }
    }
    [(HMDAssistantCommand *)v67 reportOutcome:*MEMORY[0x1E4F96EB8] results:0 handler:v4];
    goto LABEL_85;
  }
  id v51 = (void *)MEMORY[0x1D9452090]();
  id v52 = v9;
  id v53 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
  {
    id v54 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543362;
    v147 = v54;
    _os_log_impl(&dword_1D49D5000, v53, OS_LOG_TYPE_INFO, "%{public}@There is no actionType, reporting malformed command", buf, 0xCu);
  }
  [(HMDAssistantCommand *)v52 reportOutcome:*MEMORY[0x1E4F96EB8] results:0 handler:v4];
LABEL_86:
}

- (void)_handleCommandForHAPAction:(id)a3 serviceType:(id)a4 objects:(id)a5 completionHandler:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v10 actionType];
  if ([v14 isEqualToString:*MEMORY[0x1E4F96DA8]])
  {

LABEL_4:
    [(HMDAssistantCommand *)self handleGetActionTypes:v10 serviceType:v11 forObjects:v12 completionHandler:v13];
    goto LABEL_10;
  }
  uint64_t v15 = [v10 actionType];
  int v16 = [v15 isEqualToString:*MEMORY[0x1E4F96DC8]];

  if (v16) {
    goto LABEL_4;
  }
  uint64_t v17 = [v10 actionType];
  if ([v17 isEqualToString:*MEMORY[0x1E4F96DB8]]) {
    goto LABEL_8;
  }
  id v18 = [v10 actionType];
  if ([v18 isEqualToString:*MEMORY[0x1E4F96DB0]])
  {

LABEL_8:
LABEL_9:
    [(HMDAssistantCommand *)self handleGetMetadataActionTypes:v10 serviceType:v11 forObjects:v12 completionHandler:v13];
    goto LABEL_10;
  }
  id v19 = [v10 actionType];
  char v20 = [v19 isEqualToString:*MEMORY[0x1E4F96DC0]];

  if (v20) {
    goto LABEL_9;
  }
  id v21 = [v10 actionType];
  if ([v21 isEqualToString:*MEMORY[0x1E4F96DD8]]) {
    goto LABEL_15;
  }
  uint64_t v22 = [v10 actionType];
  if ([v22 isEqualToString:*MEMORY[0x1E4F96DE8]])
  {

LABEL_15:
LABEL_16:
    [(HMDAssistantCommand *)self handleSetActionTypes:v10 serviceType:v11 forObjects:v12 completionHandler:v13];
    goto LABEL_10;
  }
  uint64_t v23 = [v10 actionType];
  char v24 = [v23 isEqualToString:*MEMORY[0x1E4F96DE0]];

  if (v24) {
    goto LABEL_16;
  }
  uint64_t v25 = [v10 actionType];
  if ([v25 isEqualToString:*MEMORY[0x1E4F96DD0]]) {
    goto LABEL_21;
  }
  int v26 = [v10 actionType];
  if ([v26 isEqualToString:*MEMORY[0x1E4F96DA0]])
  {

LABEL_21:
LABEL_22:
    [(HMDAssistantCommand *)self handleUpdateActionTypes:v10 serviceType:v11 forObjects:v12 completionHandler:v13];
    goto LABEL_10;
  }
  uint64_t v27 = [v10 actionType];
  char v28 = [v27 isEqualToString:*MEMORY[0x1E4F96DF0]];

  if (v28) {
    goto LABEL_22;
  }
  int v29 = (void *)MEMORY[0x1D9452090]();
  uint64_t v30 = self;
  uint64_t v31 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    id v32 = HMFGetLogIdentifier();
    uint64_t v33 = [v10 actionType];
    int v34 = 138543874;
    BOOL v35 = v32;
    __int16 v36 = 2080;
    uint64_t v37 = "-[HMDAssistantCommand _handleCommandForHAPAction:serviceType:objects:completionHandler:]";
    __int16 v38 = 2112;
    id v39 = v33;
    _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@%s ### Siri sent an unsupported action type: %@", (uint8_t *)&v34, 0x20u);
  }
  [(HMDAssistantCommand *)v30 reportOutcome:*MEMORY[0x1E4F96EB8] results:0 handler:v13];
LABEL_10:
}

- (void)_handleCommandForMediaAccessoryAction:(id)a3 objects:(id)a4 serviceType:(id)a5 completionHandler:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v10 actionType];
  int v15 = [v14 isEqualToString:*MEMORY[0x1E4F96DA8]];

  if (v15)
  {
    int v16 = (void *)MEMORY[0x1D9452090]();
    uint64_t v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    goto LABEL_8;
  }
  id v19 = [v10 actionType];
  int v20 = [v19 isEqualToString:*MEMORY[0x1E4F96DD8]];

  if (!v20)
  {
    int v16 = (void *)MEMORY[0x1D9452090]();
    uint64_t v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
LABEL_7:
      id v21 = HMFGetLogIdentifier();
      uint64_t v22 = [v10 actionType];
      int v23 = 138543874;
      char v24 = v21;
      __int16 v25 = 2080;
      int v26 = "-[HMDAssistantCommand _handleCommandForMediaAccessoryAction:objects:serviceType:completionHandler:]";
      __int16 v27 = 2112;
      char v28 = v22;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@%s ### Siri sent an unsupported action type: %@", (uint8_t *)&v23, 0x20u);
    }
LABEL_8:

    [(HMDAssistantCommand *)v17 reportOutcome:*MEMORY[0x1E4F96EB8] results:0 handler:v13];
    goto LABEL_9;
  }
  [(HMDAssistantCommand *)self handleMediaAccessorySetActionType:v10 forObjects:v11 withServiceType:v12 completionHandler:v13];
LABEL_9:
}

- (void)handleUpdateActionTypes:(id)a3 serviceType:(id)a4 forObjects:(id)a5 completionHandler:(id)a6
{
  v152[1] = *MEMORY[0x1E4F143B8];
  id v106 = a3;
  id v105 = a4;
  id v11 = a5;
  id v88 = a6;
  id v12 = objc_alloc(MEMORY[0x1E4F653F0]);
  id v13 = NSString;
  val = self;
  uint64_t v14 = MEMORY[0x1D94505D0](self, a2);
  int v15 = [v13 stringWithFormat:@"%@, %s:%ld", v14, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables_legacy/Sources/homed/Assistant/HMDAssistantCommand.m", 2519];
  long long v87 = (void *)[v12 initWithName:v15];

  int v16 = [v106 attribute];

  if (v16)
  {
    uint64_t v17 = [v106 attribute];
    id v18 = [v106 actionType];
    long long v98 = [(HMDAssistantCommand *)self filteredObjectsFromObjects:v11 byAttribute:v17 forActionType:v18];

    id v11 = v98;
    if ([v98 count])
    {
      long long v86 = +[HMDHAPMetadata getSharedInstance];
      id v19 = [v106 attribute];
      uint64_t v85 = [v86 mapReadCharacteristicFromAssistantName:v19];

      if (!v85)
      {
        __int16 v25 = (void *)MEMORY[0x1D9452090]();
        int v26 = self;
        __int16 v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          char v28 = HMFGetLogIdentifier();
          uint64_t v29 = [v106 attribute];
          *(_DWORD *)long long buf = 138543618;
          *(void *)&uint8_t buf[4] = v28;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v29;
          _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot map actionAttribute(%@) to a characteristicType", buf, 0x16u);
        }
        [(HMDAssistantCommand *)v26 reportOutcome:*MEMORY[0x1E4F96EB8] results:0 handler:v88];
        goto LABEL_82;
      }
      int v20 = objc_msgSend(v86, "getAliasedCharacteristicTypes:");
      if ([v20 count])
      {
        uint64_t v83 = [v20 arrayByAddingObject:v85];
        [(HMDAssistantCommand *)self filterObjects:v98 forCharacteristicTypes:v83];
      }
      else
      {
        v152[0] = v85;
        uint64_t v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:v152 count:1];
        [(HMDAssistantCommand *)self filterObjects:v98 forCharacteristicTypes:v83];
      int v84 = };
      if (![v84 count])
      {
        [(HMDAssistantCommand *)self returnResults:0 serviceType:v105 forAction:v106 completionHandler:v88];
LABEL_81:

LABEL_82:
        id v11 = v98;
        goto LABEL_83;
      }
      uint64_t v30 = [v106 attribute];
      uint64_t v82 = [v86 mapCharacteristicValueType:v30];

      uint64_t v31 = [v106 actionType];
      if ([v31 isEqualToString:*MEMORY[0x1E4F96DF0]])
      {
        char v32 = [v82 isEqualToString:*MEMORY[0x1E4F2CDF0]];

        if ((v32 & 1) == 0)
        {
          uint64_t v33 = (void *)MEMORY[0x1D9452090]();
          int v34 = self;
          BOOL v35 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            __int16 v36 = HMFGetLogIdentifier();
            uint64_t v37 = [v106 actionType];
            *(_DWORD *)long long buf = 138544130;
            *(void *)&uint8_t buf[4] = v36;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "-[HMDAssistantCommand handleUpdateActionTypes:serviceType:forObjects:completionHandler:]";
            *(_WORD *)&buf[22] = 2112;
            __int16 v150 = v37;
            LOWORD(v151) = 2112;
            *(void *)((char *)&v151 + 2) = v82;
            _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@%s ### Siri passed an incorrect action (%@) to a %@ value type.", buf, 0x2Au);
          }
LABEL_79:

          [(HMDAssistantCommand *)v34 reportOutcome:*MEMORY[0x1E4F96EB8] results:0 handler:v88];
LABEL_80:

          goto LABEL_81;
        }
      }
      else
      {
      }
      __int16 v38 = [v106 actionType];
      uint64_t v39 = *MEMORY[0x1E4F96DA0];
      if ([v38 isEqualToString:*MEMORY[0x1E4F96DA0]])
      {
        if (([v82 isEqualToString:*MEMORY[0x1E4F2CE00]] & 1) == 0)
        {
          char v40 = [v82 isEqualToString:*MEMORY[0x1E4F2CDF8]];

          if ((v40 & 1) == 0)
          {
LABEL_77:
            uint64_t v33 = (void *)MEMORY[0x1D9452090]();
            int v34 = self;
            BOOL v35 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              id v80 = HMFGetLogIdentifier();
              uint64_t v81 = [v106 actionType];
              *(_DWORD *)long long buf = 138544130;
              *(void *)&uint8_t buf[4] = v80;
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = "-[HMDAssistantCommand handleUpdateActionTypes:serviceType:forObjects:completionHandler:]";
              *(_WORD *)&buf[22] = 2112;
              __int16 v150 = v81;
              LOWORD(v151) = 2112;
              *(void *)((char *)&v151 + 2) = v82;
              _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@%s ### Siri passed an incorrect action (%@) to a %@ value type.", buf, 0x2Au);
            }
            goto LABEL_79;
          }
LABEL_30:
          group = dispatch_group_create();
          *(void *)long long buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          __int16 v150 = __Block_byref_object_copy__13203;
          *(void *)&long long v151 = __Block_byref_object_dispose__13204;
          *((void *)&v151 + 1) = [MEMORY[0x1E4F1CA48] array];
          id v42 = [v106 attribute];
          char v104 = [v86 mapWriteCharacteristicFromAssistantName:v42];

          id v43 = [v106 actionType];
          int v91 = [v43 isEqualToString:v39];

          if (v104)
          {
            id v103 = objc_msgSend(v86, "getAliasedCharacteristicTypes:");

            id v95 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
            int v97 = [v106 includeCompleteInformation];
            long long v140 = 0u;
            long long v141 = 0u;
            long long v138 = 0u;
            long long v139 = 0u;
            obuint64_t j = v84;
            uint64_t v44 = [obj countByEnumeratingWithState:&v138 objects:v145 count:16];
            if (v44)
            {
              to = *(id **)v139;
              uint64_t v89 = *MEMORY[0x1E4F96D18];
              do
              {
                uint64_t v101 = v44;
                for (uint64_t i = 0; i != v101; ++i)
                {
                  if (*(id **)v139 != to) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v46 = *(void **)(*((void *)&v138 + 1) + 8 * i);
                  char v47 = [v46 service];
                  id v48 = [v47 characteristics];
                  uint64_t v49 = objc_msgSend(v48, "hmf_firstObjectWithCharacteristicType:", v104);

                  long long v136 = 0u;
                  long long v137 = 0u;
                  long long v134 = 0u;
                  long long v135 = 0u;
                  id v50 = v103;
                  uint64_t v51 = [v50 countByEnumeratingWithState:&v134 objects:v144 count:16];
                  if (v51)
                  {
                    uint64_t v52 = *(void *)v135;
LABEL_38:
                    uint64_t v53 = 0;
                    while (1)
                    {
                      if (*(void *)v135 != v52) {
                        objc_enumerationMutation(v50);
                      }
                      if (v49) {
                        break;
                      }
                      uint64_t v54 = *(void *)(*((void *)&v134 + 1) + 8 * v53);
                      uint64_t v55 = [v47 characteristics];
                      uint64_t v49 = objc_msgSend(v55, "hmf_firstObjectWithCharacteristicType:", v54);

                      if (v51 == ++v53)
                      {
                        uint64_t v51 = [v50 countByEnumeratingWithState:&v134 objects:v144 count:16];
                        if (v51) {
                          goto LABEL_38;
                        }
                        break;
                      }
                    }
                  }

                  if (([v49 properties] & 4) != 0)
                  {
                    uint64_t v58 = [v47 accessory];
                    uint64_t v56 = [v58 home];

                    id v59 = [v95 objectForKey:v56];
                    if (!v59)
                    {
                      id v59 = [MEMORY[0x1E4F1CA48] array];
                      [v95 setObject:v59 forKey:v56];
                    }
                    long long v60 = +[HMDCharacteristicRequest requestWithCharacteristic:v46];
                    [v59 addObject:v60];
                  }
                  else
                  {
                    uint64_t v56 = actionResultForAction(v106);
                    [v56 setOutcome:v89];
                    uint64_t v57 = entityForService(v47, v105, v98, v97);
                    [v56 setEntity:v57];

                    [(HMDAssistantCommand *)val populateResult:v56 withService:v47 serviceType:v105 characteristic:v46 resultAttribute:0 action:v106];
                    [*(id *)(*(void *)&buf[8] + 40) addObject:v56];
                  }
                }
                uint64_t v44 = [obj countByEnumeratingWithState:&v138 objects:v145 count:16];
              }
              while (v44);
            }

            objc_initWeak((id *)location, val);
            long long v132 = 0u;
            long long v133 = 0u;
            long long v130 = 0u;
            long long v131 = 0u;
            id v96 = v95;
            id obja = (id)[v96 countByEnumeratingWithState:&v130 objects:v143 count:16];
            if (obja)
            {
              uint64_t v90 = *(void *)v131;
              do
              {
                for (uint64_t j = 0; j != obja; uint64_t j = (char *)j + 1)
                {
                  if (*(void *)v131 != v90) {
                    objc_enumerationMutation(v96);
                  }
                  uint64_t v61 = *(void *)(*((void *)&v130 + 1) + 8 * (void)j);
                  dispatch_group_enter(group);
                  id v62 = [v96 objectForKey:v61];
                  if (v91)
                  {
                    id v63 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v62];
                    long long v128 = 0u;
                    long long v129 = 0u;
                    long long v126 = 0u;
                    long long v127 = 0u;
                    id v64 = v62;
                    uint64_t v65 = [v64 countByEnumeratingWithState:&v126 objects:v142 count:16];
                    if (v65)
                    {
                      uint64_t v66 = *(void *)v127;
                      do
                      {
                        for (uint64_t k = 0; k != v65; ++k)
                        {
                          if (*(void *)v127 != v66) {
                            objc_enumerationMutation(v64);
                          }
                          long long v68 = [*(id *)(*((void *)&v126 + 1) + 8 * k) characteristic];
                          id v69 = [v68 service];
                          long long v70 = getActivationCharacteristicFromServiceIfAny(v69);

                          long long v71 = +[HMDCharacteristicRequest requestWithCharacteristic:v70];
                          if (v70 && ([v63 containsObject:v71] & 1) == 0) {
                            [v63 addObject:v71];
                          }
                        }
                        uint64_t v65 = [v64 countByEnumeratingWithState:&v126 objects:v142 count:16];
                      }
                      while (v65);
                    }

                    id v62 = (void *)[v63 copy];
                  }
                  else
                  {
                    id v63 = 0;
                  }
                  long long v72 = [(HMDAssistantCommand *)val assistantCommandHelper];
                  v112[0] = MEMORY[0x1E4F143A8];
                  v112[1] = 3221225472;
                  v112[2] = __88__HMDAssistantCommand_handleUpdateActionTypes_serviceType_forObjects_completionHandler___block_invoke;
                  v112[3] = &unk_1E6A07880;
                  objc_copyWeak(&v123, (id *)location);
                  id v113 = v87;
                  char v124 = v91;
                  id v114 = v106;
                  id v115 = v105;
                  id v116 = v98;
                  v122 = buf;
                  char v125 = v97;
                  id v117 = v104;
                  id v118 = v103;
                  id v121 = v88;
                  BOOL v119 = group;
                  uint64_t v120 = v61;
                  [v72 addReadRequests:v62 home:v61 completion:v112];

                  objc_destroyWeak(&v123);
                }
                id obja = (id)[v96 countByEnumeratingWithState:&v130 objects:v143 count:16];
              }
              while (obja);
            }

            id v73 = [(HMDAssistantCommand *)val queue];
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __88__HMDAssistantCommand_handleUpdateActionTypes_serviceType_forObjects_completionHandler___block_invoke_111;
            block[3] = &unk_1E6A17150;
            id v108 = v87;
            __int16 v109 = val;
            __int16 v111 = buf;
            id v110 = v88;
            dispatch_group_notify(group, v73, block);

            objc_destroyWeak((id *)location);
            int v20 = v103;
          }
          else
          {
            long long v74 = (void *)MEMORY[0x1D9452090]();
            long long v75 = self;
            HMFGetOSLogHandle();
            uint64_t v76 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              id v77 = (id)objc_claimAutoreleasedReturnValue();
              long long v78 = [v106 attribute];
              *(_DWORD *)id location = 138543618;
              *(void *)&location[4] = v77;
              __int16 v147 = 2112;
              __int16 v148 = v78;
              _os_log_impl(&dword_1D49D5000, v76, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot map actionAttribute(%@) to a characteristicType", location, 0x16u);
            }
            [(HMDAssistantCommand *)v75 reportOutcome:*MEMORY[0x1E4F96EB8] results:0 handler:v88];
          }

          _Block_object_dispose(buf, 8);
          goto LABEL_80;
        }
      }
      else
      {
        id v41 = [v106 actionType];
        if (([v41 isEqualToString:*MEMORY[0x1E4F96DD0]] & 1) != 0
          && ([v82 isEqualToString:*MEMORY[0x1E4F2CE00]] & 1) == 0)
        {
          char v79 = [v82 isEqualToString:*MEMORY[0x1E4F2CDF8]];

          if ((v79 & 1) == 0) {
            goto LABEL_77;
          }
          goto LABEL_30;
        }
      }
      goto LABEL_30;
    }
    [(HMDAssistantCommand *)self returnResults:0 serviceType:v105 forAction:v106 completionHandler:v88];
  }
  else
  {
    id v21 = (void *)MEMORY[0x1D9452090]();
    uint64_t v22 = self;
    int v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      char v24 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v24;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@In Update action types, There is no attribute in action - reporting as malformed command", buf, 0xCu);
    }
    [(HMDAssistantCommand *)v22 reportOutcome:*MEMORY[0x1E4F96EB8] results:0 handler:v88];
  }
LABEL_83:
}

void __88__HMDAssistantCommand_handleUpdateActionTypes_serviceType_forObjects_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  id v93 = a2;
  id v92 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
  if (!WeakRetained) {
    goto LABEL_82;
  }
  frouint64_t m = (id *)(a1 + 112);
  uint64_t v103 = a1;
  id v6 = (void *)MEMORY[0x1D9452090]([*(id *)(a1 + 32) begin]);
  id v91 = WeakRetained;
  id v100 = WeakRetained;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543874;
    long long v132 = v8;
    __int16 v133 = 2112;
    id v134 = v92;
    __int16 v135 = 2112;
    id v136 = v93;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Received response %@ for read request with error %@", buf, 0x20u);
  }
  long long v94 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
  uint64_t v9 = [v93 code];
  uint64_t v10 = 82;
  if (unlockErrorCode) {
    uint64_t v10 = 2003;
  }
  if (v9 == v10)
  {
    id v11 = 0;
    goto LABEL_63;
  }
  long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  obuint64_t j = v92;
  uint64_t v99 = [obj countByEnumeratingWithState:&v120 objects:v130 count:16];
  if (!v99)
  {
    id v12 = 0;
    goto LABEL_62;
  }
  id v12 = 0;
  uint64_t v97 = *(void *)v121;
  uint64_t v89 = *MEMORY[0x1E4F96D58];
  uint64_t v88 = *MEMORY[0x1E4F96E58];
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v121 != v97) {
        objc_enumerationMutation(obj);
      }
      uint64_t v14 = *(void **)(*((void *)&v120 + 1) + 8 * v13);
      int v15 = objc_msgSend(v14, "request", v88);
      uint64_t v101 = [v15 characteristic];

      if (!*(unsigned char *)(v103 + 120)
        || ([v101 type],
            int v16 = objc_claimAutoreleasedReturnValue(),
            char v17 = isActivationCharacteristicType(v16),
            v16,
            (v17 & 1) == 0))
      {
        id v18 = [v14 error];

        if (v18)
        {
          uint64_t v19 = [v18 code];
          uint64_t v20 = 82;
          if (unlockErrorCode) {
            uint64_t v20 = 2003;
          }
          if (v19 == v20)
          {

            id v12 = v18;
            goto LABEL_62;
          }
          actionResultForAction(*(void **)(v103 + 40));
          id v21 = (id)objc_claimAutoreleasedReturnValue();
          [v100 populateResult:v21 fromResponse:v14 responses:obj forAction:*(void *)(v103 + 40) serviceType:*(void *)(v103 + 48) forObjects:*(void *)(v103 + 56)];
          [*(id *)(*(void *)(*(void *)(v103 + 104) + 8) + 40) addObject:v21];
          goto LABEL_54;
        }
        uint64_t v22 = [v101 service];
        id v21 = v22;
        if (*(unsigned char *)(v103 + 120))
        {
          int v23 = getActivationCharacteristicFromServiceIfAny(v22);
          char v24 = v23;
          if (v23)
          {
            __int16 v25 = [v23 value];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              int v26 = v25;
            }
            else {
              int v26 = 0;
            }
            id v27 = v26;

            if (v27)
            {
              BOOL v28 = [v27 intValue] == 0;

              if (v28)
              {
                uint64_t v29 = *(void **)(v103 + 48);
                BOOL v30 = *(unsigned char *)(v103 + 121) != 0;
                uint64_t v31 = (objc_class *)MEMORY[0x1E4F96670];
                id v32 = *(id *)(v103 + 56);
                id v33 = v29;
                id v21 = v21;
                id v34 = objc_alloc_init(v31);
                [v34 setOutcome:v89];
                BOOL v35 = entityForService(v21, v33, v32, v30);

                [v34 setEntity:v35];
                [v34 setResultAttribute:v88];
                id v36 = objc_alloc_init(MEMORY[0x1E4F96678]);
                objc_msgSend(v36, "setValue:", objc_msgSend(&unk_1F2DC7690, "BOOLValue"));
                [v34 setResultValue:v36];

                uint64_t v37 = [*(id *)(v103 + 40) identifier];
                __int16 v38 = [v37 absoluteString];
                [v34 setRequestActionId:v38];

                id v39 = *(id *)(*(void *)(*(void *)(v103 + 104) + 8) + 40);
                id v40 = v34;
                long long v124 = 0u;
                long long v125 = 0u;
                long long v126 = 0u;
                long long v127 = 0u;
                id v95 = v39;
                uint64_t v41 = [v95 countByEnumeratingWithState:&v124 objects:buf count:16];
                if (v41)
                {
                  uint64_t v96 = *(void *)v125;
                  do
                  {
                    for (uint64_t i = 0; i != v41; ++i)
                    {
                      if (*(void *)v125 != v96) {
                        objc_enumerationMutation(v95);
                      }
                      id v43 = *(void **)(*((void *)&v124 + 1) + 8 * i);
                      uint64_t v44 = [v40 entity];
                      id v45 = [v43 entity];
                      if ([v44 isEqual:v45])
                      {
                        uint64_t v46 = [v40 resultAttribute];
                        char v47 = [v43 resultAttribute];
                        char v48 = [v46 isEqualToString:v47];

                        if (v48)
                        {

                          goto LABEL_57;
                        }
                      }
                      else
                      {
                      }
                    }
                    uint64_t v41 = [v95 countByEnumeratingWithState:&v124 objects:buf count:16];
                  }
                  while (v41);
                }

                [*(id *)(*(void *)(*(void *)(v103 + 104) + 8) + 40) addObject:v40];
LABEL_57:

LABEL_53:
                id v18 = 0;
LABEL_54:

                id v12 = v18;
                goto LABEL_55;
              }
            }
            else
            {
            }
          }
        }
        else
        {
          [v100 addActivationCharacteristicsIfNeeded:v94 forCharacteristic:v101];
        }
        uint64_t v49 = [v14 request];
        id v50 = [v49 characteristic];
        uint64_t v51 = [v100 updateValue:v50 forAction:*(void *)(v103 + 40)];

        uint64_t v52 = [v14 request];
        uint64_t v53 = [v52 characteristic];
        uint64_t v54 = [v53 value];
        uint64_t v55 = [v14 request];
        uint64_t v56 = [v55 characteristic];
        uint64_t v57 = [v56 metadata];
        uint64_t v58 = [v100 compareCurrentValue:v54 newValue:v51 withMetadata:v57];

        if (v58)
        {
          id v59 = actionResultForAction(*(void **)(v103 + 40));
          [v59 setOutcome:v58];
          long long v60 = entityForService(v21, *(void **)(v103 + 48), *(void **)(v103 + 56), *(unsigned __int8 *)(v103 + 121));
          [v59 setEntity:v60];

          [v100 populateResult:v59 withService:v21 serviceType:*(void *)(v103 + 48) characteristic:v101 resultAttribute:0 action:*(void *)(v103 + 40)];
          [*(id *)(*(void *)(*(void *)(v103 + 104) + 8) + 40) addObject:v59];
        }
        else
        {
          uint64_t v61 = [v21 characteristics];
          id v59 = objc_msgSend(v61, "hmf_firstObjectWithCharacteristicType:", *(void *)(v103 + 64));

          long long v118 = 0u;
          long long v119 = 0u;
          long long v116 = 0u;
          long long v117 = 0u;
          id v62 = *(id *)(v103 + 72);
          uint64_t v63 = [v62 countByEnumeratingWithState:&v116 objects:v129 count:16];
          if (v63)
          {
            uint64_t v64 = *(void *)v117;
LABEL_45:
            uint64_t v65 = 0;
            while (1)
            {
              if (*(void *)v117 != v64) {
                objc_enumerationMutation(v62);
              }
              if (v59) {
                break;
              }
              uint64_t v66 = *(void *)(*((void *)&v116 + 1) + 8 * v65);
              id v67 = [v21 characteristics];
              id v59 = objc_msgSend(v67, "hmf_firstObjectWithCharacteristicType:", v66);

              if (v63 == ++v65)
              {
                uint64_t v63 = [v62 countByEnumeratingWithState:&v116 objects:v129 count:16];
                if (v63) {
                  goto LABEL_45;
                }
                break;
              }
            }
          }

          [v94 setObject:v51 forKey:v59];
        }

        goto LABEL_53;
      }
LABEL_55:

      ++v13;
    }
    while (v13 != v99);
    uint64_t v68 = [obj countByEnumeratingWithState:&v120 objects:v130 count:16];
    uint64_t v99 = v68;
  }
  while (v68);
LABEL_62:

  id v69 = [v100 assistantCommandHelper];
  [v69 removeResponses:obj];

  id v11 = v12;
LABEL_63:
  __int16 v102 = v11;
  uint64_t v70 = [v11 code];
  uint64_t v71 = 82;
  if (unlockErrorCode) {
    uint64_t v71 = 2003;
  }
  if (v70 == v71) {
    goto LABEL_69;
  }
  uint64_t v72 = [v93 code];
  uint64_t v73 = 82;
  if (unlockErrorCode) {
    uint64_t v73 = 2003;
  }
  if (v72 == v73)
  {
LABEL_69:
    [v100 reportUnlockRequired:*(void *)(v103 + 96)];
  }
  else
  {
    if ([v94 count])
    {
      long long v74 = [MEMORY[0x1E4F1CA48] array];
      long long v115 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      long long v112 = 0u;
      id v75 = v94;
      uint64_t v76 = [v75 countByEnumeratingWithState:&v112 objects:v128 count:16];
      if (v76)
      {
        uint64_t v77 = *(void *)v113;
        do
        {
          for (uint64_t j = 0; j != v76; ++j)
          {
            if (*(void *)v113 != v77) {
              objc_enumerationMutation(v75);
            }
            char v79 = *(void **)(*((void *)&v112 + 1) + 8 * j);
            id v80 = [v75 objectForKey:v79];
            uint64_t v81 = [v79 authorizationData];
            uint64_t v82 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v79 value:v80 authorizationData:v81 type:0];

            [v74 addObject:v82];
          }
          uint64_t v76 = [v75 countByEnumeratingWithState:&v112 objects:v128 count:16];
        }
        while (v76);
      }

      uint64_t v83 = [v100 assistantCommandHelper];
      uint64_t v84 = *(void *)(v103 + 88);
      v104[0] = MEMORY[0x1E4F143A8];
      v104[1] = 3221225472;
      v104[2] = __88__HMDAssistantCommand_handleUpdateActionTypes_serviceType_forObjects_completionHandler___block_invoke_110;
      v104[3] = &unk_1E6A07858;
      objc_copyWeak(&v111, from);
      id v105 = *(id *)(v103 + 80);
      id v109 = *(id *)(v103 + 96);
      id v106 = *(id *)(v103 + 40);
      id v85 = *(id *)(v103 + 48);
      uint64_t v86 = *(void *)(v103 + 104);
      id v107 = v85;
      uint64_t v110 = v86;
      id v108 = *(id *)(v103 + 56);
      [v83 addWriteRequests:v74 home:v84 completion:v104];

      objc_destroyWeak(&v111);
      uint64_t v87 = v103;
    }
    else
    {
      uint64_t v87 = v103;
      dispatch_group_leave(*(dispatch_group_t *)(v103 + 80));
    }
    [*(id *)(v87 + 32) end];
  }

  id WeakRetained = v91;
LABEL_82:
}

uint64_t __88__HMDAssistantCommand_handleUpdateActionTypes_serviceType_forObjects_completionHandler___block_invoke_111(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]([*(id *)(a1 + 32) begin]);
  id v3 = *(id *)(a1 + 40);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@All results have been received for update-action-types, calling result handler", (uint8_t *)&v7, 0xCu);
  }
  [*(id *)(a1 + 40) reportResults:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) handler:*(void *)(a1 + 48)];
  return [*(id *)(a1 + 32) end];
}

void __88__HMDAssistantCommand_handleUpdateActionTypes_serviceType_forObjects_completionHandler___block_invoke_110(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = WeakRetained;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v17 = 138543874;
      id v18 = v11;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v5;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Received response %@ for write request with %@", (uint8_t *)&v17, 0x20u);
    }
    id v12 = [v9 handleReadWriteResponses:v6 error:v5 forAction:*(void *)(a1 + 40) inServiceType:*(void *)(a1 + 48) results:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) forObjects:*(void *)(a1 + 56)];
    uint64_t v13 = [v5 code];
    uint64_t v14 = 82;
    if (unlockErrorCode) {
      uint64_t v14 = 2003;
    }
    if (v13 == v14) {
      goto LABEL_10;
    }
    uint64_t v15 = [v12 code];
    uint64_t v16 = 82;
    if (unlockErrorCode) {
      uint64_t v16 = 2003;
    }
    if (v15 == v16) {
LABEL_10:
    }
      [v9 reportUnlockRequired:*(void *)(a1 + 64)];
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (id)updateValue:(id)a3 forAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 value];
  id v9 = [v7 actionType];
  uint64_t v10 = +[HMDHAPMetadata getSharedInstance];
  id v11 = [v7 attribute];
  id v12 = [v10 mapCharacteristicValueType:v11];

  if ([v9 isEqualToString:*MEMORY[0x1E4F96DF0]])
  {
    int v13 = [v8 BOOLValue];
    uint64_t v14 = [NSNumber numberWithBool:v13 ^ 1u];
    goto LABEL_21;
  }
  uint64_t v54 = self;
  uint64_t v55 = v9;
  uint64_t v51 = v10;
  if ([v12 isEqualToString:*MEMORY[0x1E4F2CE00]]) {
    *(float *)&double v15 = (float)(int)[v8 intValue];
  }
  else {
    [v8 floatValue];
  }
  uint64_t v16 = [NSNumber numberWithFloat:v15];
  int v17 = [v7 value];
  id v18 = [v17 units];
  __int16 v19 = [v7 attribute];
  id v20 = [(HMDAssistantCommand *)v54 adjustGetValue:v16 type:v12 units:v18 attribute:v19];

  __int16 v21 = v20;
  [v20 floatValue];
  float v23 = v22;
  char v24 = [v7 value];

  float v25 = 5.0;
  if (v24)
  {
    int v26 = [v7 value];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    BOOL v28 = [v7 value];
    uint64_t v29 = v28;
    BOOL v30 = v55;
    if (isKindOfClass)
    {
      float v25 = (float)[v28 value];
LABEL_12:

      goto LABEL_13;
    }
    objc_opt_class();
    char v31 = objc_opt_isKindOfClass();

    if (v31)
    {
      uint64_t v29 = [v7 value];
      [v29 value];
      float v25 = v32;
      goto LABEL_12;
    }
  }
  else
  {
    BOOL v30 = v55;
  }
LABEL_13:
  id v33 = +[HMDHAPMetadata getSharedInstance];
  id v34 = [v7 attribute];
  uint64_t v35 = [v33 mapWriteCharacteristicFromAssistantName:v34];

  uint64_t v53 = [v6 service];
  id v36 = [v53 characteristics];
  uint64_t v37 = objc_msgSend(v36, "hmf_firstObjectWithCharacteristicType:", v35);

  if (!v37)
  {
    __int16 v38 = [v33 getCharacteristicTypeAlias:v35];
    id v39 = [v53 characteristics];
    uint64_t v37 = objc_msgSend(v39, "hmf_firstObjectWithCharacteristicType:", v38);

    BOOL v30 = v55;
  }
  id v52 = v6;
  uint64_t v49 = (void *)v35;
  id v50 = v33;
  if ([v30 isEqualToString:*MEMORY[0x1E4F96DD0]])
  {
    *(float *)&double v40 = v23 + v25;
  }
  else
  {
    int v41 = [v30 isEqualToString:*MEMORY[0x1E4F96DA0]];
    double v40 = 0.0;
    if (v41) {
      *(float *)&double v40 = v25;
    }
    *(float *)&double v40 = v23 - *(float *)&v40;
  }
  uint64_t v42 = [NSNumber numberWithFloat:v40];

  id v43 = [v7 value];
  uint64_t v44 = [v43 units];
  id v45 = [v7 attribute];
  uint64_t v46 = [(HMDAssistantCommand *)v54 adjustSetValue:v42 type:v12 units:v44 attribute:v45];

  char v47 = [v37 metadata];
  uint64_t v14 = [(HMDAssistantCommand *)v54 updateValueToBoundary:v46 valueType:v12 fudgeMinimum:1 metadata:v47];

  id v8 = (void *)v42;
  uint64_t v10 = v51;
  id v6 = v52;
  id v9 = v55;
LABEL_21:

  return v14;
}

- (id)updateValueToBoundary:(id)a3 valueType:(id)a4 fudgeMinimum:(BOOL)a5 metadata:(id)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = v9;
  int v13 = v12;
  if (v11)
  {
    objc_opt_class();
    int v13 = v12;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v14 = [v11 maximumValue];

      int v13 = v12;
      if (v14)
      {
        double v15 = [v11 maximumValue];
        uint64_t v16 = [v15 compare:v12];

        int v13 = v12;
        if (v16 == -1)
        {
          int v13 = [v11 maximumValue];
        }
      }
      int v17 = [v11 minimumValue];

      if (v17)
      {
        if (v7
          && ([v11 stepValue], id v18 = objc_claimAutoreleasedReturnValue(), v18, v18))
        {
          int v19 = [v10 isEqualToString:*MEMORY[0x1E4F2CE00]];
          id v20 = [v11 minimumValue];
          __int16 v21 = v20;
          if (v19)
          {
            int v22 = [v20 intValue];
            float v23 = [v11 stepValue];
            int v24 = [v23 intValue] + v22;

            float v25 = NSNumber;
            *(float *)&double v26 = (float)v24;
          }
          else
          {
            [v20 floatValue];
            float v29 = v28;
            BOOL v30 = [v11 stepValue];
            [v30 floatValue];
            float v32 = v29 + v31;

            float v25 = NSNumber;
            *(float *)&double v26 = v32;
          }
          id v27 = [v25 numberWithFloat:v26];
        }
        else
        {
          id v27 = [v11 minimumValue];
        }
        id v33 = v27;
        if ([v27 compare:v12] == 1)
        {
          id v34 = v33;

          int v13 = v34;
        }
      }
    }
  }

  return v13;
}

- (void)handleSetActionTypes:(id)a3 serviceType:(id)a4 forObjects:(id)a5 completionHandler:(id)a6
{
  v160[1] = *MEMORY[0x1E4F143B8];
  id v122 = a3;
  id v121 = a4;
  id v120 = a5;
  id v118 = a6;
  id v11 = objc_alloc(MEMORY[0x1E4F653F0]);
  id v12 = NSString;
  val = self;
  int v13 = MEMORY[0x1D94505D0](self, a2);
  uint64_t v14 = [v12 stringWithFormat:@"%@, %s:%ld", v13, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables_legacy/Sources/homed/Assistant/HMDAssistantCommand.m", 2199];
  long long v115 = (void *)[v11 initWithName:v14];

  double v15 = [v122 attribute];

  if (!v15)
  {
    id v18 = (void *)MEMORY[0x1D9452090]();
    int v19 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int v22 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v22;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@In Set action types, There is no attribute in action - reporting as malformed command", buf, 0xCu);
    }
    goto LABEL_6;
  }
  uint64_t v16 = [v122 actionType];
  uint64_t v113 = *MEMORY[0x1E4F96DD8];
  if (objc_msgSend(v16, "isEqualToString:"))
  {
    int v17 = [v122 value];

    if (!v17)
    {
      id v18 = (void *)MEMORY[0x1D9452090]();
      int v19 = self;
      id v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v21 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v21;
        _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@No value field for SET actionType", buf, 0xCu);
      }
LABEL_6:

      [(HMDAssistantCommand *)v19 reportOutcome:*MEMORY[0x1E4F96EB8] results:0 handler:v118];
      goto LABEL_86;
    }
  }
  else
  {
  }
  id v106 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K =[d] %@", @"objectType", *MEMORY[0x1E4F96FE0]];
  id v107 = [v120 filteredArrayUsingPredicate:v106];
  if ([v107 count])
  {
    float v23 = (void *)MEMORY[0x1D9452090]();
    int v24 = self;
    float v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      double v26 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v26;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Entity specified is an action set, executing it", buf, 0xCu);
    }
    id v27 = [v107 firstObject];
    float v28 = actionSetFromObject(v27);

    [(HMDAssistantCommand *)v24 executeActionSet:v28 action:v122 withCompletionHandler:v118];
    goto LABEL_85;
  }
  float v29 = [v122 attribute];
  int v30 = [v29 isEqualToString:*MEMORY[0x1E4F96E08]];

  if (v30)
  {
    [(HMDAssistantCommand *)self handleSetColor:v122 forObjects:v120 service:v121 completionHandler:v118];
    goto LABEL_85;
  }
  float v31 = [v122 attribute];
  int v32 = [v31 isEqualToString:*MEMORY[0x1E4F96E00]];

  if (v32)
  {
    [(HMDAssistantCommand *)self handleSetNaturalLightingAction:v122 serviceType:v121 forObjects:v120 completionHandler:v118];
    goto LABEL_85;
  }
  __int16 v102 = +[HMDHAPMetadata getSharedInstance];
  id v33 = [v122 attribute];
  uint64_t v101 = [v102 mapWriteCharacteristicFromAssistantName:v33];

  if (!v101)
  {
    uint64_t v35 = (void *)MEMORY[0x1D9452090]();
    id v36 = self;
    uint64_t v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v38 = HMFGetLogIdentifier();
      id v39 = [v122 attribute];
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = v38;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v39;
      _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot map actionAttribute(%@) to a characteristicType", buf, 0x16u);
    }
    [(HMDAssistantCommand *)v36 reportOutcome:*MEMORY[0x1E4F96EB8] results:0 handler:v118];
    goto LABEL_84;
  }
  id v34 = [v122 attribute];
  uint64_t v110 = [v102 mapCharacteristicValueType:v34];

  uint64_t v99 = [v102 getAliasedCharacteristicTypes:v101];
  if ([v99 count])
  {
    long long v98 = [v99 arrayByAddingObject:v101];
    [(HMDAssistantCommand *)self filterObjects:v120 forCharacteristicTypes:v98];
  }
  else
  {
    v160[0] = v101;
    long long v98 = [MEMORY[0x1E4F1C978] arrayWithObjects:v160 count:1];
    [(HMDAssistantCommand *)self filterObjects:v120 forCharacteristicTypes:v98];
  id v100 = };
  if (![v100 count])
  {
    [(HMDAssistantCommand *)self returnResults:0 serviceType:v121 forAction:v122 completionHandler:v118];
    goto LABEL_83;
  }
  uint64_t v97 = [(HMDAssistantCommand *)self getValueOfType:v110 action:v122];
  double v40 = [v122 value];
  int v41 = [v40 units];
  uint64_t v42 = [v122 attribute];
  id v119 = [(HMDAssistantCommand *)self adjustSetValue:v97 type:v110 units:v41 attribute:v42];

  id v43 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v157 = __Block_byref_object_copy__13203;
  v158 = __Block_byref_object_dispose__13204;
  id v159 = [MEMORY[0x1E4F1CA48] array];
  int v116 = [v122 includeCompleteInformation];
  long long v148 = 0u;
  long long v149 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  obuint64_t j = v100;
  uint64_t v44 = [obj countByEnumeratingWithState:&v146 objects:v155 count:16];
  if (!v44) {
    goto LABEL_54;
  }
  uint64_t v45 = *(void *)v147;
  uint64_t v109 = *MEMORY[0x1E4F96DE0];
  uint64_t v105 = *MEMORY[0x1E4F96DE8];
  uint64_t v108 = *MEMORY[0x1E4F2CFE8];
  uint64_t v104 = *MEMORY[0x1E4F96D50];
  uint64_t v103 = *MEMORY[0x1E4F96D08];
  uint64_t v111 = *MEMORY[0x1E4F96D18];
  do
  {
    uint64_t v46 = 0;
    do
    {
      if (*(void *)v147 != v45) {
        objc_enumerationMutation(obj);
      }
      char v47 = *(void **)(*((void *)&v146 + 1) + 8 * v46);
      char v48 = [v47 metadata];
      if (([v47 properties] & 4) == 0)
      {
        actionResultForAction(v122);
        id v49 = (id)objc_claimAutoreleasedReturnValue();
        id v50 = [v47 service];
        [v49 setOutcome:v111];
        uint64_t v51 = entityForService(v50, v121, v120, v116);
        [v49 setEntity:v51];

        [(HMDAssistantCommand *)val populateResult:v49 withService:v50 serviceType:v121 characteristic:v47 resultAttribute:0 action:v122];
        [*(id *)(*(void *)&buf[8] + 40) addObject:v49];
        goto LABEL_34;
      }
      id v52 = [v122 actionType];
      int v53 = [v52 isEqualToString:v113];

      if (v53)
      {
        id v49 = v119;
        id v119 = [(HMDAssistantCommand *)val updateValueToBoundary:v49 valueType:v110 fudgeMinimum:0 metadata:v48];

        if (v49 == v119
          || ([v47 characteristicType],
              uint64_t v54 = objc_claimAutoreleasedReturnValue(),
              int v55 = [v54 isEqual:v108],
              v54,
              !v55))
        {
          [v43 setObject:v119 forKey:v47];
        }
        else
        {
          id v50 = actionResultForAction(v122);
          uint64_t v56 = [v47 service];
          if (v49 >= v119) {
            uint64_t v57 = v104;
          }
          else {
            uint64_t v57 = v103;
          }
          [v50 setOutcome:v57];
          uint64_t v58 = entityForService(v56, v121, v120, v116);
          [v50 setEntity:v58];

          [(HMDAssistantCommand *)val populateResult:v50 withService:v56 serviceType:v121 characteristic:v47 resultAttribute:0 action:v122];
          [*(id *)(*(void *)&buf[8] + 40) addObject:v50];

LABEL_34:
        }
LABEL_46:

        goto LABEL_47;
      }
      id v59 = [v122 actionType];
      int v60 = [v59 isEqualToString:v109];

      if (v60)
      {
        uint64_t v61 = [v48 maximumValue];

        if (!v61) {
          goto LABEL_47;
        }
        id v49 = [v48 maximumValue];
        [v43 setObject:v49 forKey:v47];
        goto LABEL_46;
      }
      id v62 = [v122 actionType];
      int v63 = [v62 isEqualToString:v105];

      if (v63)
      {
        uint64_t v64 = [v48 minimumValue];
        if (v64)
        {
          id v49 = [(HMDAssistantCommand *)val updateValueToBoundary:v64 valueType:v110 fudgeMinimum:1 metadata:v48];

          [v43 setObject:v49 forKey:v47];
        }
        else
        {
          id v49 = 0;
        }
        goto LABEL_46;
      }
LABEL_47:
      [(HMDAssistantCommand *)val addActivationCharacteristicsIfNeeded:v43 forCharacteristic:v47];

      ++v46;
    }
    while (v44 != v46);
    uint64_t v65 = [obj countByEnumeratingWithState:&v146 objects:v155 count:16];
    uint64_t v44 = v65;
  }
  while (v65);
LABEL_54:

  uint64_t v66 = dispatch_group_create();
  long long v114 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
  long long v144 = 0u;
  long long v145 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  id v117 = v43;
  uint64_t v67 = [v117 countByEnumeratingWithState:&v142 objects:v154 count:16];
  if (v67)
  {
    uint64_t v68 = *(void *)v143;
    while (2)
    {
      for (uint64_t i = 0; i != v67; ++i)
      {
        if (*(void *)v143 != v68) {
          objc_enumerationMutation(v117);
        }
        uint64_t v70 = *(void **)(*((void *)&v142 + 1) + 8 * i);
        uint64_t v71 = [v70 service];
        uint64_t v72 = [v71 accessory];
        uint64_t v73 = [v72 home];

        long long v74 = [v117 objectForKey:v70];

        id v75 = [v70 type];
        LODWORD(v72) = [v75 isEqual:@"000000B0-0000-1000-8000-0026BB765291"];

        if (v72)
        {
          id v76 = v74;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v77 = v76;
          }
          else {
            uint64_t v77 = 0;
          }
          id v78 = v77;

          if (!v78)
          {
            id v91 = (void *)MEMORY[0x1D9452090]();
            id v92 = val;
            HMFGetOSLogHandle();
            id v93 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              id v94 = (id)objc_claimAutoreleasedReturnValue();
              id v95 = objc_opt_class();
              *(_DWORD *)id location = 138543618;
              *(void *)&location[4] = v94;
              __int16 v152 = 2112;
              v153 = v95;
              id v96 = v95;
              _os_log_impl(&dword_1D49D5000, v93, OS_LOG_TYPE_ERROR, "%{public}@Unknown value type found. Expected integer but got %@", location, 0x16u);
            }
            [(HMDAssistantCommand *)v92 reportOutcome:*MEMORY[0x1E4F96EB8] results:0 handler:v118];

            uint64_t v90 = v117;
            goto LABEL_82;
          }
          objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v76, "unsignedIntegerValue"));
          id v119 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v119 = v74;
        }
        char v79 = [v114 objectForKey:v73];
        if (!v79)
        {
          char v79 = [MEMORY[0x1E4F1CA48] array];
          [v114 setObject:v79 forKey:v73];
        }
        id v80 = [v70 authorizationData];
        uint64_t v81 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v70 value:v119 authorizationData:v80 type:1];

        [v79 addObject:v81];
      }
      uint64_t v67 = [v117 countByEnumeratingWithState:&v142 objects:v154 count:16];
      if (v67) {
        continue;
      }
      break;
    }
  }

  long long v140 = 0u;
  long long v141 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  id v82 = v114;
  uint64_t v83 = [v82 countByEnumeratingWithState:&v138 objects:v150 count:16];
  if (v83)
  {
    uint64_t v84 = *(void *)v139;
    do
    {
      for (uint64_t j = 0; j != v83; ++j)
      {
        if (*(void *)v139 != v84) {
          objc_enumerationMutation(v82);
        }
        uint64_t v86 = *(void *)(*((void *)&v138 + 1) + 8 * j);
        dispatch_group_enter(v66);
        uint64_t v87 = [v82 objectForKey:v86];
        objc_initWeak((id *)location, val);
        uint64_t v88 = [(HMDAssistantCommand *)val assistantCommandHelper];
        v129[0] = MEMORY[0x1E4F143A8];
        v129[1] = 3221225472;
        v129[2] = __85__HMDAssistantCommand_handleSetActionTypes_serviceType_forObjects_completionHandler___block_invoke;
        v129[3] = &unk_1E6A07808;
        objc_copyWeak(&v137, (id *)location);
        long long v130 = v66;
        id v135 = v118;
        id v131 = v122;
        id v132 = v121;
        id v136 = buf;
        id v133 = v120;
        id v134 = v115;
        [v88 addWriteRequests:v87 home:v86 completion:v129];

        objc_destroyWeak(&v137);
        objc_destroyWeak((id *)location);
      }
      uint64_t v83 = [v82 countByEnumeratingWithState:&v138 objects:v150 count:16];
    }
    while (v83);
  }

  uint64_t v89 = [(HMDAssistantCommand *)val queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__HMDAssistantCommand_handleSetActionTypes_serviceType_forObjects_completionHandler___block_invoke_108;
  block[3] = &unk_1E6A17150;
  id v125 = v115;
  long long v126 = val;
  long long v128 = buf;
  id v127 = v118;
  dispatch_group_notify(v66, v89, block);

  uint64_t v90 = v125;
  id v76 = v119;
LABEL_82:

  _Block_object_dispose(buf, 8);
LABEL_83:

LABEL_84:
LABEL_85:

LABEL_86:
}

void __85__HMDAssistantCommand_handleSetActionTypes_serviceType_forObjects_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = WeakRetained;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v17 = 138543874;
      id v18 = v11;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v5;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Received response %@ for write request with %@", (uint8_t *)&v17, 0x20u);
    }
    id v12 = [v9 handleReadWriteResponses:v6 error:v5 forAction:*(void *)(a1 + 40) inServiceType:*(void *)(a1 + 48) results:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) forObjects:*(void *)(a1 + 56)];
    uint64_t v13 = [v5 code];
    uint64_t v14 = 82;
    if (unlockErrorCode) {
      uint64_t v14 = 2003;
    }
    if (v13 == v14) {
      goto LABEL_10;
    }
    uint64_t v15 = [v12 code];
    uint64_t v16 = 82;
    if (unlockErrorCode) {
      uint64_t v16 = 2003;
    }
    if (v15 == v16)
    {
LABEL_10:
      [*(id *)(a1 + 64) begin];
      [v9 reportUnlockRequired:*(void *)(a1 + 72)];
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
      [*(id *)(a1 + 64) end];
    }
    else
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

uint64_t __85__HMDAssistantCommand_handleSetActionTypes_serviceType_forObjects_completionHandler___block_invoke_108(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]([*(id *)(a1 + 32) begin]);
  id v3 = *(id *)(a1 + 40);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@All results have been received for set-action-types, calling result handler", (uint8_t *)&v7, 0xCu);
  }
  [*(id *)(a1 + 40) reportResults:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) handler:*(void *)(a1 + 48)];
  return [*(id *)(a1 + 32) end];
}

- (void)handleSetNaturalLightingAction:(id)a3 serviceType:(id)a4 forObjects:(id)a5 completionHandler:(id)a6
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v61 = a3;
  id v56 = a4;
  id v59 = a5;
  id v58 = a6;
  id v11 = objc_alloc(MEMORY[0x1E4F653F0]);
  id v12 = NSString;
  uint64_t v13 = MEMORY[0x1D94505D0](self, a2);
  uint64_t v14 = [v12 stringWithFormat:@"%@, %s:%ld", v13, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables_legacy/Sources/homed/Assistant/HMDAssistantCommand.m", 1984];
  uint64_t v57 = (void *)[v11 initWithName:v14];

  uint64_t v15 = (void *)MEMORY[0x1D9452090]();
  uint64_t v64 = self;
  uint64_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v17 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    id v80 = v17;
    __int16 v81 = 2112;
    id v82 = v59;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Setting natural lighting enabled for objects: %@", buf, 0x16u);
  }
  id v18 = [v61 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    __int16 v19 = v18;
  }
  else {
    __int16 v19 = 0;
  }
  id v60 = v19;

  if (v60)
  {
    id v62 = [MEMORY[0x1E4F1CA80] set];
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    obuint64_t j = v59;
    uint64_t v20 = [obj countByEnumeratingWithState:&v75 objects:v85 count:16];
    __int16 v21 = 0;
    if (v20)
    {
      uint64_t v22 = *(void *)v76;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v76 != v22) {
            objc_enumerationMutation(obj);
          }
          int v24 = *(void **)(*((void *)&v75 + 1) + 8 * i);
          float v25 = [(HMDAssistantCommand *)v64 serviceFromObject:v24];
          double v26 = v25;
          if (v25)
          {
            id v27 = [v25 accessory];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              float v28 = v27;
            }
            else {
              float v28 = 0;
            }
            id v29 = v28;

            int v30 = [v29 home];
            BOOL v31 = v30 == 0;

            if (!v31)
            {
              uint64_t v32 = [v29 home];

              id v33 = [v29 lightProfiles];
              v73[0] = MEMORY[0x1E4F143A8];
              v73[1] = 3221225472;
              v73[2] = __95__HMDAssistantCommand_handleSetNaturalLightingAction_serviceType_forObjects_completionHandler___block_invoke;
              v73[3] = &unk_1E6A0CA58;
              id v74 = v26;
              id v34 = objc_msgSend(v33, "na_firstObjectPassingTest:", v73);

              uint64_t v35 = [v34 settings];
              char v36 = [v35 supportedFeatures];

              if (v36) {
                [v62 addObject:v34];
              }

              __int16 v21 = (void *)v32;
            }
          }
          else
          {
            uint64_t v37 = (void *)MEMORY[0x1D9452090]();
            __int16 v38 = v64;
            id v39 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              double v40 = HMFGetLogIdentifier();
              *(_DWORD *)long long buf = 138543618;
              id v80 = v40;
              __int16 v81 = 2112;
              id v82 = v24;
              _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_ERROR, "%{public}@Did not find service for filtered object: %@", buf, 0x16u);
            }
          }
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v75 objects:v85 count:16];
      }
      while (v20);
    }

    int v41 = objc_msgSend(v62, "hmf_isEmpty");
    uint64_t v42 = (void *)MEMORY[0x1D9452090]();
    id v43 = v64;
    uint64_t v44 = HMFGetOSLogHandle();
    BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_INFO);
    if (v41)
    {
      if (v45)
      {
        uint64_t v46 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        id v80 = v46;
        _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_INFO, "%{public}@Did not find any light profiles to set natural lighting on", buf, 0xCu);
      }
      [(HMDAssistantCommand *)v43 reportResults:0 handler:v58];
    }
    else
    {
      if (v45)
      {
        id v52 = HMFGetLogIdentifier();
        [v60 value];
        int v53 = HMFBooleanToString();
        *(_DWORD *)long long buf = 138543874;
        id v80 = v52;
        __int16 v81 = 2112;
        id v82 = v53;
        __int16 v83 = 2112;
        uint64_t v84 = v62;
        _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_INFO, "%{public}@Setting natural lighting for light profiles %@:%@", buf, 0x20u);
      }
      objc_initWeak((id *)buf, v43);
      uint64_t v54 = [v21 naturalLightingCurveWriter];
      uint64_t v55 = [v60 value];
      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = __95__HMDAssistantCommand_handleSetNaturalLightingAction_serviceType_forObjects_completionHandler___block_invoke_102;
      v65[3] = &unk_1E6A07830;
      objc_copyWeak(&v72, (id *)buf);
      id v66 = v57;
      id v67 = v62;
      id v68 = v61;
      id v69 = v56;
      id v70 = obj;
      id v71 = v58;
      [v54 setNaturalLightingEnabled:v55 forLightProfiles:v67 completion:v65];

      objc_destroyWeak(&v72);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    char v47 = (void *)MEMORY[0x1D9452090]();
    char v48 = v64;
    id v49 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      id v50 = HMFGetLogIdentifier();
      uint64_t v51 = [v61 value];
      *(_DWORD *)long long buf = 138543618;
      id v80 = v50;
      __int16 v81 = 2112;
      id v82 = v51;
      _os_log_impl(&dword_1D49D5000, v49, OS_LOG_TYPE_ERROR, "%{public}@Specified value is not of BOOLean type %@", buf, 0x16u);
    }
    [(HMDAssistantCommand *)v48 reportOutcome:*MEMORY[0x1E4F96EB8] results:MEMORY[0x1E4F1CBF0] handler:v58];
  }
}

uint64_t __95__HMDAssistantCommand_handleSetNaturalLightingAction_serviceType_forObjects_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 services];
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

void __95__HMDAssistantCommand_handleSetNaturalLightingAction_serviceType_forObjects_completionHandler___block_invoke_102(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v27 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) begin];
    double v26 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    obuint64_t j = *(id *)(a1 + 40);
    uint64_t v28 = [obj countByEnumeratingWithState:&v29 objects:v39 count:16];
    if (v28)
    {
      uint64_t v24 = *(void *)v30;
      uint64_t v23 = *MEMORY[0x1E4F96CF0];
      uint64_t v22 = *MEMORY[0x1E4F96D58];
      *(void *)&long long v4 = 138543874;
      long long v20 = v4;
      uint64_t v25 = a1;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v30 != v24) {
            objc_enumerationMutation(obj);
          }
          id v6 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          int v7 = objc_msgSend(v6, "service", v20);
          id v8 = [v27 objectForKey:v6];
          uint64_t v9 = actionResultForAction(*(void **)(a1 + 48));
          id v10 = entityForService(v7, *(void **)(a1 + 56), *(void **)(a1 + 64), [*(id *)(a1 + 48) includeCompleteInformation]);
          [v9 setEntity:v10];

          id v11 = (void *)MEMORY[0x1D9452090]();
          id v12 = WeakRetained;
          id v13 = WeakRetained;
          uint64_t v14 = HMFGetOSLogHandle();
          uint64_t v15 = v14;
          if (v8)
          {
            uint64_t v16 = v23;
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              int v17 = HMFGetLogIdentifier();
              *(_DWORD *)long long buf = v20;
              id v34 = v17;
              __int16 v35 = 2112;
              char v36 = v6;
              __int16 v37 = 2112;
              __int16 v38 = v8;
              _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to set natural lighting for light profile %@:%@", buf, 0x20u);

              uint64_t v16 = v23;
            }
          }
          else
          {
            uint64_t v16 = v22;
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              id v18 = HMFGetLogIdentifier();
              *(_DWORD *)long long buf = v20;
              id v34 = v18;
              __int16 v35 = 2112;
              char v36 = v6;
              __int16 v37 = 2112;
              __int16 v38 = 0;
              _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Successfully set natural lighting for light profile %@:%@", buf, 0x20u);

              uint64_t v16 = v22;
            }
          }

          [v9 setOutcome:v16];
          [v26 addObject:v9];

          id WeakRetained = v12;
          a1 = v25;
        }
        uint64_t v28 = [obj countByEnumeratingWithState:&v29 objects:v39 count:16];
      }
      while (v28);
    }

    __int16 v19 = [v26 allObjects];
    [WeakRetained reportResults:v19 handler:*(void *)(a1 + 72)];

    [*(id *)(a1 + 32) end];
  }
}

- (void)handleGetNaturalLightingAction:(id)a3 forObjects:(id)a4 serviceType:(id)a5 completionHandler:(id)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  id v10 = a4;
  id v45 = a5;
  id v41 = a6;
  id v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    id v56 = v14;
    __int16 v57 = 2112;
    id v58 = v10;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Getting natural lighting enabled for objects: %@", buf, 0x16u);
  }
  uint64_t v44 = [MEMORY[0x1E4F1CA80] set];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v15 = v10;
  uint64_t v47 = [v15 countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v47)
  {
    uint64_t v16 = *(void *)v51;
    uint64_t v43 = *MEMORY[0x1E4F96D58];
    uint64_t v42 = *MEMORY[0x1E4F96E00];
    do
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v51 != v16) {
          objc_enumerationMutation(v15);
        }
        id v18 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        __int16 v19 = [(HMDAssistantCommand *)v12 serviceFromObject:v18];
        long long v20 = v19;
        if (v19)
        {
          __int16 v21 = [v19 accessory];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v22 = v21;
          }
          else {
            uint64_t v22 = 0;
          }
          id v23 = v22;

          uint64_t v24 = [v23 lightProfiles];

          v48[0] = MEMORY[0x1E4F143A8];
          v48[1] = 3221225472;
          v48[2] = __95__HMDAssistantCommand_handleGetNaturalLightingAction_forObjects_serviceType_completionHandler___block_invoke;
          v48[3] = &unk_1E6A0CA58;
          id v25 = v20;
          id v49 = v25;
          double v26 = objc_msgSend(v24, "na_firstObjectPassingTest:", v48);

          if (v26)
          {
            id v27 = [v26 settings];
            char v28 = [v27 supportedFeatures];

            if (v28)
            {
              long long v29 = actionResultForAction(v46);
              long long v30 = entityForService(v25, v45, v15, [v46 includeCompleteInformation]);
              [v29 setEntity:v30];

              [v29 setOutcome:v43];
              [v29 setResultAttribute:v42];
              id v31 = objc_alloc_init(MEMORY[0x1E4F96678]);
              long long v32 = [v26 settings];
              objc_msgSend(v31, "setValue:", objc_msgSend(v32, "isNaturalLightingEnabled"));

              [v29 setResultValue:v31];
              [v44 addObject:v29];
            }
          }
        }
        else
        {
          id v33 = (void *)MEMORY[0x1D9452090]();
          id v34 = v12;
          __int16 v35 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            char v36 = v12;
            uint64_t v37 = v16;
            v39 = id v38 = v15;
            *(_DWORD *)long long buf = 138543618;
            id v56 = v39;
            __int16 v57 = 2112;
            id v58 = v18;
            _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Did not find service for filtered object: %@", buf, 0x16u);

            id v15 = v38;
            uint64_t v16 = v37;
            id v12 = v36;
          }
        }
      }
      uint64_t v47 = [v15 countByEnumeratingWithState:&v50 objects:v54 count:16];
    }
    while (v47);
  }

  uint64_t v40 = [v44 allObjects];
  [(HMDAssistantCommand *)v12 reportResults:v40 handler:v41];
}

uint64_t __95__HMDAssistantCommand_handleGetNaturalLightingAction_forObjects_serviceType_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 services];
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

- (id)compareForBoundary:(id)a3 withMetadata:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = [v6 maximumValue];

    if (v7)
    {
      id v8 = [v6 maximumValue];
      uint64_t v9 = [v8 compare:v5];

      if (v9) {
        id v7 = 0;
      }
      else {
        id v7 = (id)*MEMORY[0x1E4F96D40];
      }
    }
    id v11 = [v6 minimumValue];

    if (v11)
    {
      id v12 = [v6 minimumValue];
      uint64_t v13 = [v12 compare:v5];

      if (!v13)
      {
        id v14 = (id)*MEMORY[0x1E4F96D48];

        id v7 = v14;
      }
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)compareCurrentValue:(id)a3 newValue:(id)a4 withMetadata:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v10 = [v9 maximumValue];

    if (v10)
    {
      id v11 = [v9 maximumValue];
      uint64_t v12 = [v11 compare:v7];

      if ((unint64_t)(v12 + 1) > 1 || (unint64_t)([v7 compare:v8] + 1) > 1) {
        id v10 = 0;
      }
      else {
        id v10 = (id)*MEMORY[0x1E4F96CC8];
      }
    }
    id v14 = [v9 minimumValue];

    if (v14)
    {
      id v15 = [v9 minimumValue];
      unint64_t v16 = [v15 compare:v7];

      if (v16 <= 1 && (unint64_t)[v7 compare:v8] <= 1)
      {
        id v17 = (id)*MEMORY[0x1E4F96CD0];

        id v10 = v17;
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)handleGetActionTypes:(id)a3 serviceType:(id)a4 forObjects:(id)a5 completionHandler:(id)a6
{
  v104[1] = *MEMORY[0x1E4F143B8];
  id v73 = a3;
  id v71 = a4;
  id v11 = a5;
  id v72 = a6;
  id v12 = objc_alloc(MEMORY[0x1E4F653F0]);
  uint64_t v13 = NSString;
  val = self;
  id v14 = MEMORY[0x1D94505D0](self, a2);
  id v15 = [v13 stringWithFormat:@"%@, %s:%ld", v14, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables_legacy/Sources/homed/Assistant/HMDAssistantCommand.m", 1756];
  id v70 = (void *)[v12 initWithName:v15];

  unint64_t v16 = [v73 attribute];

  if (v16)
  {
    id v17 = [v73 attribute];
    int v18 = [v17 isEqualToString:*MEMORY[0x1E4F96E08]];

    if (v18)
    {
      [(HMDAssistantCommand *)self handleGetColor:v73 forObjects:v11 serviceType:v71 completionHandler:v72];
    }
    else
    {
      id v23 = [v73 attribute];
      int v24 = [v23 isEqualToString:*MEMORY[0x1E4F96E00]];

      if (v24)
      {
        [(HMDAssistantCommand *)self handleGetNaturalLightingAction:v73 forObjects:v11 serviceType:v71 completionHandler:v72];
      }
      else
      {
        id v25 = [v73 attribute];
        double v26 = [v73 actionType];
        id v27 = [(HMDAssistantCommand *)self filteredObjectsFromObjects:v11 byAttribute:v25 forActionType:v26];

        if ([v27 count])
        {
          id v67 = +[HMDHAPMetadata getSharedInstance];
          char v28 = [v73 actionType];
          int v29 = [v28 isEqualToString:*MEMORY[0x1E4F96DC8]];

          long long v30 = [v73 attribute];
          if (v29) {
            [v67 mapWriteCharacteristicFromAssistantName:v30];
          }
          else {
          id v66 = [v67 mapReadCharacteristicFromAssistantName:v30];
          }

          if (v66)
          {
            uint64_t v65 = objc_msgSend(v67, "getAliasedCharacteristicTypes:");
            if ([v65 count])
            {
              uint64_t v64 = [v65 arrayByAddingObject:v66];
              [(HMDAssistantCommand *)self filterObjects:v27 forCharacteristicTypes:v64];
            }
            else
            {
              v104[0] = v66;
              uint64_t v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v104 count:1];
              [(HMDAssistantCommand *)self filterObjects:v27 forCharacteristicTypes:v64];
            }
            obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
            if ([obj count])
            {
              int v63 = [MEMORY[0x1E4F1CA80] setWithArray:v27];
              char v36 = [MEMORY[0x1E4F1CAD0] setWithArray:obj];
              uint64_t v37 = [(HMDAssistantCommand *)self addCharacteristicsFromRelatedServicesFor:v36 assistantObjects:v63];
              id v38 = [v37 allObjects];

              id v69 = [v63 allObjects];

              id v39 = [(HMDAssistantCommand *)self addStatusCharacteristicsIfNeeded:v38];

              uint64_t v40 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
              long long v96 = 0u;
              long long v97 = 0u;
              long long v94 = 0u;
              long long v95 = 0u;
              obuint64_t j = v39;
              uint64_t v41 = [obj countByEnumeratingWithState:&v94 objects:v103 count:16];
              if (v41)
              {
                uint64_t v42 = *(void *)v95;
                do
                {
                  for (uint64_t i = 0; i != v41; ++i)
                  {
                    if (*(void *)v95 != v42) {
                      objc_enumerationMutation(obj);
                    }
                    uint64_t v44 = *(void **)(*((void *)&v94 + 1) + 8 * i);
                    id v45 = [v44 service];
                    id v46 = [v45 accessory];
                    uint64_t v47 = [v46 home];

                    char v48 = [v40 objectForKey:v47];
                    if (!v48)
                    {
                      char v48 = [MEMORY[0x1E4F1CA48] array];
                      [v40 setObject:v48 forKey:v47];
                    }
                    id v49 = [(HMDAssistantCommand *)self readRequestsForCharacteristic:v44];
                    [v48 addObjectsFromArray:v49];
                  }
                  uint64_t v41 = [obj countByEnumeratingWithState:&v94 objects:v103 count:16];
                }
                while (v41);
              }

              long long v50 = dispatch_group_create();
              *(void *)long long buf = 0;
              *(void *)&buf[8] = buf;
              *(void *)&buf[16] = 0x3032000000;
              id v100 = __Block_byref_object_copy__13203;
              uint64_t v101 = __Block_byref_object_dispose__13204;
              id v102 = [MEMORY[0x1E4F1CA48] array];
              objc_initWeak(&location, self);
              long long v91 = 0u;
              long long v92 = 0u;
              long long v89 = 0u;
              long long v90 = 0u;
              id v51 = v40;
              uint64_t v52 = [v51 countByEnumeratingWithState:&v89 objects:v98 count:16];
              if (v52)
              {
                uint64_t v53 = *(void *)v90;
                do
                {
                  for (uint64_t j = 0; j != v52; ++j)
                  {
                    if (*(void *)v90 != v53) {
                      objc_enumerationMutation(v51);
                    }
                    uint64_t v55 = *(void *)(*((void *)&v89 + 1) + 8 * j);
                    dispatch_group_enter(v50);
                    id v56 = [v51 objectForKey:v55];
                    __int16 v57 = [(HMDAssistantCommand *)val assistantCommandHelper];
                    v80[0] = MEMORY[0x1E4F143A8];
                    v80[1] = 3221225472;
                    v80[2] = __85__HMDAssistantCommand_handleGetActionTypes_serviceType_forObjects_completionHandler___block_invoke;
                    v80[3] = &unk_1E6A07808;
                    objc_copyWeak(&v88, &location);
                    __int16 v81 = v50;
                    id v86 = v72;
                    id v82 = v73;
                    id v83 = v71;
                    uint64_t v87 = buf;
                    id v84 = v69;
                    id v85 = v70;
                    [v57 addReadRequests:v56 home:v55 completion:v80];

                    objc_destroyWeak(&v88);
                  }
                  uint64_t v52 = [v51 countByEnumeratingWithState:&v89 objects:v98 count:16];
                }
                while (v52);
              }

              id v58 = [(HMDAssistantCommand *)val queue];
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __85__HMDAssistantCommand_handleGetActionTypes_serviceType_forObjects_completionHandler___block_invoke_100;
              block[3] = &unk_1E6A17150;
              id v76 = v70;
              long long v77 = val;
              char v79 = buf;
              id v78 = v72;
              dispatch_group_notify(v50, v58, block);

              objc_destroyWeak(&location);
              _Block_object_dispose(buf, 8);

              id v27 = v69;
            }
            else
            {
              uint64_t v59 = (void *)MEMORY[0x1D9452090]();
              id v60 = self;
              id v61 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
              {
                id v62 = HMFGetLogIdentifier();
                *(_DWORD *)long long buf = 138543362;
                *(void *)&uint8_t buf[4] = v62;
                _os_log_impl(&dword_1D49D5000, v61, OS_LOG_TYPE_INFO, "%{public}@No characteristics found after filtering objects", buf, 0xCu);
              }
              [(HMDAssistantCommand *)v60 returnResults:0 serviceType:v71 forAction:v73 completionHandler:v72];
            }
          }
          else
          {
            id v31 = (void *)MEMORY[0x1D9452090]();
            long long v32 = self;
            id v33 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              id v34 = HMFGetLogIdentifier();
              __int16 v35 = [v73 attribute];
              *(_DWORD *)long long buf = 138543618;
              *(void *)&uint8_t buf[4] = v34;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v35;
              _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot map actionAttribute(%@) to a characteristicType", buf, 0x16u);
            }
            [(HMDAssistantCommand *)v32 reportOutcome:*MEMORY[0x1E4F96EB8] results:0 handler:v72];
          }
        }
        else
        {
          [(HMDAssistantCommand *)self returnResults:0 serviceType:v71 forAction:v73 completionHandler:v72];
        }
        id v11 = v27;
      }
    }
  }
  else
  {
    __int16 v19 = (void *)MEMORY[0x1D9452090]();
    long long v20 = self;
    __int16 v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v22;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@In Get action types, There is no attribute in action, reporting results", buf, 0xCu);
    }
    [(HMDAssistantCommand *)v20 returnResults:v11 serviceType:v71 forAction:v73 completionHandler:v72];
  }
}

void __85__HMDAssistantCommand_handleGetActionTypes_serviceType_forObjects_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = WeakRetained;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v17 = 138543874;
      int v18 = v11;
      __int16 v19 = 2112;
      id v20 = v5;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Received error %@ for read request with response tuples: %@", (uint8_t *)&v17, 0x20u);
    }
    id v12 = [v9 handleReadWriteResponses:v6 error:v5 forAction:*(void *)(a1 + 40) inServiceType:*(void *)(a1 + 48) results:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) forObjects:*(void *)(a1 + 56)];
    uint64_t v13 = [v5 code];
    uint64_t v14 = 82;
    if (unlockErrorCode) {
      uint64_t v14 = 2003;
    }
    if (v13 == v14) {
      goto LABEL_10;
    }
    uint64_t v15 = [v12 code];
    uint64_t v16 = 82;
    if (unlockErrorCode) {
      uint64_t v16 = 2003;
    }
    if (v15 == v16)
    {
LABEL_10:
      [*(id *)(a1 + 64) begin];
      [v9 reportUnlockRequired:*(void *)(a1 + 72)];
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
      [*(id *)(a1 + 64) end];
    }
    else
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

uint64_t __85__HMDAssistantCommand_handleGetActionTypes_serviceType_forObjects_completionHandler___block_invoke_100(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]([*(id *)(a1 + 32) begin]);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@All results have been received for get-action-types, calling result handler", (uint8_t *)&v7, 0xCu);
  }
  [*(id *)(a1 + 40) reportResults:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) handler:*(void *)(a1 + 48)];
  return [*(id *)(a1 + 32) end];
}

- (void)handleMediaAccessorySetActionType:(id)a3 forObjects:(id)a4 withServiceType:(id)a5 completionHandler:(id)a6
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v51 = a3;
  id v46 = a4;
  id v49 = a5;
  id v50 = a6;
  id v11 = objc_alloc(MEMORY[0x1E4F653F0]);
  id v12 = NSString;
  uint64_t v13 = MEMORY[0x1D94505D0](self, a2);
  uint64_t v14 = [v12 stringWithFormat:@"%@, %s:%ld", v13, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables_legacy/Sources/homed/Assistant/HMDAssistantCommand.m", 1677];
  id v45 = (void *)[v11 initWithName:v14];

  uint64_t v15 = [v51 attribute];

  if (v15)
  {
    uint64_t v47 = [(HMDAssistantCommand *)self getValueOfType:0 action:v51];
    uint64_t v16 = [v51 attribute];
    int v17 = [v16 isEqualToString:*MEMORY[0x1E4F96E58]];

    if (v17)
    {
      int v18 = @"HMDMediaProfileSetPowerKey";
      __int16 v19 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      obuint64_t j = v46;
      uint64_t v20 = [obj countByEnumeratingWithState:&v73 objects:v83 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v74;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v74 != v21) {
              objc_enumerationMutation(obj);
            }
            uint64_t v23 = [(HMDAssistantCommand *)self mediaProfileFromObject:*(void *)(*((void *)&v73 + 1) + 8 * v22)];
            if (v23)
            {
              int v24 = +[HMDMediaPropertyWriteRequest writeRequestWithProperty:@"HMDMediaProfileSetPowerKey" value:v47 mediaProfile:v23];
              id v25 = [v23 accessory];
              double v26 = [v25 home];

              if (v26)
              {
                id v27 = [v19 objectForKey:v26];
                if (!v27)
                {
                  id v27 = [MEMORY[0x1E4F1CA48] array];
                  [v19 setObject:v27 forKey:v26];
                }
                [v27 addObject:v24];
              }
            }

            ++v22;
          }
          while (v20 != v22);
          uint64_t v20 = [obj countByEnumeratingWithState:&v73 objects:v83 count:16];
        }
        while (v20);
      }

      char v28 = dispatch_group_create();
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v79 = 0x3032000000;
      id v80 = __Block_byref_object_copy__13203;
      __int16 v81 = __Block_byref_object_dispose__13204;
      id v82 = [MEMORY[0x1E4F1CA48] array];
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id v29 = v19;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v69 objects:v77 count:16];
      if (v30)
      {
        uint64_t v48 = *(void *)v70;
        do
        {
          uint64_t v31 = 0;
          do
          {
            if (*(void *)v70 != v48) {
              objc_enumerationMutation(v29);
            }
            uint64_t v32 = *(void *)(*((void *)&v69 + 1) + 8 * v31);
            dispatch_group_enter(v28);
            id v33 = [v29 objectForKey:v32];
            objc_initWeak(&location, self);
            id v34 = [(HMDAssistantCommand *)self assistantCommandHelper];
            v58[0] = MEMORY[0x1E4F143A8];
            v58[1] = 3221225472;
            v58[2] = __102__HMDAssistantCommand_handleMediaAccessorySetActionType_forObjects_withServiceType_completionHandler___block_invoke;
            v58[3] = &unk_1E6A077E0;
            objc_copyWeak(&v67, &location);
            uint64_t v59 = v28;
            id v65 = v50;
            id v60 = v51;
            id v61 = v49;
            uint64_t v62 = v32;
            __int16 v35 = @"HMDMediaProfileSetPowerKey";
            int v63 = @"HMDMediaProfileSetPowerKey";
            p_long long buf = &buf;
            id v64 = obj;
            [v34 addMediaWriteRequests:v33 withRequestProperty:@"HMDMediaProfileSetPowerKey" completion:v58];

            objc_destroyWeak(&v67);
            objc_destroyWeak(&location);

            ++v31;
          }
          while (v30 != v31);
          uint64_t v30 = [v29 countByEnumeratingWithState:&v69 objects:v77 count:16];
        }
        while (v30);
      }

      char v36 = [(HMDAssistantCommand *)self queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __102__HMDAssistantCommand_handleMediaAccessorySetActionType_forObjects_withServiceType_completionHandler___block_invoke_97;
      block[3] = &unk_1E6A17150;
      id v54 = v45;
      uint64_t v55 = self;
      __int16 v57 = &buf;
      id v56 = v50;
      dispatch_group_notify(v28, v36, block);

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      uint64_t v41 = (void *)MEMORY[0x1D9452090]();
      uint64_t v42 = self;
      uint64_t v43 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        uint64_t v44 = HMFGetLogIdentifier();
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v44;
        _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_ERROR, "%{public}@In Set action types, passed-in attribute in action is not supported.", (uint8_t *)&buf, 0xCu);
      }
      [(HMDAssistantCommand *)v42 reportOutcome:*MEMORY[0x1E4F96EB8] results:0 handler:v50];
    }
  }
  else
  {
    uint64_t v37 = (void *)MEMORY[0x1D9452090]();
    id v38 = self;
    id v39 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      uint64_t v40 = HMFGetLogIdentifier();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v40;
      _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_ERROR, "%{public}@In Set action types, there is no attribute in action, reporting malformed results", (uint8_t *)&buf, 0xCu);
    }
    [(HMDAssistantCommand *)v38 reportOutcome:*MEMORY[0x1E4F96EB8] results:0 handler:v50];
  }
}

void __102__HMDAssistantCommand_handleMediaAccessorySetActionType_forObjects_withServiceType_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  if (WeakRetained)
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = WeakRetained;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543874;
      uint64_t v13 = v11;
      __int16 v14 = 2112;
      id v15 = v5;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Received error %@ for read/write request with responses %@", buf, 0x20u);
    }
    [v9 handleMediaReadWriteResponse:v6 forAction:*(void *)(a1 + 40) inServiceType:*(void *)(a1 + 48) inHome:*(void *)(a1 + 56) requestProperty:*(void *)(a1 + 64) results:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) forObjects:*(void *)(a1 + 72)];
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
}

uint64_t __102__HMDAssistantCommand_handleMediaAccessorySetActionType_forObjects_withServiceType_completionHandler___block_invoke_97(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]([*(id *)(a1 + 32) begin]);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@All results have been received for Apple Media Accessory get-action-types, calling result handler", (uint8_t *)&v7, 0xCu);
  }
  [*(id *)(a1 + 40) reportResults:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) handler:*(void *)(a1 + 48)];
  return [*(id *)(a1 + 32) end];
}

- (BOOL)populateResult:(id)a3 fromResponse:(id)a4 responses:(id)a5 forAction:(id)a6 serviceType:(id)a7 forObjects:(id)a8
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v76 = a5;
  id v15 = a6;
  id v78 = a7;
  id v77 = a8;
  __int16 v16 = [v14 request];
  id v17 = [v16 characteristic];

  uint64_t v18 = [v17 type];
  LOBYTE(a7) = [v18 isEqualToString:@"00000065-0000-1000-8000-0026BB765291"];

  if (a7)
  {
    BOOL v19 = 0;
    uint64_t v20 = v78;
    goto LABEL_45;
  }
  uint64_t v21 = [v14 error];
  uint64_t v22 = [v17 service];
  uint64_t v79 = (void *)v22;
  long long v74 = (void *)v21;
  if (v21)
  {
    uint64_t v23 = (void *)v22;
    int v24 = [(HMDAssistantCommand *)self actionOutcomeFromError:v21];
    [v13 setOutcome:v24];
  }
  else
  {
    id v25 = [v14 request];
    [v25 characteristic];
    v26 = long long v72 = v17;
    [v26 value];
    char v28 = v27 = v15;
    id v29 = [v14 request];
    [v29 characteristic];
    v31 = id v30 = v14;
    [v31 metadata];
    id v33 = v32 = v13;
    id v34 = [(HMDAssistantCommand *)self compareForBoundary:v28 withMetadata:v33];
    [v32 setOutcome:v34];

    id v13 = v32;
    id v14 = v30;

    uint64_t v23 = v79;
    id v15 = v27;

    id v17 = v72;
    __int16 v35 = [v32 outcome];

    if (!v35) {
      [v32 setOutcome:*MEMORY[0x1E4F96D58]];
    }
  }
  char v36 = entityForService(v23, v78, v77, [v15 includeCompleteInformation]);
  [v13 setEntity:v36];

  uint64_t v37 = [v17 type];
  int v38 = [v37 isEqualToString:@"00000064-0000-1000-8000-0026BB765291"];

  if (!v38)
  {
    id v56 = [v17 type];
    int v57 = [v56 isEqualToString:@"000000C6-0000-1000-8000-0026BB765291"];

    if (v57)
    {
      id v55 = (id)*MEMORY[0x1E4F96E50];
      id v58 = v78;
    }
    else
    {
      id v64 = [v17 type];
      int v65 = [v64 isEqualToString:@"000000C7-0000-1000-8000-0026BB765291"];

      if (v65) {
        id v55 = (id)*MEMORY[0x1E4F96E48];
      }
      else {
        id v55 = 0;
      }
      id v58 = v78;
    }
    uint64_t v42 = v79;
    goto LABEL_44;
  }
  long long v73 = v17;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  obuint64_t j = v76;
  uint64_t v39 = [obj countByEnumeratingWithState:&v85 objects:v89 count:16];
  if (!v39)
  {
    id v55 = 0;
    uint64_t v42 = v79;
    goto LABEL_43;
  }
  uint64_t v40 = v39;
  id v69 = v15;
  id v70 = v14;
  id v71 = v13;
  uint64_t v41 = *(void *)v86;
  uint64_t v42 = v79;
  uint64_t v81 = *(void *)v86;
  while (2)
  {
    uint64_t v43 = 0;
    uint64_t v82 = v40;
    do
    {
      if (*(void *)v86 != v41) {
        objc_enumerationMutation(obj);
      }
      uint64_t v84 = *(void **)(*((void *)&v85 + 1) + 8 * v43);
      uint64_t v44 = [v84 request];
      id v45 = [v44 characteristic];

      id v46 = [v45 service];
      uint64_t v47 = [v46 accessory];
      uint64_t v48 = [v47 uuid];
      id v49 = [v42 accessory];
      id v50 = [v49 uuid];
      if (![v48 isEqual:v50]) {
        goto LABEL_18;
      }
      id v51 = v45;
      uint64_t v52 = [v42 instanceID];
      uint64_t v53 = [v46 instanceID];
      if (![v52 isEqual:v53])
      {

        id v45 = v51;
        uint64_t v41 = v81;
        uint64_t v40 = v82;
LABEL_18:

        goto LABEL_19;
      }
      id v54 = [v51 type];
      int v80 = [v54 isEqualToString:@"00000065-0000-1000-8000-0026BB765291"];

      uint64_t v42 = v79;
      id v45 = v51;

      uint64_t v41 = v81;
      uint64_t v40 = v82;
      if (v80)
      {
        uint64_t v59 = [v84 value];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if (isKindOfClass) {
          id v61 = v59;
        }
        else {
          id v61 = 0;
        }
        id v62 = v61;

        if (v62)
        {
          id v14 = v70;
          id v13 = v71;
          if ([v62 unsignedIntegerValue])
          {
            if ([v62 unsignedIntegerValue] != 1)
            {
              id v55 = 0;
              goto LABEL_41;
            }
            int v63 = (id *)MEMORY[0x1E4F96E48];
          }
          else
          {
            int v63 = (id *)MEMORY[0x1E4F96E50];
          }
          id v55 = *v63;
        }
        else
        {
          id v55 = 0;
          id v14 = v70;
          id v13 = v71;
        }
LABEL_41:

        goto LABEL_42;
      }
LABEL_19:

      ++v43;
    }
    while (v40 != v43);
    uint64_t v40 = [obj countByEnumeratingWithState:&v85 objects:v89 count:16];
    if (v40) {
      continue;
    }
    break;
  }
  id v55 = 0;
  id v14 = v70;
  id v13 = v71;
LABEL_42:
  id v15 = v69;
LABEL_43:

  id v58 = v78;
  id v17 = v73;
LABEL_44:
  id v66 = v42;
  id v67 = v42;
  uint64_t v20 = v58;
  BOOL v19 = -[HMDAssistantCommand populateResult:withService:serviceType:characteristic:resultAttribute:action:](self, "populateResult:withService:serviceType:characteristic:resultAttribute:action:", v13, v66);

LABEL_45:
  return v19;
}

- (void)handleGetMetadataActionTypes:(id)a3 serviceType:(id)a4 forObjects:(id)a5 completionHandler:(id)a6
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v10 attribute];

  if (v14)
  {
    id v15 = [v10 attribute];
    __int16 v16 = [v10 actionType];
    id v17 = [(HMDAssistantCommand *)self filteredObjectsFromObjects:v12 byAttribute:v15 forActionType:v16];

    id v62 = v17;
    if ([v17 count])
    {
      uint64_t v18 = +[HMDHAPMetadata getSharedInstance];
      BOOL v19 = [v10 attribute];
      uint64_t v20 = [v18 mapReadCharacteristicFromAssistantName:v19];

      if (v20)
      {
        uint64_t v21 = [v18 getAliasedCharacteristicTypes:v20];
        if ([v21 count])
        {
          uint64_t v22 = [v21 arrayByAddingObject:v20];
        }
        else
        {
          id v69 = v20;
          uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
        }
        id v54 = (void *)v22;
        uint64_t v32 = [(HMDAssistantCommand *)self filterObjects:v17 forCharacteristicTypes:v22];
        if ([v32 count])
        {
          id v55 = v20;
          uint64_t v52 = v18;
          id v53 = v13;
          id v58 = [MEMORY[0x1E4F1CA48] array];
          int v33 = [v10 includeCompleteInformation];
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          id v51 = v32;
          obuint64_t j = v32;
          uint64_t v63 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
          if (v63)
          {
            uint64_t v61 = *(void *)v65;
            uint64_t v60 = *MEMORY[0x1E4F96D58];
            id v56 = self;
            int v57 = v33;
            do
            {
              for (uint64_t i = 0; i != v63; ++i)
              {
                if (*(void *)v65 != v61) {
                  objc_enumerationMutation(obj);
                }
                __int16 v35 = *(void **)(*((void *)&v64 + 1) + 8 * i);
                char v36 = [v35 service];
                uint64_t v37 = actionResultForAction(v10);
                [v37 setOutcome:v60];
                int v38 = entityForService(v36, v11, v62, v33);
                [v37 setEntity:v38];

                if ([(HMDAssistantCommand *)self populateResult:v37 withService:v36 serviceType:v11 characteristic:v35 resultAttribute:0 action:v10])
                {
                  [v58 addObject:v37];
                }
                else
                {
                  uint64_t v39 = v21;
                  uint64_t v40 = (void *)MEMORY[0x1D9452090]();
                  uint64_t v41 = self;
                  uint64_t v42 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    id v43 = v11;
                    v45 = id v44 = v10;
                    *(_DWORD *)long long buf = 138543618;
                    id v71 = v45;
                    __int16 v72 = 2112;
                    long long v73 = v37;
                    _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_INFO, "%{public}@Not including the result: %@ to the action results", buf, 0x16u);

                    id v10 = v44;
                    id v11 = v43;
                    self = v56;
                  }

                  uint64_t v21 = v39;
                  int v33 = v57;
                }
              }
              uint64_t v63 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
            }
            while (v63);
          }

          id v46 = (void *)MEMORY[0x1D9452090]();
          uint64_t v47 = self;
          uint64_t v48 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v50 = id v49 = v10;
            *(_DWORD *)long long buf = 138543362;
            id v71 = v50;
            _os_log_impl(&dword_1D49D5000, v48, OS_LOG_TYPE_INFO, "%{public}@All results have been received for get-metadata-action-types, calling result handler", buf, 0xCu);

            id v10 = v49;
          }

          id v13 = v53;
          [(HMDAssistantCommand *)v47 reportResults:v58 handler:v53];

          uint64_t v32 = v51;
          uint64_t v18 = v52;
          uint64_t v20 = v55;
        }
        else
        {
          [(HMDAssistantCommand *)self returnResults:0 serviceType:v11 forAction:v10 completionHandler:v13];
        }
      }
      else
      {
        id v27 = (void *)MEMORY[0x1D9452090]();
        char v28 = self;
        id v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          id v30 = HMFGetLogIdentifier();
          uint64_t v31 = [v10 attribute];
          *(_DWORD *)long long buf = 138543618;
          id v71 = v30;
          __int16 v72 = 2112;
          long long v73 = v31;
          _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot map actionAttribute(%@) to a characteristicType", buf, 0x16u);
        }
        [(HMDAssistantCommand *)v28 reportOutcome:*MEMORY[0x1E4F96EB8] results:0 handler:v13];
        uint64_t v20 = 0;
      }
    }
    else
    {
      [(HMDAssistantCommand *)self returnResults:0 serviceType:v11 forAction:v10 completionHandler:v13];
    }
    id v12 = v62;
  }
  else
  {
    uint64_t v23 = (void *)MEMORY[0x1D9452090]();
    int v24 = self;
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      double v26 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      id v71 = v26;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@In Get metadata action types, There is no attribute in action, reporting results", buf, 0xCu);
    }
    [(HMDAssistantCommand *)v24 returnResults:v12 serviceType:v11 forAction:v10 completionHandler:v13];
  }
}

- (void)executeActionSet:(id)a3 action:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc(MEMORY[0x1E4F653F0]);
  id v12 = NSString;
  uint64_t v13 = MEMORY[0x1D94505D0](self, a2);
  id v14 = [v12 stringWithFormat:@"%@, %s:%ld", v13, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables_legacy/Sources/homed/Assistant/HMDAssistantCommand.m", 1451];
  uint64_t v32 = (void *)[v11 initWithName:v14];

  id v15 = [v9 attribute];
  LOBYTE(v13) = [(id)*MEMORY[0x1E4F96E20] isEqualToString:v15];

  if (v13)
  {
    __int16 v16 = [v33 home];
    [(HMDAssistantCommand *)self setHome:v16];
    id v17 = +[HMDHAPMetadata getSharedInstance];
    uint64_t v18 = [v9 attribute];
    BOOL v19 = [v17 mapCharacteristicValueType:v18];

    uint64_t v20 = [(HMDAssistantCommand *)self getValueOfType:v19 action:v9];
    uint64_t v21 = v20;
    if (v20 && ([v20 BOOLValue] & 1) != 0)
    {
      objc_initWeak((id *)location, self);
      uint64_t v22 = [(HMDAssistantCommand *)self assistantCommandHelper];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __69__HMDAssistantCommand_executeActionSet_action_withCompletionHandler___block_invoke;
      v34[3] = &unk_1E6A077B8;
      objc_copyWeak(&v39, (id *)location);
      id v35 = v32;
      id v38 = v10;
      id v36 = v9;
      id v37 = v33;
      [v22 addActionSetRequest:v16 actionSet:v37 completionHandler:v34];

      objc_destroyWeak(&v39);
      objc_destroyWeak((id *)location);
    }
    else
    {
      char v28 = (void *)MEMORY[0x1D9452090]();
      id v29 = self;
      id v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v31 = HMFGetLogIdentifier();
        *(_DWORD *)id location = 138543618;
        *(void *)&location[4] = v31;
        __int16 v41 = 2112;
        uint64_t v42 = v21;
        _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ActionSet action value %@ not true", location, 0x16u);
      }
      [(HMDAssistantCommand *)v29 reportOutcome:*MEMORY[0x1E4F96EB8] results:0 handler:v10];
    }
  }
  else
  {
    uint64_t v23 = (void *)MEMORY[0x1D9452090]();
    int v24 = self;
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      double v26 = HMFGetLogIdentifier();
      id v27 = [v9 attribute];
      *(_DWORD *)id location = 138543618;
      *(void *)&location[4] = v26;
      __int16 v41 = 2112;
      uint64_t v42 = v27;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid action.attribute %@ for actionSet", location, 0x16u);
    }
    [(HMDAssistantCommand *)v24 reportOutcome:*MEMORY[0x1E4F96EB8] results:0 handler:v10];
  }
}

void __69__HMDAssistantCommand_executeActionSet_action_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained) {
    goto LABEL_22;
  }
  [*(id *)(a1 + 32) begin];
  uint64_t v8 = [v5 code];
  uint64_t v9 = 82;
  if (unlockErrorCode) {
    uint64_t v9 = 2003;
  }
  if (v8 == v9)
  {
    [WeakRetained reportUnlockRequired:*(void *)(a1 + 56)];
    goto LABEL_22;
  }
  id v10 = actionResultForAction(*(void **)(a1 + 40));
  id v11 = objc_alloc_init(MEMORY[0x1E4F96678]);
  id v25 = [WeakRetained entityFromActionSet:*(void *)(a1 + 48)];
  objc_msgSend(WeakRetained, "populateResultWithEntity:action:entity:", v10, *(void *)(a1 + 40));
  id v12 = (id)*MEMORY[0x1E4F96EC0];
  [v11 setValue:1];
  if (!v5)
  {
    int v24 = v12;
    [v10 setOutcome:*MEMORY[0x1E4F96D58]];
LABEL_16:
    id v15 = 0;
    goto LABEL_17;
  }
  [v10 setOutcome:*MEMORY[0x1E4F96CF0]];
  if ([v5 code] == 25)
  {
    id v13 = (id)*MEMORY[0x1E4F96EE8];

    id v14 = (void *)MEMORY[0x1E4F96D28];
LABEL_12:
    [v10 setOutcome:*v14];
LABEL_13:
    id v12 = v13;
    goto LABEL_14;
  }
  if ([v5 code] == 4000)
  {
    id v13 = (id)*MEMORY[0x1E4F96EF8];

    id v14 = (void *)MEMORY[0x1E4F96D38];
    goto LABEL_12;
  }
  if ([v5 code] == 64)
  {
    id v13 = (id)*MEMORY[0x1E4F96EF0];

    goto LABEL_13;
  }
  if ([v5 code] == 65)
  {
    id v13 = (id)*MEMORY[0x1E4F96EE0];

    id v14 = (void *)MEMORY[0x1E4F96D00];
    goto LABEL_12;
  }
  if ([v5 code] == 15) {
    [v10 setOutcome:*MEMORY[0x1E4F96D00]];
  }
LABEL_14:
  int v24 = v12;
  if (!v6) {
    goto LABEL_16;
  }
  id v15 = [WeakRetained failedActionResultsFromResponse:v6 inActionSet:*(void *)(a1 + 48) withAction:*(void *)(a1 + 40)];
LABEL_17:
  __int16 v16 = (void *)MEMORY[0x1D9452090]([v10 setResultValue:v11]);
  id v17 = WeakRetained;
  uint64_t v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v23 = v6;
    v20 = id v19 = v11;
    *(_DWORD *)long long buf = 138543618;
    id v27 = v20;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Result received for execute action set: %@, calling result handler", buf, 0x16u);

    id v11 = v19;
    id v6 = v23;
  }

  uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v10, 0);
  if ([v15 count]) {
    [v21 addObjectsFromArray:v15];
  }
  uint64_t v22 = (void *)[v21 copy];
  [v17 reportOutcome:v24 results:v22 handler:*(void *)(a1 + 56)];

  [*(id *)(a1 + 32) end];
LABEL_22:
}

- (id)actionOutcomeFromError:(id)a3
{
  uint64_t v4 = [a3 code];
  if (v4 > 44)
  {
    if (v4 > 2403)
    {
      if (v4 == 2404)
      {
        id v5 = (id *)MEMORY[0x1E4F96CD8];
        goto LABEL_25;
      }
      if (v4 == 2405)
      {
        id v5 = (id *)MEMORY[0x1E4F96CE8];
        goto LABEL_25;
      }
    }
    else
    {
      if (v4 == 45)
      {
        id v5 = (id *)MEMORY[0x1E4F96D08];
        goto LABEL_25;
      }
      if (v4 == 88)
      {
        id v5 = (id *)MEMORY[0x1E4F96CE0];
        goto LABEL_25;
      }
    }
    goto LABEL_22;
  }
  if (v4 > 14)
  {
    if (v4 == 15)
    {
      id v5 = (id *)MEMORY[0x1E4F96D00];
      goto LABEL_25;
    }
    if (v4 == 44)
    {
      id v5 = (id *)MEMORY[0x1E4F96D50];
      goto LABEL_25;
    }
    goto LABEL_22;
  }
  if (v4 != 4)
  {
    if (v4 == 5)
    {
      id v5 = (id *)MEMORY[0x1E4F96D18];
      goto LABEL_25;
    }
LABEL_22:
    id v5 = (id *)MEMORY[0x1E4F96CF0];
    goto LABEL_25;
  }
  uint64_t v6 = [(HMDAssistantCommand *)self home];
  if (!v6) {
    goto LABEL_24;
  }
  int v7 = (void *)v6;
  uint64_t v8 = [(HMDAssistantCommand *)self home];
  uint64_t v9 = [v8 primaryResident];
  if (v9)
  {

LABEL_24:
    id v5 = (id *)MEMORY[0x1E4F96D60];
    goto LABEL_25;
  }
  id v10 = [(HMDAssistantCommand *)self home];
  uint64_t v11 = [v10 homeLocation];

  if (v11 == 1) {
    goto LABEL_24;
  }
  id v5 = (id *)MEMORY[0x1E4F96D10];
LABEL_25:
  id v12 = *v5;
  return v12;
}

- (void)returnResults:(id)a3 serviceType:(id)a4 forAction:(id)a5 completionHandler:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v21 = a6;
  id v13 = [MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = v10;
  uint64_t v14 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    uint64_t v17 = *MEMORY[0x1E4F96D58];
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v23 + 1) + 8 * v18);
        uint64_t v20 = actionResultForAction(v12);
        [v20 setOutcome:v17];
        [(HMDAssistantCommand *)self populateResult:v20 withObject:v19 serviceType:v11 action:v12];
        [v13 addObject:v20];

        ++v18;
      }
      while (v15 != v18);
      uint64_t v15 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v15);
  }

  [(HMDAssistantCommand *)self reportResults:v13 handler:v21];
}

- (void)reportUnlockRequired:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] array];
  BOOL v5 = +[HMDDeviceCapabilities supportsDeviceLock];
  uint64_t v6 = (void *)MEMORY[0x1E4F96F00];
  if (v5 && isPasscodeEnabledOnThisDevice()) {
    uint64_t v6 = (void *)MEMORY[0x1E4F96ED8];
  }
  [(HMDAssistantCommand *)self reportOutcome:*v6 results:v4 handler:v7];
}

- (void)reportResults:(id)a3 handler:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if ([v10 count])
  {
    id v7 = v10;
    uint64_t v8 = (id *)MEMORY[0x1E4F96EC0];
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1C978] array];
    uint64_t v8 = (id *)MEMORY[0x1E4F96EC8];
  }
  id v9 = *v8;
  [(HMDAssistantCommand *)self reportOutcome:v9 results:v7 handler:v6];
}

- (void)reportOutcome:(id)a3 results:(id)a4 handler:(id)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void, void *))a5;
  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F96680]);
    [v11 setCommandOutcome:v8];
    if (v9)
    {
      [v11 setActionResults:v9];
    }
    else
    {
      id v12 = [MEMORY[0x1E4F1C978] array];
      [v11 setActionResults:v12];
    }
    id v13 = [(HMDAssistantCommand *)self home];

    if (v13)
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F1CB10];
      uint64_t v15 = [(HMDAssistantCommand *)self home];
      uint64_t v16 = [v15 urlString];
      uint64_t v17 = [v14 URLWithString:v16];
      [v11 setHomeIdentifier:v17];
    }
    uint64_t v40 = v10;
    id v42 = v9;
    id v43 = v8;
    uint64_t v18 = [(HMDAssistantCommand *)self serverValidity];
    [v11 setServerValidity:v18];

    uint64_t v19 = [(HMDAssistantCommand *)self homeKitObjects];
    uint64_t v20 = [v19 count] + 1;

    id v21 = [(HMDAssistantCommand *)self homeManager];
    uint64_t v22 = [v21 assistantGenerationCounter];

    long long v23 = objc_msgSend(NSString, "stringWithFormat:", @"%tu:%tu", v22, v20);
    [v11 setClientValidity:v23];

    long long v24 = (void *)MEMORY[0x1D9452090]();
    long long v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      long long v26 = HMFGetLogIdentifier();
      id v27 = [(HMDAssistantCommand *)self aceId];
      uint64_t v28 = objc_msgSend(v11, "hm_headerDescription");
      *(_DWORD *)long long buf = 138543874;
      id v50 = v26;
      __int16 v51 = 2112;
      uint64_t v52 = v27;
      __int16 v53 = 2112;
      id v54 = v28;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Response for Siri command(%@): %@", buf, 0x20u);
    }
    __int16 v41 = self;

    id v39 = v11;
    objc_msgSend(v11, "hm_contentDescription");
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v30 = [v29 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v45 != v32) {
            objc_enumerationMutation(v29);
          }
          id v34 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          id v35 = (void *)MEMORY[0x1D9452090]();
          id v36 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            id v37 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138543618;
            id v50 = v37;
            __int16 v51 = 2112;
            uint64_t v52 = v34;
            _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v31);
    }

    id v38 = [v39 dictionary];
    id v10 = v40;
    v40[2](v40, v38);

    [(HMDAssistantCommand *)v41 _logEvent:v39];
    id v9 = v42;
    id v8 = v43;
  }
}

- (void)_logEvent:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc(MEMORY[0x1E4F653F0]);
  id v7 = NSString;
  id v8 = MEMORY[0x1D94505D0](self, a2);
  id v9 = [v7 stringWithFormat:@"%@, %s:%ld", v8, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables_legacy/Sources/homed/Assistant/HMDAssistantCommand.m", 1266];
  id v42 = (void *)[v6 initWithName:v9];

  uint64_t v40 = self;
  id v10 = [(HMDAssistantCommand *)self actions];
  __int16 v41 = [v10 firstObject];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v43 = v5;
  id v11 = [v5 actionResults];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v44 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v46;
    uint64_t v17 = *MEMORY[0x1E4F96D00];
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v46 != v16) {
          objc_enumerationMutation(v11);
        }
        uint64_t v19 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        uint64_t v20 = [v19 outcome];
        char v21 = isOutcomeSuccess(v20);

        if ((v21 & 1) == 0)
        {
          uint64_t v22 = [v19 outcome];
          int v23 = [v22 isEqual:v17];

          if (v23) {
            ++v14;
          }
          else {
            ++v15;
          }
        }
      }
      v44 += v13;
      uint64_t v13 = [v11 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v13);
  }
  else
  {
    uint64_t v44 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
  }

  long long v24 = [(HMDAssistantCommand *)v40 serverValidity];

  if (v24)
  {
    long long v25 = [(HMDAssistantCommand *)v40 serverValidity];
    long long v26 = [v25 componentsSeparatedByString:@":"];

    id v27 = [v26 firstObject];
    uint64_t v28 = v27;
    if (v27) {
      id v27 = (void *)atoll((const char *)[v27 cStringUsingEncoding:4]);
    }
    id v39 = v27;
  }
  else
  {
    id v39 = 0;
  }
  id v29 = [(HMDAssistantCommand *)v40 homeManager];
  uint64_t v30 = [v29 assistantGenerationCounter];

  uint64_t v31 = getLastSyncedAssistantConfigurationVersion();
  uint64_t v32 = [v31 unsignedIntegerValue];

  mach_absolute_time();
  uint64_t v33 = UpTicksToMilliseconds();
  unint64_t v34 = v33 - [(HMDAssistantCommand *)v40 startTime];
  id v35 = [v41 actionType];
  id v36 = [v43 commandOutcome];
  id v37 = +[HMDSiriCommandEvent commandEventWithDuration:v34 actionType:v35 outcome:v36 numberOfEntities:v44 numberOfFailures:v15 numberOfIncompletions:v14 serverConfigurationVersion:v39 configurationVersion:v30 lastSyncedConfigurationVersion:v32];

  id v38 = +[HMDMetricsManager sharedLogEventSubmitter];
  [v38 submitLogEvent:v37];

  [v41 aceId];
  [v41 actionType];

  [v43 commandOutcome];
}

- (id)filterObjects:(id)a3 forCharacteristics:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v27 = a4;
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = v6;
  uint64_t v29 = [obj countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v35;
    long long v26 = self;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v35 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        id v9 = [(HMDAssistantCommand *)self serviceFromObject:v8];
        if (v9)
        {
          id v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v27, "count"));
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v11 = v27;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v38 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v31;
            while (2)
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v31 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = *(void *)(*((void *)&v30 + 1) + 8 * j);
                uint64_t v17 = [v9 characteristics];
                uint64_t v18 = objc_msgSend(v17, "hmf_firstObjectWithCharacteristicType:", v16);

                if (!v18)
                {

                  self = v26;
                  goto LABEL_18;
                }
                [v10 setObject:v18 forKey:v16];
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v38 count:16];
              if (v13) {
                continue;
              }
              break;
            }
          }

          self = v26;
          if (v10)
          {
            [v24 addObject:v10];
            id v11 = v10;
LABEL_18:
          }
        }
        else
        {
          uint64_t v19 = (void *)MEMORY[0x1D9452090]();
          uint64_t v20 = self;
          char v21 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v22 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138543618;
            uint64_t v40 = v22;
            __int16 v41 = 2112;
            uint64_t v42 = v8;
            _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Filtered object %@ not a service", buf, 0x16u);
          }
        }
      }
      uint64_t v29 = [obj countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v29);
  }

  return v24;
}

- (id)filterObjects:(id)a3 forCharacteristicTypes:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v35 = a4;
  id v41 = [MEMORY[0x1E4F1CA48] array];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  obuint64_t j = v6;
  uint64_t v37 = [obj countByEnumeratingWithState:&v47 objects:v58 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v48;
    *(void *)&long long v7 = 138543618;
    long long v33 = v7;
    p_vtable = HMDEvent.vtable;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v48 != v36) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        uint64_t v40 = -[HMDAssistantCommand serviceFromObject:](self, "serviceFromObject:", v10, v33);
        if (v40)
        {
          uint64_t v38 = i;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          id v11 = v35;
          uint64_t v12 = v40;
          uint64_t v42 = [v11 countByEnumeratingWithState:&v43 objects:v57 count:16];
          if (v42)
          {
            uint64_t v13 = *(void *)v44;
            uint64_t v39 = *(void *)v44;
            do
            {
              for (uint64_t j = 0; j != v42; ++j)
              {
                if (*(void *)v44 != v13) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v15 = *(void *)(*((void *)&v43 + 1) + 8 * j);
                uint64_t v16 = [p_vtable + 87 getSharedInstance];
                uint64_t v17 = [v12 type];
                int v18 = [v16 disallowsAssistantServiceType:v17 characteristicType:v15];

                if (v18)
                {
                  uint64_t v19 = (void *)MEMORY[0x1D9452090]();
                  uint64_t v20 = self;
                  char v21 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    id v22 = v11;
                    int v23 = p_vtable;
                    v25 = id v24 = self;
                    long long v26 = [v12 type];
                    *(_DWORD *)long long buf = 138543874;
                    uint64_t v52 = v25;
                    __int16 v53 = 2112;
                    id v54 = v26;
                    __int16 v55 = 2112;
                    uint64_t v56 = v15;
                    _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Filtering out request for disallowed service type: %@ characteristic type: %@", buf, 0x20u);

                    uint64_t v12 = v40;
                    self = v24;
                    p_vtable = v23;
                    id v11 = v22;
                    uint64_t v13 = v39;
                  }
                }
                else
                {
                  id v27 = [v12 findCharacteristicWithType:v15];
                  if (v27) {
                    [v41 addObject:v27];
                  }
                }
              }
              uint64_t v42 = [v11 countByEnumeratingWithState:&v43 objects:v57 count:16];
            }
            while (v42);
          }

          uint64_t i = v38;
        }
        else
        {
          uint64_t v28 = (void *)MEMORY[0x1D9452090]();
          uint64_t v29 = self;
          long long v30 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            long long v31 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = v33;
            uint64_t v52 = v31;
            __int16 v53 = 2112;
            id v54 = v10;
            _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Filtered object is not a service: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v37 = [obj countByEnumeratingWithState:&v47 objects:v58 count:16];
    }
    while (v37);
  }

  return v41;
}

- (id)objectsWithSearchFilter:(id)a3 inHome:(id)a4 serviceTypeIsATV:(BOOL)a5 overrideServiceTypeIfNeeded:(id *)a6
{
  BOOL v6 = a5;
  uint64_t v135 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = [(HMDAssistantCommand *)self homeKitObjects];
  if ([v11 count])
  {
    uint64_t v12 = [v10 urlString];
    uint64_t v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K = %@)", @"objectHomeIdentifier", v12];
    uint64_t v14 = [v11 filteredArrayUsingPredicate:v13];

    if (![v14 count])
    {
      uint64_t v28 = (void *)MEMORY[0x1D9452090]();
      uint64_t v29 = self;
      long long v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        long long v31 = v123 = v28;
        [v10 name];
        v32 = long long v115 = v12;
        [v10 uuid];
        id v33 = v9;
        id v35 = v34 = v10;
        uint64_t v36 = [v35 UUIDString];
        *(_DWORD *)long long buf = 138543874;
        long long v130 = v31;
        __int16 v131 = 2112;
        id v132 = v32;
        __int16 v133 = 2112;
        id v134 = v36;
        _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@After filtering for home %@/%@, no objects to apply the command to", buf, 0x20u);

        id v10 = v34;
        id v9 = v33;

        uint64_t v12 = v115;
        uint64_t v28 = v123;
      }

      id v27 = 0;
      goto LABEL_80;
    }
    BOOL v117 = v6;
    id v15 = [v9 entityType];
    uint64_t v16 = [v9 attribute];

    if (v16)
    {
      uint64_t v17 = (void *)*MEMORY[0x1E4F96FE8];
      if (v15)
      {
        if (([v15 isEqualToString:v17] & 1) == 0
          && ([v15 isEqualToString:*MEMORY[0x1E4F96FE0]] & 1) == 0)
        {
          int v18 = (void *)MEMORY[0x1D9452090]();
          uint64_t v19 = self;
          uint64_t v20 = self;
          char v21 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            id v22 = v110 = v15;
            *(_DWORD *)long long buf = 138543618;
            long long v130 = v22;
            __int16 v131 = 2112;
            id v132 = v9;
            _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Attribute specified in search filter with entityType not SERVICE/SCENE(%@)", buf, 0x16u);

            id v15 = v110;
          }

          self = v19;
        }
        goto LABEL_18;
      }
      id v15 = v17;
    }
    if (!v15)
    {
      id v118 = v13;
      goto LABEL_25;
    }
LABEL_18:
    uint64_t v37 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"objectType", v15];

    id v38 = [v14 filteredArrayUsingPredicate:v37];

    if (![v38 count])
    {
      uint64_t v39 = v37;
      uint64_t v40 = (void *)MEMORY[0x1D9452090]();
      id v41 = self;
      uint64_t v42 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        long long v43 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        long long v130 = v43;
        long long v44 = "%{public}@After filtering for entityType, no objects to apply the command to";
LABEL_22:
        _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_INFO, v44, buf, 0xCu);
      }
LABEL_23:

      id v27 = 0;
      uint64_t v45 = v39;
LABEL_79:

      uint64_t v13 = (void *)v45;
      uint64_t v14 = v38;
LABEL_80:

      id v11 = v14;
      goto LABEL_81;
    }
    id v118 = (void *)v37;
    uint64_t v14 = v38;
LABEL_25:
    long long v46 = [v9 serviceType];

    if (!v46) {
      goto LABEL_45;
    }
    id v109 = v10;
    id v111 = v15;
    long long v47 = +[HMDHAPMetadata getSharedInstance];
    long long v48 = [v9 serviceType];
    long long v49 = [v47 mapFromAssistantServiceName:v48];

    if (v117)
    {
      uint64_t v50 = [v9 serviceType];

      long long v49 = (void *)v50;
    }
    else if (!v49)
    {

      id v27 = 0;
      id v38 = v14;
      goto LABEL_72;
    }
    uint64_t v113 = self;
    int v116 = v12;
    id v119 = v9;
    uint64_t v108 = v47;
    id v121 = [v47 getAliasedServiceType:v49];
    __int16 v51 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v14, "count"));
    long long v124 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    obuint64_t j = v14;
    uint64_t v52 = [obj countByEnumeratingWithState:&v124 objects:v128 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      uint64_t v54 = *(void *)v125;
      do
      {
        for (uint64_t i = 0; i != v53; ++i)
        {
          if (*(void *)v125 != v54) {
            objc_enumerationMutation(obj);
          }
          uint64_t v56 = *(void **)(*((void *)&v124 + 1) + 8 * i);
          int v57 = objc_msgSend(v56, "hmf_stringForKey:", @"objectServiceType");
          id v58 = objc_msgSend(v56, "hmf_stringForKey:", @"objectAssociatedServiceType");
          if ([v57 isEqual:v49])
          {
            [v51 addObject:v56];
          }
          else if (([v57 isEqual:v121] & 1) != 0 {
                 || ([v58 isEqual:v49] & 1) != 0
          }
                 || [v58 isEqual:v121])
          {
            [v51 addObject:v56];
            if (a6)
            {
              *a6 = [v119 serviceType];
            }
          }
        }
        uint64_t v53 = [obj countByEnumeratingWithState:&v124 objects:v128 count:16];
      }
      while (v53);
    }

    id v38 = (id)[v51 copy];
    if ([v38 count])
    {

      uint64_t v14 = v38;
      id v9 = v119;
      id v10 = v109;
      id v15 = v111;
      self = v113;
      uint64_t v12 = v116;
LABEL_45:
      uint64_t v59 = [v9 roomName];
      if (v59)
      {
      }
      else
      {
        uint64_t v60 = [v9 zoneName];

        if (!v60) {
          goto LABEL_50;
        }
      }
      uint64_t v61 = [v9 homeName];
      id v62 = [v9 roomName];
      uint64_t v63 = [v9 zoneName];
      id v38 = [(HMDAssistantCommand *)self filteredObjectsFromObjects:v14 forHomeName:v61 roomName:v62 zoneName:v63];

      if (![v38 count])
      {
        id v70 = (void *)MEMORY[0x1D9452090]();
        id v71 = self;
        __int16 v72 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
        {
          long long v73 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543362;
          long long v130 = v73;
          uint64_t v74 = "%{public}@After filtering for room/zone, no objects to apply the command to";
LABEL_75:
          _os_log_impl(&dword_1D49D5000, v72, OS_LOG_TYPE_INFO, v74, buf, 0xCu);
        }
LABEL_76:

LABEL_77:
        id v27 = 0;
        goto LABEL_78;
      }
      uint64_t v14 = v38;
LABEL_50:
      long long v64 = [v9 groupName];

      if (!v64) {
        goto LABEL_53;
      }
      long long v65 = [v9 groupName];
      id v38 = [(HMDAssistantCommand *)self filteredObjectsFromObjects:v14 forGroup:v65];

      if ([v38 count])
      {
        uint64_t v14 = v38;
LABEL_53:
        long long v66 = [v9 accessoryName];

        if (v66)
        {
          long long v67 = (void *)MEMORY[0x1E4F28F60];
          id v68 = [v9 accessoryName];
          id v69 = [v67 predicateWithFormat:@"%K = %@", @"objectAccessory", v68];

          id v38 = [v14 filteredArrayUsingPredicate:v69];

          if (![v38 count])
          {
            long long v91 = (void *)MEMORY[0x1D9452090]();
            long long v92 = self;
            id v93 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v95 = id v94 = v15;
              *(_DWORD *)long long buf = 138543362;
              long long v130 = v95;
              _os_log_impl(&dword_1D49D5000, v93, OS_LOG_TYPE_INFO, "%{public}@After filtering for accessoryName, no objects to apply the command to", buf, 0xCu);

              id v15 = v94;
            }

            id v27 = 0;
            uint64_t v45 = (uint64_t)v69;
            goto LABEL_79;
          }
          long long v114 = self;
          uint64_t v14 = v38;
        }
        else
        {
          long long v114 = self;
          id v69 = v118;
        }
        uint64_t v79 = [v9 serviceName];

        if (v79)
        {
          int v80 = (void *)MEMORY[0x1E4F28F60];
          uint64_t v81 = [v9 serviceName];
          uint64_t v82 = [v80 predicateWithFormat:@"%K =[d] %@", @"objectName", v81];

          id v38 = [v14 filteredArrayUsingPredicate:v82];

          if (![v38 count])
          {
            uint64_t v39 = v82;
            uint64_t v40 = (void *)MEMORY[0x1D9452090]();
            id v41 = v114;
            uint64_t v42 = HMFGetOSLogHandle();
            if (!os_log_type_enabled(v42, OS_LOG_TYPE_INFO)) {
              goto LABEL_23;
            }
            long long v43 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138543362;
            long long v130 = v43;
            long long v44 = "%{public}@After filtering for serviceName, no objects to apply the command to";
            goto LABEL_22;
          }
          id v69 = (void *)v82;
          uint64_t v14 = v38;
        }
        id v83 = [v9 sceneName];

        if (!v83) {
          goto LABEL_68;
        }
        uint64_t v84 = (void *)MEMORY[0x1E4F28F60];
        long long v85 = [v9 sceneName];
        uint64_t v86 = [v84 predicateWithFormat:@"%K =[d] %@", @"objectName", v85];

        id v38 = [v14 filteredArrayUsingPredicate:v86];

        if ([v38 count])
        {
          id v69 = (void *)v86;
          uint64_t v14 = v38;
LABEL_68:
          long long v87 = [v9 sceneType];

          if (!v87)
          {
            uint64_t v45 = (uint64_t)v69;
LABEL_104:
            long long v97 = [v9 attribute];
            if (!v97 || v117) {
              goto LABEL_110;
            }
            id v118 = (void *)v45;
            long long v98 = [v9 attribute];
            if ([v98 isEqual:*MEMORY[0x1E4F96E08]])
            {
LABEL_109:

              uint64_t v45 = (uint64_t)v118;
LABEL_110:

LABEL_111:
              id v38 = v14;
              id v27 = v38;
              goto LABEL_79;
            }
            uint64_t v99 = [v9 attribute];
            if ([v99 isEqual:*MEMORY[0x1E4F96E00]])
            {

              goto LABEL_109;
            }
            id v112 = v15;
            uint64_t v105 = [v9 entityType];
            char v106 = [v105 isEqual:*MEMORY[0x1E4F96FE0]];

            if (v106)
            {
LABEL_118:
              id v15 = v112;
              uint64_t v45 = (uint64_t)v118;
              goto LABEL_111;
            }
            id v107 = [v9 attribute];
            id v38 = [(HMDAssistantCommand *)v114 filteredObjectsFromObjects:v14 byAttribute:v107 forActionType:0];

            if ([v38 count])
            {
              uint64_t v14 = v38;
              goto LABEL_118;
            }
            id v70 = (void *)MEMORY[0x1D9452090]();
            id v71 = v114;
            __int16 v72 = HMFGetOSLogHandle();
            id v15 = v112;
            if (!os_log_type_enabled(v72, OS_LOG_TYPE_INFO)) {
              goto LABEL_76;
            }
            long long v73 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138543362;
            long long v130 = v73;
            uint64_t v74 = "%{public}@After filtering for attribute, no objects to apply the command to";
            goto LABEL_75;
          }
          id v88 = [v9 sceneType];
          if ([v88 isEqualToString:*MEMORY[0x1E4F97038]])
          {
            long long v89 = (id *)MEMORY[0x1E4F2C960];
          }
          else if ([v88 isEqualToString:*MEMORY[0x1E4F97040]])
          {
            long long v89 = (id *)MEMORY[0x1E4F2C948];
          }
          else if ([v88 isEqualToString:*MEMORY[0x1E4F97048]])
          {
            long long v89 = (id *)MEMORY[0x1E4F2C930];
          }
          else
          {
            if (![v88 isEqualToString:*MEMORY[0x1E4F97050]])
            {
              id v96 = 0;
              goto LABEL_99;
            }
            long long v89 = (id *)MEMORY[0x1E4F2C938];
          }
          id v96 = *v89;
LABEL_99:

          if (v96)
          {
            uint64_t v45 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K =[d] %@", @"objectSceneType", v96];

            id v38 = [v14 filteredArrayUsingPredicate:v45];

            if (![v38 count])
            {
              id v118 = (void *)v45;
              id v100 = (void *)MEMORY[0x1D9452090]();
              uint64_t v101 = v114;
              id v102 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v104 = id v103 = v15;
                *(_DWORD *)long long buf = 138543362;
                long long v130 = v104;
                _os_log_impl(&dword_1D49D5000, v102, OS_LOG_TYPE_INFO, "%{public}@After filtering for actionSetType, no objects to apply the command to", buf, 0xCu);

                id v15 = v103;
              }

              goto LABEL_77;
            }
            uint64_t v14 = v38;
          }
          else
          {
            uint64_t v45 = (uint64_t)v69;
          }

          goto LABEL_104;
        }
        uint64_t v39 = v86;
        uint64_t v40 = (void *)MEMORY[0x1D9452090]();
        id v41 = v114;
        uint64_t v42 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          long long v43 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543362;
          long long v130 = v43;
          long long v44 = "%{public}@After filtering for actionSetName, no objects to apply the command to";
          goto LABEL_22;
        }
        goto LABEL_23;
      }
      id v70 = (void *)MEMORY[0x1D9452090]();
      id v71 = self;
      __int16 v72 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        long long v73 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        long long v130 = v73;
        uint64_t v74 = "%{public}@After filtering for serviceGroup, no objects to apply the command to";
        goto LABEL_75;
      }
      goto LABEL_76;
    }
    long long v75 = (void *)MEMORY[0x1D9452090]();
    id v76 = v113;
    id v77 = HMFGetOSLogHandle();
    id v9 = v119;
    if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
    {
      id v78 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      long long v130 = v78;
      _os_log_impl(&dword_1D49D5000, v77, OS_LOG_TYPE_INFO, "%{public}@After filtering for serviceType, no objects to apply the command to", buf, 0xCu);
    }

    id v27 = 0;
    id v10 = v109;
    uint64_t v12 = v116;
LABEL_72:
    id v15 = v111;
LABEL_78:
    uint64_t v45 = (uint64_t)v118;
    goto LABEL_79;
  }
  int v23 = (void *)MEMORY[0x1D9452090]();
  id v24 = self;
  long long v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    long long v26 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543362;
    long long v130 = v26;
    _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@No objects to apply the command to", buf, 0xCu);
  }
  id v27 = 0;
LABEL_81:

  return v27;
}

- (id)_homeWithSearchFilter:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDAssistantCommand *)self homeManager];
  BOOL v6 = [v4 homeIdentifier];

  if (v6)
  {
    long long v7 = [v4 homeIdentifier];
    uint64_t v8 = [v7 absoluteString];
    id v9 = [v5 _homeWithAssistantIdentifier:v8];

    id v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    uint64_t v13 = v12;
    if (v9)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        id v15 = [v4 homeIdentifier];
        int v45 = 138543874;
        long long v46 = v14;
        __int16 v47 = 2112;
        id v48 = v9;
        __int16 v49 = 2112;
        uint64_t v50 = v15;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Matched home %@ with the homeIdentifier %@ from SCF", (uint8_t *)&v45, 0x20u);
      }
      goto LABEL_31;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      uint64_t v17 = [v4 homeIdentifier];
      int v45 = 138543618;
      long long v46 = v16;
      __int16 v47 = 2112;
      id v48 = v17;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_FAULT, "%{public}@No home found with identifier %@", (uint8_t *)&v45, 0x16u);
    }
  }
  int v18 = [v4 homeName];

  if (v18)
  {
    uint64_t v19 = [v4 homeName];
    uint64_t v20 = [v5 _homesWithName:v19];

    if ((unint64_t)[v20 count] >= 2)
    {
      char v21 = (void *)MEMORY[0x1D9452090]();
      id v22 = self;
      int v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        id v24 = HMFGetLogIdentifier();
        long long v25 = [v4 homeName];
        int v45 = 138543618;
        long long v46 = v24;
        __int16 v47 = 2112;
        id v48 = v25;
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_FAULT, "%{public}@Multiple homes found with name %@, homeIdentifier should be used instead", (uint8_t *)&v45, 0x16u);
      }
    }
    long long v26 = [v4 homeName];
    id v27 = [(HMDAssistantCommand *)self _evaluateHomeOptionallyMatchingHomeName:v26];

    if (v27) {
      goto LABEL_19;
    }
    uint64_t v28 = [v20 firstObject];
    if (v28)
    {
      id v27 = (void *)v28;
      uint64_t v29 = (void *)MEMORY[0x1D9452090]();
      long long v30 = self;
      long long v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        long long v32 = HMFGetLogIdentifier();
        id v33 = [v4 homeName];
        int v45 = 138543874;
        long long v46 = v32;
        __int16 v47 = 2112;
        id v48 = v27;
        __int16 v49 = 2112;
        uint64_t v50 = v33;
        _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@Matched home %@ with the homeName %@ from SCF after a homeIdentifier mismatch", (uint8_t *)&v45, 0x20u);
      }
LABEL_19:
      id v9 = v27;

      goto LABEL_31;
    }

    goto LABEL_24;
  }
  if (v6)
  {
LABEL_24:
    uint64_t v36 = (void *)MEMORY[0x1D9452090]();
    uint64_t v37 = self;
    id v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      uint64_t v39 = HMFGetLogIdentifier();
      int v45 = 138543362;
      long long v46 = v39;
      _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_INFO, "%{public}@No matches for the home name/identifier specified in Siri command - bailing out....", (uint8_t *)&v45, 0xCu);
    }
    id v9 = 0;
    goto LABEL_31;
  }
  id v34 = [(HMDAssistantCommand *)self _evaluateHomeOptionallyMatchingHomeName:0];
  id v9 = v34;
  if (v34)
  {
    id v35 = v34;
  }
  else
  {
    uint64_t v40 = (void *)MEMORY[0x1D9452090]();
    id v41 = self;
    uint64_t v42 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      long long v43 = HMFGetLogIdentifier();
      int v45 = 138543362;
      long long v46 = v43;
      _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_INFO, "%{public}@Cannot evaluate the home to apply the Siri command to - bailing out....", (uint8_t *)&v45, 0xCu);
    }
  }

LABEL_31:
  return v9;
}

- (id)_evaluateHomeOptionallyMatchingHomeName:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDAssistantCommand *)self homeManager];
  BOOL v6 = [v5 _accessoryOfCurrentDevice];
  long long v7 = [v6 home];

  if (!v7
    || v4
    && ([v7 name],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v4 isEqual:v8],
        v8,
        !v9))
  {
    uint64_t v16 = [v5 currentHomeUUID];
    uint64_t v17 = [v5 _homeWithUUID:v16];

    if (v17
      && (!v4
       || ([v17 name],
           int v18 = objc_claimAutoreleasedReturnValue(),
           int v19 = [v4 isEqual:v18],
           v18,
           v19)))
    {
      uint64_t v20 = (void *)MEMORY[0x1D9452090]();
      char v21 = self;
      id v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        int v23 = HMFGetLogIdentifier();
        int v30 = 138543618;
        long long v31 = v23;
        __int16 v32 = 2112;
        id v33 = v17;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Defaulting to current home %@ of the device", (uint8_t *)&v30, 0x16u);
      }
    }
    else
    {
      id v24 = [v5 primaryHomeUUID];

      id v14 = [v5 _homeWithUUID:v24];

      if (!v14
        || v4
        && ([v14 name],
            long long v25 = objc_claimAutoreleasedReturnValue(),
            int v26 = [v4 isEqual:v25],
            v25,
            !v26))
      {
        id v15 = 0;
        goto LABEL_20;
      }
      uint64_t v20 = (void *)MEMORY[0x1D9452090]();
      id v27 = self;
      id v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        uint64_t v28 = HMFGetLogIdentifier();
        int v30 = 138543618;
        long long v31 = v28;
        __int16 v32 = 2112;
        id v33 = v14;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Defaulting to primary home %@ of the device", (uint8_t *)&v30, 0x16u);
      }
      uint64_t v17 = v14;
      uint64_t v16 = v24;
    }

    id v14 = v17;
    id v24 = v16;
    id v15 = v14;
LABEL_20:

    goto LABEL_21;
  }
  id v10 = (void *)MEMORY[0x1D9452090]();
  id v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = HMFGetLogIdentifier();
    int v30 = 138543618;
    long long v31 = v13;
    __int16 v32 = 2112;
    id v33 = v7;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Defaulting to home %@ that this device belongs to", (uint8_t *)&v30, 0x16u);
  }
  id v14 = v7;
  id v15 = v14;
LABEL_21:

  return v15;
}

- (id)filteredObjectsFromObjects:(id)a3 byCharacteristicType:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v18 = a4;
  id v17 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    uint64_t v10 = *MEMORY[0x1E4F96FE8];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "objectForKeyedSubscript:", @"objectType", v17);
        if ([v13 isEqualToString:v10])
        {
          id v14 = [v12 objectForKeyedSubscript:@"objectCharacteristics"];
          int v15 = [v14 containsObject:v18];

          if (v15) {
            [v17 addObject:v12];
          }
        }
        else
        {
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  return v17;
}

- (id)filteredObjectsFromObjects:(id)a3 byAttribute:(id)a4 forActionType:(id)a5
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = +[HMDHAPMetadata getSharedInstance];
  if (!v9
    || ([v9 isEqualToString:*MEMORY[0x1E4F96DA8]] & 1) != 0
    || ([v9 isEqualToString:*MEMORY[0x1E4F96DF0]] & 1) != 0
    || ([v9 isEqualToString:*MEMORY[0x1E4F96DD0]] & 1) != 0)
  {
    int v47 = 1;
  }
  else
  {
    int v47 = [v9 isEqualToString:*MEMORY[0x1E4F96DA0]];
  }
  uint64_t v50 = [v10 mapReadCharacteristicFromAssistantName:v8];
  long long v46 = objc_msgSend(v10, "getAliasedCharacteristicTypes:");
  long long v43 = v9;
  if (([v9 isEqualToString:*MEMORY[0x1E4F96DD8]] & 1) != 0
    || ([v9 isEqualToString:*MEMORY[0x1E4F96DC8]] & 1) != 0
    || ([v9 isEqualToString:*MEMORY[0x1E4F96DE8]] & 1) != 0
    || ([v9 isEqualToString:*MEMORY[0x1E4F96DE0]] & 1) != 0
    || ([v9 isEqualToString:*MEMORY[0x1E4F96DB8]] & 1) != 0
    || ([v9 isEqualToString:*MEMORY[0x1E4F96DB0]] & 1) != 0
    || ([v9 isEqualToString:*MEMORY[0x1E4F96DC0]] & 1) != 0
    || ([v9 isEqualToString:*MEMORY[0x1E4F96DF0]] & 1) != 0
    || ([v9 isEqualToString:*MEMORY[0x1E4F96DD0]] & 1) != 0)
  {
    int v53 = 1;
  }
  else
  {
    int v53 = [v9 isEqualToString:*MEMORY[0x1E4F96DA0]];
  }
  long long v44 = v8;
  [v10 mapWriteCharacteristicFromAssistantName:v8];
  v48 = uint64_t v42 = v10;
  int v45 = objc_msgSend(v10, "getAliasedCharacteristicTypes:");
  id v49 = [MEMORY[0x1E4F1CA48] array];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  obuint64_t j = v7;
  uint64_t v11 = [obj countByEnumeratingWithState:&v64 objects:v70 count:16];
  int v12 = v47;
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v65;
    uint64_t v15 = *MEMORY[0x1E4F96FE8];
    uint64_t v51 = *(void *)v65;
    uint64_t v52 = *MEMORY[0x1E4F96FE8];
    do
    {
      uint64_t v16 = 0;
      uint64_t v54 = v13;
      do
      {
        if (*(void *)v65 != v14) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v64 + 1) + 8 * v16);
        id v18 = [v17 objectForKeyedSubscript:@"objectType"];
        int v19 = [v18 isEqualToString:v15];

        if (v19)
        {
          if (v12
            && ([v17 objectForKeyedSubscript:@"objectCharacteristics"],
                long long v20 = objc_claimAutoreleasedReturnValue(),
                char v21 = [v20 containsObject:v50],
                v20,
                (v21 & 1) == 0))
          {
            long long v62 = 0u;
            long long v63 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            id v23 = v46;
            uint64_t v24 = [v23 countByEnumeratingWithState:&v60 objects:v69 count:16];
            if (v24)
            {
              uint64_t v25 = v24;
              uint64_t v26 = *(void *)v61;
              while (2)
              {
                for (uint64_t i = 0; i != v25; ++i)
                {
                  if (*(void *)v61 != v26) {
                    objc_enumerationMutation(v23);
                  }
                  uint64_t v28 = *(void *)(*((void *)&v60 + 1) + 8 * i);
                  uint64_t v29 = [v17 objectForKeyedSubscript:@"objectCharacteristics"];
                  LOBYTE(v28) = [v29 containsObject:v28];

                  if (v28)
                  {
                    int v22 = 1;
                    goto LABEL_35;
                  }
                }
                uint64_t v25 = [v23 countByEnumeratingWithState:&v60 objects:v69 count:16];
                if (v25) {
                  continue;
                }
                break;
              }
              int v22 = 0;
LABEL_35:
              int v12 = v47;
              uint64_t v14 = v51;
            }
            else
            {
              int v22 = 0;
            }
          }
          else
          {
            int v22 = 1;
          }
          if (v53)
          {
            int v30 = [v17 objectForKeyedSubscript:@"objectCharacteristics"];
            char v31 = [v30 containsObject:v48];

            if (v31)
            {
              int v32 = 1;
            }
            else
            {
              long long v58 = 0u;
              long long v59 = 0u;
              long long v56 = 0u;
              long long v57 = 0u;
              id v33 = v45;
              uint64_t v34 = [v33 countByEnumeratingWithState:&v56 objects:v68 count:16];
              if (v34)
              {
                uint64_t v35 = v34;
                uint64_t v36 = *(void *)v57;
                while (2)
                {
                  for (uint64_t j = 0; j != v35; ++j)
                  {
                    if (*(void *)v57 != v36) {
                      objc_enumerationMutation(v33);
                    }
                    uint64_t v38 = *(void *)(*((void *)&v56 + 1) + 8 * j);
                    uint64_t v39 = [v17 objectForKeyedSubscript:@"objectCharacteristics"];
                    LOBYTE(v38) = [v39 containsObject:v38];

                    if (v38)
                    {
                      int v32 = 1;
                      goto LABEL_52;
                    }
                  }
                  uint64_t v35 = [v33 countByEnumeratingWithState:&v56 objects:v68 count:16];
                  if (v35) {
                    continue;
                  }
                  break;
                }
                int v32 = 0;
LABEL_52:
                int v12 = v47;
              }
              else
              {
                int v32 = 0;
              }
            }
            uint64_t v14 = v51;
          }
          else
          {
            int v32 = 1;
          }
          int v40 = v22 & v32;
          uint64_t v15 = v52;
          uint64_t v13 = v54;
          if (v40 == 1) {
            [v49 addObject:v17];
          }
        }
        ++v16;
      }
      while (v16 != v13);
      uint64_t v13 = [obj countByEnumeratingWithState:&v64 objects:v70 count:16];
    }
    while (v13);
  }

  return v49;
}

- (id)filteredObjectsFromObjects:(id)a3 forGroup:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "objectForKeyedSubscript:", @"objectGroups", (void)v17);
        uint64_t v15 = v14;
        if (v14 && [v14 containsObject:v6]) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)filteredObjectsFromObjects:(id)a3 forHomeName:(id)a4 roomName:(id)a5 zoneName:(id)a6
{
  v61[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  unint64_t v12 = (unint64_t)a5;
  unint64_t v45 = (unint64_t)a6;
  if (v12 | v45)
  {
    unint64_t v13 = 0x1E4F1C000uLL;
    id v42 = v11;
    if (v12)
    {
      v61[0] = v12;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:1];
    }
    else if (v45)
    {
      id v40 = v10;
      id v41 = objc_opt_new();
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      obuint64_t j = [(HMDAssistantCommand *)self homeKitObjects];
      uint64_t v16 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v55;
        uint64_t v19 = *MEMORY[0x1E4F96FD8];
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v55 != v18) {
              objc_enumerationMutation(obj);
            }
            char v21 = *(void **)(*((void *)&v54 + 1) + 8 * i);
            if (v11)
            {
              uint64_t v22 = [*(id *)(*((void *)&v54 + 1) + 8 * i) objectForKeyedSubscript:@"objectHome"];
              int v23 = [v22 isEqualToString:v11];

              if (!v23) {
                continue;
              }
            }
            uint64_t v24 = [v21 objectForKeyedSubscript:@"objectType"];
            int v25 = [v24 isEqualToString:v19];

            if (v25)
            {
              long long v52 = 0u;
              long long v53 = 0u;
              long long v50 = 0u;
              long long v51 = 0u;
              uint64_t v26 = [v21 objectForKeyedSubscript:@"objectZones"];
              uint64_t v27 = [v26 countByEnumeratingWithState:&v50 objects:v59 count:16];
              if (v27)
              {
                uint64_t v28 = v27;
                uint64_t v29 = *(void *)v51;
                while (2)
                {
                  for (uint64_t j = 0; j != v28; ++j)
                  {
                    if (*(void *)v51 != v29) {
                      objc_enumerationMutation(v26);
                    }
                    if ([(id)v45 isEqualToString:*(void *)(*((void *)&v50 + 1) + 8 * j)])
                    {
                      char v31 = [v21 objectForKeyedSubscript:@"objectName"];
                      [v41 addObject:v31];

                      goto LABEL_24;
                    }
                  }
                  uint64_t v28 = [v26 countByEnumeratingWithState:&v50 objects:v59 count:16];
                  if (v28) {
                    continue;
                  }
                  break;
                }
              }
LABEL_24:

              id v11 = v42;
            }
          }
          uint64_t v17 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
        }
        while (v17);
      }

      id v10 = v40;
      unint64_t v12 = 0;
      unint64_t v13 = 0x1E4F1C000;
      uint64_t v14 = v41;
    }
    else
    {
      uint64_t v14 = 0;
    }
    id v15 = [*(id *)(v13 + 2632) array];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id obja = v14;
    uint64_t v32 = [obja countByEnumeratingWithState:&v46 objects:v58 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = 0;
      uint64_t v35 = *(void *)v47;
      do
      {
        uint64_t v36 = 0;
        uint64_t v37 = v34;
        do
        {
          if (*(void *)v47 != v35) {
            objc_enumerationMutation(obja);
          }
          uint64_t v34 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K =[d] %@", @"objectRoom", *(void *)(*((void *)&v46 + 1) + 8 * v36)];

          uint64_t v38 = [v10 filteredArrayUsingPredicate:v34];
          [v15 addObjectsFromArray:v38];

          ++v36;
          uint64_t v37 = v34;
        }
        while (v33 != v36);
        uint64_t v33 = [obja countByEnumeratingWithState:&v46 objects:v58 count:16];
      }
      while (v33);
    }
    id v11 = v42;
  }
  else
  {
    id v15 = v10;
  }

  return v15;
}

- (id)objectsWithIdentifierList:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = [(HMDAssistantCommand *)self homeKitObjects];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    char v21 = a4;
    id v10 = 0;
    uint64_t v11 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v7);
        }
        unint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "objectForKeyedSubscript:", @"objectIdentifier", v21);
        int v15 = [v6 containsObject:v14];

        if (v15)
        {
          uint64_t v16 = [v13 objectForKeyedSubscript:@"objectHomeIdentifier"];
          uint64_t v17 = v16;
          if (v10)
          {
            if (([v10 isEqualToString:v16] & 1) == 0)
            {
              if (v21)
              {
                id *v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
              }

              uint64_t v18 = (void *)MEMORY[0x1E4F1CBF0];
              uint64_t v19 = v22;
              goto LABEL_20;
            }
          }
          else
          {
            id v10 = v16;
          }
          [v22 addObject:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v10 = 0;
  }

  uint64_t v19 = v22;
  uint64_t v18 = (void *)[v22 copy];
LABEL_20:

  return v18;
}

- (id)adjustGetValue:(id)a3 type:(id)a4 units:(id)a5 attribute:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v10;
  int v15 = +[HMDHAPMetadata getSharedInstance];
  if ([v15 supportsLocalization:v13])
  {
    uint64_t v16 = v14;
    if (isTemperatureAttribute(v13))
    {
      uint64_t v16 = v14;
      if (temperatureConversionIsNeeded(v12))
      {
        uint64_t v17 = NSNumber;
        [v14 floatValue];
        *(float *)&double v19 = (float)(v18 * 1.8) + 32.0;
        uint64_t v16 = [v17 numberWithFloat:v19];

        long long v20 = (void *)MEMORY[0x1D9452090]();
        char v21 = self;
        uint64_t v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          long long v23 = HMFGetLogIdentifier();
          int v25 = 138544130;
          long long v26 = v23;
          __int16 v27 = 2112;
          id v28 = v13;
          __int16 v29 = 2112;
          id v30 = v14;
          __int16 v31 = 2112;
          uint64_t v32 = v16;
          _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@adjustGet: Attribute %@ value %@  adjusted to Fahrenheit %@", (uint8_t *)&v25, 0x2Au);
        }
      }
    }
  }
  else
  {
    uint64_t v16 = [v15 mapToAssistantCharacteristicValue:v14 name:v13 getActionType:1];
  }
  return v16;
}

- (id)adjustSetValue:(id)a3 type:(id)a4 units:(id)a5 attribute:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v10;
  int v15 = +[HMDHAPMetadata getSharedInstance];
  if ([v15 supportsLocalization:v13])
  {
    uint64_t v16 = v14;
    if (isTemperatureAttribute(v13))
    {
      uint64_t v16 = v14;
      if (temperatureConversionIsNeeded(v12))
      {
        uint64_t v17 = NSNumber;
        [v14 floatValue];
        *(float *)&double v19 = (float)((float)(v18 + -32.0) * 5.0) / 9.0;
        uint64_t v16 = [v17 numberWithFloat:v19];

        long long v20 = (void *)MEMORY[0x1D9452090]();
        char v21 = self;
        uint64_t v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          long long v23 = HMFGetLogIdentifier();
          int v25 = 138544130;
          long long v26 = v23;
          __int16 v27 = 2112;
          id v28 = v13;
          __int16 v29 = 2112;
          id v30 = v14;
          __int16 v31 = 2112;
          uint64_t v32 = v16;
          _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@adjustSet: Attribute %@ value %@  converted to Celsius as %@", (uint8_t *)&v25, 0x2Au);
        }
      }
    }
  }
  else
  {
    uint64_t v16 = [v15 mapFromAssistantCharacteristicValue:v14 name:v13];
  }
  return v16;
}

- (BOOL)isAttributeValue:(id)a3 equalTo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    char v8 = [v5 value];
    char v9 = [v7 value];

    char v10 = v8 ^ v9 ^ 1;
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v6;
    uint64_t v12 = [v5 value];
    uint64_t v13 = [v11 value];

    BOOL v14 = v12 == v13;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v20 = v6;
      char v21 = [v5 value];
      uint64_t v22 = [v20 value];

      char v10 = [v21 isEqualToString:v22];
      goto LABEL_14;
    }
LABEL_13:
    char v10 = 0;
    goto LABEL_14;
  }
  id v15 = v6;
  [v5 value];
  float v17 = v16;
  [v15 value];
  float v19 = v18;

  BOOL v14 = v17 == v19;
LABEL_8:
  char v10 = v14;
LABEL_14:

  return v10;
}

- (id)getValueOfType:(id)a3 action:(id)a4
{
  id v4 = a4;
  id v5 = [v4 value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v7 = [v4 value];
  char v8 = v7;
  if (isKindOfClass)
  {
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "value"));
LABEL_9:
    float v16 = (void *)v9;

    goto LABEL_10;
  }
  objc_opt_class();
  char v10 = objc_opt_isKindOfClass();

  id v11 = [v4 value];
  char v8 = v11;
  if (v10)
  {
    uint64_t v12 = NSNumber;
    [v11 value];
    uint64_t v9 = objc_msgSend(v12, "numberWithFloat:");
    goto LABEL_9;
  }
  objc_opt_class();
  char v13 = objc_opt_isKindOfClass();

  BOOL v14 = [v4 value];
  char v8 = v14;
  if (v13)
  {
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "value"));
    goto LABEL_9;
  }
  objc_opt_class();
  char v15 = objc_opt_isKindOfClass();

  if (v15)
  {
    char v8 = [v4 value];
    uint64_t v9 = [v8 value];
    goto LABEL_9;
  }
  float v16 = 0;
LABEL_10:

  return v16;
}

- (id)getLocaleUnits:(id)a3
{
  id v3 = a3;
  id v4 = (void *)*MEMORY[0x1E4F2CE30];
  char v5 = [v3 isEqualToString:*MEMORY[0x1E4F2CE30]];
  id v6 = (void *)*MEMORY[0x1E4F2CE38];
  if ((v5 & 1) != 0 || (int v7 = [v3 isEqualToString:*MEMORY[0x1E4F2CE38]], v8 = v3, v7))
  {
    if (isMetricLocale_onceToken != -1) {
      dispatch_once(&isMetricLocale_onceToken, &__block_literal_global_131496);
    }
    if (isMetricLocale_isMetricLocale) {
      char v8 = v4;
    }
    else {
      char v8 = v6;
    }
  }
  id v9 = v8;

  return v9;
}

- (id)actionResultForCharacteristic:(id)a3 actionSet:(id)a4 action:(id)a5 objects:(id)a6 error:(id)a7
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  long long v52 = [v11 service];
  id v16 = v11;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  float v17 = [v12 actions];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v53 objects:buf count:16];
  id v50 = v14;
  if (v18)
  {
    uint64_t v19 = v18;
    id v48 = v15;
    id v20 = v13;
    id v21 = v12;
    uint64_t v22 = *(void *)v54;
    while (2)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v54 != v22) {
          objc_enumerationMutation(v17);
        }
        id v24 = *(id *)(*((void *)&v53 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          int v25 = v24;
        }
        else {
          int v25 = 0;
        }
        id v26 = v25;

        if (v26 && [v26 isActionForCharacteristic:v16])
        {
          __int16 v27 = [v26 targetValue];

          goto LABEL_15;
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v53 objects:buf count:16];
      if (v19) {
        continue;
      }
      break;
    }
    __int16 v27 = 0;
LABEL_15:
    id v12 = v21;
    id v13 = v20;
    id v15 = v48;
    id v14 = v50;
  }
  else
  {
    __int16 v27 = 0;
  }

  id v28 = entityForService(v52, 0, v14, [v13 includeCompleteInformation]);
  if (v28)
  {
    __int16 v29 = actionResultForAction(v13);
    id v30 = [(HMDAssistantCommand *)self actionOutcomeFromError:v15];
    [v29 setOutcome:v30];

    [v29 setEntity:v28];
    if (isMetricLocale_onceToken != -1) {
      dispatch_once(&isMetricLocale_onceToken, &__block_literal_global_131496);
    }
    __int16 v31 = getTupleForCharacteristic(v16, v27, isMetricLocale_isMetricLocale);
    uint64_t v32 = v31;
    if (v31)
    {
      uint64_t v33 = [v31 attribute];
      [v29 setResultAttribute:v33];

      uint64_t v34 = [v32 value];
      [v29 setResultValue:v34];
    }
    else
    {
      id v49 = v15;
      context = (void *)MEMORY[0x1D9452090]();
      id v41 = self;
      id v42 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        long long v43 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543618;
        long long v58 = v43;
        __int16 v59 = 2112;
        id v60 = v16;
        _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_INFO, "%{public}@There is no Siri mapping attribute and/or format for characteristic : %@", buf, 0x16u);

        id v14 = v50;
      }

      id v15 = v49;
    }

    if (v29)
    {
      long long v44 = [v29 resultValue];
      if (v44) {
        unint64_t v45 = v29;
      }
      else {
        unint64_t v45 = 0;
      }
      id v40 = v45;
    }
    else
    {
      id v40 = 0;
    }
  }
  else
  {
    id v35 = v15;
    uint64_t v36 = (void *)MEMORY[0x1D9452090]();
    uint64_t v37 = self;
    uint64_t v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      uint64_t v39 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      long long v58 = v39;
      __int16 v59 = 2112;
      id v60 = v52;
      _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_INFO, "%{public}@Unable to get the entity for service : %@", buf, 0x16u);

      id v14 = v50;
    }

    id v40 = 0;
    id v15 = v35;
  }

  return v40;
}

- (id)actionResultForMediaProfile:(id)a3 action:(id)a4 objects:(id)a5 error:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = entityForMediaProfile(v10, v12, [v11 includeCompleteInformation]);
  if (v14)
  {
    id v15 = actionResultForAction(v11);
    id v16 = [(HMDAssistantCommand *)self actionOutcomeFromError:v13];
    [v15 setOutcome:v16];

    [v15 setEntity:v14];
    id v17 = v11;
    uint64_t v18 = getAttributeForMediaProfile(v14);
    uint64_t v19 = [v17 actionType];
    if ([v19 isEqualToString:*MEMORY[0x1E4F96DD8]])
    {
      id v31 = v13;
      id v20 = [v17 attribute];
      int v21 = [v20 isEqualToString:*MEMORY[0x1E4F96E20]];

      if (v21)
      {
        uint64_t v22 = (void *)*MEMORY[0x1E4F96E40];
        if ([v18 containsObject:*MEMORY[0x1E4F96E40]]) {
          long long v23 = v22;
        }
        else {
          long long v23 = 0;
        }
        id v24 = v23;
      }
      else
      {
        id v24 = 0;
      }
      id v13 = v31;
    }
    else
    {

      id v24 = 0;
    }

    [v15 setResultAttribute:v24];
    id v29 = objc_alloc_init(MEMORY[0x1E4F96678]);
    [v29 setValue:1];
    [v15 setResultValue:v29];
  }
  else
  {
    int v25 = (void *)MEMORY[0x1D9452090]();
    id v26 = self;
    __int16 v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v28 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      uint64_t v33 = v28;
      __int16 v34 = 2112;
      id v35 = v10;
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unable to get the entity for service : %@", buf, 0x16u);
    }
    id v15 = 0;
  }

  return v15;
}

- (id)failedActionResultsFromResponse:(id)a3 inActionSet:(id)a4 withAction:(id)a5
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v58 = a4;
  id v60 = a5;
  long long v57 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K =[d] %@", @"objectType", *MEMORY[0x1E4F96FE8]];
  id v10 = [(HMDAssistantCommand *)self homeKitObjects];
  long long v47 = (void *)v9;
  __int16 v59 = [v10 filteredArrayUsingPredicate:v9];

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v73 objects:v83 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v74;
    unint64_t v15 = 0x1E4F29000uLL;
    uint64_t v48 = *(void *)v74;
    id v49 = v11;
    do
    {
      uint64_t v16 = 0;
      uint64_t v50 = v13;
      do
      {
        if (*(void *)v74 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v73 + 1) + 8 * v16);
        uint64_t v18 = [(HMDAssistantCommand *)self home];
        uint64_t v19 = (void *)[objc_alloc(*(Class *)(v15 + 296)) initWithUUIDString:v17];
        uint64_t v20 = [v18 mediaProfileWithUUID:v19];

        long long v52 = (void *)v20;
        if (v20)
        {
          objc_msgSend(v11, "hmf_dictionaryForKey:", v17);
          id v61 = (id)objc_claimAutoreleasedReturnValue();
          int v21 = objc_msgSend(v61, "hmf_dataForKey:", @"HM.mediaPlaybackErrorDataKey");
          if (!v21) {
            goto LABEL_41;
          }
          objc_msgSend(MEMORY[0x1E4F28C58], "hmf_unarchiveFromData:error:", v21, 0);
          id v22 = (id)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            long long v23 = [(HMDAssistantCommand *)self actionResultForMediaProfile:v20 action:v60 objects:v59 error:v22];
            if (v23) {
              [v57 addObject:v23];
            }
          }
        }
        else
        {
          uint64_t v51 = v16;
          id v24 = [(HMDAssistantCommand *)self home];
          int v25 = (void *)[objc_alloc(*(Class *)(v15 + 296)) initWithUUIDString:v17];
          id v26 = [v24 accessoryWithUUID:v25];

          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            __int16 v27 = v26;
          }
          else {
            __int16 v27 = 0;
          }
          id v61 = v27;

          id v28 = objc_msgSend(v11, "hmf_dictionaryForKey:", v17);
          long long v69 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          id v22 = v28;
          uint64_t v55 = [v22 countByEnumeratingWithState:&v69 objects:v82 count:16];
          if (v55)
          {
            uint64_t v53 = *(void *)v70;
            long long v54 = v22;
            do
            {
              uint64_t v29 = 0;
              do
              {
                if (*(void *)v70 != v53) {
                  objc_enumerationMutation(v22);
                }
                uint64_t v56 = v29;
                long long v62 = *(void **)(*((void *)&v69 + 1) + 8 * v29);
                id v30 = objc_msgSend(v22, "hmf_dictionaryForKey:");
                long long v65 = 0u;
                long long v66 = 0u;
                long long v67 = 0u;
                long long v68 = 0u;
                id v31 = v30;
                uint64_t v64 = [v31 countByEnumeratingWithState:&v65 objects:v81 count:16];
                if (v64)
                {
                  uint64_t v63 = *(void *)v66;
                  do
                  {
                    for (uint64_t i = 0; i != v64; ++i)
                    {
                      if (*(void *)v66 != v63) {
                        objc_enumerationMutation(v31);
                      }
                      uint64_t v33 = *(void **)(*((void *)&v65 + 1) + 8 * i);
                      __int16 v34 = objc_msgSend(v31, "hmf_dictionaryForKey:", v33);
                      id v35 = [v34 errorFromDataForKey:@"kCharacteristicErrorDataKey"];
                      if (v35)
                      {
                        uint64_t v36 = (void *)MEMORY[0x1D9452090]();
                        uint64_t v37 = self;
                        uint64_t v38 = HMFGetOSLogHandle();
                        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                        {
                          HMFGetLogIdentifier();
                          v40 = uint64_t v39 = self;
                          *(_DWORD *)long long buf = 138543618;
                          id v78 = v40;
                          __int16 v79 = 2112;
                          int v80 = v35;
                          _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_INFO, "%{public}@Parsing error for Siri : %@", buf, 0x16u);

                          self = v39;
                        }

                        id v41 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v33, "integerValue"));
                        id v42 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v62, "integerValue"));
                        long long v43 = [v61 findCharacteristic:v41 forService:v42];
                        if (v43)
                        {
                          long long v44 = [(HMDAssistantCommand *)v37 actionResultForCharacteristic:v43 actionSet:v58 action:v60 objects:v59 error:v35];
                          if (v44) {
                            [v57 addObject:v44];
                          }
                        }
                      }
                    }
                    uint64_t v64 = [v31 countByEnumeratingWithState:&v65 objects:v81 count:16];
                  }
                  while (v64);
                }

                uint64_t v29 = v56 + 1;
                id v22 = v54;
              }
              while (v56 + 1 != v55);
              uint64_t v55 = [v54 countByEnumeratingWithState:&v69 objects:v82 count:16];
            }
            while (v55);
            int v21 = v54;
            uint64_t v14 = v48;
            id v11 = v49;
            unint64_t v15 = 0x1E4F29000;
            uint64_t v13 = v50;
            id v22 = v54;
          }
          else
          {
            int v21 = v22;
          }
          uint64_t v16 = v51;
        }

LABEL_41:
        ++v16;
      }
      while (v16 != v13);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v73 objects:v83 count:16];
    }
    while (v13);
  }

  unint64_t v45 = (void *)[v57 copy];
  return v45;
}

- (id)entityFromActionSet:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F96690];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [v4 name];
  [v5 setName:v6];

  int v7 = (void *)MEMORY[0x1E4F1CB10];
  id v8 = [v4 urlString];
  uint64_t v9 = [v7 URLWithString:v8];
  [v5 setIdentifier:v9];

  [v5 setEntityType:*MEMORY[0x1E4F96FE0]];
  id v10 = [v4 type];

  id v11 = mapToSiriSceneType(v10);
  [v5 setSceneType:v11];

  return v5;
}

- (BOOL)populateMediaProfileWriteResult:(id)a3 withValue:(id)a4 serviceType:(id)a5 action:(id)a6
{
  id v8 = a6;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[HMDHAPMetadata getSharedInstance];
  uint64_t v12 = [v8 attribute];
  uint64_t v13 = [v11 mapWriteCharacteristicFromAssistantName:v12];

  uint64_t v14 = [v8 value];
  unint64_t v15 = [v14 units];
  uint64_t v16 = [v8 attribute];
  if (isMetricLocale_onceToken != -1) {
    dispatch_once(&isMetricLocale_onceToken, &__block_literal_global_131496);
  }
  uint64_t v17 = valueWithAssistantUnits(v15, v13, v16, v9, 0, isMetricLocale_isMetricLocale);

  [v10 setResultValue:v17];
  uint64_t v18 = [v8 attribute];

  [v10 setResultAttribute:v18];
  return 1;
}

- (BOOL)populateResultWithEntity:(id)a3 action:(id)a4 entity:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [a4 attribute];
  [v8 setResultAttribute:v9];

  [v8 setEntity:v7];
  return 1;
}

- (BOOL)populateResult:(id)a3 withObject:(id)a4 serviceType:(id)a5 action:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = [v13 includeCompleteInformation];
  unint64_t v15 = [v13 attribute];
  [v10 setResultAttribute:v15];

  uint64_t v16 = entityFromObject(v11, v14);
  [v10 setEntity:v16];

  uint64_t v17 = [v13 attribute];
  if (v17
    && (uint64_t v18 = (void *)v17,
        [v11 objectForKeyedSubscript:@"objectType"],
        uint64_t v19 = objc_claimAutoreleasedReturnValue(),
        int v20 = [v19 isEqualToString:*MEMORY[0x1E4F96FE8]],
        v19,
        v18,
        v20))
  {
    int v21 = [(HMDAssistantCommand *)self serviceFromObject:v11];
    BOOL v22 = [(HMDAssistantCommand *)self populateResult:v10 withService:v21 serviceType:v12 characteristic:0 resultAttribute:0 action:v13];
  }
  else
  {
    BOOL v22 = 1;
  }

  return v22;
}

- (BOOL)populateResult:(id)a3 withService:(id)a4 serviceType:(id)a5 characteristic:(id)a6 resultAttribute:(id)a7 action:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  uint64_t v18 = +[HMDHAPMetadata getSharedInstance];
  if (v16)
  {
    [v13 setResultAttribute:v16];
  }
  else
  {
    if (v15)
    {
      uint64_t v19 = [v15 characteristicType];
      int v20 = [v18 mapToAssistantCharacteristicName:v19];
      [v13 setResultAttribute:v20];
    }
    else
    {
      uint64_t v19 = [v17 attribute];
      [v13 setResultAttribute:v19];
    }
  }
  uint64_t v21 = [v17 attribute];
  if (v21)
  {
    BOOL v22 = (void *)v21;
    long long v23 = [v13 outcome];
    int v24 = isOutcomeSuccess(v23);

    if (v24)
    {
      id v93 = self;
      if (v15)
      {
        int v25 = [v15 characteristicType];
      }
      else
      {
        if (!v17) {
          goto LABEL_16;
        }
        uint64_t v27 = [v17 actionType];
        if (!v27
          || (id v28 = (void *)v27,
              [v17 actionType],
              uint64_t v29 = objc_claimAutoreleasedReturnValue(),
              int v30 = [v29 isEqualToString:*MEMORY[0x1E4F96DA8]],
              v29,
              v28,
              v30))
        {
          id v31 = [v17 attribute];
          uint64_t v32 = [v18 mapReadCharacteristicFromAssistantName:v31];
        }
        else
        {
LABEL_16:
          id v31 = [v17 attribute];
          uint64_t v32 = [v18 mapWriteCharacteristicFromAssistantName:v31];
        }
        int v25 = (void *)v32;

        uint64_t v33 = [v14 characteristics];
        objc_msgSend(v33, "hmf_firstObjectWithCharacteristicType:", v25);
        id v15 = (id)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          __int16 v34 = [v18 getCharacteristicTypeAlias:v25];
          id v35 = [v14 characteristics];
          objc_msgSend(v35, "hmf_firstObjectWithCharacteristicType:", v34);
          id v15 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      uint64_t v36 = [v15 metadata];
      uint64_t v37 = [v36 units];
      if (!v15)
      {
        LOBYTE(v26) = 1;
LABEL_46:

        goto LABEL_47;
      }
      long long v91 = v37;
      long long v97 = v25;
      uint64_t v38 = [v17 actionType];
      uint64_t v39 = (uint64_t *)MEMORY[0x1E4F96DA8];
      long long v92 = v36;
      if (!v38)
      {
        uint64_t v42 = *MEMORY[0x1E4F96DA8];
        goto LABEL_35;
      }
      id v40 = (void *)v38;
      id v41 = [v17 actionType];
      uint64_t v42 = *v39;
      if ([v41 isEqualToString:v42]) {
        goto LABEL_34;
      }
      long long v43 = [v17 actionType];
      if ([v43 isEqualToString:*MEMORY[0x1E4F96DC8]])
      {

LABEL_34:
        goto LABEL_35;
      }
      id v94 = v43;
      long long v44 = [v17 actionType];
      if ([v44 isEqualToString:*MEMORY[0x1E4F96DD8]])
      {

LABEL_33:
        goto LABEL_34;
      }
      uint64_t v90 = v44;
      unint64_t v45 = [v17 actionType];
      if ([v45 isEqualToString:*MEMORY[0x1E4F96DD0]])
      {

LABEL_32:
        goto LABEL_33;
      }
      long long v89 = v45;
      long long v46 = [v17 actionType];
      if ([v46 isEqualToString:*MEMORY[0x1E4F96DA0]])
      {

        goto LABEL_32;
      }
      long long v87 = [v17 actionType];
      char v88 = [v87 isEqualToString:*MEMORY[0x1E4F96DF0]];

      if (v88)
      {
LABEL_35:
        long long v47 = [v17 value];
        uint64_t v48 = [v47 units];
        long long v95 = [v18 mapFromAssistantUnitName:v48];

        id v49 = [v17 actionType];
        unsigned int v50 = [v49 isEqualToString:v42];

        uint64_t v51 = [v13 resultAttribute];
        long long v52 = [v15 value];
        if (isMetricLocale_onceToken != -1) {
          dispatch_once(&isMetricLocale_onceToken, &__block_literal_global_131496);
        }
        uint64_t v53 = valueWithAssistantUnits(v95, v97, v51, v52, v50, isMetricLocale_isMetricLocale);
        [v13 setResultValue:v53];

        uint64_t v54 = [v17 value];
        if (!v54)
        {
          LOBYTE(v26) = 1;
          int v25 = v97;
          goto LABEL_44;
        }
        uint64_t v55 = (void *)v54;
        uint64_t v56 = [v17 actionType];
        if (v56)
        {
          long long v57 = (void *)v56;
          id v58 = [v17 actionType];
          int v59 = [v58 isEqualToString:v42];

          int v25 = v97;
          if (!v59)
          {
LABEL_40:
            LOBYTE(v26) = 1;
LABEL_44:

LABEL_45:
            uint64_t v37 = v91;
            uint64_t v36 = v92;
            goto LABEL_46;
          }
        }
        else
        {

          int v25 = v97;
        }
        id v60 = [v17 value];
        id v61 = [v13 resultValue];
        LOBYTE(v26) = [(HMDAssistantCommand *)v93 isAttributeValue:v60 equalTo:v61];

        goto LABEL_44;
      }
      uint64_t v63 = [v17 actionType];
      if ([v63 isEqualToString:*MEMORY[0x1E4F96DE8]])
      {

        int v25 = v97;
        goto LABEL_52;
      }
      uint64_t v64 = [v17 actionType];
      int v65 = [v64 isEqualToString:*MEMORY[0x1E4F96DE0]];

      int v25 = v97;
      if (v65)
      {
LABEL_52:
        if (v18)
        {
          long long v66 = [v17 value];
          long long v67 = [v66 units];
          long long v95 = [v18 mapFromAssistantUnitName:v67];

          long long v68 = [v13 resultAttribute];
          long long v69 = [v15 value];
          if (isMetricLocale_onceToken != -1) {
            dispatch_once(&isMetricLocale_onceToken, &__block_literal_global_131496);
          }
          long long v70 = valueWithAssistantUnits(v95, v25, v68, v69, 0, isMetricLocale_isMetricLocale);
          [v13 setResultValue:v70];

          [v13 setOutcome:*MEMORY[0x1E4F96D58]];
          goto LABEL_40;
        }
LABEL_64:
        LOBYTE(v26) = 0;
        goto LABEL_45;
      }
      long long v71 = [v17 actionType];
      uint64_t v72 = *MEMORY[0x1E4F96DB8];
      if (([v71 isEqualToString:*MEMORY[0x1E4F96DB8]] & 1) == 0)
      {
        long long v73 = [v17 actionType];
        if (![v73 isEqualToString:*MEMORY[0x1E4F96DB0]])
        {
          __int16 v79 = [v17 actionType];
          char v96 = [v79 isEqualToString:*MEMORY[0x1E4F96DC0]];

          int v25 = v97;
          if ((v96 & 1) == 0)
          {
            LOBYTE(v26) = 1;
            goto LABEL_45;
          }
LABEL_60:
          if (!v18) {
            goto LABEL_64;
          }
          long long v74 = [v17 actionType];
          int v75 = [v74 isEqualToString:v72];

          if (v75)
          {
            id v26 = [v92 minimumValue];

            if (v26)
            {
              uint64_t v76 = [v92 minimumValue];
LABEL_68:
              long long v95 = (void *)v76;
              LOBYTE(v26) = 1;
LABEL_78:
              uint64_t v82 = [v13 resultAttribute];
              if (isMetricLocale_onceToken != -1) {
                dispatch_once(&isMetricLocale_onceToken, &__block_literal_global_131496);
              }
              id v83 = valueWithAssistantUnits(v91, v25, v82, v95, 1u, isMetricLocale_isMetricLocale);
              [v13 setResultValue:v83];

              uint64_t v84 = [v17 value];

              if (v84)
              {
                long long v85 = [v17 value];
                uint64_t v86 = [v13 resultValue];
                LOBYTE(v26) = [(HMDAssistantCommand *)v93 isAttributeValue:v85 equalTo:v86];
              }
              [v13 setOutcome:*MEMORY[0x1E4F96D58]];
              goto LABEL_44;
            }
            goto LABEL_71;
          }
          id v77 = [v17 actionType];
          int v78 = [v77 isEqualToString:*MEMORY[0x1E4F96DB0]];

          if (v78)
          {
            id v26 = [v92 maximumValue];

            if (v26)
            {
              uint64_t v76 = [v92 maximumValue];
              goto LABEL_68;
            }
LABEL_71:
            long long v95 = 0;
            goto LABEL_78;
          }
          int v80 = [v17 actionType];
          int v81 = [v80 isEqualToString:*MEMORY[0x1E4F96DC0]];

          if (v81)
          {
            id v26 = [v92 stepValue];

            if (!v26)
            {
              long long v95 = 0;
              goto LABEL_77;
            }
            long long v95 = [v92 stepValue];
          }
          else
          {
            long long v95 = 0;
          }
          LOBYTE(v26) = 1;
LABEL_77:
          int v25 = v97;
          goto LABEL_78;
        }
      }
      goto LABEL_60;
    }
  }
  LOBYTE(v26) = 1;
LABEL_47:

  return (char)v26;
}

- (id)mediaProfileFromObject:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"objectReference"];
  id v5 = objc_msgSend(v3, "hmf_stringForKey:", @"objectType");

  if ([v5 isEqualToString:*MEMORY[0x1E4F96FE8]])
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)serviceFromObject:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"objectReference"];
  id v5 = objc_msgSend(v3, "hmf_stringForKey:", @"objectType");

  if ([v5 isEqualToString:*MEMORY[0x1E4F96FE8]]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v4;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end