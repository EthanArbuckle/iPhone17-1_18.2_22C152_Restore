@interface HMIRemoveFaceCropsOperation
- (HMIHomePersonManagerDataSource)dataSource;
- (HMIRemoveFaceCropsOperation)initWithDataSource:(id)a3 faceCropUUIDs:(id)a4;
- (NSSet)faceCropUUIDs;
- (void)main;
- (void)mainInsideAutoreleasePool;
@end

@implementation HMIRemoveFaceCropsOperation

- (HMIRemoveFaceCropsOperation)initWithDataSource:(id)a3 faceCropUUIDs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMIRemoveFaceCropsOperation;
  v9 = [(HMFOperation *)&v12 initWithTimeout:20.0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataSource, a3);
    objc_storeStrong((id *)&v10->_faceCropUUIDs, a4);
  }

  return v10;
}

- (void)main
{
  v3 = (void *)MEMORY[0x22A641C70](self, a2);
  [(HMIRemoveFaceCropsOperation *)self mainInsideAutoreleasePool];
}

- (void)mainInsideAutoreleasePool
{
  objc_initWeak(&location, self);
  v3 = [(HMIRemoveFaceCropsOperation *)self dataSource];
  v4 = [(HMIRemoveFaceCropsOperation *)self faceCropUUIDs];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__HMIRemoveFaceCropsOperation_mainInsideAutoreleasePool__block_invoke;
  v5[3] = &unk_26477B850;
  objc_copyWeak(&v6, &location);
  [v3 removeFaceCropsWithUUIDs:v4 completion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __56__HMIRemoveFaceCropsOperation_mainInsideAutoreleasePool__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = (void *)MEMORY[0x22A641C70]();
    id v6 = WeakRetained;
    id v7 = HMFGetOSLogHandle();
    id v8 = v7;
    if (v3)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v9 = HMFGetLogIdentifier();
        v10 = [v6 faceCropUUIDs];
        int v13 = 138543874;
        v14 = v9;
        __int16 v15 = 2112;
        v16 = v10;
        __int16 v17 = 2112;
        id v18 = v3;
        _os_log_impl(&dword_225DC6000, v8, OS_LOG_TYPE_ERROR, "%{public}@Removing faceCrops:%@ failed with error:%@", (uint8_t *)&v13, 0x20u);
      }
      [v6 cancelWithError:v3];
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v11 = HMFGetLogIdentifier();
        objc_super v12 = [v6 faceCropUUIDs];
        int v13 = 138543618;
        v14 = v11;
        __int16 v15 = 2112;
        v16 = v12;
        _os_log_impl(&dword_225DC6000, v8, OS_LOG_TYPE_INFO, "%{public}@Removing faceCrops:%@ completed successfully", (uint8_t *)&v13, 0x16u);
      }
      [v6 finish];
    }
  }
}

- (HMIHomePersonManagerDataSource)dataSource
{
  return (HMIHomePersonManagerDataSource *)objc_getProperty(self, a2, 312, 1);
}

- (NSSet)faceCropUUIDs
{
  return (NSSet *)objc_getProperty(self, a2, 320, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceCropUUIDs, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end