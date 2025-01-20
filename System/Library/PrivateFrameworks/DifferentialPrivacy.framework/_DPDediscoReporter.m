@interface _DPDediscoReporter
+ (id)filterNonConformingDediscoRecordsFrom:(id)a3;
- (BOOL)markSubmitted:(id)a3 storage:(id)a4;
- (BOOL)reportDediscoKeys:(id)a3 storage:(id)a4;
- (BOOL)reportDediscoRecords:(id)a3;
- (id)directlyUploadDediscoRecords:(id)a3 forKey:(id)a4 keyProperties:(id)a5 storage:(id)a6;
- (id)reportToDediscoRecords:(id)a3 forKey:(id)a4 keyProperties:(id)a5 storage:(id)a6;
- (void)scheduleMaintenanceWithName:(id)a3 database:(id)a4;
@end

@implementation _DPDediscoReporter

- (BOOL)reportDediscoRecords:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  if (!v36) {
    goto LABEL_36;
  }
  v5 = +[_DPLog daemon];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_DPDediscoReporter reportDediscoRecords:].cold.4(a2);
  }

  if (!+[_DPDeviceInfo isDataCollectionEnabled])
  {
    v6 = +[_DPLog daemon];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[_DPDediscoReporter reportDediscoRecords:](a2);
    }
    goto LABEL_35;
  }
  if (+[_DPDeviceInfo isDisabledByTaskingForDedisco])
  {
    v6 = +[_DPLog daemon];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[_DPDediscoReporter reportDediscoRecords:](a2);
    }
LABEL_35:

LABEL_36:
    BOOL v25 = 0;
    goto LABEL_37;
  }
  v28 = (void *)MEMORY[0x1E019F810]();
  v7 = +[_DPKeyNames keyNamesGroupedByPropertyName];
  v35 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v31 = v7;
  v27 = [v7 allKeys];
  [(id)objc_opt_class() randomizeKeys:v27 andSortByPriority:1];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v32 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v32)
  {
    uint64_t v30 = *(void *)v42;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v42 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = v8;
        uint64_t v9 = *(void *)(*((void *)&v41 + 1) + 8 * v8);
        context = (void *)MEMORY[0x1E019F810]();
        v10 = [v31 objectForKeyedSubscript:v9];
        v11 = (void *)[v10 mutableCopy];

        v12 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v13 = v11;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v38;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v38 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void *)(*((void *)&v37 + 1) + 8 * i);
              v19 = +[_DPKeyNames keyPropertiesForKey:v18];
              if ([v19 transport] == 4 && objc_msgSend(v19, "keyPatternsAllowed"))
              {
                [v12 addObject:v18];
                v20 = [(id)objc_opt_class() queryKeysForPattern:v18 storage:v36];
                if ([v20 count])
                {
                  v21 = [(id)objc_opt_class() randomizeKeys:v20 andSortByPriority:0];
                  [v35 addObjectsFromArray:v21];
                }
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v37 objects:v45 count:16];
          }
          while (v15);
        }

        [v13 removeObjectsInArray:v12];
        v22 = (void *)[v13 copy];
        if ([v22 count])
        {
          v23 = [(id)objc_opt_class() randomizeKeys:v22 andSortByPriority:0];
          [v35 addObjectsFromArray:v23];
        }
        uint64_t v8 = v34 + 1;
      }
      while (v34 + 1 != v32);
      uint64_t v32 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v32);
  }

  BOOL v24 = [(_DPDediscoReporter *)self reportDediscoKeys:v35 storage:v36];
  if (!v24)
  {
    v6 = +[_DPLog daemon];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[_DPDediscoReporter reportDediscoRecords:](v6);
    }
    goto LABEL_35;
  }
  BOOL v25 = 1;
LABEL_37:

  return v25;
}

- (BOOL)reportDediscoKeys:(id)a3 storage:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v44 = a4;
  if (v44)
  {
    id v36 = (void *)MEMORY[0x1E019F810]();
    long long v43 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v37 = v5;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v50 objects:v61 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v51;
      uint64_t v10 = 40;
      unint64_t v11 = 0x1E6C43000uLL;
      uint64_t v38 = *(void *)v51;
      long long v39 = v6;
      do
      {
        uint64_t v12 = 0;
        uint64_t v40 = v8;
        do
        {
          if (*(void *)v51 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v13 = *(void *)(*((void *)&v50 + 1) + 8 * v12);
          uint64_t v14 = (void *)MEMORY[0x1E019F810]();
          uint64_t v15 = [*(id *)(v11 + 2144) keyPropertiesForKey:v13];
          uint64_t v16 = v15;
          if (v15 && [v15 transport] == 4)
          {
            v17 = (void *)MEMORY[0x1E019F810]();
            uint64_t v18 = [(id)objc_opt_class() queryRecordsForKey:v13 storage:v44];
            if ([v18 count])
            {
              v19 = [(id)objc_opt_class() filterNonConformingDediscoRecordsFrom:v18];
              if ([v19 count])
              {

                context = v14;
                if (v10 < [v19 count])
                {
                  uint64_t v20 = objc_msgSend(v19, "subarrayWithRange:", 0, v10);

                  v19 = (void *)v20;
                }
                v21 = +[_DPEnhancedPrivacyAlgorithm findMultipleDonationForKey:v13 inRecords:v19];
                long long v46 = 0u;
                long long v47 = 0u;
                long long v48 = 0u;
                long long v49 = 0u;
                id obj = [v21 allKeys];
                uint64_t v22 = [obj countByEnumeratingWithState:&v46 objects:v60 count:16];
                if (v22)
                {
                  uint64_t v23 = v22;
                  uint64_t v24 = *(void *)v47;
                  while (2)
                  {
                    uint64_t v25 = 0;
                    v26 = v19;
                    do
                    {
                      if (*(void *)v47 != v24) {
                        objc_enumerationMutation(obj);
                      }
                      v19 = [v21 objectForKeyedSubscript:*(void *)(*((void *)&v46 + 1) + 8 * v25)];

                      v27 = [(_DPDediscoReporter *)self directlyUploadDediscoRecords:v19 forKey:v13 keyProperties:v16 storage:v44];
                      if ([v27 count])
                      {
                        [v43 addObjectsFromArray:v27];
                        v10 -= [v27 count];
                        if (!v10)
                        {

                          goto LABEL_27;
                        }
                        if (v10 < 0)
                        {
                          uint64_t v32 = +[_DPLog daemon];
                          v29 = v43;
                          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                          {
                            uint64_t v34 = [v19 count];
                            uint64_t v35 = [v43 count];
                            *(_DWORD *)buf = 134218496;
                            uint64_t v55 = v10;
                            __int16 v56 = 2048;
                            uint64_t v57 = v34;
                            __int16 v58 = 2048;
                            uint64_t v59 = v35;
                            _os_log_error_impl(&dword_1DC55E000, v32, OS_LOG_TYPE_ERROR, "The max report count (%ld) has become negative. The latest submitted record count is %lu with the total submitted records of %lu so far.", buf, 0x20u);
                          }

                          BOOL v31 = 0;
                          goto LABEL_39;
                        }
                      }

                      ++v25;
                      v26 = v19;
                    }
                    while (v23 != v25);
                    uint64_t v23 = [obj countByEnumeratingWithState:&v46 objects:v60 count:16];
                    if (v23) {
                      continue;
                    }
                    break;
                  }
                }
LABEL_27:

                uint64_t v18 = v19;
                uint64_t v9 = v38;
                id v6 = v39;
                uint64_t v8 = v40;
                uint64_t v14 = context;
                goto LABEL_28;
              }

              uint64_t v8 = v40;
            }
LABEL_28:

            unint64_t v11 = 0x1E6C43000;
          }

          ++v12;
        }
        while (v12 != v8);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v50 objects:v61 count:16];
      }
      while (v8);
    }

    v28 = +[_DPLog daemon];
    v29 = v43;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      -[_DPDediscoReporter reportDediscoKeys:storage:](v43, v28);
    }

    if ([v43 count])
    {
      uint64_t v30 = (void *)MEMORY[0x1E019F810]();
      +[_DPPrivacyBudget updateAllBudgetsIn:v44];
      [(_DPDediscoReporter *)self markSubmitted:v43 storage:v44];
    }
    BOOL v31 = 1;
LABEL_39:
    id v5 = v37;
  }
  else
  {
    BOOL v31 = 0;
  }

  return v31;
}

- (id)directlyUploadDediscoRecords:(id)a3 forKey:(id)a4 keyProperties:(id)a5 storage:(id)a6
{
  v43[4] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = a3;
  uint64_t v13 = +[_DPPrivacyBudget enforceBudgetForRecords:v12 withKey:v9 inDatabase:v11];
  uint64_t v14 = [v12 count];

  uint64_t v15 = v14 - [v13 count];
  id v39 = v10;
  char v16 = [v10 telemetryAllowed];
  BOOL v17 = 1;
  if ((v16 & 1) == 0) {
    BOOL v17 = +[_DPDeviceInfo isInternalBuild];
  }
  LOBYTE(v35) = v17;
  LODWORD(v33) = 1;
  HIDWORD(v33) = v15;
  +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:", v9, 3, 0, 0, 301, @"No budget left", v33, v35);
  uint64_t v18 = +[_DPCoreAnalyticsCollector sharedInstance];
  v42[0] = @"Phase";
  v42[1] = @"TaskName";
  v43[0] = &unk_1F372C5E8;
  v43[1] = v9;
  v43[2] = MEMORY[0x1E4F1CC28];
  v42[2] = @"Status";
  v42[3] = @"Counts";
  v19 = [NSNumber numberWithUnsignedInteger:v15];
  v43[3] = v19;
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:4];
  [v18 reportMetricsForEvent:@"com.apple.DifferentialPrivacy.PhaseCount" withMetrics:v20];

  if ([v13 count])
  {
    int v21 = [v13 count];
    uint64_t v22 = v10;
    char v23 = [v10 telemetryAllowed];
    BOOL v24 = 1;
    if ((v23 & 1) == 0) {
      BOOL v24 = +[_DPDeviceInfo isInternalBuild];
    }
    LOBYTE(v36) = v24;
    LODWORD(v34) = 1;
    HIDWORD(v34) = v21;
    +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:", v9, 3, 0, 1, 300, 0, v34, v36);
    uint64_t v25 = +[_DPCoreAnalyticsCollector sharedInstance];
    v40[0] = @"Phase";
    v40[1] = @"TaskName";
    v41[0] = &unk_1F372C5E8;
    v41[1] = v9;
    v41[2] = MEMORY[0x1E4F1CC38];
    v40[2] = @"Status";
    v40[3] = @"Counts";
    v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
    v41[3] = v26;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:4];
    [v25 reportMetricsForEvent:@"com.apple.DifferentialPrivacy.PhaseCount" withMetrics:v27];

    v28 = v11;
    v29 = [(_DPDediscoReporter *)self reportToDediscoRecords:v13 forKey:v9 keyProperties:v39 storage:v11];
    if ([v29 count]) {
      +[_DPPrivacyBudget updateBudgetForRecords:v29 withKey:v9 inDatabase:v11];
    }
    id v30 = v29;
  }
  else
  {
    BOOL v31 = +[_DPLog framework];
    uint64_t v22 = v10;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      -[_DPDediscoReporter directlyUploadDediscoRecords:forKey:keyProperties:storage:](a2);
    }

    id v30 = (id)MEMORY[0x1E4F1CBF0];
    v28 = v11;
  }

  return v30;
}

- (id)reportToDediscoRecords:(id)a3 forKey:(id)a4 keyProperties:(id)a5 storage:(id)a6
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  id v46 = a4;
  id v45 = a5;
  id v44 = a6;
  id v9 = +[_DPLog daemon];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = [v47 count];
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v46;
    _os_log_impl(&dword_1DC55E000, v9, OS_LOG_TYPE_DEFAULT, "Submitting %lu record(s) to Dedisco for key %@", buf, 0x16u);
  }

  context = (void *)MEMORY[0x1E019F810]();
  long long v48 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.DPSubmissionService"];
  id v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F37ACEF0];
  [v48 setRemoteObjectInterface:v10];

  [v48 resume];
  if (v48)
  {
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __74___DPDediscoReporter_reportToDediscoRecords_forKey_keyProperties_storage___block_invoke;
    v72[3] = &unk_1E6C441E0;
    v73 = @"com.apple.DPSubmissionService";
    id v53 = v46;
    id v74 = v53;
    id v11 = v47;
    id v75 = v11;
    id v12 = v45;
    id v76 = v12;
    long long v51 = [v48 synchronousRemoteObjectProxyWithErrorHandler:v72];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v79 = __Block_byref_object_copy__3;
    v80 = __Block_byref_object_dispose__3;
    id v81 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
    uint64_t v66 = 0;
    v67 = &v66;
    uint64_t v68 = 0x3032000000;
    v69 = __Block_byref_object_copy__3;
    v70 = __Block_byref_object_dispose__3;
    id v71 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id obj = v11;
    uint64_t v13 = [obj countByEnumeratingWithState:&v62 objects:v77 count:16];
    if (v13)
    {
      uint64_t v50 = *(void *)v63;
      do
      {
        uint64_t v52 = v13;
        for (uint64_t i = 0; i != v52; ++i)
        {
          if (*(void *)v63 != v50) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          v60[0] = 0;
          v60[1] = v60;
          v60[2] = 0x3032000000;
          v60[3] = __Block_byref_object_copy__3;
          v60[4] = __Block_byref_object_dispose__3;
          id v16 = v15;
          id v61 = v16;
          BOOL v17 = [v12 parameterDictionary];
          uint64_t v18 = [v16 metadata];
          v19 = [v18 objectForKeyedSubscript:@"dimensionality"];

          if (v19)
          {
            uint64_t v20 = (void *)[v17 mutableCopy];
            [v20 setObject:v19 forKey:@"size"];
            uint64_t v21 = [v20 copy];

            BOOL v17 = (void *)v21;
          }
          uint64_t v22 = [v16 metadata];
          char v23 = (void *)[v22 mutableCopy];

          BOOL v24 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "telemetryAllowed"));
          [v23 setObject:v24 forKeyedSubscript:@"telemetryAllowed"];

          uint64_t v25 = [_DPDediscoDonation alloc];
          v26 = [v16 share1];
          v27 = [v16 share2];
          uint64_t v28 = [v16 dimension];
          v29 = [v12 serverAlgorithmString];
          id v30 = [(_DPDediscoDonation *)v25 initWithKey:v53 share1:v26 share2:v27 dimension:v28 metadata:v23 serverAlgorithm:v29 algorithmParameters:v17];

          v54[0] = MEMORY[0x1E4F143A8];
          v54[1] = 3221225472;
          v54[2] = __74___DPDediscoReporter_reportToDediscoRecords_forKey_keyProperties_storage___block_invoke_53;
          v54[3] = &unk_1E6C44208;
          id v55 = v53;
          uint64_t v57 = buf;
          __int16 v58 = v60;
          uint64_t v59 = &v66;
          BOOL v31 = v30;
          __int16 v56 = v31;
          [v51 submitDonation:v31 toDediscoWithReply:v54];

          _Block_object_dispose(v60, 8);
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v62 objects:v77 count:16];
      }
      while (v13);
    }

    [v48 invalidate];
    uint64_t v32 = [_DPTransparencyLogCreator alloc];
    uint64_t v33 = [(_DPTransparencyLogCreator *)v32 initWithDonations:v67[5] error:0];
    uint64_t v34 = v33;
    if (v33) {
      [(_DPTransparencyLogCreator *)v33 writeToDiskWithError:0];
    }
    uint64_t v35 = (void *)[*(id *)(*(void *)&buf[8] + 40) copy];

    _Block_object_dispose(&v66, 8);
    _Block_object_dispose(buf, 8);

    uint64_t v36 = v73;
  }
  else
  {
    long long v51 = [NSString stringWithFormat:@"Could not create connection to %@", @"com.apple.DPSubmissionService"];
    int v37 = [v47 count];
    char v38 = [v45 telemetryAllowed];
    BOOL v39 = 1;
    if ((v38 & 1) == 0) {
      BOOL v39 = +[_DPDeviceInfo isInternalBuild];
    }
    LOBYTE(v42) = v39;
    LODWORD(v41) = 1;
    HIDWORD(v41) = v37;
    +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:", v46, 4, 0, 0, 411, v51, v41, v42);
    uint64_t v36 = +[_DPLog daemon];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      -[_DPDediscoReporter reportToDediscoRecords:forKey:keyProperties:storage:]();
    }
    uint64_t v35 = 0;
  }

  return v35;
}

+ (id)filterNonConformingDediscoRecordsFrom:(id)a3
{
  id v3 = a3;
  v4 = [v3 indexesOfObjectsPassingTest:&__block_literal_global_3];
  id v5 = (void *)[v3 mutableCopy];

  [v5 removeObjectsAtIndexes:v4];
  return v5;
}

- (BOOL)markSubmitted:(id)a3 storage:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1E019F810]();
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12++), "setSubmitted:", 1, (void)v14);
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }

    [v6 updateRecords:v8 withCompletion:0];
  }

  return v6 != 0;
}

- (void)scheduleMaintenanceWithName:(id)a3 database:(id)a4
{
  id v6 = a4;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __59___DPDediscoReporter_scheduleMaintenanceWithName_database___block_invoke;
  long long v14 = &unk_1E6C44250;
  long long v15 = self;
  id v16 = v6;
  id v7 = v6;
  id v8 = a3;
  uint64_t v9 = (void *)MEMORY[0x1E019FA60](&v11);
  uint64_t v10 = +[_DPPeriodicTask taskWithName:period:handler:networkingRequired:](_DPPeriodicTask, "taskWithName:period:handler:networkingRequired:", v8, kSecondsIn18Hours, v9, 1, v11, v12, v13, v14, v15);

  +[_DPPeriodicTaskManager registerTask:v10];
}

- (void)reportDediscoRecords:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1DC55E000, v2, v3, "%@: Disabled by Tasking - skipping dedisco reporter", v4, v5, v6, v7, v8);
}

- (void)reportDediscoRecords:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DC55E000, log, OS_LOG_TYPE_ERROR, "Fail to reportDediscoKeys:storage", v1, 2u);
}

- (void)reportDediscoRecords:(const char *)a1 .cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1DC55E000, v2, v3, "%@: Disabled by D&U switch - skipping dedisco reporter", v4, v5, v6, v7, v8);
}

- (void)reportDediscoRecords:(const char *)a1 .cold.4(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  uint8_t v8 = +[_DPStrings databaseDirectoryPath];
  OUTLINED_FUNCTION_3(&dword_1DC55E000, v2, v3, "%@: Data Base Directory Path: %@", v4, v5, v6, v7, 2u);
}

- (void)reportDediscoKeys:(void *)a1 storage:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [a1 count];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1DC55E000, a2, OS_LOG_TYPE_DEBUG, "Submitted %lu records", v3, 0xCu);
}

- (void)directlyUploadDediscoRecords:(const char *)a1 forKey:keyProperties:storage:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1DC55E000, v2, v3, "%@: no records will be submitted after checking budget, key=%@", v4, v5, v6, v7, v8);
}

- (void)reportToDediscoRecords:forKey:keyProperties:storage:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1DC55E000, v0, OS_LOG_TYPE_ERROR, "%@", v1, 0xCu);
}

@end