@interface CKSQLiteDatabaseManagerTimer
- (CKSQLiteDatabaseManagerTimer)initWithDatabase:(id)a3;
- (id)nextActivityDate;
- (void)dealloc;
- (void)runActivities;
- (void)scheduleActivityDate:(id)a3;
@end

@implementation CKSQLiteDatabaseManagerTimer

- (CKSQLiteDatabaseManagerTimer)initWithDatabase:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKSQLiteDatabaseManagerTimer;
  v5 = [(CKSQLiteDatabaseManagerTimer *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_db, v4);
    v6->_timerLock._os_unfair_lock_opaque = 0;
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v9 = dispatch_queue_create("CKSQLiteDatabaseManager activityQueue", v8);
    activityQueue = v6->_activityQueue;
    v6->_activityQueue = (OS_dispatch_queue *)v9;
  }
  return v6;
}

- (void)dealloc
{
  activityTimer = self->_activityTimer;
  if (activityTimer) {
    dispatch_source_cancel(activityTimer);
  }
  v4.receiver = self;
  v4.super_class = (Class)CKSQLiteDatabaseManagerTimer;
  [(CKSQLiteDatabaseManagerTimer *)&v4 dealloc];
}

- (void)runActivities
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_activityQueue);
  v3 = (void *)os_transaction_create();
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  objc_super v4 = ck_log_facility_sql;
  if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18AF10000, v4, OS_LOG_TYPE_DEBUG, "CKSQLiteDatabaseManager activity trigger fired", buf, 2u);
  }
  os_unfair_lock_lock(&self->_timerLock);
  v8 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v5, v6, v7);
  nextActivityDate = self->_nextActivityDate;
  self->_nextActivityDate = 0;

  activityTimer = self->_activityTimer;
  self->_activityTimer = 0;

  os_unfair_lock_unlock(&self->_timerLock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_db);
  if (WeakRetained)
  {
    id v17 = 0;
    v13 = objc_msgSend_managerInDatabase_error_(CKSQLiteDatabaseManager, v11, (uint64_t)WeakRetained, (uint64_t)&v17);
    id v16 = v17;
    if (v13) {
      objc_msgSend_runActivities_(v13, v14, (uint64_t)v8, v15);
    }
  }
}

- (void)scheduleActivityDate:(id)a3
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_unfair_lock_lock(&self->_timerLock);
  if (v5)
  {
    nextActivityDate = self->_nextActivityDate;
    if (!nextActivityDate || objc_msgSend_compare_(v5, v6, (uint64_t)nextActivityDate, v7) == -1)
    {
      objc_storeStrong((id *)&self->_nextActivityDate, a3);
      activityTimer = self->_activityTimer;
      if (!activityTimer)
      {
        v13 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_activityQueue);
        v14 = self->_activityTimer;
        self->_activityTimer = v13;

        objc_initWeak(location, self);
        uint64_t v15 = self->_activityTimer;
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = sub_18B126138;
        handler[3] = &unk_1E54610B0;
        objc_copyWeak(&v28, location);
        dispatch_source_set_event_handler(v15, handler);
        objc_destroyWeak(&v28);
        objc_destroyWeak(location);
      }
      objc_msgSend_timeIntervalSinceNow(self->_nextActivityDate, v9, v10, v11);
      int64_t v17 = ((uint64_t)(v16 * 1000000000.0) & ~((uint64_t)(v16 * 1000000000.0) >> 63)) + 1000000;
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v18 = (void *)ck_log_facility_sql;
      if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_DEBUG))
      {
        v25 = v18;
        v26 = CKDescriptionForTimeInterval((double)(unint64_t)v17 / 1000000000.0);
        LODWORD(location[0]) = 138543362;
        *(id *)((char *)location + 4) = v26;
        _os_log_debug_impl(&dword_18AF10000, v25, OS_LOG_TYPE_DEBUG, "CKSQLiteDatabaseManager activity will run in %{public}@", (uint8_t *)location, 0xCu);
      }
      v19 = self->_activityTimer;
      dispatch_time_t v20 = dispatch_time(0, v17);
      dispatch_source_set_timer(v19, v20, 0xFFFFFFFFFFFFFFFFLL, 0);
      if (!activityTimer) {
        dispatch_resume((dispatch_object_t)self->_activityTimer);
      }
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v21 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(location[0]) = 0;
      _os_log_debug_impl(&dword_18AF10000, v21, OS_LOG_TYPE_DEBUG, "CKSQLiteDatabaseManager activity timer cleared", (uint8_t *)location, 2u);
    }
    v22 = self->_activityTimer;
    if (v22)
    {
      dispatch_source_cancel(v22);
      v23 = self->_activityTimer;
      self->_activityTimer = 0;
    }
    v24 = self->_nextActivityDate;
    self->_nextActivityDate = 0;
  }
  os_unfair_lock_unlock(&self->_timerLock);
}

- (id)nextActivityDate
{
  if (!byte_1E912FED0)
  {
    dispatch_queue_t v9 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, @"CKSQLiteDatabaseManager.m", 468, @"Only for unit tests");
  }
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_18AF14038;
  double v16 = sub_18AF13970;
  id v17 = 0;
  activityQueue = self->_activityQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_18B1262BC;
  v11[3] = &unk_1E5464310;
  v11[4] = self;
  v11[5] = &v12;
  dispatch_sync(activityQueue, v11);
  id v6 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityQueue, 0);
  objc_storeStrong((id *)&self->_nextActivityDate, 0);
  objc_storeStrong((id *)&self->_activityTimer, 0);

  objc_destroyWeak((id *)&self->_db);
}

@end