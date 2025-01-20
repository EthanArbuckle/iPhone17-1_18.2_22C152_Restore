@interface MKFCKSharedUserData
+ (id)fetchRequest;
+ (id)rootKeyPath;
- (id)workingStoreHomeMember;
@end

@implementation MKFCKSharedUserData

+ (id)rootKeyPath
{
  return @"root";
}

- (void).cxx_destruct
{
}

- (id)workingStoreHomeMember
{
  v44[1] = *MEMORY[0x263EF8340];
  p_workingStoreHomeMember = &self->_workingStoreHomeMember;
  workingStoreHomeMember = self->_workingStoreHomeMember;
  if (workingStoreHomeMember)
  {
    v4 = (HMDHomeMember *)*MEMORY[0x263EFFD08];
  }
  else
  {
    v6 = [(MKFCKSharedUserData *)self managedObjectContext];
    v7 = objc_msgSend(v6, "hmd_coreData");
    v8 = [v7 container];

    if (!v8) {
      _HMFPreconditionFailure();
    }
    v9 = [(MKFCKSharedUserData *)self objectID];
    v44[0] = v9;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:1];
    v11 = [v8 fetchSharesMatchingObjectIDs:v10 error:0];
    v12 = [v11 objectForKeyedSubscript:v9];

    if (v12)
    {
      v13 = [(MKFCKSharedUserData *)self homeModelID];
      if (v13)
      {
        v14 = [v12 recordID];
        v15 = +[_MKFHome findHomeMemberUsingReverseShareID:v14 homeModelID:v13 context:v6];

        if (v15)
        {
          id v16 = v15;
        }
        else
        {
          v27 = (void *)MEMORY[0x230FBD990]();
          v28 = self;
          v29 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v30 = v37 = v28;
            objc_msgSend(v9, "hmd_debugIdentifier");
            v31 = v39 = v27;
            *(_DWORD *)buf = 138543618;
            v41 = v30;
            __int16 v42 = 2112;
            v43 = v31;
            _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch working store user for %@", buf, 0x16u);

            v27 = v39;
            v28 = v37;
          }
        }
      }
      else
      {
        v22 = (void *)MEMORY[0x230FBD990]();
        v23 = self;
        v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          v25 = HMFGetLogIdentifier();
          objc_msgSend(v9, "hmd_debugIdentifier");
          v26 = v38 = v22;
          *(_DWORD *)buf = 138543618;
          v41 = v25;
          __int16 v42 = 2112;
          v43 = v26;
          _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_DEBUG, "%{public}@No homeModelID for %@", buf, 0x16u);

          v22 = v38;
        }

        v15 = 0;
      }
    }
    else
    {
      v17 = (void *)MEMORY[0x230FBD990]();
      v18 = self;
      v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v20 = HMFGetLogIdentifier();
        v21 = objc_msgSend(v9, "hmd_debugIdentifier");
        *(_DWORD *)buf = 138543618;
        v41 = v20;
        __int16 v42 = 2112;
        v43 = v21;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_DEBUG, "%{public}@No CKShare found for %@", buf, 0x16u);
      }
      v15 = 0;
    }

    v4 = (HMDHomeMember *)*MEMORY[0x263EFFD08];
    if (v15) {
      v32 = v15;
    }
    else {
      v32 = (void *)*MEMORY[0x263EFFD08];
    }
    objc_storeStrong((id *)p_workingStoreHomeMember, v32);

    workingStoreHomeMember = *p_workingStoreHomeMember;
  }
  v33 = workingStoreHomeMember;
  v34 = v33;
  if (v4 == v33) {
    v33 = 0;
  }
  v35 = v33;

  return v35;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFCKSharedUserData"];
}

@end