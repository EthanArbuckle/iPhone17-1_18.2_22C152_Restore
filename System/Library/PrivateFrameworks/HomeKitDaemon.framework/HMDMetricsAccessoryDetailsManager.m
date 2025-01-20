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
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v57 = self;
  v5 = [(HMDMetricsAccessoryDetailsManager *)self dataSource];
  v6 = [MEMORY[0x263EFF980] array];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  v52 = v5;
  id obj = [v5 homeDataSources];
  uint64_t v55 = [obj countByEnumeratingWithState:&v70 objects:v80 count:16];
  if (v55)
  {
    uint64_t v54 = *(void *)v71;
    uint64_t v61 = *MEMORY[0x263F0B170];
    uint64_t v60 = *MEMORY[0x263F0B188];
    uint64_t v59 = *MEMORY[0x263F0B198];
    uint64_t v58 = *MEMORY[0x263F0B130];
    v62 = v6;
    do
    {
      for (uint64_t i = 0; i != v55; ++i)
      {
        if (*(void *)v71 != v54) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        if (v4)
        {
          v9 = [*(id *)(*((void *)&v70 + 1) + 8 * i) uuid];
          int v10 = [v9 isEqual:v4];

          if (!v10) {
            continue;
          }
        }
        uint64_t v56 = i;
        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id v63 = [v8 accessories];
        uint64_t v65 = [v63 countByEnumeratingWithState:&v66 objects:v79 count:16];
        if (!v65) {
          goto LABEL_50;
        }
        uint64_t v64 = *(void *)v67;
        while (1)
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v67 != v64) {
              objc_enumerationMutation(v63);
            }
            id v12 = *(id *)(*((void *)&v66 + 1) + 8 * v11);
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
              id v31 = v12;
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v32 = v31;
              }
              else {
                v32 = 0;
              }
              id v15 = v32;

              if (v15)
              {
                v33 = [HMDAccessoryCategoryLogEvent alloc];
                id v17 = [v31 category];
                id v18 = [v17 categoryType];
                v34 = [(HMDAccessoryCategoryLogEvent *)v33 initWithAccessoryDetailsType:2 accessoryCategoryIdentifier:v18 homeUUID:v4];
                [v6 addObject:v34];
              }
              else
              {
                id v35 = v31;
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  v36 = v35;
                }
                else {
                  v36 = 0;
                }
                id v17 = v36;

                if (v17)
                {
                  v37 = [v35 category];
                  v38 = [v37 categoryType];
                  id v18 = [v38 stringByAppendingString:@"_AirPlay"];

                  v39 = [[HMDAccessoryCategoryLogEvent alloc] initWithAccessoryDetailsType:1 accessoryCategoryIdentifier:v18 homeUUID:v4];
                  [v6 addObject:v39];
                }
                else
                {
                  id v40 = v35;
                  if ([v40 conformsToProtocol:&unk_26E4FFCC0]) {
                    v41 = v40;
                  }
                  else {
                    v41 = 0;
                  }
                  id v18 = v41;

                  if (v18)
                  {
                    v42 = [HMDAccessoryCategoryLogEvent alloc];
                    v43 = [v40 category];
                    v44 = [v43 categoryType];
                    v45 = [(HMDAccessoryCategoryLogEvent *)v42 initWithAccessoryDetailsType:3 accessoryCategoryIdentifier:v44 homeUUID:v4];
                    [v6 addObject:v45];
                  }
                  else
                  {
                    v46 = (void *)MEMORY[0x230FBD990]();
                    v47 = v57;
                    v48 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                    {
                      v49 = HMFGetLogIdentifier();
                      *(_DWORD *)buf = 138543618;
                      v75 = v49;
                      __int16 v76 = 2112;
                      id v77 = v40;
                      _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_ERROR, "%{public}@Accessory category not found for: %@", buf, 0x16u);
                    }
                    id v18 = 0;
                  }
                  id v17 = 0;
                }
                id v15 = 0;
              }
              goto LABEL_45;
            }
            id v15 = [v14 hostAccessory];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || !v15)
            {
              id v16 = v4;
              id v17 = +[HMDMetricsUtilities primaryServiceTypeForHAPAccessory:v14];
              v78[0] = v61;
              v78[1] = v60;
              v78[2] = v59;
              id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v78 count:3];
              if ([v14 hasTelevisionService]) {
                goto LABEL_23;
              }
              v19 = [v14 category];
              v20 = [v19 categoryType];
              char v21 = [v18 containsObject:v20];

              if ((v21 & 1) != 0
                || ([v17 isEqual:@"00000228-0000-1000-8000-0026BB765291"] & 1) != 0
                || ([v14 category],
                    v22 = objc_claimAutoreleasedReturnValue(),
                    [v22 categoryType],
                    v23 = objc_claimAutoreleasedReturnValue(),
                    int v24 = [v23 isEqualToString:v58],
                    v23,
                    v22,
                    v24))
              {
LABEL_23:
                uint64_t v25 = 1;
              }
              else
              {
                uint64_t v25 = 3;
              }
              v26 = [HMDAccessoryCategoryLogEvent alloc];
              v27 = [v12 category];
              v28 = [v27 categoryType];
              uint64_t v29 = v25;
              id v4 = v16;
              v30 = [(HMDAccessoryCategoryLogEvent *)v26 initWithAccessoryDetailsType:v29 accessoryCategoryIdentifier:v28 homeUUID:v16];
              v6 = v62;
              [v62 addObject:v30];

LABEL_45:
            }

            ++v11;
          }
          while (v65 != v11);
          uint64_t v50 = [v63 countByEnumeratingWithState:&v66 objects:v79 count:16];
          uint64_t v65 = v50;
          if (!v50)
          {
LABEL_50:

            uint64_t i = v56;
            break;
          }
        }
      }
      uint64_t v55 = [obj countByEnumeratingWithState:&v70 objects:v80 count:16];
    }
    while (v55);
  }

  return v6;
}

- (id)logEventsPopulatedForHomeWithUUID:(id)a3 associatedWithDate:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDMetricsAccessoryDetailsManager *)self accessoryCategoryLogEventsForHomeWithUUID:v6];
  if ([v8 count])
  {
    v9 = +[HMDAccessoryCategoryLogEvent denominatorSpecifyingEvent];
    [v8 addObject:v9];

    int v10 = (void *)[v8 copy];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      int v16 = 138543618;
      id v17 = v14;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Returning NULL (for onboarded configuration) to household metrics request for home with UUID: %@", (uint8_t *)&v16, 0x16u);
    }
    int v10 = 0;
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