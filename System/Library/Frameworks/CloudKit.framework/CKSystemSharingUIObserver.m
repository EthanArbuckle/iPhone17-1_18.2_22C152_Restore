@interface CKSystemSharingUIObserver
+ (void)initialize;
- (CKContainer)container;
- (CKSystemSharingUIObserver)initWithContainer:(CKContainer *)container;
- (OS_dispatch_queue)callbackQueue;
- (void)_locked_handleSharingUIUpdatedShare:(id)a3 recordID:(id)a4 isDeleted:(BOOL)a5 error:(id)a6;
- (void)handleSharingUIUpdatedShare:(id)a3 recordID:(id)a4 isDeleted:(BOOL)a5 error:(id)a6;
- (void)setSystemSharingUIDidSaveShareBlock:(void *)systemSharingUIDidSaveShareBlock;
- (void)setSystemSharingUIDidStopSharingBlock:(void *)systemSharingUIDidStopSharingBlock;
- (void)systemSharingUIDidSaveShareBlock;
- (void)systemSharingUIDidStopSharingBlock;
@end

@implementation CKSystemSharingUIObserver

+ (void)initialize
{
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = self;

  sub_18AF14F44(v3, v2, 0, 0, 0);
}

- (CKSystemSharingUIObserver)initWithContainer:(CKContainer *)container
{
  v5 = container;
  v25.receiver = self;
  v25.super_class = (Class)CKSystemSharingUIObserver;
  id v6 = [(CKSystemSharingUIObserver *)&v25 init];
  if (v6)
  {
    id v7 = [NSString alloc];
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    v12 = objc_msgSend_initWithFormat_(v7, v10, @"com.apple.cloudkit.%@.%p", v11, v9, v6);

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = dispatch_queue_attr_make_initially_inactive(v13);

    v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_UNSPECIFIED, 0);

    v19 = (const char *)objc_msgSend_UTF8String(v12, v16, v17, v18);
    dispatch_queue_t v20 = dispatch_queue_create(v19, v15);
    v21 = (void *)*((void *)v6 + 3);
    *((void *)v6 + 3) = v20;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v6 + 3), "com.apple.cloudkit.systemSharingUIObserver.callbackQueue", (void *)1, 0);
    dispatch_activate(*((dispatch_object_t *)v6 + 3));
    objc_storeStrong((id *)v6 + 4, container);
    objc_msgSend_registerSystemSharingUIObserver_(*((void **)v6 + 4), v22, (uint64_t)v6, v23);
  }
  return (CKSystemSharingUIObserver *)v6;
}

- (void)setSystemSharingUIDidSaveShareBlock:(void *)systemSharingUIDidSaveShareBlock
{
  id v4 = systemSharingUIDidSaveShareBlock;
  if (!dispatch_get_specific("com.apple.cloudkit.systemSharingUIObserver.callbackQueue"))
  {
    v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B1A2354;
    v11[3] = &unk_1E5460058;
    v11[4] = self;
    id v12 = v4;
    dispatch_sync(v10, v11);

    id v9 = v12;
    goto LABEL_5;
  }
  if (self->_systemSharingUIDidSaveShareBlock != v4)
  {
    v8 = objc_msgSend_copy(v4, v5, v6, v7);
    id v9 = self->_systemSharingUIDidSaveShareBlock;
    self->_systemSharingUIDidSaveShareBlock = v8;
LABEL_5:
  }
}

- (void)systemSharingUIDidSaveShareBlock
{
  if (dispatch_get_specific("com.apple.cloudkit.systemSharingUIObserver.callbackQueue"))
  {
    uint64_t v6 = _Block_copy(self->_systemSharingUIDidSaveShareBlock);
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x3032000000;
    v13 = sub_18AF1432C;
    v14 = sub_18AF13A24;
    id v15 = 0;
    uint64_t v7 = objc_msgSend_callbackQueue(self, v3, v4, v5);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_18B1A24F0;
    v9[3] = &unk_1E5460080;
    v9[4] = self;
    v9[5] = &v10;
    dispatch_sync(v7, v9);

    uint64_t v6 = _Block_copy((const void *)v11[5]);
    _Block_object_dispose(&v10, 8);
  }

  return v6;
}

- (void)setSystemSharingUIDidStopSharingBlock:(void *)systemSharingUIDidStopSharingBlock
{
  id v4 = systemSharingUIDidStopSharingBlock;
  if (!dispatch_get_specific("com.apple.cloudkit.systemSharingUIObserver.callbackQueue"))
  {
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B1A2620;
    v11[3] = &unk_1E5460058;
    v11[4] = self;
    id v12 = v4;
    dispatch_sync(v10, v11);

    id v9 = v12;
    goto LABEL_5;
  }
  if (self->_systemSharingUIDidStopSharingBlock != v4)
  {
    v8 = objc_msgSend_copy(v4, v5, v6, v7);
    id v9 = self->_systemSharingUIDidStopSharingBlock;
    self->_systemSharingUIDidStopSharingBlock = v8;
LABEL_5:
  }
}

- (void)systemSharingUIDidStopSharingBlock
{
  if (dispatch_get_specific("com.apple.cloudkit.systemSharingUIObserver.callbackQueue"))
  {
    uint64_t v6 = _Block_copy(self->_systemSharingUIDidStopSharingBlock);
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x3032000000;
    v13 = sub_18AF1432C;
    v14 = sub_18AF13A24;
    id v15 = 0;
    uint64_t v7 = objc_msgSend_callbackQueue(self, v3, v4, v5);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_18B1A27BC;
    v9[3] = &unk_1E5460080;
    v9[4] = self;
    v9[5] = &v10;
    dispatch_sync(v7, v9);

    uint64_t v6 = _Block_copy((const void *)v11[5]);
    _Block_object_dispose(&v10, 8);
  }

  return v6;
}

- (void)handleSharingUIUpdatedShare:(id)a3 recordID:(id)a4 isDeleted:(BOOL)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v16 = objc_msgSend_callbackQueue(self, v13, v14, v15);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_18B1A2910;
  block[3] = &unk_1E54661E0;
  block[4] = self;
  id v21 = v10;
  BOOL v24 = a5;
  id v22 = v11;
  id v23 = v12;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  dispatch_sync(v16, block);
}

- (void)_locked_handleSharingUIUpdatedShare:(id)a3 recordID:(id)a4 isDeleted:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v15 = (__CFString *)a6;
  if (v11)
  {
    v16 = (__CFString *)v11;
  }
  else
  {
    objc_msgSend_recordID(v10, v12, v13, v14);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  id v17 = v16;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v18 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v38 = @"NO";
    int v43 = 138412802;
    v44 = v17;
    if (v7) {
      v38 = @"YES";
    }
    __int16 v45 = 2114;
    v46 = v38;
    __int16 v47 = 2112;
    v48 = v15;
    _os_log_debug_impl(&dword_18AF10000, v18, OS_LOG_TYPE_DEBUG, "Handle sharing UI updated called with share: %@, deleted: %{public}@, error: %@", (uint8_t *)&v43, 0x20u);
  }
  if (!v7)
  {
    uint64_t v28 = objc_msgSend_systemSharingUIDidSaveShareBlock(self, v19, v20, v21);
    if (v28)
    {
      v26 = (void (**)(void, void, void, void))v28;
      v27 = objc_msgSend_CKClientSuitableError(v15, v29, v30, v31);
      ((void (**)(void, __CFString *, id, void *))v26)[2](v26, v17, v10, v27);
      goto LABEL_12;
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v32 = ck_log_facility_ck;
    if (!os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
LABEL_30:
      v26 = 0;
      goto LABEL_31;
    }
    v39 = @" RecordID: ";
    if (!v17) {
      v39 = &stru_1ED7F5C98;
    }
    int v43 = 138544130;
    v44 = v39;
    v40 = @" Error: ";
    if (v17) {
      v41 = v17;
    }
    else {
      v41 = &stru_1ED7F5C98;
    }
    __int16 v45 = 2112;
    v46 = v41;
    if (!v15) {
      v40 = &stru_1ED7F5C98;
    }
    __int16 v47 = 2114;
    v48 = v40;
    if (v15) {
      v42 = v15;
    }
    else {
      v42 = &stru_1ED7F5C98;
    }
    __int16 v49 = 2112;
    v50 = v42;
    v37 = "Sharing UI observer received update but no systemSharingUIDidSaveShareBlock set.%{public}@%@%{public}@%@";
LABEL_46:
    _os_log_debug_impl(&dword_18AF10000, v32, OS_LOG_TYPE_DEBUG, v37, (uint8_t *)&v43, 0x2Au);
    goto LABEL_30;
  }
  uint64_t v22 = objc_msgSend_systemSharingUIDidStopSharingBlock(self, v19, v20, v21);
  if (!v22)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v32 = ck_log_facility_ck;
    if (!os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_30;
    }
    v33 = @" RecordID: ";
    if (!v17) {
      v33 = &stru_1ED7F5C98;
    }
    int v43 = 138544130;
    v44 = v33;
    v34 = @" Error: ";
    if (v17) {
      v35 = v17;
    }
    else {
      v35 = &stru_1ED7F5C98;
    }
    __int16 v45 = 2112;
    v46 = v35;
    if (!v15) {
      v34 = &stru_1ED7F5C98;
    }
    __int16 v47 = 2114;
    v48 = v34;
    if (v15) {
      v36 = v15;
    }
    else {
      v36 = &stru_1ED7F5C98;
    }
    __int16 v49 = 2112;
    v50 = v36;
    v37 = "Sharing UI observer received delete but no systemSharingUIDidStopSharingBlock set.%{public}@%@%{public}@%@";
    goto LABEL_46;
  }
  v26 = (void (**)(void, void, void, void))v22;
  v27 = objc_msgSend_CKClientSuitableError(v15, v23, v24, v25);
  ((void (*)(void (**)(void, void, void, void), __CFString *, void *))v26[2])(v26, v17, v27);
LABEL_12:

LABEL_31:
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (CKContainer)container
{
  return self->_container;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong(&self->_systemSharingUIDidStopSharingBlock, 0);

  objc_storeStrong(&self->_systemSharingUIDidSaveShareBlock, 0);
}

@end