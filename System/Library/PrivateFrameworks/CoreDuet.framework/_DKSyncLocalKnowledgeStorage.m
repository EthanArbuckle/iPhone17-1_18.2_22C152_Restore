@interface _DKSyncLocalKnowledgeStorage
+ (void)_updateEventStatsWithFetchEventsTotal:(void *)a3 streamNameCounts:;
+ (void)_updateEventStatsWithFetchTombstonesTotal:(void *)a3 streamNameCounts:;
- (BOOL)deleteEventsWithEventIDs:(id)a3 error:(id *)a4;
- (BOOL)saveEvents:(id)a3 error:(id *)a4;
- (BOOL)saveSyncedDownWindows:(id)a3 peer:(id)a4 transportName:(id)a5 error:(id *)a6;
- (_DKSyncHistory)syncHistoryForPeer:(void *)a3 streamName:(void *)a4 transportName:(void *)a5 type:(void *)a6 error:;
- (id)additionsSyncHistoryForPeer:(id)a3 transportName:(id)a4 error:(id *)a5;
- (id)deletionsSyncHistoryForPeer:(id)a3 transportName:(id)a4 error:(id *)a5;
- (id)initWithKnowledgeStorage:(id *)a1;
- (id)lastSyncDownDeletionDateForPeer:(id)a3 transportName:(id)a4 error:(id *)a5;
- (id)sortedEventsFromSyncWindows:(id)a3 streamNames:(id)a4 compatibility:(id)a5 limit:(unint64_t)a6 fetchOrder:(int64_t)a7 error:(id *)a8;
- (id)sortedEventsFromSyncWindows:(id)a3 streamNames:(id)a4 limit:(unint64_t)a5 fetchOrder:(int64_t)a6 error:(id *)a7;
- (id)sortedSyncDownWindowsOverlappingBetweenDate:(id)a3 andDate:(id)a4 peer:(id)a5 error:(id *)a6;
- (id)tombstonesSinceDate:(id)a3 streamNames:(id)a4 limit:(unint64_t)a5 endDate:(id *)a6 error:(id *)a7;
- (void)setLastSyncDownDeletionDate:(id)a3 previousDate:(id)a4 forPeer:(id)a5 transportName:(id)a6 error:(id *)a7;
@end

@implementation _DKSyncLocalKnowledgeStorage

- (id)initWithKnowledgeStorage:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)_DKSyncLocalKnowledgeStorage;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

- (id)sortedEventsFromSyncWindows:(id)a3 streamNames:(id)a4 limit:(unint64_t)a5 fetchOrder:(int64_t)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a3;
  v14 = +[_DKCompatibility currentCompatibility];
  v15 = [(_DKSyncLocalKnowledgeStorage *)self sortedEventsFromSyncWindows:v13 streamNames:v12 compatibility:v14 limit:a5 fetchOrder:a6 error:a7];

  return v15;
}

- (id)sortedEventsFromSyncWindows:(id)a3 streamNames:(id)a4 compatibility:(id)a5 limit:(unint64_t)a6 fetchOrder:(int64_t)a7 error:(id *)a8
{
  uint64_t v165 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  if (a8) {
    *a8 = 0;
  }
  if (![v14 count] || !objc_msgSend(v15, "count"))
  {
    id v30 = 0;
    goto LABEL_49;
  }
  v127 = self;
  unint64_t v128 = a6;
  v125 = a8;
  id v126 = v14;
  v129 = v16;
  v130 = v15;
  long long v138 = 0u;
  long long v139 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  id v17 = v14;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v136 objects:v164 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    id v20 = 0;
    uint64_t v21 = *(void *)v137;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v137 != v21) {
          objc_enumerationMutation(v17);
        }
        uint64_t v23 = *(void *)(*((void *)&v136 + 1) + 8 * i);
        v24 = -[_DKSyncWindow startDate](v23);
        v25 = -[_DKSyncType urgency](v23);
        if (a7 == 2) {
          +[_DKQuery predicateForEventsWithCreationInDateRangeFrom:v24 toBefore:v25];
        }
        else {
        v26 = +[_DKQuery predicateForEventsWithCreationInDateRangeFromAfter:v24 to:v25];
        }

        if (v20)
        {
          v27 = (void *)MEMORY[0x1E4F28BA0];
          v163[0] = v20;
          v163[1] = v26;
          v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v163 count:2];
          uint64_t v29 = [v27 orPredicateWithSubpredicates:v28];

          id v20 = (id)v29;
        }
        else
        {
          id v20 = v26;
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v136 objects:v164 count:16];
    }
    while (v19);
  }
  else
  {
    id v20 = 0;
  }

  v31 = v130;
  uint64_t v32 = +[_DKQuery predicateForEventsWithStreamNames:v130];
  v33 = (void *)MEMORY[0x1E4F28BA0];
  v162[0] = v20;
  v124 = (void *)v32;
  v162[1] = v32;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v162 count:2];
  v35 = [v33 andPredicateWithSubpredicates:v34];

  uint64_t v36 = +[_DKQuery predicateForEventsWithNullSourceDeviceID];
  v37 = (void *)MEMORY[0x1E4F28BA0];
  v161[0] = v35;
  v123 = (void *)v36;
  v161[1] = v36;
  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v161 count:2];
  v39 = [v37 andPredicateWithSubpredicates:v38];

  v40 = +[_DKSystemEventStreams displayIsBacklit];
  uint64_t v41 = [v40 name];

  v122 = (void *)v41;
  if ([v130 containsObject:v41])
  {
    v120 = +[_DKQuery predicateForEventsWithStreamName:v41];
    v111 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v120];
    v42 = +[_DKAnyIntegerCategory type];
    v43 = +[_DKCategory categoryWithInteger:1 type:v42];
    v117 = +[_DKQuery predicateForEventsWithCategoryValue:v43];

    +[_DKQuery predicateForEventsWithMinimumDuration:6.0];
    v114 = v44 = v39;
    v45 = (void *)MEMORY[0x1E4F28BA0];
    v160[0] = v117;
    v160[1] = v114;
    v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v160 count:2];
    v47 = [v45 andPredicateWithSubpredicates:v46];

    v48 = (void *)MEMORY[0x1E4F28BA0];
    v159[0] = v111;
    v159[1] = v47;
    v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v159 count:2];
    v50 = [v48 orPredicateWithSubpredicates:v49];

    v51 = (void *)MEMORY[0x1E4F28BA0];
    v31 = v130;
    v158[0] = v39;
    v158[1] = v50;
    v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v158 count:2];
    v39 = [v51 andPredicateWithSubpredicates:v52];
  }
  v53 = +[_DKSystemEventStreams nowPlayingStream];
  uint64_t v54 = [v53 name];

  v121 = (void *)v54;
  if ([v31 containsObject:v54])
  {
    v115 = +[_DKQuery predicateForEventsWithStreamName:v54];
    v118 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v115];
    v112 = +[_DKQuery predicateForEventsWithStringValue:@"com.apple.quicklook.UIExtension"];
    v55 = +[_DKNowPlayingMetadataKey mediaType];
    v110 = +[_DKQuery predicateForObjectsWithMetadataKey:v55 andStringValue:@"kMRMediaRemoteNowPlayingInfoTypeVideo"];

    v56 = +[_DKNowPlayingMetadataKey playing];
    v57 = +[_DKQuery predicateForObjectsWithMetadataKey:v56 andIntegerValue:1];

    v58 = (void *)MEMORY[0x1E4F28BA0];
    v157[0] = v112;
    v157[1] = v110;
    v157[2] = v57;
    v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v157 count:3];
    v60 = [v58 andPredicateWithSubpredicates:v59];

    v61 = (void *)MEMORY[0x1E4F28BA0];
    v156[0] = v118;
    v156[1] = v60;
    v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:v156 count:2];
    v63 = [v61 orPredicateWithSubpredicates:v62];

    v64 = (void *)MEMORY[0x1E4F28BA0];
    v155[0] = v39;
    v155[1] = v63;
    v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v155 count:2];
    uint64_t v66 = [v64 andPredicateWithSubpredicates:v65];

    v31 = v130;
    v39 = (void *)v66;
  }
  v67 = +[_DKSystemEventStreams appActivityStream];
  uint64_t v68 = [v67 name];

  v119 = (void *)v68;
  if ([v31 containsObject:v68])
  {
    v69 = +[_DKQuery predicateForEventsWithStreamName:v68];
    v70 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v69];
    v71 = +[_DKApplicationActivityMetadataKey isEligibleForPrediction];
    v72 = +[_DKQuery predicateForObjectsWithMetadataKey:v71 andIntegerValue:1];

    v73 = (void *)MEMORY[0x1E4F28BA0];
    v154[0] = v70;
    v154[1] = v72;
    v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:v154 count:2];
    v75 = [v73 orPredicateWithSubpredicates:v74];

    v76 = (void *)MEMORY[0x1E4F28BA0];
    v153[0] = v39;
    v153[1] = v75;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v153 count:2];
    v78 = v77 = v39;
    uint64_t v79 = [v76 andPredicateWithSubpredicates:v78];

    v39 = (void *)v79;
  }
  v80 = +[_DKCompatibility currentCompatibility];
  char v81 = [v129 isEqual:v80];

  if (v81)
  {
    unint64_t v82 = 0x1E4F1C000;
  }
  else
  {
    v83 = [v129 eventPredicate];
    v84 = (void *)MEMORY[0x1E4F28BA0];
    v152[0] = v39;
    v152[1] = v83;
    unint64_t v82 = 0x1E4F1C000uLL;
    v85 = [MEMORY[0x1E4F1C978] arrayWithObjects:v152 count:2];
    uint64_t v86 = [v84 andPredicateWithSubpredicates:v85];

    v39 = (void *)v86;
  }
  v87 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:a7 != 2];
  v151 = v87;
  v88 = [*(id *)(v82 + 2424) arrayWithObjects:&v151 count:1];
  v89 = +[_DKEventQuery eventQueryWithPredicate:v39 eventStreams:0 offset:0 limit:v128 sortDescriptors:v88];
  v90 = [NSString stringWithUTF8String:"_DKSyncLocalKnowledgeStorage.m"];
  v91 = objc_msgSend(v90, "stringByAppendingFormat:", @":%d", 198);
  [v89 setClientName:v91];

  [v89 setTracker:&__block_literal_global_42];
  storage = v127->_storage;
  id v135 = 0;
  id v30 = [(_DKKnowledgeStorage *)storage executeQuery:v89 error:&v135];
  id v93 = v135;
  if (a7 == 2 && v30)
  {
    if (![v30 count]) {
      goto LABEL_35;
    }
    v94 = [v30 reverseObjectEnumerator];
    uint64_t v95 = [v94 allObjects];

    id v30 = (id)v95;
  }
  if (v30)
  {
LABEL_35:
    if ([v30 count])
    {
      id v113 = v93;
      v116 = v39;
      v96 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
      {
        v105 = [(id)objc_opt_class() description];
        v106 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v30, "count"));
        v107 = _DKSyncLoggingWindowsDescription(v17);
        v108 = _CDPrettyPrintCollection(v130, 0, 0, 0);
        v109 = [NSNumber numberWithUnsignedInteger:v128];
        *(_DWORD *)buf = 138544386;
        v142 = v105;
        __int16 v143 = 2112;
        v144 = v106;
        __int16 v145 = 2114;
        v146 = v107;
        __int16 v147 = 2114;
        v148 = v108;
        __int16 v149 = 2112;
        v150 = v109;
        _os_log_debug_impl(&dword_18ECEB000, v96, OS_LOG_TYPE_DEBUG, "%{public}@: Found %@ events in windows %{public}@ on streams %{public}@ with limit %@", buf, 0x34u);
      }
      v97 = objc_opt_new();
      long long v131 = 0u;
      long long v132 = 0u;
      long long v133 = 0u;
      long long v134 = 0u;
      id v30 = v30;
      uint64_t v98 = [v30 countByEnumeratingWithState:&v131 objects:v140 count:16];
      if (v98)
      {
        uint64_t v99 = v98;
        uint64_t v100 = *(void *)v132;
        do
        {
          for (uint64_t j = 0; j != v99; ++j)
          {
            if (*(void *)v132 != v100) {
              objc_enumerationMutation(v30);
            }
            v102 = [*(id *)(*((void *)&v131 + 1) + 8 * j) stream];
            v103 = [v102 name];
            [v97 addObject:v103];
          }
          uint64_t v99 = [v30 countByEnumeratingWithState:&v131 objects:v140 count:16];
        }
        while (v99);
      }

      +[_DKSyncLocalKnowledgeStorage _updateEventStatsWithFetchEventsTotal:streamNameCounts:]((uint64_t)_DKSyncLocalKnowledgeStorage, [v30 count], v97);
      id v93 = v113;
      v39 = v116;
    }
  }
  if (v125) {
    id *v125 = v93;
  }

  id v14 = v126;
  id v16 = v129;
  id v15 = v130;
LABEL_49:

  return v30;
}

+ (void)_updateEventStatsWithFetchEventsTotal:(void *)a3 streamNameCounts:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self;
  if (_updateEventStatsWithFetchEventsTotal_streamNameCounts__fetchEventsCounterInitialized != -1) {
    dispatch_once(&_updateEventStatsWithFetchEventsTotal_streamNameCounts__fetchEventsCounterInitialized, &__block_literal_global_37);
  }
  -[_DKEventStatsCounter incrementCountByNumber:](_updateEventStatsWithFetchEventsTotal_streamNameCounts__fetchEventsTotalCounter, a2);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v11 = [(id)_updateEventStatsWithFetchEventsTotal_streamNameCounts__fetchEventsCountersByStreamName objectForKeyedSubscript:v10];
        if (!v11)
        {
          id v12 = NSString;
          id v13 = +[_DKEventStatsUtilities safeStringWithString:v10];
          id v14 = [v12 stringWithFormat:@"sync_fetch_local_events_stream%@", v13];

          v11 = +[_DKEventStatsCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsCounter, @"coreduet_sync2", v14);
          [(id)_updateEventStatsWithFetchEventsTotal_streamNameCounts__fetchEventsCountersByStreamName setObject:v11 forKeyedSubscript:v10];
        }
        -[_DKEventStatsCounter incrementCountByNumber:]((uint64_t)v11, [v5 countForObject:v10]);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (id)tombstonesSinceDate:(id)a3 streamNames:(id)a4 limit:(unint64_t)a5 endDate:(id *)a6 error:(id *)a7
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = v12;
  if (a7) {
    *a7 = 0;
  }
  if ([v12 count])
  {
    v65 = self;
    v63 = a6;
    v69 = a7;
    v71 = v11;
    id v14 = objc_opt_new();
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    v70 = v13;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v79 objects:v95 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v80;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v80 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v79 + 1) + 8 * i);
          uint64_t v21 = +[_DKTombstoneMetadataKey eventStreamName];
          v22 = +[_DKQuery predicateForObjectsWithMetadataKey:v21 andStringValue:v20];
          [v14 addObject:v22];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v79 objects:v95 count:16];
      }
      while (v17);
    }

    uint64_t v23 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v14];
    v24 = [MEMORY[0x1E4F1C9C8] date];
    id v11 = v71;
    uint64_t v25 = +[_DKQuery predicateForEventsWithCreationInDateRangeFromAfter:v71 to:v24];
    v26 = (void *)MEMORY[0x1E4F28BA0];
    v67 = (void *)v25;
    uint64_t v68 = (void *)v23;
    v94[0] = v23;
    v94[1] = v25;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:2];
    v28 = [v26 andPredicateWithSubpredicates:v27];

    if ((uint64_t)a5 < 1)
    {
      v31 = 0;
    }
    else
    {
      uint64_t v29 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
      id v30 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
      v93[0] = v29;
      v93[1] = v30;
      v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:2];
    }
    v33 = +[_DKSystemEventStreams tombstoneStream];
    v92 = v33;
    v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v92 count:1];
    unint64_t v35 = a5;
    v73 = v31;
    uint64_t v36 = +[_DKEventQuery eventQueryWithPredicate:v28 eventStreams:v34 offset:0 limit:v35 sortDescriptors:v31];

    v37 = [NSString stringWithUTF8String:"_DKSyncLocalKnowledgeStorage.m"];
    v38 = objc_msgSend(v37, "stringByAppendingFormat:", @":%d", 272);
    [v36 setClientName:v38];

    v39 = v36;
    [v36 setTracker:&__block_literal_global_34];
    [v36 setReadMetadata:1];
    storage = v65->_storage;
    id v78 = 0;
    uint64_t v32 = [(_DKKnowledgeStorage *)storage executeQuery:v36 error:&v78];
    id v64 = v78;
    if (v64)
    {
      uint64_t v41 = +[_CDLogging syncChannel];
      v42 = v69;
      v43 = v64;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
        -[_DKSyncLocalKnowledgeStorage tombstonesSinceDate:streamNames:limit:endDate:error:]((uint64_t)v65, v64, v41);
      }
    }
    else if ([v32 count])
    {
      v61 = v36;
      v62 = v24;
      v44 = objc_opt_new();
      v45 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        v56 = [(id)objc_opt_class() description];
        v57 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v32, "count"));
        v58 = -[NSDate dk_localtimeString](v71);
        v59 = _CDPrettyPrintCollection(v15, 0, 0, 0);
        *(_DWORD *)buf = 138544130;
        v85 = v56;
        __int16 v86 = 2112;
        v87 = v57;
        __int16 v88 = 2114;
        v89 = v58;
        __int16 v90 = 2114;
        v91 = v59;
        _os_log_debug_impl(&dword_18ECEB000, v45, OS_LOG_TYPE_DEBUG, "%{public}@: Found %@ tombstones since %{public}@ on streams %{public}@", buf, 0x2Au);
      }
      uint64_t v66 = v28;

      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      v60 = v32;
      id v46 = v32;
      uint64_t v47 = [v46 countByEnumeratingWithState:&v74 objects:v83 count:16];
      if (v47)
      {
        uint64_t v48 = v47;
        uint64_t v49 = *(void *)v75;
        do
        {
          for (uint64_t j = 0; j != v48; ++j)
          {
            if (*(void *)v75 != v49) {
              objc_enumerationMutation(v46);
            }
            v51 = [*(id *)(*((void *)&v74 + 1) + 8 * j) metadata];
            v52 = +[_DKTombstoneMetadataKey eventStreamName];
            v53 = [v51 objectForKeyedSubscript:v52];

            if (v53) {
              [v44 addObject:v53];
            }
          }
          uint64_t v48 = [v46 countByEnumeratingWithState:&v74 objects:v83 count:16];
        }
        while (v48);
      }

      if (v63)
      {
        uint64_t v54 = [v46 lastObject];
        id *v63 = [v54 creationDate];
      }
      +[_DKSyncLocalKnowledgeStorage _updateEventStatsWithFetchTombstonesTotal:streamNameCounts:]((uint64_t)_DKSyncLocalKnowledgeStorage, [v46 count], v44);

      id v11 = v71;
      v31 = v73;
      v42 = v69;
      v39 = v61;
      v24 = v62;
      v43 = 0;
      v28 = v66;
      uint64_t v32 = v60;
    }
    else
    {
      v42 = v69;
      v43 = 0;
      if (v63) {
        id *v63 = v24;
      }
    }
    id v13 = v70;
    if (v42) {
      id *v42 = v43;
    }
  }
  else
  {
    uint64_t v32 = 0;
  }

  return v32;
}

+ (void)_updateEventStatsWithFetchTombstonesTotal:(void *)a3 streamNameCounts:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self;
  if (_updateEventStatsWithFetchTombstonesTotal_streamNameCounts__fetchTombstonesCounterInitialized != -1) {
    dispatch_once(&_updateEventStatsWithFetchTombstonesTotal_streamNameCounts__fetchTombstonesCounterInitialized, &__block_literal_global_48);
  }
  -[_DKEventStatsCounter incrementCountByNumber:](_updateEventStatsWithFetchTombstonesTotal_streamNameCounts__fetchTombstonesTotalCounter, a2);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v11 = [(id)_updateEventStatsWithFetchTombstonesTotal_streamNameCounts__fetchTombstonesCountersByStreamName objectForKeyedSubscript:v10];
        if (!v11)
        {
          id v12 = NSString;
          id v13 = +[_DKEventStatsUtilities safeStringWithString:v10];
          id v14 = [v12 stringWithFormat:@"sync_fetch_local_tombstones_stream%@", v13];

          id v11 = +[_DKEventStatsCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsCounter, @"coreduet_sync2", v14);
          [(id)_updateEventStatsWithFetchTombstonesTotal_streamNameCounts__fetchTombstonesCountersByStreamName setObject:v11 forKeyedSubscript:v10];
        }
        -[_DKEventStatsCounter incrementCountByNumber:]((uint64_t)v11, [v5 countForObject:v10]);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (id)sortedSyncDownWindowsOverlappingBetweenDate:(id)a3 andDate:(id)a4 peer:(id)a5 error:(id *)a6
{
  v93[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (a6) {
    *a6 = 0;
  }
  v57 = a6;
  id v11 = [a5 sourceDeviceID];
  uint64_t v12 = +[_DKSyncMetadataStorage windowStreamNameWithSourceDeviceID:]((uint64_t)_DKSyncMetadataStorage, v11);

  id v13 = +[_DKAnyStringIdentifier type];
  v70 = (void *)v12;
  id v14 = +[_DKEventStream eventStreamWithName:v12 valueType:v13];
  v93[0] = v14;
  uint64_t v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:1];

  uint64_t v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE"];
  uint64_t v16 = +[_DKQuery predicateForEventsWithStartInDateRangeFrom:v9 to:v10];
  uint64_t v17 = +[_DKQuery predicateForEventsWithEndInDateRangeFrom:v9 to:v10];
  long long v18 = [MEMORY[0x1E4F1C9C8] distantPast];
  id v71 = v9;
  uint64_t v19 = +[_DKQuery predicateForEventsWithStartInDateRangeFrom:v18 to:v9];

  uint64_t v20 = (void *)v15;
  uint64_t v21 = [MEMORY[0x1E4F1C9C8] distantFuture];
  uint64_t v22 = +[_DKQuery predicateForEventsWithEndInDateRangeFrom:v10 to:v21];

  uint64_t v23 = (void *)MEMORY[0x1E4F28BA0];
  v67 = (void *)v22;
  uint64_t v68 = (void *)v19;
  v92[0] = v19;
  v92[1] = v22;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:2];
  uint64_t v25 = [v23 andPredicateWithSubpredicates:v24];

  v26 = (void *)MEMORY[0x1E4F28BA0];
  v69 = (void *)v16;
  v91[0] = v16;
  v91[1] = v17;
  v27 = (void *)v17;
  uint64_t v66 = (void *)v25;
  v91[2] = v25;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:3];
  uint64_t v29 = [v26 orPredicateWithSubpredicates:v28];

  id v30 = (void *)MEMORY[0x1E4F28BA0];
  v65 = (void *)v29;
  v90[0] = v29;
  v90[1] = v20;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:2];
  uint64_t v32 = [v30 andPredicateWithSubpredicates:v31];

  uint64_t v33 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
  v59 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"endDate" ascending:1];
  v60 = (void *)v33;
  v89[0] = v33;
  v89[1] = v59;
  v34 = (void *)v72;
  unint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:2];
  id v64 = (void *)v32;
  uint64_t v36 = +[_DKEventQuery eventQueryWithPredicate:v32 eventStreams:v72 offset:0 limit:0x7FFFFFFFFFFFFFFFLL sortDescriptors:v35];

  v37 = [NSString stringWithUTF8String:"_DKSyncLocalKnowledgeStorage.m"];
  v38 = objc_msgSend(v37, "stringByAppendingFormat:", @":%d", 411);
  [v36 setClientName:v38];

  [v36 setTracker:&__block_literal_global_69];
  storage = self->_storage;
  id v77 = 0;
  v40 = [(_DKKnowledgeStorage *)storage executeQuery:v36 error:&v77];
  id v41 = v77;
  if (v41)
  {
    v42 = +[_CDLogging syncChannel];
    v43 = v70;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v53 = [(id)objc_opt_class() description];
      [v41 domain];
      uint64_t v54 = v63 = v20;
      uint64_t v55 = [v41 code];
      *(_DWORD *)buf = 138544386;
      long long v79 = v53;
      __int16 v80 = 2114;
      long long v81 = v70;
      __int16 v82 = 2114;
      v83 = v54;
      __int16 v84 = 2048;
      uint64_t v85 = v55;
      __int16 v86 = 2112;
      id v87 = v41;
      _os_log_error_impl(&dword_18ECEB000, v42, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch missing additions window for stream %{public}@: %{public}@:%lld (%@)", buf, 0x34u);

      uint64_t v20 = v63;
      v34 = (void *)v72;
    }

    v44 = v71;
    v45 = v57;
    if (v57)
    {
      v45 = 0;
      id *v57 = v41;
    }
  }
  else
  {
    v45 = objc_opt_new();
    if ([v40 count])
    {
      v56 = v27;
      id v58 = v10;
      v62 = v20;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id v46 = v40;
      uint64_t v47 = [v46 countByEnumeratingWithState:&v73 objects:v88 count:16];
      if (v47)
      {
        uint64_t v48 = v47;
        uint64_t v49 = *(void *)v74;
        do
        {
          for (uint64_t i = 0; i != v48; ++i)
          {
            if (*(void *)v74 != v49) {
              objc_enumerationMutation(v46);
            }
            v51 = -[_DKSyncWindow initWithEvent:]([_DKSyncWindow alloc], *(void **)(*((void *)&v73 + 1) + 8 * i));
            [v45 addObject:v51];
          }
          uint64_t v48 = [v46 countByEnumeratingWithState:&v73 objects:v88 count:16];
        }
        while (v48);
      }

      v43 = v70;
      v44 = v71;
      v27 = v56;
      id v10 = v58;
      v34 = (void *)v72;
      uint64_t v20 = v62;
    }
    else
    {
      v43 = v70;
      v44 = v71;
    }
  }

  return v45;
}

- (BOOL)saveSyncedDownWindows:(id)a3 peer:(id)a4 transportName:(id)a5 error:(id *)a6
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  uint64_t v12 = [v9 sourceDeviceID];
  id v13 = +[_DKSyncMetadataStorage windowStreamNameWithSourceDeviceID:]((uint64_t)_DKSyncMetadataStorage, v12);

  id v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v15 = v8;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v52 objects:v70 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v53 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = +[_DKSyncMetadataStorage eventFromFetchedWindow:windowStreamName:transportName:]((uint64_t)_DKSyncMetadataStorage, *(void **)(*((void *)&v52 + 1) + 8 * i), v13, v10);
        if (v20) {
          [v14 addObject:v20];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v52 objects:v70 count:16];
    }
    while (v17);
  }

  if ([v14 count])
  {
    storage = self->_storage;
    id v51 = 0;
    BOOL v22 = [(_DKKnowledgeStorage *)storage saveObjects:v14 error:&v51];
    id v23 = v51;
    v24 = +[_CDLogging syncChannel];
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG);
    if (v23 || !v22)
    {
      v26 = v11;
      if (v25)
      {
        uint64_t v49 = [(id)objc_opt_class() description];
        int v33 = [v11 me];
        v34 = &stru_1EDDE58B8;
        unint64_t v35 = @"pseudo ";
        if (!v33) {
          unint64_t v35 = &stru_1EDDE58B8;
        }
        v44 = v35;
        uint64_t v36 = [v11 identifier];
        id v46 = [v11 model];
        if (v46)
        {
          v39 = NSString;
          v42 = [v11 model];
          v34 = [v39 stringWithFormat:@" (%@)", v42];
        }
        v40 = [v23 domain];
        uint64_t v41 = [v23 code];
        *(_DWORD *)buf = 138544898;
        v57 = v49;
        __int16 v58 = 2114;
        v59 = v44;
        __int16 v60 = 2114;
        v61 = v36;
        __int16 v62 = 2114;
        v63 = v34;
        __int16 v64 = 2114;
        v65 = v40;
        __int16 v66 = 2048;
        uint64_t v67 = v41;
        __int16 v68 = 2112;
        id v69 = v23;
        _os_log_debug_impl(&dword_18ECEB000, v24, OS_LOG_TYPE_DEBUG, "%{public}@: Failed to save additions windows for %{public}@peer %{public}@%{public}@: %{public}@:%lld (%@)", buf, 0x48u);

        if (v46)
        {
        }
      }
    }
    else
    {
      v26 = v11;
      if (v25)
      {
        uint64_t v48 = [(id)objc_opt_class() description];
        objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
        v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
        int v28 = [v11 me];
        uint64_t v29 = &stru_1EDDE58B8;
        id v30 = @"pseudo ";
        if (!v28) {
          id v30 = &stru_1EDDE58B8;
        }
        v43 = v30;
        v31 = [v11 identifier];
        uint64_t v32 = [v11 model];
        if (v32)
        {
          v37 = NSString;
          v42 = [v26 model];
          uint64_t v29 = [v37 stringWithFormat:@" (%@)", v42];
        }
        v38 = _DKSyncLoggingWindowsDescription(v15);
        *(_DWORD *)buf = 138544642;
        v57 = v48;
        __int16 v58 = 2112;
        v59 = v45;
        __int16 v60 = 2114;
        v61 = v43;
        __int16 v62 = 2114;
        v63 = v31;
        __int16 v64 = 2114;
        v65 = v29;
        __int16 v66 = 2114;
        uint64_t v67 = (uint64_t)v38;
        _os_log_debug_impl(&dword_18ECEB000, v24, OS_LOG_TYPE_DEBUG, "%{public}@: Saved %@ additions windows for %{public}@peer %{public}@%{public}@: windows %{public}@", buf, 0x3Eu);
        if (v32)
        {
        }
      }

      id v23 = 0;
    }
  }
  else
  {
    id v23 = +[_DKSyncErrors internalFailure];
    v26 = v11;
  }
  if (a6) {
    *a6 = v23;
  }

  return v23 == 0;
}

- (id)lastSyncDownDeletionDateForPeer:(id)a3 transportName:(id)a4 error:(id *)a5
{
  v83[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v66 = a4;
  if (a5) {
    *a5 = 0;
  }
  __int16 v62 = v8;
  id v9 = [v8 sourceDeviceID];
  v65 = +[_DKSyncMetadataStorage bookmarkStreamNameWithSourceDeviceID:]((uint64_t)_DKSyncMetadataStorage, v9);

  id v10 = self;
  objc_sync_enter(v10);
  if (v66) {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"valueString == %@", v66];
  }
  else {
  __int16 v64 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE"];
  }
  id v11 = +[_DKAnyStringIdentifier type];
  uint64_t v12 = +[_DKEventStream eventStreamWithName:v65 valueType:v11];

  v61 = (void *)v12;
  v83[0] = v12;
  v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:1];
  id v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  id v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"endDate" ascending:0];
  v82[0] = v13;
  v82[1] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:2];
  uint64_t v16 = +[_DKEventQuery eventQueryWithPredicate:v64 eventStreams:v63 offset:0 limit:1 sortDescriptors:v15];
  uint64_t v17 = [NSString stringWithUTF8String:"_DKSyncLocalKnowledgeStorage.m"];
  uint64_t v18 = objc_msgSend(v17, "stringByAppendingFormat:", @":%d", 511);
  [v16 setClientName:v18];

  [v16 setTracker:&__block_literal_global_85];
  storage = v10->_storage;
  id v67 = 0;
  uint64_t v20 = [(_DKKnowledgeStorage *)storage executeQuery:v16 error:&v67];
  id v21 = v67;
  if (v21)
  {
    BOOL v22 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      long long v55 = [(id)objc_opt_class() description];
      int v29 = [v62 me];
      id v30 = &stru_1EDDE58B8;
      if (v29) {
        id v30 = @"pseudo ";
      }
      v44 = v30;
      long long v52 = [v62 identifier];
      __int16 v58 = [v62 model];
      if (v58)
      {
        uint64_t v48 = NSString;
        v42 = [v62 model];
        uint64_t v47 = [v48 stringWithFormat:@" (%@)", v42];
      }
      else
      {
        uint64_t v47 = &stru_1EDDE58B8;
      }
      v31 = [v21 domain];
      uint64_t v32 = [v21 code];
      *(_DWORD *)buf = 138544898;
      id v69 = v55;
      __int16 v70 = 2114;
      uint64_t v71 = v44;
      __int16 v72 = 2114;
      long long v73 = v52;
      __int16 v74 = 2114;
      long long v75 = v47;
      __int16 v76 = 2114;
      id v77 = v31;
      __int16 v78 = 2048;
      uint64_t v79 = v32;
      __int16 v80 = 2112;
      id v81 = v21;
      _os_log_debug_impl(&dword_18ECEB000, v22, OS_LOG_TYPE_DEBUG, "%{public}@: Failed to find deletions bookmark for %{public}@peer %{public}@%{public}@: %{public}@:%lld (%@)", buf, 0x48u);

      if (v58)
      {
      }
    }

    if (a5)
    {
      id v23 = 0;
      *a5 = v21;
      goto LABEL_17;
    }
LABEL_16:
    id v23 = 0;
    goto LABEL_17;
  }
  if (!v20 || ![v20 count])
  {
    v26 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      long long v53 = [(id)objc_opt_class() description];
      int v33 = [v62 me];
      v34 = &stru_1EDDE58B8;
      if (v33) {
        v34 = @"pseudo ";
      }
      uint64_t v49 = v34;
      v56 = [v62 identifier];
      v59 = [v62 model];
      if (v59)
      {
        v39 = NSString;
        uint64_t v40 = [v62 model];
        unint64_t v35 = [v39 stringWithFormat:@" (%@)", v40];
        v43 = (void *)v40;
      }
      else
      {
        unint64_t v35 = &stru_1EDDE58B8;
      }
      *(_DWORD *)buf = 138544130;
      id v69 = v53;
      __int16 v70 = 2114;
      uint64_t v71 = v49;
      __int16 v72 = 2114;
      long long v73 = v56;
      __int16 v74 = 2114;
      long long v75 = v35;
      _os_log_debug_impl(&dword_18ECEB000, v26, OS_LOG_TYPE_DEBUG, "%{public}@: No deletions bookmark found for %{public}@peer %{public}@%{public}@", buf, 0x2Au);
      if (v59)
      {
      }
    }

    goto LABEL_16;
  }
  v24 = [v20 firstObject];
  id v23 = [v24 endDate];

  BOOL v25 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v36 = v62;
    v57 = [(id)objc_opt_class() description];
    int v37 = [v62 me];
    v38 = &stru_1EDDE58B8;
    if (v37) {
      v38 = @"pseudo ";
    }
    v50 = v38;
    long long v54 = [v62 identifier];
    __int16 v60 = [v62 model];
    if (v60)
    {
      id v46 = NSString;
      uint64_t v36 = [v62 model];
      v45 = [v46 stringWithFormat:@" (%@)", v36];
    }
    else
    {
      v45 = &stru_1EDDE58B8;
    }
    uint64_t v41 = -[NSDate dk_localtimeString](v23);
    *(_DWORD *)buf = 138544642;
    id v69 = v57;
    __int16 v70 = 2114;
    uint64_t v71 = v50;
    __int16 v72 = 2114;
    long long v73 = v54;
    __int16 v74 = 2114;
    long long v75 = v45;
    __int16 v76 = 2114;
    id v77 = v66;
    __int16 v78 = 2112;
    id v51 = (void *)v41;
    uint64_t v79 = v41;
    _os_log_debug_impl(&dword_18ECEB000, v25, OS_LOG_TYPE_DEBUG, "%{public}@: Found saved deletions bookmark for %{public}@peer %{public}@%{public}@ on  %{public}@: %@", buf, 0x3Eu);
    if (v60)
    {
    }
  }

LABEL_17:
  objc_sync_exit(v10);

  id v27 = v23;
  return v27;
}

- (void)setLastSyncDownDeletionDate:(id)a3 previousDate:(id)a4 forPeer:(id)a5 transportName:(id)a6 error:(id *)a7
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v60 = a3;
  id v59 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v57 = [(id)objc_opt_class() description];
    -[NSDate dk_localtimeString](v59);
    long long v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v51 = -[NSDate dk_localtimeString](v60);
    if ([v12 me]) {
      v31 = @"pseudo ";
    }
    else {
      v31 = &stru_1EDDE58B8;
    }
    uint64_t v32 = [v12 identifier];
    int v33 = [v12 model];
    if (v33)
    {
      unint64_t v35 = NSString;
      id v46 = [v12 model];
      v34 = [v35 stringWithFormat:@" (%@)", v46];
    }
    else
    {
      v34 = &stru_1EDDE58B8;
    }
    *(_DWORD *)buf = 138544898;
    __int16 v64 = v57;
    __int16 v65 = 2114;
    id v66 = v54;
    __int16 v67 = 2114;
    __int16 v68 = v51;
    __int16 v69 = 2114;
    __int16 v70 = v31;
    __int16 v71 = 2114;
    uint64_t v72 = (uint64_t)v32;
    __int16 v73 = 2114;
    uint64_t v74 = (uint64_t)v34;
    __int16 v75 = 2114;
    id v76 = v13;
    _os_log_debug_impl(&dword_18ECEB000, v14, OS_LOG_TYPE_DEBUG, "%{public}@: Setting last sync down deletion bookmark [%{public}@ ending %{public}@] for %{public}@peer %{public}@%{public}@ on %{public}@", buf, 0x48u);
    if (v33)
    {
    }
  }

  if (a7) {
    *a7 = 0;
  }
  id v15 = [v12 sourceDeviceID];
  uint64_t v16 = +[_DKSyncMetadataStorage bookmarkStreamNameWithSourceDeviceID:]((uint64_t)_DKSyncMetadataStorage, v15);

  uint64_t v17 = self;
  objc_sync_enter(v17);
  uint64_t v18 = +[_DKAnyStringIdentifier type];
  uint64_t v19 = +[_DKEventStream eventStreamWithName:v16 valueType:v18];

  uint64_t v20 = +[_DKEvent eventWithStream:v19 startDate:v59 endDate:v60 identifierStringValue:v13 metadata:0];
  id v21 = (void *)v20;
  if (v20)
  {
    storage = v17->_storage;
    uint64_t v62 = v20;
    id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
    id v61 = 0;
    int v24 = [(_DKKnowledgeStorage *)storage saveObjects:v23 error:&v61];
    id v25 = v61;

    if (v25) {
      int v26 = v24;
    }
    else {
      int v26 = 1;
    }
    if (v26 == 1)
    {
      id v27 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        long long v53 = [(id)objc_opt_class() description];
        int v28 = [v12 me];
        int v29 = &stru_1EDDE58B8;
        if (v28) {
          int v29 = @"pseudo ";
        }
        uint64_t v47 = v29;
        v50 = [v12 identifier];
        v56 = [v12 model];
        if (v56)
        {
          v38 = NSString;
          v44 = [v12 model];
          id v30 = [v38 stringWithFormat:@" (%@)", v44];
        }
        else
        {
          id v30 = &stru_1EDDE58B8;
        }
        uint64_t v39 = -[NSDate dk_localtimeString](v60);
        *(_DWORD *)buf = 138544386;
        __int16 v64 = v53;
        __int16 v65 = 2114;
        id v66 = v47;
        __int16 v67 = 2114;
        __int16 v68 = v50;
        __int16 v69 = 2114;
        __int16 v70 = v30;
        __int16 v71 = 2112;
        uint64_t v49 = (void *)v39;
        uint64_t v72 = v39;
        _os_log_debug_impl(&dword_18ECEB000, v27, OS_LOG_TYPE_DEBUG, "%{public}@: Saved deletions bookmark for %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
        if (v56)
        {
        }
      }
    }
    else
    {
      id v27 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        long long v55 = [(id)objc_opt_class() description];
        int v36 = [v12 me];
        int v37 = &stru_1EDDE58B8;
        if (v36) {
          int v37 = @"pseudo ";
        }
        v45 = v37;
        long long v52 = [v12 identifier];
        __int16 v58 = [v12 model];
        if (v58)
        {
          uint64_t v40 = NSString;
          v43 = [v12 model];
          uint64_t v48 = [v40 stringWithFormat:@" (%@)", v43];
        }
        else
        {
          uint64_t v48 = &stru_1EDDE58B8;
        }
        uint64_t v41 = [v25 domain];
        uint64_t v42 = [v25 code];
        *(_DWORD *)buf = 138544898;
        __int16 v64 = v55;
        __int16 v65 = 2114;
        id v66 = v45;
        __int16 v67 = 2114;
        __int16 v68 = v52;
        __int16 v69 = 2114;
        __int16 v70 = v48;
        __int16 v71 = 2114;
        uint64_t v72 = (uint64_t)v41;
        __int16 v73 = 2048;
        uint64_t v74 = v42;
        __int16 v75 = 2112;
        id v76 = v25;
        _os_log_debug_impl(&dword_18ECEB000, v27, OS_LOG_TYPE_DEBUG, "%{public}@: Failed to save deletions bookmark for %{public}@peer %{public}@%{public}@: %{public}@:%lld (%@)", buf, 0x48u);

        if (v58)
        {
        }
      }
    }
  }
  else
  {
    id v25 = +[_DKSyncErrors internalFailure];
  }

  objc_sync_exit(v17);
  if (a7) {
    *a7 = v25;
  }
}

- (_DKSyncHistory)syncHistoryForPeer:(void *)a3 streamName:(void *)a4 transportName:(void *)a5 type:(void *)a6 error:
{
  v150[1] = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  id v11 = a4;
  id v126 = v10;
  id v127 = a5;
  v125 = v11;
  if (!a1)
  {
    long long v54 = 0;
    goto LABEL_36;
  }
  id v12 = a3;
  id v13 = +[_CDLogging syncChannel];
  unint64_t v14 = 0x1E4F29000uLL;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v56 = [(id)objc_opt_class() description];
    v57 = &stru_1EDDE58B8;
    if ([v10 me]) {
      __int16 v58 = @"pseudo ";
    }
    else {
      __int16 v58 = &stru_1EDDE58B8;
    }
    id v59 = [v10 identifier];
    id v60 = [v10 model];
    if (v60)
    {
      id v66 = NSString;
      id v10 = [v10 model];
      v57 = [v66 stringWithFormat:@" (%@)", v10];
    }
    *(_DWORD *)buf = 138544642;
    uint64_t v131 = (uint64_t)v56;
    __int16 v132 = 2114;
    id v133 = v127;
    __int16 v134 = 2114;
    id v135 = v58;
    __int16 v136 = 2114;
    long long v137 = v59;
    __int16 v138 = 2114;
    long long v139 = v57;
    __int16 v140 = 2114;
    id v141 = v11;
    _os_log_debug_impl(&dword_18ECEB000, v13, OS_LOG_TYPE_DEBUG, "%{public}@: Fetching %{public}@ sync history for %{public}@peer %{public}@%{public}@ on %{public}@", buf, 0x3Eu);
    if (v60)
    {
    }
    unint64_t v14 = 0x1E4F29000;
  }

  id v15 = +[_DKAnyStringIdentifier type];
  uint64_t v16 = +[_DKEventStream eventStreamWithName:v12 valueType:v15];

  v150[0] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v150 count:1];
  uint64_t v18 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-86400.0];
  v123 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v19 = +[_DKQuery predicateForEventsWithCreationInDateRangeFromAfter:to:](_DKQuery, "predicateForEventsWithCreationInDateRangeFromAfter:to:", v18);
  uint64_t v20 = v19;
  v119 = (void *)v18;
  v120 = (void *)v16;
  v122 = v19;
  if (v11)
  {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"valueString == %@", v11];
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v21 = (void *)MEMORY[0x1E4F28BA0];
    v149[0] = v20;
    v149[1] = v11;
    BOOL v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v149 count:2];
    id v23 = [v21 andPredicateWithSubpredicates:v22];
  }
  else
  {
    id v23 = v19;
  }
  int v24 = +[_DKEventQuery eventQueryWithPredicate:v23 eventStreams:v17 offset:0 limit:0x7FFFFFFFFFFFFFFFLL sortDescriptors:0];
  id v25 = [*(id *)(v14 + 24) stringWithUTF8String:"_DKSyncLocalKnowledgeStorage.m"];
  int v26 = objc_msgSend(v25, "stringByAppendingFormat:", @":%d", 615);
  [v24 setClientName:v26];

  [v24 setTracker:&__block_literal_global_88];
  [v24 setResultType:1];
  id v27 = *(void **)(a1 + 8);
  id v129 = 0;
  int v28 = [v27 executeQuery:v24 error:&v129];
  id v29 = v129;
  v121 = v28;
  if (v29)
  {
    unint64_t v30 = (unint64_t)v29;
    v31 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v115 = [(id)objc_opt_class() description];
      int v61 = [v126 me];
      uint64_t v62 = &stru_1EDDE58B8;
      v63 = @"pseudo ";
      if (!v61) {
        v63 = &stru_1EDDE58B8;
      }
      v112 = v63;
      __int16 v64 = [v126 identifier];
      __int16 v65 = [v126 model];
      if (v65)
      {
        __int16 v67 = NSString;
        v105 = [v126 model];
        uint64_t v62 = [v67 stringWithFormat:@" (%@)", v105];
      }
      __int16 v68 = [(id)v30 domain];
      uint64_t v69 = [(id)v30 code];
      *(_DWORD *)buf = 138545154;
      uint64_t v131 = (uint64_t)v115;
      __int16 v132 = 2114;
      id v133 = v127;
      __int16 v134 = 2114;
      id v135 = v112;
      __int16 v136 = 2114;
      long long v137 = v64;
      __int16 v138 = 2114;
      long long v139 = v62;
      __int16 v140 = 2114;
      id v141 = v68;
      __int16 v142 = 2048;
      uint64_t v143 = v69;
      __int16 v144 = 2112;
      uint64_t v145 = v30;
      _os_log_error_impl(&dword_18ECEB000, v31, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch %{public}@ sync count for %{public}@peer %{public}@%{public}@: %{public}@:%lld (%@)", buf, 0x52u);

      if (v65)
      {
      }
    }
    uint64_t v32 = 0;
LABEL_32:

    uint64_t v41 = v23;
    v44 = v24;
    goto LABEL_33;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v33 = +[_CDLogging syncChannel];
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    uint64_t v106 = [(id)objc_opt_class() description];
    int v35 = [v126 me];
    int v36 = &stru_1EDDE58B8;
    int v37 = @"pseudo ";
    if (!v35) {
      int v37 = &stru_1EDDE58B8;
    }
    v101 = v37;
    id v113 = [v126 identifier];
    v111 = [v126 model];
    if (v111)
    {
      __int16 v78 = NSString;
      os_log_t log = [v126 model];
      int v36 = [v78 stringWithFormat:@" (%@)", log];
    }
    *(_DWORD *)buf = 138544386;
    uint64_t v79 = (void *)v106;
    uint64_t v131 = v106;
    __int16 v132 = 2114;
    id v133 = v127;
    __int16 v134 = 2114;
    id v135 = v101;
    __int16 v136 = 2114;
    long long v137 = v113;
    __int16 v138 = 2114;
    long long v139 = v36;
    __int16 v80 = "%{public}@: Failed to fetch %{public}@ sync count for %{public}@peer %{public}@%{public}@ due to invalid type";
LABEL_90:
    _os_log_error_impl(&dword_18ECEB000, v33, OS_LOG_TYPE_ERROR, v80, buf, 0x34u);
    if (v111)
    {
    }
    goto LABEL_18;
  }
  if ([v28 count])
  {
    int v33 = [v28 objectAtIndexedSubscript:0];
    uint64_t v34 = [v33 integerValue];
    goto LABEL_19;
  }
  int v33 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    uint64_t v110 = [(id)objc_opt_class() description];
    int v85 = [v126 me];
    int v36 = &stru_1EDDE58B8;
    __int16 v86 = @"pseudo ";
    if (!v85) {
      __int16 v86 = &stru_1EDDE58B8;
    }
    v104 = v86;
    id v113 = [v126 identifier];
    v111 = [v126 model];
    if (v111)
    {
      v91 = NSString;
      os_log_t log = [v126 model];
      int v36 = [v91 stringWithFormat:@" (%@)", log];
    }
    *(_DWORD *)buf = 138544386;
    uint64_t v79 = (void *)v110;
    uint64_t v131 = v110;
    __int16 v132 = 2114;
    id v133 = v127;
    __int16 v134 = 2114;
    id v135 = v104;
    __int16 v136 = 2114;
    long long v137 = v113;
    __int16 v138 = 2114;
    long long v139 = v36;
    __int16 v80 = "%{public}@: Failed to fetch %{public}@ sync count for %{public}@peer %{public}@%{public}@ due to missing value";
    goto LABEL_90;
  }
LABEL_18:
  uint64_t v34 = 0;
LABEL_19:

  id v118 = v11;
  if (v11)
  {
    v38 = v11;
    uint64_t v39 = v34;
    id v40 = v38;
  }
  else
  {
    uint64_t v39 = v34;
    id v40 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE"];
  }
  uint64_t v41 = v40;

  uint64_t v42 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v148 = v42;
  v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v148 count:1];
  v44 = +[_DKEventQuery eventQueryWithPredicate:v41 eventStreams:v17 offset:0 limit:1 sortDescriptors:v43];

  v45 = [NSString stringWithUTF8String:"_DKSyncLocalKnowledgeStorage.m"];
  id v46 = objc_msgSend(v45, "stringByAppendingFormat:", @":%d", 645);
  [v44 setClientName:v46];

  [v44 setTracker:&__block_literal_global_91];
  uint64_t v47 = *(void **)(a1 + 8);
  id v128 = 0;
  uint64_t v48 = [v47 executeQuery:v44 error:&v128];
  unint64_t v30 = (unint64_t)v128;
  if (v30)
  {
    uint64_t v49 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      v116 = [(id)objc_opt_class() description];
      int v70 = [v126 me];
      __int16 v71 = @"pseudo ";
      if (!v70) {
        __int16 v71 = &stru_1EDDE58B8;
      }
      os_log_t loga = (os_log_t)v71;
      v111 = [v126 identifier];
      [v126 model];
      v102 = id v11 = v118;
      if (v102)
      {
        v108 = NSString;
        uint64_t v95 = [v126 model];
        v107 = [v108 stringWithFormat:@" (%@)", v95];
      }
      else
      {
        v107 = &stru_1EDDE58B8;
      }
      id v76 = [(id)v30 domain];
      uint64_t v77 = [(id)v30 code];
      *(_DWORD *)buf = 138545154;
      uint64_t v131 = (uint64_t)v116;
      __int16 v132 = 2114;
      id v133 = v127;
      __int16 v134 = 2114;
      id v135 = loga;
      __int16 v136 = 2114;
      long long v137 = v111;
      __int16 v138 = 2114;
      long long v139 = v107;
      __int16 v140 = 2114;
      id v141 = v76;
      __int16 v142 = 2048;
      uint64_t v143 = v77;
      __int16 v144 = 2112;
      uint64_t v145 = v30;
      _os_log_error_impl(&dword_18ECEB000, v49, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch last %{public}@ sync date for %{public}@peer %{public}@%{public}@: %{public}@:%lld (%@)", buf, 0x52u);

      if (v102)
      {
      }
      uint64_t v32 = 0;
    }
    else
    {
      uint64_t v32 = 0;
      id v11 = v118;
    }
LABEL_28:

    goto LABEL_29;
  }
  if ([v48 count])
  {
    v111 = v42;
    uint64_t v49 = [v48 lastObject];
    v114 = [v49 creationDate];
    uint64_t v50 = v39;
    uint64_t v32 = [[_DKSyncHistory alloc] initWithLastSyncDate:v114 lastDaySyncCount:v39];
    id v51 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v96 = v50;
      logb = v51;
      v109 = [(id)objc_opt_class() description];
      int v82 = [v126 me];
      v83 = &stru_1EDDE58B8;
      __int16 v84 = @"pseudo ";
      if (!v82) {
        __int16 v84 = &stru_1EDDE58B8;
      }
      id v93 = v84;
      v103 = [v126 identifier];
      v94 = [v126 model];
      if (v94)
      {
        id v87 = NSString;
        v92 = [v126 model];
        v83 = [v87 stringWithFormat:@" (%@)", v92];
      }
      uint64_t v88 = -[NSDate dk_localtimeString](v114);
      uint64_t v89 = [NSNumber numberWithUnsignedInteger:v96];
      *(_DWORD *)buf = 138545410;
      uint64_t v131 = (uint64_t)v109;
      __int16 v132 = 2114;
      id v133 = v127;
      __int16 v134 = 2114;
      id v135 = v93;
      __int16 v136 = 2114;
      long long v137 = v103;
      __int16 v138 = 2114;
      long long v139 = v83;
      __int16 v140 = 2114;
      id v141 = v125;
      __int16 v142 = 2114;
      v97 = (void *)v88;
      uint64_t v143 = v88;
      __int16 v144 = 2112;
      uint64_t v145 = v89;
      __int16 v90 = (void *)v89;
      __int16 v146 = 2112;
      __int16 v147 = v32;
      _os_log_debug_impl(&dword_18ECEB000, logb, OS_LOG_TYPE_DEBUG, "%{public}@: Found %{public}@ sync history for %{public}@peer %{public}@%{public}@ on %{public}@ with last sync date of %{public}@ and with %@ syncs in the previous day: %@", buf, 0x5Cu);

      if (v94)
      {
      }
      id v51 = logb;
    }

    id v11 = v118;
    uint64_t v42 = v111;
    goto LABEL_28;
  }
  uint64_t v32 = 0;
  id v11 = v118;
LABEL_29:

  if (!(v30 | (unint64_t)v32))
  {
    long long v52 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      v117 = [(id)objc_opt_class() description];
      uint64_t v72 = &stru_1EDDE58B8;
      if ([v126 me]) {
        __int16 v73 = @"pseudo ";
      }
      else {
        __int16 v73 = &stru_1EDDE58B8;
      }
      uint64_t v74 = [v126 identifier];
      __int16 v75 = [v126 model];
      if (v75)
      {
        id v81 = NSString;
        v111 = [v126 model];
        uint64_t v72 = [v81 stringWithFormat:@" (%@)", v111];
      }
      *(_DWORD *)buf = 138544386;
      uint64_t v131 = (uint64_t)v117;
      __int16 v132 = 2114;
      id v133 = v127;
      __int16 v134 = 2114;
      id v135 = v73;
      __int16 v136 = 2114;
      long long v137 = v74;
      __int16 v138 = 2114;
      long long v139 = v72;
      _os_log_debug_impl(&dword_18ECEB000, v52, OS_LOG_TYPE_DEBUG, "%{public}@: No %{public}@ sync history for %{public}@peer %{public}@%{public}@", buf, 0x34u);
      if (v75)
      {
      }
    }

    long long v53 = [_DKSyncHistory alloc];
    v31 = [MEMORY[0x1E4F1C9C8] distantPast];
    uint64_t v32 = [(_DKSyncHistory *)v53 initWithLastSyncDate:v31 lastDaySyncCount:0];
    unint64_t v30 = 0;
    id v23 = v41;
    int v24 = v44;
    goto LABEL_32;
  }
LABEL_33:
  if (a6) {
    *a6 = (id) v30;
  }
  long long v54 = v32;

LABEL_36:
  return v54;
}

- (id)additionsSyncHistoryForPeer:(id)a3 transportName:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 sourceDeviceID];
  id v11 = +[_DKSyncMetadataStorage windowStreamNameWithSourceDeviceID:]((uint64_t)_DKSyncMetadataStorage, v10);

  id v12 = -[_DKSyncLocalKnowledgeStorage syncHistoryForPeer:streamName:transportName:type:error:]((uint64_t)self, v9, v11, v8, @"additions", a5);

  return v12;
}

- (id)deletionsSyncHistoryForPeer:(id)a3 transportName:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 sourceDeviceID];
  id v11 = +[_DKSyncMetadataStorage bookmarkStreamNameWithSourceDeviceID:]((uint64_t)_DKSyncMetadataStorage, v10);

  id v12 = -[_DKSyncLocalKnowledgeStorage syncHistoryForPeer:streamName:transportName:type:error:]((uint64_t)self, v9, v11, v8, @"deletions", a5);

  return v12;
}

- (BOOL)saveEvents:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  storage = self->_storage;
  id v18 = 0;
  BOOL v8 = [(_DKKnowledgeStorage *)storage saveObjects:v6 error:&v18];
  id v9 = v18;
  id v10 = v9;
  if (a4 && v9) {
    *a4 = v9;
  }
  id v11 = +[_CDLogging syncChannel];
  id v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[_DKSyncLocalKnowledgeStorage saveEvents:error:]((uint64_t)self, v6);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    unint64_t v14 = [(id)objc_opt_class() description];
    id v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    uint64_t v16 = [v10 domain];
    uint64_t v17 = [v10 code];
    *(_DWORD *)buf = 138544386;
    uint64_t v20 = v14;
    __int16 v21 = 2112;
    BOOL v22 = v15;
    __int16 v23 = 2114;
    int v24 = v16;
    __int16 v25 = 2048;
    uint64_t v26 = v17;
    __int16 v27 = 2112;
    int v28 = v10;
    _os_log_error_impl(&dword_18ECEB000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to save %@ events: %{public}@:%lld (%@)", buf, 0x34u);
  }
  return v8;
}

- (BOOL)deleteEventsWithEventIDs:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a4) {
    *a4 = 0;
  }
  id v5 = [MEMORY[0x1E4F1CAD0] setWithArray:a3];
  if ([v5 count])
  {
    id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(uuid IN %@)", v5];
    unint64_t v7 = [(_DKKnowledgeStorage *)self->_storage deleteEventsMatchingPredicate:v6 limit:0x7FFFFFFFFFFFFFFFLL];
    BOOL v8 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[_DKSyncLocalKnowledgeStorage deleteEventsWithEventIDs:error:]();
    }

    id v9 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v11 = [(id)objc_opt_class() description];
      *(_DWORD *)buf = 138543874;
      id v13 = v11;
      __int16 v14 = 2048;
      unint64_t v15 = v7;
      __int16 v16 = 2048;
      uint64_t v17 = [v5 count];
      _os_log_debug_impl(&dword_18ECEB000, v9, OS_LOG_TYPE_DEBUG, "%{public}@: Deleted %lu events from %lu specified", buf, 0x20u);
    }
  }

  return 1;
}

- (void).cxx_destruct
{
}

- (void)tombstonesSinceDate:(NSObject *)a3 streamNames:limit:endDate:error:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = [(id)objc_opt_class() description];
  id v6 = [a2 domain];
  int v7 = 138544130;
  BOOL v8 = v5;
  __int16 v9 = 2114;
  id v10 = v6;
  __int16 v11 = 2048;
  uint64_t v12 = [a2 code];
  __int16 v13 = 2112;
  __int16 v14 = a2;
  _os_log_debug_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_DEBUG, "%{public}@: Failed to find tombstones: %{public}@:%lld (%@)", (uint8_t *)&v7, 0x2Au);
}

- (void)saveEvents:(uint64_t)a1 error:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  v3 = [(id)objc_opt_class() description];
  id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v4, v5, "%{public}@: Saved %@ events", v6, v7, v8, v9, 2u);
}

- (void)deleteEventsWithEventIDs:error:.cold.1()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v1, v2, "%{public}@: Deletion predicate = %@", v3, v4, v5, v6, 2u);
}

@end