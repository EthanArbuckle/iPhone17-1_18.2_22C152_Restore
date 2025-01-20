@interface HMIStoreFaceprintOperation
- (HMIFaceprint)faceprint;
- (HMIHomePersonManagerDataSource)dataSource;
- (HMIStoreFaceprintOperation)initWithDataSource:(id)a3 faceprint:(id)a4;
- (void)main;
@end

@implementation HMIStoreFaceprintOperation

- (HMIStoreFaceprintOperation)initWithDataSource:(id)a3 faceprint:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMIStoreFaceprintOperation;
  v9 = [(HMFOperation *)&v12 initWithTimeout:10.0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataSource, a3);
    objc_storeStrong((id *)&v10->_faceprint, a4);
  }

  return v10;
}

- (void)main
{
  objc_initWeak(&location, self);
  v3 = [(HMIStoreFaceprintOperation *)self dataSource];
  v4 = (void *)MEMORY[0x263EFFA08];
  v5 = [(HMIStoreFaceprintOperation *)self faceprint];
  v6 = [v4 setWithObject:v5];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__HMIStoreFaceprintOperation_main__block_invoke;
  v7[3] = &unk_26477B850;
  objc_copyWeak(&v8, &location);
  [v3 addFaceprints:v6 completion:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __34__HMIStoreFaceprintOperation_main__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x22A641C70]();
  id v6 = WeakRetained;
  id v7 = HMFGetOSLogHandle();
  id v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      v10 = [v6 faceprint];
      int v13 = 138543874;
      v14 = v9;
      __int16 v15 = 2112;
      v16 = v10;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_impl(&dword_225DC6000, v8, OS_LOG_TYPE_ERROR, "%{public}@Storing faceprint:%@ failed with error:%@", (uint8_t *)&v13, 0x20u);
    }
    [v6 cancelWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      objc_super v12 = [v6 faceprint];
      int v13 = 138543618;
      v14 = v11;
      __int16 v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_225DC6000, v8, OS_LOG_TYPE_INFO, "%{public}@Storing faceprint:%@ completed successfully", (uint8_t *)&v13, 0x16u);
    }
    [v6 finish];
  }
}

- (HMIHomePersonManagerDataSource)dataSource
{
  return (HMIHomePersonManagerDataSource *)objc_getProperty(self, a2, 312, 1);
}

- (HMIFaceprint)faceprint
{
  return (HMIFaceprint *)objc_getProperty(self, a2, 320, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceprint, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end