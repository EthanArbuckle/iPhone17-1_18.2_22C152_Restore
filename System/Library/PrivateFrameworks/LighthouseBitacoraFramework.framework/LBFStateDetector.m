@interface LBFStateDetector
- (LBFStateDetector)init;
- (LBFStateDetector)initWithState:(int64_t)a3;
- (NSDate)currentTime;
- (id)processDprivacydEvent:(id)a3;
- (id)processEventsStartingFromState:(int64_t)a3 bucketStartTime:(id)a4 events:(id)a5;
- (id)processLighthouseEvent:(id)a3;
- (id)processMLRuntimedEvent:(id)a3;
- (id)processTrialdEvent:(id)a3;
- (id)validateTransition:(id)a3;
- (int64_t)currentState;
@end

@implementation LBFStateDetector

- (LBFStateDetector)init
{
  v3.receiver = self;
  v3.super_class = (Class)LBFStateDetector;
  result = [(LBFStateDetector *)&v3 init];
  if (result) {
    result->_currentState = 0;
  }
  return result;
}

- (LBFStateDetector)initWithState:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LBFStateDetector;
  result = [(LBFStateDetector *)&v5 init];
  if (result) {
    result->_currentState = a3;
  }
  return result;
}

- (id)processEventsStartingFromState:(int64_t)a3 bucketStartTime:(id)a4 events:(id)a5
{
  uint64_t v125 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  self->_currentState = a3;
  p_currentTime = (uint64_t *)&self->_currentTime;
  objc_storeStrong((id *)&self->_currentTime, a4);
  if (!objc_msgSend_count(v10, v12, v13, v14, v15)) {
    sub_254584E8C();
  }
  v20 = objc_msgSend_firstObject(v10, v16, v17, v18, v19);
  objc_opt_class();
  v116 = v20;
  if (objc_opt_isKindOfClass())
  {
    v25 = objc_msgSend_timestamp(v20, v21, v22, v23, v24);
    if (objc_msgSend_compare_(v25, v26, *p_currentTime, v27, v28) == -1)
    {
      objc_storeStrong((id *)&self->_currentTime, v25);
      v29 = LBFLogContextStateDetector;
      if (os_log_type_enabled((os_log_t)LBFLogContextStateDetector, OS_LOG_TYPE_ERROR)) {
        sub_254584EB8(v29, v30, v31, v32, v33, v34, v35, v36);
      }
    }
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v25 = objc_msgSend_timestamp(v20, v37, v38, v39, v40);
    if (objc_msgSend_compare_(v25, v41, *p_currentTime, v42, v43) == -1)
    {
      objc_storeStrong((id *)&self->_currentTime, v25);
      v44 = LBFLogContextStateDetector;
      if (os_log_type_enabled((os_log_t)LBFLogContextStateDetector, OS_LOG_TYPE_ERROR)) {
        sub_254584EF0(v44, v45, v46, v47, v48, v49, v50, v51);
      }
    }
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v25 = objc_msgSend_timestamp(v20, v52, v53, v54, v55);
    if (objc_msgSend_compare_(v25, v56, *p_currentTime, v57, v58) != -1) {
      goto LABEL_19;
    }
    objc_storeStrong((id *)&self->_currentTime, v25);
    v59 = LBFLogContextStateDetector;
    if (!os_log_type_enabled((os_log_t)LBFLogContextStateDetector, OS_LOG_TYPE_INFO)) {
      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    v60 = "found earlier triald event";
LABEL_18:
    _os_log_impl(&dword_254547000, v59, OS_LOG_TYPE_INFO, v60, buf, 2u);
LABEL_19:

    goto LABEL_20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v25 = objc_msgSend_timestamp(v20, v61, v62, v63, v64);
    if (objc_msgSend_compare_(v25, v65, *p_currentTime, v66, v67) != -1) {
      goto LABEL_19;
    }
    objc_storeStrong((id *)&self->_currentTime, v25);
    v59 = LBFLogContextStateDetector;
    if (!os_log_type_enabled((os_log_t)LBFLogContextStateDetector, OS_LOG_TYPE_INFO)) {
      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    v60 = "found earlier dprivacyd event";
    goto LABEL_18;
  }
  objc_storeStrong((id *)&self->_currentTime, a4);
  v108 = LBFLogContextStateDetector;
  if (os_log_type_enabled((os_log_t)LBFLogContextStateDetector, OS_LOG_TYPE_ERROR)) {
    sub_254584F28(v108, v109, v110, v111, v112, v113, v114, v115);
  }
LABEL_20:
  id v117 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  id v68 = v10;
  uint64_t v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v69, (uint64_t)&v118, (uint64_t)v124, 16);
  if (v70)
  {
    uint64_t v71 = v70;
    uint64_t v72 = *(void *)v119;
    do
    {
      for (uint64_t i = 0; i != v71; ++i)
      {
        if (*(void *)v119 != v72) {
          objc_enumerationMutation(v68);
        }
        uint64_t v74 = *(void *)(*((void *)&v118 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v78 = objc_msgSend_processMLRuntimedEvent_(self, v75, v74, v76, v77);
        }
        else
        {
          v78 = 0;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v82 = objc_msgSend_processLighthouseEvent_(self, v79, v74, v80, v81);

          v78 = (void *)v82;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v86 = objc_msgSend_processTrialdEvent_(self, v83, v74, v84, v85);

          v78 = (void *)v86;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v90 = objc_msgSend_validateTransition_(self, v87, (uint64_t)v78, v88, v89);
          objc_msgSend_addObject_(v117, v91, (uint64_t)v90, v92, v93);
        }
      }
      uint64_t v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v94, (uint64_t)&v118, (uint64_t)v124, 16);
    }
    while (v71);
  }

  v98 = objc_msgSend_numberWithInteger_(NSNumber, v95, self->_currentState, v96, v97);
  v123[0] = v98;
  v103 = objc_msgSend_copy(v117, v99, v100, v101, v102);
  v123[1] = v103;
  v106 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v104, (uint64_t)v123, 2, v105);

  return v106;
}

- (id)processMLRuntimedEvent:(id)a3
{
  id v4 = a3;
  id v9 = objc_msgSend_timestamp(v4, v5, v6, v7, v8);
  objc_msgSend_timeIntervalSinceDate_(v9, v10, (uint64_t)self->_currentTime, v11, v12);
  double v14 = v13;

  int64_t currentState = self->_currentState;
  v20 = objc_msgSend_taskFetched(v4, v16, v17, v18, v19);

  if (v20)
  {
    v25 = objc_msgSend_taskFetched(v4, v21, v22, v23, v24);
    int v30 = objc_msgSend_succeeded(v25, v26, v27, v28, v29);

    BOOL v35 = v30 == 0;
    uint64_t v36 = 12;
    uint64_t v37 = 4;
  }
  else
  {
    uint64_t v38 = objc_msgSend_taskScheduled(v4, v21, v22, v23, v24);

    if (v38)
    {
      uint64_t v43 = objc_msgSend_taskScheduled(v4, v39, v40, v41, v42);
      int v48 = objc_msgSend_succeeded(v43, v44, v45, v46, v47);

      BOOL v35 = v48 == 0;
      uint64_t v36 = 13;
      uint64_t v37 = 5;
    }
    else
    {
      uint64_t v49 = objc_msgSend_taskCompleted(v4, v39, v40, v41, v42);

      if (!v49)
      {
        int64_t v56 = 8;
        goto LABEL_10;
      }
      uint64_t v50 = objc_msgSend_taskCompleted(v4, v31, v32, v33, v34);
      int v55 = objc_msgSend_succeeded(v50, v51, v52, v53, v54);

      BOOL v35 = v55 == 0;
      uint64_t v36 = 14;
      uint64_t v37 = 6;
    }
  }
  if (v35) {
    int64_t v56 = v36;
  }
  else {
    int64_t v56 = v37;
  }
LABEL_10:
  objc_msgSend_timestamp(v4, v31, v32, v33, v34);
  uint64_t v57 = (NSDate *)objc_claimAutoreleasedReturnValue();
  currentTime = self->_currentTime;
  self->_currentTime = v57;

  self->_int64_t currentState = v56;
  v59 = [LBFBitacoraStateTransition alloc];
  uint64_t v64 = objc_msgSend_timestamp(v4, v60, v61, v62, v63);
  uint64_t v66 = objc_msgSend_initWithBitcoraState_previousState_timestamp_timedelta_(v59, v65, v56, currentState, (uint64_t)v64, v14);

  return v66;
}

- (id)processLighthouseEvent:(id)a3
{
  id v4 = a3;
  id v9 = objc_msgSend_timestamp(v4, v5, v6, v7, v8);
  objc_msgSend_timeIntervalSinceDate_(v9, v10, (uint64_t)self->_currentTime, v11, v12);
  double v14 = v13;

  int64_t currentState = self->_currentState;
  v20 = objc_msgSend_performTaskStatus(v4, v16, v17, v18, v19);

  if (v20)
  {
    v25 = objc_msgSend_performTaskStatus(v4, v21, v22, v23, v24);
    goto LABEL_5;
  }
  int v30 = objc_msgSend_performTrialTaskStatus(v4, v21, v22, v23, v24);

  if (v30)
  {
    v25 = objc_msgSend_performTrialTaskStatus(v4, v31, v32, v33, v34);
LABEL_5:
    BOOL v35 = v25;
    int v36 = objc_msgSend_succeeded(v25, v26, v27, v28, v29);

    if (v36) {
      int64_t v41 = 7;
    }
    else {
      int64_t v41 = 15;
    }
    goto LABEL_8;
  }
  uint64_t v53 = objc_msgSend_stop(v4, v31, v32, v33, v34);

  if (v53)
  {
    uint64_t v54 = objc_msgSend_stop(v4, v37, v38, v39, v40);
    int v59 = objc_msgSend_succeeded(v54, v55, v56, v57, v58);

    if (v59) {
      int64_t v41 = 16;
    }
    else {
      int64_t v41 = 17;
    }
  }
  else
  {
    int64_t v41 = 8;
  }
LABEL_8:
  objc_msgSend_timestamp(v4, v37, v38, v39, v40);
  uint64_t v42 = (NSDate *)objc_claimAutoreleasedReturnValue();
  currentTime = self->_currentTime;
  self->_currentTime = v42;

  self->_int64_t currentState = v41;
  v44 = [LBFBitacoraStateTransition alloc];
  uint64_t v49 = objc_msgSend_timestamp(v4, v45, v46, v47, v48);
  uint64_t v51 = objc_msgSend_initWithBitcoraState_previousState_timestamp_timedelta_(v44, v50, v41, currentState, (uint64_t)v49, v14);

  return v51;
}

- (id)processTrialdEvent:(id)a3
{
  id v4 = a3;
  id v9 = objc_msgSend_timestamp(v4, v5, v6, v7, v8);
  objc_msgSend_timeIntervalSinceDate_(v9, v10, (uint64_t)self->_currentTime, v11, v12);
  double v14 = v13;

  int64_t currentState = self->_currentState;
  if (objc_msgSend_eventType(v4, v16, v17, v18, v19) == 1)
  {
    if (objc_msgSend_eventSucceeded(v4, v20, v21, v22, v23)) {
      int64_t v28 = 1;
    }
    else {
      int64_t v28 = 9;
    }
  }
  else
  {
    if (objc_msgSend_eventType(v4, v20, v21, v22, v23) == 2)
    {
      BOOL v33 = objc_msgSend_eventSucceeded(v4, v29, v30, v31, v32) == 0;
      uint64_t v34 = 10;
      uint64_t v35 = 2;
    }
    else
    {
      if (objc_msgSend_eventType(v4, v29, v30, v31, v32) != 3)
      {
        int64_t v28 = 8 * (objc_msgSend_eventType(v4, v36, v37, v38, v39) != 0);
        goto LABEL_13;
      }
      BOOL v33 = objc_msgSend_eventSucceeded(v4, v36, v37, v38, v39) == 0;
      uint64_t v34 = 11;
      uint64_t v35 = 3;
    }
    if (v33) {
      int64_t v28 = v34;
    }
    else {
      int64_t v28 = v35;
    }
  }
LABEL_13:
  objc_msgSend_timestamp(v4, v24, v25, v26, v27);
  uint64_t v40 = (NSDate *)objc_claimAutoreleasedReturnValue();
  currentTime = self->_currentTime;
  self->_currentTime = v40;

  self->_int64_t currentState = v28;
  uint64_t v42 = [LBFBitacoraStateTransition alloc];
  uint64_t v47 = objc_msgSend_timestamp(v4, v43, v44, v45, v46);
  uint64_t v49 = objc_msgSend_initWithBitcoraState_previousState_timestamp_timedelta_(v42, v48, v28, currentState, (uint64_t)v47, v14);

  return v49;
}

- (id)processDprivacydEvent:(id)a3
{
  id v4 = a3;
  id v9 = objc_msgSend_timestamp(v4, v5, v6, v7, v8);
  objc_msgSend_timeIntervalSinceDate_(v9, v10, (uint64_t)self->_currentTime, v11, v12);
  double v14 = v13;

  int64_t currentState = self->_currentState;
  v20 = objc_msgSend_event(v4, v16, v17, v18, v19);
  int v25 = objc_msgSend_phase(v20, v21, v22, v23, v24);

  switch(v25)
  {
    case 1:
      uint64_t v30 = objc_msgSend_event(v4, v26, v27, v28, v29);
      int v35 = objc_msgSend_succeeded(v30, v31, v32, v33, v34);

      BOOL v36 = v35 == 0;
      uint64_t v37 = 26;
      uint64_t v38 = 21;
      goto LABEL_8;
    case 2:
      uint64_t v40 = objc_msgSend_event(v4, v26, v27, v28, v29);
      int v45 = objc_msgSend_succeeded(v40, v41, v42, v43, v44);

      BOOL v36 = v45 == 0;
      uint64_t v37 = 27;
      uint64_t v38 = 22;
      goto LABEL_8;
    case 3:
      uint64_t v46 = objc_msgSend_event(v4, v26, v27, v28, v29);
      int v51 = objc_msgSend_succeeded(v46, v47, v48, v49, v50);

      BOOL v36 = v51 == 0;
      uint64_t v37 = 28;
      uint64_t v38 = 23;
      goto LABEL_8;
    case 4:
      uint64_t v52 = objc_msgSend_event(v4, v26, v27, v28, v29);
      int v57 = objc_msgSend_succeeded(v52, v53, v54, v55, v56);

      BOOL v36 = v57 == 0;
      uint64_t v37 = 29;
      uint64_t v38 = 24;
      goto LABEL_8;
    case 5:
      uint64_t v58 = objc_msgSend_event(v4, v26, v27, v28, v29);
      int v63 = objc_msgSend_succeeded(v58, v59, v60, v61, v62);

      BOOL v36 = v63 == 0;
      uint64_t v37 = 30;
      uint64_t v38 = 25;
LABEL_8:
      if (v36) {
        int64_t v39 = v37;
      }
      else {
        int64_t v39 = v38;
      }
      break;
    default:
      int64_t v39 = 8;
      break;
  }
  objc_msgSend_timestamp(v4, v26, v27, v28, v29);
  uint64_t v64 = (NSDate *)objc_claimAutoreleasedReturnValue();
  currentTime = self->_currentTime;
  self->_currentTime = v64;

  self->_int64_t currentState = v39;
  uint64_t v66 = [LBFBitacoraStateTransition alloc];
  uint64_t v71 = objc_msgSend_timestamp(v4, v67, v68, v69, v70);
  v73 = objc_msgSend_initWithBitcoraState_previousState_timestamp_timedelta_(v66, v72, v39, currentState, (uint64_t)v71, v14);

  return v73;
}

- (id)validateTransition:(id)a3
{
  id v3 = a3;
  unint64_t v12 = objc_msgSend_state(v3, v4, v5, v6, v7) - 2;
  if (v12 <= 0xE && ((0x403Du >> v12) & 1) != 0)
  {
    double v13 = *(&off_2653ADA80 + v12);
    double v14 = NSNumber;
    uint64_t v15 = objc_msgSend_previousState(v3, v8, v9, v10, v11);
    uint64_t v19 = objc_msgSend_numberWithInteger_(v14, v16, v15, v17, v18);
    LOBYTE(v13) = objc_msgSend_containsObject_(v13, v20, (uint64_t)v19, v21, v22);

    if ((v13 & 1) == 0)
    {
      uint64_t v23 = [LBFBitacoraStateTransition alloc];
      uint64_t v28 = objc_msgSend_previousState(v3, v24, v25, v26, v27);
      uint64_t v33 = objc_msgSend_timestamp(v3, v29, v30, v31, v32);
      objc_msgSend_timedelta(v3, v34, v35, v36, v37);
      uint64_t v39 = objc_msgSend_initWithBitcoraState_previousState_timestamp_timedelta_(v23, v38, 8, v28, (uint64_t)v33);

      id v3 = (id)v39;
    }
  }
  return v3;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (NSDate)currentTime
{
  return self->_currentTime;
}

- (void).cxx_destruct
{
}

@end