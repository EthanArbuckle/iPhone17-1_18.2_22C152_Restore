@interface HMMTRHAPEnumerator
+ (id)logCategory;
- (HMMTRHAPEnumerator)initWithClusterIDCharacteristicMap:(id)a3;
- (NSDictionary)clusterIDCharacteristicMap;
- (id)_createBridgedHAPAccessoryWithServer:(id)a3 services:(id)a4 instanceId:(id)a5 endpointID:(id)a6;
- (id)_serviceLabelIndexMapForDescriptions:(id)a3;
- (id)enumerateBridgedAccessoriesFromAccessories:(id)a3 serviceDescriptionsDictionary:(id)a4 namesDictionary:(id)a5 topology:(id)a6 server:(id)a7 legacyInstanceIDAssignment:(BOOL)a8;
- (id)enumerateServicesFromServices:(id)a3 serviceDescriptionsDictionary:(id)a4 topology:(id)a5 nodeID:(id)a6 primaryAccessory:(id)a7 legacyInstanceIDAssignment:(BOOL)a8;
- (void)_createHAPServicesFromServiceDescriptions:(id)a3 topology:(id)a4 nodeID:(id)a5 accessoryEndpointID:(id)a6 services:(id)a7 startingServiceInstanceID:(int64_t *)a8 primaryAccessory:(id)a9 standaloneServiceLabelIndexMap:(id)a10;
- (void)setClusterIDCharacteristicMap:(id)a3;
@end

@implementation HMMTRHAPEnumerator

- (void).cxx_destruct
{
}

- (void)setClusterIDCharacteristicMap:(id)a3
{
}

- (NSDictionary)clusterIDCharacteristicMap
{
  return self->_clusterIDCharacteristicMap;
}

- (id)_createBridgedHAPAccessoryWithServer:(id)a3 services:(id)a4 instanceId:(id)a5 endpointID:(id)a6
{
  id v8 = a3;
  v9 = (objc_class *)MEMORY[0x263F35860];
  id v10 = a5;
  id v11 = a4;
  v12 = (void *)[[v9 alloc] initWithServer:v8 instanceID:v10 parsedServices:v11];

  if (v12)
  {
    v13 = [v8 nodeID];
    v14 = +[HMMTRUtilities identifierStringWithCHIPNodeID:v13];
    [v12 setIdentifier:v14];

    v15 = [v8 primaryAccessory];
    v16 = [v15 serverIdentifier];
    [v12 setServerIdentifier:v16];

    [v12 setPrimary:0];
  }

  return v12;
}

- (void)_createHAPServicesFromServiceDescriptions:(id)a3 topology:(id)a4 nodeID:(id)a5 accessoryEndpointID:(id)a6 services:(id)a7 startingServiceInstanceID:(int64_t *)a8 primaryAccessory:(id)a9 standaloneServiceLabelIndexMap:(id)a10
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v66 = a4;
  id v67 = a5;
  id v61 = a6;
  id v64 = a7;
  id v15 = a9;
  *((void *)&v62 + 1) = a10;
  v63 = [MEMORY[0x263EFF980] array];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id obj = v14;
  uint64_t v69 = [obj countByEnumeratingWithState:&v75 objects:v85 count:16];
  if (v69)
  {
    uint64_t v68 = *(void *)v76;
    *(void *)&unsigned long long v62 = 1;
    v16 = a8;
    do
    {
      for (uint64_t i = 0; i != v69; ++i)
      {
        if (*(void *)v76 != v68) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        v19 = [v18 serviceType];
        v74 = [v18 endpoint];
        v20 = (void *)MEMORY[0x263EFF980];
        v21 = [v18 requiredCharacteristics];
        v22 = [v20 arrayWithArray:v21];

        v23 = [v18 optionalCharacteristics];
        [v22 addObjectsFromArray:v23];

        if ([v22 count])
        {
          v73 = v19;
          if ([v18 optionalServiceLabelIndexIncluded])
          {
            if (*((void *)&v62 + 1))
            {
              v24 = [v18 endpoint];
              v25 = [v24 stringValue];
              uint64_t v26 = [*((id *)&v62 + 1) valueForKey:v25];
            }
            else
            {
              uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
              *(void *)&unsigned long long v62 = v62 + 1;
              v16 = a8;
            }
            v32 = (void *)MEMORY[0x2533B64D0]();
            v33 = self;
            v34 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              v35 = HMFGetLogIdentifier();
              v36 = [v18 endpoint];
              *(_DWORD *)buf = 138543874;
              v80 = v35;
              __int16 v81 = 2112;
              uint64_t v82 = v26;
              __int16 v83 = 2112;
              id v84 = v36;
              _os_log_impl(&dword_252495000, v34, OS_LOG_TYPE_INFO, "%{public}@Service label index enumerated to %@ for endpoint %@", buf, 0x20u);
            }
            id v31 = v63;
          }
          else
          {
            uint64_t v26 = 0;
            id v31 = (id)MEMORY[0x263EFFA68];
          }
          v37 = (void *)MEMORY[0x2533B64D0]();
          v38 = self;
          v39 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            v40 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v80 = v40;
            __int16 v81 = 2112;
            uint64_t v82 = (uint64_t)v22;
            __int16 v83 = 2112;
            id v84 = v67;
            _os_log_impl(&dword_252495000, v39, OS_LOG_TYPE_INFO, "%{public}@Will construct service with characteristics %@ for nodeID %@", buf, 0x20u);
          }
          if (v16)
          {
            v41 = [NSNumber numberWithInteger:*v16];
          }
          else
          {
            v41 = 0;
          }
          v42 = [(HMMTRHAPEnumerator *)v38 clusterIDCharacteristicMap];
          v71 = v31;
          id v60 = v31;
          v43 = (void *)v26;
          v44 = +[HMMTRAccessoryServerFactory createHMMTRHAPServiceCommon:v73 characteristics:v22 serviceLabelIndex:v26 serviceInstanceID:v41 endpointID:v74 nodeID:v67 topology:v66 clusterIDCharacteristicMap:v42 linkedServices:v60];

          if (v15) {
            uint64_t v45 = [v44 setAccessory:v15];
          }
          id v46 = v15;
          v47 = (void *)MEMORY[0x2533B64D0](v45);
          v48 = v38;
          v49 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            v50 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v80 = v50;
            __int16 v81 = 2112;
            uint64_t v82 = (uint64_t)v44;
            __int16 v83 = 2112;
            id v84 = v74;
            _os_log_impl(&dword_252495000, v49, OS_LOG_TYPE_INFO, "%{public}@Constructed new service to add %@ at endpoint %@", buf, 0x20u);

            v16 = a8;
          }

          id v15 = v46;
          if (v44)
          {
            if (v16)
            {
              int64_t v51 = *a8;
              v52 = [v44 characteristics];
              v16 = a8;
              *a8 = +[HMMTRUtilities nextServiceInstanceID:previousCharacteristicsCount:](HMMTRUtilities, "nextServiceInstanceID:previousCharacteristicsCount:", v51, [v52 count]);
            }
            [v64 addObject:v44];
          }

          v19 = v73;
        }
        else
        {
          v27 = (void *)MEMORY[0x2533B64D0]();
          v28 = self;
          v29 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            v30 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v80 = v30;
            __int16 v81 = 2112;
            uint64_t v82 = (uint64_t)v19;
            __int16 v83 = 2112;
            id v84 = v74;
            _os_log_impl(&dword_252495000, v29, OS_LOG_TYPE_INFO, "%{public}@Not constructing new service of type %@ as there are no supported characteristics at endpoint %@", buf, 0x20u);

            v16 = a8;
          }
        }
      }
      uint64_t v69 = [obj countByEnumeratingWithState:&v75 objects:v85 count:16];
    }
    while (v69);
  }
  else
  {
    *(void *)&unsigned long long v62 = 1;
  }

  if (v62 >= 2)
  {
    v53 = (void *)MEMORY[0x2533B64D0]();
    v54 = self;
    v55 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      v56 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v80 = v56;
      __int16 v81 = 2112;
      uint64_t v82 = (uint64_t)v61;
      _os_log_impl(&dword_252495000, v55, OS_LOG_TYPE_INFO, "%{public}@Constructed Service Label service at endpoint %@", buf, 0x16u);
    }
    v57 = +[HMMTRAccessoryServerFactory createHMMTRHAPServiceLabelServiceWithEndpointID:v61 nodeID:v67];
    v58 = v57;
    if (v15) {
      [v57 setAccessory:v15];
    }
    [v64 addObject:v58];
    v59 = [v58 instanceID];
    [v63 addObject:v59];
  }
}

- (id)enumerateBridgedAccessoriesFromAccessories:(id)a3 serviceDescriptionsDictionary:(id)a4 namesDictionary:(id)a5 topology:(id)a6 server:(id)a7 legacyInstanceIDAssignment:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v55 = a5;
  id v54 = a6;
  id v16 = a7;
  v48 = v14;
  id v49 = [MEMORY[0x263EFF980] arrayWithArray:v14];
  int64_t v66 = 20;
  BOOL v53 = v8;
  v17 = &v66;
  long long v62 = 0u;
  long long v63 = 0u;
  if (!v8) {
    v17 = 0;
  }
  v52 = v17;
  long long v64 = 0uLL;
  long long v65 = 0uLL;
  v57 = v15;
  v18 = v15;
  v19 = self;
  id obj = [v18 allKeys];
  uint64_t v59 = [obj countByEnumeratingWithState:&v62 objects:v71 count:16];
  if (v59)
  {
    uint64_t v56 = *(void *)v63;
    unint64_t v20 = 0x263F08000uLL;
    v21 = &off_265374000;
    int64_t v51 = v19;
    v58 = v16;
    do
    {
      for (uint64_t i = 0; i != v59; ++i)
      {
        if (*(void *)v63 != v56) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        v24 = [v57 objectForKey:v23];
        v25 = objc_opt_new();
        if ([v24 count])
        {
          id v61 = v24;
          uint64_t v26 = [v55 objectForKey:v23];
          v27 = v26;
          if (!v26 || [v26 isEqual:&stru_2702A0B38])
          {
            uint64_t v28 = [NSString stringWithFormat:@"%@,%@", @"Matter Accessory", v23];

            v27 = (void *)v28;
          }
          uint64_t v29 = +[HMMTRUtilities sanitizeHAPName:v27];

          v30 = objc_msgSend(*(id *)(v20 + 2584), "numberWithInteger:", objc_msgSend(v23, "integerValue"));
          id v31 = v21[61];
          int64_t v32 = v66;
          v33 = [v16 nodeID];
          LOBYTE(v47) = v53;
          id v60 = (void *)v29;
          v34 = [v31 createInfoService:v29 model:@"Unknown" manufacturer:@"Unknown" serialNumber:@"Unknown" instanceID:v32 endpointID:v30 nodeID:v33 legacyInstanceIDAssignment:v47];

          [v25 addObject:v34];
          int64_t v35 = v66;
          v36 = [v34 characteristics];
          int64_t v66 = +[HMMTRUtilities nextServiceInstanceID:previousCharacteristicsCount:](HMMTRUtilities, "nextServiceInstanceID:previousCharacteristicsCount:", v35, [v36 count]);

          id v16 = v58;
          v37 = [v58 nodeID];
          [(HMMTRHAPEnumerator *)v51 _createHAPServicesFromServiceDescriptions:v61 topology:v54 nodeID:v37 accessoryEndpointID:v30 services:v25 startingServiceInstanceID:v52 primaryAccessory:0 standaloneServiceLabelIndexMap:0];

          if (v53)
          {
            v38 = [NSNumber numberWithInteger:v66];
          }
          else
          {
            v39 = v21[61];
            v40 = [v58 nodeID];
            v38 = [v39 instanceIDForCharacteristicType:0 serviceType:0 endpointID:v30 nodeID:v40];
          }
          v41 = [(HMMTRHAPEnumerator *)v51 _createBridgedHAPAccessoryWithServer:v58 services:v25 instanceId:v38 endpointID:v30];
          if (v41)
          {
            v42 = (void *)MEMORY[0x2533B64D0]([v49 addObject:v41]);
            v43 = v51;
            v44 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              uint64_t v45 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              uint64_t v68 = v45;
              __int16 v69 = 2112;
              v70 = v41;
              _os_log_impl(&dword_252495000, v44, OS_LOG_TYPE_INFO, "%{public}@Constructed bridge accessory @%@", buf, 0x16u);
            }
            id v16 = v58;
            v21 = &off_265374000;
          }

          unint64_t v20 = 0x263F08000;
          v24 = v61;
        }
      }
      uint64_t v59 = [obj countByEnumeratingWithState:&v62 objects:v71 count:16];
    }
    while (v59);
  }

  return v49;
}

- (id)enumerateServicesFromServices:(id)a3 serviceDescriptionsDictionary:(id)a4 topology:(id)a5 nodeID:(id)a6 primaryAccessory:(id)a7 legacyInstanceIDAssignment:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v49 = a3;
  id v14 = a4;
  id v52 = a5;
  id v51 = a6;
  id v54 = a7;
  uint64_t v64 = 20;
  if (v8) {
    id v15 = &v64;
  }
  else {
    id v15 = 0;
  }
  id v55 = objc_opt_new();
  BOOL v53 = [(HMMTRHAPEnumerator *)self _serviceLabelIndexMapForDescriptions:v14];
  id v16 = (void *)MEMORY[0x2533B64D0]();
  v17 = self;
  v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    uint64_t v68 = v19;
    __int16 v69 = 2112;
    id v70 = v54;
    __int16 v71 = 2112;
    uint64_t v72 = v53;
    _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_INFO, "%{public}@Computed service label index map for non-bridged accessory %@ : %@", buf, 0x20u);
  }
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  unint64_t v20 = [v14 allValues];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v60 objects:v66 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v61 != v23) {
          objc_enumerationMutation(v20);
        }
        [(HMMTRHAPEnumerator *)v17 _createHAPServicesFromServiceDescriptions:*(void *)(*((void *)&v60 + 1) + 8 * i) topology:v52 nodeID:v51 accessoryEndpointID:&unk_2702B5028 services:v55 startingServiceInstanceID:v15 primaryAccessory:v54 standaloneServiceLabelIndexMap:v53];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v60 objects:v66 count:16];
    }
    while (v22);
  }

  v25 = v55;
  if ([v55 count])
  {
    id v48 = v14;
    uint64_t v26 = objc_opt_new();
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v27 = v49;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v56 objects:v65 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v57;
      do
      {
        uint64_t v31 = 0;
        uint64_t v50 = v29;
        do
        {
          if (*(void *)v57 != v30) {
            objc_enumerationMutation(v27);
          }
          int64_t v32 = *(void **)(*((void *)&v56 + 1) + 8 * v31);
          v33 = [v32 instanceID];
          unint64_t v34 = [v33 unsignedLongLongValue];

          if (v34 > 0x13)
          {
            int64_t v35 = (void *)MEMORY[0x2533B64D0]();
            v36 = v17;
            v37 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              uint64_t v38 = v30;
              v39 = v17;
              id v40 = v27;
              v42 = v41 = v26;
              *(_DWORD *)buf = 138543618;
              uint64_t v68 = v42;
              __int16 v69 = 2112;
              id v70 = v32;
              _os_log_impl(&dword_252495000, v37, OS_LOG_TYPE_INFO, "%{public}@Dropping existing service %@", buf, 0x16u);

              uint64_t v26 = v41;
              id v27 = v40;
              v17 = v39;
              uint64_t v30 = v38;
              uint64_t v29 = v50;
            }
          }
          else
          {
            [v26 addObject:v32];
          }
          ++v31;
        }
        while (v29 != v31);
        uint64_t v29 = [v27 countByEnumeratingWithState:&v56 objects:v65 count:16];
      }
      while (v29);
    }

    v25 = v55;
    [v26 addObjectsFromArray:v55];
    id v14 = v48;
  }
  else
  {
    v43 = (void *)MEMORY[0x2533B64D0]();
    v44 = v17;
    uint64_t v45 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      id v46 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v68 = v46;
      _os_log_impl(&dword_252495000, v45, OS_LOG_TYPE_ERROR, "%{public}@Could not construct any of the services.", buf, 0xCu);
    }
    uint64_t v26 = 0;
  }

  return v26;
}

- (id)_serviceLabelIndexMapForDescriptions:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v22 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = [v3 allKeys];
  v5 = [v4 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    uint64_t v9 = 1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        v12 = [v3 objectForKey:v11];
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v24;
          while (2)
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v24 != v16) {
                objc_enumerationMutation(v13);
              }
              if ([*(id *)(*((void *)&v23 + 1) + 8 * j) optionalServiceLabelIndexIncluded])
              {
                v18 = [NSNumber numberWithUnsignedInteger:v9];
                [v22 setValue:v18 forKey:v11];

                ++v9;
                goto LABEL_16;
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }
LABEL_16:
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v7);
  }

  if ([v22 count]) {
    id v19 = v22;
  }
  else {
    id v19 = 0;
  }

  return v19;
}

- (HMMTRHAPEnumerator)initWithClusterIDCharacteristicMap:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMMTRHAPEnumerator;
  uint64_t v6 = [(HMMTRHAPEnumerator *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_clusterIDCharacteristicMap, a3);
  }

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9 != -1) {
    dispatch_once(&logCategory__hmf_once_t9, &__block_literal_global_365);
  }
  v2 = (void *)logCategory__hmf_once_v10;
  return v2;
}

uint64_t __33__HMMTRHAPEnumerator_logCategory__block_invoke()
{
  logCategory__hmf_once_id v10 = HMFCreateOSLogHandle();
  return MEMORY[0x270F9A758]();
}

@end