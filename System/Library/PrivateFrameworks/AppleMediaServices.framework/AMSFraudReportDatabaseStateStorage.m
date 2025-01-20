@interface AMSFraudReportDatabaseStateStorage
- (AMSFraudReportDatabaseStateStorage)init;
- (NSArray)allKeys;
- (NSDate)lastCleanupDate;
- (id)objectForKeyedSubscript:(id)a3;
- (void)setLastCleanupDate:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation AMSFraudReportDatabaseStateStorage

- (void).cxx_destruct
{
}

- (AMSFraudReportDatabaseStateStorage)init
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)AMSFraudReportDatabaseStateStorage;
  v2 = [(AMSFraudReportDatabaseStateStorage *)&v12 init];
  if (v2
    && (v3 = [[AMSStorageDatabase alloc] initWithDomain:@"AMSFraudReport"], storageDatabase = v2->_storageDatabase, v2->_storageDatabase = v3, storageDatabase, !v2->_storageDatabase))
  {
    v6 = +[AMSLogConfig sharedFraudReportConfig];
    if (!v6)
    {
      v6 = +[AMSLogConfig sharedConfig];
    }
    v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_opt_class();
      id v9 = v8;
      v10 = AMSSetLogKeyIfNeeded();
      *(_DWORD *)buf = 138543618;
      v14 = v8;
      __int16 v15 = 2114;
      v16 = v10;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create AMSStorageDatabase, no persistence will be available for Fraud Report.", buf, 0x16u);
    }
    v5 = 0;
  }
  else
  {
    v5 = v2;
  }

  return v5;
}

- (NSDate)lastCleanupDate
{
  return +[AMSDefaults lastFraudScoreStateCleanupDate];
}

- (void)setLastCleanupDate:(id)a3
{
}

- (NSArray)allKeys
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  storageDatabase = self->_storageDatabase;
  id v12 = 0;
  v3 = [(AMSStorageDatabase *)storageDatabase allKeysForDomain:@"AMSFraudReport" withError:&v12];
  id v4 = v12;
  if (v4)
  {
    v5 = +[AMSLogConfig sharedFraudReportConfig];
    if (!v5)
    {
      v5 = +[AMSLogConfig sharedConfig];
    }
    v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_opt_class();
      id v8 = v7;
      id v9 = AMSSetLogKeyIfNeeded();
      v10 = AMSLogableError(v4);
      *(_DWORD *)buf = 138543874;
      v14 = v7;
      __int16 v15 = 2114;
      v16 = v9;
      __int16 v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to read all keys from the Fraud Report persistent state database: %{public}@", buf, 0x20u);
    }
  }

  return (NSArray *)v3;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  storageDatabase = self->_storageDatabase;
  if (v6)
  {
    uint64_t v19 = 0;
    BOOL v9 = [(AMSStorageDatabase *)storageDatabase setValue:v6 forKey:v7 error:&v19];
    v10 = v19;
  }
  else
  {
    v18 = 0;
    BOOL v9 = [(AMSStorageDatabase *)storageDatabase deleteForKey:v7 error:&v18];
    v10 = v18;
  }
  id v11 = v10;
  if (!v9)
  {
    id v12 = +[AMSLogConfig sharedFraudReportConfig];
    if (!v12)
    {
      id v12 = +[AMSLogConfig sharedConfig];
    }
    v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_opt_class();
      id v15 = v14;
      v16 = AMSSetLogKeyIfNeeded();
      __int16 v17 = AMSLogableError(v11);
      *(_DWORD *)buf = 138543874;
      v21 = v14;
      __int16 v22 = 2114;
      v23 = v16;
      __int16 v24 = 2114;
      v25 = v17;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to set value to Fraud Report persistent state database: %{public}@", buf, 0x20u);
    }
  }
}

- (id)objectForKeyedSubscript:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = AMSSetLogKeyIfNeeded();
  storageDatabase = self->_storageDatabase;
  id v20 = 0;
  id v7 = [(AMSStorageDatabase *)storageDatabase valueForKey:v4 error:&v20];

  id v8 = v20;
  if (!v7)
  {
    BOOL v9 = +[AMSLogConfig sharedFraudReportConfig];
    if (!v9)
    {
      BOOL v9 = +[AMSLogConfig sharedConfig];
    }
    v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = objc_opt_class();
      id v12 = v11;
      v13 = AMSLogableError(v8);
      *(_DWORD *)buf = 138543874;
      __int16 v22 = v11;
      __int16 v23 = 2114;
      __int16 v24 = v5;
      __int16 v25 = 2114;
      uint64_t v26 = v13;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to retrieve value from Fraud Report persistent state database: %{public}@", buf, 0x20u);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v7;
  }
  else
  {
    id v15 = +[AMSLogConfig sharedFraudReportConfig];
    if (!v15)
    {
      id v15 = +[AMSLogConfig sharedConfig];
    }
    v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      __int16 v22 = v17;
      __int16 v23 = 2114;
      __int16 v24 = v5;
      id v18 = v17;
      _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Value retrieved from Fraud Report persistent state database was not a dictionary, discarding.", buf, 0x16u);
    }
    id v14 = 0;
  }

  return v14;
}

@end