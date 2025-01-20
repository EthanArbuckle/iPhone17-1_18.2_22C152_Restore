@interface CKUploadRequestManagerResponseActionThrottler
+ (double)currentTime;
+ (void)sleep:(double)a3;
- (CKUploadRequestManagerResponseActionThrottler)init;
- (NSMutableDictionary)responseActionToMetadata;
- (NSSet)actionsToThrottle;
- (double)maximumThrottleTime;
- (double)minimumRetryTime;
- (double)minimumThrottleTime;
- (double)throttlePeriod;
- (double)throttleTimeForCount:(int64_t)a3 isRetry:(BOOL)a4;
- (int64_t)minimumThrottleCount;
- (unint64_t)totalThrottleCountForAction:(int64_t)a3;
- (void)gateResponseAction:(int64_t)a3 isRetry:(BOOL)a4;
- (void)gateResponseAction:(int64_t)a3 isRetry:(BOOL)a4 currentTime:(double)a5;
- (void)setActionsToThrottle:(id)a3;
- (void)setMaximumThrottleTime:(double)a3;
- (void)setMinimumRetryTime:(double)a3;
- (void)setMinimumThrottleCount:(int64_t)a3;
- (void)setMinimumThrottleTime:(double)a3;
- (void)setResponseActionToMetadata:(id)a3;
- (void)setThrottlePeriod:(double)a3;
@end

@implementation CKUploadRequestManagerResponseActionThrottler

+ (void)sleep:(double)a3
{
}

+ (double)currentTime
{
  return sub_18B060AD4(0);
}

- (CKUploadRequestManagerResponseActionThrottler)init
{
  v9.receiver = self;
  v9.super_class = (Class)CKUploadRequestManagerResponseActionThrottler;
  v5 = [(CKUploadRequestManagerResponseActionThrottler *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v2, v3, v4);
    v7 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = v6;

    *((void *)v5 + 1) = 0x4014000000000000;
    *((void *)v5 + 2) = 15;
    *(_OWORD *)(v5 + 24) = xmmword_18B1F3B80;
    *((void *)v5 + 5) = 0x4014000000000000;
  }
  return (CKUploadRequestManagerResponseActionThrottler *)v5;
}

- (void)gateResponseAction:(int64_t)a3 isRetry:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = objc_opt_class();
  objc_msgSend_currentTime(v7, v8, v9, v10);

  MEMORY[0x1F4181798](self, sel_gateResponseAction_isRetry_currentTime_, a3, v4);
}

- (void)gateResponseAction:(int64_t)a3 isRetry:(BOOL)a4 currentTime:(double)a5
{
  BOOL v6 = a4;
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  v8 = self;
  objc_sync_enter(v8);
  v12 = objc_msgSend_responseActionToMetadata(v8, v9, v10, v11);
  v15 = objc_msgSend_numberWithInteger_(NSNumber, v13, a3, v14);
  v18 = objc_msgSend_objectForKeyedSubscript_(v12, v16, (uint64_t)v15, v17);

  objc_sync_exit(v8);
  if (!v18 || (objc_msgSend_lastRunTime(v18, v19, v20, v21), v22 == -1.0))
  {
    BOOL v25 = 0;
  }
  else
  {
    double v23 = a5 - v22;
    objc_msgSend_throttlePeriod(v8, v19, v20, v21);
    BOOL v25 = v23 < v24;
  }
  v26 = objc_msgSend_actionsToThrottle(v8, v19, v20, v21);
  v29 = objc_msgSend_numberWithInteger_(NSNumber, v27, a3, v28);
  int v32 = v25 & objc_msgSend_containsObject_(v26, v30, (uint64_t)v29, v31);

  BOOL v33 = v32 | v6;
  if (v18) {
    id v34 = v18;
  }
  else {
    id v34 = (id)objc_opt_new();
  }
  v38 = v34;
  if (v33)
  {
    uint64_t v39 = objc_msgSend_repeatCount(v18, v35, v36, v37);
    objc_msgSend_throttleTimeForCount_isRetry_(v8, v40, v39, v6);
    if (v41 > 0.0)
    {
      double v42 = v41;
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v43 = (void *)ck_log_facility_data_repair;
      if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_ERROR))
      {
        v78 = v43;
        v81 = objc_msgSend_nameFromResponseAction_(CKUploadRequestManagerStateMachine, v79, a3, v80);
        int v82 = 138543618;
        v83 = v81;
        __int16 v84 = 2048;
        double v85 = v42;
        _os_log_error_impl(&dword_18AF10000, v78, OS_LOG_TYPE_ERROR, "Action %{public}@ is repeating too much, throttling for %.1f seconds", (uint8_t *)&v82, 0x16u);
      }
      uint64_t v47 = objc_msgSend_totalThrottleCount(v38, v44, v45, v46);
      objc_msgSend_setTotalThrottleCount_(v38, v48, v47 + 1, v49);
      v50 = objc_opt_class();
      objc_msgSend_sleep_(v50, v51, v52, v53, v42);
    }
  }
  v54 = objc_opt_class();
  objc_msgSend_currentTime(v54, v55, v56, v57);
  double v62 = v61;
  if (v33)
  {
    uint64_t v63 = objc_msgSend_repeatCount(v38, v58, v59, v60) + 1;
    objc_msgSend_setRepeatCount_(v38, v64, v63, v65);
  }
  else
  {
    objc_msgSend_setRepeatCount_(v38, v58, 0, v60);
  }
  objc_msgSend_setLastRunTime_(v38, v66, v67, v68, v62);
  v69 = v8;
  objc_sync_enter(v69);
  v73 = objc_msgSend_responseActionToMetadata(v69, v70, v71, v72);
  v76 = objc_msgSend_numberWithInteger_(NSNumber, v74, a3, v75);
  objc_msgSend_setObject_forKeyedSubscript_(v73, v77, (uint64_t)v38, (uint64_t)v76);

  objc_sync_exit(v69);
}

- (double)throttleTimeForCount:(int64_t)a3 isRetry:(BOOL)a4
{
  BOOL v4 = a4;
  int64_t v9 = a3 - objc_msgSend_minimumThrottleCount(self, a2, a3, a4);
  if (v9 < 0)
  {
    double v19 = 0.0;
  }
  else
  {
    objc_msgSend_minimumThrottleTime(self, v6, v7, v8);
    double v11 = v10;
    objc_msgSend_maximumThrottleTime(self, v12, v13, v14);
    double v16 = v15;
    uint64_t v17 = vcvtpd_s64_f64(log2(v15 / v11));
    if (v9 < v17) {
      uint64_t v17 = v9;
    }
    double v18 = v11 * exp2((double)v17);
    if (v18 >= v16) {
      double v19 = v16;
    }
    else {
      double v19 = v18;
    }
  }
  double result = v19;
  if (v4) {
    objc_msgSend_minimumRetryTime(self, v6, v7, v8, v19);
  }
  if (v19 >= result) {
    return v19;
  }
  return result;
}

- (unint64_t)totalThrottleCountForAction:(int64_t)a3
{
  BOOL v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_responseActionToMetadata(v4, v5, v6, v7);
  double v11 = objc_msgSend_numberWithInteger_(NSNumber, v9, a3, v10);
  uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v8, v12, (uint64_t)v11, v13);
  unint64_t v18 = objc_msgSend_totalThrottleCount(v14, v15, v16, v17);

  objc_sync_exit(v4);
  return v18;
}

- (double)throttlePeriod
{
  return self->_throttlePeriod;
}

- (void)setThrottlePeriod:(double)a3
{
  self->_throttlePeriod = a3;
}

- (int64_t)minimumThrottleCount
{
  return self->_minimumThrottleCount;
}

- (void)setMinimumThrottleCount:(int64_t)a3
{
  self->_minimumThrottleCount = a3;
}

- (double)minimumThrottleTime
{
  return self->_minimumThrottleTime;
}

- (void)setMinimumThrottleTime:(double)a3
{
  self->_minimumThrottleTime = a3;
}

- (double)maximumThrottleTime
{
  return self->_maximumThrottleTime;
}

- (void)setMaximumThrottleTime:(double)a3
{
  self->_maximumThrottleTime = a3;
}

- (double)minimumRetryTime
{
  return self->_minimumRetryTime;
}

- (void)setMinimumRetryTime:(double)a3
{
  self->_minimumRetryTime = a3;
}

- (NSSet)actionsToThrottle
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setActionsToThrottle:(id)a3
{
}

- (NSMutableDictionary)responseActionToMetadata
{
  return self->_responseActionToMetadata;
}

- (void)setResponseActionToMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseActionToMetadata, 0);

  objc_storeStrong((id *)&self->_actionsToThrottle, 0);
}

@end