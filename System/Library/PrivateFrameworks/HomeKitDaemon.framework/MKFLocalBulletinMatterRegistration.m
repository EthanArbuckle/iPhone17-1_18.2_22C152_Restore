@interface MKFLocalBulletinMatterRegistration
+ (id)fetchAllMatterRegistrationsForEndpointID:(id)a3 accessoryModelID:(id)a4 managedObjectContext:(id)a5;
+ (id)fetchMatterRegistrationForEndpointID:(id)a3 clusterID:(id)a4 attributeID:(id)a5 eventID:(id)a6 accessoryModelID:(id)a7 managedObjectContext:(id)a8;
+ (id)fetchRequest;
@end

@implementation MKFLocalBulletinMatterRegistration

+ (id)fetchAllMatterRegistrationsForEndpointID:(id)a3 accessoryModelID:(id)a4 managedObjectContext:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
LABEL_12:
    _HMFPreconditionFailure();
  }
  if (!v9) {
    goto LABEL_12;
  }
  v11 = v10;
  objc_msgSend(v10, "hmd_assertIsExecuting");
  v12 = +[MKFLocalBulletinMatterRegistration fetchRequest];
  v13 = [MEMORY[0x263F08A98] predicateWithFormat:@"(%K == %@) && (%K == %@)", @"endpointID", v8, @"accessoryModelID", v9];
  [v12 setPredicate:v13];

  id v22 = 0;
  v14 = [v11 executeFetchRequest:v12 error:&v22];
  id v15 = v22;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = a1;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      v24 = v20;
      __int16 v25 = 2112;
      id v26 = v8;
      __int16 v27 = 2112;
      id v28 = v9;
      __int16 v29 = 2112;
      id v30 = v15;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch local Matter registration for endpointID: %@ accessoryModelID: %@ error: %@", buf, 0x2Au);
    }
  }

  return v14;
}

+ (id)fetchMatterRegistrationForEndpointID:(id)a3 clusterID:(id)a4 attributeID:(id)a5 eventID:(id)a6 accessoryModelID:(id)a7 managedObjectContext:(id)a8
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  unint64_t v16 = (unint64_t)a5;
  unint64_t v17 = (unint64_t)a6;
  id v18 = a7;
  id v19 = a8;
  if (!v14)
  {
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v15)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!(v16 | v17)) {
    goto LABEL_16;
  }
  if (!v18)
  {
LABEL_15:
    _HMFPreconditionFailure();
LABEL_16:
    _HMFPreconditionFailure();
  }
  v20 = v19;
  objc_msgSend(v19, "hmd_assertIsExecuting");
  v21 = +[MKFLocalBulletinMatterRegistration fetchRequest];
  id v22 = [MEMORY[0x263F08A98] predicateWithFormat:@"(%K == %@) && (%K == %@) && (%K == %@) && (%K == %@)", @"endpointID", v14, @"clusterID", v15, @"attributeID", v16, @"eventID", v17, @"accessoryModelID", v18];
  [v21 setPredicate:v22];

  id v31 = 0;
  v23 = [v20 executeFetchRequest:v21 error:&v31];
  id v24 = v31;
  if (v23)
  {
    __int16 v25 = [v23 firstObject];
  }
  else
  {
    context = (void *)MEMORY[0x230FBD990]();
    id v30 = a1;
    id v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544898;
      v33 = v28;
      __int16 v34 = 2112;
      id v35 = v14;
      __int16 v36 = 2112;
      id v37 = v15;
      __int16 v38 = 2112;
      unint64_t v39 = v16;
      __int16 v40 = 2112;
      unint64_t v41 = v17;
      __int16 v42 = 2112;
      id v43 = v18;
      __int16 v44 = 2112;
      id v45 = v24;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch local Matter registration for endpointID: %@ clusterID: %@ attributeID: %@ eventID: %@ accessoryModelID: %@ error: %@", buf, 0x48u);
    }
    __int16 v25 = 0;
  }

  return v25;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"LocalBulletinMatterRegistration"];
}

@end