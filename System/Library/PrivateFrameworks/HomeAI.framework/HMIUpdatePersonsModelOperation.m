@interface HMIUpdatePersonsModelOperation
- (BOOL)external;
- (HMIUpdatePersonsModelOperation)initWithSourceUUID:(id)a3 homeUUID:(id)a4 external:(BOOL)a5;
- (NSUUID)homeUUID;
- (NSUUID)sourceUUID;
- (id)logIdentifier;
- (void)main;
- (void)mainInsideAutoreleasePool;
- (void)updatePersonsModelWithRetryOnError:(BOOL)a3;
@end

@implementation HMIUpdatePersonsModelOperation

- (HMIUpdatePersonsModelOperation)initWithSourceUUID:(id)a3 homeUUID:(id)a4 external:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMIUpdatePersonsModelOperation;
  v11 = [(HMFOperation *)&v14 initWithTimeout:300.0];
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
  [(HMIUpdatePersonsModelOperation *)self mainInsideAutoreleasePool];
}

- (void)mainInsideAutoreleasePool
{
}

- (void)updatePersonsModelWithRetryOnError:(BOOL)a3
{
  v27[4] = *MEMORY[0x263EF8340];
  v5 = +[HMITaskService taskServiceClient];
  v27[0] = HMITaskTypeUpdatePersonsModelTask;
  v26[0] = @"taskType";
  v26[1] = @"sourceUUID";
  v6 = [(HMIUpdatePersonsModelOperation *)self sourceUUID];
  v27[1] = v6;
  v26[2] = @"homeUUID";
  v7 = [(HMIUpdatePersonsModelOperation *)self homeUUID];
  v27[2] = v7;
  v26[3] = @"isExternal";
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[HMIUpdatePersonsModelOperation external](self, "external"));
  v27[3] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];

  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __69__HMIUpdatePersonsModelOperation_updatePersonsModelWithRetryOnError___block_invoke;
  v16[3] = &unk_26477DE68;
  objc_copyWeak(&v17, &location);
  BOOL v18 = a3;
  int v10 = [v5 submitTaskWithOptions:v9 progressHandler:0 completionHandler:v16];
  v11 = (void *)MEMORY[0x22A641C70]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = HMFBooleanToString();
    *(_DWORD *)buf = 138543874;
    id v21 = v14;
    __int16 v22 = 1024;
    int v23 = v10;
    __int16 v24 = 2112;
    v25 = v15;
    _os_log_impl(&dword_225DC6000, v13, OS_LOG_TYPE_INFO, "%{public}@Submitted persons model update task, taskID:%u, retryOnError:%@", buf, 0x1Cu);
  }
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __69__HMIUpdatePersonsModelOperation_updatePersonsModelWithRetryOnError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = [v5 objectForKeyedSubscript:@"resultCode"];
    id v9 = HMITaskResultCodeAsString(0);
    int v10 = [v8 isEqualToString:v9];

    if (v10)
    {
      v11 = (void *)MEMORY[0x22A641C70]();
      id v12 = WeakRetained;
      v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v14 = HMFGetLogIdentifier();
        int v22 = 138543362;
        int v23 = v14;
        _os_log_impl(&dword_225DC6000, v13, OS_LOG_TYPE_INFO, "%{public}@Successfully updated persons model", (uint8_t *)&v22, 0xCu);
      }
      [v12 finish];
    }
    else
    {
      int v15 = *(unsigned __int8 *)(a1 + 40);
      v16 = (void *)MEMORY[0x22A641C70]();
      id v17 = WeakRetained;
      BOOL v18 = HMFGetOSLogHandle();
      v19 = v18;
      if (v15)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v20 = HMFGetLogIdentifier();
          int v22 = 138543618;
          int v23 = v20;
          __int16 v24 = 2112;
          id v25 = v6;
          _os_log_impl(&dword_225DC6000, v19, OS_LOG_TYPE_INFO, "%{public}@Failed to update persons model, error:%@, retrying...", (uint8_t *)&v22, 0x16u);
        }
        [v17 updatePersonsModelWithRetryOnError:0];
      }
      else
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          id v21 = HMFGetLogIdentifier();
          int v22 = 138543618;
          int v23 = v21;
          __int16 v24 = 2112;
          id v25 = v6;
          _os_log_impl(&dword_225DC6000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to update persons model, error:%@", (uint8_t *)&v22, 0x16u);
        }
        [v17 cancelWithError:v6];
      }
    }
  }
}

- (id)logIdentifier
{
  v3 = NSString;
  v4 = [(HMIUpdatePersonsModelOperation *)self sourceUUID];
  BOOL v5 = [(HMIUpdatePersonsModelOperation *)self external];
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