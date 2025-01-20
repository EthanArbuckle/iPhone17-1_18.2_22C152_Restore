@interface CKDPlaceholderOperation
- (BOOL)isConcurrent;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (CKDContainer)container;
- (CKDOperation)realOperation;
- (CKDPlaceholderOperation)initWithOperation:(id)a3 targetOperationQueue:(id)a4;
- (NSDate)startDate;
- (NSOperationQueue)targetOperationQueue;
- (NSString)operationID;
- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5;
- (id)_startDateString;
- (id)ckShortDescription;
- (id)description;
- (id)statusReportWithIndent:(unint64_t)a3;
- (void)cancel;
- (void)main;
- (void)start;
- (void)transitionToExecuting;
- (void)transitionToFinished;
@end

@implementation CKDPlaceholderOperation

- (CKDPlaceholderOperation)initWithOperation:(id)a3 targetOperationQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CKDPlaceholderOperation;
  v9 = [(CKDPlaceholderOperation *)&v23 init];
  if (v9)
  {
    v10 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    startDate = v9->_startDate;
    v9->_startDate = v10;

    v12 = dispatch_group_create();
    dispatch_group_enter(v12);
    objc_storeStrong((id *)&v9->_group, v12);
    v15 = objc_msgSend_completionBlock(v7, v13, v14);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1C4F45C54;
    v20[3] = &unk_1E64F0790;
    v21 = v12;
    id v22 = v15;
    v16 = v12;
    id v17 = v15;
    objc_msgSend_setCompletionBlock_(v7, v18, (uint64_t)v20);
    objc_storeStrong((id *)&v9->_realOperation, a3);
    objc_storeStrong((id *)&v9->_targetOperationQueue, a4);
  }
  return v9;
}

- (CKDContainer)container
{
  v3 = objc_msgSend_realOperation(self, a2, v2);
  v6 = objc_msgSend_container(v3, v4, v5);

  return (CKDContainer *)v6;
}

- (NSString)operationID
{
  v3 = objc_msgSend_realOperation(self, a2, v2);
  v6 = objc_msgSend_operationID(v3, v4, v5);

  return (NSString *)v6;
}

- (void)start
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v3 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    v16 = v3;
    v19 = objc_msgSend_ckShortDescription(self, v17, v18);
    *(_DWORD *)buf = 138543362;
    v21 = v19;
    _os_log_debug_impl(&dword_1C4CFF000, v16, OS_LOG_TYPE_DEBUG, "Placeholder op %{public}@ starting", buf, 0xCu);
  }
  if ((objc_msgSend_isExecuting(self, v4, v5) & 1) != 0 || objc_msgSend_isFinished(self, v6, v7))
  {
    id v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    v10 = objc_msgSend_operationID(self, v6, v7);
    objc_msgSend_raise_format_(v8, v11, v9, @"You can't restart an executing or finished CKDPlaceholderOperation: %@", v10);
  }
  uint64_t v12 = objc_msgSend_transitionToExecuting(self, v6, v7);
  v13 = (void *)MEMORY[0x1C8789E70](v12);
  objc_msgSend_main(self, v14, v15);
}

- (void)main
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  int isCancelled = objc_msgSend_isCancelled(self, a2, v2);
  char v7 = isCancelled;
  id v8 = (void *)MEMORY[0x1E4F1A550];
  uint64_t v9 = (os_log_t *)MEMORY[0x1E4F1A500];
  if (isCancelled)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v10 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
    {
      v65 = v10;
      v68 = objc_msgSend_ckShortDescription(self, v66, v67);
      *(_DWORD *)buf = 138543362;
      v71 = v68;
      _os_log_debug_impl(&dword_1C4CFF000, v65, OS_LOG_TYPE_DEBUG, "Placeholder op %{public}@ was cancelled - finishing the real operation", buf, 0xCu);
    }
    v13 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v14 = *MEMORY[0x1E4F19DD8];
    uint64_t v15 = objc_msgSend_realOperation(self, v11, v12);
    uint64_t v18 = objc_msgSend_operationID(v15, v16, v17);
    v20 = objc_msgSend_errorWithDomain_code_format_(v13, v19, v14, 1, @"Operation %@ was cancelled", v18);

    objc_super v23 = objc_msgSend_realOperation(self, v21, v22);
    objc_msgSend_finishWithError_(v23, v24, (uint64_t)v20);
  }
  group = self->_group;
  objc_msgSend_qualityOfService(self, v5, v6);
  v26 = CKGetGlobalQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4F462A0;
  block[3] = &unk_1E64F05C8;
  block[4] = self;
  dispatch_group_notify(group, v26, block);

  if ((v7 & 1) == 0)
  {
    v29 = objc_msgSend_targetOperationQueue(self, v27, v28);
    int isSuspended = objc_msgSend_isSuspended(v29, v30, v31);

    if (isSuspended)
    {
      if (*v8 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      os_log_t v33 = *v9;
      if (!os_log_type_enabled(*v9, OS_LOG_TYPE_INFO)) {
        goto LABEL_15;
      }
      v34 = v33;
      v37 = objc_msgSend_ckShortDescription(self, v35, v36);
      v40 = objc_msgSend_targetOperationQueue(self, v38, v39);
      *(_DWORD *)buf = 138543618;
      v71 = v37;
      __int16 v72 = 2112;
      uint64_t v73 = (uint64_t)v40;
      _os_log_impl(&dword_1C4CFF000, v34, OS_LOG_TYPE_INFO, "System is unavailable. Scheduling operation %{public}@ on suspended operation queue %@", buf, 0x16u);
    }
    if (*v8 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
LABEL_15:
    os_log_t v41 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
    {
      v44 = v41;
      v47 = objc_msgSend_operationID(self, v45, v46);
      v50 = objc_msgSend_targetOperationQueue(self, v48, v49);
      uint64_t v53 = objc_msgSend_operationCount(v50, v51, v52);
      v56 = objc_msgSend_targetOperationQueue(self, v54, v55);
      uint64_t v59 = objc_msgSend_maxConcurrentOperationCount(v56, v57, v58);
      *(_DWORD *)buf = 138543874;
      v71 = v47;
      __int16 v72 = 2048;
      uint64_t v73 = v53;
      __int16 v74 = 2048;
      uint64_t v75 = v59;
      _os_log_impl(&dword_1C4CFF000, v44, OS_LOG_TYPE_INFO, "Adding operation %{public}@ to target queue (%lu/%ld in queue)", buf, 0x20u);
    }
    v60 = objc_msgSend_targetOperationQueue(self, v42, v43);
    v63 = objc_msgSend_realOperation(self, v61, v62);
    objc_msgSend_addOperation_(v60, v64, (uint64_t)v63);
  }
}

- (BOOL)isConcurrent
{
  return 1;
}

- (BOOL)isFinished
{
  return MEMORY[0x1F40D63D8](&self->_executionState, a2);
}

- (BOOL)isExecuting
{
  return MEMORY[0x1F40D63D0](&self->_executionState, a2);
}

- (void)transitionToExecuting
{
}

- (void)transitionToFinished
{
}

- (void)cancel
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v3 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = v3;
    uint64_t v12 = objc_msgSend_ckShortDescription(self, v10, v11);
    *(_DWORD *)buf = 138543362;
    uint64_t v15 = v12;
    _os_log_debug_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_DEBUG, "Placeholder op %{public}@ canceling", buf, 0xCu);
  }
  v13.receiver = self;
  v13.super_class = (Class)CKDPlaceholderOperation;
  [(CKDPlaceholderOperation *)&v13 cancel];
  uint64_t v6 = objc_msgSend_realOperation(self, v4, v5);
  objc_msgSend_cancel(v6, v7, v8);
}

- (id)ckShortDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  char v7 = objc_msgSend_operationID(self, v5, v6);
  uint64_t v9 = objc_msgSend_stringWithFormat_(v3, v8, @"<%@ %p:%@>", v4, self, v7);

  return v9;
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  id v9 = objc_alloc(MEMORY[0x1E4F1CA60]);
  objc_super v13 = objc_msgSend_initWithCapacity_(v9, v10, 3);
  if (v7)
  {
    uint64_t v14 = objc_msgSend_realOperation(self, v11, v12);
    uint64_t v16 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v14, v15, 1, v6, v5);
    objc_msgSend_CKAddPropertySafelyForKey_value_(v13, v17, @"realOperation", v16);

    uint64_t v18 = (void *)MEMORY[0x1E4F28ED0];
    v21 = objc_msgSend_startDate(self, v19, v20);
    objc_msgSend_timeIntervalSinceNow(v21, v22, v23);
    v27 = objc_msgSend_numberWithDouble_(v18, v25, v26, -v24);
    v29 = objc_msgSend_CKRoundedToMaximumDecimalPlaces_(v27, v28, 3);
    objc_msgSend_CKAddPropertySafelyForKey_value_(v13, v30, @"runningFor", v29);

    v32 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v31, 3);
    if (objc_msgSend_isExecuting(self, v33, v34)) {
      objc_msgSend_addObject_(v32, v35, @"executing");
    }
    if (objc_msgSend_isFinished(self, v35, v36)) {
      objc_msgSend_addObject_(v32, v37, @"finished");
    }
    if (objc_msgSend_isCancelled(self, v37, v38)) {
      objc_msgSend_addObject_(v32, v39, @"cancelled");
    }
    if (objc_msgSend_count(v32, v39, v40))
    {
      v42 = objc_msgSend_componentsJoinedByString_(v32, v41, @"|");
      objc_msgSend_CKAddPropertySafelyForKey_value_(v13, v43, @"stateFlags", v42);
    }
  }
  return v13;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDPlaceholderOperation *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (id)_startDateString
{
  if (qword_1EBBCDED0 != -1) {
    dispatch_once(&qword_1EBBCDED0, &unk_1F2044370);
  }
  uint64_t v3 = *MEMORY[0x1E4F1A678];
  objc_msgSend_objectForKey_((void *)qword_1EBBCDEC8, a2, *MEMORY[0x1E4F1A678]);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    objc_msgSend_setTimeStyle_(v6, v7, 3);
    objc_msgSend_setDateStyle_(v6, v8, 1);
    objc_msgSend_setObject_forKey_((void *)qword_1EBBCDEC8, v9, (uint64_t)v6, v3);
  }
  os_log_t v10 = objc_msgSend_startDate(self, v4, v5);

  if (v10)
  {
    objc_super v13 = objc_msgSend_startDate(self, v11, v12);
    objc_msgSend_stringFromDate_(v6, v14, (uint64_t)v13);
    uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v15 = @"(unknown)";
  }

  return v15;
}

- (id)statusReportWithIndent:(unint64_t)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v5 = CKTabIndentAtDepth();
  uint64_t v8 = objc_msgSend_realOperation(self, v6, v7);
  id v9 = (objc_class *)objc_opt_class();
  os_log_t v10 = NSStringFromClass(v9);
  objc_super v13 = objc_msgSend_operationID(self, v11, v12);
  uint64_t v15 = objc_msgSend_stringWithFormat_(v4, v14, @"%s<%@(Placeholder) %@ ", v5, v10, v13);

  if (objc_msgSend_isExecuting(self, v16, v17)) {
    uint64_t v20 = @"R";
  }
  else {
    uint64_t v20 = &stru_1F2044F30;
  }
  int isCancelled = objc_msgSend_isCancelled(self, v18, v19);
  uint64_t v23 = @"X";
  if (!isCancelled) {
    uint64_t v23 = &stru_1F2044F30;
  }
  objc_msgSend_appendFormat_(v15, v22, @"(%@%@) ", v20, v23);
  uint64_t v26 = objc_msgSend_startDate(self, v24, v25);
  objc_msgSend_timeIntervalSinceNow(v26, v27, v28);

  v29 = CKDescriptionForTimeInterval();
  v32 = objc_msgSend__startDateString(self, v30, v31);
  objc_msgSend_appendFormat_(v15, v33, @" running for %@ (started %@) ", v29, v32);

  objc_msgSend_appendString_(v15, v34, @">\n");
  return v15;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (CKDOperation)realOperation
{
  return self->_realOperation;
}

- (NSOperationQueue)targetOperationQueue
{
  return self->_targetOperationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetOperationQueue, 0);
  objc_storeStrong((id *)&self->_realOperation, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end