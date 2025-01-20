@interface HDCloudSyncFinishOwnerTakeoverOperation
+ (BOOL)shouldLogAtOperationStart;
+ (id)operationTagDependencies;
- (void)main;
- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5;
@end

@implementation HDCloudSyncFinishOwnerTakeoverOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

+ (id)operationTagDependencies
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = 0x1F1764B60;
  v4[1] = 0x1F1764B80;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

- (void)main
{
  uint64_t v264 = *MEMORY[0x1E4F143B8];
  v3 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E4F65D90]);
  taskGroup = self->_taskGroup;
  self->_taskGroup = v3;

  [(HDSynchronousTaskGroup *)self->_taskGroup setDelegate:self];
  v5 = [(HDCloudSyncOperation *)self configuration];
  v6 = [v5 computedState];
  v7 = [v6 pushTargets];
  uint64_t v8 = [v7 count];

  v191 = self;
  if (!v8)
  {
    [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
    return;
  }
  v9 = [(HDCloudSyncOperation *)self configuration];
  v10 = [v9 repository];
  v11 = [v10 syncIdentityManager];
  v12 = [v11 currentSyncIdentity];
  v13 = [v12 identity];

  v14 = [(HDCloudSyncOperation *)self configuration];
  v15 = [v14 computedState];
  v16 = [v15 targets];
  v226[0] = MEMORY[0x1E4F143A8];
  v226[1] = 3221225472;
  v226[2] = __47__HDCloudSyncFinishOwnerTakeoverOperation_main__block_invoke;
  v226[3] = &unk_1E6300BA8;
  v226[4] = self;
  id v17 = v13;
  id v227 = v17;
  v18 = objc_msgSend(v16, "hk_filter:", v226);

  v19 = [(HDCloudSyncOperation *)self configuration];
  v20 = [v19 computedState];
  v21 = [v20 targets];
  v224[0] = MEMORY[0x1E4F143A8];
  v224[1] = 3221225472;
  v224[2] = __47__HDCloudSyncFinishOwnerTakeoverOperation_main__block_invoke_2;
  v224[3] = &unk_1E6300BA8;
  v224[4] = self;
  id v180 = v17;
  id v225 = v180;
  v181 = objc_msgSend(v21, "hk_filter:", v224);

  v22 = v18;
  if (![v18 count] && !objc_msgSend(v181, "count"))
  {
    [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
    v172 = v180;
    goto LABEL_106;
  }
  v179 = v18;
  id v23 = v18;
  id v195 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v250 = 0u;
  long long v251 = 0u;
  long long v252 = 0u;
  long long v253 = 0u;
  obuint64_t j = v23;
  uint64_t v25 = [obj countByEnumeratingWithState:&v250 objects:buf count:16];
  if (!v25) {
    goto LABEL_20;
  }
  uint64_t v26 = v25;
  uint64_t v27 = *(void *)v251;
  do
  {
    for (uint64_t i = 0; i != v26; ++i)
    {
      if (*(void *)v251 != v27) {
        objc_enumerationMutation(obj);
      }
      v29 = *(void **)(*((void *)&v250 + 1) + 8 * i);
      v30 = [v29 storeRecord];
      v31 = [v30 syncIdentity];
      id v32 = [v195 objectForKeyedSubscript:v31];

      v33 = [v29 storeRecord];
      v34 = [v33 syncIdentity];
      id v35 = [v24 objectForKeyedSubscript:v34];

      if (v32)
      {
        if (v35) {
          goto LABEL_11;
        }
      }
      else
      {
        id v32 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        v42 = [v29 storeRecord];
        v43 = [v42 syncIdentity];
        [v195 setObject:v32 forKeyedSubscript:v43];

        if (v35) {
          goto LABEL_11;
        }
      }
      id v35 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v44 = [v29 storeRecord];
      v45 = [v44 syncIdentity];
      [v24 setObject:v35 forKeyedSubscript:v45];

LABEL_11:
      v36 = [v29 storeRecord];
      v37 = [v36 activeSequenceHeaderRecord];

      if (v37)
      {
        v38 = [v37 includedSyncIdentities];
        v39 = [v38 allObjects];
        [v32 addObjectsFromArray:v39];

        v40 = [v37 includedIdentifiers];
        v41 = [v40 allObjects];
        [v35 addObjectsFromArray:v41];
      }
      else
      {
        v46 = [v29 storeRecord];
        v40 = [v46 currentSequenceHeaderRecord];

        if (!v40) {
          goto LABEL_18;
        }
        v47 = [v40 includedSyncIdentities];
        v48 = [v47 allObjects];
        [v32 addObjectsFromArray:v48];

        v41 = [v40 includedIdentifiers];
        v49 = [v41 allObjects];
        [v35 addObjectsFromArray:v49];
      }
LABEL_18:
    }
    uint64_t v26 = [obj countByEnumeratingWithState:&v250 objects:buf count:16];
  }
  while (v26);
LABEL_20:

  id v50 = v181;
  id v51 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v250 = 0u;
  long long v251 = 0u;
  long long v252 = 0u;
  long long v253 = 0u;
  id v189 = v50;
  uint64_t v52 = [v189 countByEnumeratingWithState:&v250 objects:buf count:16];
  if (!v52) {
    goto LABEL_34;
  }
  uint64_t v53 = v52;
  uint64_t v54 = *(void *)v251;
  while (2)
  {
    uint64_t v55 = 0;
    while (2)
    {
      if (*(void *)v251 != v54) {
        objc_enumerationMutation(v189);
      }
      v56 = *(void **)(*((void *)&v250 + 1) + 8 * v55);
      v57 = [v56 storeRecord];
      v58 = [v57 ownerIdentifier];
      id v59 = [v51 objectForKeyedSubscript:v58];

      if (!v59)
      {
        id v59 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        v60 = [v56 storeRecord];
        v61 = [v60 ownerIdentifier];
        [v51 setObject:v59 forKeyedSubscript:v61];
      }
      v62 = [v56 storeRecord];
      v63 = [v62 activeSequenceHeaderRecord];

      if (v63)
      {
        v64 = [v63 includedIdentifiers];
        v65 = [v64 allObjects];
        [v59 addObjectsFromArray:v65];
        goto LABEL_31;
      }
      v66 = [v56 storeRecord];
      v64 = [v66 currentSequenceHeaderRecord];

      if (v64)
      {
        v65 = [v64 includedIdentifiers];
        v67 = [v65 allObjects];
        [v59 addObjectsFromArray:v67];

LABEL_31:
      }

      if (v53 != ++v55) {
        continue;
      }
      break;
    }
    uint64_t v53 = [v189 countByEnumeratingWithState:&v250 objects:buf count:16];
    if (v53) {
      continue;
    }
    break;
  }
LABEL_34:

  _HKInitializeLogging();
  v68 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    v69 = v68;
    uint64_t v70 = [v51 count];
    uint64_t v71 = [v195 count];
    *(_DWORD *)buf = 138543874;
    v255 = v191;
    __int16 v256 = 2048;
    *(void *)v257 = v70;
    *(_WORD *)&v257[8] = 2048;
    *(void *)&v257[10] = v71;
    _os_log_impl(&dword_1BCB7D000, v69, OS_LOG_TYPE_DEFAULT, "%{public}@: Considering finishing takeover for %ld owners and %ld identities:", buf, 0x20u);
  }
  long long v222 = 0u;
  long long v223 = 0u;
  long long v220 = 0u;
  long long v221 = 0u;
  id v196 = v195;
  uint64_t v72 = [v196 countByEnumeratingWithState:&v220 objects:v249 count:16];
  if (v72)
  {
    uint64_t v73 = v72;
    int v74 = 0;
    uint64_t v75 = *(void *)v221;
    do
    {
      uint64_t v76 = 0;
      uint64_t v188 = v73;
      do
      {
        if (*(void *)v221 != v75) {
          objc_enumerationMutation(v196);
        }
        uint64_t v77 = *(void *)(*((void *)&v220 + 1) + 8 * v76);
        _HKInitializeLogging();
        v78 = (void *)*MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          v79 = v78;
          v80 = [v196 objectForKeyedSubscript:v77];
          v81 = [v80 allObjects];
          v82 = [v81 componentsJoinedByString:@", "];
          *(_DWORD *)buf = 138544130;
          v255 = v191;
          __int16 v256 = 1024;
          *(_DWORD *)v257 = v74;
          *(_WORD *)&v257[4] = 2112;
          *(void *)&v257[6] = v77;
          *(_WORD *)&v257[14] = 2112;
          *(void *)&v257[16] = v82;
          _os_log_impl(&dword_1BCB7D000, v79, OS_LOG_TYPE_DEFAULT, "%{public}@: %d. %@ (%@)", buf, 0x26u);

          ++v74;
          uint64_t v73 = v188;
        }
        ++v76;
      }
      while (v73 != v76);
      uint64_t v73 = [v196 countByEnumeratingWithState:&v220 objects:v249 count:16];
    }
    while (v73);
  }

  long long v218 = 0u;
  long long v219 = 0u;
  long long v216 = 0u;
  long long v217 = 0u;
  id v83 = v51;
  uint64_t v84 = [v83 countByEnumeratingWithState:&v216 objects:v248 count:16];
  if (v84)
  {
    uint64_t v85 = v84;
    int v86 = 0;
    uint64_t v87 = *(void *)v217;
    do
    {
      for (uint64_t j = 0; j != v85; ++j)
      {
        if (*(void *)v217 != v87) {
          objc_enumerationMutation(v83);
        }
        uint64_t v89 = *(void *)(*((void *)&v216 + 1) + 8 * j);
        _HKInitializeLogging();
        v90 = (void *)*MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          int v91 = v86 + 1;
          v92 = v90;
          v93 = [v83 objectForKeyedSubscript:v89];
          v94 = [v93 allObjects];
          uint64_t v95 = [v94 componentsJoinedByString:@", "];
          int v96 = v86;
          uint64_t v97 = v87;
          id v98 = v83;
          v99 = (void *)v95;
          *(_DWORD *)buf = 138544130;
          v255 = v191;
          __int16 v256 = 1024;
          *(_DWORD *)v257 = v96;
          *(_WORD *)&v257[4] = 2112;
          *(void *)&v257[6] = v89;
          *(_WORD *)&v257[14] = 2112;
          *(void *)&v257[16] = v95;
          _os_log_impl(&dword_1BCB7D000, v92, OS_LOG_TYPE_DEFAULT, "%{public}@: %d. %@ (%@)", buf, 0x26u);

          id v83 = v98;
          uint64_t v87 = v97;

          int v86 = v91;
        }
      }
      uint64_t v85 = [v83 countByEnumeratingWithState:&v216 objects:v248 count:16];
    }
    while (v85);
  }

  v100 = [v196 allKeys];
  v213[0] = MEMORY[0x1E4F143A8];
  v213[1] = 3221225472;
  v213[2] = __47__HDCloudSyncFinishOwnerTakeoverOperation_main__block_invoke_282;
  v213[3] = &unk_1E6300BD0;
  id v178 = v196;
  id v214 = v178;
  v215 = v191;
  v101 = objc_msgSend(v100, "hk_mapToSet:", v213);

  v102 = [v83 allKeys];
  v210[0] = MEMORY[0x1E4F143A8];
  v210[1] = 3221225472;
  v210[2] = __47__HDCloudSyncFinishOwnerTakeoverOperation_main__block_invoke_2_284;
  v210[3] = &unk_1E6300BF8;
  id v103 = v83;
  id v211 = v103;
  v212 = v191;
  v104 = objc_msgSend(v102, "hk_mapToSet:", v210);

  if ([v101 count] || objc_msgSend(v104, "count"))
  {
    id v176 = v103;
    v177 = v101;
    v208[0] = MEMORY[0x1E4F143A8];
    v208[1] = 3221225472;
    v208[2] = __47__HDCloudSyncFinishOwnerTakeoverOperation_main__block_invoke_286;
    v208[3] = &unk_1E62F4740;
    id v209 = v101;
    v105 = objc_msgSend(obj, "hk_filter:", v208);
    v206[0] = MEMORY[0x1E4F143A8];
    v206[1] = 3221225472;
    v206[2] = __47__HDCloudSyncFinishOwnerTakeoverOperation_main__block_invoke_2_287;
    v206[3] = &unk_1E62F4740;
    id v207 = v104;
    v106 = objc_msgSend(v189, "hk_filter:", v206);
    _HKInitializeLogging();
    v107 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      v108 = v107;
      uint64_t v109 = [v105 count];
      uint64_t v110 = [v106 count];
      *(_DWORD *)buf = 138543874;
      v255 = v191;
      __int16 v256 = 2048;
      *(void *)v257 = v109;
      *(_WORD *)&v257[8] = 2048;
      *(void *)&v257[10] = v110;
      _os_log_impl(&dword_1BCB7D000, v108, OS_LOG_TYPE_DEFAULT, "%{public}@: Proceeding with takeover (Deletion) for %ld owners and %ld identities:", buf, 0x20u);
    }
    id obja = v106;
    long long v204 = 0u;
    long long v205 = 0u;
    long long v202 = 0u;
    long long v203 = 0u;
    id v184 = v105;
    uint64_t v111 = [v184 countByEnumeratingWithState:&v202 objects:v247 count:16];
    v175 = v104;
    if (v111)
    {
      uint64_t v112 = v111;
      int v113 = 0;
      uint64_t v114 = *(void *)v203;
      do
      {
        for (uint64_t k = 0; k != v112; ++k)
        {
          if (*(void *)v203 != v114) {
            objc_enumerationMutation(v184);
          }
          v116 = *(void **)(*((void *)&v202 + 1) + 8 * k);
          _HKInitializeLogging();
          v117 = (void *)*MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
          {
            v118 = v117;
            v119 = [v116 storeRecord];
            v120 = [v119 syncIdentity];
            *(_DWORD *)buf = 138543874;
            v255 = v191;
            __int16 v256 = 1024;
            *(_DWORD *)v257 = v113;
            *(_WORD *)&v257[4] = 2112;
            *(void *)&v257[6] = v120;
            _os_log_impl(&dword_1BCB7D000, v118, OS_LOG_TYPE_DEFAULT, "%{public}@: %d. %@", buf, 0x1Cu);

            ++v113;
          }
        }
        uint64_t v112 = [v184 countByEnumeratingWithState:&v202 objects:v247 count:16];
      }
      while (v112);
    }

    long long v200 = 0u;
    long long v201 = 0u;
    long long v198 = 0u;
    long long v199 = 0u;
    id v183 = obja;
    uint64_t v121 = [v183 countByEnumeratingWithState:&v198 objects:v246 count:16];
    if (v121)
    {
      uint64_t v122 = v121;
      int v123 = 0;
      uint64_t v124 = *(void *)v199;
      do
      {
        for (uint64_t m = 0; m != v122; ++m)
        {
          if (*(void *)v199 != v124) {
            objc_enumerationMutation(v183);
          }
          v126 = *(void **)(*((void *)&v198 + 1) + 8 * m);
          _HKInitializeLogging();
          v127 = (void *)*MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
          {
            v128 = v127;
            v129 = [v126 storeRecord];
            v130 = [v129 ownerIdentifier];
            *(_DWORD *)buf = 138543874;
            v255 = v191;
            __int16 v256 = 1024;
            *(_DWORD *)v257 = v123;
            *(_WORD *)&v257[4] = 2112;
            *(void *)&v257[6] = v130;
            _os_log_impl(&dword_1BCB7D000, v128, OS_LOG_TYPE_DEFAULT, "%{public}@: %d. %@", buf, 0x1Cu);

            ++v123;
          }
        }
        uint64_t v122 = [v183 countByEnumeratingWithState:&v198 objects:v246 count:16];
      }
      while (v122);
    }

    id v186 = [v184 arrayByAddingObjectsFromArray:v183];
    v131 = v191;
    [(HDSynchronousTaskGroup *)v191->_taskGroup beginTask];
    long long v232 = 0u;
    long long v233 = 0u;
    long long v234 = 0u;
    long long v235 = 0u;
    v132 = [(HDCloudSyncOperation *)v191 configuration];
    v133 = [v132 repository];
    v134 = [v133 allCKContainers];

    id v182 = v134;
    uint64_t v187 = [v134 countByEnumeratingWithState:&v232 objects:buf count:16];
    if (v187)
    {
      uint64_t v185 = *(void *)v233;
      do
      {
        v135 = 0;
        do
        {
          if (*(void *)v233 != v185) {
            objc_enumerationMutation(v182);
          }
          v190 = v135;
          v136 = *(void **)(*((void *)&v232 + 1) + 8 * (void)v135);
          id v197 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          id objb = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v228 = 0u;
          long long v229 = 0u;
          long long v230 = 0u;
          long long v231 = 0u;
          id v137 = v186;
          uint64_t v138 = [v137 countByEnumeratingWithState:&v228 objects:&v250 count:16];
          if (v138)
          {
            uint64_t v139 = v138;
            uint64_t v140 = *(void *)v229;
            do
            {
              for (uint64_t n = 0; n != v139; ++n)
              {
                if (*(void *)v229 != v140) {
                  objc_enumerationMutation(v137);
                }
                v142 = *(void **)(*((void *)&v228 + 1) + 8 * n);
                v143 = objc_msgSend(v142, "container", v175);
                v144 = [v143 containerIdentifier];
                v145 = [v136 containerIdentifier];
                int v146 = [v144 isEqualToString:v145];

                if (v146)
                {
                  v147 = [v142 zoneIdentifier];
                  uint64_t v148 = [v147 type];

                  v149 = [v142 zoneIdentifier];
                  v150 = v149;
                  if (v148 == 1)
                  {
                    v151 = [v149 zoneIdentifier];
                    v152 = v197;
                  }
                  else
                  {
                    uint64_t v153 = [v149 type];

                    if (v153 != 2) {
                      continue;
                    }
                    v150 = [v142 storeRecord];
                    v151 = [v150 recordID];
                    v152 = objb;
                  }
                  [v152 addObject:v151];
                }
              }
              uint64_t v139 = [v137 countByEnumeratingWithState:&v228 objects:&v250 count:16];
            }
            while (v139);
          }

          id v154 = v197;
          id v155 = v136;
          v131 = v191;
          if ([v154 count])
          {
            [(HDSynchronousTaskGroup *)v191->_taskGroup beginTask];
            _HKInitializeLogging();
            v156 = (void *)*MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
            {
              v157 = v156;
              uint64_t v158 = [v154 count];
              v159 = [v154 componentsJoinedByString:@", "];
              *(_DWORD *)v258 = 138543874;
              v259 = v191;
              __int16 v260 = 2048;
              uint64_t v261 = v158;
              __int16 v262 = 2114;
              v263 = v159;
              _os_log_impl(&dword_1BCB7D000, v157, OS_LOG_TYPE_DEFAULT, "%{public}@: Deleting %ld zones: %{public}@", v258, 0x20u);
            }
            v160 = [HDCloudSyncModifyRecordZonesOperation alloc];
            v161 = [(HDCloudSyncOperation *)v191 configuration];
            v162 = [(HDCloudSyncModifyRecordZonesOperation *)v160 initWithConfiguration:v161 container:v155 recordZonesToSave:0 recordZoneIDsToDelete:v154];

            uint64_t v241 = MEMORY[0x1E4F143A8];
            uint64_t v242 = 3221225472;
            v243 = __66__HDCloudSyncFinishOwnerTakeoverOperation__deleteZones_container___block_invoke;
            v244 = &unk_1E62F2928;
            v245 = v191;
            [(HDCloudSyncOperation *)v162 setOnSuccess:&v241];
            uint64_t v236 = MEMORY[0x1E4F143A8];
            uint64_t v237 = 3221225472;
            v238 = __66__HDCloudSyncFinishOwnerTakeoverOperation__deleteZones_container___block_invoke_2;
            v239 = &unk_1E62F2950;
            v240 = v191;
            [(HDCloudSyncOperation *)v162 setOnError:&v236];
            [(HDCloudSyncOperation *)v162 start];
          }
          id v163 = objb;
          id v164 = v155;
          if ([v163 count])
          {
            [(HDSynchronousTaskGroup *)v191->_taskGroup beginTask];
            _HKInitializeLogging();
            v165 = (void *)*MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
            {
              v166 = v165;
              uint64_t v167 = [v163 count];
              v168 = [v163 componentsJoinedByString:@", "];
              *(_DWORD *)v258 = 138543874;
              v259 = v191;
              __int16 v260 = 2048;
              uint64_t v261 = v167;
              __int16 v262 = 2114;
              v263 = v168;
              _os_log_impl(&dword_1BCB7D000, v166, OS_LOG_TYPE_DEFAULT, "%{public}@: Deleting %ld records: %{public}@", v258, 0x20u);
            }
            v169 = [HDCloudSyncModifyRecordsOperation alloc];
            v170 = [(HDCloudSyncOperation *)v191 configuration];
            v171 = [(HDCloudSyncModifyRecordsOperation *)v169 initWithConfiguration:v170 container:v164 recordsToSave:0 recordIDsToDelete:v163];

            uint64_t v241 = MEMORY[0x1E4F143A8];
            uint64_t v242 = 3221225472;
            v243 = __68__HDCloudSyncFinishOwnerTakeoverOperation__deleteRecords_container___block_invoke;
            v244 = &unk_1E62F2928;
            v245 = v191;
            [(HDCloudSyncOperation *)v171 setOnSuccess:&v241];
            uint64_t v236 = MEMORY[0x1E4F143A8];
            uint64_t v237 = 3221225472;
            v238 = __68__HDCloudSyncFinishOwnerTakeoverOperation__deleteRecords_container___block_invoke_2;
            v239 = &unk_1E62F2950;
            v240 = v191;
            [(HDCloudSyncOperation *)v171 setOnError:&v236];
            [(HDCloudSyncOperation *)v171 start];
          }
          v135 = v190 + 1;
        }
        while (v190 + 1 != (char *)v187);
        uint64_t v187 = [v182 countByEnumeratingWithState:&v232 objects:buf count:16];
      }
      while (v187);
    }

    [(HDSynchronousTaskGroup *)v131->_taskGroup finishTask];
    v22 = v179;
    v172 = v180;
    v101 = v177;
    v173 = v178;
    v104 = v175;
    id v103 = v176;
  }
  else
  {
    _HKInitializeLogging();
    v174 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v255 = v191;
      _os_log_impl(&dword_1BCB7D000, v174, OS_LOG_TYPE_DEFAULT, "%{public}@: Unable to finish takeover; we have not pushed all relevant sync identities or store identifiers.",
        buf,
        0xCu);
    }
    [(HDCloudSyncOperation *)v191 finishWithSuccess:1 error:0];
    v22 = v179;
    v172 = v180;
    v173 = v178;
  }

LABEL_106:
}

uint64_t __47__HDCloudSyncFinishOwnerTakeoverOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) configuration];
  v5 = [v4 repository];
  v6 = [v3 container];
  v7 = [v5 cachedOwnerIdentifierForContainer:v6];

  uint64_t v8 = [v3 storeRecord];
  v9 = [v8 syncIdentity];
  if (v9)
  {
    v10 = [v3 storeRecord];
    v11 = [v10 pendingOwner];
    v12 = [v7 string];
    if ([v11 isEqualToString:v12])
    {
      uint64_t v13 = 1;
    }
    else
    {
      v14 = [v3 storeRecord];
      v15 = [v14 pendingSyncIdentity];
      uint64_t v13 = [v15 isEqual:*(void *)(a1 + 40)];
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

uint64_t __47__HDCloudSyncFinishOwnerTakeoverOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) configuration];
  v5 = [v4 repository];
  v6 = [v3 container];
  v7 = [v5 cachedOwnerIdentifierForContainer:v6];

  uint64_t v8 = [v3 storeRecord];
  v9 = [v8 syncIdentity];
  if (v9)
  {
    uint64_t v10 = 0;
  }
  else
  {
    v11 = [v3 storeRecord];
    v12 = [v11 pendingOwner];
    uint64_t v13 = [v7 string];
    if ([v12 isEqualToString:v13])
    {
      uint64_t v10 = 1;
    }
    else
    {
      v14 = [v3 storeRecord];
      v15 = [v14 pendingSyncIdentity];
      uint64_t v10 = [v15 isEqual:*(void *)(a1 + 40)];
    }
  }

  return v10;
}

id __47__HDCloudSyncFinishOwnerTakeoverOperation_main__block_invoke_282(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v5 = objc_msgSend(*(id *)(a1 + 40), "configuration", 0);
  v6 = [v5 computedState];
  v7 = [v6 pushTargets];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v18 + 1) + 8 * i) storeRecord];
        uint64_t v13 = [v12 activeSequenceHeaderRecord];
        v14 = [v13 includedSyncIdentities];

        if (v14)
        {
          int v15 = [v4 isSubsetOfSet:v14];

          if (v15) {
            continue;
          }
        }

        id v16 = 0;
        goto LABEL_12;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v16 = v3;
LABEL_12:

  return v16;
}

id __47__HDCloudSyncFinishOwnerTakeoverOperation_main__block_invoke_2_284(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v5 = objc_msgSend(*(id *)(a1 + 40), "configuration", 0);
  v6 = [v5 computedState];
  v7 = [v6 pushTargets];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v18 + 1) + 8 * i) storeRecord];
        uint64_t v13 = [v12 activeSequenceHeaderRecord];
        v14 = [v13 includedIdentifiers];

        if (v14)
        {
          int v15 = [v4 isSubsetOfSet:v14];

          if (v15) {
            continue;
          }
        }

        id v16 = 0;
        goto LABEL_12;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v16 = v3;
LABEL_12:

  return v16;
}

uint64_t __47__HDCloudSyncFinishOwnerTakeoverOperation_main__block_invoke_286(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 storeRecord];
  v4 = [v3 syncIdentity];
  uint64_t v5 = [v2 containsObject:v4];

  return v5;
}

uint64_t __47__HDCloudSyncFinishOwnerTakeoverOperation_main__block_invoke_2_287(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 storeRecord];
  v4 = [v3 ownerIdentifier];
  uint64_t v5 = [v2 containsObject:v4];

  return v5;
}

uint64_t __66__HDCloudSyncFinishOwnerTakeoverOperation__deleteZones_container___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 104) finishTask];
}

void __66__HDCloudSyncFinishOwnerTakeoverOperation__deleteZones_container___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  uint64_t v5 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete zones to during takeover completion: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [*(id *)(a1 + 32) finishWithSuccess:0 error:v4];
}

uint64_t __68__HDCloudSyncFinishOwnerTakeoverOperation__deleteRecords_container___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 104) finishTask];
}

void __68__HDCloudSyncFinishOwnerTakeoverOperation__deleteRecords_container___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  uint64_t v5 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete records to during takeover completion: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [*(id *)(a1 + 32) finishWithSuccess:0 error:v4];
}

- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5
{
}

- (void).cxx_destruct
{
}

@end