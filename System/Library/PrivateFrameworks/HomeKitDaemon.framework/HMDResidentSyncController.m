@interface HMDResidentSyncController
+ (id)logCategory;
- (BOOL)changeToken:(id)a3 isAheadOf:(id)a4;
- (HMDResidentSyncController)initWithHome:(id)a3 codingModel:(id)a4 notificationCenter:(id)a5 persistence:(id)a6;
- (HMFVersion)schemaVersion;
- (NSUUID)messageTargetUUID;
- (id)context;
- (id)decodeToken:(id)a3 error:(id *)a4;
- (id)encodeToken:(id)a3 error:(id *)a4;
- (id)logIdentifier;
@end

@implementation HMDResidentSyncController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schemaVersion, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_codingModel, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_destroyWeak((id *)&self->_home);
}

- (HMFVersion)schemaVersion
{
  return (HMFVersion *)objc_getProperty(self, a2, 48, 1);
}

- (id)logIdentifier
{
  return [(NSUUID *)self->_homeUUID UUIDString];
}

- (NSUUID)messageTargetUUID
{
  return self->_homeUUID;
}

- (id)context
{
  return self->_context;
}

- (BOOL)changeToken:(id)a3 isAheadOf:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    if (v5 == v6)
    {
      BOOL v9 = 0;
    }
    else
    {
      unint64_t v8 = [v5 compareToken:v6 error:0];
      if (v8 <= 4) {
        BOOL v9 = (0x13u >> v8) & 1;
      }
      else {
        BOOL v9 = 1;
      }
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (id)decodeToken:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v15 = 0;
  v7 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v15];
  id v8 = v15;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    v10 = (void *)MEMORY[0x230FBD990]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v17 = v13;
      __int16 v18 = 2114;
      id v19 = v8;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode change token: %{public}@", buf, 0x16u);
    }
    if (a4) {
      *a4 = v8;
    }
  }

  return v7;
}

- (id)encodeToken:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v15 = 0;
  v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v15];
  id v8 = v15;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    v10 = (void *)MEMORY[0x230FBD990]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v17 = v13;
      __int16 v18 = 2114;
      id v19 = v8;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode change token: %{public}@", buf, 0x16u);
    }
    if (a4) {
      *a4 = v8;
    }
  }

  return v7;
}

- (HMDResidentSyncController)initWithHome:(id)a3 codingModel:(id)a4 notificationCenter:(id)a5 persistence:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v33.receiver = self;
  v33.super_class = (Class)HMDResidentSyncController;
  v14 = [(HMDResidentSyncController *)&v33 init];
  id v15 = v14;
  if (!v14) {
    goto LABEL_9;
  }
  objc_storeWeak((id *)&v14->_home, v10);
  uint64_t v16 = [v10 uuid];
  homeUUID = v15->_homeUUID;
  v15->_homeUUID = (NSUUID *)v16;

  objc_storeStrong((id *)&v15->_notificationCenter, a5);
  objc_storeStrong((id *)&v15->_codingModel, a4);
  __int16 v18 = [v11 objectModel];
  id v19 = [v18 versionIdentifiers];
  self;
  if ([v19 count] == 1)
  {
    uint64_t v20 = [v19 anyObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v21 = v20;
    }
    else {
      v21 = 0;
    }
    id v22 = v21;

    if (v22)
    {
      uint64_t v23 = [objc_alloc(MEMORY[0x263F42670]) initWithVersionString:v22];
      if (v23)
      {
        v24 = (HMFVersion *)v23;

        schemaVersion = v15->_schemaVersion;
        v15->_schemaVersion = v24;

        uint64_t v26 = [v13 newManagedObjectContext];
        context = v15->_context;
        v15->_context = (HMDManagedObjectContext *)v26;

        v28 = HMDWorkingContextNameForHomeUUID(v15->_homeUUID);
        [(HMDManagedObjectContext *)v15->_context setName:v28];

        v29 = @"HMD.RS";
        [(HMDManagedObjectContext *)v15->_context setTransactionAuthor:@"HMD.RS"];

LABEL_9:
        return v15;
      }
    }
  }
  else
  {
    _HMFPreconditionFailureWithFormat();
  }
  v31 = (void *)_HMFPreconditionFailureWithFormat();
  return (HMDResidentSyncController *)+[HMDResidentSyncController logCategory];
}

+ (id)logCategory
{
  return +[HMDResidentSyncManager logCategory];
}

@end