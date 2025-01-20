@interface HDCloudSyncPipelineStageDescribe
- (HDCloudSyncPipelineStageDescribe)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (HDCloudSyncPipelineStageDescribe)initWithConfiguration:(id)a3 cloudState:(id)a4 respositoryDescriptionHandler:(id)a5;
- (id)_cloudSyncDescriptionForContainer:(void *)a1 zonesByIdentifier:(void *)a2 error:(void *)a3;
- (id)_cloudSyncZoneDescriptionsForZoneIdentifiers:(void *)a3 zonesByIdentifier:;
- (id)_createRecordDescriptionWithRecord:(void *)a3 recordType:(void *)a4 childRecordDescriptions:;
- (void)main;
@end

@implementation HDCloudSyncPipelineStageDescribe

- (HDCloudSyncPipelineStageDescribe)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncPipelineStageDescribe)initWithConfiguration:(id)a3 cloudState:(id)a4 respositoryDescriptionHandler:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HDCloudSyncPipelineStageDescribe;
  v9 = [(HDCloudSyncPipelineStage *)&v13 initWithConfiguration:a3 cloudState:a4];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    id respositoryDescriptionHandler = v9->_respositoryDescriptionHandler;
    v9->_id respositoryDescriptionHandler = (id)v10;
  }
  return v9;
}

- (void)main
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = [(HDCloudSyncOperation *)self configuration];
  v4 = [v3 repository];

  v5 = [(HDCloudSyncOperation *)self configuration];
  uint64_t v6 = [v5 cachedCloudState];
  id v33 = 0;
  v7 = [v6 zonesByIdentifierWithError:&v33];
  id v8 = v33;

  if (!v7)
  {
    objc_super v13 = self;
    id v14 = v8;
    goto LABEL_6;
  }
  v9 = [v4 primaryCKContainer];

  if (v9)
  {
    uint64_t v10 = [v4 primaryCKContainer];
    uint64_t v11 = -[HDCloudSyncPipelineStageDescribe _cloudSyncDescriptionForContainer:zonesByIdentifier:error:](self, v10, v7);
    id v12 = v8;

    if (!v11)
    {
      objc_super v13 = self;
      id v14 = v12;
LABEL_6:
      [(HDCloudSyncOperation *)v13 finishWithSuccess:0 error:v14];
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  v27 = (void *)v11;
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v28 = v4;
  v16 = [v4 secondaryCKContainers];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = -[HDCloudSyncPipelineStageDescribe _cloudSyncDescriptionForContainer:zonesByIdentifier:error:](self, *(void **)(*((void *)&v29 + 1) + 8 * i), v7);
        id v22 = v8;

        if (!v21)
        {
          [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v22];
          v25 = v27;
          v4 = v28;
          goto LABEL_18;
        }
        [v15 addObject:v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }

  id v23 = objc_alloc(MEMORY[0x1E4F2AD60]);
  v4 = v28;
  v24 = [v28 syncCircleIdentifier];
  v25 = v27;
  v16 = (void *)[v23 initWithIdentifier:v24 primaryContainerDescription:v27 secondaryContainerDescriptions:v15];

  (*((void (**)(void))self->_respositoryDescriptionHandler + 2))();
  id respositoryDescriptionHandler = self->_respositoryDescriptionHandler;
  self->_id respositoryDescriptionHandler = 0;

  [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
LABEL_18:

LABEL_19:
}

- (id)_cloudSyncDescriptionForContainer:(void *)a1 zonesByIdentifier:(void *)a2 error:(void *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v34 = v5;
  if (a1)
  {
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __94__HDCloudSyncPipelineStageDescribe__cloudSyncDescriptionForContainer_zonesByIdentifier_error___block_invoke;
    v37[3] = &unk_1E62F5068;
    id v7 = v5;
    id v38 = v7;
    id v8 = objc_msgSend(v6, "hk_filter:", v37);
    v9 = [v8 allKeys];

    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __94__HDCloudSyncPipelineStageDescribe__cloudSyncDescriptionForContainer_zonesByIdentifier_error___block_invoke_2;
    v35[3] = &unk_1E62F5068;
    id v10 = v7;
    id v36 = v10;
    uint64_t v11 = objc_msgSend(v6, "hk_filter:", v35);
    id v12 = [v11 allKeys];

    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v9 count])
    {
      id v14 = -[HDCloudSyncPipelineStageDescribe _cloudSyncZoneDescriptionsForZoneIdentifiers:zonesByIdentifier:](a1, v9, v6);
      id v15 = objc_alloc(MEMORY[0x1E4F2AD30]);
      v16 = HDCKDatabaseScopeToString(2);
      uint64_t v17 = (void *)[v15 initWithScope:v16 zoneDescriptions:v14];

      [v13 addObject:v17];
    }
    if ([v12 count])
    {
      uint64_t v18 = -[HDCloudSyncPipelineStageDescribe _cloudSyncZoneDescriptionsForZoneIdentifiers:zonesByIdentifier:](a1, v12, v6);
      id v19 = objc_alloc(MEMORY[0x1E4F2AD30]);
      v20 = HDCKDatabaseScopeToString(3);
      v21 = (void *)[v19 initWithScope:v20 zoneDescriptions:v18];

      [v13 addObject:v21];
    }
    id v22 = [a1 profile];
    id v23 = [v22 cloudSyncManager];
    v24 = [v23 ownerIdentifierManager];
    v25 = [v24 cachedOwnerIdentifierForContainer:v10];

    if (!v25)
    {
      _HKInitializeLogging();
      v26 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v40 = v10;
        _os_log_error_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_ERROR, "Owner identifier not found for container %{public}@.", buf, 0xCu);
      }
    }
    id v27 = objc_alloc(MEMORY[0x1E4F2AD20]);
    v28 = [v10 containerIdentifier];
    uint64_t v29 = [v25 string];
    long long v30 = (void *)v29;
    if (v29) {
      long long v31 = (__CFString *)v29;
    }
    else {
      long long v31 = @"Not Found";
    }
    long long v32 = (void *)[v27 initWithContainerIdentifier:v28 deviceIdentifier:v31 databaseDescriptions:v13];
  }
  else
  {
    long long v32 = 0;
  }

  return v32;
}

BOOL __94__HDCloudSyncPipelineStageDescribe__cloudSyncDescriptionForContainer_zonesByIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 containerIdentifier];
  id v5 = [*(id *)(a1 + 32) containerIdentifier];
  if ([v4 isEqualToString:v5]) {
    BOOL v6 = [v3 scope] == 2;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

BOOL __94__HDCloudSyncPipelineStageDescribe__cloudSyncDescriptionForContainer_zonesByIdentifier_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 containerIdentifier];
  id v5 = [*(id *)(a1 + 32) containerIdentifier];
  if ([v4 isEqualToString:v5]) {
    BOOL v6 = [v3 scope] == 3;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_cloudSyncZoneDescriptionsForZoneIdentifiers:(void *)a3 zonesByIdentifier:
{
  uint64_t v292 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v206 = a3;
  id v204 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v258 = 0u;
  long long v259 = 0u;
  long long v260 = 0u;
  long long v261 = 0u;
  obuint64_t j = v4;
  uint64_t v207 = [obj countByEnumeratingWithState:&v258 objects:v271 count:16];
  if (v207)
  {
    uint64_t v205 = *(void *)v259;
    id v5 = off_1E62EF000;
    do
    {
      for (uint64_t i = 0; i != v207; ++i)
      {
        if (*(void *)v259 != v205) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v258 + 1) + 8 * i);
        uint64_t v8 = [v206 objectForKeyedSubscript:v7];
        v211 = (void *)v8;
        if (v8)
        {
          v9 = (void *)v8;
          uint64_t v210 = i;
          id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          id v11 = objc_alloc(MEMORY[0x1E4F2AD58]);
          id v12 = [v7 zoneIdentifier];
          id v13 = [v12 zoneName];
          v209 = v7;
          id v14 = [v7 zoneIdentifier];
          id v15 = [v14 ownerName];
          v208 = (void *)[v11 initWithZoneName:v13 ownerName:v15];

          id v257 = 0;
          id v16 = v9;
          uint64_t v17 = [v16 recordsForClass:objc_opt_class() error:&v257];
          v212 = v10;
          if (v17)
          {
            uint64_t v18 = [v16 recordsForClass:objc_opt_class() error:&v257];
            if (v18)
            {
              id v19 = [v16 recordsForClass:objc_opt_class() error:&v257];
              if (v19)
              {
                v20 = [v16 recordsForClass:objc_opt_class() error:&v257];
                if (v20)
                {
                  id v201 = v20;
                  v21 = [v16 recordsForClass:objc_opt_class() error:&v257];
                  if (v21)
                  {
                    id v196 = v16;
                    v198 = v21;
                    id v230 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                    long long v262 = 0u;
                    long long v263 = 0u;
                    long long v264 = 0u;
                    long long v265 = 0u;
                    v195 = v17;
                    id v22 = v17;
                    uint64_t v23 = [v22 countByEnumeratingWithState:&v262 objects:&v272 count:16];
                    if (v23)
                    {
                      uint64_t v24 = v23;
                      uint64_t v25 = *(void *)v263;
                      do
                      {
                        for (uint64_t j = 0; j != v24; ++j)
                        {
                          if (*(void *)v263 != v25) {
                            objc_enumerationMutation(v22);
                          }
                          id v27 = v5[133];
                          id v28 = *(id *)(*((void *)&v262 + 1) + 8 * j);
                          uint64_t v29 = [(__objc2_class *)v27 recordType];
                          long long v30 = -[HDCloudSyncPipelineStageDescribe _createRecordDescriptionWithRecord:recordType:childRecordDescriptions:]((uint64_t)a1, v28, v29, 0);

                          [v230 addObject:v30];
                        }
                        uint64_t v24 = [v22 countByEnumeratingWithState:&v262 objects:&v272 count:16];
                      }
                      while (v24);
                    }

                    v194 = v18;
                    id v31 = v18;
                    v193 = v19;
                    id v32 = v19;
                    id v223 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                    long long v287 = 0u;
                    long long v288 = 0u;
                    long long v289 = 0u;
                    long long v290 = 0u;
                    id v213 = v31;
                    v234 = (char *)[v213 countByEnumeratingWithState:&v287 objects:buf count:16];
                    if (v234)
                    {
                      uint64_t v218 = *(void *)v288;
                      do
                      {
                        id v33 = 0;
                        do
                        {
                          if (*(void *)v288 != v218) {
                            objc_enumerationMutation(v213);
                          }
                          v241 = v33;
                          id v34 = *(id *)(*((void *)&v287 + 1) + 8 * (void)v33);
                          id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                          long long v283 = 0u;
                          long long v284 = 0u;
                          long long v285 = 0u;
                          long long v286 = 0u;
                          v238 = v34;
                          id v245 = [v34 orderedSequenceRecords];
                          uint64_t v36 = [v245 countByEnumeratingWithState:&v283 objects:&v279 count:16];
                          if (v36)
                          {
                            uint64_t v37 = v36;
                            uint64_t v38 = *(void *)v284;
                            do
                            {
                              for (uint64_t k = 0; k != v37; ++k)
                              {
                                if (*(void *)v284 != v38) {
                                  objc_enumerationMutation(v245);
                                }
                                id v40 = *(void **)(*((void *)&v283 + 1) + 8 * k);
                                uint64_t v266 = MEMORY[0x1E4F143A8];
                                uint64_t v267 = 3221225472;
                                v268 = __94__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForStoreRecords_changeRecords___block_invoke;
                                v269 = &unk_1E62F50B8;
                                v270 = v40;
                                uint64_t v41 = objc_msgSend(v32, "hk_firstObjectPassingTest:", &v266);
                                if (v41)
                                {
                                  v42 = +[HDCloudSyncChangeRecord recordType];
                                  v43 = -[HDCloudSyncPipelineStageDescribe _createRecordDescriptionWithRecord:recordType:childRecordDescriptions:]((uint64_t)a1, v41, v42, 0);
                                }
                                else
                                {
                                  v43 = 0;
                                }
                                v44 = +[HDCloudSyncSequenceRecord recordType];
                                if (v43)
                                {
                                  v278 = v43;
                                  v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v278 count:1];
                                  v46 = -[HDCloudSyncPipelineStageDescribe _createRecordDescriptionWithRecord:recordType:childRecordDescriptions:]((uint64_t)a1, v40, v44, v45);
                                }
                                else
                                {
                                  v46 = -[HDCloudSyncPipelineStageDescribe _createRecordDescriptionWithRecord:recordType:childRecordDescriptions:]((uint64_t)a1, v40, v44, 0);
                                }

                                [v35 addObject:v46];
                              }
                              uint64_t v37 = [v245 countByEnumeratingWithState:&v283 objects:&v279 count:16];
                            }
                            while (v37);
                          }

                          v47 = +[HDCloudSyncStoreRecord recordType];
                          v48 = -[HDCloudSyncPipelineStageDescribe _createRecordDescriptionWithRecord:recordType:childRecordDescriptions:]((uint64_t)a1, v238, v47, v35);

                          [v223 addObject:v48];
                          id v33 = v241 + 1;
                        }
                        while (v241 + 1 != v234);
                        v234 = (char *)[v213 countByEnumeratingWithState:&v287 objects:buf count:16];
                      }
                      while (v234);
                    }

                    uint64_t v49 = [v223 copy];
                    v224 = (void *)v49;
                    [v230 addObjectsFromArray:v49];
                    id v50 = v201;
                    id v242 = v198;
                    id v246 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                    long long v287 = 0u;
                    long long v288 = 0u;
                    long long v289 = 0u;
                    long long v290 = 0u;
                    id v235 = v50;
                    uint64_t v51 = [v235 countByEnumeratingWithState:&v287 objects:buf count:16];
                    if (v51)
                    {
                      uint64_t v52 = v51;
                      uint64_t v239 = *(void *)v288;
                      do
                      {
                        for (uint64_t m = 0; m != v52; ++m)
                        {
                          if (*(void *)v288 != v239) {
                            objc_enumerationMutation(v235);
                          }
                          v54 = *(void **)(*((void *)&v287 + 1) + 8 * m);
                          uint64_t v266 = MEMORY[0x1E4F143A8];
                          uint64_t v267 = 3221225472;
                          v268 = __110__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForDeviceContextRecords_deviceKeyValueRecords___block_invoke;
                          v269 = &unk_1E62F5090;
                          v270 = v54;
                          v55 = objc_msgSend(v242, "hk_map:", &v266);
                          id v56 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                          long long v283 = 0u;
                          long long v284 = 0u;
                          long long v285 = 0u;
                          long long v286 = 0u;
                          id v57 = v55;
                          uint64_t v58 = [v57 countByEnumeratingWithState:&v283 objects:&v279 count:16];
                          if (v58)
                          {
                            uint64_t v59 = v58;
                            uint64_t v60 = *(void *)v284;
                            do
                            {
                              for (uint64_t n = 0; n != v59; ++n)
                              {
                                if (*(void *)v284 != v60) {
                                  objc_enumerationMutation(v57);
                                }
                                v62 = *(void **)(*((void *)&v283 + 1) + 8 * n);
                                v63 = +[HDCloudSyncDeviceKeyValueRecord recordType];
                                v64 = -[HDCloudSyncPipelineStageDescribe _createRecordDescriptionWithRecord:recordType:childRecordDescriptions:]((uint64_t)a1, v62, v63, 0);
                                [v56 addObject:v64];
                              }
                              uint64_t v59 = [v57 countByEnumeratingWithState:&v283 objects:&v279 count:16];
                            }
                            while (v59);
                          }

                          v65 = +[HDCloudSyncDeviceContextRecord recordType];
                          if ([v57 count]) {
                            v66 = v56;
                          }
                          else {
                            v66 = 0;
                          }
                          v67 = -[HDCloudSyncPipelineStageDescribe _createRecordDescriptionWithRecord:recordType:childRecordDescriptions:]((uint64_t)a1, v54, v65, v66);
                          [v246 addObject:v67];
                        }
                        uint64_t v52 = [v235 countByEnumeratingWithState:&v287 objects:buf count:16];
                      }
                      while (v52);
                    }

                    [v230 addObjectsFromArray:v246];
                    uint64_t v68 = [v230 copy];

                    id v10 = v212;
                    id v16 = v196;
                    v21 = v198;
                    uint64_t v18 = v194;
                    uint64_t v17 = v195;
                    id v19 = v193;
                  }
                  else
                  {
                    uint64_t v68 = 0;
                  }

                  v20 = v201;
                }
                else
                {
                  uint64_t v68 = 0;
                }
              }
              else
              {
                uint64_t v68 = 0;
              }
            }
            else
            {
              uint64_t v68 = 0;
            }
          }
          else
          {
            uint64_t v68 = 0;
          }

          id v70 = v257;
          v240 = (void *)v68;
          if (v68)
          {
            [v10 addObjectsFromArray:v68];
          }
          else
          {
            _HKInitializeLogging();
            v71 = *MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v70;
              _os_log_error_impl(&dword_1BCB7D000, v71, OS_LOG_TYPE_ERROR, "Failed to create sync record descriptions %{public}@", buf, 0xCu);
            }
          }
          id v256 = v70;
          id v72 = v16;
          v73 = [v72 recordsForClass:objc_opt_class() error:&v256];
          if (v73)
          {
            id v247 = [v72 recordsForClass:objc_opt_class() error:&v256];
            if (v247)
            {
              id v231 = v72;
              id v236 = v70;
              id v74 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              long long v279 = 0u;
              long long v280 = 0u;
              long long v281 = 0u;
              long long v282 = 0u;
              v225 = v73;
              id v243 = v73;
              uint64_t v75 = [v243 countByEnumeratingWithState:&v279 objects:buf count:16];
              if (v75)
              {
                uint64_t v76 = v75;
                uint64_t v77 = *(void *)v280;
                do
                {
                  for (iuint64_t i = 0; ii != v76; ++ii)
                  {
                    if (*(void *)v280 != v77) {
                      objc_enumerationMutation(v243);
                    }
                    id v79 = *(id *)(*((void *)&v279 + 1) + 8 * ii);
                    id v272 = (id)MEMORY[0x1E4F143A8];
                    uint64_t v273 = 3221225472;
                    v274 = __102__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForRelationshipRecordTypeInZone_error___block_invoke;
                    v275 = &unk_1E62F50B8;
                    id v80 = v79;
                    id v276 = v80;
                    v81 = objc_msgSend(v247, "hk_firstObjectPassingTest:", &v272);
                    if (v81)
                    {
                      v82 = +[HDCloudSyncSharedSummaryAuthorizationRecord recordType];
                      v83 = -[HDCloudSyncPipelineStageDescribe _createRecordDescriptionWithRecord:recordType:childRecordDescriptions:]((uint64_t)a1, v81, v82, 0);
                    }
                    else
                    {
                      v83 = 0;
                    }
                    v84 = +[HDCloudSyncSharedSummaryParticipantRecord recordType];
                    if (v83)
                    {
                      *(void *)&long long v287 = v83;
                      [MEMORY[0x1E4F1C978] arrayWithObjects:&v287 count:1];
                      v86 = id v85 = v74;
                      v87 = -[HDCloudSyncPipelineStageDescribe _createRecordDescriptionWithRecord:recordType:childRecordDescriptions:]((uint64_t)a1, v80, v84, v86);

                      id v74 = v85;
                    }
                    else
                    {
                      v87 = -[HDCloudSyncPipelineStageDescribe _createRecordDescriptionWithRecord:recordType:childRecordDescriptions:]((uint64_t)a1, v80, v84, 0);
                    }

                    [v74 addObject:v87];
                  }
                  uint64_t v76 = [v243 countByEnumeratingWithState:&v279 objects:buf count:16];
                }
                while (v76);
              }

              id v10 = v212;
              id v72 = v231;
              id v70 = v236;
              v73 = v225;
            }
            else
            {
              id v74 = 0;
            }
          }
          else
          {
            id v74 = 0;
          }

          id v88 = v256;
          id v244 = v74;
          if (v74)
          {
            [v10 addObjectsFromArray:v74];
          }
          else
          {
            _HKInitializeLogging();
            v89 = *MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v88;
              _os_log_error_impl(&dword_1BCB7D000, v89, OS_LOG_TYPE_ERROR, "Failed to create relationship record descriptions %{public}@", buf, 0xCu);
            }
          }
          id v248 = v88;
          id v255 = v88;
          id v90 = v72;
          v91 = +[HDCloudSyncDataUploadRequestRecord recordType];
          *(void *)&long long v283 = v91;
          *(void *)&long long v287 = objc_opt_class();
          v92 = +[HDCloudSyncMasterRecord recordType];
          *((void *)&v283 + 1) = v92;
          *((void *)&v287 + 1) = objc_opt_class();
          v93 = +[HDCloudSyncMedicalIDRecord recordType];
          *(void *)&long long v284 = v93;
          *(void *)&long long v288 = objc_opt_class();
          v94 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v287 forKeys:&v283 count:3];

          id v95 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v279 = 0u;
          long long v280 = 0u;
          long long v281 = 0u;
          long long v282 = 0u;
          v96 = [v94 allKeys];
          uint64_t v97 = [v96 countByEnumeratingWithState:&v279 objects:buf count:16];
          if (v97)
          {
            uint64_t v98 = v97;
            uint64_t v99 = *(void *)v280;
            while (2)
            {
              for (juint64_t j = 0; jj != v98; ++jj)
              {
                if (*(void *)v280 != v99) {
                  objc_enumerationMutation(v96);
                }
                uint64_t v101 = *(void *)(*((void *)&v279 + 1) + 8 * jj);
                v102 = objc_msgSend(v90, "recordsForClass:error:", objc_msgSend(v94, "objectForKeyedSubscript:", v101), &v255);
                if (!v102)
                {

                  uint64_t v105 = 0;
                  goto LABEL_105;
                }
                v103 = v102;
                id v272 = (id)MEMORY[0x1E4F143A8];
                uint64_t v273 = 3221225472;
                v274 = __98__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForIndependentRecordsInZone_error___block_invoke;
                v275 = &unk_1E62F5178;
                id v276 = a1;
                uint64_t v277 = v101;
                v104 = objc_msgSend(v102, "hk_map:", &v272);
                [v95 addObjectsFromArray:v104];
              }
              uint64_t v98 = [v96 countByEnumeratingWithState:&v279 objects:buf count:16];
              if (v98) {
                continue;
              }
              break;
            }
          }

          uint64_t v105 = [v95 copy];
LABEL_105:

          id v106 = v255;
          id v5 = off_1E62EF000;
          if (v105)
          {
            [v212 addObjectsFromArray:v105];
          }
          else
          {
            _HKInitializeLogging();
            v107 = *MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v106;
              _os_log_error_impl(&dword_1BCB7D000, v107, OS_LOG_TYPE_ERROR, "Failed to create independent record descriptions %{public}@", buf, 0xCu);
            }
          }
          id v254 = v106;
          id v108 = v90;
          v109 = [v108 recordsForClass:objc_opt_class() error:&v254];
          id v237 = (id)v105;
          if (v109)
          {
            v110 = [v108 recordsForClass:objc_opt_class() error:&v254];
            if (v110)
            {
              id v226 = v108;
              id v232 = v106;
              id v214 = v110;
              v111 = objc_msgSend(v110, "hk_map:", &__block_literal_global_17);
              id v112 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              long long v279 = 0u;
              long long v280 = 0u;
              long long v281 = 0u;
              long long v282 = 0u;
              v219 = v109;
              id v249 = v109;
              uint64_t v113 = [v249 countByEnumeratingWithState:&v279 objects:buf count:16];
              if (v113)
              {
                uint64_t v114 = v113;
                uint64_t v115 = *(void *)v280;
                do
                {
                  for (kuint64_t k = 0; kk != v114; ++kk)
                  {
                    if (*(void *)v280 != v115) {
                      objc_enumerationMutation(v249);
                    }
                    id v117 = *(id *)(*((void *)&v279 + 1) + 8 * kk);
                    id v272 = (id)MEMORY[0x1E4F143A8];
                    uint64_t v273 = 3221225472;
                    v274 = __101__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForTransactionRecordTypeInZone_error___block_invoke_2;
                    v275 = &unk_1E62F5100;
                    id v276 = v117;
                    id v118 = v117;
                    v119 = objc_msgSend(v111, "hk_filter:", &v272);
                    *(void *)&long long v287 = MEMORY[0x1E4F143A8];
                    *((void *)&v287 + 1) = 3221225472;
                    *(void *)&long long v288 = __101__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForTransactionRecordTypeInZone_error___block_invoke_3;
                    *((void *)&v288 + 1) = &unk_1E62F5128;
                    *(void *)&long long v289 = a1;
                    v120 = objc_msgSend(v119, "hk_map:", &v287);
                    v121 = +[HDCloudSyncSharedSummaryTransactionRecord recordType];
                    v122 = -[HDCloudSyncPipelineStageDescribe _createRecordDescriptionWithRecord:recordType:childRecordDescriptions:]((uint64_t)a1, v118, v121, v120);

                    [v112 addObject:v122];
                  }
                  uint64_t v114 = [v249 countByEnumeratingWithState:&v279 objects:buf count:16];
                }
                while (v114);
              }

              uint64_t v123 = [v112 copy];
              id v5 = off_1E62EF000;
              id v108 = v226;
              id v106 = v232;
              v110 = v214;
              v109 = v219;
            }
            else
            {
              uint64_t v123 = 0;
            }
          }
          else
          {
            uint64_t v123 = 0;
          }

          id v124 = v254;
          v233 = (void *)v123;
          if (v123)
          {
            [v212 addObjectsFromArray:v123];
          }
          else
          {
            _HKInitializeLogging();
            v125 = *MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v124;
              _os_log_error_impl(&dword_1BCB7D000, v125, OS_LOG_TYPE_ERROR, "Failed to create transaction record descriptions %{public}@", buf, 0xCu);
            }
          }
          id v253 = v124;
          id v126 = v108;
          v127 = [v126 recordsForClass:objc_opt_class() error:&v253];
          if (v127)
          {
            v128 = [v126 recordsForClass:objc_opt_class() error:&v253];
            if (v128)
            {
              v129 = [v126 recordsForClass:objc_opt_class() error:&v253];
              if (v129)
              {
                uint64_t v130 = [v126 recordsForClass:objc_opt_class() error:&v253];
                v131 = (void *)v130;
                if (v130)
                {
                  v199 = (void *)v130;
                  id v220 = v124;
                  id v227 = v126;
                  id v132 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  id v272 = (id)MEMORY[0x1E4F143A8];
                  uint64_t v273 = 3221225472;
                  v274 = __100__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForAttachmentRecordTypeInZone_error___block_invoke;
                  v275 = &unk_1E62F5090;
                  id v276 = a1;
                  id v215 = v127;
                  v197 = objc_msgSend(v127, "hk_map:", &v272);
                  objc_msgSend(v132, "addObjectsFromArray:");
                  long long v281 = 0u;
                  long long v282 = 0u;
                  long long v279 = 0u;
                  long long v280 = 0u;
                  id v202 = v128;
                  id v250 = v128;
                  uint64_t v133 = [v250 countByEnumeratingWithState:&v279 objects:buf count:16];
                  if (v133)
                  {
                    uint64_t v134 = v133;
                    uint64_t v135 = *(void *)v280;
                    do
                    {
                      for (muint64_t m = 0; mm != v134; ++mm)
                      {
                        if (*(void *)v280 != v135) {
                          objc_enumerationMutation(v250);
                        }
                        id v137 = *(id *)(*((void *)&v279 + 1) + 8 * mm);
                        *(void *)&long long v287 = MEMORY[0x1E4F143A8];
                        *((void *)&v287 + 1) = 3221225472;
                        *(void *)&long long v288 = __100__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForAttachmentRecordTypeInZone_error___block_invoke_2;
                        *((void *)&v288 + 1) = &unk_1E62F5090;
                        *(void *)&long long v289 = v137;
                        id v138 = v137;
                        v139 = objc_msgSend(v129, "hk_map:", &v287);
                        *(void *)&long long v283 = MEMORY[0x1E4F143A8];
                        *((void *)&v283 + 1) = 3221225472;
                        *(void *)&long long v284 = __100__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForAttachmentRecordTypeInZone_error___block_invoke_3;
                        *((void *)&v284 + 1) = &unk_1E62F5150;
                        *(void *)&long long v285 = a1;
                        v140 = objc_msgSend(v139, "hk_map:", &v283);
                        v141 = +[HDCloudSyncAttachmentRecord recordType];
                        v142 = -[HDCloudSyncPipelineStageDescribe _createRecordDescriptionWithRecord:recordType:childRecordDescriptions:]((uint64_t)a1, v138, v141, v140);

                        [v132 addObject:v142];
                      }
                      uint64_t v134 = [v250 countByEnumeratingWithState:&v279 objects:buf count:16];
                    }
                    while (v134);
                  }

                  *(void *)&long long v262 = MEMORY[0x1E4F143A8];
                  *((void *)&v262 + 1) = 3221225472;
                  *(void *)&long long v263 = __100__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForAttachmentRecordTypeInZone_error___block_invoke_4;
                  *((void *)&v263 + 1) = &unk_1E62F5090;
                  *(void *)&long long v264 = a1;
                  v131 = v199;
                  v143 = objc_msgSend(v199, "hk_map:", &v262);
                  [v132 addObjectsFromArray:v143];
                  uint64_t v144 = [v132 copy];

                  id v5 = off_1E62EF000;
                  id v124 = v220;
                  id v126 = v227;
                  v127 = v215;
                  v128 = v202;
                }
                else
                {
                  uint64_t v144 = 0;
                }
              }
              else
              {
                uint64_t v144 = 0;
              }
            }
            else
            {
              uint64_t v144 = 0;
            }
          }
          else
          {
            uint64_t v144 = 0;
          }

          id v145 = v253;
          id v251 = (id)v144;
          if (v144)
          {
            [v212 addObjectsFromArray:v144];
          }
          else
          {
            _HKInitializeLogging();
            v146 = *MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v145;
              _os_log_error_impl(&dword_1BCB7D000, v146, OS_LOG_TYPE_ERROR, "Failed to create attachment record descriptions %{public}@", buf, 0xCu);
            }
          }
          *(void *)buf = 0;
          v147 = [v126 zoneShareWithError:buf];
          id v148 = *(id *)buf;
          v149 = v148;
          if (v147 || !v148)
          {
            id v228 = v126;
            v152 = NSString;
            v153 = [v147 owner];
            v154 = [v153 userIdentity];
            objc_msgSend(v152, "stringWithFormat:", @"%ld", objc_msgSend(v154, "hash"));
            id v216 = (id)objc_claimAutoreleasedReturnValue();

            id v155 = objc_alloc(MEMORY[0x1E4F2AD70]);
            v221 = [v147 owner];
            v156 = HDCKRoleToString([v221 role]);
            v157 = [v147 owner];
            v158 = HDCKAcceptanceStatusToString([v157 acceptanceStatus]);
            [v147 owner];
            v160 = id v159 = v145;
            v161 = HDCKPermissionToString([v160 permission]);
            v162 = v155;
            id v126 = v228;
            v151 = (void *)[v162 initWithIdentity:v216 role:v156 acceptanceStatus:v158 permission:v161];

            id v145 = v159;
            id v5 = off_1E62EF000;

            id v150 = v159;
          }
          else
          {
            id v150 = v148;
            v151 = 0;
          }

          id v163 = v150;
          if (!v151)
          {
            if (v163)
            {
              _HKInitializeLogging();
              v164 = *MEMORY[0x1E4F29FA8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = v163;
                _os_log_error_impl(&dword_1BCB7D000, v164, OS_LOG_TYPE_ERROR, "Failed to fetch owner participant description with error %{public}@", buf, 0xCu);
              }
            }
          }
          id v272 = 0;
          v165 = [v126 zoneShareWithError:&v272];
          id v166 = v272;
          if (v165 || !v166)
          {
            id v203 = v166;
            id v222 = v163;
            v229 = v151;
            id v170 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            long long v279 = 0u;
            long long v280 = 0u;
            long long v281 = 0u;
            long long v282 = 0u;
            id v217 = v165;
            v171 = [v165 allParticipants];
            uint64_t v172 = [v171 countByEnumeratingWithState:&v279 objects:buf count:16];
            if (v172)
            {
              uint64_t v173 = v172;
              uint64_t v174 = *(void *)v280;
              do
              {
                for (nuint64_t n = 0; nn != v173; ++nn)
                {
                  if (*(void *)v280 != v174) {
                    objc_enumerationMutation(v171);
                  }
                  v176 = *(void **)(*((void *)&v279 + 1) + 8 * nn);
                  if ([v176 role] != 1)
                  {
                    v177 = NSString;
                    v178 = [v176 userIdentity];
                    v179 = objc_msgSend(v177, "stringWithFormat:", @"%ld", objc_msgSend(v178, "hash"));

                    id v180 = objc_alloc(MEMORY[0x1E4F2AD70]);
                    v181 = HDCKRoleToString([v176 role]);
                    v182 = HDCKAcceptanceStatusToString([v176 acceptanceStatus]);
                    v183 = HDCKPermissionToString([v176 permission]);
                    v184 = (void *)[v180 initWithIdentity:v179 role:v181 acceptanceStatus:v182 permission:v183];

                    [v170 addObject:v184];
                  }
                }
                uint64_t v173 = [v171 countByEnumeratingWithState:&v279 objects:buf count:16];
              }
              while (v173);
            }

            if ([v170 count]) {
              v185 = v170;
            }
            else {
              v185 = 0;
            }
            id v169 = v185;

            id v163 = v222;
            v151 = v229;
            id v168 = v222;
            id v5 = off_1E62EF000;
            v165 = v217;
            v167 = v203;
          }
          else
          {
            v167 = v166;
            id v168 = v166;
            id v169 = 0;
          }

          id v186 = v168;
          if (!v169)
          {
            if (v186)
            {
              _HKInitializeLogging();
              v187 = *MEMORY[0x1E4F29FA8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = v186;
                _os_log_error_impl(&dword_1BCB7D000, v187, OS_LOG_TYPE_ERROR, "Failed to fetch other participant descriptions with error %{public}@", buf, 0xCu);
              }
            }
          }
          id v188 = objc_alloc(MEMORY[0x1E4F2AD80]);
          v189 = HDCloudSyncZoneTypeToString([v209 type]);
          v190 = (void *)[v188 initWithZoneIDDescription:v208 type:v189 ownerParticipantDescription:v151 otherParticipantsDescription:v169 recordDescriptions:v212];

          [v204 addObject:v190];
          uint64_t i = v210;
        }
        else
        {
          _HKInitializeLogging();
          v69 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v7;
            _os_log_error_impl(&dword_1BCB7D000, v69, OS_LOG_TYPE_ERROR, "Zone not found %{public}@", buf, 0xCu);
          }
        }
      }
      uint64_t v207 = [obj countByEnumeratingWithState:&v258 objects:v271 count:16];
    }
    while (v207);
  }

  v191 = (void *)[v204 copy];

  return v191;
}

- (id)_createRecordDescriptionWithRecord:(void *)a3 recordType:(void *)a4 childRecordDescriptions:
{
  if (a1)
  {
    BOOL v6 = (objc_class *)MEMORY[0x1E4F2AD50];
    id v7 = a4;
    id v8 = a3;
    id v9 = a2;
    id v10 = [v6 alloc];
    id v11 = [v9 recordID];
    id v12 = [v11 recordName];
    id v13 = (void *)[v10 initWithRecordName:v12];

    id v14 = objc_alloc(MEMORY[0x1E4F2AD48]);
    id v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "schemaVersion"));
    id v16 = [v9 record];
    uint64_t v17 = [v16 modificationDate];
    uint64_t v18 = [v9 printDescription];

    id v19 = (void *)[v14 initWithRecordIDDescription:v13 recordType:v8 schemaVersion:v15 modificationDate:v17 detailedDescription:v18 childRecordDescriptions:v7];
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

id __110__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForDeviceContextRecords_deviceKeyValueRecords___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v11 = 0;
  id v5 = [v4 deviceContext:&v11];
  if (v5)
  {
    BOOL v6 = [v3 syncIdentity];
    id v7 = [v5 syncIdentity];
    if ([v6 isEqual:v7]) {
      id v8 = v3;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

uint64_t __94__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForStoreRecords_changeRecords___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 sequenceRecordID];
  id v4 = [*(id *)(a1 + 32) recordID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t __102__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForRelationshipRecordTypeInZone_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 UUID];
  id v4 = [*(id *)(a1 + 32) authorizationRecordIdentifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

id __101__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForTransactionRecordTypeInZone_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

uint64_t __101__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForTransactionRecordTypeInZone_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 summaryIdentifiers];
  uint64_t v5 = [v3 UUID];

  uint64_t v6 = [v4 containsObject:v5];
  return v6;
}

id __101__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForTransactionRecordTypeInZone_error___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = +[HDCloudSyncSharedSummaryRecord recordType];
  uint64_t v5 = -[HDCloudSyncPipelineStageDescribe _createRecordDescriptionWithRecord:recordType:childRecordDescriptions:](v2, v3, v4, 0);

  return v5;
}

id __100__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForAttachmentRecordTypeInZone_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = +[HDCloudSyncAttachmentReferenceRecord recordType];
  uint64_t v5 = -[HDCloudSyncPipelineStageDescribe _createRecordDescriptionWithRecord:recordType:childRecordDescriptions:](v2, v3, v4, 0);

  return v5;
}

id __100__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForAttachmentRecordTypeInZone_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) attachmentIdentifier];
  uint64_t v5 = [v3 attachmentIdentifier];
  int v6 = [v4 isEqualToString:v5];

  if (v6) {
    id v7 = v3;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

id __100__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForAttachmentRecordTypeInZone_error___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = +[HDCloudSyncAttachmentReferenceRecord recordType];
  uint64_t v5 = -[HDCloudSyncPipelineStageDescribe _createRecordDescriptionWithRecord:recordType:childRecordDescriptions:](v2, v3, v4, 0);

  return v5;
}

id __100__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForAttachmentRecordTypeInZone_error___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = +[HDCloudSyncAttachmentReferenceTombstoneRecord recordType];
  uint64_t v5 = -[HDCloudSyncPipelineStageDescribe _createRecordDescriptionWithRecord:recordType:childRecordDescriptions:](v2, v3, v4, 0);

  return v5;
}

id __98__HDCloudSyncPipelineStageDescribe__cloudSyncRecordDescriptionsForIndependentRecordsInZone_error___block_invoke(uint64_t a1, void *a2)
{
  return -[HDCloudSyncPipelineStageDescribe _createRecordDescriptionWithRecord:recordType:childRecordDescriptions:](*(void *)(a1 + 32), a2, *(void **)(a1 + 40), 0);
}

- (void).cxx_destruct
{
}

@end