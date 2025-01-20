@interface MKFCKSharedHome
+ (BOOL)exportDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6;
+ (BOOL)exportInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5;
+ (BOOL)exportUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6;
+ (BOOL)importDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6;
+ (BOOL)importInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5;
+ (BOOL)importUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6;
+ (id)createWithModelID:(id)a3 persistentStore:(id)a4 context:(id)a5;
+ (id)fetchRequest;
+ (id)rootKeyPath;
- (id)createLocalModelWithContext:(id)a3;
@end

@implementation MKFCKSharedHome

+ (BOOL)exportDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)MEMORY[0x263EFF940];
  uint64_t v15 = *MEMORY[0x263EFF498];
  v16 = NSString;
  v17 = NSStringFromSelector(a2);
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
  v17 = NSStringFromSelector(a2);
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
  return +[MKFCKHome importDeleteWithObjectID:a3 modelID:a4 additionalUpdates:a5 context:a6];
}

+ (BOOL)importUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v7 = a6;
  id v8 = [v7 objectWithID:a3];
  id v9 = v7;
  if (v8)
  {
    id v10 = [v8 modelID];
    id v11 = +[_MKFModel modelWithModelID:v10 context:v9];

    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = v8;
    v14 = HMFGetOSLogHandle();
    uint64_t v15 = v14;
    if (!v11)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        v28 = HMFGetLogIdentifier();
        v29 = [v13 modelID];
        int v42 = 138543874;
        v43 = v28;
        __int16 v44 = 2160;
        uint64_t v45 = 1752392040;
        __int16 v46 = 2112;
        v47 = v29;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_FAULT, "%{public}@No existing local model for shared home with modelID %{mask.hash}@, skipping update", (uint8_t *)&v42, 0x20u);
      }
      goto LABEL_20;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      v17 = [v13 modelID];
      int v42 = 138543874;
      v43 = v16;
      __int16 v44 = 2160;
      uint64_t v45 = 1752392040;
      __int16 v46 = 2112;
      v47 = v17;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Found existing local model for shared home with modelID %{mask.hash}@", (uint8_t *)&v42, 0x20u);
    }
    v18 = +[HMDAccountHandleFormatter defaultFormatter];
    id v19 = [v13 ownerAccountHandle];
    v20 = [v18 accountHandleFromString:v19];

    if (v20)
    {
      v21 = [v11 owner];

      if (!v21)
      {
        v36 = (void *)MEMORY[0x230FBD990]();
        id v37 = v13;
        v38 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
        {
          v39 = HMFGetLogIdentifier();
          v40 = [v37 modelID];
          int v42 = 138543874;
          v43 = v39;
          __int16 v44 = 2160;
          uint64_t v45 = 1752392040;
          __int16 v46 = 2112;
          v47 = v40;
          _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_FAULT, "%{public}@Local home model with modelID %{mask.hash}@ does not have an owner user", (uint8_t *)&v42, 0x20u);
        }
        goto LABEL_19;
      }
      v22 = [v11 owner];
      v23 = [v22 accountHandle];
      char v24 = [v23 isEqual:v20];

      if (v24)
      {
LABEL_19:

LABEL_20:
        goto LABEL_21;
      }
      v25 = [v11 owner];
      v26 = v25;
      v27 = v20;
    }
    else
    {
      v30 = (void *)MEMORY[0x230FBD990]();
      id v31 = v13;
      v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = HMFGetLogIdentifier();
        v34 = [v31 ownerAccountHandle];
        v35 = [v31 modelID];
        int v42 = 138544386;
        v43 = v33;
        __int16 v44 = 2160;
        uint64_t v45 = 1752392040;
        __int16 v46 = 2112;
        v47 = v34;
        __int16 v48 = 2160;
        uint64_t v49 = 1752392040;
        __int16 v50 = 2112;
        v51 = v35;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Invalid account handle %{mask.hash}@ found on shared home with model ID %{mask.hash}@", (uint8_t *)&v42, 0x34u);
      }
      v25 = [v11 owner];
      v26 = v25;
      v27 = 0;
    }
    [v25 setAccountHandle:v27];

    goto LABEL_19;
  }
LABEL_21:

  return v8 != 0;
}

+ (BOOL)importInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v6 = a5;
  id v7 = [v6 objectWithID:a3];
  id v8 = v6;
  if (!v7)
  {
    BOOL v68 = 0;
    goto LABEL_34;
  }
  id v9 = [v7 modelID];
  id v10 = +[_MKFModel modelWithModelID:v9 context:v8];

  if (v10)
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = v7;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = HMFGetLogIdentifier();
      uint64_t v15 = [v12 modelID];
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2160;
      *(void *)&buf[14] = 1752392040;
      *(_WORD *)&buf[22] = 2112;
      v83 = v15;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Found existing local home with modelID %{mask.hash}@, skipping insert", buf, 0x20u);
    }
  }
  else
  {
    id v16 = [v7 createLocalModelWithContext:v8];
    id v17 = v8;
    v18 = [v7 name];
    [v16 setName:v18];

    id v19 = v16;
    id v20 = v17;
    v21 = [v7 defaultRoomModelID];
    v22 = +[_MKFModel modelWithModelID:v21 context:v20];

    if (v22)
    {
      v23 = (void *)MEMORY[0x230FBD990]();
      id v24 = v7;
      v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        v26 = HMFGetLogIdentifier();
        v27 = [v24 modelID];
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v26;
        *(_WORD *)&buf[12] = 2160;
        *(void *)&buf[14] = 1752392040;
        *(_WORD *)&buf[22] = 2112;
        v83 = v27;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Found existing local room with modelID %{mask.hash}@, skipping insert", buf, 0x20u);
      }
    }
    else
    {
      v22 = [[_MKFRoom alloc] initWithContext:v20];
      v28 = [v7 defaultRoomModelID];
      [(_MKFRoom *)v22 setModelID:v28];

      v29 = HMDDefaultRoomName();
      [(_MKFRoom *)v22 setName:v29];

      [(_MKFRoom *)v22 setHome:v19];
      v30 = [v7 writerTimestamp];
      [(_MKFRoom *)v22 setWriterTimestamp:v30];
    }
    id v31 = [v19 defaultRoom];
    char v32 = HMFEqualObjects();

    if ((v32 & 1) == 0)
    {
      v33 = [v19 defaultRoom];

      if (v33)
      {
        v34 = [v19 defaultRoom];
        [v20 deleteObject:v34];
      }
      [v19 setDefaultRoom:v22];
    }

    id v10 = v19;
    id v35 = v20;
    v36 = [v7 ownerModelID];
    id v37 = +[_MKFModel modelWithModelID:v36 context:v35];

    if (!v37)
    {
      id v37 = [[_MKFUser alloc] initWithContext:v35];
      v38 = [v7 ownerModelID];
      [(_MKFUser *)v37 setModelID:v38];

      v39 = +[HMDAccountHandleFormatter defaultFormatter];
      v40 = [v7 ownerAccountHandle];
      v41 = [v39 accountHandleFromString:v40];
      [(_MKFUser *)v37 setAccountHandle:v41];

      [(_MKFUser *)v37 setAnnounceAccessLevel:&unk_26E471DE8];
      [(_MKFUser *)v37 setCamerasAccessLevel:&unk_26E471DE8];
      [(_MKFUser *)v37 setRemoteAccessAllowed:MEMORY[0x263EFFA88]];
      [(_MKFUser *)v37 setPrivilege:&unk_26E471E00];
      [(_MKFUser *)v37 setHome:v10];
      int v42 = [v7 writerTimestamp];
      [(_MKFUser *)v37 setWriterTimestamp:v42];
    }
    v43 = [v10 owner];
    char v44 = HMFEqualObjects();

    if ((v44 & 1) == 0) {
      [v10 setOwner:v37];
    }

    id v45 = v35;
    uint64_t v76 = 0;
    v77 = &v76;
    uint64_t v78 = 0x3032000000;
    v79 = __Block_byref_object_copy__143332;
    v80 = __Block_byref_object_dispose__143333;
    id v75 = 0;
    __int16 v46 = +[_MKFHomeManager fetchWithContext:v45 error:&v75];
    id v47 = v75;
    id v81 = v46;
    __int16 v48 = (void *)v77[5];
    if (v48)
    {
      uint64_t v71 = 0;
      v72 = &v71;
      uint64_t v73 = 0x2020000000;
      char v74 = 1;
      uint64_t v49 = [v48 homes];
      v70[0] = MEMORY[0x263EF8330];
      v70[1] = 3221225472;
      v70[2] = __49__MKFCKSharedHome__importHomeManagerWithContext___block_invoke;
      v70[3] = &unk_264A217B0;
      v70[4] = v7;
      v70[5] = &v71;
      objc_msgSend(v49, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v70);

      if (*((unsigned char *)v72 + 24))
      {
        __int16 v50 = +[MKFCKHome _homeManagerContextFromContext:v45];
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __49__MKFCKSharedHome__importHomeManagerWithContext___block_invoke_2;
        v83 = &unk_264A2F698;
        v86 = &v76;
        id v51 = v50;
        id v84 = v51;
        v85 = v7;
        [v51 performBlockAndWait:buf];
      }
      _Block_object_dispose(&v71, 8);
    }
    else
    {
      uint64_t v52 = (void *)MEMORY[0x230FBD990]();
      id v53 = v7;
      HMFGetOSLogHandle();
      v54 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        v55 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v55;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v47;
        _os_log_impl(&dword_22F52A000, v54, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch home manager: %{public}@", buf, 0x16u);
      }
    }
    _Block_object_dispose(&v76, 8);

    if (!v48)
    {
      BOOL v68 = 0;
      goto LABEL_33;
    }
    v56 = (void *)MEMORY[0x230FBD990]();
    id v57 = v7;
    v58 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      v59 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v59;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v10;
      _os_log_impl(&dword_22F52A000, v58, OS_LOG_TYPE_DEFAULT, "%{public}@Created new model during import: %@", buf, 0x16u);
    }
    v60 = (void *)MEMORY[0x230FBD990]();
    id v61 = v57;
    v62 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
    {
      v63 = HMFGetLogIdentifier();
      v64 = [v10 debugDescription];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v63;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v64;
      _os_log_impl(&dword_22F52A000, v62, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);
    }
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v65 = v61;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v66 = HMFGetLogIdentifier();
      v67 = [v65 debugDescription];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v66;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v67;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEBUG, "%{public}@%@", buf, 0x16u);
    }
  }

  BOOL v68 = 1;
LABEL_33:

LABEL_34:
  return v68;
}

void __49__MKFCKSharedHome__importHomeManagerWithContext___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 modelID];
  id v8 = [v6 handle];

  id v9 = [v8 homeUUID];
  int v10 = [v7 isEqual:v9];

  if (v10)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
}

void __49__MKFCKSharedHome__importHomeManagerWithContext___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v13 = 0;
  uint64_t v3 = +[_MKFHomeManager fetchWithContext:v2 error:&v13];
  id v4 = v13;
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;

  if (!v4)
  {
    id v7 = [*(id *)(a1 + 40) modelID];
    id v8 = +[MKFCKHome _homeManagerHomeWithModelID:v7 homeManager:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) context:*(void *)(a1 + 32)];

    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 40);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v12;
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Created new home manager home during import: %@", buf, 0x16u);
    }
  }
}

+ (id)createWithModelID:(id)a3 persistentStore:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithContext:v8];
  [v8 assignObject:v11 toPersistentStore:v9];

  [v11 setModelID:v10];
  return v11;
}

+ (id)rootKeyPath
{
  return 0;
}

- (id)createLocalModelWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[_MKFHome alloc] initWithContext:v4];

  [(_MKFHome *)v5 setOwned:MEMORY[0x263EFFA80]];
  id v6 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  id v9 = [(MKFCKSharedHome *)self modelID];
  [(_MKFHome *)v8 setModelID:v9];

  id v10 = [(MKFCKSharedHome *)self writerTimestamp];
  [(_MKFHome *)v8 setWriterTimestamp:v10];

  id v11 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  return v13;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFCKSharedHome"];
}

@end