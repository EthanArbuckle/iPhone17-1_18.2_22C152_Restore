@interface CKPlaceholderOperation
- (BOOL)isConcurrent;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5;
- (id)description;
- (void)main;
- (void)start;
@end

@implementation CKPlaceholderOperation

- (void)start
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v3 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v16 = v3;
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    v22 = sub_18B0D673C(self, v19, v20, v21);
    *(_DWORD *)buf = 138543874;
    v24 = v18;
    __int16 v25 = 2048;
    v26 = self;
    __int16 v27 = 2114;
    v28 = v22;
    _os_log_debug_impl(&dword_18AF10000, v16, OS_LOG_TYPE_DEBUG, "Placeholder op <%{public}@: %p; %{public}@> starting",
      buf,
      0x20u);
  }
  if ((objc_msgSend_isExecuting(self, v4, v5, v6) & 1) != 0
    || (uint64_t isFinished = objc_msgSend_isFinished(self, v7, v8, v9), isFinished))
  {
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    if (self) {
      uint64_t isFinished = objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v7, v11, @"You can't restart an executing or finished CKPlaceholderOperation: %@", self->_operationID);
    }
    else {
      uint64_t isFinished = objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v7, v11, @"You can't restart an executing or finished CKPlaceholderOperation: %@", 0);
    }
  }
  if (self) {
    uint64_t isFinished = CKOperationExecutionStateTransitionToExecuting(self, &self->_executionState);
  }
  v12 = (void *)MEMORY[0x18C12ADA0](isFinished);
  objc_msgSend_main(self, v13, v14, v15);
}

- (void)main
{
  (*((void (**)(void))self->_daemonInvokeBlock + 2))();
  id daemonInvokeBlock = self->_daemonInvokeBlock;
  self->_id daemonInvokeBlock = 0;

  group = self->_group;
  uint64_t v8 = objc_msgSend_qualityOfService(self, v5, v6, v7);
  uint64_t v9 = CKGetGlobalQueue(v8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_18B0D6868;
  block[3] = &unk_1E5460350;
  block[4] = self;
  dispatch_group_notify(group, v9, block);
}

- (BOOL)isFinished
{
  LOBYTE(self) = self->_executionState == 2;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB27A118);
  return (char)self;
}

- (BOOL)isExecuting
{
  LOBYTE(self) = self->_executionState == 1;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB27A118);
  return (char)self;
}

- (BOOL)isConcurrent
{
  return 1;
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  BOOL v5 = a3;
  id v7 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v10 = objc_msgSend_initWithCapacity_(v7, v8, 3, v9);
  v12 = v10;
  if (v5)
  {
    if (self) {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v10, v11, @"operationID", (uint64_t)self->_operationID);
    }
    else {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v10, v11, @"operationID", 0);
    }
    v16 = NSNumber;
    if (self) {
      objc_msgSend_timeIntervalSinceNow(self->_startDate, v13, v14, v15);
    }
    else {
      objc_msgSend_timeIntervalSinceNow(0, v13, v14, v15);
    }
    uint64_t v21 = objc_msgSend_numberWithDouble_(v16, v17, v18, v19, -v20);
    v24 = objc_msgSend_CKRoundedToMaximumDecimalPlaces_(v21, v22, 3, v23);
    objc_msgSend_CKAddPropertySafelyForKey_value_(v12, v25, @"runningFor", (uint64_t)v24);

    v28 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v26, 2, v27);
    if (objc_msgSend_isExecuting(self, v29, v30, v31)) {
      objc_msgSend_addObject_(v28, v32, @"executing", v34);
    }
    if (objc_msgSend_isFinished(self, v32, v33, v34)) {
      objc_msgSend_addObject_(v28, v35, @"finished", v37);
    }
    if (objc_msgSend_count(v28, v35, v36, v37))
    {
      v40 = objc_msgSend_componentsJoinedByString_(v28, v38, @"|", v39);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v12, v41, @"stateFlags", (uint64_t)v40);
    }
  }

  return v12;
}

- (id)description
{
  return (id)((uint64_t (*)(CKPlaceholderOperation *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_daemonInvokeBlock, 0);
  objc_storeStrong((id *)&self->_operationID, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_group, 0);
}

@end