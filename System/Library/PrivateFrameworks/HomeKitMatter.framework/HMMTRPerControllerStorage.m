@interface HMMTRPerControllerStorage
+ (id)logCategory;
- (BOOL)controller:(id)a3 removeValueForKey:(id)a4 securityLevel:(unint64_t)a5 sharingType:(unint64_t)a6;
- (BOOL)controller:(id)a3 storeValue:(id)a4 forKey:(id)a5 securityLevel:(unint64_t)a6 sharingType:(unint64_t)a7;
- (BOOL)controller:(id)a3 storeValues:(id)a4 securityLevel:(unint64_t)a5 sharingType:(unint64_t)a6;
- (HMMTRDeviceControllerStorageDataSource)privateDataSource;
- (HMMTRFabric)fabric;
- (HMMTRPerControllerStorage)initWithQueue:(id)a3 fabric:(id)a4;
- (OS_dispatch_queue)queue;
- (id)attributeDescriptions;
- (id)controller:(id)a3 valueForKey:(id)a4 securityLevel:(unint64_t)a5 sharingType:(unint64_t)a6;
- (id)logIdentifier;
- (id)valuesForController:(id)a3 securityLevel:(unint64_t)a4 sharingType:(unint64_t)a5;
- (void)setFabric:(id)a3;
- (void)setPrivateDataSource:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation HMMTRPerControllerStorage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateDataSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_fabric);
}

- (void)setPrivateDataSource:(id)a3
{
}

- (HMMTRDeviceControllerStorageDataSource)privateDataSource
{
  return self->_privateDataSource;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setFabric:(id)a3
{
}

- (HMMTRFabric)fabric
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fabric);
  return (HMMTRFabric *)WeakRetained;
}

- (id)attributeDescriptions
{
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v5 = [(HMMTRPerControllerStorage *)self fabric];
  v6 = [v5 fabricID];
  v7 = (void *)[v4 initWithName:@"FabricID" value:v6];
  [v3 addObject:v7];

  v8 = (void *)[v3 copy];
  return v8;
}

- (id)logIdentifier
{
  v2 = NSString;
  v3 = [(HMMTRPerControllerStorage *)self fabric];
  id v4 = [v3 fabricID];
  v5 = [v2 stringWithFormat:@"%@", v4];

  return v5;
}

- (BOOL)controller:(id)a3 storeValues:(id)a4 securityLevel:(unint64_t)a5 sharingType:(unint64_t)a6
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v29 = a3;
  id v7 = a4;
  context = (void *)MEMORY[0x2533B64D0]();
  v32 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v8 = [v7 allKeys];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v38;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v38 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        v13 = [v7 objectForKeyedSubscript:v12];
        id v36 = 0;
        v14 = [MEMORY[0x263F08910] archivedDataWithRootObject:v13 requiringSecureCoding:1 error:&v36];
        id v15 = v36;
        if (!v14)
        {
          v24 = (void *)MEMORY[0x2533B64D0]();
          v25 = self;
          v26 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v27 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            *(void *)&buf[4] = v27;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v12;
            *(_WORD *)&buf[22] = 2112;
            id v42 = v15;
            _os_log_impl(&dword_252495000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to archive requested value for key %@ with error %@", buf, 0x20u);
          }

          BOOL v23 = 0;
          goto LABEL_15;
        }
        [v32 setObject:v14 forKeyedSubscript:v12];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v43 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  v16 = (void *)MEMORY[0x2533B64D0]();
  v17 = self;
  v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = HMFGetLogIdentifier();
    v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v32, "count"));
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v19;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v20;
    _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_INFO, "%{public}@Updating %@ key-value pairs in local storage", buf, 0x16u);
  }
  v21 = dispatch_group_create();
  dispatch_group_enter(v21);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v42) = 0;
  v22 = [(HMMTRPerControllerStorage *)v17 privateDataSource];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __78__HMMTRPerControllerStorage_controller_storeValues_securityLevel_sharingType___block_invoke;
  v33[3] = &unk_2653786B0;
  v35 = buf;
  v8 = v21;
  v34 = v8;
  [v22 setKeyValuePairs:v32 completion:v33];

  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  BOOL v23 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
LABEL_15:

  return v23;
}

void __78__HMMTRPerControllerStorage_controller_storeValues_securityLevel_sharingType___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 == 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)valuesForController:(id)a3 securityLevel:(unint64_t)a4 sharingType:(unint64_t)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v32 = a3;
  context = (void *)MEMORY[0x2533B64D0]();
  v34 = self;
  v6 = [(HMMTRPerControllerStorage *)self privateDataSource];
  id v7 = [v6 allKeyValuePairs];

  long long v37 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = [v7 allKeys];
  uint64_t v8 = [obj countByEnumeratingWithState:&v39 objects:v49 count:16];
  v33 = v7;
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v40;
    unint64_t v11 = 0x263F08000uLL;
    do
    {
      uint64_t v12 = 0;
      uint64_t v35 = v9;
      do
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v39 + 1) + 8 * v12);
        v14 = [v7 objectForKeyedSubscript:v13];
        id v15 = *(void **)(v11 + 2344);
        v16 = MTRDeviceControllerStorageClasses();
        id v38 = 0;
        v17 = [v15 unarchivedObjectOfClasses:v16 fromData:v14 error:&v38];
        id v18 = v38;

        if (v17)
        {
          [v37 setObject:v17 forKeyedSubscript:v13];
        }
        else
        {
          uint64_t v19 = v10;
          v20 = (void *)MEMORY[0x2533B64D0]();
          v21 = v34;
          v22 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            BOOL v23 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            uint64_t v44 = v23;
            __int16 v45 = 2112;
            v46 = v13;
            __int16 v47 = 2112;
            id v48 = v18;
            _os_log_impl(&dword_252495000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive value for key %@ with error %@", buf, 0x20u);

            id v7 = v33;
          }

          uint64_t v10 = v19;
          unint64_t v11 = 0x263F08000;
          uint64_t v9 = v35;
        }

        ++v12;
      }
      while (v9 != v12);
      uint64_t v9 = [obj countByEnumeratingWithState:&v39 objects:v49 count:16];
    }
    while (v9);
  }

  v24 = (void *)MEMORY[0x2533B64D0]();
  v25 = v34;
  v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = HMFGetLogIdentifier();
    v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v37, "count"));
    *(_DWORD *)buf = 138543618;
    uint64_t v44 = v27;
    __int16 v45 = 2112;
    v46 = v28;
    _os_log_impl(&dword_252495000, v26, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched %@ key-value pairs from local storage", buf, 0x16u);

    id v7 = v33;
  }

  id v29 = (void *)[v37 copy];

  return v29;
}

- (id)controller:(id)a3 valueForKey:(id)a4 securityLevel:(unint64_t)a5 sharingType:(unint64_t)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(HMMTRPerControllerStorage *)self privateDataSource];
  unint64_t v11 = [v10 valueForKey:v9];

  if (v11)
  {
    uint64_t v12 = (void *)MEMORY[0x263F08928];
    v13 = MTRDeviceControllerStorageClasses();
    id v21 = 0;
    v14 = [v12 unarchivedObjectOfClasses:v13 fromData:v11 error:&v21];
    id v15 = v21;

    if (!v14)
    {
      v16 = (void *)MEMORY[0x2533B64D0]();
      v17 = self;
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        BOOL v23 = v19;
        __int16 v24 = 2112;
        id v25 = v9;
        __int16 v26 = 2112;
        id v27 = v15;
        _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive value for key %@ with error %@", buf, 0x20u);
      }
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)controller:(id)a3 storeValue:(id)a4 forKey:(id)a5 securityLevel:(unint64_t)a6 sharingType:(unint64_t)a7
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v27 = 0;
  v13 = [MEMORY[0x263F08910] archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v27];
  id v14 = v27;
  if (v13)
  {
    id v15 = dispatch_group_create();
    dispatch_group_enter(v15);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v29) = 0;
    v16 = [(HMMTRPerControllerStorage *)self privateDataSource];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __84__HMMTRPerControllerStorage_controller_storeValue_forKey_securityLevel_sharingType___block_invoke;
    v24[3] = &unk_2653786B0;
    __int16 v26 = buf;
    v17 = v15;
    id v25 = v17;
    [v16 setValue:v13 forKey:v12 completion:v24];

    dispatch_group_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
    BOOL v18 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x2533B64D0]();
    v20 = self;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v22;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2112;
      id v29 = v14;
      _os_log_impl(&dword_252495000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to archive requested value for key %@ with error %@", buf, 0x20u);
    }
    BOOL v18 = 0;
  }

  return v18;
}

void __84__HMMTRPerControllerStorage_controller_storeValue_forKey_securityLevel_sharingType___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 == 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (BOOL)controller:(id)a3 removeValueForKey:(id)a4 securityLevel:(unint64_t)a5 sharingType:(unint64_t)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  uint64_t v17 = 0;
  BOOL v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  id v11 = [(HMMTRPerControllerStorage *)self privateDataSource];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __84__HMMTRPerControllerStorage_controller_removeValueForKey_securityLevel_sharingType___block_invoke;
  v14[3] = &unk_2653786B0;
  v16 = &v17;
  id v12 = v10;
  id v15 = v12;
  [v11 removeValueForKey:v9 completion:v14];

  dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v11) = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)v11;
}

void __84__HMMTRPerControllerStorage_controller_removeValueForKey_securityLevel_sharingType___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 == 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (HMMTRPerControllerStorage)initWithQueue:(id)a3 fabric:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMMTRPerControllerStorage;
  id v9 = [(HMMTRPerControllerStorage *)&v16 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_fabric, v8);
    objc_storeStrong((id *)&v10->_queue, a3);
    id WeakRetained = objc_loadWeakRetained((id *)&v10->_fabric);
    id v12 = [WeakRetained currentDeviceNodeData];
    uint64_t v13 = [v12 privateDataSource];
    privateDataSource = v10->_privateDataSource;
    v10->_privateDataSource = (HMMTRDeviceControllerStorageDataSource *)v13;
  }
  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_1652 != -1) {
    dispatch_once(&logCategory__hmf_once_t6_1652, &__block_literal_global_1653);
  }
  v2 = (void *)logCategory__hmf_once_v7_1654;
  return v2;
}

uint64_t __40__HMMTRPerControllerStorage_logCategory__block_invoke()
{
  logCategory__hmf_once_v7_1654 = HMFCreateOSLogHandle();
  return MEMORY[0x270F9A758]();
}

@end