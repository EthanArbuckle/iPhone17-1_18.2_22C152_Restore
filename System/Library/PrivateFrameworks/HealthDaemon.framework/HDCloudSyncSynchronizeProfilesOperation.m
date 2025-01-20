@interface HDCloudSyncSynchronizeProfilesOperation
+ (BOOL)shouldLogAtOperationStart;
- (uint64_t)_synchronizeProfilesWithRegistryAndShareRecordsForContainer:(void *)a3 database:(void *)a4 error:;
- (void)main;
- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5;
@end

@implementation HDCloudSyncSynchronizeProfilesOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (void)main
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v3 = [(HDCloudSyncOperation *)self profile];
  v4 = [v3 daemon];
  v5 = [v4 behavior];
  char v6 = [v5 supportsSecondaryProfiles];

  if (v6)
  {
    v7 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E4F65D90]);
    taskGroup = self->_taskGroup;
    self->_taskGroup = v7;

    [(HDSynchronousTaskGroup *)self->_taskGroup setDelegate:self];
    [(HDSynchronousTaskGroup *)self->_taskGroup beginTask];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v9 = [(HDCloudSyncOperation *)self configuration];
    v10 = [v9 repository];
    v11 = [v10 allCKContainers];

    id obj = v11;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v14 = 0;
      uint64_t v15 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(obj);
          }
          v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          [(HDSynchronousTaskGroup *)self->_taskGroup beginTask];
          v18 = [v17 privateCloudDatabase];
          id v28 = v14;
          char v19 = -[HDCloudSyncSynchronizeProfilesOperation _synchronizeProfilesWithRegistryAndShareRecordsForContainer:database:error:](self, v17, v18, &v28);
          id v20 = v28;

          v21 = self->_taskGroup;
          if (v19) {
            [(HDSynchronousTaskGroup *)v21 finishTask];
          }
          else {
            [(HDSynchronousTaskGroup *)v21 failTaskWithError:v20];
          }
          [(HDSynchronousTaskGroup *)self->_taskGroup beginTask];
          v22 = [v17 sharedCloudDatabase];
          id v27 = v20;
          char v23 = -[HDCloudSyncSynchronizeProfilesOperation _synchronizeProfilesWithRegistryAndShareRecordsForContainer:database:error:](self, v17, v22, &v27);
          id v14 = v27;

          v24 = self->_taskGroup;
          if (v23) {
            [(HDSynchronousTaskGroup *)v24 finishTask];
          }
          else {
            [(HDSynchronousTaskGroup *)v24 failTaskWithError:v14];
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v13);
    }
    else
    {
      id v14 = 0;
    }

    [(HDSynchronousTaskGroup *)self->_taskGroup finishTask];
  }
  else
  {
    _HKInitializeLogging();
    v25 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v35 = self;
      _os_log_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ Device ineligble for synchronizing additional profiles", buf, 0xCu);
    }
    [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
  }
}

- (uint64_t)_synchronizeProfilesWithRegistryAndShareRecordsForContainer:(void *)a3 database:(void *)a4 error:
{
  uint64_t v194 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (!a1)
  {
    uint64_t v19 = 0;
    goto LABEL_150;
  }
  id v146 = v6;
  id v8 = v6;
  id v9 = v7;
  v150 = a1;
  v10 = [a1 configuration];
  v11 = [v10 cachedCloudState];
  uint64_t v12 = [v8 containerIdentifier];
  v184[0] = 0;
  uint64_t v13 = objc_msgSend(v11, "zoneIdentifiersForContainerIdentifier:databaseScope:error:", v12, objc_msgSend(v9, "databaseScope"), v184);
  id v14 = v184[0];

  if (v13 || !v14)
  {
    if (!v13)
    {
      _HKInitializeLogging();
      v37 = (void *)*MEMORY[0x1E4F29FA8];
      id v6 = v146;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG))
      {
        v123 = v37;
        v124 = [v8 containerIdentifier];
        [v9 databaseScope];
        v125 = CKDatabaseScopeString();
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v150;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v124;
        *(_WORD *)&buf[22] = 2114;
        v186 = v125;
        _os_log_debug_impl(&dword_1BCB7D000, v123, OS_LOG_TYPE_DEBUG, "%{public}@ No zones cached for container %{public}@, database %{public}@", buf, 0x20u);

        id v6 = v146;
      }
      id v16 = 0;
      v17 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_10;
    }
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __102__HDCloudSyncSynchronizeProfilesOperation__cachedZonesWithRegistryRecordsForContainer_database_error___block_invoke;
    v186 = &unk_1E62FE928;
    v187[0] = v150;
    v17 = objc_msgSend(v13, "hk_map:", buf);
    id v16 = 0;
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v15 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      v118 = v15;
      v119 = [v8 containerIdentifier];
      [v9 databaseScope];
      v120 = CKDatabaseScopeString();
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v150;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v119;
      *(_WORD *)&buf[22] = 2114;
      v186 = v120;
      LOWORD(v187[0]) = 2114;
      *(void *)((char *)v187 + 2) = v14;
      _os_log_error_impl(&dword_1BCB7D000, v118, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get zone identifiers for container %{public}@, database %{public}@, %{public}@", buf, 0x2Au);
    }
    id v16 = v14;
    v17 = 0;
  }
  id v6 = v146;
LABEL_10:

  id v18 = v16;
  v145 = v17;
  if (!v17 && v18)
  {
    uint64_t v19 = (uint64_t)a4;
    id v20 = v18;
    if (a4)
    {
      uint64_t v19 = 0;
      *a4 = v18;
    }
    else
    {
      _HKLogDroppedError();
    }
    goto LABEL_149;
  }
  id v141 = v18;
  if (![v17 count])
  {
    uint64_t v19 = 1;
    goto LABEL_148;
  }
  id v21 = v17;
  id v139 = v8;
  id v138 = v9;
  id v149 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v172 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  long long v175 = 0u;
  id obj = v21;
  uint64_t v22 = [obj countByEnumeratingWithState:&v172 objects:v184 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    id v24 = 0;
    uint64_t v25 = *(void *)v173;
    do
    {
      uint64_t v26 = 0;
      id v27 = v24;
      do
      {
        if (*(void *)v173 != v25) {
          objc_enumerationMutation(obj);
        }
        id v28 = *(void **)(*((void *)&v172 + 1) + 8 * v26);
        uint64_t v29 = objc_opt_class();
        id v171 = v27;
        long long v30 = [v28 recordsForClass:v29 error:&v171];
        id v31 = v171;

        id v27 = v31;
        if (v30) {
          BOOL v32 = 1;
        }
        else {
          BOOL v32 = v31 == 0;
        }
        if (!v32)
        {
          _HKInitializeLogging();
          v33 = (void *)*MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            v121 = v33;
            v122 = [v28 zoneIdentifier];
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v150;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v122;
            *(_WORD *)&buf[22] = 2114;
            v186 = v31;
            _os_log_error_impl(&dword_1BCB7D000, v121, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get registry records for %{public}@, %{public}@", buf, 0x20u);
          }
          id v6 = v146;
          v35 = obj;
          uint64_t v36 = v31;
          if (a4) {
            *a4 = v31;
          }
          else {
            _HKLogDroppedError();
          }
          buf[0] = 0;
          v55 = obj;
          goto LABEL_147;
        }
        if (v30) {
          [v149 addObjectsFromArray:v30];
        }

        ++v26;
      }
      while (v23 != v26);
      id v24 = v31;
      uint64_t v23 = [obj countByEnumeratingWithState:&v172 objects:v184 count:16];
    }
    while (v23);
  }
  else
  {
    id v24 = 0;
  }
  v132 = v24;

  _HKInitializeLogging();
  v38 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    v39 = v38;
    v40 = [v139 containerIdentifier];
    uint64_t v41 = [v149 count];
    [v138 databaseScope];
    v42 = CKDatabaseScopeString();
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = v150;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v40;
    *(_WORD *)&buf[22] = 2048;
    v186 = (void *)v41;
    LOWORD(v187[0]) = 2114;
    *(void *)((char *)v187 + 2) = v42;
    _os_log_impl(&dword_1BCB7D000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: Fetched %ld records from cache %{public}@", buf, 0x2Au);
  }
  id v143 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v167 = 0u;
  long long v168 = 0u;
  long long v169 = 0u;
  long long v170 = 0u;
  id v43 = obj;
  uint64_t v44 = [v43 countByEnumeratingWithState:&v167 objects:v183 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    id v46 = 0;
    uint64_t v47 = *(void *)v168;
    do
    {
      uint64_t v48 = 0;
      v49 = v46;
      do
      {
        if (*(void *)v168 != v47) {
          objc_enumerationMutation(v43);
        }
        v50 = *(void **)(*((void *)&v167 + 1) + 8 * v48);
        id v166 = v49;
        v51 = [v50 zoneShareWithError:&v166];
        id v46 = v166;

        if (v51) {
          BOOL v52 = 1;
        }
        else {
          BOOL v52 = v46 == 0;
        }
        if (!v52)
        {
          id v133 = v46;
          _HKInitializeLogging();
          v53 = (void *)*MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            v126 = v53;
            v127 = [v50 zoneIdentifier];
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v150;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v127;
            *(_WORD *)&buf[22] = 2114;
            v186 = v46;
            _os_log_error_impl(&dword_1BCB7D000, v126, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get share for %{public}@, %{public}@", buf, 0x20u);
          }
          id v6 = v146;
          v35 = obj;
          if (a4) {
            *a4 = v46;
          }
          else {
            _HKLogDroppedError();
          }
          buf[0] = 0;

          goto LABEL_146;
        }
        if (v51) {
          [v143 addObject:v51];
        }

        ++v48;
        v49 = v46;
      }
      while (v45 != v48);
      uint64_t v45 = [v43 countByEnumeratingWithState:&v167 objects:v183 count:16];
    }
    while (v45);
  }
  else
  {
    id v46 = 0;
  }
  id v133 = v46;

  _HKInitializeLogging();
  v56 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    v57 = v56;
    v58 = [v139 containerIdentifier];
    uint64_t v59 = [v143 count];
    [v138 databaseScope];
    v60 = CKDatabaseScopeString();
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = v150;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v58;
    *(_WORD *)&buf[22] = 2048;
    v186 = (void *)v59;
    LOWORD(v187[0]) = 2114;
    *(void *)((char *)v187 + 2) = v60;
    _os_log_impl(&dword_1BCB7D000, v57, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: Fetched %ld shares from cache %{public}@", buf, 0x2Au);
  }
  id v61 = v149;
  id v161 = v139;
  id v160 = v138;
  v159 = objc_msgSend(v143, "hk_mapToDictionary:", &__block_literal_global_118);
  id v154 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v176 = 0u;
  long long v177 = 0u;
  long long v178 = 0u;
  long long v179 = 0u;
  id v62 = v61;
  BOOL v130 = 1;
  v35 = obj;
  id v155 = v62;
  uint64_t v163 = [v62 countByEnumeratingWithState:&v176 objects:buf count:16];
  if (!v163)
  {
    id v6 = v146;
    goto LABEL_144;
  }
  char v153 = 0;
  uint64_t v158 = *(void *)v177;
  *(void *)&long long v63 = 138543618;
  long long v129 = v63;
  do
  {
    for (uint64_t i = 0; i != v163; ++i)
    {
      if (*(void *)v177 != v158) {
        objc_enumerationMutation(v155);
      }
      v65 = *(void **)(*((void *)&v176 + 1) + 8 * i);
      v66 = objc_msgSend(v65, "recordID", v129);
      v67 = [v66 zoneID];
      v68 = [v159 objectForKeyedSubscript:v67];
      id v69 = v65;
      id v70 = v68;
      id v71 = v161;
      id v72 = v160;
      v165 = v72;
      if ([v69 deleted])
      {
        v73 = 0;
        uint8_t v74 = 1;
        goto LABEL_130;
      }
      v157 = v66;
      id v164 = v71;
      id v75 = v7;
      v76 = [v69 recordID];
      v77 = [v76 zoneID];
      id v181 = 0;
      int v78 = objc_msgSend(v77, "hd_isUnifiedSyncZoneIDForSyncCircleIdentifier:", &v181);
      id v79 = v181;

      v162 = v79;
      if (v78
        && (![v79 isEqualToString:@"PrimarySyncCircle"]
         || [v72 databaseScope] != 2))
      {
        id v7 = v75;
        id v71 = v164;
        if ([v72 databaseScope] == 2)
        {
          v80 = [v69 ownerProfileIdentifier];
          if (!v80) {
            goto LABEL_82;
          }
        }
        else
        {
          v80 = [v69 sharedProfileIdentifier];
          if (!v80)
          {
LABEL_82:
            v80 = objc_msgSend(MEMORY[0x1E4F2B358], "hd_profileIdentifierWithSyncCircleIdentifier:", v79);
            if (v80) {
              goto LABEL_83;
            }
            v73 = 0;
            v188[0] = 1;
LABEL_101:
            v35 = obj;
LABEL_128:
            uint8_t v74 = v188[0];
            goto LABEL_129;
          }
        }
LABEL_83:
        v81 = v80;
        uint64_t v82 = [v80 type];
        if ((unint64_t)(v82 - 1) >= 4 && v82 != 100)
        {
          v188[0] = 1;

          v73 = 0;
          goto LABEL_101;
        }
        v151 = v67;
        v83 = [v150 configuration];
        v84 = [v83 repository];
        v85 = [v84 profile];
        v86 = [v85 daemon];
        v87 = [v86 profileManager];

        v88 = v87;
        v89 = [v87 profileForIdentifier:v81];
        v152 = v81;
        if (v89)
        {
          v73 = 0;
          v188[0] = 1;
          id v7 = v75;
          v35 = obj;
          id v71 = v164;
          v67 = v151;
LABEL_127:

          goto LABEL_128;
        }
        uint64_t v90 = [v69 displayFirstName];
        v91 = (void *)v90;
        if (v90) {
          v92 = (__CFString *)v90;
        }
        else {
          v92 = @"Auxiliary Health Store";
        }
        v93 = [v69 displayLastName];
        id v180 = 0;
        v147 = v87;
        v94 = [v87 createProfileForIdentifier:v81 firstName:v92 lastName:v93 error:&v180];
        id v148 = v180;

        _HKInitializeLogging();
        v95 = *MEMORY[0x1E4F29FA8];
        v96 = *MEMORY[0x1E4F29FA8];
        if (!v94)
        {
          id v7 = v75;
          if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v188 = 138543874;
            v189 = v150;
            __int16 v190 = 2114;
            id v191 = v162;
            __int16 v192 = 2114;
            id v193 = v148;
            _os_log_error_impl(&dword_1BCB7D000, v95, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create profile for sync circle identifier %{public}@: %{public}@", v188, 0x20u);
          }
          id v106 = v148;
          v73 = v106;
          v35 = obj;
          v88 = v87;
          if (v106) {
            id v107 = v106;
          }

          v188[0] = v73 == 0;
          goto LABEL_125;
        }
        id v7 = v75;
        id v71 = v164;
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v188 = 138543874;
          v189 = v150;
          __int16 v190 = 2114;
          id v191 = v162;
          __int16 v192 = 2114;
          id v193 = v152;
          _os_log_impl(&dword_1BCB7D000, v95, OS_LOG_TYPE_DEFAULT, "%{public}@: Created local profile for sync circle identifier %{public}@: %{public}@", v188, 0x20u);
        }
        v35 = obj;
        v88 = v87;
        if (([v152 type] & 0xFFFFFFFFFFFFFFFELL) != 2) {
          goto LABEL_119;
        }
        v140 = [v69 recordID];
        v97 = [v140 zoneID];
        id v142 = v94;
        id v98 = v70;
        id v99 = v97;
        if (v98)
        {
          v137 = v98;
          uint64_t v100 = [v98 owner];
          if (v100)
          {
            v101 = (void *)v100;
            v136 = v99;
            v102 = [v142 cloudSyncManager];
            id v182 = 0;
            int v103 = [v102 setShareOwnerParticipant:v101 error:&v182];
            id v134 = v182;

            _HKInitializeLogging();
            v104 = *MEMORY[0x1E4F29FA8];
            char v135 = v103;
            log = *MEMORY[0x1E4F29FA8];
            if (v103)
            {
              id v71 = v164;
              v105 = v134;
              if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v188 = v129;
                v189 = v150;
                __int16 v190 = 2114;
                id v191 = v101;
                _os_log_impl(&dword_1BCB7D000, log, OS_LOG_TYPE_DEFAULT, "%{public}@: Stored owner participant: %{public}@", v188, 0x16u);
              }
            }
            else
            {
              id v71 = v164;
              v105 = v134;
              if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v188 = v129;
                v189 = v150;
                __int16 v190 = 2114;
                id v191 = v134;
                _os_log_error_impl(&dword_1BCB7D000, log, OS_LOG_TYPE_ERROR, "%{public}@: Failed to store owner participant: %{public}@", v188, 0x16u);
              }
            }

            if ((v135 & 1) == 0)
            {
LABEL_117:
              v110 = [v142 profileIdentifier];
              id v182 = 0;
              char v111 = [v147 deleteProfile:v110 error:&v182];
              id v112 = v182;

              if (v111)
              {

                id v71 = v164;
                v88 = v147;
                goto LABEL_119;
              }
              _HKInitializeLogging();
              v113 = *MEMORY[0x1E4F29FA8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)v188 = v129;
                v189 = v150;
                __int16 v190 = 2114;
                id v191 = v142;
                _os_log_fault_impl(&dword_1BCB7D000, v113, OS_LOG_TYPE_FAULT, "%{public}@: Failed to delete profile %{public}@ after failing to set store owner participant.", v188, 0x16u);
              }
              id v114 = v112;
              v73 = v114;
              v88 = v147;
              if (v114) {
                id v115 = v114;
              }

              v188[0] = v73 == 0;
LABEL_125:
              id v71 = v164;
LABEL_126:
              v67 = v151;

              v89 = 0;
              goto LABEL_127;
            }
LABEL_119:
            v73 = 0;
            v188[0] = 1;
            goto LABEL_126;
          }
          _HKInitializeLogging();
          v109 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)v188 = v129;
            v189 = v150;
            __int16 v190 = 2114;
            id v191 = v137;
            _os_log_fault_impl(&dword_1BCB7D000, v109, OS_LOG_TYPE_FAULT, "%{public}@: Unable to find owner participant on share %{public}@", v188, 0x16u);
          }
        }
        else
        {
          _HKInitializeLogging();
          v108 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v188 = v129;
            v189 = v150;
            __int16 v190 = 2114;
            id v191 = v99;
            _os_log_error_impl(&dword_1BCB7D000, v108, OS_LOG_TYPE_ERROR, "%{public}@: Zone %{public}@ does not have a zone share during zone synchronization", v188, 0x16u);
          }
        }
        goto LABEL_117;
      }
      v73 = 0;
      uint8_t v74 = 1;
      id v7 = v75;
      v35 = obj;
      id v71 = v164;
LABEL_129:

      v66 = v157;
LABEL_130:

      id v116 = v73;
      if ((v74 & 1) == 0)
      {
        [v154 addObject:v116];
        char v153 = 1;
      }
    }
    uint64_t v163 = [v155 countByEnumeratingWithState:&v176 objects:buf count:16];
  }
  while (v163);

  if (v153)
  {
    id v117 = [v154 firstObject];
    id v62 = v117;
    BOOL v130 = v117 == 0;
    id v6 = v146;
    if (v117)
    {
      if (a4) {
        *a4 = v117;
      }
      else {
        _HKLogDroppedError();
      }
    }

LABEL_144:
  }
  else
  {
    BOOL v130 = 1;
    id v6 = v146;
  }

  buf[0] = v130;
LABEL_146:
  uint64_t v36 = v132;

  v55 = v133;
LABEL_147:

  uint64_t v19 = buf[0];
LABEL_148:
  id v20 = v141;
LABEL_149:

LABEL_150:
  return v19;
}

id __102__HDCloudSyncSynchronizeProfilesOperation__cachedZonesWithRegistryRecordsForContainer_database_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 zoneIdentifier];
  id v17 = 0;
  int v5 = objc_msgSend(v4, "hd_isUnifiedSyncZoneIDForSyncCircleIdentifier:", &v17);
  id v6 = v17;

  id v7 = 0;
  if (v5)
  {
    id v8 = [*(id *)(a1 + 32) configuration];
    id v9 = [v8 syncContainerPrefix];
    if ([v6 isEqualToString:v9])
    {
      uint64_t v10 = [v3 scope];

      if (v10 == 2)
      {
        id v7 = 0;
        goto LABEL_7;
      }
    }
    else
    {
    }
    v11 = [HDCloudSyncCachedZone alloc];
    uint64_t v12 = [*(id *)(a1 + 32) configuration];
    uint64_t v13 = [v12 repository];
    id v14 = [*(id *)(a1 + 32) configuration];
    uint64_t v15 = [v14 accessibilityAssertion];
    id v7 = [(HDCloudSyncCachedZone *)v11 initForZoneIdentifier:v3 repository:v13 accessibilityAssertion:v15];
  }
LABEL_7:

  return v7;
}

void __114__HDCloudSyncSynchronizeProfilesOperation__synchronizeProfilesForRegistryRecords_shares_container_database_error___block_invoke(uint64_t a1, void *a2, void (**a3)(void, void, void))
{
  int v5 = a3;
  id v6 = a2;
  id v8 = [v6 recordID];
  id v7 = [v8 zoneID];
  ((void (**)(void, void *, id))a3)[2](v5, v7, v6);
}

- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5
{
  BOOL v5 = a4;
  objc_msgSend(a5, "firstObject", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(HDCloudSyncOperation *)self finishWithSuccess:v5 error:v7];
}

- (void).cxx_destruct
{
}

@end