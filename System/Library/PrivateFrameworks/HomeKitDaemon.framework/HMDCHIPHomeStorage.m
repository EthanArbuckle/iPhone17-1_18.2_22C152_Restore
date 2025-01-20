@interface HMDCHIPHomeStorage
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)isEqual:(id)a3;
- (BOOL)updateUsingHomeModel:(id)a3;
- (HMDCHIPHomeStorage)initWithCoder:(id)a3;
- (NSData)intermediateCertificate;
- (NSData)operationalCertificate;
- (NSData)rootCertificate;
- (NSDictionary)debugDictionaryRepresentation;
- (NSDictionary)keyValueStore;
- (NSNumber)fabricID;
- (NSNumber)lastNodeID;
- (id)attributeDescriptions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)logIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setFabricID:(id)a3;
- (void)setIntermediateCertificate:(id)a3;
- (void)setKeyValueStore:(id)a3;
- (void)setLastNodeID:(id)a3;
- (void)setOperationalCertificate:(id)a3;
- (void)setRootCertificate:(id)a3;
- (void)updateHomeModel:(id)a3;
@end

@implementation HMDCHIPHomeStorage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValueStore, 0);
  objc_storeStrong((id *)&self->_intermediateCertificate, 0);
  objc_storeStrong((id *)&self->_operationalCertificate, 0);
  objc_storeStrong((id *)&self->_rootCertificate, 0);
  objc_storeStrong((id *)&self->_lastNodeID, 0);
  objc_storeStrong((id *)&self->_fabricID, 0);
}

- (void)setKeyValueStore:(id)a3
{
}

- (NSDictionary)keyValueStore
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIntermediateCertificate:(id)a3
{
}

- (NSData)intermediateCertificate
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOperationalCertificate:(id)a3
{
}

- (NSData)operationalCertificate
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRootCertificate:(id)a3
{
}

- (NSData)rootCertificate
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLastNodeID:(id)a3
{
}

- (NSNumber)lastNodeID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFabricID:(id)a3
{
}

- (NSNumber)fabricID
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [(HMDCHIPHomeStorage *)self fabricID];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F424F8]);
    v6 = [(HMDCHIPHomeStorage *)self fabricID];
    v7 = (void *)[v5 initWithName:@"Fabric ID" value:v6];
    [v3 addObject:v7];
  }
  v8 = [(HMDCHIPHomeStorage *)self lastNodeID];

  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x263F424F8]);
    v10 = [(HMDCHIPHomeStorage *)self lastNodeID];
    v11 = (void *)[v9 initWithName:@"Last Node ID" value:v10];
    [v3 addObject:v11];
  }
  v12 = [(HMDCHIPHomeStorage *)self rootCertificate];

  if (v12)
  {
    id v13 = objc_alloc(MEMORY[0x263F424F8]);
    v14 = [(HMDCHIPHomeStorage *)self rootCertificate];
    v15 = (void *)[v13 initWithName:@"Root Certificate" value:v14];
    [v3 addObject:v15];
  }
  v16 = [(HMDCHIPHomeStorage *)self operationalCertificate];

  if (v16)
  {
    id v17 = objc_alloc(MEMORY[0x263F424F8]);
    v18 = [(HMDCHIPHomeStorage *)self operationalCertificate];
    v19 = (void *)[v17 initWithName:@"Operational Certificate" value:v18];
    [v3 addObject:v19];
  }
  v20 = [(HMDCHIPHomeStorage *)self intermediateCertificate];

  if (v20)
  {
    id v21 = objc_alloc(MEMORY[0x263F424F8]);
    v22 = [(HMDCHIPHomeStorage *)self intermediateCertificate];
    v23 = (void *)[v21 initWithName:@"Intermediate Certificate" value:v22];
    [v3 addObject:v23];
  }
  v24 = [(HMDCHIPHomeStorage *)self keyValueStore];
  uint64_t v25 = [v24 count];

  if (v25)
  {
    id v26 = objc_alloc(MEMORY[0x263F424F8]);
    v27 = NSNumber;
    v28 = [(HMDCHIPHomeStorage *)self keyValueStore];
    v29 = objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "count"));
    v30 = (void *)[v26 initWithName:@"Key-Value Store Count" value:v29];
    [v3 addObject:v30];
  }
  v31 = (void *)[v3 copy];

  return v31;
}

- (id)logIdentifier
{
  v2 = NSString;
  v3 = [(HMDCHIPHomeStorage *)self fabricID];
  v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  if ((objc_msgSend(v11, "hmd_isForLocalStore") & 1) != 0
    || objc_msgSend(v11, "hmd_isForRemoteTransportOnSameAccount"))
  {
    v4 = [(HMDCHIPHomeStorage *)self fabricID];
    [v11 encodeObject:v4 forKey:@"HMCFS.fabricID"];

    id v5 = [(HMDCHIPHomeStorage *)self fabricID];
    [v11 encodeObject:v5 forKey:@"HMCFS.fabricIndex"];

    v6 = [(HMDCHIPHomeStorage *)self lastNodeID];
    [v11 encodeObject:v6 forKey:@"HMCFS.lastNodeID"];

    v7 = [(HMDCHIPHomeStorage *)self rootCertificate];
    [v11 encodeObject:v7 forKey:@"HMCFS.rootCertificate"];

    v8 = [(HMDCHIPHomeStorage *)self operationalCertificate];
    [v11 encodeObject:v8 forKey:@"HMCFS.operationalCertificate"];

    id v9 = [(HMDCHIPHomeStorage *)self keyValueStore];
    [v11 encodeObject:v9 forKey:@"HMCFS.keyValueStore"];

    if (objc_msgSend(v11, "hmd_isForLocalStore"))
    {
      v10 = [(HMDCHIPHomeStorage *)self intermediateCertificate];
      [v11 encodeObject:v10 forKey:@"HMCFS.intermediateCertificate"];
    }
  }
}

- (HMDCHIPHomeStorage)initWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCHIPHomeStorage *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCFS.fabricID"];
  [(HMDCHIPHomeStorage *)v5 setFabricID:v6];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCFS.lastNodeID"];
  [(HMDCHIPHomeStorage *)v5 setLastNodeID:v7];

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCFS.rootCertificate"];
  [(HMDCHIPHomeStorage *)v5 setRootCertificate:v8];

  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCFS.operationalCertificate"];
  [(HMDCHIPHomeStorage *)v5 setOperationalCertificate:v9];

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCFS.intermediateCertificate"];
  [(HMDCHIPHomeStorage *)v5 setIntermediateCertificate:v10];

  id v11 = (void *)MEMORY[0x263EFFA08];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:3];
  id v13 = objc_msgSend(v11, "setWithArray:", v12, v16, v17);
  v14 = [v4 decodeObjectOfClasses:v13 forKey:@"HMCFS.keyValueStore"];

  [(HMDCHIPHomeStorage *)v5 setKeyValueStore:v14];
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[HMDCHIPHomeStorage allocWithZone:a3] init];
  id v5 = [(HMDCHIPHomeStorage *)self fabricID];
  [(HMDCHIPHomeStorage *)v4 setFabricID:v5];

  v6 = [(HMDCHIPHomeStorage *)self lastNodeID];
  [(HMDCHIPHomeStorage *)v4 setLastNodeID:v6];

  v7 = [(HMDCHIPHomeStorage *)self rootCertificate];
  [(HMDCHIPHomeStorage *)v4 setRootCertificate:v7];

  v8 = [(HMDCHIPHomeStorage *)self operationalCertificate];
  [(HMDCHIPHomeStorage *)v4 setOperationalCertificate:v8];

  id v9 = [(HMDCHIPHomeStorage *)self intermediateCertificate];
  [(HMDCHIPHomeStorage *)v4 setIntermediateCertificate:v9];

  v10 = [(HMDCHIPHomeStorage *)self keyValueStore];
  [(HMDCHIPHomeStorage *)v4 setKeyValueStore:v10];

  return v4;
}

- (unint64_t)hash
{
  v3 = [(HMDCHIPHomeStorage *)self fabricID];
  uint64_t v4 = [v3 hash];

  id v5 = [(HMDCHIPHomeStorage *)self lastNodeID];
  uint64_t v6 = [v5 hash] ^ v4;

  v7 = [(HMDCHIPHomeStorage *)self rootCertificate];
  uint64_t v8 = [v7 hash];

  id v9 = [(HMDCHIPHomeStorage *)self operationalCertificate];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];

  id v11 = [(HMDCHIPHomeStorage *)self intermediateCertificate];
  uint64_t v12 = [v11 hash];

  id v13 = [(HMDCHIPHomeStorage *)self keyValueStore];
  unint64_t v14 = v10 ^ v12 ^ [v13 hash];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  if (!v6) {
    goto LABEL_11;
  }
  v7 = [(HMDCHIPHomeStorage *)self fabricID];
  uint64_t v8 = [v6 fabricID];
  int v9 = HMFEqualObjects();

  if (!v9) {
    goto LABEL_11;
  }
  uint64_t v10 = [(HMDCHIPHomeStorage *)self lastNodeID];
  id v11 = [v6 lastNodeID];
  int v12 = HMFEqualObjects();

  if (!v12) {
    goto LABEL_11;
  }
  id v13 = [(HMDCHIPHomeStorage *)self rootCertificate];
  unint64_t v14 = [v6 rootCertificate];
  int v15 = HMFEqualObjects();

  if (!v15) {
    goto LABEL_11;
  }
  uint64_t v16 = [(HMDCHIPHomeStorage *)self operationalCertificate];
  uint64_t v17 = [v6 operationalCertificate];
  int v18 = HMFEqualObjects();

  if (!v18) {
    goto LABEL_11;
  }
  uint64_t v19 = [(HMDCHIPHomeStorage *)self intermediateCertificate];
  v20 = [v6 intermediateCertificate];
  int v21 = HMFEqualObjects();

  if (v21)
  {
    v22 = [(HMDCHIPHomeStorage *)self keyValueStore];
    v23 = [v6 keyValueStore];
    char v24 = HMFEqualObjects();
  }
  else
  {
LABEL_11:
    char v24 = 0;
  }

  return v24;
}

- (void)updateHomeModel:(id)a3
{
  id v11 = a3;
  id v4 = [(HMDCHIPHomeStorage *)self fabricID];
  if (v4) {
    [v11 setChipFabricID:v4];
  }
  id v5 = [(HMDCHIPHomeStorage *)self fabricID];
  if (v5) {
    [v11 setChipFabricIndex:v5];
  }
  id v6 = [(HMDCHIPHomeStorage *)self lastNodeID];
  if (v6) {
    [v11 setChipLastNodeID:v6];
  }
  v7 = [(HMDCHIPHomeStorage *)self rootCertificate];
  if (v7) {
    [v11 setChipRootCertificate:v7];
  }
  uint64_t v8 = [(HMDCHIPHomeStorage *)self operationalCertificate];
  if (v8) {
    [v11 setChipOperationalCertificate:v8];
  }
  int v9 = [(HMDCHIPHomeStorage *)self intermediateCertificate];
  if (v9) {
    [v11 setChipIntermediateCertificate:v9];
  }
  uint64_t v10 = [(HMDCHIPHomeStorage *)self keyValueStore];
  if (v10) {
    [v11 setChipKeyValueStore:v10];
  }
}

- (BOOL)updateUsingHomeModel:(id)a3
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 setProperties];
  if (![v5 containsObject:@"chipFabricID"])
  {

    goto LABEL_7;
  }
  id v6 = [(HMDCHIPHomeStorage *)self fabricID];
  v7 = [v4 chipFabricID];
  char v8 = HMFEqualObjects();

  if (v8)
  {
LABEL_7:
    BOOL v16 = 0;
    goto LABEL_8;
  }
  int v9 = (void *)MEMORY[0x230FBD990]();
  uint64_t v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = HMFGetLogIdentifier();
    id v13 = [(HMDCHIPHomeStorage *)v10 fabricID];
    unint64_t v14 = [v4 chipFabricID];
    int v66 = 138543874;
    v67 = v12;
    __int16 v68 = 2112;
    v69 = v13;
    __int16 v70 = 2112;
    v71 = v14;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating storage fabric ID from %@ to %@", (uint8_t *)&v66, 0x20u);
  }
  int v15 = [v4 chipFabricID];
  [(HMDCHIPHomeStorage *)v10 setFabricID:v15];

  BOOL v16 = 1;
LABEL_8:
  uint64_t v17 = [v4 setProperties];
  if ([v17 containsObject:@"chipLastNodeID"])
  {
    int v18 = [(HMDCHIPHomeStorage *)self lastNodeID];
    uint64_t v19 = [v4 chipLastNodeID];
    char v20 = HMFEqualObjects();

    if (v20) {
      goto LABEL_14;
    }
    int v21 = (void *)MEMORY[0x230FBD990]();
    v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      char v24 = HMFGetLogIdentifier();
      uint64_t v25 = [(HMDCHIPHomeStorage *)v22 lastNodeID];
      id v26 = [v4 chipLastNodeID];
      int v66 = 138543874;
      v67 = v24;
      __int16 v68 = 2112;
      v69 = v25;
      __int16 v70 = 2112;
      v71 = v26;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Updating storage last node ID from %@ to %@", (uint8_t *)&v66, 0x20u);
    }
    uint64_t v17 = [v4 chipLastNodeID];
    [(HMDCHIPHomeStorage *)v22 setLastNodeID:v17];
    BOOL v16 = 1;
  }

LABEL_14:
  v27 = [v4 setProperties];
  if ([v27 containsObject:@"chipRootCertificate"])
  {
    v28 = [(HMDCHIPHomeStorage *)self rootCertificate];
    v29 = [v4 chipRootCertificate];
    char v30 = HMFEqualObjects();

    if (v30) {
      goto LABEL_20;
    }
    v31 = (void *)MEMORY[0x230FBD990]();
    v32 = self;
    v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      v34 = HMFGetLogIdentifier();
      v35 = [(HMDCHIPHomeStorage *)v32 rootCertificate];
      v36 = [v4 chipRootCertificate];
      int v66 = 138543874;
      v67 = v34;
      __int16 v68 = 2112;
      v69 = v35;
      __int16 v70 = 2112;
      v71 = v36;
      _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_INFO, "%{public}@Updating storage root certificate from %@ to %@", (uint8_t *)&v66, 0x20u);
    }
    v27 = [v4 chipRootCertificate];
    [(HMDCHIPHomeStorage *)v32 setRootCertificate:v27];
    BOOL v16 = 1;
  }

LABEL_20:
  v37 = [v4 setProperties];
  if ([v37 containsObject:@"chipOperationalCertificate"])
  {
    v38 = [(HMDCHIPHomeStorage *)self operationalCertificate];
    v39 = [v4 chipOperationalCertificate];
    char v40 = HMFEqualObjects();

    if (v40) {
      goto LABEL_26;
    }
    v41 = (void *)MEMORY[0x230FBD990]();
    v42 = self;
    v43 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      v44 = HMFGetLogIdentifier();
      v45 = [(HMDCHIPHomeStorage *)v42 operationalCertificate];
      v46 = [v4 chipOperationalCertificate];
      int v66 = 138543874;
      v67 = v44;
      __int16 v68 = 2112;
      v69 = v45;
      __int16 v70 = 2112;
      v71 = v46;
      _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_INFO, "%{public}@Updating storage operational certificate from %@ to %@", (uint8_t *)&v66, 0x20u);
    }
    v37 = [v4 chipOperationalCertificate];
    [(HMDCHIPHomeStorage *)v42 setOperationalCertificate:v37];
    BOOL v16 = 1;
  }

LABEL_26:
  v47 = [v4 setProperties];
  if ([v47 containsObject:@"chipIntermediateCertificate"])
  {
    v48 = [(HMDCHIPHomeStorage *)self intermediateCertificate];
    v49 = [v4 chipIntermediateCertificate];
    char v50 = HMFEqualObjects();

    if (v50) {
      goto LABEL_32;
    }
    v51 = (void *)MEMORY[0x230FBD990]();
    v52 = self;
    v53 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      v54 = HMFGetLogIdentifier();
      v55 = [(HMDCHIPHomeStorage *)v52 intermediateCertificate];
      v56 = [v4 chipIntermediateCertificate];
      int v66 = 138543874;
      v67 = v54;
      __int16 v68 = 2112;
      v69 = v55;
      __int16 v70 = 2112;
      v71 = v56;
      _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_INFO, "%{public}@Updating storage intermediate certificate from %@ to %@", (uint8_t *)&v66, 0x20u);
    }
    v47 = [v4 chipIntermediateCertificate];
    [(HMDCHIPHomeStorage *)v52 setIntermediateCertificate:v47];
    BOOL v16 = 1;
  }

LABEL_32:
  v57 = [v4 setProperties];
  if (![v57 containsObject:@"chipKeyValueStore"])
  {
LABEL_37:

    goto LABEL_38;
  }
  v58 = [(HMDCHIPHomeStorage *)self keyValueStore];
  v59 = [v4 chipKeyValueStore];
  char v60 = HMFEqualObjects();

  if ((v60 & 1) == 0)
  {
    v61 = (void *)MEMORY[0x230FBD990]();
    v62 = self;
    v63 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
    {
      v64 = HMFGetLogIdentifier();
      int v66 = 138543362;
      v67 = v64;
      _os_log_impl(&dword_22F52A000, v63, OS_LOG_TYPE_INFO, "%{public}@Updating storage key-value store", (uint8_t *)&v66, 0xCu);
    }
    v57 = [v4 chipKeyValueStore];
    [(HMDCHIPHomeStorage *)v62 setKeyValueStore:v57];
    BOOL v16 = 1;
    goto LABEL_37;
  }
LABEL_38:

  return v16;
}

- (NSDictionary)debugDictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(HMDCHIPHomeStorage *)self fabricID];
  [v3 setObject:v4 forKeyedSubscript:@"Fabric ID"];

  id v5 = [(HMDCHIPHomeStorage *)self lastNodeID];
  [v3 setObject:v5 forKeyedSubscript:@"Last Node ID"];

  id v6 = [(HMDCHIPHomeStorage *)self rootCertificate];
  [v3 setObject:v6 forKeyedSubscript:@"Root Certificate"];

  v7 = [(HMDCHIPHomeStorage *)self operationalCertificate];
  [v3 setObject:v7 forKeyedSubscript:@"Operational Certificate"];

  char v8 = [(HMDCHIPHomeStorage *)self intermediateCertificate];
  [v3 setObject:v8 forKeyedSubscript:@"Intermediate Certificate"];

  int v9 = [(HMDCHIPHomeStorage *)self keyValueStore];
  [v3 setObject:v9 forKeyedSubscript:@"Key-Value Store"];

  uint64_t v10 = (void *)[v3 copy];
  return (NSDictionary *)v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_76123 != -1) {
    dispatch_once(&logCategory__hmf_once_t7_76123, &__block_literal_global_76124);
  }
  v2 = (void *)logCategory__hmf_once_v8_76125;
  return v2;
}

void __33__HMDCHIPHomeStorage_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v8_76125;
  logCategory__hmf_once_v8_76125 = v0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end