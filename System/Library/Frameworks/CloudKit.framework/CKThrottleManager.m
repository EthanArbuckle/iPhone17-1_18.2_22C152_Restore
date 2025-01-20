@interface CKThrottleManager
+ (id)sharedManager;
- (BOOL)addThrottle:(id)a3;
- (id)CKStatusReportArray;
- (id)allThrottles;
- (id)enforcedThrottleForCriteria:(id)a3 willSendRequest:(BOOL)a4 outThrottleError:(id *)a5;
- (id)initInternal;
- (void)resetThrottles;
- (void)setThrottleObserver:(id)a3;
@end

@implementation CKThrottleManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_18B0FEE3C;
  block[3] = &unk_1E545FFA8;
  block[4] = a1;
  if (qword_1EB279CC8 != -1) {
    dispatch_once(&qword_1EB279CC8, block);
  }
  v2 = (void *)qword_1EB279CC0;

  return v2;
}

- (id)initInternal
{
  v5.receiver = self;
  v5.super_class = (Class)CKThrottleManager;
  v2 = [(CKThrottleManager *)&v5 init];
  v3 = v2;
  if (v2) {
    pthread_mutex_init(&v2->_throttleLock, 0);
  }
  return v3;
}

- (void)setThrottleObserver:(id)a3
{
  p_throttleLock = &self->_throttleLock;
  id v5 = a3;
  pthread_mutex_lock(p_throttleLock);
  objc_storeWeak((id *)&self->_observer, v5);

  pthread_mutex_unlock(p_throttleLock);
}

- (void)resetThrottles
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  p_throttleLock = &self->_throttleLock;
  pthread_mutex_lock(&self->_throttleLock);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v4 = self->_throttleList;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v20, (uint64_t)v24, 16);
  if (v6)
  {
    uint64_t v9 = v6;
    uint64_t v10 = *(void *)v21;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend_throttleWillBeRemoved_(self, v7, *(void *)(*((void *)&v20 + 1) + 8 * v11++), v8, (void)v20);
      }
      while (v9 != v11);
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v20, (uint64_t)v24, 16);
    }
    while (v9);
  }

  throttleList = self->_throttleList;
  self->_throttleList = 0;

  objc_msgSend_throttleListBecameEmpty(self, v13, v14, v15);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  pthread_mutex_unlock(p_throttleLock);
  objc_msgSend_throttlesWereReset(WeakRetained, v17, v18, v19);
}

- (BOOL)addThrottle:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char isExpired = objc_msgSend_isExpired(v4, v5, v6, v7);
  p_throttleLock = &self->_throttleLock;
  pthread_mutex_lock(&self->_throttleLock);
  uint64_t v13 = objc_msgSend_label(v4, v10, v11, v12);
  uint64_t v19 = objc_msgSend_throttleID(v4, v14, v15, v16);
  if (!(v13 | v19))
  {
    uint64_t v25 = 0;
    BOOL v37 = 0;
    if (isExpired) {
      goto LABEL_26;
    }
    goto LABEL_22;
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v20 = self->_throttleList;
  uint64_t v25 = (__CFString *)objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v58, (uint64_t)v72, 16);
  if (v25)
  {
    char v56 = isExpired;
    id v57 = v4;
    uint64_t v26 = *(void *)v59;
LABEL_4:
    uint64_t v27 = 0;
    while (1)
    {
      if (*(void *)v59 != v26) {
        objc_enumerationMutation(v20);
      }
      v28 = *(void **)(*((void *)&v58 + 1) + 8 * v27);
      if (v13)
      {
        v29 = objc_msgSend_label(*(void **)(*((void *)&v58 + 1) + 8 * v27), v22, v23, v24);
        char isEqualToString = objc_msgSend_isEqualToString_(v29, v30, v13, v31);

        if (isEqualToString) {
          break;
        }
      }
      v33 = objc_msgSend_throttleID(v28, v22, v23, v24);
      char isEqual = objc_msgSend_isEqual_(v33, v34, v19, v35);

      if (isEqual) {
        break;
      }
      if (v25 == (__CFString *)++v27)
      {
        uint64_t v25 = (__CFString *)objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v58, (uint64_t)v72, 16);
        if (v25) {
          goto LABEL_4;
        }
        BOOL v37 = 0;
        goto LABEL_17;
      }
    }
    uint64_t v25 = v28;

    if (v25)
    {
      v71 = v25;
      BOOL v37 = 1;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v17, (uint64_t)&v71, 1);
      long long v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
      sub_18B0FF404((void **)&self->super.isa, v20);
LABEL_17:
      p_throttleLock = &self->_throttleLock;
      id v4 = v57;
      char isExpired = v56;
      goto LABEL_19;
    }
    BOOL v37 = 0;
    p_throttleLock = &self->_throttleLock;
    id v4 = v57;
    if ((v56 & 1) == 0) {
      goto LABEL_22;
    }
  }
  else
  {
    BOOL v37 = 0;
LABEL_19:

    if ((isExpired & 1) == 0)
    {
LABEL_22:
      throttleList = self->_throttleList;
      if (throttleList)
      {
        objc_msgSend_arrayByAddingObject_(throttleList, v17, (uint64_t)v4, v18);
      }
      else
      {
        id v70 = v4;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v17, (uint64_t)&v70, 1);
      }
      v39 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v40 = self->_throttleList;
      self->_throttleList = v39;
    }
  }
LABEL_26:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  objc_msgSend_throttleWasAdded_(self, v42, (uint64_t)v4, v43);
  objc_msgSend_throttleID(v4, v44, v45, v46);
  v47 = (__CFString *)objc_claimAutoreleasedReturnValue();

  pthread_mutex_unlock(p_throttleLock);
  objc_msgSend_throttleWasAdded(WeakRetained, v48, v49, v50);
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v51 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    v52 = @"<throttleID unset>";
    if (v47) {
      v52 = v47;
    }
    v53 = @"\nreplaces: ";
    *(_DWORD *)buf = 138544130;
    v63 = v52;
    v54 = &stru_1ED7F5C98;
    __int16 v64 = 2114;
    id v65 = v4;
    if (!v25) {
      v53 = &stru_1ED7F5C98;
    }
    __int16 v66 = 2114;
    if (v25) {
      v54 = v25;
    }
    v67 = v53;
    __int16 v68 = 2114;
    v69 = v54;
    _os_log_impl(&dword_18AF10000, v51, OS_LOG_TYPE_INFO, "new throttle: %{public}@ = %{public}@%{public}@%{public}@", buf, 0x2Au);
  }

  return v37;
}

- (id)allThrottles
{
  p_throttleLock = &self->_throttleLock;
  pthread_mutex_lock(&self->_throttleLock);
  id v4 = self->_throttleList;
  pthread_mutex_unlock(p_throttleLock);
  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v6 = v5;

  return v6;
}

- (id)CKStatusReportArray
{
  p_throttleLock = &self->_throttleLock;
  pthread_mutex_lock(&self->_throttleLock);
  uint64_t v6 = objc_msgSend_CKMap_(self->_throttleList, v4, (uint64_t)&unk_1ED7EF378, v5);
  pthread_mutex_unlock(p_throttleLock);

  return v6;
}

- (id)enforcedThrottleForCriteria:(id)a3 willSendRequest:(BOOL)a4 outThrottleError:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  p_throttleLock = &self->_throttleLock;
  pthread_mutex_lock(&self->_throttleLock);
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  uint64_t v10 = self->_throttleList;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v97, (uint64_t)v110, 16);
  if (!v15)
  {

    v17 = 0;
    uint64_t v16 = 0;
    if (!v6) {
      goto LABEL_46;
    }
    goto LABEL_36;
  }
  BOOL v91 = v6;
  v90 = a5;
  v92 = 0;
  uint64_t v16 = 0;
  v17 = 0;
  uint64_t v18 = *(void *)v98;
  double v19 = 0.0;
  do
  {
    for (i = 0; i != v15; i = (char *)i + 1)
    {
      if (*(void *)v98 != v18) {
        objc_enumerationMutation(v10);
      }
      long long v21 = *(void **)(*((void *)&v97 + 1) + 8 * i);
      if (objc_msgSend_isExpired(v21, v12, v13, v14))
      {
        if (!v17)
        {
          id v24 = objc_alloc(MEMORY[0x1E4F1CA48]);
          uint64_t v28 = objc_msgSend_count(self->_throttleList, v25, v26, v27);
          v17 = objc_msgSend_initWithCapacity_(v24, v29, v28, v30);
        }
        objc_msgSend_addObject_(v17, v22, (uint64_t)v21, v23);
      }
      else if (objc_msgSend_appliesToCriteria_(v21, v22, (uint64_t)v8, v23))
      {
        if (!v16)
        {
          uint64_t v31 = objc_msgSend_count(self->_throttleList, v12, v13, v14);
          id v32 = objc_alloc(MEMORY[0x1E4F1CA48]);
          uint64_t v16 = objc_msgSend_initWithCapacity_(v32, v33, v31, v34);
        }
        objc_msgSend_addObject_(v16, v12, (uint64_t)v21, v14);
        objc_msgSend_delayUntilNextOperationAllowed(v21, v35, v36, v37);
        if (v38 > v19)
        {
          double v39 = v38;
          id v40 = v21;

          v92 = v40;
          double v19 = v39;
        }
      }
    }
    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v12, (uint64_t)&v97, (uint64_t)v110, 16);
  }
  while (v15);

  if (v19 <= 0.0)
  {
    p_throttleLock = &self->_throttleLock;
    uint64_t v15 = v92;
    if (!v91) {
      goto LABEL_46;
    }
LABEL_36:
    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    id v58 = v16;
    uint64_t v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v76, (uint64_t)&v93, (uint64_t)v101, 16);
    if (v77)
    {
      uint64_t v81 = v77;
      v82 = p_throttleLock;
      uint64_t v83 = *(void *)v94;
      do
      {
        for (uint64_t j = 0; j != v81; ++j)
        {
          if (*(void *)v94 != v83) {
            objc_enumerationMutation(v58);
          }
          v85 = *(void **)(*((void *)&v93 + 1) + 8 * j);
          objc_msgSend_incrementSentRequestCount(v85, v78, v79, v80);
          objc_msgSend_noteDataChangeForThrottle_(self, v86, (uint64_t)v85, v87);
        }
        uint64_t v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v78, (uint64_t)&v93, (uint64_t)v101, 16);
      }
      while (v81);
      uint64_t v16 = v58;
      p_throttleLock = v82;
    }
    else
    {
      uint64_t v16 = v58;
    }
    goto LABEL_45;
  }
  p_throttleLock = &self->_throttleLock;
  uint64_t v15 = v92;
  if (v91)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v44 = (void *)ck_log_facility_op;
    if (os_log_type_enabled((os_log_t)ck_log_facility_op, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v45 = v44;
      uint64_t v49 = objc_msgSend_throttleID(v92, v46, v47, v48);
      *(_DWORD *)buf = 138543874;
      v105 = v49;
      __int16 v106 = 2048;
      uint64_t v107 = (uint64_t)v19;
      __int16 v108 = 2112;
      id v109 = v8;
      _os_log_impl(&dword_18AF10000, v45, OS_LOG_TYPE_DEFAULT, "Throttle %{public}@ triggered, allowed in %lds: %@", buf, 0x20u);
    }
  }
  if (v90)
  {
    if (!v16) {
      __assert_rtn("-[CKThrottleManager enforcedThrottleForCriteria:willSendRequest:outThrottleError:]", "CKThrottleManager.m", 248, "applicableThrottles");
    }
    uint64_t v50 = objc_msgSend_errorCode(v92, v41, v42, v43);
    uint64_t v54 = objc_msgSend_integerValue(v50, v51, v52, v53);

    id v57 = @"Operation throttled by server. Retry after %.1f seconds. (Other operations may be allowed.)";
    if (v54 == 2061) {
      id v57 = @"Operation throttled by previous server http 503 reply. Retry after %.1f seconds. (Other operations may be allowed.)";
    }
    if (v54 == 2062) {
      objc_msgSend_stringWithFormat_(NSString, v55, @"Operation throttled by previous server http 429 reply. Retry after %.1f seconds. (Other operations may be allowed.)", v56, *(void *)&v19);
    }
    else {
      objc_msgSend_stringWithFormat_(NSString, v55, (uint64_t)v57, v56, *(void *)&v19);
    }
    id v58 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v62 = objc_msgSend_label(v92, v59, v60, v61);
    v63 = (void *)v62;
    __int16 v64 = @"<nil label>";
    if (v62) {
      __int16 v64 = (__CFString *)v62;
    }
    id v65 = v64;

    v103[0] = v65;
    v102[0] = @"ThrottleLabel";
    v102[1] = @"CKRetryAfter";
    v69 = objc_msgSend_numberWithDouble_(NSNumber, v66, v67, v68, v19);
    v103[1] = v69;
    v103[2] = v58;
    uint64_t v70 = *MEMORY[0x1E4F28568];
    v102[2] = @"CKErrorDescription";
    v102[3] = v70;
    v103[3] = v58;
    v72 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v71, (uint64_t)v103, (uint64_t)v102, 4);

    uint64_t v15 = v92;
    v74 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v73, @"CKInternalErrorDomain", v54, v72);

    id v75 = v74;
    id *v90 = v75;

LABEL_45:
  }
LABEL_46:
  pthread_mutex_unlock(p_throttleLock);
  if (self && v17)
  {
    id v88 = v17;
    pthread_mutex_lock(p_throttleLock);
    sub_18B0FF404((void **)&self->super.isa, v88);

    pthread_mutex_unlock(p_throttleLock);
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);

  objc_storeStrong((id *)&self->_throttleList, 0);
}

@end