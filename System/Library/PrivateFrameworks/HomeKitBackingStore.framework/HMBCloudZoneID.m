@interface HMBCloudZoneID
+ (BOOL)supportsSecureCoding;
+ (id)hmbDecodeData:(id)a3 fromStorageLocation:(unint64_t)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (CKRecordZoneID)zoneID;
- (HMBCloudZoneID)initWithCoder:(id)a3;
- (HMBCloudZoneID)initWithContainerID:(id)a3 scope:(int64_t)a4 zoneID:(id)a5;
- (HMBCloudZoneID)initWithContainerID:(id)a3 scope:(int64_t)a4 zoneID:(id)a5 name:(id)a6 modelID:(id)a7;
- (NSData)token;
- (id)hmbEncodeForStorageLocation:(unint64_t)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMBCloudZoneID

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

- (CKRecordZoneID)zoneID
{
  return (CKRecordZoneID *)objc_getProperty(self, a2, 48, 1);
}

- (NSData)token
{
  return self->_token;
}

- (unint64_t)hash
{
  v2 = [(HMBCloudZoneID *)self token];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    v7 = [(HMBCloudZoneID *)self token];
    v8 = [v6 token];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (HMBCloudZoneID)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [[HMBCloudID alloc] initWithCoder:v4];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMBCZID.z"];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    v12 = 0;
  }
  else
  {
    v8 = [(HMBCloudID *)v5 containerID];
    uint64_t v9 = [(HMBCloudID *)v5 scope];
    v10 = [(HMBCloudID *)v5 name];
    v11 = [(HMBCloudID *)v5 modelID];
    self = [(HMBCloudZoneID *)self initWithContainerID:v8 scope:v9 zoneID:v6 name:v10 modelID:v11];

    v12 = self;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HMBCloudZoneID;
  id v4 = a3;
  [(HMBCloudID *)&v6 encodeWithCoder:v4];
  v5 = [(HMBCloudZoneID *)self zoneID];
  [v4 encodeObject:v5 forKey:@"HMBCZID.z"];
}

- (HMBCloudZoneID)initWithContainerID:(id)a3 scope:(int64_t)a4 zoneID:(id)a5
{
  v50[4] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (!v8) {
    _HMFPreconditionFailure();
  }
  v10 = v9;
  v11 = [v9 ownerName];
  uint64_t v12 = *MEMORY[0x1E4F19C08];
  int v13 = [v11 isEqualToString:*MEMORY[0x1E4F19C08]];

  if (a4 == 3)
  {
    if (!v13) {
      goto LABEL_7;
    }
    _HMFPreconditionFailure();
  }
  if ((v13 & 1) == 0)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F1A320]);
    v15 = [v10 zoneName];
    uint64_t v16 = [v14 initWithZoneName:v15 ownerName:v12];

    v10 = (void *)v16;
  }
LABEL_7:
  v17 = NSString;
  [v8 environment];
  v18 = CKContainerEnvironmentString();
  v19 = CKDatabaseScopeString();
  v20 = [v8 containerIdentifier];
  v21 = [v10 hmbDescription];
  uint64_t v22 = [v17 stringWithFormat:@"%@.%@.%@/%@", v18, v19, v20, v21];

  v43 = self;
  int64_t v44 = a4;
  v42 = (void *)v22;
  if ((unint64_t)(a4 - 1) > 2) {
    v41 = 0;
  }
  else {
    v41 = off_1E69EAAB8[a4 - 1];
  }
  v23 = [v10 zoneName];
  v24 = [v10 ownerName];
  id v25 = v8;
  id v26 = v23;
  [v25 environment];
  v27 = CKContainerEnvironmentString();
  v50[0] = v27;
  v28 = [v25 containerIdentifier];
  v50[1] = v28;
  v50[2] = v26;
  v50[3] = v24;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:4];

  v30 = [MEMORY[0x1E4F1CA58] data];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v31 = v29;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v46 != v34) {
          objc_enumerationMutation(v31);
        }
        v36 = [*(id *)(*((void *)&v45 + 1) + 8 * i) dataUsingEncoding:4];
        [v30 appendData:v36];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v33);
  }

  v37 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v41];
  v38 = objc_msgSend(MEMORY[0x1E4F29128], "hmf_UUIDWithNamespace:data:", v37, v30);

  v39 = [(HMBCloudZoneID *)v43 initWithContainerID:v25 scope:v44 zoneID:v10 name:v42 modelID:v38];
  return v39;
}

- (HMBCloudZoneID)initWithContainerID:(id)a3 scope:(int64_t)a4 zoneID:(id)a5 name:(id)a6 modelID:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (!v12)
  {
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v13)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!a4)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v14)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  uint64_t v16 = v15;
  if (!v15)
  {
LABEL_13:
    v23 = (void *)_HMFPreconditionFailure();
    return (HMBCloudZoneID *)+[HMBCloudZoneID supportsSecureCoding];
  }
  v25.receiver = self;
  v25.super_class = (Class)HMBCloudZoneID;
  v17 = [(HMBCloudID *)&v25 initWithContainerID:v12 scope:a4 name:v14 modelID:v15];
  if (v17)
  {
    uint64_t v18 = [v13 copy];
    zoneID = v17->_zoneID;
    v17->_zoneID = (CKRecordZoneID *)v18;

    uint64_t v20 = [v16 data];
    token = v17->_token;
    v17->_token = (NSData *)v20;
  }
  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)hmbEncodeForStorageLocation:(unint64_t)a3 error:(id *)a4
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:a4];
}

+ (id)hmbDecodeData:(id)a3 fromStorageLocation:(unint64_t)a4 error:(id *)a5
{
  return (id)[MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:a1 fromData:a3 error:a5];
}

@end