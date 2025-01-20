@interface HMIPersonsModelsSummaryTask
- (HMIPersonsModelsSummaryTask)initWithTaskID:(int)a3 homeUUID:(id)a4;
- (void)mainInsideAutoreleasePool;
@end

@implementation HMIPersonsModelsSummaryTask

- (HMIPersonsModelsSummaryTask)initWithTaskID:(int)a3 homeUUID:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)HMIPersonsModelsSummaryTask;
  return [(HMIHomeTask *)&v5 initWithTaskID:*(void *)&a3 homeUUID:a4 timeout:30.0];
}

- (void)mainInsideAutoreleasePool
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = +[HMIPersonsModelManager sharedInstance];
  v4 = [(HMIHomeTask *)self homeUUID];
  id v11 = 0;
  objc_super v5 = [v3 summaryForHomeUUID:v4 error:&v11];
  id v6 = v11;

  if (v5)
  {
    +[HMIAnalytics sendEventForPersonsModels:v5];
    [(HMFOperation *)self finish];
  }
  else
  {
    v7 = (void *)MEMORY[0x22A641C70]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v13 = v10;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_225DC6000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate persons model summary, error:%@", buf, 0x16u);
    }
    [(HMFOperation *)v8 cancelWithError:v6];
  }
}

@end