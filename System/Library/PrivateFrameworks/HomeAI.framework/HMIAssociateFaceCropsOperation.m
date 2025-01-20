@interface HMIAssociateFaceCropsOperation
- (HMIAssociateFaceCropsOperation)initWithDataSource:(id)a3 faceCropUUIDs:(id)a4 personUUID:(id)a5 source:(int64_t)a6;
- (HMIHomePersonManagerDataSource)dataSource;
- (NSSet)faceCropUUIDs;
- (NSUUID)personUUID;
- (int64_t)source;
- (void)main;
- (void)mainInsideAutoreleasePool;
@end

@implementation HMIAssociateFaceCropsOperation

- (HMIAssociateFaceCropsOperation)initWithDataSource:(id)a3 faceCropUUIDs:(id)a4 personUUID:(id)a5 source:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMIAssociateFaceCropsOperation;
  v14 = [(HMFOperation *)&v17 initWithTimeout:20.0];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_dataSource, a3);
    objc_storeStrong((id *)&v15->_faceCropUUIDs, a4);
    objc_storeStrong((id *)&v15->_personUUID, a5);
    v15->_source = a6;
  }

  return v15;
}

- (void)main
{
  v3 = (void *)MEMORY[0x22A641C70](self, a2);
  [(HMIAssociateFaceCropsOperation *)self mainInsideAutoreleasePool];
}

- (void)mainInsideAutoreleasePool
{
  objc_initWeak(&location, self);
  v3 = [(HMIAssociateFaceCropsOperation *)self dataSource];
  v4 = [(HMIAssociateFaceCropsOperation *)self faceCropUUIDs];
  v5 = [(HMIAssociateFaceCropsOperation *)self personUUID];
  int64_t v6 = [(HMIAssociateFaceCropsOperation *)self source];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__HMIAssociateFaceCropsOperation_mainInsideAutoreleasePool__block_invoke;
  v7[3] = &unk_26477B850;
  objc_copyWeak(&v8, &location);
  [v3 associateFaceCropsWithUUIDs:v4 toPersonWithUUID:v5 forSource:v6 completion:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __59__HMIAssociateFaceCropsOperation_mainInsideAutoreleasePool__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = (void *)MEMORY[0x22A641C70]();
    id v6 = WeakRetained;
    v7 = HMFGetOSLogHandle();
    id v8 = v7;
    if (v3)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v9 = HMFGetLogIdentifier();
        v10 = [v6 faceCropUUIDs];
        uint64_t v11 = [v10 count];
        id v12 = [v6 personUUID];
        id v13 = HMIPersonFaceCropSourceAsString([v6 source]);
        int v19 = 138544386;
        v20 = v9;
        __int16 v21 = 2048;
        uint64_t v22 = v11;
        __int16 v23 = 2112;
        v24 = v12;
        __int16 v25 = 2112;
        v26 = v13;
        __int16 v27 = 2112;
        id v28 = v3;
        _os_log_impl(&dword_225DC6000, v8, OS_LOG_TYPE_ERROR, "%{public}@Error associating face crops (num UUIDs:%lu), to personUUID: %@ with source: %@ error:%@", (uint8_t *)&v19, 0x34u);
      }
      [v6 cancelWithError:v3];
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v14 = HMFGetLogIdentifier();
        v15 = [v6 faceCropUUIDs];
        uint64_t v16 = [v15 count];
        objc_super v17 = [v6 personUUID];
        v18 = HMIPersonFaceCropSourceAsString([v6 source]);
        int v19 = 138544130;
        v20 = v14;
        __int16 v21 = 2048;
        uint64_t v22 = v16;
        __int16 v23 = 2112;
        v24 = v17;
        __int16 v25 = 2112;
        v26 = v18;
        _os_log_impl(&dword_225DC6000, v8, OS_LOG_TYPE_INFO, "%{public}@Succesfully associated face crops (num UUIDs %lu) to person UUID: %@ for source: %@", (uint8_t *)&v19, 0x2Au);
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

- (NSUUID)personUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 328, 1);
}

- (int64_t)source
{
  return self->_source;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personUUID, 0);
  objc_storeStrong((id *)&self->_faceCropUUIDs, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end