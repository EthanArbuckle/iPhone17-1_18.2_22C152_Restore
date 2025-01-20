@interface HMIUpdateTorsoModelTask
- (HMIUpdateTorsoModelTask)initWithTaskID:(int)a3 homeUUID:(id)a4 torsoAnnotations:(id)a5;
- (NSSet)torsoAnnotations;
- (void)mainInsideAutoreleasePool;
@end

@implementation HMIUpdateTorsoModelTask

- (HMIUpdateTorsoModelTask)initWithTaskID:(int)a3 homeUUID:(id)a4 torsoAnnotations:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HMIUpdateTorsoModelTask;
  v9 = [(HMIHomeTask *)&v13 initWithTaskID:v6 homeUUID:a4 timeout:60.0];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    torsoAnnotations = v9->_torsoAnnotations;
    v9->_torsoAnnotations = (NSSet *)v10;
  }
  return v9;
}

- (void)mainInsideAutoreleasePool
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = +[HMIPersonsModelManager sharedInstance];
  v4 = [(HMIHomeTask *)self homeUUID];
  v5 = [(HMIUpdateTorsoModelTask *)self torsoAnnotations];
  uint64_t v6 = [v5 allObjects];
  id v13 = 0;
  char v7 = [v3 updateTorsoModelForHome:v4 torsoAnnotations:v6 error:&v13];
  id v8 = v13;

  if ((v7 & 1) == 0)
  {
    v9 = (void *)MEMORY[0x22A641C70]();
    uint64_t v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v15 = v12;
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_impl(&dword_225DC6000, v11, OS_LOG_TYPE_ERROR, "%{public}@Error during update torso model task: %@", buf, 0x16u);
    }
    [(HMFOperation *)v10 cancelWithError:v8];
  }
  [(HMFOperation *)self finish];
}

- (NSSet)torsoAnnotations
{
  return (NSSet *)objc_getProperty(self, a2, 336, 1);
}

- (void).cxx_destruct
{
}

@end