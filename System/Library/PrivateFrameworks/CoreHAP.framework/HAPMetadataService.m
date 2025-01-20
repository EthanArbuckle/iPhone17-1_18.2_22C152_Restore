@interface HAPMetadataService
- (BOOL)allowAssociatedService;
- (HAPMetadataService)initWithName:(id)a3 uuid:(id)a4 description:(id)a5 mandatoryChrTypes:(id)a6 properties:(id)a7 linkedServices:(id)a8;
- (NSArray)linkedServices;
- (NSNumber)properties;
- (NSSet)mandatoryCharacteristics;
- (NSSet)optionalCharacteristics;
- (NSString)btleuuidStr;
- (NSString)name;
- (NSString)svcDescription;
- (NSString)uuidStr;
- (id)description;
- (id)generateDictionary:(id)a3 metadata:(id)a4;
- (void)dump;
- (void)setAllowAssociatedService:(BOOL)a3;
- (void)setBtleuuidStr:(id)a3;
- (void)setLinkedServices:(id)a3;
- (void)setMandatoryCharacteristics:(id)a3;
- (void)setName:(id)a3;
- (void)setOptionalCharacteristics:(id)a3;
- (void)setProperties:(id)a3;
- (void)setSvcDescription:(id)a3;
- (void)setUuidStr:(id)a3;
@end

@implementation HAPMetadataService

- (NSString)uuidStr
{
  return self->_uuidStr;
}

- (NSString)svcDescription
{
  return self->_svcDescription;
}

- (NSString)name
{
  return self->_name;
}

- (NSSet)mandatoryCharacteristics
{
  return self->_mandatoryCharacteristics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionalCharacteristics, 0);
  objc_storeStrong((id *)&self->_mandatoryCharacteristics, 0);
  objc_storeStrong((id *)&self->_linkedServices, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_btleuuidStr, 0);
  objc_storeStrong((id *)&self->_uuidStr, 0);
  objc_storeStrong((id *)&self->_svcDescription, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setAllowAssociatedService:(BOOL)a3
{
  self->_allowAssociatedService = a3;
}

- (BOOL)allowAssociatedService
{
  return self->_allowAssociatedService;
}

- (void)setOptionalCharacteristics:(id)a3
{
}

- (NSSet)optionalCharacteristics
{
  return self->_optionalCharacteristics;
}

- (void)setMandatoryCharacteristics:(id)a3
{
}

- (void)setLinkedServices:(id)a3
{
}

- (NSArray)linkedServices
{
  return self->_linkedServices;
}

- (void)setProperties:(id)a3
{
}

- (NSNumber)properties
{
  return self->_properties;
}

- (void)setBtleuuidStr:(id)a3
{
}

- (NSString)btleuuidStr
{
  return self->_btleuuidStr;
}

- (void)setUuidStr:(id)a3
{
}

- (void)setSvcDescription:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (void)dump
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D944E080](self, a2);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    v6 = [(HAPMetadataService *)self name];
    v7 = [(HAPMetadataService *)self uuidStr];
    v8 = [(HAPMetadataService *)self svcDescription];
    *(_DWORD *)buf = 138544130;
    v58 = v5;
    __int16 v59 = 2112;
    unint64_t v60 = (unint64_t)v6;
    __int16 v61 = 2112;
    v62 = v7;
    __int16 v63 = 2112;
    v64 = v8;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@HAPMetadataCharacteristic %@(%@):  description: %@", buf, 0x2Au);
  }
  if ([(HAPMetadataService *)self allowAssociatedService])
  {
    v9 = (void *)MEMORY[0x1D944E080]();
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      BOOL v12 = [(HAPMetadataService *)self allowAssociatedService];
      *(_DWORD *)buf = 138543618;
      v58 = v11;
      __int16 v59 = 2048;
      unint64_t v60 = v12;
      _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_INFO, "%{public}@AllowAssociatedService: %ld", buf, 0x16u);
    }
  }
  v13 = [(HAPMetadataService *)self mandatoryCharacteristics];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    v15 = (void *)MEMORY[0x1D944E080]();
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v58 = v17;
      _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_INFO, "%{public}@Mandatory characteristics:", buf, 0xCu);
    }
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    obuint64_t j = [(HAPMetadataService *)self mandatoryCharacteristics];
    uint64_t v18 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v52 != v20) {
            objc_enumerationMutation(obj);
          }
          v22 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          v23 = (void *)MEMORY[0x1D944E080]();
          v24 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            v25 = HMFGetLogIdentifier();
            v26 = [v22 name];
            v27 = [v22 uuidStr];
            v28 = [v22 chrDescription];
            *(_DWORD *)buf = 138544130;
            v58 = v25;
            __int16 v59 = 2112;
            unint64_t v60 = (unint64_t)v26;
            __int16 v61 = 2112;
            v62 = v27;
            __int16 v63 = 2112;
            v64 = v28;
            _os_log_impl(&dword_1D4758000, v24, OS_LOG_TYPE_INFO, "%{public}@%@(%@) - %@", buf, 0x2Au);
          }
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
      }
      while (v19);
    }
  }
  v29 = [(HAPMetadataService *)self optionalCharacteristics];
  uint64_t v30 = [v29 count];

  if (v30)
  {
    v31 = (void *)MEMORY[0x1D944E080]();
    v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      v33 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v58 = v33;
      _os_log_impl(&dword_1D4758000, v32, OS_LOG_TYPE_INFO, "%{public}@Optional characteristics:", buf, 0xCu);
    }
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id obja = [(HAPMetadataService *)self optionalCharacteristics];
    uint64_t v34 = [obja countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v48;
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v48 != v36) {
            objc_enumerationMutation(obja);
          }
          v38 = *(void **)(*((void *)&v47 + 1) + 8 * j);
          v39 = (void *)MEMORY[0x1D944E080]();
          v40 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            v41 = HMFGetLogIdentifier();
            v42 = [v38 name];
            v43 = [v38 uuidStr];
            v44 = [v38 chrDescription];
            *(_DWORD *)buf = 138544130;
            v58 = v41;
            __int16 v59 = 2112;
            unint64_t v60 = (unint64_t)v42;
            __int16 v61 = 2112;
            v62 = v43;
            __int16 v63 = 2112;
            v64 = v44;
            _os_log_impl(&dword_1D4758000, v40, OS_LOG_TYPE_INFO, "%{public}@%@(%@) - %@", buf, 0x2Au);
          }
        }
        uint64_t v35 = [obja countByEnumeratingWithState:&v47 objects:v55 count:16];
      }
      while (v35);
    }
  }
}

- (id)description
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] string];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v4 = [(HAPMetadataService *)self mandatoryCharacteristics];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v10 = [v9 name];
        v11 = [v9 uuidStr];
        [v3 appendFormat:@"%@(%@),", v10, v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v6);
  }

  BOOL v12 = [MEMORY[0x1E4F28E78] string];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v13 = [(HAPMetadataService *)self optionalCharacteristics];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v27 + 1) + 8 * j);
        uint64_t v19 = [v18 name];
        uint64_t v20 = [v18 uuidStr];
        [v12 appendFormat:@"%@(%@),", v19, v20];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v15);
  }

  v21 = NSString;
  v22 = [(HAPMetadataService *)self name];
  v23 = [(HAPMetadataService *)self uuidStr];
  v24 = [(HAPMetadataService *)self svcDescription];
  v25 = [v21 stringWithFormat:@"HAPMetadataService %@(%@) - %@ - mandatory %@, optional %@", v22, v23, v24, v3, v12];

  return v25;
}

- (id)generateDictionary:(id)a3 metadata:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CA60] dictionary];
  v9 = [(HAPMetadataService *)self uuidStr];
  long long v30 = v6;
  v10 = +[HAPMetadata shortenHAPType:v9 baseUUIDSuffix:v6];
  [v8 setObject:v10 forKeyedSubscript:@"ShortUUID"];

  v11 = [(HAPMetadataService *)self svcDescription];
  [v8 setObject:v11 forKeyedSubscript:@"DefaultDescription"];

  [v8 setObject:&stru_1F2C4E778 forKeyedSubscript:@"LocalizationKey"];
  BOOL v12 = [(HAPMetadataService *)self btleuuidStr];

  if (v12)
  {
    v13 = [(HAPMetadataService *)self btleuuidStr];
    [v8 setObject:v13 forKeyedSubscript:@"BTLE_ShortUUID"];
  }
  uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v16 = [(HAPMetadataService *)self mandatoryCharacteristics];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = [v7 characteristicUTIFromType:*(void *)(*((void *)&v35 + 1) + 8 * i)];
        if (v21) {
          [v15 addObject:v21];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v18);
  }

  if ([v15 count]) {
    [v14 setObject:v15 forKeyedSubscript:@"Required"];
  }
  v22 = [MEMORY[0x1E4F1CA48] array];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v23 = [(HAPMetadataService *)self mandatoryCharacteristics];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v32 != v26) {
          objc_enumerationMutation(v23);
        }
        long long v28 = [v7 characteristicUTIFromType:*(void *)(*((void *)&v31 + 1) + 8 * j)];
        if (v28) {
          [v22 addObject:v28];
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v25);
  }

  if ([v22 count]) {
    [v14 setObject:v22 forKeyedSubscript:@"Optional"];
  }
  if ([v14 count]) {
    [v8 setObject:v14 forKeyedSubscript:@"Characteristics"];
  }
  if ([(HAPMetadataService *)self allowAssociatedService]) {
    [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"AllowAssociatedService"];
  }

  return v8;
}

- (HAPMetadataService)initWithName:(id)a3 uuid:(id)a4 description:(id)a5 mandatoryChrTypes:(id)a6 properties:(id)a7 linkedServices:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = 0;
  if (v14 && v15 && v16)
  {
    v29.receiver = self;
    v29.super_class = (Class)HAPMetadataService;
    id v20 = [(HAPMetadataService *)&v29 init];
    if (v20)
    {
      uint64_t v21 = [v14 copy];
      v22 = (void *)*((void *)v20 + 2);
      *((void *)v20 + 2) = v21;

      uint64_t v23 = [v15 copy];
      uint64_t v24 = (void *)*((void *)v20 + 4);
      *((void *)v20 + 4) = v23;

      uint64_t v25 = [v16 copy];
      uint64_t v26 = (void *)*((void *)v20 + 3);
      *((void *)v20 + 3) = v25;

      objc_storeStrong((id *)v20 + 8, a6);
      objc_storeStrong((id *)v20 + 6, a7);
      id v27 = v19;
      self = (HAPMetadataService *)*((void *)v20 + 7);
      *((void *)v20 + 7) = v27;
    }
    else
    {
      self = 0;
    }
  }

  return (HAPMetadataService *)v20;
}

@end