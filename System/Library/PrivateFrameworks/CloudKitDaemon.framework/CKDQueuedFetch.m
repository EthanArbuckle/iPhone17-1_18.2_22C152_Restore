@interface CKDQueuedFetch
- (BOOL)canBeUsedForOperation:(id)a3;
- (BOOL)canBeUsedForPendingFetch:(id)a3;
- (BOOL)dependentOperationListContainsOperationID:(id)a3;
- (BOOL)dependentOperationListContainsRunningFetch:(id)a3;
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (CKDContainer)container;
- (CKDOperation)initialOperation;
- (CKDQueuedFetch)equivalentRunningFetch;
- (CKDQueuedFetch)init;
- (CKDQueuedFetch)initWithOperation:(id)a3 container:(id)a4 operationQueue:(id)a5;
- (NSDate)lastRequestDate;
- (NSDate)queuedDate;
- (NSMutableDictionary)completionHandlersByItemID;
- (NSMutableDictionary)dependentOperationIDsByItemID;
- (NSMutableDictionary)unitTestOverrides;
- (NSMutableSet)dependentOperationIDs;
- (NSOperationQueue)operationQueue;
- (NSString)runningOperationID;
- (OS_dispatch_queue)callbackQueue;
- (OS_os_activity)osActivity;
- (id)CKPropertiesDescription;
- (id)allItemIDs;
- (id)callbacksForItemWithID:(id)a3;
- (id)completionHandler;
- (id)description;
- (int)numberOfCallbacks;
- (int64_t)highestQOS;
- (int64_t)scope;
- (unint64_t)lastCompletionHandlerCount;
- (void)addCallbackForItemWithID:(id)a3 operation:(id)a4 callback:(id)a5;
- (void)cancelFetchOperation;
- (void)createFetchOperationForItemIDs:(id)a3 operationQueue:(id)a4 operationConfigurationBlock:(id)a5;
- (void)finishFetchOperationWithError:(id)a3;
- (void)performCallbacksForItemWithID:(id)a3 withItem:(id)a4 error:(id)a5;
- (void)removeCallbacksForItemWithID:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setCompletionHandlersByItemID:(id)a3;
- (void)setContainer:(id)a3;
- (void)setDependentOperationIDs:(id)a3;
- (void)setDependentOperationIDsByItemID:(id)a3;
- (void)setEquivalentRunningFetch:(id)a3;
- (void)setHighestQOS:(int64_t)a3;
- (void)setInitialOperation:(id)a3;
- (void)setIsCancelled:(BOOL)a3;
- (void)setIsFinished:(BOOL)a3;
- (void)setLastCompletionHandlerCount:(unint64_t)a3;
- (void)setLastRequestDate:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setOsActivity:(id)a3;
- (void)setRunningOperationID:(id)a3;
- (void)setScope:(int64_t)a3;
- (void)setUnitTestOverrides:(id)a3;
- (void)start;
@end

@implementation CKDQueuedFetch

- (CKDQueuedFetch)init
{
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  id v4 = objc_alloc(MEMORY[0x1E4F1A018]);
  id v6 = (id)objc_msgSend_initWithName_format_(v4, v5, *MEMORY[0x1E4F1C3C8], @"You must call -[%@ initWithOperation:container:operationQueue:]", v3);
  objc_exception_throw(v6);
}

- (CKDQueuedFetch)initWithOperation:(id)a3 container:(id)a4 operationQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v41.receiver = self;
  v41.super_class = (Class)CKDQueuedFetch;
  v12 = [(CKDQueuedFetch *)&v41 init];
  if (v12)
  {
    os_activity_t v13 = _os_activity_create(&dword_1C4CFF000, "daemon/queued-fetch", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    osActivity = v12->_osActivity;
    v12->_osActivity = (OS_os_activity *)v13;

    uint64_t v17 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v15, v16);
    queuedDate = v12->_queuedDate;
    v12->_queuedDate = (NSDate *)v17;

    uint64_t v21 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v19, v20);
    lastRequestDate = v12->_lastRequestDate;
    v12->_lastRequestDate = (NSDate *)v21;

    uint64_t v23 = objc_opt_new();
    completionHandlersByItemID = v12->_completionHandlersByItemID;
    v12->_completionHandlersByItemID = (NSMutableDictionary *)v23;

    uint64_t v25 = objc_opt_new();
    dependentOperationIDs = v12->_dependentOperationIDs;
    v12->_dependentOperationIDs = (NSMutableSet *)v25;

    uint64_t v27 = objc_opt_new();
    dependentOperationIDsByItemID = v12->_dependentOperationIDsByItemID;
    v12->_dependentOperationIDsByItemID = (NSMutableDictionary *)v27;

    objc_storeWeak((id *)&v12->_container, v10);
    objc_storeWeak((id *)&v12->_operationQueue, v11);
    objc_storeStrong((id *)&v12->_initialOperation, a3);
    v12->_scope = 2;
    if (objc_opt_respondsToSelector()) {
      v12->_scope = objc_msgSend_databaseScope(v9, v29, v30);
    }
    if (*MEMORY[0x1E4F1A4E0])
    {
      v33 = objc_msgSend_unitTestOverrides(v9, v29, v30);
      if (v33)
      {
        v34 = objc_msgSend_unitTestOverrides(v9, v31, v32);
        uint64_t v37 = objc_msgSend_mutableCopy(v34, v35, v36);
        unitTestOverrides = v12->_unitTestOverrides;
        v12->_unitTestOverrides = (NSMutableDictionary *)v37;
      }
      else
      {
        uint64_t v39 = objc_opt_new();
        v34 = v12->_unitTestOverrides;
        v12->_unitTestOverrides = (NSMutableDictionary *)v39;
      }
    }
    v12->_highestQOS = objc_msgSend_qualityOfService(v9, v29, v30);
  }

  return v12;
}

- (OS_dispatch_queue)callbackQueue
{
  v2 = self;
  objc_sync_enter(v2);
  p_callbackQueue = (dispatch_queue_t *)&v2->_callbackQueue;
  if (!v2->_callbackQueue)
  {
    id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    objc_msgSend_highestQOS(v2, v5, v6);
    dispatch_qos_class_t v7 = CKQoSClassFromNSQualityOfService();
    v8 = dispatch_queue_attr_make_with_qos_class(v4, v7, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.cloudkit.pcs.queuedFetch.callbackQueue", v8);
    dispatch_queue_t v10 = *p_callbackQueue;
    dispatch_queue_t *p_callbackQueue = v9;

    dispatch_queue_set_specific(*p_callbackQueue, &v2->_callbackQueue, (void *)1, 0);
  }
  objc_sync_exit(v2);

  callbackQueue = v2->_callbackQueue;
  return callbackQueue;
}

- (BOOL)isFinished
{
  uint64_t v6 = 0;
  dispatch_qos_class_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = objc_msgSend_callbackQueue(self, a2, v2);
  ck_call_or_dispatch_sync_if_not_key();

  char v4 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v4;
}

- (void)setIsFinished:(BOOL)a3
{
  uint64_t v3 = objc_msgSend_callbackQueue(self, a2, a3);
  ck_call_or_dispatch_sync_if_not_key();
}

- (BOOL)isCancelled
{
  uint64_t v6 = 0;
  dispatch_qos_class_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = objc_msgSend_callbackQueue(self, a2, v2);
  ck_call_or_dispatch_sync_if_not_key();

  char v4 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v4;
}

- (void)setIsCancelled:(BOOL)a3
{
  uint64_t v3 = objc_msgSend_callbackQueue(self, a2, a3);
  ck_call_or_dispatch_sync_if_not_key();
}

- (int)numberOfCallbacks
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  char v4 = objc_msgSend_completionHandlersByItemID(self, a2, v2);
  objc_sync_enter(v4);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  dispatch_qos_class_t v7 = objc_msgSend_completionHandlersByItemID(self, v5, v6, 0);
  dispatch_queue_t v10 = objc_msgSend_allValues(v7, v8, v9);

  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v19, v23, 16);
  if (v14)
  {
    LODWORD(v15) = 0;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_msgSend_count(*(void **)(*((void *)&v19 + 1) + 8 * i), v12, v13) + (int)v15;
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v12, (uint64_t)&v19, v23, 16);
    }
    while (v14);
  }
  else
  {
    LODWORD(v15) = 0;
  }

  objc_sync_exit(v4);
  return v15;
}

- (void)addCallbackForItemWithID:(id)a3 operation:(id)a4 callback:(id)a5
{
  id v60 = a3;
  id v8 = a4;
  id v9 = a5;
  v12 = objc_msgSend_completionHandlersByItemID(self, v10, v11);
  objc_sync_enter(v12);
  uint64_t v15 = objc_msgSend_completionHandlersByItemID(self, v13, v14);
  uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v15, v16, (uint64_t)v60);

  if (!v17)
  {
    uint64_t v17 = objc_opt_new();
    long long v22 = objc_msgSend_completionHandlersByItemID(self, v20, v21);
    objc_msgSend_setObject_forKeyedSubscript_(v22, v23, (uint64_t)v17, v60);
  }
  uint64_t v24 = objc_msgSend_copy(v9, v18, v19);
  objc_msgSend_addObject_(v17, v25, (uint64_t)v24);

  objc_sync_exit(v12);
  v28 = objc_msgSend_dependentOperationIDsByItemID(self, v26, v27);
  objc_sync_enter(v28);
  v31 = objc_opt_new();
  do
  {
    uint64_t v32 = objc_msgSend_operationID(v8, v29, v30);
    objc_msgSend_addObject_(v31, v33, (uint64_t)v32);

    uint64_t v36 = objc_msgSend_parentOperation(v8, v34, v35);

    id v8 = (id)v36;
  }
  while (v36);
  uint64_t v37 = objc_msgSend_dependentOperationIDsByItemID(self, v29, v30);
  uint64_t v39 = objc_msgSend_objectForKeyedSubscript_(v37, v38, (uint64_t)v60);

  if (!v39)
  {
    uint64_t v39 = objc_opt_new();
    v43 = objc_msgSend_dependentOperationIDsByItemID(self, v41, v42);
    objc_msgSend_setObject_forKeyedSubscript_(v43, v44, (uint64_t)v39, v60);
  }
  objc_msgSend_addObjectsFromArray_(v39, v40, (uint64_t)v31);
  v47 = objc_msgSend_dependentOperationIDs(self, v45, v46);
  objc_msgSend_addObjectsFromArray_(v47, v48, (uint64_t)v31);

  objc_sync_exit(v28);
  if (*MEMORY[0x1E4F1A4E0])
  {
    v51 = objc_msgSend_unitTestOverrides(self, v49, v50);
    objc_sync_enter(v51);
    v54 = objc_msgSend_unitTestOverrides(self, v52, v53);
    uint64_t v57 = objc_msgSend_unitTestOverrides(0, v55, v56);
    v59 = (void *)v57;
    if (v57) {
      objc_msgSend_addEntriesFromDictionary_(v54, v58, v57);
    }
    else {
      objc_msgSend_addEntriesFromDictionary_(v54, v58, MEMORY[0x1E4F1CC08]);
    }

    objc_sync_exit(v51);
  }
}

- (void)removeCallbacksForItemWithID:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    dispatch_qos_class_t v7 = objc_msgSend_completionHandlersByItemID(self, v4, v5);
    objc_sync_enter(v7);
    dispatch_queue_t v10 = objc_msgSend_completionHandlersByItemID(self, v8, v9);
    objc_msgSend_removeObjectForKey_(v10, v11, (uint64_t)v6);

    objc_sync_exit(v7);
    uint64_t v14 = objc_msgSend_dependentOperationIDsByItemID(self, v12, v13);
    objc_sync_enter(v14);
    uint64_t v17 = objc_msgSend_dependentOperationIDsByItemID(self, v15, v16);
    uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v17, v18, (uint64_t)v6);

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v20 = v19;
    uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v34, v38, 16);
    if (v24)
    {
      uint64_t v25 = *(void *)v35;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v35 != v25) {
            objc_enumerationMutation(v20);
          }
          uint64_t v27 = *(void *)(*((void *)&v34 + 1) + 8 * v26);
          v28 = objc_msgSend_dependentOperationIDs(self, v22, v23, (void)v34);
          objc_msgSend_removeObject_(v28, v29, v27);

          ++v26;
        }
        while (v24 != v26);
        uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v34, v38, 16);
      }
      while (v24);
    }

    uint64_t v32 = objc_msgSend_dependentOperationIDsByItemID(self, v30, v31);
    objc_msgSend_removeObjectForKey_(v32, v33, (uint64_t)v6);

    objc_sync_exit(v14);
  }
}

- (id)callbacksForItemWithID:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    dispatch_qos_class_t v7 = objc_msgSend_completionHandlersByItemID(self, v4, v5);
    objc_sync_enter(v7);
    dispatch_queue_t v10 = objc_msgSend_completionHandlersByItemID(self, v8, v9);
    v12 = objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)v6);
    uint64_t v15 = objc_msgSend_copy(v12, v13, v14);

    objc_sync_exit(v7);
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)allItemIDs
{
  char v4 = objc_msgSend_completionHandlersByItemID(self, a2, v2);
  objc_sync_enter(v4);
  dispatch_qos_class_t v7 = objc_msgSend_completionHandlersByItemID(self, v5, v6);
  dispatch_queue_t v10 = objc_msgSend_allKeys(v7, v8, v9);
  uint64_t v13 = objc_msgSend_copy(v10, v11, v12);

  objc_sync_exit(v4);
  return v13;
}

- (void)performCallbacksForItemWithID:(id)a3 withItem:(id)a4 error:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)*MEMORY[0x1E4F1A548];
  if (v10)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v11);
    }
    uint64_t v12 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v25 = v8;
      __int16 v26 = 2112;
      id v27 = v10;
      _os_log_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_INFO, "Error fetching item with ID %@: %@", buf, 0x16u);
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v11);
    }
    uint64_t v15 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v25 = v8;
      __int16 v26 = 2112;
      id v27 = v9;
      _os_log_debug_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_DEBUG, "Bulk fetched item with ID %@: %@.", buf, 0x16u);
    }
  }
  uint64_t v16 = objc_msgSend_callbackQueue(self, v13, v14);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1C4DAD1CC;
  v20[3] = &unk_1E64F0DF0;
  v20[4] = self;
  id v21 = v8;
  id v22 = v9;
  id v23 = v10;
  id v17 = v10;
  id v18 = v9;
  id v19 = v8;
  dispatch_async(v16, v20);
}

- (void)finishFetchOperationWithError:(id)a3
{
  id v4 = a3;
  dispatch_qos_class_t v7 = objc_msgSend_callbackQueue(self, v5, v6);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C4DAD3EC;
  v9[3] = &unk_1E64F0948;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

- (void)cancelFetchOperation
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1A280];
  uint64_t v4 = *MEMORY[0x1E4F19C40];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  objc_msgSend_errorWithDomain_code_userInfo_format_(v3, v7, v4, 20, 0, @"%@ %p was cancelled", v6, self);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_finishFetchOperationWithError_(self, v8, (uint64_t)v9);
}

- (id)CKPropertiesDescription
{
  uint64_t v4 = NSString;
  uint64_t v5 = objc_msgSend_queuedDate(self, a2, v2);
  id v8 = objc_msgSend_lastRequestDate(self, v6, v7);
  uint64_t v11 = objc_msgSend_numberOfCallbacks(self, v9, v10);
  uint64_t v14 = objc_msgSend_initialOperation(self, v12, v13);
  id v17 = objc_msgSend_operationInfo(v14, v15, v16);
  id v20 = objc_msgSend_initialOperation(self, v18, v19);
  unsigned int v23 = objc_msgSend_usesBackgroundSession(v20, v21, v22);
  id v25 = objc_msgSend_stringWithFormat_(v4, v24, @"queuedDate=%@, lastRequestDate=%@, numCallbacks=%d, initialOperationInfo=%@, usesBackground=%d", v5, v8, v11, v17, v23);

  return v25;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDQueuedFetch *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (BOOL)canBeUsedForOperation:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_initialOperation(self, v5, v6);
  int isNetworkingBehaviorEquivalentForOperation = objc_msgSend_isNetworkingBehaviorEquivalentForOperation_(v7, v8, (uint64_t)v4);

  BOOL v15 = 0;
  if (isNetworkingBehaviorEquivalentForOperation)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (uint64_t v12 = objc_msgSend_databaseScope(v4, v10, v11), v12 == objc_msgSend_scope(self, v13, v14)))
    {
      BOOL v15 = 1;
    }
  }

  return v15;
}

- (BOOL)canBeUsedForPendingFetch:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_initialOperation(self, v5, v6);
  uint64_t v10 = objc_msgSend_initialOperation(v4, v8, v9);
  int isNetworkingBehaviorEquivalentForOperation = objc_msgSend_isNetworkingBehaviorEquivalentForOperation_(v7, v11, (uint64_t)v10);

  if (isNetworkingBehaviorEquivalentForOperation)
  {
    uint64_t v15 = objc_msgSend_scope(self, v13, v14);
    BOOL v18 = v15 == objc_msgSend_scope(v4, v16, v17);
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)dependentOperationListContainsRunningFetch:(id)a3
{
  id v5 = a3;
  id v8 = objc_msgSend_runningOperationID(v5, v6, v7);

  if (!v8)
  {
    id v21 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v22, (uint64_t)a2, self, @"CKDQueuedFetch.m", 265, @"Expected non-nil runningOperationID on fetch %@", v5);
  }
  uint64_t v11 = objc_msgSend_dependentOperationIDsByItemID(self, v9, v10);
  objc_sync_enter(v11);
  uint64_t v14 = objc_msgSend_dependentOperationIDs(self, v12, v13);
  uint64_t v17 = objc_msgSend_runningOperationID(v5, v15, v16);
  char v19 = objc_msgSend_containsObject_(v14, v18, (uint64_t)v17);

  objc_sync_exit(v11);
  return v19;
}

- (BOOL)dependentOperationListContainsOperationID:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_dependentOperationIDsByItemID(self, v5, v6);
  objc_sync_enter(v7);
  uint64_t v10 = objc_msgSend_dependentOperationIDs(self, v8, v9);
  LOBYTE(self) = objc_msgSend_containsObject_(v10, v11, (uint64_t)v4);

  objc_sync_exit(v7);
  return (char)self;
}

- (void)createFetchOperationForItemIDs:(id)a3 operationQueue:(id)a4 operationConfigurationBlock:(id)a5
{
  objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3, a4, a5);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v7, (uint64_t)a2, self, @"CKDQueuedFetch.m", 281, @"To be overridden by subclass");
}

- (void)start
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v5 = objc_msgSend_osActivity(self, a2, v2);
  os_activity_scope_enter(v5, &state);

  id v8 = objc_msgSend_callbackQueue(self, v6, v7);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C4DADC58;
  v9[3] = &unk_1E64F1998;
  v9[4] = self;
  void v9[5] = a2;
  dispatch_sync(v8, v9);

  os_activity_scope_leave(&state);
}

- (NSDate)queuedDate
{
  return self->_queuedDate;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (CKDQueuedFetch)equivalentRunningFetch
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_equivalentRunningFetch);
  return (CKDQueuedFetch *)WeakRetained;
}

- (void)setEquivalentRunningFetch:(id)a3
{
}

- (OS_os_activity)osActivity
{
  return self->_osActivity;
}

- (void)setOsActivity:(id)a3
{
}

- (NSMutableDictionary)completionHandlersByItemID
{
  return self->_completionHandlersByItemID;
}

- (void)setCompletionHandlersByItemID:(id)a3
{
}

- (unint64_t)lastCompletionHandlerCount
{
  return self->_lastCompletionHandlerCount;
}

- (void)setLastCompletionHandlerCount:(unint64_t)a3
{
  self->_lastCompletionHandlerCount = a3;
}

- (NSDate)lastRequestDate
{
  return self->_lastRequestDate;
}

- (void)setLastRequestDate:(id)a3
{
}

- (CKDContainer)container
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  return (CKDContainer *)WeakRetained;
}

- (void)setContainer:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_operationQueue);
  return (NSOperationQueue *)WeakRetained;
}

- (void)setOperationQueue:(id)a3
{
}

- (int64_t)scope
{
  return self->_scope;
}

- (void)setScope:(int64_t)a3
{
  self->_scope = a3;
}

- (void)setCallbackQueue:(id)a3
{
}

- (int64_t)highestQOS
{
  return self->_highestQOS;
}

- (void)setHighestQOS:(int64_t)a3
{
  self->_highestQOS = a3;
}

- (NSString)runningOperationID
{
  return self->_runningOperationID;
}

- (void)setRunningOperationID:(id)a3
{
}

- (NSMutableSet)dependentOperationIDs
{
  return self->_dependentOperationIDs;
}

- (void)setDependentOperationIDs:(id)a3
{
}

- (NSMutableDictionary)dependentOperationIDsByItemID
{
  return self->_dependentOperationIDsByItemID;
}

- (void)setDependentOperationIDsByItemID:(id)a3
{
}

- (NSMutableDictionary)unitTestOverrides
{
  return self->_unitTestOverrides;
}

- (void)setUnitTestOverrides:(id)a3
{
}

- (CKDOperation)initialOperation
{
  return self->_initialOperation;
}

- (void)setInitialOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialOperation, 0);
  objc_storeStrong((id *)&self->_unitTestOverrides, 0);
  objc_storeStrong((id *)&self->_dependentOperationIDsByItemID, 0);
  objc_storeStrong((id *)&self->_dependentOperationIDs, 0);
  objc_storeStrong((id *)&self->_runningOperationID, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_destroyWeak((id *)&self->_operationQueue);
  objc_destroyWeak((id *)&self->_container);
  objc_storeStrong((id *)&self->_lastRequestDate, 0);
  objc_storeStrong((id *)&self->_completionHandlersByItemID, 0);
  objc_storeStrong((id *)&self->_osActivity, 0);
  objc_destroyWeak((id *)&self->_equivalentRunningFetch);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_queuedDate, 0);
}

@end