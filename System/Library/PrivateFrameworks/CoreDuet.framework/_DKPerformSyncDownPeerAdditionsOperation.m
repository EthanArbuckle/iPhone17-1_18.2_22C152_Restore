@interface _DKPerformSyncDownPeerAdditionsOperation
+ (void)_updateEventStatsWithIsNewestMissingWindow:(uint64_t)a1;
+ (void)_updateEventStatsWithPreviousSyncDate:(uint64_t)a3 transportType:;
+ (void)_updateEventStatsWithSyncLatencyOfEvent:(void *)a3 ingressDate:(uint64_t)a4 transportType:;
+ (void)_updateEventStatsWithTotal:(void *)a3 streamNameCounts:(uint64_t)a4 transportType:;
- (BOOL)isAsynchronous;
- (id)initWithParent:(void *)a3 localStorage:(void *)a4 transport:(void *)a5 peer:(void *)a6 policy:(void *)a7 type:;
- (uint64_t)performSyncDownPeerAdditions;
- (void)coalesceRedundantOverlappingWindows;
- (void)endOperation;
- (void)handleFetchedEvents:(void *)a3 completedWindows:(void *)a4 missingWindows:;
- (void)main;
- (void)performSyncDownPeerAdditionsWithCompletedWindows:(uint64_t)a1;
- (void)performSyncDownPeerAdditionsWithDidPrewarm:(void *)a3 orError:;
- (void)performSyncDownPeerAdditionsWithHighWaterMark:(void *)a3 orError:;
- (void)updateEvents:(void *)a3 withSourceDeviceID:;
@end

@implementation _DKPerformSyncDownPeerAdditionsOperation

- (void)handleFetchedEvents:(void *)a3 completedWindows:(void *)a4 missingWindows:
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!a1)
  {
    v12 = v7;
    goto LABEL_52;
  }
  v10 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v10);

  v11 = +[_DKCompatibility currentCompatibility];
  v12 = [v11 filterIncompatibleEvents:v7];

  uint64_t v13 = [v12 count];
  v14 = +[_CDLogging syncChannel];
  v15 = v14;
  v16 = &OBJC_IVAR___CloudFamilyAnalysisPETContactEvent__thirdPartyMsgNightFri;
  v17 = &OBJC_IVAR___CloudFamilyAnalysisPETContactEvent__thirdPartyMsgNightFri;
  id v94 = v9;
  if (v13)
  {
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      goto LABEL_25;
    }
    id v84 = v8;
    v91 = [(id)objc_opt_class() description];
    v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
    uint64_t v87 = _DKSyncLoggingWindowsDescription(v9);
    if ([*(id *)(a1 + 304) transportType] == 8) {
      v19 = "up to";
    }
    else {
      v19 = "down from";
    }
    v20 = &OBJC_IVAR___CloudFamilyAnalysisPETContactEvent__thirdPartyMsgNightFri;
    v21 = &stru_1EDDE58B8;
    if ([*(id *)(a1 + 312) me]) {
      v22 = @"pseudo ";
    }
    else {
      v22 = &stru_1EDDE58B8;
    }
    v23 = [*(id *)(a1 + 312) identifier];
    v24 = [*(id *)(a1 + 312) model];
    v81 = v12;
    if (v24)
    {
      v25 = NSString;
      v20 = [*(id *)(a1 + 312) model];
      v21 = [v25 stringWithFormat:@" (%@)", v20];
    }
    v32 = [*(id *)(a1 + 304) name];
    *(_DWORD *)buf = 138545154;
    v100 = v91;
    __int16 v101 = 2112;
    v102 = v18;
    __int16 v103 = 2114;
    uint64_t v104 = v87;
    __int16 v105 = 2082;
    uint64_t v106 = (uint64_t)v19;
    __int16 v107 = 2114;
    v108 = v22;
    __int16 v109 = 2114;
    v110 = v23;
    __int16 v111 = 2114;
    uint64_t v112 = (uint64_t)v21;
    __int16 v113 = 2114;
    id v114 = v32;
    _os_log_impl(&dword_18ECEB000, v15, OS_LOG_TYPE_INFO, "%{public}@: Fetched %@ events in windows %{public}@ doing sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@", buf, 0x52u);

    if (v24)
    {
    }
    v33 = (void *)v87;
  }
  else
  {
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_25;
    }
    id v84 = v8;
    v88 = [(id)objc_opt_class() description];
    v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
    uint64_t v92 = _DKSyncLoggingWindowsDescription(v9);
    if ([*(id *)(a1 + 304) transportType] == 8) {
      v27 = "up to";
    }
    else {
      v27 = "down from";
    }
    v28 = &stru_1EDDE58B8;
    if ([*(id *)(a1 + 312) me]) {
      v29 = @"pseudo ";
    }
    else {
      v29 = &stru_1EDDE58B8;
    }
    v30 = [*(id *)(a1 + 312) identifier];
    v31 = [*(id *)(a1 + 312) model];
    v81 = v12;
    if (v31)
    {
      v70 = NSString;
      v78 = [*(id *)(a1 + 312) model];
      v28 = [v70 stringWithFormat:@" (%@)", v78];
    }
    v71 = [*(id *)(a1 + 304) name];
    *(_DWORD *)buf = 138545154;
    v100 = v88;
    __int16 v101 = 2112;
    v102 = v26;
    __int16 v103 = 2114;
    uint64_t v104 = v92;
    __int16 v105 = 2082;
    uint64_t v106 = (uint64_t)v27;
    __int16 v107 = 2114;
    v108 = v29;
    __int16 v109 = 2114;
    v110 = v30;
    __int16 v111 = 2114;
    uint64_t v112 = (uint64_t)v28;
    __int16 v113 = 2114;
    id v114 = v71;
    _os_log_debug_impl(&dword_18ECEB000, v15, OS_LOG_TYPE_DEBUG, "%{public}@: Fetched %@ events in windows %{public}@ doing sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@", buf, 0x52u);

    if (v31)
    {
    }
    v33 = (void *)v92;
  }

  v12 = v81;
  id v8 = v84;
  v16 = &OBJC_IVAR___CloudFamilyAnalysisPETContactEvent__thirdPartyMsgNightFri;
  v17 = &OBJC_IVAR___CloudFamilyAnalysisPETContactEvent__thirdPartyMsgNightFri;
LABEL_25:

  uint64_t v34 = [*(id *)(a1 + 312) sourceDeviceID];
  v35 = (void *)v34;
  if (!v34)
  {
    v48 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      -[_DKPerformSyncDownPeerAdditionsOperation handleFetchedEvents:completedWindows:missingWindows:]((id *)a1, v12, v48);
    }

    v36 = [(id)a1 errors];
    v49 = +[_DKSyncErrors internalFailure];
    [v36 addObject:v49];
    v50 = 0;
    goto LABEL_47;
  }
  v93 = (void *)v34;
  v36 = +[_DKSyncPeerStatusTracker sharedInstance];
  v37 = [MEMORY[0x1E4F1C9C8] date];
  objc_msgSend(v36, "setLastSuccessfulActivityDate:onTransport:forPeer:", v37, objc_msgSend(*(id *)(a1 + 304), "transportType"), *(void *)(a1 + 312));

  if ([v12 count])
  {
    *(unsigned char *)(a1 + 400) = 1;
    -[_DKPerformSyncDownPeerAdditionsOperation updateEvents:withSourceDeviceID:](a1, v12, v93);
    v38 = *(void **)(a1 + 296);
    id v98 = 0;
    int v39 = [v38 saveEvents:v12 error:&v98];
    id v40 = v98;
    v41 = +[_CDLogging syncChannel];
    v42 = v41;
    if (v39)
    {
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        v89 = [(id)objc_opt_class() description];
        v82 = v12;
        v79 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
        v43 = &stru_1EDDE58B8;
        if ([*(id *)(a1 + 312) me]) {
          v44 = @"pseudo ";
        }
        else {
          v44 = &stru_1EDDE58B8;
        }
        v45 = [*(id *)(a1 + 312) identifier];
        v46 = [*(id *)(a1 + 312) model];
        if (v46)
        {
          v47 = NSString;
          v76 = [*(id *)(a1 + 312) model];
          v43 = [v47 stringWithFormat:@" (%@)", v76];
        }
        id v85 = v8;
        v51 = _DKSyncLoggingWindowsDescription(v8);
        *(_DWORD *)buf = 138544642;
        v100 = v89;
        __int16 v101 = 2112;
        v102 = v79;
        __int16 v103 = 2114;
        uint64_t v104 = (uint64_t)v44;
        __int16 v105 = 2114;
        uint64_t v106 = (uint64_t)v45;
        __int16 v107 = 2114;
        v108 = v43;
        __int16 v109 = 2114;
        v110 = v51;
        _os_log_impl(&dword_18ECEB000, v42, OS_LOG_TYPE_INFO, "%{public}@: Saved %@ events from %{public}@peer %{public}@%{public}@ in windows %{public}@", buf, 0x3Eu);
        if (v46)
        {
        }
        v12 = v82;
        id v8 = v85;
        v16 = &OBJC_IVAR___CloudFamilyAnalysisPETContactEvent__thirdPartyMsgNightFri;
      }
    }
    else
    {
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        id v86 = v8;
        v90 = [(id)objc_opt_class() description];
        v83 = v12;
        v80 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
        int v65 = [*(id *)(a1 + 312) me];
        v66 = &stru_1EDDE58B8;
        v67 = @"pseudo ";
        if (!v65) {
          v67 = &stru_1EDDE58B8;
        }
        v77 = v67;
        v68 = [*(id *)(a1 + 312) identifier];
        v69 = [*(id *)(a1 + 312) model];
        if (v69)
        {
          v72 = NSString;
          v75 = [*(id *)(a1 + 312) model];
          v66 = [v72 stringWithFormat:@" (%@)", v75];
        }
        v73 = [v40 domain];
        uint64_t v74 = [v40 code];
        *(_DWORD *)buf = 138545154;
        v100 = v90;
        __int16 v101 = 2112;
        v102 = v80;
        __int16 v103 = 2114;
        uint64_t v104 = (uint64_t)v77;
        __int16 v105 = 2114;
        uint64_t v106 = (uint64_t)v68;
        __int16 v107 = 2114;
        v108 = v66;
        __int16 v109 = 2114;
        v110 = v73;
        __int16 v111 = 2048;
        uint64_t v112 = v74;
        __int16 v113 = 2112;
        id v114 = v40;
        _os_log_error_impl(&dword_18ECEB000, v42, OS_LOG_TYPE_ERROR, "%{public}@: Failed while saving %@ events from %{public}@peer %{public}@%{public}@: %{public}@:%lld (%@)", buf, 0x52u);

        if (v69)
        {
        }
        v12 = v83;
        id v8 = v86;
        v16 = &OBJC_IVAR___CloudFamilyAnalysisPETContactEvent__thirdPartyMsgNightFri;
      }

      v42 = [(id)a1 errors];
      [v42 addObject:v40];
    }
  }
  v52 = v12;
  v53 = *(void **)(a1 + 296);
  v54 = v16;
  uint64_t v55 = *(void *)(a1 + v16[234]);
  v56 = [*(id *)(a1 + 304) name];
  id v97 = 0;
  [v53 saveSyncedDownWindows:v8 peer:v55 transportName:v56 error:&v97];
  v50 = (__CFString *)v97;

  v57 = +[_CDLogging syncChannel];
  v58 = v57;
  if (v50)
  {
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      v61 = [(id)objc_opt_class() description];
      v62 = _DKSyncLoggingWindowsDescription(v8);
      v63 = [(__CFString *)v50 domain];
      uint64_t v64 = [(__CFString *)v50 code];
      *(_DWORD *)buf = 138544386;
      v100 = v61;
      __int16 v101 = 2114;
      v102 = v62;
      __int16 v103 = 2114;
      uint64_t v104 = (uint64_t)v63;
      __int16 v105 = 2048;
      uint64_t v106 = v64;
      __int16 v107 = 2112;
      v108 = v50;
      _os_log_error_impl(&dword_18ECEB000, v58, OS_LOG_TYPE_ERROR, "%{public}@: Failed while saving synced down windows %{public}@: %{public}@:%lld (%@)", buf, 0x34u);
    }
    v49 = [(id)a1 errors];
    [v49 addObject:v50];
    v12 = v52;
    v16 = v54;
    v17 = &OBJC_IVAR___CloudFamilyAnalysisPETContactEvent__thirdPartyMsgNightFri;
    v35 = v93;
LABEL_47:

    v59 = v36;
    v36 = v50;
LABEL_48:

    id v9 = v94;
    if ([*(id *)(a1 + v17[233]) transportType] != 1) {
      [*(id *)(a1 + v17[233]) setHasAdditionsFlag:0 forPeer:*(void *)(a1 + v16[234])];
    }
    [(id)a1 endOperation];
    goto LABEL_51;
  }
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
    -[_DKPerformSyncDownPeerAdditionsOperation handleFetchedEvents:completedWindows:missingWindows:]((id *)a1, v8, v58);
  }

  unint64_t v60 = *(void *)(a1 + 384);
  v12 = v52;
  if (v60 >= [*(id *)(a1 + 320) maxBatchesPerSync])
  {
    v16 = v54;
    v59 = v36;
    v36 = 0;
    v17 = &OBJC_IVAR___CloudFamilyAnalysisPETContactEvent__thirdPartyMsgNightFri;
    v35 = v93;
    goto LABEL_48;
  }
  v95[0] = MEMORY[0x1E4F143A8];
  v95[1] = 3221225472;
  v95[2] = __96___DKPerformSyncDownPeerAdditionsOperation_handleFetchedEvents_completedWindows_missingWindows___block_invoke;
  v95[3] = &unk_1E560D848;
  v95[4] = a1;
  id v96 = v8;
  +[_DKSyncSerializer performAsyncBlock:v95];

  v35 = v93;
  id v9 = v94;
LABEL_51:

LABEL_52:
}

- (void)coalesceRedundantOverlappingWindows
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v5 = [(id)objc_opt_class() description];
  v6 = [a2 domain];
  int v7 = 138544130;
  id v8 = v5;
  __int16 v9 = 2114;
  v10 = v6;
  __int16 v11 = 2048;
  uint64_t v12 = [a2 code];
  __int16 v13 = 2112;
  v14 = a2;
  _os_log_error_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Failed while saving coalesced event: %{public}@:%lld (%@)", (uint8_t *)&v7, 0x2Au);
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
    v22.super_class = (Class)_DKPerformSyncDownPeerAdditionsOperation;
    v17 = (id *)objc_msgSendSuper2(&v22, sel_initWithParent_, a2);
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
  if (+[_DKSync2Coordinator shouldDeferSyncOperationWithClass:syncType:transport:peer:policy:]((uint64_t)_DKSync2Coordinator, v3, self->_type, self->_transport, 0, self->_policy))
  {
    [(_DKPerformSyncDownPeerAdditionsOperation *)self endOperation];
  }
  else
  {
    -[_DKPerformSyncDownPeerAdditionsOperation performSyncDownPeerAdditions]((uint64_t)self);
  }
}

- (uint64_t)performSyncDownPeerAdditions
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v2);

    uint64_t v3 = objc_msgSend(*(id *)(v1 + 320), "streamNamesToSyncWithSyncType:transportType:", *(void *)(v1 + 328), objc_msgSend(*(id *)(v1 + 304), "transportType"));
    v4 = *(void **)(v1 + 336);
    *(void *)(v1 + 336) = v3;

    if ([*(id *)(v1 + 336) count])
    {
      v5 = *(void **)(v1 + 296);
      uint64_t v6 = *(void *)(v1 + 312);
      int v7 = [*(id *)(v1 + 304) name];
      uint64_t v8 = [v5 additionsSyncHistoryForPeer:v6 transportName:v7 error:0];
      __int16 v9 = *(void **)(v1 + 352);
      *(void *)(v1 + 352) = v8;

      uint64_t v10 = objc_opt_class();
      if (+[_DKSync2Coordinator canPerformSyncOperationWithClass:syncType:history:transport:peer:policy:]((uint64_t)_DKSync2Coordinator, v10, *(void **)(v1 + 328), *(void **)(v1 + 352), *(void **)(v1 + 304), *(void **)(v1 + 312), *(void **)(v1 + 320)))
      {
        __int16 v11 = *(void **)(v1 + 304);
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __72___DKPerformSyncDownPeerAdditionsOperation_performSyncDownPeerAdditions__block_invoke;
        v13[3] = &unk_1E560D730;
        v13[4] = v1;
        return [v11 prewarmFetchWithCompletion:v13];
      }
    }
    else
    {
      uint64_t v12 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        [(_DKPerformSyncDownPeerAdditionsOperation *)v1 performSyncDownPeerAdditions];
      }
    }
    return [(id)v1 endOperation];
  }
  return result;
}

- (void)performSyncDownPeerAdditionsWithDidPrewarm:(void *)a3 orError:
{
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v6);

    if (v5)
    {
      int v7 = [(id)a1 errors];
      [v7 addObject:v5];
LABEL_11:

      [(id)a1 endOperation];
      goto LABEL_12;
    }
    if (!a2 || ![*(id *)(a1 + 304) hasAdditionsFlagForPeer:*(void *)(a1 + 312)])
    {
      int v7 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[_DKPerformSyncDownPeerAdditionsOperation performSyncDownPeerAdditionsWithDidPrewarm:orError:](a1, v7);
      }
      goto LABEL_11;
    }
    uint64_t v8 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[_DKPerformSyncDownPeerAdditionsOperation performSyncDownPeerAdditionsWithDidPrewarm:orError:](a1, v8);
    }

    __int16 v9 = *(void **)(a1 + 304);
    uint64_t v10 = *(void *)(a1 + 312);
    uint64_t v11 = *(unsigned __int8 *)(a1 + 344);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __95___DKPerformSyncDownPeerAdditionsOperation_performSyncDownPeerAdditionsWithDidPrewarm_orError___block_invoke;
    v12[3] = &unk_1E560FB68;
    v12[4] = a1;
    [v9 fetchAdditionsHighWaterMarkWithPeer:v10 highPriority:v11 completion:v12];
  }
LABEL_12:
}

- (void)performSyncDownPeerAdditionsWithHighWaterMark:(void *)a3 orError:
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = v7;
  if (a1)
  {
    if (v7)
    {
      __int16 v9 = [(id)a1 errors];
      [v9 addObject:v8];
    }
    else
    {
      if (v6)
      {
        uint64_t v10 = [MEMORY[0x1E4F1C9C8] distantPast];
        char v11 = [v6 isEqualToDate:v10];

        if ((v11 & 1) == 0)
        {
          objc_storeStrong((id *)(a1 + 376), a2);
          -[_DKPerformSyncDownPeerAdditionsOperation performSyncDownPeerAdditionsWithCompletedWindows:](a1, 0);
          goto LABEL_10;
        }
      }
      uint64_t v12 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[_DKPerformSyncDownPeerAdditionsOperation performSyncDownPeerAdditionsWithHighWaterMark:orError:](a1, v12);
      }

      [*(id *)(a1 + 304) setHasAdditionsFlag:0 forPeer:*(void *)(a1 + 312)];
    }
    [(id)a1 endOperation];
  }
LABEL_10:
}

- (void)performSyncDownPeerAdditionsWithCompletedWindows:(uint64_t)a1
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    v4 = +[_CDLogging syncChannel];
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v5) {
        -[_DKPerformSyncDownPeerAdditionsOperation performSyncDownPeerAdditionsWithCompletedWindows:].cold.5(a1, v4);
      }
    }
    else if (v5)
    {
      -[_DKPerformSyncDownPeerAdditionsOperation performSyncDownPeerAdditionsWithCompletedWindows:].cold.4(a1, v4);
    }

    id v6 = &OBJC_IVAR___CloudFamilyAnalysisPETContactEvent__thirdPartyMsgNightFri;
    if (!*(void *)(a1 + 384))
    {
      uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v8 = *(void **)(a1 + 368);
      *(void *)(a1 + 368) = v7;
    }
    uint64_t v9 = [*(id *)(a1 + 320) maxSyncPeriodInDays];
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-(double)(unint64_t)(86400 * v9)];
    id v11 = *(id *)(a1 + 368);
    [v11 timeIntervalSinceReferenceDate];
    double v13 = v12;
    [v10 timeIntervalSinceReferenceDate];
    if (v13 - v14 < (double)(unint64_t)[*(id *)(a1 + 320) minSyncWindowInSeconds])
    {
      v77 = v10;
      id v15 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v74 = [(id)objc_opt_class() description];
        v80 = -[NSDate dk_localtimeString](v77);
        v71 = -[NSDate dk_localtimeString](v11);
        v50 = &stru_1EDDE58B8;
        if ([*(id *)(a1 + 312) me]) {
          v51 = @"pseudo ";
        }
        else {
          v51 = &stru_1EDDE58B8;
        }
        v52 = [*(id *)(a1 + 312) identifier];
        v53 = [*(id *)(a1 + 312) model];
        if (v53)
        {
          v54 = NSString;
          id v6 = [*(id *)(a1 + 312) model];
          v50 = [v54 stringWithFormat:@" (%@)", v6];
        }
        *(_DWORD *)buf = 138544642;
        id v85 = v74;
        __int16 v86 = 2114;
        uint64_t v87 = v80;
        __int16 v88 = 2114;
        uint64_t v89 = (uint64_t)v71;
        __int16 v90 = 2114;
        uint64_t v91 = (uint64_t)v51;
        __int16 v92 = 2114;
        v93 = v52;
        __int16 v94 = 2114;
        v95 = v50;
        _os_log_debug_impl(&dword_18ECEB000, v15, OS_LOG_TYPE_DEBUG, "%{public}@: No more missing additions windows found between %{public}@ and %{public}@ for %{public}@peer %{public}@%{public}@", buf, 0x3Eu);
        if (v53)
        {
        }
        id v6 = &OBJC_IVAR___CloudFamilyAnalysisPETContactEvent__thirdPartyMsgNightFri;
      }

      id v16 = 0;
      id v17 = 0;
      if (![0 count]) {
        goto LABEL_43;
      }
      goto LABEL_32;
    }
    v18 = *(void **)(a1 + 392);
    if (v18)
    {
      uint64_t v19 = +[_DKSyncWindow sortedUnionOfSortedWindows:andSortedWindows:]((uint64_t)_DKSyncWindow, v18, v3);
      id v16 = 0;
      id v20 = *(NSObject **)(a1 + 392);
      *(void *)(a1 + 392) = v19;
    }
    else
    {
      id v21 = *(void **)(a1 + 296);
      uint64_t v22 = *(void *)(a1 + 312);
      id v83 = 0;
      uint64_t v23 = [v21 sortedSyncDownWindowsOverlappingBetweenDate:v10 andDate:v11 peer:v22 error:&v83];
      id v16 = v83;
      v24 = *(void **)(a1 + 392);
      *(void *)(a1 + 392) = v23;

      if (!v16) {
        goto LABEL_19;
      }
      id v20 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        [(_DKPerformSyncDownPeerAdditionsOperation *)a1 performSyncDownPeerAdditionsWithCompletedWindows:v20];
      }
    }

LABEL_19:
    v25 = *(void **)(a1 + 392);
    if (!v25)
    {
      id v17 = 0;
LABEL_30:
      if (![v17 count])
      {
        if (v16)
        {
          v46 = [(id)a1 errors];
          [v46 addObject:v16];

LABEL_50:
          if ([*(id *)(a1 + 304) transportType] != 1) {
            [*(id *)(a1 + 304) setHasAdditionsFlag:0 forPeer:*(void *)(a1 + 312)];
          }
          [(id)a1 endOperation];
LABEL_53:

          goto LABEL_54;
        }
        v77 = v10;
LABEL_43:
        v47 = *(void **)(a1 + 392);
        if (v47)
        {
          if (*(void *)(a1 + 352))
          {
            unint64_t v48 = [v47 count];
            if (v48 > [*(id *)(a1 + 352) lastDaySyncCount] + *(void *)(a1 + v6[241]) + 100)
            {
              v49 = +[_CDLogging syncChannel];
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
                -[_DKPerformSyncDownPeerAdditionsOperation performSyncDownPeerAdditionsWithCompletedWindows:](a1, v49);
              }

              -[_DKPerformSyncDownPeerAdditionsOperation coalesceRedundantOverlappingWindows](a1);
            }
          }
        }
        notify_post("com.apple.CoreDuet.SyncDownPeerAdditions.NoMoreDataToSync");
        id v16 = 0;
        uint64_t v10 = v77;
        goto LABEL_50;
      }
      v77 = v10;
LABEL_32:
      id v79 = v16;
      id v32 = v3;
      uint64_t v33 = v6[241];
      uint64_t v34 = *(void *)(a1 + v33);
      if (!v34)
      {
        v35 = [*(id *)(a1 + 352) lastSyncDate];
        +[_DKPerformSyncDownPeerAdditionsOperation _updateEventStatsWithPreviousSyncDate:transportType:]((uint64_t)_DKPerformSyncDownPeerAdditionsOperation, v35, [*(id *)(a1 + 304) transportType]);

        uint64_t v33 = v6[241];
        uint64_t v34 = *(void *)(a1 + v33);
      }
      *(void *)(a1 + v33) = v34 + 1;
      v36 = [v17 lastObject];
      v37 = -[_DKSyncType urgency]((uint64_t)v36);
      +[_DKPerformSyncDownPeerAdditionsOperation _updateEventStatsWithIsNewestMissingWindow:]((uint64_t)_DKPerformSyncDownPeerAdditionsOperation, [v37 isEqualToDate:*(void *)(a1 + 376)]);

      v38 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
        [(_DKPerformSyncDownPeerAdditionsOperation *)a1 performSyncDownPeerAdditionsWithCompletedWindows:v38];
      }

      uint64_t v39 = [*(id *)(a1 + 320) syncBatchSizeInEvents];
      uint64_t v40 = [*(id *)(a1 + 304) transportType];
      v41 = *(void **)(a1 + 304);
      uint64_t v42 = *(void *)(a1 + 312);
      if (v40 == 4) {
        uint64_t v43 = 1;
      }
      else {
        uint64_t v43 = 2;
      }
      uint64_t v44 = *(void *)(a1 + 336);
      uint64_t v45 = *(unsigned __int8 *)(a1 + 344);
      v81[0] = MEMORY[0x1E4F143A8];
      v81[1] = 3221225472;
      v81[2] = __93___DKPerformSyncDownPeerAdditionsOperation_performSyncDownPeerAdditionsWithCompletedWindows___block_invoke;
      v81[3] = &unk_1E560FE78;
      v81[4] = a1;
      id v17 = v17;
      id v82 = v17;
      [v41 fetchEventsFromPeer:v42 windows:v17 streamNames:v44 limit:v39 fetchOrder:v43 highPriority:v45 completion:v81];

      id v3 = v32;
      uint64_t v10 = v77;
      id v16 = v79;
      goto LABEL_53;
    }
    id v78 = v16;
    +[_DKSyncWindow windowsMissingFromSortedWindows:windowMinimumDate:windowMaximumDate:]((uint64_t)_DKSyncWindow, v25, v10, v11);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = [v17 count];
    v27 = +[_CDLogging syncChannel];
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);
    if (v26)
    {
      if (v28)
      {
        v63 = [(id)objc_opt_class() description];
        v73 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
        v68 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 392), "count"));
        uint64_t v70 = -[NSDate dk_localtimeString](v10);
        id v76 = v11;
        -[NSDate dk_localtimeString](v11);
        v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v29 = &stru_1EDDE58B8;
        if ([*(id *)(a1 + 312) me]) {
          v30 = @"pseudo ";
        }
        else {
          v30 = &stru_1EDDE58B8;
        }
        uint64_t v64 = [*(id *)(a1 + 312) identifier];
        v31 = [*(id *)(a1 + 312) model];
        if (v31)
        {
          v58 = NSString;
          v61 = [*(id *)(a1 + 312) model];
          v29 = [v58 stringWithFormat:@" (%@)", v61];
        }
        *(_DWORD *)buf = 138545154;
        id v85 = v63;
        __int16 v86 = 2112;
        uint64_t v87 = v73;
        __int16 v88 = 2112;
        uint64_t v89 = (uint64_t)v68;
        __int16 v90 = 2114;
        uint64_t v91 = v70;
        __int16 v92 = 2114;
        v93 = v66;
        __int16 v94 = 2114;
        v95 = v30;
        __int16 v96 = 2114;
        id v97 = v64;
        __int16 v98 = 2114;
        v99 = v29;
        _os_log_debug_impl(&dword_18ECEB000, v27, OS_LOG_TYPE_DEBUG, "%{public}@: Found %@ missing additions windows in %@ windows between %{public}@ and %{public}@ for %{public}@peer %{public}@%{public}@", buf, 0x52u);
        if (v31)
        {
        }
        v59 = (void *)v70;
LABEL_76:

        id v11 = v76;
      }
    }
    else if (v28)
    {
      int v65 = [(id)objc_opt_class() description];
      v72 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 392), "count"));
      uint64_t v75 = -[NSDate dk_localtimeString](v10);
      id v76 = v11;
      v69 = -[NSDate dk_localtimeString](v11);
      uint64_t v55 = &stru_1EDDE58B8;
      if ([*(id *)(a1 + 312) me]) {
        v56 = @"pseudo ";
      }
      else {
        v56 = &stru_1EDDE58B8;
      }
      v67 = [*(id *)(a1 + 312) identifier];
      v57 = [*(id *)(a1 + 312) model];
      if (v57)
      {
        unint64_t v60 = NSString;
        v62 = [*(id *)(a1 + 312) model];
        uint64_t v55 = [v60 stringWithFormat:@" (%@)", v62];
      }
      *(_DWORD *)buf = 138544898;
      id v85 = v65;
      __int16 v86 = 2112;
      uint64_t v87 = v72;
      __int16 v88 = 2114;
      uint64_t v89 = v75;
      __int16 v90 = 2114;
      uint64_t v91 = (uint64_t)v69;
      __int16 v92 = 2114;
      v93 = v56;
      __int16 v94 = 2114;
      v95 = v67;
      __int16 v96 = 2114;
      id v97 = v55;
      _os_log_debug_impl(&dword_18ECEB000, v27, OS_LOG_TYPE_DEBUG, "%{public}@: No missing additions window found in %@ windows between %{public}@ and %{public}@ for %{public}@peer %{public}@%{public}@", buf, 0x48u);
      if (v57)
      {
      }
      v59 = (void *)v75;
      goto LABEL_76;
    }

    id v16 = v78;
    goto LABEL_30;
  }
LABEL_54:
}

+ (void)_updateEventStatsWithPreviousSyncDate:(uint64_t)a3 transportType:
{
  id v12 = a2;
  self;
  if (_updateEventStatsWithPreviousSyncDate_transportType__syncCadenceInitialized_2 != -1) {
    dispatch_once(&_updateEventStatsWithPreviousSyncDate_transportType__syncCadenceInitialized_2, &__block_literal_global_38_1);
  }
  v4 = v12;
  if (v12)
  {
    BOOL v5 = [MEMORY[0x1E4F1C9C8] distantPast];
    char v6 = [v12 isEqualToDate:v5];

    v4 = v12;
    if ((v6 & 1) == 0)
    {
      uint64_t v7 = _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceByTransportCounter_2;
      uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
      if (a3 == 1) {
        uint64_t v9 = @"Rapport";
      }
      else {
        uint64_t v9 = @"Cloud";
      }
      -[_DKEventTypeStatsTimerCounter addTimingWithStartDate:endDate:typeValue:](v7, (uint64_t)v12, v8, v9);

      uint64_t v10 = _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceCounter_2;
      id v11 = [MEMORY[0x1E4F1C9C8] date];
      -[_DKEventStatsTimerCounter addTimingWithStartDate:endDate:](v10, (uint64_t)v12, v11);

      v4 = v12;
    }
  }
}

+ (void)_updateEventStatsWithIsNewestMissingWindow:(uint64_t)a1
{
  self;
  if (_updateEventStatsWithIsNewestMissingWindow__syncDownAdditionsWindowAgeCounterInitialized != -1) {
    dispatch_once(&_updateEventStatsWithIsNewestMissingWindow__syncDownAdditionsWindowAgeCounterInitialized, &__block_literal_global_62);
  }
  uint64_t v3 = _updateEventStatsWithIsNewestMissingWindow__syncDownAdditionsWindowAgeCounter;
  if (a2) {
    v4 = @"newest";
  }
  else {
    v4 = @"older";
  }
  -[_DKEventTypeStatsCounter incrementCountByNumber:typeValue:](v3, 1, v4);
}

- (void)updateEvents:(void *)a3 withSourceDeviceID:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v7);

    uint64_t v23 = objc_opt_new();
    id v21 = v6;
    uint64_t v22 = objc_opt_new();
    [v22 setDeviceID:v6];
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v20 = v5;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          double v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v15 = objc_msgSend(v14, "source", v20);
          id v16 = v15;
          if (v15)
          {
            id v17 = [v15 deviceID];

            if (!v17) {
              [v16 setDeviceID:v21];
            }
          }
          else
          {
            [v14 setSource:v22];
          }
          v18 = [v14 stream];
          uint64_t v19 = [v18 name];

          if (v19) {
            [v23 addObject:v19];
          }
          +[_DKPerformSyncDownPeerAdditionsOperation _updateEventStatsWithSyncLatencyOfEvent:ingressDate:transportType:]((uint64_t)_DKPerformSyncDownPeerAdditionsOperation, v14, v8, [*(id *)(a1 + 304) transportType]);
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v11);
    }

    +[_DKPerformSyncDownPeerAdditionsOperation _updateEventStatsWithTotal:streamNameCounts:transportType:]((uint64_t)_DKPerformSyncDownPeerAdditionsOperation, [v9 count], v23, objc_msgSend(*(id *)(a1 + 304), "transportType"));
    id v5 = v20;
    id v6 = v21;
  }
}

+ (void)_updateEventStatsWithSyncLatencyOfEvent:(void *)a3 ingressDate:(uint64_t)a4 transportType:
{
  id v6 = a3;
  id v7 = a2;
  self;
  if (_updateEventStatsWithSyncLatencyOfEvent_ingressDate_transportType__syncDownAdditionsLatencyInitialized != -1) {
    dispatch_once(&_updateEventStatsWithSyncLatencyOfEvent_ingressDate_transportType__syncDownAdditionsLatencyInitialized, &__block_literal_global_68);
  }
  id v9 = [v7 creationDate];

  if (a4 == 1) {
    uint64_t v8 = @"Rapport";
  }
  else {
    uint64_t v8 = @"Cloud";
  }
  -[_DKEventTypeStatsTimerCounter addTimingWithStartDate:endDate:typeValue:](_updateEventStatsWithSyncLatencyOfEvent_ingressDate_transportType__syncDownAdditionsLatencyByTransportCounter, (uint64_t)v9, v6, v8);
  -[_DKEventStatsTimerCounter addTimingWithStartDate:endDate:](_updateEventStatsWithSyncLatencyOfEvent_ingressDate_transportType__syncDownAdditionsLatencyCounter, (uint64_t)v9, v6);
}

+ (void)_updateEventStatsWithTotal:(void *)a3 streamNameCounts:(uint64_t)a4 transportType:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  self;
  if (_updateEventStatsWithTotal_streamNameCounts_transportType__syncDownAdditionsCounterInitialized != -1) {
    dispatch_once(&_updateEventStatsWithTotal_streamNameCounts_transportType__syncDownAdditionsCounterInitialized, &__block_literal_global_76);
  }
  -[_DKEventStatsCounter incrementCountByNumber:](_updateEventStatsWithTotal_streamNameCounts_transportType__syncDownAdditionsTotalCounter, a2);
  if (a4 == 1) {
    id v7 = @"Rapport";
  }
  else {
    id v7 = @"Cloud";
  }
  -[_DKEventTypeStatsCounter incrementCountByNumber:typeValue:](_updateEventStatsWithTotal_streamNameCounts_transportType__syncDownAdditionsTotalByTransportCounter, a2, v7);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        double v14 = [(id)_updateEventStatsWithTotal_streamNameCounts_transportType__syncDownAdditionsCountersByStreamName objectForKeyedSubscript:v13];
        if (!v14)
        {
          id v15 = NSString;
          id v16 = +[_DKEventStatsUtilities safeStringWithString:v13];
          id v17 = [v15 stringWithFormat:@"sync_down_additions_stream%@", v16];

          double v14 = +[_DKEventStatsCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsCounter, @"coreduet_sync2", v17);
          [(id)_updateEventStatsWithTotal_streamNameCounts_transportType__syncDownAdditionsCountersByStreamName setObject:v14 forKeyedSubscript:v13];
        }
        -[_DKEventStatsCounter incrementCountByNumber:]((uint64_t)v14, [v8 countForObject:v13]);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
}

- (void)endOperation
{
  v2.receiver = self;
  v2.super_class = (Class)_DKPerformSyncDownPeerAdditionsOperation;
  [(_DKSyncCompositeOperation *)&v2 endOperation];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlappingWindows, 0);
  objc_storeStrong((id *)&self->_highWaterMark, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_keyValueStore, 0);
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_streamNames, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_peer, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_localStorage, 0);
}

- (void)performSyncDownPeerAdditionsWithDidPrewarm:(uint64_t)a1 orError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = [(id)objc_opt_class() description];
  id v5 = &stru_1EDDE58B8;
  if ([(id)OUTLINED_FUNCTION_19_1() me]) {
    id v6 = @"pseudo ";
  }
  else {
    id v6 = &stru_1EDDE58B8;
  }
  id v7 = [(id)OUTLINED_FUNCTION_19_1() identifier];
  id v8 = [(id)OUTLINED_FUNCTION_19_1() model];
  if (v8)
  {
    uint64_t v9 = NSString;
    [(id)OUTLINED_FUNCTION_19_1() model];
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_43();
    id v5 = [v9 stringWithFormat:@" (%@)"];
  }
  uint64_t v10 = [*(id *)(a1 + 304) name];
  OUTLINED_FUNCTION_18_1();
  double v14 = v6;
  OUTLINED_FUNCTION_17_1();
  __int16 v15 = v11;
  uint64_t v16 = v12;
  _os_log_debug_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_DEBUG, "%{public}@: Performing sync down of additions from %{public}@peer %{public}@%{public}@ on transport %{public}@", buf, 0x34u);

  if (v8)
  {
  }
}

- (void)performSyncDownPeerAdditionsWithCompletedWindows:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v4 = [(id)objc_opt_class() description];
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 392), "count"));
  int v6 = 138543618;
  id v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_DEBUG, "%{public}@: Coalescing (%@) redundant overlapping windows", (uint8_t *)&v6, 0x16u);
}

- (void)handleFetchedEvents:(id *)a1 completedWindows:(void *)a2 missingWindows:(NSObject *)a3 .cold.1(id *a1, void *a2, NSObject *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v6 = [(id)objc_opt_class() description];
  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  __int16 v8 = &stru_1EDDE58B8;
  if ([a1[39] me]) {
    uint64_t v9 = @"pseudo ";
  }
  else {
    uint64_t v9 = &stru_1EDDE58B8;
  }
  uint64_t v10 = [(id)OUTLINED_FUNCTION_15_2() identifier];
  __int16 v11 = [(id)OUTLINED_FUNCTION_15_2() model];
  if (v11)
  {
    uint64_t v12 = NSString;
    [(id)OUTLINED_FUNCTION_15_2() model];
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_43();
    __int16 v8 = [v12 stringWithFormat:@" (%@)"];
  }
  *(_DWORD *)buf = 138544386;
  double v14 = v6;
  __int16 v15 = 2112;
  uint64_t v16 = v7;
  __int16 v17 = 2114;
  long long v18 = v9;
  OUTLINED_FUNCTION_12_4();
  _os_log_error_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Unable to save %@ events, missing device id in peer %{public}@peer %{public}@%{public}@", buf, 0x34u);
  if (v11)
  {
  }
}

- (void)handleFetchedEvents:(id *)a1 completedWindows:(void *)a2 missingWindows:(NSObject *)a3 .cold.2(id *a1, void *a2, NSObject *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v6 = [(id)objc_opt_class() description];
  id v7 = _DKSyncLoggingWindowsDescription(a2);
  __int16 v8 = &stru_1EDDE58B8;
  if ([a1[39] me]) {
    uint64_t v9 = @"pseudo ";
  }
  else {
    uint64_t v9 = &stru_1EDDE58B8;
  }
  uint64_t v10 = [(id)OUTLINED_FUNCTION_15_2() identifier];
  __int16 v11 = [(id)OUTLINED_FUNCTION_15_2() model];
  if (v11)
  {
    uint64_t v12 = NSString;
    [(id)OUTLINED_FUNCTION_15_2() model];
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_43();
    __int16 v8 = [v12 stringWithFormat:@" (%@)"];
  }
  OUTLINED_FUNCTION_18_1();
  __int16 v15 = v7;
  __int16 v16 = v13;
  __int16 v17 = v9;
  OUTLINED_FUNCTION_12_4();
  _os_log_debug_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_DEBUG, "%{public}@: Successfully saved completed windows %{public}@ from %{public}@peer %{public}@%{public}@", buf, 0x34u);
  if (v11)
  {
  }
}

@end