@interface MKFLocalBulletinEndpointRegistration
+ (id)fetchAllEndpointRegistrationsForAccessoryUUID:(id)a3 managedObjectContext:(id)a4;
+ (id)fetchEndpointRegistrationForAccessoryUUID:(id)a3 endpointID:(id)a4 managedObjectContext:(id)a5;
+ (id)fetchRequest;
@end

@implementation MKFLocalBulletinEndpointRegistration

+ (id)fetchAllEndpointRegistrationsForAccessoryUUID:(id)a3 managedObjectContext:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    _HMFPreconditionFailure();
  }
  v8 = v7;
  objc_msgSend(v7, "hmd_assertIsExecuting");
  v9 = +[MKFLocalBulletinEndpointRegistration fetchRequest];
  v10 = [MEMORY[0x263F08A98] predicateWithFormat:@"(%K == %@)", @"accessoryModelID", v6];
  [v9 setPredicate:v10];

  id v19 = 0;
  v11 = [v8 executeFetchRequest:v9 error:&v19];
  id v12 = v19;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = a1;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v21 = v17;
      __int16 v22 = 2112;
      id v23 = v6;
      __int16 v24 = 2112;
      id v25 = v12;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch local endpoint registrations for accessoryUUID: %@ error: %@", buf, 0x20u);
    }
  }

  return v11;
}

+ (id)fetchEndpointRegistrationForAccessoryUUID:(id)a3 endpointID:(id)a4 managedObjectContext:(id)a5
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
  id v12 = +[MKFLocalBulletinEndpointRegistration fetchRequest];
  id v13 = [MEMORY[0x263F08A98] predicateWithFormat:@"(%K == %@) AND (%K == %@)", @"accessoryModelID", v8, @"endpointID", v9];
  [v12 setPredicate:v13];

  id v22 = 0;
  v14 = [v11 executeFetchRequest:v12 error:&v22];
  id v15 = v22;
  if (v14)
  {
    v16 = [v14 firstObject];
  }
  else
  {
    v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = a1;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      __int16 v24 = v20;
      __int16 v25 = 2112;
      id v26 = v8;
      __int16 v27 = 2112;
      id v28 = v9;
      __int16 v29 = 2112;
      id v30 = v15;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch local endpoint registration for accessoryUUID: %@ endpointID: %@ error: %@", buf, 0x2Au);
    }
    v16 = 0;
  }

  return v16;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"LocalBulletinEndpointRegistration"];
}

@end