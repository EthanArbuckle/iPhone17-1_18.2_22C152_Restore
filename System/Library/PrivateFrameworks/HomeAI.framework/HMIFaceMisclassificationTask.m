@interface HMIFaceMisclassificationTask
- (HMIFaceMisclassificationTask)initWithTaskID:(int)a3 dataSource:(id)a4 faceCrop:(id)a5;
- (HMIHomePersonManagerDataSource)dataSource;
- (HMIPersonFaceCrop)faceCrop;
- (void)mainInsideAutoreleasePool;
- (void)removeNearestFaceprint:(id)a3 withFaceCrops:(id)a4;
@end

@implementation HMIFaceMisclassificationTask

- (HMIFaceMisclassificationTask)initWithTaskID:(int)a3 dataSource:(id)a4 faceCrop:(id)a5
{
  uint64_t v7 = *(void *)&a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMIFaceMisclassificationTask;
  v11 = [(HMITask *)&v14 initWithTaskID:v7];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_faceCrop, a5);
    objc_storeStrong((id *)&v12->_dataSource, a4);
  }

  return v12;
}

- (void)mainInsideAutoreleasePool
{
  objc_initWeak(&location, self);
  v3 = [(HMIFaceMisclassificationTask *)self dataSource];
  v4 = (void *)MEMORY[0x263EFFA08];
  v5 = [(HMIFaceMisclassificationTask *)self faceCrop];
  v6 = [v5 personUUID];
  uint64_t v7 = [v4 setWithObject:v6];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__HMIFaceMisclassificationTask_mainInsideAutoreleasePool__block_invoke;
  v8[3] = &unk_26477CC80;
  objc_copyWeak(&v9, &location);
  [v3 fetchFaceCropsForPersonsWithUUIDs:v7 completion:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __57__HMIFaceMisclassificationTask_mainInsideAutoreleasePool__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v5)
    {
      v8 = objc_msgSend(v5, "na_map:", &__block_literal_global_19);
      objc_initWeak((id *)location, WeakRetained);
      id v9 = [WeakRetained dataSource];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __57__HMIFaceMisclassificationTask_mainInsideAutoreleasePool__block_invoke_2;
      v14[3] = &unk_26477D1C8;
      objc_copyWeak(&v16, (id *)location);
      id v15 = v5;
      [v9 fetchFaceprintsForFaceCropsWithUUIDs:v8 completion:v14];

      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)location);
    }
    else
    {
      id v10 = (void *)MEMORY[0x22A641C70]();
      id v11 = WeakRetained;
      v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = HMFGetLogIdentifier();
        *(_DWORD *)id location = 138543618;
        *(void *)&location[4] = v13;
        __int16 v18 = 2112;
        id v19 = v6;
        _os_log_impl(&dword_225DC6000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch face crops with error: %@", location, 0x16u);
      }
      [v11 cancelWithError:v6];
    }
  }
}

uint64_t __57__HMIFaceMisclassificationTask_mainInsideAutoreleasePool__block_invoke_34(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

void __57__HMIFaceMisclassificationTask_mainInsideAutoreleasePool__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      [WeakRetained removeNearestFaceprint:v5 withFaceCrops:*(void *)(a1 + 32)];
    }
    else
    {
      id v9 = (void *)MEMORY[0x22A641C70]();
      id v10 = v8;
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = HMFGetLogIdentifier();
        int v13 = 138543618;
        objc_super v14 = v12;
        __int16 v15 = 2112;
        id v16 = v6;
        _os_log_impl(&dword_225DC6000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch faceprints with error: %@", (uint8_t *)&v13, 0x16u);
      }
      [v10 cancelWithError:v6];
    }
  }
}

- (void)removeNearestFaceprint:(id)a3 withFaceCrops:(id)a4
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v58 = 0;
  v46 = objc_alloc_init(HMIFaceprinter);
  v44 = v6;
  v48 = [(HMIFaceprinter *)v46 updatedFaceprintsForFaceCrops:v6 withExistingFaceprints:v5 error:&v58];
  id v7 = v58;
  if (v48)
  {
    v45 = [v48 allAtCurrentVersion];
    if (objc_msgSend(v45, "hmf_isEmpty"))
    {
      v8 = (void *)MEMORY[0x22A641C70]();
      id v9 = self;
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = HMFGetLogIdentifier();
        v12 = [(HMIFaceMisclassificationTask *)v9 faceCrop];
        int v13 = [v12 personUUID];
        *(_DWORD *)buf = 138543618;
        v61 = v11;
        __int16 v62 = 2112;
        id v63 = v13;
        _os_log_impl(&dword_225DC6000, v10, OS_LOG_TYPE_INFO, "%{public}@Person (%@) has no faceprints -- nothing to remove", buf, 0x16u);
      }
      [(HMFOperation *)v9 finish];
    }
    else
    {
      __int16 v18 = [(HMIFaceMisclassificationTask *)self faceCrop];
      id v57 = v7;
      v43 = [(HMIFaceprinter *)v46 generateFaceprintForFaceCrop:v18 error:&v57];
      id v42 = v57;

      v49 = [v43 faceprint];
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v19 = v45;
      uint64_t v20 = 0;
      uint64_t v21 = [v19 countByEnumeratingWithState:&v53 objects:v59 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v54;
        double v23 = 1.79769313e308;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v54 != v22) {
              objc_enumerationMutation(v19);
            }
            v25 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            v26 = [v49 descriptorData];
            v27 = [v25 data];
            +[HMIGreedyClustering faceDistanceFromDescriptor:v26 toDescriptor:v27];
            float v29 = v28;

            double v30 = v29;
            if (v23 > v30)
            {
              id v31 = v25;

              double v23 = v30;
              uint64_t v20 = v31;
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v53 objects:v59 count:16];
        }
        while (v21);
      }

      v32 = (void *)MEMORY[0x22A641C70]();
      v33 = self;
      v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = HMFGetLogIdentifier();
        v36 = [v20 faceCropUUID];
        *(_DWORD *)buf = 138543618;
        v61 = v35;
        __int16 v62 = 2112;
        id v63 = v36;
        _os_log_impl(&dword_225DC6000, v34, OS_LOG_TYPE_INFO, "%{public}@Nearest face crop to be removed: %@", buf, 0x16u);
      }
      objc_initWeak((id *)buf, v33);
      v37 = [(HMIFaceMisclassificationTask *)v33 dataSource];
      v38 = (void *)MEMORY[0x263EFFA08];
      v39 = [v20 faceCropUUID];
      v40 = [v38 setWithObject:v39];
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __69__HMIFaceMisclassificationTask_removeNearestFaceprint_withFaceCrops___block_invoke;
      v50[3] = &unk_26477D1F0;
      objc_copyWeak(&v52, (id *)buf);
      id v41 = v20;
      id v51 = v41;
      [v37 removeFaceCropsWithUUIDs:v40 completion:v50];

      objc_destroyWeak(&v52);
      objc_destroyWeak((id *)buf);

      id v7 = v42;
    }
  }
  else
  {
    objc_super v14 = (void *)MEMORY[0x22A641C70]();
    __int16 v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v61 = v17;
      __int16 v62 = 2112;
      id v63 = v7;
      _os_log_impl(&dword_225DC6000, v16, OS_LOG_TYPE_ERROR, "%{public}@Error faceprinting face crops:%@", buf, 0x16u);
    }
    [(HMFOperation *)v15 cancelWithError:v7];
  }
}

void __69__HMIFaceMisclassificationTask_removeNearestFaceprint_withFaceCrops___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = (void *)MEMORY[0x22A641C70]();
    id v6 = WeakRetained;
    id v7 = HMFGetOSLogHandle();
    v8 = v7;
    if (v3)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v9 = HMFGetLogIdentifier();
        int v12 = 138543618;
        int v13 = v9;
        __int16 v14 = 2112;
        id v15 = v3;
        _os_log_impl(&dword_225DC6000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove face crop with error: %@", (uint8_t *)&v12, 0x16u);
      }
      [v6 cancelWithError:v3];
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v10 = HMFGetLogIdentifier();
        id v11 = [*(id *)(a1 + 32) faceCropUUID];
        int v12 = 138543618;
        int v13 = v10;
        __int16 v14 = 2112;
        id v15 = v11;
        _os_log_impl(&dword_225DC6000, v8, OS_LOG_TYPE_INFO, "%{public}@Successfully removed face crop (%@) via user indicated misclassification", (uint8_t *)&v12, 0x16u);
      }
      [v6 finish];
    }
  }
}

- (HMIPersonFaceCrop)faceCrop
{
  return (HMIPersonFaceCrop *)objc_getProperty(self, a2, 328, 1);
}

- (HMIHomePersonManagerDataSource)dataSource
{
  return (HMIHomePersonManagerDataSource *)objc_getProperty(self, a2, 336, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_faceCrop, 0);
}

@end