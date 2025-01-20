@interface HMDMPCSessionController
- (HMDMPCSessionController)initWithLogEventSubmitter:(id)a3;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSOperationQueue)speakerGroupCommandOperationQueue;
- (void)executeSessionWithSessionData:(id)a3 completion:(id)a4;
@end

@implementation HMDMPCSessionController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_speakerGroupCommandOperationQueue, 0);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (NSOperationQueue)speakerGroupCommandOperationQueue
{
  return self->_speakerGroupCommandOperationQueue;
}

- (void)executeSessionWithSessionData:(id)a3 completion:(id)a4
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  obuint64_t j = a4;
  v86 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"HMDMPCSessionCreation"];
  v84 = self;
  v82 = v6;
  if (self)
  {
    id v7 = v6;
    v8 = [v7 mediaProfiles];
    v9 = objc_msgSend(v8, "na_map:", &__block_literal_global_191548);

    v10 = [HMDMPCSessionControllerExecutionEvent alloc];
    v11 = [v7 playbackArchive];
    v12 = [v7 playbackStateNumber];
    v13 = [v7 playbackVolumeNumber];
    v14 = [v7 source];
    v15 = [v7 clientName];

    v16 = [v9 allObjects];
    self = [(HMDMediaPlaybackActionEvent *)v10 initWithIsPlaybackArchivePresent:v11 != 0 playbackStateNumber:v12 volumeNumber:v13 sourceNumber:v14 sourceClientName:v15 accessories:v16];
  }
  v80 = [MEMORY[0x1E4F29128] UUID];
  v17 = (void *)MEMORY[0x1D9452090]();
  val = v84;
  v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v118 = v19;
    __int16 v119 = 2112;
    v120 = v80;
    _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Running MPC media session with sessionUUID: %@", buf, 0x16u);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__HMDMPCSessionController_executeSessionWithSessionData_completion___block_invoke;
  aBlock[3] = &unk_1E6A19A28;
  id v79 = v86;
  id v104 = v79;
  v105 = val;
  v78 = self;
  v106 = v78;
  id v77 = obj;
  id v107 = v77;
  v81 = (void (**)(void *, void *))_Block_copy(aBlock);
  id v20 = [v82 mediaProfiles];
  v83 = v20;
  if (v84)
  {
    v85 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v20, "count"));
    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    id obja = v83;
    uint64_t v21 = [obja countByEnumeratingWithState:&v108 objects:buf count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v109;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v109 != v22) {
            objc_enumerationMutation(obja);
          }
          v24 = *(void **)(*((void *)&v108 + 1) + 8 * i);
          v25 = [v24 accessory];
          v26 = v25;
          if (v25 && [v25 providesHashRouteID])
          {
            v27 = [v26 hashRouteID];
            if (v27)
            {
              [v85 addObject:v27];
            }
            else
            {
              v32 = (void *)MEMORY[0x1D9452090]();
              v33 = val;
              v34 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              {
                v35 = HMFGetLogIdentifier();
                *(_DWORD *)v113 = 138543618;
                v114 = v35;
                __int16 v115 = 2112;
                v116 = v24;
                _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_ERROR, "%{public}@Nil hashed route id for media profile: %@", v113, 0x16u);
              }
            }
          }
          else
          {
            v28 = (void *)MEMORY[0x1D9452090]();
            v29 = val;
            v30 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              v31 = HMFGetLogIdentifier();
              *(_DWORD *)v113 = 138543618;
              v114 = v31;
              __int16 v115 = 2112;
              v116 = v24;
              _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_ERROR, "%{public}@No hashed route id for media profile: %@", v113, 0x16u);
            }
          }
        }
        uint64_t v21 = [obja countByEnumeratingWithState:&v108 objects:buf count:16];
      }
      while (v21);
    }

    v36 = (void *)[v85 copy];
  }
  else
  {
    v36 = 0;
  }

  id v37 = v36;
  id v38 = v82;
  if (!v84) {
    goto LABEL_43;
  }
  if ([v37 count])
  {
    v39 = [v38 playbackStateNumber];
    if (v39)
    {
    }
    else
    {
      v41 = [v38 playbackVolumeNumber];
      BOOL v42 = v41 == 0;

      if (v42)
      {
        uint64_t v40 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2952];
        goto LABEL_45;
      }
    }
    v43 = [v38 playbackVolumeNumber];
    if (v43)
    {
      v44 = [v38 playbackVolumeNumber];
      [v44 floatValue];
      if (v45 > 100.0)
      {

LABEL_35:
        uint64_t v40 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2953];
        goto LABEL_45;
      }
      v46 = [v38 playbackVolumeNumber];
      [v46 floatValue];
      BOOL v48 = v47 < -0.00000011921;

      if (v48) {
        goto LABEL_35;
      }
    }
    v49 = [v38 playbackStateNumber];
    if (v49)
    {
      v50 = [v38 playbackStateNumber];
      if ([v50 integerValue] == 1)
      {
      }
      else
      {
        v51 = [v38 playbackStateNumber];
        if ([v51 integerValue] == 2)
        {
        }
        else
        {
          v52 = [v38 playbackStateNumber];
          BOOL v53 = [v52 integerValue] == 3;

          if (!v53)
          {
            uint64_t v40 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2954];
            goto LABEL_45;
          }
        }
      }
    }
LABEL_43:
    v54 = 0;
    goto LABEL_46;
  }
  uint64_t v40 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2951];
LABEL_45:
  v54 = (void *)v40;
LABEL_46:

  if (v54)
  {
    v81[2](v81, v54);
    goto LABEL_65;
  }
  [v79 markWithReason:@"Find Destination"];
  objc_initWeak((id *)buf, val);
  v96[0] = MEMORY[0x1E4F143A8];
  v96[1] = 3221225472;
  v96[2] = __68__HMDMPCSessionController_executeSessionWithSessionData_completion___block_invoke_2;
  v96[3] = &unk_1E6A19A50;
  objc_copyWeak(&v102, (id *)buf);
  id v97 = v80;
  v101 = v81;
  id v98 = v79;
  id v55 = v38;
  id v99 = v55;
  v100 = v78;
  id objb = _Block_copy(v96);
  v56 = @"com.apple.Music";
  v57 = [v55 playbackArchive];
  if (v57)
  {
    BOOL v58 = 1;
  }
  else
  {
    v59 = [v55 playbackStateNumber];
    BOOL v58 = [v59 integerValue] == 1;
  }
  v60 = [v55 playbackArchive];
  BOOL v61 = v60 == 0;

  if (v61)
  {
    v87 = 0;
    v66 = @"com.apple.Music";
    uint64_t v65 = 1;
LABEL_56:

    goto LABEL_57;
  }
  v62 = [v55 playbackArchive];
  v63 = [v62 bundleIdentifier];
  char v64 = [v63 hasPrefix:@"com.apple.Music"];

  if ((v64 & 1) == 0)
  {
    v66 = [v55 playbackArchive];
    v87 = [(__CFString *)v66 bundleIdentifier];

    uint64_t v65 = 2;
    goto LABEL_56;
  }
  uint64_t v65 = 0;
  v87 = @"com.apple.Music";
LABEL_57:
  v67 = [HMDMPCResolveDestinationOperation alloc];
  v68 = [v55 playbackArchive];
  v69 = [v68 bundleIdentifier];
  v70 = [(HMDMPCResolveDestinationOperation *)v67 initWithHashedRouteIDs:v37 mediaApplicationDestination:v65 mediaApplicationIdentifier:v69 forceSingleGroup:v58 completion:objb];

  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  v71 = [(HMDMPCSessionController *)val speakerGroupCommandOperationQueue];
  v72 = [v71 operations];

  uint64_t v73 = [v72 countByEnumeratingWithState:&v92 objects:v112 count:16];
  if (v73)
  {
    uint64_t v74 = *(void *)v93;
    do
    {
      for (uint64_t j = 0; j != v73; ++j)
      {
        if (*(void *)v93 != v74) {
          objc_enumerationMutation(v72);
        }
        [(HMDMPCResolveDestinationOperation *)v70 addDependency:*(void *)(*((void *)&v92 + 1) + 8 * j)];
      }
      uint64_t v73 = [v72 countByEnumeratingWithState:&v92 objects:v112 count:16];
    }
    while (v73);
  }

  v76 = [(HMDMPCSessionController *)val speakerGroupCommandOperationQueue];
  [v76 addOperation:v70];

  objc_destroyWeak(&v102);
  objc_destroyWeak((id *)buf);
LABEL_65:
}

uint64_t __68__HMDMPCSessionController_executeSessionWithSessionData_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 markWithReason:@"Call completion"];
  v5 = [*(id *)(a1 + 40) logEventSubmitter];
  [v5 submitLogEvent:*(void *)(a1 + 48) error:v4];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v6 = *(void **)(a1 + 32);
  return [v6 invalidate];
}

void __68__HMDMPCSessionController_executeSessionWithSessionData_completion___block_invoke_2(id *a1, void *a2)
{
  v75[2] = *(id *)MEMORY[0x1E4F143B8];
  id v57 = a2;
  id val = objc_loadWeakRetained(a1 + 9);
  if (v57)
  {
    [a1[5] markWithReason:@"Generate MR Command Operations"];
    v56 = a1;
    v3 = a1 + 6;
    id v4 = [a1[6] playbackArchive];
    v5 = [a1[6] playbackVolumeNumber];
    id v6 = [*v3 playbackStateNumber];
    id v7 = v56[4];
    id v54 = v57;
    id v8 = v4;
    id v9 = v5;
    id v10 = v6;
    if (!val)
    {
      id v38 = 0;
      goto LABEL_20;
    }
    v11 = (void *)MEMORY[0x1E4F1CA48];
    id v12 = v7;
    v13 = [v11 array];
    *(void *)aBlock = MEMORY[0x1E4F143A8];
    *(void *)&aBlock[8] = 3221225472;
    *(void *)&aBlock[16] = __138__HMDMPCSessionController_generateMRCommandOperationsForDestination_playbackArchive_playbackVolumeNumber_playbackStateNumber_sessionUUID___block_invoke;
    v62 = &unk_1E6A19AC0;
    id v14 = v13;
    id v63 = v14;
    v15 = (void (**)(void *, HMDMPCSendMRCommandOperation *))_Block_copy(aBlock);
    location[0] = *(id *)MEMORY[0x1E4F77668];
    v16 = [v12 UUIDString];

    location[1] = *(id *)MEMORY[0x1E4F77648];
    *(void *)&long long v64 = v16;
    *((void *)&v64 + 1) = MEMORY[0x1E4F1CC38];
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:location count:2];

    if (v8)
    {
      v18 = [[HMDMPCSendMRCommandOperation alloc] initWithPlaybackArchive:v8 options:v17 destination:v54];
      v15[2](v15, v18);
    }
    if (v9)
    {
      v19 = [HMDMRSetEndpointVolumeOperation alloc];
      id v20 = [v54 outputDeviceUIDs];
      uint64_t v21 = [(HMDMRSetEndpointVolumeOperation *)v19 initWithRouteIDs:v20 volume:v9];

      v15[2](v15, (HMDMPCSendMRCommandOperation *)v21);
    }
    if (!v10)
    {
LABEL_19:
      id v38 = objc_msgSend(v14, "copy", context);

LABEL_20:
      id v39 = v56[5];
      id v40 = v56[7];
      id v41 = v56[8];
      id v42 = v38;
      id v43 = v40;
      id v55 = v39;
      id v44 = v41;
      if (val)
      {
        id v45 = objc_alloc_init(MEMORY[0x1E4F65400]);
        objc_initWeak(location, v45);
        objc_initWeak(&from, val);
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __112__HMDMPCSessionController_createCompletionOperationForMediaRemoteOperations_executionEvent_activity_completion___block_invoke;
        v69 = &unk_1E6A19A78;
        objc_copyWeak(&v74, &from);
        objc_copyWeak(v75, location);
        id v70 = v55;
        id v46 = v42;
        id v71 = v46;
        id v73 = v44;
        id v72 = v43;
        [v45 addExecutionBlock:buf];
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        id v47 = v46;
        uint64_t v48 = [v47 countByEnumeratingWithState:&v64 objects:aBlock count:16];
        if (v48)
        {
          uint64_t v49 = *(void *)v65;
          do
          {
            for (uint64_t i = 0; i != v48; ++i)
            {
              if (*(void *)v65 != v49) {
                objc_enumerationMutation(v47);
              }
              [v45 addDependency:*(void *)(*((void *)&v64 + 1) + 8 * i)];
            }
            uint64_t v48 = [v47 countByEnumeratingWithState:&v64 objects:aBlock count:16];
          }
          while (v48);
        }

        objc_destroyWeak(v75);
        objc_destroyWeak(&v74);
        objc_destroyWeak(&from);
        objc_destroyWeak(location);
      }
      else
      {
        id v45 = 0;
      }

      [v56[5] markWithReason:@"Execute MR Commands"];
      v51 = [val speakerGroupCommandOperationQueue];
      [v51 addOperations:v42 waitUntilFinished:0];

      v52 = [val speakerGroupCommandOperationQueue];
      [v52 addOperation:v45];

      goto LABEL_30;
    }
    uint64_t v22 = [v10 integerValue];
    if ((unint64_t)(v22 - 1) >= 3)
    {
      context = (void *)MEMORY[0x1D9452090]();
      id v32 = val;
      v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        uint64_t v34 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v34;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v22;
        v35 = (void *)v34;
        _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_ERROR, "%{public}@Unknown HMMediaPlaybackState: %ld", buf, 0x16u);
      }
      uint64_t v23 = 3;
      if (v8) {
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v23 = dword_1D54D44C8[v22 - 1];
      if (v8)
      {
LABEL_10:
        objc_msgSend(MEMORY[0x1E4F76E68], "nowPlayingApplicationDestination", context);
        id v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:
        v36 = v24;
        id v37 = [[HMDMPCSendMRCommandOperation alloc] initWithCommand:v23 options:v17 destination:v24];
        v15[2](v15, v37);

        goto LABEL_19;
      }
    }
    id v24 = v54;
    goto LABEL_18;
  }
  v25 = a1;
  v26 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2950, @"MPC Session Creation Failed, Unable to resolve destination", 0 description underlyingError];
  v27 = (void *)MEMORY[0x1D9452090]();
  id v28 = val;
  v29 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    v30 = HMFGetLogIdentifier();
    id v31 = v25[4];
    *(_DWORD *)aBlock = 138543618;
    *(void *)&void aBlock[4] = v30;
    *(_WORD *)&aBlock[12] = 2112;
    *(void *)&aBlock[14] = v31;
    _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@MPC Session Creation Failed, Unable to resolve destination for sessionUUID: %@", aBlock, 0x16u);
  }
  (*((void (**)(void))v25[8] + 2))();

LABEL_30:
}

void __112__HMDMPCSessionController_createCompletionOperationForMediaRemoteOperations_executionEvent_activity_completion___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = objc_loadWeakRetained((id *)(a1 + 72));
  [*(id *)(a1 + 32) markWithReason:@"Pre-Completion"];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v36;
    uint64_t v34 = v3;
    while (2)
    {
      id v8 = WeakRetained;
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        v11 = [v10 error];

        if (v11)
        {
          id v20 = (void *)MEMORY[0x1D9452090]();
          id WeakRetained = v8;
          id v21 = v8;
          uint64_t v22 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            uint64_t v23 = HMFGetLogIdentifier();
            id v24 = [v10 error];
            *(_DWORD *)buf = 138543874;
            id v40 = v23;
            __int16 v41 = 2112;
            id v42 = v10;
            __int16 v43 = 2112;
            id v44 = v24;
            _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@MPC Session Creation Failed at Command (%@) : %@", buf, 0x20u);
          }
          uint64_t v25 = *(void *)(a1 + 56);
          v26 = [v10 error];
          (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v26);

          id v3 = v34;
          [v34 finish];
          goto LABEL_23;
        }
        id v12 = v10;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v13 = v12;
        }
        else {
          v13 = 0;
        }
        id v14 = v13;

        if (v14)
        {
          v15 = [v14 partialExecutionError];

          if (v15)
          {
            v27 = (void *)MEMORY[0x1D9452090]();
            id WeakRetained = v8;
            id v28 = v8;
            v29 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              v30 = HMFGetLogIdentifier();
              id v31 = [v14 partialExecutionError];
              *(_DWORD *)buf = 138543874;
              id v40 = v30;
              __int16 v41 = 2112;
              id v42 = v14;
              __int16 v43 = 2112;
              id v44 = v31;
              _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@MPC Session Creation Failed at Command (%@) : partial success %@", buf, 0x20u);
            }
            [*(id *)(a1 + 48) setDidPartiallySucceed:1];
            uint64_t v32 = *(void *)(a1 + 56);
            v33 = [v14 partialExecutionError];
            (*(void (**)(uint64_t, void *))(v32 + 16))(v32, v33);

            id v3 = v34;
            [v34 finish];

LABEL_23:
            goto LABEL_24;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v35 objects:v45 count:16];
      id WeakRetained = v8;
      id v3 = v34;
      if (v6) {
        continue;
      }
      break;
    }
  }

  v16 = (void *)MEMORY[0x1D9452090]();
  id v17 = WeakRetained;
  v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v40 = v19;
    _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@MPC Session Created Successfully", buf, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [v3 finish];
LABEL_24:
}

void __138__HMDMPCSessionController_generateMRCommandOperationsForDestination_playbackArchive_playbackVolumeNumber_playbackStateNumber_sessionUUID___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([*(id *)(a1 + 32) count])
  {
    id v3 = [*(id *)(a1 + 32) lastObject];
    [v4 addDependency:v3];
  }
  [*(id *)(a1 + 32) addObject:v4];
}

uint64_t __69__HMDMPCSessionController_createExecutionMetricEventWithSessionData___block_invoke(uint64_t a1, void *a2)
{
  return [a2 accessory];
}

- (HMDMPCSessionController)initWithLogEventSubmitter:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDMPCSessionController;
  uint64_t v6 = [(HMDMPCSessionController *)&v11 init];
  if (v6)
  {
    uint64_t v7 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    [(NSOperationQueue *)v7 setName:@"HMDMPCSessionControllerOperationQueue"];
    [(NSOperationQueue *)v7 setMaxConcurrentOperationCount:5];
    [(NSOperationQueue *)v7 setQualityOfService:25];
    speakerGroupCommandOperationQueue = v6->_speakerGroupCommandOperationQueue;
    v6->_speakerGroupCommandOperationQueue = v7;
    id v9 = v7;

    objc_storeStrong((id *)&v6->_logEventSubmitter, a3);
  }

  return v6;
}

@end