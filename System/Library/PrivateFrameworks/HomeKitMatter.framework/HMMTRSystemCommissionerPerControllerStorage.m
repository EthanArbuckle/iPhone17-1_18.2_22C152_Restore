@interface HMMTRSystemCommissionerPerControllerStorage
+ (id)logCategory;
- (BOOL)controller:(id)a3 removeValueForKey:(id)a4 securityLevel:(unint64_t)a5 sharingType:(unint64_t)a6;
- (BOOL)controller:(id)a3 storeValue:(id)a4 forKey:(id)a5 securityLevel:(unint64_t)a6 sharingType:(unint64_t)a7;
- (HMMTRSystemCommissionerPerControllerStorage)initWithQueue:(id)a3;
- (NSMutableDictionary)privateDataSource;
- (OS_dispatch_queue)queue;
- (id)attributeDescriptions;
- (id)controller:(id)a3 valueForKey:(id)a4 securityLevel:(unint64_t)a5 sharingType:(unint64_t)a6;
- (id)logIdentifier;
- (void)setPrivateDataSource:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation HMMTRSystemCommissionerPerControllerStorage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateDataSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setPrivateDataSource:(id)a3
{
}

- (NSMutableDictionary)privateDataSource
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

- (id)attributeDescriptions
{
  v2 = [MEMORY[0x263EFF980] array];
  v3 = (void *)[v2 copy];

  return v3;
}

- (id)logIdentifier
{
  return 0;
}

- (id)controller:(id)a3 valueForKey:(id)a4 securityLevel:(unint64_t)a5 sharingType:(unint64_t)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = [(HMMTRSystemCommissionerPerControllerStorage *)self privateDataSource];
  v11 = [v10 objectForKeyedSubscript:v9];

  if (v11)
  {
    v12 = (void *)MEMORY[0x263F08928];
    v13 = MTRDeviceControllerStorageClasses();
    id v21 = 0;
    v14 = [v12 unarchivedObjectOfClasses:v13 fromData:v11 error:&v21];
    id v15 = v21;

    if (!v14)
    {
      v16 = (void *)MEMORY[0x2533B64D0]();
      v17 = self;
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v23 = v19;
        __int16 v24 = 2112;
        id v25 = v9;
        __int16 v26 = 2112;
        id v27 = v15;
        _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive value for key %@ with error %@", buf, 0x20u);
      }
    }
  }
  return 0;
}

- (BOOL)controller:(id)a3 storeValue:(id)a4 forKey:(id)a5 securityLevel:(unint64_t)a6 sharingType:(unint64_t)a7
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v21 = 0;
  v13 = [MEMORY[0x263F08910] archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v21];
  id v14 = v21;
  if (v13)
  {
    id v15 = [(HMMTRSystemCommissionerPerControllerStorage *)self privateDataSource];
    [v15 setObject:v13 forKeyedSubscript:v12];
  }
  else
  {
    v16 = (void *)MEMORY[0x2533B64D0]();
    v17 = self;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v23 = v19;
      __int16 v24 = 2112;
      id v25 = v12;
      __int16 v26 = 2112;
      id v27 = v14;
      _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to archive requested value for key %@ with error %@", buf, 0x20u);
    }
  }

  return v13 != 0;
}

- (BOOL)controller:(id)a3 removeValueForKey:(id)a4 securityLevel:(unint64_t)a5 sharingType:(unint64_t)a6
{
  id v7 = a4;
  id v8 = [(HMMTRSystemCommissionerPerControllerStorage *)self privateDataSource];
  [v8 removeObjectForKey:v7];

  return 1;
}

- (HMMTRSystemCommissionerPerControllerStorage)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMMTRSystemCommissionerPerControllerStorage;
  v6 = [(HMMTRSystemCommissionerPerControllerStorage *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_4576 != -1) {
    dispatch_once(&logCategory__hmf_once_t2_4576, &__block_literal_global_4577);
  }
  v2 = (void *)logCategory__hmf_once_v3_4578;
  return v2;
}

uint64_t __58__HMMTRSystemCommissionerPerControllerStorage_logCategory__block_invoke()
{
  logCategory__hmf_once_v3_4578 = HMFCreateOSLogHandle();
  return MEMORY[0x270F9A758]();
}

@end