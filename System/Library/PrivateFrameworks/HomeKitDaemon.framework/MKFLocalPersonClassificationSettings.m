@interface MKFLocalPersonClassificationSettings
+ (id)fetchPersonClassificationSettingsForModelID:(id)a3 managedObjectContext:(id)a4;
+ (id)fetchRequest;
@end

@implementation MKFLocalPersonClassificationSettings

+ (id)fetchPersonClassificationSettingsForModelID:(id)a3 managedObjectContext:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    _HMFPreconditionFailure();
  }
  v8 = v7;
  objc_msgSend(v7, "hmd_assertIsExecuting");
  v9 = +[MKFLocalPersonClassificationSettings fetchRequest];
  v10 = [MEMORY[0x263F08A98] predicateWithFormat:@"(%K == %@)", @"modelID", v6];
  [v9 setPredicate:v10];

  id v19 = 0;
  v11 = [v8 executeFetchRequest:v9 error:&v19];
  id v12 = v19;
  if (v11)
  {
    v13 = [v11 firstObject];
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
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch person classification local settings modelID: %@: %@", buf, 0x20u);
    }
    v13 = 0;
  }

  return v13;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"LocalPersonClassificationSettings"];
}

@end