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
  uint64_t v184 = *MEMORY[0x263EF8340];
  id v169 = a3;
  logger = self->_logger;
  if (os_signpost_enabled(logger))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22F52A000, logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClientDeviceSessionProcess", "", buf, 2u);
  }
  if (!v169)
  {
    id v16 = 0;
LABEL_13:
    v167 = [(HMDDeviceSetupSessionInternal *)self homeManager];
    v166 = [MEMORY[0x263EFF9A0] dictionary];
    unint64_t v31 = [(HMDDeviceSetupSessionInternal *)self state];
    if (v31 != 2)
    {
      if (v31 == 1)
      {
        id v170 = 0;
        id v32 = [v167 getOrCreateLocalPairingIdentity:&v170];
        id v33 = v170;
        if (!v33 && v32)
        {
          v34 = (void *)MEMORY[0x230FBD990]();
          v35 = self;
          v36 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            v37 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v175 = v37;
            __int16 v176 = 2112;
            unint64_t v177 = (unint64_t)v32;
            _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@Sending local pairing identity: %@", buf, 0x16u);
          }
          v38 = [MEMORY[0x263F35AD0] systemStore];
          uint64_t v39 = [v38 getPreferredHH2ControllerKey];

          if (!v39)
          {
            v40 = (void *)MEMORY[0x230FBD990]();
            v41 = v35;
            v42 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v44 = id v43 = v32;
              *(_DWORD *)buf = 138543362;
              v175 = v44;
              _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@Its very strange that we are running in HH2 mode but we do not have HH2 pairing key. This will not fail TTSU as the HH2 key will be created by the newly setup device.", buf, 0xCu);

              id v32 = v43;
            }
          }
          [v166 setObject:v39 forKeyedSubscript:@"pi.hh2"];
          [v166 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"mi.hh2"];
          v45 = [v167 homes];
          v46 = [v45 firstObject];
          v159 = v45;
          unint64_t v47 = 0x263F08000;
          v162 = (void *)v39;
          if ([v45 count] == 1 && v46)
          {
            id v157 = v32;
            v48 = [v46 residentDeviceManager];
            uint64_t v49 = [v48 residentDevices];
            int v50 = objc_msgSend((id)v49, "na_any:", &__block_literal_global_324);

            v51 = [v46 appleMediaAccessories];
            LODWORD(v49) = objc_msgSend(v51, "na_any:", &__block_literal_global_327);

            unsigned int v155 = v50 | v49;
            context = (void *)MEMORY[0x230FBD990]();
            v52 = v35;
            v53 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              v151 = HMFGetLogIdentifier();
              v149 = HMFBooleanToString();
              v54 = [v46 shortDescription];
              v55 = HMFBooleanToString();
              uint64_t v56 = HMFBooleanToString();
              *(_DWORD *)buf = 138544386;
              v175 = v151;
              __int16 v176 = 2112;
              unint64_t v177 = (unint64_t)v149;
              __int16 v178 = 2112;
              uint64_t v179 = (uint64_t)v54;
              __int16 v180 = 2112;
              v181 = v55;
              __int16 v182 = 2112;
              uint64_t v183 = v56;
              v57 = (void *)v56;
              _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@Sending home has reachable resident value: %@ as part of payload (home: %@, hasReachableResident: %@, hasReachableAppleMediaAccessory: %@)", buf, 0x34u);
            }
            unint64_t v47 = 0x263F08000uLL;
            v58 = [NSNumber numberWithBool:v155];
            [v166 setObject:v58 forKeyedSubscript:@"rpr"];

            id v32 = v157;
          }
          v59 = objc_msgSend(*(id *)(v47 + 2584), "numberWithInteger:", -[HMDDeviceSetupSessionInternal state](v35, "state"));
          [v166 setObject:v59 forKeyedSubscript:@"st"];

          [v166 setObject:v32 forKeyedSubscript:@"pi"];
          v60 = *(void **)(v47 + 2584);
          v61 = [v167 hh2FrameworkSwitch];
          v62 = objc_msgSend(v60, "numberWithBool:", objc_msgSend(v61, "checkExistenceOfHH2SentinelZone"));
          [v166 setObject:v62 forKeyedSubscript:@"sz.hh2"];

          v63 = [(HMDDeviceSetupClientSession *)v35 sessionIdentifier];
          v64 = [v63 UUIDString];

          v65 = (void *)MEMORY[0x230FBD990]();
          v66 = v35;
          v67 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v69 = id v68 = v32;
            *(_DWORD *)buf = 138543618;
            v175 = v69;
            __int16 v176 = 2112;
            unint64_t v177 = (unint64_t)v64;
            _os_log_impl(&dword_22F52A000, v67, OS_LOG_TYPE_DEFAULT, "%{public}@Sending setup session identifier %@ as part of payload", buf, 0x16u);

            id v32 = v68;
          }

          [v166 setObject:v64 forKeyedSubscript:@"session.id"];
          [(HMDDeviceSetupSessionInternal *)v66 setState:2];

          goto LABEL_102;
        }

        goto LABEL_83;
      }
      if (a7)
      {
        v96 = (void *)MEMORY[0x263F087E8];
        uint64_t v97 = 23;
LABEL_65:
        [v96 hmErrorWithCode:v97];
        BOOL v72 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_107:

        goto LABEL_108;
      }
      goto LABEL_83;
    }
    if (!v16)
    {
      v98 = (void *)MEMORY[0x230FBD990]();
      v99 = self;
      v100 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
      {
        v101 = HMFGetLogIdentifier();
        uint64_t v102 = [(HMDDeviceSetupSessionInternal *)v99 state];
        *(_DWORD *)buf = 138543618;
        v175 = v101;
        __int16 v176 = 2048;
        unint64_t v177 = v102;
        _os_log_impl(&dword_22F52A000, v100, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid request state: %tu", buf, 0x16u);
      }
      if (a7)
      {
        v96 = (void *)MEMORY[0x263F087E8];
        uint64_t v97 = 58;
        goto LABEL_65;
      }
LABEL_83:
      BOOL v72 = 0;
      goto LABEL_107;
    }
    v78 = [v16 objectForKeyedSubscript:@"ac"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v79 = v78;
    }
    else {
      v79 = 0;
    }
    id v32 = v79;

    if (!v32)
    {
LABEL_101:
      [(HMDDeviceSetupSessionInternal *)self setState:3];
LABEL_102:

      if ([(HMDDeviceSetupSessionInternal *)self state] != 3)
      {
        v141 = (void *)MEMORY[0x230FBD990]();
        v142 = self;
        v143 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
        {
          v144 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v175 = v144;
          __int16 v176 = 2112;
          unint64_t v177 = (unint64_t)v166;
          _os_log_impl(&dword_22F52A000, v143, OS_LOG_TYPE_DEFAULT, "%{public}@Response: %@", buf, 0x16u);
        }
        v145 = encodeRootObjectForRemote(v166, 0, 0);
        [(HMDDeviceSetupSessionInternal *)v142 setSessionData:v145];
      }
      BOOL v72 = 1;
      goto LABEL_107;
    }
    v80 = (void *)MEMORY[0x230FBD990]();
    v81 = self;
    v82 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v163 = a6;
      v83 = self;
      id v84 = v16;
      v85 = a7;
      v86 = a4;
      v88 = v87 = a5;
      *(_DWORD *)buf = 138543618;
      v175 = v88;
      __int16 v176 = 2112;
      unint64_t v177 = (unint64_t)v32;
      _os_log_impl(&dword_22F52A000, v82, OS_LOG_TYPE_DEFAULT, "%{public}@Received accessory description: %@", buf, 0x16u);

      a5 = v87;
      a4 = v86;
      a7 = v85;
      id v16 = v84;
      self = v83;
      a6 = v163;
    }

    v164 = v81;
    id v89 = v32;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      v91 = v89;
    }
    else {
      v91 = 0;
    }
    id v92 = v91;

    if ((isKindOfClass & 1) == 0)
    {
LABEL_96:
      v138 = objc_msgSend(v167, "accessoryBrowser", v147);
      [v138 addUnassociatedAccessory:v89 forDeviceSetup:1];

      if (a4)
      {
        *a4 = [v89 uuid];
      }
      if (a5)
      {
        *a5 = [v89 category];
      }
      v139 = encodeRootObjectForIncomingXPCMessage(v89, 0);
      v172 = @"kAccessoryDataKey";
      v173 = v139;
      v140 = [NSDictionary dictionaryWithObjects:&v173 forKeys:&v172 count:1];
      [(HMDDeviceSetupSessionInternal *)v164 setUserInfo:v140];

      goto LABEL_101;
    }
    id v148 = v92;
    v93 = [v16 objectForKeyedSubscript:@"hk"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v94 = v93;
    }
    else {
      v94 = 0;
    }
    id v95 = v94;

    id v158 = v32;
    v160 = v89;
    v152 = v95;
    if (v95) {
      v156 = [[HMDHomeKitVersion alloc] initWithVersionString:v95];
    }
    else {
      v156 = 0;
    }
    v150 = a5;
    v103 = (void *)MEMORY[0x230FBD990]();
    v104 = v164;
    v105 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
    {
      v106 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v175 = v106;
      __int16 v176 = 2112;
      unint64_t v177 = (unint64_t)v156;
      _os_log_impl(&dword_22F52A000, v105, OS_LOG_TYPE_DEFAULT, "%{public}@Received accessory HomeKit version: %@", buf, 0x16u);
    }
    unint64_t v107 = +[HMDDeviceCapabilities supportedPairingCapabilities];
    v108 = [v160 minimumRequiredPairingSoftwareVersion];
    if (v108)
    {
      v109 = +[HMDHomeKitVersion currentVersion];
      v110 = [v160 minimumRequiredPairingSoftwareVersion];
      int contexta = [v109 isAtLeastVersion:v110];
    }
    else
    {
      int contexta = 1;
    }

    v111 = (void *)MEMORY[0x230FBD990]();
    v112 = v104;
    v113 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v114 = v147 = v112;
      v115 = HMFBooleanToString();
      *(_DWORD *)buf = 138543874;
      v175 = v114;
      __int16 v176 = 2048;
      unint64_t v177 = v107;
      __int16 v178 = 2112;
      uint64_t v179 = (uint64_t)v115;
      _os_log_impl(&dword_22F52A000, v113, OS_LOG_TYPE_DEFAULT, "%{public}@Our pairing capabilities: 0x%lx, minimum software version satisfied: %@", buf, 0x20u);

      v112 = v147;
    }

    if ([v160 canPairGivenCapabilities:v107] & contexta)
    {
      v116 = v112;
      v117 = [[HMDHomeKitVersion alloc] initWithVersionString:@"10.0"];
      if ([(HMDHomeKitVersion *)v156 isAtLeastVersion:v117])
      {

        a5 = v150;
LABEL_90:
        v134 = (void *)MEMORY[0x230FBD990]();
        v135 = v116;
        v136 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
        {
          v137 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v175 = v137;
          _os_log_impl(&dword_22F52A000, v136, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory HomeKit version indicates HH2 support, continuing normally", buf, 0xCu);

          a5 = v150;
        }

        id v32 = v158;
LABEL_93:
        id v89 = v160;
        if (a6)
        {
          *a6 = [v160 idsIdentifierString];
        }

        id v92 = v148;
        goto LABEL_96;
      }
      v125 = [v160 category];
      v126 = [v125 categoryType];
      char v127 = [v126 isEqualToString:*MEMORY[0x263F0B0A0]];

      a5 = v150;
      if ((v127 & 1) == 0) {
        goto LABEL_90;
      }
      v128 = (void *)MEMORY[0x230FBD990]();
      v129 = v116;
      v130 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
      {
        v131 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v175 = v131;
        _os_log_impl(&dword_22F52A000, v130, OS_LOG_TYPE_DEFAULT, "%{public}@Starting HomePod upgrade and pairing engine", buf, 0xCu);

        a5 = v150;
      }

      v132 = [v167 legacyAccessoryPairingController];
      char v133 = [v132 pairAccessory:v160];

      id v32 = v158;
      if (v133) {
        goto LABEL_93;
      }
      v122 = v160;
      v123 = v152;
      if (!a7)
      {
LABEL_82:

        goto LABEL_83;
      }
      uint64_t v124 = -1;
    }
    else
    {
      v118 = (void *)MEMORY[0x230FBD990]();
      v119 = v112;
      v120 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
      {
        v121 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v175 = v121;
        _os_log_impl(&dword_22F52A000, v120, OS_LOG_TYPE_ERROR, "%{public}@Cannot pair as current device doesn't have all required capabilities.", buf, 0xCu);
      }
      v122 = v160;
      v123 = v152;
      if (!a7) {
        goto LABEL_82;
      }
      uint64_t v124 = 48;
    }
    objc_msgSend(MEMORY[0x263F087E8], "hmErrorWithCode:", v124, v147);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_82;
  }
  v13 = (void *)MEMORY[0x263F08928];
  v14 = +[HMDDeviceSetupServerSession allowedClasses];
  id v171 = 0;
  v15 = [v13 unarchivedObjectOfClasses:v14 fromData:v169 error:&v171];
  id v165 = v171;

  id v16 = v15;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v17 = v16;
  }
  else {
    v17 = 0;
  }
  id v18 = v17;

  v19 = (void *)MEMORY[0x230FBD990]();
  v20 = self;
  v21 = HMFGetOSLogHandle();
  v22 = v21;
  if (v18)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v161 = a6;
      v23 = self;
      id v24 = v16;
      v25 = a7;
      v26 = a4;
      v28 = v27 = a5;
      *(_DWORD *)buf = 138543618;
      v175 = v28;
      __int16 v176 = 2112;
      unint64_t v177 = (unint64_t)v18;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Processing request: %@", buf, 0x16u);

      a5 = v27;
      a4 = v26;
      a7 = v25;
      id v16 = v24;
      self = v23;
      a6 = v161;
    }

    v29 = objc_msgSend(v18, "hmf_numberForKey:", @"st");
    uint64_t v30 = [v29 integerValue];
    if (v30 == [(HMDDeviceSetupSessionInternal *)v20 state])
    {

      goto LABEL_13;
    }
    v73 = (void *)MEMORY[0x230FBD990]();
    v74 = v20;
    v75 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      v76 = HMFGetLogIdentifier();
      uint64_t v77 = [(HMDDeviceSetupSessionInternal *)v74 state];
      *(_DWORD *)buf = 138543874;
      v175 = v76;
      __int16 v176 = 2112;
      unint64_t v177 = (unint64_t)v29;
      __int16 v178 = 2048;
      uint64_t v179 = v77;
      _os_log_impl(&dword_22F52A000, v75, OS_LOG_TYPE_DEFAULT, "%{public}@Request state number, %@, does not match expected state number: %tu", buf, 0x20u);
    }
    if (a7)
    {
      *a7 = [MEMORY[0x263F087E8] hmErrorWithCode:27];
    }

    BOOL v72 = 0;
  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v70 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v175 = v70;
      __int16 v176 = 2112;
      unint64_t v177 = (unint64_t)v165;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive request payload from data: %@", buf, 0x16u);
    }
    if (a7)
    {
      id v71 = v165;
      BOOL v72 = 0;
      v168 = v16;
      *a7 = v71;
      id v16 = v71;
    }
    else
    {
      BOOL v72 = 0;
      v168 = v16;
      id v16 = v165;
    }
  }
LABEL_108:

  return v72;
}

uint64_t __120__HMDDeviceSetupClientSession_processSessionData_outAccessoryUUID_outAccessoryCategory_outAccessoryIDSIdentifier_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isReachable];
}

uint64_t __120__HMDDeviceSetupClientSession_processSessionData_outAccessoryUUID_outAccessoryCategory_outAccessoryIDSIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isReachable];
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
  if (logCategory__hmf_once_t43 != -1) {
    dispatch_once(&logCategory__hmf_once_t43, &__block_literal_global_332_36276);
  }
  v2 = (void *)logCategory__hmf_once_v44;
  return v2;
}

void __42__HMDDeviceSetupClientSession_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v44;
  logCategory__hmf_once_v44 = v0;
}

+ (id)allowedClasses
{
  v7[1] = *MEMORY[0x263EF8340];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HMDDeviceSetupClientSession;
  v2 = objc_msgSendSuper2(&v6, sel_allowedClasses);
  v3 = (void *)[v2 mutableCopy];

  v7[0] = objc_opt_class();
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
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