@interface HMDMetricsAccessoryDetailsManager
- (HMDHouseholdMetricsDataSource)dataSource;
- (HMDMetricsAccessoryDetailsManager)initWithDataSource:(id)a3;
- (id)accessoryCategoryLogEventsForHomeWithUUID:(id)a3;
- (id)logEventsPopulatedForHomeWithUUID:(id)a3 associatedWithDate:(id)a4;
@end

@implementation HMDMetricsAccessoryDetailsManager

- (void).cxx_destruct
{
}

- (HMDHouseholdMetricsDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDHouseholdMetricsDataSource *)WeakRetained;
}

- (id)accessoryCategoryLogEventsForHomeWithUUID:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v58 = a3;
  v52 = self;
  v4 = [(HMDMetricsAccessoryDetailsManager *)self dataSource];
  id v57 = [MEMORY[0x1E4F1CA48] array];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v46 = v4;
  id obj = [v4 homeDataSources];
  uint64_t v49 = [obj countByEnumeratingWithState:&v64 objects:v74 count:16];
  if (v49)
  {
    uint64_t v48 = *(void *)v65;
    uint64_t v55 = *MEMORY[0x1E4F2C230];
    uint64_t v54 = *MEMORY[0x1E4F2C240];
    uint64_t v53 = *MEMORY[0x1E4F2C248];
    uint64_t v51 = *MEMORY[0x1E4F2C218];
    do
    {
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v65 != v48) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        if (v58)
        {
          v7 = [*(id *)(*((void *)&v64 + 1) + 8 * i) uuid];
          int v8 = [v7 isEqual:v58];

          if (!v8) {
            continue;
          }
        }
        uint64_t v50 = i;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        id v56 = [v6 accessories];
        uint64_t v9 = [v56 countByEnumeratingWithState:&v60 objects:v73 count:16];
        if (!v9) {
          goto LABEL_43;
        }
        uint64_t v10 = v9;
        uint64_t v59 = *(void *)v61;
        while (1)
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v61 != v59) {
              objc_enumerationMutation(v56);
            }
            id v12 = *(id *)(*((void *)&v60 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v13 = v12;
            }
            else {
              v13 = 0;
            }
            id v14 = v13;

            if (!v14)
            {
              id v29 = v12;
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v30 = v29;
              }
              else {
                v30 = 0;
              }
              id v15 = v30;

              if (v15)
              {
                v31 = [HMDAccessoryCategoryLogEvent alloc];
                id v16 = [v29 category];
                v32 = [v16 categoryType];
                v33 = [(HMDAccessoryCategoryLogEvent *)v31 initWithAccessoryDetailsType:2 accessoryCategoryIdentifier:v32 homeUUID:v58];
                [v57 addObject:v33];
              }
              else
              {
                id v34 = v29;
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  v35 = v34;
                }
                else {
                  v35 = 0;
                }
                id v16 = v35;

                if (v16)
                {
                  v36 = [v34 category];
                  v37 = [v36 categoryType];
                  v38 = [v37 stringByAppendingString:@"_AirPlay"];

                  v39 = [[HMDAccessoryCategoryLogEvent alloc] initWithAccessoryDetailsType:1 accessoryCategoryIdentifier:v38 homeUUID:v58];
                  [v57 addObject:v39];

                  id v15 = 0;
                }
                else
                {
                  v40 = (void *)MEMORY[0x1D9452090]();
                  v41 = v52;
                  v42 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                  {
                    v43 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138543618;
                    v69 = v43;
                    __int16 v70 = 2112;
                    id v71 = v34;
                    _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_ERROR, "%{public}@Accessory category not found for: %@", buf, 0x16u);
                  }
                  id v16 = 0;
                  id v15 = 0;
                }
              }
              goto LABEL_38;
            }
            id v15 = [v14 hostAccessory];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || !v15)
            {
              id v16 = +[HMDMetricsUtilities primaryServiceTypeForHAPAccessory:v14];
              v72[0] = v55;
              v72[1] = v54;
              v72[2] = v53;
              v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:3];
              if ([v14 hasTelevisionService]) {
                goto LABEL_23;
              }
              v18 = [v14 category];
              v19 = [v18 categoryType];
              char v20 = [v17 containsObject:v19];

              if ((v20 & 1) != 0
                || ([v16 isEqual:@"00000228-0000-1000-8000-0026BB765291"] & 1) != 0
                || ([v14 category],
                    v21 = objc_claimAutoreleasedReturnValue(),
                    [v21 categoryType],
                    v22 = objc_claimAutoreleasedReturnValue(),
                    int v23 = [v22 isEqualToString:v51],
                    v22,
                    v21,
                    v23))
              {
LABEL_23:
                uint64_t v24 = 1;
              }
              else
              {
                uint64_t v24 = 3;
              }
              v25 = [HMDAccessoryCategoryLogEvent alloc];
              v26 = [v12 category];
              v27 = [v26 categoryType];
              v28 = [(HMDAccessoryCategoryLogEvent *)v25 initWithAccessoryDetailsType:v24 accessoryCategoryIdentifier:v27 homeUUID:v58];
              [v57 addObject:v28];

LABEL_38:
            }

            ++v11;
          }
          while (v10 != v11);
          uint64_t v44 = [v56 countByEnumeratingWithState:&v60 objects:v73 count:16];
          uint64_t v10 = v44;
          if (!v44)
          {
LABEL_43:

            uint64_t i = v50;
            break;
          }
        }
      }
      uint64_t v49 = [obj countByEnumeratingWithState:&v64 objects:v74 count:16];
    }
    while (v49);
  }

  return v57;
}

- (id)logEventsPopulatedForHomeWithUUID:(id)a3 associatedWithDate:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMDMetricsAccessoryDetailsManager *)self accessoryCategoryLogEventsForHomeWithUUID:v6];
  if ([v8 count])
  {
    uint64_t v9 = +[HMDAccessoryCategoryLogEvent denominatorSpecifyingEvent];
    [v8 addObject:v9];

    uint64_t v10 = (void *)[v8 copy];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      int v16 = 138543618;
      v17 = v14;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Returning NULL (for onboarded configuration) to household metrics request for home with UUID: %@", (uint8_t *)&v16, 0x16u);
    }
    uint64_t v10 = 0;
  }

  return v10;
}

- (HMDMetricsAccessoryDetailsManager)initWithDataSource:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDMetricsAccessoryDetailsManager;
  v5 = [(HMDMetricsAccessoryDetailsManager *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_dataSource, v4);
  }

  return v6;
}

@end