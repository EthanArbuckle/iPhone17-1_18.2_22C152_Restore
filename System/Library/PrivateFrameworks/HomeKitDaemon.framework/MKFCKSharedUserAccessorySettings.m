@interface MKFCKSharedUserAccessorySettings
+ (BOOL)exportDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6;
+ (BOOL)exportInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5;
+ (BOOL)exportUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6;
+ (BOOL)importDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6;
+ (BOOL)importInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5;
+ (BOOL)importUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6;
+ (id)createWithHomeModelID:(id)a3 accessoryModelID:(id)a4 persistentStore:(id)a5 context:(id)a6;
+ (id)fetchRequest;
- (BOOL)_importIntoLocalUserModel:(id)a3 context:(id)a4;
- (BOOL)_importWithContext:(id)a3;
- (BOOL)importIntoLocalUserModel:(id)a3 context:(id)a4;
@end

@implementation MKFCKSharedUserAccessorySettings

- (BOOL)_importIntoLocalUserModel:(id)a3 context:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(MKFCKSharedUserAccessorySettings *)self accessoryModelID];
  id v17 = 0;
  v9 = +[_MKFModel modelWithModelID:v8 context:v7 error:&v17];
  id v10 = v17;

  if (v9)
  {
    if ([(MKFCKSharedUserAccessorySettings *)self listeningHistoryEnabled]) {
      objc_msgSend(v6, "addAccessoriesWithListeningHistoryEnabled_Object:", v9);
    }
    else {
      objc_msgSend(v6, "removeAccessoriesWithListeningHistoryEnabled_Object:", v9);
    }
    if (-[MKFCKSharedUserAccessorySettings mediaContentProfileEnabled](self, "mediaContentProfileEnabled"))objc_msgSend(v6, "addAccessoriesWithMediaContentProfileEnabled_Object:", v9); {
    else
    }
      objc_msgSend(v6, "removeAccessoriesWithMediaContentProfileEnabled_Object:", v9);
    if ([(MKFCKSharedUserAccessorySettings *)self personalRequestsEnabled]) {
      objc_msgSend(v6, "addAccessoriesWithPersonalRequestsEnabled_Object:", v9);
    }
    else {
      objc_msgSend(v6, "removeAccessoriesWithPersonalRequestsEnabled_Object:", v9);
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      v15 = [(MKFCKSharedUserAccessorySettings *)v12 accessoryModelID];
      *(_DWORD *)buf = 138543874;
      v19 = v14;
      __int16 v20 = 2160;
      uint64_t v21 = 1752392040;
      __int16 v22 = 2112;
      v23 = v15;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not find accessory with modelID %{mask.hash}@, this could be settings for a stale accessory", buf, 0x20u);
    }
  }

  return 1;
}

- (BOOL)_importWithContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(MKFCKSharedUserData *)self workingStoreHomeMember];
  id v6 = v5;
  if (!v5)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      int v15 = 138543362;
      v16 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Could not find associated local user model to import shared user accessory settings", (uint8_t *)&v15, 0xCu);
    }
    goto LABEL_7;
  }
  id v7 = [v5 castIfMemberIsGuest];

  if (v7)
  {
LABEL_7:
    LOBYTE(v9) = 1;
    goto LABEL_8;
  }
  v8 = [v6 castIfMemberIsUser];
  BOOL v9 = [(MKFCKSharedUserAccessorySettings *)self _importIntoLocalUserModel:v8 context:v4];

LABEL_8:
  return v9;
}

- (BOOL)importIntoLocalUserModel:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = ([v6 isOwner] & 1) != 0
    || [(MKFCKSharedUserAccessorySettings *)self _importIntoLocalUserModel:v6 context:v7];

  return v8;
}

+ (BOOL)exportDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)MEMORY[0x263EFF940];
  uint64_t v15 = *MEMORY[0x263EFF498];
  v16 = NSString;
  uint64_t v17 = NSStringFromSelector(a2);
  v18 = [v16 stringWithFormat:@"%@ is unavailable", v17];
  id v19 = [v14 exceptionWithName:v15 reason:v18 userInfo:0];

  objc_exception_throw(v19);
}

+ (BOOL)exportUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)MEMORY[0x263EFF940];
  uint64_t v15 = *MEMORY[0x263EFF498];
  v16 = NSString;
  uint64_t v17 = NSStringFromSelector(a2);
  v18 = [v16 stringWithFormat:@"%@ is unavailable", v17];
  id v19 = [v14 exceptionWithName:v15 reason:v18 userInfo:0];

  objc_exception_throw(v19);
}

+ (BOOL)exportInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x263EFF940];
  uint64_t v12 = *MEMORY[0x263EFF498];
  id v13 = NSString;
  v14 = NSStringFromSelector(a2);
  uint64_t v15 = [v13 stringWithFormat:@"%@ is unavailable", v14];
  id v16 = [v11 exceptionWithName:v12 reason:v15 userInfo:0];

  objc_exception_throw(v16);
}

+ (BOOL)importDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  return 1;
}

+ (BOOL)importUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  uint64_t v11 = 0;
  id v7 = a6;
  id v8 = +[MKFCKModel modelWithObjectID:a3 context:v7 error:&v11];
  char v9 = [v8 _importWithContext:v7];

  return v9;
}

+ (BOOL)importInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5
{
  uint64_t v10 = 0;
  id v6 = a5;
  id v7 = +[MKFCKModel modelWithObjectID:a3 context:v6 error:&v10];
  char v8 = [v7 _importWithContext:v6];

  return v8;
}

+ (id)createWithHomeModelID:(id)a3 accessoryModelID:(id)a4 persistentStore:(id)a5 context:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  objc_msgSend(v10, "hmd_assertIsExecuting");
  v14 = (void *)[objc_alloc((Class)a1) initWithContext:v10];
  [v10 assignObject:v14 toPersistentStore:v11];

  uint64_t v15 = [MEMORY[0x263F08C38] UUID];
  [v14 setModelID:v15];

  [v14 setHomeModelID:v13];
  [v14 setAccessoryModelID:v12];

  return v14;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFCKSharedUserAccessorySettings"];
}

@end