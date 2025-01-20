@interface HMIFetchPersonFaceCropsOperation
+ (id)shortDescription;
- (HMIFetchPersonFaceCropsOperation)initWithDataSource:(id)a3 person:(id)a4;
- (HMIPerson)person;
- (HMIPersonManagerDataSource)dataSource;
- (NSSet)personFaceCrops;
- (NSString)shortDescription;
- (void)main;
- (void)mainInsideAutoreleasePool;
@end

@implementation HMIFetchPersonFaceCropsOperation

- (HMIFetchPersonFaceCropsOperation)initWithDataSource:(id)a3 person:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMIFetchPersonFaceCropsOperation;
  v9 = [(HMFOperation *)&v14 initWithTimeout:20.0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataSource, a3);
    objc_storeStrong((id *)&v10->_person, a4);
    uint64_t v11 = [MEMORY[0x263EFFA08] set];
    personFaceCrops = v10->_personFaceCrops;
    v10->_personFaceCrops = (NSSet *)v11;
  }
  return v10;
}

- (void)main
{
  v3 = (void *)MEMORY[0x22A641C70](self, a2);
  [(HMIFetchPersonFaceCropsOperation *)self mainInsideAutoreleasePool];
}

- (void)mainInsideAutoreleasePool
{
  objc_initWeak(&location, self);
  v3 = [(HMIFetchPersonFaceCropsOperation *)self dataSource];
  v4 = (void *)MEMORY[0x263EFFA08];
  v5 = [(HMIFetchPersonFaceCropsOperation *)self person];
  v6 = [v5 UUID];
  id v7 = [v4 setWithObject:v6];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__HMIFetchPersonFaceCropsOperation_mainInsideAutoreleasePool__block_invoke;
  v8[3] = &unk_26477CC80;
  objc_copyWeak(&v9, &location);
  [v3 fetchFaceCropsForPersonsWithUUIDs:v7 completion:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __61__HMIFetchPersonFaceCropsOperation_mainInsideAutoreleasePool__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    if (v7)
    {
      v10 = (void *)MEMORY[0x22A641C70]();
      uint64_t v11 = v9;
      v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = HMFGetLogIdentifier();
        objc_super v14 = [v11 person];
        int v15 = 138543874;
        v16 = v13;
        __int16 v17 = 2112;
        v18 = v14;
        __int16 v19 = 2112;
        id v20 = v7;
        _os_log_impl(&dword_225DC6000, v12, OS_LOG_TYPE_ERROR, "%{public}@Error fetching face crops for person:%@, error:%@", (uint8_t *)&v15, 0x20u);
      }
      [v11 cancelWithError:v7];
    }
    else
    {
      objc_storeStrong(WeakRetained + 41, a2);
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

- (HMIPersonManagerDataSource)dataSource
{
  return (HMIPersonManagerDataSource *)objc_getProperty(self, a2, 312, 1);
}

- (HMIPerson)person
{
  return (HMIPerson *)objc_getProperty(self, a2, 320, 1);
}

- (NSSet)personFaceCrops
{
  return (NSSet *)objc_getProperty(self, a2, 328, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personFaceCrops, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end