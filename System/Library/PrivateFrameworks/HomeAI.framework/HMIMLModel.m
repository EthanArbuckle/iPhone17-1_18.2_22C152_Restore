@interface HMIMLModel
- (BOOL)_ensureModelWithError:(id *)a3;
- (HMFOSTransaction)transaction;
- (HMFTimer)watchdogTimer;
- (HMIMLModel)initWithModelURL:(id)a3;
- (MLModel)model;
- (MLModel)underlyingModel;
- (NSURL)modelURL;
- (id)predictionFromFeatures:(id)a3 error:(id *)a4;
- (void)setModel:(id)a3;
- (void)setTransaction:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMIMLModel

- (HMIMLModel)initWithModelURL:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMIMLModel;
  v6 = [(HMIMLModel *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_modelURL, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    uint64_t v8 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:8 options:30.0];
    watchdogTimer = v7->_watchdogTimer;
    v7->_watchdogTimer = (HMFTimer *)v8;

    [(HMFTimer *)v7->_watchdogTimer setDelegate:v7];
  }

  return v7;
}

- (MLModel)underlyingModel
{
  BOOL v3 = [(HMIMLModel *)self _ensureModelWithError:0];
  v4 = 0;
  if (v3)
  {
    v4 = [(HMIMLModel *)self model];
  }
  return (MLModel *)v4;
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(HMIMLModel *)self _ensureModelWithError:a4])
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    uint64_t v8 = [(HMIMLModel *)self model];
    v9 = [v8 predictionFromFeatures:v6 error:a4];

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_ensureModelWithError:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(HMIMLModel *)self model];

  if (v6)
  {
    v7 = [(HMIMLModel *)self watchdogTimer];
    [v7 resume];

    BOOL v8 = 1;
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x263F00D98]);
    v10 = +[HMIPreference sharedInstance];
    char v11 = [v10 usesCPUOnly];

    if (v11)
    {
      [v9 setComputeUnits:0];
    }
    else
    {
      v12 = +[HMIPreference sharedInstance];
      objc_msgSend(v9, "setAllowBackgroundGPUCompute:", objc_msgSend(v12, "BOOLPreferenceForKey:defaultValue:", @"espressoLowPriority", 1));
    }
    v13 = (void *)MEMORY[0x263F00D80];
    v14 = [(HMIMLModel *)self modelURL];
    id v26 = 0;
    v15 = [v13 modelWithContentsOfURL:v14 configuration:v9 error:&v26];
    id v16 = v26;
    [(HMIMLModel *)self setModel:v15];

    v17 = [(HMIMLModel *)self model];
    BOOL v8 = v17 != 0;

    if (v17)
    {
      v18 = (void *)[objc_alloc(MEMORY[0x263F425C0]) initWithName:@"HMIMLModel"];
      [(HMIMLModel *)self setTransaction:v18];

      v19 = [(HMIMLModel *)self watchdogTimer];
      [v19 resume];
    }
    else
    {
      v20 = NSString;
      v21 = [(HMIMLModel *)self modelURL];
      v22 = [v21 path];
      v19 = [v20 stringWithFormat:@"Failed to load model at path: %@", v22];

      v23 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1018 description:v19 underlyingError:v16];
      v24 = v23;
      if (a3) {
        *a3 = v23;
      }
      HMIErrorLog(self, v24);
    }
  }
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x22A641C70]();
  p_lock = &self->_lock;
  uint64_t v7 = os_unfair_lock_lock_with_options();
  BOOL v8 = (void *)MEMORY[0x22A641C70](v7);
  id v9 = self;
  HMFGetOSLogHandle();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = [(HMIMLModel *)v9 modelURL];
    v13 = [v12 path];
    int v14 = 138543618;
    id v15 = v11;
    __int16 v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_225DC6000, v10, OS_LOG_TYPE_INFO, "%{public}@Unloading model at path %@ after period of inactivity", (uint8_t *)&v14, 0x16u);
  }
  [(HMIMLModel *)v9 setModel:0];
  [(HMIMLModel *)v9 setTransaction:0];
  os_unfair_lock_unlock(p_lock);
}

- (NSURL)modelURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (MLModel)model
{
  return (MLModel *)objc_getProperty(self, a2, 24, 1);
}

- (void)setModel:(id)a3
{
}

- (HMFTimer)watchdogTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 32, 1);
}

- (HMFOSTransaction)transaction
{
  return (HMFOSTransaction *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
}

@end