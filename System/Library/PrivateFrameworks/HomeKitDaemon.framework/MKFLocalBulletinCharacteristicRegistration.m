@interface MKFLocalBulletinCharacteristicRegistration
+ (id)fetchCharacteristicRegistrationForAccessoryUUID:(id)a3 serviceInstanceID:(id)a4 characteristicInstanceID:(id)a5 managedObjectContext:(id)a6;
+ (id)fetchRequest;
@end

@implementation MKFLocalBulletinCharacteristicRegistration

+ (id)fetchCharacteristicRegistrationForAccessoryUUID:(id)a3 serviceInstanceID:(id)a4 characteristicInstanceID:(id)a5 managedObjectContext:(id)a6
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v11)
  {
LABEL_13:
    _HMFPreconditionFailure();
LABEL_14:
    _HMFPreconditionFailure();
  }
  if (!v12) {
    goto LABEL_14;
  }
  v14 = v13;
  id v30 = a1;
  v15 = +[MKFLocalBulletinCharacteristicRegistration fetchRequest];
  v16 = (void *)MEMORY[0x263F08A98];
  v17 = HAPInstanceIDFromValue();
  v18 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v11, "longLongValue"));
  v19 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v12, "longLongValue"));
  v20 = HAPInstanceIDFromValue();
  v21 = [v16 predicateWithFormat:@"(%K == %@) AND (%K == %@ OR %@ == %@) AND (%K == %@ OR %@ == %@)", @"accessoryModelID", v10, @"serviceInstanceID", v17, @"serviceInstanceID", v18, @"characteristicInstanceID", v19, @"characteristicInstanceID", v20];
  [v15 setPredicate:v21];

  id v32 = 0;
  v22 = [v14 executeFetchRequest:v15 error:&v32];
  id v23 = v32;
  if (v22)
  {
    v24 = [v22 firstObject];
  }
  else
  {
    v25 = (void *)MEMORY[0x230FBD990]();
    id v26 = v30;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = v31 = v25;
      *(_DWORD *)buf = 138544386;
      v34 = v28;
      __int16 v35 = 2112;
      id v36 = v10;
      __int16 v37 = 2112;
      id v38 = v11;
      __int16 v39 = 2112;
      id v40 = v12;
      __int16 v41 = 2112;
      id v42 = v23;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch local characteristic bulletin registration with accessoryUUID %@: serviceInstanceID: %@ characteristicInstanceID: %@ error: %@", buf, 0x34u);

      v25 = v31;
    }

    v24 = 0;
  }

  return v24;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"LocalBulletinCharacteristicRegistration"];
}

@end