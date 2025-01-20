@interface HMDAssistantGather
+ (id)logCategory;
- (HMDAssistantGather)initWithHomeManager:(id)a3 queue:(id)a4;
- (HMDHomeManager)manager;
- (NSArray)currentHomekitObjects;
- (NSArray)homeKitObjects;
- (NSString)currentHomeAssistantIdentifier;
- (NSString)currentHomeName;
- (NSString)primaryHomeAssistantIdentifier;
- (NSString)primaryHomeName;
- (OS_dispatch_queue)workQueue;
- (id)_getCurrentHome;
- (id)_getPrimaryHome;
- (int64_t)homeCount;
- (void)_gatherHomeKitObjects;
- (void)gatherHomeKitObjectsWithCompletion:(id)a3;
- (void)getSyncEntityObjectsWithCompletionHandler:(id)a3;
- (void)setCurrentHomekitObjects:(id)a3;
- (void)setManager:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation HMDAssistantGather

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentHomekitObjects, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_manager);
}

- (void)setCurrentHomekitObjects:(id)a3
{
}

- (NSArray)currentHomekitObjects
{
  return self->_currentHomekitObjects;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setManager:(id)a3
{
}

- (HMDHomeManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  return (HMDHomeManager *)WeakRetained;
}

- (void)getSyncEntityObjectsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(HMDAssistantGather *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__HMDAssistantGather_getSyncEntityObjectsWithCompletionHandler___block_invoke;
  v7[3] = &unk_264A2F870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __64__HMDAssistantGather_getSyncEntityObjectsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) homeKitObjects];
  v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = entityFromObject(*(void **)(*((void *)&v12 + 1) + 8 * v8), 1);
        v10 = v9;
        if (v9)
        {
          v11 = objc_msgSend(v9, "dictionary", (void)v12);
          [v3 addObject:v11];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NSArray)homeKitObjects
{
  v2 = [(HMDAssistantGather *)self currentHomekitObjects];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)gatherHomeKitObjectsWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDAssistantGather *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__HMDAssistantGather_gatherHomeKitObjectsWithCompletion___block_invoke;
  v7[3] = &unk_264A2F870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __57__HMDAssistantGather_gatherHomeKitObjectsWithCompletion___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x230FBD990]();
  [*(id *)(a1 + 32) _gatherHomeKitObjects];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) currentHomekitObjects];
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, [v4 count]);
  }
}

- (void)_gatherHomeKitObjects
{
  uint64_t v239 = *MEMORY[0x263EF8340];
  v156 = (void *)[objc_alloc(MEMORY[0x263F425C0]) initWithName:@"com.apple.homed.gather-home-objects"];
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  long long v218 = 0u;
  long long v219 = 0u;
  long long v220 = 0u;
  long long v221 = 0u;
  v172 = self;
  id v4 = [(HMDAssistantGather *)self manager];
  uint64_t v5 = [v4 homes];
  id v6 = (void *)[v5 copy];

  obuint64_t j = v6;
  uint64_t v159 = [v6 countByEnumeratingWithState:&v218 objects:v238 count:16];
  if (v159)
  {
    uint64_t v158 = *(void *)v219;
    uint64_t v162 = *MEMORY[0x263F0B958];
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v219 != v158) {
          objc_enumerationMutation(obj);
        }
        uint64_t v161 = v7;
        id v8 = *(void **)(*((void *)&v218 + 1) + 8 * v7);
        uint64_t v9 = [v8 assistantObject];
        v167 = v8;
        v160 = (void *)v9;
        if (!v9)
        {
          v145 = (void *)MEMORY[0x230FBD990]();
          v146 = v172;
          v147 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
          {
            v148 = HMFGetLogIdentifier();
            v149 = [v167 name];
            v150 = [v167 uuid];
            v151 = [v150 UUIDString];
            *(_DWORD *)buf = 138543874;
            v227 = v148;
            __int16 v228 = 2112;
            v229 = v149;
            __int16 v230 = 2112;
            v231 = v151;
            _os_log_impl(&dword_22F52A000, v147, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot create an assistant object for home %@/%@; skipping all objects in home",
              buf,
              0x20u);
          }
          goto LABEL_142;
        }
        [v3 addObject:v9];
        long long v216 = 0u;
        long long v217 = 0u;
        long long v214 = 0u;
        long long v215 = 0u;
        id v163 = [v8 accessories];
        uint64_t v165 = [v163 countByEnumeratingWithState:&v214 objects:v237 count:16];
        if (!v165) {
          goto LABEL_74;
        }
        uint64_t v164 = *(void *)v215;
        do
        {
          for (uint64_t i = 0; i != v165; ++i)
          {
            if (*(void *)v215 != v164) {
              objc_enumerationMutation(v163);
            }
            id v11 = *(id *)(*((void *)&v214 + 1) + 8 * i);
            if ([v11 conformsToProtocol:&unk_26E4FFCC0]) {
              long long v12 = v11;
            }
            else {
              long long v12 = 0;
            }
            id v13 = v12;

            long long v14 = [v13 matterAdapter];

            BOOL v15 = v14 != 0;
            v178 = v14;
            if (v14)
            {
              v16 = (void *)MEMORY[0x230FBD990]();
              uint64_t v17 = v172;
              HMFGetOSLogHandle();
              v18 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                v19 = HMFGetLogIdentifier();
                v20 = NSNumber;
                v21 = [v14 rvcRooms];
                v22 = objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "count"));
                *(_DWORD *)buf = 138543874;
                v227 = v19;
                __int16 v228 = 2112;
                v229 = v22;
                __int16 v230 = 2112;
                v231 = v178;
                _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Adding RVC Rooms [%@] for %@", buf, 0x20u);

                long long v14 = v178;
              }

              v23 = [v14 rvcRooms];
              v212[0] = MEMORY[0x263EF8330];
              v212[1] = 3221225472;
              v212[2] = __43__HMDAssistantGather__gatherHomeKitObjects__block_invoke;
              v212[3] = &unk_264A25258;
              id v24 = v3;
              id v213 = v24;
              objc_msgSend(v23, "na_each:", v212);

              v25 = (void *)MEMORY[0x230FBD990]();
              v26 = v17;
              HMFGetOSLogHandle();
              v27 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                v28 = HMFGetLogIdentifier();
                v29 = NSNumber;
                [v178 rvcZones];
                v30 = uint64_t v173 = i;
                v31 = objc_msgSend(v29, "numberWithUnsignedInteger:", objc_msgSend(v30, "count"));
                *(_DWORD *)buf = 138543874;
                v227 = v28;
                __int16 v228 = 2112;
                v229 = v31;
                __int16 v230 = 2112;
                v231 = v178;
                _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Adding RVC Zones [%@] for %@", buf, 0x20u);

                long long v14 = v178;
                uint64_t i = v173;
              }
              v32 = [v14 rvcZones];
              v210[0] = MEMORY[0x263EF8330];
              v210[1] = 3221225472;
              v210[2] = __43__HMDAssistantGather__gatherHomeKitObjects__block_invoke_193;
              v210[3] = &unk_264A25280;
              v210[4] = v26;
              v210[5] = v167;
              id v211 = v24;
              objc_msgSend(v32, "na_each:", v210);
            }
            id v33 = v11;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v34 = v33;
            }
            else {
              v34 = 0;
            }
            id v35 = v34;

            if (v35)
            {
              v36 = [v35 mediaProfile];

              if (v36)
              {
                v37 = [v35 mediaProfile];
                v38 = [v37 assistantObject];

                if (v38)
                {
                  [v3 addObject:v38];
                  BOOL v15 = 1;
                }
              }
              long long v208 = 0u;
              long long v209 = 0u;
              long long v206 = 0u;
              long long v207 = 0u;
              v39 = [v35 services];
              uint64_t v40 = [v39 countByEnumeratingWithState:&v206 objects:v236 count:16];
              if (v40)
              {
                uint64_t v41 = v40;
                uint64_t v42 = *(void *)v207;
                do
                {
                  for (uint64_t j = 0; j != v41; ++j)
                  {
                    if (*(void *)v207 != v42) {
                      objc_enumerationMutation(v39);
                    }
                    v44 = *(void **)(*((void *)&v206 + 1) + 8 * j);
                    if (([v44 isHidden] & 1) == 0)
                    {
                      v45 = [v44 assistantObject];
                      if (v45)
                      {
                        [v3 addObject:v45];
                        BOOL v15 = 1;
                      }
                    }
                  }
                  uint64_t v41 = [v39 countByEnumeratingWithState:&v206 objects:v236 count:16];
                }
                while (v41);
              }
            }
            long long v204 = 0u;
            long long v205 = 0u;
            long long v202 = 0u;
            long long v203 = 0u;
            v46 = [v35 cameraProfiles];
            uint64_t v47 = [v46 countByEnumeratingWithState:&v202 objects:v235 count:16];
            if (v47)
            {
              uint64_t v48 = v47;
              uint64_t v49 = *(void *)v203;
              do
              {
                for (uint64_t k = 0; k != v48; ++k)
                {
                  if (*(void *)v203 != v49) {
                    objc_enumerationMutation(v46);
                  }
                  v51 = [*(id *)(*((void *)&v202 + 1) + 8 * k) assistantObject];
                  if (v51)
                  {
                    [v3 addObject:v51];
                    BOOL v15 = 1;
                  }
                }
                uint64_t v48 = [v46 countByEnumeratingWithState:&v202 objects:v235 count:16];
              }
              while (v48);
            }

            id v52 = v33;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v53 = v52;
            }
            else {
              v53 = 0;
            }
            id v54 = v53;

            v174 = v35;
            if (v54)
            {
              v55 = [v54 mediaProfile];
              v56 = [v55 assistantObject];

              if (v56)
              {
                [v3 addObject:v56];
                BOOL v15 = 1;
              }
            }
            id v57 = v52;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v58 = v57;
            }
            else {
              v58 = 0;
            }
            id v59 = v58;

            v60 = [v59 audioDestinationController];
            v61 = [v60 data];
            v62 = [v61 destinationIdentifier];

            if (!v62) {
              goto LABEL_64;
            }
            id v168 = v54;
            uint64_t v63 = i;
            v64 = [v59 home];
            v65 = [v59 name];
            v66 = [v60 assistantObjectWithHome:v64 name:v65];

            if (!v66)
            {
              uint64_t i = v63;
              id v54 = v168;
LABEL_64:
              if (!v15) {
                goto LABEL_72;
              }
              goto LABEL_65;
            }
            [v3 addObject:v66];

            uint64_t i = v63;
            id v54 = v168;
LABEL_65:
            v67 = [v174 hostAccessory];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v68 = v67;
            }
            else {
              v68 = 0;
            }
            id v69 = v68;

            if (!v69)
            {
              v70 = [v57 assistantObject];
              if (v70) {
                [v3 addObject:v70];
              }
            }
LABEL_72:
          }
          uint64_t v165 = [v163 countByEnumeratingWithState:&v214 objects:v237 count:16];
        }
        while (v165);
LABEL_74:

        long long v200 = 0u;
        long long v201 = 0u;
        long long v198 = 0u;
        long long v199 = 0u;
        v71 = v167;
        v72 = [v167 serviceGroups];
        v73 = (void *)[v72 copy];

        uint64_t v74 = [v73 countByEnumeratingWithState:&v198 objects:v234 count:16];
        if (v74)
        {
          uint64_t v75 = v74;
          uint64_t v76 = *(void *)v199;
          v169 = v73;
          do
          {
            uint64_t v77 = 0;
            uint64_t v179 = v75;
            do
            {
              if (*(void *)v199 != v76) {
                objc_enumerationMutation(v73);
              }
              v78 = *(void **)(*((void *)&v198 + 1) + 8 * v77);
              v79 = [v78 serviceUUIDs];
              uint64_t v80 = [v79 count];

              if (v80)
              {
                v81 = [v78 assistantObject];
                if (v81) {
                  [v3 addObject:v81];
                }
              }
              else
              {
                v82 = (void *)MEMORY[0x230FBD990]();
                v83 = v172;
                v84 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
                {
                  v85 = HMFGetLogIdentifier();
                  v86 = [v78 name];
                  v87 = [v71 name];
                  [v71 uuid];
                  v175 = v82;
                  v89 = uint64_t v88 = v76;
                  v90 = [v89 UUIDString];
                  *(_DWORD *)buf = 138544130;
                  v227 = v85;
                  __int16 v228 = 2112;
                  v229 = v86;
                  __int16 v230 = 2112;
                  v231 = v87;
                  __int16 v232 = 2112;
                  v233 = v90;
                  _os_log_impl(&dword_22F52A000, v84, OS_LOG_TYPE_INFO, "%{public}@Dropping empty service group %@ in home %@/%@ from sync data", buf, 0x2Au);

                  uint64_t v76 = v88;
                  v82 = v175;

                  v71 = v167;
                  v73 = v169;
                }

                uint64_t v75 = v179;
              }
              ++v77;
            }
            while (v75 != v77);
            uint64_t v75 = [v73 countByEnumeratingWithState:&v198 objects:v234 count:16];
          }
          while (v75);
        }

        long long v196 = 0u;
        long long v197 = 0u;
        long long v194 = 0u;
        long long v195 = 0u;
        v91 = [v71 rooms];
        v92 = (void *)[v91 copy];

        uint64_t v93 = [v92 countByEnumeratingWithState:&v194 objects:v225 count:16];
        if (v93)
        {
          uint64_t v94 = v93;
          uint64_t v95 = *(void *)v195;
          do
          {
            for (uint64_t m = 0; m != v94; ++m)
            {
              if (*(void *)v195 != v95) {
                objc_enumerationMutation(v92);
              }
              v97 = [*(id *)(*((void *)&v194 + 1) + 8 * m) assistantObject];
              if (v97) {
                [v3 addObject:v97];
              }
            }
            uint64_t v94 = [v92 countByEnumeratingWithState:&v194 objects:v225 count:16];
          }
          while (v94);
        }

        v98 = v167;
        v99 = [v167 roomForEntireHome];
        uint64_t v100 = [v99 assistantObject];

        if (v100) {
          [v3 addObject:v100];
        }
        v166 = (void *)v100;
        long long v192 = 0u;
        long long v193 = 0u;
        long long v190 = 0u;
        long long v191 = 0u;
        v101 = [v167 zones];
        v102 = (void *)[v101 copy];

        uint64_t v103 = [v102 countByEnumeratingWithState:&v190 objects:v224 count:16];
        uint64_t v104 = v162;
        if (v103)
        {
          uint64_t v105 = v103;
          uint64_t v106 = *(void *)v191;
          v170 = v102;
          uint64_t v176 = *(void *)v191;
          do
          {
            uint64_t v107 = 0;
            uint64_t v180 = v105;
            do
            {
              if (*(void *)v191 != v106) {
                objc_enumerationMutation(v102);
              }
              v108 = *(void **)(*((void *)&v190 + 1) + 8 * v107);
              v109 = [v108 roomUUIDs];
              uint64_t v110 = [v109 count];

              if (v110)
              {
                v111 = [v108 assistantObject];
                if (v111) {
                  [v3 addObject:v111];
                }
              }
              else
              {
                v112 = (void *)MEMORY[0x230FBD990]();
                v113 = v172;
                v114 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v114, OS_LOG_TYPE_INFO))
                {
                  v115 = HMFGetLogIdentifier();
                  v116 = [v108 name];
                  v117 = [v98 name];
                  v118 = [v98 uuid];
                  v119 = [v118 UUIDString];
                  *(_DWORD *)buf = 138544130;
                  v227 = v115;
                  __int16 v228 = 2112;
                  v229 = v116;
                  __int16 v230 = 2112;
                  v231 = v117;
                  __int16 v232 = 2112;
                  v233 = v119;
                  _os_log_impl(&dword_22F52A000, v114, OS_LOG_TYPE_INFO, "%{public}@Dropping empty zone %@ in home %@/%@ from sync data", buf, 0x2Au);

                  v98 = v167;
                  uint64_t v104 = v162;

                  v102 = v170;
                }

                uint64_t v106 = v176;
                uint64_t v105 = v180;
              }
              ++v107;
            }
            while (v105 != v107);
            uint64_t v105 = [v102 countByEnumeratingWithState:&v190 objects:v224 count:16];
          }
          while (v105);
        }

        long long v188 = 0u;
        long long v189 = 0u;
        long long v186 = 0u;
        long long v187 = 0u;
        v120 = [v98 actionSets];
        v121 = (void *)[v120 copy];

        uint64_t v122 = [v121 countByEnumeratingWithState:&v186 objects:v223 count:16];
        if (v122)
        {
          uint64_t v123 = v122;
          uint64_t v124 = *(void *)v187;
          uint64_t v177 = *(void *)v187;
          v181 = v121;
          do
          {
            for (uint64_t n = 0; n != v123; ++n)
            {
              if (*(void *)v187 != v124) {
                objc_enumerationMutation(v121);
              }
              v126 = *(void **)(*((void *)&v186 + 1) + 8 * n);
              v127 = [v126 type];
              if ([v127 isEqualToString:v104])
              {
                v128 = [v126 actions];
                uint64_t v129 = [v128 count];

                if (!v129)
                {
                  v130 = (void *)MEMORY[0x230FBD990]();
                  v131 = v172;
                  v132 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v132, OS_LOG_TYPE_INFO))
                  {
                    v133 = HMFGetLogIdentifier();
                    [v126 name];
                    v134 = v171 = v130;
                    v135 = [v167 name];
                    v136 = [v167 uuid];
                    v137 = [v136 UUIDString];
                    *(_DWORD *)buf = 138544130;
                    v227 = v133;
                    __int16 v228 = 2112;
                    v229 = v134;
                    __int16 v230 = 2112;
                    v231 = v135;
                    __int16 v232 = 2112;
                    v233 = v137;
                    _os_log_impl(&dword_22F52A000, v132, OS_LOG_TYPE_INFO, "%{public}@Dropping empty user-defined actionSet %@ in home %@/%@ from sync data", buf, 0x2Au);

                    v130 = v171;
                    uint64_t v104 = v162;
                  }
                  uint64_t v124 = v177;
                  v121 = v181;
                  continue;
                }
              }
              else
              {
              }
              v138 = [v126 assistantObject];
              if (v138) {
                [v3 addObject:v138];
              }
            }
            uint64_t v123 = [v121 countByEnumeratingWithState:&v186 objects:v223 count:16];
          }
          while (v123);
        }

        long long v184 = 0u;
        long long v185 = 0u;
        long long v182 = 0u;
        long long v183 = 0u;
        v139 = [v167 mediaSystems];
        uint64_t v140 = [v139 countByEnumeratingWithState:&v182 objects:v222 count:16];
        if (v140)
        {
          uint64_t v141 = v140;
          uint64_t v142 = *(void *)v183;
          do
          {
            for (iuint64_t i = 0; ii != v141; ++ii)
            {
              if (*(void *)v183 != v142) {
                objc_enumerationMutation(v139);
              }
              v144 = [*(id *)(*((void *)&v182 + 1) + 8 * ii) assistantObject];
              if (v144) {
                [v3 addObject:v144];
              }
            }
            uint64_t v141 = [v139 countByEnumeratingWithState:&v182 objects:v222 count:16];
          }
          while (v141);
        }

LABEL_142:
        uint64_t v7 = v161 + 1;
      }
      while (v161 + 1 != v159);
      uint64_t v159 = [obj countByEnumeratingWithState:&v218 objects:v238 count:16];
    }
    while (v159);
  }

  v152 = (void *)MEMORY[0x230FBD990]();
  v153 = v172;
  HMFGetOSLogHandle();
  v154 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v154, OS_LOG_TYPE_DEBUG))
  {
    v155 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v227 = v155;
    __int16 v228 = 2112;
    v229 = v3;
    _os_log_impl(&dword_22F52A000, v154, OS_LOG_TYPE_DEBUG, "%{public}@currentHomekitObjects: %@", buf, 0x16u);
  }
  [(HMDAssistantGather *)v153 setCurrentHomekitObjects:v3];
}

void __43__HMDAssistantGather__gatherHomeKitObjects__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 assistantObject];
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    uint64_t v3 = v4;
  }
}

void __43__HMDAssistantGather__gatherHomeKitObjects__block_invoke_193(id *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 roomUUIDs];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [v3 assistantObject];
    if (v6) {
      [a1[6] addObject:v6];
    }
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = a1[4];
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      id v11 = [v3 name];
      long long v12 = [a1[5] name];
      id v13 = [a1[5] uuid];
      long long v14 = [v13 UUIDString];
      int v15 = 138544130;
      v16 = v10;
      __int16 v17 = 2112;
      v18 = v11;
      __int16 v19 = 2112;
      v20 = v12;
      __int16 v21 = 2112;
      v22 = v14;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Dropping empty zone %@ in home %@/%@ from sync data", (uint8_t *)&v15, 0x2Au);
    }
  }
}

- (NSString)currentHomeAssistantIdentifier
{
  v2 = [(HMDAssistantGather *)self _getCurrentHome];
  id v3 = [v2 urlString];

  return (NSString *)v3;
}

- (NSString)currentHomeName
{
  v2 = [(HMDAssistantGather *)self _getCurrentHome];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 name];
  }
  else
  {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)primaryHomeAssistantIdentifier
{
  v2 = [(HMDAssistantGather *)self _getPrimaryHome];
  id v3 = [v2 urlString];

  return (NSString *)v3;
}

- (NSString)primaryHomeName
{
  v2 = [(HMDAssistantGather *)self _getPrimaryHome];
  id v3 = [v2 name];

  return (NSString *)v3;
}

- (int64_t)homeCount
{
  v2 = [(HMDAssistantGather *)self manager];
  id v3 = [v2 homes];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)_getCurrentHome
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [(HMDAssistantGather *)self manager];
  id v3 = [v2 currentHomeUUID];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int64_t v4 = objc_msgSend(v2, "homes", 0);
  uint64_t v5 = (void *)[v4 copy];

  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 uuid];
        int v11 = [v3 isEqual:v10];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_getPrimaryHome
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [(HMDAssistantGather *)self manager];
  id v3 = [v2 primaryHomeUUID];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int64_t v4 = objc_msgSend(v2, "homes", 0);
  uint64_t v5 = (void *)[v4 copy];

  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 uuid];
        int v11 = [v3 isEqual:v10];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (HMDAssistantGather)initWithHomeManager:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDAssistantGather;
  id v8 = [(HMDAssistantGather *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_manager, v6);
    objc_storeStrong((id *)&v9->_workQueue, a4);
  }

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_191374 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_191374, &__block_literal_global_191375);
  }
  v2 = (void *)logCategory__hmf_once_v1_191376;
  return v2;
}

void __33__HMDAssistantGather_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_191376;
  logCategory__hmf_once_v1_191376 = v0;
}

@end