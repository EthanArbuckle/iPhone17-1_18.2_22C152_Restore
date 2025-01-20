@interface HMDHelper
+ (id)sharedHelper;
+ (void)setSharedHelper:(id)a3;
- (HMDHelper)initWithExternalProtocol:(id)a3;
- (HMDHelperExternalProtocol)externalProtocol;
- (id)hashedRouteIDForIdentifier:(id)a3;
- (void)setExternalProtocol:(id)a3;
@end

@implementation HMDHelper

- (void).cxx_destruct
{
}

- (void)setExternalProtocol:(id)a3
{
}

- (HMDHelperExternalProtocol)externalProtocol
{
  return self->_externalProtocol;
}

- (id)hashedRouteIDForIdentifier:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v5 = [(HMDHelper *)self externalProtocol];
    v6 = [v5 createAFSecurityConnection];

    if (!v6)
    {
      v18 = (void *)MEMORY[0x230FBD990]();
      v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = HMFGetLogIdentifier();
        LODWORD(v38) = 138543362;
        *(void *)((char *)&v38 + 4) = v20;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Cannot set up a connection to assistantServices framework to hash the routeID", (uint8_t *)&v38, 0xCu);
      }
      v14 = 0;
      goto LABEL_15;
    }
    v7 = dispatch_group_create();
    *(void *)&long long v38 = 0;
    *((void *)&v38 + 1) = &v38;
    uint64_t v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__231758;
    v41 = __Block_byref_object_dispose__231759;
    id v42 = 0;
    dispatch_group_enter(v7);
    v8 = [v4 dataUsingEncoding:4];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __40__HMDHelper_hashedRouteIDForIdentifier___block_invoke;
    v30[3] = &unk_264A29A58;
    v33 = &v38;
    id v31 = v6;
    v9 = v7;
    v32 = v9;
    [v31 processData:v8 usingProcedure:1 completion:v30];
    dispatch_time_t v10 = dispatch_time(0, 15000000000);
    if (dispatch_group_wait(v9, v10))
    {
      v11 = (void *)MEMORY[0x230FBD990]();
      HMFGetOSLogHandle();
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v35 = v13;
        __int16 v36 = 2112;
        id v37 = v4;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Timed out encoding routeID %@", buf, 0x16u);
      }
    }
    else
    {
      v22 = *(void **)(*((void *)&v38 + 1) + 40);
      if (v22)
      {
        v14 = [v22 base64EncodedStringWithOptions:0];
        v23 = (void *)MEMORY[0x230FBD990]();
        if (v14)
        {
          HMFGetOSLogHandle();
          v24 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            v25 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v35 = v25;
            __int16 v36 = 2112;
            id v37 = v14;
            _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Base64-converted hashedRouteUID %@", buf, 0x16u);
          }
          goto LABEL_8;
        }
        HMFGetOSLogHandle();
        v27 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v28 = HMFGetLogIdentifier();
          v29 = *(void **)(*((void *)&v38 + 1) + 40);
          *(_DWORD *)buf = 138543618;
          v35 = v28;
          __int16 v36 = 2112;
          id v37 = v29;
          _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to base64 encode hashedRouteUIDData %@", buf, 0x16u);
        }
LABEL_7:
        v14 = 0;
LABEL_8:

        _Block_object_dispose(&v38, 8);
LABEL_15:

        goto LABEL_16;
      }
      v11 = (void *)MEMORY[0x230FBD990]();
      HMFGetOSLogHandle();
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v35 = v26;
        __int16 v36 = 2112;
        id v37 = v4;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode routeID %@", buf, 0x16u);
      }
    }

    goto LABEL_7;
  }
  v15 = (void *)MEMORY[0x230FBD990]();
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = HMFGetLogIdentifier();
    LODWORD(v38) = 138543362;
    *(void *)((char *)&v38 + 4) = v17;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@nil routeID - nothing to hash", (uint8_t *)&v38, 0xCu);
  }
  v14 = 0;
LABEL_16:

  return v14;
}

void __40__HMDHelper_hashedRouteIDForIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    v7 = (void *)MEMORY[0x230FBD990]();
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = HMFGetLogIdentifier();
      int v13 = 138543618;
      v14 = v9;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Hashed routeUID as %@", (uint8_t *)&v13, 0x16u);
    }
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
  id v12 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (HMDHelper)initWithExternalProtocol:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDHelper;
  id v6 = [(HMDHelper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_externalProtocol, a3);
  }

  return v7;
}

+ (void)setSharedHelper:(id)a3
{
}

+ (id)sharedHelper
{
  return (id)_helper;
}

@end