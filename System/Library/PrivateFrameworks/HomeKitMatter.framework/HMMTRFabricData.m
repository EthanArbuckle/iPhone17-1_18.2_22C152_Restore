@interface HMMTRFabricData
+ (id)logCategory;
- (HMMTRFabric)fabric;
- (HMMTRFabricData)initWithFabric:(id)a3;
- (NSData)ipk;
- (NSData)rootCert;
- (NSNumber)residentNodeID;
- (id)attributeDescriptions;
- (id)logIdentifier;
- (void)setFabric:(id)a3;
- (void)setIpk:(id)a3;
- (void)setResidentNodeID:(id)a3;
- (void)setRootCert:(id)a3;
@end

@implementation HMMTRFabricData

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_fabric);
  objc_storeStrong((id *)&self->_ipk, 0);
  objc_storeStrong((id *)&self->_residentNodeID, 0);
  objc_storeStrong((id *)&self->_rootCert, 0);
}

- (void)setFabric:(id)a3
{
}

- (HMMTRFabric)fabric
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fabric);
  return (HMMTRFabric *)WeakRetained;
}

- (void)setIpk:(id)a3
{
}

- (NSData)ipk
{
  return self->_ipk;
}

- (void)setResidentNodeID:(id)a3
{
}

- (NSNumber)residentNodeID
{
  return self->_residentNodeID;
}

- (void)setRootCert:(id)a3
{
}

- (NSData)rootCert
{
  return self->_rootCert;
}

- (id)attributeDescriptions
{
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v5 = [(HMMTRFabricData *)self fabric];
  v6 = [v5 fabricID];
  v7 = (void *)[v4 initWithName:@"Fabric ID" value:v6];
  [v3 addObject:v7];

  id v8 = objc_alloc(MEMORY[0x263F424F8]);
  v9 = [(HMMTRFabricData *)self residentNodeID];
  v10 = (void *)[v8 initWithName:@"Resident Node ID" value:v9];
  [v3 addObject:v10];

  v11 = (void *)[v3 copy];
  return v11;
}

- (id)logIdentifier
{
  v2 = NSString;
  v3 = [(HMMTRFabricData *)self fabric];
  id v4 = [v3 fabricID];
  v5 = [v2 stringWithFormat:@"%@", v4];

  return v5;
}

- (HMMTRFabricData)initWithFabric:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMMTRFabricData;
  v5 = [(HMMTRFabricData *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_fabric, v4);
  }

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0 != -1) {
    dispatch_once(&logCategory__hmf_once_t0, &__block_literal_global);
  }
  v2 = (void *)logCategory__hmf_once_v1;
  return v2;
}

uint64_t __30__HMMTRFabricData_logCategory__block_invoke()
{
  logCategory__hmf_once_v1 = HMFCreateOSLogHandle();
  return MEMORY[0x270F9A758]();
}

@end