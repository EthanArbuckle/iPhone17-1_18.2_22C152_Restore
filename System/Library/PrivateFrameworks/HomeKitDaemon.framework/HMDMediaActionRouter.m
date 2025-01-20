@interface HMDMediaActionRouter
- (BOOL)shouldExecuteOnCurrentDevice;
- (HMDHome)home;
- (HMDMPCSessionController)mpcSessionController;
- (HMDMediaActionRouter)init;
- (HMDMediaActionRouter)initWithDataSource:(id)a3;
- (HMDMediaActionRouterDataSource)dataSource;
- (HMDResidentDevice)targetResidentDeviceOverride;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)messageReceiveQueue;
- (id)mediaProfileWithUUID:(id)a3;
- (id)targetResidentDeviceForExecutingMediaActionWithProfiles:(id)a3 targetSystemMediaApplication:(BOOL)a4;
- (void)_registerForMessages;
- (void)dealloc;
- (void)executeMediaActionWithSessionData:(id)a3 completion:(id)a4;
- (void)gatherTargetDevicesForExecutingMediaActionWithProfiles:(id)a3 targetSystemMediaApplication:(BOOL)a4 outResidentDevicesInMediaAction:(id *)a5 outHomePodsInMediaAction:(id *)a6 outResidentDevicesSupportingMediaActions:(id *)a7 outHomePodsSupportingMediaActions:(id *)a8 outNonOdeonHomePodsSupportingMediaActions:(id *)a9 outNonOdeonResidentDevicesSupportingMediaActions:(id *)a10 outNonOdeonResidentDevicesInMediaAction:(id *)a11 outNonOdeonHomePodsInMediaAction:(id *)a12 dataSource:(id)a13;
- (void)handleNonResidentMediaActionExecutionWithSessionData:(id)a3 encodePlaybackArchive:(BOOL)a4 completion:(id)a5;
- (void)routeMediaActionForExecution:(id)a3 source:(unint64_t)a4 clientName:(id)a5 completion:(id)a6;
- (void)routeMessage:(id)a3;
- (void)routeSessionDataForExecution:(id)a3 encodePlaybackArchive:(BOOL)a4 completion:(id)a5;
- (void)sendMediaActionMessageToCompanionWithSessionData:(id)a3 encodePlaybackArchive:(BOOL)a4 completion:(id)a5;
- (void)sendMediaActionMessageToDevice:(id)a3 sessionData:(id)a4 encodePlaybackArchive:(BOOL)a5 canForwardMessage:(BOOL)a6 completion:(id)a7;
- (void)sendMediaActionMessageToResident:(id)a3 sessionData:(id)a4 encodePlaybackArchive:(BOOL)a5 completion:(id)a6;
- (void)setTargetResidentDeviceOverride:(id)a3;
@end

@implementation HMDMediaActionRouter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mpcSessionController, 0);
  objc_destroyWeak((id *)&self->_targetResidentDeviceOverride);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (HMDMPCSessionController)mpcSessionController
{
  return self->_mpcSessionController;
}

- (void)setTargetResidentDeviceOverride:(id)a3
{
}

- (HMDResidentDevice)targetResidentDeviceOverride
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetResidentDeviceOverride);
  return (HMDResidentDevice *)WeakRetained;
}

- (BOOL)shouldExecuteOnCurrentDevice
{
  return self->_shouldExecuteOnCurrentDevice;
}

- (HMDMediaActionRouterDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDMediaActionRouterDataSource *)WeakRetained;
}

- (id)mediaProfileWithUUID:(id)a3
{
  id v4 = a3;
  v5 = [(HMDMediaActionRouter *)self dataSource];
  v6 = [v5 mediaProfileWithUUID:v4];

  return v6;
}

- (HMDHome)home
{
  v2 = [(HMDMediaActionRouter *)self dataSource];
  v3 = [v2 home];

  return (HMDHome *)v3;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  v2 = [(HMDMediaActionRouter *)self dataSource];
  v3 = [v2 workQueue];

  return (OS_dispatch_queue *)v3;
}

- (NSUUID)messageTargetUUID
{
  v2 = [(HMDMediaActionRouter *)self dataSource];
  v3 = [v2 uuid];

  return (NSUUID *)v3;
}

- (void)executeMediaActionWithSessionData:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    int v13 = 138543362;
    v14 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Running media action locally", (uint8_t *)&v13, 0xCu);
  }
  v12 = [(HMDMediaActionRouter *)v9 mpcSessionController];
  [v12 executeSessionWithSessionData:v6 completion:v7];
}

- (id)targetResidentDeviceForExecutingMediaActionWithProfiles:(id)a3 targetSystemMediaApplication:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v167 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (WeakRetained)
  {
    v8 = [(HMDMediaActionRouter *)self targetResidentDeviceOverride];
    v9 = (void *)MEMORY[0x230FBD990]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    v12 = v11;
    if (v8)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = HMFGetLogIdentifier();
        v14 = [v8 identifier];
        *(_DWORD *)buf = 138543618;
        v162 = v13;
        __int16 v163 = 2112;
        uint64_t v164 = (uint64_t)v14;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@[Target Device] Picking resident device override: %@", buf, 0x16u);
      }
      id v15 = v8;
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v20 = HMFGetLogIdentifier();
        v21 = [WeakRetained enabledResidents];
        *(_DWORD *)buf = 138543618;
        v162 = v20;
        __int16 v163 = 2112;
        uint64_t v164 = (uint64_t)v21;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Available residents: %@", buf, 0x16u);
      }
      id v159 = 0;
      id v160 = 0;
      id v157 = 0;
      id v158 = 0;
      id v155 = 0;
      id v156 = 0;
      id v153 = 0;
      id v154 = 0;
      [(HMDMediaActionRouter *)v10 gatherTargetDevicesForExecutingMediaActionWithProfiles:v6 targetSystemMediaApplication:v4 outResidentDevicesInMediaAction:&v160 outHomePodsInMediaAction:&v159 outResidentDevicesSupportingMediaActions:&v158 outHomePodsSupportingMediaActions:&v157 outNonOdeonHomePodsSupportingMediaActions:&v156 outNonOdeonResidentDevicesSupportingMediaActions:&v155 outNonOdeonResidentDevicesInMediaAction:&v154 outNonOdeonHomePodsInMediaAction:&v153 dataSource:WeakRetained];
      id v148 = v160;
      id v22 = v159;
      id v146 = v158;
      id v23 = v157;
      id v24 = v156;
      id v147 = v155;
      id v144 = v154;
      id v145 = v153;
      v25 = (void *)MEMORY[0x230FBD990]();
      v26 = v10;
      v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        v28 = HMFGetLogIdentifier();
        id v29 = v6;
        id v30 = v22;
        uint64_t v31 = [v146 count];
        uint64_t v32 = [v148 count];
        *(_DWORD *)buf = 138543874;
        v162 = v28;
        __int16 v163 = 2048;
        uint64_t v164 = v31;
        id v22 = v30;
        id v6 = v29;
        v8 = 0;
        __int16 v165 = 2048;
        uint64_t v166 = v32;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@[Target Device] Number of reachable residents: %lu, number of residents in action: %lu", buf, 0x20u);
      }
      int v33 = objc_msgSend(v147, "na_any:", &__block_literal_global_35_129823);
      char v34 = v33;
      if (v33) {
        char v35 = objc_msgSend(v24, "na_any:", &__block_literal_global_37_129824);
      }
      else {
        char v35 = 0;
      }
      v36 = objc_msgSend(v148, "na_firstObjectPassingTest:", &__block_literal_global_39);
      if (v36)
      {
        v37 = (void *)MEMORY[0x230FBD990]();
        v38 = v26;
        v39 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          id v132 = WeakRetained;
          v40 = id v138 = v22;
          [v36 identifier];
          v42 = id v41 = v23;
          *(_DWORD *)buf = 138543618;
          v162 = v40;
          __int16 v163 = 2112;
          uint64_t v164 = (uint64_t)v42;
          _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_INFO, "%{public}@[Target Device] Picking current device since it is a resident and part of action: %@", buf, 0x16u);

          id v23 = v41;
          id WeakRetained = v132;
          id v22 = v138;
        }

        id v15 = v36;
      }
      else
      {
        uint64_t v43 = [v145 firstObject];
        if (v43)
        {
          v44 = (void *)v43;
          context = (void *)MEMORY[0x230FBD990]();
          v45 = v26;
          v46 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            id v133 = WeakRetained;
            v47 = id v139 = v22;
            [v44 identifier];
            v49 = id v48 = v23;
            *(_DWORD *)buf = 138543618;
            v162 = v47;
            __int16 v163 = 2112;
            uint64_t v164 = (uint64_t)v49;
            _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_INFO, "%{public}@[Target Device] Picking non-odeon HomePod in action: %@", buf, 0x16u);

            id v23 = v48;
            id WeakRetained = v133;
            id v22 = v139;
          }

          v50 = v44;
          id v15 = v44;
        }
        else
        {
          contexta = [v144 firstObject];
          if (contexta)
          {
            v51 = (void *)MEMORY[0x230FBD990]();
            v52 = v26;
            v53 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              id v134 = WeakRetained;
              v54 = id v140 = v22;
              [contexta identifier];
              v56 = id v55 = v23;
              *(_DWORD *)buf = 138543618;
              v162 = v54;
              __int16 v163 = 2112;
              uint64_t v164 = (uint64_t)v56;
              _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_INFO, "%{public}@[Target Device] Picking non-odeon resident device in action: %@", buf, 0x16u);

              id v23 = v55;
              id WeakRetained = v134;
              id v22 = v140;
            }

            v57 = contexta;
            id v15 = contexta;
            v50 = 0;
          }
          else
          {
            v124 = [v22 firstObject];
            if (v124)
            {
              v58 = (void *)MEMORY[0x230FBD990]();
              v59 = v26;
              v60 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                id v135 = WeakRetained;
                v61 = id v141 = v22;
                [v124 identifier];
                v63 = id v62 = v23;
                *(_DWORD *)buf = 138543618;
                v162 = v61;
                __int16 v163 = 2112;
                uint64_t v164 = (uint64_t)v63;
                _os_log_impl(&dword_22F52A000, v60, OS_LOG_TYPE_INFO, "%{public}@[Target Device] Picking HomePod in action: %@", buf, 0x16u);

                id v23 = v62;
                id WeakRetained = v135;
                id v22 = v141;
              }

              id v64 = v124;
              v65 = v124;
              id v15 = v64;
              v50 = 0;
              v57 = 0;
            }
            else
            {
              v123 = [v148 firstObject];
              if (v123)
              {
                v66 = (void *)MEMORY[0x230FBD990]();
                v67 = v26;
                v68 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  id v136 = WeakRetained;
                  v69 = id v142 = v22;
                  [v123 identifier];
                  v71 = id v70 = v23;
                  *(_DWORD *)buf = 138543618;
                  v162 = v69;
                  __int16 v163 = 2112;
                  uint64_t v164 = (uint64_t)v71;
                  _os_log_impl(&dword_22F52A000, v68, OS_LOG_TYPE_INFO, "%{public}@[Target Device] Picking resident device in action: %@", buf, 0x16u);

                  id v23 = v70;
                  id WeakRetained = v136;
                  id v22 = v142;
                }

                id v72 = v123;
                v73 = v123;
                id v15 = v72;
                v50 = 0;
                v57 = 0;
              }
              else
              {
                id v143 = v22;
                v151[0] = MEMORY[0x263EF8330];
                v151[1] = 3221225472;
                v151[2] = __109__HMDMediaActionRouter_targetResidentDeviceForExecutingMediaActionWithProfiles_targetSystemMediaApplication___block_invoke_40;
                v151[3] = &__block_descriptor_33_e27_B16__0__HMDResidentDevice_8l;
                char v152 = v35;
                uint64_t v74 = objc_msgSend(v146, "na_firstObjectPassingTest:", v151);
                if (v74)
                {
                  v75 = (void *)v74;
                  v76 = (void *)MEMORY[0x230FBD990]();
                  v77 = v26;
                  v78 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    v79 = v137 = v76;
                    [v75 identifier];
                    id v128 = v24;
                    v81 = id v80 = v23;
                    *(_DWORD *)buf = 138543618;
                    v162 = v79;
                    __int16 v163 = 2112;
                    uint64_t v164 = (uint64_t)v81;
                    _os_log_impl(&dword_22F52A000, v78, OS_LOG_TYPE_INFO, "%{public}@[Target Device] Picking current device since it is a HomePod and not part of action and is non-odeon: %@", buf, 0x16u);

                    id v23 = v80;
                    id v24 = v128;

                    v76 = v137;
                  }

                  id v82 = v75;
                  v83 = v75;
                  id v15 = v82;
                  id v22 = v143;
                  v50 = 0;
                  v57 = 0;
                }
                else
                {
                  v127 = [v24 firstObject];
                  if (v127)
                  {
                    v84 = (void *)MEMORY[0x230FBD990]();
                    v85 = v26;
                    v86 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
                    {
                      v87 = HMFGetLogIdentifier();
                      [v127 identifier];
                      id v129 = v24;
                      v89 = id v88 = v23;
                      *(_DWORD *)buf = 138543618;
                      v162 = v87;
                      __int16 v163 = 2112;
                      uint64_t v164 = (uint64_t)v89;
                      _os_log_impl(&dword_22F52A000, v86, OS_LOG_TYPE_INFO, "%{public}@[Target Device] Picking any non-odeon HomePod: %@", buf, 0x16u);

                      id v23 = v88;
                      id v24 = v129;
                    }
                    id v90 = v127;
                    v91 = v127;
                    id v15 = v90;
                    id v22 = v143;
                    v50 = 0;
                    v57 = 0;
                  }
                  else
                  {
                    v149[0] = MEMORY[0x263EF8330];
                    v149[1] = 3221225472;
                    v149[2] = __109__HMDMediaActionRouter_targetResidentDeviceForExecutingMediaActionWithProfiles_targetSystemMediaApplication___block_invoke_41;
                    v149[3] = &__block_descriptor_33_e27_B16__0__HMDResidentDevice_8l;
                    char v150 = v34;
                    v122 = objc_msgSend(v146, "na_firstObjectPassingTest:", v149);
                    if (v122)
                    {
                      v92 = (void *)MEMORY[0x230FBD990]();
                      v93 = v26;
                      v94 = HMFGetOSLogHandle();
                      if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
                      {
                        v95 = HMFGetLogIdentifier();
                        [v122 identifier];
                        id v130 = v24;
                        v97 = id v96 = v23;
                        *(_DWORD *)buf = 138543618;
                        v162 = v95;
                        __int16 v163 = 2112;
                        uint64_t v164 = (uint64_t)v97;
                        _os_log_impl(&dword_22F52A000, v94, OS_LOG_TYPE_INFO, "%{public}@[Target Device] Picking current device since it is a resident and not part of action and is non-odeon: %@", buf, 0x16u);

                        id v23 = v96;
                        id v24 = v130;
                      }
                      v98 = v122;
                      id v15 = v122;
                      id v22 = v143;
                    }
                    else
                    {
                      id v131 = v24;
                      id v99 = v23;
                      v100 = [v23 firstObject];
                      if (v100)
                      {
                        v101 = (void *)MEMORY[0x230FBD990]();
                        v102 = v26;
                        v103 = HMFGetOSLogHandle();
                        if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
                        {
                          v104 = HMFGetLogIdentifier();
                          v105 = [v100 identifier];
                          *(_DWORD *)buf = 138543618;
                          v162 = v104;
                          __int16 v163 = 2112;
                          uint64_t v164 = (uint64_t)v105;
                          _os_log_impl(&dword_22F52A000, v103, OS_LOG_TYPE_INFO, "%{public}@[Target Device] Picking any HomePod resident: %@", buf, 0x16u);
                        }
                        id v15 = v100;
                      }
                      else
                      {
                        v121 = [v147 firstObject];
                        if (v121)
                        {
                          v106 = (void *)MEMORY[0x230FBD990]();
                          v107 = v26;
                          v108 = HMFGetOSLogHandle();
                          if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
                          {
                            v109 = HMFGetLogIdentifier();
                            v110 = [v121 identifier];
                            *(_DWORD *)buf = 138543618;
                            v162 = v109;
                            __int16 v163 = 2112;
                            uint64_t v164 = (uint64_t)v110;
                            _os_log_impl(&dword_22F52A000, v108, OS_LOG_TYPE_INFO, "%{public}@[Target Device] Picking any non-odeon resident: %@", buf, 0x16u);
                          }
                          id v15 = v121;
                        }
                        else
                        {
                          id v15 = [v146 firstObject];
                          v120 = (void *)MEMORY[0x230FBD990]();
                          v111 = v26;
                          v112 = HMFGetOSLogHandle();
                          BOOL v113 = os_log_type_enabled(v112, OS_LOG_TYPE_INFO);
                          if (v15)
                          {
                            if (v113)
                            {
                              v114 = HMFGetLogIdentifier();
                              v115 = [v15 identifier];
                              *(_DWORD *)buf = 138543618;
                              v162 = v114;
                              __int16 v163 = 2112;
                              uint64_t v164 = (uint64_t)v115;
                              _os_log_impl(&dword_22F52A000, v112, OS_LOG_TYPE_INFO, "%{public}@[Target Device] Picking any resident: %@", buf, 0x16u);
                            }
                            id v116 = v15;
                          }
                          else
                          {
                            if (v113)
                            {
                              v117 = HMFGetLogIdentifier();
                              uint64_t v118 = [v146 count];
                              *(_DWORD *)buf = 138543618;
                              v162 = v117;
                              __int16 v163 = 2048;
                              uint64_t v164 = v118;
                              _os_log_impl(&dword_22F52A000, v112, OS_LOG_TYPE_INFO, "%{public}@[Target Device] Couldn't find media action resident to route to, out of %lu candidates", buf, 0x16u);
                            }
                          }
                        }
                      }

                      id v22 = v143;
                      id v23 = v99;
                      id v24 = v131;
                      v36 = 0;
                      v98 = 0;
                    }

                    v50 = 0;
                    v57 = 0;
                    v91 = 0;
                  }

                  v83 = 0;
                }

                v73 = 0;
              }

              v65 = 0;
            }
          }
        }
      }
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x230FBD990]();
    v17 = self;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v162 = v19;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Invalid data source", buf, 0xCu);
    }
    id v15 = 0;
  }

  return v15;
}

uint64_t __109__HMDMediaActionRouter_targetResidentDeviceForExecutingMediaActionWithProfiles_targetSystemMediaApplication___block_invoke_40(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCurrentDevice];
  if (result) {
    return *(unsigned char *)(a1 + 32) != 0;
  }
  return result;
}

uint64_t __109__HMDMediaActionRouter_targetResidentDeviceForExecutingMediaActionWithProfiles_targetSystemMediaApplication___block_invoke_41(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCurrentDevice];
  if (result) {
    return *(unsigned char *)(a1 + 32) != 0;
  }
  return result;
}

uint64_t __109__HMDMediaActionRouter_targetResidentDeviceForExecutingMediaActionWithProfiles_targetSystemMediaApplication___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isCurrentDevice];
}

uint64_t __109__HMDMediaActionRouter_targetResidentDeviceForExecutingMediaActionWithProfiles_targetSystemMediaApplication___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isCurrentDevice];
}

uint64_t __109__HMDMediaActionRouter_targetResidentDeviceForExecutingMediaActionWithProfiles_targetSystemMediaApplication___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCurrentDevice];
}

- (void)gatherTargetDevicesForExecutingMediaActionWithProfiles:(id)a3 targetSystemMediaApplication:(BOOL)a4 outResidentDevicesInMediaAction:(id *)a5 outHomePodsInMediaAction:(id *)a6 outResidentDevicesSupportingMediaActions:(id *)a7 outHomePodsSupportingMediaActions:(id *)a8 outNonOdeonHomePodsSupportingMediaActions:(id *)a9 outNonOdeonResidentDevicesSupportingMediaActions:(id *)a10 outNonOdeonResidentDevicesInMediaAction:(id *)a11 outNonOdeonHomePodsInMediaAction:(id *)a12 dataSource:(id)a13
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a13;
  v17 = (void *)MEMORY[0x230FBD990]();
  v18 = self;
  v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v20 = HMFGetLogIdentifier();
    v21 = [v16 enabledResidents];
    *(_DWORD *)buf = 138543618;
    v83 = v20;
    __int16 v84 = 2112;
    v85 = v21;
    _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Available residents: %@", buf, 0x16u);
  }
  id v22 = [v16 enabledResidents];
  v79[0] = MEMORY[0x263EF8330];
  v79[1] = 3221225472;
  v79[2] = __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke;
  v79[3] = &unk_264A20640;
  BOOL v81 = a4;
  id v80 = v16;
  id v56 = v16;
  id v23 = objc_msgSend(v22, "na_filter:", v79);

  id v24 = [v56 appleMediaAccessories];
  v77[0] = MEMORY[0x263EF8330];
  v77[1] = 3221225472;
  v77[2] = __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_2;
  v77[3] = &unk_264A2A830;
  id v25 = v24;
  id v78 = v25;
  objc_msgSend(v23, "na_filter:", v77);
  id v53 = (id)objc_claimAutoreleasedReturnValue();
  v75[0] = MEMORY[0x263EF8330];
  v75[1] = 3221225472;
  v75[2] = __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_4;
  v75[3] = &unk_264A2A830;
  id v26 = v15;
  id v76 = v26;
  v27 = objc_msgSend(v23, "na_filter:", v75);
  v73[0] = MEMORY[0x263EF8330];
  v73[1] = 3221225472;
  v73[2] = __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_6;
  v73[3] = &unk_264A2A830;
  id v28 = v26;
  id v74 = v28;
  id v29 = objc_msgSend(v27, "na_filter:", v73);
  id v30 = (void *)MEMORY[0x263EFFA08];
  uint64_t v31 = objc_msgSend(v25, "na_map:", &__block_literal_global_33_129843);
  uint64_t v32 = [v30 setWithArray:v31];

  int v33 = (void *)MEMORY[0x263EFFA08];
  v71[0] = MEMORY[0x263EF8330];
  v71[1] = 3221225472;
  v71[2] = __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_9;
  v71[3] = &unk_264A20668;
  id v72 = v32;
  id v55 = v32;
  char v34 = objc_msgSend(v25, "na_map:", v71);
  char v35 = [v33 setWithArray:v34];

  v68[0] = MEMORY[0x263EF8330];
  v68[1] = 3221225472;
  v68[2] = __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_10;
  v68[3] = &unk_264A206B8;
  id v36 = v28;
  id v69 = v36;
  id v37 = v35;
  id v70 = v37;
  v38 = objc_msgSend(v27, "na_filter:", v68);
  v66[0] = MEMORY[0x263EF8330];
  v66[1] = 3221225472;
  v66[2] = __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_12;
  v66[3] = &unk_264A2A830;
  id v67 = v36;
  id v54 = v36;
  v39 = objc_msgSend(v38, "na_filter:", v66);
  v63[0] = MEMORY[0x263EF8330];
  v63[1] = 3221225472;
  v63[2] = __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_14;
  v63[3] = &unk_264A206B8;
  id v40 = v25;
  id v64 = v40;
  id v65 = v37;
  id v41 = v37;
  v42 = objc_msgSend(v23, "na_filter:", v63);
  v61[0] = MEMORY[0x263EF8330];
  v61[1] = 3221225472;
  v61[2] = __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_16;
  v61[3] = &unk_264A2A830;
  id v62 = v40;
  id v52 = v40;
  uint64_t v43 = objc_msgSend(v42, "na_filter:", v61);
  id v44 = v23;
  *a7 = v44;
  id v45 = v53;
  *a8 = v45;
  id v46 = v27;
  *a5 = v46;
  id v47 = v29;
  *a6 = v47;
  id v48 = v38;
  *a11 = v48;
  id v49 = v39;
  *a12 = v49;
  id v50 = v42;
  *a10 = v50;
  id v51 = v43;
  *a9 = v51;
}

uint64_t __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3;
  if (!*(unsigned char *)(a1 + 40))
  {
    if ([v3 supportsCustomMediaApplicationDestination]) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    goto LABEL_6;
  }
  if (([v3 supportsMediaActions] & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = [*(id *)(a1 + 32) isResidentReachable:v4];
LABEL_6:

  return v5;
}

uint64_t __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_3;
  v8[3] = &unk_264A2E3A0;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_5;
  v8[3] = &unk_264A21090;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_7;
  v8[3] = &unk_264A21090;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

id __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 audioDestination];
  id v5 = [v4 uniqueIdentifier];

  if (v5 && [*(id *)(a1 + 32) containsObject:v5])
  {
    uint64_t v6 = [v3 uuid];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_11;
  v8[3] = &unk_264A20690;
  id v9 = v3;
  BOOL v4 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_12(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_13;
  v8[3] = &unk_264A21090;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_14(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_15;
  v8[3] = &unk_264A206E0;
  id v9 = v3;
  BOOL v4 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_16(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_17;
  v8[3] = &unk_264A2E3A0;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_17(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isHomePod])
  {
    BOOL v4 = [*(id *)(a1 + 32) device];
    id v5 = [v4 identifier];
    uint64_t v6 = [v3 device];
    id v7 = [v6 identifier];
    uint64_t v8 = objc_msgSend(v5, "hmf_isEqualToUUID:", v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_15(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) device];
  id v5 = [v4 identifier];
  uint64_t v6 = [v3 device];
  id v7 = [v6 identifier];
  if (objc_msgSend(v5, "hmf_isEqualToUUID:", v7))
  {
    uint64_t v8 = *(void **)(a1 + 40);
    id v9 = [v3 uuid];
    uint64_t v10 = [v8 containsObject:v9] ^ 1;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_13(uint64_t a1, void *a2)
{
  id v3 = [a2 accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = 0;
  }
  id v5 = v4;

  if (v5 && [v5 isHomePod])
  {
    uint64_t v6 = [*(id *)(a1 + 32) device];
    id v7 = [v6 identifier];
    uint64_t v8 = [v5 device];
    id v9 = [v8 identifier];
    uint64_t v10 = objc_msgSend(v7, "hmf_isEqualToUUID:", v9);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = [a2 accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) device];
    id v7 = [v6 identifier];
    uint64_t v8 = [v5 device];
    id v9 = [v8 identifier];
    if (objc_msgSend(v7, "hmf_isEqualToUUID:", v9))
    {
      uint64_t v10 = *(void **)(a1 + 40);
      v11 = [v5 uuid];
      uint64_t v12 = [v10 containsObject:v11] ^ 1;
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

id __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_8(uint64_t a1, void *a2)
{
  v2 = [a2 audioDestinationController];
  id v3 = [v2 data];
  BOOL v4 = [v3 destinationIdentifier];

  return v4;
}

uint64_t __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = [a2 accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = 0;
  }
  id v5 = v4;

  if (v5 && [v5 isHomePod])
  {
    uint64_t v6 = [*(id *)(a1 + 32) device];
    id v7 = [v6 identifier];
    uint64_t v8 = [v5 device];
    id v9 = [v8 identifier];
    uint64_t v10 = objc_msgSend(v7, "hmf_isEqualToUUID:", v9);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = [a2 accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) device];
    id v7 = [v6 identifier];
    uint64_t v8 = [v5 device];
    id v9 = [v8 identifier];
    uint64_t v10 = objc_msgSend(v7, "hmf_isEqualToUUID:", v9);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isHomePod])
  {
    BOOL v4 = [*(id *)(a1 + 32) device];
    id v5 = [v4 identifier];
    uint64_t v6 = [v3 device];
    id v7 = [v6 identifier];
    uint64_t v8 = objc_msgSend(v5, "hmf_isEqualToUUID:", v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)routeMessage:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [HMDMPCSessionData alloc];
  uint64_t v6 = [v4 messagePayload];
  id v7 = [(HMDMPCSessionData *)v5 initWithDictionaryRepresentation:v6 profileSource:self];

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__HMDMediaActionRouter_routeMessage___block_invoke;
  aBlock[3] = &unk_264A2F3E8;
  id v8 = v4;
  id v24 = v8;
  id v9 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (v7)
  {
    uint64_t v10 = [v8 messagePayload];
    if (objc_msgSend(v10, "hmf_BOOLForKey:", @"kDoNotForwardMessageKey"))
    {

LABEL_11:
      [(HMDMediaActionRouter *)self executeMediaActionWithSessionData:v7 completion:v9];
      goto LABEL_12;
    }
    id v16 = [v8 messagePayload];
    v17 = [v16 objectForKeyedSubscript:@"kDoNotForwardMessageKey"];

    if (!v17) {
      goto LABEL_11;
    }
    v18 = (void *)MEMORY[0x230FBD990]();
    v19 = self;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = HMFGetLogIdentifier();
      id v22 = [v8 remoteSourceDevice];
      *(_DWORD *)buf = 138543618;
      id v26 = v21;
      __int16 v27 = 2112;
      id v28 = v22;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Forwarding media action for remote device: %@", buf, 0x16u);
    }
    [(HMDMediaActionRouter *)v19 routeSessionDataForExecution:v7 encodePlaybackArchive:1 completion:v9];
  }
  else
  {
    v11 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2955];
    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    int v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v26 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to route media action for execution, invalid message payload", buf, 0xCu);
    }
    v9[2](v9, v11);
  }
LABEL_12:
}

void __37__HMDMediaActionRouter_routeMessage___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) responseHandler];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) responseHandler];
    ((void (**)(void, id, void))v4)[2](v4, v5, 0);
  }
}

- (void)sendMediaActionMessageToDevice:(id)a3 sessionData:(id)a4 encodePlaybackArchive:(BOOL)a5 canForwardMessage:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = (void *)MEMORY[0x230FBD990]();
  id v16 = self;
  v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = id v38 = v13;
    v19 = [v12 name];
    v20 = [v12 identifier];
    HMFBooleanToString();
    BOOL v37 = v8;
    id v21 = v12;
    id v22 = v14;
    v24 = BOOL v23 = v9;
    *(_DWORD *)buf = 138544130;
    v42 = v18;
    __int16 v43 = 2112;
    id v44 = v19;
    __int16 v45 = 2112;
    id v46 = v20;
    __int16 v47 = 2112;
    id v48 = v24;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Sending media action to < %@ : %@ > canForward: %@", buf, 0x2Au);

    BOOL v9 = v23;
    id v14 = v22;
    id v12 = v21;
    BOOL v8 = v37;

    id v13 = v38;
  }

  id v25 = [v13 dictionaryRepresentation:v9];
  id v26 = (void *)[v25 mutableCopy];

  __int16 v27 = [NSNumber numberWithBool:!v8];
  [v26 setObject:v27 forKey:@"kDoNotForwardMessageKey"];

  id v28 = [(HMDMediaActionRouter *)v16 dataSource];
  uint64_t v29 = [HMDRemoteDeviceMessageDestination alloc];
  id v30 = [v28 uuid];
  uint64_t v31 = [(HMDRemoteDeviceMessageDestination *)v29 initWithTarget:v30 device:v12];

  uint64_t v32 = (void *)MEMORY[0x263F42590];
  int v33 = (void *)[v26 copy];
  char v34 = [v32 messageWithName:@"HMDMAR.RouteMediaAction" qualityOfService:25 destination:v31 payload:v33];

  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __118__HMDMediaActionRouter_sendMediaActionMessageToDevice_sessionData_encodePlaybackArchive_canForwardMessage_completion___block_invoke;
  v39[3] = &unk_264A273E0;
  id v40 = v14;
  id v35 = v14;
  [v34 setResponseHandler:v39];
  [v34 setSecureRemote:1];
  id v36 = [v28 msgDispatcher];
  [v36 sendMessage:v34 completionHandler:0];
}

uint64_t __118__HMDMediaActionRouter_sendMediaActionMessageToDevice_sessionData_encodePlaybackArchive_canForwardMessage_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendMediaActionMessageToCompanionWithSessionData:(id)a3 encodePlaybackArchive:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x230FBD990]();
  v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v20 = v13;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Running media action on companion", buf, 0xCu);
  }
  id v14 = [(HMDMediaActionRouter *)v11 dataSource];
  id v15 = [v14 companionDevice];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __106__HMDMediaActionRouter_sendMediaActionMessageToCompanionWithSessionData_encodePlaybackArchive_completion___block_invoke;
  v17[3] = &unk_264A2EDE0;
  v17[4] = v11;
  id v18 = v9;
  id v16 = v9;
  [(HMDMediaActionRouter *)v11 sendMediaActionMessageToDevice:v15 sessionData:v8 encodePlaybackArchive:v6 canForwardMessage:1 completion:v17];
}

void __106__HMDMediaActionRouter_sendMediaActionMessageToCompanionWithSessionData_encodePlaybackArchive_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    BOOL v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      id v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unable to execute media action on companion: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)sendMediaActionMessageToResident:(id)a3 sessionData:(id)a4 encodePlaybackArchive:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [v10 device];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __102__HMDMediaActionRouter_sendMediaActionMessageToResident_sessionData_encodePlaybackArchive_completion___block_invoke;
  v17[3] = &unk_264A20618;
  v17[4] = self;
  id v18 = v10;
  BOOL v21 = v7;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  [(HMDMediaActionRouter *)self sendMediaActionMessageToDevice:v13 sessionData:v15 encodePlaybackArchive:v7 canForwardMessage:0 completion:v17];
}

void __102__HMDMediaActionRouter_sendMediaActionMessageToResident_sessionData_encodePlaybackArchive_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3
    && ([*(id *)(a1 + 32) dataSource],
        id v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 isResidentReachable:*(void *)(a1 + 40)],
        v4,
        (v5 & 1) == 0))
  {
    BOOL v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 32);
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      id v10 = [*(id *)(a1 + 40) device];
      id v11 = [v10 name];
      id v12 = [*(id *)(a1 + 40) identifier];
      int v13 = 138543874;
      id v14 = v9;
      __int16 v15 = 2112;
      id v16 = v11;
      __int16 v17 = 2112;
      id v18 = v12;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Device < %@ : %@ > unreachable, rerouting", (uint8_t *)&v13, 0x20u);
    }
    [*(id *)(a1 + 32) routeSessionDataForExecution:*(void *)(a1 + 48) encodePlaybackArchive:*(unsigned __int8 *)(a1 + 64) completion:*(void *)(a1 + 56)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)handleNonResidentMediaActionExecutionWithSessionData:(id)a3 encodePlaybackArchive:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(HMDMediaActionRouter *)self dataSource];
  if (isWatch()
    && [v10 isCompanionReachable]
    && ([v10 companionDevice], id v11 = objc_claimAutoreleasedReturnValue(), v11, v11))
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __110__HMDMediaActionRouter_handleNonResidentMediaActionExecutionWithSessionData_encodePlaybackArchive_completion___block_invoke;
    v12[3] = &unk_264A2E788;
    v12[4] = self;
    id v13 = v8;
    id v14 = v9;
    [(HMDMediaActionRouter *)self sendMediaActionMessageToCompanionWithSessionData:v13 encodePlaybackArchive:v6 completion:v12];
  }
  else
  {
    [(HMDMediaActionRouter *)self executeMediaActionWithSessionData:v8 completion:v9];
  }
}

uint64_t __110__HMDMediaActionRouter_handleNonResidentMediaActionExecutionWithSessionData_encodePlaybackArchive_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return [*(id *)(a1 + 32) executeMediaActionWithSessionData:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)routeSessionDataForExecution:(id)a3 encodePlaybackArchive:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  if (v8)
  {
    uint64_t v10 = [v8 playbackArchiveTargetsSystemMediaApplication];
    id v11 = [v8 mediaProfiles];
    id v12 = [(HMDMediaActionRouter *)self targetResidentDeviceForExecutingMediaActionWithProfiles:v11 targetSystemMediaApplication:v10];

    if (v12 && ![v12 isCurrentDevice]) {
      [(HMDMediaActionRouter *)self sendMediaActionMessageToResident:v12 sessionData:v8 encodePlaybackArchive:v6 completion:v9];
    }
    else {
      [(HMDMediaActionRouter *)self handleNonResidentMediaActionExecutionWithSessionData:v8 encodePlaybackArchive:v6 completion:v9];
    }
  }
  else
  {
    id v13 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2955];
    id v14 = (void *)MEMORY[0x230FBD990]();
    __int16 v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = HMFGetLogIdentifier();
      int v18 = 138543362;
      uint64_t v19 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to package media action for execution, invalid message payload", (uint8_t *)&v18, 0xCu);
    }
    v9[2](v9, v13);
  }
}

- (void)routeMediaActionForExecution:(id)a3 source:(unint64_t)a4 clientName:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v27 = a6;
  id v11 = [HMDMPCSessionData alloc];
  id v12 = [NSNumber numberWithUnsignedInteger:a4];
  id v25 = [(HMDMPCSessionData *)v11 initWithMediaAction:v9 source:v12 clientName:v10];

  id v13 = [v9 mediaProfiles];
  id v14 = objc_msgSend(v13, "na_map:", &__block_literal_global_129862);

  __int16 v15 = [HMDMediaPlaybackActionEvent alloc];
  id v16 = [v9 playbackArchive];
  __int16 v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "state"));
  int v18 = [v9 volume];
  uint64_t v19 = [NSNumber numberWithUnsignedInteger:a4];
  uint64_t v20 = [v14 allObjects];
  BOOL v21 = [(HMDMediaPlaybackActionEvent *)v15 initWithIsPlaybackArchivePresent:v16 != 0 playbackStateNumber:v17 volumeNumber:v18 sourceNumber:v19 sourceClientName:v10 accessories:v20];

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__HMDMediaActionRouter_routeMediaActionForExecution_source_clientName_completion___block_invoke_2;
  aBlock[3] = &unk_264A2DE38;
  objc_copyWeak(&v31, &location);
  id v22 = v21;
  uint64_t v29 = v22;
  id v23 = v27;
  id v30 = v23;
  id v24 = _Block_copy(aBlock);
  -[HMDMediaActionRouter routeSessionDataForExecution:encodePlaybackArchive:completion:](self, "routeSessionDataForExecution:encodePlaybackArchive:completion:", v25, [v9 encodePlaybackArchiveForExecution], v24);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

void __82__HMDMediaActionRouter_routeMediaActionForExecution_source_clientName_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  char v5 = [WeakRetained dataSource];
  BOOL v6 = [v5 logEventSubmitter];
  [v6 submitLogEvent:*(void *)(a1 + 32) error:v4];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __82__HMDMediaActionRouter_routeMediaActionForExecution_source_clientName_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 accessory];
}

- (void)_registerForMessages
{
  v9[2] = *MEMORY[0x263EF8340];
  id v3 = [(HMDMediaActionRouter *)self dataSource];
  id v4 = [v3 home];
  if (!isWatch() && v4)
  {
    char v5 = [v3 msgDispatcher];
    BOOL v6 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
    v9[0] = v6;
    id v7 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v4 userPrivilege:0 remoteAccessRequired:1];
    v9[1] = v7;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
    [v5 registerForMessage:@"HMDMAR.RouteMediaAction" receiver:self policies:v8 selector:sel_routeMessage_];
  }
}

- (void)dealloc
{
  if (!isWatch())
  {
    id v3 = [(HMDMediaActionRouter *)self dataSource];
    id v4 = [v3 msgDispatcher];
    [v4 deregisterForMessage:@"HMDMAR.RouteMediaAction" receiver:self];
  }
  v5.receiver = self;
  v5.super_class = (Class)HMDMediaActionRouter;
  [(HMDMediaActionRouter *)&v5 dealloc];
}

- (HMDMediaActionRouter)init
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  objc_super v5 = NSStringFromSelector(a2);
  BOOL v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (HMDMediaActionRouter)initWithDataSource:(id)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)HMDMediaActionRouter;
  objc_super v5 = [(HMDMediaActionRouter *)&v54 init];
  if (v5)
  {
    BOOL v6 = [HMDMPCSessionController alloc];
    id v7 = [v4 logEventSubmitter];
    uint64_t v8 = [(HMDMPCSessionController *)v6 initWithLogEventSubmitter:v7];
    mpcSessionController = v5->_mpcSessionController;
    v5->_mpcSessionController = (HMDMPCSessionController *)v8;

    objc_storeWeak((id *)&v5->_dataSource, v4);
    [(HMDMediaActionRouter *)v5 _registerForMessages];
    if (isInternalBuild())
    {
      id v10 = [v4 home];
      id v11 = [MEMORY[0x263F42608] sharedPreferences];
      id v12 = [v11 preferenceForKey:@"TargetResidentDeviceForMediaActions"];
      uint64_t v13 = [v12 stringValue];

      id v14 = (void *)v13;
      id v48 = v5;
      if (v13)
      {
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v47 = v4;
        id obj = [v4 enabledResidents];
        uint64_t v15 = [obj countByEnumeratingWithState:&v50 objects:v63 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v51;
          id v46 = v10;
LABEL_6:
          uint64_t v18 = 0;
          while (1)
          {
            if (*(void *)v51 != v17) {
              objc_enumerationMutation(obj);
            }
            uint64_t v19 = *(void **)(*((void *)&v50 + 1) + 8 * v18);
            uint64_t v20 = [v19 device];
            BOOL v21 = [v20 name];
            if ([v21 isEqualToString:v14]) {
              break;
            }
            id v22 = [v19 identifier];
            id v23 = [v22 UUIDString];
            id v24 = v14;
            int v25 = [v23 isEqualToString:v14];

            if (v25) {
              goto LABEL_19;
            }
            ++v18;
            id v14 = v24;
            if (v16 == v18)
            {
              uint64_t v16 = [obj countByEnumeratingWithState:&v50 objects:v63 count:16];
              id v10 = v46;
              if (v16) {
                goto LABEL_6;
              }
              goto LABEL_13;
            }
          }
          id v24 = v14;

LABEL_19:
          id v35 = (void *)MEMORY[0x230FBD990]();
          id v36 = v48;
          BOOL v37 = HMFGetOSLogHandle();
          id v10 = v46;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v38 = __int16 v45 = v35;
            v39 = [v46 name];
            id v44 = [v19 device];
            id v40 = [v44 name];
            id v41 = [v19 identifier];
            v42 = [v41 UUIDString];
            *(_DWORD *)buf = 138544130;
            id v56 = v38;
            __int16 v57 = 2112;
            v58 = v39;
            __int16 v59 = 2112;
            v60 = v40;
            __int16 v61 = 2112;
            id v62 = v42;
            _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@For home %@, always using resident %@:%@ to execute Media Action scenes", buf, 0x2Au);

            id v35 = v45;
          }

          id v34 = v19;

          id v26 = objc_storeWeak(v36 + 3, v34);
          id v4 = v47;
          objc_super v5 = v48;
          if (!v34) {
            goto LABEL_15;
          }
          goto LABEL_22;
        }
LABEL_13:

        id v4 = v47;
        objc_super v5 = v48;
      }
      id v24 = v14;
      id v26 = objc_storeWeak((id *)&v5->_targetResidentDeviceOverride, 0);
LABEL_15:
      id v27 = (void *)MEMORY[0x230FBD990](v26);
      id v28 = v5;
      uint64_t v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        id v30 = HMFGetLogIdentifier();
        id v31 = [v10 name];
        uint64_t v32 = [v10 uuid];
        int v33 = [v32 UUIDString];
        *(_DWORD *)buf = 138544130;
        id v56 = v30;
        __int16 v57 = 2112;
        v58 = v24;
        __int16 v59 = 2112;
        v60 = v31;
        __int16 v61 = 2112;
        id v62 = v33;
        _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Couldn't find TargetResidentDevice %@ in home %@:%@", buf, 0x2Au);
      }
      id v34 = 0;
      objc_super v5 = v48;
LABEL_22:
    }
  }

  return v5;
}

@end