@interface CKDPCSFetchAggregator
- (BOOL)fetchRequestForExistingOperation:(id)a3 isDependentOnOperation:(id)a4;
- (BOOL)skipQueuedFetchCycleDetection;
- (CKCoalescer)fetchCoalescer;
- (CKDContainer)container;
- (CKDPCSFetchAggregator)init;
- (CKDPCSFetchAggregator)initWithContainer:(id)a3;
- (NSMutableArray)queuedFetches;
- (NSMutableArray)runningFetches;
- (NSOperationQueue)queue;
- (OS_dispatch_queue)opQueue;
- (OS_dispatch_source)timerSource;
- (id)_lockedGetQueuedFetchForOperation:(id)a3 ofClass:(Class)a4;
- (void)_lockedFetchesAreReady;
- (void)_lockedRescheduleFetchTimer;
- (void)_lockedTearDownFetchTimer;
- (void)cancelAllOperations;
- (void)dealloc;
- (void)requestFetchOfRecordWithID:(id)a3 forOperation:(id)a4 withCompletionHandler:(id)a5;
- (void)requestFetchOfShareWithID:(id)a3 forOperation:(id)a4 withCompletionHandler:(id)a5;
- (void)requestFetchOfZoneWithID:(id)a3 forOperation:(id)a4 withCompletionHandler:(id)a5;
- (void)setContainer:(id)a3;
- (void)setFetchCoalescer:(id)a3;
- (void)setOpQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setQueuedFetches:(id)a3;
- (void)setRunningFetches:(id)a3;
- (void)setSkipQueuedFetchCycleDetection:(BOOL)a3;
- (void)setTimerSource:(id)a3;
@end

@implementation CKDPCSFetchAggregator

- (CKDPCSFetchAggregator)init
{
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  id v4 = objc_alloc(MEMORY[0x1E4F1A018]);
  id v6 = (id)objc_msgSend_initWithName_format_(v4, v5, *MEMORY[0x1E4F1C3C8], @"You must call -[%@ initWithContainer:]", v3);
  objc_exception_throw(v6);
}

- (CKDPCSFetchAggregator)initWithContainer:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CKDPCSFetchAggregator;
  v5 = [(CKDPCSFetchAggregator *)&v24 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_container, v4);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.cloudkit.pcs.fetchAggregator", v7);
    opQueue = v6->_opQueue;
    v6->_opQueue = (OS_dispatch_queue *)v8;

    v10 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    queue = v6->_queue;
    v6->_queue = v10;

    uint64_t v12 = objc_opt_new();
    queuedFetches = v6->_queuedFetches;
    v6->_queuedFetches = (NSMutableArray *)v12;

    uint64_t v14 = objc_opt_new();
    runningFetches = v6->_runningFetches;
    v6->_runningFetches = (NSMutableArray *)v14;

    objc_initWeak(&location, v6);
    id v16 = objc_alloc(MEMORY[0x1E4F19EA0]);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_1C502FE48;
    v21[3] = &unk_1E64F4358;
    objc_copyWeak(&v22, &location);
    uint64_t v18 = objc_msgSend_initWithActivityDelay_maxActivityDelay_coalescingInterval_processingDelay_notifyBlock_(v16, v17, 10000000, 100000000, 0, 0, v21);
    fetchCoalescer = v6->_fetchCoalescer;
    v6->_fetchCoalescer = (CKCoalescer *)v18;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)dealloc
{
  timerSource = self->_timerSource;
  if (timerSource) {
    dispatch_source_cancel(timerSource);
  }
  v4.receiver = self;
  v4.super_class = (Class)CKDPCSFetchAggregator;
  [(CKDPCSFetchAggregator *)&v4 dealloc];
}

- (void)_lockedFetchesAreReady
{
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  objc_super v4 = objc_msgSend_opQueue(self, a2, v2);
  dispatch_assert_queue_V2(v4);

  v5 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v6 = (os_log_t *)MEMORY[0x1E4F1A500];
  v7 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    v106 = v7;
    objc_msgSend_runningFetches(self, v107, v108);
    v109 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_queuedFetches(self, v110, v111);
    v112 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v144 = v109;
    __int16 v145 = 2112;
    v146 = v112;
    _os_log_debug_impl(&dword_1C4CFF000, v106, OS_LOG_TYPE_DEBUG, "Cleaning up finished fetches and starting pending fetches. Running fetches are %@ and pending fetches are %@", buf, 0x16u);
  }
  long long v136 = 0u;
  long long v137 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  v10 = objc_msgSend_runningFetches(self, v8, v9);
  v13 = objc_msgSend_mutableCopy(v10, v11, v12);

  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v134, v142, 16);
  if (v15)
  {
    uint64_t v18 = v15;
    uint64_t v19 = *(void *)v135;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v135 != v19) {
          objc_enumerationMutation(v13);
        }
        v21 = *(__CFString **)(*((void *)&v134 + 1) + 8 * v20);
        if (objc_msgSend_isFinished(v21, v16, v17))
        {
          if (*v5 != -1) {
            dispatch_once(v5, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          id v22 = *v6;
          if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v144 = v21;
            _os_log_debug_impl(&dword_1C4CFF000, v22, OS_LOG_TYPE_DEBUG, "Fetch %@ is finished. Removing it now.", buf, 0xCu);
          }
          v25 = objc_msgSend_runningFetches(self, v23, v24);
          objc_msgSend_removeObject_(v25, v26, (uint64_t)v21);
        }
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v134, v142, 16);
    }
    while (v18);
  }

  v114 = objc_opt_new();
  long long v130 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  objc_msgSend_queuedFetches(self, v27, v28);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v117 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v130, v141, 16);
  if (v117)
  {
    uint64_t v116 = *(void *)v131;
    *(void *)&long long v32 = 138412290;
    long long v113 = v32;
    do
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v131 != v116) {
          objc_enumerationMutation(obj);
        }
        v34 = *(__CFString **)(*((void *)&v130 + 1) + 8 * v33);
        long long v126 = 0u;
        long long v127 = 0u;
        long long v128 = 0u;
        long long v129 = 0u;
        v35 = objc_msgSend_runningFetches(self, v30, v31, v113);
        uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v126, v140, 16);
        if (v37)
        {
          uint64_t v39 = v37;
          v40 = v6;
          v41 = v5;
          uint64_t v42 = *(void *)v127;
LABEL_25:
          uint64_t v43 = 0;
          while (1)
          {
            if (*(void *)v127 != v42) {
              objc_enumerationMutation(v35);
            }
            v44 = *(void **)(*((void *)&v126 + 1) + 8 * v43);
            if (objc_msgSend_canBeUsedForPendingFetch_(v44, v38, (uint64_t)v34))
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                break;
              }
            }
            if (v39 == ++v43)
            {
              uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v38, (uint64_t)&v126, v140, 16);
              if (v39) {
                goto LABEL_25;
              }
              int v45 = 1;
              v5 = v41;
              id v6 = v40;
              goto LABEL_57;
            }
          }
          v5 = v41;
          if (*v41 != -1) {
            dispatch_once(v41, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          id v6 = v40;
          v46 = *v40;
          if (os_log_type_enabled(*v40, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v113;
            v144 = v34;
            _os_log_debug_impl(&dword_1C4CFF000, v46, OS_LOG_TYPE_DEBUG, "Holding queued fetch %@ because an equivalent fetch is already running", buf, 0xCu);
          }
          objc_msgSend_setEquivalentRunningFetch_(v34, v47, (uint64_t)v44);

          if ((objc_msgSend_skipQueuedFetchCycleDetection(self, v48, v49) & 1) == 0)
          {
            long long v124 = 0u;
            long long v125 = 0u;
            long long v122 = 0u;
            long long v123 = 0u;
            v35 = objc_msgSend_runningFetches(self, v50, v51);
            uint64_t v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v52, (uint64_t)&v122, v139, 16);
            if (v53)
            {
              uint64_t v55 = v53;
              uint64_t v56 = *(void *)v123;
LABEL_40:
              uint64_t v57 = 0;
              while (1)
              {
                if (*(void *)v123 != v56) {
                  objc_enumerationMutation(v35);
                }
                if (objc_msgSend_dependentOperationListContainsRunningFetch_(v34, v54, *(void *)(*((void *)&v122 + 1) + 8 * v57)))break; {
                if (v55 == ++v57)
                }
                {
                  uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v54, (uint64_t)&v122, v139, 16);
                  id v6 = v40;
                  if (v55) {
                    goto LABEL_40;
                  }
                  goto LABEL_46;
                }
              }
              v5 = v41;
              if (*v41 != -1) {
                dispatch_once(v41, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
              }
              id v6 = v40;
              os_log_t v74 = *v40;
              if (os_log_type_enabled(*v40, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v113;
                v144 = v34;
                v72 = v74;
                v73 = "Firing queued fetch %@ immediately since a running fetch is waiting on it";
                goto LABEL_69;
              }
              goto LABEL_56;
            }
LABEL_46:

            v5 = v41;
          }
          v35 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v50, v51);
          v60 = objc_msgSend_queuedDate(v34, v58, v59);
          objc_msgSend_timeIntervalSinceDate_(v35, v61, (uint64_t)v60);
          double v63 = v62;
          v66 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v64, v65);
          objc_msgSend_maximumQueuedFetchWaitTime(v66, v67, v68);
          double v70 = v69;

          if (v63 <= v70)
          {
            int v45 = 0;
            goto LABEL_57;
          }
          if (*v5 != -1) {
            dispatch_once(v5, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          os_log_t v71 = *v6;
          if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v113;
            v144 = v34;
            v72 = v71;
            v73 = "Firing queued fetch %@ immediately since its been waiting too long";
LABEL_69:
            _os_log_debug_impl(&dword_1C4CFF000, v72, OS_LOG_TYPE_DEBUG, v73, buf, 0xCu);
          }
        }
LABEL_56:
        int v45 = 1;
LABEL_57:

        if (*v5 != -1) {
          dispatch_once(v5, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v75 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543618;
          v79 = @"not ";
          if (v45) {
            v79 = &stru_1F2044F30;
          }
          v144 = v79;
          __int16 v145 = 2112;
          v146 = v34;
          _os_log_debug_impl(&dword_1C4CFF000, v75, OS_LOG_TYPE_DEBUG, "Fetch is %{public}@ready to fire: %@", buf, 0x16u);
          if (v45)
          {
LABEL_61:
            objc_msgSend_setEquivalentRunningFetch_(v34, v76, 0);
            objc_msgSend_addObject_(v114, v78, (uint64_t)v34);
            goto LABEL_66;
          }
        }
        else if (v45)
        {
          goto LABEL_61;
        }
        objc_msgSend__lockedRescheduleFetchTimer(self, v76, v77);
LABEL_66:
        ++v33;
      }
      while (v33 != v117);
      uint64_t v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v30, (uint64_t)&v130, v141, 16);
      uint64_t v117 = v80;
    }
    while (v80);
  }

  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  id v81 = v114;
  uint64_t v83 = objc_msgSend_countByEnumeratingWithState_objects_count_(v81, v82, (uint64_t)&v118, v138, 16);
  if (v83)
  {
    uint64_t v86 = v83;
    uint64_t v87 = *(void *)v119;
    do
    {
      for (uint64_t i = 0; i != v86; ++i)
      {
        if (*(void *)v119 != v87) {
          objc_enumerationMutation(v81);
        }
        v89 = *(void **)(*((void *)&v118 + 1) + 8 * i);
        v90 = objc_msgSend_runningFetches(self, v84, v85);
        objc_msgSend_addObject_(v90, v91, (uint64_t)v89);

        v94 = objc_msgSend_queuedFetches(self, v92, v93);
        objc_msgSend_removeObject_(v94, v95, (uint64_t)v89);

        objc_msgSend_start(v89, v96, v97);
      }
      uint64_t v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(v81, v84, (uint64_t)&v118, v138, 16);
    }
    while (v86);
  }

  v100 = objc_msgSend_queuedFetches(self, v98, v99);
  uint64_t v103 = objc_msgSend_count(v100, v101, v102);

  if (!v103) {
    objc_msgSend__lockedTearDownFetchTimer(self, v104, v105);
  }
}

- (void)_lockedTearDownFetchTimer
{
  objc_super v4 = objc_msgSend_timerSource(self, a2, v2);

  if (v4)
  {
    v7 = objc_msgSend_timerSource(self, v5, v6);
    dispatch_source_cancel(v7);

    objc_msgSend_setTimerSource_(self, v8, 0);
  }
}

- (void)_lockedRescheduleFetchTimer
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  objc_msgSend__lockedTearDownFetchTimer(self, a2, v2);
  uint64_t v6 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v4, v5);
  objc_msgSend_maximumQueuedFetchWaitTime(v6, v7, v8);
  double v10 = v9;

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  float v11 = v10;
  uint64_t v12 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    int location = 134217984;
    double location_4 = v11;
    _os_log_debug_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_DEBUG, "Rescheduling queued fetch timer to fire after %.2f seconds", (uint8_t *)&location, 0xCu);
  }
  dispatch_source_t v13 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_opQueue);
  objc_msgSend_setTimerSource_(self, v14, (uint64_t)v13);

  objc_initWeak((id *)&location, self);
  uint64_t v17 = objc_msgSend_timerSource(self, v15, v16);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = sub_1C5030AEC;
  handler[3] = &unk_1E64F09E0;
  objc_copyWeak(&v27, (id *)&location);
  dispatch_source_set_event_handler(v17, handler);

  uint64_t v20 = objc_msgSend_timerSource(self, v18, v19);
  float v21 = v11 * 1000000000.0;
  dispatch_time_t v22 = dispatch_time(0, (uint64_t)v21);
  dispatch_source_set_timer(v20, v22, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)v21);

  v25 = objc_msgSend_timerSource(self, v23, v24);
  dispatch_resume(v25);

  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)&location);
}

- (id)_lockedGetQueuedFetchForOperation:(id)a3 ofClass:(Class)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  val = self;
  double v9 = objc_msgSend_opQueue(self, v7, v8);
  dispatch_assert_queue_V2(v9);

  if (*MEMORY[0x1E4F1A4E0])
  {
    uint64_t v12 = objc_msgSend_unitTestOverrides(v6, v10, v11);
    uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v12, v13, @"ForceNoQueuedFetchCycleDetection");

    if (v14) {
      objc_msgSend_setSkipQueuedFetchCycleDetection_(self, v10, 1);
    }
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v15 = objc_msgSend_queuedFetches(self, v10, v11);
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v54, v61, 16);
  if (v18)
  {
    uint64_t v19 = *(void *)v55;
LABEL_6:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v55 != v19) {
        objc_enumerationMutation(v15);
      }
      float v21 = *(void **)(*((void *)&v54 + 1) + 8 * v20);
      if (objc_msgSend_canBeUsedForOperation_(v21, v17, (uint64_t)v6))
      {
        if (objc_opt_isKindOfClass())
        {
          if (!*MEMORY[0x1E4F1A4E0]) {
            break;
          }
          v23 = objc_msgSend_unitTestOverrides(v6, v17, v22);
          v25 = objc_msgSend_objectForKeyedSubscript_(v23, v24, @"ForceNoQueuedFetchReuse");

          if (!v25) {
            break;
          }
        }
      }
      if (v18 == ++v20)
      {
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v17, (uint64_t)&v54, v61, 16);
        if (v18) {
          goto LABEL_6;
        }
        goto LABEL_15;
      }
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v26 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      v47 = v26;
      v50 = objc_msgSend_operationID(v6, v48, v49);
      *(_DWORD *)int location = 138412546;
      *(void *)&location[4] = v21;
      __int16 v59 = 2114;
      v60 = v50;
      _os_log_debug_impl(&dword_1C4CFF000, v47, OS_LOG_TYPE_DEBUG, "Re-using fetch request %@ for operation %{public}@", location, 0x16u);
    }
    id v27 = v21;

    if (v27) {
      goto LABEL_26;
    }
  }
  else
  {
LABEL_15:
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v28 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v43 = v28;
    v46 = objc_msgSend_operationID(v6, v44, v45);
    *(_DWORD *)int location = 138543362;
    *(void *)&location[4] = v46;
    _os_log_debug_impl(&dword_1C4CFF000, v43, OS_LOG_TYPE_DEBUG, "Creating a new fetch request for operation %{public}@", location, 0xCu);
  }
  id v29 = [a4 alloc];
  long long v32 = objc_msgSend_container(val, v30, v31);
  v35 = objc_msgSend_queue(val, v33, v34);
  id v27 = (id)objc_msgSend_initWithOperation_container_operationQueue_(v29, v36, (uint64_t)v6, v32, v35);

  objc_initWeak((id *)location, val);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = sub_1C5030FAC;
  v52[3] = &unk_1E64F09E0;
  objc_copyWeak(&v53, (id *)location);
  objc_msgSend_setCompletionHandler_(v27, v37, (uint64_t)v52);
  v40 = objc_msgSend_queuedFetches(val, v38, v39);
  objc_msgSend_addObject_(v40, v41, (uint64_t)v27);

  objc_destroyWeak(&v53);
  objc_destroyWeak((id *)location);
LABEL_26:

  return v27;
}

- (BOOL)fetchRequestForExistingOperation:(id)a3 isDependentOnOperation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v11 = objc_msgSend_opQueue(self, v9, v10);
  dispatch_assert_queue_not_V2(v11);

  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_1C50311B0;
  v23[4] = sub_1C50311C0;
  id v12 = v8;
  id v24 = v12;
  uint64_t v15 = objc_msgSend_opQueue(self, v13, v14);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C50311C8;
  block[3] = &unk_1E64F8A50;
  block[4] = self;
  id v19 = v7;
  uint64_t v20 = v23;
  float v21 = &v25;
  SEL v22 = a2;
  id v16 = v7;
  dispatch_sync(v15, block);

  LOBYTE(v7) = *((unsigned char *)v26 + 24);
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(&v25, 8);
  return (char)v7;
}

- (void)requestFetchOfRecordWithID:(id)a3 forOperation:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_source_t v13 = objc_msgSend_opQueue(self, v11, v12);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1C5031508;
  v17[3] = &unk_1E64F1B98;
  id v18 = v8;
  id v19 = self;
  id v20 = v9;
  id v21 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(v13, v17);
}

- (void)requestFetchOfShareWithID:(id)a3 forOperation:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_source_t v13 = objc_msgSend_opQueue(self, v11, v12);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1C5031AFC;
  v17[3] = &unk_1E64F1B98;
  id v18 = v8;
  id v19 = self;
  id v20 = v9;
  id v21 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(v13, v17);
}

- (void)requestFetchOfZoneWithID:(id)a3 forOperation:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_source_t v13 = objc_msgSend_opQueue(self, v11, v12);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1C5031FB4;
  v17[3] = &unk_1E64F1B98;
  id v18 = v8;
  id v19 = self;
  id v20 = v9;
  id v21 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(v13, v17);
}

- (void)cancelAllOperations
{
  objc_super v4 = objc_msgSend_opQueue(self, a2, v2);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C5032378;
  block[3] = &unk_1E64F05C8;
  block[4] = self;
  dispatch_async(v4, block);
}

- (CKDContainer)container
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  return (CKDContainer *)WeakRetained;
}

- (void)setContainer:(id)a3
{
}

- (OS_dispatch_queue)opQueue
{
  return self->_opQueue;
}

- (void)setOpQueue:(id)a3
{
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableArray)queuedFetches
{
  return self->_queuedFetches;
}

- (void)setQueuedFetches:(id)a3
{
}

- (NSMutableArray)runningFetches
{
  return self->_runningFetches;
}

- (void)setRunningFetches:(id)a3
{
}

- (CKCoalescer)fetchCoalescer
{
  return self->_fetchCoalescer;
}

- (void)setFetchCoalescer:(id)a3
{
}

- (OS_dispatch_source)timerSource
{
  return self->_timerSource;
}

- (void)setTimerSource:(id)a3
{
}

- (BOOL)skipQueuedFetchCycleDetection
{
  return self->_skipQueuedFetchCycleDetection;
}

- (void)setSkipQueuedFetchCycleDetection:(BOOL)a3
{
  self->_skipQueuedFetchCycleDetection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong((id *)&self->_fetchCoalescer, 0);
  objc_storeStrong((id *)&self->_runningFetches, 0);
  objc_storeStrong((id *)&self->_queuedFetches, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_opQueue, 0);
  objc_destroyWeak((id *)&self->_container);
}

@end