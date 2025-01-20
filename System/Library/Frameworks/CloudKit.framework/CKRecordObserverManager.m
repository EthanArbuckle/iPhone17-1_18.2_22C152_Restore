@interface CKRecordObserverManager
+ (CKRecordObserverManager)sharedManager;
- (CKRecordObserverManager)init;
- (void)addRecordObserver:(id)a3 block:(id)a4;
- (void)handleRecordChange:(id)a3 container:(id)a4 completionHandler:(id)a5;
- (void)removeRecordObserver:(id)a3;
@end

@implementation CKRecordObserverManager

+ (CKRecordObserverManager)sharedManager
{
  if (qword_1EB279ED8 != -1) {
    dispatch_once(&qword_1EB279ED8, &unk_1ED7EF518);
  }
  v2 = (void *)qword_1EB279ED0;

  return (CKRecordObserverManager *)v2;
}

- (CKRecordObserverManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)CKRecordObserverManager;
  v2 = [(CKRecordObserverManager *)&v11 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.cloudkit.recordObserver", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v8 = objc_msgSend_weakToStrongObjectsMapTable(MEMORY[0x1E4F28E10], v5, v6, v7);
    recordObservers = v2->_recordObservers;
    v2->_recordObservers = (NSMapTable *)v8;
  }
  return v2;
}

- (void)addRecordObserver:(id)a3 block:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v8 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_18AF10000, v8, OS_LOG_TYPE_DEFAULT, "Adding record observer: %@", (uint8_t *)&v14, 0xCu);
  }
  v9 = self;
  objc_sync_enter(v9);
  if (v9) {
    recordObservers = v9->_recordObservers;
  }
  else {
    recordObservers = 0;
  }
  objc_super v11 = recordObservers;
  v12 = _Block_copy(v7);
  objc_msgSend_setObject_forKey_(v11, v13, (uint64_t)v12, (uint64_t)v6);

  objc_sync_exit(v9);
}

- (void)removeRecordObserver:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v5 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_18AF10000, v5, OS_LOG_TYPE_DEFAULT, "Removing record observer: %@", (uint8_t *)&v11, 0xCu);
  }
  id v6 = self;
  objc_sync_enter(v6);
  if (v6) {
    recordObservers = v6->_recordObservers;
  }
  else {
    recordObservers = 0;
  }
  uint64_t v8 = recordObservers;
  objc_msgSend_removeObjectForKey_(v8, v9, (uint64_t)v4, v10);

  objc_sync_exit(v6);
}

- (void)handleRecordChange:(id)a3 container:(id)a4 completionHandler:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v27 = a4;
  id v28 = a5;
  if (v8)
  {
    v9 = self;
    objc_sync_enter(v9);
    if (v9) {
      recordObservers = v9->_recordObservers;
    }
    else {
      recordObservers = 0;
    }
    int v11 = recordObservers;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = sub_18B147F50;
    v40[3] = &unk_1E5465238;
    id v41 = v27;
    id v12 = v8;
    id v42 = v12;
    id v15 = objc_msgSend_CKFlatMap_(v11, v13, (uint64_t)v40, v14);

    objc_sync_exit(v9);
    uint64_t v16 = dispatch_group_create();
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = v15;
    uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v36, (uint64_t)v44, 16);
    if (v18)
    {
      uint64_t v19 = *(void *)v37;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v37 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void *)(*((void *)&v36 + 1) + 8 * v20);
          dispatch_group_enter(v16);
          if (v9) {
            queue = v9->_queue;
          }
          else {
            queue = 0;
          }
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = sub_18B1481B4;
          block[3] = &unk_1E5461A70;
          id v33 = v12;
          uint64_t v35 = v21;
          v34 = v16;
          dispatch_async(queue, block);

          ++v20;
        }
        while (v18 != v20);
        uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v36, (uint64_t)v44, 16);
        uint64_t v18 = v24;
      }
      while (v24);
    }

    if (v28)
    {
      if (v9) {
        v9 = (CKRecordObserverManager *)v9->_queue;
      }
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = sub_18B1482A8;
      v30[3] = &unk_1E5462200;
      id v31 = v28;
      dispatch_group_notify(v16, &v9->super, v30);
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v25 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18AF10000, v25, OS_LOG_TYPE_INFO, "Received a nil recordChange", buf, 2u);
    }
    if (v28) {
      (*((void (**)(id, uint64_t))v28 + 2))(v28, v26);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordObservers, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end