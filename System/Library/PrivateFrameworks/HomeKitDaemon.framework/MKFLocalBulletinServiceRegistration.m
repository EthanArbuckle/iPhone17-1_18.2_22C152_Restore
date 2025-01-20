@interface MKFLocalBulletinServiceRegistration
+ (id)fetchRequest;
+ (id)fetchServiceRegistrationForAccessoryUUID:(id)a3 serviceInstanceID:(id)a4 managedObjectContext:(id)a5;
@end

@implementation MKFLocalBulletinServiceRegistration

+ (id)fetchServiceRegistrationForAccessoryUUID:(id)a3 serviceInstanceID:(id)a4 managedObjectContext:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8) {
    _HMFPreconditionFailure();
  }
  v11 = v10;
  v12 = +[MKFLocalBulletinServiceRegistration fetchRequest];
  v13 = (void *)MEMORY[0x263F08A98];
  v14 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v9, "longLongValue"));
  v15 = HAPInstanceIDFromValue();
  v16 = [v13 predicateWithFormat:@"(%K == %@) AND (%K == %@ OR %K == %@)", @"accessoryModelID", v8, @"serviceInstanceID", v14, @"serviceInstanceID", v15];
  [v12 setPredicate:v16];

  id v25 = 0;
  v17 = [v11 executeFetchRequest:v12 error:&v25];
  id v18 = v25;
  if (v17)
  {
    v19 = [v17 firstObject];
  }
  else
  {
    v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = a1;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      v27 = v23;
      __int16 v28 = 2112;
      id v29 = v8;
      __int16 v30 = 2112;
      id v31 = v9;
      __int16 v32 = 2112;
      id v33 = v18;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch local service registration for accessoryUUID: %@, serviceInstanceID: %@ error: %@", buf, 0x2Au);
    }
    v19 = 0;
  }

  return v19;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"LocalBulletinServiceRegistration"];
}

@end