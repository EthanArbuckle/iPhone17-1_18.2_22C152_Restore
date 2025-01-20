@interface HMIRemovePersonsModelTask
- (HMIRemovePersonsModelTask)initWithTaskID:(int)a3 homeUUID:(id)a4 sourceUUID:(id)a5;
- (NSUUID)sourceUUID;
- (id)logIdentifier;
- (void)mainInsideAutoreleasePool;
@end

@implementation HMIRemovePersonsModelTask

- (HMIRemovePersonsModelTask)initWithTaskID:(int)a3 homeUUID:(id)a4 sourceUUID:(id)a5
{
  uint64_t v7 = *(void *)&a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HMIRemovePersonsModelTask;
  v10 = [(HMIHomeTask *)&v13 initWithTaskID:v7 homeUUID:a4 timeout:5.0];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_sourceUUID, a5);
  }

  return v11;
}

- (void)mainInsideAutoreleasePool
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = +[HMIPersonsModelManager sharedInstance];
  v4 = [(HMIHomeTask *)self homeUUID];
  v5 = [(HMIRemovePersonsModelTask *)self sourceUUID];
  id v16 = 0;
  char v6 = [v3 removePersonsModelForHomeUUID:v4 sourceUUID:v5 error:&v16];
  id v7 = v16;

  v8 = (void *)MEMORY[0x22A641C70]();
  id v9 = self;
  v10 = HMFGetOSLogHandle();
  v11 = v10;
  if (v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v18 = v12;
      _os_log_impl(&dword_225DC6000, v11, OS_LOG_TYPE_INFO, "%{public}@Successfully removed persons model", buf, 0xCu);
    }
    v15.receiver = v9;
    v15.super_class = (Class)HMIRemovePersonsModelTask;
    [(HMFOperation *)&v15 finish];
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_super v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_225DC6000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove persons model, error:%@", buf, 0x16u);
    }
    v14 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1027 underlyingError:v7];
    [(HMFOperation *)v9 cancelWithError:v14];
  }
}

- (id)logIdentifier
{
  v3 = NSString;
  v4 = [(HMIRemovePersonsModelTask *)self sourceUUID];
  v5 = [(HMIHomeTask *)self homeUUID];
  char v6 = [v3 stringWithFormat:@"SourceUUID:%@ HomeUUID:%@", v4, v5];

  return v6;
}

- (NSUUID)sourceUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 336, 1);
}

- (void).cxx_destruct
{
}

@end