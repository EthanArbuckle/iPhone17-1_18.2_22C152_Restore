@interface _DKPerformSyncUpHistoryDeletionsOperation
+ (void)_updateEventStatsWithPreviousSyncDate:(uint64_t)a3 transportType:;
+ (void)_updateEventStatsWithTotal:(uint64_t)a3 transportType:;
- (BOOL)isAsynchronous;
- (id)initWithParent:(void *)a3 sibling:(void *)a4 localStorage:(void *)a5 transport:(void *)a6 peer:(void *)a7 policy:(void *)a8 type:;
- (uint64_t)existsAdditionsSyncHistory;
- (void)endOperation;
- (void)handleUpdateStorageWithStartDate:(void *)a3 endDate:(uint64_t)a4 deletedEventIDsCount:(void *)a5 orError:;
- (void)main;
- (void)performSyncUpHistoryDeletions;
- (void)performSyncUpHistoryDeletionsWithDeletionsHighWaterMark:(void *)a3 orError:;
- (void)performSyncUpHistoryDeletionsWithPreviousHighWaterMark:(uint64_t)a1;
@end

@implementation _DKPerformSyncUpHistoryDeletionsOperation

- (void)performSyncUpHistoryDeletionsWithPreviousHighWaterMark:(uint64_t)a1
{
  uint64_t v146 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    v4 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v4);

    unint64_t v5 = 0x1E560C000uLL;
    v6 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[_DKPerformSyncUpHistoryDeletionsOperation performSyncUpHistoryDeletionsWithPreviousHighWaterMark:](a1, (int)v3, (int)v6, v7, v8, v9, v10, v11, v85, v86, (uint8_t)v87, v88, v91, v93, v95, v98, v100, v103, v106,
    }
        v109,
        (uint64_t)obj,
        (uint64_t)v115,
        v116,
        v117,
        (uint64_t)v118,
        (uint64_t)v119,
        v120,
        (uint64_t)v121,
        (uint64_t)v122,
        (uint64_t)v123);

    id v12 = v3;
    [*(id *)(a1 + 352) timeIntervalSinceReferenceDate];
    double v14 = v13;
    [v12 timeIntervalSinceReferenceDate];
    if (v14 - v15 <= (double)(unint64_t)[*(id *)(a1 + 328) minSyncWindowInSeconds])
    {
      v27 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        [(_DKPerformSyncUpHistoryDeletionsOperation *)a1 performSyncUpHistoryDeletionsWithPreviousHighWaterMark:v27];
      }

      v23 = 0;
      v28 = 0;
    }
    else
    {
      uint64_t v16 = *(void *)(a1 + 368);
      if (!v16)
      {
        v17 = [*(id *)(a1 + 360) lastSyncDate];
        +[_DKPerformSyncUpHistoryDeletionsOperation _updateEventStatsWithPreviousSyncDate:transportType:]((uint64_t)_DKPerformSyncUpHistoryDeletionsOperation, v17, [*(id *)(a1 + 312) transportType]);

        uint64_t v16 = *(void *)(a1 + 368);
      }
      *(void *)(a1 + 368) = v16 + 1;
      v18 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[_DKPerformSyncUpHistoryDeletionsOperation performSyncUpHistoryDeletionsWithPreviousHighWaterMark:](a1, v12);
      }

      v19 = *(void **)(a1 + 304);
      uint64_t v20 = *(void *)(a1 + 344);
      uint64_t v21 = [*(id *)(a1 + 328) syncBatchSizeInEvents];
      id v128 = 0;
      id v129 = 0;
      v97 = [v19 tombstonesSinceDate:v12 streamNames:v20 limit:v21 endDate:&v129 error:&v128];
      id v22 = v129;
      v23 = (__CFString *)v128;
      v24 = +[_CDLogging syncChannel];
      v25 = v24;
      if (v23)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v65 = [(id)objc_opt_class() description];
          v66 = -[NSDate dk_localtimeString](v12);
          v67 = -[NSDate dk_localtimeString](v22);
          [(__CFString *)v23 domain];
          v69 = id v68 = v22;
          uint64_t v70 = [(__CFString *)v23 code];
          *(_DWORD *)buf = 138544642;
          id v131 = v65;
          __int16 v132 = 2114;
          id v133 = v66;
          __int16 v134 = 2114;
          v135 = v67;
          __int16 v136 = 2114;
          v137 = v69;
          __int16 v138 = 2048;
          uint64_t v139 = v70;
          __int16 v140 = 2112;
          uint64_t v141 = (uint64_t)v23;
          _os_log_error_impl(&dword_18ECEB000, v25, OS_LOG_TYPE_ERROR, "%{public}@: Failed while querying for deletions with bookmark [%{public}@ ending %{public}@]: %{public}@:%lld (%@)", buf, 0x3Eu);

          id v22 = v68;
        }

        LOBYTE(v26) = 1;
      }
      else
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          v71 = [(id)objc_opt_class() description];
          v72 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v97, "count"));
          v73 = -[NSDate dk_localtimeString](v12);
          v74 = -[NSDate dk_localtimeString](v22);
          *(_DWORD *)buf = 138544130;
          id v131 = v71;
          __int16 v132 = 2112;
          id v133 = v72;
          __int16 v134 = 2114;
          v135 = v73;
          __int16 v136 = 2114;
          v137 = v74;
          _os_log_debug_impl(&dword_18ECEB000, v25, OS_LOG_TYPE_DEBUG, "%{public}@: Found %@ deletions with bookmark [%{public}@ ending %{public}@]", buf, 0x2Au);

          unint64_t v5 = 0x1E560C000;
        }
        v96 = v22;
        id v92 = v3;

        v94 = v12;
        if ([v97 count])
        {
          uint64_t v101 = a1;
          v89 = +[_DKSyncPeerStatusTracker sharedInstance];
          v87 = [v89 pseudoPeerForSyncTransportCloudUp];
          v104 = [v87 sourceDeviceID];
          v29 = +[_DKSystemEventStreams appWebUsageStream];
          v107 = [v29 name];

          v110 = objc_opt_new();
          long long v124 = 0u;
          long long v125 = 0u;
          long long v126 = 0u;
          long long v127 = 0u;
          id obja = v97;
          uint64_t v30 = [obja countByEnumeratingWithState:&v124 objects:v145 count:16];
          if (v30)
          {
            uint64_t v31 = v30;
            uint64_t v32 = *(void *)v125;
            v33 = off_1E560D000;
            do
            {
              for (uint64_t i = 0; i != v31; ++i)
              {
                if (*(void *)v125 != v32) {
                  objc_enumerationMutation(obja);
                }
                v35 = *(void **)(*((void *)&v124 + 1) + 8 * i);
                v36 = [v35 stringValue];
                if (v36)
                {
                  v37 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v36];
                  if (v37)
                  {
                    v38 = [v35 metadata];
                    v39 = [(__objc2_class *)v33[20] eventSourceDeviceID];
                    v40 = [v38 objectForKeyedSubscript:v39];

                    if (v40)
                    {
                      v41 = [v35 metadata];
                      v42 = [(__objc2_class *)v33[20] eventStreamName];
                      v43 = [v41 objectForKeyedSubscript:v42];

                      if ([v43 isEqualToString:v107]) {
                        -[_DKSyncDeletedEventIDs addDeletedEventID:forSourceDeviceID:]((uint64_t)v110, v37, v40);
                      }
                    }
                    else
                    {
                      -[_DKSyncDeletedEventIDs addDeletedEventID:forSourceDeviceID:]((uint64_t)v110, v37, v104);
                    }
                    unint64_t v5 = 0x1E560C000;
                  }
                  else
                  {
                    v40 = [*(id *)(v5 + 2288) syncChannel];
                    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                    {
                      v45 = [(id)objc_opt_class() description];
                      *(_DWORD *)buf = 138543618;
                      id v131 = v45;
                      __int16 v132 = 2112;
                      id v133 = v36;
                      _os_log_error_impl(&dword_18ECEB000, v40, OS_LOG_TYPE_ERROR, "%{public}@: Skipping tombstone due to malformed tombstone uuid: %@", buf, 0x16u);
                    }
                  }

                  v33 = off_1E560D000;
                }
                else
                {
                  v37 = [*(id *)(v5 + 2288) syncChannel];
                  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                  {
                    v44 = [(id)objc_opt_class() description];
                    *(_DWORD *)buf = 138543618;
                    id v131 = v44;
                    __int16 v132 = 2112;
                    id v133 = v35;
                    _os_log_error_impl(&dword_18ECEB000, v37, OS_LOG_TYPE_ERROR, "%{public}@: Skipping tombstone due to missing tombstone uuid: %@", buf, 0x16u);
                  }
                }
              }
              uint64_t v31 = [obja countByEnumeratingWithState:&v124 objects:v145 count:16];
            }
            while (v31);
          }

          a1 = v101;
          id v12 = v94;
        }
        else
        {
          v110 = 0;
        }
        v46 = [*(id *)(a1 + 320) sourceDeviceID];
        v47 = +[_DKSyncMetadataStorage bookmarkStreamNameWithSourceDeviceID:]((uint64_t)_DKSyncMetadataStorage, v46);

        v48 = [*(id *)(a1 + 312) name];
        v49 = +[_DKSyncMetadataStorage eventFromStartDate:endDate:bookmarkStreamName:transportName:]((uint64_t)_DKSyncMetadataStorage, v12, v96, v47, v48);

        if ([v97 count]
          || [*(id *)(a1 + 312) transportType] != 8
          || -[_DKSyncType forceSync](*(void *)(a1 + 336)))
        {
          v50 = *(void **)(a1 + 328);
          uint64_t v51 = *(void *)(a1 + 336);
          v52 = [*(id *)(a1 + 360) lastSyncDate];
          uint64_t v53 = [v50 highPriorityForSyncUpWithSyncType:v51 lastSyncDate:v52];

          v54 = *(void **)(a1 + 312);
          v144 = v49;
          v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v144 count:1];
          uint64_t v116 = MEMORY[0x1E4F143A8];
          uint64_t v117 = 3221225472;
          v118 = __100___DKPerformSyncUpHistoryDeletionsOperation_performSyncUpHistoryDeletionsWithPreviousHighWaterMark___block_invoke;
          v119 = &unk_1E560FC90;
          uint64_t v120 = a1;
          v56 = v94;
          id v121 = v94;
          v57 = v96;
          id v122 = v96;
          id v123 = v110;
          [v54 updateStorageWithAddedEvents:v55 deletedEventIDs:v123 highPriority:v53 completion:&v116];

          int v26 = 0;
        }
        else
        {
          int v26 = 1;
          v56 = v94;
          v57 = v96;
        }
        v58 = *(void **)(a1 + 304);
        uint64_t v59 = *(void *)(a1 + 320);
        v60 = (id *)a1;
        v61 = [*(id *)(a1 + 312) name];
        id v115 = 0;
        [v58 setLastSyncDownDeletionDate:v57 previousDate:v56 forPeer:v59 transportName:v61 error:&v115];
        v23 = (__CFString *)v115;

        v62 = +[_CDLogging syncChannel];
        v63 = v62;
        if (v23)
        {
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            id objc = [(id)objc_opt_class() description];
            v75 = [NSNumber numberWithUnsignedInteger:-[_DKSyncDeletedEventIDs count]((uint64_t)v110)];
            v76 = -[NSDate dk_localtimeString](v94);
            v77 = -[NSDate dk_localtimeString](v96);
            v78 = [(__CFString *)v23 domain];
            uint64_t v79 = [(__CFString *)v23 code];
            *(_DWORD *)buf = 138544898;
            id v131 = objc;
            __int16 v132 = 2112;
            id v133 = v75;
            __int16 v134 = 2114;
            v135 = v76;
            __int16 v136 = 2114;
            v137 = v77;
            __int16 v138 = 2114;
            uint64_t v139 = (uint64_t)v78;
            __int16 v140 = 2048;
            uint64_t v141 = v79;
            __int16 v142 = 2112;
            v143 = v23;
            _os_log_error_impl(&dword_18ECEB000, v63, OS_LOG_TYPE_ERROR, "%{public}@: Failed while syncing up %@ deletions with bookmark [%{public}@ ending %{public}@]: %{public}@:%lld (%@)", buf, 0x48u);
          }
          v63 = [v60 errors];
          [v63 addObject:v23];
        }
        else if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
        {
          v102 = [(id)objc_opt_class() description];
          id objb = [NSNumber numberWithUnsignedInteger:-[_DKSyncDeletedEventIDs count]((uint64_t)v110)];
          v99 = -[NSDate dk_localtimeString](v94);
          v108 = -[NSDate dk_localtimeString](v96);
          int v80 = [v60[40] me];
          v81 = &stru_1EDDE58B8;
          v82 = @"pseudo ";
          if (!v80) {
            v82 = &stru_1EDDE58B8;
          }
          v90 = v82;
          v105 = [v60[40] identifier];
          v83 = [v60[40] model];
          if (v83)
          {
            v84 = NSString;
            v87 = [v60[40] model];
            v81 = [v84 stringWithFormat:@" (%@)", v87];
          }
          *(_DWORD *)buf = 138544898;
          id v131 = v102;
          __int16 v132 = 2112;
          id v133 = objb;
          __int16 v134 = 2114;
          v135 = v99;
          __int16 v136 = 2114;
          v137 = v108;
          __int16 v138 = 2114;
          uint64_t v139 = (uint64_t)v90;
          __int16 v140 = 2114;
          uint64_t v141 = (uint64_t)v105;
          __int16 v142 = 2114;
          v143 = v81;
          _os_log_debug_impl(&dword_18ECEB000, v63, OS_LOG_TYPE_DEBUG, "%{public}@: Successfully synced up %@ deletions with bookmark [%{public}@ ending %{public}@] to %{public}@peer %{public}@%{public}@", buf, 0x48u);
          if (v83)
          {
          }
        }

        if (!v23)
        {
          id v3 = v92;
          id v12 = v94;
          a1 = (uint64_t)v60;
          v28 = v97;
          if (!v26) {
            goto LABEL_54;
          }
          goto LABEL_53;
        }
        id v3 = v92;
        id v12 = v94;
        a1 = (uint64_t)v60;
      }
      v64 = [(id)a1 errors];
      [v64 addObject:v23];

      v28 = v97;
      if ((v26 & 1) == 0)
      {
LABEL_54:

        goto LABEL_55;
      }
    }
LABEL_53:
    [(id)a1 endOperation];
    goto LABEL_54;
  }
LABEL_55:
}

- (void)handleUpdateStorageWithStartDate:(void *)a3 endDate:(uint64_t)a4 deletedEventIDsCount:(void *)a5 orError:
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (a1)
  {
    id v12 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v12);

    if (v11)
    {
      int v13 = +[_DKCKError isIgnorableError:]((uint64_t)_DKCKError, v11);
      double v14 = +[_CDLogging syncChannel];
      double v15 = v14;
      if (v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[_DKPerformSyncUpHistoryDeletionsOperation handleUpdateStorageWithStartDate:endDate:deletedEventIDsCount:orError:](a1, v11);
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        -[_DKPerformSyncUpHistoryDeletionsOperation handleUpdateStorageWithStartDate:endDate:deletedEventIDsCount:orError:](a1, v11, v15);
      }

      int v26 = [(id)a1 errors];
      [v26 addObject:v11];

LABEL_17:
      [(id)a1 endOperation];
      goto LABEL_18;
    }
    uint64_t v16 = +[_CDLogging syncChannel];
    v17 = v16;
    if (a4)
    {
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
        goto LABEL_30;
      }
      v43 = [(id)objc_opt_class() description];
      v41 = [NSNumber numberWithUnsignedInteger:a4];
      v42 = -[NSDate dk_localtimeString](v9);
      v40 = -[NSDate dk_localtimeString](v10);
      uint64_t v18 = [*(id *)(a1 + 312) transportType];
      v19 = "down from";
      if (v18 == 8) {
        v19 = "up to";
      }
      v38 = v19;
      int v20 = [*(id *)(a1 + 320) me];
      uint64_t v21 = &stru_1EDDE58B8;
      id v22 = @"pseudo ";
      if (!v20) {
        id v22 = &stru_1EDDE58B8;
      }
      v36 = v22;
      v23 = [*(id *)(a1 + 320) identifier];
      v24 = [*(id *)(a1 + 320) model];
      if (v24)
      {
        v25 = NSString;
        v35 = [*(id *)(a1 + 320) model];
        uint64_t v21 = [v25 stringWithFormat:@" (%@)", v35];
      }
      uint64_t v31 = [*(id *)(a1 + 312) name];
      *(_DWORD *)buf = 138545410;
      v47 = v43;
      __int16 v48 = 2112;
      v49 = v41;
      __int16 v50 = 2114;
      uint64_t v51 = v42;
      __int16 v52 = 2114;
      uint64_t v53 = v40;
      __int16 v54 = 2082;
      v55 = v38;
      __int16 v56 = 2114;
      v57 = v36;
      __int16 v58 = 2114;
      uint64_t v59 = v23;
      __int16 v60 = 2114;
      v61 = v21;
      __int16 v62 = 2114;
      v63 = v31;
      _os_log_impl(&dword_18ECEB000, v17, OS_LOG_TYPE_INFO, "%{public}@: Synced up %@ deletions and high water mark with bookmark [%{public}@ ending %{public}@] doing sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@", buf, 0x5Cu);
    }
    else
    {
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_30;
      }
      v43 = [(id)objc_opt_class() description];
      v41 = [NSNumber numberWithUnsignedInteger:0];
      v42 = -[NSDate dk_localtimeString](v9);
      v40 = -[NSDate dk_localtimeString](v10);
      uint64_t v27 = [*(id *)(a1 + 312) transportType];
      v28 = "down from";
      if (v27 == 8) {
        v28 = "up to";
      }
      v39 = v28;
      int v29 = [*(id *)(a1 + 320) me];
      uint64_t v21 = &stru_1EDDE58B8;
      uint64_t v30 = @"pseudo ";
      if (!v29) {
        uint64_t v30 = &stru_1EDDE58B8;
      }
      v37 = v30;
      v23 = [*(id *)(a1 + 320) identifier];
      v24 = [*(id *)(a1 + 320) model];
      if (v24)
      {
        v34 = NSString;
        v35 = [*(id *)(a1 + 320) model];
        uint64_t v21 = [v34 stringWithFormat:@" (%@)", v35];
      }
      uint64_t v31 = [*(id *)(a1 + 312) name];
      *(_DWORD *)buf = 138545410;
      v47 = v43;
      __int16 v48 = 2112;
      v49 = v41;
      __int16 v50 = 2114;
      uint64_t v51 = v42;
      __int16 v52 = 2114;
      uint64_t v53 = v40;
      __int16 v54 = 2082;
      v55 = v39;
      __int16 v56 = 2114;
      v57 = v37;
      __int16 v58 = 2114;
      uint64_t v59 = v23;
      __int16 v60 = 2114;
      v61 = v21;
      __int16 v62 = 2114;
      v63 = v31;
      _os_log_debug_impl(&dword_18ECEB000, v17, OS_LOG_TYPE_DEBUG, "%{public}@: Synced up %@ deletions and high water mark with bookmark [%{public}@ ending %{public}@] doing sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@", buf, 0x5Cu);
    }

    if (v24)
    {
    }
LABEL_30:

    +[_DKPerformSyncUpHistoryDeletionsOperation _updateEventStatsWithTotal:transportType:]((uint64_t)_DKPerformSyncUpHistoryDeletionsOperation, a4, [*(id *)(a1 + 312) transportType]);
    unint64_t v32 = *(void *)(a1 + 368);
    unint64_t v33 = [*(id *)(a1 + 328) maxBatchesPerSync];
    if (a4 && v32 < v33)
    {
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __115___DKPerformSyncUpHistoryDeletionsOperation_handleUpdateStorageWithStartDate_endDate_deletedEventIDsCount_orError___block_invoke;
      v44[3] = &unk_1E560D848;
      v44[4] = a1;
      id v45 = v10;
      +[_DKSyncSerializer performAsyncBlock:v44];

      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_18:
}

+ (void)_updateEventStatsWithPreviousSyncDate:(uint64_t)a3 transportType:
{
  id v11 = a2;
  self;
  if (_updateEventStatsWithPreviousSyncDate_transportType__syncCadenceInitialized_1 != -1) {
    dispatch_once(&_updateEventStatsWithPreviousSyncDate_transportType__syncCadenceInitialized_1, &__block_literal_global_55);
  }
  if (v11)
  {
    v4 = [MEMORY[0x1E4F1C9C8] distantPast];
    char v5 = [v11 isEqualToDate:v4];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceByTransportCounter_1;
      int v7 = [MEMORY[0x1E4F1C9C8] date];
      if (a3 == 1) {
        int v8 = @"Rapport";
      }
      else {
        int v8 = @"Cloud";
      }
      -[_DKEventTypeStatsTimerCounter addTimingWithStartDate:endDate:typeValue:](v6, (uint64_t)v11, v7, v8);
    }
  }
  uint64_t v9 = _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceCounter_1;
  id v10 = [MEMORY[0x1E4F1C9C8] date];
  -[_DKEventStatsTimerCounter addTimingWithStartDate:endDate:](v9, (uint64_t)v11, v10);
}

- (id)initWithParent:(void *)a3 sibling:(void *)a4 localStorage:(void *)a5 transport:(void *)a6 peer:(void *)a7 policy:(void *)a8 type:
{
  id v26 = a3;
  id v25 = a4;
  id v24 = a5;
  id v16 = a6;
  id v23 = a7;
  id v17 = a8;
  if (a1)
  {
    v27.receiver = a1;
    v27.super_class = (Class)_DKPerformSyncUpHistoryDeletionsOperation;
    uint64_t v18 = (id *)objc_msgSendSuper2(&v27, sel_initWithParent_, a2);
    v19 = v18;
    if (v18)
    {
      objc_storeStrong(v18 + 37, a3);
      objc_storeStrong(v19 + 38, a4);
      objc_storeStrong(v19 + 39, a5);
      objc_storeStrong(v19 + 40, a6);
      objc_storeStrong(v19 + 41, a7);
      objc_storeStrong(v19 + 42, a8);
      uint64_t v20 = [MEMORY[0x1E4F1C9C8] date];
      id v21 = v19[44];
      v19[44] = (id)v20;
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  uint64_t v3 = objc_opt_class();
  if (+[_DKSync2Coordinator shouldDeferSyncOperationWithClass:syncType:transport:peer:policy:]((uint64_t)_DKSync2Coordinator, v3, self->_type, self->_transport, 0, self->_policy))
  {
    [(_DKPerformSyncUpHistoryDeletionsOperation *)self endOperation];
  }
  else
  {
    -[_DKPerformSyncUpHistoryDeletionsOperation performSyncUpHistoryDeletions]((uint64_t)self);
  }
}

- (void)performSyncUpHistoryDeletions
{
  OUTLINED_FUNCTION_4();
  a30 = v31;
  a31 = v32;
  v34 = v33;
  uint64_t v36 = v35;
  a19 = *MEMORY[0x1E4F143B8];
  v37 = [(id)objc_opt_class() description];
  if ([*(id *)(v36 + 312) transportType] == 8) {
    v38 = "up to";
  }
  else {
    v38 = "down from";
  }
  v39 = &stru_1EDDE58B8;
  if ([(id)OUTLINED_FUNCTION_15_1() me]) {
    v40 = @"pseudo ";
  }
  else {
    v40 = &stru_1EDDE58B8;
  }
  v41 = [(id)OUTLINED_FUNCTION_15_1() identifier];
  v42 = [(id)OUTLINED_FUNCTION_15_1() model];
  if (v42)
  {
    v43 = NSString;
    [(id)OUTLINED_FUNCTION_15_1() model];
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_43();
    v39 = [v43 stringWithFormat:@" (%@)"];
  }
  v44 = [*(id *)(v36 + 312) name];
  LODWORD(buf) = 138544642;
  *(void *)((char *)&buf + 4) = v37;
  WORD6(buf) = 2082;
  *(void *)((char *)&buf + 14) = v38;
  a14 = 2114;
  a15 = v40;
  LOWORD(a16) = 2114;
  *(void *)((char *)&a16 + 2) = v41;
  WORD5(a16) = 2114;
  *(void *)((char *)&a16 + 12) = v39;
  WORD2(a17) = 2114;
  *(void *)((char *)&a17 + 6) = v44;
  _os_log_debug_impl(&dword_18ECEB000, v34, OS_LOG_TYPE_DEBUG, "%{public}@: Skippped deletions history sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@ due to no streams to sync", (uint8_t *)&buf, 0x3Eu);

  if (v42)
  {
  }
  OUTLINED_FUNCTION_3_2();
}

- (uint64_t)existsAdditionsSyncHistory
{
  if (!a1) {
    return 0;
  }
  uint64_t v3 = [(_DKPerformSyncUpHistoryAdditionsOperation *)*(id *)(a1 + 296) history];
  if (!v3)
  {
    v4 = *(void **)(a1 + 304);
    uint64_t v5 = *(void *)(a1 + 320);
    uint64_t v6 = [*(id *)(a1 + 312) name];
    uint64_t v3 = [v4 additionsSyncHistoryForPeer:v5 transportName:v6 error:0];
  }
  int v7 = [v3 lastSyncDate];
  if (v7)
  {
    int v8 = [v3 lastSyncDate];
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] distantPast];
    int v10 = [v8 isEqualToDate:v9];

    uint64_t v11 = v10 ^ 1u;
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)performSyncUpHistoryDeletionsWithDeletionsHighWaterMark:(void *)a3 orError:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if (v5)
    {
      -[_DKPerformSyncUpHistoryDeletionsOperation performSyncUpHistoryDeletionsWithPreviousHighWaterMark:]((uint64_t)a1, v5);
    }
    else
    {
      int v7 = +[_CDLogging syncChannel];
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
      if (v6)
      {
        if (v8) {
          -[_DKPerformSyncUpHistoryDeletionsOperation performSyncUpHistoryDeletionsWithDeletionsHighWaterMark:orError:](a1, v6, v7);
        }

        int v7 = [a1 errors];
        [v7 addObject:v6];
      }
      else if (v8)
      {
        -[_DKPerformSyncUpHistoryDeletionsOperation performSyncUpHistoryDeletionsWithDeletionsHighWaterMark:orError:](a1, v7);
      }

      [a1 endOperation];
    }
  }
}

+ (void)_updateEventStatsWithTotal:(uint64_t)a3 transportType:
{
  self;
  if (_updateEventStatsWithTotal_transportType__syncUpHistoryDeletionsCounterInitialized != -1) {
    dispatch_once(&_updateEventStatsWithTotal_transportType__syncUpHistoryDeletionsCounterInitialized, &__block_literal_global_42);
  }
  -[_DKEventStatsCounter incrementCountByNumber:](_updateEventStatsWithTotal_transportType__syncUpHistoryDeletionsTotalCounter, a2);
  uint64_t v5 = _updateEventStatsWithTotal_transportType__syncUpHistoryDeletionsTotalByTransportCounter;
  if (a3 == 1) {
    id v6 = @"Rapport";
  }
  else {
    id v6 = @"Cloud";
  }
  -[_DKEventTypeStatsCounter incrementCountByNumber:typeValue:](v5, a2, v6);
}

- (void)endOperation
{
  v2.receiver = self;
  v2.super_class = (Class)_DKPerformSyncUpHistoryDeletionsOperation;
  [(_DKSyncCompositeOperation *)&v2 endOperation];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_streamNames, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_me, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_localStorage, 0);
  objc_storeStrong((id *)&self->_sibling, 0);
}

- (void)performSyncUpHistoryDeletionsWithDeletionsHighWaterMark:(NSObject *)a3 orError:.cold.2(id *a1, void *a2, NSObject *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = [(id)objc_opt_class() description];
  int v7 = [a1[39] name];
  BOOL v8 = &stru_1EDDE58B8;
  if ([(id)OUTLINED_FUNCTION_16_2() me]) {
    uint64_t v9 = @"pseudo ";
  }
  else {
    uint64_t v9 = &stru_1EDDE58B8;
  }
  int v10 = [(id)OUTLINED_FUNCTION_16_2() identifier];
  uint64_t v11 = [(id)OUTLINED_FUNCTION_16_2() model];
  if (v11)
  {
    id v12 = NSString;
    a1 = [(id)OUTLINED_FUNCTION_16_2() model];
    BOOL v8 = [v12 stringWithFormat:@" (%@)", a1];
  }
  int v13 = [a2 domain];
  [a2 code];
  OUTLINED_FUNCTION_8_4();
  id v17 = v9;
  __int16 v18 = v14;
  v19 = v10;
  __int16 v20 = v14;
  id v21 = v8;
  __int16 v22 = v14;
  id v23 = v13;
  __int16 v24 = 2048;
  uint64_t v25 = v15;
  __int16 v26 = 2112;
  objc_super v27 = a2;
  _os_log_debug_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_DEBUG, "%{public}@: Skipping deletions history sync up on transport %{public}@ for %{public}@peer %{public}@%{public}@: %{public}@:%lld (%@)", buf, 0x52u);

  if (v11)
  {
  }
}

- (void)performSyncUpHistoryDeletionsWithPreviousHighWaterMark:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v3 = [(id)objc_opt_class() description];
  uint64_t v9 = -[NSDate dk_localtimeString](a2);
  OUTLINED_FUNCTION_12_3();
  _os_log_debug_impl(v4, v5, v6, v7, v8, 0x16u);
}

- (void)performSyncUpHistoryDeletionsWithPreviousHighWaterMark:(int)a3 .cold.3(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf, uint64_t a12, uint64_t a13, __CFString *a14, long long a15, long long a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  OUTLINED_FUNCTION_4();
  a29 = v30;
  a30 = v31;
  unint64_t v33 = v32;
  uint64_t v35 = v34;
  v37 = v36;
  a18 = *MEMORY[0x1E4F143B8];
  v38 = [(id)objc_opt_class() description];
  v39 = [v37[39] name];
  v40 = &stru_1EDDE58B8;
  if ([(id)OUTLINED_FUNCTION_14_3() me]) {
    v41 = @"pseudo ";
  }
  else {
    v41 = &stru_1EDDE58B8;
  }
  v42 = [(id)OUTLINED_FUNCTION_14_3() identifier];
  v43 = [(id)OUTLINED_FUNCTION_14_3() model];
  if (v43)
  {
    v44 = NSString;
    v37 = [(id)OUTLINED_FUNCTION_14_3() model];
    v40 = [v44 stringWithFormat:@" (%@)"];
  }
  id v45 = -[NSDate dk_localtimeString](v35);
  OUTLINED_FUNCTION_8_4();
  a14 = v41;
  LOWORD(a15) = v46;
  *(void *)((char *)&a15 + 2) = v42;
  WORD5(a15) = v46;
  *(void *)((char *)&a15 + 12) = v40;
  WORD2(a16) = 2112;
  *(void *)((char *)&a16 + 6) = v47;
  _os_log_debug_impl(&dword_18ECEB000, v33, OS_LOG_TYPE_DEBUG, "%{public}@: Performing deletions history sync up on transport %{public}@ for %{public}@peer %{public}@%{public}@ from %@", &buf, 0x3Eu);
  if (v43)
  {
  }
  OUTLINED_FUNCTION_3_2();
}

- (void)handleUpdateStorageWithStartDate:(uint64_t)a1 endDate:(void *)a2 deletedEventIDsCount:orError:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v3 = [(id)objc_opt_class() description];
  v4 = [a2 domain];
  [a2 code];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_12_3();
  _os_log_debug_impl(v5, v6, v7, v8, v9, 0x2Au);
}

- (void)handleUpdateStorageWithStartDate:(NSObject *)a3 endDate:deletedEventIDsCount:orError:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  os_log_t v5 = [(id)objc_opt_class() description];
  os_log_t v6 = [a2 domain];
  [a2 code];
  OUTLINED_FUNCTION_4_1();
  _os_log_error_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Failed while updating storage: %{public}@:%lld (%@)", v7, 0x2Au);
}

@end