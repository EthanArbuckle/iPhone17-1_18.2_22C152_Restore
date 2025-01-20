@interface HMDCloudZoneInformation
+ (BOOL)supportsSecureCoding;
+ (id)cloudZoneInformationWithCloudZones:(id)a3;
+ (id)cloudZonesArrayWithCloudZones:(id)a3;
+ (id)cloudZonesWithDictionary:(id)a3;
+ (id)shortDescription;
- (BOOL)didFetchFailed;
- (BOOL)doesHandlesCloudRecord;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFirstFetch;
- (BOOL)isZoneCreated;
- (HMDCloudZoneInformation)init;
- (HMDCloudZoneInformation)initWithCoder:(id)a3;
- (HMDCloudZoneInformation)initWithOwnerName:(id)a3 uuid:(id)a4;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)ownerName;
- (NSUUID)uuid;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)emptyModelObjectWithChangeType:(unint64_t)a3 parent:(id)a4;
- (id)modelObjectWithChangeType:(unint64_t)a3 parent:(id)a4;
- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4 parent:(id)a5;
- (id)shortDescription;
- (int64_t)schemaVersion;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setFetchFailed:(BOOL)a3;
- (void)setFirstFetch:(BOOL)a3;
- (void)setHandlesCloudRecord:(BOOL)a3;
- (void)setOwnerName:(id)a3;
- (void)setSchemaVersion:(int64_t)a3;
- (void)setZoneCreated:(BOOL)a3;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)updateCloudZoneInformationWithModel:(id)a3 message:(id)a4;
@end

@implementation HMDCloudZoneInformation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerName, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setHandlesCloudRecord:(BOOL)a3
{
  self->_handlesCloudRecord = a3;
}

- (BOOL)doesHandlesCloudRecord
{
  return self->_handlesCloudRecord;
}

- (void)setSchemaVersion:(int64_t)a3
{
  self->_schemaVersion = a3;
}

- (int64_t)schemaVersion
{
  return self->_schemaVersion;
}

- (void)setZoneCreated:(BOOL)a3
{
  self->_zoneCreated = a3;
}

- (BOOL)isZoneCreated
{
  return self->_zoneCreated;
}

- (void)setFirstFetch:(BOOL)a3
{
  self->_firstFetch = a3;
}

- (BOOL)isFirstFetch
{
  return self->_firstFetch;
}

- (void)setFetchFailed:(BOOL)a3
{
  self->_fetchFailed = a3;
}

- (BOOL)didFetchFailed
{
  return self->_fetchFailed;
}

- (void)setOwnerName:(id)a3
{
}

- (NSString)ownerName
{
  return self->_ownerName;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (id)emptyModelObjectWithChangeType:(unint64_t)a3 parent:(id)a4
{
  id v6 = a4;
  v7 = [HMDCloudZoneInformationModel alloc];
  v8 = [(HMDCloudZoneInformation *)self uuid];
  v9 = [(HMDBackingStoreModelObject *)v7 initWithObjectChangeType:a3 uuid:v8 parentUUID:v6];

  return v9;
}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4 parent:(id)a5
{
  id v6 = [(HMDCloudZoneInformation *)self emptyModelObjectWithChangeType:a3 parent:a5];
  v7 = [(HMDCloudZoneInformation *)self ownerName];
  [v6 setOwnerName:v7];

  return v6;
}

- (id)modelObjectWithChangeType:(unint64_t)a3 parent:(id)a4
{
  return [(HMDCloudZoneInformation *)self modelObjectWithChangeType:a3 version:4 parent:a4];
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v8 = v11;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;
  if (v9)
  {
    [(HMDCloudZoneInformation *)self updateCloudZoneInformationWithModel:v9 message:v7];
    v10 = [v7 transactionResult];
    [v10 markChanged];
    [v7 respondWithPayload:0];
  }
}

- (void)updateCloudZoneInformationWithModel:(id)a3 message:(id)a4
{
  id v8 = a3;
  [(HMDCloudZoneInformation *)self setZoneCreated:1];
  v5 = [v8 setProperties];
  int v6 = [v5 containsObject:@"ownerName"];

  if (v6)
  {
    id v7 = [v8 ownerName];
    [(HMDCloudZoneInformation *)self setOwnerName:v7];
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  v4 = [(HMDCloudZoneInformation *)self uuid];
  v5 = [v4 UUIDString];
  [v7 encodeObject:v5 forKey:@"HM.zoneUUID"];

  int v6 = [(HMDCloudZoneInformation *)self ownerName];
  [v7 encodeObject:v6 forKey:@"HM.zoneOwner"];

  objc_msgSend(v7, "encodeBool:forKey:", -[HMDCloudZoneInformation didFetchFailed](self, "didFetchFailed"), @"HM.zoneFetchFailed");
  objc_msgSend(v7, "encodeBool:forKey:", -[HMDCloudZoneInformation isZoneCreated](self, "isZoneCreated"), @"HM.zoneZoneCreated");
  objc_msgSend(v7, "encodeInteger:forKey:", -[HMDCloudZoneInformation schemaVersion](self, "schemaVersion"), @"HM.zoneSchemaVersion");
}

- (HMDCloudZoneInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.zoneUUID"];
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v5];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.zoneOwner"];
  id v8 = [(HMDCloudZoneInformation *)self initWithOwnerName:v7 uuid:v6];
  if (v8)
  {
    if ([v4 containsValueForKey:@"HM.zoneFetchFailed"]) {
      v8->_fetchFailed = [v4 decodeBoolForKey:@"HM.zoneFetchFailed"];
    }
    if ([v4 containsValueForKey:@"HM.zoneZoneCreated"]) {
      v8->_zoneCreated = [v4 decodeBoolForKey:@"HM.zoneZoneCreated"];
    }
    else {
      v8->_zoneCreated = 1;
    }
    if ([v4 containsValueForKey:@"HM.zoneSchemaVersion"]) {
      v8->_schemaVersion = [v4 decodeIntegerForKey:@"HM.zoneSchemaVersion"];
    }
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDCloudZoneInformation *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(HMDCloudZoneInformation *)v4 uuid];
      int v6 = [(HMDCloudZoneInformation *)self uuid];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(HMDCloudZoneInformation *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)description
{
  return (NSString *)[(HMDCloudZoneInformation *)self descriptionWithPointer:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(HMDCloudZoneInformation *)self descriptionWithPointer:1];
}

- (id)descriptionWithPointer:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = NSString;
  int v6 = [(HMDCloudZoneInformation *)self shortDescription];
  if (v3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" %p", self);
    char v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v7 = &stru_1F2C9F1A8;
  }
  id v8 = [(HMDCloudZoneInformation *)self ownerName];
  id v9 = [v5 stringWithFormat:@"<%@%@, Owner = %@>", v6, v7, v8];

  if (v3) {
  return v9;
  }
}

- (id)shortDescription
{
  BOOL v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  v5 = [(HMDCloudZoneInformation *)self uuid];
  int v6 = [v5 UUIDString];
  char v7 = [v3 stringWithFormat:@"%@ %@", v4, v6];

  return v7;
}

- (HMDCloudZoneInformation)initWithOwnerName:(id)a3 uuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMDCloudZoneInformation;
  id v8 = [(HMDCloudZoneInformation *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    ownerName = v8->_ownerName;
    v8->_ownerName = (NSString *)v9;

    if (v7)
    {
      uint64_t v11 = [v7 copy];
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4F29128] UUID];
    }
    v12 = (void *)v11;
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v11);
    uuid = v8->_uuid;
    v8->_uuid = (NSUUID *)v13;

    v8->_schemaVersion = 2;
    v8->_firstFetch = 1;
  }
  return v8;
}

- (HMDCloudZoneInformation)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)cloudZonesArrayWithCloudZones:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "uuid", (void)v13);
        uint64_t v11 = [v10 UUIDString];

        [v4 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)cloudZoneInformationWithCloudZones:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v29;
    *(void *)&long long v6 = 138543618;
    long long v24 = v6;
    id v25 = v4;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "uuid", v24);
        v12 = [v11 UUIDString];

        uint64_t v13 = [v10 ownerName];
        long long v14 = (void *)v13;
        if (v12) {
          BOOL v15 = v13 == 0;
        }
        else {
          BOOL v15 = 1;
        }
        if (v15)
        {
          uint64_t v16 = v8;
          v17 = (void *)MEMORY[0x1D9452090]();
          id v18 = a1;
          v19 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v20 = HMFGetLogIdentifier();
            *(_DWORD *)buf = v24;
            v33 = v20;
            __int16 v34 = 2112;
            v35 = v10;
            _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Cannot convert zone information to zone information dictionary, %@", buf, 0x16u);

            id v4 = v25;
          }

          uint64_t v8 = v16;
        }
        else
        {
          v36[0] = @"HM.zoneOwner";
          v36[1] = @"HM.zoneHandlesRecord";
          v37[0] = v13;
          v37[1] = MEMORY[0x1E4F1CC38];
          v36[2] = @"HM.zoneSchemaVersion";
          v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "schemaVersion"));
          v37[2] = v21;
          v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:3];
          [v27 setObject:v22 forKeyedSubscript:v12];
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v28 objects:v38 count:16];
    }
    while (v7);
  }

  return v27;
}

+ (id)cloudZonesWithDictionary:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [v3 allKeys];
  uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v10 = [v3 objectForKeyedSubscript:v9];
        uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v9];
        v12 = [v10 objectForKeyedSubscript:@"HM.zoneOwner"];
        uint64_t v13 = [[HMDCloudZoneInformation alloc] initWithOwnerName:v12 uuid:v11];
        long long v14 = [v10 objectForKeyedSubscript:@"HM.zoneFetchFailed"];

        if (v14) {
          [(HMDCloudZoneInformation *)v13 setFetchFailed:1];
        }
        BOOL v15 = [v10 objectForKeyedSubscript:@"HM.zoneHandlesRecord"];

        if (v15) {
          [(HMDCloudZoneInformation *)v13 setHandlesCloudRecord:1];
        }
        uint64_t v16 = objc_msgSend(v10, "hmf_numberForKey:", @"HM.zoneSchemaVersion");
        v17 = v16;
        if (v16) {
          uint64_t v18 = [v16 integerValue];
        }
        else {
          uint64_t v18 = 1;
        }
        [(HMDCloudZoneInformation *)v13 setSchemaVersion:v18];
        [v4 addObject:v13];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }

  return v4;
}

@end