@interface HMMediaSystemBuilderPayload
+ (BOOL)decodeComponentData:(id)a3 leftComponentUUID:(id *)a4 leftAccessoryUUID:(id *)a5 rightComponentUUID:(id *)a6 rightAccessoryUUID:(id *)a7;
+ (id)encodeComponentDataWithLeftComponentUUID:(id)a3 leftAccessoryUUID:(id)a4 rightComponentUUID:(id)a5 rightAccessoryUUID:(id)a6;
- (BOOL)isEqual:(id)a3;
- (HMMediaSystemBuilderPayload)initWithPayload:(id)a3;
- (HMMediaSystemBuilderPayload)initWithUUID:(id)a3 name:(id)a4 configuredName:(id)a5 leftComponentUUID:(id)a6 rightComponentUUID:(id)a7 leftAccessoryUUID:(id)a8 rightAccessoryUUID:(id)a9 sessionID:(id)a10;
- (NSString)configuredName;
- (NSString)name;
- (NSUUID)leftAccessoryUUID;
- (NSUUID)leftComponentUUID;
- (NSUUID)rightAccessoryUUID;
- (NSUUID)rightComponentUUID;
- (NSUUID)sessionID;
- (NSUUID)uuid;
- (id)payloadCopy;
- (unint64_t)hash;
@end

@implementation HMMediaSystemBuilderPayload

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuredName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_rightAccessoryUUID, 0);
  objc_storeStrong((id *)&self->_leftAccessoryUUID, 0);
  objc_storeStrong((id *)&self->_rightComponentUUID, 0);
  objc_storeStrong((id *)&self->_leftComponentUUID, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (NSString)configuredName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSUUID)sessionID
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (NSUUID)rightAccessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (NSUUID)leftAccessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)rightComponentUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)leftComponentUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)hash
{
  v2 = [(HMMediaSystemBuilderPayload *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMMediaSystemBuilderPayload *)a3;
  if (self == v4)
  {
    char v18 = 1;
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
      v7 = [(HMMediaSystemBuilderPayload *)self uuid];
      v8 = [(HMMediaSystemBuilderPayload *)v6 uuid];
      if (objc_msgSend(v7, "hmf_isEqualToUUID:", v8))
      {
        v9 = [(HMMediaSystemBuilderPayload *)self leftComponentUUID];
        v10 = [(HMMediaSystemBuilderPayload *)v6 leftComponentUUID];
        if (objc_msgSend(v9, "hmf_isEqualToUUID:", v10))
        {
          v11 = [(HMMediaSystemBuilderPayload *)self rightComponentUUID];
          v12 = [(HMMediaSystemBuilderPayload *)v6 rightComponentUUID];
          if (objc_msgSend(v11, "hmf_isEqualToUUID:", v12))
          {
            v13 = [(HMMediaSystemBuilderPayload *)self leftAccessoryUUID];
            v27 = [(HMMediaSystemBuilderPayload *)v6 leftAccessoryUUID];
            v28 = v13;
            if (objc_msgSend(v13, "hmf_isEqualToUUID:", v27))
            {
              v14 = [(HMMediaSystemBuilderPayload *)self rightAccessoryUUID];
              v25 = [(HMMediaSystemBuilderPayload *)v6 rightAccessoryUUID];
              v26 = v14;
              if (objc_msgSend(v14, "hmf_isEqualToUUID:", v25))
              {
                v15 = [(HMMediaSystemBuilderPayload *)self sessionID];
                v23 = [(HMMediaSystemBuilderPayload *)v6 sessionID];
                v24 = v15;
                if (objc_msgSend(v15, "hmf_isEqualToUUID:", v23)
                  && ([(HMMediaSystemBuilderPayload *)self name],
                      v21 = objc_claimAutoreleasedReturnValue(),
                      [(HMMediaSystemBuilderPayload *)v6 name],
                      v16 = objc_claimAutoreleasedReturnValue(),
                      int v20 = HMFEqualObjects(),
                      v16,
                      v21,
                      v20))
                {
                  v22 = [(HMMediaSystemBuilderPayload *)self configuredName];
                  v17 = [(HMMediaSystemBuilderPayload *)v6 configuredName];
                  char v18 = HMFEqualObjects();
                }
                else
                {
                  char v18 = 0;
                }
              }
              else
              {
                char v18 = 0;
              }
            }
            else
            {
              char v18 = 0;
            }
          }
          else
          {
            char v18 = 0;
          }
        }
        else
        {
          char v18 = 0;
        }
      }
      else
      {
        char v18 = 0;
      }
    }
    else
    {
      char v18 = 0;
    }
  }
  return v18;
}

- (id)payloadCopy
{
  v19[5] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(HMMediaSystemBuilderPayload *)self leftComponentUUID];
  v4 = [(HMMediaSystemBuilderPayload *)self leftAccessoryUUID];
  v5 = [(HMMediaSystemBuilderPayload *)self rightComponentUUID];
  v6 = [(HMMediaSystemBuilderPayload *)self rightAccessoryUUID];
  v7 = +[HMMediaSystemBuilderPayload encodeComponentDataWithLeftComponentUUID:v3 leftAccessoryUUID:v4 rightComponentUUID:v5 rightAccessoryUUID:v6];

  v18[0] = kMediaSystemUUIDCodingKey;
  v8 = [(HMMediaSystemBuilderPayload *)self uuid];
  v9 = [v8 UUIDString];
  v19[0] = v9;
  v18[1] = kMediaSystemNameCodingKey;
  v10 = [(HMMediaSystemBuilderPayload *)self name];
  v11 = v10;
  if (!v10)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v19[1] = v11;
  v18[2] = kMediaSystemConfiguredNameCodingKey;
  v12 = [(HMMediaSystemBuilderPayload *)self configuredName];
  v13 = v12;
  if (!v12)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v19[2] = v13;
  v19[3] = v7;
  v18[3] = kMediaSystemComponentsCodingKey;
  v18[4] = kMediaSystemBuilderSessionIDKey;
  v14 = [(HMMediaSystemBuilderPayload *)self sessionID];
  v15 = [v14 UUIDString];
  v19[4] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:5];

  if (!v12) {
  if (!v10)
  }

  return v16;
}

- (HMMediaSystemBuilderPayload)initWithPayload:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(v3, "hmf_UUIDForKey:", kMediaSystemUUIDCodingKey);
  v5 = objc_msgSend(v3, "hmf_stringForKey:", kMediaSystemNameCodingKey);
  v6 = objc_msgSend(v3, "hmf_stringForKey:", kMediaSystemConfiguredNameCodingKey);
  v7 = objc_msgSend(v3, "hmf_UUIDForKey:", kMediaSystemBuilderSessionIDKey);
  int v20 = objc_msgSend(v3, "hmf_arrayForKey:", kMediaSystemComponentsCodingKey);
  +[HMMediaSystemBuilderPayload decodeComponentData:leftComponentUUID:leftAccessoryUUID:rightComponentUUID:rightAccessoryUUID:](HMMediaSystemBuilderPayload, "decodeComponentData:leftComponentUUID:leftAccessoryUUID:rightComponentUUID:rightAccessoryUUID:");
  id v8 = 0;
  id v9 = 0;
  id v10 = 0;
  id v11 = 0;
  v12 = v11;
  if (v4 && v7 && v8 && v10 && v9 && v11)
  {
    v13 = [(HMMediaSystemBuilderPayload *)self initWithUUID:v4 name:v5 configuredName:v6 leftComponentUUID:v8 rightComponentUUID:v10 leftAccessoryUUID:v9 rightAccessoryUUID:v11 sessionID:v7];
    self = v13;
  }
  else
  {
    char v18 = v4;
    v19 = v5;
    v14 = (void *)MEMORY[0x19F3A64A0]();
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v23 = v16;
      __int16 v24 = 2112;
      id v25 = v3;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode media system builder payload: %@", buf, 0x16u);
    }
    v13 = 0;
    v4 = v18;
    v5 = v19;
  }

  return v13;
}

- (HMMediaSystemBuilderPayload)initWithUUID:(id)a3 name:(id)a4 configuredName:(id)a5 leftComponentUUID:(id)a6 rightComponentUUID:(id)a7 leftAccessoryUUID:(id)a8 rightAccessoryUUID:(id)a9 sessionID:(id)a10
{
  id v17 = a3;
  id v38 = a4;
  id obj = a5;
  id v37 = a5;
  id v34 = a6;
  id v18 = a6;
  id v35 = a7;
  id v19 = a7;
  id v36 = a8;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  if (!v17)
  {
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v18)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v19)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v20)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v21)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  v23 = v22;
  if (!v22)
  {
LABEL_15:
    v27 = (void *)_HMFPreconditionFailure();
    return (HMMediaSystemBuilderPayload *)+[HMMediaSystemBuilderPayload encodeComponentDataWithLeftComponentUUID:v29 leftAccessoryUUID:v30 rightComponentUUID:v31 rightAccessoryUUID:v32];
  }
  v39.receiver = self;
  v39.super_class = (Class)HMMediaSystemBuilderPayload;
  __int16 v24 = [(HMMediaSystemBuilderPayload *)&v39 init];
  id v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_uuid, a3);
    objc_storeStrong((id *)&v25->_name, a4);
    objc_storeStrong((id *)&v25->_configuredName, obj);
    objc_storeStrong((id *)&v25->_leftComponentUUID, v34);
    objc_storeStrong((id *)&v25->_rightComponentUUID, v35);
    objc_storeStrong((id *)&v25->_leftAccessoryUUID, v36);
    objc_storeStrong((id *)&v25->_rightAccessoryUUID, a9);
    objc_storeStrong((id *)&v25->_sessionID, a10);
  }

  return v25;
}

+ (id)encodeComponentDataWithLeftComponentUUID:(id)a3 leftAccessoryUUID:(id)a4 rightComponentUUID:(id)a5 rightAccessoryUUID:(id)a6
{
  v30[2] = *MEMORY[0x1E4F143B8];
  v28[0] = kMediaSystemComponentUUIDCodingKey;
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  v12 = [a3 UUIDString];
  v29[0] = v12;
  v28[1] = @"kAccessoryUUID";
  v13 = [v11 UUIDString];

  v29[1] = v13;
  v28[2] = kMediaSystemComponentRoleCodingKey;
  uint64_t v26 = kMediaSystemRoleTypeCodingKey;
  v27 = &unk_1EEF07E30;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  v29[2] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:3];
  v30[0] = v15;
  v24[0] = kMediaSystemComponentUUIDCodingKey;
  v16 = [v10 UUIDString];

  v25[0] = v16;
  v24[1] = @"kAccessoryUUID";
  id v17 = [v9 UUIDString];

  v25[1] = v17;
  v24[2] = kMediaSystemComponentRoleCodingKey;
  uint64_t v22 = kMediaSystemRoleTypeCodingKey;
  v23 = &unk_1EEF07E48;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  v25[2] = v18;
  id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];
  v30[1] = v19;
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];

  return v20;
}

+ (BOOL)decodeComponentData:(id)a3 leftComponentUUID:(id *)a4 leftAccessoryUUID:(id *)a5 rightComponentUUID:(id *)a6 rightAccessoryUUID:(id *)a7
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v7 = a3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v32 = 0;
    uint64_t v10 = *(void *)v36;
    id v11 = (void *)MEMORY[0x1E4F1CC08];
    id obj = v7;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v36 != v10) {
        objc_enumerationMutation(obj);
      }
      v13 = *(void **)(*((void *)&v35 + 1) + 8 * v12);
      v14 = objc_msgSend(v13, "hmf_dictionaryForKey:", kMediaSystemComponentRoleCodingKey);
      v15 = objc_msgSend(v13, "hmf_UUIDForKey:", kMediaSystemComponentUUIDCodingKey);
      v16 = objc_msgSend(v13, "hmf_UUIDForKey:", @"kAccessoryUUID");
      uint64_t v34 = 0;
      if (v14) {
        id v17 = v14;
      }
      else {
        id v17 = v11;
      }
      BOOL v18 = +[HMMediaSystemRole roleFromDictionary:v17 roleOutput:&v34];
      if (v15) {
        BOOL v19 = v16 == 0;
      }
      else {
        BOOL v19 = 1;
      }
      if (v19 || v34 == 0)
      {
        v23 = (void *)MEMORY[0x19F3A64A0](v18);
        __int16 v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          id v25 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v40 = v25;
          __int16 v41 = 2112;
          v42 = v13;
          _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@[HMMediaSystemBuilderPayload] Failed to decode component data due to encoded component: %@", buf, 0x16u);
        }

        id v7 = obj;
        char v26 = 0;
        goto LABEL_29;
      }
      if (v34 == 1) {
        break;
      }
      if (v34 == 2)
      {
        BYTE4(v32) = 1;
        id v21 = a6;
        uint64_t v22 = a7;
LABEL_20:
        id *v21 = v15;
        id *v22 = v16;
      }

      if (v9 == ++v12)
      {
        id v7 = obj;
        uint64_t v9 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_28;
      }
    }
    LOBYTE(v32) = 1;
    id v21 = a4;
    uint64_t v22 = a5;
    goto LABEL_20;
  }
  uint64_t v32 = 0;
LABEL_28:

  char v26 = v32 & BYTE4(v32);
LABEL_29:

  return v26 & 1;
}

@end