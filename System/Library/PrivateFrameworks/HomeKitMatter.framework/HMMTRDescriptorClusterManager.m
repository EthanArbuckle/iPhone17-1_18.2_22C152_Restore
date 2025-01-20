@interface HMMTRDescriptorClusterManager
+ (id)logCategory;
+ (id)sharedManager;
- (HMMTRDescriptorClusterManager)init;
- (HMMTRProtocolMap)protocolMap;
- (id)_buildClustersInUseDictWithClustersInUse:(id)a3;
- (id)_fetchStateCaptureInformationForDevice:(id)a3 endpointID:(id)a4 callbackQueue:(id)a5;
- (id)_fetchStateCaptureInformationForDevice:(id)a3 endpointID:(id)a4 clusterID:(id)a5 callbackQueue:(id)a6;
- (id)buildClusterDescriptorWithDevice:(id)a3 endpointID:(id)a4 queue:(id)a5;
- (id)createClusterInstance;
- (id)fetchClientClustersForDevice:(id)a3 endpointID:(id)a4 callbackQueue:(id)a5;
- (id)fetchClusterAcceptedCommandsForDevice:(id)a3 endpointID:(id)a4 clusterID:(id)a5 callbackQueue:(id)a6;
- (id)fetchClusterAttributesForDevice:(id)a3 endpointID:(id)a4 clusterID:(id)a5 callbackQueue:(id)a6;
- (id)fetchClusterEventListForDevice:(id)a3 endpointID:(id)a4 clusterID:(id)a5 callbackQueue:(id)a6;
- (id)fetchClusterFeatureMapForDevice:(id)a3 endpointID:(id)a4 clusterID:(id)a5 callbackQueue:(id)a6;
- (id)fetchClusterGeneratedCommandsForDevice:(id)a3 endpointID:(id)a4 clusterID:(id)a5 callbackQueue:(id)a6;
- (id)fetchClusterRevisionForDevice:(id)a3 endpointID:(id)a4 clusterID:(id)a5 callbackQueue:(id)a6;
- (id)fetchDeviceTypesWithMTRDevice:(id)a3 endpointID:(id)a4 callbackQueue:(id)a5;
- (id)fetchPartsListForDevice:(id)a3 endpointID:(id)a4 callbackQueue:(id)a5;
- (id)fetchServerClustersForDevice:(id)a3 endpointID:(id)a4 callbackQueue:(id)a5;
- (id)getBridgeEndpointsDeviceTypes:(id)a3 endpointDeviceTypes:(id)a4;
- (id)hapServiceDescriptionForServiceType:(id)a3 clustersInUse:(id)a4 endpoint:(id)a5 name:(id)a6 hapToCHIPClusterMappingArray:(id)a7 clusterClassesToQuery:(id)a8 hapServicesToCheckForFeatureMap:(id)a9 hapServicesToCheckForOptionalMatterAttribute:(id)a10 server:(id)a11;
- (id)hapServiceDescriptionsForTopology:(id)a3 namesDictionary:(id)a4 server:(id)a5;
- (id)runBlockForAllEndpointsWithClusterID:(id)a3 device:(id)a4 callbackQueue:(id)a5 block:(id)a6;
- (id)runBlockForAllEndpointsWithClusterID:(id)a3 mtrDevice:(id)a4 callbackQueue:(id)a5 block:(id)a6;
- (void)_populateAttributeValuesForClusterClassName:(id)a3 clusterClassFeatureMap:(id)a4 endpoint:(id)a5 device:(id)a6 deviceTopology:(id)a7 callbackQueue:(id)a8 completionHandler:(id)a9;
- (void)_queryEndpointsForClusterID:(id)a3 endpoints:(id)a4 device:(id)a5 callbackQueue:(id)a6 completionHandler:(id)a7;
- (void)_queryEndpointsForClusterID:(id)a3 endpoints:(id)a4 mtrDevice:(id)a5 callbackQueue:(id)a6 completionHandler:(id)a7;
- (void)_queryFeatureMapFromClusterAtCHIPEndpoint:(id)a3 device:(id)a4 callbackQueue:(id)a5 clusterClassName:(id)a6 completionHandler:(id)a7;
- (void)_querySupportedAttributesFromClusterAtCHIPEndpoint:(id)a3 device:(id)a4 callbackQueue:(id)a5 clusterClassName:(id)a6 completionHandler:(id)a7;
- (void)_removeDisabledCharacteristicsFromServiceDescription:(id)a3 endpoint:(id)a4 topology:(id)a5;
- (void)_runBlockForAllEndpointsWithClusterID:(id)a3 endpoints:(id)a4 device:(id)a5 callbackQueue:(id)a6 finishedRunningAllBlocksPromise:(id)a7 block:(id)a8;
- (void)_runBlockForAllEndpointsWithClusterID:(id)a3 endpoints:(id)a4 mtrDevice:(id)a5 callbackQueue:(id)a6 finishedRunningAllBlocksPromise:(id)a7 block:(id)a8;
- (void)_updateOTARequestorEndpointsInTopology:(id)a3 device:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6;
- (void)_verifyHAPCharacteristicSupportAtCHIPEndpoint:(id)a3 device:(id)a4 endpointDeviceTypes:(id)a5 callbackQueue:(id)a6 clusterClassToQueryForFeatureMap:(id)a7 hapServicesToCheckForFeatureMap:(id)a8 hapServicesInUse:(id)a9 deviceTopology:(id)a10 bridgeAggregateNodeEndpoint:(id)a11 server:(id)a12 lastError:(id)a13 completionHandler:(id)a14;
- (void)_verifyHAPOptionalCharacteristicSupportAtCHIPEndpoint:(id)a3 device:(id)a4 endpointDeviceTypes:(id)a5 callbackQueue:(id)a6 clusterClassToQueryForAttributes:(id)a7 hapServicesToCheckForOptionalMatterAttribute:(id)a8 clusterAttributesSupported:(id)a9 hapServicesInUse:(id)a10 deviceTopology:(id)a11 bridgeAggregateNodeEndpoint:(id)a12 server:(id)a13 lastError:(id)a14 completionHandler:(id)a15;
- (void)endpointForClusterID:(id)a3 device:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6;
- (void)endpointForClusterID:(id)a3 mtrDevice:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6;
- (void)fetchDeviceTypesForDevice:(id)a3 atEndpoint:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6;
- (void)fetchDeviceTypesForEndpoints:(id)a3 device:(id)a4 endpointDeviceTypes:(id)a5 lastError:(id)a6 callbackQueue:(id)a7 completionHandler:(id)a8;
- (void)fetchDeviceTypesForEndpoints:(id)a3 mtrDevice:(id)a4 endpointDeviceTypes:(id)a5 lastError:(id)a6 callbackQueue:(id)a7 completionHandler:(id)a8;
- (void)fetchDeviceTypesWithMTRDevice:(id)a3 atEndpoint:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6;
- (void)fetchEndpointsForDevice:(id)a3 endpointID:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6;
- (void)fetchEndpointsWithMTRDevice:(id)a3 endpointID:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6;
- (void)fetchHAPCategoryForCHIPDevice:(id)a3 nodeId:(id)a4 server:(id)a5 callbackQueue:(id)a6 completionHandler:(id)a7;
- (void)fetchHAPCategoryWithMTRDevice:(id)a3 nodeId:(id)a4 server:(id)a5 callbackQueue:(id)a6 completionHandler:(id)a7;
- (void)fetchHAPServicesAtCHIPEndpoint:(id)a3 deviceTopology:(id)a4 endpointDeviceTypes:(id)a5 accessoryInfo:(id)a6 hapToCHIPClusterMappingArray:(id)a7 device:(id)a8 isBridge:(BOOL)a9 bridgeAggregateNodeEndpoint:(id)a10 isComposedDevice:(BOOL)a11 server:(id)a12 callbackQueue:(id)a13 completionHandler:(id)a14;
- (void)fetchHAPServicesForEndpoints:(id)a3 endpointDeviceTypes:(id)a4 device:(id)a5 nodeId:(id)a6 isBridge:(BOOL)a7 bridgeAggregateNodeEndpoint:(id)a8 server:(id)a9 topology:(id)a10 hapAccessoryInfo:(id)a11 callbackQueue:(id)a12 completionHandler:(id)a13;
- (void)fetchHAPServicesWithMTRDevice:(id)a3 nodeId:(id)a4 server:(id)a5 callbackQueue:(id)a6 completionHandler:(id)a7;
- (void)fetchStateCaptureInformationForDevice:(id)a3 nodeId:(id)a4 server:(id)a5 callbackQueue:(id)a6 completionHandler:(id)a7;
- (void)queryEndpointForClusterID:(id)a3 endpoint:(id)a4 device:(id)a5 callbackQueue:(id)a6 completionHandler:(id)a7;
- (void)setCreateClusterInstance:(id)a3;
@end

@implementation HMMTRDescriptorClusterManager

- (void).cxx_destruct
{
}

- (void)setCreateClusterInstance:(id)a3
{
}

- (id)createClusterInstance
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)_runBlockForAllEndpointsWithClusterID:(id)a3 endpoints:(id)a4 mtrDevice:(id)a5 callbackQueue:(id)a6 finishedRunningAllBlocksPromise:(id)a7 block:(id)a8
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if ([v15 count])
  {
    v20 = (void *)[objc_alloc(MEMORY[0x263F42520]) initWithQueue:v17];
    *(void *)buf = _HMFThreadLocalAsyncContextPush();
    v21 = (void *)MEMORY[0x263F42538];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __143__HMMTRDescriptorClusterManager__runBlockForAllEndpointsWithClusterID_endpoints_mtrDevice_callbackQueue_finishedRunningAllBlocksPromise_block___block_invoke;
    v29[3] = &unk_265376340;
    v29[4] = self;
    id v30 = v16;
    id v31 = v17;
    id v32 = v14;
    id v33 = v19;
    v22 = objc_msgSend(v15, "na_map:", v29);
    v23 = [v21 allSettled:v22];
    v24 = [v23 ignoreResult];

    [v18 resolveWithFuture:v24];
    _HMFThreadLocalAsyncContextPop();
  }
  else
  {
    v25 = (void *)MEMORY[0x2533B64D0]();
    v26 = self;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v28;
      __int16 v35 = 2112;
      id v36 = v14;
      _os_log_impl(&dword_252495000, v27, OS_LOG_TYPE_INFO, "%{public}@Cluster ID %@ not found at any endpoints", buf, 0x16u);
    }
    v20 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    [v18 rejectWithError:v20];
  }
}

id __143__HMMTRDescriptorClusterManager__runBlockForAllEndpointsWithClusterID_endpoints_mtrDevice_callbackQueue_finishedRunningAllBlocksPromise_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) buildClusterDescriptorWithDevice:*(void *)(a1 + 40) endpointID:v3 queue:*(void *)(a1 + 48)];
  id v5 = objc_alloc_init(MEMORY[0x263F10FA0]);
  v6 = [v4 readAttributeServerListWithParams:v5];

  id v7 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v6 forIdentify:@"serverList"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    if ([v9 containsObject:*(void *)(a1 + 56)]) {
      id v10 = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x2533B64D0]();
    id v12 = *(id *)(a1 + 32);
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      int v17 = 138543618;
      id v18 = v14;
      __int16 v19 = 2112;
      id v20 = v3;
      _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_ERROR, "%{public}@ServerList attribute at endpoint %@ absent from cache", (uint8_t *)&v17, 0x16u);
    }
  }
  id v15 = [MEMORY[0x263F42538] futureWithNoValue];

  return v15;
}

- (void)_runBlockForAllEndpointsWithClusterID:(id)a3 endpoints:(id)a4 device:(id)a5 callbackQueue:(id)a6 finishedRunningAllBlocksPromise:(id)a7 block:(id)a8
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if ([v15 count])
  {
    id v20 = (void *)[objc_alloc(MEMORY[0x263F42520]) initWithQueue:v17];
    *(void *)buf = _HMFThreadLocalAsyncContextPush();
    uint64_t v21 = (void *)MEMORY[0x263F42538];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __140__HMMTRDescriptorClusterManager__runBlockForAllEndpointsWithClusterID_endpoints_device_callbackQueue_finishedRunningAllBlocksPromise_block___block_invoke;
    v29[3] = &unk_265376340;
    id v30 = v16;
    id v31 = v17;
    id v32 = v14;
    id v33 = self;
    id v34 = v19;
    v22 = objc_msgSend(v15, "na_map:", v29);
    v23 = [v21 allSettled:v22];
    v24 = [v23 ignoreResult];

    [v18 resolveWithFuture:v24];
    _HMFThreadLocalAsyncContextPop();
  }
  else
  {
    v25 = (void *)MEMORY[0x2533B64D0]();
    v26 = self;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v28;
      __int16 v36 = 2112;
      id v37 = v14;
      _os_log_impl(&dword_252495000, v27, OS_LOG_TYPE_INFO, "%{public}@Cluster ID %@ not found at any endpoints", buf, 0x16u);
    }
    id v20 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    [v18 rejectWithError:v20];
  }
}

id __140__HMMTRDescriptorClusterManager__runBlockForAllEndpointsWithClusterID_endpoints_device_callbackQueue_finishedRunningAllBlocksPromise_block___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x263F10C80]), "initWithDevice:endpoint:queue:", *(void *)(a1 + 32), objc_msgSend(v3, "unsignedShortValue"), *(void *)(a1 + 40));
  id v16 = 0;
  id v5 = [MEMORY[0x263F42538] futureWithPromise:&v16];
  v6 = [v16 resolverBlock];
  [v4 readAttributeServerListWithCompletionHandler:v6];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __140__HMMTRDescriptorClusterManager__runBlockForAllEndpointsWithClusterID_endpoints_device_callbackQueue_finishedRunningAllBlocksPromise_block___block_invoke_2;
  v12[3] = &unk_2653762F0;
  id v13 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 64);
  id v14 = v3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __140__HMMTRDescriptorClusterManager__runBlockForAllEndpointsWithClusterID_endpoints_device_callbackQueue_finishedRunningAllBlocksPromise_block___block_invoke_3;
  v10[3] = &unk_265376318;
  v10[4] = *(void *)(a1 + 56);
  id v11 = v14;
  id v7 = v14;
  v8 = [v5 then:v12 orRecover:v10];

  return v8;
}

uint64_t __140__HMMTRDescriptorClusterManager__runBlockForAllEndpointsWithClusterID_endpoints_device_callbackQueue_finishedRunningAllBlocksPromise_block___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 containsObject:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
  id v4 = [MEMORY[0x263F42538] futureWithNoValue];
  }
  id v5 = v4;
  if (v4)
  {

    return 3;
  }
  else
  {
    uint64_t v7 = _HMFPreconditionFailure();
    return __140__HMMTRDescriptorClusterManager__runBlockForAllEndpointsWithClusterID_endpoints_device_callbackQueue_finishedRunningAllBlocksPromise_block___block_invoke_3(v7);
  }
}

uint64_t __140__HMMTRDescriptorClusterManager__runBlockForAllEndpointsWithClusterID_endpoints_device_callbackQueue_finishedRunningAllBlocksPromise_block___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    int v13 = 138543874;
    id v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to get clusters at endpoint %@: %@", (uint8_t *)&v13, 0x20u);
  }
  id v9 = v3;
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

- (void)_queryEndpointsForClusterID:(id)a3 endpoints:(id)a4 mtrDevice:(id)a5 callbackQueue:(id)a6 completionHandler:(id)a7
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v34 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  __int16 v15 = (void (**)(id, void *, void))a7;
  if ([v12 count])
  {
    uint64_t v16 = [v12 popFirstObject];
    id v33 = v13;
    __int16 v17 = [(HMMTRDescriptorClusterManager *)self buildClusterDescriptorWithDevice:v13 endpointID:v16 queue:v14];
    id v18 = objc_alloc_init(MEMORY[0x263F10FA0]);
    uint64_t v19 = [v17 readAttributeServerListWithParams:v18];

    id v20 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v19 forIdentify:@"serverList"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v21 = v20;
    }
    else {
      uint64_t v21 = 0;
    }
    id v22 = v21;

    if (v22)
    {
      v23 = v34;
      if ([v22 containsObject:v34]) {
        v15[2](v15, v16, 0);
      }
      else {
        [(HMMTRDescriptorClusterManager *)self _queryEndpointsForClusterID:v34 endpoints:v12 mtrDevice:v33 callbackQueue:v14 completionHandler:v15];
      }
    }
    else
    {
      context = (void *)MEMORY[0x2533B64D0]();
      v28 = self;
      v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        id v31 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v36 = v31;
        __int16 v37 = 2112;
        id v38 = v16;
        _os_log_impl(&dword_252495000, v29, OS_LOG_TYPE_ERROR, "%{public}@ServerList at endpoint %@ absent from cache", buf, 0x16u);
      }
      id v30 = [MEMORY[0x263F087E8] hapErrorWithCode:14];
      ((void (**)(id, void *, void *))v15)[2](v15, 0, v30);

      v23 = v34;
    }

    id v13 = v33;
  }
  else
  {
    v24 = (void *)MEMORY[0x2533B64D0]();
    v25 = self;
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v36 = v27;
      __int16 v37 = 2112;
      id v38 = v34;
      _os_log_impl(&dword_252495000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Cluster ID %@ not found at any endpoints", buf, 0x16u);
    }
    v15[2](v15, 0, 0);
    v23 = v34;
  }
}

- (void)_queryEndpointsForClusterID:(id)a3 endpoints:(id)a4 device:(id)a5 callbackQueue:(id)a6 completionHandler:(id)a7
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([v13 count])
  {
    __int16 v17 = [v13 popFirstObject];
    id v18 = objc_msgSend(objc_alloc(MEMORY[0x263F10C80]), "initWithDevice:endpoint:queue:", v14, objc_msgSend(v17, "unsignedShortValue"), v15);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __110__HMMTRDescriptorClusterManager__queryEndpointsForClusterID_endpoints_device_callbackQueue_completionHandler___block_invoke;
    v24[3] = &unk_2653762C8;
    v24[4] = self;
    id v25 = v17;
    id v30 = v16;
    id v26 = v12;
    id v27 = v13;
    id v28 = v14;
    id v29 = v15;
    id v19 = v17;
    [v18 readAttributeServerListWithCompletionHandler:v24];
  }
  else
  {
    id v20 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v32 = v23;
      __int16 v33 = 2112;
      id v34 = v12;
      _os_log_impl(&dword_252495000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Cluster ID %@ not found at any endpoints", buf, 0x16u);
    }
    (*((void (**)(id, void, void))v16 + 2))(v16, 0, 0);
  }
}

void __110__HMMTRDescriptorClusterManager__queryEndpointsForClusterID_endpoints_device_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      int v13 = 138543874;
      id v14 = v10;
      __int16 v15 = 2112;
      uint64_t v16 = v11;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get clusters at endpoint %@: %@", (uint8_t *)&v13, 0x20u);
    }
    id v12 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
  }
  else
  {
    if (![v5 containsObject:*(void *)(a1 + 48)])
    {
      [*(id *)(a1 + 32) _queryEndpointsForClusterID:*(void *)(a1 + 48) endpoints:*(void *)(a1 + 56) device:*(void *)(a1 + 64) callbackQueue:*(void *)(a1 + 72) completionHandler:*(void *)(a1 + 80)];
      goto LABEL_8;
    }
    id v12 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
  }
  v12();
LABEL_8:
}

- (void)queryEndpointForClusterID:(id)a3 endpoint:(id)a4 device:(id)a5 callbackQueue:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  __int16 v15 = (objc_class *)MEMORY[0x263F10C80];
  id v16 = a6;
  id v17 = a5;
  id v18 = (void *)[[v15 alloc] initWithDevice:v17 endpointID:v13 queue:v16];

  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __107__HMMTRDescriptorClusterManager_queryEndpointForClusterID_endpoint_device_callbackQueue_completionHandler___block_invoke;
  v22[3] = &unk_265377B40;
  v22[4] = self;
  id v23 = v13;
  id v24 = v12;
  id v25 = v14;
  id v19 = v12;
  id v20 = v14;
  id v21 = v13;
  [v18 readAttributeServerListWithCompletionHandler:v22];
}

void __107__HMMTRDescriptorClusterManager_queryEndpointForClusterID_endpoint_device_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      int v16 = 138543874;
      id v17 = v10;
      __int16 v18 = 2112;
      uint64_t v19 = v11;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get clusters at endpoint %@: %@", (uint8_t *)&v16, 0x20u);
    }
LABEL_9:

    id v12 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_10;
  }
  if (![v5 containsObject:*(void *)(a1 + 48)])
  {
    uint64_t v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v13 = HMFGetLogIdentifier();
      __int16 v15 = *(void **)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      int v16 = 138543874;
      id v17 = v13;
      __int16 v18 = 2112;
      uint64_t v19 = v14;
      __int16 v20 = 2112;
      id v21 = v15;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Cluster ID %@ not found at endpoint: %@", (uint8_t *)&v16, 0x20u);
    }
    goto LABEL_9;
  }
  id v12 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_10:
  v12();
}

- (id)runBlockForAllEndpointsWithClusterID:(id)a3 mtrDevice:(id)a4 callbackQueue:(id)a5 block:(id)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)MEMORY[0x2533B64D0]();
  __int16 v15 = self;
  int v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v17;
    __int16 v31 = 2112;
    id v32 = v10;
    _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_INFO, "%{public}@Running block on all endpoints with clusterID %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  __int16 v18 = [MEMORY[0x263F42538] futureWithPromise:buf];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __100__HMMTRDescriptorClusterManager_runBlockForAllEndpointsWithClusterID_mtrDevice_callbackQueue_block___block_invoke;
  v24[3] = &unk_2653762A0;
  v24[4] = v15;
  id v25 = *(id *)buf;
  id v26 = v10;
  id v27 = v11;
  id v28 = v12;
  id v29 = v13;
  id v19 = v13;
  id v20 = v12;
  id v21 = v11;
  id v22 = v10;
  [(HMMTRDescriptorClusterManager *)v15 fetchEndpointsWithMTRDevice:v21 endpointID:&unk_2702B56A0 callbackQueue:v20 completionHandler:v24];

  return v18;
}

void __100__HMMTRDescriptorClusterManager_runBlockForAllEndpointsWithClusterID_mtrDevice_callbackQueue_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v13 = v10;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get endpoints for device: %@", buf, 0x16u);
    }
    [*(id *)(a1 + 40) rejectWithError:v6];
  }
  else
  {
    id v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", &unk_2702B56A0, 0);
    [v11 addObjectsFromArray:v5];
    [*(id *)(a1 + 32) _runBlockForAllEndpointsWithClusterID:*(void *)(a1 + 48) endpoints:v11 mtrDevice:*(void *)(a1 + 56) callbackQueue:*(void *)(a1 + 64) finishedRunningAllBlocksPromise:*(void *)(a1 + 40) block:*(void *)(a1 + 72)];
  }
}

- (id)runBlockForAllEndpointsWithClusterID:(id)a3 device:(id)a4 callbackQueue:(id)a5 block:(id)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = (void *)MEMORY[0x2533B64D0]();
  id v15 = self;
  uint64_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v17;
    __int16 v31 = 2112;
    id v32 = v10;
    _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_INFO, "%{public}@Running block on all endpoints with clusterID %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  __int16 v18 = [MEMORY[0x263F42538] futureWithPromise:buf];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __97__HMMTRDescriptorClusterManager_runBlockForAllEndpointsWithClusterID_device_callbackQueue_block___block_invoke;
  v24[3] = &unk_2653762A0;
  v24[4] = v15;
  id v25 = *(id *)buf;
  id v26 = v10;
  id v27 = v11;
  id v28 = v12;
  id v29 = v13;
  id v19 = v13;
  id v20 = v12;
  id v21 = v11;
  id v22 = v10;
  [(HMMTRDescriptorClusterManager *)v15 fetchEndpointsForDevice:v21 endpointID:&unk_2702B56A0 callbackQueue:v20 completionHandler:v24];

  return v18;
}

void __97__HMMTRDescriptorClusterManager_runBlockForAllEndpointsWithClusterID_device_callbackQueue_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v13 = v10;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get endpoints for device: %@", buf, 0x16u);
    }
    [*(id *)(a1 + 40) rejectWithError:v6];
  }
  else
  {
    id v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", &unk_2702B56A0, 0);
    [v11 addObjectsFromArray:v5];
    [*(id *)(a1 + 32) _runBlockForAllEndpointsWithClusterID:*(void *)(a1 + 48) endpoints:v11 device:*(void *)(a1 + 56) callbackQueue:*(void *)(a1 + 64) finishedRunningAllBlocksPromise:*(void *)(a1 + 40) block:*(void *)(a1 + 72)];
  }
}

- (void)endpointForClusterID:(id)a3 mtrDevice:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = (void *)MEMORY[0x2533B64D0]();
  id v15 = self;
  uint64_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    id v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v28 = v17;
    __int16 v29 = 2112;
    id v30 = v10;
    _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Finding endpoint for clusterID %@", buf, 0x16u);
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __96__HMMTRDescriptorClusterManager_endpointForClusterID_mtrDevice_callbackQueue_completionHandler___block_invoke;
  v22[3] = &unk_265378928;
  id v25 = v12;
  id v26 = v13;
  v22[4] = v15;
  id v23 = v10;
  id v24 = v11;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  id v21 = v13;
  [(HMMTRDescriptorClusterManager *)v15 fetchEndpointsWithMTRDevice:v19 endpointID:&unk_2702B56A0 callbackQueue:v18 completionHandler:v22];
}

void __96__HMMTRDescriptorClusterManager_endpointForClusterID_mtrDevice_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v19 = v10;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get endpoints for device: %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    id v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", &unk_2702B56A0, 0);
    [v11 addObjectsFromArray:v5];
    id v12 = *(void **)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 56);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __96__HMMTRDescriptorClusterManager_endpointForClusterID_mtrDevice_callbackQueue_completionHandler___block_invoke_330;
    v16[3] = &unk_265377990;
    id v17 = *(id *)(a1 + 64);
    [v12 _queryEndpointsForClusterID:v13 endpoints:v11 mtrDevice:v14 callbackQueue:v15 completionHandler:v16];
  }
}

uint64_t __96__HMMTRDescriptorClusterManager_endpointForClusterID_mtrDevice_callbackQueue_completionHandler___block_invoke_330(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)endpointForClusterID:(id)a3 device:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v15 = self;
  uint64_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    id v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v28 = v17;
    __int16 v29 = 2112;
    id v30 = v10;
    _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Finding endpoint for clusterID %@", buf, 0x16u);
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __93__HMMTRDescriptorClusterManager_endpointForClusterID_device_callbackQueue_completionHandler___block_invoke;
  v22[3] = &unk_265378928;
  id v25 = v12;
  id v26 = v13;
  v22[4] = v15;
  id v23 = v10;
  id v24 = v11;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  id v21 = v13;
  [(HMMTRDescriptorClusterManager *)v15 fetchEndpointsForDevice:v19 endpointID:&unk_2702B56A0 callbackQueue:v18 completionHandler:v22];
}

void __93__HMMTRDescriptorClusterManager_endpointForClusterID_device_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v19 = v10;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get endpoints for device: %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    id v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", &unk_2702B56A0, 0);
    [v11 addObjectsFromArray:v5];
    id v12 = *(void **)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 56);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __93__HMMTRDescriptorClusterManager_endpointForClusterID_device_callbackQueue_completionHandler___block_invoke_328;
    v16[3] = &unk_265377990;
    id v17 = *(id *)(a1 + 64);
    [v12 _queryEndpointsForClusterID:v13 endpoints:v11 device:v14 callbackQueue:v15 completionHandler:v16];
  }
}

uint64_t __93__HMMTRDescriptorClusterManager_endpointForClusterID_device_callbackQueue_completionHandler___block_invoke_328(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchDeviceTypesWithMTRDevice:(id)a3 atEndpoint:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  uint64_t v104 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void, uint64_t))a6;
  uint64_t v14 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v15 = self;
  uint64_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = id v17 = v15;
    *(_DWORD *)buf = 138543618;
    v97 = v18;
    __int16 v98 = 2112;
    id v99 = v11;
    _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_INFO, "%{public}@Examining MTRClusterDescriptor device list at endpoint %@", buf, 0x16u);

    uint64_t v15 = v17;
  }

  id v19 = [(HMMTRDescriptorClusterManager *)v15 buildClusterDescriptorWithDevice:v10 endpointID:v11 queue:v12];
  id v20 = objc_alloc_init(MEMORY[0x263F10FA0]);
  v75 = v19;
  id v21 = [v19 readAttributeDeviceTypeListWithParams:v20];

  if (v21)
  {
    uint64_t v76 = 0;
  }
  else
  {
    uint64_t v76 = [MEMORY[0x263F087E8] hapErrorWithCode:14];
  }
  uint64_t v84 = *MEMORY[0x263F10C18];
  uint64_t v22 = objc_msgSend(v21, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v23 = v22;
  }
  else {
    id v23 = 0;
  }
  id v24 = v23;

  v86 = [MEMORY[0x263EFF980] array];
  if ([v24 isEqual:*MEMORY[0x263F10B68]])
  {
    v71 = v15;
    id v73 = v11;
    id v74 = v10;
    v72 = v21;
    uint64_t v79 = *MEMORY[0x263F10C30];
    id v25 = objc_msgSend(v21, "objectForKeyedSubscript:");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v26 = v25;
    }
    else {
      id v26 = 0;
    }
    id v27 = v26;

    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    id v28 = v27;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v92 objects:v103 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v93;
      uint64_t v87 = *MEMORY[0x263F10B90];
      uint64_t v83 = *MEMORY[0x263F10C10];
      uint64_t v32 = *MEMORY[0x263F10B88];
      uint64_t v77 = *(void *)v93;
      id v78 = v28;
      do
      {
        uint64_t v33 = 0;
        uint64_t v80 = v30;
        do
        {
          if (*(void *)v93 != v31) {
            objc_enumerationMutation(v28);
          }
          id v34 = *(void **)(*((void *)&v92 + 1) + 8 * v33);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v85 = v33;
            uint64_t v35 = [v34 objectForKeyedSubscript:v87];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              __int16 v36 = v35;
            }
            else {
              __int16 v36 = 0;
            }
            id v37 = v36;

            id v38 = v37;
            uint64_t v39 = [v37 objectForKeyedSubscript:v84];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v40 = v39;
            }
            else {
              v40 = 0;
            }
            id v41 = v40;

            if ([v41 isEqual:v83])
            {
              id v81 = v41;
              v82 = v38;
              v42 = [v38 objectForKeyedSubscript:v79];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v43 = v42;
              }
              else {
                v43 = 0;
              }
              id v44 = v43;

              long long v90 = 0u;
              long long v91 = 0u;
              long long v88 = 0u;
              long long v89 = 0u;
              id v45 = v44;
              uint64_t v46 = [v45 countByEnumeratingWithState:&v88 objects:v102 count:16];
              if (v46)
              {
                uint64_t v47 = v46;
                uint64_t v48 = *(void *)v89;
                do
                {
                  for (uint64_t i = 0; i != v47; ++i)
                  {
                    if (*(void *)v89 != v48) {
                      objc_enumerationMutation(v45);
                    }
                    v50 = *(void **)(*((void *)&v88 + 1) + 8 * i);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v51 = [v50 objectForKeyedSubscript:v32];
                      objc_opt_class();
                      v52 = (objc_opt_isKindOfClass() & 1) != 0 ? v51 : 0;
                      id v53 = v52;

                      int v54 = [v53 isEqual:&unk_2702B56A0];
                      if (v54)
                      {
                        v55 = [v50 objectForKeyedSubscript:v87];
                        objc_opt_class();
                        if (objc_opt_isKindOfClass()) {
                          v56 = v55;
                        }
                        else {
                          v56 = 0;
                        }
                        id v57 = v56;

                        v58 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v57 forIdentify:@"deviceType"];

                        id v59 = v58;
                        objc_opt_class();
                        if (objc_opt_isKindOfClass()) {
                          v60 = v59;
                        }
                        else {
                          v60 = 0;
                        }
                        id v61 = v60;

                        [v86 addObject:v61];
                      }
                    }
                  }
                  uint64_t v47 = [v45 countByEnumeratingWithState:&v88 objects:v102 count:16];
                }
                while (v47);
              }

              uint64_t v31 = v77;
              id v28 = v78;
              uint64_t v30 = v80;
              id v41 = v81;
              id v38 = v82;
            }

            id v24 = v41;
            uint64_t v33 = v85;
          }
          ++v33;
        }
        while (v33 != v30);
        uint64_t v30 = [v28 countByEnumeratingWithState:&v92 objects:v103 count:16];
      }
      while (v30);
    }

    id v11 = v73;
    id v10 = v74;
    v62 = v28;
    uint64_t v15 = v71;
    id v21 = v72;
  }
  else
  {
    uint64_t v63 = [MEMORY[0x263F087E8] hapErrorWithCode:14];
    v62 = (void *)v76;
    uint64_t v76 = v63;
  }

  if (objc_msgSend(v86, "hmf_isEmpty"))
  {
    v64 = (void *)v76;
    v13[2](v13, 0, v76);
    v65 = v86;
  }
  else
  {
    v66 = v21;
    v67 = (void *)MEMORY[0x2533B64D0]();
    v68 = v15;
    v69 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
    {
      v70 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v97 = v70;
      __int16 v98 = 2112;
      id v99 = v11;
      __int16 v100 = 2112;
      v101 = v86;
      _os_log_impl(&dword_252495000, v69, OS_LOG_TYPE_INFO, "%{public}@Device Type Enumeration : Got at endpoint %@ following device types in use %@", buf, 0x20u);
    }
    v65 = v86;
    ((void (**)(id, void *, uint64_t))v13)[2](v13, v86, 0);
    id v21 = v66;
    v64 = (void *)v76;
  }
}

- (void)fetchDeviceTypesForDevice:(id)a3 atEndpoint:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v15 = self;
  uint64_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v25 = v17;
    __int16 v26 = 2112;
    id v27 = v11;
    _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_INFO, "%{public}@Examining MTRBaseClusterDescriptor device list at endpoint %@", buf, 0x16u);
  }
  id v18 = objc_msgSend(objc_alloc(MEMORY[0x263F10C80]), "initWithDevice:endpoint:queue:", v10, objc_msgSend(v11, "unsignedShortValue"), v12);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __102__HMMTRDescriptorClusterManager_fetchDeviceTypesForDevice_atEndpoint_callbackQueue_completionHandler___block_invoke;
  v21[3] = &unk_265378A90;
  id v22 = v11;
  id v23 = v13;
  v21[4] = v15;
  id v19 = v11;
  id v20 = v13;
  [v18 readAttributeDeviceListWithCompletionHandler:v21];
}

void __102__HMMTRDescriptorClusterManager_fetchDeviceTypesForDevice_atEndpoint_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v22 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_17:
    v22();
    goto LABEL_18;
  }
  if (![v5 count])
  {
    id v22 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_17;
  }
  id v23 = v6;
  uint64_t v7 = (void *)MEMORY[0x2533B64D0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    id v11 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v32 = v10;
    __int16 v33 = 2112;
    id v34 = v11;
    __int16 v35 = 2112;
    id v36 = v5;
    _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@Device Type Enumeration : Got at endpoint %@ following device type in use %@", buf, 0x20u);
  }
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v24 = v5;
  id obj = v5;
  uint64_t v13 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = [*(id *)(*((void *)&v26 + 1) + 8 * i) type];
        id v18 = (void *)MEMORY[0x2533B64D0]();
        id v19 = *(id *)(a1 + 32);
        id v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          id v21 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v32 = v21;
          __int16 v33 = 2112;
          id v34 = v17;
          _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_INFO, "%{public}@Device Type Enumeration : Found device type %@", buf, 0x16u);
        }
        [v12 addObject:v17];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v14);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v6 = v23;
  id v5 = v24;
LABEL_18:
}

- (id)fetchClusterGeneratedCommandsForDevice:(id)a3 endpointID:(id)a4 clusterID:(id)a5 callbackQueue:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v15 = self;
  uint64_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v31 = v17;
    __int16 v32 = 2112;
    id v33 = v11;
    _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_INFO, "%{public}@fetchClusterGeneratedCommandsForDevice: Examining MTRBaseClusterDescriptor cluster generated command list attribute at endpoint %@ to retrieve accepted commands.", buf, 0x16u);
  }
  id v18 = objc_alloc_init(MEMORY[0x263F10FA0]);
  id v19 = [v10 readAttributeWithEndpointID:v11 clusterID:v12 attributeID:&unk_2702B57D8 params:v18];

  if (v19)
  {
    id v20 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v19 forIdentify:@"GeneratedCommands"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v21 = v20;
    }
    else {
      id v21 = 0;
    }
    id v22 = v21;

    id v23 = (void *)MEMORY[0x2533B64D0]();
    id v24 = v15;
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v29 = v10;
      v27 = id v26 = v13;
      *(_DWORD *)buf = 138544130;
      uint64_t v31 = v27;
      __int16 v32 = 2112;
      id v33 = v11;
      __int16 v34 = 2112;
      id v35 = v12;
      __int16 v36 = 2112;
      id v37 = v22;
      _os_log_impl(&dword_252495000, v25, OS_LOG_TYPE_DEBUG, "%{public}@fetchClusterGeneratedCommandsForDevice: For endpoint %@, cluster %@, retrieved the following generated command list %@", buf, 0x2Au);

      id v13 = v26;
      id v10 = v29;
    }
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

- (id)fetchClusterAcceptedCommandsForDevice:(id)a3 endpointID:(id)a4 clusterID:(id)a5 callbackQueue:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v15 = self;
  uint64_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v31 = v17;
    __int16 v32 = 2112;
    id v33 = v11;
    _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_INFO, "%{public}@fetchClusterAcceptedCommandsForDevice: Examining MTRBaseClusterDescriptor cluster acceptedCommandList attribute at endpoint %@ to retrieve accepted commands.", buf, 0x16u);
  }
  id v18 = objc_alloc_init(MEMORY[0x263F10FA0]);
  id v19 = [v10 readAttributeWithEndpointID:v11 clusterID:v12 attributeID:&unk_2702B57C0 params:v18];

  if (v19)
  {
    id v20 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v19 forIdentify:@"AcceptedCommands"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v21 = v20;
    }
    else {
      id v21 = 0;
    }
    id v22 = v21;

    id v23 = (void *)MEMORY[0x2533B64D0]();
    id v24 = v15;
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v29 = v10;
      v27 = id v26 = v13;
      *(_DWORD *)buf = 138544130;
      uint64_t v31 = v27;
      __int16 v32 = 2112;
      id v33 = v11;
      __int16 v34 = 2112;
      id v35 = v12;
      __int16 v36 = 2112;
      id v37 = v22;
      _os_log_impl(&dword_252495000, v25, OS_LOG_TYPE_DEBUG, "%{public}@fetchClusterAcceptedCommandsForDevice: For endpoint %@, cluster %@, retrieved the following accepted command list %@", buf, 0x2Au);

      id v13 = v26;
      id v10 = v29;
    }
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

- (id)fetchClusterFeatureMapForDevice:(id)a3 endpointID:(id)a4 clusterID:(id)a5 callbackQueue:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v15 = self;
  uint64_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v31 = v17;
    __int16 v32 = 2112;
    id v33 = v11;
    _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_INFO, "%{public}@fetchClusterFeatureMapForDevice: Examining MTRBaseClusterDescriptor cluster feature map attribute at endpoint %@ to retrieve feature map.", buf, 0x16u);
  }
  id v18 = objc_alloc_init(MEMORY[0x263F10FA0]);
  id v19 = [v10 readAttributeWithEndpointID:v11 clusterID:v12 attributeID:&unk_2702B57A8 params:v18];

  if (v19)
  {
    id v20 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v19 forIdentify:@"FeatureMap"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v21 = v20;
    }
    else {
      id v21 = 0;
    }
    id v22 = v21;

    id v23 = (void *)MEMORY[0x2533B64D0]();
    id v24 = v15;
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v29 = v10;
      v27 = id v26 = v13;
      *(_DWORD *)buf = 138544130;
      uint64_t v31 = v27;
      __int16 v32 = 2112;
      id v33 = v11;
      __int16 v34 = 2112;
      id v35 = v12;
      __int16 v36 = 2112;
      id v37 = v22;
      _os_log_impl(&dword_252495000, v25, OS_LOG_TYPE_DEBUG, "%{public}@fetchClusterFeatureMapForDevice: For endpoint %@, cluster %@, retrieved the following feature map %@", buf, 0x2Au);

      id v13 = v26;
      id v10 = v29;
    }
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

- (id)fetchClusterRevisionForDevice:(id)a3 endpointID:(id)a4 clusterID:(id)a5 callbackQueue:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v15 = self;
  uint64_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v31 = v17;
    __int16 v32 = 2112;
    id v33 = v11;
    _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_INFO, "%{public}@fetchClusterRevisionForDevice: Examining MTRBaseClusterDescriptor cluster revision attribute at endpoint %@ to cluster revision number.", buf, 0x16u);
  }
  id v18 = objc_alloc_init(MEMORY[0x263F10FA0]);
  id v19 = [v10 readAttributeWithEndpointID:v11 clusterID:v12 attributeID:&unk_2702B5790 params:v18];

  if (v19)
  {
    id v20 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v19 forIdentify:@"Revision"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v21 = v20;
    }
    else {
      id v21 = 0;
    }
    id v22 = v21;

    id v23 = (void *)MEMORY[0x2533B64D0]();
    id v24 = v15;
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v29 = v10;
      v27 = id v26 = v13;
      *(_DWORD *)buf = 138544130;
      uint64_t v31 = v27;
      __int16 v32 = 2112;
      id v33 = v11;
      __int16 v34 = 2112;
      id v35 = v12;
      __int16 v36 = 2112;
      id v37 = v22;
      _os_log_impl(&dword_252495000, v25, OS_LOG_TYPE_DEBUG, "%{public}@fetchClusterRevisionForDevice: For endpoint %@, cluster %@, retrieved the revison number %@", buf, 0x2Au);

      id v13 = v26;
      id v10 = v29;
    }
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

- (id)fetchClusterEventListForDevice:(id)a3 endpointID:(id)a4 clusterID:(id)a5 callbackQueue:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v15 = self;
  uint64_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v31 = v17;
    __int16 v32 = 2112;
    id v33 = v11;
    _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_INFO, "%{public}@fetchClusterEventListForDevice: Examining MTRBaseClusterDescriptor eventlist attribute at endpoint %@ to retrieve events.", buf, 0x16u);
  }
  id v18 = objc_alloc_init(MEMORY[0x263F10FA0]);
  id v19 = [v10 readAttributeWithEndpointID:v11 clusterID:v12 attributeID:&unk_2702B5778 params:v18];

  if (v19)
  {
    id v20 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v19 forIdentify:@"EventList"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v21 = v20;
    }
    else {
      id v21 = 0;
    }
    id v22 = v21;

    id v23 = (void *)MEMORY[0x2533B64D0]();
    id v24 = v15;
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v29 = v10;
      v27 = id v26 = v13;
      *(_DWORD *)buf = 138544130;
      uint64_t v31 = v27;
      __int16 v32 = 2112;
      id v33 = v11;
      __int16 v34 = 2112;
      id v35 = v12;
      __int16 v36 = 2112;
      id v37 = v22;
      _os_log_impl(&dword_252495000, v25, OS_LOG_TYPE_DEBUG, "%{public}@fetchClusterEventListForDevice: For endpoint %@, cluster %@, retrieved the following events %@", buf, 0x2Au);

      id v13 = v26;
      id v10 = v29;
    }
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

- (id)fetchClusterAttributesForDevice:(id)a3 endpointID:(id)a4 clusterID:(id)a5 callbackQueue:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v15 = self;
  uint64_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v31 = v17;
    __int16 v32 = 2112;
    id v33 = v11;
    _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_INFO, "%{public}@fetchClusterAttributesForDevice: Examining MTRBaseClusterDescriptor attributelist attribute at endpoint %@ to retrieve cluster attributes.", buf, 0x16u);
  }
  id v18 = objc_alloc_init(MEMORY[0x263F10FA0]);
  id v19 = [v10 readAttributeWithEndpointID:v11 clusterID:v12 attributeID:&unk_2702B5760 params:v18];

  if (v19)
  {
    id v20 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v19 forIdentify:@"AttributeList"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v21 = v20;
    }
    else {
      id v21 = 0;
    }
    id v22 = v21;

    id v23 = (void *)MEMORY[0x2533B64D0]();
    id v24 = v15;
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v29 = v10;
      v27 = id v26 = v13;
      *(_DWORD *)buf = 138544130;
      uint64_t v31 = v27;
      __int16 v32 = 2112;
      id v33 = v11;
      __int16 v34 = 2112;
      id v35 = v12;
      __int16 v36 = 2112;
      id v37 = v22;
      _os_log_impl(&dword_252495000, v25, OS_LOG_TYPE_DEBUG, "%{public}@fetchClusterAttributesForDevice: For endpoint %@, cluster %@, retrieved the following attributes %@", buf, 0x2Au);

      id v13 = v26;
      id v10 = v29;
    }
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

- (id)fetchClientClustersForDevice:(id)a3 endpointID:(id)a4 callbackQueue:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x2533B64D0]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    int v24 = 138543618;
    id v25 = v14;
    __int16 v26 = 2112;
    id v27 = v9;
    _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@fetchClientClustersForDevice: Examining MTRBaseClusterDescriptor clientlist attribute at endpoint %@ to retrieve client clusters.", (uint8_t *)&v24, 0x16u);
  }
  uint64_t v15 = [(HMMTRDescriptorClusterManager *)v12 buildClusterDescriptorWithDevice:v8 endpointID:v9 queue:v10];
  id v16 = objc_alloc_init(MEMORY[0x263F10FA0]);
  id v17 = [v15 readAttributeClientListWithParams:v16];

  if (v17)
  {
    id v18 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v17 forIdentify:@"ClustersInUse"];
    id v19 = (void *)MEMORY[0x2533B64D0]();
    id v20 = v12;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      id v22 = HMFGetLogIdentifier();
      int v24 = 138543618;
      id v25 = v22;
      __int16 v26 = 2112;
      id v27 = v18;
      _os_log_impl(&dword_252495000, v21, OS_LOG_TYPE_DEBUG, "%{public}@fetchClientClustersForDevice: Retrieved the following client clusters %@", (uint8_t *)&v24, 0x16u);
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (id)fetchServerClustersForDevice:(id)a3 endpointID:(id)a4 callbackQueue:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x2533B64D0]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    int v24 = 138543618;
    id v25 = v14;
    __int16 v26 = 2112;
    id v27 = v9;
    _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@fetchServerClustersForDevice: Examining MTRBaseClusterDescriptor serverlist attribute at endpoint %@ to retrieve server clusters.", (uint8_t *)&v24, 0x16u);
  }
  uint64_t v15 = [(HMMTRDescriptorClusterManager *)v12 buildClusterDescriptorWithDevice:v8 endpointID:v9 queue:v10];
  id v16 = objc_alloc_init(MEMORY[0x263F10FA0]);
  id v17 = [v15 readAttributeServerListWithParams:v16];

  if (v17)
  {
    id v18 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v17 forIdentify:@"ClustersInUse"];
    id v19 = (void *)MEMORY[0x2533B64D0]();
    id v20 = v12;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      id v22 = HMFGetLogIdentifier();
      int v24 = 138543618;
      id v25 = v22;
      __int16 v26 = 2112;
      id v27 = v18;
      _os_log_impl(&dword_252495000, v21, OS_LOG_TYPE_DEBUG, "%{public}@fetchServerClustersForDevice: Retrieved the following server clusters %@", (uint8_t *)&v24, 0x16u);
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (id)fetchDeviceTypesWithMTRDevice:(id)a3 endpointID:(id)a4 callbackQueue:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x2533B64D0]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v26 = v14;
    __int16 v27 = 2112;
    id v28 = v9;
    _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@fetchDeviceTypesWithMTRDevice: Examining MTRClusterDescriptor cluster parts list at endpoint %@ to retrieve device types.", buf, 0x16u);
  }
  uint64_t v15 = [(HMMTRDescriptorClusterManager *)v12 buildClusterDescriptorWithDevice:v8 endpointID:v9 queue:v10];
  id v16 = objc_alloc_init(MEMORY[0x263F10FA0]);
  id v17 = [v15 readAttributeDeviceTypeListWithParams:v16];
  if (v17)
  {
    id v18 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v17 clusterIdentifier:&unk_2702B5730 attributeIdentifier:&unk_2702B5748 forIdentify:@"DeviceList"];
    id v19 = (void *)MEMORY[0x2533B64D0]();
    id v20 = v12;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v22 = v24 = v8;
      *(_DWORD *)buf = 138543874;
      __int16 v26 = v22;
      __int16 v27 = 2112;
      id v28 = v9;
      __int16 v29 = 2112;
      uint64_t v30 = v18;
      _os_log_impl(&dword_252495000, v21, OS_LOG_TYPE_DEBUG, "%{public}@fetchDeviceTypesWithMTRDevice: At endpoint %@, retrieved the following device types in use %@", buf, 0x20u);

      id v8 = v24;
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (void)fetchEndpointsWithMTRDevice:(id)a3 endpointID:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, id, void))a6;
  uint64_t v14 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v15 = self;
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v45 = v17;
    __int16 v46 = 2112;
    id v47 = v11;
    _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_INFO, "%{public}@Examining MTRClusterDescriptor cluster parts list at endpoint %@ to retrieve endpoints in use.", buf, 0x16u);
  }
  id v18 = [(HMMTRDescriptorClusterManager *)v15 buildClusterDescriptorWithDevice:v10 endpointID:v11 queue:v12];
  id v19 = objc_alloc_init(MEMORY[0x263F10FA0]);
  id v20 = [v18 readAttributePartsListWithParams:v19];

  id v21 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v20 forIdentify:@"partsList"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v22 = v21;
  }
  else {
    id v22 = 0;
  }
  id v23 = v22;

  if (v23 || ![v11 isEqual:&unk_2702B56A0])
  {
    contexta = v11;
    id v32 = v10;
    id v33 = (void *)MEMORY[0x2533B64D0]();
    __int16 v34 = v15;
    id v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v41 = v20;
      __int16 v36 = v18;
      id v37 = v13;
      v39 = id v38 = v12;
      *(_DWORD *)buf = 138543618;
      id v45 = v39;
      __int16 v46 = 2112;
      id v47 = v23;
      _os_log_impl(&dword_252495000, v35, OS_LOG_TYPE_INFO, "%{public}@Retrieved the following endpoints in use %@", buf, 0x16u);

      id v12 = v38;
      id v13 = v37;
      id v18 = v36;
      id v20 = v41;
    }

    v13[2](v13, v23, 0);
    id v10 = v32;
    id v11 = contexta;
  }
  else
  {
    context = (void *)MEMORY[0x2533B64D0]();
    id v24 = v15;
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v40 = v20;
      __int16 v26 = v13;
      id v27 = v12;
      id v28 = v11;
      uint64_t v30 = v29 = v10;
      *(_DWORD *)buf = 138543362;
      id v45 = v30;
      _os_log_impl(&dword_252495000, v25, OS_LOG_TYPE_ERROR, "%{public}@Parts list absent from cache", buf, 0xCu);

      id v10 = v29;
      id v11 = v28;
      id v12 = v27;
      id v13 = v26;
      id v20 = v40;
    }

    uint64_t v31 = [MEMORY[0x263F087E8] hapErrorWithCode:14];
    ((void (**)(id, id, void *))v13)[2](v13, 0, v31);
  }
}

- (void)fetchEndpointsForDevice:(id)a3 endpointID:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v15 = self;
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v26 = v17;
    __int16 v27 = 2112;
    id v28 = v11;
    _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_INFO, "%{public}@Examining MTRBaseClusterDescriptor cluster parts list at endpoint %@ to retrieve endpoints in use.", buf, 0x16u);
  }
  id v18 = objc_msgSend(objc_alloc(MEMORY[0x263F10C80]), "initWithDevice:endpoint:queue:", v10, objc_msgSend(v11, "unsignedShortValue"), v12);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __100__HMMTRDescriptorClusterManager_fetchEndpointsForDevice_endpointID_callbackQueue_completionHandler___block_invoke;
  v21[3] = &unk_265378A90;
  id v22 = v11;
  id v23 = v15;
  id v24 = v13;
  id v19 = v13;
  id v20 = v11;
  [v18 readAttributePartsListWithCompletionHandler:v21];
}

void __100__HMMTRDescriptorClusterManager_fetchEndpointsForDevice_endpointID_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5 || ![*(id *)(a1 + 32) isEqual:&unk_2702B56A0])
  {
    uint64_t v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 40);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v12 = 138543618;
      id v13 = v11;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@Retrieved the following endpoints in use %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 40);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      id v13 = v10;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to read parts list. Error: %@", (uint8_t *)&v12, 0x16u);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)fetchPartsListForDevice:(id)a3 endpointID:(id)a4 callbackQueue:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x2533B64D0]();
  int v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    __int16 v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v28 = v14;
    __int16 v29 = 2112;
    id v30 = v9;
    _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@fetchPartsListForDevice: Examining MTRClusterDescriptor cluster parts list at endpoint %@ to retrieve endpoints in use.", buf, 0x16u);
  }
  id v15 = [(HMMTRDescriptorClusterManager *)v12 buildClusterDescriptorWithDevice:v8 endpointID:v9 queue:v10];
  id v16 = objc_alloc_init(MEMORY[0x263F10FA0]);
  id v17 = [v15 readAttributePartsListWithParams:v16];
  if (v17)
  {
    id v26 = v8;
    id v18 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v17 forIdentify:@"PartsList"];
    id v19 = (void *)MEMORY[0x2533B64D0]();
    id v20 = v12;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v28 = v22;
      __int16 v29 = 2112;
      id v30 = v18;
      _os_log_impl(&dword_252495000, v21, OS_LOG_TYPE_DEBUG, "%{public}@fetchPartsListForDevice: Retrieved the following parts list in use %@", buf, 0x16u);
    }
LABEL_10:

    id v8 = v26;
    goto LABEL_11;
  }
  if ([v9 isEqual:&unk_2702B56A0])
  {
    id v26 = v8;
    id v19 = (void *)MEMORY[0x2533B64D0]();
    id v23 = v12;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v28 = v24;
      _os_log_impl(&dword_252495000, v21, OS_LOG_TYPE_ERROR, "%{public}@fetchPartsListForDevice: Failed to read parts list.", buf, 0xCu);
    }
    id v18 = 0;
    goto LABEL_10;
  }
  id v18 = 0;
LABEL_11:

  return v18;
}

- (void)fetchHAPServicesForEndpoints:(id)a3 endpointDeviceTypes:(id)a4 device:(id)a5 nodeId:(id)a6 isBridge:(BOOL)a7 bridgeAggregateNodeEndpoint:(id)a8 server:(id)a9 topology:(id)a10 hapAccessoryInfo:(id)a11 callbackQueue:(id)a12 completionHandler:(id)a13
{
  BOOL v56 = a7;
  id v18 = a3;
  id v57 = a4;
  id v19 = a5;
  id v20 = v18;
  id v55 = v19;
  id v54 = a6;
  id v53 = a8;
  id v21 = a9;
  id v22 = (HMMTRMutableDeviceTopology *)a10;
  id v61 = (HMMTRHAPAccessoryInfo *)a11;
  id v23 = self;
  id v24 = a12;
  id v25 = a13;
  id v26 = [(HMMTRDescriptorClusterManager *)self protocolMap];
  __int16 v27 = [v26 hapToCHIPClusterMappingArray];
  v88[0] = MEMORY[0x263EF8330];
  v88[1] = 3221225472;
  v88[2] = __198__HMMTRDescriptorClusterManager_fetchHAPServicesForEndpoints_endpointDeviceTypes_device_nodeId_isBridge_bridgeAggregateNodeEndpoint_server_topology_hapAccessoryInfo_callbackQueue_completionHandler___block_invoke;
  v88[3] = &unk_265377A28;
  id v28 = v24;
  id v89 = v28;
  id v29 = v25;
  id v90 = v29;
  id v30 = (void *)MEMORY[0x2533B66E0](v88);
  uint64_t v63 = v20;
  v58 = v29;
  id v59 = v28;
  v60 = v27;
  if ([v20 count])
  {
    if (!v22) {
      id v22 = objc_alloc_init(HMMTRMutableDeviceTopology);
    }
    uint64_t v31 = v21;
    id v32 = v57;
    id v33 = v61;
    if (!v61)
    {
      id v34 = v28;
      id v35 = objc_opt_new();
      id v33 = [[HMMTRHAPAccessoryInfo alloc] initWithType:v35];

      id v28 = v34;
    }
    __int16 v36 = [v63 popFirstObject];
    v52 = [v57 objectForKey:v36];
    v73[0] = MEMORY[0x263EF8330];
    v73[1] = 3221225472;
    v73[2] = __198__HMMTRDescriptorClusterManager_fetchHAPServicesForEndpoints_endpointDeviceTypes_device_nodeId_isBridge_bridgeAggregateNodeEndpoint_server_topology_hapAccessoryInfo_callbackQueue_completionHandler___block_invoke_3;
    v73[3] = &unk_265376250;
    v73[4] = v23;
    id v74 = v36;
    v51 = v22;
    v75 = v51;
    id v76 = v26;
    id v77 = v57;
    id v78 = v55;
    id v79 = v28;
    v62 = v33;
    uint64_t v80 = v62;
    id v81 = v27;
    BOOL v87 = v56;
    id v37 = v53;
    id v82 = v53;
    id v38 = v31;
    id v83 = v31;
    id v84 = v63;
    uint64_t v39 = v54;
    id v85 = v54;
    v40 = v58;
    id v86 = v58;
    id v41 = v36;
    [v76 servicesOfMTRDevice:v78 forDeviceTypes:v52 endpoint:v41 callbackQueue:v79 completionHandler:v73];

    v42 = v55;
    v43 = v51;
  }
  else
  {
    if (v56)
    {
      id v37 = v53;
      if (!v22)
      {
        if ([v20 count]) {
          id v22 = 0;
        }
        else {
          id v22 = objc_alloc_init(HMMTRMutableDeviceTopology);
        }
      }
      id v44 = v28;
      id v45 = (void *)MEMORY[0x263EFF8C0];
      __int16 v46 = [NSNumber numberWithInteger:2];
      id v47 = [v45 arrayWithObject:v46];

      if (v53)
      {
        [(HMMTRMutableDeviceTopology *)v22 setHAPCategories:v47 atEndpoint:v53];
        uint64_t v48 = [[HMMTRHAPDescriptionAtEndpoint alloc] initWithType:v47 serviceDescriptions:0];
        [(HMMTRHAPAccessoryInfo *)v61 setAccessoryInfo:v48 forEndpoint:v53];
      }
      uint64_t v39 = v54;
      v42 = v55;
    }
    else
    {
      id v44 = v28;
      uint64_t v39 = v54;
      v42 = v55;
      id v37 = v53;
    }
    v64[0] = MEMORY[0x263EF8330];
    v64[1] = 3221225472;
    v64[2] = __198__HMMTRDescriptorClusterManager_fetchHAPServicesForEndpoints_endpointDeviceTypes_device_nodeId_isBridge_bridgeAggregateNodeEndpoint_server_topology_hapAccessoryInfo_callbackQueue_completionHandler___block_invoke_282;
    v64[3] = &unk_265376278;
    v49 = v22;
    BOOL v72 = v56;
    v50 = v23;
    v43 = v49;
    v65 = v49;
    v66 = v50;
    id v67 = v39;
    id v38 = v21;
    id v68 = v21;
    id v71 = v30;
    v62 = v61;
    v69 = v62;
    id v70 = v37;
    [(HMMTRDescriptorClusterManager *)v50 _updateOTARequestorEndpointsInTopology:v43 device:v42 callbackQueue:v44 completionHandler:v64];

    id v41 = v65;
    id v32 = v57;
    v40 = v58;
  }
}

void __198__HMMTRDescriptorClusterManager_fetchHAPServicesForEndpoints_endpointDeviceTypes_device_nodeId_isBridge_bridgeAggregateNodeEndpoint_server_topology_hapAccessoryInfo_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, char a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  int v12 = *(NSObject **)(a1 + 32);
  if (v12)
  {
    id v13 = *(void **)(a1 + 40);
    if (v13)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __198__HMMTRDescriptorClusterManager_fetchHAPServicesForEndpoints_endpointDeviceTypes_device_nodeId_isBridge_bridgeAggregateNodeEndpoint_server_topology_hapAccessoryInfo_callbackQueue_completionHandler___block_invoke_2;
      block[3] = &unk_265377480;
      id v18 = v13;
      id v15 = v9;
      char v19 = a3;
      id v16 = v10;
      id v17 = v11;
      dispatch_async(v12, block);
    }
  }
}

void __198__HMMTRDescriptorClusterManager_fetchHAPServicesForEndpoints_endpointDeviceTypes_device_nodeId_isBridge_bridgeAggregateNodeEndpoint_server_topology_hapAccessoryInfo_callbackQueue_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v48 = v10;
      __int16 v49 = 2112;
      uint64_t v50 = v11;
      __int16 v51 = 2112;
      id v52 = v6;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to get HAP Services from plist for endpoint:%@. Error:%@", buf, 0x20u);
    }
  }
  id v30 = [MEMORY[0x263EFFA08] setWithArray:v5];
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v31 = v5;
  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v15 = *(void **)(a1 + 48);
  id v16 = [v30 allObjects];
  [v15 setHAPServiceTypes:v16 atEndpoint:*(void *)(a1 + 40)];

  [*(id *)(a1 + 48) setHAPDisabledCharacteristics:v12 atEndpoint:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) setDeviceFeatureMapValues:v13 atEndpoint:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) setDeviceAttributeValues:v14 atEndpoint:*(void *)(a1 + 40)];
  id v17 = *(void **)(a1 + 56);
  id v18 = [*(id *)(a1 + 64) objectForKey:*(void *)(a1 + 40)];
  [v17 categoriesForDeviceTypes:v18];
  char v19 = v29 = v6;

  id v20 = [MEMORY[0x263EFFA08] setWithArray:v19];
  id v21 = *(void **)(a1 + 48);
  id v22 = [v20 allObjects];
  [v21 setHAPCategories:v22 atEndpoint:*(void *)(a1 + 40)];

  id v24 = *(void **)(a1 + 32);
  uint64_t v23 = *(void *)(a1 + 40);
  uint64_t v26 = *(void *)(a1 + 72);
  uint64_t v25 = *(void *)(a1 + 80);
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __198__HMMTRDescriptorClusterManager_fetchHAPServicesForEndpoints_endpointDeviceTypes_device_nodeId_isBridge_bridgeAggregateNodeEndpoint_server_topology_hapAccessoryInfo_callbackQueue_completionHandler___block_invoke_280;
  v32[3] = &unk_265376228;
  id v33 = *(id *)(a1 + 48);
  id v27 = *(id *)(a1 + 40);
  uint64_t v28 = *(void *)(a1 + 32);
  id v34 = v27;
  uint64_t v35 = v28;
  id v36 = *(id *)(a1 + 64);
  id v37 = *(id *)(a1 + 88);
  id v38 = *(id *)(a1 + 96);
  id v39 = *(id *)(a1 + 72);
  char v46 = *(unsigned char *)(a1 + 144);
  id v40 = *(id *)(a1 + 104);
  id v41 = *(id *)(a1 + 112);
  id v42 = *(id *)(a1 + 80);
  id v43 = *(id *)(a1 + 120);
  id v44 = *(id *)(a1 + 128);
  id v45 = *(id *)(a1 + 136);
  [v24 fetchEndpointsWithMTRDevice:v26 endpointID:v23 callbackQueue:v25 completionHandler:v32];
}

void __198__HMMTRDescriptorClusterManager_fetchHAPServicesForEndpoints_endpointDeviceTypes_device_nodeId_isBridge_bridgeAggregateNodeEndpoint_server_topology_hapAccessoryInfo_callbackQueue_completionHandler___block_invoke_282(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [*(id *)(a1 + 32) clustersInUse];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend(v4, "objectForKeyedSubscript:", *(void *)(*((void *)&v28 + 1) + 8 * i), (void)v28);
        uint64_t v10 = [v9 count];

        if (v10)
        {

          goto LABEL_14;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v28 objects:v38 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  if (*(unsigned char *)(a1 + 88))
  {
LABEL_14:
    id v16 = *(void **)(a1 + 32);
    id v17 = objc_msgSend(*(id *)(a1 + 40), "protocolMap", (void)v28);
    id v18 = [v17 version];
    [v16 setVersion:v18 for:@"EnumeratedProtocolMap"];

    id v15 = [*(id *)(a1 + 32) storeForNodeId:*(void *)(a1 + 48) server:*(void *)(a1 + 56)];

    char v19 = (void *)MEMORY[0x2533B64D0]();
    id v20 = *(id *)(a1 + 40);
    id v21 = HMFGetOSLogHandle();
    id v22 = v21;
    if (v15)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = HMFGetLogIdentifier();
        uint64_t v24 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        id v33 = v23;
        __int16 v34 = 2112;
        uint64_t v35 = v24;
        _os_log_impl(&dword_252495000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to store device(%@) topology", buf, 0x16u);
      }
    }
    else
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        uint64_t v25 = HMFGetLogIdentifier();
        uint64_t v26 = *(void *)(a1 + 48);
        uint64_t v27 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        id v33 = v25;
        __int16 v34 = 2112;
        uint64_t v35 = v26;
        __int16 v36 = 2112;
        uint64_t v37 = v27;
        _os_log_impl(&dword_252495000, v22, OS_LOG_TYPE_INFO, "%{public}@Successfully stored device(%@) topology: %@", buf, 0x20u);
      }
      id v15 = 0;
    }
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x2533B64D0]();
    id v12 = *(id *)(a1 + 40);
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v33 = v14;
      _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_ERROR, "%{public}@No endpoints contain clusters, not storing topology. Enumeration will re-run next time.", buf, 0xCu);
    }
    id v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F10BB0] code:6 userInfo:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
}

void __198__HMMTRDescriptorClusterManager_fetchHAPServicesForEndpoints_endpointDeviceTypes_device_nodeId_isBridge_bridgeAggregateNodeEndpoint_server_topology_hapAccessoryInfo_callbackQueue_completionHandler___block_invoke_280(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v20 = a3;
  if (v5 && [v5 count])
  {
    [*(id *)(a1 + 32) setPartsList:v5 atEndpoint:*(void *)(a1 + 40)];
    char v15 = 1;
  }
  else
  {
    char v15 = 0;
  }
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void **)(a1 + 48);
  uint64_t v18 = *(void *)(a1 + 56);
  uint64_t v19 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 80);
  uint64_t v16 = *(void *)(a1 + 72);
  uint64_t v17 = *(void *)(a1 + 64);
  char v9 = *(unsigned char *)(a1 + 136);
  uint64_t v10 = *(void *)(a1 + 88);
  uint64_t v11 = *(void *)(a1 + 96);
  uint64_t v12 = *(void *)(a1 + 104);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __198__HMMTRDescriptorClusterManager_fetchHAPServicesForEndpoints_endpointDeviceTypes_device_nodeId_isBridge_bridgeAggregateNodeEndpoint_server_topology_hapAccessoryInfo_callbackQueue_completionHandler___block_invoke_2_281;
  v21[3] = &unk_265376200;
  void v21[4] = v7;
  id v22 = v6;
  id v23 = *(id *)(a1 + 32);
  id v24 = *(id *)(a1 + 112);
  id v25 = *(id *)(a1 + 56);
  id v26 = *(id *)(a1 + 80);
  id v27 = *(id *)(a1 + 120);
  id v28 = *(id *)(a1 + 96);
  id v29 = *(id *)(a1 + 64);
  id v30 = *(id *)(a1 + 104);
  id v31 = *(id *)(a1 + 128);
  LOBYTE(v14) = v15;
  LOBYTE(v13) = v9;
  [v7 fetchHAPServicesAtCHIPEndpoint:v22 deviceTopology:v19 endpointDeviceTypes:v18 accessoryInfo:v17 hapToCHIPClusterMappingArray:v16 device:v8 isBridge:v13 bridgeAggregateNodeEndpoint:v10 isComposedDevice:v14 server:v11 callbackQueue:v12 completionHandler:v21];
}

void __198__HMMTRDescriptorClusterManager_fetchHAPServicesForEndpoints_endpointDeviceTypes_device_nodeId_isBridge_bridgeAggregateNodeEndpoint_server_topology_hapAccessoryInfo_callbackQueue_completionHandler___block_invoke_2_281(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    uint64_t v12 = (void *)MEMORY[0x2533B64D0]();
    id v13 = *(id *)(a1 + 32);
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      char v15 = HMFGetLogIdentifier();
      uint64_t v16 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      id v20 = v15;
      __int16 v21 = 2112;
      uint64_t v22 = v16;
      __int16 v23 = 2112;
      id v24 = v11;
      _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_INFO, "%{public}@Failed to get HAP Services at Endpoint:%@. Error:%@. Error is not fatal, continuing with enumeration", buf, 0x20u);
    }
    uint64_t v17 = *(void **)(a1 + 48);
    uint64_t v18 = [MEMORY[0x263EFF8C0] array];
    [v17 setClustersInUse:v18 atEndpoint:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 32) fetchHAPServicesForEndpoints:*(void *)(a1 + 56) endpointDeviceTypes:*(void *)(a1 + 64) device:*(void *)(a1 + 72) nodeId:*(void *)(a1 + 80) isBridge:a3 bridgeAggregateNodeEndpoint:v10 server:*(void *)(a1 + 88) topology:*(void *)(a1 + 48) hapAccessoryInfo:*(void *)(a1 + 96) callbackQueue:*(void *)(a1 + 104) completionHandler:*(void *)(a1 + 112)];
}

uint64_t __198__HMMTRDescriptorClusterManager_fetchHAPServicesForEndpoints_endpointDeviceTypes_device_nodeId_isBridge_bridgeAggregateNodeEndpoint_server_topology_hapAccessoryInfo_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_updateOTARequestorEndpointsInTopology:(id)a3 device:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__6332;
  v26[4] = __Block_byref_object_dispose__6333;
  id v27 = 0;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F42520]) initWithQueue:v12];
  uint64_t v15 = _HMFThreadLocalAsyncContextPush();
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __111__HMMTRDescriptorClusterManager__updateOTARequestorEndpointsInTopology_device_callbackQueue_completionHandler___block_invoke;
  v22[3] = &unk_2653761B0;
  id v24 = v26;
  uint64_t v25 = v15;
  id v16 = v10;
  id v23 = v16;
  uint64_t v17 = [(HMMTRDescriptorClusterManager *)self runBlockForAllEndpointsWithClusterID:&unk_2702B5718 mtrDevice:v11 callbackQueue:v12 block:v22];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __111__HMMTRDescriptorClusterManager__updateOTARequestorEndpointsInTopology_device_callbackQueue_completionHandler___block_invoke_2;
  v20[3] = &unk_2653761D8;
  v20[4] = self;
  id v18 = v13;
  id v21 = v18;
  id v19 = (id)[v17 finally:v20];

  _HMFThreadLocalAsyncContextPop();
  _Block_object_dispose(v26, 8);
}

id __111__HMMTRDescriptorClusterManager__updateOTARequestorEndpointsInTopology_device_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  if (!v6) {
    goto LABEL_4;
  }
  if ([v6 isEqualToNumber:v4])
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    objc_storeStrong((id *)(v5 + 40), a2);
    uint64_t v7 = 1;
    goto LABEL_6;
  }
  uint64_t v7 = 0;
LABEL_6:
  [*(id *)(a1 + 32) setOTARequestorEnabled:v7 atEndpoint:v4];
  uint64_t v8 = [MEMORY[0x263F42538] futureWithNoValue];

  return v8;
}

uint64_t __111__HMMTRDescriptorClusterManager__updateOTARequestorEndpointsInTopology_device_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@Updated OTA requestor endpoints in topology", (uint8_t *)&v7, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  return 1;
}

- (void)fetchDeviceTypesForEndpoints:(id)a3 mtrDevice:(id)a4 endpointDeviceTypes:(id)a5 lastError:(id)a6 callbackQueue:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __134__HMMTRDescriptorClusterManager_fetchDeviceTypesForEndpoints_mtrDevice_endpointDeviceTypes_lastError_callbackQueue_completionHandler___block_invoke;
  v34[3] = &unk_265376160;
  v34[4] = self;
  id v20 = v18;
  id v35 = v20;
  id v21 = v19;
  id v36 = v21;
  uint64_t v22 = (void (**)(void, void, void))MEMORY[0x2533B66E0](v34);
  if ([v14 count])
  {
    if (!v16) {
      id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    id v23 = [v14 popFirstObject];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __134__HMMTRDescriptorClusterManager_fetchDeviceTypesForEndpoints_mtrDevice_endpointDeviceTypes_lastError_callbackQueue_completionHandler___block_invoke_2;
    v25[3] = &unk_265376188;
    id v26 = v17;
    id v27 = self;
    id v28 = v23;
    id v16 = v16;
    id v29 = v16;
    id v30 = v14;
    id v31 = v15;
    id v32 = v20;
    id v33 = v21;
    id v24 = v23;
    [(HMMTRDescriptorClusterManager *)self fetchDeviceTypesWithMTRDevice:v31 atEndpoint:v24 callbackQueue:v32 completionHandler:v25];
  }
  else
  {
    ((void (**)(void, id, id))v22)[2](v22, v16, v17);
  }
}

void __134__HMMTRDescriptorClusterManager_fetchDeviceTypesForEndpoints_mtrDevice_endpointDeviceTypes_lastError_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = (void *)MEMORY[0x2533B64D0]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    id v18 = v10;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@Calling fetch Device Types completion block, error: %@, endpointDeviceTypes %@", buf, 0x20u);
  }
  id v11 = *(NSObject **)(a1 + 40);
  if (v11)
  {
    id v12 = *(void **)(a1 + 48);
    if (v12)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __134__HMMTRDescriptorClusterManager_fetchDeviceTypesForEndpoints_mtrDevice_endpointDeviceTypes_lastError_callbackQueue_completionHandler___block_invoke_269;
      block[3] = &unk_265378900;
      id v16 = v12;
      id v14 = v5;
      id v15 = v6;
      dispatch_async(v11, block);
    }
  }
}

void __134__HMMTRDescriptorClusterManager_fetchDeviceTypesForEndpoints_mtrDevice_endpointDeviceTypes_lastError_callbackQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  if (v6)
  {
    id v8 = (void *)MEMORY[0x2533B64D0]();
    id v9 = *(id *)(a1 + 40);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 48);
      int v19 = 138543874;
      id v20 = v11;
      __int16 v21 = 2112;
      uint64_t v22 = v12;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Device Type Enumeration Endpoint: %@ Failed to get the device types %@. Not fatal, continuing with enumeration...", (uint8_t *)&v19, 0x20u);
    }
    id v13 = v6;

    id v7 = v13;
  }
  else if (v5)
  {
    id v14 = (void *)MEMORY[0x2533B64D0]();
    id v15 = *(id *)(a1 + 40);
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = HMFGetLogIdentifier();
      uint64_t v18 = *(void *)(a1 + 48);
      int v19 = 138543874;
      id v20 = v17;
      __int16 v21 = 2112;
      uint64_t v22 = v18;
      __int16 v23 = 2112;
      id v24 = v5;
      _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_INFO, "%{public}@Device Type Enumeration Endpoint: %@ The List of device types %@", (uint8_t *)&v19, 0x20u);
    }
    [*(id *)(a1 + 56) setObject:v5 forKey:*(void *)(a1 + 48)];
  }
  [*(id *)(a1 + 40) fetchDeviceTypesForEndpoints:*(void *)(a1 + 64) mtrDevice:*(void *)(a1 + 72) endpointDeviceTypes:*(void *)(a1 + 56) lastError:v7 callbackQueue:*(void *)(a1 + 80) completionHandler:*(void *)(a1 + 88)];
}

uint64_t __134__HMMTRDescriptorClusterManager_fetchDeviceTypesForEndpoints_mtrDevice_endpointDeviceTypes_lastError_callbackQueue_completionHandler___block_invoke_269(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchDeviceTypesForEndpoints:(id)a3 device:(id)a4 endpointDeviceTypes:(id)a5 lastError:(id)a6 callbackQueue:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __131__HMMTRDescriptorClusterManager_fetchDeviceTypesForEndpoints_device_endpointDeviceTypes_lastError_callbackQueue_completionHandler___block_invoke;
  v34[3] = &unk_265376160;
  v34[4] = self;
  id v20 = v18;
  id v35 = v20;
  id v21 = v19;
  id v36 = v21;
  uint64_t v22 = (void (**)(void, void, void))MEMORY[0x2533B66E0](v34);
  if ([v14 count])
  {
    if (!v16) {
      id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    __int16 v23 = [v14 popFirstObject];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __131__HMMTRDescriptorClusterManager_fetchDeviceTypesForEndpoints_device_endpointDeviceTypes_lastError_callbackQueue_completionHandler___block_invoke_2;
    v25[3] = &unk_265376188;
    id v26 = v17;
    id v27 = self;
    id v28 = v23;
    id v16 = v16;
    id v29 = v16;
    id v30 = v14;
    id v31 = v15;
    id v32 = v20;
    id v33 = v21;
    id v24 = v23;
    [(HMMTRDescriptorClusterManager *)self fetchDeviceTypesForDevice:v31 atEndpoint:v24 callbackQueue:v32 completionHandler:v25];
  }
  else
  {
    ((void (**)(void, id, id))v22)[2](v22, v16, v17);
  }
}

void __131__HMMTRDescriptorClusterManager_fetchDeviceTypesForEndpoints_device_endpointDeviceTypes_lastError_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x2533B64D0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    id v18 = v10;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@Calling fetch Device Types completion block, error: %@, endpointDeviceTypes %@", buf, 0x20u);
  }
  id v11 = *(NSObject **)(a1 + 40);
  if (v11)
  {
    uint64_t v12 = *(void **)(a1 + 48);
    if (v12)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __131__HMMTRDescriptorClusterManager_fetchDeviceTypesForEndpoints_device_endpointDeviceTypes_lastError_callbackQueue_completionHandler___block_invoke_268;
      block[3] = &unk_265378900;
      id v16 = v12;
      id v14 = v5;
      id v15 = v6;
      dispatch_async(v11, block);
    }
  }
}

void __131__HMMTRDescriptorClusterManager_fetchDeviceTypesForEndpoints_device_endpointDeviceTypes_lastError_callbackQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  if (v6)
  {
    id v8 = (void *)MEMORY[0x2533B64D0]();
    id v9 = *(id *)(a1 + 40);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 48);
      int v19 = 138543874;
      id v20 = v11;
      __int16 v21 = 2112;
      uint64_t v22 = v12;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Device Type Enumeration Endpoint: %@ Failed to get the device types %@. Not fatal, continuing with enumeration...", (uint8_t *)&v19, 0x20u);
    }
    id v13 = v6;

    id v7 = v13;
  }
  else if (v5)
  {
    id v14 = (void *)MEMORY[0x2533B64D0]();
    id v15 = *(id *)(a1 + 40);
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = HMFGetLogIdentifier();
      uint64_t v18 = *(void *)(a1 + 48);
      int v19 = 138543874;
      id v20 = v17;
      __int16 v21 = 2112;
      uint64_t v22 = v18;
      __int16 v23 = 2112;
      id v24 = v5;
      _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_INFO, "%{public}@Device Type Enumeration Endpoint: %@ The List of device types %@", (uint8_t *)&v19, 0x20u);
    }
    [*(id *)(a1 + 56) setObject:v5 forKey:*(void *)(a1 + 48)];
  }
  [*(id *)(a1 + 40) fetchDeviceTypesForEndpoints:*(void *)(a1 + 64) device:*(void *)(a1 + 72) endpointDeviceTypes:*(void *)(a1 + 56) lastError:v7 callbackQueue:*(void *)(a1 + 80) completionHandler:*(void *)(a1 + 88)];
}

uint64_t __131__HMMTRDescriptorClusterManager_fetchDeviceTypesForEndpoints_device_endpointDeviceTypes_lastError_callbackQueue_completionHandler___block_invoke_268(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)hapServiceDescriptionForServiceType:(id)a3 clustersInUse:(id)a4 endpoint:(id)a5 name:(id)a6 hapToCHIPClusterMappingArray:(id)a7 clusterClassesToQuery:(id)a8 hapServicesToCheckForFeatureMap:(id)a9 hapServicesToCheckForOptionalMatterAttribute:(id)a10 server:(id)a11
{
  uint64_t v190 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v159 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v153 = a8;
  __int16 v21 = v20;
  id v149 = a9;
  id v148 = a10;
  v161 = v18;
  id v158 = a11;
  uint64_t v22 = [HMMTRHAPServiceDescription alloc];
  __int16 v23 = [(HMMTRDescriptorClusterManager *)self protocolMap];
  id v147 = v19;
  id v24 = -[HMMTRHAPServiceDescription initWithType:endpoint:name:optionalServiceLabelIndexIncluded:](v22, "initWithType:endpoint:name:optionalServiceLabelIndexIncluded:", v17, v18, v19, [v23 optionalServiceLabelIndexIncludedInService:v17]);

  v160 = self;
  uint64_t v25 = [(HMMTRDescriptorClusterManager *)self protocolMap];
  v157 = v24;
  id v26 = [(HMMTRHAPServiceDescription *)v24 serviceType];
  id v27 = [v25 requiredCharacteristicsForService:v26];

  long long v176 = 0u;
  long long v177 = 0u;
  long long v174 = 0u;
  long long v175 = 0u;
  id v28 = v27;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v174 objects:v189 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v175;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v175 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v139 = v32;
        id v33 = *(void **)(*((void *)&v174 + 1) + 8 * v32);
        __int16 v34 = [(HMMTRDescriptorClusterManager *)v160 protocolMap];
        v150 = v33;
        id v35 = [v34 getIDForCharacteristic:v33];

        if (!v35)
        {
          v126 = (void *)MEMORY[0x2533B64D0]();
          v127 = v160;
          v128 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
          {
            v129 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v181 = v129;
            __int16 v182 = 2112;
            v183 = v150;
            __int16 v184 = 2112;
            v185 = v161;
            _os_log_impl(&dword_252495000, v128, OS_LOG_TYPE_ERROR, "%{public}@Failed to find HAP characteristic ID for characteristic %@ on endpoint %@, aborting", buf, 0x20u);
          }
          id v35 = 0;
          goto LABEL_94;
        }
        if (!v21 || ![v21 count])
        {
          v121 = (void *)MEMORY[0x2533B64D0]();
          v122 = v160;
          v123 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
          {
            v124 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v181 = v124;
            __int16 v182 = 2112;
            v183 = v150;
            __int16 v184 = 2112;
            v185 = v161;
            v125 = "%{public}@Failed to find HAP to CHIP cluster mapping for characteristic %@ on endpoint %@, aborting";
            goto LABEL_92;
          }
LABEL_93:

LABEL_94:
          v111 = v147;
LABEL_76:

          v110 = 0;
          id v65 = v28;
          goto LABEL_81;
        }
        v145 = v28;
        long long v172 = 0u;
        long long v173 = 0u;
        long long v170 = 0u;
        long long v171 = 0u;
        id obj = [v21 objectForKeyedSubscript:v35];
        uint64_t v36 = [obj countByEnumeratingWithState:&v170 objects:v188 count:16];
        if (!v36)
        {

LABEL_90:
          v121 = (void *)MEMORY[0x2533B64D0]();
          v122 = v160;
          v123 = HMFGetOSLogHandle();
          id v28 = v145;
          if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
          {
            v124 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v181 = v124;
            __int16 v182 = 2112;
            v183 = v35;
            __int16 v184 = 2112;
            v185 = v161;
            v125 = "%{public}@Mandatory characteristic %@ cannot be found in clusters in use at endpoint %@.";
LABEL_92:
            _os_log_impl(&dword_252495000, v123, OS_LOG_TYPE_ERROR, v125, buf, 0x20u);
          }
          goto LABEL_93;
        }
        uint64_t v37 = v36;
        uint64_t v135 = v30;
        uint64_t v137 = v31;
        v141 = v21;
        id v143 = v17;
        char v38 = 0;
        uint64_t v155 = *(void *)v171;
        do
        {
          for (uint64_t i = 0; i != v37; ++i)
          {
            if (*(void *)v171 != v155) {
              objc_enumerationMutation(obj);
            }
            id v40 = *(void **)(*((void *)&v170 + 1) + 8 * i);
            id v41 = (void *)MEMORY[0x2533B64D0]();
            id v42 = v160;
            id v43 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              id v44 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138544130;
              v181 = v44;
              __int16 v182 = 2112;
              v183 = v35;
              __int16 v184 = 2112;
              v185 = v40;
              __int16 v186 = 2112;
              v187 = v161;
              _os_log_impl(&dword_252495000, v43, OS_LOG_TYPE_INFO, "%{public}@Looking for required HAP Characteristic %@ as its matching CHIP clusterID %@ on endpoint %@", buf, 0x2Au);
            }
            id v45 = [v159 objectForKeyedSubscript:v40];
            char v46 = (v45 == 0) | v38;

            if ((v46 & 1) == 0)
            {
              id v47 = (void *)MEMORY[0x2533B64D0]([v158 setClusterIDForCharacteristic:v35 endpointID:v161 clusterID:v40]);
              uint64_t v48 = v42;
              __int16 v49 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
              {
                uint64_t v50 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138544130;
                v181 = v50;
                __int16 v182 = 2112;
                v183 = v35;
                __int16 v184 = 2112;
                v185 = v40;
                __int16 v186 = 2112;
                v187 = v161;
                _os_log_impl(&dword_252495000, v49, OS_LOG_TYPE_INFO, "%{public}@Constructed HAP service description for HAP Characteristic %@, CHIP clusterID %@, endpoint %@", buf, 0x2Au);
              }
              [(HMMTRHAPServiceDescription *)v157 addMandatoryCharacteristic:v35];
              __int16 v51 = [(HMMTRDescriptorClusterManager *)v48 protocolMap];
              id v52 = [v158 clusterIDCharacteristicMap];
              uint64_t v53 = [v51 getMTRClusterClassForCharacteristic:v35 endpointID:v161 clusterIDCharacteristicMap:v52];

              if (!v53)
              {
                v112 = (void *)MEMORY[0x2533B64D0]();
                v113 = v48;
                v114 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
                {
                  v115 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543874;
                  v181 = v115;
                  __int16 v182 = 2112;
                  v183 = v35;
                  __int16 v184 = 2112;
                  v185 = v161;
                  _os_log_impl(&dword_252495000, v114, OS_LOG_TYPE_ERROR, "%{public}@Cluster class name not found for mandatory characteristic %@ in use at endpoint %@", buf, 0x20u);
                }

                __int16 v21 = v141;
                id v17 = v143;
                id v28 = v145;
                v111 = v147;
                goto LABEL_76;
              }
              [v153 addObject:v53];
              id v54 = [(HMMTRDescriptorClusterManager *)v48 protocolMap];
              id v55 = [v54 getRequiredFeaturesBitmapForCharacteristic:v150];

              BOOL v56 = (void *)MEMORY[0x2533B64D0]();
              id v57 = v48;
              v58 = HMFGetOSLogHandle();
              BOOL v59 = os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG);
              if (v55)
              {
                if (v59)
                {
                  v60 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138544130;
                  v181 = v60;
                  __int16 v182 = 2112;
                  v183 = v55;
                  __int16 v184 = 2112;
                  v185 = v35;
                  __int16 v186 = 2112;
                  v187 = v161;
                  _os_log_impl(&dword_252495000, v58, OS_LOG_TYPE_DEBUG, "%{public}@Found required feature map %@ for mandatory characteristic %@ on endpoint %@", buf, 0x2Au);
                }
                [(HMMTRHAPServiceDescription *)v157 addFeatureMapForCharacteristic:v35 featureMap:v55];
                [v149 addObject:v157];
              }
              else
              {
                if (v59)
                {
                  id v61 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543874;
                  v181 = v61;
                  __int16 v182 = 2112;
                  v183 = v35;
                  __int16 v184 = 2112;
                  v185 = v161;
                  _os_log_impl(&dword_252495000, v58, OS_LOG_TYPE_DEBUG, "%{public}@Feature map information not available for mandatory characteristic %@ on endpoint %@", buf, 0x20u);
                }
              }

              char v38 = 1;
            }
          }
          uint64_t v37 = [obj countByEnumeratingWithState:&v170 objects:v188 count:16];
        }
        while (v37);

        __int16 v21 = v141;
        id v17 = v143;
        if ((v38 & 1) == 0) {
          goto LABEL_90;
        }

        uint64_t v31 = v137;
        uint64_t v32 = v139 + 1;
        uint64_t v30 = v135;
        id v28 = v145;
      }
      while (v139 + 1 != v135);
      uint64_t v30 = [v145 countByEnumeratingWithState:&v174 objects:v189 count:16];
    }
    while (v30);
  }

  v62 = [(HMMTRDescriptorClusterManager *)v160 protocolMap];
  uint64_t v63 = [(HMMTRHAPServiceDescription *)v157 serviceType];
  v64 = [v62 optionalCharacteristicsForService:v63];

  long long v168 = 0u;
  long long v169 = 0u;
  long long v166 = 0u;
  long long v167 = 0u;
  id v65 = v64;
  uint64_t v66 = [v65 countByEnumeratingWithState:&v166 objects:v179 count:16];
  if (!v66) {
    goto LABEL_72;
  }
  uint64_t v67 = v66;
  uint64_t v68 = *(void *)v167;
  v142 = v21;
  id v144 = v17;
  id v146 = v28;
  v140 = v65;
  uint64_t v134 = *(void *)v167;
  while (2)
  {
    uint64_t v69 = 0;
    uint64_t v136 = v67;
    do
    {
      if (*(void *)v167 != v68) {
        objc_enumerationMutation(v65);
      }
      id v70 = *(void **)(*((void *)&v166 + 1) + 8 * v69);
      id v71 = [(HMMTRDescriptorClusterManager *)v160 protocolMap];
      v154 = v70;
      BOOL v72 = [v71 getIDForCharacteristic:v70];

      if (!v72)
      {
        v130 = (void *)MEMORY[0x2533B64D0]();
        v131 = v160;
        v132 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR))
        {
          v133 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v181 = v133;
          __int16 v182 = 2112;
          v183 = v154;
          __int16 v184 = 2112;
          v185 = v161;
          _os_log_impl(&dword_252495000, v132, OS_LOG_TYPE_ERROR, "%{public}@Failed to find HAP characteristic ID for characteristic %@ on endpoint %@, aborting", buf, 0x20u);
        }
        BOOL v72 = 0;
        v111 = v147;
LABEL_80:

        v110 = 0;
        goto LABEL_81;
      }
      uint64_t v138 = v69;
      long long v164 = 0u;
      long long v165 = 0u;
      long long v162 = 0u;
      long long v163 = 0u;
      id v73 = [v21 objectForKeyedSubscript:v72];
      uint64_t v156 = [v73 countByEnumeratingWithState:&v162 objects:v178 count:16];
      if (!v156)
      {

LABEL_67:
        v106 = (void *)MEMORY[0x2533B64D0]();
        v107 = v160;
        v108 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
        {
          v109 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v181 = v109;
          __int16 v182 = 2112;
          v183 = v72;
          __int16 v184 = 2112;
          v185 = v161;
          _os_log_impl(&dword_252495000, v108, OS_LOG_TYPE_ERROR, "%{public}@Optional characteristic %@ cannot be found in clusters in use at endpoint %@.", buf, 0x20u);
        }
        goto LABEL_70;
      }
      char v74 = 0;
      uint64_t v75 = *(void *)v163;
      uint64_t v151 = *(void *)v163;
      while (2)
      {
        for (uint64_t j = 0; j != v156; ++j)
        {
          if (*(void *)v163 != v75) {
            objc_enumerationMutation(v73);
          }
          id v77 = *(void **)(*((void *)&v162 + 1) + 8 * j);
          id v78 = (void *)MEMORY[0x2533B64D0]();
          id v79 = v160;
          uint64_t v80 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
          {
            id v81 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138544130;
            v181 = v81;
            __int16 v182 = 2112;
            v183 = v72;
            __int16 v184 = 2112;
            v185 = v77;
            __int16 v186 = 2112;
            v187 = v161;
            _os_log_impl(&dword_252495000, v80, OS_LOG_TYPE_INFO, "%{public}@Looking for optional HAP Characteristic %@ as its matching CHIP clusterID %@ on endpoint %@", buf, 0x2Au);
          }
          id v82 = [v159 objectForKeyedSubscript:v77];
          char v83 = (v82 == 0) | v74;

          if ((v83 & 1) == 0)
          {
            id v84 = (void *)MEMORY[0x2533B64D0]([v158 setClusterIDForCharacteristic:v72 endpointID:v161 clusterID:v77]);
            id v85 = v79;
            id v86 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
            {
              BOOL v87 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138544130;
              v181 = v87;
              __int16 v182 = 2112;
              v183 = v72;
              __int16 v184 = 2112;
              v185 = v77;
              __int16 v186 = 2112;
              v187 = v161;
              _os_log_impl(&dword_252495000, v86, OS_LOG_TYPE_INFO, "%{public}@Constructed HAP service description for optional HAP Characteristic %@, CHIP clusterID %@, endpoint %@", buf, 0x2Au);
            }
            [(HMMTRHAPServiceDescription *)v157 addOptionalCharacteristic:v72];
            long long v88 = [(HMMTRDescriptorClusterManager *)v85 protocolMap];
            id v89 = [v158 clusterIDCharacteristicMap];
            id v90 = [v88 getMTRClusterClassForCharacteristic:v72 endpointID:v161 clusterIDCharacteristicMap:v89];

            if (!v90)
            {
              v116 = (void *)MEMORY[0x2533B64D0]();
              v117 = v85;
              v118 = HMFGetOSLogHandle();
              id v65 = v140;
              if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
              {
                v119 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543874;
                v181 = v119;
                __int16 v182 = 2112;
                v183 = v72;
                __int16 v184 = 2112;
                v185 = v161;
                _os_log_impl(&dword_252495000, v118, OS_LOG_TYPE_ERROR, "%{public}@Cluster class name not found for optional characteristic %@ in use at endpoint %@", buf, 0x20u);
              }

              __int16 v21 = v142;
              id v17 = v144;
              id v28 = v146;
              v111 = v147;
              goto LABEL_80;
            }
            long long v91 = v73;
            [v153 addObject:v90];
            long long v92 = [(HMMTRDescriptorClusterManager *)v85 protocolMap];
            long long v93 = [v92 getRequiredFeaturesBitmapForCharacteristic:v154];

            long long v94 = (void *)MEMORY[0x2533B64D0]();
            long long v95 = v85;
            v96 = HMFGetOSLogHandle();
            BOOL v97 = os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG);
            if (v93)
            {
              if (v97)
              {
                __int16 v98 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138544130;
                v181 = v98;
                __int16 v182 = 2112;
                v183 = v93;
                __int16 v184 = 2112;
                v185 = v72;
                __int16 v186 = 2112;
                v187 = v161;
                _os_log_impl(&dword_252495000, v96, OS_LOG_TYPE_DEBUG, "%{public}@Found required feature map %@ for optional characteristic %@ on endpoint %@", buf, 0x2Au);
              }
              [(HMMTRHAPServiceDescription *)v157 addFeatureMapForCharacteristic:v72 featureMap:v93];
              [v149 addObject:v157];
            }
            else
            {
              if (v97)
              {
                id v99 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543874;
                v181 = v99;
                __int16 v182 = 2112;
                v183 = v72;
                __int16 v184 = 2112;
                v185 = v161;
                _os_log_impl(&dword_252495000, v96, OS_LOG_TYPE_DEBUG, "%{public}@Feature map information not available for optional characteristic %@ on endpoint %@", buf, 0x20u);
              }
            }
            __int16 v100 = [(HMMTRDescriptorClusterManager *)v95 protocolMap];
            int v101 = [v100 isRequiresOptionalMatterAttributeForCharacteristic:v154];

            if (v101)
            {
              v102 = (void *)MEMORY[0x2533B64D0]();
              v103 = v95;
              uint64_t v104 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
              {
                v105 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543874;
                v181 = v105;
                __int16 v182 = 2112;
                v183 = v72;
                __int16 v184 = 2112;
                v185 = v161;
                _os_log_impl(&dword_252495000, v104, OS_LOG_TYPE_DEBUG, "%{public}@Optional characteristic %@ on endpoint %@ requires an additional Optional Matter attribute check", buf, 0x20u);
              }
              [v148 addObject:v157];
            }

            char v74 = 1;
            id v73 = v91;
            uint64_t v75 = v151;
          }
        }
        uint64_t v156 = [v73 countByEnumeratingWithState:&v162 objects:v178 count:16];
        if (v156) {
          continue;
        }
        break;
      }

      __int16 v21 = v142;
      id v17 = v144;
      id v28 = v146;
      if ((v74 & 1) == 0) {
        goto LABEL_67;
      }
LABEL_70:

      uint64_t v69 = v138 + 1;
      id v65 = v140;
      uint64_t v68 = v134;
    }
    while (v138 + 1 != v136);
    uint64_t v67 = [v140 countByEnumeratingWithState:&v166 objects:v179 count:16];
    if (v67) {
      continue;
    }
    break;
  }
LABEL_72:

  v110 = v157;
  v111 = v147;
LABEL_81:

  return v110;
}

- (id)_buildClustersInUseDictWithClustersInUse:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v11 = objc_msgSend(NSString, "stringWithFormat:", @"%lX", objc_msgSend(v10, "unsignedLongValue"));
        [v4 setObject:v10 forKeyedSubscript:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)hapServiceDescriptionsForTopology:(id)a3 namesDictionary:(id)a4 server:(id)a5
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v55 = a4;
  id v71 = a5;
  __int16 v51 = [(HMMTRDescriptorClusterManager *)self protocolMap];
  id v70 = [v51 hapToCHIPClusterMappingArray];
  id v50 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v50 setNumberStyle:1];
  id v53 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v69 = v8;
  id v9 = [v8 hapServiceTypes];
  id v10 = (void *)MEMORY[0x263EFF980];
  uint64_t v66 = v9;
  id v11 = [v9 allKeys];
  uint64_t v12 = [v10 arrayWithArray:v11];

  id v64 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v12 sortUsingComparator:&__block_literal_global_263];
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id obj = v12;
  uint64_t v56 = [obj countByEnumeratingWithState:&v91 objects:v99 count:16];
  if (v56)
  {
    uint64_t v54 = *(void *)v92;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v92 != v54) {
          objc_enumerationMutation(obj);
        }
        uint64_t v61 = v13;
        long long v14 = *(void **)(*((void *)&v91 + 1) + 8 * v13);
        uint64_t v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "integerValue"));
        id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
        char v74 = objc_opt_new();
        id v73 = objc_opt_new();
        BOOL v72 = objc_opt_new();
        id v17 = [v69 getPartsListAtEndpoint:v15];
        uint64_t v18 = [v69 getNodeLabelAtEndpoint:v15];
        if (v18) {
          id v19 = (__CFString *)v18;
        }
        else {
          id v19 = &stru_2702A0B38;
        }
        [v55 setObject:v19 forKey:v14];
        id v20 = [v69 getClustersInUseAtEndpoint:v15];
        uint64_t v21 = [(HMMTRDescriptorClusterManager *)self _buildClustersInUseDictWithClustersInUse:v20];

        id v57 = v14;
        uint64_t v22 = [v66 objectForKeyedSubscript:v14];
        long long v87 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        id v62 = v22;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v87 objects:v98 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v88;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v88 != v25) {
                objc_enumerationMutation(v62);
              }
              id v27 = [(HMMTRDescriptorClusterManager *)self hapServiceDescriptionForServiceType:*(void *)(*((void *)&v87 + 1) + 8 * i) clustersInUse:v21 endpoint:v15 name:v19 hapToCHIPClusterMappingArray:v70 clusterClassesToQuery:v74 hapServicesToCheckForFeatureMap:v73 hapServicesToCheckForOptionalMatterAttribute:v72 server:v71];
              id v28 = v27;
              if (v27)
              {
                [v27 setEndpoint:v15];
                [(HMMTRDescriptorClusterManager *)self _removeDisabledCharacteristicsFromServiceDescription:v28 endpoint:v15 topology:v69];
                [v16 addObject:v28];
              }
            }
            uint64_t v24 = [v62 countByEnumeratingWithState:&v87 objects:v98 count:16];
          }
          while (v24);
        }
        v58 = (void *)v21;
        BOOL v59 = v19;
        v60 = (void *)v15;
        long long v85 = 0u;
        long long v86 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        id v63 = v17;
        uint64_t v67 = [v63 countByEnumeratingWithState:&v83 objects:v97 count:16];
        if (v67)
        {
          uint64_t v65 = *(void *)v84;
          do
          {
            uint64_t v29 = 0;
            do
            {
              if (*(void *)v84 != v65) {
                objc_enumerationMutation(v63);
              }
              uint64_t v68 = v29;
              uint64_t v30 = *(void **)(*((void *)&v83 + 1) + 8 * v29);
              uint64_t v31 = [v30 stringValue];
              uint64_t v32 = [v66 objectForKeyedSubscript:v31];

              id v33 = [v69 getClustersInUseAtEndpoint:v30];
              __int16 v34 = [(HMMTRDescriptorClusterManager *)self _buildClustersInUseDictWithClustersInUse:v33];

              id v35 = [v69 getNodeLabelAtEndpoint:v30];
              long long v79 = 0u;
              long long v80 = 0u;
              long long v81 = 0u;
              long long v82 = 0u;
              id v36 = v32;
              uint64_t v37 = [v36 countByEnumeratingWithState:&v79 objects:v96 count:16];
              if (v37)
              {
                uint64_t v38 = v37;
                uint64_t v39 = *(void *)v80;
                do
                {
                  for (uint64_t j = 0; j != v38; ++j)
                  {
                    if (*(void *)v80 != v39) {
                      objc_enumerationMutation(v36);
                    }
                    id v41 = [(HMMTRDescriptorClusterManager *)self hapServiceDescriptionForServiceType:*(void *)(*((void *)&v79 + 1) + 8 * j) clustersInUse:v34 endpoint:v30 name:v35 hapToCHIPClusterMappingArray:v70 clusterClassesToQuery:v74 hapServicesToCheckForFeatureMap:v73 hapServicesToCheckForOptionalMatterAttribute:v72 server:v71];
                    id v42 = v41;
                    if (v41)
                    {
                      [v41 setEndpoint:v30];
                      [(HMMTRDescriptorClusterManager *)self _removeDisabledCharacteristicsFromServiceDescription:v42 endpoint:v30 topology:v69];
                      [v16 addObject:v42];
                    }
                  }
                  uint64_t v38 = [v36 countByEnumeratingWithState:&v79 objects:v96 count:16];
                }
                while (v38);
              }

              id v43 = [v30 stringValue];
              [v64 addObject:v43];

              uint64_t v29 = v68 + 1;
            }
            while (v68 + 1 != v67);
            uint64_t v67 = [v63 countByEnumeratingWithState:&v83 objects:v97 count:16];
          }
          while (v67);
        }

        if (v16) {
          [v53 setObject:v16 forKey:v57];
        }

        uint64_t v13 = v61 + 1;
      }
      while (v61 + 1 != v56);
      uint64_t v56 = [obj countByEnumeratingWithState:&v91 objects:v99 count:16];
    }
    while (v56);
  }

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v44 = v64;
  uint64_t v45 = [v44 countByEnumeratingWithState:&v75 objects:v95 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v76;
    do
    {
      for (uint64_t k = 0; k != v46; ++k)
      {
        if (*(void *)v76 != v47) {
          objc_enumerationMutation(v44);
        }
        [v53 removeObjectForKey:*(void *)(*((void *)&v75 + 1) + 8 * k)];
      }
      uint64_t v46 = [v44 countByEnumeratingWithState:&v75 objects:v95 count:16];
    }
    while (v46);
  }

  return v53;
}

uint64_t __90__HMMTRDescriptorClusterManager_hapServiceDescriptionsForTopology_namesDictionary_server___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "integerValue"));
  uint64_t v7 = NSNumber;
  uint64_t v8 = [v5 integerValue];

  id v9 = [v7 numberWithInteger:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

- (void)_removeDisabledCharacteristicsFromServiceDescription:(id)a3 endpoint:(id)a4 topology:(id)a5
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v10 = [v7 requiredCharacteristics];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v47 objects:v56 count:16];
  id v41 = v8;
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v48;
    id v39 = v7;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v48 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = +[HMMTRUtilities hmmtr_shortTypeFromUUID:*(void *)(*((void *)&v47 + 1) + 8 * i)];
        id v16 = [v7 serviceType];
        int v17 = [v9 isHAPCharacteristicDisabledAtEndpoint:v8 hapServiceType:v16 hapCharacteristic:v15];

        if (v17)
        {
          uint64_t v18 = (void *)MEMORY[0x2533B64D0]([v7 removeCharacteristic:v15]);
          id v19 = self;
          id v20 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            uint64_t v21 = v12;
            uint64_t v22 = v13;
            id v23 = v9;
            uint64_t v25 = v24 = v10;
            *(_DWORD *)buf = 138543618;
            id v53 = v25;
            __int16 v54 = 2112;
            id v55 = v15;
            _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Removed disabled required characteristic : %@", buf, 0x16u);

            uint64_t v10 = v24;
            id v9 = v23;
            uint64_t v13 = v22;
            uint64_t v12 = v21;
            id v7 = v39;
          }

          id v8 = v41;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v47 objects:v56 count:16];
    }
    while (v12);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = [v7 optionalCharacteristics];
  uint64_t v26 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v26)
  {
    uint64_t v28 = v26;
    uint64_t v29 = *(void *)v44;
    *(void *)&long long v27 = 138543618;
    long long v38 = v27;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v44 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = +[HMMTRUtilities hmmtr_shortTypeFromUUID:](HMMTRUtilities, "hmmtr_shortTypeFromUUID:", *(void *)(*((void *)&v43 + 1) + 8 * j), v38);
        uint64_t v32 = [v7 serviceType];
        int v33 = [v9 isHAPCharacteristicDisabledAtEndpoint:v8 hapServiceType:v32 hapCharacteristic:v31];

        if (v33)
        {
          __int16 v34 = (void *)MEMORY[0x2533B64D0]([v7 removeCharacteristic:v31]);
          id v35 = self;
          id v36 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v37 = HMFGetLogIdentifier();
            *(_DWORD *)buf = v38;
            id v53 = v37;
            __int16 v54 = 2112;
            id v55 = v31;
            _os_log_impl(&dword_252495000, v36, OS_LOG_TYPE_DEBUG, "%{public}@Removed disabled optional characteristic : %@", buf, 0x16u);
          }
          id v8 = v41;
        }
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v28);
  }
}

- (void)fetchHAPServicesAtCHIPEndpoint:(id)a3 deviceTopology:(id)a4 endpointDeviceTypes:(id)a5 accessoryInfo:(id)a6 hapToCHIPClusterMappingArray:(id)a7 device:(id)a8 isBridge:(BOOL)a9 bridgeAggregateNodeEndpoint:(id)a10 isComposedDevice:(BOOL)a11 server:(id)a12 callbackQueue:(id)a13 completionHandler:(id)a14
{
  uint64_t v137 = *MEMORY[0x263EF8340];
  id v19 = a3;
  id v105 = a4;
  id v92 = a5;
  id v94 = a6;
  id v103 = a7;
  id v20 = a8;
  id v21 = a10;
  id v104 = a12;
  id v22 = a13;
  id v23 = v21;
  id v91 = a14;
  uint64_t v24 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v25 = self;
  uint64_t v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v28 = id v27 = v20;
    *(_DWORD *)buf = 138544130;
    v130 = v28;
    __int16 v131 = 2112;
    id v132 = v19;
    __int16 v133 = 2112;
    id v134 = v21;
    __int16 v135 = 1024;
    BOOL v136 = a11;
    _os_log_impl(&dword_252495000, v26, OS_LOG_TYPE_INFO, "%{public}@Fetching server list from descriptor cluster at endpoint %@, bridgeAggregateNodeEndpoint %@, isComposedDevice %d", buf, 0x26u);

    id v20 = v27;
  }

  long long v93 = v22;
  uint64_t v29 = [(HMMTRDescriptorClusterManager *)v25 buildClusterDescriptorWithDevice:v20 endpointID:v19 queue:v22];
  id v30 = objc_alloc_init(MEMORY[0x263F10FA0]);
  uint64_t v31 = [v29 readAttributeServerListWithParams:v30];

  id v32 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v31 forIdentify:@"ServerList"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v33 = v32;
  }
  else {
    int v33 = 0;
  }
  id v34 = v33;
  long long v90 = v32;

  long long v88 = v34;
  if (v34)
  {
    if ([v34 count])
    {
      long long v83 = v29;
      long long v84 = v21;
      long long v86 = v20;
      [v105 setClustersInUse:v34 atEndpoint:v19];
      uint64_t v100 = [(HMMTRDescriptorClusterManager *)v25 _buildClustersInUseDictWithClustersInUse:v34];
      long long v80 = [v105 getHAPServiceTypesAtEndpoint:v19];
      v102 = v19;
      long long v85 = [v105 getHAPCategoriesAtEndpoint:v19];
      id v35 = objc_opt_new();
      id v99 = objc_opt_new();
      BOOL v97 = objc_opt_new();
      id v36 = (void *)MEMORY[0x2533B64D0]();
      uint64_t v37 = v25;
      long long v38 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        id v39 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v130 = v39;
        __int16 v131 = 2112;
        id v132 = v19;
        __int16 v133 = 2112;
        id v134 = v34;
        _os_log_impl(&dword_252495000, v38, OS_LOG_TYPE_INFO, "%{public}@Retrieved at endpoint %@ following clusters in use %@", buf, 0x20u);
      }
      id v40 = (void *)MEMORY[0x2533B64D0]();
      id v41 = v37;
      id v42 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        long long v43 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v130 = v43;
        __int16 v131 = 2112;
        id v132 = v102;
        __int16 v133 = 2112;
        id v134 = v85;
        _os_log_impl(&dword_252495000, v42, OS_LOG_TYPE_INFO, "%{public}@Retrieved at endpoint %@ following HAP categories in use %@", buf, 0x20u);
      }
      long long v82 = v31;

      long long v44 = v41;
      long long v95 = objc_opt_new();
      long long v124 = 0u;
      long long v125 = 0u;
      long long v126 = 0u;
      long long v127 = 0u;
      id v45 = v80;
      uint64_t v46 = [v45 countByEnumeratingWithState:&v124 objects:v128 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = *(void *)v125;
        do
        {
          for (uint64_t i = 0; i != v47; ++i)
          {
            if (*(void *)v125 != v48) {
              objc_enumerationMutation(v45);
            }
            uint64_t v50 = *(void *)(*((void *)&v124 + 1) + 8 * i);
            uint64_t v51 = [v105 getNodeLabelAtEndpoint:v102];
            if (v51) {
              id v52 = (__CFString *)v51;
            }
            else {
              id v52 = &stru_2702A0B38;
            }
            id v53 = [(HMMTRDescriptorClusterManager *)v41 hapServiceDescriptionForServiceType:v50 clustersInUse:v100 endpoint:v102 name:v52 hapToCHIPClusterMappingArray:v103 clusterClassesToQuery:v35 hapServicesToCheckForFeatureMap:v99 hapServicesToCheckForOptionalMatterAttribute:v97 server:v104];
            __int16 v54 = v53;
            if (v53)
            {
              [v53 setEndpoint:v102];
              [v95 addObject:v54];
            }
          }
          uint64_t v47 = [v45 countByEnumeratingWithState:&v124 objects:v128 count:16];
        }
        while (v47);
      }
      long long v81 = v45;

      long long v79 = v35;
      id v55 = [v35 allObjects];
      long long v78 = (void *)[v55 mutableCopy];

      uint64_t v56 = [v35 allObjects];
      long long v77 = (void *)[v56 mutableCopy];

      long long v76 = objc_opt_new();
      v106[0] = MEMORY[0x263EF8330];
      v106[1] = 3221225472;
      v106[2] = __242__HMMTRDescriptorClusterManager_fetchHAPServicesAtCHIPEndpoint_deviceTopology_endpointDeviceTypes_accessoryInfo_hapToCHIPClusterMappingArray_device_isBridge_bridgeAggregateNodeEndpoint_isComposedDevice_server_callbackQueue_completionHandler___block_invoke;
      v106[3] = &unk_265376138;
      v106[4] = v41;
      id v107 = v102;
      id v108 = v86;
      uint64_t v57 = v92;
      id v109 = v92;
      id v110 = v93;
      id v111 = v77;
      id v112 = v97;
      id v113 = v76;
      id v114 = v95;
      id v115 = v105;
      id v23 = v84;
      id v116 = v84;
      id v117 = v104;
      BOOL v122 = a9;
      id v121 = v91;
      id v118 = v85;
      id v119 = v94;
      v58 = v88;
      id v120 = v88;
      BOOL v123 = a11;
      id v89 = v85;
      id v59 = v95;
      id v96 = v76;
      id v19 = v102;
      id v98 = v97;
      id v87 = v77;
      id v20 = v86;
      v60 = v91;
      [(HMMTRDescriptorClusterManager *)v44 _verifyHAPCharacteristicSupportAtCHIPEndpoint:v107 device:v108 endpointDeviceTypes:v109 callbackQueue:v110 clusterClassToQueryForFeatureMap:v78 hapServicesToCheckForFeatureMap:v99 hapServicesInUse:v59 deviceTopology:v115 bridgeAggregateNodeEndpoint:v116 server:v117 lastError:0 completionHandler:v106];

      uint64_t v61 = v94;
      id v62 = v104;

      uint64_t v31 = v82;
      uint64_t v29 = v83;
    }
    else
    {
      id v70 = (void *)MEMORY[0x2533B64D0]();
      id v71 = v25;
      BOOL v72 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v73 = v31;
        v75 = id v74 = v20;
        *(_DWORD *)buf = 138543618;
        v130 = v75;
        __int16 v131 = 2112;
        id v132 = v19;
        _os_log_impl(&dword_252495000, v72, OS_LOG_TYPE_ERROR, "%{public}@No clusters in use at endpoint %@", buf, 0x16u);

        id v20 = v74;
        uint64_t v31 = v73;
      }

      v60 = v91;
      (*((void (**)(id, void, BOOL, void *, void))v91 + 2))(v91, 0, a9, v23, 0);
      v58 = v88;
      uint64_t v57 = v92;
      id v62 = v104;
      uint64_t v61 = v94;
    }
  }
  else
  {
    id v63 = (void *)MEMORY[0x2533B64D0]();
    id v64 = v25;
    uint64_t v65 = HMFGetOSLogHandle();
    uint64_t v61 = v94;
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      uint64_t v66 = v31;
      v68 = id v67 = v20;
      *(_DWORD *)buf = 138543618;
      v130 = v68;
      __int16 v131 = 2112;
      id v132 = v19;
      _os_log_impl(&dword_252495000, v65, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch clusters in use at endpoint %@", buf, 0x16u);

      id v20 = v67;
      uint64_t v31 = v66;
    }

    uint64_t v69 = [MEMORY[0x263F087E8] hapErrorWithCode:14];
    v60 = v91;
    (*((void (**)(id, void, BOOL, void *, void *))v91 + 2))(v91, 0, a9, v23, v69);

    v58 = 0;
    uint64_t v57 = v92;
    id v62 = v104;
  }
}

void __242__HMMTRDescriptorClusterManager_fetchHAPServicesAtCHIPEndpoint_deviceTopology_endpointDeviceTypes_accessoryInfo_hapToCHIPClusterMappingArray_device_isBridge_bridgeAggregateNodeEndpoint_isComposedDevice_server_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 80);
  long long v10 = *(_OWORD *)(a1 + 104);
  long long v11 = *(_OWORD *)(a1 + 88);
  uint64_t v9 = *(void *)(a1 + 120);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __242__HMMTRDescriptorClusterManager_fetchHAPServicesAtCHIPEndpoint_deviceTopology_endpointDeviceTypes_accessoryInfo_hapToCHIPClusterMappingArray_device_isBridge_bridgeAggregateNodeEndpoint_isComposedDevice_server_callbackQueue_completionHandler___block_invoke_2;
  v12[3] = &unk_265376110;
  void v12[4] = v2;
  id v22 = *(id *)(a1 + 152);
  char v23 = *(unsigned char *)(a1 + 160);
  id v13 = *(id *)(a1 + 112);
  id v14 = *(id *)(a1 + 104);
  id v15 = *(id *)(a1 + 40);
  id v16 = *(id *)(a1 + 128);
  id v17 = *(id *)(a1 + 96);
  id v18 = *(id *)(a1 + 136);
  id v19 = *(id *)(a1 + 144);
  id v20 = *(id *)(a1 + 48);
  id v21 = *(id *)(a1 + 64);
  char v24 = *(unsigned char *)(a1 + 161);
  objc_msgSend(v2, "_verifyHAPOptionalCharacteristicSupportAtCHIPEndpoint:device:endpointDeviceTypes:callbackQueue:clusterClassToQueryForAttributes:hapServicesToCheckForOptionalMatterAttribute:clusterAttributesSupported:hapServicesInUse:deviceTopology:bridgeAggregateNodeEndpoint:server:lastError:completionHandler:", v3, v4, v5, v6, v7, v8, v11, v10, v9, 0, v12);
}

void __242__HMMTRDescriptorClusterManager_fetchHAPServicesAtCHIPEndpoint_deviceTopology_endpointDeviceTypes_accessoryInfo_hapToCHIPClusterMappingArray_device_isBridge_bridgeAggregateNodeEndpoint_isComposedDevice_server_callbackQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!v3)
  {
    uint64_t v8 = [*(id *)(a1 + 48) getPartsListAtEndpoint:*(void *)(a1 + 56)];
    uint64_t v9 = [*(id *)(a1 + 48) getFixedLabelsAtEndpoint:*(void *)(a1 + 56)];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __242__HMMTRDescriptorClusterManager_fetchHAPServicesAtCHIPEndpoint_deviceTopology_endpointDeviceTypes_accessoryInfo_hapToCHIPClusterMappingArray_device_isBridge_bridgeAggregateNodeEndpoint_isComposedDevice_server_callbackQueue_completionHandler___block_invoke_244;
    v30[3] = &unk_2653760E8;
    id v31 = *(id *)(a1 + 64);
    id v32 = *(id *)(a1 + 72);
    id v10 = v8;
    id v33 = v10;
    id v11 = v9;
    id v34 = v11;
    id v35 = *(id *)(a1 + 80);
    id v12 = *(id *)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 32);
    id v36 = v12;
    uint64_t v37 = v13;
    id v38 = *(id *)(a1 + 48);
    id v40 = *(id *)(a1 + 112);
    char v41 = *(unsigned char *)(a1 + 120);
    id v39 = *(id *)(a1 + 40);
    id v14 = (void (**)(void, void))MEMORY[0x2533B66E0](v30);
    if ([*(id *)(a1 + 88) indexOfObject:&unk_2702B56E8] == 0x7FFFFFFFFFFFFFFFLL
      || !*(unsigned char *)(a1 + 120))
    {
      if ([*(id *)(a1 + 88) indexOfObject:&unk_2702B5700] == 0x7FFFFFFFFFFFFFFFLL
        || *(unsigned char *)(a1 + 120)
        || *(unsigned char *)(a1 + 121))
      {
        v14[2](v14, 0);
        goto LABEL_19;
      }
      char v24 = [*(id *)(a1 + 32) createClusterInstance];
      id v16 = ((void (**)(void, __CFString *, void, void, void))v24)[2](v24, @"MTRClusterBasic", *(void *)(a1 + 96), *(void *)(a1 + 56), *(void *)(a1 + 104));

      id v25 = objc_alloc_init(MEMORY[0x263F10FA0]);
      id v18 = [v16 readAttributeNodeLabelWithParams:v25];

      id v19 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v18 forIdentify:@"nodeLabel"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v26 = v19;
      }
      else {
        uint64_t v26 = 0;
      }
      id v21 = v26;

      if (v21)
      {
LABEL_14:
        objc_msgSend(*(id *)(a1 + 48), "setNodeLabel:atEndpoint:", v21, *(void *)(a1 + 56), v27);
        ((void (**)(void, id))v14)[2](v14, v21);

LABEL_19:
        goto LABEL_20;
      }
      uint64_t v29 = v16;
      context = (void *)MEMORY[0x2533B64D0]();
      id v22 = *(id *)(a1 + 32);
      char v23 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
LABEL_13:

        id v16 = v29;
        goto LABEL_14;
      }
    }
    else
    {
      id v15 = [*(id *)(a1 + 32) createClusterInstance];
      id v16 = ((void (**)(void, __CFString *, void, void, void))v15)[2](v15, @"MTRClusterBridgedDeviceBasic", *(void *)(a1 + 96), *(void *)(a1 + 56), *(void *)(a1 + 104));

      id v17 = objc_alloc_init(MEMORY[0x263F10FA0]);
      id v18 = [v16 readAttributeNodeLabelWithParams:v17];

      id v19 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v18 forIdentify:@"nodeLabel"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v20 = v19;
      }
      else {
        id v20 = 0;
      }
      id v21 = v20;

      if (v21) {
        goto LABEL_14;
      }
      uint64_t v29 = v16;
      context = (void *)MEMORY[0x2533B64D0]();
      id v22 = *(id *)(a1 + 32);
      char v23 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
    }
    id v27 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    long long v43 = v27;
    _os_log_impl(&dword_252495000, v23, OS_LOG_TYPE_ERROR, "%{public}@Attribute node label absent from cache", buf, 0xCu);

    goto LABEL_13;
  }
  uint64_t v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    long long v43 = v7;
    __int16 v44 = 2112;
    id v45 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@HAP characteristics support verification failed with error : %@", buf, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 112) + 16))();
LABEL_20:
}

void __242__HMMTRDescriptorClusterManager_fetchHAPServicesAtCHIPEndpoint_deviceTopology_endpointDeviceTypes_accessoryInfo_hapToCHIPClusterMappingArray_device_isBridge_bridgeAggregateNodeEndpoint_isComposedDevice_server_callbackQueue_completionHandler___block_invoke_244(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [[HMMTRHAPDescriptionAtEndpoint alloc] initWithType:*(void *)(a1 + 32) serviceDescriptions:*(void *)(a1 + 40) name:v3 partsList:*(void *)(a1 + 48) fixedLabels:*(void *)(a1 + 56)];
  id v5 = (void *)MEMORY[0x2533B64D0]([*(id *)(a1 + 64) setAccessoryInfo:v4 forEndpoint:*(void *)(a1 + 72)]);
  id v6 = *(id *)(a1 + 80);
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    uint64_t v9 = *(void *)(a1 + 88);
    int v10 = 138543618;
    id v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Updated topology : %@", (uint8_t *)&v10, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 104) + 16))();
}

- (void)_verifyHAPOptionalCharacteristicSupportAtCHIPEndpoint:(id)a3 device:(id)a4 endpointDeviceTypes:(id)a5 callbackQueue:(id)a6 clusterClassToQueryForAttributes:(id)a7 hapServicesToCheckForOptionalMatterAttribute:(id)a8 clusterAttributesSupported:(id)a9 hapServicesInUse:(id)a10 deviceTopology:(id)a11 bridgeAggregateNodeEndpoint:(id)a12 server:(id)a13 lastError:(id)a14 completionHandler:(id)a15
{
  uint64_t v126 = *MEMORY[0x263EF8340];
  id v87 = a3;
  id v70 = a4;
  id v69 = a5;
  id v68 = a6;
  id v20 = a7;
  id v82 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  id v80 = a13;
  id v66 = a14;
  id v65 = a15;
  id v25 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v26 = self;
  id v27 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v28 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v114 = v28;
    __int16 v115 = 2112;
    id v116 = v20;
    _os_log_impl(&dword_252495000, v27, OS_LOG_TYPE_DEBUG, "%{public}@Cluster classes to query for attributes : %@", buf, 0x16u);
  }
  id v71 = v24;
  BOOL v72 = v22;
  long long v78 = v23;

  id v67 = v20;
  long long v81 = v21;
  if ([v20 count])
  {
    long long v85 = [v20 popFirstObject];
    v100[0] = MEMORY[0x263EF8330];
    v100[1] = 3221225472;
    v100[2] = __328__HMMTRDescriptorClusterManager__verifyHAPOptionalCharacteristicSupportAtCHIPEndpoint_device_endpointDeviceTypes_callbackQueue_clusterClassToQueryForAttributes_hapServicesToCheckForOptionalMatterAttribute_clusterAttributesSupported_hapServicesInUse_deviceTopology_bridgeAggregateNodeEndpoint_server_lastError_completionHandler___block_invoke;
    v100[3] = &unk_2653760C0;
    v100[4] = v26;
    uint64_t v29 = v87;
    id v101 = v87;
    id v102 = v21;
    id v30 = v20;
    id v103 = v70;
    id v31 = v69;
    id v104 = v69;
    id v32 = v68;
    id v105 = v68;
    id v106 = v30;
    id v33 = v82;
    id v107 = v82;
    id v108 = v22;
    id v109 = v78;
    id v110 = v71;
    id v34 = v80;
    id v111 = v80;
    id v112 = v65;
    id v35 = v26;
    id v36 = v65;
    uint64_t v37 = v70;
    id v38 = v67;
    [(HMMTRDescriptorClusterManager *)v35 _querySupportedAttributesFromClusterAtCHIPEndpoint:v101 device:v103 callbackQueue:v105 clusterClassName:v85 completionHandler:v100];

    id v39 = v66;
  }
  else
  {
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    id v33 = v82;
    id obj = v82;
    uint64_t v29 = v87;
    id v34 = v80;
    uint64_t v75 = [obj countByEnumeratingWithState:&v96 objects:v125 count:16];
    if (v75)
    {
      uint64_t v74 = *(void *)v97;
      do
      {
        uint64_t v40 = 0;
        do
        {
          if (*(void *)v97 != v74) {
            objc_enumerationMutation(obj);
          }
          uint64_t v76 = v40;
          char v41 = *(void **)(*((void *)&v96 + 1) + 8 * v40);
          long long v92 = 0u;
          long long v93 = 0u;
          long long v94 = 0u;
          long long v95 = 0u;
          long long v79 = v41;
          id v77 = [v41 optionalCharacteristics];
          uint64_t v86 = [v77 countByEnumeratingWithState:&v92 objects:v124 count:16];
          if (v86)
          {
            uint64_t v83 = *(void *)v93;
            do
            {
              for (uint64_t i = 0; i != v86; ++i)
              {
                if (*(void *)v93 != v83) {
                  objc_enumerationMutation(v77);
                }
                uint64_t v43 = *(void *)(*((void *)&v92 + 1) + 8 * i);
                __int16 v44 = +[HMMTRUtilities hmmtr_shortTypeFromUUID:v43];
                id v45 = [(HMMTRDescriptorClusterManager *)v26 protocolMap];
                uint64_t v46 = [v34 clusterIDCharacteristicMap];
                uint64_t v47 = [v45 getClusterClassForCharacteristic:v44 endpointID:v29 clusterIDCharacteristicMap:v46];

                uint64_t v48 = [v81 objectForKey:v47];
                long long v49 = [(HMMTRDescriptorClusterManager *)v26 protocolMap];
                uint64_t v50 = [v49 getCHIPAttributesForCharacteristic:v43];

                long long v90 = 0u;
                long long v91 = 0u;
                long long v88 = 0u;
                long long v89 = 0u;
                id v51 = v50;
                uint64_t v52 = [v51 countByEnumeratingWithState:&v88 objects:v123 count:16];
                if (v52)
                {
                  uint64_t v53 = v52;
                  uint64_t v54 = *(void *)v89;
                  while (2)
                  {
                    for (uint64_t j = 0; j != v53; ++j)
                    {
                      if (*(void *)v89 != v54) {
                        objc_enumerationMutation(v51);
                      }
                      if (([v48 containsObject:*(void *)(*((void *)&v88 + 1) + 8 * j)] & 1) == 0)
                      {
                        uint64_t v56 = (void *)MEMORY[0x2533B64D0]();
                        uint64_t v57 = v26;
                        v58 = HMFGetOSLogHandle();
                        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
                        {
                          id v59 = HMFGetLogIdentifier();
                          *(_DWORD *)buf = 138544386;
                          id v114 = v59;
                          __int16 v115 = 2112;
                          id v116 = v51;
                          __int16 v117 = 2112;
                          id v118 = v44;
                          __int16 v119 = 2112;
                          id v120 = v48;
                          __int16 v121 = 2112;
                          id v122 = v87;
                          _os_log_impl(&dword_252495000, v58, OS_LOG_TYPE_INFO, "%{public}@Attributes %@ for characteristic %@ not found in supported attribute list %@ for endpoint %@", buf, 0x34u);
                        }

                        [v79 removeCharacteristic:v44];
                        v60 = [v79 serviceType];
                        [v78 addHAPDisabledCharacteristic:v44 atEndpoint:v87 hapServiceType:v60];

                        uint64_t v61 = (void *)MEMORY[0x2533B64D0]();
                        id v62 = v57;
                        id v63 = HMFGetOSLogHandle();
                        if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
                        {
                          id v64 = HMFGetLogIdentifier();
                          *(_DWORD *)buf = 138543874;
                          id v114 = v64;
                          __int16 v115 = 2112;
                          id v116 = v44;
                          __int16 v117 = 2112;
                          id v118 = v87;
                          _os_log_impl(&dword_252495000, v63, OS_LOG_TYPE_INFO, "%{public}@Removed unsupported characteristic %@ for endpoint %@", buf, 0x20u);
                        }
                        uint64_t v29 = v87;
                        goto LABEL_29;
                      }
                    }
                    uint64_t v53 = [v51 countByEnumeratingWithState:&v88 objects:v123 count:16];
                    if (v53) {
                      continue;
                    }
                    break;
                  }
                }

LABEL_29:
                id v33 = v82;
                id v34 = v80;
              }
              uint64_t v86 = [v77 countByEnumeratingWithState:&v92 objects:v124 count:16];
            }
            while (v86);
          }

          uint64_t v40 = v76 + 1;
        }
        while (v76 + 1 != v75);
        uint64_t v75 = [obj countByEnumeratingWithState:&v96 objects:v125 count:16];
      }
      while (v75);
    }

    id v36 = v65;
    id v39 = v66;
    (*((void (**)(id, id))v65 + 2))(v65, v66);
    id v31 = v69;
    uint64_t v37 = v70;
    id v38 = v67;
    id v32 = v68;
    id v21 = v81;
  }
}

void __328__HMMTRDescriptorClusterManager__verifyHAPOptionalCharacteristicSupportAtCHIPEndpoint_device_endpointDeviceTypes_callbackQueue_clusterClassToQueryForAttributes_hapServicesToCheckForOptionalMatterAttribute_clusterAttributesSupported_hapServicesInUse_deviceTopology_bridgeAggregateNodeEndpoint_server_lastError_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    int v10 = (void *)MEMORY[0x2533B64D0]();
    id v11 = *(id *)(a1 + 32);
    __int16 v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      id v18 = v13;
      __int16 v19 = 2112;
      id v20 = v7;
      __int16 v21 = 2112;
      uint64_t v22 = v14;
      __int16 v23 = 2112;
      id v24 = v9;
      _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_INFO, "%{public}@Failed to get device attribute list for cluster class name %@ at endpoint %@. Error: %@", buf, 0x2Au);
    }
  }
  else
  {
    id v15 = [*(id *)(a1 + 32) protocolMap];
    id v16 = [v15 mtrBaseClusterNameFromMTRClusterName:v7];

    [*(id *)(a1 + 48) setObject:v8 forKey:v16];
  }
  [*(id *)(a1 + 32) _verifyHAPOptionalCharacteristicSupportAtCHIPEndpoint:*(void *)(a1 + 40) device:*(void *)(a1 + 56) endpointDeviceTypes:*(void *)(a1 + 64) callbackQueue:*(void *)(a1 + 72) clusterClassToQueryForAttributes:*(void *)(a1 + 80) hapServicesToCheckForOptionalMatterAttribute:*(void *)(a1 + 88) clusterAttributesSupported:*(void *)(a1 + 48) hapServicesInUse:*(void *)(a1 + 96) deviceTopology:*(void *)(a1 + 104) bridgeAggregateNodeEndpoint:*(void *)(a1 + 112) server:*(void *)(a1 + 120) lastError:0 completionHandler:*(void *)(a1 + 128)];
}

- (void)_verifyHAPCharacteristicSupportAtCHIPEndpoint:(id)a3 device:(id)a4 endpointDeviceTypes:(id)a5 callbackQueue:(id)a6 clusterClassToQueryForFeatureMap:(id)a7 hapServicesToCheckForFeatureMap:(id)a8 hapServicesInUse:(id)a9 deviceTopology:(id)a10 bridgeAggregateNodeEndpoint:(id)a11 server:(id)a12 lastError:(id)a13 completionHandler:(id)a14
{
  uint64_t v136 = *MEMORY[0x263EF8340];
  id v92 = a3;
  id v85 = a4;
  id v84 = a5;
  id v83 = a6;
  id v19 = a7;
  id v86 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  id v23 = a12;
  id v82 = a13;
  id v81 = a14;
  id v24 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v25 = self;
  uint64_t v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    id v27 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v130 = v27;
    __int16 v131 = 2112;
    *(void *)id v132 = v19;
    _os_log_impl(&dword_252495000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Cluster classes to query for feature map : %@", buf, 0x16u);
  }
  long long v79 = v22;
  id v87 = v20;

  id v80 = v19;
  long long v99 = v21;
  long long v95 = v23;
  if ([v19 count])
  {
    uint64_t v101 = [v19 popFirstObject];
    v116[0] = MEMORY[0x263EF8330];
    v116[1] = 3221225472;
    v116[2] = __280__HMMTRDescriptorClusterManager__verifyHAPCharacteristicSupportAtCHIPEndpoint_device_endpointDeviceTypes_callbackQueue_clusterClassToQueryForFeatureMap_hapServicesToCheckForFeatureMap_hapServicesInUse_deviceTopology_bridgeAggregateNodeEndpoint_server_lastError_completionHandler___block_invoke;
    v116[3] = &unk_265376098;
    v116[4] = v25;
    uint64_t v28 = v92;
    id v117 = v92;
    id v118 = v21;
    id v119 = v85;
    uint64_t v29 = v83;
    id v120 = v83;
    id v30 = v84;
    id v121 = v84;
    id v122 = v19;
    id v31 = v23;
    id v123 = v86;
    id v124 = v87;
    id v32 = v79;
    id v125 = v79;
    id v126 = v31;
    id v33 = (void (**)(void, void))v81;
    id v127 = v81;
    id v34 = v25;
    id v35 = v86;
    id v36 = v19;
    uint64_t v37 = v85;
    id v38 = (void *)v101;
    [(HMMTRDescriptorClusterManager *)v34 _queryFeatureMapFromClusterAtCHIPEndpoint:v117 device:v119 callbackQueue:v120 clusterClassName:v101 completionHandler:v116];

    id v39 = v82;
    goto LABEL_45;
  }
  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id obj = v86;
  uint64_t v28 = v92;
  uint64_t v90 = [obj countByEnumeratingWithState:&v112 objects:v135 count:16];
  if (!v90) {
    goto LABEL_29;
  }
  uint64_t v89 = *(void *)v113;
  long long v94 = v25;
  do
  {
    uint64_t v40 = 0;
    do
    {
      if (*(void *)v113 != v89) {
        objc_enumerationMutation(obj);
      }
      uint64_t v91 = v40;
      char v41 = *(void **)(*((void *)&v112 + 1) + 8 * v40);
      long long v108 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      id v102 = v41;
      id v93 = [v41 characteristicFeatureMap];
      uint64_t v97 = [v93 countByEnumeratingWithState:&v108 objects:v134 count:16];
      if (v97)
      {
        uint64_t v96 = *(void *)v109;
        do
        {
          for (uint64_t i = 0; i != v97; ++i)
          {
            if (*(void *)v109 != v96) {
              objc_enumerationMutation(v93);
            }
            uint64_t v43 = *(void *)(*((void *)&v108 + 1) + 8 * i);
            __int16 v44 = +[HMMTRUtilities hmmtr_shortTypeFromUUID:v43];
            id v45 = [(HMMTRDescriptorClusterManager *)v25 protocolMap];
            uint64_t v46 = [v23 clusterIDCharacteristicMap];
            uint64_t v47 = [v45 getClusterClassForCharacteristic:v44 endpointID:v28 clusterIDCharacteristicMap:v46];

            uint64_t v48 = [v99 getFeatureMapForClusterClassName:v47 endpoint:v28];
            long long v49 = [v102 characteristicFeatureMap];
            uint64_t v50 = [v49 objectForKey:v43];

            id v51 = (void *)MEMORY[0x2533B64D0]();
            uint64_t v52 = v25;
            uint64_t v53 = HMFGetOSLogHandle();
            uint64_t v54 = v53;
            if (!v48)
            {
              if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
              {
                id v62 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138544130;
                v130 = v62;
                __int16 v131 = 2112;
                *(void *)id v132 = v44;
                *(_WORD *)&v132[8] = 2112;
                *(void *)&v132[10] = v47;
                *(_WORD *)&v132[18] = 2112;
                __int16 v133 = v28;
                id v63 = v54;
                os_log_type_t v64 = OS_LOG_TYPE_ERROR;
                id v65 = "%{public}@Failed to get device feature map value for characteristic %@ with cluster class name %@ at endpoint %@";
                uint32_t v66 = 42;
LABEL_23:
                _os_log_impl(&dword_252495000, v63, v64, v65, buf, v66);
              }
LABEL_24:

              goto LABEL_25;
            }
            if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
            {
              id v55 = HMFGetLogIdentifier();
              int v56 = [v48 unsignedIntValue];
              int v57 = [v50 unsignedIntValue];
              *(_DWORD *)buf = 138544130;
              v130 = v55;
              __int16 v131 = 1024;
              *(_DWORD *)id v132 = v56;
              uint64_t v28 = v92;
              *(_WORD *)&v132[4] = 2112;
              *(void *)&v132[6] = v44;
              *(_WORD *)&v132[14] = 1024;
              *(_DWORD *)&v132[16] = v57;
              _os_log_impl(&dword_252495000, v54, OS_LOG_TYPE_INFO, "%{public}@Comparing device feature map %u with characteristic %@ required feature map %u", buf, 0x22u);
            }
            uint64_t v58 = [v48 unsignedIntegerValue];
            uint64_t v59 = [v50 unsignedIntegerValue] & v58;
            if (v59 != [v50 unsignedIntegerValue])
            {
              [v102 removeCharacteristic:v44];
              v60 = [v102 serviceType];
              [v99 addHAPDisabledCharacteristic:v44 atEndpoint:v28 hapServiceType:v60];

              id v51 = (void *)MEMORY[0x2533B64D0]();
              uint64_t v61 = v52;
              uint64_t v54 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
              {
                id v62 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543874;
                v130 = v62;
                __int16 v131 = 2112;
                *(void *)id v132 = v44;
                *(_WORD *)&v132[8] = 2112;
                *(void *)&v132[10] = v28;
                id v63 = v54;
                os_log_type_t v64 = OS_LOG_TYPE_INFO;
                id v65 = "%{public}@Removed unsupported characteristic %@ for endpoint %@";
                uint32_t v66 = 32;
                goto LABEL_23;
              }
              goto LABEL_24;
            }
LABEL_25:

            uint64_t v25 = v94;
            id v23 = v95;
          }
          uint64_t v97 = [v93 countByEnumeratingWithState:&v108 objects:v134 count:16];
        }
        while (v97);
      }

      uint64_t v40 = v91 + 1;
    }
    while (v91 + 1 != v90);
    uint64_t v90 = [obj countByEnumeratingWithState:&v112 objects:v135 count:16];
  }
  while (v90);
LABEL_29:

  id v30 = v84;
  id v38 = [v84 objectForKey:v28];
  uint64_t v37 = v85;
  id v35 = v86;
  id v39 = v82;
  uint64_t v29 = v83;
  id v33 = (void (**)(void, void))v81;
  if ([v38 count] == 1)
  {
    id v67 = [v38 objectAtIndex:0];
    if ([v67 integerValue] == 256)
    {
      id v68 = [v99 getClustersInUseAtEndpoint:v28];
      if ([v68 containsObject:&unk_2702B56D0])
      {
        long long v98 = v68;
        id v103 = v67;
        id v69 = +[HMMTRUtilities hmmtr_shortTypeFromUUID:@"00000008-0000-1000-8000-0026BB765291"];
        id v70 = +[HMMTRUtilities hmmtr_shortTypeFromUUID:@"00000043-0000-1000-8000-0026BB765291"];
        long long v104 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        long long v107 = 0u;
        id v71 = v87;
        uint64_t v72 = [v71 countByEnumeratingWithState:&v104 objects:v128 count:16];
        if (v72)
        {
          uint64_t v73 = v72;
          uint64_t v74 = *(void *)v105;
          do
          {
            for (uint64_t j = 0; j != v73; ++j)
            {
              if (*(void *)v105 != v74) {
                objc_enumerationMutation(v71);
              }
              uint64_t v76 = *(void **)(*((void *)&v104 + 1) + 8 * j);
              id v77 = [v76 serviceType];
              int v78 = [v77 isEqualToString:v70];

              if (v78)
              {
                [v76 removeCharacteristic:v69];
                [v99 addHAPDisabledCharacteristic:v69 atEndpoint:v92 hapServiceType:v70];
              }
            }
            uint64_t v73 = [v71 countByEnumeratingWithState:&v104 objects:v128 count:16];
          }
          while (v73);
        }

        uint64_t v28 = v92;
        id v30 = v84;
        uint64_t v37 = v85;
        id v39 = v82;
        uint64_t v29 = v83;
        id v35 = v86;
        id v33 = (void (**)(void, void))v81;
        id v67 = v103;
        id v68 = v98;
      }
    }
  }
  ((void (**)(void, void *))v33)[2](v33, v39);
  id v32 = v79;
  id v36 = v80;
LABEL_45:
}

void __280__HMMTRDescriptorClusterManager__verifyHAPCharacteristicSupportAtCHIPEndpoint_device_endpointDeviceTypes_callbackQueue_clusterClassToQueryForFeatureMap_hapServicesToCheckForFeatureMap_hapServicesInUse_deviceTopology_bridgeAggregateNodeEndpoint_server_lastError_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v24 = a4;
  if (v24)
  {
    id v9 = (void *)MEMORY[0x2533B64D0]();
    id v10 = *(id *)(a1 + 32);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      __int16 v12 = HMFGetLogIdentifier();
      uint64_t v13 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      id v38 = v12;
      __int16 v39 = 2112;
      id v40 = v7;
      __int16 v41 = 2112;
      uint64_t v42 = v13;
      _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_INFO, "%{public}@Failed to get device feature map value for cluster class name %@ at endpoint %@. Ignoring feature map errors", buf, 0x20u);
    }

    id v8 = &unk_2702B56A0;
  }
  uint64_t v14 = [*(id *)(a1 + 32) protocolMap];
  uint64_t v15 = [v14 mtrBaseClusterNameFromMTRClusterName:v7];
  id v16 = (void *)v15;
  if (v15) {
    id v17 = (void *)v15;
  }
  else {
    id v17 = v7;
  }
  id v18 = v17;

  [*(id *)(a1 + 48) addDeviceFeatureMapValue:v8 clusterClassName:v18 atEndpoint:*(void *)(a1 + 40)];
  id v20 = *(void **)(a1 + 32);
  id v19 = *(void **)(a1 + 40);
  uint64_t v22 = *(void *)(a1 + 48);
  uint64_t v21 = *(void *)(a1 + 56);
  uint64_t v23 = *(void *)(a1 + 64);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __280__HMMTRDescriptorClusterManager__verifyHAPCharacteristicSupportAtCHIPEndpoint_device_endpointDeviceTypes_callbackQueue_clusterClassToQueryForFeatureMap_hapServicesToCheckForFeatureMap_hapServicesInUse_deviceTopology_bridgeAggregateNodeEndpoint_server_lastError_completionHandler___block_invoke_225;
  v25[3] = &unk_265376070;
  void v25[4] = v20;
  id v26 = v19;
  id v27 = *(id *)(a1 + 56);
  id v28 = *(id *)(a1 + 72);
  id v29 = *(id *)(a1 + 64);
  id v30 = *(id *)(a1 + 80);
  id v31 = *(id *)(a1 + 88);
  id v32 = *(id *)(a1 + 96);
  id v33 = *(id *)(a1 + 48);
  id v34 = *(id *)(a1 + 104);
  id v35 = *(id *)(a1 + 112);
  id v36 = *(id *)(a1 + 120);
  [v20 _populateAttributeValuesForClusterClassName:v7 clusterClassFeatureMap:v8 endpoint:v26 device:v21 deviceTopology:v22 callbackQueue:v23 completionHandler:v25];
}

uint64_t __280__HMMTRDescriptorClusterManager__verifyHAPCharacteristicSupportAtCHIPEndpoint_device_endpointDeviceTypes_callbackQueue_clusterClassToQueryForFeatureMap_hapServicesToCheckForFeatureMap_hapServicesInUse_deviceTopology_bridgeAggregateNodeEndpoint_server_lastError_completionHandler___block_invoke_225(uint64_t a1)
{
  return [*(id *)(a1 + 32) _verifyHAPCharacteristicSupportAtCHIPEndpoint:*(void *)(a1 + 40) device:*(void *)(a1 + 48) endpointDeviceTypes:*(void *)(a1 + 56) callbackQueue:*(void *)(a1 + 64) clusterClassToQueryForFeatureMap:*(void *)(a1 + 72) hapServicesToCheckForFeatureMap:*(void *)(a1 + 80) hapServicesInUse:*(void *)(a1 + 88) deviceTopology:*(void *)(a1 + 96) bridgeAggregateNodeEndpoint:*(void *)(a1 + 104) server:*(void *)(a1 + 112) lastError:0 completionHandler:*(void *)(a1 + 120)];
}

- (void)_populateAttributeValuesForClusterClassName:(id)a3 clusterClassFeatureMap:(id)a4 endpoint:(id)a5 device:(id)a6 deviceTopology:(id)a7 callbackQueue:(id)a8 completionHandler:(id)a9
{
  uint64_t v137 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v118 = a7;
  id v119 = a8;
  id v19 = (void (**)(id, void *))a9;
  id v20 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v21 = self;
  uint64_t v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    uint64_t v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544386;
    v128 = v23;
    __int16 v129 = 2112;
    id v130 = v15;
    __int16 v131 = 2112;
    id v132 = v16;
    __int16 v133 = 2112;
    id v134 = v17;
    __int16 v135 = 2112;
    id v136 = v18;
    _os_log_impl(&dword_252495000, v22, OS_LOG_TYPE_INFO, "%{public}@Populate attribute values for %@ cluster with featureMap %@ on endpoint %@ from device %@", buf, 0x34u);
  }
  id v116 = v18;
  id v117 = v16;
  if ([v15 isEqualToString:@"MTRClusterPowerSourceConfiguration"])
  {
    id v24 = [(HMMTRDescriptorClusterManager *)v21 createClusterInstance];
    ((void (**)(void, id, id, id, id))v24)[2](v24, v15, v18, v17, v119);
    id v25 = (id)objc_claimAutoreleasedReturnValue();

    id v26 = objc_alloc_init(MEMORY[0x263F10FA0]);
    id v27 = [v25 readAttributeSourcesWithParams:v26];

    id v28 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v27 forIdentify:@"sources"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v29 = v28;
    }
    else {
      id v29 = 0;
    }
    id v30 = v29;

    if (v30)
    {
      id v31 = v118;
      [v118 addDeviceAttributeValues:v30 clusterClassName:v15 attributeName:@"Sources" atEndpoint:v17];
LABEL_15:
      id v36 = 0;
      goto LABEL_42;
    }
    long long v115 = v27;
    id v45 = v19;
    id v46 = v25;
    uint64_t v47 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v48 = v21;
    long long v49 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      uint64_t v50 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v128 = v50;
      __int16 v129 = 2112;
      id v130 = v15;
      __int16 v131 = 2112;
      id v132 = v17;
      id v51 = "%{public}@Sources attribute from the %@ cluster endpoint:%@ absent from cache";
LABEL_27:
      _os_log_impl(&dword_252495000, v49, OS_LOG_TYPE_ERROR, v51, buf, 0x20u);

      goto LABEL_28;
    }
    goto LABEL_28;
  }
  if ([v15 isEqualToString:@"MTRClusterPowerSource"])
  {
    id v32 = [(HMMTRDescriptorClusterManager *)v21 createClusterInstance];
    ((void (**)(void, id, id, id, id))v32)[2](v32, v15, v18, v17, v119);
    id v25 = (id)objc_claimAutoreleasedReturnValue();

    id v33 = objc_alloc_init(MEMORY[0x263F10FA0]);
    id v27 = [v25 readAttributeOrderWithParams:v33];

    id v28 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v27 forIdentify:@"order"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v34 = v28;
    }
    else {
      id v34 = 0;
    }
    id v30 = v34;

    if (v30)
    {
      id v126 = v30;
      id v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v126 count:1];
      id v31 = v118;
      [v118 addDeviceAttributeValues:v35 clusterClassName:v15 attributeName:@"Order" atEndpoint:v17];

      goto LABEL_15;
    }
    long long v115 = v27;
    id v45 = v19;
    id v46 = v25;
    uint64_t v47 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v48 = v21;
    long long v49 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      uint64_t v50 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v128 = v50;
      __int16 v129 = 2112;
      id v130 = v15;
      __int16 v131 = 2112;
      id v132 = v17;
      id v51 = "%{public}@Order attribute from the %@ cluster endpoint:%@ absent from cache";
      goto LABEL_27;
    }
LABEL_28:

    id v36 = [MEMORY[0x263F087E8] hapErrorWithCode:14];
    id v30 = 0;
    id v31 = v118;
    id v25 = v46;
    id v19 = v45;
    id v27 = v115;
    goto LABEL_42;
  }
  if (([v15 isEqualToString:@"MTRClusterColorControl"] & 1) != 0
    || [v15 isEqualToString:@"HMMTRSyncColorControl"])
  {
    uint64_t v37 = [(HMMTRDescriptorClusterManager *)v21 createClusterInstance];
    id v38 = ((void (**)(void, id, id, id, id))v37)[2](v37, v15, v18, v17, v119);

    id v39 = objc_alloc_init(MEMORY[0x263F10FA0]);
    long long v114 = v38;
    id v40 = [v38 readAttributeColorTempPhysicalMinMiredsWithParams:v39];

    id v41 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v40 forIdentify:@"colorTempPhysicalMinMireds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v42 = v41;
    }
    else {
      uint64_t v42 = 0;
    }
    id v43 = v42;

    if (v43)
    {
      id v125 = v43;
      __int16 v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v125 count:1];
      [v118 addDeviceAttributeValues:v44 clusterClassName:v15 attributeName:@"ColorTempPhysicalMinMireds" atEndpoint:v17];

      id v36 = 0;
    }
    else
    {
      context = (void *)MEMORY[0x2533B64D0]();
      uint64_t v52 = v21;
      uint64_t v53 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        uint64_t v54 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v128 = v54;
        __int16 v129 = 2112;
        id v130 = v15;
        __int16 v131 = 2112;
        id v132 = v17;
        _os_log_impl(&dword_252495000, v53, OS_LOG_TYPE_ERROR, "%{public}@ColorTempPhysicalMinMireds attribute from the %@ cluster endpoint:%@ absent from cache", buf, 0x20u);
      }
      id v36 = [MEMORY[0x263F087E8] hapErrorWithCode:14];
    }
    id v55 = objc_alloc_init(MEMORY[0x263F10FA0]);
    id v27 = [v114 readAttributeColorTempPhysicalMaxMiredsWithParams:v55];

    int v56 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v27 forIdentify:@"colorTempPhysicalMaxMireds"];

    id v28 = v56;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v57 = v28;
    }
    else {
      int v57 = 0;
    }
    id v30 = v57;

    if (v30)
    {
      id v124 = v30;
      uint64_t v58 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v124 count:1];
      id v31 = v118;
      [v118 addDeviceAttributeValues:v58 clusterClassName:v15 attributeName:@"ColorTempPhysicalMaxMireds" atEndpoint:v17];
    }
    else
    {
      uint64_t v59 = (void *)MEMORY[0x2533B64D0]();
      v60 = v21;
      uint64_t v61 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v62 = contexte = v59;
        *(_DWORD *)buf = 138543874;
        v128 = v62;
        __int16 v129 = 2112;
        id v130 = v15;
        __int16 v131 = 2112;
        id v132 = v17;
        _os_log_impl(&dword_252495000, v61, OS_LOG_TYPE_ERROR, "%{public}@ColorTempPhysicalMaxMireds attribute from the %@ cluster endpoint:%@ absent from cache", buf, 0x20u);

        uint64_t v59 = contexte;
      }

      [MEMORY[0x263F087E8] hapErrorWithCode:14];
      id v36 = v58 = v36;
      id v31 = v118;
    }
  }
  else
  {
    if (([v15 isEqualToString:@"HMMTRThermostat"] & 1) == 0
      && ![v15 isEqualToString:@"MTRClusterThermostat"])
    {
      id v36 = 0;
      id v31 = v118;
      goto LABEL_44;
    }
    id v25 = v16;
    id v63 = [(HMMTRDescriptorClusterManager *)v21 createClusterInstance];
    id v27 = ((void (**)(void, id, id, id, id))v63)[2](v63, v15, v18, v17, v119);

    long long v114 = v25;
    if (([v25 unsignedIntValue] & 2) != 0 || (objc_msgSend(v25, "unsignedIntValue") & 0x20) != 0)
    {
      id v64 = objc_alloc_init(MEMORY[0x263F10FA0]);
      uint64_t v65 = [v27 readAttributeAbsMinCoolSetpointLimitWithParams:v64];

      contexta = (void *)v65;
      id v66 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v65 forIdentify:@"absMinCoolSetpointLimit"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v67 = v66;
      }
      else {
        id v67 = 0;
      }
      id v68 = v67;

      if (v68)
      {
        id v123 = v68;
        id v69 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v123 count:1];
        [v118 addDeviceAttributeValues:v69 clusterClassName:v15 attributeName:@"AbsMinCoolSetpointLimit" atEndpoint:v17];

        id v36 = 0;
      }
      else
      {
        id v70 = (void *)MEMORY[0x2533B64D0]();
        id v71 = v21;
        uint64_t v72 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          uint64_t v73 = v104 = v70;
          *(_DWORD *)buf = 138543874;
          v128 = v73;
          __int16 v129 = 2112;
          id v130 = v15;
          __int16 v131 = 2112;
          id v132 = v17;
          _os_log_impl(&dword_252495000, v72, OS_LOG_TYPE_ERROR, "%{public}@AbsMinCoolSetpointLimit attribute from the %@ cluster endpoint:%@ absent from cache", buf, 0x20u);

          id v70 = v104;
        }

        id v36 = [MEMORY[0x263F087E8] hapErrorWithCode:14];
      }
      id v74 = objc_alloc_init(MEMORY[0x263F10FA0]);
      uint64_t v75 = [v27 readAttributeAbsMaxCoolSetpointLimitWithParams:v74];

      contextb = (void *)v75;
      uint64_t v76 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v75 forIdentify:@"absMaxCoolSetpointLimit"];

      id v77 = v76;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        int v78 = v77;
      }
      else {
        int v78 = 0;
      }
      id v79 = v78;

      if (v79)
      {
        id v122 = v79;
        id v80 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v122 count:1];
        [v118 addDeviceAttributeValues:v80 clusterClassName:v15 attributeName:@"AbsMaxCoolSetpointLimit" atEndpoint:v17];
      }
      else
      {
        id v81 = (void *)MEMORY[0x2533B64D0]();
        long long v105 = v21;
        id v82 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          id v83 = v102 = v81;
          *(_DWORD *)buf = 138543874;
          v128 = v83;
          __int16 v129 = 2112;
          id v130 = v15;
          __int16 v131 = 2112;
          id v132 = v17;
          _os_log_impl(&dword_252495000, v82, OS_LOG_TYPE_ERROR, "%{public}@AbsMaxCoolSetpointLimit attribute from the %@ cluster endpoint:%@ absent from cache", buf, 0x20u);

          id v81 = v102;
        }

        [MEMORY[0x263F087E8] hapErrorWithCode:14];
        id v36 = v80 = v36;
      }

      id v25 = v114;
    }
    else
    {
      id v36 = 0;
    }
    if (([v25 unsignedIntValue] & 1) == 0 && (objc_msgSend(v25, "unsignedIntValue") & 0x20) == 0)
    {
      id v31 = v118;
      goto LABEL_43;
    }
    id v84 = objc_alloc_init(MEMORY[0x263F10FA0]);
    uint64_t v85 = [v27 readAttributeAbsMinHeatSetpointLimitWithParams:v84];

    long long v106 = (void *)v85;
    id v86 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v85 forIdentify:@"absMinHeatSetpointLimit"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v87 = v86;
    }
    else {
      id v87 = 0;
    }
    id v88 = v87;

    contextc = v88;
    if (v88)
    {
      id v121 = v88;
      uint64_t v89 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v121 count:1];
      [v118 addDeviceAttributeValues:v89 clusterClassName:v15 attributeName:@"AbsMinHeatSetpointLimit" atEndpoint:v17];
    }
    else
    {
      uint64_t v90 = (void *)MEMORY[0x2533B64D0]();
      uint64_t v91 = v21;
      id v92 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v93 = v103 = v90;
        *(_DWORD *)buf = 138543874;
        v128 = v93;
        __int16 v129 = 2112;
        id v130 = v15;
        __int16 v131 = 2112;
        id v132 = v17;
        _os_log_impl(&dword_252495000, v92, OS_LOG_TYPE_ERROR, "%{public}@AbsMinHeatSetpointLimit attribute from the %@ cluster endpoint:%@ absent from cache", buf, 0x20u);

        uint64_t v90 = v103;
      }

      [MEMORY[0x263F087E8] hapErrorWithCode:14];
      id v36 = v89 = v36;
    }

    id v94 = objc_alloc_init(MEMORY[0x263F10FA0]);
    id v28 = [v27 readAttributeAbsMaxHeatSetpointLimitWithParams:v94];

    long long v95 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v28 forIdentify:@"absMaxHeatSetpointLimit"];

    id v30 = v95;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v96 = v30;
    }
    else {
      uint64_t v96 = 0;
    }
    id v97 = v96;

    if (v97)
    {
      id v120 = v97;
      long long v98 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v120 count:1];
      [v118 addDeviceAttributeValues:v98 clusterClassName:v15 attributeName:@"AbsMaxHeatSetpointLimit" atEndpoint:v17];
    }
    else
    {
      long long v99 = (void *)MEMORY[0x2533B64D0]();
      contextd = v21;
      uint64_t v100 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        uint64_t v101 = v107 = v99;
        *(_DWORD *)buf = 138543874;
        v128 = v101;
        __int16 v129 = 2112;
        id v130 = v15;
        __int16 v131 = 2112;
        id v132 = v17;
        _os_log_impl(&dword_252495000, v100, OS_LOG_TYPE_ERROR, "%{public}@AbsMaxHeatSetpointLimit attribute from the %@ cluster endpoint:%@ absent from cache", buf, 0x20u);

        long long v99 = v107;
      }

      [MEMORY[0x263F087E8] hapErrorWithCode:14];
      id v36 = v98 = v36;
    }

    id v31 = v118;
  }
  id v25 = v114;
LABEL_42:

LABEL_43:
  id v18 = v116;
  id v16 = v117;
LABEL_44:
  v19[2](v19, v36);
}

- (void)_querySupportedAttributesFromClusterAtCHIPEndpoint:(id)a3 device:(id)a4 callbackQueue:(id)a5 clusterClassName:(id)a6 completionHandler:(id)a7
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, id, id, void))a7;
  id v17 = (void *)MEMORY[0x2533B64D0]();
  id v18 = self;
  id v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    __int16 v44 = v20;
    __int16 v45 = 2112;
    id v46 = v15;
    __int16 v47 = 2112;
    id v48 = v12;
    _os_log_impl(&dword_252495000, v19, OS_LOG_TYPE_INFO, "%{public}@Querying device cluster %@ at endpoint %@ for supported attributes", buf, 0x20u);
  }
  uint64_t v21 = [(HMMTRDescriptorClusterManager *)v18 createClusterInstance];
  uint64_t v22 = ((void (**)(void, id, id, id, id))v21)[2](v21, v15, v13, v12, v14);

  if (objc_opt_respondsToSelector())
  {
    id v41 = v14;
    id v42 = v13;
    id v23 = objc_alloc_init(MEMORY[0x263F10FA0]);
    id v24 = [v22 readAttributeAttributeListWithParams:v23];

    id v25 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v24 forIdentify:@"attributeList"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v26 = v25;
    }
    else {
      id v26 = 0;
    }
    id v27 = v26;

    id v28 = (void *)MEMORY[0x2533B64D0]();
    id v29 = v18;
    id v30 = HMFGetOSLogHandle();
    id v31 = v30;
    if (v27)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v32 = v39 = v28;
        *(_DWORD *)buf = 138544130;
        __int16 v44 = v32;
        __int16 v45 = 2112;
        id v46 = v15;
        __int16 v47 = 2112;
        id v48 = v12;
        __int16 v49 = 2112;
        id v50 = v27;
        _os_log_impl(&dword_252495000, v31, OS_LOG_TYPE_INFO, "%{public}@Received supported attributes list from accessory for cluster class %@ on endpoint %@. Attributes: %@", buf, 0x2Au);

        id v28 = v39;
      }

      v16[2](v16, v15, v27, 0);
    }
    else
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        id v40 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        __int16 v44 = v40;
        __int16 v45 = 2112;
        id v46 = v15;
        __int16 v47 = 2112;
        id v48 = v12;
        _os_log_impl(&dword_252495000, v31, OS_LOG_TYPE_ERROR, "%{public}@AttributeList attribute for cluster class %@ on endpoint %@ absent from cache", buf, 0x20u);
      }
      id v38 = [MEMORY[0x263F087E8] hapErrorWithCode:14];
      ((void (**)(id, id, id, void *))v16)[2](v16, v15, 0, v38);
    }
    id v14 = v41;
    id v13 = v42;
  }
  else
  {
    id v33 = (void *)MEMORY[0x2533B64D0]();
    id v34 = v18;
    id v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v37 = id v36 = v14;
      *(_DWORD *)buf = 138543618;
      __int16 v44 = v37;
      __int16 v45 = 2112;
      id v46 = v22;
      _os_log_impl(&dword_252495000, v35, OS_LOG_TYPE_ERROR, "%{public}@Supported attributes selector not found for cluster: %@", buf, 0x16u);

      id v14 = v36;
    }

    id v24 = [MEMORY[0x263F087E8] hapErrorWithCode:1];
    ((void (**)(id, id, id, void *))v16)[2](v16, v15, 0, v24);
  }
}

- (void)_queryFeatureMapFromClusterAtCHIPEndpoint:(id)a3 device:(id)a4 callbackQueue:(id)a5 clusterClassName:(id)a6 completionHandler:(id)a7
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, id, id, void))a7;
  id v17 = (void *)MEMORY[0x2533B64D0]();
  id v18 = self;
  id v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    __int16 v44 = v20;
    __int16 v45 = 2112;
    id v46 = v15;
    __int16 v47 = 2112;
    id v48 = v12;
    _os_log_impl(&dword_252495000, v19, OS_LOG_TYPE_INFO, "%{public}@Querying device cluster %@ at endpoint %@ for feature map value", buf, 0x20u);
  }
  uint64_t v21 = [(HMMTRDescriptorClusterManager *)v18 createClusterInstance];
  uint64_t v22 = ((void (**)(void, id, id, id, id))v21)[2](v21, v15, v13, v12, v14);

  if (objc_opt_respondsToSelector())
  {
    id v41 = v14;
    id v42 = v13;
    id v23 = objc_alloc_init(MEMORY[0x263F10FA0]);
    id v24 = [v22 readAttributeFeatureMapWithParams:v23];

    id v25 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v24 forIdentify:@"featureMap"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v26 = v25;
    }
    else {
      id v26 = 0;
    }
    id v27 = v26;

    id v28 = (void *)MEMORY[0x2533B64D0]();
    id v29 = v18;
    id v30 = HMFGetOSLogHandle();
    id v31 = v30;
    if (v27)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v32 = v39 = v28;
        *(_DWORD *)buf = 138543874;
        __int16 v44 = v32;
        __int16 v45 = 2112;
        id v46 = v15;
        __int16 v47 = 2112;
        id v48 = v27;
        _os_log_impl(&dword_252495000, v31, OS_LOG_TYPE_INFO, "%{public}@Received feature map from accessory for cluster class %@. Value: %@", buf, 0x20u);

        id v28 = v39;
      }

      v16[2](v16, v15, v27, 0);
    }
    else
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        id v40 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v44 = v40;
        __int16 v45 = 2112;
        id v46 = v15;
        _os_log_impl(&dword_252495000, v31, OS_LOG_TYPE_ERROR, "%{public}@Feature map not in cache for cluster class %@", buf, 0x16u);
      }
      id v38 = [MEMORY[0x263F087E8] hapErrorWithCode:14];
      ((void (**)(id, id, id, void *))v16)[2](v16, v15, 0, v38);
    }
    id v14 = v41;
    id v13 = v42;
  }
  else
  {
    id v33 = (void *)MEMORY[0x2533B64D0]();
    id v34 = v18;
    id v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v37 = id v36 = v14;
      *(_DWORD *)buf = 138543618;
      __int16 v44 = v37;
      __int16 v45 = 2112;
      id v46 = v22;
      _os_log_impl(&dword_252495000, v35, OS_LOG_TYPE_ERROR, "%{public}@Feature map selector not found for cluster: %@", buf, 0x16u);

      id v14 = v36;
    }

    id v24 = [MEMORY[0x263F087E8] hapErrorWithCode:1];
    ((void (**)(id, id, id, void *))v16)[2](v16, v15, 0, v24);
  }
}

- (void)fetchHAPCategoryWithMTRDevice:(id)a3 nodeId:(id)a4 server:(id)a5 callbackQueue:(id)a6 completionHandler:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a7;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __109__HMMTRDescriptorClusterManager_fetchHAPCategoryWithMTRDevice_nodeId_server_callbackQueue_completionHandler___block_invoke;
  v16[3] = &unk_265377B40;
  void v16[4] = self;
  id v17 = v10;
  id v18 = v11;
  id v19 = v12;
  id v13 = v11;
  id v14 = v10;
  id v15 = v12;
  [(HMMTRDescriptorClusterManager *)self fetchEndpointsWithMTRDevice:v14 endpointID:&unk_2702B56A0 callbackQueue:v13 completionHandler:v16];
}

void __109__HMMTRDescriptorClusterManager_fetchHAPCategoryWithMTRDevice_nodeId_server_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", &unk_2702B56A0, 0);
    id v8 = (void *)MEMORY[0x2533B64D0]([v7 addObjectsFromArray:v5]);
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v23 = v11;
      __int16 v24 = 2112;
      id v25 = v7;
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Total endpoints In Use at endpoint 0: %@. Error: %@", buf, 0x20u);
    }
    id v12 = *(void **)(a1 + 32);
    id v13 = (void *)[v7 mutableCopy];
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 48);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __109__HMMTRDescriptorClusterManager_fetchHAPCategoryWithMTRDevice_nodeId_server_callbackQueue_completionHandler___block_invoke_145;
    v20[3] = &unk_265376048;
    v20[4] = *(void *)(a1 + 32);
    id v21 = *(id *)(a1 + 56);
    [v12 fetchDeviceTypesForEndpoints:v13 mtrDevice:v14 endpointDeviceTypes:0 lastError:0 callbackQueue:v15 completionHandler:v20];
  }
  else
  {
    id v16 = (void *)MEMORY[0x2533B64D0]();
    id v17 = *(id *)(a1 + 32);
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v23 = v19;
      __int16 v24 = 2112;
      id v25 = v6;
      _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_ERROR, "%{public}@No Endpoints In Use at endpoint 0: %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __109__HMMTRDescriptorClusterManager_fetchHAPCategoryWithMTRDevice_nodeId_server_callbackQueue_completionHandler___block_invoke_145(uint64_t a1, void *a2, void *a3)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    if (v5) {
      goto LABEL_9;
    }
    id v35 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_38:
    v35();
    goto LABEL_39;
  }
  id v7 = (void *)MEMORY[0x2533B64D0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    uint64_t v53 = v10;
    __int16 v54 = 2112;
    id v55 = v6;
    __int16 v56 = 2112;
    id v57 = v5;
    _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while getting all the device types for each endpoint. %@. DeviceTypes: %@", buf, 0x20u);
  }
  if (!v5)
  {
    id v35 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_38;
  }
  id v11 = (void *)MEMORY[0x2533B64D0]();
  id v12 = *(id *)(a1 + 32);
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v53 = v14;
    _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_ERROR, "%{public}@DeviceList is incomplete, proceeding anyway. Only partial enumeration is possible", buf, 0xCu);
  }
LABEL_9:
  uint64_t v15 = (void *)MEMORY[0x2533B64D0]();
  id v16 = *(id *)(a1 + 32);
  id v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v53 = v18;
    __int16 v54 = 2112;
    id v55 = v5;
    _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_INFO, "%{public}@Device Type Enumeration The List of device types @%@", buf, 0x16u);
  }
  id v41 = [*(id *)(a1 + 32) protocolMap];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v19 = v5;
  uint64_t v39 = [v19 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (!v39)
  {

    id v20 = 0;
LABEL_35:
    uint64_t v36 = *(void *)(a1 + 40);
    id v34 = [MEMORY[0x263F087E8] hapErrorWithCode:1];
    (*(void (**)(uint64_t, void, void *))(v36 + 16))(v36, 0, v34);
    goto LABEL_36;
  }
  id v20 = 0;
  id v40 = 0;
  uint64_t v21 = *(void *)v47;
  uint64_t v37 = *(void *)v47;
  id v38 = v6;
  do
  {
    for (uint64_t i = 0; i != v39; ++i)
    {
      if (*(void *)v47 != v21) {
        objc_enumerationMutation(v19);
      }
      id v23 = *(void **)(*((void *)&v46 + 1) + 8 * i);
      __int16 v24 = [v19 objectForKey:v23];
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v25 = v24;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v42 objects:v50 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v43;
        while (2)
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v43 != v28) {
              objc_enumerationMutation(v25);
            }
            if ([*(id *)(*((void *)&v42 + 1) + 8 * j) integerValue] == 14)
            {
              (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

              id v6 = v38;
              goto LABEL_39;
            }
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v42 objects:v50 count:16];
          if (v27) {
            continue;
          }
          break;
        }
      }

      id v30 = [v41 categoriesForDeviceTypes:v25];
      if ([v30 count])
      {
        if (!v20
          || (unsigned int v31 = [v23 unsignedShortValue], v31 < objc_msgSend(v20, "unsignedShortValue")))
        {
          uint64_t v32 = [v30 objectAtIndexedSubscript:0];

          id v33 = v23;
          id v20 = v33;
          id v40 = (void *)v32;
        }
      }

      uint64_t v21 = v37;
    }
    uint64_t v39 = [v19 countByEnumeratingWithState:&v46 objects:v51 count:16];
  }
  while (v39);

  id v34 = v40;
  if (!v40)
  {
    id v6 = v38;
    goto LABEL_35;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v6 = v38;
LABEL_36:

LABEL_39:
}

- (void)fetchHAPCategoryForCHIPDevice:(id)a3 nodeId:(id)a4 server:(id)a5 callbackQueue:(id)a6 completionHandler:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a7;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __109__HMMTRDescriptorClusterManager_fetchHAPCategoryForCHIPDevice_nodeId_server_callbackQueue_completionHandler___block_invoke;
  v16[3] = &unk_265377B40;
  void v16[4] = self;
  id v17 = v10;
  id v18 = v11;
  id v19 = v12;
  id v13 = v11;
  id v14 = v10;
  id v15 = v12;
  [(HMMTRDescriptorClusterManager *)self fetchEndpointsForDevice:v14 endpointID:&unk_2702B56A0 callbackQueue:v13 completionHandler:v16];
}

void __109__HMMTRDescriptorClusterManager_fetchHAPCategoryForCHIPDevice_nodeId_server_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", &unk_2702B56A0, 0);
    id v8 = (void *)MEMORY[0x2533B64D0]([v7 addObjectsFromArray:v5]);
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v23 = v11;
      __int16 v24 = 2112;
      id v25 = v7;
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Total endpoints In Use at endpoint 0: %@. Error: %@", buf, 0x20u);
    }
    id v12 = *(void **)(a1 + 32);
    id v13 = (void *)[v7 mutableCopy];
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 48);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __109__HMMTRDescriptorClusterManager_fetchHAPCategoryForCHIPDevice_nodeId_server_callbackQueue_completionHandler___block_invoke_140;
    v20[3] = &unk_265376048;
    v20[4] = *(void *)(a1 + 32);
    id v21 = *(id *)(a1 + 56);
    [v12 fetchDeviceTypesForEndpoints:v13 device:v14 endpointDeviceTypes:0 lastError:0 callbackQueue:v15 completionHandler:v20];
  }
  else
  {
    id v16 = (void *)MEMORY[0x2533B64D0]();
    id v17 = *(id *)(a1 + 32);
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v23 = v19;
      __int16 v24 = 2112;
      id v25 = v6;
      _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_ERROR, "%{public}@No Endpoints In Use at endpoint 0: %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __109__HMMTRDescriptorClusterManager_fetchHAPCategoryForCHIPDevice_nodeId_server_callbackQueue_completionHandler___block_invoke_140(uint64_t a1, void *a2, void *a3)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    if (v5) {
      goto LABEL_9;
    }
    id v35 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_38:
    v35();
    goto LABEL_39;
  }
  id v7 = (void *)MEMORY[0x2533B64D0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    uint64_t v53 = v10;
    __int16 v54 = 2112;
    id v55 = v6;
    __int16 v56 = 2112;
    id v57 = v5;
    _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while getting all the device types for each endpoint. %@. DeviceTypes: %@", buf, 0x20u);
  }
  if (!v5)
  {
    id v35 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_38;
  }
  id v11 = (void *)MEMORY[0x2533B64D0]();
  id v12 = *(id *)(a1 + 32);
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v53 = v14;
    _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_ERROR, "%{public}@DeviceList is incomplete, proceeding anyway. Only partial enumeration is possible", buf, 0xCu);
  }
LABEL_9:
  uint64_t v15 = (void *)MEMORY[0x2533B64D0]();
  id v16 = *(id *)(a1 + 32);
  id v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v53 = v18;
    __int16 v54 = 2112;
    id v55 = v5;
    _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_INFO, "%{public}@Device Type Enumeration The List of device types @%@", buf, 0x16u);
  }
  id v41 = +[HMMTRProtocolMap protocolMap];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v19 = v5;
  uint64_t v39 = [v19 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (!v39)
  {

    id v20 = 0;
LABEL_35:
    uint64_t v36 = *(void *)(a1 + 40);
    id v34 = [MEMORY[0x263F087E8] hapErrorWithCode:1];
    (*(void (**)(uint64_t, void, void *))(v36 + 16))(v36, 0, v34);
    goto LABEL_36;
  }
  id v20 = 0;
  id v40 = 0;
  uint64_t v21 = *(void *)v47;
  uint64_t v37 = *(void *)v47;
  id v38 = v6;
  do
  {
    for (uint64_t i = 0; i != v39; ++i)
    {
      if (*(void *)v47 != v21) {
        objc_enumerationMutation(v19);
      }
      id v23 = *(void **)(*((void *)&v46 + 1) + 8 * i);
      __int16 v24 = [v19 objectForKey:v23];
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v25 = v24;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v42 objects:v50 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v43;
        while (2)
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v43 != v28) {
              objc_enumerationMutation(v25);
            }
            if ([*(id *)(*((void *)&v42 + 1) + 8 * j) integerValue] == 14)
            {
              (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

              id v6 = v38;
              goto LABEL_39;
            }
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v42 objects:v50 count:16];
          if (v27) {
            continue;
          }
          break;
        }
      }

      id v30 = [v41 categoriesForDeviceTypes:v25];
      if ([v30 count])
      {
        if (!v20
          || (unsigned int v31 = [v23 unsignedShortValue], v31 < objc_msgSend(v20, "unsignedShortValue")))
        {
          uint64_t v32 = [v30 objectAtIndexedSubscript:0];

          id v33 = v23;
          id v20 = v33;
          id v40 = (void *)v32;
        }
      }

      uint64_t v21 = v37;
    }
    uint64_t v39 = [v19 countByEnumeratingWithState:&v46 objects:v51 count:16];
  }
  while (v39);

  id v34 = v40;
  if (!v40)
  {
    id v6 = v38;
    goto LABEL_35;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v6 = v38;
LABEL_36:

LABEL_39:
}

- (void)fetchHAPServicesWithMTRDevice:(id)a3 nodeId:(id)a4 server:(id)a5 callbackQueue:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  char v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__6332;
  void v30[4] = __Block_byref_object_dispose__6333;
  id v31 = 0;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __109__HMMTRDescriptorClusterManager_fetchHAPServicesWithMTRDevice_nodeId_server_callbackQueue_completionHandler___block_invoke;
  v22[3] = &unk_265376020;
  void v22[4] = self;
  id v17 = v16;
  id v27 = v17;
  uint64_t v28 = v32;
  id v18 = v12;
  id v23 = v18;
  id v19 = v15;
  id v24 = v19;
  id v29 = v30;
  id v20 = v13;
  id v25 = v20;
  id v21 = v14;
  id v26 = v21;
  [(HMMTRDescriptorClusterManager *)self fetchEndpointsWithMTRDevice:v18 endpointID:&unk_2702B56A0 callbackQueue:v19 completionHandler:v22];

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);
}

void __109__HMMTRDescriptorClusterManager_fetchHAPServicesWithMTRDevice_nodeId_server_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", &unk_2702B56A0, 0);
    id v8 = (void *)MEMORY[0x2533B64D0]([v7 addObjectsFromArray:v5]);
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v29 = v11;
      __int16 v30 = 2112;
      id v31 = v7;
      __int16 v32 = 2112;
      id v33 = v6;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Total endpoints In Use at endpoint 0: %@. Error: %@", buf, 0x20u);
    }
    id v12 = *(void **)(a1 + 32);
    id v13 = (void *)[v7 mutableCopy];
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 48);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __109__HMMTRDescriptorClusterManager_fetchHAPServicesWithMTRDevice_nodeId_server_callbackQueue_completionHandler___block_invoke_136;
    v20[3] = &unk_265375FF8;
    v20[4] = *(void *)(a1 + 32);
    id v26 = *(id *)(a1 + 72);
    long long v27 = *(_OWORD *)(a1 + 80);
    id v21 = v5;
    id v22 = *(id *)(a1 + 40);
    id v23 = *(id *)(a1 + 56);
    id v24 = *(id *)(a1 + 64);
    id v25 = *(id *)(a1 + 48);
    [v12 fetchDeviceTypesForEndpoints:v13 mtrDevice:v15 endpointDeviceTypes:0 lastError:0 callbackQueue:v14 completionHandler:v20];
  }
  else
  {
    id v16 = (void *)MEMORY[0x2533B64D0]();
    id v17 = *(id *)(a1 + 32);
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v29 = v19;
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_ERROR, "%{public}@No Endpoints In Use at endpoint 0: %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void __109__HMMTRDescriptorClusterManager_fetchHAPServicesWithMTRDevice_nodeId_server_callbackQueue_completionHandler___block_invoke_136(uint64_t a1, void *a2, void *a3)
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v59 = v10;
      __int16 v60 = 2112;
      id v61 = v6;
      __int16 v62 = 2112;
      id v63 = v5;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while getting all the device types for each endpoint. %@. DeviceTypes: %@", buf, 0x20u);
    }
    if (!v5)
    {
      (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
      goto LABEL_35;
    }
    id v11 = (void *)MEMORY[0x2533B64D0]();
    id v12 = *(id *)(a1 + 32);
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v59 = v14;
      _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_ERROR, "%{public}@DeviceList is incomplete, proceeding anyway. Only partial enumeration is possible", buf, 0xCu);
    }
    goto LABEL_9;
  }
  if (v5)
  {
LABEL_9:
    id v38 = v6;
    uint64_t v15 = (void *)MEMORY[0x2533B64D0]();
    id v16 = *(id *)(a1 + 32);
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v59 = v18;
      __int16 v60 = 2112;
      id v61 = v5;
      _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_INFO, "%{public}@Device Type Enumeration The List of device types @%@", buf, 0x16u);
    }
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v39 = v5;
    id v19 = v5;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v53 != v22) {
            objc_enumerationMutation(v19);
          }
          if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
          {
            id v24 = *(void **)(*((void *)&v52 + 1) + 8 * i);
            id v25 = [v19 objectForKey:v24];
            long long v48 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            id v26 = v25;
            uint64_t v27 = [v26 countByEnumeratingWithState:&v48 objects:v56 count:16];
            if (v27)
            {
              uint64_t v28 = v27;
              uint64_t v29 = *(void *)v49;
              while (2)
              {
                for (uint64_t j = 0; j != v28; ++j)
                {
                  if (*(void *)v49 != v29) {
                    objc_enumerationMutation(v26);
                  }
                  if ([*(id *)(*((void *)&v48 + 1) + 8 * j) integerValue] == 14)
                  {
                    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
                    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), v24);
                    goto LABEL_27;
                  }
                }
                uint64_t v28 = [v26 countByEnumeratingWithState:&v48 objects:v56 count:16];
                if (v28) {
                  continue;
                }
                break;
              }
            }
LABEL_27:
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v52 objects:v57 count:16];
      }
      while (v21);
    }

    id v6 = v38;
    id v5 = v39;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
  {
    id v31 = *(void **)(a1 + 32);
    uint64_t v32 = *(void *)(a1 + 48);
    uint64_t v33 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __109__HMMTRDescriptorClusterManager_fetchHAPServicesWithMTRDevice_nodeId_server_callbackQueue_completionHandler___block_invoke_137;
    v40[3] = &unk_265375FD0;
    v40[4] = v31;
    uint64_t v34 = *(void *)(a1 + 72);
    id v46 = *(id *)(a1 + 80);
    long long v47 = *(_OWORD *)(a1 + 88);
    id v41 = v5;
    id v42 = *(id *)(a1 + 48);
    id v43 = *(id *)(a1 + 56);
    id v44 = *(id *)(a1 + 64);
    id v45 = *(id *)(a1 + 72);
    [v31 fetchEndpointsWithMTRDevice:v32 endpointID:v33 callbackQueue:v34 completionHandler:v40];
  }
  else
  {
    id v35 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", &unk_2702B56A0, 0);
    [v35 addObjectsFromArray:*(void *)(a1 + 40)];
    uint64_t v36 = *(void **)(a1 + 32);
    uint64_t v37 = (void *)[v35 mutableCopy];
    [v36 fetchHAPServicesForEndpoints:v37 endpointDeviceTypes:v5 device:*(void *)(a1 + 48) nodeId:*(void *)(a1 + 56) isBridge:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) bridgeAggregateNodeEndpoint:0 server:*(void *)(a1 + 64) topology:0 hapAccessoryInfo:0 callbackQueue:*(void *)(a1 + 72) completionHandler:*(void *)(a1 + 80)];
  }
LABEL_35:
}

void __109__HMMTRDescriptorClusterManager_fetchHAPServicesWithMTRDevice_nodeId_server_callbackQueue_completionHandler___block_invoke_137(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x2533B64D0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v17 = v11;
      __int16 v18 = 2112;
      id v19 = v5;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Endpoints In Use for the bridge: %@. Error: %@", buf, 0x20u);
    }
    id v12 = *(void **)(a1 + 32);
    id v13 = (void *)[v5 mutableCopy];
    uint64_t v14 = [*(id *)(a1 + 32) getBridgeEndpointsDeviceTypes:v5 endpointDeviceTypes:*(void *)(a1 + 40)];
    [v12 fetchHAPServicesForEndpoints:v13 endpointDeviceTypes:v14 device:*(void *)(a1 + 48) nodeId:*(void *)(a1 + 56) isBridge:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) bridgeAggregateNodeEndpoint:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) server:*(void *)(a1 + 64) topology:0 hapAccessoryInfo:0 callbackQueue:*(void *)(a1 + 72) completionHandler:*(void *)(a1 + 80)];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v17 = v15;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while getting all the endpoints for the aggregate node (bridge) endpoint: %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
}

- (void)fetchStateCaptureInformationForDevice:(id)a3 nodeId:(id)a4 server:(id)a5 callbackQueue:(id)a6 completionHandler:(id)a7
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, void))a7;
  id v17 = [(HMMTRDescriptorClusterManager *)self fetchPartsListForDevice:v12 endpointID:&unk_2702B56A0 callbackQueue:v15];
  __int16 v18 = v17;
  if (v17 && [v17 count])
  {
    long long v50 = v18;
    long long v47 = v16;
    id v19 = objc_alloc_init(MEMORY[0x263F089D8]);
    __int16 v20 = NSString;
    id v48 = v14;
    id v21 = [v14 fabricID];
    id v49 = v13;
    uint64_t v22 = objc_msgSend(v20, "stringWithFormat:", @"( NodeID: %@ FabricID: %@, "), v13, v21;;
    [v19 appendString:v22];

    uint64_t v23 = [(HMMTRDescriptorClusterManager *)self _fetchStateCaptureInformationForDevice:v12 endpointID:&unk_2702B56A0 callbackQueue:v15];
    id v24 = [NSString stringWithFormat:@"{Endpoints: {EndpointID: %@, EndpointData: %@ }, ", &unk_2702B56A0, v23];
    [v19 appendString:v24];

    id v25 = (void *)MEMORY[0x2533B64D0]();
    id v26 = self;
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v60 = v28;
      __int16 v61 = 2112;
      uint64_t v62 = v23;
      _os_log_impl(&dword_252495000, v27, OS_LOG_TYPE_DEBUG, "%{public}@State Capture: Information for endpoint 0: %@", buf, 0x16u);
    }
    id v46 = (void *)v23;

    long long v53 = v26;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = v18;
    uint64_t v54 = [obj countByEnumeratingWithState:&v55 objects:v65 count:16];
    if (v54)
    {
      uint64_t v52 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v54; ++i)
        {
          if (*(void *)v56 != v52) {
            objc_enumerationMutation(obj);
          }
          uint64_t v30 = *(void *)(*((void *)&v55 + 1) + 8 * i);
          id v31 = [(HMMTRDescriptorClusterManager *)v53 _fetchStateCaptureInformationForDevice:v12 endpointID:v30 callbackQueue:v15];
          uint64_t v32 = (void *)MEMORY[0x2533B64D0]();
          uint64_t v33 = v53;
          uint64_t v34 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            id v35 = v19;
            id v36 = v15;
            v38 = id v37 = v12;
            *(_DWORD *)buf = 138543874;
            __int16 v60 = v38;
            __int16 v61 = 2112;
            uint64_t v62 = v30;
            __int16 v63 = 2112;
            uint64_t v64 = v31;
            _os_log_impl(&dword_252495000, v34, OS_LOG_TYPE_DEBUG, "%{public}@State Capture: Information for endpoint %@: %@", buf, 0x20u);

            id v12 = v37;
            id v15 = v36;
            id v19 = v35;
          }

          id v39 = [NSString stringWithFormat:@"{EndpointID: %@, EndpointData: %@}, ", v30, v31];
          [v19 appendString:v39];
        }
        uint64_t v54 = [obj countByEnumeratingWithState:&v55 objects:v65 count:16];
      }
      while (v54);
    }

    id v40 = [NSString stringWithFormat:@" }; }; "];
    [v19 appendString:v40];

    id v41 = v19;
    id v16 = v47;
    ((void (**)(id, void *))v47)[2](v47, v41);

    id v14 = v48;
    id v13 = v49;
    __int16 v18 = v50;
  }
  else
  {
    id v42 = (void *)MEMORY[0x2533B64D0]();
    id v43 = self;
    id v44 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      id v45 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v60 = v45;
      _os_log_impl(&dword_252495000, v44, OS_LOG_TYPE_ERROR, "%{public}@State Capture: No Endpoints In Use at endpoint 0", buf, 0xCu);
    }
    v16[2](v16, 0);
  }
}

- (id)_fetchStateCaptureInformationForDevice:(id)a3 endpointID:(id)a4 callbackQueue:(id)a5
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x263F089D8]);
  id v71 = self;
  uint64_t v72 = v10;
  id v12 = [(HMMTRDescriptorClusterManager *)self fetchPartsListForDevice:v8 endpointID:v9 callbackQueue:v10];
  uint64_t v66 = v12;
  if (v12)
  {
    id v13 = [v12 componentsJoinedByString:@", "];
    id v14 = [NSString stringWithFormat:@"(PartsList: %@), ", v13];
    [v11 appendString:v14];
  }
  else
  {
    id v13 = [NSString stringWithFormat:@"(PartsList: ()), "];
    [v11 appendString:v13];
  }

  id v15 = [(HMMTRDescriptorClusterManager *)self fetchDeviceTypesWithMTRDevice:v8 endpointID:v9 callbackQueue:v10];
  id v67 = v8;
  id v70 = v11;
  uint64_t v65 = v15;
  if (v15)
  {
    id v64 = v9;
    id v16 = objc_msgSend(NSString, "stringWithFormat:", @"(DeviceTypes: ");
    [v11 appendString:v16];

    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id obj = v15;
    uint64_t v17 = [obj countByEnumeratingWithState:&v81 objects:v87 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v82;
      uint64_t v20 = *MEMORY[0x263F10B88];
      uint64_t v21 = *MEMORY[0x263F10B90];
      uint64_t v22 = *MEMORY[0x263F10C30];
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v82 != v19) {
            objc_enumerationMutation(obj);
          }
          id v24 = *(void **)(*((void *)&v81 + 1) + 8 * i);
          id v25 = [v24 objectForKeyedSubscript:v20];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v26 = v25;
          }
          else {
            id v26 = 0;
          }
          id v27 = v26;

          uint64_t v28 = [v24 objectForKeyedSubscript:v21];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v29 = v28;
          }
          else {
            uint64_t v29 = 0;
          }
          id v30 = v29;

          id v31 = [v30 objectForKeyedSubscript:v22];

          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v32 = v31;
          }
          else {
            uint64_t v32 = 0;
          }
          id v33 = v32;

          uint64_t v34 = [NSString stringWithFormat:@" %@ (revision %@), ", v33, v27];

          id v11 = v70;
          [v70 appendString:v34];
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v81 objects:v87 count:16];
      }
      while (v18);
    }

    id v35 = [NSString stringWithFormat:@", "]);
    [v11 appendString:v35];

    id v9 = v64;
  }
  else
  {
    id v36 = [NSString stringWithFormat:@"(DeviceTypes : ()), "];
    [v11 appendString:v36];
  }
  id v37 = [(HMMTRDescriptorClusterManager *)v71 fetchServerClustersForDevice:v8 endpointID:v9 callbackQueue:v72];
  id v38 = NSString;
  id obja = v37;
  if (v37)
  {
    id v39 = objc_msgSend(NSString, "stringWithFormat:", @"(ServerClusters : ");
    [v11 appendString:v39];

    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v40 = v37;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v77 objects:v86 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v78;
      do
      {
        for (uint64_t j = 0; j != v42; ++j)
        {
          if (*(void *)v78 != v43) {
            objc_enumerationMutation(v40);
          }
          uint64_t v45 = *(void *)(*((void *)&v77 + 1) + 8 * j);
          id v46 = [(HMMTRDescriptorClusterManager *)v71 _fetchStateCaptureInformationForDevice:v8 endpointID:v9 clusterID:v45 callbackQueue:v72];
          long long v47 = [NSString stringWithFormat:@"(ClusterID : %@, ClusterInfo : %@), ", v45, v46];
          [v11 appendString:v47];
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v77 objects:v86 count:16];
      }
      while (v42);
    }

    id v38 = NSString;
    id v48 = @", ");
  }
  else
  {
    id v48 = @"(ServerClusters : ()),";
  }
  id v49 = [v38 stringWithFormat:v48];
  [v11 appendString:v49];

  long long v50 = [(HMMTRDescriptorClusterManager *)v71 fetchClientClustersForDevice:v8 endpointID:v9 callbackQueue:v72];
  if (v50)
  {
    long long v51 = v11;
    id v52 = v9;
    long long v53 = objc_msgSend(NSString, "stringWithFormat:", @"(ClientClusters: ");
    [v51 appendString:v53];

    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v54 = v50;
    uint64_t v55 = [v54 countByEnumeratingWithState:&v73 objects:v85 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v74;
      do
      {
        for (uint64_t k = 0; k != v56; ++k)
        {
          if (*(void *)v74 != v57) {
            objc_enumerationMutation(v54);
          }
          uint64_t v59 = *(void *)(*((void *)&v73 + 1) + 8 * k);
          __int16 v60 = [(HMMTRDescriptorClusterManager *)v71 _fetchStateCaptureInformationForDevice:v8 endpointID:v52 clusterID:v59 callbackQueue:v72];
          __int16 v61 = [NSString stringWithFormat:@"( ClusterID:%@ ClusterInfo: %@), ", v59, v60];
          [v70 appendString:v61];
        }
        uint64_t v56 = [v54 countByEnumeratingWithState:&v73 objects:v85 count:16];
      }
      while (v56);
    }

    uint64_t v62 = [NSString stringWithFormat:@""]);
    id v9 = v52;
    id v11 = v70;
  }
  else
  {
    uint64_t v62 = [NSString stringWithFormat:@"(ClientClusters: ()),"];
  }
  [v11 appendString:v62];

  return v11;
}

- (id)_fetchStateCaptureInformationForDevice:(id)a3 endpointID:(id)a4 clusterID:(id)a5 callbackQueue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init(MEMORY[0x263F089D8]);
  id v35 = [(HMMTRDescriptorClusterManager *)self fetchClusterRevisionForDevice:v10 endpointID:v11 clusterID:v12 callbackQueue:v13];
  id v15 = [NSString stringWithFormat:@"(ClusterRevision: %@), ", v35];
  [v14 appendString:v15];

  uint64_t v34 = [(HMMTRDescriptorClusterManager *)self fetchClusterFeatureMapForDevice:v10 endpointID:v11 clusterID:v12 callbackQueue:v13];
  id v16 = [NSString stringWithFormat:@"(FeatureMap: %@), ", v34];
  [v14 appendString:v16];

  uint64_t v17 = [(HMMTRDescriptorClusterManager *)self fetchClusterAttributesForDevice:v10 endpointID:v11 clusterID:v12 callbackQueue:v13];
  id v33 = v17;
  if (v17)
  {
    uint64_t v18 = [v17 componentsJoinedByString:@", "];
    uint64_t v19 = [NSString stringWithFormat:@"(Attributes: %@)", v18];
    [v14 appendString:v19];
  }
  else
  {
    uint64_t v18 = [NSString stringWithFormat:@"(Attributes: ()), "];
    [v14 appendString:v18];
  }

  uint64_t v20 = [(HMMTRDescriptorClusterManager *)self fetchClusterEventListForDevice:v10 endpointID:v11 clusterID:v12 callbackQueue:v13];
  uint64_t v32 = v20;
  if (v20)
  {
    uint64_t v21 = [v20 componentsJoinedByString:@", "];
    uint64_t v22 = [NSString stringWithFormat:@"(Events: %@), ", v21];
    [v14 appendString:v22];
  }
  else
  {
    uint64_t v21 = [NSString stringWithFormat:@"(Events: ()), "];
    [v14 appendString:v21];
  }

  uint64_t v23 = [(HMMTRDescriptorClusterManager *)self fetchClusterAcceptedCommandsForDevice:v10 endpointID:v11 clusterID:v12 callbackQueue:v13];
  id v24 = v23;
  if (v23)
  {
    id v25 = [v23 componentsJoinedByString:@", "];
    id v26 = [NSString stringWithFormat:@"(AcceptedCommands: %@), ", v25];
    [v14 appendString:v26];
  }
  else
  {
    id v25 = [NSString stringWithFormat:@"(AcceptedCommands: ()), "];
    [v14 appendString:v25];
  }

  id v27 = [(HMMTRDescriptorClusterManager *)self fetchClusterGeneratedCommandsForDevice:v10 endpointID:v11 clusterID:v12 callbackQueue:v13];
  uint64_t v28 = v27;
  if (v27)
  {
    uint64_t v29 = [v27 componentsJoinedByString:@", "];
    id v30 = [NSString stringWithFormat:@"(GeneratedCommands: %@) ", v29];
    [v14 appendString:v30];
  }
  else
  {
    uint64_t v29 = [NSString stringWithFormat:@"(GeneratedCommands: ()), "];
    [v14 appendString:v29];
  }

  return v14;
}

- (id)getBridgeEndpointsDeviceTypes:(id)a3 endpointDeviceTypes:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v14 = objc_msgSend(v6, "objectForKeyedSubscript:", v13, (void)v16);
        if (v14) {
          [v7 setObject:v14 forKeyedSubscript:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)buildClusterDescriptorWithDevice:(id)a3 endpointID:(id)a4 queue:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(HMMTRDescriptorClusterManager *)self createClusterInstance];
  id v12 = ((void (**)(void, __CFString *, id, id, id))v11)[2](v11, @"MTRClusterDescriptor", v10, v9, v8);

  return v12;
}

- (HMMTRProtocolMap)protocolMap
{
  return (HMMTRProtocolMap *)+[HMMTRProtocolMap protocolMap];
}

- (HMMTRDescriptorClusterManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMMTRDescriptorClusterManager;
  v2 = [(HMMTRDescriptorClusterManager *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    id createClusterInstance = v2->_createClusterInstance;
    v2->_id createClusterInstance = &__block_literal_global_6518;
  }
  return v3;
}

id __37__HMMTRDescriptorClusterManager_init__block_invoke(uint64_t a1, NSString *a2, void *a3, void *a4, void *a5)
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (void *)[objc_alloc(NSClassFromString(a2)) initWithDevice:v10 endpointID:v9 queue:v8];

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t173 != -1) {
    dispatch_once(&logCategory__hmf_once_t173, &__block_literal_global_337);
  }
  v2 = (void *)logCategory__hmf_once_v174;
  return v2;
}

uint64_t __44__HMMTRDescriptorClusterManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v174;
  logCategory__hmf_once_long long v174 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_40);
  }
  v2 = (void *)cachedDescriptorClusterManager;
  return v2;
}

uint64_t __46__HMMTRDescriptorClusterManager_sharedManager__block_invoke()
{
  uint64_t v0 = objc_alloc_init(HMMTRDescriptorClusterManager);
  uint64_t v1 = cachedDescriptorClusterManager;
  cachedDescriptorClusterManager = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end