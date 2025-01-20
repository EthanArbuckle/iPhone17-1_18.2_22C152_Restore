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
  uint64_t v194 = *MEMORY[0x263EF8340];
  id v12 = a3;
  logger = self->_logger;
  if (os_signpost_enabled(logger))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22F52A000, logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ServerDeviceSessionProcess", "", buf, 2u);
  }
  v184 = a7;
  v178 = a4;
  v14 = [(HMDDeviceSetupSessionInternal *)self homeManager];
  v15 = [v14 currentAccessorySetupMetricDispatcher];
  if (!v12)
  {
    v174 = a6;
    v31 = 0;
    id v19 = 0;
LABEL_13:
    v32 = [MEMORY[0x263EFF9A0] dictionary];
    id v179 = [[HMDRemoteKeyedArchiver alloc] initForWritingWithRemoteDeviceIsOnSameAccount:0 remoteGateway:0 remoteUserIsAdministrator:0 user:0 supportedFeatures:0];
    unint64_t v33 = [(HMDDeviceSetupSessionInternal *)self state];
    v183 = v31;
    if (v33 == 2) {
      goto LABEL_48;
    }
    if (v33 != 1)
    {
      v107 = v15;
      id v108 = v19;
      v109 = (void *)MEMORY[0x230FBD990]();
      v110 = self;
      v111 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v113 = v112 = v14;
        *(_DWORD *)buf = 138543362;
        v189 = v113;
        _os_log_impl(&dword_22F52A000, v111, OS_LOG_TYPE_ERROR, "%{public}@Unrecognized state or hit error.", buf, 0xCu);

        v14 = v112;
      }

      if (v184)
      {
        [MEMORY[0x263F087E8] hmErrorWithCode:23];
        BOOL v99 = 0;
        id *v184 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v99 = 0;
      }
      v131 = v183;
      v132 = v179;
      goto LABEL_113;
    }
    [v15 markSetupBeginStage:3 error:v19];
    v34 = [v31 objectForKeyedSubscript:@"pi"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v35 = v34;
    }
    else {
      v35 = 0;
    }
    id v36 = v35;

    if (v36)
    {
      if ([v14 setLocalPairingIdentity:v36 error:v184])
      {
        v37 = self->_logger;
        if (os_signpost_enabled(v37))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F52A000, v37, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReceivedLocalControllerKey", "", buf, 2u);
        }
        v176 = a5;
        v169 = v32;
        v38 = v183;
        v170 = [v183 objectForKeyedSubscript:@"pi.hh2"];
        v182 = v15;
        v168 = v36;
        if (v170)
        {
          v39 = (void *)MEMORY[0x230FBD990]();
          v40 = self;
          v41 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            v42 = HMFGetLogIdentifier();
            v43 = [v170 identifier];
            *(_DWORD *)buf = 138543618;
            v189 = v42;
            __int16 v190 = 2112;
            id v191 = v43;
            _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@Got the HH2 Pairing key during TTSU : %@. Going to save it to keychain store", buf, 0x16u);
          }
          v44 = [MEMORY[0x263F35AD0] systemStore];
          char v45 = [v44 saveHH2PairingIdentity:v170 syncable:1];

          if ((v45 & 1) == 0)
          {
            v46 = (void *)MEMORY[0x230FBD990]();
            v47 = v40;
            v48 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              v49 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              v189 = v49;
              _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_ERROR, "%{public}@Unable to save the HH2 key to keychain store. This will not fail TTSU as there can be multiple HH2 keys and the HomeKitDaemon will handle that appropriately.", buf, 0xCu);
            }
            uint64_t v50 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:3401];

            id v19 = (id)v50;
          }
          v38 = v183;
        }
        v185 = objc_msgSend(v38, "hmf_numberForKey:", @"mi.hh2");
        if (v185)
        {
          v51 = (void *)MEMORY[0x230FBD990]();
          v52 = self;
          v53 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v54 = v171 = v51;
            [v185 BOOLValue];
            v55 = HMFBooleanToString();
            *(_DWORD *)buf = 138543618;
            v189 = v54;
            __int16 v190 = 2112;
            id v191 = v55;
            _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@Got the HH2 settings migration key during TTSU : %@. Going to save it to user defaults", buf, 0x16u);

            v51 = v171;
          }

          v56 = [MEMORY[0x263EFFA40] standardUserDefaults];
          objc_msgSend(v56, "setBool:forKey:", objc_msgSend(v185, "BOOLValue"), @"mi.hh2");

          v38 = v183;
        }
        v57 = objc_msgSend(v38, "hmf_numberForKey:", @"rpr");
        if (v57)
        {
          v58 = (void *)MEMORY[0x230FBD990]();
          v59 = self;
          v60 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            v61 = HMFGetLogIdentifier();
            [v57 BOOLValue];
            HMFBooleanToString();
            v172 = v57;
            id v62 = v19;
            v63 = v14;
            v65 = id v64 = v12;
            *(_DWORD *)buf = 138543618;
            v189 = v61;
            __int16 v190 = 2112;
            id v191 = v65;
            _os_log_impl(&dword_22F52A000, v60, OS_LOG_TYPE_DEFAULT, "%{public}@Got the home has reachable resident value during TTSU: %@.", buf, 0x16u);

            id v12 = v64;
            v14 = v63;
            id v19 = v62;
            v57 = v172;
          }
          v66 = [MEMORY[0x263EFFA40] standardUserDefaults];
          objc_msgSend(v66, "setBool:forKey:", objc_msgSend(v57, "BOOLValue"), @"rpr");
        }
        id v67 = v19;
        v68 = v14;
        id v69 = v12;
        uint64_t v70 = [v185 BOOLValue];
        v71 = objc_msgSend(v183, "hmf_numberForKey:", @"sz.hh2");
        uint64_t v72 = [v71 BOOLValue];

        v73 = v182;
        [v182 markControllerHH2Mode:v70 controllerHH2SentinelExists:v72];
        v74 = [v183 objectForKeyedSubscript:@"session.id"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v75 = v74;
        }
        else {
          v75 = 0;
        }
        id v76 = v75;

        if (v76)
        {
          v77 = (void *)MEMORY[0x230FBD990]();
          v78 = self;
          v79 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
          {
            v80 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v189 = v80;
            __int16 v190 = 2112;
            id v191 = v76;
            _os_log_impl(&dword_22F52A000, v79, OS_LOG_TYPE_INFO, "%{public}@Setting controller setup session identifier %@", buf, 0x16u);
          }
          v73 = v182;
          [v182 setControllerSetupSessionIdentifier:v76];
        }
        v81 = [v68 uuid];
        [v68 updateGenerationCounterWithReason:@"Device Setup Set Controller Keys" sourceUUID:v81 shouldNotifyClients:1];

        v82 = (void *)MEMORY[0x230FBD990]([v73 markSetupEndStage:3 error:v67]);
        v83 = self;
        v84 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
        {
          v85 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v189 = v85;
          _os_log_impl(&dword_22F52A000, v84, OS_LOG_TYPE_DEFAULT, "%{public}@Proceeding to M2", buf, 0xCu);
        }
        [(HMDDeviceSetupSessionInternal *)v83 setState:2];

        id v12 = v69;
        v14 = v68;
        v15 = v182;
        id v19 = v67;
        v32 = v169;
        a5 = v176;
LABEL_48:
        id v186 = v19;
        [v15 markSetupBeginStage:4 error:v19];
        v86 = [v14 accessoryBrowser];
        v87 = [v86 mediaBrowser];
        v88 = [v87 currentAccessory];

        v181 = v14;
        if (!v88)
        {
          v114 = (void *)MEMORY[0x230FBD990]();
          v115 = self;
          v116 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
          {
            v117 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v189 = v117;
            _os_log_impl(&dword_22F52A000, v116, OS_LOG_TYPE_ERROR, "%{public}@Did not obtain accessory in M2.", buf, 0xCu);
          }
          uint64_t v118 = [MEMORY[0x263F087E8] hmfErrorWithCode:2 reason:@"No accessory found from the browser"];
          id v119 = v186;
          goto LABEL_110;
        }
        v177 = a5;
        buf[0] = 0;
        CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"HHTTSUMode", @"com.apple.homed", buf);
        if (buf[0] && AppIntegerValue == 1)
        {
          v90 = (void *)MEMORY[0x230FBD990]();
          v91 = self;
          v92 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v94 = v93 = v32;
            *(_DWORD *)buf = 138543362;
            v189 = v94;
            _os_log_impl(&dword_22F52A000, v92, OS_LOG_TYPE_DEFAULT, "%{public}@Allowing setup to proceed in HH2 mode as TTSU setting indicates we are good to proceed.", buf, 0xCu);

            v32 = v93;
          }

          goto LABEL_91;
        }
        uint64_t v120 = objc_opt_class();
        if (v120 != objc_opt_class())
        {
LABEL_91:
          id v173 = v12;
          v141 = (void *)MEMORY[0x230FBD990]();
          v142 = self;
          v143 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
          {
            v144 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v189 = v144;
            __int16 v190 = 2112;
            id v191 = v88;
            _os_log_impl(&dword_22F52A000, v143, OS_LOG_TYPE_DEFAULT, "%{public}@Set accessory %@", buf, 0x16u);
          }
          v145 = self->_logger;
          if (os_signpost_enabled(v145))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F52A000, v145, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SentUnassociatedAppleMediaAccessory", "", buf, 2u);
          }
          v146 = v32;
          [v32 setObject:v88 forKeyedSubscript:@"ac"];
          id v147 = v88;
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          if (isKindOfClass) {
            v149 = v147;
          }
          else {
            v149 = 0;
          }
          id v119 = v149;

          if (v174 && (isKindOfClass & 1) != 0)
          {
            id *v174 = [v119 idsIdentifierString];
          }
          if (v178)
          {
            id *v178 = [v147 uuid];
          }
          if (v177)
          {
            id *v177 = [v147 category];
          }
          v150 = [v147 uuid];
          v151 = [v150 UUIDString];

          if (v151)
          {
            v152 = (void *)MEMORY[0x230FBD990]();
            v153 = v142;
            v154 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v154, OS_LOG_TYPE_INFO))
            {
              v155 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v189 = v155;
              __int16 v190 = 2112;
              id v191 = v151;
              _os_log_impl(&dword_22F52A000, v154, OS_LOG_TYPE_INFO, "%{public}@Saving model uuid for Core Data voucher %@", buf, 0x16u);
            }
            v156 = [MEMORY[0x263EFFA40] standardUserDefaults];
            [v156 setObject:v151 forKey:@"HMDCurrentAccessoryModelUUID"];
          }
          id v12 = v173;
          v32 = v146;
          uint64_t v118 = (uint64_t)v186;
LABEL_110:

          v157 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDDeviceSetupSessionInternal state](self, "state"));
          [v32 setObject:v157 forKeyedSubscript:@"st"];

          v158 = +[HMDHomeKitVersion currentVersion];
          v159 = [v158 versionString];
          [v32 setObject:v159 forKeyedSubscript:@"hk"];

          [(HMDDeviceSetupSessionInternal *)self setState:3];
          v107 = v15;
          v160 = v15;
          id v108 = (id)v118;
          [v160 markSetupEndStage:4 error:v118];

          v161 = (void *)MEMORY[0x230FBD990]();
          v162 = self;
          HMFGetOSLogHandle();
          v164 = v163 = v32;
          if (os_log_type_enabled(v164, OS_LOG_TYPE_INFO))
          {
            v165 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v189 = v165;
            __int16 v190 = 2112;
            id v191 = v163;
            _os_log_impl(&dword_22F52A000, v164, OS_LOG_TYPE_INFO, "%{public}@Response: %@", buf, 0x16u);
          }
          v132 = v179;
          [v179 encodeObject:v163 forKey:*MEMORY[0x263F081D0]];
          [v179 finishEncoding];
          v166 = [v179 encodedData];
          [(HMDDeviceSetupSessionInternal *)v162 setSessionData:v166];

          BOOL v99 = 1;
          v14 = v181;
          v131 = v183;
          v32 = v163;
          goto LABEL_113;
        }
        id v121 = v88;
        v122 = [v121 minimumRequiredPairingSoftwareVersion];
        if (v122)
        {
        }
        else if ([v121 canPairGivenCapabilities:1])
        {
LABEL_90:

          goto LABEL_91;
        }
        [v179 setClassName:@"HMDUnassociatedAppleHomePodAccessory" forClass:objc_opt_class()];
        goto LABEL_90;
      }
      id v123 = v36;
      v133 = (void *)MEMORY[0x230FBD990]();
      v134 = self;
      v135 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v135, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v137 = v136 = v32;
        *(_DWORD *)buf = 138543362;
        v189 = v137;
        _os_log_impl(&dword_22F52A000, v135, OS_LOG_TYPE_ERROR, "%{public}@Failed to set local pairing identity", buf, 0xCu);

        v32 = v136;
      }

      if (v184)
      {
        id v130 = *v184;
      }
      else
      {
        id v130 = [MEMORY[0x263F087E8] hmfErrorWithCode:16 reason:@"Failed to set local pairing identity"];
      }
    }
    else
    {
      id v123 = 0;
      v124 = (void *)MEMORY[0x230FBD990]();
      v125 = self;
      v126 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v128 = v127 = v32;
        *(_DWORD *)buf = 138543362;
        v189 = v128;
        _os_log_impl(&dword_22F52A000, v126, OS_LOG_TYPE_ERROR, "%{public}@Request missing pairing identity", buf, 0xCu);

        v32 = v127;
      }

      if (!v184)
      {
        v132 = v179;
        v138 = 0;
LABEL_87:
        v107 = v15;
        v140 = v15;
        id v108 = v19;
        [v140 markSetupEndStage:3 error:v19];

        BOOL v99 = 0;
        v131 = v183;
LABEL_113:

        id v19 = v108;
        v15 = v107;
        goto LABEL_114;
      }
      id v129 = [MEMORY[0x263F087E8] hmErrorWithCode:27];
      id *v184 = v129;
      id v130 = v129;
    }
    id v139 = v130;
    v138 = v123;

    id v19 = v139;
    v132 = v179;
    goto LABEL_87;
  }
  v16 = (void *)MEMORY[0x263F08928];
  v17 = +[HMDDeviceSetupClientSession allowedClasses];
  id v187 = 0;
  v18 = [v16 unarchivedObjectOfClasses:v17 fromData:v12 error:&v187];
  id v19 = v187;

  if (v18)
  {
    v174 = a6;
    v175 = a5;
    v180 = v14;
    id v20 = v12;
    id v21 = v18;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v22 = v21;
    }
    else {
      v22 = 0;
    }
    id v23 = v22;

    v24 = (void *)MEMORY[0x230FBD990]();
    v25 = self;
    v26 = HMFGetOSLogHandle();
    v27 = v23;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v189 = v28;
      __int16 v190 = 2112;
      id v191 = v27;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Processing request: %@", buf, 0x16u);

      id v23 = v27;
    }

    v29 = objc_msgSend(v23, "hmf_numberForKey:", @"st");
    uint64_t v30 = [v29 integerValue];
    if (v30 == [(HMDDeviceSetupSessionInternal *)v25 state])
    {

      id v12 = v20;
      v14 = v180;
      v31 = v27;
      a5 = v175;
      goto LABEL_13;
    }
    v100 = (void *)MEMORY[0x230FBD990]();
    v101 = v25;
    v102 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
    {
      v103 = HMFGetLogIdentifier();
      uint64_t v104 = [(HMDDeviceSetupSessionInternal *)v101 state];
      *(_DWORD *)buf = 138543874;
      v189 = v103;
      __int16 v190 = 2112;
      id v191 = v29;
      __int16 v192 = 2048;
      uint64_t v193 = v104;
      _os_log_impl(&dword_22F52A000, v102, OS_LOG_TYPE_DEFAULT, "%{public}@Request state number, %@, does not match expected state number: %tu", buf, 0x20u);
    }
    if (v184)
    {
      id v105 = [MEMORY[0x263F087E8] hmErrorWithCode:27];
      id *v184 = v105;
      id v106 = v105;

      id v19 = v106;
    }
    id v12 = v20;
    [v15 markSetupBeginStage:3 error:v19];

    BOOL v99 = 0;
    v14 = v180;
  }
  else
  {
    v95 = (void *)MEMORY[0x230FBD990]();
    v96 = self;
    v97 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
    {
      v98 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v189 = v98;
      __int16 v190 = 2112;
      id v191 = v19;
      _os_log_impl(&dword_22F52A000, v97, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive request payload from data: %@", buf, 0x16u);
    }
    if (v184) {
      id *v184 = v19;
    }
    [v15 markSetupBeginStage:3 error:v19];
    BOOL v99 = 0;
  }
LABEL_114:

  return v99;
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
  if (logCategory__hmf_once_t72 != -1) {
    dispatch_once(&logCategory__hmf_once_t72, &__block_literal_global_364);
  }
  v2 = (void *)logCategory__hmf_once_v73;
  return v2;
}

void __42__HMDDeviceSetupServerSession_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v73;
  logCategory__hmf_once_v73 = v0;
}

+ (id)allowedClasses
{
  v7[1] = *MEMORY[0x263EF8340];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HMDDeviceSetupServerSession;
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
  char v3 = [v2 supportsDeviceSetup];

  return v3;
}

+ (int64_t)role
{
  return 1;
}

@end