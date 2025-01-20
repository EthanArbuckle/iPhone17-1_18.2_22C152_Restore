@interface HAPService
+ (BOOL)hap2_mergeServices:(id)a3 discoveredServices:(id)a4 mergedServices:(id)a5;
- (BOOL)_updateCharacteristic:(id)a3;
- (BOOL)_validateMandatoryCharacteristics;
- (BOOL)_validateServiceCharacteristics;
- (BOOL)hap2_mergeWithService:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)mergeObject:(id)a3;
- (BOOL)shouldMergeObject:(id)a3;
- (BOOL)updateAndValidateCharacteristics;
- (CBService)cbService;
- (HAPAccessory)accessory;
- (HAPService)initWithType:(id)a3 instanceID:(id)a4;
- (HAPService)initWithType:(id)a3 instanceID:(id)a4 parsedCharacteristics:(id)a5 serviceProperties:(unint64_t)a6 linkedServices:(id)a7;
- (NSArray)characteristics;
- (NSArray)linkedServices;
- (NSNumber)instanceID;
- (NSString)description;
- (NSString)type;
- (id)characteristicsOfType:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)propertiesDescription;
- (unint64_t)hash;
- (unint64_t)serviceProperties;
- (void)setAccessory:(id)a3;
- (void)setCBService:(id)a3;
- (void)setCharacteristics:(id)a3;
- (void)setInstanceID:(id)a3;
- (void)setLinkedServices:(id)a3;
- (void)setServiceProperties:(unint64_t)a3;
- (void)setType:(id)a3;
@end

@implementation HAPService

- (NSArray)linkedServices
{
  return self->_linkedServices;
}

- (HAPService)initWithType:(id)a3 instanceID:(id)a4 parsedCharacteristics:(id)a5 serviceProperties:(unint64_t)a6 linkedServices:(id)a7
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (isValidTypeName(v12))
  {
    v16 = objc_msgSend(v12, "hap_validatedAndNormalizedUUIDString");
    if (v16)
    {
      if (isValidInstanceID(v13))
      {
        v45.receiver = self;
        v45.super_class = (Class)HAPService;
        self = [(HAPService *)&v45 init];
        if (self)
        {
          id v43 = v15;
          +[HAPMetadata getSharedInstance];
          id v41 = v13;
          id v17 = v14;
          uint64_t v19 = v18 = v16;
          objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v18);
          v20 = (NSString *)objc_claimAutoreleasedReturnValue();
          type = self->_type;
          self->_type = v20;

          v42 = (void *)v19;
          v22 = (void *)v19;
          v16 = v18;
          id v14 = v17;
          id v13 = v41;
          v44 = [v22 serviceUTIFromType:v16];
          if (v44)
          {
            context = (void *)MEMORY[0x1D944E080]();
            log = HMFGetOSLogHandle();
            if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v23 = HMFGetLogIdentifier();
              v24 = self->_type;
              *(_DWORD *)buf = 138544130;
              uint64_t v47 = v23;
              v25 = (void *)v23;
              __int16 v48 = 2112;
              v49 = v24;
              __int16 v50 = 2112;
              v51 = v44;
              __int16 v52 = 2112;
              id v53 = v41;
              _os_log_impl(&dword_1D4758000, log, OS_LOG_TYPE_DEBUG, "%{public}@%@ ----> %@ [%@]", buf, 0x2Au);
            }
          }
          objc_storeStrong((id *)&self->_instanceID, a4);
          id v15 = v43;
          if (v14)
          {
            if ((unint64_t)[v14 count] >= 0x65)
            {
              v26 = (void *)MEMORY[0x1D944E080]();
              v27 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                v28 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                uint64_t v47 = (uint64_t)v28;
                v29 = "%{public}@### HAPService exceeds maximum number of allowed characteristics";
LABEL_30:
                _os_log_impl(&dword_1D4758000, v27, OS_LOG_TYPE_ERROR, v29, buf, 0xCu);

                goto LABEL_31;
              }
              goto LABEL_31;
            }
            objc_storeStrong((id *)&self->_characteristics, a5);
            if (![(HAPService *)self updateAndValidateCharacteristics])
            {
              v26 = (void *)MEMORY[0x1D944E080]();
              v27 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                v28 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                uint64_t v47 = (uint64_t)v28;
                v29 = "%{public}@### HAPService failed updateAndValidateCharacteristics";
                goto LABEL_30;
              }
LABEL_31:

              goto LABEL_22;
            }
          }
          self->_serviceProperties = a6;
          objc_storeStrong((id *)&self->_linkedServices, a7);
        }
        self = self;
        v33 = self;
        goto LABEL_26;
      }
      v34 = (void *)MEMORY[0x1D944E080]();
      v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v47 = (uint64_t)v36;
        v37 = "%{public}@### Unable to initialize service because of invalid instance ID";
        goto LABEL_20;
      }
    }
    else
    {
      v34 = (void *)MEMORY[0x1D944E080]();
      v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v47 = (uint64_t)v36;
        v37 = "%{public}@### Unable to initialize service because type name is not a UUID";
LABEL_20:
        _os_log_impl(&dword_1D4758000, v35, OS_LOG_TYPE_ERROR, v37, buf, 0xCu);
      }
    }

LABEL_22:
    v33 = 0;
LABEL_26:

    goto LABEL_27;
  }
  v30 = (void *)MEMORY[0x1D944E080]();
  v31 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    v32 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v47 = (uint64_t)v32;
    __int16 v48 = 2112;
    v49 = (NSString *)v12;
    _os_log_impl(&dword_1D4758000, v31, OS_LOG_TYPE_ERROR, "%{public}@### Unable to initialize service because of invalid service type name: %@", buf, 0x16u);
  }
  v33 = 0;
LABEL_27:

  return v33;
}

- (BOOL)_validateMandatoryCharacteristics
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = +[HAPMetadata getSharedInstance];
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = [(HAPService *)self characteristics];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v14 + 1) + 8 * v9) type];
        [v4 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  v11 = [(HAPService *)self type];
  char v12 = [v3 validateMandatoryCharacteristics:v4 forService:v11];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HAPService *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    uint64_t v6 = v5;
    if (!v6) {
      goto LABEL_7;
    }
    uint64_t v7 = [(HAPService *)self instanceID];
    uint64_t v8 = [(HAPService *)v6 instanceID];
    char v9 = numbersAreNotEqualNilSafe(v7, v8);

    if (v9) {
      goto LABEL_7;
    }
    uint64_t v12 = [(HAPService *)self type];
    uint64_t v13 = [(HAPService *)v6 type];
    if (!(v12 | v13)) {
      goto LABEL_13;
    }
    long long v14 = (void *)v13;
    int v15 = [(id)v12 isEqualToString:v13];

    if (!v15)
    {
LABEL_7:
      char v10 = 0;
    }
    else
    {
LABEL_13:
      uint64_t v16 = [(HAPService *)self accessory];
      if (v16)
      {
        long long v17 = (void *)v16;
        uint64_t v18 = [(HAPService *)v6 accessory];
        if (v18)
        {
          uint64_t v19 = (void *)v18;
          v20 = [(HAPService *)self accessory];
          v21 = [(HAPService *)v6 accessory];
          char v10 = [v20 isEqual:v21];
        }
        else
        {
          char v10 = 1;
        }
      }
      else
      {
        char v10 = 1;
      }
    }
  }
  return v10;
}

- (NSString)type
{
  return self->_type;
}

- (NSNumber)instanceID
{
  return self->_instanceID;
}

- (HAPAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);

  return (HAPAccessory *)WeakRetained;
}

- (BOOL)updateAndValidateCharacteristics
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (![(HAPService *)self _validateServiceCharacteristics])
  {
    uint64_t v16 = (void *)MEMORY[0x1D944E080]();
    long long v17 = self;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v33 = v19;
      _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to validate characteristics", buf, 0xCu);
    }
    return 0;
  }
  id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v4 = [(HAPService *)self characteristics];
  v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v6 = [(HAPService *)self characteristics];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v7)
  {
    BOOL v15 = 1;
    goto LABEL_22;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v28;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v28 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      uint64_t v12 = [v11 instanceID];
      int v13 = [v5 containsObject:v12];

      if (v13)
      {
        v20 = (void *)MEMORY[0x1D944E080]();
        v21 = self;
        v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          uint64_t v23 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v33 = v23;
          v24 = "%{public}@Duplicate characteristic instance IDs";
LABEL_20:
          _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_ERROR, v24, buf, 0xCu);
        }
LABEL_21:

        BOOL v15 = 0;
        goto LABEL_22;
      }
      long long v14 = [v11 instanceID];
      [v5 addObject:v14];

      if (![(HAPService *)self _updateCharacteristic:v11])
      {
        v20 = (void *)MEMORY[0x1D944E080]();
        v25 = self;
        v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          uint64_t v23 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v33 = v23;
          v24 = "%{public}@Failed to update characteristic";
          goto LABEL_20;
        }
        goto LABEL_21;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
    BOOL v15 = 1;
    if (v8) {
      continue;
    }
    break;
  }
LABEL_22:

  return v15;
}

- (NSArray)characteristics
{
  return self->_characteristics;
}

- (BOOL)_updateCharacteristic:(id)a3
{
  if (a3) {
    [a3 setService:self];
  }
  return 1;
}

- (BOOL)_validateServiceCharacteristics
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(HAPService *)self characteristics];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    v5 = (void *)MEMORY[0x1D944E080]();
    uint64_t v12 = self;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v14 = 138543362;
      BOOL v15 = v8;
      uint64_t v9 = "%{public}@One or more characteristics are required";
      char v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      goto LABEL_7;
    }
LABEL_8:

    return v4 != 0;
  }
  if (![(HAPService *)self _validateMandatoryCharacteristics])
  {
    v5 = (void *)MEMORY[0x1D944E080]();
    uint64_t v6 = self;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v14 = 138543362;
      BOOL v15 = v8;
      uint64_t v9 = "%{public}@Invalid mandatory characteristics";
      char v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
LABEL_7:
      _os_log_impl(&dword_1D4758000, v10, v11, v9, (uint8_t *)&v14, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  return v4 != 0;
}

- (void)setAccessory:(id)a3
{
}

- (unint64_t)serviceProperties
{
  return self->_serviceProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedServices, 0);
  objc_storeStrong((id *)&self->_characteristics, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_instanceID, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

- (void)setServiceProperties:(unint64_t)a3
{
  self->_serviceProperties = a3;
}

- (void)setLinkedServices:(id)a3
{
}

- (void)setCharacteristics:(id)a3
{
}

- (void)setInstanceID:(id)a3
{
}

- (void)setType:(id)a3
{
}

- (BOOL)mergeObject:(id)a3
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (!v6)
  {
LABEL_28:
    char v41 = 0;
    goto LABEL_45;
  }
  if (![(HAPService *)self shouldMergeObject:v6])
  {
    v37 = (void *)MEMORY[0x1D944E080]();
    v38 = self;
    v39 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      v40 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v88 = v40;
      __int16 v89 = 2112;
      id v90 = v6;
      _os_log_impl(&dword_1D4758000, v39, OS_LOG_TYPE_INFO, "%{public}@Not merging with service: %@", buf, 0x16u);
    }
    goto LABEL_28;
  }
  v64 = v6;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = [(HAPService *)self characteristics];
  uint64_t v9 = [v7 setWithArray:v8];

  char v10 = (void *)MEMORY[0x1E4F1CAD0];
  id v65 = v4;
  os_log_type_t v11 = [v4 characteristics];
  uint64_t v12 = [v10 setWithArray:v11];

  v66 = v9;
  int v13 = (void *)[v9 mutableCopy];
  v71 = v12;
  [v13 minusSet:v12];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  obuint64_t j = v13;
  uint64_t v14 = [obj countByEnumeratingWithState:&v80 objects:v86 count:16];
  BOOL v67 = v14 != 0;
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v81;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v81 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v80 + 1) + 8 * i);
        uint64_t v19 = (void *)MEMORY[0x1D944E080]();
        v20 = self;
        v21 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v22 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v88 = v22;
          __int16 v89 = 2112;
          id v90 = v18;
          _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_INFO, "%{public}@Removed characteristic: %@", buf, 0x16u);
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v80 objects:v86 count:16];
    }
    while (v15);
  }

  uint64_t v23 = (void *)[v12 mutableCopy];
  [v23 minusSet:v66];
  v24 = [(HAPService *)self characteristics];
  v25 = [v24 firstObject];
  uint64_t v26 = [v25 shouldValidateValueAfterReading];

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v69 = v23;
  uint64_t v27 = [v69 countByEnumeratingWithState:&v76 objects:v85 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v77;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v77 != v29) {
          objc_enumerationMutation(v69);
        }
        v31 = *(void **)(*((void *)&v76 + 1) + 8 * j);
        v32 = (void *)MEMORY[0x1D944E080]();
        v33 = self;
        uint64_t v34 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          v35 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v88 = v35;
          __int16 v89 = 2112;
          id v90 = v31;
          _os_log_impl(&dword_1D4758000, v34, OS_LOG_TYPE_INFO, "%{public}@Added characteristic: %@", buf, 0x16u);
        }
        [v31 setService:v33];
        [v31 setShouldValidateValueAfterReading:v26];
      }
      uint64_t v28 = [v69 countByEnumeratingWithState:&v76 objects:v85 count:16];
    }
    while (v28);
    char v36 = 1;
  }
  else
  {
    char v36 = v67;
  }

  v42 = (void *)[v66 mutableCopy];
  [v42 minusSet:obj];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v68 = v42;
  uint64_t v43 = [v68 countByEnumeratingWithState:&v72 objects:v84 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v73;
    do
    {
      for (uint64_t k = 0; k != v44; ++k)
      {
        if (*(void *)v73 != v45) {
          objc_enumerationMutation(v68);
        }
        uint64_t v47 = *(void **)(*((void *)&v72 + 1) + 8 * k);
        __int16 v48 = (void *)MEMORY[0x1D944E080]();
        v49 = self;
        __int16 v50 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          v51 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v88 = v51;
          __int16 v89 = 2112;
          id v90 = v47;
          _os_log_impl(&dword_1D4758000, v50, OS_LOG_TYPE_DEBUG, "%{public}@Merging existing characteristic: %@", buf, 0x16u);
        }
        __int16 v52 = [v71 member:v47];
        if (v52 && [v47 mergeObject:v52])
        {
          id v53 = (void *)MEMORY[0x1D944E080]();
          uint64_t v54 = v49;
          v55 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            v56 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v88 = v56;
            __int16 v89 = 2112;
            id v90 = v47;
            _os_log_impl(&dword_1D4758000, v55, OS_LOG_TYPE_INFO, "%{public}@Updated characteristic: %@", buf, 0x16u);
          }
          char v36 = 1;
        }
      }
      uint64_t v44 = [v68 countByEnumeratingWithState:&v72 objects:v84 count:16];
    }
    while (v44);
  }
  char v41 = v36;

  v57 = (void *)MEMORY[0x1E4F1CA48];
  v58 = [v68 allObjects];
  v59 = [v57 arrayWithArray:v58];

  v60 = [v69 allObjects];
  [v59 addObjectsFromArray:v60];

  v61 = (void *)[v59 copy];
  [(HAPService *)self setCharacteristics:v61];

  id v6 = v64;
  -[HAPService setServiceProperties:](self, "setServiceProperties:", [v64 serviceProperties]);
  v62 = [v64 linkedServices];
  [(HAPService *)self setLinkedServices:v62];

  id v4 = v65;
LABEL_45:

  return v41 & 1;
}

- (BOOL)shouldMergeObject:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HAPService *)self isEqual:v4])
  {
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    id v6 = [(HAPService *)self characteristics];
    uint64_t v7 = [v5 setWithArray:v6];

    uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
    id v29 = v4;
    uint64_t v9 = [v4 characteristics];
    char v10 = [v8 setWithArray:v9];

    uint64_t v28 = v7;
    os_log_type_t v11 = (void *)[v7 mutableCopy];
    [v11 intersectSet:v10];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (!v13)
    {
      char v16 = 1;
      goto LABEL_18;
    }
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v32;
    char v16 = 1;
    while (1)
    {
      uint64_t v17 = 0;
      uint64_t v30 = v14;
      do
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void **)(*((void *)&v31 + 1) + 8 * v17);
        uint64_t v19 = [v10 member:v18];
        if (v19)
        {
          if ([v18 shouldMergeObject:v19]) {
            goto LABEL_13;
          }
          v20 = (void *)MEMORY[0x1D944E080]();
          v21 = self;
          v22 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            uint64_t v23 = v15;
            v24 = v10;
            uint64_t v26 = v25 = self;
            *(_DWORD *)buf = 138543874;
            char v36 = v26;
            __int16 v37 = 2112;
            v38 = v19;
            __int16 v39 = 2112;
            id v40 = v12;
            _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to merge characteristic, %@, with existing characteristic: %@", buf, 0x20u);

            self = v25;
            char v10 = v24;
            uint64_t v15 = v23;
            uint64_t v14 = v30;
          }
        }
        char v16 = 0;
LABEL_13:

        ++v17;
      }
      while (v14 != v17);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v41 count:16];
      if (!v14)
      {
LABEL_18:

        id v4 = v29;
        goto LABEL_19;
      }
    }
  }
  char v16 = 0;
LABEL_19:

  return v16 & 1;
}

- (id)characteristicsOfType:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [(HAPService *)self characteristics];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        os_log_type_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [v11 type];
        int v13 = [v12 isEqualToString:v4];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)propertiesDescription
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(HAPService *)self serviceProperties]) {
    [v3 addObject:@"primary"];
  }
  if (([(HAPService *)self serviceProperties] & 2) != 0) {
    [v3 addObject:@"hidden"];
  }
  if ([v3 count])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    v5 = [v3 objectAtIndexedSubscript:0];
    [v4 appendString:v5];

    id v6 = [v3 objectAtIndexedSubscript:0];
    [v3 removeObject:v6];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          [v4 appendFormat:@", %@", *(void *)(*((void *)&v13 + 1) + 8 * i)];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = [(HAPService *)self instanceID];
  v5 = [(HAPService *)self type];
  id v6 = [(HAPService *)self propertiesDescription];
  id v7 = [(HAPService *)self linkedServices];
  uint64_t v8 = [v3 stringWithFormat:@"Instance ID: %@, Type: %@, Properties: %@, Linked Service: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (unint64_t)hash
{
  v2 = [(HAPService *)self instanceID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (HAPService)initWithType:(id)a3 instanceID:(id)a4
{
  return [(HAPService *)self initWithType:a3 instanceID:a4 parsedCharacteristics:0 serviceProperties:0 linkedServices:0];
}

- (void)setCBService:(id)a3
{
}

- (CBService)cbService
{
  v2 = objc_getAssociatedObject(self, "cbService");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (CBService *)v3;
}

- (BOOL)hap2_mergeWithService:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = [(HAPService *)self characteristics];
  id v7 = objc_msgSend(v5, "dictionaryWithCapacity:", objc_msgSend(v6, "count"));

  uint64_t v8 = [(HAPService *)self characteristics];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __42__HAPService_HAP2__hap2_mergeWithService___block_invoke;
  v30[3] = &unk_1E69F3740;
  id v9 = v7;
  id v31 = v9;
  [v8 enumerateObjectsUsingBlock:v30];

  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v10 = (void *)MEMORY[0x1E4F1CA48];
  os_log_type_t v11 = [v4 characteristics];
  id v12 = objc_msgSend(v10, "arrayWithCapacity:", objc_msgSend(v11, "count"));

  long long v13 = [v4 characteristics];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __42__HAPService_HAP2__hap2_mergeWithService___block_invoke_2;
  v22 = &unk_1E69F38C8;
  id v14 = v9;
  id v23 = v14;
  v25 = &v26;
  id v15 = v12;
  id v24 = v15;
  [v13 enumerateObjectsUsingBlock:&v19];

  if (objc_msgSend(v14, "count", v19, v20, v21, v22)) {
    *((unsigned char *)v27 + 24) = 1;
  }
  long long v16 = (void *)[v15 copy];
  [(HAPService *)self setCharacteristics:v16];

  char v17 = *((unsigned char *)v27 + 24);
  _Block_object_dispose(&v26, 8);

  return v17;
}

void __42__HAPService_HAP2__hap2_mergeWithService___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 instanceID];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

void __42__HAPService_HAP2__hap2_mergeWithService___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)a1[4];
  id v14 = v3;
  v5 = [v3 instanceID];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    id v7 = (void *)a1[4];
    uint64_t v8 = [v14 instanceID];
    [v7 removeObjectForKey:v8];

    char v9 = objc_msgSend(v6, "hap2_mergeWithCharacteristic:", v14);
    uint64_t v10 = *(void *)(a1[6] + 8);
    BOOL v11 = (v9 & 1) != 0 || *(unsigned char *)(v10 + 24) != 0;
    *(unsigned char *)(v10 + 24) = v11;
    id v12 = (void *)a1[5];
    id v13 = v6;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    id v12 = (void *)a1[5];
    id v13 = v14;
  }
  [v12 addObject:v13];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  id v6 = [(HAPService *)self type];
  id v7 = (void *)[v6 copyWithZone:a3];
  uint64_t v8 = [(HAPService *)self instanceID];
  char v9 = (void *)[v8 copyWithZone:a3];
  id v10 = objc_alloc(MEMORY[0x1E4F1C978]);
  BOOL v11 = [(HAPService *)self characteristics];
  id v12 = (void *)[v10 initWithArray:v11 copyItems:1];
  unint64_t v13 = [(HAPService *)self serviceProperties];
  id v14 = objc_alloc(MEMORY[0x1E4F1C978]);
  id v15 = [(HAPService *)self linkedServices];
  long long v16 = (void *)[v14 initWithArray:v15 copyItems:1];
  char v17 = (void *)[v5 initWithType:v7 instanceID:v9 parsedCharacteristics:v12 serviceProperties:v13 linkedServices:v16];

  return v17;
}

+ (BOOL)hap2_mergeServices:(id)a3 discoveredServices:(id)a4 mergedServices:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __73__HAPService_HAP2__hap2_mergeServices_discoveredServices_mergedServices___block_invoke;
  v27[3] = &unk_1E69F31E8;
  id v11 = v10;
  id v28 = v11;
  [v7 enumerateObjectsUsingBlock:v27];
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __73__HAPService_HAP2__hap2_mergeServices_discoveredServices_mergedServices___block_invoke_2;
  uint64_t v19 = &unk_1E69F27A0;
  id v12 = v11;
  id v20 = v12;
  id v13 = v9;
  id v21 = v13;
  v22 = &v23;
  [v8 enumerateObjectsUsingBlock:&v16];
  if (objc_msgSend(v12, "count", v16, v17, v18, v19))
  {
    BOOL v14 = 1;
    *((unsigned char *)v24 + 24) = 1;
  }
  else
  {
    BOOL v14 = *((unsigned char *)v24 + 24) != 0;
  }

  _Block_object_dispose(&v23, 8);
  return v14;
}

void __73__HAPService_HAP2__hap2_mergeServices_discoveredServices_mergedServices___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 instanceID];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

void __73__HAPService_HAP2__hap2_mergeServices_discoveredServices_mergedServices___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v12 = v3;
  id v5 = [v3 instanceID];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = [v12 instanceID];
    [v7 removeObjectForKey:v8];

    char v9 = objc_msgSend(v6, "hap2_mergeWithService:", v12);
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    BOOL v11 = (v9 & 1) != 0 || *(unsigned char *)(v10 + 24) != 0;
    *(unsigned char *)(v10 + 24) = v11;
    [v6 updateAndValidateCharacteristics];
    [*(id *)(a1 + 40) addObject:v6];
  }
  else
  {
    [*(id *)(a1 + 40) addObject:v12];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

@end