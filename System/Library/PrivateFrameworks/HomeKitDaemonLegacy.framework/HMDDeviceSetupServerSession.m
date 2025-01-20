@interface HMDDeviceSetupServerSession
+ (BOOL)isSupported;
+ (id)allowedClasses;
+ (id)logCategory;
+ (int64_t)role;
- (BOOL)processSessionData:(id)a3 outAccessoryUUID:(id *)a4 outAccessoryCategory:(id *)a5 outAccessoryIDSIdentifier:(id *)a6 error:(id *)a7;
- (HMDDeviceSetupServerSession)initWithHomeManager:(id)a3 userDefaults:(id)a4;
@end

@implementation HMDDeviceSetupServerSession

- (void).cxx_destruct
{
}

- (BOOL)processSessionData:(id)a3 outAccessoryUUID:(id *)a4 outAccessoryCategory:(id *)a5 outAccessoryIDSIdentifier:(id *)a6 error:(id *)a7
{
  uint64_t v168 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  logger = self->_logger;
  if (os_signpost_enabled(logger))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D49D5000, logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ServerDeviceSessionProcess", "", buf, 2u);
  }
  v13 = [(HMDDeviceSetupSessionInternal *)self homeManager];
  v14 = [v13 currentAccessorySetupMetricDispatcher];
  if (!v11)
  {
    v152 = a4;
    v153 = a5;
    v29 = 0;
    id v18 = 0;
LABEL_13:
    v157 = [MEMORY[0x1E4F1CA60] dictionary];
    id v30 = [[HMDRemoteKeyedArchiver alloc] initForWritingWithRemoteDeviceIsOnSameAccount:0 remoteGateway:0 remoteUserIsAdministrator:0 user:0 supportedFeatures:0];
    unint64_t v31 = [(HMDDeviceSetupSessionInternal *)self state];
    v154 = v29;
    if (v31 == 2)
    {
      v150 = v30;
      id v151 = v11;
LABEL_59:
      [v14 markSetupBeginStage:4 error:v18];
      v93 = [v13 accessoryBrowser];
      v94 = [v93 mediaBrowser];
      v95 = [v94 currentAccessory];

      v96 = (void *)MEMORY[0x1D9452090]();
      v97 = self;
      v98 = HMFGetOSLogHandle();
      v99 = v98;
      v160 = v13;
      if (v95)
      {
        if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
        {
          v100 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v163 = v100;
          __int16 v164 = 2112;
          id v165 = v95;
          _os_log_impl(&dword_1D49D5000, v99, OS_LOG_TYPE_DEFAULT, "%{public}@Set accessory %@", buf, 0x16u);
        }
        v101 = self->_logger;
        if (os_signpost_enabled(v101))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D49D5000, v101, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SentUnassociatedAppleMediaAccessory", "", buf, 2u);
        }
        [v157 setObject:v95 forKeyedSubscript:@"ac"];
        id v102 = v95;
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if (isKindOfClass) {
          v104 = v102;
        }
        else {
          v104 = 0;
        }
        id v105 = v104;

        if (a6 && (isKindOfClass & 1) != 0)
        {
          *a6 = [v105 idsIdentifierString];
        }
        if (v152)
        {
          id *v152 = [v102 uuid];
        }
        if (v153)
        {
          id *v153 = [v102 category];
        }
        v106 = [v102 uuid];
        v107 = [v106 UUIDString];

        if (v107)
        {
          v108 = (void *)MEMORY[0x1D9452090]();
          v109 = v97;
          v110 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
          {
            v111 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v163 = v111;
            __int16 v164 = 2112;
            id v165 = v107;
            _os_log_impl(&dword_1D49D5000, v110, OS_LOG_TYPE_INFO, "%{public}@Saving model uuid for Core Data voucher %@", buf, 0x16u);
          }
          v112 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
          [v112 setObject:v107 forKey:@"HMDCurrentAccessoryModelUUID"];
        }
      }
      else
      {
        if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
        {
          v122 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v163 = v122;
          _os_log_impl(&dword_1D49D5000, v99, OS_LOG_TYPE_ERROR, "%{public}@Did not obtain accessory in M2.", buf, 0xCu);
        }
        [MEMORY[0x1E4F28C58] hmfErrorWithCode:2 reason:@"No accessory found from the browser"];
        id v105 = v18;
        id v18 = (id)objc_claimAutoreleasedReturnValue();
      }

      v123 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDDeviceSetupSessionInternal state](v97, "state"));
      v121 = v157;
      [v157 setObject:v123 forKeyedSubscript:@"st"];

      v124 = +[HMDHomeKitVersion currentVersion];
      v125 = [v124 versionString];
      [v157 setObject:v125 forKeyedSubscript:@"hk"];

      [(HMDDeviceSetupSessionInternal *)v97 setState:3];
      [v14 markSetupEndStage:4 error:v18];

      v126 = (void *)MEMORY[0x1D9452090]();
      v127 = v97;
      v128 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
      {
        v129 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v163 = v129;
        __int16 v164 = 2112;
        id v165 = v157;
        _os_log_impl(&dword_1D49D5000, v128, OS_LOG_TYPE_INFO, "%{public}@Response: %@", buf, 0x16u);
      }
      id v30 = v150;
      [v150 encodeObject:v157 forKey:*MEMORY[0x1E4F284E8]];
      [v150 finishEncoding];
      v130 = [v150 encodedData];
      [(HMDDeviceSetupSessionInternal *)v127 setSessionData:v130];

      BOOL v85 = 1;
      id v11 = v151;
      v13 = v160;
LABEL_94:
      v138 = v154;
LABEL_103:

      goto LABEL_104;
    }
    if (v31 != 1)
    {
      v113 = (void *)MEMORY[0x1D9452090]();
      v114 = self;
      v115 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v116 = v30;
        id v117 = v18;
        v118 = v14;
        v120 = v119 = v13;
        *(_DWORD *)buf = 138543362;
        v163 = v120;
        _os_log_impl(&dword_1D49D5000, v115, OS_LOG_TYPE_ERROR, "%{public}@Unrecognized state or hit error.", buf, 0xCu);

        v13 = v119;
        v14 = v118;
        id v18 = v117;
        id v30 = v116;
      }

      v121 = v157;
      if (a7)
      {
        [MEMORY[0x1E4F28C58] hmErrorWithCode:23];
        BOOL v85 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v85 = 0;
      }
      goto LABEL_94;
    }
    [v14 markSetupBeginStage:3 error:v18];
    v32 = [v29 objectForKeyedSubscript:@"pi"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v33 = v32;
    }
    else {
      v33 = 0;
    }
    id v34 = v33;

    v149 = v34;
    if (v34)
    {
      if ([v13 setLocalPairingIdentity:v34 error:a7])
      {
        v35 = self->_logger;
        if (os_signpost_enabled(v35))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D49D5000, v35, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReceivedLocalControllerKey", "", buf, 2u);
        }
        v150 = v30;
        uint64_t v36 = [v29 objectForKeyedSubscript:@"pi.hh2"];
        v148 = (void *)v36;
        id v151 = v11;
        v159 = v13;
        if (v36)
        {
          v37 = (void *)v36;
          v38 = (void *)MEMORY[0x1D9452090]();
          v39 = self;
          v40 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            v41 = HMFGetLogIdentifier();
            v42 = [v37 identifier];
            *(_DWORD *)buf = 138543618;
            v163 = v41;
            __int16 v164 = 2112;
            id v165 = v42;
            _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@Got the HH2 Pairing key during TTSU : %@. Going to save it to keychain store", buf, 0x16u);

            v37 = v148;
          }

          v43 = [MEMORY[0x1E4F5BE48] systemStore];
          char v44 = [v43 saveHH2PairingIdentity:v37 syncable:1];

          if ((v44 & 1) == 0)
          {
            v45 = (void *)MEMORY[0x1D9452090]();
            v46 = v39;
            v47 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              v48 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              v163 = v48;
              _os_log_impl(&dword_1D49D5000, v47, OS_LOG_TYPE_ERROR, "%{public}@Unable to save the HH2 key to keychain store. This will not fail TTSU as there can be multiple HH2 keys and the HomeKitDaemon will handle that appropriately.", buf, 0xCu);
            }
            uint64_t v49 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:3401];

            id v18 = (id)v49;
          }
          v29 = v154;
        }
        v50 = objc_msgSend(v29, "hmf_numberForKey:", @"mi.hh2");
        if (v50)
        {
          v51 = (void *)MEMORY[0x1D9452090]();
          v52 = self;
          v53 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            v54 = HMFGetLogIdentifier();
            [v50 BOOLValue];
            v55 = HMFBooleanToString();
            *(_DWORD *)buf = 138543618;
            v163 = v54;
            __int16 v164 = 2112;
            id v165 = v55;
            _os_log_impl(&dword_1D49D5000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@Got the HH2 settings migration key during TTSU : %@. Going to save it to user defaults", buf, 0x16u);

            v29 = v154;
          }

          v56 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
          objc_msgSend(v56, "setBool:forKey:", objc_msgSend(v50, "BOOLValue"), @"mi.hh2");
        }
        v57 = objc_msgSend(v29, "hmf_numberForKey:", @"rpr");
        if (v57)
        {
          v58 = v50;
          v59 = (void *)MEMORY[0x1D9452090]();
          v60 = self;
          v61 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            v62 = HMFGetLogIdentifier();
            [v57 BOOLValue];
            v63 = HMFBooleanToString();
            *(_DWORD *)buf = 138543618;
            v163 = v62;
            __int16 v164 = 2112;
            id v165 = v63;
            _os_log_impl(&dword_1D49D5000, v61, OS_LOG_TYPE_DEFAULT, "%{public}@Got the home has reachable resident value during TTSU: %@.", buf, 0x16u);

            v29 = v154;
          }

          v64 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
          objc_msgSend(v64, "setBool:forKey:", objc_msgSend(v57, "BOOLValue"), @"rpr");

          v50 = v58;
        }
        v147 = v50;
        uint64_t v65 = [v50 BOOLValue];
        objc_msgSend(v29, "hmf_numberForKey:", @"sz.hh2");
        v67 = v66 = v29;
        uint64_t v68 = [v67 BOOLValue];

        [v14 markControllerHH2Mode:v65 controllerHH2SentinelExists:v68];
        v69 = [v66 objectForKeyedSubscript:@"session.id"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v70 = v69;
        }
        else {
          v70 = 0;
        }
        id v71 = v70;

        v13 = v159;
        if (v71)
        {
          v72 = (void *)MEMORY[0x1D9452090]();
          v73 = self;
          v74 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
          {
            v75 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v163 = v75;
            __int16 v164 = 2112;
            id v165 = v71;
            _os_log_impl(&dword_1D49D5000, v74, OS_LOG_TYPE_INFO, "%{public}@Setting controller setup session identifier %@", buf, 0x16u);
          }
          [v14 setControllerSetupSessionIdentifier:v71];
        }
        v76 = [v159 uuid];
        [v159 updateGenerationCounterWithReason:@"Device Setup Set Controller Keys" sourceUUID:v76 shouldNotifyClients:1];

        v77 = (void *)MEMORY[0x1D9452090]([v14 markSetupEndStage:3 error:v18]);
        v78 = self;
        v79 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
        {
          v80 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v163 = v80;
          _os_log_impl(&dword_1D49D5000, v79, OS_LOG_TYPE_DEFAULT, "%{public}@Proceeding to M2", buf, 0xCu);
        }
        [(HMDDeviceSetupSessionInternal *)v78 setState:2];

        goto LABEL_59;
      }
      v139 = (void *)MEMORY[0x1D9452090]();
      v140 = self;
      v141 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v143 = id v142 = v30;
        *(_DWORD *)buf = 138543362;
        v163 = v143;
        _os_log_impl(&dword_1D49D5000, v141, OS_LOG_TYPE_ERROR, "%{public}@Failed to set local pairing identity", buf, 0xCu);

        id v30 = v142;
      }

      v121 = v157;
      if (a7)
      {
        id v137 = *a7;
      }
      else
      {
        id v137 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:16 reason:@"Failed to set local pairing identity"];
      }
    }
    else
    {
      v131 = (void *)MEMORY[0x1D9452090]();
      v132 = self;
      v133 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v135 = id v134 = v30;
        *(_DWORD *)buf = 138543362;
        v163 = v135;
        _os_log_impl(&dword_1D49D5000, v133, OS_LOG_TYPE_ERROR, "%{public}@Request missing pairing identity", buf, 0xCu);

        id v30 = v134;
      }

      v121 = v157;
      if (!a7)
      {
        v138 = v154;
        v144 = 0;
LABEL_102:
        [v14 markSetupEndStage:3 error:v18];

        BOOL v85 = 0;
        goto LABEL_103;
      }
      id v136 = [MEMORY[0x1E4F28C58] hmErrorWithCode:27];
      *a7 = v136;
      id v137 = v136;
    }
    id v145 = v137;
    v138 = v154;
    v144 = v149;

    id v18 = v145;
    goto LABEL_102;
  }
  v15 = (void *)MEMORY[0x1E4F28DC0];
  v16 = +[HMDDeviceSetupClientSession allowedClasses];
  id v161 = 0;
  v17 = [v15 unarchivedObjectOfClasses:v16 fromData:v11 error:&v161];
  id v18 = v161;

  if (v17)
  {
    v152 = a4;
    v153 = a5;
    v156 = v14;
    v158 = v13;
    id v19 = v11;
    id v20 = v17;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v21 = v20;
    }
    else {
      v21 = 0;
    }
    id v22 = v21;

    v23 = (void *)MEMORY[0x1D9452090]();
    v24 = self;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v163 = v26;
      __int16 v164 = 2112;
      id v165 = v22;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Processing request: %@", buf, 0x16u);
    }
    v27 = objc_msgSend(v22, "hmf_numberForKey:", @"st");
    uint64_t v28 = [v27 integerValue];
    v29 = v22;
    if (v28 == [(HMDDeviceSetupSessionInternal *)v24 state])
    {

      id v11 = v19;
      v14 = v156;
      v13 = v158;
      goto LABEL_13;
    }
    v86 = (void *)MEMORY[0x1D9452090]();
    v87 = v24;
    v88 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
    {
      v89 = HMFGetLogIdentifier();
      uint64_t v90 = [(HMDDeviceSetupSessionInternal *)v87 state];
      *(_DWORD *)buf = 138543874;
      v163 = v89;
      __int16 v164 = 2112;
      id v165 = v27;
      __int16 v166 = 2048;
      uint64_t v167 = v90;
      _os_log_impl(&dword_1D49D5000, v88, OS_LOG_TYPE_DEFAULT, "%{public}@Request state number, %@, does not match expected state number: %tu", buf, 0x20u);
    }
    if (a7)
    {
      id v91 = [MEMORY[0x1E4F28C58] hmErrorWithCode:27];
      *a7 = v91;
      id v92 = v91;

      id v18 = v92;
    }
    id v11 = v19;
    v14 = v156;
    [v156 markSetupBeginStage:3 error:v18];

    BOOL v85 = 0;
    v13 = v158;
  }
  else
  {
    v81 = (void *)MEMORY[0x1D9452090]();
    v82 = self;
    v83 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
    {
      v84 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v163 = v84;
      __int16 v164 = 2112;
      id v165 = v18;
      _os_log_impl(&dword_1D49D5000, v83, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive request payload from data: %@", buf, 0x16u);
    }
    if (a7) {
      *a7 = v18;
    }
    [v14 markSetupBeginStage:3 error:v18];
    BOOL v85 = 0;
  }
LABEL_104:

  return v85;
}

- (HMDDeviceSetupServerSession)initWithHomeManager:(id)a3 userDefaults:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)HMDDeviceSetupServerSession;
  v4 = [(HMDDeviceSetupSessionInternal *)&v8 initWithHomeManager:a3 userDefaults:a4];
  if (v4)
  {
    uint64_t v5 = HMFGetOSLogHandle();
    logger = v4->_logger;
    v4->_logger = (OS_os_log *)v5;
  }
  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t68_26176 != -1) {
    dispatch_once(&logCategory__hmf_once_t68_26176, &__block_literal_global_355);
  }
  v2 = (void *)logCategory__hmf_once_v69_26177;
  return v2;
}

uint64_t __42__HMDDeviceSetupServerSession_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v69_26177;
  logCategory__hmf_once_v69_26177 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)allowedClasses
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HMDDeviceSetupServerSession;
  v2 = objc_msgSendSuper2(&v6, sel_allowedClasses);
  v3 = (void *)[v2 mutableCopy];

  v7[0] = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v3 addObjectsFromArray:v4];

  return v3;
}

+ (BOOL)isSupported
{
  v2 = +[HMDDeviceCapabilities deviceCapabilities];
  char v3 = [v2 supportsDeviceSetup];

  return v3;
}

+ (int64_t)role
{
  return 1;
}

@end