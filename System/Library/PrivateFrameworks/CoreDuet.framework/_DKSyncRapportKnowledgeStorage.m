@interface _DKSyncRapportKnowledgeStorage
+ (id)sharedInstance;
- (BOOL)hasAdditionsFlagForPeer:(id)a3;
- (BOOL)hasDeletionsFlagForPeer:(id)a3;
- (_DKChangeSet)changeSetForSyncWithEventsToInsert:(void *)a3 eventIDsToDeletes:(void *)a4 error:;
- (_DKSync2Policy)policy;
- (_DKSyncRemoteKnowledgeStorageFetchDelegate)delegate;
- (id)changeSetFromCompressedData:(void *)a3 deviceIdentifier:(uint64_t)a4 sequenceNumber:;
- (id)dataFromChangeSet:(BOOL *)a3 didCompress:;
- (void)fetchAdditionsHighWaterMarkWithPeer:(id)a3 highPriority:(BOOL)a4 completion:(id)a5;
- (void)fetchDeletedEventIDsFromPeer:(id)a3 sinceDate:(id)a4 streamNames:(id)a5 limit:(unint64_t)a6 highPriority:(BOOL)a7 completion:(id)a8;
- (void)fetchDeletionsHighWaterMarkWithPeer:(id)a3 highPriority:(BOOL)a4 completion:(id)a5;
- (void)fetchEventsFromPeer:(id)a3 windows:(id)a4 streamNames:(id)a5 limit:(unint64_t)a6 fetchOrder:(int64_t)a7 highPriority:(BOOL)a8 completion:(id)a9;
- (void)handleFetchDeletedEventIDsWithRequest:(void *)a3 options:(void *)a4 responseHandler:;
- (void)handleFetchDeletedEventIDsWithResponse:(void *)a3 options:(void *)a4 error:(void *)a5 peer:(void *)a6 plStartDate:(void *)a7 completion:;
- (void)handleFetchEventsWithRequest:(void *)a3 options:(void *)a4 responseHandler:;
- (void)handleFetchEventsWithResponse:(void *)a3 options:(void *)a4 error:(void *)a5 peer:(void *)a6 plStartDate:(void *)a7 completion:;
- (void)handleUnexpectedRequest:(void *)a3 fromPeer:;
- (void)handleUnexpectedResponse:(void *)a3 fromPeer:;
- (void)prewarmFetchWithCompletion:(id)a3;
- (void)registerRequestIDsWithClient:(id)a3;
- (void)setFetchDelegate:(id)a3;
- (void)setPolicy:(id)a3;
- (void)updateStorageWithAddedEvents:(id)a3 deletedEventIDs:(id)a4 highPriority:(BOOL)a5 completion:(id)a6;
@end

@implementation _DKSyncRapportKnowledgeStorage

+ (id)sharedInstance
{
  if (sharedInstance_initialized_223 != -1) {
    dispatch_once(&sharedInstance_initialized_223, &__block_literal_global_226);
  }
  v2 = (void *)sharedInstance_sharedInstance_224;
  return v2;
}

- (void)registerRequestIDsWithClient:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63___DKSyncRapportKnowledgeStorage_registerRequestIDsWithClient___block_invoke;
  v6[3] = &unk_1E5610D18;
  v6[4] = self;
  id v4 = a3;
  [v4 registerRequestID:@"com.apple.coreduet.fetch-events" options:0 handler:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63___DKSyncRapportKnowledgeStorage_registerRequestIDsWithClient___block_invoke_2;
  v5[3] = &unk_1E5610D18;
  v5[4] = self;
  [v4 registerRequestID:@"com.apple.coreduet.fetch-deleted-event-ids" options:0 handler:v5];
}

- (void)handleFetchEventsWithRequest:(void *)a3 options:(void *)a4 responseHandler:
{
  uint64_t v170 = *MEMORY[0x1E4F143B8];
  id v131 = a2;
  id v126 = a3;
  v125 = a4;
  v147 = a1;
  if (a1)
  {
    v8 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v8);

    v129 = [MEMORY[0x1E4F1C9C8] date];
    v9 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportKnowledgeStorage handleFetchEventsWithRequest:options:responseHandler:].cold.6();
    }

    v10 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportKnowledgeStorage handleFetchEventsWithRequest:options:responseHandler:].cold.5();
    }

    v127 = objc_opt_new();
    v11 = [v131 objectForKeyedSubscript:@"version"];
    uint64_t v137 = [v11 integerValue];
    v124 = v11;
    v12 = [v131 objectForKeyedSubscript:@"compatibility"];
    v123 = +[_DKCompatibility compatibilityFromSerializedCompatibility:v12];

    v13 = +[_DKSyncPeerStatusTracker sharedInstance];
    [v126 objectForKeyedSubscript:@"senderIDS"];
    v122 = v121 = v13;
    v130 = objc_msgSend(v13, "existingPeerWithIDSDeviceIdentifier:");
    if (v130)
    {
      v14 = [v130 version];
      char v15 = [v124 isEqualToString:v14];

      if ((v15 & 1) == 0) {
        -[_DKSyncRapportKnowledgeStorage handleUnexpectedRequest:fromPeer:](a1, v131, v130);
      }
    }
    if (a1[3])
    {
      v16 = [v131 objectForKeyedSubscript:@"queries"];
      v146 = [v131 objectForKeyedSubscript:@"limit"];
      if (v137 >= 3)
      {
        v17 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          [(id)objc_opt_class() description];
          objc_claimAutoreleasedReturnValue();
          -[_DKSyncRapportKnowledgeStorage handleFetchEventsWithRequest:options:responseHandler:].cold.4();
        }
      }
      v142 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v16, "count"));
      long long v153 = 0u;
      long long v154 = 0u;
      long long v151 = 0u;
      long long v152 = 0u;
      id obj = v16;
      uint64_t v18 = [obj countByEnumeratingWithState:&v151 objects:v169 count:16];
      v19 = 0;
      if (v18)
      {
        v138 = 0;
        uint64_t v135 = *(void *)v152;
LABEL_16:
        uint64_t v133 = v18;
        uint64_t v20 = 0;
        v21 = v19;
        while (1)
        {
          v143 = v21;
          if (*(void *)v152 != v135) {
            objc_enumerationMutation(obj);
          }
          v22 = *(void **)(*((void *)&v151 + 1) + 8 * v20);
          v23 = [v22 objectForKeyedSubscript:@"startDate"];
          v24 = [v22 objectForKeyedSubscript:@"endDate"];
          v25 = [v22 objectForKeyedSubscript:@"streamNames"];
          if (v137 <= 2)
          {
            uint64_t v26 = [v22 objectForKeyedSubscript:@"limit"];

            v146 = (void *)v26;
          }
          v27 = [v147 policy];
          v28 = [v147[3] syncType];
          v29 = objc_msgSend(v27, "streamNamesToSyncWithSyncType:transportType:", v28, objc_msgSend(v147, "transportType"));

          uint64_t v30 = [v29 arrayByAddingObjectsFromArray:&unk_1EDE1E980];

          v31 = [(id)v30 arrayByAddingObject:@"/device/isLocked"];

          v32 = [MEMORY[0x1E4F1CA80] setWithArray:v25];
          v33 = [MEMORY[0x1E4F1CAD0] setWithArray:v31];
          [v32 intersectSet:v33];

          v34 = [v32 allObjects];
          LOBYTE(v30) = [v34 isEqual:v25];

          if ((v30 & 1) == 0)
          {
            v35 = [MEMORY[0x1E4F1CA80] setWithArray:v25];
            v36 = [MEMORY[0x1E4F1CAD0] setWithArray:v31];
            [v35 minusSet:v36];

            v37 = +[_CDLogging syncChannel];
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              id v4 = [(id)objc_opt_class() description];
              v38 = [v35 allObjects];
              int buf = 138543618;
              v158 = v4;
              __int16 v159 = 2112;
              id v160 = v38;
              _os_log_impl(&dword_18ECEB000, v37, OS_LOG_TYPE_INFO, "%{public}@: Ignoring request for disabled streams: %@", (uint8_t *)&buf, 0x16u);
            }
          }
          v19 = [v32 allObjects];

          BOOL v39 = !v23 || v24 == 0;
          BOOL v40 = v39 || v25 == 0;
          BOOL v41 = v40 || v146 == 0;
          BOOL v42 = !v41;
          if (v41)
          {

            +[_DKSyncErrors invalidRequest];
            v138 = v43 = v138;
            v142 = 0;
          }
          else
          {
            v43 = +[_DKSyncWindow syncWindowWithStartDate:endDate:]((uint64_t)_DKSyncWindow, v23, v24);
            [v142 addObject:v43];
          }

          if (!v42) {
            break;
          }
          ++v20;
          v21 = v19;
          if (v133 == v20)
          {
            uint64_t v18 = [obj countByEnumeratingWithState:&v151 objects:v169 count:16];
            if (v18) {
              goto LABEL_16;
            }
            break;
          }
        }
      }
      else
      {
        v138 = 0;
      }

      if ([v142 count] && objc_msgSend(v19, "count") && v146)
      {
        v46 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          v65 = [(id)objc_opt_class() description];
          _DKSyncLoggingWindowsDescription(v142);
          id v66 = (id)objc_claimAutoreleasedReturnValue();
          v67 = _CDPrettyPrintCollection(v19, 0, 0, 0);
          int buf = 138544130;
          v158 = v65;
          __int16 v159 = 2112;
          id v160 = v146;
          __int16 v161 = 2114;
          uint64_t v162 = (uint64_t)v66;
          __int16 v163 = 2114;
          id v164 = v67;
          _os_log_debug_impl(&dword_18ECEB000, v46, OS_LOG_TYPE_DEBUG, "%{public}@: Received fetch events request for up to %@ events in windows %{public}@ for streams %{public}@", (uint8_t *)&buf, 0x2Au);
        }
        unint64_t v47 = [v146 unsignedIntegerValue];
        unint64_t v48 = v47;
        if (v47 <= 1) {
          unint64_t v49 = v47;
        }
        else {
          unint64_t v49 = v47 + 1;
        }
        id v50 = v147[3];
        id v150 = v138;
        v51 = [v50 sortedEventsFromSyncWindows:v142 streamNames:v19 compatibility:v123 limit:v49 fetchOrder:2 error:&v150];
        id v52 = v150;

        if (v52)
        {
          v53 = (void *)MEMORY[0x1E4F28C58];
          v144 = [v52 domain];
          uint64_t v54 = objc_msgSend(v53, "errorWithDomain:code:userInfo:", v144, objc_msgSend(v52, "code"), 0);

          int v45 = 1;
          v139 = (void *)v54;
        }
        else
        {
          if (v48 < 2)
          {
            int v57 = 0;
            v55 = v51;
          }
          else
          {
            v55 = v51;
            if ([v51 count] == v48 + 1)
            {
              if ([v51 count])
              {
                v56 = +[_CDLogging syncChannel];
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
                {
                  v103 = [(id)objc_opt_class() description];
                  v104 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v51, "count"));
                  v105 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v51, "count") - 1);
                  int buf = 138543874;
                  v158 = v103;
                  __int16 v159 = 2112;
                  id v160 = v104;
                  __int16 v161 = 2112;
                  uint64_t v162 = (uint64_t)v105;
                  _os_log_debug_impl(&dword_18ECEB000, v56, OS_LOG_TYPE_DEBUG, "%{public}@: Fetched %@ events but hit limit so using only %@ of those events", (uint8_t *)&buf, 0x20u);
                }
                v55 = objc_msgSend(v51, "subarrayWithRange:", 0, objc_msgSend(v51, "count") - 1);
              }
              int v57 = 1;
            }
            else
            {
              int v57 = 0;
            }
          }
          id v149 = 0;
          v145 = -[_DKSyncRapportKnowledgeStorage changeSetForSyncWithEventsToInsert:eventIDsToDeletes:error:]((uint64_t)v147, v55, 0, &v149);
          id v140 = v149;
          if (v140)
          {
            v58 = +[_CDLogging syncChannel];
            v51 = v55;
            if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
            {
              v100 = [(id)objc_opt_class() description];
              v101 = [v140 domain];
              uint64_t v102 = [v140 code];
              int buf = 138544130;
              v158 = v100;
              __int16 v159 = 2114;
              id v160 = v101;
              __int16 v161 = 2048;
              uint64_t v162 = v102;
              __int16 v163 = 2112;
              id v164 = v140;
              _os_log_error_impl(&dword_18ECEB000, v58, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create change set: %{public}@:%lld (%@)", (uint8_t *)&buf, 0x2Au);
            }
            v59 = (void *)MEMORY[0x1E4F28C58];
            v60 = [v140 domain];
            uint64_t v61 = objc_msgSend(v59, "errorWithDomain:code:userInfo:", v60, objc_msgSend(v140, "code"), 0);

            int v45 = 1;
            v139 = (void *)v61;
          }
          else
          {
            v51 = v55;
            BOOL v148 = 0;
            int v45 = 1;
            v62 = [v145 eventsToAdd];
            BOOL v63 = [v62 count] == 0;

            if (v63)
            {
              uint64_t v64 = objc_opt_new();
            }
            else
            {
              uint64_t v64 = -[_DKSyncRapportKnowledgeStorage dataFromChangeSet:didCompress:]((uint64_t)v147, v145, &v148);
              int v45 = 0;
            }
            v136 = (void *)v64;
            if (v64)
            {
              if (v148) {
                v68 = @"compressedEvents";
              }
              else {
                v68 = @"encodedEvents";
              }
              v141 = v68;
              if (v137 > 2)
              {
                if (v57)
                {
                  +[_DKSyncWindow completedWindowsWithSortedEvents:windows:fetchOrder:fillOrder:hitLimit:]((uint64_t)_DKSyncWindow, v51, v142, 2, 1, 1);
                  id v77 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  id v77 = v142;
                }
                v70 = v77;
                [v127 setObject:v136 forKeyedSubscript:v141];
                v78 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v145, "sequenceNumber"));
                [v127 setObject:v78 forKeyedSubscript:@"sequenceNumber"];
                v79 = +[_DKSyncWindow dictionaryArrayFromWindows:]((uint64_t)_DKSyncWindow, v70);
                [v127 setObject:v79 forKeyedSubscript:@"completedWindows"];

                if (v57) {
                  uint64_t v80 = MEMORY[0x1E4F1CC38];
                }
                else {
                  uint64_t v80 = MEMORY[0x1E4F1CC28];
                }
                [v127 setObject:v80 forKeyedSubscript:@"didHitLimit"];
              }
              else
              {
                v69 = [obj firstObject];
                v70 = v69;
                if (v57)
                {
                  v71 = +[_CDLogging syncChannel];
                  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
                  {
                    v106 = [(id)objc_opt_class() description];
                    v107 = [v70 objectForKeyedSubscript:@"startDate"];
                    -[NSDate dk_localtimeString](v107);
                    id v108 = (id)objc_claimAutoreleasedReturnValue();
                    v109 = -[NSDate dk_localtimeString](0);
                    int buf = 138543874;
                    v158 = v106;
                    __int16 v159 = 2114;
                    id v160 = v108;
                    __int16 v161 = 2114;
                    uint64_t v162 = (uint64_t)v109;
                    _os_log_debug_impl(&dword_18ECEB000, v71, OS_LOG_TYPE_DEBUG, "%{public}@: Shrinking window start date from %{public}@ to %{public}@ due to hit limit", (uint8_t *)&buf, 0x20u);
                  }
                  v72 = [v51 lastObject];
                  v73 = [v72 creationDate];

                  uint64_t v74 = [v70 objectForKeyedSubscript:@"endDate"];
                }
                else
                {
                  v73 = [v69 objectForKeyedSubscript:@"startDate"];
                  uint64_t v74 = [v70 objectForKeyedSubscript:@"endDate"];
                }
                v79 = (void *)v74;
                v168[0] = v136;
                v167[0] = v141;
                v167[1] = @"sequenceNumber";
                v81 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v145, "sequenceNumber"));
                v168[1] = v81;
                v168[2] = v73;
                v167[2] = @"windowStartDate";
                v167[3] = @"windowEndDate";
                v168[3] = v79;
                v82 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v168 forKeys:v167 count:4];
                [v127 setObject:v82 forKeyedSubscript:v70];
              }
              v83 = +[_CDLogging syncChannel];
              if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
              {
                v115 = [(id)objc_opt_class() description];
                v114 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v51, "count"));
                v134 = +[_DKSyncPeerStatusTracker sharedInstance];
                v128 = [v131 objectForKeyedSubscript:@"client"];
                v120 = [v134 existingPeerWithSourceDeviceID:v128];
                int v84 = [v120 me];
                v85 = @"pseudo ";
                if (!v84) {
                  v85 = &stru_1EDDE58B8;
                }
                v112 = v85;
                v119 = +[_DKSyncPeerStatusTracker sharedInstance];
                v118 = [v131 objectForKeyedSubscript:@"client"];
                v117 = [v119 existingPeerWithSourceDeviceID:v118];
                v113 = [v117 identifier];
                v116 = +[_DKSyncPeerStatusTracker sharedInstance];
                v86 = [v131 objectForKeyedSubscript:@"client"];
                v87 = [v116 existingPeerWithSourceDeviceID:v86];
                v88 = [v87 model];
                if (v88)
                {
                  v89 = NSString;
                  v111 = +[_DKSyncPeerStatusTracker sharedInstance];
                  v110 = [v131 objectForKeyedSubscript:@"client"];
                  v79 = [v111 existingPeerWithSourceDeviceID:v110];
                  id v4 = [v79 model];
                  v90 = [v89 stringWithFormat:@" (%@)", v4];
                }
                else
                {
                  v90 = &stru_1EDDE58B8;
                }
                int buf = 138544386;
                v158 = v115;
                __int16 v159 = 2112;
                id v160 = v114;
                __int16 v161 = 2114;
                uint64_t v162 = (uint64_t)v112;
                __int16 v163 = 2114;
                id v164 = v113;
                __int16 v165 = 2114;
                v166 = v90;
                _os_log_impl(&dword_18ECEB000, v83, OS_LOG_TYPE_INFO, "%{public}@: Sending %@ events to %{public}@peer %{public}@%{public}@", (uint8_t *)&buf, 0x34u);
                if (v88)
                {
                }
              }

              v139 = 0;
              v76 = v136;
            }
            else
            {
              v75 = +[_CDLogging syncChannel];
              if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
              {
                [(id)objc_opt_class() description];
                objc_claimAutoreleasedReturnValue();
                -[_DKSyncRapportKnowledgeStorage handleFetchEventsWithRequest:options:responseHandler:]();
              }

              v139 = +[_DKSyncErrors internalFailure];
              v76 = 0;
            }
          }
        }
      }
      else
      {
        +[_DKSyncErrors invalidRequest];
        int v45 = 1;
        v139 = v51 = v138;
      }
    }
    else
    {
      v44 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        [(id)objc_opt_class() description];
        objc_claimAutoreleasedReturnValue();
        -[_DKSyncRapportKnowledgeStorage handleFetchEventsWithRequest:options:responseHandler:]();
      }

      v139 = +[_DKSyncErrors internalFailure];
      int v45 = 1;
    }
    uint64_t v91 = [v147 myDeviceID];
    v92 = (void *)v91;
    v93 = &stru_1EDDE58B8;
    if (v91) {
      v93 = (__CFString *)v91;
    }
    v94 = v93;

    v155[0] = @"server";
    v155[1] = @"results";
    v156[0] = v94;
    v156[1] = v127;
    v155[2] = @"version";
    v95 = @"3.0";
    if (v137 < 3) {
      v95 = @"1.0";
    }
    v156[2] = v95;
    v96 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v156 forKeys:v155 count:3];
    v97 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportKnowledgeStorage handleFetchEventsWithRequest:options:responseHandler:]();
    }

    v125[2](v125, v96, 0);
    if (v129)
    {
      v98 = [MEMORY[0x1E4F1C9C8] date];
      v99 = [v147[3] syncType];
      +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", v99, [v147 transportType], v129, v98, v45 != 0);
    }
  }
}

- (void)handleFetchDeletedEventIDsWithRequest:(void *)a3 options:(void *)a4 responseHandler:
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v77 = a2;
  id v55 = a3;
  v56 = a4;
  v81 = (id *)a1;
  if (a1)
  {
    v7 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v7);

    int v57 = [MEMORY[0x1E4F1C9C8] date];
    v8 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportKnowledgeStorage handleFetchDeletedEventIDsWithRequest:options:responseHandler:].cold.4();
    }

    v9 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportKnowledgeStorage handleFetchDeletedEventIDsWithRequest:options:responseHandler:]();
    }

    uint64_t v64 = objc_opt_new();
    if (*(void *)(a1 + 24))
    {
      [v77 objectForKeyedSubscript:@"queries"];
      long long v90 = 0u;
      long long v91 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = [obj countByEnumeratingWithState:&v88 objects:v107 count:16];
      v11 = 0;
      if (!v10)
      {
        char v65 = 1;
        goto LABEL_56;
      }
      char v65 = 1;
      uint64_t v82 = *(void *)v89;
      while (1)
      {
        uint64_t v83 = v10;
        for (uint64_t i = 0; i != v83; ++i)
        {
          if (*(void *)v89 != v82) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v88 + 1) + 8 * i);
          v14 = [v13 objectForKeyedSubscript:@"sinceDate"];
          char v15 = [v13 objectForKeyedSubscript:@"streamNames"];
          v16 = [v13 objectForKeyedSubscript:@"limit"];
          v17 = +[_CDLogging syncChannel];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v26 = [(id)objc_opt_class() description];
            -[NSDate dk_localtimeString](v14);
            id v27 = (id)objc_claimAutoreleasedReturnValue();
            v28 = _CDPrettyPrintCollection(v15, 0, 0, 0);
            *(_DWORD *)int buf = 138544130;
            v98 = v26;
            __int16 v99 = 2112;
            id v100 = v16;
            __int16 v101 = 2114;
            uint64_t v102 = (uint64_t)v27;
            __int16 v103 = 2114;
            v104 = v28;
            _os_log_debug_impl(&dword_18ECEB000, v17, OS_LOG_TYPE_DEBUG, "%{public}@: Received fetch deleted event ids request for up to %@ deletions since %{public}@ for streams %{public}@", buf, 0x2Au);
          }
          if (!v14 || !v15)
          {
            +[_DKSyncErrors invalidRequest];
            v11 = id v19 = v11;
            goto LABEL_49;
          }
          if (v16) {
            uint64_t v18 = [v16 unsignedIntegerValue];
          }
          else {
            uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
          }
          id v20 = v81[3];
          id v86 = v11;
          id v87 = 0;
          int v84 = [v20 deletedEventIDsSinceDate:v14 streamNames:v15 limit:v18 endDate:&v87 error:&v86];
          id v19 = v87;
          id v21 = v86;

          if (v21)
          {
            v11 = +[_DKSyncErrors internalFailure];
          }
          else
          {
            id v85 = 0;
            -[_DKSyncRapportKnowledgeStorage changeSetForSyncWithEventsToInsert:eventIDsToDeletes:error:]((uint64_t)v81, 0, v84, &v85);
            id v21 = (id)objc_claimAutoreleasedReturnValue();
            id v22 = v85;
            if (!v22)
            {
              BOOL v94 = 0;
              v25 = [v21 eventsToAdd];
              if ([v25 count])
              {

                goto LABEL_29;
              }
              v29 = [v21 eventIDsToDelete];
              BOOL v30 = [v29 count] == 0;

              if (v30)
              {
                v79 = objc_opt_new();
              }
              else
              {
LABEL_29:
                v79 = -[_DKSyncRapportKnowledgeStorage dataFromChangeSet:didCompress:]((uint64_t)v81, v21, &v94);
                char v65 = 0;
              }
              if (v79)
              {
                log = +[_CDLogging syncChannel];
                if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
                {
                  v67 = [(id)objc_opt_class() description];
                  id v66 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v84, "count"));
                  v75 = +[_DKSyncPeerStatusTracker sharedInstance];
                  v76 = [v77 objectForKeyedSubscript:@"client"];
                  uint64_t v74 = [v75 existingPeerWithSourceDeviceID:v76];
                  int v31 = [v74 me];
                  v32 = &stru_1EDDE58B8;
                  if (v31) {
                    v32 = @"pseudo ";
                  }
                  BOOL v63 = v32;
                  v73 = +[_DKSyncPeerStatusTracker sharedInstance];
                  v72 = [v77 objectForKeyedSubscript:@"client"];
                  v71 = [v73 existingPeerWithSourceDeviceID:v72];
                  v33 = [v71 identifier];
                  v70 = +[_DKSyncPeerStatusTracker sharedInstance];
                  v69 = [v77 objectForKeyedSubscript:@"client"];
                  v68 = [v70 existingPeerWithSourceDeviceID:v69];
                  v34 = [v68 model];
                  if (v34)
                  {
                    v35 = NSString;
                    uint64_t v61 = +[_DKSyncPeerStatusTracker sharedInstance];
                    v62 = [v77 objectForKeyedSubscript:@"client"];
                    v60 = [v61 existingPeerWithSourceDeviceID:v62];
                    v59 = [v60 model];
                    v58 = [v35 stringWithFormat:@" (%@)", v59];
                    v36 = v58;
                  }
                  else
                  {
                    v36 = &stru_1EDDE58B8;
                  }
                  *(_DWORD *)int buf = 138544386;
                  v98 = v67;
                  __int16 v99 = 2112;
                  id v100 = v66;
                  __int16 v101 = 2114;
                  uint64_t v102 = (uint64_t)v63;
                  __int16 v103 = 2114;
                  v104 = v33;
                  __int16 v105 = 2114;
                  v106 = v36;
                  _os_log_impl(&dword_18ECEB000, log, OS_LOG_TYPE_INFO, "%{public}@: Sending %@ deletions to %{public}@peer %{public}@%{public}@", buf, 0x34u);
                  if (v34)
                  {
                  }
                }

                v38 = @"compressedDeletedEventIDs";
                if (!v94) {
                  v38 = @"encodedDeletedEventIDs";
                }
                BOOL v39 = v38;
                v96[0] = v79;
                v95[0] = v39;
                v95[1] = @"sequenceNumber";
                BOOL v40 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "sequenceNumber"));
                v96[1] = v40;
                v96[2] = v14;
                v95[2] = @"sinceDate";
                v95[3] = @"untilDate";
                v96[3] = v19;
                BOOL v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:v95 count:4];
                [v64 setObject:v41 forKeyedSubscript:v13];

                v11 = 0;
              }
              else
              {
                v37 = +[_CDLogging syncChannel];
                if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                {
                  int v45 = [(id)objc_opt_class() description];
                  *(_DWORD *)int buf = 138543618;
                  v98 = v45;
                  __int16 v99 = 2112;
                  id v100 = v21;
                  _os_log_error_impl(&dword_18ECEB000, v37, OS_LOG_TYPE_ERROR, "%{public}@: Failed to encode change set as protobuf: %@", buf, 0x16u);
                }
                v11 = +[_DKSyncErrors internalFailure];
              }

              goto LABEL_48;
            }
            v23 = v22;
            v24 = +[_CDLogging syncChannel];
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              BOOL v42 = [(id)objc_opt_class() description];
              v43 = [v23 domain];
              uint64_t v44 = [v23 code];
              *(_DWORD *)int buf = 138544130;
              v98 = v42;
              __int16 v99 = 2114;
              id v100 = v43;
              __int16 v101 = 2048;
              uint64_t v102 = v44;
              __int16 v103 = 2112;
              v104 = v23;
              _os_log_error_impl(&dword_18ECEB000, v24, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create change set: %{public}@:%lld (%@)", buf, 0x2Au);
            }
            v11 = +[_DKSyncErrors internalFailure];
          }
LABEL_48:

LABEL_49:
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v88 objects:v107 count:16];
        if (!v10)
        {
LABEL_56:

          goto LABEL_57;
        }
      }
    }
    v46 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportKnowledgeStorage handleFetchDeletedEventIDsWithRequest:options:responseHandler:]();
    }

    v11 = +[_DKSyncErrors internalFailure];
    char v65 = 1;
LABEL_57:
    uint64_t v47 = [v81 myDeviceID];
    unint64_t v48 = (void *)v47;
    unint64_t v49 = &stru_1EDDE58B8;
    if (v47) {
      unint64_t v49 = (__CFString *)v47;
    }
    id v50 = v49;

    v92[0] = @"server";
    v92[1] = @"results";
    v93[0] = v50;
    v93[1] = v64;
    v92[2] = @"version";
    v93[2] = @"1.0";
    v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v92 count:3];
    id v52 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportKnowledgeStorage handleFetchDeletedEventIDsWithRequest:options:responseHandler:]();
    }

    v56[2](v56, v51, 0, v11);
    if (v57)
    {
      v53 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v54 = [v81[3] syncType];
      +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", v54, [v81 transportType], v57, v53, v65 & 1);
    }
  }
}

- (void)prewarmFetchWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (BOOL)hasAdditionsFlagForPeer:(id)a3
{
  return 1;
}

- (BOOL)hasDeletionsFlagForPeer:(id)a3
{
  return 1;
}

- (void)handleUnexpectedRequest:(void *)a3 fromPeer:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a1)
  {
    v7 = [a2 objectForKeyedSubscript:@"version"];
    v8 = [v6 version];
    char v9 = [v7 isEqualToString:v8];

    if ((v9 & 1) == 0)
    {
      uint64_t v10 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = [(id)objc_opt_class() description];
        v12 = &stru_1EDDE58B8;
        if ([v6 me]) {
          v13 = @"pseudo ";
        }
        else {
          v13 = &stru_1EDDE58B8;
        }
        v14 = [v6 identifier];
        char v15 = [v6 model];
        if (v15)
        {
          v16 = NSString;
          v3 = [v6 model];
          v12 = [v16 stringWithFormat:@" (%@)", v3];
        }
        *(_DWORD *)int buf = 138544386;
        uint64_t v18 = v11;
        __int16 v19 = 2114;
        id v20 = v7;
        __int16 v21 = 2114;
        id v22 = v13;
        __int16 v23 = 2114;
        v24 = v14;
        __int16 v25 = 2114;
        uint64_t v26 = v12;
        _os_log_error_impl(&dword_18ECEB000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Unexpected version %{public}@ in request from %{public}@peer %{public}@%{public}@", buf, 0x34u);
        if (v15)
        {
        }
      }

      [v6 setVersion:0];
      [a1 handshakeWithDuetSyncPeer:v6 orError:0];
    }
  }
}

- (void)handleUnexpectedResponse:(void *)a3 fromPeer:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a1)
  {
    v7 = [a2 objectForKeyedSubscript:@"version"];
    v8 = [v6 version];
    char v9 = [v7 isEqualToString:v8];

    if ((v9 & 1) == 0)
    {
      uint64_t v10 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = [(id)objc_opt_class() description];
        v12 = &stru_1EDDE58B8;
        if ([v6 me]) {
          v13 = @"pseudo ";
        }
        else {
          v13 = &stru_1EDDE58B8;
        }
        v14 = [v6 identifier];
        char v15 = [v6 model];
        if (v15)
        {
          v16 = NSString;
          v3 = [v6 model];
          v12 = [v16 stringWithFormat:@" (%@)", v3];
        }
        *(_DWORD *)int buf = 138544386;
        uint64_t v18 = v11;
        __int16 v19 = 2114;
        id v20 = v7;
        __int16 v21 = 2114;
        id v22 = v13;
        __int16 v23 = 2114;
        v24 = v14;
        __int16 v25 = 2114;
        uint64_t v26 = v12;
        _os_log_error_impl(&dword_18ECEB000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Unexpected version %{public}@ in response from %{public}@peer %{public}@%{public}@", buf, 0x34u);
        if (v15)
        {
        }
      }

      [v6 setVersion:0];
      [a1 handshakeWithDuetSyncPeer:v6 orError:0];
    }
  }
}

- (void)fetchEventsFromPeer:(id)a3 windows:(id)a4 streamNames:(id)a5 limit:(unint64_t)a6 fetchOrder:(int64_t)a7 highPriority:(BOOL)a8 completion:(id)a9
{
  BOOL v9 = a8;
  v96[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v64 = a4;
  id v68 = a5;
  id v14 = a9;
  char v15 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v15);

  v16 = [(_DKSyncRapportStorage *)self myDeviceID];
  v17 = [v13 version];
  uint64_t v67 = [v17 integerValue];

  if ([(_DKSyncRapportStorage *)self isAvailable]
    && ([v13 idsDeviceIdentifier], (uint64_t v18 = objc_claimAutoreleasedReturnValue()) != 0)
    && (__int16 v19 = (void *)v18,
        BOOL v20 = [(_DKSyncRapportStorage *)self isTransportActiveForPeer:v13],
        v19,
        v20))
  {
    v58 = v14;
    int v57 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v61 = v16;
    v62 = v13;
    v60 = self;
    BOOL v59 = v9;
    if (v67 <= 2)
    {
      if ((unint64_t)[v64 count] < 2)
      {
        __int16 v21 = v64;
      }
      else
      {
        v24 = [v64 lastObject];
        v96[0] = v24;
        __int16 v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v96 count:1];

        __int16 v25 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          id v66 = [(id)objc_opt_class() description];
          if ([v13 me]) {
            id v50 = @"pseudo ";
          }
          else {
            id v50 = &stru_1EDDE58B8;
          }
          v51 = [v13 identifier];
          id v52 = [v13 model];
          if (v52)
          {
            uint64_t v54 = NSString;
            id v64 = [v13 model];
            v53 = [v54 stringWithFormat:@" (%@)", v64];
          }
          else
          {
            v53 = &stru_1EDDE58B8;
          }
          id v55 = [v21 firstObject];
          v56 = [v55 debugDescription];
          *(_DWORD *)int buf = 138544386;
          id v87 = v66;
          __int16 v88 = 2114;
          long long v89 = v50;
          __int16 v90 = 2114;
          long long v91 = v51;
          __int16 v92 = 2114;
          v93 = v53;
          __int16 v94 = 2114;
          v95 = v56;
          _os_log_debug_impl(&dword_18ECEB000, v25, OS_LOG_TYPE_DEBUG, "%{public}@: Only sending a single window to v1 %{public}@peer %{public}@%{public}@: window %{public}@", buf, 0x34u);

          if (v52)
          {
          }
        }
      }
    }
    else
    {
      __int16 v21 = v64;
    }
    char v65 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v21, "count"));
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v26 = v21;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v75 objects:v85 count:16];
    id v64 = v26;
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v76;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v76 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(void *)(*((void *)&v75 + 1) + 8 * i);
          v32 = -[_DKSyncWindow startDate](v31);
          uint64_t v33 = -[_DKSyncType urgency](v31);
          v34 = (void *)v33;
          if (v67 < 3)
          {
            v83[0] = @"startDate";
            v83[1] = @"endDate";
            v84[0] = v32;
            v84[1] = v33;
            v84[2] = v68;
            v83[2] = @"streamNames";
            v83[3] = @"limit";
            v36 = [NSNumber numberWithUnsignedInteger:a6];
            v84[3] = v36;
            v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:v83 count:4];

            id v26 = v64;
          }
          else
          {
            v81[0] = @"startDate";
            v81[1] = @"endDate";
            v82[0] = v32;
            v82[1] = v33;
            v81[2] = @"streamNames";
            v82[2] = v68;
            v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:3];
          }
          [v65 addObject:v35];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v75 objects:v85 count:16];
      }
      while (v28);
    }

    v16 = v61;
    v37 = &stru_1EDDE58B8;
    if (v61) {
      v38 = v61;
    }
    else {
      v38 = &stru_1EDDE58B8;
    }
    v79[0] = @"client";
    v79[1] = @"queries";
    id v22 = v65;
    v80[0] = v38;
    v80[1] = v65;
    v79[2] = @"limit";
    BOOL v39 = [NSNumber numberWithUnsignedInteger:a6];
    v80[2] = v39;
    v80[3] = @"3.0";
    v79[3] = @"version";
    v79[4] = @"compatibility";
    BOOL v40 = +[_DKCompatibility currentCompatibility];
    BOOL v41 = [v40 serialize];
    v80[4] = v41;
    __int16 v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:5];

    BOOL v42 = +[_CDLogging syncChannel];
    id v13 = v62;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      int v45 = [(id)objc_opt_class() description];
      if ([v62 me]) {
        v37 = @"pseudo ";
      }
      v46 = [v62 identifier];
      uint64_t v47 = [v62 model];
      if (v47)
      {
        unint64_t v49 = NSString;
        uint64_t v67 = [v62 model];
        unint64_t v48 = [v49 stringWithFormat:@" (%@)", v67];
      }
      else
      {
        unint64_t v48 = &stru_1EDDE58B8;
      }
      *(_DWORD *)int buf = 138544386;
      id v87 = v45;
      __int16 v88 = 2114;
      long long v89 = v37;
      __int16 v90 = 2114;
      long long v91 = v46;
      __int16 v92 = 2114;
      v93 = v48;
      __int16 v94 = 2112;
      v95 = v23;
      _os_log_debug_impl(&dword_18ECEB000, v42, OS_LOG_TYPE_DEBUG, "%{public}@: Sending fetch events request to %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
      if (v47)
      {
      }
      id v22 = v65;
    }

    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __115___DKSyncRapportKnowledgeStorage_fetchEventsFromPeer_windows_streamNames_limit_fetchOrder_highPriority_completion___block_invoke;
    v71[3] = &unk_1E5610D90;
    v71[4] = v60;
    id v72 = v62;
    id v73 = v57;
    id v74 = v58;
    id v43 = v58;
    id v44 = v57;
    [(_DKSyncRapportStorage *)v60 sendRequestID:@"com.apple.coreduet.fetch-events" request:v23 peer:v72 highPriority:v59 options:0 responseHandler:v71];
  }
  else
  {
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __115___DKSyncRapportKnowledgeStorage_fetchEventsFromPeer_windows_streamNames_limit_fetchOrder_highPriority_completion___block_invoke_2;
    v69[3] = &unk_1E560D640;
    id v70 = v14;
    id v22 = v14;
    [(_DKSyncRapportStorage *)self handleAvailabilityFailureWithPeer:v13 completion:v69];
    __int16 v23 = v70;
  }
}

- (void)handleFetchEventsWithResponse:(void *)a3 options:(void *)a4 error:(void *)a5 peer:(void *)a6 plStartDate:(void *)a7 completion:
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  long long v75 = a2;
  id v73 = a3;
  v79 = a4;
  id v74 = a5;
  id v76 = a6;
  long long v77 = a7;
  long long v78 = a1;
  if (!a1) {
    goto LABEL_70;
  }
  id v13 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v13);

  id v14 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    [(id)objc_opt_class() description];
    objc_claimAutoreleasedReturnValue();
    -[_DKSyncRapportKnowledgeStorage handleFetchEventsWithResponse:options:error:peer:plStartDate:completion:]();
  }

  char v15 = v79;
  if (!v79)
  {
    BOOL v20 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      int v57 = [(id)objc_opt_class() description];
      if ([v74 me]) {
        v58 = @"pseudo ";
      }
      else {
        v58 = &stru_1EDDE58B8;
      }
      BOOL v59 = [v74 identifier];
      v60 = [v74 model];
      if (v60)
      {
        id v64 = NSString;
        a3 = [v74 model];
        uint64_t v61 = [v64 stringWithFormat:@" (%@)", a3];
      }
      else
      {
        uint64_t v61 = &stru_1EDDE58B8;
      }
      *(_DWORD *)int buf = 138544386;
      __int16 v92 = v57;
      __int16 v93 = 2114;
      __int16 v94 = v58;
      __int16 v95 = 2114;
      v96 = v59;
      __int16 v97 = 2114;
      v98 = v61;
      __int16 v99 = 2112;
      id v100 = v75;
      _os_log_debug_impl(&dword_18ECEB000, v20, OS_LOG_TYPE_DEBUG, "%{public}@: Received fetch events response from %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
      if (v60)
      {
      }
    }

    __int16 v21 = +[_DKSyncErrors invalidResponse];
    v79 = v21;
    id v72 = [(__CFString *)v75 objectForKeyedSubscript:@"version"];
    [v72 floatValue];
    float v23 = v22;
    v24 = [(__CFString *)v75 objectForKeyedSubscript:@"results"];
    v71 = v24;
    if ([v24 count] == 1 && v23 < 3.0)
    {
      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      id v25 = v24;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v85 objects:v90 count:16];
      uint64_t v27 = 0;
      uint64_t v28 = 0;
      uint64_t v29 = 0;
      if (v26)
      {
        uint64_t v80 = *(void *)v86;
        uint64_t v82 = 0;
        do
        {
          uint64_t v83 = v26;
          uint64_t v30 = 0;
          uint64_t v31 = (void *)v27;
          v32 = (void *)v28;
          uint64_t v33 = v29;
          do
          {
            if (*(void *)v86 != v80) {
              objc_enumerationMutation(v25);
            }
            v34 = [v25 objectForKeyedSubscript:*(void *)(*((void *)&v85 + 1) + 8 * v30)];
            uint64_t v27 = [v34 objectForKeyedSubscript:@"encodedEvents"];

            uint64_t v28 = [v34 objectForKeyedSubscript:@"compressedEvents"];

            uint64_t v29 = [v34 objectForKeyedSubscript:@"sequenceNumber"];

            v35 = [v34 objectForKeyedSubscript:@"windowStartDate"];
            v36 = [v34 objectForKeyedSubscript:@"windowEndDate"];
            v37 = v36;
            if (v27 | v28 && v29 && v35 && v36)
            {
              v38 = +[_DKSyncWindow syncWindowWithStartDate:endDate:]((uint64_t)_DKSyncWindow, v35, v36);
              long long v89 = v38;
              uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v89 count:1];

              uint64_t v82 = (void *)v39;
            }

            ++v30;
            uint64_t v31 = (void *)v27;
            v32 = (void *)v28;
            uint64_t v33 = v29;
          }
          while (v83 != v30);
          uint64_t v26 = [v25 countByEnumeratingWithState:&v85 objects:v90 count:16];
        }
        while (v26);
      }
      else
      {
        uint64_t v82 = 0;
      }
    }
    else
    {
      if ((unint64_t)[v24 count] < 4 || v23 < 3.0)
      {
        uint64_t v82 = 0;
        -[_DKSyncRapportKnowledgeStorage handleUnexpectedResponse:fromPeer:](v78, v75, v74);
        uint64_t v27 = 0;
        uint64_t v28 = 0;
        uint64_t v29 = 0;
LABEL_34:
        if (v27 | v28)
        {
          BOOL v41 = [v74 sourceDeviceUUID];
          uint64_t v42 = [v29 unsignedIntegerValue];
          if (v28)
          {
            id v43 = -[_DKSyncRapportKnowledgeStorage changeSetFromCompressedData:deviceIdentifier:sequenceNumber:]((uint64_t)v78, (void *)v28, v41, v42);
            id v44 = [v43 eventsToAdd];
          }
          else if ([(id)v27 length])
          {
            id v43 = +[_DKChangeSet createFromData:v27 deviceIdentifier:v41 sequenceNumber:v42];
            id v44 = [v43 eventsToAdd];
          }
          else
          {
            id v44 = objc_opt_new();
            id v43 = 0;
          }
          uint64_t v18 = v44;
          int v84 = v43;
          v81 = v41;
          BOOL v19 = [v44 count] == 0;
          if (v18)
          {
            int v45 = +[_CDLogging syncChannel];
            if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            {
              v69 = [(id)objc_opt_class() description];
              v46 = NSNumber;
              objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
              uint64_t v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
              int v47 = [v74 me];
              unint64_t v48 = &stru_1EDDE58B8;
              if (v47) {
                unint64_t v48 = @"pseudo ";
              }
              id v66 = v48;
              unint64_t v49 = [v74 identifier];
              id v50 = [v74 model];
              if (v50)
              {
                v51 = NSString;
                v46 = [v74 model];
                id v52 = [v51 stringWithFormat:@" (%@)", v46];
              }
              else
              {
                id v52 = &stru_1EDDE58B8;
              }
              *(_DWORD *)int buf = 138544386;
              __int16 v92 = v69;
              __int16 v93 = 2112;
              __int16 v94 = v67;
              __int16 v95 = 2114;
              v96 = v66;
              __int16 v97 = 2114;
              v98 = v49;
              __int16 v99 = 2114;
              id v100 = v52;
              _os_log_impl(&dword_18ECEB000, v45, OS_LOG_TYPE_INFO, "%{public}@: Fetched %@ added events from %{public}@peer %{public}@%{public}@", buf, 0x34u);
              if (v50)
              {
              }
            }

            v53 = v79;
            v79 = 0;
          }
          else
          {
            v53 = +[_CDLogging syncChannel];
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
            {
              id v70 = [(id)objc_opt_class() description];
              if ([v74 me]) {
                uint64_t v54 = @"pseudo ";
              }
              else {
                uint64_t v54 = &stru_1EDDE58B8;
              }
              id v68 = [v74 identifier];
              id v55 = [v74 model];
              if (v55)
              {
                char v65 = NSString;
                BOOL v41 = [v74 model];
                v56 = [v65 stringWithFormat:@" (%@)", v41];
              }
              else
              {
                v56 = &stru_1EDDE58B8;
              }
              *(_DWORD *)int buf = 138544130;
              __int16 v92 = v70;
              __int16 v93 = 2114;
              __int16 v94 = v54;
              __int16 v95 = 2114;
              v96 = v68;
              __int16 v97 = 2114;
              v98 = v56;
              _os_log_debug_impl(&dword_18ECEB000, v53, OS_LOG_TYPE_DEBUG, "%{public}@: Unable to decode events from %{public}@peer %{public}@%{public}@", buf, 0x2Au);
              if (v55)
              {
              }
            }
          }

          __int16 v21 = v81;
        }
        else
        {
          +[_DKSyncErrors invalidResponse];
          uint64_t v18 = 0;
          v79 = BOOL v19 = 1;
        }

        char v15 = v72;
        goto LABEL_65;
      }
      uint64_t v27 = [v24 objectForKeyedSubscript:@"encodedEvents"];
      uint64_t v28 = [v24 objectForKeyedSubscript:@"compressedEvents"];
      uint64_t v29 = [v24 objectForKeyedSubscript:@"sequenceNumber"];
      BOOL v40 = [v24 objectForKeyedSubscript:@"completedWindows"];
      id v25 = v40;
      uint64_t v82 = 0;
      if (v27 | v28 && v29 && v40)
      {
        uint64_t v82 = +[_DKSyncWindow windowsFromDictionaryArray:]((uint64_t)_DKSyncWindow, v40);
      }
    }

    __int16 v21 = v79;
    goto LABEL_34;
  }
  if ([v79 code] == -6714
    && ([v79 domain],
        v16 = objc_claimAutoreleasedReturnValue(),
        int v17 = [v16 isEqualToString:*MEMORY[0x1E4F94770]],
        v16,
        char v15 = v79,
        v17))
  {
    char v15 = +[_DKSyncPeerStatusTracker sharedInstance];
    objc_msgSend(v15, "removeActiveTransports:fromPeer:", objc_msgSend(a1, "transportType"), v74);
    uint64_t v82 = 0;
    uint64_t v18 = 0;
    BOOL v19 = 1;
  }
  else
  {
    [a1 transformResponseError:v15];
    uint64_t v82 = 0;
    uint64_t v18 = 0;
    v79 = BOOL v19 = 1;
  }
LABEL_65:

  if (v76)
  {
    v62 = [MEMORY[0x1E4F1C9C8] date];
    BOOL v63 = [v78[3] syncType];
    +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", v63, [v78 transportType], v76, v62, v19);
  }
  if (v77) {
    v77[2]();
  }

LABEL_70:
}

- (_DKChangeSet)changeSetForSyncWithEventsToInsert:(void *)a3 eventIDsToDeletes:(void *)a4 error:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    if (a4) {
      *a4 = 0;
    }
    uint64_t v9 = *(void *)(a1 + 16) + 1;
    *(void *)(a1 + 16) = v9;
    uint64_t v10 = [_DKChangeSet alloc];
    v11 = [*(id *)(a1 + 24) deviceUUID];
    v12 = [(_DKChangeSet *)v10 initWithEventsToAdd:v7 eventIDsToDelete:v8 deviceIdentifier:v11 sequenceNumber:v9];

    id v13 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      char v15 = [(id)objc_opt_class() description];
      v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_DKChangeSet sequenceNumber](v12, "sequenceNumber"));
      int v17 = [(_DKChangeSet *)v12 deviceIdentifier];
      uint64_t v18 = [v17 UUIDString];
      BOOL v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
      BOOL v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
      int v21 = 138544642;
      float v22 = v15;
      __int16 v23 = 2114;
      v24 = v16;
      __int16 v25 = 2114;
      uint64_t v26 = v18;
      __int16 v27 = 2112;
      uint64_t v28 = v19;
      __int16 v29 = 2112;
      uint64_t v30 = v20;
      __int16 v31 = 2112;
      v32 = v12;
      _os_log_debug_impl(&dword_18ECEB000, v13, OS_LOG_TYPE_DEBUG, "%{public}@: Created change set %{public}@ on device %{public}@ containing %@ added events and %@ event ids to delete: %@", (uint8_t *)&v21, 0x3Eu);
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)dataFromChangeSet:(BOOL *)a3 didCompress:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    id v7 = [v5 asData];
    if (!v7)
    {
      BOOL v20 = 0;
      if (!a3) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
    id v8 = +[_CDSizeMetricFamily sizeMetricFamilyWithName:]((uint64_t)_CDSizeMetricFamily, @"Rapport");
    uint64_t v9 = -[_CDSizeMetricFamily sizeMetricWithName:string:scale:]((uint64_t)v8, @"bytes to send", 0, 1024);
    CDSizeMetricAddSize((uint64_t)v9, [v7 length]);
    uint64_t v10 = [v6 eventsToAdd];
    if ([v10 count] && (unint64_t)objc_msgSend(v7, "length") >= 0x401)
    {
    }
    else
    {
      v11 = [v6 eventIDsToDelete];
      if (![v11 count])
      {

        goto LABEL_17;
      }
      unint64_t v12 = [v7 length];

      if (v12 < 0x801)
      {
LABEL_17:
        __int16 v23 = -[_CDSizeMetricFamily sizeMetricWithName:string:scale:]((uint64_t)v8, @"uncompressed bytes sent", 0, 1024);
        CDSizeMetricAddSize((uint64_t)v23, [v7 length]);

        BOOL v20 = 0;
        goto LABEL_18;
      }
    }
    size_t v13 = [v7 length];
    id v14 = (uint8_t *)malloc_type_malloc(v13, 0x55F93CD8uLL);
    id v15 = v7;
    size_t v16 = compression_encode_buffer(v14, v13, (const uint8_t *)[v15 bytes], objc_msgSend(v15, "length"), 0, COMPRESSION_LZFSE);
    if (v16 && (size_t v17 = v16, v16 < [v15 length]))
    {
      uint64_t v18 = objc_alloc_init(_DKPRCompressedChangeSet);
      -[_DKPRCompressedChangeSet setUncompressedLength:]((uint64_t)v18, [v15 length]);
      BOOL v19 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v14 length:v17 freeWhenDone:1];
      -[_DKPRCompressedChangeSet setCompressedData:]((uint64_t)v18, v19);

      BOOL v20 = [(_DKPRCompressedChangeSet *)v18 data];

      if (v20)
      {
        int v21 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          v32 = [(id)objc_opt_class() description];
          uint64_t v33 = [v6 eventIDsToDelete];
          uint64_t v27 = [v33 count];
          uint64_t v28 = @"Deletion";
          if (!v27) {
            uint64_t v28 = @"Addition";
          }
          __int16 v31 = v28;
          __int16 v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v20, "length"));
          uint64_t v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "length"));
          *(_DWORD *)int buf = 138544130;
          v35 = v32;
          __int16 v36 = 2112;
          v37 = v31;
          __int16 v38 = 2112;
          uint64_t v39 = v29;
          __int16 v40 = 2112;
          BOOL v41 = v30;
          _os_log_debug_impl(&dword_18ECEB000, v21, OS_LOG_TYPE_DEBUG, "%{public}@: %@ change set compressed to %@ (from %@)", buf, 0x2Au);
        }
        float v22 = -[_CDSizeMetricFamily sizeMetricWithName:string:scale:]((uint64_t)v8, @"compressed bytes sent", 0, 1024);
        CDSizeMetricAddSize((uint64_t)v22, [v20 length]);

LABEL_18:
        if (!a3)
        {
LABEL_20:
          if (v20) {
            v24 = v20;
          }
          else {
            v24 = v7;
          }
          id v25 = v24;

          goto LABEL_24;
        }
LABEL_19:
        *a3 = v20 != 0;
        goto LABEL_20;
      }
    }
    else
    {
      free(v14);
    }
    goto LABEL_17;
  }
  id v25 = 0;
LABEL_24:

  return v25;
}

- (id)changeSetFromCompressedData:(void *)a3 deviceIdentifier:(uint64_t)a4 sequenceNumber:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (a1)
  {
    id v8 = a2;
    uint64_t v9 = [[_DKPRCompressedChangeSet alloc] initWithData:v8];

    if (!-[_DKPRCompressedChangeSet uncompressedLength]((uint64_t)v9)) {
      goto LABEL_8;
    }
    uint64_t v10 = -[_DKPRCompressedChangeSet compressedData]((uint64_t)v9);
    if (!v10) {
      goto LABEL_8;
    }
    v11 = (void *)v10;
    unint64_t v12 = -[_DKPRCompressedChangeSet compressedData]((uint64_t)v9);
    uint64_t v13 = [v12 length];

    if (v13)
    {
      size_t v14 = -[_DKPRCompressedChangeSet uncompressedLength]((uint64_t)v9) + 32;
      id v15 = (uint8_t *)malloc_type_malloc(v14, 0xC3A21B16uLL);
      -[_DKPRCompressedChangeSet compressedData]((uint64_t)v9);
      id v16 = objc_claimAutoreleasedReturnValue();
      size_t v17 = (const uint8_t *)[v16 bytes];
      uint64_t v18 = -[_DKPRCompressedChangeSet compressedData]((uint64_t)v9);
      size_t v19 = compression_decode_buffer(v15, v14, v17, [v18 length], 0, COMPRESSION_LZFSE);

      if (v19 == -[_DKPRCompressedChangeSet uncompressedLength]((uint64_t)v9))
      {
        BOOL v20 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v15 length:v19 freeWhenDone:1];
        int v21 = v20;
        if (v20)
        {
          BOOL v20 = +[_DKChangeSet createFromData:v20 deviceIdentifier:v7 sequenceNumber:a4];
        }
        goto LABEL_12;
      }
      id v25 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = [(id)objc_opt_class() description];
        uint64_t v27 = [NSNumber numberWithUnsignedLong:v19];
        uint64_t v28 = [NSNumber numberWithUnsignedLongLong:-[_DKPRCompressedChangeSet uncompressedLength]((uint64_t)v9)];
        int v29 = 138543874;
        uint64_t v30 = v26;
        __int16 v31 = 2112;
        v32 = v27;
        __int16 v33 = 2112;
        v34 = v28;
        _os_log_error_impl(&dword_18ECEB000, v25, OS_LOG_TYPE_ERROR, "%{public}@: Dropping change set, uncompressed size %@ does not match uncompressed length %@", (uint8_t *)&v29, 0x20u);
      }
      free(v15);
    }
    else
    {
LABEL_8:
      float v22 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[_DKSyncRapportKnowledgeStorage changeSetFromCompressedData:deviceIdentifier:sequenceNumber:](a1, v22);
      }
    }
    int v21 = 0;
    BOOL v20 = 0;
LABEL_12:
    id v23 = v20;

    goto LABEL_13;
  }
  id v23 = 0;
LABEL_13:

  return v23;
}

- (void)fetchDeletedEventIDsFromPeer:(id)a3 sinceDate:(id)a4 streamNames:(id)a5 limit:(unint64_t)a6 highPriority:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  v63[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  uint64_t v18 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v18);

  size_t v19 = [(_DKSyncRapportStorage *)self myDeviceID];
  if ([(_DKSyncRapportStorage *)self isAvailable]
    && ([v14 idsDeviceIdentifier], (uint64_t v20 = objc_claimAutoreleasedReturnValue()) != 0)
    && (int v21 = (void *)v20,
        BOOL v22 = [(_DKSyncRapportStorage *)self isTransportActiveForPeer:v14],
        v21,
        v22))
  {
    BOOL v42 = v9;
    id v23 = [MEMORY[0x1E4F1C9C8] date];
    v61[0] = @"sinceDate";
    v61[1] = @"streamNames";
    v62[0] = v15;
    v62[1] = v16;
    v61[2] = @"limit";
    v24 = [NSNumber numberWithUnsignedInteger:a6];
    v62[2] = v24;
    id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:3];
    v63[0] = v25;
    id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:1];

    uint64_t v27 = &stru_1EDDE58B8;
    if (v19) {
      uint64_t v27 = v19;
    }
    v59[0] = @"client";
    v59[1] = @"queries";
    v60[0] = v27;
    v60[1] = v26;
    v59[2] = @"version";
    v60[2] = @"1.0";
    uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:3];
    int v29 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      __int16 v38 = v23;
      BOOL v41 = [(id)objc_opt_class() description];
      int v32 = [v14 me];
      __int16 v33 = @"pseudo ";
      v34 = &stru_1EDDE58B8;
      if (!v32) {
        __int16 v33 = &stru_1EDDE58B8;
      }
      v37 = v33;
      __int16 v40 = [v14 identifier];
      uint64_t v39 = [v14 model];
      if (v39)
      {
        uint64_t v35 = NSString;
        __int16 v36 = [v14 model];
        v34 = [v35 stringWithFormat:@" (%@)", v36];
      }
      *(_DWORD *)int buf = 138544386;
      id v50 = v41;
      __int16 v51 = 2114;
      id v52 = v37;
      __int16 v53 = 2114;
      uint64_t v54 = v40;
      __int16 v55 = 2114;
      v56 = v34;
      __int16 v57 = 2112;
      v58 = v28;
      _os_log_debug_impl(&dword_18ECEB000, v29, OS_LOG_TYPE_DEBUG, "%{public}@: Sending deleted event ids request to %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
      if (v39)
      {
      }
      id v23 = v38;
    }

    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __115___DKSyncRapportKnowledgeStorage_fetchDeletedEventIDsFromPeer_sinceDate_streamNames_limit_highPriority_completion___block_invoke;
    v45[3] = &unk_1E5610D90;
    v45[4] = self;
    id v46 = v14;
    id v47 = v23;
    id v48 = v17;
    id v30 = v17;
    id v31 = v23;
    [(_DKSyncRapportStorage *)self sendRequestID:@"com.apple.coreduet.fetch-deleted-event-ids" request:v28 peer:v46 highPriority:v42 options:0 responseHandler:v45];
  }
  else
  {
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __115___DKSyncRapportKnowledgeStorage_fetchDeletedEventIDsFromPeer_sinceDate_streamNames_limit_highPriority_completion___block_invoke_2;
    v43[3] = &unk_1E560D640;
    id v44 = v17;
    id v26 = v17;
    [(_DKSyncRapportStorage *)self handleAvailabilityFailureWithPeer:v14 completion:v43];
    uint64_t v28 = v44;
  }
}

- (void)handleFetchDeletedEventIDsWithResponse:(void *)a3 options:(void *)a4 error:(void *)a5 peer:(void *)a6 plStartDate:(void *)a7 completion:
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  v62 = a2;
  id v59 = a3;
  id v70 = a4;
  id v73 = a5;
  id v63 = a6;
  id v64 = a7;
  v69 = a1;
  if (!a1) {
    goto LABEL_62;
  }
  uint64_t v13 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v13);

  id v14 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    [(id)objc_opt_class() description];
    objc_claimAutoreleasedReturnValue();
    -[_DKSyncRapportKnowledgeStorage handleFetchDeletedEventIDsWithResponse:options:error:peer:plStartDate:completion:]();
  }

  id v15 = v70;
  if (!v70)
  {
    int v21 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      id v52 = [(id)objc_opt_class() description];
      if ([v73 me]) {
        __int16 v53 = @"pseudo ";
      }
      else {
        __int16 v53 = &stru_1EDDE58B8;
      }
      uint64_t v54 = [v73 identifier];
      __int16 v55 = [v73 model];
      if (v55)
      {
        __int16 v57 = NSString;
        a3 = [v73 model];
        v56 = [v57 stringWithFormat:@" (%@)", a3];
      }
      else
      {
        v56 = &stru_1EDDE58B8;
      }
      *(_DWORD *)int buf = 138544386;
      long long v86 = v52;
      __int16 v87 = 2114;
      long long v88 = v53;
      __int16 v89 = 2114;
      __int16 v90 = v54;
      __int16 v91 = 2114;
      __int16 v92 = v56;
      __int16 v93 = 2112;
      __int16 v94 = v62;
      _os_log_debug_impl(&dword_18ECEB000, v21, OS_LOG_TYPE_DEBUG, "%{public}@: Received fetch deleted event ids response from %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
      if (v55)
      {
      }
    }

    uint64_t v22 = +[_DKSyncErrors invalidResponse];
    uint64_t v18 = [(__CFString *)v62 objectForKeyedSubscript:@"results"];
    if ([v18 count] != 1)
    {
      long long v78 = 0;
      v79 = 0;
      size_t v19 = 0;
      uint64_t v20 = 1;
      id v70 = v22;
      goto LABEL_57;
    }
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id obj = v18;
    uint64_t v23 = [obj countByEnumeratingWithState:&v80 objects:v84 count:16];
    v58 = v18;
    if (!v23)
    {
      long long v78 = 0;
      v79 = 0;
      v24 = 0;
      BOOL v68 = 1;
      id v70 = v22;
      goto LABEL_56;
    }
    long long v78 = 0;
    v79 = 0;
    v24 = 0;
    uint64_t v71 = *(void *)v81;
    BOOL v68 = 1;
    id v70 = v22;
    while (1)
    {
      uint64_t v72 = v23;
      uint64_t v25 = 0;
      id v26 = v78;
      uint64_t v27 = v79;
      do
      {
        if (*(void *)v81 != v71) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = [obj objectForKeyedSubscript:*(void *)(*((void *)&v80 + 1) + 8 * v25)];
        uint64_t v29 = [v28 objectForKeyedSubscript:@"encodedDeletedEventIDs"];
        uint64_t v30 = [v28 objectForKeyedSubscript:@"compressedDeletedEventIDs"];
        v79 = [v28 objectForKeyedSubscript:@"sinceDate"];

        long long v78 = [v28 objectForKeyedSubscript:@"untilDate"];

        if (v29 | v30) {
          BOOL v31 = v79 == 0;
        }
        else {
          BOOL v31 = 1;
        }
        if (!v31 && v78 != 0)
        {
          long long v75 = [v73 sourceDeviceUUID];
          __int16 v33 = [v28 objectForKeyedSubscript:@"sequenceNumber"];
          uint64_t v34 = [v33 unsignedIntegerValue];

          if (v30)
          {
            id v74 = -[_DKSyncRapportKnowledgeStorage changeSetFromCompressedData:deviceIdentifier:sequenceNumber:]((uint64_t)v69, (void *)v30, v75, v34);
            uint64_t v35 = [v74 eventIDsToDelete];
            goto LABEL_27;
          }
          if ([(id)v29 length])
          {
            id v74 = +[_DKChangeSet createFromData:v29 deviceIdentifier:v75 sequenceNumber:v34];
            uint64_t v35 = [v74 eventIDsToDelete];
LABEL_27:
            long long v77 = (void *)v35;
          }
          else
          {
            long long v77 = objc_opt_new();
            id v74 = 0;
          }

          BOOL v68 = [v77 count] == 0;
          if (v77)
          {
            __int16 v36 = +[_CDLogging syncChannel];
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              uint64_t v67 = [(id)objc_opt_class() description];
              objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v77, "count"));
              v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
              if ([v73 me]) {
                __int16 v38 = @"pseudo ";
              }
              else {
                __int16 v38 = &stru_1EDDE58B8;
              }
              uint64_t v39 = [v73 identifier];
              __int16 v40 = [v73 model];
              if (v40)
              {
                BOOL v41 = NSString;
                id v66 = [v73 model];
                char v65 = [v41 stringWithFormat:@" (%@)", v66];
                BOOL v42 = v65;
              }
              else
              {
                BOOL v42 = &stru_1EDDE58B8;
              }
              *(_DWORD *)int buf = 138544386;
              long long v86 = v67;
              __int16 v87 = 2112;
              long long v88 = v37;
              __int16 v89 = 2114;
              __int16 v90 = v38;
              __int16 v91 = 2114;
              __int16 v92 = v39;
              __int16 v93 = 2114;
              __int16 v94 = v42;
              _os_log_impl(&dword_18ECEB000, v36, OS_LOG_TYPE_INFO, "%{public}@: Fetched %@ deleted event ids from %{public}@peer %{public}@%{public}@", buf, 0x34u);
              if (v40)
              {
              }
            }

            id v43 = v70;
            id v70 = 0;
          }
          else
          {
            id v43 = +[_CDLogging syncChannel];
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
            {
              id v44 = [(id)objc_opt_class() description];
              if ([v73 me]) {
                int v45 = @"pseudo ";
              }
              else {
                int v45 = &stru_1EDDE58B8;
              }
              id v46 = [v73 identifier];
              id v47 = [v73 model];
              id v48 = &stru_1EDDE58B8;
              if (v47)
              {
                unint64_t v49 = NSString;
                uint64_t v61 = [v73 model];
                v60 = [v49 stringWithFormat:@" (%@)", v61];
                id v48 = v60;
              }
              *(_DWORD *)int buf = 138544130;
              long long v86 = v44;
              __int16 v87 = 2114;
              long long v88 = v45;
              __int16 v89 = 2114;
              __int16 v90 = v46;
              __int16 v91 = 2114;
              __int16 v92 = v48;
              _os_log_debug_impl(&dword_18ECEB000, v43, OS_LOG_TYPE_DEBUG, "%{public}@: Unable to decode deleted event ids from %{public}@peer %{public}@%{public}@", buf, 0x2Au);
              if (v47)
              {
              }
            }
          }

          v24 = v77;
        }

        ++v25;
        id v26 = v78;
        uint64_t v27 = v79;
      }
      while (v72 != v25);
      uint64_t v23 = [obj countByEnumeratingWithState:&v80 objects:v84 count:16];
      if (!v23)
      {
LABEL_56:

        uint64_t v20 = v68;
        size_t v19 = v24;
        uint64_t v18 = v58;
        goto LABEL_57;
      }
    }
  }
  if ([v70 code] == -6714
    && ([v70 domain],
        id v16 = objc_claimAutoreleasedReturnValue(),
        int v17 = [v16 isEqualToString:*MEMORY[0x1E4F94770]],
        v16,
        id v15 = v70,
        v17))
  {
    uint64_t v18 = +[_DKSyncPeerStatusTracker sharedInstance];
    objc_msgSend(v18, "removeActiveTransports:fromPeer:", objc_msgSend(a1, "transportType"), v73);
    long long v78 = 0;
    v79 = 0;
    size_t v19 = 0;
    uint64_t v20 = 1;
  }
  else
  {
    [a1 transformResponseError:v15];
    long long v78 = 0;
    v79 = 0;
    size_t v19 = 0;
    uint64_t v20 = 1;
    v70 = uint64_t v18 = v15;
  }
LABEL_57:

  if (v63)
  {
    id v50 = [MEMORY[0x1E4F1C9C8] date];
    __int16 v51 = [v69[3] syncType];
    +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", v51, [v69 transportType], v63, v50, v20);
  }
  if (v64) {
    v64[2]();
  }

LABEL_62:
}

- (void)fetchDeletionsHighWaterMarkWithPeer:(id)a3 highPriority:(BOOL)a4 completion:(id)a5
{
  if (a5)
  {
    id v6 = (void *)MEMORY[0x1E4F1C9C8];
    id v7 = a5;
    id v8 = [v6 date];
    (*((void (**)(id, id, void))a5 + 2))(v7, v8, 0);
  }
}

- (void)fetchAdditionsHighWaterMarkWithPeer:(id)a3 highPriority:(BOOL)a4 completion:(id)a5
{
  if (a5)
  {
    id v6 = (void *)MEMORY[0x1E4F1C9C8];
    id v7 = a5;
    id v8 = [v6 date];
    (*((void (**)(id, id, void))a5 + 2))(v7, v8, 0);
  }
}

- (void)setFetchDelegate:(id)a3
{
  id v4 = (_DKSyncRemoteKnowledgeStorageFetchDelegate *)a3;
  id v5 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v5);

  delegate = self->_delegate;
  self->_delegate = v4;
  id v7 = v4;

  id v8 = [(_DKSyncRemoteKnowledgeStorageFetchDelegate *)self->_delegate deviceUUID];

  id v9 = [v8 UUIDString];

  [(_DKSyncRapportStorage *)self setDeviceID:v9];
}

- (void)updateStorageWithAddedEvents:(id)a3 deletedEventIDs:(id)a4 highPriority:(BOOL)a5 completion:(id)a6
{
  id v8 = (void (**)(id, void *))a6;
  id v6 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v6);

  if (v8)
  {
    id v7 = +[_DKSyncErrors internalFailure];
    v8[2](v8, v7);
  }
}

- (_DKSyncRemoteKnowledgeStorageFetchDelegate)delegate
{
  return self->_delegate;
}

- (_DKSync2Policy)policy
{
  return self->_policy;
}

- (void)setPolicy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)handleFetchEventsWithRequest:options:responseHandler:.cold.1()
{
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_0_15(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_39(&dword_18ECEB000, "%{public}@: Calling response handler with fetch events response: %@", v4, v5);
}

- (void)handleFetchEventsWithRequest:options:responseHandler:.cold.2()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_11_5(&dword_18ECEB000, v3, v4, "%{public}@: Failed to fetch events, missing delegate", v5);
}

- (void)handleFetchEventsWithRequest:options:responseHandler:.cold.3()
{
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_0_15(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_12_5(&dword_18ECEB000, "%{public}@: Failed to encode change set as protobuf: %@", v4, v5);
}

- (void)handleFetchEventsWithRequest:options:responseHandler:.cold.4()
{
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_0_15(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_39(&dword_18ECEB000, "%{public}@: Received fetch events request for up to %@ events", v4, v5);
}

- (void)handleFetchEventsWithRequest:options:responseHandler:.cold.5()
{
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_0_15(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_39(&dword_18ECEB000, "%{public}@: Received fetch events request: %@", v4, v5);
}

- (void)handleFetchEventsWithRequest:options:responseHandler:.cold.6()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_11(&dword_18ECEB000, v3, v4, "%{public}@: Handling fetch events request", v5);
}

- (void)handleFetchDeletedEventIDsWithRequest:options:responseHandler:.cold.1()
{
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_0_15(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_39(&dword_18ECEB000, "%{public}@: Calling response handler with fetch deleted event ids response: %@", v4, v5);
}

- (void)handleFetchDeletedEventIDsWithRequest:options:responseHandler:.cold.2()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_11_5(&dword_18ECEB000, v3, v4, "%{public}@: Failed to fetch deleted event ids, missing delegate", v5);
}

- (void)handleFetchDeletedEventIDsWithRequest:options:responseHandler:.cold.3()
{
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_0_15(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_39(&dword_18ECEB000, "%{public}@: Received fetch deleted event ids request: %@", v4, v5);
}

- (void)handleFetchDeletedEventIDsWithRequest:options:responseHandler:.cold.4()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_11(&dword_18ECEB000, v3, v4, "%{public}@: Handling fetch deleted event ids request", v5);
}

- (void)handleFetchEventsWithResponse:options:error:peer:plStartDate:completion:.cold.1()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_11(&dword_18ECEB000, v3, v4, "%{public}@: Handling fetch events response", v5);
}

- (void)changeSetFromCompressedData:(uint64_t)a1 deviceIdentifier:(NSObject *)a2 sequenceNumber:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v3 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_6(&dword_18ECEB000, a2, v4, "%{public}@: Dropping change set, unable to decode due to invalid data", v5);
}

- (void)handleFetchDeletedEventIDsWithResponse:options:error:peer:plStartDate:completion:.cold.1()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_11(&dword_18ECEB000, v3, v4, "%{public}@: Handling fetch deleted event ids response", v5);
}

@end