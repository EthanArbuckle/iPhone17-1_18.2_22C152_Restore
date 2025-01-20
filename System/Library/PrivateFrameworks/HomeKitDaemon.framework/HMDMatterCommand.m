@interface HMDMatterCommand
+ (id)logCategory;
- (BOOL)isAssociatedWithAccessory:(id)a3;
- (BOOL)isCommandForMatterPath:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (HMDAccessory)accessory;
- (HMDHome)home;
- (HMDMatterCommand)init;
- (HMDMatterCommand)initWithDictionary:(id)a3 home:(id)a4;
- (HMDMatterCommand)initWithUUID:(id)a3 matterPath:(id)a4 commandFields:(id)a5 expectedValues:(id)a6 home:(id)a7;
- (HMDMatterCommand)new;
- (HMDMatterPath)matterPath;
- (NSArray)expectedValues;
- (NSDictionary)commandFields;
- (id)associatedAccessories;
- (id)attributeDescriptions;
- (id)dictionaryRepresentationWithEncodedValues:(BOOL)a3;
- (void)addMatterPathToTransactionIfNotStored:(id)a3;
- (void)setCommandFields:(id)a3;
- (void)setExpectedValues:(id)a3;
@end

@implementation HMDMatterCommand

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_matterPath, 0);
  objc_storeStrong((id *)&self->_expectedValues, 0);
  objc_storeStrong((id *)&self->_commandFields, 0);
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (HMDMatterPath)matterPath
{
  return self->_matterPath;
}

- (void)setExpectedValues:(id)a3
{
}

- (NSArray)expectedValues
{
  return self->_expectedValues;
}

- (void)setCommandFields:(id)a3
{
}

- (NSDictionary)commandFields
{
  return self->_commandFields;
}

- (id)attributeDescriptions
{
  v27[6] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v26 = [(HMDMatterCommand *)self accessory];
  v25 = [v26 uuid];
  v24 = (void *)[v3 initWithName:@"accessory UUID" value:v25];
  v27[0] = v24;
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v23 = [(HMDMatterCommand *)self matterPath];
  v22 = [v23 endpointID];
  v21 = (void *)[v4 initWithName:@"endpoint" value:v22];
  v27[1] = v21;
  id v5 = objc_alloc(MEMORY[0x263F424F8]);
  v20 = [(HMDMatterCommand *)self matterPath];
  v6 = [v20 clusterID];
  v7 = (void *)[v5 initWithName:@"cluster" value:v6];
  v27[2] = v7;
  id v8 = objc_alloc(MEMORY[0x263F424F8]);
  v9 = [(HMDMatterCommand *)self matterPath];
  v10 = [v9 commandID];
  v11 = (void *)[v8 initWithName:@"command" value:v10];
  v27[3] = v11;
  id v12 = objc_alloc(MEMORY[0x263F424F8]);
  v13 = [(HMDMatterCommand *)self commandFields];
  v14 = (void *)[v12 initWithName:@"commandFields" value:v13];
  v27[4] = v14;
  id v15 = objc_alloc(MEMORY[0x263F424F8]);
  v16 = [(HMDMatterCommand *)self expectedValues];
  v17 = (void *)[v15 initWithName:@"expectedValues" value:v16];
  v27[5] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:6];

  return v18;
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
  if (v6)
  {
    v7 = [(HMDMatterCommand *)self matterPath];
    id v8 = [v6 matterPath];
    if (![v7 isEqual:v8]) {
      goto LABEL_9;
    }
    v9 = [(HMDMatterCommand *)self commandFields];
    v10 = [v6 commandFields];
    int v11 = HMFEqualObjects();

    if (!v11) {
      goto LABEL_9;
    }
    id v12 = [(HMDMatterCommand *)self expectedValues];
    v13 = [v6 expectedValues];
    int v14 = HMFEqualObjects();

    if (v14)
    {
      id v15 = [(HMDMatterCommand *)self accessory];
      v16 = [v6 accessory];
      char v17 = [v15 isEqual:v16];
    }
    else
    {
LABEL_9:
      char v17 = 0;
    }
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (id)associatedAccessories
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [(HMDMatterCommand *)self accessory];
  id v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  }
  else
  {
    id v4 = (void *)MEMORY[0x263EFFA68];
  }

  return v4;
}

- (BOOL)isAssociatedWithAccessory:(id)a3
{
  id v4 = [a3 uuid];
  id v5 = [(HMDMatterCommand *)self accessory];
  id v6 = [v5 uuid];
  char v7 = [v4 isEqual:v6];

  return v7;
}

- (HMDAccessory)accessory
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [(HMDMatterCommand *)self matterPath];
  id v4 = [v3 accessory];

  if (!v4)
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = self;
    char v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      v9 = [(HMDMatterCommand *)v6 matterPath];
      int v11 = 138543618;
      id v12 = v8;
      __int16 v13 = 2112;
      int v14 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Accessory was set to nil on matter path %@", (uint8_t *)&v11, 0x16u);
    }
  }
  return (HMDAccessory *)v4;
}

- (void)addMatterPathToTransactionIfNotStored:(id)a3
{
  id v17 = a3;
  id v4 = [(HMDMatterCommand *)self matterPath];
  id v5 = [v4 accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  id v8 = [v7 matterAdapter];

  if (!v8)
  {
    id v9 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    id v11 = v10;

    id v8 = [v11 matterAdapter];
  }
  id v12 = [v8 commandPaths];
  char v13 = [v12 containsObject:v4];

  if ((v13 & 1) == 0)
  {
    int v14 = [v4 uuid];
    uint64_t v15 = [v5 uuid];
    v16 = [v4 modelObjectWithChangeType:1 uuid:v14 parentUUID:v15];

    [v4 populateModelObject:v16];
    [v17 add:v16];
  }
}

- (BOOL)isCommandForMatterPath:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDMatterCommand *)self matterPath];
  if ([v4 isEqual:v5])
  {
    id v6 = [v4 accessory];
    id v7 = [v6 uuid];
    id v8 = [(HMDMatterCommand *)self accessory];
    id v9 = [v8 uuid];
    char v10 = objc_msgSend(v7, "hmf_isEqualToUUID:", v9);
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)dictionaryRepresentationWithEncodedValues:(BOOL)a3
{
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  id v6 = [(HMDMatterCommand *)self accessory];
  id v7 = accessoryToEncodeForXPCTransportForAccessory(v6);
  id v8 = [v7 uuid];
  id v9 = [v8 UUIDString];
  [v5 setObject:v9 forKeyedSubscript:@"kAccessoryUUID"];

  char v10 = [(HMDMatterCommand *)self matterPath];
  id v11 = [v10 clusterID];
  [v5 setObject:v11 forKeyedSubscript:*MEMORY[0x263F0C5F8]];

  id v12 = [(HMDMatterCommand *)self matterPath];
  char v13 = [v12 endpointID];
  [v5 setObject:v13 forKeyedSubscript:*MEMORY[0x263F0C6F8]];

  int v14 = [(HMDMatterCommand *)self matterPath];
  uint64_t v15 = [v14 commandID];
  [v5 setObject:v15 forKeyedSubscript:*MEMORY[0x263F0C620]];

  v16 = [(HMDMatterCommand *)self commandFields];

  if (v16)
  {
    id v17 = [(HMDMatterCommand *)self commandFields];
    v18 = v17;
    if (a3)
    {
      v19 = encodeRootObjectForIncomingXPCMessage(v17, 0);
      [v5 setObject:v19 forKeyedSubscript:*MEMORY[0x263F0C618]];
    }
    else
    {
      [v5 setObject:v17 forKeyedSubscript:*MEMORY[0x263F0C618]];
    }
  }
  v20 = [(HMDMatterCommand *)self expectedValues];

  if (v20)
  {
    v21 = [(HMDMatterCommand *)self expectedValues];
    v22 = v21;
    if (a3)
    {
      v23 = encodeRootObjectForIncomingXPCMessage(v21, 0);
      [v5 setObject:v23 forKeyedSubscript:*MEMORY[0x263F0C610]];
    }
    else
    {
      [v5 setObject:v21 forKeyedSubscript:*MEMORY[0x263F0C610]];
    }
  }
  v24 = (void *)[v5 copy];

  return v24;
}

- (BOOL)isValid
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = [(HMDMatterCommand *)self accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = [v5 matterAdapter];
  id v7 = [v6 commandPaths];
  if (v7)
  {

LABEL_7:
    id v9 = (void *)MEMORY[0x230FBD990]();
    char v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      char v13 = [(HMDMatterCommand *)v10 matterPath];
      *(_DWORD *)buf = 138543618;
      v28 = v12;
      __int16 v29 = 2112;
      v30 = v13;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Validating matter command for path: %@", buf, 0x16u);
    }
    int v14 = [v6 commandPaths];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __27__HMDMatterCommand_isValid__block_invoke;
    v26[3] = &unk_264A1BE28;
    v26[4] = v10;
    uint64_t v15 = objc_msgSend(v14, "na_firstObjectPassingTest:", v26);

    if (v15)
    {
      BOOL v16 = 1;
    }
    else
    {
      id v17 = [v6 mtrCommandPaths];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __27__HMDMatterCommand_isValid__block_invoke_2;
      v25[3] = &unk_264A1BE50;
      v25[4] = v10;
      v18 = objc_msgSend(v17, "na_firstObjectPassingTest:", v25);
      BOOL v16 = v18 != 0;
    }
    goto LABEL_13;
  }
  id v8 = [v6 mtrPaths];

  if (v8) {
    goto LABEL_7;
  }
  v20 = (void *)MEMORY[0x230FBD990]();
  v21 = self;
  v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v23 = HMFGetLogIdentifier();
    v24 = [(HMDMatterCommand *)v21 accessory];
    *(_DWORD *)buf = 138543618;
    v28 = v23;
    __int16 v29 = 2112;
    v30 = v24;
    _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to find commands paths from %@", buf, 0x16u);
  }
  BOOL v16 = 0;
LABEL_13:

  return v16;
}

uint64_t __27__HMDMatterCommand_isValid__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 matterPath];
  uint64_t v5 = [v4 isEqual:v3];

  return v5;
}

uint64_t __27__HMDMatterCommand_isValid__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 endpoint];
  uint64_t v5 = [*(id *)(a1 + 32) matterPath];
  id v6 = [v5 endpointID];
  if ([v4 isEqual:v6])
  {
    id v7 = [v3 cluster];
    id v8 = [*(id *)(a1 + 32) matterPath];
    id v9 = [v8 clusterID];
    if ([v7 isEqual:v9])
    {
      [v3 command];
      v10 = uint64_t v15 = v7;
      id v11 = [*(id *)(a1 + 32) matterPath];
      id v12 = [v11 commandID];
      uint64_t v13 = [v10 isEqual:v12];

      id v7 = v15;
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (HMDMatterCommand)initWithUUID:(id)a3 matterPath:(id)a4 commandFields:(id)a5 expectedValues:(id)a6 home:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [v13 commandID];

  if (!v17)
  {
    _HMFPreconditionFailure();
LABEL_7:
    v22 = (HMDMatterCommand *)_HMFPreconditionFailure();
    [(HMDMatterCommand *)v22 new];
  }
  v18 = [v13 accessory];

  if (!v18) {
    goto LABEL_7;
  }
  v24.receiver = self;
  v24.super_class = (Class)HMDMatterCommand;
  v19 = [(HMDMatterCommand *)&v24 init];
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_home, v16);
    objc_storeStrong((id *)&v20->_matterPath, a4);
    objc_storeStrong((id *)&v20->_commandFields, a5);
    objc_storeStrong((id *)&v20->_expectedValues, a6);
  }

  return v20;
}

- (HMDMatterCommand)new
{
  uint64_t v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (HMDMatterCommand)init
{
  uint64_t v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (HMDMatterCommand)initWithDictionary:(id)a3 home:(id)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v46 = a4;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    char v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Creating a matter command with dictionary: %@", buf, 0x16u);
  }
  uint64_t v11 = *MEMORY[0x263F0C618];
  id v12 = objc_msgSend(v6, "hmf_dataForKey:", *MEMORY[0x263F0C618]);

  if (v12)
  {
    id v13 = HMAllowedClassesForMatterCommand();
    v45 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", v11, v13);
  }
  else
  {
    v45 = objc_msgSend(v6, "hmf_dictionaryForKey:", v11);
  }
  uint64_t v14 = *MEMORY[0x263F0C610];
  id v15 = objc_msgSend(v6, "hmf_dataForKey:", *MEMORY[0x263F0C610]);

  if (v15)
  {
    id v16 = HMAllowedClassesForMatterCommand();
    v44 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", v14, v16);
  }
  else
  {
    v44 = objc_msgSend(v6, "hmf_arrayForKey:", v14);
  }
  id v17 = objc_msgSend(v6, "hmf_UUIDForKey:", @"kAccessoryUUID");
  objc_msgSend(v6, "hmf_numberForKey:", *MEMORY[0x263F0C620]);
  v18 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v6, "hmf_numberForKey:", *MEMORY[0x263F0C5F8]);
  uint64_t v20 = objc_msgSend(v6, "hmf_numberForKey:", *MEMORY[0x263F0C6F8]);
  v21 = (void *)v20;
  if (v17 && v18 && v19 && v20)
  {
    v22 = [v46 accessoryWithUUID:v17];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      SEL v23 = v22;
    }
    else {
      SEL v23 = 0;
    }
    id v24 = v23;

    if (v24)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v57 = __Block_byref_object_copy__66915;
      *(void *)v58 = __Block_byref_object_dispose__66916;
      *(void *)&v58[8] = +[HMDMatterPath PathWithCommandID:v18 endpointID:v21 clusterID:v19];
      v25 = *(void **)(*(void *)&buf[8] + 40);
      if (v25)
      {
        [v25 setAccessory:v24];
        v26 = [v24 matterAdapter];
        v27 = [v26 commandPaths];
        v47[0] = MEMORY[0x263EF8330];
        v47[1] = 3221225472;
        v47[2] = __44__HMDMatterCommand_initWithDictionary_home___block_invoke;
        v47[3] = &unk_264A2EFB8;
        v47[4] = buf;
        [v27 enumerateObjectsUsingBlock:v47];

        v28 = [HMDMatterCommand alloc];
        __int16 v29 = [MEMORY[0x263F08C38] UUID];
        v30 = [(HMDMatterCommand *)v28 initWithUUID:v29 matterPath:*(void *)(*(void *)&buf[8] + 40) commandFields:v45 expectedValues:v44 home:v46];
      }
      else
      {
        contexta = (void *)MEMORY[0x230FBD990]();
        v38 = v8;
        HMFGetOSLogHandle();
        v39 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v40 = HMFGetLogIdentifier();
          *(_DWORD *)v48 = 138544130;
          v49 = v40;
          __int16 v50 = 2112;
          v51 = v18;
          __int16 v52 = 2112;
          v53 = v21;
          __int16 v54 = 2112;
          v55 = v19;
          _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@Unable to create matter path from commandID/endpointID/clusterID %@/%@/%@", v48, 0x2Au);
        }
        v30 = 0;
      }
      _Block_object_dispose(buf, 8);
    }
    else
    {
      context = (void *)MEMORY[0x230FBD990]();
      v35 = v8;
      v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v37;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v17;
        _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_ERROR, "%{public}@Failed to find accessory with identifier: %@", buf, 0x16u);
      }
      v30 = 0;
    }
  }
  else
  {
    uint64_t v31 = (void *)MEMORY[0x230FBD990]();
    v32 = v8;
    v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = v34;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v17;
      *(_WORD *)&buf[22] = 2112;
      v57 = v18;
      *(_WORD *)v58 = 2112;
      *(void *)&v58[2] = v19;
      *(_WORD *)&v58[10] = 2112;
      *(void *)&v58[12] = v21;
      _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to get values accessoryUUID:%@, commandID:%@, clusterID:%@ or endpointID:%@ from dictionary", buf, 0x34u);
    }
    v30 = 0;
  }

  return v30;
}

void __44__HMDMatterCommand_initWithDictionary_home___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 isEqual:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t12_66924 != -1) {
    dispatch_once(&logCategory__hmf_once_t12_66924, &__block_literal_global_66925);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v13_66926;
  return v2;
}

void __31__HMDMatterCommand_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v13_66926;
  logCategory__hmf_once_v13_66926 = v0;
}

@end