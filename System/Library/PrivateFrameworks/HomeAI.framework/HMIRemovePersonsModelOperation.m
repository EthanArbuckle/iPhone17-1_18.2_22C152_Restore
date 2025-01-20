@interface HMIRemovePersonsModelOperation
- (BOOL)external;
- (HMIRemovePersonsModelOperation)initWithSourceUUID:(id)a3 homeUUID:(id)a4 external:(BOOL)a5;
- (NSUUID)homeUUID;
- (NSUUID)sourceUUID;
- (id)logIdentifier;
- (void)main;
- (void)mainInsideAutoreleasePool;
- (void)removePersonsModelWithRetryOnError:(BOOL)a3;
@end

@implementation HMIRemovePersonsModelOperation

- (HMIRemovePersonsModelOperation)initWithSourceUUID:(id)a3 homeUUID:(id)a4 external:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMIRemovePersonsModelOperation;
  v11 = [(HMFOperation *)&v14 initWithTimeout:10.0];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sourceUUID, a3);
    objc_storeStrong((id *)&v12->_homeUUID, a4);
    v12->_external = a5;
  }

  return v12;
}

- (void)main
{
  v3 = (void *)MEMORY[0x22A641C70](self, a2);
  [(HMIRemovePersonsModelOperation *)self mainInsideAutoreleasePool];
}

- (void)mainInsideAutoreleasePool
{
}

- (void)removePersonsModelWithRetryOnError:(BOOL)a3
{
  v26[3] = *MEMORY[0x263EF8340];
  v5 = +[HMITaskService taskServiceClient];
  v26[0] = HMITaskTypeRemovePersonsModelTask;
  v25[0] = @"taskType";
  v25[1] = @"homeUUID";
  v6 = [(HMIRemovePersonsModelOperation *)self homeUUID];
  v26[1] = v6;
  v25[2] = @"sourceUUID";
  v7 = [(HMIRemovePersonsModelOperation *)self sourceUUID];
  v26[2] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];

  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __69__HMIRemovePersonsModelOperation_removePersonsModelWithRetryOnError___block_invoke;
  v15[3] = &unk_26477DE68;
  objc_copyWeak(&v16, &location);
  BOOL v17 = a3;
  int v9 = [v5 submitTaskWithOptions:v8 progressHandler:0 completionHandler:v15];
  id v10 = (void *)MEMORY[0x22A641C70]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_super v14 = HMFBooleanToString();
    *(_DWORD *)buf = 138543874;
    id v20 = v13;
    __int16 v21 = 1024;
    int v22 = v9;
    __int16 v23 = 2112;
    v24 = v14;
    _os_log_impl(&dword_225DC6000, v12, OS_LOG_TYPE_INFO, "%{public}@Submitted persons model remove task, taskID:%u, retryOnError:%@", buf, 0x1Cu);
  }
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __69__HMIRemovePersonsModelOperation_removePersonsModelWithRetryOnError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = [v5 objectForKeyedSubscript:@"resultCode"];
    int v9 = HMITaskResultCodeAsString(0);
    int v10 = [v8 isEqualToString:v9];

    if (v10)
    {
      v11 = (void *)MEMORY[0x22A641C70]();
      id v12 = WeakRetained;
      id v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        objc_super v14 = HMFGetLogIdentifier();
        int v22 = 138543362;
        __int16 v23 = v14;
        _os_log_impl(&dword_225DC6000, v13, OS_LOG_TYPE_INFO, "%{public}@Successfully removed persons model", (uint8_t *)&v22, 0xCu);
      }
      [v12 finish];
    }
    else
    {
      int v15 = *(unsigned __int8 *)(a1 + 40);
      id v16 = (void *)MEMORY[0x22A641C70]();
      id v17 = WeakRetained;
      v18 = HMFGetOSLogHandle();
      v19 = v18;
      if (v15)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          id v20 = HMFGetLogIdentifier();
          int v22 = 138543618;
          __int16 v23 = v20;
          __int16 v24 = 2112;
          id v25 = v6;
          _os_log_impl(&dword_225DC6000, v19, OS_LOG_TYPE_INFO, "%{public}@Failed to remove persons model, error:%@, retrying...", (uint8_t *)&v22, 0x16u);
        }
        [v17 removePersonsModelWithRetryOnError:0];
      }
      else
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          __int16 v21 = HMFGetLogIdentifier();
          int v22 = 138543618;
          __int16 v23 = v21;
          __int16 v24 = 2112;
          id v25 = v6;
          _os_log_impl(&dword_225DC6000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove persons model, error:%@", (uint8_t *)&v22, 0x16u);
        }
        [v17 cancelWithError:v6];
      }
    }
  }
}

- (id)logIdentifier
{
  v3 = NSString;
  v4 = [(HMIRemovePersonsModelOperation *)self sourceUUID];
  BOOL v5 = [(HMIRemovePersonsModelOperation *)self external];
  id v6 = @"home";
  if (v5) {
    id v6 = @"external";
  }
  v7 = [v3 stringWithFormat:@"%@ (%@)", v4, v6];

  return v7;
}

- (NSUUID)sourceUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 320, 1);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 328, 1);
}

- (BOOL)external
{
  return self->_external;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_sourceUUID, 0);
}

@end