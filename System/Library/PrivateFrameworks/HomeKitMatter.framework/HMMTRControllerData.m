@interface HMMTRControllerData
+ (id)logCategory;
- (HMMTRControllerData)initWithFabric:(id)a3;
- (HMMTRDeviceControllerStorageDataSource)privateDataSource;
- (HMMTRFabric)fabric;
- (NSData)operationalCertificate;
- (NSNumber)nodeID;
- (id)attributeDescriptions;
- (id)logIdentifier;
- (void)setFabric:(id)a3;
- (void)setNodeID:(id)a3;
- (void)setOperationalCertificate:(id)a3;
@end

@implementation HMMTRControllerData

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_fabric);
  objc_storeStrong((id *)&self->_nodeID, 0);
  objc_storeStrong((id *)&self->_operationalCertificate, 0);
  objc_storeStrong((id *)&self->_privateDataSource, 0);
}

- (void)setFabric:(id)a3
{
}

- (HMMTRFabric)fabric
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fabric);
  return (HMMTRFabric *)WeakRetained;
}

- (void)setNodeID:(id)a3
{
}

- (NSNumber)nodeID
{
  return self->_nodeID;
}

- (NSData)operationalCertificate
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (id)attributeDescriptions
{
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v5 = [(HMMTRControllerData *)self nodeID];
  v6 = (void *)[v4 initWithName:@"Controller Node ID" value:v5];
  [v3 addObject:v6];

  v7 = (void *)[v3 copy];
  return v7;
}

- (id)logIdentifier
{
  v2 = NSString;
  v3 = [(HMMTRControllerData *)self nodeID];
  id v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (HMMTRDeviceControllerStorageDataSource)privateDataSource
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  privateDataSource = self->_privateDataSource;
  if (!privateDataSource)
  {
    v5 = [(HMMTRControllerData *)self fabric];
    v6 = [v5 delegate];
    v7 = [(HMMTRControllerData *)self nodeID];
    v8 = [v6 privateDataSourceForNode:v7];
    v9 = self->_privateDataSource;
    self->_privateDataSource = v8;

    privateDataSource = self->_privateDataSource;
  }
  v10 = privateDataSource;
  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (void)setOperationalCertificate:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    v6 = [MEMORY[0x263F10CC0] convertX509Certificate:v5];
    if (v6)
    {
      v7 = (void *)[objc_alloc(MEMORY[0x263F10CB8]) initWithTLVBytes:v6];
      v8 = v7;
      if (v7)
      {
        v9 = [v7 subject];
        v10 = [v9 nodeID];

        if (v10)
        {
          v11 = [v8 subject];
          v12 = [v11 nodeID];
          nodeID = self->_nodeID;
          self->_nodeID = v12;

          objc_storeStrong((id *)&self->_operationalCertificate, a3);
          os_unfair_lock_lock(&self->_lock);
          privateDataSource = self->_privateDataSource;
          self->_privateDataSource = 0;

          os_unfair_lock_unlock(&self->_lock);
        }
      }
    }
    else
    {
      v18 = (void *)MEMORY[0x2533B64D0]();
      v19 = self;
      v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = HMFGetLogIdentifier();
        int v22 = 138543362;
        v23 = v21;
        _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_ERROR, "%{public}@Couldn't convert NOC to Matter format", (uint8_t *)&v22, 0xCu);
      }
    }
  }
  else
  {
    v15 = self->_nodeID;
    self->_nodeID = 0;

    operationalCertificate = self->_operationalCertificate;
    self->_operationalCertificate = 0;

    os_unfair_lock_lock(&self->_lock);
    v17 = self->_privateDataSource;
    self->_privateDataSource = 0;

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (HMMTRControllerData)initWithFabric:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMMTRControllerData;
  id v5 = [(HMMTRControllerData *)&v9 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v5->_fabric, v4);
    privateDataSource = v6->_privateDataSource;
    v6->_privateDataSource = 0;
  }
  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1 != -1) {
    dispatch_once(&logCategory__hmf_once_t1, &__block_literal_global_1570);
  }
  v2 = (void *)logCategory__hmf_once_v2;
  return v2;
}

uint64_t __34__HMMTRControllerData_logCategory__block_invoke()
{
  logCategory__hmf_once_v2 = HMFCreateOSLogHandle();
  return MEMORY[0x270F9A758]();
}

@end