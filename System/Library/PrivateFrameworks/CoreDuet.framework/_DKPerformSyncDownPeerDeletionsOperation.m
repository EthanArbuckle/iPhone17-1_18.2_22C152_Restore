@interface _DKPerformSyncDownPeerDeletionsOperation
+ (void)_updateEventStatsWithPreviousSyncDate:(uint64_t)a3 transportType:;
+ (void)_updateEventStatsWithTotal:(uint64_t)a3 transportType:;
- (BOOL)isAsynchronous;
- (id)initWithParent:(void *)a3 localStorage:(void *)a4 transport:(void *)a5 peer:(void *)a6 policy:(void *)a7 type:;
- (uint64_t)performSyncDownPeerDeletions;
- (void)endOperation;
- (void)handleFetchedDeletedEventIDs:(void *)a3 startDate:(void *)a4 endDate:(void *)a5 untilDate:;
- (void)main;
- (void)performSyncDownPeerDeletionsWithDidPrewarm:(void *)a3 orError:;
- (void)performSyncDownPeerDeletionsWithHighWaterMark:(void *)a3 orError:;
- (void)performSyncDownPeerDeletionsWithPreviousUntilDate:(uint64_t)a1;
@end

@implementation _DKPerformSyncDownPeerDeletionsOperation

- (void)handleFetchedDeletedEventIDs:(void *)a3 startDate:(void *)a4 endDate:(void *)a5 untilDate:
{
  uint64_t v141 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    v13 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v13);

    if (!v12) {
      id v12 = *(id *)(a1 + 352);
    }
    unint64_t v14 = 0x1E560C000uLL;
    v15 = +[_CDLogging syncChannel];
    unint64_t v16 = 0x1E9222000uLL;
    v115 = v10;
    v116 = v12;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v104 = [(id)objc_opt_class() description];
      v99 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
      -[NSDate dk_localtimeString](v10);
      v47 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      -[NSDate dk_localtimeString](v11);
      v48 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      char v49 = [v11 isEqualToDate:v12];
      id v109 = v9;
      id v113 = v11;
      if (v49)
      {
        v94 = @"ending";
      }
      else
      {
        -[NSDate dk_localtimeString](v12);
        v94 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v50 = (void *)0x1E9222000;
      v51 = &stru_1EDDE58B8;
      if ([*(id *)(a1 + 312) me]) {
        v52 = @"pseudo ";
      }
      else {
        v52 = &stru_1EDDE58B8;
      }
      v53 = [*(id *)(a1 + 312) identifier];
      v54 = [*(id *)(a1 + 312) model];
      if (v54)
      {
        v55 = NSString;
        v50 = [*(id *)(a1 + 312) model];
        v51 = [v55 stringWithFormat:@" (%@)", v50];
      }
      *(_DWORD *)buf = 138545154;
      v122 = v104;
      __int16 v123 = 2112;
      id v124 = v99;
      __int16 v125 = 2114;
      v126 = v47;
      __int16 v127 = 2114;
      v128 = v48;
      __int16 v129 = 2114;
      v130 = v94;
      __int16 v131 = 2114;
      v132 = v52;
      __int16 v133 = 2114;
      uint64_t v134 = (uint64_t)v53;
      __int16 v135 = 2114;
      v136 = v51;
      _os_log_debug_impl(&dword_18ECEB000, v15, OS_LOG_TYPE_DEBUG, "%{public}@: Fetched %@ deleted event ids with bookmark [%{public}@ ending %{public}@] up through %{public}@ from %{public}@peer %{public}@%{public}@", buf, 0x52u);
      if (v54)
      {
      }
      id v11 = v113;
      if ((v49 & 1) == 0) {

      }
      id v9 = v109;
      id v10 = v115;
      id v12 = v116;
      unint64_t v16 = 0x1E9222000;
      unint64_t v14 = 0x1E560C000;
    }

    uint64_t v17 = [v9 count];
    v18 = [*(id *)(v14 + 2288) syncChannel];
    v19 = v18;
    unint64_t v20 = 0x1E9222000;
    if (v17)
    {
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
        goto LABEL_27;
      }
      v101 = [(id)objc_opt_class() description];
      v91 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
      -[NSDate dk_localtimeString](v10);
      v96 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[NSDate dk_localtimeString](v11);
      v87 = (__CFString *)objc_claimAutoreleasedReturnValue();
      char v21 = [v11 isEqualToDate:v12];
      id v106 = v9;
      if (v21)
      {
        v84 = @"ending";
      }
      else
      {
        -[NSDate dk_localtimeString](v12);
        v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      id v110 = v11;
      if ([*(id *)(a1 + 304) transportType] == 8) {
        v22 = "up to";
      }
      else {
        v22 = "down from";
      }
      v23 = &stru_1EDDE58B8;
      if ([*(id *)(a1 + *(int *)(v16 + 3260)) me]) {
        v24 = @"pseudo ";
      }
      else {
        v24 = &stru_1EDDE58B8;
      }
      v25 = [*(id *)(a1 + *(int *)(v16 + 3260)) identifier];
      v26 = [*(id *)(a1 + *(int *)(v16 + 3260)) model];
      if (v26)
      {
        v27 = NSString;
        id v11 = [*(id *)(a1 + *(int *)(v16 + 3260)) model];
        v23 = [v27 stringWithFormat:@" (%@)", v11];
      }
      v28 = [*(id *)(a1 + 304) name];
      *(_DWORD *)buf = 138545666;
      v122 = v101;
      __int16 v123 = 2112;
      id v124 = v91;
      __int16 v125 = 2114;
      v126 = v96;
      __int16 v127 = 2114;
      v128 = v87;
      __int16 v129 = 2114;
      v130 = v84;
      __int16 v131 = 2082;
      v132 = (void *)v22;
      __int16 v133 = 2114;
      uint64_t v134 = (uint64_t)v24;
      __int16 v135 = 2114;
      v136 = v25;
      __int16 v137 = 2114;
      v138 = v23;
      __int16 v139 = 2114;
      v140 = v28;
      _os_log_impl(&dword_18ECEB000, v19, OS_LOG_TYPE_INFO, "%{public}@: Fetched %@ deleted event ids with bookmark [%{public}@ ending %{public}@] up through %{public}@ doing sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@", buf, 0x66u);
    }
    else
    {
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_27;
      }
      v101 = [(id)objc_opt_class() description];
      v91 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
      -[NSDate dk_localtimeString](v10);
      v96 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[NSDate dk_localtimeString](v11);
      v87 = (__CFString *)objc_claimAutoreleasedReturnValue();
      char v21 = [v11 isEqualToDate:v12];
      id v106 = v9;
      if (v21)
      {
        v84 = @"ending";
      }
      else
      {
        -[NSDate dk_localtimeString](v12);
        v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      id v110 = v11;
      if ([*(id *)(a1 + 304) transportType] == 8) {
        v69 = "up to";
      }
      else {
        v69 = "down from";
      }
      v23 = &stru_1EDDE58B8;
      if ([*(id *)(a1 + *(int *)(v16 + 3260)) me]) {
        v70 = @"pseudo ";
      }
      else {
        v70 = &stru_1EDDE58B8;
      }
      v25 = [*(id *)(a1 + *(int *)(v16 + 3260)) identifier];
      v26 = [*(id *)(a1 + *(int *)(v16 + 3260)) model];
      if (v26)
      {
        v71 = NSString;
        id v11 = [*(id *)(a1 + *(int *)(v16 + 3260)) model];
        v23 = [v71 stringWithFormat:@" (%@)", v11];
      }
      v28 = [*(id *)(a1 + 304) name];
      *(_DWORD *)buf = 138545666;
      v122 = v101;
      __int16 v123 = 2112;
      id v124 = v91;
      __int16 v125 = 2114;
      v126 = v96;
      __int16 v127 = 2114;
      v128 = v87;
      __int16 v129 = 2114;
      v130 = v84;
      __int16 v131 = 2082;
      v132 = (void *)v69;
      __int16 v133 = 2114;
      uint64_t v134 = (uint64_t)v70;
      __int16 v135 = 2114;
      v136 = v25;
      __int16 v137 = 2114;
      v138 = v23;
      __int16 v139 = 2114;
      v140 = v28;
      _os_log_debug_impl(&dword_18ECEB000, v19, OS_LOG_TYPE_DEBUG, "%{public}@: Fetched %@ deleted event ids with bookmark [%{public}@ ending %{public}@] up through %{public}@ doing sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@", buf, 0x66u);
    }

    if (v26)
    {
    }
    id v10 = v115;
    id v12 = v116;
    if ((v21 & 1) == 0) {

    }
    id v9 = v106;
    id v11 = v110;
    unint64_t v16 = 0x1E9222000uLL;
    unint64_t v20 = 0x1E9222000uLL;
    unint64_t v14 = 0x1E560C000uLL;
LABEL_27:

    v29 = [*(id *)(a1 + *(int *)(v16 + 3260)) sourceDeviceID];
    if (!v29)
    {
      v38 = [*(id *)(v14 + 2288) syncChannel];
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        -[_DKPerformSyncDownPeerDeletionsOperation handleFetchedDeletedEventIDs:startDate:endDate:untilDate:]((id *)a1, v9, v38);
      }

      v30 = [(id)a1 errors];
      id v39 = +[_DKSyncErrors internalFailure];
      [v30 addObject:v39];
      goto LABEL_77;
    }
    v30 = +[_DKSyncPeerStatusTracker sharedInstance];
    v31 = [MEMORY[0x1E4F1C9C8] date];
    objc_msgSend(v30, "setLastSuccessfulActivityDate:onTransport:forPeer:", v31, objc_msgSend(*(id *)(a1 + *(int *)(v20 + 3256)), "transportType"), *(void *)(a1 + *(int *)(v16 + 3260)));

    if (![v9 count])
    {
LABEL_40:
      if ([*(id *)(a1 + *(int *)(v16 + 3260)) me])
      {
        id v10 = v115;
LABEL_78:

        if ([*(id *)(a1 + *(int *)(v20 + 3256)) transportType] != 1) {
          [*(id *)(a1 + *(int *)(v20 + 3256)) setHasDeletionsFlag:0 forPeer:*(void *)(a1 + *(int *)(v16 + 3260))];
        }
        [(id)a1 endOperation];
        goto LABEL_81;
      }
      v112 = v11;
      v40 = *(void **)(a1 + 296);
      unint64_t v41 = v20;
      uint64_t v42 = *(void *)(a1 + *(int *)(v16 + 3260));
      v43 = [*(id *)(a1 + *(int *)(v41 + 3256)) name];
      id v119 = 0;
      id v10 = v115;
      [v40 setLastSyncDownDeletionDate:v12 previousDate:v115 forPeer:v42 transportName:v43 error:&v119];
      id v39 = v119;

      v44 = +[_CDLogging syncChannel];
      v45 = v44;
      if (v39)
      {
        id v11 = v112;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          -[_DKPerformSyncDownPeerDeletionsOperation handleFetchedDeletedEventIDs:startDate:endDate:untilDate:](a1, v39, v45);
        }

        v46 = [(id)a1 errors];
        [v46 addObject:v39];

        id v12 = v116;
        unint64_t v20 = 0x1E9222000;
      }
      else
      {
        id v11 = v112;
        unint64_t v20 = 0x1E9222000;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          v103 = [(id)objc_opt_class() description];
          -[NSDate dk_localtimeString](v115);
          id v98 = (id)objc_claimAutoreleasedReturnValue();
          -[NSDate dk_localtimeString](v112);
          v93 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
          id v108 = v9;
          char v86 = [v112 isEqualToDate:v116];
          if (v86)
          {
            v89 = @"ending";
          }
          else
          {
            -[NSDate dk_localtimeString](v116);
            v89 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          v56 = &stru_1EDDE58B8;
          if ([*(id *)(a1 + 312) me]) {
            v57 = @"pseudo ";
          }
          else {
            v57 = &stru_1EDDE58B8;
          }
          v58 = [*(id *)(a1 + 312) identifier];
          v59 = [*(id *)(a1 + 312) model];
          if (v59)
          {
            v60 = NSString;
            uint64_t v83 = [*(id *)(a1 + 312) model];
            v56 = [v60 stringWithFormat:@" (%@)", v83];
          }
          *(_DWORD *)buf = 138544898;
          v122 = v103;
          __int16 v123 = 2114;
          id v124 = v98;
          __int16 v125 = 2114;
          v126 = v93;
          __int16 v127 = 2114;
          v128 = v89;
          __int16 v129 = 2114;
          v130 = v57;
          __int16 v131 = 2114;
          v132 = v58;
          __int16 v133 = 2114;
          uint64_t v134 = (uint64_t)v56;
          _os_log_impl(&dword_18ECEB000, v45, OS_LOG_TYPE_INFO, "%{public}@: Saved completed deletions bookmark [%{public}@ ending %{public}@] up through %{public}@ from %{public}@peer %{public}@%{public}@", buf, 0x48u);
          unint64_t v20 = 0x1E9222000uLL;
          if (v59)
          {
          }
          id v10 = v115;
          if ((v86 & 1) == 0) {

          }
          id v9 = v108;
          id v11 = v112;
        }

        unint64_t v61 = *(void *)(a1 + 360);
        if (v61 >= [*(id *)(a1 + 320) maxBatchesPerSync])
        {
          id v12 = v116;
        }
        else
        {
          [*(id *)(a1 + 352) timeIntervalSinceReferenceDate];
          double v63 = v62;
          id v12 = v116;
          [v116 timeIntervalSinceReferenceDate];
          if (v63 > v64)
          {
            v117[0] = MEMORY[0x1E4F143A8];
            v117[1] = 3221225472;
            v117[2] = __101___DKPerformSyncDownPeerDeletionsOperation_handleFetchedDeletedEventIDs_startDate_endDate_untilDate___block_invoke;
            v117[3] = &unk_1E560D848;
            v117[4] = a1;
            id v118 = v116;
            +[_DKSyncSerializer performAsyncBlock:v117];

LABEL_81:
            goto LABEL_82;
          }
        }
      }
LABEL_77:

      unint64_t v16 = 0x1E9222000uLL;
      goto LABEL_78;
    }
    *(unsigned char *)(a1 + 368) = 1;
    unint64_t v32 = v20;
    +[_DKPerformSyncDownPeerDeletionsOperation _updateEventStatsWithTotal:transportType:]((uint64_t)_DKPerformSyncDownPeerDeletionsOperation, [v9 count], objc_msgSend(*(id *)(a1 + *(int *)(v20 + 3256)), "transportType"));
    v33 = *(void **)(a1 + 296);
    id v120 = 0;
    int v34 = [v33 deleteEventsWithEventIDs:v9 error:&v120];
    v35 = (__CFString *)v120;
    v36 = +[_CDLogging syncChannel];
    v37 = v36;
    if (v34)
    {
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        v85 = [(id)objc_opt_class() description];
        v97 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
        -[NSDate dk_localtimeString](v115);
        v102 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
        -[NSDate dk_localtimeString](v11);
        v92 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
        id v107 = v9;
        id v111 = v11;
        LODWORD(v83) = [v11 isEqualToDate:v116];
        if (v83)
        {
          v88 = @"ending";
        }
        else
        {
          -[NSDate dk_localtimeString](v116);
          v88 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        int v72 = [*(id *)(a1 + 312) me];
        v73 = &stru_1EDDE58B8;
        v74 = @"pseudo ";
        if (!v72) {
          v74 = &stru_1EDDE58B8;
        }
        v82 = v74;
        v75 = [*(id *)(a1 + 312) identifier];
        v76 = [*(id *)(a1 + 312) model];
        if (v76)
        {
          v80 = NSString;
          v81 = [*(id *)(a1 + 312) model];
          v73 = [v80 stringWithFormat:@" (%@)", v81];
        }
        *(_DWORD *)buf = 138545154;
        v122 = v85;
        __int16 v123 = 2112;
        id v124 = v97;
        __int16 v125 = 2114;
        v126 = v102;
        __int16 v127 = 2114;
        v128 = v92;
        __int16 v129 = 2114;
        v130 = v88;
        __int16 v131 = 2114;
        v132 = v82;
        __int16 v133 = 2114;
        uint64_t v134 = (uint64_t)v75;
        __int16 v135 = 2114;
        v136 = v73;
        _os_log_debug_impl(&dword_18ECEB000, v37, OS_LOG_TYPE_DEBUG, "%{public}@: Deleted %@ events with bookmark [%{public}@ ending %{public}@] up through %{public}@ from %{public}@peer %{public}@%{public}@", buf, 0x52u);
        if (v76)
        {
        }
        if ((v83 & 1) == 0) {

        }
        id v9 = v107;
        id v11 = v111;
        goto LABEL_39;
      }
    }
    else
    {
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        id v114 = v11;
        v95 = [(id)objc_opt_class() description];
        v105 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
        int v65 = [*(id *)(a1 + 312) me];
        v66 = &stru_1EDDE58B8;
        v67 = @"pseudo ";
        if (!v65) {
          v67 = &stru_1EDDE58B8;
        }
        v90 = v67;
        v100 = [*(id *)(a1 + 312) identifier];
        v68 = [*(id *)(a1 + 312) model];
        if (v68)
        {
          v77 = NSString;
          v84 = [*(id *)(a1 + 312) model];
          v66 = [v77 stringWithFormat:@" (%@)", v84];
        }
        v78 = [(__CFString *)v35 domain];
        uint64_t v79 = [(__CFString *)v35 code];
        *(_DWORD *)buf = 138545154;
        v122 = v95;
        __int16 v123 = 2112;
        id v124 = v105;
        __int16 v125 = 2114;
        v126 = v90;
        __int16 v127 = 2114;
        v128 = v100;
        __int16 v129 = 2114;
        v130 = v66;
        __int16 v131 = 2114;
        v132 = v78;
        __int16 v133 = 2048;
        uint64_t v134 = v79;
        __int16 v135 = 2112;
        v136 = v35;
        _os_log_error_impl(&dword_18ECEB000, v37, OS_LOG_TYPE_ERROR, "%{public}@: Failed while deleting %@ events from %{public}@peer %{public}@%{public}@: %{public}@:%lld (%@)", buf, 0x52u);

        if (v68)
        {
        }
        id v11 = v114;
      }

      v37 = [(id)a1 errors];
      [v37 addObject:v35];
    }
    unint64_t v20 = v32;
LABEL_39:

    id v12 = v116;
    unint64_t v16 = 0x1E9222000uLL;
    goto LABEL_40;
  }
LABEL_82:
}

- (id)initWithParent:(void *)a3 localStorage:(void *)a4 transport:(void *)a5 peer:(void *)a6 policy:(void *)a7 type:
{
  id v14 = a3;
  id v21 = a4;
  id v15 = a5;
  id v20 = a6;
  id v16 = a7;
  if (a1)
  {
    v22.receiver = a1;
    v22.super_class = (Class)_DKPerformSyncDownPeerDeletionsOperation;
    uint64_t v17 = (id *)objc_msgSendSuper2(&v22, sel_initWithParent_, a2);
    v18 = v17;
    if (v17)
    {
      objc_storeStrong(v17 + 37, a3);
      objc_storeStrong(v18 + 38, a4);
      objc_storeStrong(v18 + 39, a5);
      objc_storeStrong(v18 + 40, a6);
      objc_storeStrong(v18 + 41, a7);
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  uint64_t v3 = objc_opt_class();
  if (+[_DKSync2Coordinator shouldDeferSyncOperationWithClass:syncType:transport:peer:policy:]((uint64_t)_DKSync2Coordinator, v3, self->_type, self->_transport, self->_peer, self->_policy))
  {
    [(_DKPerformSyncDownPeerDeletionsOperation *)self endOperation];
  }
  else
  {
    -[_DKPerformSyncDownPeerDeletionsOperation performSyncDownPeerDeletions]((uint64_t)self);
  }
}

- (uint64_t)performSyncDownPeerDeletions
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v2);

    uint64_t v3 = *(void **)(v1 + 296);
    uint64_t v4 = *(void *)(v1 + 312);
    v5 = [*(id *)(v1 + 304) name];
    uint64_t v6 = [v3 deletionsSyncHistoryForPeer:v4 transportName:v5 error:0];
    v7 = *(void **)(v1 + 344);
    *(void *)(v1 + 344) = v6;

    uint64_t v8 = objc_opt_class();
    if (+[_DKSync2Coordinator canPerformSyncOperationWithClass:syncType:history:transport:peer:policy:]((uint64_t)_DKSync2Coordinator, v8, *(void **)(v1 + 328), *(void **)(v1 + 344), *(void **)(v1 + 304), *(void **)(v1 + 312), *(void **)(v1 + 320)))
    {
      id v9 = *(void **)(v1 + 304);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __72___DKPerformSyncDownPeerDeletionsOperation_performSyncDownPeerDeletions__block_invoke;
      v10[3] = &unk_1E560D730;
      v10[4] = v1;
      return [v9 prewarmFetchWithCompletion:v10];
    }
    else
    {
      return [(id)v1 endOperation];
    }
  }
  return result;
}

- (void)performSyncDownPeerDeletionsWithDidPrewarm:(void *)a3 orError:
{
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v6);

    if (v5)
    {
      v7 = [(id)a1 errors];
      [v7 addObject:v5];
LABEL_11:

      [(id)a1 endOperation];
      goto LABEL_12;
    }
    uint64_t v8 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[_DKPerformSyncDownPeerDeletionsOperation performSyncDownPeerDeletionsWithDidPrewarm:orError:](a1, v8);
    }

    if (!a2 || ([*(id *)(a1 + 304) hasDeletionsFlagForPeer:*(void *)(a1 + 312)] & 1) == 0)
    {
      v7 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[_DKPerformSyncDownPeerDeletionsOperation performSyncDownPeerDeletionsWithDidPrewarm:orError:](a1, v7);
      }
      goto LABEL_11;
    }
    id v9 = [MEMORY[0x1E4F1C9C8] date];
    -[_DKPerformSyncDownPeerDeletionsOperation performSyncDownPeerDeletionsWithHighWaterMark:orError:](a1, v9, 0);
  }
LABEL_12:
}

- (void)performSyncDownPeerDeletionsWithHighWaterMark:(void *)a3 orError:
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = v7;
  if (a1)
  {
    if (v7)
    {
      id v9 = [(id)a1 errors];
      [v9 addObject:v8];
    }
    else
    {
      if (v6)
      {
        id v10 = [MEMORY[0x1E4F1C9C8] distantPast];
        char v11 = [v6 isEqualToDate:v10];

        if ((v11 & 1) == 0)
        {
          objc_storeStrong((id *)(a1 + 352), a2);
          -[_DKPerformSyncDownPeerDeletionsOperation performSyncDownPeerDeletionsWithPreviousUntilDate:](a1, 0);
          goto LABEL_10;
        }
      }
      id v12 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[_DKPerformSyncDownPeerDeletionsOperation performSyncDownPeerDeletionsWithHighWaterMark:orError:](a1, v12);
      }

      [*(id *)(a1 + 304) setHasDeletionsFlag:0 forPeer:*(void *)(a1 + 312)];
    }
    [(id)a1 endOperation];
  }
LABEL_10:
}

- (void)performSyncDownPeerDeletionsWithPreviousUntilDate:(uint64_t)a1
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = +[_CDLogging syncChannel];
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v5) {
        -[_DKPerformSyncDownPeerDeletionsOperation performSyncDownPeerDeletionsWithPreviousUntilDate:].cold.5(a1, (uint64_t)v3, (uint64_t)v4, v6, v7, v8, v9, v10, v48, v49, v50, v52, SWORD2(v52), SHIWORD(v52), v55, v58, v63, v64, (uint64_t)v65,
      }
          v66,
          (uint64_t)v67,
          (uint64_t)v68,
          (uint64_t)v69,
          *(uint64_t *)buf,
          *(uint64_t *)&buf[8],
          *(uint64_t *)&buf[16],
          v71,
          *(uint64_t *)v72,
          *(uint64_t *)&v72[8],
          *(uint64_t *)&v72[16],
          *(uint64_t *)&v72[24]);

      id v11 = v3;
      goto LABEL_6;
    }
    if (v5) {
      -[_DKPerformSyncDownPeerDeletionsOperation performSyncDownPeerDeletionsWithPreviousUntilDate:].cold.4(a1, v4);
    }

    if ([*(id *)(a1 + 312) me])
    {
      id v26 = 0;
    }
    else
    {
      v27 = *(void **)(a1 + 296);
      uint64_t v28 = *(void *)(a1 + 312);
      v29 = [*(id *)(a1 + 304) name];
      id v69 = 0;
      id v11 = [v27 lastSyncDownDeletionDateForPeer:v28 transportName:v29 error:&v69];
      id v26 = v69;

      if (v11) {
        goto LABEL_21;
      }
    }
    id v11 = [MEMORY[0x1E4F1C9C8] distantPast];
LABEL_21:
    if (v26)
    {
      v30 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        -[_DKPerformSyncDownPeerDeletionsOperation performSyncDownPeerDeletionsWithPreviousUntilDate:](a1, (uint64_t)v26, (uint64_t)v30, v31, v32, v33, v34, v35, v48, (uint64_t)v49, v50, v52, SWORD2(v52), SHIWORD(v52), v55, v58, v63, v64, (uint64_t)v65,
      }
          v66,
          (uint64_t)v67,
          (uint64_t)v68,
          (uint64_t)v69,
          *(uint64_t *)buf,
          *(uint64_t *)&buf[8],
          *(uint64_t *)&buf[16],
          v71,
          *(uint64_t *)v72,
          *(uint64_t *)&v72[8],
          *(uint64_t *)&v72[16],
          *(uint64_t *)&v72[24]);

      id v12 = [(id)a1 errors];
      [v12 addObject:v26];
      goto LABEL_29;
    }
LABEL_6:
    id v12 = *(id *)(a1 + 352);
    v13 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v61 = [(id)objc_opt_class() description];
      v56 = -[NSDate dk_localtimeString](v11);
      v59 = -[NSDate dk_localtimeString](v12);
      int v37 = [*(id *)(a1 + 312) me];
      v38 = &stru_1EDDE58B8;
      id v39 = @"pseudo ";
      if (!v37) {
        id v39 = &stru_1EDDE58B8;
      }
      v53 = v39;
      v40 = [*(id *)(a1 + 312) identifier];
      unint64_t v41 = [*(id *)(a1 + 312) model];
      if (v41)
      {
        uint64_t v42 = NSString;
        *((void *)&v50 + 1) = [*(id *)(a1 + 312) model];
        v38 = [v42 stringWithFormat:@" (%@)", *((void *)&v50 + 1)];
      }
      *(_DWORD *)buf = 138544642;
      *(void *)&uint8_t buf[4] = v61;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v56;
      *(_WORD *)&buf[22] = 2114;
      uint64_t v71 = (uint64_t)v59;
      *(_WORD *)int v72 = 2114;
      *(void *)&v72[2] = v53;
      *(_WORD *)&v72[10] = 2114;
      *(void *)&v72[12] = v40;
      *(_WORD *)&v72[20] = 2114;
      *(void *)&v72[22] = v38;
      _os_log_debug_impl(&dword_18ECEB000, v13, OS_LOG_TYPE_DEBUG, "%{public}@: Syncing down deletions with bookmark [%{public}@ ending %{public}@] from %{public}@peer %{public}@%{public}@", buf, 0x3Eu);
      if (v41)
      {
      }
    }

    [v12 timeIntervalSinceReferenceDate];
    double v15 = v14;
    [v11 timeIntervalSinceReferenceDate];
    if (v15 - v16 <= (double)(unint64_t)[*(id *)(a1 + 320) minSyncWindowInSeconds])
    {
      uint64_t v17 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        [(_DKPerformSyncDownPeerDeletionsOperation *)(id *)a1 performSyncDownPeerDeletionsWithPreviousUntilDate:v17];
      }
    }
    else
    {
      uint64_t v17 = [*(id *)(a1 + 320) streamNamesToSyncWithDisabledFeatures:0];
      if ([v17 count])
      {
        uint64_t v18 = *(void *)(a1 + 360);
        if (!v18)
        {
          v19 = [*(id *)(a1 + 344) lastSyncDate];
          +[_DKPerformSyncDownPeerDeletionsOperation _updateEventStatsWithPreviousSyncDate:transportType:]((uint64_t)_DKPerformSyncDownPeerDeletionsOperation, v19, [*(id *)(a1 + 304) transportType]);

          uint64_t v18 = *(void *)(a1 + 360);
        }
        *(void *)(a1 + 360) = v18 + 1;
        id v20 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          double v62 = [(id)objc_opt_class() description];
          v54 = -[NSDate dk_localtimeString](v11);
          v60 = -[NSDate dk_localtimeString](v12);
          int v43 = [*(id *)(a1 + 312) me];
          v44 = &stru_1EDDE58B8;
          v45 = @"pseudo ";
          if (!v43) {
            v45 = &stru_1EDDE58B8;
          }
          v51 = v45;
          v57 = [*(id *)(a1 + 312) identifier];
          v46 = [*(id *)(a1 + 312) model];
          if (v46)
          {
            v47 = NSString;
            *(void *)&long long v50 = [*(id *)(a1 + 312) model];
            v44 = [v47 stringWithFormat:@" (%@)", (void)v50];
          }
          *(_DWORD *)buf = 138544642;
          *(void *)&uint8_t buf[4] = v62;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v54;
          *(_WORD *)&buf[22] = 2114;
          uint64_t v71 = (uint64_t)v60;
          *(_WORD *)int v72 = 2114;
          *(void *)&v72[2] = v51;
          *(_WORD *)&v72[10] = 2114;
          *(void *)&v72[12] = v57;
          *(_WORD *)&v72[20] = 2114;
          *(void *)&v72[22] = v44;
          _os_log_debug_impl(&dword_18ECEB000, v20, OS_LOG_TYPE_DEBUG, "%{public}@: Fetching deletions with bookmark [%{public}@ ending %{public}@] from %{public}@peer %{public}@%{public}@", buf, 0x3Eu);
          if (v46)
          {
          }
        }

        id v21 = *(void **)(a1 + 304);
        uint64_t v22 = *(void *)(a1 + 312);
        uint64_t v23 = [*(id *)(a1 + 320) syncBatchSizeInEvents];
        uint64_t v24 = *(unsigned __int8 *)(a1 + 336);
        *(void *)&long long v63 = MEMORY[0x1E4F143A8];
        *((void *)&v63 + 1) = 3221225472;
        double v64 = __94___DKPerformSyncDownPeerDeletionsOperation_performSyncDownPeerDeletionsWithPreviousUntilDate___block_invoke;
        int v65 = &unk_1E560EF38;
        uint64_t v66 = a1;
        id v11 = v11;
        id v67 = v11;
        id v68 = v12;
        id v25 = v12;
        [v21 fetchDeletedEventIDsFromPeer:v22 sinceDate:v11 streamNames:v17 limit:v23 highPriority:v24 completion:&v63];

        id v26 = 0;
LABEL_32:

        goto LABEL_33;
      }
      v36 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
        -[_DKPerformSyncDownPeerDeletionsOperation performSyncDownPeerDeletionsWithPreviousUntilDate:](a1, v36);
      }
    }
    id v26 = 0;
LABEL_29:

    if ([*(id *)(a1 + 304) transportType] != 1) {
      [*(id *)(a1 + 304) setHasDeletionsFlag:0 forPeer:*(void *)(a1 + 312)];
    }
    [(id)a1 endOperation];
    goto LABEL_32;
  }
LABEL_33:
}

+ (void)_updateEventStatsWithPreviousSyncDate:(uint64_t)a3 transportType:
{
  id v11 = a2;
  self;
  if (_updateEventStatsWithPreviousSyncDate_transportType__syncCadenceInitialized != -1) {
    dispatch_once(&_updateEventStatsWithPreviousSyncDate_transportType__syncCadenceInitialized, &__block_literal_global_43);
  }
  if (v11)
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] distantPast];
    char v5 = [v11 isEqualToDate:v4];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceByTransportCounter;
      uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
      if (a3 == 1) {
        uint64_t v8 = @"Rapport";
      }
      else {
        uint64_t v8 = @"Cloud";
      }
      -[_DKEventTypeStatsTimerCounter addTimingWithStartDate:endDate:typeValue:](v6, (uint64_t)v11, v7, v8);
    }
  }
  uint64_t v9 = _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceCounter;
  uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
  -[_DKEventStatsTimerCounter addTimingWithStartDate:endDate:](v9, (uint64_t)v11, v10);
}

+ (void)_updateEventStatsWithTotal:(uint64_t)a3 transportType:
{
  self;
  if (_updateEventStatsWithTotal_transportType__syncDownDeletionsCounterInitialized != -1) {
    dispatch_once(&_updateEventStatsWithTotal_transportType__syncDownDeletionsCounterInitialized, &__block_literal_global_41);
  }
  -[_DKEventStatsCounter incrementCountByNumber:](_updateEventStatsWithTotal_transportType__syncDownDeletionsTotalCounter, a2);
  uint64_t v5 = _updateEventStatsWithTotal_transportType__syncDownDeletionsTotalByTransportCounter;
  if (a3 == 1) {
    uint64_t v6 = @"Rapport";
  }
  else {
    uint64_t v6 = @"Cloud";
  }
  -[_DKEventTypeStatsCounter incrementCountByNumber:typeValue:](v5, a2, v6);
}

- (void)endOperation
{
  v2.receiver = self;
  v2.super_class = (Class)_DKPerformSyncDownPeerDeletionsOperation;
  [(_DKSyncCompositeOperation *)&v2 endOperation];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highWaterMark, 0);
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_peer, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_localStorage, 0);
}

- (void)performSyncDownPeerDeletionsWithPreviousUntilDate:(NSObject *)a3 .cold.2(id *a1, void *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(id)objc_opt_class() description];
  uint64_t v7 = -[NSDate dk_localtimeString](a2);
  uint64_t v8 = &stru_1EDDE58B8;
  [a1[39] me];
  uint64_t v9 = [(id)OUTLINED_FUNCTION_10_2() identifier];
  uint64_t v10 = [(id)OUTLINED_FUNCTION_10_2() model];
  if (v10)
  {
    id v11 = NSString;
    [(id)OUTLINED_FUNCTION_10_2() model];
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_43();
    uint64_t v8 = [v11 stringWithFormat:@" (%@)"];
  }
  OUTLINED_FUNCTION_13_2();
  v13 = v7;
  OUTLINED_FUNCTION_8_2();
  _os_log_debug_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_DEBUG, "%{public}@: Deletions bookmark %@ is up-to-date for deletions sync down for %{public}@peer %{public}@%{public}@", buf, 0x34u);
  if (v10)
  {
  }
}

- (void)performSyncDownPeerDeletionsWithPreviousUntilDate:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf, int a12, __int16 a13, __int16 a14, void *a15, long long a16, long long a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  OUTLINED_FUNCTION_4();
  a30 = v31;
  a31 = v32;
  uint64_t v34 = v33;
  v36 = v35;
  v38 = v37;
  a19 = *MEMORY[0x1E4F143B8];
  id v39 = [(id)objc_opt_class() description];
  v40 = &stru_1EDDE58B8;
  if ([v38[39] me]) {
    unint64_t v41 = @"pseudo ";
  }
  else {
    unint64_t v41 = &stru_1EDDE58B8;
  }
  uint64_t v42 = [(id)OUTLINED_FUNCTION_9_2() identifier];
  int v43 = [(id)OUTLINED_FUNCTION_9_2() model];
  if (v43)
  {
    v44 = NSString;
    [(id)OUTLINED_FUNCTION_9_2() model];
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_43();
    v40 = [v44 stringWithFormat:@" (%@)"];
  }
  v45 = [v36 domain];
  uint64_t v46 = [v36 code];
  LODWORD(buf) = 138544898;
  *(void *)((char *)&buf + 4) = v39;
  WORD6(buf) = 2114;
  *(void *)((char *)&buf + 14) = v41;
  a14 = 2114;
  a15 = v42;
  LOWORD(a16) = 2114;
  *(void *)((char *)&a16 + 2) = v40;
  WORD5(a16) = 2114;
  *(void *)((char *)&a16 + 12) = v45;
  WORD2(a17) = 2048;
  *(void *)((char *)&a17 + 6) = v46;
  HIWORD(a17) = 2112;
  a18 = v36;
  _os_log_debug_impl(&dword_18ECEB000, v34, OS_LOG_TYPE_DEBUG, "%{public}@: Failed to find last sync down deletions bookmark from %{public}@peer %{public}@%{public}@: %{public}@:%lld (%@)", (uint8_t *)&buf, 0x48u);

  if (v43)
  {
  }
  OUTLINED_FUNCTION_3_2();
}

- (void)performSyncDownPeerDeletionsWithPreviousUntilDate:(uint64_t)a3 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, os_log_t loga, long long buf, int a12, __int16 a13, __int16 a14, __CFString *a15, long long a16, long long a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  OUTLINED_FUNCTION_4();
  a30 = v31;
  a31 = v32;
  log = v33;
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  a19 = *MEMORY[0x1E4F143B8];
  v38 = [(id)objc_opt_class() description];
  if ([*(id *)(v37 + 304) transportType] == 8) {
    id v39 = "up to";
  }
  else {
    id v39 = "down from";
  }
  v40 = (void *)0x1E9222000;
  unint64_t v41 = &stru_1EDDE58B8;
  if ([*(id *)(v37 + 312) me]) {
    uint64_t v42 = @"pseudo ";
  }
  else {
    uint64_t v42 = &stru_1EDDE58B8;
  }
  int v43 = [(id)OUTLINED_FUNCTION_9_2() identifier];
  v44 = [(id)OUTLINED_FUNCTION_9_2() model];
  if (v44)
  {
    v45 = NSString;
    v40 = [(id)OUTLINED_FUNCTION_9_2() model];
    unint64_t v41 = [v45 stringWithFormat:@" (%@)"];
  }
  uint64_t v46 = [*(id *)(v37 + 304) name];
  v47 = -[NSDate dk_localtimeString](v35);
  LODWORD(buf) = 138544898;
  *(void *)((char *)&buf + 4) = v38;
  WORD6(buf) = 2082;
  *(void *)((char *)&buf + 14) = v39;
  a14 = 2114;
  a15 = v42;
  LOWORD(a16) = 2114;
  *(void *)((char *)&a16 + 2) = v43;
  WORD5(a16) = 2114;
  *(void *)((char *)&a16 + 12) = v41;
  WORD2(a17) = 2114;
  *(void *)((char *)&a17 + 6) = v46;
  HIWORD(a17) = 2112;
  a18 = v47;
  _os_log_debug_impl(&dword_18ECEB000, log, OS_LOG_TYPE_DEBUG, "%{public}@: Will attempt another deletions sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@ since %@", (uint8_t *)&buf, 0x48u);

  if (v44)
  {
  }
  OUTLINED_FUNCTION_3_2();
}

- (void)handleFetchedDeletedEventIDs:(NSObject *)a3 startDate:endDate:untilDate:.cold.1(id *a1, void *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(id)objc_opt_class() description];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  uint64_t v8 = &stru_1EDDE58B8;
  [a1[39] me];
  uint64_t v9 = [(id)OUTLINED_FUNCTION_10_2() identifier];
  uint64_t v10 = [(id)OUTLINED_FUNCTION_10_2() model];
  if (v10)
  {
    id v11 = NSString;
    [(id)OUTLINED_FUNCTION_10_2() model];
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_43();
    uint64_t v8 = [v11 stringWithFormat:@" (%@)"];
  }
  OUTLINED_FUNCTION_13_2();
  v13 = v7;
  OUTLINED_FUNCTION_8_2();
  _os_log_error_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Unable to delete %@ events, missing source device id in peer %{public}@peer %{public}@%{public}@", buf, 0x34u);
  if (v10)
  {
  }
}

- (void)handleFetchedDeletedEventIDs:(NSObject *)a3 startDate:endDate:untilDate:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(id)objc_opt_class() description];
  uint64_t v6 = [a2 domain];
  int v7 = 138544130;
  uint64_t v8 = v5;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  __int16 v11 = 2048;
  uint64_t v12 = [a2 code];
  __int16 v13 = 2112;
  uint64_t v14 = a2;
  _os_log_error_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Failed while saving metadata: %{public}@:%lld (%@)", (uint8_t *)&v7, 0x2Au);
}

@end