@interface HMMatterCommand
+ (BOOL)supportsSecureCoding;
+ (id)allowedCommandFieldsClassesForShortcuts;
+ (id)allowedExpectedValuesClassesForShortcuts;
+ (id)commandWithProtoBuf:(id)a3 home:(id)a4;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKindOfAllowedCommandFieldsClass:(id)a3;
- (BOOL)isKindOfAllowedExpectedValuesClass:(id)a3;
- (HMAccessory)accessory;
- (HMMatterCommand)init;
- (HMMatterCommand)initWithCoder:(id)a3;
- (HMMatterCommand)initWithCommandID:(id)a3 endpointID:(id)a4 clusterID:(id)a5 accessory:(id)a6 commandFields:(id)a7 expectedValues:(id)a8;
- (HMMatterCommand)initWithDictionary:(id)a3 home:(id)a4;
- (NSArray)expectedValues;
- (NSDictionary)commandFields;
- (NSNumber)clusterID;
- (NSNumber)commandID;
- (NSNumber)endpointID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)encodeAsProtoBuf;
- (id)serializeForAdd;
- (void)_configureWithContext:(id)a3 home:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMMatterCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedValues, 0);
  objc_storeStrong((id *)&self->_commandFields, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_endpointID, 0);
  objc_storeStrong((id *)&self->_clusterID, 0);

  objc_storeStrong((id *)&self->_commandID, 0);
}

- (NSArray)expectedValues
{
  return self->_expectedValues;
}

- (NSDictionary)commandFields
{
  return self->_commandFields;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (NSNumber)endpointID
{
  return self->_endpointID;
}

- (NSNumber)clusterID
{
  return self->_clusterID;
}

- (NSNumber)commandID
{
  return self->_commandID;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMMatterCommand *)self commandID];
  v5 = [(HMMatterCommand *)self clusterID];
  v6 = [(HMMatterCommand *)self endpointID];
  v7 = [(HMMatterCommand *)self accessory];
  v8 = [(HMMatterCommand *)self commandFields];
  v9 = [(HMMatterCommand *)self expectedValues];
  v10 = [v3 stringWithFormat:@"commandID: %@, clusterID: %@, endpointID: %@, accessory: %@, commandFields: %@, expectedValues: %@", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v6 = +[HMMatterCommand allocWithZone:a3];
  v7 = [(HMMatterCommand *)self commandID];
  v8 = [(HMMatterCommand *)self endpointID];
  v9 = [(HMMatterCommand *)self clusterID];
  v10 = [(HMMatterCommand *)self accessory];
  v11 = [(HMMatterCommand *)self commandFields];
  v12 = [(HMMatterCommand *)self expectedValues];
  v13 = [(HMMatterCommand *)v6 initWithCommandID:v7 endpointID:v8 clusterID:v9 accessory:v10 commandFields:v11 expectedValues:v12];

  os_unfair_lock_unlock(p_lock);
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMMatterCommand *)a3;
  if (v4 == self)
  {
    char v16 = 1;
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
    v6 = v5;
    if (v6)
    {
      v7 = [(HMMatterCommand *)self commandID];
      v8 = [(HMMatterCommand *)v6 commandID];
      if (HMFEqualObjects())
      {
        v9 = [(HMMatterCommand *)self clusterID];
        v10 = [(HMMatterCommand *)v6 clusterID];
        if (HMFEqualObjects())
        {
          v11 = [(HMMatterCommand *)self endpointID];
          v12 = [(HMMatterCommand *)v6 endpointID];
          if (HMFEqualObjects())
          {
            uint64_t v13 = [(HMMatterCommand *)self accessory];
            v21 = [(HMMatterCommand *)v6 accessory];
            v22 = (void *)v13;
            if (HMFEqualObjects())
            {
              uint64_t v14 = [(HMMatterCommand *)self commandFields];
              [(HMMatterCommand *)v6 commandFields];
              v15 = v20 = (void *)v14;
              if (HMFEqualObjects())
              {
                v19 = [(HMMatterCommand *)self expectedValues];
                v18 = [(HMMatterCommand *)v6 expectedValues];
                char v16 = HMFEqualObjects();
              }
              else
              {
                char v16 = 0;
              }
            }
            else
            {
              char v16 = 0;
            }
          }
          else
          {
            char v16 = 0;
          }
        }
        else
        {
          char v16 = 0;
        }
      }
      else
      {
        char v16 = 0;
      }
    }
    else
    {
      char v16 = 0;
    }
  }
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (HMMatterCommand)initWithCoder:(id)a3
{
  v37[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)HMMatterCommand;
  v5 = [(HMMatterCommand *)&v31 init];
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMClusterIDCodingKey"];
  clusterID = v5->_clusterID;
  v5->_clusterID = (NSNumber *)v6;

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMEndpointIDCodingKey"];
  endpointID = v5->_endpointID;
  v5->_endpointID = (NSNumber *)v8;

  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCommandKey"];
  commandID = v5->_commandID;
  v5->_commandID = (NSNumber *)v10;

  uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessory"];
  accessory = v5->_accessory;
  v5->_accessory = (HMAccessory *)v12;

  uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
  v37[0] = objc_opt_class();
  v37[1] = objc_opt_class();
  v37[2] = objc_opt_class();
  v37[3] = objc_opt_class();
  v37[4] = objc_opt_class();
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:5];
  char v16 = [v14 setWithArray:v15];
  uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"HMCommandFieldsCodingKey"];
  commandFields = v5->_commandFields;
  v5->_commandFields = (NSDictionary *)v17;

  v19 = (void *)MEMORY[0x1E4F1CAD0];
  v36[0] = objc_opt_class();
  v36[1] = objc_opt_class();
  v36[2] = objc_opt_class();
  v36[3] = objc_opt_class();
  v36[4] = objc_opt_class();
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:5];
  v21 = [v19 setWithArray:v20];
  uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"HMCommandExpectedValuesCodingKey"];
  expectedValues = v5->_expectedValues;
  v5->_expectedValues = (NSArray *)v22;

  if (!v5->_clusterID) {
    goto LABEL_7;
  }
  if (v5->_endpointID && v5->_commandID && v5->_accessory)
  {
LABEL_6:
    v24 = v5;
  }
  else
  {
LABEL_7:
    v25 = (void *)MEMORY[0x19F3A64A0]();
    v26 = v5;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = HMFGetLogIdentifier();
      uint64_t v29 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v33 = v28;
      __int16 v34 = 2112;
      uint64_t v35 = v29;
      _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unable to unarchive %@, missing clusterID, endpointID or commandID", buf, 0x16u);
    }
    v24 = 0;
  }

  return v24;
}

- (id)encodeAsProtoBuf
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  v3 = [(HMMatterCommand *)self accessory];
  if (v3)
  {
    id v4 = objc_alloc_init(HMPBCommandContainer);
    v5 = (void *)MEMORY[0x1E4F28DB0];
    uint64_t v6 = [(HMMatterCommand *)self commandID];
    v7 = [v5 archivedDataWithRootObject:v6];
    [(HMPBCommandContainer *)v4 setCommandID:v7];

    uint64_t v8 = (void *)MEMORY[0x1E4F28DB0];
    v9 = [(HMMatterCommand *)self clusterID];
    uint64_t v10 = [v8 archivedDataWithRootObject:v9];
    [(HMPBCommandContainer *)v4 setClusterID:v10];

    v11 = (void *)MEMORY[0x1E4F28DB0];
    uint64_t v12 = [(HMMatterCommand *)self endpointID];
    uint64_t v13 = [v11 archivedDataWithRootObject:v12];
    [(HMPBCommandContainer *)v4 setEndpointID:v13];

    uint64_t v14 = +[HMPBAccessoryReference accessoryReferenceWithAccessory:v3];
    [(HMPBCommandContainer *)v4 setAccessoryReference:v14];

    v15 = [(HMMatterCommand *)self commandFields];

    if (v15)
    {
      char v16 = [(HMMatterCommand *)self commandFields];
      BOOL v17 = [(HMMatterCommand *)self isKindOfAllowedCommandFieldsClass:v16];

      if (!v17)
      {
        uint64_t v35 = (void *)MEMORY[0x19F3A64A0]();
        v36 = self;
        v37 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          v38 = HMFGetLogIdentifier();
          v39 = [(HMMatterCommand *)v36 commandFields];
          *(_DWORD *)buf = 138543618;
          v51 = v38;
          __int16 v52 = 2112;
          id v53 = (id)objc_opt_class();
          id v40 = v53;
          v41 = "%{public}@Command fields is of unhandled class %@";
LABEL_18:
          _os_log_impl(&dword_19D1A8000, v37, OS_LOG_TYPE_ERROR, v41, buf, 0x16u);
        }
LABEL_19:

LABEL_26:
        v30 = 0;
        goto LABEL_27;
      }
      v18 = (void *)MEMORY[0x1E4F28DB0];
      v19 = [(HMMatterCommand *)self commandFields];
      id v49 = 0;
      v20 = [v18 archivedDataWithRootObject:v19 requiringSecureCoding:1 error:&v49];
      id v21 = v49;
      [(HMPBCommandContainer *)v4 setCommandFields:v20];

      uint64_t v22 = [(HMPBCommandContainer *)v4 commandFields];

      if (!v22)
      {
        v43 = (void *)MEMORY[0x19F3A64A0]();
        v44 = self;
        v45 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
LABEL_25:

          goto LABEL_26;
        }
        v46 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v51 = v46;
        __int16 v52 = 2112;
        id v53 = v21;
LABEL_24:
        _os_log_impl(&dword_19D1A8000, v45, OS_LOG_TYPE_ERROR, "%{public}@Couldn't encode command fields: %@", buf, 0x16u);

        goto LABEL_25;
      }
    }
    v23 = [(HMMatterCommand *)self expectedValues];

    if (!v23)
    {
LABEL_10:
      v30 = v4;
LABEL_27:

      goto LABEL_28;
    }
    v24 = [(HMMatterCommand *)self expectedValues];
    BOOL v25 = [(HMMatterCommand *)self isKindOfAllowedExpectedValuesClass:v24];

    if (v25)
    {
      v26 = (void *)MEMORY[0x1E4F28DB0];
      v27 = [(HMMatterCommand *)self expectedValues];
      id v48 = 0;
      v28 = [v26 archivedDataWithRootObject:v27 requiringSecureCoding:1 error:&v48];
      id v21 = v48;
      [(HMPBCommandContainer *)v4 setExpectedValues:v28];

      uint64_t v29 = [(HMPBCommandContainer *)v4 expectedValues];

      if (v29)
      {

        goto LABEL_10;
      }
      v43 = (void *)MEMORY[0x19F3A64A0]();
      v44 = self;
      v45 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      v46 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v51 = v46;
      __int16 v52 = 2112;
      id v53 = v21;
      goto LABEL_24;
    }
    uint64_t v35 = (void *)MEMORY[0x19F3A64A0]();
    v36 = self;
    v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = HMFGetLogIdentifier();
      v39 = [(HMMatterCommand *)v36 expectedValues];
      v42 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v51 = v38;
      __int16 v52 = 2112;
      id v53 = v42;
      id v40 = v42;
      v41 = "%{public}@Expected values is of unhandled class %@";
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  objc_super v31 = (void *)MEMORY[0x19F3A64A0]();
  v32 = self;
  v33 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    __int16 v34 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v51 = v34;
    __int16 v52 = 2112;
    id v53 = v32;
    __int16 v54 = 2112;
    uint64_t v55 = 0;
    _os_log_impl(&dword_19D1A8000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed encode action as protobuf, accessory is invalid %@:%@", buf, 0x20u);
  }
  v30 = 0;
LABEL_28:

  return v30;
}

- (BOOL)isKindOfAllowedCommandFieldsClass:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = +[HMMatterCommand allowedCommandFieldsClassesForShortcuts];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_opt_isKindOfClass())
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (BOOL)isKindOfAllowedExpectedValuesClass:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = +[HMMatterCommand allowedExpectedValuesClassesForShortcuts];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_opt_isKindOfClass())
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)serializeForAdd
{
  v20[4] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(HMMatterCommand *)self commandFields];

  if (v4)
  {
    uint64_t v5 = [(HMMatterCommand *)self commandFields];
    uint64_t v6 = encodeRootObject(v5);
    [v3 setObject:v6 forKeyedSubscript:@"HMCommandFieldsKey"];
  }
  v7 = [(HMMatterCommand *)self expectedValues];

  if (v7)
  {
    uint64_t v8 = [(HMMatterCommand *)self expectedValues];
    long long v9 = encodeRootObject(v8);
    [v3 setObject:v9 forKeyedSubscript:@"HMCommandExpectedValuesKey"];
  }
  v19[0] = @"kAccessoryUUID";
  long long v10 = [(HMMatterCommand *)self accessory];
  long long v11 = [v10 uuid];
  long long v12 = [v11 UUIDString];
  v20[0] = v12;
  v19[1] = @"HMEndpointIDKey";
  uint64_t v13 = [(HMMatterCommand *)self endpointID];
  v20[1] = v13;
  v19[2] = @"HMCommandIDKey";
  uint64_t v14 = [(HMMatterCommand *)self commandID];
  v20[2] = v14;
  v19[3] = @"HMClusterIDKey";
  v15 = [(HMMatterCommand *)self clusterID];
  v20[3] = v15;
  char v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4];
  [v3 addEntriesFromDictionary:v16];

  BOOL v17 = (void *)[v3 copy];

  return v17;
}

- (void)_configureWithContext:(id)a3 home:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMMatterCommand *)self accessory];
  objc_msgSend(v8, "__configureWithContext:home:", v7, v6);
}

- (HMMatterCommand)initWithDictionary:(id)a3 home:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v46.receiver = self;
  v46.super_class = (Class)HMMatterCommand;
  id v8 = [(HMMatterCommand *)&v46 init];
  if (!v8) {
    goto LABEL_28;
  }
  uint64_t v9 = objc_msgSend(v6, "hmf_UUIDForKey:", @"kAccessoryUUID");
  uint64_t v10 = objc_msgSend(v6, "hmf_numberForKey:", @"HMEndpointIDKey");
  long long v11 = objc_msgSend(v6, "hmf_numberForKey:", @"HMClusterIDKey");
  uint64_t v12 = objc_msgSend(v6, "hmf_numberForKey:", @"HMCommandIDKey");
  uint64_t v13 = (void *)v12;
  uint64_t v14 = (void *)v9;
  v44 = (void *)v10;
  BOOL v15 = !v9 || v10 == 0;
  BOOL v16 = v15 || v11 == 0;
  BOOL v17 = v16 || v12 == 0;
  BOOL v18 = !v17;
  v19 = (void *)MEMORY[0x19F3A64A0]();
  v20 = v8;
  id v21 = HMFGetOSLogHandle();
  uint64_t v22 = v21;
  BOOL v45 = v18;
  if (v18)
  {
    v42 = v7;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v48 = v23;
      __int16 v49 = 2112;
      uint64_t v50 = (uint64_t)v6;
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Creating a matter command with dictionary: %@", buf, 0x16u);
    }
    v24 = objc_msgSend(v6, "hmf_dataForKey:", @"HMCommandFieldsKey");

    BOOL v25 = v14;
    if (v24)
    {
      v26 = HMAllowedClassesForMatterCommand();
      uint64_t v27 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", @"HMCommandFieldsKey", v26);
      commandFields = v20->_commandFields;
      v20->_commandFields = (NSDictionary *)v27;
    }
    else
    {
      uint64_t v32 = objc_msgSend(v6, "hmf_dictionaryForKey:", @"HMCommandFieldsKey");
      v26 = v20->_commandFields;
      v20->_commandFields = (NSDictionary *)v32;
    }
    objc_super v31 = v44;

    v33 = objc_msgSend(v6, "hmf_dataForKey:", @"HMCommandExpectedValuesKey");

    if (v33)
    {
      __int16 v34 = HMAllowedClassesForMatterCommand();
      uint64_t v35 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", @"HMCommandExpectedValuesKey", v34);
      expectedValues = v20->_expectedValues;
      v20->_expectedValues = (NSArray *)v35;
    }
    else
    {
      uint64_t v37 = objc_msgSend(v6, "hmf_arrayForKey:", @"HMCommandExpectedValuesKey");
      __int16 v34 = v20->_expectedValues;
      v20->_expectedValues = (NSArray *)v37;
    }

    id v7 = v42;
    uint64_t v38 = [v42 accessoryWithUUID:v25];
    accessory = v20->_accessory;
    v20->_accessory = (HMAccessory *)v38;

    objc_storeStrong((id *)&v20->_endpointID, v44);
    objc_storeStrong((id *)&v20->_clusterID, v11);
    objc_storeStrong((id *)&v20->_commandID, v13);
  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      uint64_t v29 = v43 = v7;
      uint64_t v30 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v48 = v29;
      __int16 v49 = 2112;
      uint64_t v50 = v30;
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode %@, missing accessory/endpoint/cluster/command ids", buf, 0x16u);

      id v7 = v43;
    }

    BOOL v25 = v14;
    objc_super v31 = v44;
  }

  if (!v45) {
    id v40 = 0;
  }
  else {
LABEL_28:
  }
    id v40 = v8;

  return v40;
}

- (HMMatterCommand)initWithCommandID:(id)a3 endpointID:(id)a4 clusterID:(id)a5 accessory:(id)a6 commandFields:(id)a7 expectedValues:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HMMatterCommand;
  BOOL v18 = [(HMMatterCommand *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_commandID, a3);
    objc_storeStrong((id *)&v19->_endpointID, a4);
    objc_storeStrong((id *)&v19->_clusterID, a5);
    objc_storeStrong((id *)&v19->_accessory, a6);
    objc_storeStrong((id *)&v19->_commandFields, a7);
    objc_storeStrong((id *)&v19->_expectedValues, a8);
  }

  return v19;
}

- (HMMatterCommand)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)commandWithProtoBuf:(id)a3 home:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F28DC0];
  id v8 = [v5 commandID];
  uint64_t v9 = [v7 unarchiveObjectWithData:v8];

  uint64_t v10 = (void *)MEMORY[0x1E4F28DC0];
  long long v11 = [v5 clusterID];
  uint64_t v12 = [v10 unarchiveObjectWithData:v11];

  uint64_t v13 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v14 = [v5 endpointID];
  id v15 = [v13 unarchiveObjectWithData:v14];

  if (v9 && v12 && v15)
  {
    id v16 = [v5 accessoryReference];
    id v17 = +[HMAccessory accessoryWithAccessoryReference:v16 home:v6];
    if (v17)
    {
      BOOL v18 = (void *)MEMORY[0x1E4F28DC0];
      v19 = +[HMMatterCommand allowedCommandFieldsClassesForShortcuts];
      [v5 commandFields];
      v20 = id v40 = v17;
      id v43 = 0;
      v39 = [v18 unarchivedObjectOfClasses:v19 fromData:v20 error:&v43];
      id v41 = v6;
      id v21 = v43;

      id v22 = (void *)MEMORY[0x1E4F28DC0];
      id v23 = +[HMMatterCommand allowedExpectedValuesClassesForShortcuts];
      [v5 expectedValues];
      objc_super v24 = v15;
      BOOL v25 = v12;
      v26 = v9;
      v28 = uint64_t v27 = v16;
      id v42 = v21;
      uint64_t v29 = [v22 unarchivedObjectOfClasses:v23 fromData:v28 error:&v42];
      id v38 = v42;

      id v6 = v41;
      id v16 = v27;
      uint64_t v9 = v26;
      uint64_t v12 = v25;
      id v15 = v24;

      id v17 = v40;
      uint64_t v30 = [[HMMatterCommand alloc] initWithCommandID:v9 endpointID:v24 clusterID:v12 accessory:v40 commandFields:v39 expectedValues:v29];
    }
    else
    {
      __int16 v34 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        BOOL v45 = v36;
        __int16 v46 = 2112;
        id v47 = v5;
        _os_log_impl(&dword_19D1A8000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to create command from protobuf, accessory does not exist %@", buf, 0x16u);

        id v17 = 0;
      }

      uint64_t v30 = 0;
    }
  }
  else
  {
    objc_super v31 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      BOOL v45 = v33;
      __int16 v46 = 2112;
      id v47 = v9;
      __int16 v48 = 2112;
      __int16 v49 = v12;
      __int16 v50 = 2112;
      uint64_t v51 = v15;
      _os_log_impl(&dword_19D1A8000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to create command from protobuf, invalid commandID, clusterID, endpointID %@:%@:%@", buf, 0x2Au);
    }
    uint64_t v30 = 0;
  }

  return v30;
}

+ (id)allowedCommandFieldsClassesForShortcuts
{
  if (allowedCommandFieldsClassesForShortcuts__hmf_once_t4 != -1) {
    dispatch_once(&allowedCommandFieldsClassesForShortcuts__hmf_once_t4, &__block_literal_global_9);
  }
  v2 = (void *)allowedCommandFieldsClassesForShortcuts__hmf_once_v5;

  return v2;
}

uint64_t __58__HMMatterCommand_allowedCommandFieldsClassesForShortcuts__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  uint64_t v3 = allowedCommandFieldsClassesForShortcuts__hmf_once_v5;
  allowedCommandFieldsClassesForShortcuts__hmf_once_id v5 = v2;

  return MEMORY[0x1F41817F8](v2, v3);
}

+ (id)allowedExpectedValuesClassesForShortcuts
{
  if (allowedExpectedValuesClassesForShortcuts__hmf_once_t2 != -1) {
    dispatch_once(&allowedExpectedValuesClassesForShortcuts__hmf_once_t2, &__block_literal_global_8082);
  }
  uint64_t v2 = (void *)allowedExpectedValuesClassesForShortcuts__hmf_once_v3;

  return v2;
}

uint64_t __59__HMMatterCommand_allowedExpectedValuesClassesForShortcuts__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  uint64_t v3 = allowedExpectedValuesClassesForShortcuts__hmf_once_v3;
  allowedExpectedValuesClassesForShortcuts__hmf_once_uint64_t v3 = v2;

  return MEMORY[0x1F41817F8](v2, v3);
}

+ (id)new
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end