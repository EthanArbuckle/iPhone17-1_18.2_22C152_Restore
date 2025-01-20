@interface CKDAccountNotifier
+ (id)sharedNotifier;
- (BOOL)isWarmingUp;
- (CKDAccountNotifier)init;
- (NSMapTable)notificationHandlers;
- (NSOperationQueue)accountChangeHandlerQueue;
- (id)_accountChangeNotificationOperation:(BOOL)a3;
- (int)accountChangedToken;
- (void)dealloc;
- (void)postAccountChangedNotificationToClients;
- (void)postAccountChangedNotificationWithAccountID:(id)a3 changeType:(int64_t)a4;
- (void)registerObserver:(id)a3 forAccountChangeNotification:(id)a4;
- (void)setAccountChangeHandlerQueue:(id)a3;
- (void)setAccountChangedToken:(int)a3;
- (void)setNotificationHandlers:(id)a3;
- (void)setWarmingUp:(BOOL)a3;
- (void)unregisterObserverForAccountChangeNotification:(id)a3;
@end

@implementation CKDAccountNotifier

- (void)registerObserver:(id)a3 forAccountChangeNotification:(id)a4
{
  id v7 = a3;
  id v10 = a4;
  if (!v7)
  {
    v25 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a2, self, @"CKDAccountNotifier.m", 141, @"Observer cannot be nil");
  }
  objc_msgSend_unregisterObserverForAccountChangeNotification_(self, v8, (uint64_t)v7);
  v13 = objc_msgSend_notificationHandlers(self, v11, v12);
  objc_sync_enter(v13);
  v14 = CKCurrentPersonaID();
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  v29 = sub_1C4EEA6CC;
  v30 = &unk_1E64F55B0;
  id v15 = v14;
  id v31 = v15;
  id v16 = v10;
  id v32 = v16;
  v17 = _Block_copy(&v27);
  v20 = objc_msgSend_notificationHandlers(self, v18, v19, v27, v28, v29, v30);
  v23 = objc_msgSend_copy(v17, v21, v22);
  objc_msgSend_setObject_forKey_(v20, v24, (uint64_t)v23, v7);

  objc_sync_exit(v13);
}

- (void)unregisterObserverForAccountChangeNotification:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v12 = v4;
    id v7 = objc_msgSend_notificationHandlers(self, v5, v6);
    objc_sync_enter(v7);
    id v10 = objc_msgSend_notificationHandlers(self, v8, v9);
    objc_msgSend_removeObjectForKey_(v10, v11, (uint64_t)v12);

    objc_sync_exit(v7);
    id v4 = v12;
  }
}

- (NSMapTable)notificationHandlers
{
  return self->_notificationHandlers;
}

+ (id)sharedNotifier
{
  if (qword_1EBBCDE48 != -1) {
    dispatch_once(&qword_1EBBCDE48, &unk_1F2043E90);
  }
  v2 = (void *)qword_1EBBCDE50;
  return v2;
}

- (CKDAccountNotifier)init
{
  v11.receiver = self;
  v11.super_class = (Class)CKDAccountNotifier;
  id v4 = [(CKDAccountNotifier *)&v11 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_weakToStrongObjectsMapTable(MEMORY[0x1E4F28E10], v2, v3);
    notificationHandlers = v4->_notificationHandlers;
    v4->_notificationHandlers = (NSMapTable *)v5;

    uint64_t v7 = objc_opt_new();
    accountChangeHandlerQueue = v4->_accountChangeHandlerQueue;
    v4->_accountChangeHandlerQueue = (NSOperationQueue *)v7;

    objc_msgSend_setMaxConcurrentOperationCount_(v4->_accountChangeHandlerQueue, v9, 4);
  }
  return v4;
}

- (void)dealloc
{
  id v4 = objc_msgSend_notificationHandlers(self, a2, v2);
  objc_msgSend_removeAllObjects(v4, v5, v6);

  v7.receiver = self;
  v7.super_class = (Class)CKDAccountNotifier;
  [(CKDAccountNotifier *)&v7 dealloc];
}

- (void)postAccountChangedNotificationWithAccountID:(id)a3 changeType:(int64_t)a4
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v68 = a3;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v6 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v6;
    id v10 = CKStringFromAccountChangeType();
    *(_DWORD *)buf = 138412546;
    id v80 = v68;
    __int16 v81 = 2114;
    v82 = v10;
    _os_log_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_INFO, "Account with ID %@ changed with type: %{public}@", buf, 0x16u);
  }
  if (a4)
  {
    uint64_t isWarmingUp = a4 == 5;
    objc_msgSend_setWarmingUp_(self, v7, isWarmingUp);
  }
  else
  {
    uint64_t isWarmingUp = objc_msgSend_isWarmingUp(self, v7, v8);
  }
  v69 = objc_msgSend__accountChangeNotificationOperation_(self, v12, isWarmingUp);
  BOOL v13 = a4 == 3;
  objc_msgSend_notificationHandlers(self, v14, v15);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  id v16 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v19 = objc_msgSend_notificationHandlers(self, v17, v18);
  uint64_t v22 = objc_msgSend_count(v19, v20, v21);
  v24 = objc_msgSend_arrayWithCapacity_(v16, v23, v22);

  uint64_t v27 = objc_msgSend_notificationHandlers(self, v25, v26);
  v30 = objc_msgSend_keyEnumerator(v27, v28, v29);

  for (i = 0; ; i = (void *)v34)
  {
    uint64_t v34 = objc_msgSend_nextObject(v30, v31, v32);

    if (!v34) {
      break;
    }
    v37 = objc_msgSend_notificationHandlers(self, v35, v36);
    v39 = objc_msgSend_objectForKey_(v37, v38, v34);

    v40 = (void *)MEMORY[0x1E4F28B48];
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = sub_1C4EEA2EC;
    v74[3] = &unk_1E64F5540;
    id v41 = v39;
    id v76 = v41;
    id v75 = v68;
    BOOL v77 = v13;
    v43 = objc_msgSend_blockOperationWithBlock_(v40, v42, (uint64_t)v74);
    objc_msgSend_addDependency_(v69, v44, (uint64_t)v43);
    objc_msgSend_addObject_(v24, v45, (uint64_t)v43);
  }
  objc_sync_exit(obj);

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v46 = v24;
  uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v70, v78, 16);
  if (v50)
  {
    uint64_t v51 = *(void *)v71;
    do
    {
      for (uint64_t j = 0; j != v50; ++j)
      {
        if (*(void *)v71 != v51) {
          objc_enumerationMutation(v46);
        }
        uint64_t v53 = *(void *)(*((void *)&v70 + 1) + 8 * j);
        v54 = objc_msgSend_accountChangeHandlerQueue(self, v48, v49);
        objc_msgSend_addOperation_(v54, v55, v53);
      }
      uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v48, (uint64_t)&v70, v78, 16);
    }
    while (v50);
  }

  v58 = objc_msgSend_accountChangeHandlerQueue(self, v56, v57);
  objc_msgSend_addOperation_(v58, v59, (uint64_t)v69);

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v60 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C4CFF000, v60, OS_LOG_TYPE_INFO, "Waiting for all account notification handlers to run", buf, 2u);
  }
  v63 = objc_msgSend_accountChangeHandlerQueue(self, v61, v62);
  objc_msgSend_waitUntilAllOperationsAreFinished(v63, v64, v65);

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v66 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C4CFF000, v66, OS_LOG_TYPE_INFO, "Account notification handlers are complete", buf, 2u);
  }
}

- (void)postAccountChangedNotificationToClients
{
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v3 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v13 = 0;
    _os_log_impl(&dword_1C4CFF000, v3, OS_LOG_TYPE_INFO, "Notifying clients of updated account info", v13, 2u);
  }
  uint64_t isWarmingUp = objc_msgSend_isWarmingUp(self, v4, v5);
  uint64_t v8 = objc_msgSend__accountChangeNotificationOperation_(self, v7, isWarmingUp);
  objc_super v11 = objc_msgSend_accountChangeHandlerQueue(self, v9, v10);
  objc_msgSend_addOperation_(v11, v12, (uint64_t)v8);
}

- (id)_accountChangeNotificationOperation:(BOOL)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1C4EEA49C;
  v5[3] = &unk_1E64F5560;
  BOOL v6 = a3;
  uint64_t v3 = objc_msgSend_blockOperationWithBlock_(MEMORY[0x1E4F28B48], a2, (uint64_t)v5);
  return v3;
}

- (int)accountChangedToken
{
  return self->_accountChangedToken;
}

- (void)setAccountChangedToken:(int)a3
{
  self->_accountChangedToken = a3;
}

- (void)setNotificationHandlers:(id)a3
{
}

- (NSOperationQueue)accountChangeHandlerQueue
{
  return self->_accountChangeHandlerQueue;
}

- (void)setAccountChangeHandlerQueue:(id)a3
{
}

- (BOOL)isWarmingUp
{
  return self->_warmingUp;
}

- (void)setWarmingUp:(BOOL)a3
{
  self->_warmingUp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountChangeHandlerQueue, 0);
  objc_storeStrong((id *)&self->_notificationHandlers, 0);
}

@end