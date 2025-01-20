@interface HMIFetchUnassociatedFaceCropsOperation
+ (id)shortDescription;
- (HMIFetchUnassociatedFaceCropsOperation)initWithDataSource:(id)a3;
- (HMIHomePersonManagerDataSource)dataSource;
- (NSSet)unassociatedFaceCrops;
- (NSString)shortDescription;
- (void)main;
- (void)mainInsideAutoreleasePool;
@end

@implementation HMIFetchUnassociatedFaceCropsOperation

- (HMIFetchUnassociatedFaceCropsOperation)initWithDataSource:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMIFetchUnassociatedFaceCropsOperation;
  v6 = [(HMFOperation *)&v11 initWithTimeout:20.0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    uint64_t v8 = [MEMORY[0x263EFFA08] set];
    unassociatedFaceCrops = v7->_unassociatedFaceCrops;
    v7->_unassociatedFaceCrops = (NSSet *)v8;
  }
  return v7;
}

- (void)main
{
  v3 = (void *)MEMORY[0x22A641C70](self, a2);
  [(HMIFetchUnassociatedFaceCropsOperation *)self mainInsideAutoreleasePool];
}

- (void)mainInsideAutoreleasePool
{
  objc_initWeak(&location, self);
  v3 = [(HMIFetchUnassociatedFaceCropsOperation *)self dataSource];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __67__HMIFetchUnassociatedFaceCropsOperation_mainInsideAutoreleasePool__block_invoke;
  v4[3] = &unk_26477CC80;
  objc_copyWeak(&v5, &location);
  [v3 fetchAllUnassociatedFaceCropsWithCompletion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __67__HMIFetchUnassociatedFaceCropsOperation_mainInsideAutoreleasePool__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (v7)
    {
      v10 = (void *)MEMORY[0x22A641C70]();
      objc_super v11 = v9;
      v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = HMFGetLogIdentifier();
        int v14 = 138543618;
        v15 = v13;
        __int16 v16 = 2112;
        id v17 = v7;
        _os_log_impl(&dword_225DC6000, v12, OS_LOG_TYPE_ERROR, "%{public}@Error fetching unassociated face crops:%@", (uint8_t *)&v14, 0x16u);
      }
      [v11 cancelWithError:v7];
    }
    else
    {
      objc_storeStrong(WeakRetained + 40, a2);
      [v9 finish];
    }
  }
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();
  return (NSString *)[v2 shortDescription];
}

- (HMIHomePersonManagerDataSource)dataSource
{
  return (HMIHomePersonManagerDataSource *)objc_getProperty(self, a2, 312, 1);
}

- (NSSet)unassociatedFaceCrops
{
  return (NSSet *)objc_getProperty(self, a2, 320, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unassociatedFaceCrops, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end