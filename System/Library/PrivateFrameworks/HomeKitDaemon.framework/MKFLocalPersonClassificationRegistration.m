@interface MKFLocalPersonClassificationRegistration
+ (id)fetchPersonClassificationRegistrationForPersonUUID:(id)a3 settingsModelUUID:(id)a4 managedObjectContext:(id)a5;
+ (id)fetchRequest;
@end

@implementation MKFLocalPersonClassificationRegistration

+ (id)fetchPersonClassificationRegistrationForPersonUUID:(id)a3 settingsModelUUID:(id)a4 managedObjectContext:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8) {
    _HMFPreconditionFailure();
  }
  v11 = v10;
  objc_msgSend(v10, "hmd_assertIsExecuting");
  v12 = +[MKFLocalPersonClassificationRegistration fetchRequest];
  v13 = [MEMORY[0x263F08A98] predicateWithFormat:@"(%K == %@) && (%K == %@)", @"personUUID", v8, @"settings.modelID", v9];
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
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v24 = v20;
      __int16 v25 = 2112;
      id v26 = v8;
      __int16 v27 = 2112;
      id v28 = v15;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch person classification registration local settings personUUID:%@: %@", buf, 0x20u);
    }
    v16 = 0;
  }

  return v16;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"LocalPersonClassificationRegistration"];
}

@end