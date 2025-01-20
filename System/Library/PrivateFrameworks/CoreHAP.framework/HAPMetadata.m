@interface HAPMetadata
+ (id)currentMetadataHook;
+ (id)getSharedInstance;
+ (id)shortenHAPType:(id)a3 baseUUIDSuffix:(id)a4;
+ (void)setCurrentMetadataHook:(id)a3;
- (BOOL)allowAssociatedService:(id)a3;
- (BOOL)isMandatoryCharacteristic:(id)a3 forService:(id)a4;
- (BOOL)isStandardHAPCharacteristic:(id)a3;
- (BOOL)isStandardHAPCharacteristicName:(id)a3;
- (BOOL)isStandardHAPService:(id)a3;
- (BOOL)isStandardHAPServiceName:(id)a3;
- (BOOL)isStandardHAPUnitName:(id)a3;
- (BOOL)parseMetadata:(id)a3;
- (BOOL)parseVersion:(id)a3;
- (BOOL)supportsAdditionalAuthorizationData:(id)a3 forService:(id)a4;
- (BOOL)updateRawPlist;
- (BOOL)validateMandatoryCharacteristics:(id)a3 forService:(id)a4;
- (HAPMetadata)initWithDictionary:(id)a3 error:(id *)a4;
- (HAPMetadata)initWithServices:(id)a3 characteristics:(id)a4 units:(id)a5 properties:(id)a6 addAuthDataTuples:(id)a7 hapBaseUUIDSuffix:(id)a8;
- (NSArray)hapCharacteristics;
- (NSArray)hapProperties;
- (NSArray)hapServices;
- (NSArray)hapSupportsAuthDataTuples;
- (NSArray)hapValueUnits;
- (NSDictionary)hapCharacteristicMap;
- (NSDictionary)hapCharacteristicNameTypeMap;
- (NSDictionary)hapPropertyMap;
- (NSDictionary)hapServiceMap;
- (NSDictionary)hapServiceNameTypeMap;
- (NSDictionary)hapUnitMap;
- (NSDictionary)rawPlist;
- (NSMutableArray)parsedUUIDs;
- (NSNumber)schemaVersion;
- (NSNumber)version;
- (NSSet)hapSupportsAuthDataSet;
- (NSString)hapBaseUUIDSuffix;
- (id)btleToServiceType:(id)a3;
- (id)characteristicTypeFromUTI:(id)a3;
- (id)characteristicTypesChangingTargetState;
- (id)characteristicUTIFromType:(id)a3;
- (id)characteristicValueUnitOfType:(id)a3;
- (id)descriptionFromCharacteristicType:(id)a3;
- (id)descriptionFromServiceType:(id)a3;
- (id)generateDictionary;
- (id)generateHAPMetadataTuplesDictionary:(id)a3;
- (id)getDefaultCharacteristicMetadata:(id)a3;
- (id)getDefaultCharacteristicProperties:(id)a3;
- (id)getDefaultServiceProperties:(id)a3;
- (id)hapCharacteristicFromName:(id)a3;
- (id)hapCharacteristicFromType:(id)a3;
- (id)hapServiceFromName:(id)a3;
- (id)hapServiceFromType:(id)a3;
- (id)hapUnitFromName:(id)a3;
- (id)parseCharacteristicServiceTuples:(id)a3;
- (id)parseCharacteristicValue:(id)a3;
- (id)parseCharacteristics:(id)a3;
- (id)parseProperties:(id)a3;
- (id)parseServiceCharacteristics:(id)a3;
- (id)parseServices:(id)a3;
- (id)parseUnits:(id)a3;
- (id)serviceTypeFromUTI:(id)a3;
- (id)serviceTypeToBTLE:(id)a3;
- (id)serviceUTIFromType:(id)a3;
- (void)setHapBaseUUIDSuffix:(id)a3;
- (void)setHapCharacteristicMap:(id)a3;
- (void)setHapCharacteristicNameTypeMap:(id)a3;
- (void)setHapPropertyMap:(id)a3;
- (void)setHapServiceMap:(id)a3;
- (void)setHapServiceNameTypeMap:(id)a3;
- (void)setHapSupportsAuthDataSet:(id)a3;
- (void)setHapUnitMap:(id)a3;
- (void)setParsedUUIDs:(id)a3;
- (void)setSchemaVersion:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation HAPMetadata

- (id)hapCharacteristicFromType:(id)a3
{
  id v4 = a3;
  v5 = [(HAPMetadata *)self hapCharacteristicMap];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (NSDictionary)hapCharacteristicMap
{
  return self->_hapCharacteristicMap;
}

- (id)getDefaultCharacteristicMetadata:(id)a3
{
  id v4 = a3;
  v5 = [(HAPMetadata *)self hapCharacteristicMap];
  v6 = [v5 objectForKeyedSubscript:v4];

  v7 = [v6 valueMetadata];
  v8 = [v7 minLength];
  if (v8
    || ([v7 maxLength], (v8 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v7 minValue], (v8 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v7 maxValue], (v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_6:
    v9 = objc_alloc_init(HAPMetadataConstraints);
    v10 = [v7 minValue];
    [(HAPMetadataConstraints *)v9 setMinimumValue:v10];

    v11 = [v7 maxValue];
    [(HAPMetadataConstraints *)v9 setMaximumValue:v11];

    v12 = [v7 stepValue];
    [(HAPMetadataConstraints *)v9 setStepValue:v12];

    v13 = [v7 minLength];
    [(HAPMetadataConstraints *)v9 setMinLength:v13];

    v14 = [v7 maxLength];
    [(HAPMetadataConstraints *)v9 setMaxLength:v14];

    v15 = [v7 validValues];
    [(HAPMetadataConstraints *)v9 setValidValues:v15];

    goto LABEL_7;
  }
  v9 = [v7 stepValue];

  if (v9) {
    goto LABEL_6;
  }
LABEL_7:
  v16 = [HAPCharacteristicMetadata alloc];
  v17 = [v6 chrDescription];
  v18 = [v6 format];
  v19 = [v6 units];
  v20 = [(HAPCharacteristicMetadata *)v16 initWithConstraints:v9 description:v17 format:v18 units:v19];

  return v20;
}

+ (id)getSharedInstance
{
  v2 = (void *)currentMetadataHook;
  if (currentMetadataHook)
  {
    v2 = (*(void (**)(void))(currentMetadataHook + 16))();
  }

  return v2;
}

- (id)getDefaultCharacteristicProperties:(id)a3
{
  v3 = [(HAPMetadata *)self hapCharacteristicFromType:a3];
  id v4 = [v3 properties];

  return v4;
}

- (id)characteristicUTIFromType:(id)a3
{
  v3 = [(HAPMetadata *)self hapCharacteristicFromType:a3];
  id v4 = [v3 name];

  return v4;
}

- (BOOL)isStandardHAPCharacteristic:(id)a3
{
  v3 = [(HAPMetadata *)self hapCharacteristicFromType:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (NSArray)hapCharacteristics
{
  v2 = [(HAPMetadata *)self hapCharacteristicMap];
  v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (NSArray)hapServices
{
  v2 = [(HAPMetadata *)self hapServiceMap];
  v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (id)serviceUTIFromType:(id)a3
{
  v3 = [(HAPMetadata *)self hapServiceFromType:a3];
  BOOL v4 = [v3 name];

  return v4;
}

- (BOOL)validateMandatoryCharacteristics:(id)a3 forService:(id)a4
{
  id v6 = a3;
  v7 = [(HAPMetadata *)self hapServiceFromType:a4];
  v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];

  v9 = [v7 mandatoryCharacteristics];
  if ([v9 count])
  {
    v10 = [v7 mandatoryCharacteristics];
    char v11 = [v10 isSubsetOfSet:v8];
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

- (BOOL)isStandardHAPService:(id)a3
{
  v3 = [(HAPMetadata *)self hapServiceFromType:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)hapServiceFromType:(id)a3
{
  id v4 = a3;
  v5 = [(HAPMetadata *)self hapServiceMap];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (NSDictionary)hapServiceMap
{
  return self->_hapServiceMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hapServiceNameTypeMap, 0);
  objc_storeStrong((id *)&self->_hapCharacteristicNameTypeMap, 0);
  objc_storeStrong((id *)&self->_hapSupportsAuthDataSet, 0);
  objc_storeStrong((id *)&self->_hapServiceMap, 0);
  objc_storeStrong((id *)&self->_hapCharacteristicMap, 0);
  objc_storeStrong((id *)&self->_hapPropertyMap, 0);
  objc_storeStrong((id *)&self->_hapUnitMap, 0);
  objc_storeStrong((id *)&self->_parsedUUIDs, 0);
  objc_storeStrong((id *)&self->_rawPlist, 0);
  objc_storeStrong((id *)&self->_hapBaseUUIDSuffix, 0);
  objc_storeStrong((id *)&self->_schemaVersion, 0);

  objc_storeStrong((id *)&self->_version, 0);
}

- (void)setHapServiceNameTypeMap:(id)a3
{
}

- (NSDictionary)hapServiceNameTypeMap
{
  return self->_hapServiceNameTypeMap;
}

- (void)setHapCharacteristicNameTypeMap:(id)a3
{
}

- (NSDictionary)hapCharacteristicNameTypeMap
{
  return self->_hapCharacteristicNameTypeMap;
}

- (void)setHapSupportsAuthDataSet:(id)a3
{
}

- (NSSet)hapSupportsAuthDataSet
{
  return self->_hapSupportsAuthDataSet;
}

- (void)setHapServiceMap:(id)a3
{
}

- (void)setHapCharacteristicMap:(id)a3
{
}

- (void)setHapPropertyMap:(id)a3
{
}

- (NSDictionary)hapPropertyMap
{
  return self->_hapPropertyMap;
}

- (void)setHapUnitMap:(id)a3
{
}

- (NSDictionary)hapUnitMap
{
  return self->_hapUnitMap;
}

- (void)setParsedUUIDs:(id)a3
{
}

- (NSMutableArray)parsedUUIDs
{
  return self->_parsedUUIDs;
}

- (NSDictionary)rawPlist
{
  return self->_rawPlist;
}

- (void)setHapBaseUUIDSuffix:(id)a3
{
}

- (NSString)hapBaseUUIDSuffix
{
  return self->_hapBaseUUIDSuffix;
}

- (void)setSchemaVersion:(id)a3
{
}

- (NSNumber)schemaVersion
{
  return self->_schemaVersion;
}

- (void)setVersion:(id)a3
{
}

- (NSNumber)version
{
  return self->_version;
}

- (id)generateHAPMetadataTuplesDictionary:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "characteristicType", (void)v18);
        v13 = [(HAPMetadata *)self characteristicUTIFromType:v12];

        v14 = [v11 serviceType];
        v15 = [(HAPMetadata *)self serviceUTIFromType:v14];

        v16 = [v5 objectForKeyedSubscript:v13];
        if (!v16)
        {
          v16 = [MEMORY[0x1E4F1CA48] array];
          [v5 setObject:v16 forKeyedSubscript:v13];
        }
        [v16 addObject:v15];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)generateDictionary
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(HAPMetadata *)self hapBaseUUIDSuffix];

  if (v4)
  {
    v5 = [(HAPMetadata *)self hapBaseUUIDSuffix];
    [v3 setObject:v5 forKeyedSubscript:@"Base UUID"];
  }
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  uint64_t v7 = [(HAPMetadata *)self hapValueUnits];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v77 objects:v88 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v78;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v78 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v77 + 1) + 8 * i);
        v13 = [v12 generateDictionary];
        v14 = [v12 name];
        [v6 setObject:v13 forKeyedSubscript:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v77 objects:v88 count:16];
    }
    while (v9);
  }

  if ([v6 count]) {
    [v3 setObject:v6 forKeyedSubscript:@"Units"];
  }
  v60 = v3;
  v15 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  v16 = [(HAPMetadata *)self hapProperties];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v73 objects:v87 count:16];
  v63 = v6;
  v61 = v15;
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v74;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v74 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = *(void **)(*((void *)&v73 + 1) + 8 * j);
        v22 = [v21 generateDictionary];
        if (v22)
        {
          uint64_t v23 = [v21 propertyType];
          [v15 setObject:v22 forKeyedSubscript:v23];
        }
        else
        {
          v24 = (void *)MEMORY[0x1D944E080]();
          v25 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v26 = HMFGetLogIdentifier();
            v27 = [v21 propertyType];
            *(_DWORD *)buf = 138543618;
            v84 = v26;
            __int16 v85 = 2112;
            v86 = v27;
            _os_log_impl(&dword_1D4758000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to generate dictionary for HAP property %@", buf, 0x16u);

            v15 = v61;
          }
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v73 objects:v87 count:16];
    }
    while (v18);
  }

  if ([v15 count]) {
    [v60 setObject:v15 forKeyedSubscript:@"Properties"];
  }
  v28 = [(HAPMetadata *)self hapSupportsAuthDataSet];
  v29 = [(HAPMetadata *)self generateHAPMetadataTuplesDictionary:v28];

  if ([v29 count]) {
    [v60 setObject:v29 forKeyedSubscript:@"SupportsAuthorizationData"];
  }
  v30 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v29);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  v31 = [(HAPMetadata *)self hapCharacteristics];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v69 objects:v82 count:16];
  v62 = v30;
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v70;
    do
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v70 != v34) {
          objc_enumerationMutation(v31);
        }
        v36 = *(void **)(*((void *)&v69 + 1) + 8 * k);
        v37 = [(HAPMetadata *)self hapBaseUUIDSuffix];
        v38 = [v36 generateDictionary:v37];

        if (v38)
        {
          v39 = [v36 name];
          [v30 setObject:v38 forKeyedSubscript:v39];
        }
        else
        {
          v40 = (void *)MEMORY[0x1D944E080]();
          v41 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            v42 = HMFGetLogIdentifier();
            v43 = [v36 name];
            *(_DWORD *)buf = 138543618;
            v84 = v42;
            __int16 v85 = 2112;
            v86 = v43;
            _os_log_impl(&dword_1D4758000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to generate dictionary for HAP characteristic %@", buf, 0x16u);
          }
          v30 = v62;
        }
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v69 objects:v82 count:16];
    }
    while (v33);
  }

  if ([v30 count]) {
    [v60 setObject:v30 forKeyedSubscript:@"Characteristics"];
  }
  v44 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  obuint64_t j = [(HAPMetadata *)self hapServices];
  uint64_t v45 = [obj countByEnumeratingWithState:&v65 objects:v81 count:16];
  v46 = v63;
  if (v45)
  {
    uint64_t v47 = v45;
    uint64_t v48 = *(void *)v66;
    do
    {
      for (uint64_t m = 0; m != v47; ++m)
      {
        if (*(void *)v66 != v48) {
          objc_enumerationMutation(obj);
        }
        v50 = *(void **)(*((void *)&v65 + 1) + 8 * m);
        v51 = [(HAPMetadata *)self hapBaseUUIDSuffix];
        v52 = [v50 generateDictionary:v51 metadata:self];

        if (v52)
        {
          v53 = [v50 name];
          [v44 setObject:v52 forKeyedSubscript:v53];
        }
        else
        {
          v54 = (void *)MEMORY[0x1D944E080]();
          v55 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            v56 = HMFGetLogIdentifier();
            v57 = [v50 name];
            *(_DWORD *)buf = 138543618;
            v84 = v56;
            __int16 v85 = 2112;
            v86 = v57;
            _os_log_impl(&dword_1D4758000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to generate dictionary for HAP service %@", buf, 0x16u);
          }
          v46 = v63;
        }
      }
      uint64_t v47 = [obj countByEnumeratingWithState:&v65 objects:v81 count:16];
    }
    while (v47);
  }

  if ([v44 count]) {
    [v60 setObject:v44 forKeyedSubscript:@"Services"];
  }

  return v60;
}

- (BOOL)updateRawPlist
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = [(HAPMetadata *)self generateDictionary];
  if (v3)
  {
    objc_storeStrong((id *)&self->_rawPlist, v3);
  }
  else
  {
    id v4 = (void *)MEMORY[0x1D944E080]();
    v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = HMFGetLogIdentifier();
      int v8 = 138543362;
      uint64_t v9 = v6;
      _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate plist.", (uint8_t *)&v8, 0xCu);
    }
  }

  return v3 != 0;
}

- (HAPMetadata)initWithServices:(id)a3 characteristics:(id)a4 units:(id)a5 properties:(id)a6 addAuthDataTuples:(id)a7 hapBaseUUIDSuffix:(id)a8
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (![v13 count]
    || ![v14 count]
    || ![v15 count]
    || ![v16 count]
    || ![v17 count])
  {
    goto LABEL_44;
  }
  v113.receiver = self;
  v113.super_class = (Class)HAPMetadata;
  v92 = [(HAPMetadata *)&v113 init];
  if (!v92)
  {
    self = 0;
LABEL_44:
    v92 = 0;
    goto LABEL_45;
  }
  v81 = v18;
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
  self = (HAPMetadata *)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id v84 = v14;
  id v19 = v14;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v109 objects:v118 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v110;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v110 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v109 + 1) + 8 * i);
        v25 = [v24 uuidStr];
        [(HAPMetadata *)self setObject:v24 forKey:v25];

        v26 = [v24 uuidStr];
        v27 = [v24 name];
        [v90 setObject:v26 forKey:v27];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v109 objects:v118 count:16];
    }
    while (v21);
  }

  uint64_t v28 = [(HAPMetadata *)self copy];
  hapCharacteristicMap = v92->_hapCharacteristicMap;
  v92->_hapCharacteristicMap = (NSDictionary *)v28;

  uint64_t v30 = [v90 copy];
  hapCharacteristicNameTypeMap = v92->_hapCharacteristicNameTypeMap;
  v92->_hapCharacteristicNameTypeMap = (NSDictionary *)v30;

  uint64_t v89 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
  v88 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id v32 = v13;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v105 objects:v117 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v106;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v106 != v35) {
          objc_enumerationMutation(v32);
        }
        v37 = *(void **)(*((void *)&v105 + 1) + 8 * j);
        v38 = [v37 uuidStr];
        [v89 setObject:v37 forKey:v38];

        v39 = [v37 uuidStr];
        v40 = [v37 name];
        [v88 setObject:v39 forKey:v40];
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v105 objects:v117 count:16];
    }
    while (v34);
  }

  uint64_t v41 = [v89 copy];
  hapServiceMap = v92->_hapServiceMap;
  v92->_hapServiceMap = (NSDictionary *)v41;

  uint64_t v43 = [v88 copy];
  hapServiceNameTypeMap = v92->_hapServiceNameTypeMap;
  v92->_hapServiceNameTypeMap = (NSDictionary *)v43;

  v87 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id v45 = v15;
  uint64_t v46 = [v45 countByEnumeratingWithState:&v101 objects:v116 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v102;
    do
    {
      for (uint64_t k = 0; k != v47; ++k)
      {
        if (*(void *)v102 != v48) {
          objc_enumerationMutation(v45);
        }
        v50 = *(void **)(*((void *)&v101 + 1) + 8 * k);
        v51 = [v50 name];
        [v87 setObject:v50 forKey:v51];
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v101 objects:v116 count:16];
    }
    while (v47);
  }
  v83 = v16;
  id v85 = v13;

  uint64_t v52 = [v87 copy];
  hapUnitMap = v92->_hapUnitMap;
  v92->_hapUnitMap = (NSDictionary *)v52;

  v86 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v17, "count"));
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v82 = v17;
  id v54 = v17;
  uint64_t v55 = [v54 countByEnumeratingWithState:&v97 objects:v115 count:16];
  if (v55)
  {
    uint64_t v56 = v55;
    uint64_t v57 = *(void *)v98;
    do
    {
      for (uint64_t m = 0; m != v56; ++m)
      {
        if (*(void *)v98 != v57) {
          objc_enumerationMutation(v54);
        }
        v59 = *(void **)(*((void *)&v97 + 1) + 8 * m);
        v60 = [HAPMetadataTuple alloc];
        v61 = [v59 characteristicType];
        v62 = [(HAPMetadata *)v92 characteristicTypeFromUTI:v61];
        v63 = [v59 serviceType];
        v64 = [(HAPMetadata *)v92 serviceTypeFromUTI:v63];
        long long v65 = [(HAPMetadataTuple *)v60 initWithCharacteristicType:v62 serviceType:v64];

        [v86 addObject:v65];
      }
      uint64_t v56 = [v54 countByEnumeratingWithState:&v97 objects:v115 count:16];
    }
    while (v56);
  }

  uint64_t v66 = [v86 copy];
  hapSupportsAuthDataSet = v92->_hapSupportsAuthDataSet;
  v92->_hapSupportsAuthDataSet = (NSSet *)v66;

  id v16 = v83;
  long long v68 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v83, "count"));
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v69 = v83;
  uint64_t v70 = [v69 countByEnumeratingWithState:&v93 objects:v114 count:16];
  id v17 = v82;
  if (v70)
  {
    uint64_t v71 = v70;
    uint64_t v72 = *(void *)v94;
    do
    {
      for (uint64_t n = 0; n != v71; ++n)
      {
        if (*(void *)v94 != v72) {
          objc_enumerationMutation(v69);
        }
        long long v74 = *(void **)(*((void *)&v93 + 1) + 8 * n);
        long long v75 = [v74 propertyType];
        [v68 setObject:v74 forKey:v75];
      }
      uint64_t v71 = [v69 countByEnumeratingWithState:&v93 objects:v114 count:16];
    }
    while (v71);
  }

  uint64_t v76 = [v68 copy];
  hapPropertyMap = v92->_hapPropertyMap;
  v92->_hapPropertyMap = (NSDictionary *)v76;

  id v18 = v81;
  uint64_t v78 = [v81 copy];
  hapBaseUUIDSuffix = v92->_hapBaseUUIDSuffix;
  v92->_hapBaseUUIDSuffix = (NSString *)v78;

  [(HAPMetadata *)v92 updateRawPlist];
  id v14 = v84;
  id v13 = v85;
LABEL_45:

  return v92;
}

- (NSArray)hapSupportsAuthDataTuples
{
  v2 = [(HAPMetadata *)self hapSupportsAuthDataSet];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (NSArray)hapProperties
{
  v2 = [(HAPMetadata *)self hapPropertyMap];
  v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (NSArray)hapValueUnits
{
  v2 = [(HAPMetadata *)self hapUnitMap];
  v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (id)hapUnitFromName:(id)a3
{
  id v4 = a3;
  v5 = [(HAPMetadata *)self hapUnitMap];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)hapServiceFromName:(id)a3
{
  id v4 = a3;
  v5 = [(HAPMetadata *)self hapServiceMap];
  id v6 = [(HAPMetadata *)self hapServiceNameTypeMap];
  uint64_t v7 = [v6 objectForKeyedSubscript:v4];

  int v8 = [v5 objectForKeyedSubscript:v7];

  return v8;
}

- (id)hapCharacteristicFromName:(id)a3
{
  id v4 = a3;
  v5 = [(HAPMetadata *)self hapCharacteristicMap];
  id v6 = [(HAPMetadata *)self hapCharacteristicNameTypeMap];
  uint64_t v7 = [v6 objectForKeyedSubscript:v4];

  int v8 = [v5 objectForKeyedSubscript:v7];

  return v8;
}

- (id)characteristicTypesChangingTargetState
{
  if (characteristicTypesChangingTargetState_onceToken != -1) {
    dispatch_once(&characteristicTypesChangingTargetState_onceToken, &__block_literal_global_16617);
  }
  v2 = (void *)characteristicTypesChangingTargetState_characteristicTypes;

  return v2;
}

void __53__HAPMetadata_characteristicTypesChangingTargetState__block_invoke()
{
  v0 = (void *)characteristicTypesChangingTargetState_characteristicTypes;
  characteristicTypesChangingTargetState_characteristicTypes = (uint64_t)&unk_1F2C80E98;
}

- (id)getDefaultServiceProperties:(id)a3
{
  v3 = [(HAPMetadata *)self hapServiceFromType:a3];
  id v4 = [v3 properties];

  return v4;
}

- (BOOL)supportsAdditionalAuthorizationData:(id)a3 forService:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [[HAPMetadataTuple alloc] initWithCharacteristicType:v7 serviceType:v6];

  uint64_t v9 = [(HAPMetadata *)self hapSupportsAuthDataSet];
  LOBYTE(self) = [v9 containsObject:v8];

  return (char)self;
}

- (id)serviceTypeToBTLE:(id)a3
{
  id v4 = a3;
  v5 = [(HAPMetadata *)self hapServiceFromType:v4];
  id v6 = [v5 btleuuidStr];

  if (v6)
  {
    id v7 = [v5 btleuuidStr];
  }
  else
  {
    id v7 = v4;
  }
  int v8 = v7;

  return v8;
}

- (id)btleToServiceType:(id)a3
{
  id v4 = a3;
  if ([v4 hasSuffix:@"-0000-1000-8000-00805F9B34FB"])
  {
    uint64_t v5 = [v4 length];
    if (v5 == [@"00000000-0000-1000-8000-00805F9B34FB" length])
    {
      id v6 = objc_msgSend(v4, "substringWithRange:", 4, 4);
      id v7 = v6;
      if (v6)
      {
        id v8 = v6;

        id v4 = v8;
      }
    }
  }
  uint64_t v9 = [(HAPMetadata *)self hapServiceMap];
  uint64_t v10 = [v9 allValues];
  char v11 = objc_msgSend(v10, "hmf_firstObjectWithValue:forKeyPath:", v4, @"btleuuidStr");

  v12 = [v11 uuidStr];

  return v12;
}

- (id)characteristicValueUnitOfType:(id)a3
{
  v3 = [(HAPMetadata *)self hapCharacteristicFromType:a3];
  id v4 = [v3 units];

  return v4;
}

- (BOOL)isMandatoryCharacteristic:(id)a3 forService:(id)a4
{
  id v6 = a3;
  id v7 = [(HAPMetadata *)self hapServiceFromType:a4];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 mandatoryCharacteristics];
    char v10 = [v9 containsObject:v6];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)descriptionFromCharacteristicType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPMetadata *)self hapCharacteristicFromType:v4];
  id v6 = [v5 chrDescription];
  if (!v6) {
    id v6 = v4;
  }

  return v6;
}

- (id)descriptionFromServiceType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPMetadata *)self hapServiceFromType:v4];
  id v6 = [v5 svcDescription];
  if (!v6) {
    id v6 = v4;
  }

  return v6;
}

- (BOOL)allowAssociatedService:(id)a3
{
  v3 = [(HAPMetadata *)self hapServiceFromType:a3];
  char v4 = [v3 allowAssociatedService];

  return v4;
}

- (BOOL)isStandardHAPUnitName:(id)a3
{
  v3 = [(HAPMetadata *)self hapUnitFromName:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isStandardHAPCharacteristicName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPMetadata *)self hapCharacteristicNameTypeMap];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6 != 0;
}

- (BOOL)isStandardHAPServiceName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPMetadata *)self hapServiceNameTypeMap];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6 != 0;
}

- (id)characteristicTypeFromUTI:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPMetadata *)self hapCharacteristicNameTypeMap];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)serviceTypeFromUTI:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPMetadata *)self hapServiceNameTypeMap];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (BOOL)parseMetadata:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "hmf_stringForKey:", @"Base UUID");
  id v6 = v5;
  if (!v5)
  {
    id v17 = (void *)MEMORY[0x1D944E080]();
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v47 = v19;
      uint64_t v20 = "%{public}@Failed to parse HAP base UUID suffix";
      uint64_t v21 = v18;
      uint32_t v22 = 12;
LABEL_13:
      _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_ERROR, v20, buf, v22);
    }
LABEL_14:

    BOOL v16 = 0;
    goto LABEL_35;
  }
  uint64_t v7 = [v5 length];
  if (v7 != kMetadataBaseUUIDSuffixLength)
  {
    id v17 = (void *)MEMORY[0x1D944E080]();
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v47 = v19;
      __int16 v48 = 2048;
      uint64_t v49 = [v6 length];
      __int16 v50 = 2048;
      uint64_t v51 = kMetadataBaseUUIDSuffixLength;
      uint64_t v20 = "%{public}@Base UUID suffix length is %lu, should be %lu";
      uint64_t v21 = v18;
      uint32_t v22 = 32;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  [(HAPMetadata *)self setHapBaseUUIDSuffix:v6];
  id v8 = objc_msgSend(v4, "hmf_dictionaryForKey:", @"Units");
  uint64_t v9 = [(HAPMetadata *)self parseUnits:v8];
  if (v9)
  {
    [(HAPMetadata *)self setHapUnitMap:v9];
    char v10 = objc_msgSend(v4, "hmf_dictionaryForKey:", @"Properties");
    char v11 = [(HAPMetadata *)self parseProperties:v10];
    if (v11)
    {
      [(HAPMetadata *)self setHapPropertyMap:v11];
      v12 = objc_msgSend(v4, "hmf_dictionaryForKey:", @"Characteristics");
      id v13 = [(HAPMetadata *)self parseCharacteristics:v12];
      if (v13)
      {
        [(HAPMetadata *)self setHapCharacteristicMap:v13];
        v44 = objc_msgSend(v4, "hmf_dictionaryForKey:", @"Services");
        uint64_t v14 = -[HAPMetadata parseServices:](self, "parseServices:");
        uint64_t v43 = (void *)v14;
        if (v14)
        {
          uint64_t v41 = v12;
          [(HAPMetadata *)self setHapServiceMap:v14];
          v40 = objc_msgSend(v4, "hmf_dictionaryForKey:", @"SupportsAuthorizationData");
          id v15 = -[HAPMetadata parseCharacteristicServiceTuples:](self, "parseCharacteristicServiceTuples:");
          BOOL v16 = v15 != 0;
          if (v15)
          {
            [(HAPMetadata *)self setHapSupportsAuthDataSet:v15];
          }
          else
          {
            context = (void *)MEMORY[0x1D944E080]();
            v36 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              v38 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              uint64_t v47 = v38;
              __int16 v48 = 2112;
              uint64_t v49 = (uint64_t)v40;
              _os_log_impl(&dword_1D4758000, v36, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP addAuthData tuples: %@", buf, 0x16u);
            }
          }

          v12 = v41;
        }
        else
        {
          uint64_t v33 = (void *)MEMORY[0x1D944E080]();
          uint64_t v34 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            uint64_t v35 = v42 = v12;
            *(_DWORD *)buf = 138543618;
            uint64_t v47 = v35;
            __int16 v48 = 2112;
            uint64_t v49 = (uint64_t)v44;
            _os_log_impl(&dword_1D4758000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP services: %@", buf, 0x16u);

            v12 = v42;
          }

          BOOL v16 = 0;
        }
      }
      else
      {
        v29 = (void *)MEMORY[0x1D944E080]();
        uint64_t v30 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          id v45 = v29;
          id v32 = v31 = v12;
          *(_DWORD *)buf = 138543618;
          uint64_t v47 = v32;
          __int16 v48 = 2112;
          uint64_t v49 = (uint64_t)v31;
          _os_log_impl(&dword_1D4758000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP characteristics: %@", buf, 0x16u);

          v12 = v31;
          v29 = v45;
        }

        BOOL v16 = 0;
      }
    }
    else
    {
      v26 = (void *)MEMORY[0x1D944E080]();
      v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v47 = v28;
        __int16 v48 = 2112;
        uint64_t v49 = (uint64_t)v10;
        _os_log_impl(&dword_1D4758000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP properties: %@", buf, 0x16u);
      }
      BOOL v16 = 0;
    }
  }
  else
  {
    uint64_t v23 = (void *)MEMORY[0x1D944E080]();
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v47 = v25;
      __int16 v48 = 2112;
      uint64_t v49 = (uint64_t)v8;
      _os_log_impl(&dword_1D4758000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP units: %@", buf, 0x16u);
    }
    BOOL v16 = 0;
  }

LABEL_35:
  return v16;
}

- (id)parseCharacteristicServiceTuples:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v4, "count"));
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v46 objects:v57 count:16];
  if (!v7)
  {
LABEL_18:

    v26 = (void *)[v5 copy];
    goto LABEL_27;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v47;
LABEL_3:
  uint64_t v10 = 0;
LABEL_4:
  if (*(void *)v47 != v9) {
    objc_enumerationMutation(v6);
  }
  uint64_t v11 = *(void *)(*((void *)&v46 + 1) + 8 * v10);
  uint64_t v12 = [(HAPMetadata *)self characteristicTypeFromUTI:v11];
  if (v12)
  {
    id v13 = (void *)v12;
    uint64_t v40 = v11;
    uint64_t v14 = objc_msgSend(v6, "hmf_arrayForKey:", v11);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v42 objects:v56 count:16];
    if (!v16) {
      goto LABEL_16;
    }
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v43;
    id v41 = v6;
    uint64_t v38 = v8;
    uint64_t v39 = v9;
    uint64_t v37 = v10;
LABEL_9:
    uint64_t v19 = 0;
    while (1)
    {
      uint64_t v20 = v5;
      if (*(void *)v43 != v18) {
        objc_enumerationMutation(v15);
      }
      uint64_t v21 = *(void *)(*((void *)&v42 + 1) + 8 * v19);
      uint64_t v22 = [(HAPMetadata *)self serviceTypeFromUTI:v21];
      if (!v22) {
        break;
      }
      uint64_t v23 = (void *)v22;
      v24 = [[HAPMetadataTuple alloc] initWithCharacteristicType:v13 serviceType:v22];
      if (!v24)
      {
        uint64_t v30 = (void *)MEMORY[0x1D944E080]();
        v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          id v32 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          uint64_t v51 = v32;
          __int16 v52 = 2112;
          uint64_t v53 = v40;
          __int16 v54 = 2112;
          uint64_t v55 = v21;
          _os_log_impl(&dword_1D4758000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP metadata tuple %@,%@", buf, 0x20u);
        }

LABEL_25:
        id v6 = v41;

        uint64_t v5 = v20;
        goto LABEL_26;
      }
      v25 = v24;
      uint64_t v5 = v20;
      [v20 addObject:v24];

      if (v17 == ++v19)
      {
        uint64_t v17 = [v15 countByEnumeratingWithState:&v42 objects:v56 count:16];
        id v6 = v41;
        uint64_t v8 = v38;
        uint64_t v9 = v39;
        uint64_t v10 = v37;
        if (v17) {
          goto LABEL_9;
        }
LABEL_16:

        if (++v10 == v8)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v46 objects:v57 count:16];
          if (!v8) {
            goto LABEL_18;
          }
          goto LABEL_3;
        }
        goto LABEL_4;
      }
    }
    v27 = (void *)MEMORY[0x1D944E080]();
    uint64_t v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v51 = v29;
      __int16 v52 = 2112;
      uint64_t v53 = v21;
      _os_log_impl(&dword_1D4758000, v28, OS_LOG_TYPE_ERROR, "%{public}@Unknown service '%@' while parsing tuple", buf, 0x16u);
    }
    goto LABEL_25;
  }
  uint64_t v34 = (void *)MEMORY[0x1D944E080]();
  uint64_t v35 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    v36 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v51 = v36;
    __int16 v52 = 2112;
    uint64_t v53 = v11;
    _os_log_impl(&dword_1D4758000, v35, OS_LOG_TYPE_ERROR, "%{public}@Unknown characteristic '%@' while parsing tuple", buf, 0x16u);
  }
LABEL_26:

  v26 = 0;
LABEL_27:

  return v26;
}

- (id)parseServices:(id)a3
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HAPMetadata *)self hapCharacteristicMap];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v9 = v4;
    uint64_t v74 = [v9 countByEnumeratingWithState:&v83 objects:v95 count:16];
    if (v74)
    {
      uint64_t v75 = *(void *)v84;
      *(void *)&long long v10 = 138543874;
      long long v69 = v10;
      uint64_t v72 = v7;
      id v73 = v9;
      uint64_t v76 = self;
      id v70 = v4;
      uint64_t v71 = v8;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v84 != v75) {
          objc_enumerationMutation(v9);
        }
        uint64_t v82 = *(void *)(*((void *)&v83 + 1) + 8 * v11);
        uint64_t v12 = objc_msgSend(v9, "hmf_dictionaryForKey:", v69);
        id v13 = objc_msgSend(v12, "hmf_stringForKey:", @"ShortUUID");
        uint64_t v14 = [v13 length];
        if (v14 != kMetadataShortUUIDLength)
        {
          v62 = (void *)MEMORY[0x1D944E080]();
          v63 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            v64 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138544130;
            v88 = v64;
            __int16 v89 = 2112;
            uint64_t v90 = v82;
            __int16 v91 = 2112;
            v92 = v13;
            __int16 v93 = 2048;
            uint64_t v94 = kMetadataShortUUIDLength;
            long long v65 = "%{public}@service %@: UUID '%@' length needs to be %lu";
            uint64_t v66 = v63;
            uint32_t v67 = 42;
            goto LABEL_48;
          }
LABEL_49:

LABEL_50:

          uint64_t v58 = 0;
          id v4 = v70;
          uint64_t v8 = v71;
          uint64_t v7 = v72;
          goto LABEL_51;
        }
        id v15 = [(HAPMetadata *)self parsedUUIDs];
        int v16 = [v15 containsObject:v13];

        if (v16)
        {
          v62 = (void *)MEMORY[0x1D944E080]();
          v63 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            v64 = HMFGetLogIdentifier();
            *(_DWORD *)buf = v69;
            v88 = v64;
            __int16 v89 = 2112;
            uint64_t v90 = v82;
            __int16 v91 = 2112;
            v92 = v13;
            long long v65 = "%{public}@service %@: UUID %@ is already defined in the metadata";
            uint64_t v66 = v63;
            uint32_t v67 = 32;
LABEL_48:
            _os_log_impl(&dword_1D4758000, v66, OS_LOG_TYPE_ERROR, v65, buf, v67);
          }
          goto LABEL_49;
        }
        uint64_t v17 = [(HAPMetadata *)self parsedUUIDs];
        [v17 addObject:v13];

        uint64_t v18 = objc_msgSend(v12, "hmf_stringForKey:", @"DefaultDescription");
        uint64_t v19 = objc_msgSend(v12, "hmf_dictionaryForKey:", @"Characteristics");
        uint64_t v20 = objc_msgSend(v19, "hmf_arrayForKey:", @"Required");
        uint64_t v21 = [(HAPMetadata *)self parseServiceCharacteristics:v20];

        long long v80 = v13;
        v81 = v21;
        if (![v21 count])
        {
          id v40 = v9;
          id v41 = (void *)v18;
          long long v42 = (void *)MEMORY[0x1D944E080]();
          long long v43 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            long long v44 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v88 = v44;
            __int16 v89 = 2112;
            uint64_t v90 = v82;
            _os_log_impl(&dword_1D4758000, v43, OS_LOG_TYPE_ERROR, "%{public}@service %@: No mandatory characteristics", buf, 0x16u);

            self = v76;
          }

          int v45 = 1;
          long long v46 = v41;
          id v9 = v40;
          v31 = v19;
          long long v47 = v21;
          goto LABEL_37;
        }
        uint64_t v22 = objc_msgSend(v12, "hmf_numberForKey:", @"ServiceProperties");
        uint64_t v23 = objc_msgSend(v12, "hmf_arrayForKey:", @"LinkedServices");
        v24 = [(HAPMetadata *)self hapBaseUUIDSuffix];
        v25 = [v13 stringByAppendingString:v24];
        objc_msgSend(v25, "hmf_stringWithSmallestEncoding");
        uint64_t v27 = v26 = v21;

        uint64_t v28 = (void *)v27;
        uint64_t v78 = (void *)v22;
        long long v79 = (void *)v18;
        long long v77 = (void *)v23;
        v29 = [[HAPMetadataService alloc] initWithName:v82 uuid:v27 description:v18 mandatoryChrTypes:v26 properties:v22 linkedServices:v23];
        if (v29) {
          break;
        }
        int v45 = 1;
        self = v76;
        id v9 = v73;
        v31 = v19;
        uint64_t v38 = v28;
LABEL_36:

        long long v47 = v81;
        long long v46 = v79;
LABEL_37:

        if (v45) {
          goto LABEL_50;
        }
        if (v74 == ++v11)
        {
          id v4 = v70;
          uint64_t v8 = v71;
          uint64_t v7 = v72;
          uint64_t v74 = [v9 countByEnumeratingWithState:&v83 objects:v95 count:16];
          if (v74) {
            goto LABEL_4;
          }
          goto LABEL_40;
        }
      }
      uint64_t v30 = objc_msgSend(v12, "hmf_stringForKey:", @"BTLE_ShortUUID");
      v31 = v19;
      id v32 = v30;
      if (v30)
      {
        uint64_t v33 = [v30 length];
        if (v33 != kMetadataBTLEUUIDLength)
        {
          v36 = (void *)MEMORY[0x1D944E080]();
          uint64_t v37 = HMFGetOSLogHandle();
          uint64_t v38 = v28;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            long long v48 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138544130;
            v88 = v48;
            __int16 v89 = 2112;
            uint64_t v90 = v82;
            __int16 v91 = 2112;
            v92 = v32;
            __int16 v93 = 2048;
            uint64_t v94 = kMetadataBTLEUUIDLength;
            _os_log_impl(&dword_1D4758000, v37, OS_LOG_TYPE_ERROR, "%{public}@service %@: BTLE UUID '%@' length needs to be %lu", buf, 0x2Au);
          }
          goto LABEL_22;
        }
        uint64_t v34 = [(HAPMetadata *)v76 parsedUUIDs];
        int v35 = [v34 containsObject:v32];

        if (v35)
        {
          v36 = (void *)MEMORY[0x1D944E080]();
          uint64_t v37 = HMFGetOSLogHandle();
          uint64_t v38 = v28;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            uint64_t v39 = HMFGetLogIdentifier();
            *(_DWORD *)buf = v69;
            v88 = v39;
            __int16 v89 = 2112;
            uint64_t v90 = v82;
            __int16 v91 = 2112;
            v92 = v32;
            _os_log_impl(&dword_1D4758000, v37, OS_LOG_TYPE_ERROR, "%{public}@service %@: BTLE UUID %@ is already defined in the metadata", buf, 0x20u);
          }
LABEL_22:

          int v45 = 1;
          id v9 = v73;
LABEL_35:

          self = v76;
          goto LABEL_36;
        }
        long long v49 = [(HAPMetadata *)v76 parsedUUIDs];
        [v49 addObject:v32];

        [(HAPMetadataService *)v29 setBtleuuidStr:v32];
      }
      __int16 v50 = objc_msgSend(v31, "hmf_arrayForKey:", @"Optional");
      uint64_t v51 = [(HAPMetadata *)v76 parseServiceCharacteristics:v50];

      uint64_t v38 = v28;
      if (v51)
      {
        if ([v51 count]) {
          [(HAPMetadataService *)v29 setOptionalCharacteristics:v51];
        }
        buf[0] = 0;
        unsigned int v52 = objc_msgSend(v12, "hmf_BOOLForKey:isPresent:", @"AllowAssociatedService", buf);
        if (buf[0]) {
          uint64_t v53 = v52;
        }
        else {
          uint64_t v53 = 0;
        }
        [(HAPMetadataService *)v29 setAllowAssociatedService:v53];
        [v72 setObject:v29 forKey:v28];
        [v71 setObject:v28 forKey:v82];
        int v45 = 0;
      }
      else
      {
        __int16 v54 = (void *)MEMORY[0x1D944E080]();
        uint64_t v55 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          uint64_t v56 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v88 = v56;
          __int16 v89 = 2112;
          uint64_t v90 = v82;
          _os_log_impl(&dword_1D4758000, v55, OS_LOG_TYPE_ERROR, "%{public}@service %@: Error parsing optional characteristics", buf, 0x16u);
        }
        int v45 = 1;
      }
      id v9 = v73;

      goto LABEL_35;
    }
LABEL_40:

    uint64_t v57 = (void *)[v8 copy];
    [(HAPMetadata *)self setHapServiceNameTypeMap:v57];

    uint64_t v58 = (void *)[v7 copy];
LABEL_51:
  }
  else
  {
    v59 = (void *)MEMORY[0x1D944E080]();
    v60 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      v61 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v88 = v61;
      _os_log_impl(&dword_1D4758000, v60, OS_LOG_TYPE_ERROR, "%{public}@No HAP characteristics", buf, 0xCu);
    }
    uint64_t v58 = 0;
  }

  return v58;
}

- (id)parseServiceCharacteristics:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v4, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v12 = -[HAPMetadata characteristicTypeFromUTI:](self, "characteristicTypeFromUTI:", v11, (void)v19);
        if (!v12)
        {
          id v15 = (void *)MEMORY[0x1D944E080]();
          int v16 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            uint64_t v17 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v24 = v17;
            __int16 v25 = 2112;
            uint64_t v26 = v11;
            _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_ERROR, "%{public}@Undefined characteristic %@ referenced", buf, 0x16u);
          }

          uint64_t v14 = 0;
          goto LABEL_13;
        }
        id v13 = (void *)v12;
        [v5 addObject:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  uint64_t v14 = (void *)[v5 copy];
LABEL_13:

  return v14;
}

- (id)parseCharacteristics:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v7 = v4;
  uint64_t v49 = [v7 countByEnumeratingWithState:&v53 objects:v65 count:16];
  if (v49)
  {
    uint64_t v50 = *(void *)v54;
    *(void *)&long long v8 = 138544130;
    long long v42 = v8;
    int v45 = v6;
    long long v46 = v5;
    long long v47 = self;
    long long v48 = v7;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v54 != v50) {
        objc_enumerationMutation(v7);
      }
      uint64_t v10 = *(void *)(*((void *)&v53 + 1) + 8 * v9);
      uint64_t v11 = objc_msgSend(v7, "hmf_dictionaryForKey:", v10, v42);
      uint64_t v12 = objc_msgSend(v11, "hmf_stringForKey:", @"ShortUUID");
      uint64_t v13 = [v12 length];
      if (v13 != kMetadataShortUUIDLength) {
        break;
      }
      uint64_t v14 = [(HAPMetadata *)self parsedUUIDs];
      int v15 = [v14 containsObject:v12];

      if (v15)
      {
        int v35 = (void *)MEMORY[0x1D944E080]();
        v36 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          uint64_t v37 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          uint64_t v58 = v37;
          __int16 v59 = 2112;
          uint64_t v60 = v10;
          __int16 v61 = 2112;
          v62 = v12;
          uint64_t v38 = "%{public}@characteristic %@: UUID %@ is already defined in the metadata";
          uint64_t v39 = v36;
          uint32_t v40 = 32;
LABEL_23:
          _os_log_impl(&dword_1D4758000, v39, OS_LOG_TYPE_ERROR, v38, buf, v40);
        }
        goto LABEL_24;
      }
      int v16 = [(HAPMetadata *)self parsedUUIDs];
      [v16 addObject:v12];

      uint64_t v17 = objc_msgSend(v11, "hmf_stringForKey:", @"DefaultDescription");
      uint64_t v18 = objc_msgSend(v11, "hmf_stringForKey:", @"Format");
      objc_msgSend(v11, "hmf_numberForKey:", @"Properties");
      v20 = long long v19 = v12;
      long long v21 = [(HAPMetadata *)self hapBaseUUIDSuffix];
      uint64_t v51 = v19;
      long long v22 = [v19 stringByAppendingString:v21];
      uint64_t v23 = objc_msgSend(v22, "hmf_stringWithSmallestEncoding");

      v24 = [HAPMetadataCharacteristic alloc];
      unsigned int v52 = (void *)v18;
      uint64_t v25 = v18;
      uint64_t v26 = (void *)v20;
      uint64_t v27 = [(HAPMetadataCharacteristic *)v24 initWithName:v10 uuid:v23 description:v17 format:v25 properties:v20];
      uint64_t v28 = objc_msgSend(v11, "hmf_stringForKey:", @"Units");
      [(HAPMetadataCharacteristic *)v27 setUnits:v28];

      uint64_t v29 = [(HAPMetadata *)self parseCharacteristicValue:v11];
      uint64_t v30 = (void *)v29;
      if (v29) {
        uint64_t v29 = [(HAPMetadataCharacteristic *)v27 setValueMetadata:v29];
      }
      if (v27)
      {
        [v46 setObject:v27 forKey:v23];
        [v45 setObject:v23 forKey:v10];
        v31 = v51;
      }
      else
      {
        context = (void *)MEMORY[0x1D944E080](v29);
        id v32 = HMFGetOSLogHandle();
        v31 = v51;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          long long v43 = HMFGetLogIdentifier();
          *(_DWORD *)buf = v42;
          uint64_t v58 = v43;
          __int16 v59 = 2112;
          uint64_t v60 = v10;
          __int16 v61 = 2112;
          v62 = v51;
          __int16 v63 = 2112;
          uint64_t v64 = (uint64_t)v17;
          _os_log_impl(&dword_1D4758000, v32, OS_LOG_TYPE_ERROR, "%{public}@characteristic %@: Failed to parse - UUID %@  description %@", buf, 0x2Au);
        }
      }

      id v7 = v48;
      if (!v27) {
        goto LABEL_25;
      }
      ++v9;
      self = v47;
      if (v49 == v9)
      {
        id v6 = v45;
        uint64_t v5 = v46;
        uint64_t v49 = [v48 countByEnumeratingWithState:&v53 objects:v65 count:16];
        if (v49) {
          goto LABEL_3;
        }
        goto LABEL_18;
      }
    }
    int v35 = (void *)MEMORY[0x1D944E080]();
    v36 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      uint64_t v37 = HMFGetLogIdentifier();
      *(_DWORD *)buf = v42;
      uint64_t v58 = v37;
      __int16 v59 = 2112;
      uint64_t v60 = v10;
      __int16 v61 = 2112;
      v62 = v12;
      __int16 v63 = 2048;
      uint64_t v64 = kMetadataShortUUIDLength;
      uint64_t v38 = "%{public}@characteristic %@: UUID '%@' length needs to be %lu";
      uint64_t v39 = v36;
      uint32_t v40 = 42;
      goto LABEL_23;
    }
LABEL_24:

LABEL_25:

    uint64_t v34 = 0;
    id v6 = v45;
    uint64_t v5 = v46;
    goto LABEL_26;
  }
LABEL_18:

  uint64_t v33 = (void *)[v6 copy];
  [(HAPMetadata *)self setHapCharacteristicNameTypeMap:v33];

  uint64_t v34 = (void *)[v5 copy];
LABEL_26:

  return v34;
}

- (id)parseCharacteristicValue:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(v3, "hmf_numberForKey:", @"MinLength");
  uint64_t v5 = objc_msgSend(v3, "hmf_numberForKey:", @"MaxLength");
  if (v4 | v5) {
    id v6 = [[HAPMetadataCharacteristicValue alloc] initWithMinLength:v4 maxLength:v5];
  }
  else {
    id v6 = 0;
  }
  id v7 = objc_msgSend(v3, "hmf_numberForKey:", @"MinValue");
  long long v8 = objc_msgSend(v3, "hmf_numberForKey:", @"MaxValue");
  uint64_t v9 = objc_msgSend(v3, "hmf_numberForKey:", @"StepValue");
  uint64_t v10 = objc_msgSend(v3, "hmf_arrayForKey:", @"ValidValues");
  if (v7 || v8 || v9)
  {
    if (v6)
    {
      context = (void *)MEMORY[0x1D944E080]();
      uint64_t v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v15 = HMFGetLogIdentifier();
        objc_msgSend(v3, "hmf_stringForKey:", @"ShortUUID");
        *(_DWORD *)buf = 138544898;
        uint64_t v18 = v15;
        v20 = __int16 v19 = 2112;
        uint64_t v12 = (void *)v20;
        __int16 v21 = 2112;
        uint64_t v22 = v4;
        __int16 v23 = 2112;
        uint64_t v24 = v5;
        __int16 v25 = 2112;
        uint64_t v26 = v7;
        __int16 v27 = 2112;
        uint64_t v28 = v5;
        __int16 v29 = 2112;
        uint64_t v30 = v9;
        _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "%{public}@Characteristic %@ has both length and value metadata: minLength %@  maxLength %@  minValue %@  maxValue %@  stepValue %@", buf, 0x48u);
      }
    }
    uint64_t v13 = [[HAPMetadataCharacteristicValue alloc] initWithMinValue:v7 maxValue:v8 stepValue:v9 validValues:v10];

    id v6 = v13;
  }

  return v6;
}

- (id)parseProperties:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = v3;
  uint64_t v23 = [v5 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v23)
  {
    uint64_t v7 = *(void *)v25;
    *(void *)&long long v6 = 138544130;
    long long v20 = v6;
    id v21 = v5;
    uint64_t v22 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v5, "hmf_dictionaryForKey:", v9, v20);
        uint64_t v11 = objc_msgSend(v10, "hmf_numberForKey:", @"Position");
        uint64_t v12 = objc_msgSend(v10, "hmf_stringForKey:", @"DefaultDescription");
        uint64_t v13 = [[HAPMetadataProperty alloc] initWithType:v9 bitPosition:v11 description:v12];
        if (v13)
        {
          [v4 setObject:v13 forKey:v9];
        }
        else
        {
          uint64_t v14 = (void *)MEMORY[0x1D944E080]();
          int v15 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            uint64_t v17 = v16 = v4;
            *(_DWORD *)buf = v20;
            __int16 v29 = v17;
            __int16 v30 = 2112;
            uint64_t v31 = v9;
            __int16 v32 = 2112;
            uint64_t v33 = v11;
            __int16 v34 = 2112;
            int v35 = v12;
            _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP property %@  bitPosition %@ description %@", buf, 0x2Au);

            uint64_t v4 = v16;
            id v5 = v21;
          }

          uint64_t v7 = v22;
        }

        if (!v13)
        {

          uint64_t v18 = 0;
          goto LABEL_16;
        }
      }
      uint64_t v23 = [v5 countByEnumeratingWithState:&v24 objects:v36 count:16];
      if (v23) {
        continue;
      }
      break;
    }
  }

  uint64_t v18 = (void *)[v4 copy];
LABEL_16:

  return v18;
}

- (id)parseUnits:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v5, "hmf_dictionaryForKey:", v10, (void)v20);
        uint64_t v12 = objc_msgSend(v11, "hmf_stringForKey:", @"DefaultDescription");
        uint64_t v13 = [[HAPMetadataUnit alloc] initWithName:v10 description:v12];
        if (!v13)
        {
          int v16 = (void *)MEMORY[0x1D944E080]();
          uint64_t v17 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            uint64_t v18 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            long long v25 = v18;
            __int16 v26 = 2112;
            uint64_t v27 = v10;
            __int16 v28 = 2112;
            __int16 v29 = v12;
            _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP unit %@  description %@", buf, 0x20u);
          }

          int v15 = 0;
          goto LABEL_13;
        }
        uint64_t v14 = v13;
        [v4 setObject:v13 forKey:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v30 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  int v15 = (void *)[v4 copy];
LABEL_13:

  return v15;
}

- (BOOL)parseVersion:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "hmf_numberForKey:", @"Version");
  [(HAPMetadata *)self setVersion:v5];

  uint64_t v6 = objc_msgSend(v4, "hmf_numberForKey:", @"SchemaVersion");

  [(HAPMetadata *)self setSchemaVersion:v6];
  uint64_t v7 = [(HAPMetadata *)self version];
  if (v7)
  {
    uint64_t v8 = [(HAPMetadata *)self schemaVersion];
    BOOL v9 = v8 != 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (HAPMetadata)initWithDictionary:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)HAPMetadata;
  uint64_t v7 = [(HAPMetadata *)&v27 init];
  if (!v7) {
    goto LABEL_6;
  }
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  [(HAPMetadata *)v7 setParsedUUIDs:v8];

  if (![(HAPMetadata *)v7 parseVersion:v6])
  {
    uint64_t v14 = (void *)MEMORY[0x1D944E080]();
    int v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v29 = v16;
      _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse version information", buf, 0xCu);
    }
    if (!a4) {
      goto LABEL_21;
    }
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = 1001;
    goto LABEL_15;
  }
  BOOL v9 = [(HAPMetadata *)v7 schemaVersion];
  uint64_t v10 = [v9 unsignedIntegerValue];

  if (v10 != 1)
  {
    __int16 v19 = (void *)MEMORY[0x1D944E080]();
    long long v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      long long v21 = HMFGetLogIdentifier();
      long long v22 = [(HAPMetadata *)v7 schemaVersion];
      *(_DWORD *)buf = 138543874;
      __int16 v29 = v21;
      __int16 v30 = 2112;
      uint64_t v31 = v22;
      __int16 v32 = 2048;
      uint64_t v33 = 1;
      _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_ERROR, "%{public}@Newer schema version %@, current %lu", buf, 0x20u);
    }
    if (!a4) {
      goto LABEL_21;
    }
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = 1004;
LABEL_15:
    [v17 errorWithHMErrorCode:v18];
    uint64_t v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  objc_msgSend(v6, "hmf_dictionaryForKey:", @"HAP");
  uint64_t v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  if (![(HAPMetadata *)v7 parseMetadata:v11])
  {
    long long v23 = (void *)MEMORY[0x1D944E080]();
    long long v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      long long v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v29 = v25;
      _os_log_impl(&dword_1D4758000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP metadata", buf, 0xCu);
    }
    if (a4)
    {
      *a4 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:1001];
    }

LABEL_21:
    uint64_t v13 = 0;
    goto LABEL_22;
  }
  [(HAPMetadata *)v7 setParsedUUIDs:0];
  rawPlist = v7->_rawPlist;
  v7->_rawPlist = v11;

LABEL_6:
  uint64_t v13 = v7;
LABEL_22:

  return v13;
}

+ (id)shortenHAPType:(id)a3 baseUUIDSuffix:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 hasSuffix:v6])
  {
    objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "length") - objc_msgSend(v6, "length"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = v5;
  }
  uint64_t v8 = v7;

  return v8;
}

+ (void)setCurrentMetadataHook:(id)a3
{
  currentMetadataHoouint64_t k = MEMORY[0x1D944E2D0](a3, a2);

  MEMORY[0x1F41817F8]();
}

+ (id)currentMetadataHook
{
  v2 = (void *)MEMORY[0x1D944E2D0](currentMetadataHook, a2);

  return v2;
}

@end