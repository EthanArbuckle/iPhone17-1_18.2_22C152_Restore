@interface HMDDeviceSetupClientSession
+ (BOOL)isSupported;
+ (id)allowedClasses;
+ (id)logCategory;
+ (int64_t)role;
- (BOOL)processSessionData:(id)a3 outAccessoryUUID:(id *)a4 outAccessoryCategory:(id *)a5 outAccessoryIDSIdentifier:(id *)a6 error:(id *)a7;
- (HMDDeviceSetupClientSession)initWithHomeManager:(id)a3 userDefaults:(id)a4 sessionIdentifier:(id)a5;
- (NSUUID)sessionIdentifier;
@end

@implementation HMDDeviceSetupClientSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (BOOL)processSessionData:(id)a3 outAccessoryUUID:(id *)a4 outAccessoryCategory:(id *)a5 outAccessoryIDSIdentifier:(id *)a6 error:(id *)a7
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  logger = self->_logger;
  if (os_signpost_enabled(logger))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D49D5000, logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClientDeviceSessionProcess", "", buf, 2u);
  }
  if (!v12)
  {
    id v18 = 0;
LABEL_13:
    v28 = [(HMDDeviceSetupSessionInternal *)self homeManager];
    v29 = [MEMORY[0x1E4F1CA60] dictionary];
    unint64_t v30 = [(HMDDeviceSetupSessionInternal *)self state];
    if (v30 == 2)
    {
      if (v18)
      {
        v111 = a5;
        v56 = [v18 objectForKeyedSubscript:@"ac"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v57 = v56;
        }
        else {
          v57 = 0;
        }
        id v31 = v57;

        if (v31)
        {
          v115 = a6;
          v117 = a4;
          id v119 = v12;
          v106 = a7;
          v58 = (void *)MEMORY[0x1D9452090]();
          v108 = self;
          v59 = self;
          v60 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            v61 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v125 = v61;
            __int16 v126 = 2112;
            unint64_t v127 = (unint64_t)v31;
            _os_log_impl(&dword_1D49D5000, v60, OS_LOG_TYPE_DEFAULT, "%{public}@Received accessory description: %@", buf, 0x16u);
          }
          v110 = v59;

          id v62 = v31;
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          if (isKindOfClass) {
            v64 = v62;
          }
          else {
            v64 = 0;
          }
          id v107 = v64;

          v65 = v117;
          id v12 = v119;
          if (isKindOfClass)
          {
            v113 = v29;
            v66 = [v18 objectForKeyedSubscript:@"hk"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v67 = v66;
            }
            else {
              v67 = 0;
            }
            id v68 = v67;

            v109 = v62;
            v104 = v68;
            if (v68) {
              v105 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", v68, v68);
            }
            else {
              v105 = 0;
            }
            v76 = (void *)MEMORY[0x1D9452090]();
            v77 = v110;
            v78 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
            {
              v79 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v125 = v79;
              __int16 v126 = 2112;
              unint64_t v127 = (unint64_t)v105;
              _os_log_impl(&dword_1D49D5000, v78, OS_LOG_TYPE_DEFAULT, "%{public}@Received accessory HomeKit version: %@", buf, 0x16u);
            }
            v80 = v77;

            unint64_t v81 = +[HMDDeviceCapabilities supportedPairingCapabilities];
            v82 = [v109 minimumRequiredPairingSoftwareVersion];
            if (v82)
            {
              v83 = +[HMDHomeKitVersion currentVersion];
              v84 = [v109 minimumRequiredPairingSoftwareVersion];
              int v85 = [v83 isAtLeastVersion:v84];
            }
            else
            {
              int v85 = 1;
            }
            v29 = v113;

            v86 = (void *)MEMORY[0x1D9452090]();
            v87 = v80;
            v88 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
            {
              v89 = HMFGetLogIdentifier();
              v90 = HMFBooleanToString();
              *(_DWORD *)buf = 138543874;
              v125 = v89;
              __int16 v126 = 2048;
              unint64_t v127 = v81;
              __int16 v128 = 2112;
              uint64_t v129 = (uint64_t)v90;
              _os_log_impl(&dword_1D49D5000, v88, OS_LOG_TYPE_DEFAULT, "%{public}@Our pairing capabilities: 0x%lx, minimum software version satisfied: %@", buf, 0x20u);

              v29 = v113;
            }

            if (([v109 canPairGivenCapabilities:v81] & v85 & 1) == 0)
            {
              v99 = (void *)MEMORY[0x1D9452090]();
              v100 = v87;
              v101 = HMFGetOSLogHandle();
              id v12 = v119;
              if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
              {
                v102 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                v125 = v102;
                _os_log_impl(&dword_1D49D5000, v101, OS_LOG_TYPE_ERROR, "%{public}@Cannot pair as current device doesn't have all required capabilities.", buf, 0xCu);
              }
              if (v106)
              {
                id *v106 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
              }

              goto LABEL_85;
            }
            id v12 = v119;
            id v62 = v109;
            if (v115)
            {
              id *v115 = [v109 idsIdentifierString];
            }

            v65 = v117;
          }
          v91 = objc_msgSend(v28, "accessoryBrowser", v104);
          [v91 addUnassociatedAccessory:v62 forDeviceSetup:1];

          if (v65)
          {
            id *v65 = [v62 uuid];
          }
          if (v111)
          {
            id *v111 = [v62 category];
          }
          v92 = encodeRootObjectForIncomingXPCMessage(v62, 0);
          v122 = @"kAccessoryDataKey";
          v123 = v92;
          v93 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v123 forKeys:&v122 count:1];
          [(HMDDeviceSetupSessionInternal *)v110 setUserInfo:v93];

          self = v108;
        }
        [(HMDDeviceSetupSessionInternal *)self setState:3];
LABEL_75:

        if ([(HMDDeviceSetupSessionInternal *)self state] != 3)
        {
          v94 = (void *)MEMORY[0x1D9452090]();
          v95 = self;
          v96 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
          {
            v97 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v125 = v97;
            __int16 v126 = 2112;
            unint64_t v127 = (unint64_t)v29;
            _os_log_impl(&dword_1D49D5000, v96, OS_LOG_TYPE_DEFAULT, "%{public}@Response: %@", buf, 0x16u);
          }
          v98 = encodeRootObjectForRemote(v29, 0, 0);
          [(HMDDeviceSetupSessionInternal *)v95 setSessionData:v98];
        }
        BOOL v50 = 1;
        goto LABEL_86;
      }
      v71 = (void *)MEMORY[0x1D9452090]();
      v72 = self;
      v73 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
      {
        v74 = HMFGetLogIdentifier();
        uint64_t v75 = [(HMDDeviceSetupSessionInternal *)v72 state];
        *(_DWORD *)buf = 138543618;
        v125 = v74;
        __int16 v126 = 2048;
        unint64_t v127 = v75;
        _os_log_impl(&dword_1D49D5000, v73, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid request state: %tu", buf, 0x16u);
      }
      if (a7)
      {
        v69 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v70 = 58;
        goto LABEL_56;
      }
    }
    else
    {
      if (v30 == 1)
      {
        id v120 = 0;
        id v31 = [v28 getOrCreateLocalPairingIdentity:&v120];
        id v32 = v120;
        if (!v32 && v31)
        {
          id v33 = v12;
          v112 = v29;
          v34 = (void *)MEMORY[0x1D9452090]();
          v35 = self;
          v36 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            v37 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v125 = v37;
            __int16 v126 = 2112;
            unint64_t v127 = (unint64_t)v31;
            _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@Sending local pairing identity: %@", buf, 0x16u);
          }
          v38 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDDeviceSetupSessionInternal state](v35, "state"));
          [v112 setObject:v38 forKeyedSubscript:@"st"];

          [v112 setObject:v31 forKeyedSubscript:@"pi"];
          v39 = NSNumber;
          v40 = [v28 hh2FrameworkSwitch];
          v41 = objc_msgSend(v39, "numberWithBool:", objc_msgSend(v40, "checkExistenceOfHH2SentinelZone"));
          [v112 setObject:v41 forKeyedSubscript:@"sz.hh2"];

          v42 = [(HMDDeviceSetupClientSession *)v35 sessionIdentifier];
          v43 = [v42 UUIDString];

          v44 = (void *)MEMORY[0x1D9452090]();
          v45 = v35;
          v46 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            v47 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v125 = v47;
            __int16 v126 = 2112;
            unint64_t v127 = (unint64_t)v43;
            _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@Sending setup session identifier %@ as part of payload", buf, 0x16u);
          }
          v29 = v112;
          [v112 setObject:v43 forKeyedSubscript:@"session.id"];
          [(HMDDeviceSetupSessionInternal *)v45 setState:2];

          id v12 = v33;
          goto LABEL_75;
        }

        goto LABEL_85;
      }
      if (a7)
      {
        v69 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v70 = 23;
LABEL_56:
        [v69 hmErrorWithCode:v70];
        BOOL v50 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_86:

        goto LABEL_87;
      }
    }
LABEL_85:
    BOOL v50 = 0;
    goto LABEL_86;
  }
  v114 = a6;
  v116 = a4;
  v14 = (void *)MEMORY[0x1E4F28DC0];
  v15 = +[HMDDeviceSetupServerSession allowedClasses];
  id v121 = 0;
  id v118 = v12;
  v16 = [v14 unarchivedObjectOfClasses:v15 fromData:v12 error:&v121];
  id v17 = v121;

  id v18 = v16;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v19 = v18;
  }
  else {
    v19 = 0;
  }
  id v20 = v19;

  v21 = (void *)MEMORY[0x1D9452090]();
  v22 = self;
  v23 = HMFGetOSLogHandle();
  v24 = v23;
  if (v20)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v125 = v25;
      __int16 v126 = 2112;
      unint64_t v127 = (unint64_t)v20;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Processing request: %@", buf, 0x16u);
    }
    v26 = objc_msgSend(v20, "hmf_numberForKey:", @"st");
    uint64_t v27 = [v26 integerValue];
    if (v27 == [(HMDDeviceSetupSessionInternal *)v22 state])
    {

      a4 = v116;
      id v12 = v118;
      a6 = v114;
      goto LABEL_13;
    }
    v51 = (void *)MEMORY[0x1D9452090]();
    v52 = v22;
    v53 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      v54 = HMFGetLogIdentifier();
      uint64_t v55 = [(HMDDeviceSetupSessionInternal *)v52 state];
      *(_DWORD *)buf = 138543874;
      v125 = v54;
      __int16 v126 = 2112;
      unint64_t v127 = (unint64_t)v26;
      __int16 v128 = 2048;
      uint64_t v129 = v55;
      _os_log_impl(&dword_1D49D5000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@Request state number, %@, does not match expected state number: %tu", buf, 0x20u);
    }
    if (a7)
    {
      *a7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:27];
    }

    BOOL v50 = 0;
    v28 = v17;
  }
  else
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v48 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v125 = v48;
      __int16 v126 = 2112;
      unint64_t v127 = (unint64_t)v17;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive request payload from data: %@", buf, 0x16u);
    }
    if (a7)
    {
      id v49 = v17;
      BOOL v50 = 0;
      v28 = v18;
      *a7 = v49;
      id v18 = v49;
    }
    else
    {
      BOOL v50 = 0;
      v28 = v18;
      id v18 = v17;
    }
  }
  id v12 = v118;
LABEL_87:

  return v50;
}

- (HMDDeviceSetupClientSession)initWithHomeManager:(id)a3 userDefaults:(id)a4 sessionIdentifier:(id)a5
{
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMDDeviceSetupClientSession;
  v10 = [(HMDDeviceSetupSessionInternal *)&v14 initWithHomeManager:a3 userDefaults:a4];
  if (v10)
  {
    uint64_t v11 = HMFGetOSLogHandle();
    logger = v10->_logger;
    v10->_logger = (OS_os_log *)v11;

    objc_storeStrong((id *)&v10->_sessionIdentifier, a5);
  }

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t40 != -1) {
    dispatch_once(&logCategory__hmf_once_t40, &__block_literal_global_325);
  }
  v2 = (void *)logCategory__hmf_once_v41;
  return v2;
}

uint64_t __42__HMDDeviceSetupClientSession_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v41;
  logCategory__hmf_once_v41 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)allowedClasses
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HMDDeviceSetupClientSession;
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
  char v3 = [v2 supportsKeychainSync];

  return v3;
}

+ (int64_t)role
{
  return 0;
}

@end