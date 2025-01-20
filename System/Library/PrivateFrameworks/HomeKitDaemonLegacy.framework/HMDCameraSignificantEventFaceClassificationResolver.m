@interface HMDCameraSignificantEventFaceClassificationResolver
+ (id)logCategory;
- (HMDCameraSignificantEventFaceClassificationResolver)initWithHome:(id)a3;
- (HMDHome)home;
- (id)_faceClassificationForSignificantEventFaceClassifications:(id)a3 user:(id)a4;
- (id)faceClassificationForSignificantEventFaceClassifications:(id)a3;
- (id)logIdentifier;
- (id)personManagerWithUUID:(id)a3;
- (void)setHome:(id)a3;
@end

@implementation HMDCameraSignificantEventFaceClassificationResolver

- (void).cxx_destruct
{
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDCameraSignificantEventFaceClassificationResolver *)self home];
  v3 = [v2 uuid];
  v4 = [v3 UUIDString];

  return v4;
}

- (id)personManagerWithUUID:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDCameraSignificantEventFaceClassificationResolver *)self home];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 personManager];
    v8 = [v7 UUID];
    int v9 = [v4 isEqual:v8];

    if (v9)
    {
      id v10 = v7;
    }
    else
    {
      v15 = [v6 users];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __77__HMDCameraSignificantEventFaceClassificationResolver_personManagerWithUUID___block_invoke;
      v18[3] = &unk_1E6A12608;
      id v19 = v4;
      v16 = objc_msgSend(v15, "na_firstObjectPassingTest:", v18);
      id v10 = [v16 photosPersonManager];
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x1D9452090]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v21 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Returning nil because home reference is nil", buf, 0xCu);
    }
    id v10 = 0;
  }

  return v10;
}

uint64_t __77__HMDCameraSignificantEventFaceClassificationResolver_personManagerWithUUID___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 photosPersonManager];
  id v4 = [v3 UUID];
  uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];

  return v5;
}

- (id)_faceClassificationForSignificantEventFaceClassifications:(id)a3 user:(id)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v58 = a4;
  v65 = [(HMDCameraSignificantEventFaceClassificationResolver *)self home];
  if (v65)
  {
    v60 = [MEMORY[0x1E4F1CA48] array];
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v57 = v6;
    id obj = v6;
    uint64_t v64 = [obj countByEnumeratingWithState:&v66 objects:v74 count:16];
    if (v64)
    {
      v59 = self;
      v62 = 0;
      uint64_t v63 = *(void *)v67;
      v7 = v58;
LABEL_4:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v67 != v63) {
          objc_enumerationMutation(obj);
        }
        int v9 = *(void **)(*((void *)&v66 + 1) + 8 * v8);
        id v10 = [v7 photosPersonManager];
        v11 = [v9 personManagerUUID];
        v12 = [v10 UUID];
        int v13 = [v11 isEqual:v12];

        if (v13)
        {
          v14 = [v9 personUUID];
          if (v14)
          {
            uint64_t v15 = [v10 personWithUUID:v14];
            if (v15)
            {
              v48 = (void *)v15;
              id v49 = objc_alloc(MEMORY[0x1E4F2E7C0]);
              v50 = [v9 personManagerUUID];
              v51 = (void *)[v49 initWithPersonManagerUUID:v50 person:v48 faceCrop:0];

              if (!v51) {
                goto LABEL_41;
              }
              id v52 = v51;
              v47 = v52;
              id v6 = v57;
              v53 = v60;
              goto LABEL_45;
            }
          }
        }
        v16 = [v65 personManager];
        v17 = [v9 personManagerUUID];
        v18 = [v16 UUID];
        int v19 = [v17 isEqual:v18];

        if (!v19) {
          goto LABEL_25;
        }
        v20 = [v9 personUUID];
        if (v20 && ([v16 personWithUUID:v20], (uint64_t v21 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          uint64_t v22 = (void *)v21;
          id v23 = objc_alloc(MEMORY[0x1E4F2E7C0]);
          v24 = [v9 personManagerUUID];
          uint64_t v25 = [v23 initWithPersonManagerUUID:v24 person:v22 faceCrop:0];
        }
        else
        {
          uint64_t v22 = [v9 unassociatedFaceCropUUID];
          if (!v22) {
            goto LABEL_24;
          }
          uint64_t v26 = [v16 unassociatedFaceCropWithUUID:v22];
          if (v26)
          {
            v27 = (void *)v26;
            id v28 = objc_alloc(MEMORY[0x1E4F2E7C0]);
            v29 = [v9 personManagerUUID];
            uint64_t v25 = [v28 initWithPersonManagerUUID:v29 person:0 faceCrop:v27];
            v30 = v62;
          }
          else
          {
            v31 = [v16 personFaceCropWithUnassociatedFaceCropUUID:v22];
            v27 = v31;
            if (!v31
              || ([v31 personUUID],
                  v32 = objc_claimAutoreleasedReturnValue(),
                  [v16 personWithUUID:v32],
                  v29 = objc_claimAutoreleasedReturnValue(),
                  v32,
                  !v29))
            {

LABEL_24:
LABEL_25:
              v20 = [v9 personUUID];
              uint64_t v34 = [v9 personName];
              uint64_t v22 = (void *)v34;
              if (v20 && v34)
              {
                v35 = (void *)[objc_alloc(MEMORY[0x1E4F2E988]) initWithUUID:v20];
                [v35 setName:v22];
                id v36 = objc_alloc(MEMORY[0x1E4F2E7C0]);
                v37 = [v9 personManagerUUID];
                v38 = (void *)[v36 initWithPersonManagerUUID:v37 person:v35 faceCrop:0];

                [v60 addObject:v38];
              }
              else
              {
                v39 = (void *)MEMORY[0x1D9452090]();
                v40 = v59;
                v41 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                {
                  v42 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  v71 = v42;
                  __int16 v72 = 2112;
                  v73 = v9;
                  _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@Could not determine face classification for significant event face classification: %@", buf, 0x16u);

                  v7 = v58;
                }
              }
              goto LABEL_31;
            }
            id v33 = objc_alloc(MEMORY[0x1E4F2E7C0]);
            v30 = [v9 personManagerUUID];
            uint64_t v25 = [v33 initWithPersonManagerUUID:v30 person:v29 faceCrop:0];
          }
        }
        v62 = (void *)v25;
LABEL_31:

        if (v64 == ++v8)
        {
          uint64_t v64 = [obj countByEnumeratingWithState:&v66 objects:v74 count:16];
          if (v64) {
            goto LABEL_4;
          }
          goto LABEL_40;
        }
      }
    }
    v62 = 0;
LABEL_40:

LABEL_41:
    v53 = v60;
    if (v62) {
      objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:");
    }
    else {
    v54 = [MEMORY[0x1E4F1CA48] array];
    }
    id v6 = v57;
    v55 = [v60 sortedArrayUsingComparator:&__block_literal_global_86314];
    [v54 addObjectsFromArray:v55];
    [v54 sortWithOptions:16 usingComparator:&__block_literal_global_4];
    v47 = [v54 firstObject];

    id v52 = 0;
LABEL_45:
  }
  else
  {
    v43 = (void *)MEMORY[0x1D9452090]();
    v44 = self;
    v45 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v71 = v46;
      _os_log_impl(&dword_1D49D5000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@Not returning a face classification because home reference is nil", buf, 0xCu);
    }
    v47 = 0;
  }

  return v47;
}

uint64_t __118__HMDCameraSignificantEventFaceClassificationResolver__faceClassificationForSignificantEventFaceClassifications_user___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 person];
  uint64_t v7 = [v6 name];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    int v9 = [v5 person];
    id v10 = [v9 name];

    if (!v10)
    {
      uint64_t v11 = -1;
      goto LABEL_8;
    }
  }
  else
  {
  }
  v12 = [v5 person];
  uint64_t v13 = [v12 name];
  if (v13)
  {
    v14 = (void *)v13;
    uint64_t v15 = [v4 person];
    v16 = [v15 name];
    uint64_t v11 = v16 == 0;
  }
  else
  {

    uint64_t v11 = 0;
  }
LABEL_8:

  return v11;
}

uint64_t __118__HMDCameraSignificantEventFaceClassificationResolver__faceClassificationForSignificantEventFaceClassifications_user___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 personManagerUUID];
  id v6 = [v5 UUIDString];
  uint64_t v7 = [v4 personManagerUUID];

  uint64_t v8 = [v7 UUIDString];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

- (id)faceClassificationForSignificantEventFaceClassifications:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCameraSignificantEventFaceClassificationResolver *)self home];
  id v6 = [v5 currentUser];
  uint64_t v7 = [(HMDCameraSignificantEventFaceClassificationResolver *)self _faceClassificationForSignificantEventFaceClassifications:v4 user:v6];

  return v7;
}

- (HMDCameraSignificantEventFaceClassificationResolver)initWithHome:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDCameraSignificantEventFaceClassificationResolver;
  id v5 = [(HMDCameraSignificantEventFaceClassificationResolver *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_home, v4);
  }

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_86323 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_86323, &__block_literal_global_8_86324);
  }
  v2 = (void *)logCategory__hmf_once_v4_86325;
  return v2;
}

uint64_t __66__HMDCameraSignificantEventFaceClassificationResolver_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v4_86325;
  logCategory__hmf_once_v4_86325 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end