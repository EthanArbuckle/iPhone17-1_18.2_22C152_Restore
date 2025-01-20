@interface HMDResidentSelectionStatusKit
+ (id)logCategory;
- (HMDPreferredResidentsList)preferredResidentsList;
- (HMDResidentDevice)elector;
- (HMDResidentDeviceManagerContext)context;
- (HMDResidentSelectionInfo)selectionInfo;
- (HMDResidentSelectionStatusKit)initWithWithContext:(id)a3 residentStatusList:(id)a4;
- (HMDResidentStatus)sourceForPreferredResidentsList;
- (NSArray)sortedResidentStatuses;
- (NSDictionary)residentIDSIdentifierToLocationMap;
- (NSSet)residentStatusList;
- (NSSet)wiredResidentIDSIdentifiers;
- (OS_dispatch_queue)queue;
- (id)comparatorForPreferredResidentsListSource;
- (id)logIdentifier;
- (id)residentIDSIdentifierToLocationMapFrom:(id)a3;
- (id)residentStatusWithValidPreferredResidentsListIn:(id)a3;
- (id)selectionInfoWithLatestTimestampIn:(id)a3;
- (id)sortResidentStatuses:(id)a3;
- (id)wiredResidentIDSIdentifiersIn:(id)a3;
@end

@implementation HMDResidentSelectionStatusKit

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceForPreferredResidentsList, 0);
  objc_storeStrong((id *)&self->_sortedResidentStatuses, 0);
  objc_storeStrong((id *)&self->_residentStatusList, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_wiredResidentIDSIdentifiers, 0);
  objc_storeStrong((id *)&self->_selectionInfo, 0);
  objc_storeStrong((id *)&self->_residentIDSIdentifierToLocationMap, 0);
}

- (HMDResidentStatus)sourceForPreferredResidentsList
{
  return self->_sourceForPreferredResidentsList;
}

- (NSArray)sortedResidentStatuses
{
  return self->_sortedResidentStatuses;
}

- (NSSet)residentStatusList
{
  return self->_residentStatusList;
}

- (HMDResidentDeviceManagerContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  return (HMDResidentDeviceManagerContext *)WeakRetained;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSSet)wiredResidentIDSIdentifiers
{
  return self->_wiredResidentIDSIdentifiers;
}

- (HMDResidentSelectionInfo)selectionInfo
{
  return self->_selectionInfo;
}

- (NSDictionary)residentIDSIdentifierToLocationMap
{
  return self->_residentIDSIdentifierToLocationMap;
}

- (id)logIdentifier
{
  v2 = [(HMDResidentSelectionStatusKit *)self context];
  v3 = [v2 home];
  v4 = [v3 uuid];
  v5 = [v4 UUIDString];

  return v5;
}

- (id)wiredResidentIDSIdentifiersIn:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9C0] set];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __63__HMDResidentSelectionStatusKit_wiredResidentIDSIdentifiersIn___block_invoke;
  v13[3] = &unk_264A2A760;
  id v6 = v5;
  id v14 = v6;
  v7 = (void *)MEMORY[0x230FBD990](objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v13));
  v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v16 = v10;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Wired residents are: %@", buf, 0x16u);
  }
  v11 = (void *)[v6 copy];

  return v11;
}

void __63__HMDResidentSelectionStatusKit_wiredResidentIDSIdentifiersIn___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 networkConnectionType] == 1)
  {
    v3 = *(void **)(a1 + 32);
    id v4 = [v5 idsIdentifier];
    [v3 addObject:v4];
  }
}

- (id)selectionInfoWithLatestTimestampIn:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 allObjects];
  id v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_6_101447];
  v7 = [v6 firstObject];
  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    int v14 = 138543618;
    v15 = v11;
    __int16 v16 = 2112;
    __int16 v17 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Latest selection info on StatusKit is from status: %@", (uint8_t *)&v14, 0x16u);
  }
  v12 = [v7 selectionInfo];

  return v12;
}

uint64_t __68__HMDResidentSelectionStatusKit_selectionInfoWithLatestTimestampIn___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 selectionInfo];
  uint64_t v7 = [v5 selectionInfo];
  v8 = (void *)v7;
  if (v6 | v7) {
    uint64_t v9 = -1;
  }
  else {
    uint64_t v9 = 0;
  }
  if (v7) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = v9;
  }
  if (v6 && v7)
  {
    v11 = [(id)v7 selectionTimestamp];
    v12 = [(id)v6 selectionTimestamp];
    uint64_t v10 = [v11 compare:v12];
  }
  if (!v10)
  {
    v13 = [v4 idsIdentifier];
    int v14 = [v13 UUIDString];
    v15 = [v5 idsIdentifier];
    __int16 v16 = [v15 UUIDString];
    uint64_t v10 = [v14 compare:v16];
  }
  return v10;
}

- (id)residentIDSIdentifierToLocationMapFrom:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = [v3 dictionary];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__HMDResidentSelectionStatusKit_residentIDSIdentifierToLocationMapFrom___block_invoke;
  v9[3] = &unk_264A2A760;
  id v10 = v5;
  id v6 = v5;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v9);

  uint64_t v7 = (void *)[v6 copy];
  return v7;
}

void __72__HMDResidentSelectionStatusKit_residentIDSIdentifierToLocationMapFrom___block_invoke(uint64_t a1, void *a2)
{
  v3 = NSNumber;
  id v4 = a2;
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "location"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = *(void **)(a1 + 32);
  id v6 = [v4 idsIdentifier];

  [v5 setObject:v7 forKeyedSubscript:v6];
}

- (id)comparatorForPreferredResidentsListSource
{
  return &__block_literal_global_101453;
}

uint64_t __74__HMDResidentSelectionStatusKit_comparatorForPreferredResidentsListSource__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v5 swVersion];
  id v7 = [v4 swVersion];
  uint64_t v8 = [v6 compare:v7];

  if (!v8)
  {
    uint64_t v9 = [v4 idsIdentifier];
    id v10 = [v9 UUIDString];
    v11 = [v5 idsIdentifier];
    v12 = [v11 UUIDString];
    uint64_t v8 = [v10 compare:v12];
  }
  return v8;
}

- (id)sortResidentStatuses:(id)a3
{
  id v4 = [a3 allObjects];
  id v5 = [(HMDResidentSelectionStatusKit *)self comparatorForPreferredResidentsListSource];
  id v6 = [v4 sortedArrayUsingComparator:v5];

  return v6;
}

- (HMDResidentDevice)elector
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [(HMDResidentSelectionStatusKit *)self sortedResidentStatuses];
  id v4 = [v3 firstObject];

  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v15 = 138543618;
    __int16 v16 = v8;
    __int16 v17 = 2112;
    uint64_t v18 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Elector's resident status: %@", (uint8_t *)&v15, 0x16u);
  }
  if (v4)
  {
    uint64_t v9 = (void *)MEMORY[0x263EFFA08];
    id v10 = [(HMDResidentSelectionStatusKit *)v6 context];
    v11 = [v10 availableResidentDevices];
    v12 = [v9 setWithArray:v11];
    v13 = [v4 matchingDeviceFromResidentDevices:v12];
  }
  else
  {
    v13 = 0;
  }

  return (HMDResidentDevice *)v13;
}

- (id)residentStatusWithValidPreferredResidentsListIn:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __81__HMDResidentSelectionStatusKit_residentStatusWithValidPreferredResidentsListIn___block_invoke;
  v11[3] = &unk_264A1E558;
  v11[4] = self;
  id v5 = objc_msgSend(v4, "na_firstObjectPassingTest:", v11);
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v13 = v9;
    __int16 v14 = 2112;
    int v15 = v5;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Preferred source for residents list: %@", buf, 0x16u);
  }

  return v5;
}

BOOL __81__HMDResidentSelectionStatusKit_residentStatusWithValidPreferredResidentsListIn___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 preferredResidentsList];
  id v5 = [v4 residentIDSIdentifiers];
  uint64_t v6 = [v5 count];

  if (!v6)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      v13 = v10;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Preferred residents list is missing in: %@. Moving to next one.", (uint8_t *)&v12, 0x16u);
    }
  }

  return v6 != 0;
}

- (HMDPreferredResidentsList)preferredResidentsList
{
  v2 = [(HMDResidentSelectionStatusKit *)self sourceForPreferredResidentsList];
  id v3 = [v2 preferredResidentsList];

  return (HMDPreferredResidentsList *)v3;
}

- (HMDResidentSelectionStatusKit)initWithWithContext:(id)a3 residentStatusList:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)HMDResidentSelectionStatusKit;
  id v8 = [(HMDResidentSelectionStatusKit *)&v24 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_context, v6);
    uint64_t v10 = [v6 queue];
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v9->_residentStatusList, a4);
    int v12 = [(HMDResidentSelectionStatusKit *)v9 sortResidentStatuses:v7];
    sortedResidentStatuses = v9->_sortedResidentStatuses;
    v9->_sortedResidentStatuses = v12;
    __int16 v14 = v12;

    uint64_t v15 = [(HMDResidentSelectionStatusKit *)v9 residentStatusWithValidPreferredResidentsListIn:v14];
    sourceForPreferredResidentsList = v9->_sourceForPreferredResidentsList;
    v9->_sourceForPreferredResidentsList = (HMDResidentStatus *)v15;

    uint64_t v17 = [(HMDResidentSelectionStatusKit *)v9 residentIDSIdentifierToLocationMapFrom:v7];
    residentIDSIdentifierToLocationMap = v9->_residentIDSIdentifierToLocationMap;
    v9->_residentIDSIdentifierToLocationMap = (NSDictionary *)v17;

    uint64_t v19 = [(HMDResidentSelectionStatusKit *)v9 selectionInfoWithLatestTimestampIn:v7];
    selectionInfo = v9->_selectionInfo;
    v9->_selectionInfo = (HMDResidentSelectionInfo *)v19;

    uint64_t v21 = [(HMDResidentSelectionStatusKit *)v9 wiredResidentIDSIdentifiersIn:v7];
    wiredResidentIDSIdentifiers = v9->_wiredResidentIDSIdentifiers;
    v9->_wiredResidentIDSIdentifiers = (NSSet *)v21;
  }
  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5_101466 != -1) {
    dispatch_once(&logCategory__hmf_once_t5_101466, &__block_literal_global_10_101467);
  }
  v2 = (void *)logCategory__hmf_once_v6_101468;
  return v2;
}

void __44__HMDResidentSelectionStatusKit_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v6_101468;
  logCategory__hmf_once_v6_101468 = v0;
}

@end