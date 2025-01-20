@interface VPPRepair
+ (BOOL)shouldAttemptToRepairApplication:(id)a3 options:(id)a4 logKey:(id)a5;
- (ApplicationRepairDelegate)delegate;
- (BOOL)repairApplication:(id)a3 error:(id *)a4;
- (NSArray)repairedBundleIDs;
- (NSString)repairType;
- (VPPRepair)init;
- (_TtC9appstored6LogKey)logKey;
- (int)fairPlayStatus;
- (void)setDelegate:(id)a3;
- (void)setLogKey:(id)a3;
@end

@implementation VPPRepair

- (VPPRepair)init
{
  v3.receiver = self;
  v3.super_class = (Class)VPPRepair;
  result = [(VPPRepair *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (ApplicationRepairDelegate)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return (ApplicationRepairDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (int)fairPlayStatus
{
  return 0;
}

- (_TtC9appstored6LogKey)logKey
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(LogKey *)self->_logKey copy];
  os_unfair_lock_unlock(p_lock);
  return (_TtC9appstored6LogKey *)v4;
}

- (NSArray)repairedBundleIDs
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSArray *)self->_repairedBundleIDs copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSString)repairType
{
  return (NSString *)@"VPP";
}

+ (BOOL)shouldAttemptToRepairApplication:(id)a3 options:(id)a4 logKey:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  if ([v6 isConfiguratorInstall])
  {
    if ([v6 hasMIDBasedSINF] && !objc_msgSend(v6, "missingRequiredSINF"))
    {
      v8 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543874;
        id v12 = v7;
        __int16 v13 = 1024;
        unsigned int v14 = [v6 hasMIDBasedSINF];
        __int16 v15 = 1024;
        unsigned int v16 = [v6 missingRequiredSINF];
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[VPP/%{public}@] Will not attempt vpp SINF recovery with hasMIDBasedSINF: %{BOOL}d missingRequireSINF: %d", (uint8_t *)&v11, 0x18u);
      }
      BOOL v9 = 0;
    }
    else
    {
      v8 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543362;
        id v12 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[VPP/%{public}@] Will attempt vpp SINF recovery", (uint8_t *)&v11, 0xCu);
      }
      BOOL v9 = 1;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)repairApplication:(id)a3 error:(id *)a4
{
  id v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    logKey = self->_logKey;
    *(_DWORD *)buf = 138412290;
    v35 = logKey;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@] Attempting VPP SINF migration", buf, 0xCu);
  }

  id v7 = [(ApplicationProxy *)self->_application bundleID];
  v8 = +[NSString stringWithFormat:@"Migrating VPP SINF"];
  +[AITransactionLog logStep:13 byParty:3 phase:1 success:1 forBundleID:v7 description:v8];

  id v9 = objc_alloc_init((Class)ASDManagedApplicationRequestOptions);
  v10 = [(ApplicationProxy *)self->_application bundleID];
  [v9 setBundleIdentifier:v10];

  int v11 = sub_1002F3C98((id *)[ManagedApplicationTask alloc], v9, @"com.apple.appstored");
  taskQueue = self->_taskQueue;
  v41 = v11;
  __int16 v13 = +[NSArray arrayWithObjects:&v41 count:1];
  if (taskQueue) {
    [(NSOperationQueue *)taskQueue->_operationQueue addOperations:v13 waitUntilFinished:1];
  }

  if (v11)
  {
    char v15 = *((unsigned char *)v11 + 24);
    BOOL v16 = (char *)v11[21] - 1 < (char *)2;
    id v17 = objc_getProperty(v11, v14, 32, 1);
    if (v15)
    {
      v19 = [(ApplicationProxy *)self->_application bundleID];

      if (v19)
      {
        v20 = [(ApplicationProxy *)self->_application bundleID];
        v40 = v20;
        int v18 = 1;
        v21 = +[NSArray arrayWithObjects:&v40 count:1];
        sub_10025C6EC((uint64_t)self, v21);
      }
      else
      {
        int v18 = 1;
      }
    }
    else
    {
      int v18 = 0;
    }
  }
  else
  {
    id v17 = 0;
    int v18 = 0;
    BOOL v16 = 0;
  }
  v22 = [(ApplicationProxy *)self->_application bundleID];
  v23 = +[NSString stringWithFormat:@"Migrating VPP SINF completed"];
  +[AITransactionLog logStep:13 byParty:3 phase:2 success:v16 forBundleID:v22 description:v23];

  v24 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = self->_logKey;
    *(_DWORD *)buf = 138412802;
    v35 = v25;
    __int16 v36 = 1024;
    int v37 = v18;
    __int16 v38 = 1024;
    BOOL v39 = v16;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[%@] Completed with result: %d SINF migrated: %d", buf, 0x18u);
  }

  if (v16)
  {
    v26 = [(ApplicationProxy *)self->_application bundleID];

    if (v26)
    {
      v27 = [(ApplicationProxy *)self->_application bundleID];
      v33 = v27;
      v28 = +[NSArray arrayWithObjects:&v33 count:1];
      sub_10025C6EC((uint64_t)self, v28);
    }
  }
  else if (v32)
  {
    if (v17)
    {
      void *v32 = v17;
    }
    else
    {
      ASDErrorWithTitleAndMessage();
      id v29 = objc_claimAutoreleasedReturnValue();
      void *v32 = v29;
    }
  }

  return v16;
}

- (void)setLogKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repairedBundleIDs, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

@end