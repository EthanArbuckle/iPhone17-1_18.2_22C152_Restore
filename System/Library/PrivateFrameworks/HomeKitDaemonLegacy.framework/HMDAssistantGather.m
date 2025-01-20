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
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__HMDAssistantGather_getSyncEntityObjectsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6A19530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __64__HMDAssistantGather_getSyncEntityObjectsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) homeKitObjects];
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
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
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__HMDAssistantGather_gatherHomeKitObjectsWithCompletion___block_invoke;
  v7[3] = &unk_1E6A19530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __57__HMDAssistantGather_gatherHomeKitObjectsWithCompletion___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D9452090]();
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
  uint64_t v209 = *MEMORY[0x1E4F143B8];
  v132 = (void *)[objc_alloc(MEMORY[0x1E4F654E0]) initWithName:@"com.apple.homed.gather-home-objects"];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v188 = 0u;
  long long v189 = 0u;
  long long v190 = 0u;
  long long v191 = 0u;
  v140 = self;
  id v4 = [(HMDAssistantGather *)self manager];
  uint64_t v5 = [v4 homes];
  id v6 = (void *)[v5 copy];

  obuint64_t j = v6;
  uint64_t v135 = [v6 countByEnumeratingWithState:&v188 objects:v208 count:16];
  if (v135)
  {
    uint64_t v134 = *(void *)v189;
    uint64_t v141 = *MEMORY[0x1E4F2C958];
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v189 != v134) {
          objc_enumerationMutation(obj);
        }
        uint64_t v137 = v7;
        id v8 = *(void **)(*((void *)&v188 + 1) + 8 * v7);
        uint64_t v9 = [v8 assistantObject];
        v138 = v8;
        v136 = (void *)v9;
        if (!v9)
        {
          v121 = (void *)MEMORY[0x1D9452090]();
          v122 = v140;
          v123 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
          {
            v124 = HMFGetLogIdentifier();
            v125 = [v138 name];
            v126 = [v138 uuid];
            v127 = [v126 UUIDString];
            *(_DWORD *)buf = 138543874;
            v197 = v124;
            __int16 v198 = 2112;
            v199 = v125;
            __int16 v200 = 2112;
            v201 = v127;
            _os_log_impl(&dword_1D49D5000, v123, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot create an assistant object for home %@/%@; skipping all objects in home",
              buf,
              0x20u);
          }
          goto LABEL_134;
        }
        [v3 addObject:v9];
        long long v186 = 0u;
        long long v187 = 0u;
        long long v184 = 0u;
        long long v185 = 0u;
        id v139 = [v8 accessories];
        uint64_t v144 = [v139 countByEnumeratingWithState:&v184 objects:v207 count:16];
        if (!v144) {
          goto LABEL_66;
        }
        uint64_t v142 = *(void *)v185;
        do
        {
          for (uint64_t i = 0; i != v144; ++i)
          {
            if (*(void *)v185 != v142) {
              objc_enumerationMutation(v139);
            }
            id v11 = *(id *)(*((void *)&v184 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              long long v12 = v11;
            }
            else {
              long long v12 = 0;
            }
            id v13 = v12;

            v152 = v13;
            if (v13)
            {
              long long v14 = [v13 mediaProfile];

              if (v14)
              {
                long long v15 = [v13 mediaProfile];
                v16 = [v15 assistantObject];

                if (v16)
                {
                  [v3 addObject:v16];
                  char v17 = 1;
                }
                else
                {
                  char v17 = 0;
                }
              }
              else
              {
                char v17 = 0;
              }
              long long v182 = 0u;
              long long v183 = 0u;
              long long v180 = 0u;
              long long v181 = 0u;
              v19 = [v13 services];
              uint64_t v20 = [v19 countByEnumeratingWithState:&v180 objects:v206 count:16];
              if (v20)
              {
                uint64_t v21 = v20;
                uint64_t v22 = *(void *)v181;
                do
                {
                  for (uint64_t j = 0; j != v21; ++j)
                  {
                    if (*(void *)v181 != v22) {
                      objc_enumerationMutation(v19);
                    }
                    v24 = *(void **)(*((void *)&v180 + 1) + 8 * j);
                    if (([v24 isHidden] & 1) == 0)
                    {
                      v25 = [v24 assistantObject];
                      if (v25)
                      {
                        [v3 addObject:v25];
                        char v17 = 1;
                      }
                    }
                  }
                  uint64_t v21 = [v19 countByEnumeratingWithState:&v180 objects:v206 count:16];
                }
                while (v21);
              }

              char v18 = v17 & 1;
              id v13 = v152;
            }
            else
            {
              char v18 = 0;
            }
            long long v178 = 0u;
            long long v179 = 0u;
            long long v176 = 0u;
            long long v177 = 0u;
            v26 = [v13 cameraProfiles];
            uint64_t v27 = [v26 countByEnumeratingWithState:&v176 objects:v205 count:16];
            if (v27)
            {
              uint64_t v28 = v27;
              uint64_t v29 = *(void *)v177;
              do
              {
                for (uint64_t k = 0; k != v28; ++k)
                {
                  if (*(void *)v177 != v29) {
                    objc_enumerationMutation(v26);
                  }
                  v31 = [*(id *)(*((void *)&v176 + 1) + 8 * k) assistantObject];
                  if (v31)
                  {
                    [v3 addObject:v31];
                    char v18 = 1;
                  }
                }
                uint64_t v28 = [v26 countByEnumeratingWithState:&v176 objects:v205 count:16];
              }
              while (v28);
            }

            id v32 = v11;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v33 = v32;
            }
            else {
              v33 = 0;
            }
            id v34 = v33;

            if (v34)
            {
              v35 = [v34 mediaProfile];
              v36 = [v35 assistantObject];

              if (v36)
              {
                [v3 addObject:v36];
                char v18 = 1;
              }
            }
            id v37 = v32;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v38 = v37;
            }
            else {
              v38 = 0;
            }
            id v39 = v38;

            v40 = [v39 audioDestinationController];
            v41 = [v40 data];
            v42 = [v41 destinationIdentifier];

            if (!v42) {
              goto LABEL_58;
            }
            id v148 = v34;
            uint64_t v43 = i;
            v44 = [v39 home];
            v45 = [v39 name];
            v46 = [v40 assistantObjectWithHome:v44 name:v45];

            if (!v46)
            {
              uint64_t i = v43;
              id v34 = v148;
LABEL_58:
              if ((v18 & 1) == 0) {
                goto LABEL_64;
              }
              goto LABEL_59;
            }
            [v3 addObject:v46];

            uint64_t i = v43;
            id v34 = v148;
LABEL_59:
            v47 = [v152 hostAccessory];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) == 0 || !v47)
            {
              v49 = [v37 assistantObject];
              if (v49) {
                [v3 addObject:v49];
              }
            }
LABEL_64:
          }
          uint64_t v144 = [v139 countByEnumeratingWithState:&v184 objects:v207 count:16];
        }
        while (v144);
LABEL_66:

        long long v174 = 0u;
        long long v175 = 0u;
        long long v172 = 0u;
        long long v173 = 0u;
        v50 = [v138 serviceGroups];
        v51 = (void *)[v50 copy];

        uint64_t v52 = [v51 countByEnumeratingWithState:&v172 objects:v204 count:16];
        if (v52)
        {
          uint64_t v53 = v52;
          uint64_t v54 = *(void *)v173;
          uint64_t v145 = *(void *)v173;
          v149 = v51;
          do
          {
            uint64_t v55 = 0;
            uint64_t v153 = v53;
            do
            {
              if (*(void *)v173 != v54) {
                objc_enumerationMutation(v51);
              }
              v56 = *(void **)(*((void *)&v172 + 1) + 8 * v55);
              v57 = [v56 serviceUUIDs];
              uint64_t v58 = [v57 count];

              if (v58)
              {
                v59 = [v56 assistantObject];
                if (v59) {
                  [v3 addObject:v59];
                }
              }
              else
              {
                v60 = (void *)MEMORY[0x1D9452090]();
                v61 = v140;
                v62 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
                {
                  v63 = HMFGetLogIdentifier();
                  v64 = [v56 name];
                  v65 = [v138 name];
                  v66 = [v138 uuid];
                  v67 = [v66 UUIDString];
                  *(_DWORD *)buf = 138544130;
                  v197 = v63;
                  __int16 v198 = 2112;
                  v199 = v64;
                  __int16 v200 = 2112;
                  v201 = v65;
                  __int16 v202 = 2112;
                  v203 = v67;
                  _os_log_impl(&dword_1D49D5000, v62, OS_LOG_TYPE_INFO, "%{public}@Dropping empty service group %@ in home %@/%@ from sync data", buf, 0x2Au);

                  v51 = v149;
                  uint64_t v54 = v145;

                  uint64_t v53 = v153;
                }
              }
              ++v55;
            }
            while (v53 != v55);
            uint64_t v53 = [v51 countByEnumeratingWithState:&v172 objects:v204 count:16];
          }
          while (v53);
        }

        long long v170 = 0u;
        long long v171 = 0u;
        long long v168 = 0u;
        long long v169 = 0u;
        v68 = [v138 rooms];
        v69 = (void *)[v68 copy];

        uint64_t v70 = [v69 countByEnumeratingWithState:&v168 objects:v195 count:16];
        if (v70)
        {
          uint64_t v71 = v70;
          uint64_t v72 = *(void *)v169;
          do
          {
            for (uint64_t m = 0; m != v71; ++m)
            {
              if (*(void *)v169 != v72) {
                objc_enumerationMutation(v69);
              }
              v74 = [*(id *)(*((void *)&v168 + 1) + 8 * m) assistantObject];
              if (v74) {
                [v3 addObject:v74];
              }
            }
            uint64_t v71 = [v69 countByEnumeratingWithState:&v168 objects:v195 count:16];
          }
          while (v71);
        }

        v75 = [v138 roomForEntireHome];
        uint64_t v76 = [v75 assistantObject];

        if (v76) {
          [v3 addObject:v76];
        }
        v143 = (void *)v76;
        long long v166 = 0u;
        long long v167 = 0u;
        long long v164 = 0u;
        long long v165 = 0u;
        v77 = [v138 zones];
        v78 = (void *)[v77 copy];

        uint64_t v79 = [v78 countByEnumeratingWithState:&v164 objects:v194 count:16];
        if (v79)
        {
          uint64_t v80 = v79;
          uint64_t v81 = *(void *)v165;
          v146 = v78;
          do
          {
            uint64_t v82 = 0;
            uint64_t v150 = v80;
            do
            {
              if (*(void *)v165 != v81) {
                objc_enumerationMutation(v78);
              }
              v83 = *(void **)(*((void *)&v164 + 1) + 8 * v82);
              v84 = [v83 roomUUIDs];
              uint64_t v85 = [v84 count];

              if (v85)
              {
                v86 = [v83 assistantObject];
                if (v86) {
                  [v3 addObject:v86];
                }
              }
              else
              {
                v87 = (void *)MEMORY[0x1D9452090]();
                v88 = v140;
                v89 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
                {
                  v90 = HMFGetLogIdentifier();
                  v91 = [v83 name];
                  v154 = v87;
                  uint64_t v92 = v81;
                  v93 = [v138 name];
                  v94 = [v138 uuid];
                  v95 = [v94 UUIDString];
                  *(_DWORD *)buf = 138544130;
                  v197 = v90;
                  __int16 v198 = 2112;
                  v199 = v91;
                  __int16 v200 = 2112;
                  v201 = v93;
                  __int16 v202 = 2112;
                  v203 = v95;
                  _os_log_impl(&dword_1D49D5000, v89, OS_LOG_TYPE_INFO, "%{public}@Dropping empty zone %@ in home %@/%@ from sync data", buf, 0x2Au);

                  uint64_t v81 = v92;
                  v87 = v154;

                  v78 = v146;
                  uint64_t v80 = v150;
                }
              }
              ++v82;
            }
            while (v80 != v82);
            uint64_t v80 = [v78 countByEnumeratingWithState:&v164 objects:v194 count:16];
          }
          while (v80);
        }

        long long v162 = 0u;
        long long v163 = 0u;
        long long v160 = 0u;
        long long v161 = 0u;
        v96 = [v138 actionSets];
        v97 = (void *)[v96 copy];

        uint64_t v98 = [v97 countByEnumeratingWithState:&v160 objects:v193 count:16];
        if (v98)
        {
          uint64_t v99 = v98;
          uint64_t v100 = *(void *)v161;
          uint64_t v147 = *(void *)v161;
          v151 = v97;
          do
          {
            for (uint64_t n = 0; n != v99; ++n)
            {
              if (*(void *)v161 != v100) {
                objc_enumerationMutation(v97);
              }
              v102 = *(void **)(*((void *)&v160 + 1) + 8 * n);
              v103 = [v102 type];
              if ([v103 isEqualToString:v141])
              {
                v104 = [v102 actions];
                uint64_t v105 = [v104 count];

                if (!v105)
                {
                  v106 = (void *)MEMORY[0x1D9452090]();
                  v107 = v140;
                  v108 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    v109 = v155 = v106;
                    v110 = [v102 name];
                    v111 = [v138 name];
                    v112 = [v138 uuid];
                    v113 = [v112 UUIDString];
                    *(_DWORD *)buf = 138544130;
                    v197 = v109;
                    __int16 v198 = 2112;
                    v199 = v110;
                    __int16 v200 = 2112;
                    v201 = v111;
                    __int16 v202 = 2112;
                    v203 = v113;
                    _os_log_impl(&dword_1D49D5000, v108, OS_LOG_TYPE_INFO, "%{public}@Dropping empty user-defined actionSet %@ in home %@/%@ from sync data", buf, 0x2Au);

                    v97 = v151;
                    uint64_t v100 = v147;

                    v106 = v155;
                  }

                  continue;
                }
              }
              else
              {
              }
              v114 = [v102 assistantObject];
              if (v114) {
                [v3 addObject:v114];
              }
            }
            uint64_t v99 = [v97 countByEnumeratingWithState:&v160 objects:v193 count:16];
          }
          while (v99);
        }

        long long v158 = 0u;
        long long v159 = 0u;
        long long v156 = 0u;
        long long v157 = 0u;
        v115 = [v138 mediaSystems];
        uint64_t v116 = [v115 countByEnumeratingWithState:&v156 objects:v192 count:16];
        if (v116)
        {
          uint64_t v117 = v116;
          uint64_t v118 = *(void *)v157;
          do
          {
            for (iuint64_t i = 0; ii != v117; ++ii)
            {
              if (*(void *)v157 != v118) {
                objc_enumerationMutation(v115);
              }
              v120 = [*(id *)(*((void *)&v156 + 1) + 8 * ii) assistantObject];
              if (v120) {
                [v3 addObject:v120];
              }
            }
            uint64_t v117 = [v115 countByEnumeratingWithState:&v156 objects:v192 count:16];
          }
          while (v117);
        }

LABEL_134:
        uint64_t v7 = v137 + 1;
      }
      while (v137 + 1 != v135);
      uint64_t v135 = [obj countByEnumeratingWithState:&v188 objects:v208 count:16];
    }
    while (v135);
  }

  v128 = (void *)MEMORY[0x1D9452090]();
  v129 = v140;
  v130 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v130, OS_LOG_TYPE_DEBUG))
  {
    v131 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v197 = v131;
    __int16 v198 = 2112;
    v199 = v3;
    _os_log_impl(&dword_1D49D5000, v130, OS_LOG_TYPE_DEBUG, "%{public}@currentHomekitObjects: %@", buf, 0x16u);
  }
  [(HMDAssistantGather *)v129 setCurrentHomekitObjects:v3];
}

- (NSString)currentHomeAssistantIdentifier
{
  v2 = [(HMDAssistantGather *)self _getCurrentHome];
  uint64_t v3 = [v2 urlString];

  return (NSString *)v3;
}

- (NSString)currentHomeName
{
  v2 = [(HMDAssistantGather *)self _getCurrentHome];
  uint64_t v3 = v2;
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
  uint64_t v3 = [v2 urlString];

  return (NSString *)v3;
}

- (NSString)primaryHomeName
{
  v2 = [(HMDAssistantGather *)self _getPrimaryHome];
  uint64_t v3 = [v2 name];

  return (NSString *)v3;
}

- (int64_t)homeCount
{
  v2 = [(HMDAssistantGather *)self manager];
  uint64_t v3 = [v2 homes];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)_getCurrentHome
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(HMDAssistantGather *)self manager];
  uint64_t v3 = [v2 currentHomeUUID];
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
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(HMDAssistantGather *)self manager];
  uint64_t v3 = [v2 primaryHomeUUID];
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
  if (logCategory__hmf_once_t0_132262 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_132262, &__block_literal_global_132263);
  }
  v2 = (void *)logCategory__hmf_once_v1_132264;
  return v2;
}

uint64_t __33__HMDAssistantGather_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_132264;
  logCategory__hmf_once_v1_132264 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end