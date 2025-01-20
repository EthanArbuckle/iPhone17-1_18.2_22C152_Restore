@interface ABCPeriodicMaintenanceActivity
+ (const)periodicActivityID;
+ (id)sharedInstance;
+ (int64_t)periodicActivityInterval;
+ (void)registerPeriodicActivityWithIdentifier:(id)a3 queue:(id)a4 activity:(id)a5;
- (ABCPeriodicMaintenanceActivity)init;
- (void)_handleActivityRun:(id)a3;
- (void)_registerPeriodicActivityWithIdentifier:(id)a3 queue:(id)a4 activity:(id)a5;
- (void)_registerPeriodicMaintenanceActivity;
- (void)dealloc;
@end

@implementation ABCPeriodicMaintenanceActivity

+ (void)registerPeriodicActivityWithIdentifier:(id)a3 queue:(id)a4 activity:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(id)objc_opt_class() sharedInstance];
  [v10 _registerPeriodicActivityWithIdentifier:v9 queue:v8 activity:v7];
}

+ (int64_t)periodicActivityInterval
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"ABCPeriodicMaintenanceActivity.m", 38, @"Subclasses must provide an impl for %s", "+[ABCPeriodicMaintenanceActivity periodicActivityInterval]");

  return *MEMORY[0x263EF81E8];
}

+ (const)periodicActivityID
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"ABCPeriodicMaintenanceActivity.m", 44, @"Subclasses must provide an impl for %s", "+[ABCPeriodicMaintenanceActivity periodicActivityID]");

  return "";
}

+ (id)sharedInstance
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"ABCPeriodicMaintenanceActivity.m", 50, @"Subclasses must provide an impl for %s", "+[ABCPeriodicMaintenanceActivity sharedInstance]");

  return 0;
}

- (ABCPeriodicMaintenanceActivity)init
{
  v7.receiver = self;
  v7.super_class = (Class)ABCPeriodicMaintenanceActivity;
  v2 = [(ABCPeriodicMaintenanceActivity *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    activities = v2->_activities;
    v2->_activities = v3;

    if (!v2->_activities)
    {
      v5 = 0;
      goto LABEL_6;
    }
    v2->_nextActivityIndex = 0;
    [(ABCPeriodicMaintenanceActivity *)v2 _registerPeriodicMaintenanceActivity];
  }
  v5 = v2;
LABEL_6:

  return v5;
}

- (void)dealloc
{
  v3 = (const char *)[(id)objc_opt_class() periodicActivityID];
  xpc_activity_unregister(v3);
  v4.receiver = self;
  v4.super_class = (Class)ABCPeriodicMaintenanceActivity;
  [(ABCPeriodicMaintenanceActivity *)&v4 dealloc];
}

- (void)_registerPeriodicMaintenanceActivity
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  objc_super v4 = v3;
  if (v3)
  {
    xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8288]);
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x263EF82A0], 1);
    v5 = (const char *)*MEMORY[0x263EF81D8];
    int64_t v6 = [(id)objc_opt_class() periodicActivityInterval];
    xpc_dictionary_set_int64(v4, v5, v6);
    objc_super v7 = (const char *)[(id)objc_opt_class() periodicActivityID];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __70__ABCPeriodicMaintenanceActivity__registerPeriodicMaintenanceActivity__block_invoke;
    handler[3] = &unk_263FC43C8;
    handler[4] = self;
    xpc_activity_register(v7, v4, handler);
  }
  else
  {
    id v8 = symptomsLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138543618;
      v13 = v10;
      __int16 v14 = 2080;
      uint64_t v15 = [(id)objc_opt_class() periodicActivityID];
      _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to create xpc_activity criteria for %s", buf, 0x16u);
    }
  }
}

void __70__ABCPeriodicMaintenanceActivity__registerPeriodicMaintenanceActivity__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  xpc_object_t v3 = a2;
  if (xpc_activity_get_state(v3) == 2)
  {
    [*(id *)(a1 + 32) _handleActivityRun:v3];
  }
  else
  {
    objc_super v4 = symptomsLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      int64_t v6 = NSStringFromClass(v5);
      int v7 = 138543618;
      id v8 = v6;
      __int16 v9 = 2048;
      xpc_activity_state_t state = xpc_activity_get_state(v3);
      _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unexpected xpc_activity state %lld, ignoring...", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)_handleActivityRun:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  objc_super v4 = (_xpc_activity_s *)a3;
  obj = self->_activities;
  objc_sync_enter(obj);
  unint64_t nextActivityIndex = self->_nextActivityIndex;
  unint64_t v6 = [(NSMutableArray *)self->_activities count];
  unint64_t v7 = v6;
  if (nextActivityIndex >= v6)
  {
LABEL_13:
    objc_sync_exit(obj);

    v21 = symptomsLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v22);
      *(_DWORD *)buf = 138543362;
      id v35 = v23;
      _os_log_impl(&dword_209DBA000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completed running periodic activity xpc_activity", buf, 0xCu);
    }
    if (!xpc_activity_set_state(v4, 5))
    {
      v24 = symptomsLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = (objc_class *)objc_opt_class();
        v26 = NSStringFromClass(v25);
        *(_DWORD *)buf = 138543362;
        id v35 = v26;
        _os_log_impl(&dword_209DBA000, v24, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to set periodic activity xpc_activity state to DONE!", buf, 0xCu);
      }
    }
    self->_unint64_t nextActivityIndex = 0;
  }
  else
  {
    unint64_t v8 = v6 - 1;
    while (1)
    {
      __int16 v9 = symptomsLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        id v10 = (objc_class *)objc_opt_class();
        uint64_t v11 = NSStringFromClass(v10);
        *(_DWORD *)buf = 138543618;
        id v35 = v11;
        __int16 v36 = 2048;
        unint64_t v37 = nextActivityIndex;
        _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_DEBUG, "[%{public}@] Preparing to run periodic activity index %ld", buf, 0x16u);
      }
      v12 = [(NSMutableArray *)self->_activities objectAtIndexedSubscript:nextActivityIndex];
      v13 = symptomsLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        id v15 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v16 = [v12 activityIdentifier];
        *(_DWORD *)buf = 138543618;
        id v35 = v15;
        __int16 v36 = 2112;
        unint64_t v37 = (unint64_t)v16;
        _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ready to run periodic activity %@", buf, 0x16u);
      }
      v17 = [v12 activityQueue];
      v18 = [v12 activityBlock];
      dispatch_async(v17, v18);

      unint64_t v19 = nextActivityIndex + 1;
      unint64_t v20 = v8 == nextActivityIndex ? 0 : nextActivityIndex + 1;
      self->_unint64_t nextActivityIndex = v20;
      if (v19 < v7 && xpc_activity_should_defer(v4)) {
        break;
      }

      ++nextActivityIndex;
      if (v7 == v19) {
        goto LABEL_13;
      }
    }
    v27 = symptomsLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = (objc_class *)objc_opt_class();
      v29 = NSStringFromClass(v28);
      *(_DWORD *)buf = 138543362;
      id v35 = v29;
      _os_log_impl(&dword_209DBA000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deferring periodic activity xpc_activity", buf, 0xCu);
    }
    if (!xpc_activity_set_state(v4, 3))
    {
      v30 = symptomsLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = (objc_class *)objc_opt_class();
        v32 = NSStringFromClass(v31);
        *(_DWORD *)buf = 138543362;
        id v35 = v32;
        _os_log_impl(&dword_209DBA000, v30, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to set periodic activity xpc_activity state to DEFER!", buf, 0xCu);
      }
    }

    objc_sync_exit(obj);
  }
}

- (void)_registerPeriodicActivityWithIdentifier:(id)a3 queue:(id)a4 activity:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v9 && v10 && [v8 length])
  {
    v12 = self->_activities;
    objc_sync_enter(v12);
    v13 = symptomsLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v8;
      _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_INFO, "[%{public}@] Registering periodic activity %@", buf, 0x16u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v33 = 1;
    activities = self->_activities;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __89__ABCPeriodicMaintenanceActivity__registerPeriodicActivityWithIdentifier_queue_activity___block_invoke;
    v24[3] = &unk_263FC4470;
    id v17 = v8;
    id v25 = v17;
    v26 = self;
    v27 = buf;
    [(NSMutableArray *)activities enumerateObjectsUsingBlock:v24];
    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      v18 = objc_alloc_init(ABCMaintenanceActivity);
      [(ABCMaintenanceActivity *)v18 setActivityBlock:v11];
      [(ABCMaintenanceActivity *)v18 setActivityQueue:v9];
      [(ABCMaintenanceActivity *)v18 setActivityIdentifier:v17];
      [(NSMutableArray *)self->_activities addObject:v18];
      unint64_t v19 = symptomsLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v20 = (objc_class *)objc_opt_class();
        v21 = NSStringFromClass(v20);
        *(_DWORD *)v28 = 138543618;
        v29 = v21;
        __int16 v30 = 2112;
        id v31 = v17;
        _os_log_impl(&dword_209DBA000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Registered periodic activity %@", v28, 0x16u);
      }
    }

    _Block_object_dispose(buf, 8);
    objc_sync_exit(v12);
  }
  else
  {
    symptomsLogHandle();
    v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v12->super.super, OS_LOG_TYPE_ERROR))
    {
      v22 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v22);
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v23;
      _os_log_impl(&dword_209DBA000, &v12->super.super, OS_LOG_TYPE_ERROR, "[%{public}@] Registering a periodic activity requires a valid block, queue, and identifier", buf, 0xCu);
    }
  }
}

void __89__ABCPeriodicMaintenanceActivity__registerPeriodicActivityWithIdentifier_queue_activity___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  unint64_t v6 = [a2 activityIdentifier];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    id v8 = symptomsLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 138543618;
      v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_INFO, "[%{public}@] A periodic activity already exists for identifier %@. Skipping registration", (uint8_t *)&v12, 0x16u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (void).cxx_destruct
{
}

@end