@interface HMIFetchPersonsOperation
+ (id)shortDescription;
- (HMIFetchPersonsOperation)initWithDataSource:(id)a3;
- (HMIPersonManagerDataSource)dataSource;
- (NSSet)persons;
- (NSString)shortDescription;
- (void)main;
- (void)mainInsideAutoreleasePool;
@end

@implementation HMIFetchPersonsOperation

- (HMIFetchPersonsOperation)initWithDataSource:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMIFetchPersonsOperation;
  v6 = [(HMFOperation *)&v11 initWithTimeout:20.0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    uint64_t v8 = [MEMORY[0x263EFFA08] set];
    persons = v7->_persons;
    v7->_persons = (NSSet *)v8;
  }
  return v7;
}

- (void)main
{
  v3 = (void *)MEMORY[0x22A641C70](self, a2);
  [(HMIFetchPersonsOperation *)self mainInsideAutoreleasePool];
}

- (void)mainInsideAutoreleasePool
{
  objc_initWeak(&location, self);
  v3 = [(HMIFetchPersonsOperation *)self dataSource];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__HMIFetchPersonsOperation_mainInsideAutoreleasePool__block_invoke;
  v4[3] = &unk_26477CC80;
  objc_copyWeak(&v5, &location);
  [v3 fetchAllPersonsWithCompletion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __53__HMIFetchPersonsOperation_mainInsideAutoreleasePool__block_invoke(uint64_t a1, void *a2, void *a3)
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
        _os_log_impl(&dword_225DC6000, v12, OS_LOG_TYPE_ERROR, "%{public}@Error fetching persons:%@", (uint8_t *)&v14, 0x16u);
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

- (HMIPersonManagerDataSource)dataSource
{
  return (HMIPersonManagerDataSource *)objc_getProperty(self, a2, 312, 1);
}

- (NSSet)persons
{
  return (NSSet *)objc_getProperty(self, a2, 320, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persons, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end