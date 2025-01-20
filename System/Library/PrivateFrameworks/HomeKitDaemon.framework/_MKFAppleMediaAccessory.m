@interface _MKFAppleMediaAccessory
+ (Class)cd_modelClass;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (MKFAppleMediaAccessoryDatabaseID)databaseID;
- (NSArray)actionsAppleMediaAccessoryPower;
- (id)_analysisPredicateToFetchBulletinRegistrationOnDeviceIdsIdentifier:(id)a3 user:(id)a4;
- (id)analysisBulletinRegistrationWithDeviceIdsIdentifier:(id)a3 user:(id)a4 context:(id)a5;
- (id)bulletinRegistrationFromFetchRequest:(id)a3 context:(id)a4;
- (void)willSave;
@end

@implementation _MKFAppleMediaAccessory

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

- (NSArray)actionsAppleMediaAccessoryPower
{
  v2 = [(_MKFAppleMediaAccessory *)self valueForKey:@"actionsAppleMediaAccessoryPower_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (MKFAppleMediaAccessoryDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFAppleMediaAccessoryDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

- (id)_analysisPredicateToFetchBulletinRegistrationOnDeviceIdsIdentifier:(id)a3 user:(id)a4
{
  return (id)[MEMORY[0x263F08A98] predicateWithFormat:@"(%K == %@) AND (%K == %@) AND (%K == %@)", @"accessory", self, @"deviceIdsIdentifier", a3, @"user", a4];
}

- (id)analysisBulletinRegistrationWithDeviceIdsIdentifier:(id)a3 user:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[_MKFAnalysisEventBulletinRegistration fetchRequest];
  v12 = [(_MKFAppleMediaAccessory *)self _analysisPredicateToFetchBulletinRegistrationOnDeviceIdsIdentifier:v10 user:v9];

  [v11 setPredicate:v12];
  v13 = [(_MKFAppleMediaAccessory *)self bulletinRegistrationFromFetchRequest:v11 context:v8];

  return v13;
}

- (id)bulletinRegistrationFromFetchRequest:(id)a3 context:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v16 = 0;
  id v8 = [v7 executeFetchRequest:v6 error:&v16];
  id v9 = v16;
  if (v8)
  {
    id v10 = [v8 firstObject];
  }
  else
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v18 = v14;
      __int16 v19 = 2112;
      v20 = v12;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch bulletin registrations on accessory %@: %@", buf, 0x20u);
    }
    id v10 = 0;
  }

  return v10;
}

- (void)willSave
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  v53.receiver = self;
  v53.super_class = (Class)_MKFAppleMediaAccessory;
  [(_MKFModel *)&v53 willSave];
  if ([(_MKFAppleMediaAccessory *)self isDeleted])
  {
    v3 = [(_MKFAppleMediaAccessory *)self managedObjectContext];
    v4 = v3;
    if (!v3)
    {
      v12 = (void *)MEMORY[0x230FBD990]();
      v13 = self;
      v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v55 = v15;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Could not find MOC when processing removal for AppleMediaAccessory", buf, 0xCu);
      }
      goto LABEL_44;
    }
    v5 = objc_msgSend(v3, "hmd_coreData");
    id v6 = [v5 localStore];

    if (!v6)
    {
      id v16 = (void *)MEMORY[0x230FBD990]();
      v17 = self;
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        __int16 v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v55 = v19;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Could not find local store when processing removal for AppleMediaAccessory", buf, 0xCu);
      }
      goto LABEL_43;
    }
    BOOL v7 = +[HMDDeviceCapabilities isAppleMediaAccessory];
    if (isInternalBuild())
    {
      id v8 = [v4 userInfo];
      int v9 = objc_msgSend(v8, "hmf_BOOLForKey:", @"test__MKFAppleMediaAccessoryMockIsAppleMediaAccessoryMetadataKey");

      if (v9)
      {
        id v10 = [v4 userInfo];
        char v11 = objc_msgSend(v10, "hmf_BOOLForKey:", @"test__MKFAppleMediaAccessoryMockIsAppleMediaAccessoryMetadataKey");

        if ((v11 & 1) == 0) {
          goto LABEL_43;
        }
      }
      else if (!v7)
      {
LABEL_43:

LABEL_44:
        return;
      }
    }
    else if (!v7)
    {
      goto LABEL_43;
    }
    v20 = [(_MKFAppleMediaAccessory *)self identifier];
    if (!v20)
    {
      v37 = (void *)MEMORY[0x230FBD990]();
      v38 = self;
      v39 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v40 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v55 = v40;
        _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@Nil identifier when processing removal for AppleMediaAccessory", buf, 0xCu);
      }
      goto LABEL_42;
    }
    id v21 = (id)_mediaRouteIdentifier;
    if (isInternalBuild())
    {
      id v22 = [v4 userInfo];
      uint64_t v23 = objc_msgSend(v22, "hmf_stringForKey:", @"test_MKFAppleMediaAccessoryMockMediaRouteMetadataKey");

      if (v23)
      {
        v24 = [v4 userInfo];
        uint64_t v25 = objc_msgSend(v24, "hmf_stringForKey:", @"test_MKFAppleMediaAccessoryMockMediaRouteMetadataKey");

        id v21 = (id)v25;
      }
    }
    if (v21)
    {
      if ([v21 isEqualToString:v20])
      {
        v26 = [(_MKFAppleMediaAccessory *)self modelID];
        if (v26)
        {
          v27 = [v6 metadata];
          v28 = objc_msgSend(v27, "hmf_UUIDForKey:", @"HMDLastRemovedCurrentAccessoryMetadataKey");
          char v29 = objc_msgSend(v28, "hmf_isEqualToUUID:", v26);

          if ((v29 & 1) == 0)
          {
            v30 = [v6 metadata];
            v31 = (void *)[v30 mutableCopy];

            v32 = [v26 UUIDString];
            [v31 setObject:v32 forKeyedSubscript:@"HMDLastRemovedCurrentAccessoryMetadataKey"];

            v33 = (void *)MEMORY[0x230FBD990]([v6 setMetadata:v31]);
            v34 = self;
            v35 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              v36 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v55 = v36;
              __int16 v56 = 2112;
              v57 = v26;
              _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_INFO, "%{public}@Storing removed current accessory uuid into local store metadata %@", buf, 0x16u);
            }
          }
        }
        else
        {
          v49 = (void *)MEMORY[0x230FBD990]();
          v50 = self;
          v51 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            v52 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v55 = v52;
            _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_ERROR, "%{public}@Nil accessory uuid/modelID when processing removal for AppleMediaAccessory", buf, 0xCu);
          }
        }

        goto LABEL_41;
      }
      v41 = (void *)MEMORY[0x230FBD990]();
      v42 = self;
      v43 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        v44 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v55 = v44;
        __int16 v56 = 2112;
        v57 = v20;
        __int16 v58 = 2112;
        id v59 = v21;
        v45 = "%{public}@Removed accessory identifier (%@) does not match current accessory media routeID %@";
        v46 = v43;
        os_log_type_t v47 = OS_LOG_TYPE_INFO;
        uint32_t v48 = 32;
        goto LABEL_35;
      }
    }
    else
    {
      v41 = (void *)MEMORY[0x230FBD990]();
      v42 = self;
      v43 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v44 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v55 = v44;
        v45 = "%{public}@Nil current device media route id when processing removal for AppleMediaAccessory";
        v46 = v43;
        os_log_type_t v47 = OS_LOG_TYPE_ERROR;
        uint32_t v48 = 12;
LABEL_35:
        _os_log_impl(&dword_22F52A000, v46, v47, v45, buf, v48);
      }
    }

LABEL_41:

LABEL_42:
    goto LABEL_43;
  }
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E51D040;
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263F08C38], "UUID", a3);
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFAppleMediaAccessory"];
}

@end