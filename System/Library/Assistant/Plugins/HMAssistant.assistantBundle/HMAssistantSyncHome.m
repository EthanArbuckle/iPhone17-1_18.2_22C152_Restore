@interface HMAssistantSyncHome
+ (id)logCategory;
- (BOOL)done;
- (BOOL)shouldSyncForAnchor:(id)a3;
- (HMAssistantSyncHome)init;
- (HMHomeManager)homeManager;
- (NSArray)anchors;
- (NSArray)entities;
- (NSString)finalAnchor;
- (OS_dispatch_group)waitGroup;
- (OS_dispatch_queue)queue;
- (id)currentSyncSnapshot;
- (unint64_t)fetchHomeConfigurationStartTime;
- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 count:(int64_t)a5 forKey:(id)a6 beginInfo:(id)a7;
- (void)dealloc;
- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)setAnchors:(id)a3;
- (void)setDone:(BOOL)a3;
- (void)setEntities:(id)a3;
- (void)setFetchHomeConfigurationStartTime:(unint64_t)a3;
- (void)setFinalAnchor:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setQueue:(id)a3;
- (void)setWaitGroup:(id)a3;
- (void)syncDidEnd;
@end

@implementation HMAssistantSyncHome

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitGroup, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_finalAnchor, 0);
  objc_storeStrong((id *)&self->_entities, 0);

  objc_storeStrong((id *)&self->_anchors, 0);
}

- (void)setWaitGroup:(id)a3
{
}

- (OS_dispatch_group)waitGroup
{
  return self->_waitGroup;
}

- (void)setFetchHomeConfigurationStartTime:(unint64_t)a3
{
  self->_fetchHomeConfigurationStartTime = a3;
}

- (unint64_t)fetchHomeConfigurationStartTime
{
  return self->_fetchHomeConfigurationStartTime;
}

- (void)setHomeManager:(id)a3
{
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setDone:(BOOL)a3
{
  self->_done = a3;
}

- (BOOL)done
{
  return self->_done;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setFinalAnchor:(id)a3
{
}

- (NSString)finalAnchor
{
  return self->_finalAnchor;
}

- (void)setEntities:(id)a3
{
}

- (NSArray)entities
{
  return self->_entities;
}

- (void)setAnchors:(id)a3
{
}

- (NSArray)anchors
{
  return self->_anchors;
}

- (void)syncDidEnd
{
  [(HMAssistantSyncHome *)self setFinalAnchor:0];
  [(HMAssistantSyncHome *)self setAnchors:0];

  [(HMAssistantSyncHome *)self setEntities:0];
}

- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  v7 = [(HMAssistantSyncHome *)self entities];
  if (![v7 count])
  {

    goto LABEL_7;
  }
  v8 = [(HMAssistantSyncHome *)self finalAnchor];
  char v9 = [v8 isEqualToString:v19];

  if (v9)
  {
LABEL_7:
    [v6 setObject:0];
    [v6 setPostAnchor:v19];
    goto LABEL_8;
  }
  if (v19)
  {
    v10 = [(HMAssistantSyncHome *)self anchors];
    uint64_t v11 = [v10 indexOfObject:v19];

    if (v11 < 0x7FFFFFFFFFFFFFFELL)
    {
      unint64_t v12 = v11 + 1;
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  unint64_t v12 = 0;
LABEL_12:
  v13 = [(HMAssistantSyncHome *)self anchors];
  v14 = [v13 objectAtIndex:v12];
  [v6 setPostAnchor:v14];

  v15 = [(HMAssistantSyncHome *)self entities];
  unint64_t v16 = [v15 count];

  if (v12 < v16)
  {
    v17 = [(HMAssistantSyncHome *)self entities];
    v18 = [v17 objectAtIndex:v12];
    [v6 setObject:v18];
  }
LABEL_8:
}

- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 count:(int64_t)a5 forKey:(id)a6 beginInfo:(id)a7
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  v49 = (__CFString *)a3;
  unint64_t v12 = (__CFString *)a4;
  v13 = (__CFString *)a6;
  id v48 = a7;
  if ([@"com.apple.homekit.name" isEqualToString:v13])
  {
    [(HMAssistantSyncHome *)self syncDidEnd];
    dispatch_group_t v14 = dispatch_group_create();
    [(HMAssistantSyncHome *)self setWaitGroup:v14];

    v15 = [MEMORY[0x263F0E5A8] defaultPrivateConfiguration];
    [(__CFString *)v15 setOptions:34397];
    unint64_t v16 = (void *)MEMORY[0x223CB1AD0]([(__CFString *)v15 setCachePolicy:3]);
    v17 = self;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v62 = v19;
      __int16 v63 = 2112;
      v64 = v15;
      _os_log_impl(&dword_223271000, v18, OS_LOG_TYPE_INFO, "%{public}@Started initialization of home manager with configuration %@", buf, 0x16u);
    }
    mach_absolute_time();
    [(HMAssistantSyncHome *)v17 setFetchHomeConfigurationStartTime:UpTicksToMilliseconds()];
    v20 = (void *)[objc_alloc(MEMORY[0x263F0E3C0]) initWithConfiguration:v15];
    [(HMAssistantSyncHome *)v17 setHomeManager:v20];

    v21 = [(HMAssistantSyncHome *)v17 waitGroup];
    dispatch_group_enter(v21);

    v22 = [(HMAssistantSyncHome *)v17 homeManager];
    [v22 setDelegate:v17];

    if ([MEMORY[0x263F0E2B8] areAnyAccessoriesConfigured])
    {
      if ([(HMAssistantSyncHome *)v17 shouldSyncForAnchor:v49])
      {
        v59[0] = 0;
        v59[1] = v59;
        v59[2] = 0x3032000000;
        v59[3] = sub_223273484;
        v59[4] = sub_223273494;
        id v60 = [MEMORY[0x263EFF980] array];
        v57[0] = 0;
        v57[1] = v57;
        v57[2] = 0x3032000000;
        v57[3] = sub_223273484;
        v57[4] = sub_223273494;
        id v58 = [MEMORY[0x263EFF980] array];
        getLastSyncedAssistantConfigurationVersion();
        v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)MEMORY[0x223CB1AD0]();
        HMFGetOSLogHandle();
        v24 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v25 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138544642;
          v62 = v25;
          __int16 v63 = 2112;
          v64 = v47;
          __int16 v65 = 2112;
          v66 = v49;
          __int16 v67 = 2112;
          v68 = v12;
          __int16 v69 = 2112;
          v70 = v13;
          __int16 v71 = 2048;
          int64_t v72 = a5;
          _os_log_impl(&dword_223271000, v24, OS_LOG_TYPE_INFO, "%{public}@lastSyncedVersion %@  beginAnchor is %@  validity %@  key %@  count %tu", buf, 0x3Eu);
        }
        [(HMAssistantSyncHome *)v17 setDone:0];
        objc_initWeak(&location, v17);
        v26 = (void *)[objc_alloc(MEMORY[0x263F0E2B8]) initWithNoValidation];
        v27 = [(HMAssistantSyncHome *)v17 waitGroup];
        dispatch_group_enter(v27);

        v51[0] = MEMORY[0x263EF8330];
        v51[1] = 3221225472;
        v51[2] = sub_22327349C;
        v51[3] = &unk_2646A4BD0;
        objc_copyWeak(&v55, &location);
        v53 = v59;
        v54 = v57;
        id v52 = v48;
        [v26 requestSiriSyncDataWithValidity:v12 completion:v51];
        v28 = [(HMAssistantSyncHome *)v17 waitGroup];
        dispatch_time_t v29 = dispatch_time(0, 42000000000);
        intptr_t v30 = dispatch_group_wait(v28, v29);

        if (v30)
        {
          v31 = (void *)MEMORY[0x223CB1AD0]();
          HMFGetOSLogHandle();
          v32 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            v33 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v62 = v33;
            _os_log_impl(&dword_223271000, v32, OS_LOG_TYPE_INFO, "%{public}@Timed out waiting for homed", buf, 0xCu);
          }
        }
        v34 = [(HMAssistantSyncHome *)v17 queue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = sub_2232736E4;
        block[3] = &unk_2646A4BF8;
        block[4] = v17;
        dispatch_async(v34, block);

        objc_destroyWeak(&v55);
        objc_destroyWeak(&location);

        _Block_object_dispose(v57, 8);
        _Block_object_dispose(v59, 8);

        goto LABEL_26;
      }
      v42 = (void *)MEMORY[0x223CB1AD0]();
      v43 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        v45 = HMFGetLogIdentifier();
        getAssistantConfigurationSnapshot();
        v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v62 = v45;
        __int16 v63 = 2112;
        v64 = v49;
        __int16 v65 = 2112;
        v66 = v46;
        _os_log_impl(&dword_223271000, v43, OS_LOG_TYPE_INFO, "%{public}@lastSyncedSnapshot %@ at same as assistantConfigurationSnapshot %@ - skipping sync...", buf, 0x20u);
      }
    }
    else
    {
      if ([(HMAssistantSyncHome *)v17 shouldSyncForAnchor:v12])
      {
        getAssistantConfigurationSnapshot();
        v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v39 = (void *)MEMORY[0x223CB1AD0]();
        v40 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          v41 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v62 = v41;
          __int16 v63 = 2112;
          v64 = v12;
          __int16 v65 = 2112;
          v66 = v38;
          _os_log_impl(&dword_223271000, v40, OS_LOG_TYPE_INFO, "%{public}@lastSyncValidity '%@' different from assistantConfigurationSnapshot %@ - reset all data so that full sync attempted next time", buf, 0x20u);
        }
        [v48 resetWithValidity:v38];
      }
      v42 = (void *)MEMORY[0x223CB1AD0]();
      v43 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        v44 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v62 = v44;
        _os_log_impl(&dword_223271000, v43, OS_LOG_TYPE_INFO, "%{public}@No accessories configured - skipping sync request from Siri client...", buf, 0xCu);
      }
    }

LABEL_26:

    goto LABEL_27;
  }
  v35 = (void *)MEMORY[0x223CB1AD0]();
  v36 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    v37 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v62 = v37;
    __int16 v63 = 2112;
    v64 = v13;
    __int16 v65 = 2112;
    v66 = @"com.apple.homekit.name";
    _os_log_impl(&dword_223271000, v36, OS_LOG_TYPE_INFO, "%{public}@Incoming key '%@' does not match plug-in key '%@'", buf, 0x20u);
  }
LABEL_27:
}

- (id)currentSyncSnapshot
{
  id v2 = objc_alloc_init(MEMORY[0x263F286B0]);
  v3 = getAssistantConfigurationSnapshot();
  [v2 setAnchor:v3];

  return v2;
}

- (BOOL)shouldSyncForAnchor:(id)a3
{
  id v3 = a3;
  v4 = getAssistantConfigurationSnapshot();
  char v5 = [v3 isEqual:v4];

  return v5 ^ 1;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x223CB1AD0](self, a2);
  v4 = self;
  char v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    char v9 = v6;
    _os_log_impl(&dword_223271000, v5, OS_LOG_TYPE_INFO, "%{public}@Indicating syncDidEnd from dealloc", buf, 0xCu);
  }
  [(HMAssistantSyncHome *)v4 syncDidEnd];
  v7.receiver = v4;
  v7.super_class = (Class)HMAssistantSyncHome;
  [(HMAssistantSyncHome *)&v7 dealloc];
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = (void *)MEMORY[0x223CB1AD0]();
  id v6 = self;
  objc_super v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    mach_absolute_time();
    uint64_t v9 = UpTicksToMilliseconds();
    int v11 = 138543618;
    unint64_t v12 = v8;
    __int16 v13 = 2048;
    unint64_t v14 = v9 - [(HMAssistantSyncHome *)v6 fetchHomeConfigurationStartTime];
    _os_log_impl(&dword_223271000, v7, OS_LOG_TYPE_INFO, "%{public}@Home manager did update homes in %llu milliseconds", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v10 = [(HMAssistantSyncHome *)v6 waitGroup];
  dispatch_group_leave(v10);
}

- (HMAssistantSyncHome)init
{
  v9.receiver = self;
  v9.super_class = (Class)HMAssistantSyncHome;
  id v2 = [(HMAssistantSyncHome *)&v9 init];
  if (v2)
  {
    HMDispatchQueueNameString();
    id v3 = objc_claimAutoreleasedReturnValue();
    id v4 = (const char *)[v3 UTF8String];
    char v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(v4, v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    [MEMORY[0x263F42608] setDefaultValue:MEMORY[0x263EFFA88] forPreferenceKey:@"dropHomeNamesFromSyncData"];
  }
  return v2;
}

+ (id)logCategory
{
  if (qword_26ABFD978 != -1) {
    dispatch_once(&qword_26ABFD978, &unk_26D658620);
  }
  id v2 = (void *)qword_26ABFD980;

  return v2;
}

@end