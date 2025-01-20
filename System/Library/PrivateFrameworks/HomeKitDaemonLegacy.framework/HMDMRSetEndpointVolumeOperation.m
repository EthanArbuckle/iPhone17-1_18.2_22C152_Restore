@interface HMDMRSetEndpointVolumeOperation
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)cancelOnSetup;
- (HMDMPCAssistantDiscovery)discovery;
- (HMDMRSetEndpointVolumeOperation)initWithRouteIDs:(id)a3 volume:(id)a4;
- (HMDMRSetEndpointVolumeOperation)initWithRouteIDs:(id)a3 volume:(id)a4 externalObjectInterface:(id)a5;
- (HMDMRSetEndpointVolumeOperationExternalObjectInterface)externalObjectInterface;
- (NSArray)attributeDescriptions;
- (NSArray)routeIDs;
- (NSError)partialExecutionError;
- (NSNumber)volume;
- (NSString)description;
- (NSString)shortDescription;
- (id)connectToEndpoint:(id)a3 connection:(id)a4;
- (id)discoverRemoteControlEndpointsForUIDs:(id)a3;
- (id)getVolumeCapabilitiesForEndpoint:(id)a3 outputDeviceUID:(id)a4;
- (id)setVolumeOnEndpoint:(id)a3 outputDeviceUID:(id)a4;
- (void)generateOverallResultAndFinishWithDeviceStatuses:(id)a3 overallError:(id)a4;
- (void)main;
- (void)setDiscovery:(id)a3;
- (void)setPartialExecutionError:(id)a3;
@end

@implementation HMDMRSetEndpointVolumeOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalObjectInterface, 0);
  objc_storeStrong((id *)&self->_discovery, 0);
  objc_storeStrong((id *)&self->_partialExecutionError, 0);
  objc_storeStrong((id *)&self->_routeIDs, 0);
  objc_storeStrong((id *)&self->_volume, 0);
}

- (HMDMRSetEndpointVolumeOperationExternalObjectInterface)externalObjectInterface
{
  return (HMDMRSetEndpointVolumeOperationExternalObjectInterface *)objc_getProperty(self, a2, 344, 1);
}

- (void)setDiscovery:(id)a3
{
}

- (HMDMPCAssistantDiscovery)discovery
{
  return self->_discovery;
}

- (void)setPartialExecutionError:(id)a3
{
}

- (NSError)partialExecutionError
{
  return self->_partialExecutionError;
}

- (NSArray)routeIDs
{
  return self->_routeIDs;
}

- (NSNumber)volume
{
  return self->_volume;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSArray)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDMRSetEndpointVolumeOperation *)self volume];
  v5 = (void *)[v3 initWithName:@"Volume" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMDMRSetEndpointVolumeOperation *)self routeIDs];
  v8 = (void *)[v6 initWithName:@"Route IDs" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return (NSArray *)v9;
}

- (NSString)shortDescription
{
  id v3 = NSString;
  v4 = [(id)objc_opt_class() shortDescription];
  v5 = [(HMDMRSetEndpointVolumeOperation *)self volume];
  id v6 = [(HMDMRSetEndpointVolumeOperation *)self routeIDs];
  v7 = [v3 stringWithFormat:@"%@ volume: %@ route IDs: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (id)setVolumeOnEndpoint:(id)a3 outputDeviceUID:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v37 = v11;
    __int16 v38 = 2112;
    id v39 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Begin setMRAVOutputDeviceVolume on outputDeviceUID %@", buf, 0x16u);
  }
  v12 = [(HMFOperation *)v9 activity];
  [v12 markWithFormat:@"Begin setMRAVOutputDeviceVolume on outputDeviceUID %@", v7];

  objc_initWeak((id *)buf, v9);
  v13 = [(HMDMRSetEndpointVolumeOperation *)v9 externalObjectInterface];
  v14 = [(HMDMRSetEndpointVolumeOperation *)v9 volume];
  [v14 floatValue];
  int v16 = v15;
  v17 = [(HMFOperation *)v9 underlyingQueue];
  LODWORD(v18) = v16;
  v19 = [v13 setMRAVOutputDeviceVolume:v6 endpoint:v7 outputDeviceUID:v17 queue:v18];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __71__HMDMRSetEndpointVolumeOperation_setVolumeOnEndpoint_outputDeviceUID___block_invoke;
  v34[3] = &unk_1E6A14668;
  id v20 = v7;
  id v35 = v20;
  v21 = [v19 flatMap:v34];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __71__HMDMRSetEndpointVolumeOperation_setVolumeOnEndpoint_outputDeviceUID___block_invoke_2;
  v32[3] = &unk_1E6A14048;
  id v22 = v20;
  id v33 = v22;
  v23 = [v21 recover:v32];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __71__HMDMRSetEndpointVolumeOperation_setVolumeOnEndpoint_outputDeviceUID___block_invoke_3;
  v28[3] = &unk_1E6A08C30;
  objc_copyWeak(&v31, (id *)buf);
  id v24 = v22;
  id v29 = v24;
  id v25 = v6;
  id v30 = v25;
  v26 = [v23 addCompletionBlock:v28];

  objc_destroyWeak(&v31);
  objc_destroyWeak((id *)buf);

  return v26;
}

id __71__HMDMRSetEndpointVolumeOperation_setVolumeOnEndpoint_outputDeviceUID___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F7A0D8];
  v2 = [[HMDMROutputDeviceStatus alloc] initWithOutputUID:*(void *)(a1 + 32)];
  id v3 = [v1 futureWithResult:v2];

  return v3;
}

id __71__HMDMRSetEndpointVolumeOperation_setVolumeOnEndpoint_outputDeviceUID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2972 underlyingError:a2];
  v4 = (void *)MEMORY[0x1E4F7A0D8];
  v5 = [[HMDMROutputDeviceStatus alloc] initWithOutputUID:*(void *)(a1 + 32) error:v3];
  id v6 = [v4 futureWithResult:v5];

  return v6;
}

void __71__HMDMRSetEndpointVolumeOperation_setVolumeOnEndpoint_outputDeviceUID___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = [WeakRetained activity];
  [v8 markWithFormat:@"Complete setMRAVOutputDeviceVolume on outputDeviceUID %@", *(void *)(a1 + 32)];

  v9 = (void *)MEMORY[0x1D9452090]();
  id v10 = WeakRetained;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    v13 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v27 = v12;
    __int16 v28 = 2112;
    id v29 = v13;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Complete setMRAVOutputDeviceVolume on outputDeviceUID %@", buf, 0x16u);
  }
  v14 = (void *)MEMORY[0x1D9452090]();
  id v15 = v10;
  int v16 = HMFGetOSLogHandle();
  v17 = v16;
  if (v6)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      double v18 = HMFGetLogIdentifier();
      v19 = [v15 volume];
      uint64_t v20 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      v27 = v18;
      __int16 v28 = 2112;
      id v29 = v19;
      __int16 v30 = 2112;
      uint64_t v31 = v20;
      __int16 v32 = 2112;
      id v33 = v6;
      v21 = "%{public}@Unable to set volume to %@ on endpoint %@ : %@";
      id v22 = v17;
      os_log_type_t v23 = OS_LOG_TYPE_ERROR;
      uint32_t v24 = 42;
LABEL_8:
      _os_log_impl(&dword_1D49D5000, v22, v23, v21, buf, v24);
    }
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    double v18 = HMFGetLogIdentifier();
    v19 = [v15 volume];
    uint64_t v25 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v27 = v18;
    __int16 v28 = 2112;
    id v29 = v19;
    __int16 v30 = 2112;
    uint64_t v31 = v25;
    v21 = "%{public}@Sucessfully set volume to %@ on endpoint %@";
    id v22 = v17;
    os_log_type_t v23 = OS_LOG_TYPE_INFO;
    uint32_t v24 = 32;
    goto LABEL_8;
  }
}

- (id)getVolumeCapabilitiesForEndpoint:(id)a3 outputDeviceUID:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v26 = v11;
    __int16 v27 = 2112;
    id v28 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Begin getMRAVEndpointOutputDeviceUIDVolumeControlCapabilitiesForEndpoint on outputDeviceUID %@", buf, 0x16u);
  }
  v12 = [(HMFOperation *)v9 activity];
  [v12 markWithFormat:@"Begin getMRAVEndpointOutputDeviceUIDVolumeControlCapabilitiesForEndpoint on outputDeviceUID %@", v7];

  objc_initWeak((id *)buf, v9);
  v13 = [(HMDMRSetEndpointVolumeOperation *)v9 externalObjectInterface];
  v14 = [(HMFOperation *)v9 underlyingQueue];
  id v15 = [v13 getMRAVEndpointOutputDeviceUIDVolumeControlCapabilitiesForEndpoint:v6 outputDeviceUID:v7 queue:v14];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __84__HMDMRSetEndpointVolumeOperation_getVolumeCapabilitiesForEndpoint_outputDeviceUID___block_invoke;
  v21[3] = &unk_1E6A08A70;
  objc_copyWeak(&v24, (id *)buf);
  id v16 = v6;
  id v22 = v16;
  id v17 = v7;
  id v23 = v17;
  double v18 = [v15 addCompletionBlock:v21];
  v19 = [v18 recover:&__block_literal_global_171_24247];

  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);

  return v19;
}

void __84__HMDMRSetEndpointVolumeOperation_getVolumeCapabilitiesForEndpoint_outputDeviceUID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v6)
  {
    v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = WeakRetained;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v11;
      __int16 v21 = 2112;
      uint64_t v22 = v12;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine if volume control is supported on endpoint %@ : %@", buf, 0x20u);
    }
  }
  v13 = (void *)MEMORY[0x1D9452090]();
  id v14 = WeakRetained;
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = HMFGetLogIdentifier();
    uint64_t v17 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = v16;
    __int16 v21 = 2112;
    uint64_t v22 = v17;
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Complete getMRAVEndpointOutputDeviceUIDVolumeControlCapabilitiesForEndpoint on outputDeviceUID %@", buf, 0x16u);
  }
  double v18 = [v14 activity];
  [v18 markWithFormat:@"Complete getMRAVEndpointOutputDeviceUIDVolumeControlCapabilitiesForEndpoint on outputDeviceUID %@", *(void *)(a1 + 40)];
}

id __84__HMDMRSetEndpointVolumeOperation_getVolumeCapabilitiesForEndpoint_outputDeviceUID___block_invoke_169(uint64_t a1, uint64_t a2)
{
  v2 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2970 underlyingError:a2];
  id v3 = [MEMORY[0x1E4F7A0D8] futureWithError:v2];

  return v3;
}

- (id)connectToEndpoint:(id)a3 connection:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v28 = v11;
    __int16 v29 = 2112;
    id v30 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Begin connect to endpoint %@", buf, 0x16u);
  }
  uint64_t v12 = [(HMFOperation *)v9 activity];
  [v12 markWithFormat:@"Begin connect to endpoint %@", v6];

  objc_initWeak((id *)buf, v9);
  v13 = (void *)MEMORY[0x1E4F7A0D8];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __64__HMDMRSetEndpointVolumeOperation_connectToEndpoint_connection___block_invoke;
  v24[3] = &unk_1E6A08A28;
  id v14 = v7;
  id v25 = v14;
  id v15 = v6;
  id v26 = v15;
  id v16 = [v13 futureWithErrorOnlyHandlerAdapterBlock:v24];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __64__HMDMRSetEndpointVolumeOperation_connectToEndpoint_connection___block_invoke_3;
  v21[3] = &unk_1E6A10B10;
  objc_copyWeak(&v23, (id *)buf);
  id v17 = v15;
  id v22 = v17;
  double v18 = [v16 addCompletionBlock:v21];
  v19 = [v18 recover:&__block_literal_global_161];

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);

  return v19;
}

void __64__HMDMRSetEndpointVolumeOperation_connectToEndpoint_connection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) mravEndpoint];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__HMDMRSetEndpointVolumeOperation_connectToEndpoint_connection___block_invoke_2;
  v7[3] = &unk_1E6A08A00;
  id v8 = v3;
  id v6 = v3;
  [v4 connectToEndpoint:v5 completion:v7];
}

void __64__HMDMRSetEndpointVolumeOperation_connectToEndpoint_connection___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v6)
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = WeakRetained;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v11;
      __int16 v21 = 2112;
      uint64_t v22 = v12;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to connect to endpoint %@, %@", buf, 0x20u);
    }
  }
  v13 = [WeakRetained activity];
  [v13 markWithFormat:@"Complete connect to endpoint %@", *(void *)(a1 + 32)];

  id v14 = (void *)MEMORY[0x1D9452090]();
  id v15 = WeakRetained;
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = HMFGetLogIdentifier();
    uint64_t v18 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = v17;
    __int16 v21 = 2112;
    uint64_t v22 = v18;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Complete connect to endpoint %@", buf, 0x16u);
  }
}

id __64__HMDMRSetEndpointVolumeOperation_connectToEndpoint_connection___block_invoke_159(uint64_t a1, uint64_t a2)
{
  v2 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2971 underlyingError:a2];
  id v3 = [MEMORY[0x1E4F7A0D8] futureWithError:v2];

  return v3;
}

uint64_t __64__HMDMRSetEndpointVolumeOperation_connectToEndpoint_connection___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)discoverRemoteControlEndpointsForUIDs:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v18 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Begin discoverRemoteControlEndpointsMatchingUIDs", buf, 0xCu);
  }
  id v9 = [(HMFOperation *)v6 activity];
  [v9 markWithReason:@"Begin discoverRemoteControlEndpointsMatchingUIDs"];

  objc_initWeak((id *)buf, v6);
  id v10 = (void *)MEMORY[0x1E4F7A0D8];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__HMDMRSetEndpointVolumeOperation_discoverRemoteControlEndpointsForUIDs___block_invoke;
  v14[3] = &unk_1E6A089D8;
  objc_copyWeak(&v16, (id *)buf);
  id v11 = v4;
  id v15 = v11;
  uint64_t v12 = [v10 futureWithCompletionHandlerAdapterBlock:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

  return v12;
}

void __73__HMDMRSetEndpointVolumeOperation_discoverRemoteControlEndpointsForUIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained discovery];
  uint64_t v6 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__HMDMRSetEndpointVolumeOperation_discoverRemoteControlEndpointsForUIDs___block_invoke_2;
  v8[3] = &unk_1E6A089B0;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  id v7 = v3;
  id v9 = v7;
  [v5 discoverRemoteControlEndpointsMatchingUIDs:v6 completion:v8];

  objc_destroyWeak(&v10);
}

void __73__HMDMRSetEndpointVolumeOperation_discoverRemoteControlEndpointsForUIDs___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = WeakRetained;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v24 = 138543874;
    uint64_t v25 = v11;
    __int16 v26 = 2112;
    id v27 = v5;
    __int16 v28 = 2112;
    id v29 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Operation endpoints %@ : output devices %@", (uint8_t *)&v24, 0x20u);
  }
  uint64_t v12 = [v9 activity];
  [v12 markWithReason:@"Completed discoverRemoteControlEndpointsMatchingUIDs"];

  v13 = (void *)MEMORY[0x1D9452090]();
  id v14 = v9;
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = HMFGetLogIdentifier();
    int v24 = 138543362;
    uint64_t v25 = v16;
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Completed discoverRemoteControlEndpointsMatchingUIDs", (uint8_t *)&v24, 0xCu);
  }
  if ([v5 count])
  {
    id v17 = objc_msgSend(v5, "na_map:", &__block_literal_global_148);
    uint64_t v18 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x1D9452090]();
    id v20 = v14;
    __int16 v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      int v24 = 138543362;
      uint64_t v25 = v22;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@No endpoints found for volume operation", (uint8_t *)&v24, 0xCu);
    }
    uint64_t v23 = *(void *)(a1 + 32);
    id v17 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2973 description:@"Could not find endpoints" underlyingError:0];
    uint64_t v18 = *(void (**)(void))(v23 + 16);
  }
  v18();
}

HMDMRAVEndpoint *__73__HMDMRSetEndpointVolumeOperation_discoverRemoteControlEndpointsForUIDs___block_invoke_145(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[HMDMRAVEndpoint alloc] initWithMRAVEndpoint:v2];

  return v3;
}

- (BOOL)cancelOnSetup
{
  id v2 = self;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v3 = [(HMDMRSetEndpointVolumeOperation *)self dependencies];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v39 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        id v9 = [v8 error];

        if (v9)
        {
          id v10 = (void *)MEMORY[0x1D9452090]();
          id v11 = v2;
          uint64_t v12 = v2;
          v13 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            id v14 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v43 = v14;
            _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Volume Operation canceled by dependency failure", buf, 0xCu);
          }
          id v15 = [(HMFOperation *)v12 activity];
          [v15 markWithReason:@"Volume Operation canceled by dependency failure"];

          id v16 = [v8 error];
          [(HMFOperation *)v12 cancelWithError:v16];

          id v2 = v11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v5);
  }

  id v17 = [(HMDMRSetEndpointVolumeOperation *)v2 routeIDs];
  uint64_t v18 = [v17 count];

  uint64_t v19 = [(HMDMRSetEndpointVolumeOperation *)v2 volume];
  [v19 floatValue];
  if (v20 >= 0.0)
  {
    uint64_t v22 = [(HMDMRSetEndpointVolumeOperation *)v2 volume];
    [v22 floatValue];
    BOOL v21 = v23 <= 1.0;
  }
  else
  {
    BOOL v21 = 0;
  }

  int v24 = [(HMDMRSetEndpointVolumeOperation *)v2 isCancelled];
  int v25 = !v21;
  if (!v18) {
    int v25 = 1;
  }
  if (!v24 && v25)
  {
    if (v18) {
      char v26 = 1;
    }
    else {
      char v26 = v21;
    }
    id v27 = NSString;
    if (v26)
    {
      if (v18)
      {
        __int16 v28 = [(HMDMRSetEndpointVolumeOperation *)v2 volume];
        id v29 = [v27 stringWithFormat:@"SetVolumeOperation: volume: (%@) is invalid", v28];
        uint64_t v30 = 2967;
      }
      else
      {
        __int16 v28 = [(HMDMRSetEndpointVolumeOperation *)v2 routeIDs];
        id v29 = [v27 stringWithFormat:@"SetVolumeOperation: route ID: (%@) is invalid", v28];
        uint64_t v30 = 2968;
      }
    }
    else
    {
      __int16 v28 = [(HMDMRSetEndpointVolumeOperation *)v2 volume];
      uint64_t v31 = [(HMDMRSetEndpointVolumeOperation *)v2 routeIDs];
      id v29 = [v27 stringWithFormat:@"SetVolumeOperation volume: (%@) and route ID: (%@) are invalid", v28, v31];

      uint64_t v30 = 2969;
    }

    __int16 v32 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:v30 description:v29 underlyingError:0];
    [(HMFOperation *)v2 cancelWithError:v32];

    id v33 = (void *)MEMORY[0x1D9452090]();
    uint64_t v34 = v2;
    id v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v43 = v36;
      __int16 v44 = 2112;
      v45 = v29;
      _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
  }
  return [(HMDMRSetEndpointVolumeOperation *)v2 isCancelled];
}

- (void)generateOverallResultAndFinishWithDeviceStatuses:(id)a3 overallError:(id)a4
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMFOperation *)self activity];
  [v8 markWithReason:@"Volume futures completed"];

  id v9 = (void *)MEMORY[0x1D9452090]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = id v12 = v6;
    *(_DWORD *)buf = 138543362;
    v101 = v13;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Volume futures completed", buf, 0xCu);

    id v6 = v12;
  }

  id v14 = (void *)[v6 mutableCopy];
  id v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = [MEMORY[0x1E4F1CA48] array];
  }
  id v17 = v16;

  uint64_t v18 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v19 = [(HMDMRSetEndpointVolumeOperation *)v10 routeIDs];
  float v20 = [v18 setWithArray:v19];

  BOOL v21 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v22 = objc_msgSend(v17, "na_map:", &__block_literal_global_102);
  float v23 = [v21 setWithArray:v22];

  id v82 = v7;
  v83 = v10;
  v86 = v17;
  v80 = v23;
  v81 = v20;
  if (([v20 isEqualToSet:v23] & 1) == 0)
  {
    int v24 = (void *)[v20 mutableCopy];
    int v25 = (void *)MEMORY[0x1D9452090]([v24 minusSet:v23]);
    char v26 = v10;
    id v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      __int16 v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v101 = v28;
      __int16 v102 = 2112;
      v103 = v24;
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Couldn't discover these endpoints to set their volume: %@", buf, 0x16u);

      id v17 = v86;
    }

    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    obuint64_t j = v24;
    uint64_t v29 = [obj countByEnumeratingWithState:&v94 objects:v99 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v95;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v95 != v31) {
            objc_enumerationMutation(obj);
          }
          uint64_t v33 = *(void *)(*((void *)&v94 + 1) + 8 * i);
          uint64_t v34 = [HMDMROutputDeviceStatus alloc];
          id v35 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2966];
          v36 = [(HMDMROutputDeviceStatus *)v34 initWithOutputUID:v33 error:v35];

          v93[0] = MEMORY[0x1E4F143A8];
          v93[1] = 3221225472;
          v93[2] = __97__HMDMRSetEndpointVolumeOperation_generateOverallResultAndFinishWithDeviceStatuses_overallError___block_invoke_104;
          v93[3] = &unk_1E6A08900;
          v93[4] = v33;
          id v17 = v86;
          if ((objc_msgSend(v86, "na_any:", v93) & 1) == 0) {
            [v86 addObject:v36];
          }
        }
        uint64_t v30 = [obj countByEnumeratingWithState:&v94 objects:v99 count:16];
      }
      while (v30);
    }

    float v23 = v80;
    id v10 = v83;
    float v20 = v81;
  }
  if (!objc_msgSend(v17, "na_any:", &__block_literal_global_107)) {
    goto LABEL_50;
  }
  id obja = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v37 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v38 = [MEMORY[0x1E4F1CA80] set];
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v39 = v17;
  uint64_t v40 = [v39 countByEnumeratingWithState:&v89 objects:v98 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v90;
    do
    {
      for (uint64_t j = 0; j != v41; ++j)
      {
        if (*(void *)v90 != v42) {
          objc_enumerationMutation(v39);
        }
        __int16 v44 = *(void **)(*((void *)&v89 + 1) + 8 * j);
        v45 = [v44 outputUID];

        if (v45)
        {
          v46 = [v44 error];

          if (v46)
          {
            uint64_t v47 = [v44 error];
            v48 = [v44 outputUID];
            [v37 setObject:v47 forKeyedSubscript:v48];
          }
          else
          {
            uint64_t v47 = [v44 outputUID];
            [v38 addObject:v47];
          }
        }
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v89 objects:v98 count:16];
    }
    while (v41);
  }

  v49 = (void *)[v37 copy];
  [obja setObject:v49 forKeyedSubscript:@"HMD.MRSetEndpointVolumeOperation.FailedEndpoints"];

  v50 = [v38 allObjects];
  [obja setObject:v50 forKeyedSubscript:@"HMD.MRSetEndpointVolumeOperation.SucceededEndpoints"];

  v51 = objc_msgSend(v39, "na_map:", &__block_literal_global_112_24303);
  v52 = v51;
  if (v7)
  {
    id v53 = v7;
  }
  else
  {
    id v53 = [v51 firstObject];
  }
  v54 = v53;
  [obja setObject:v53 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  v87[0] = MEMORY[0x1E4F143A8];
  v87[1] = 3221225472;
  v87[2] = __97__HMDMRSetEndpointVolumeOperation_generateOverallResultAndFinishWithDeviceStatuses_overallError___block_invoke_4;
  v87[3] = &unk_1E6A08968;
  id v55 = v54;
  id v88 = v55;
  int v56 = objc_msgSend(v52, "na_all:", v87);
  int v57 = v55 ? v56 : 0;
  v58 = (void *)MEMORY[0x1E4F28C58];
  if (v7 || v57)
  {
    v59 = objc_msgSend(v55, "domain", v52);
    uint64_t v61 = [v55 code];
    v62 = (void *)[obja copy];
    v60 = [v58 errorWithDomain:v59 code:v61 userInfo:v62];
  }
  else
  {
    v59 = objc_msgSend(obja, "copy", v52);
    v60 = [v58 hmPrivateErrorWithCode:2965 userInfo:v59];
  }

  uint64_t v63 = [v38 count];
  v64 = [(HMFOperation *)v83 activity];
  v65 = v64;
  uint64_t v66 = v63;
  if (v63)
  {
    [v64 markWithReason:@"finished with partial success"];

    v67 = (void *)MEMORY[0x1D9452090]();
    v68 = v83;
    v69 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      v70 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v101 = v70;
      __int16 v102 = 2112;
      v103 = v60;
      _os_log_impl(&dword_1D49D5000, v69, OS_LOG_TYPE_DEFAULT, "%{public}@Operation finished with partial success <%@>", buf, 0x16u);
    }
    [(HMDMRSetEndpointVolumeOperation *)v68 setPartialExecutionError:v60];
  }
  else
  {
    [v64 markWithReason:@"Canceled with error"];

    v71 = [(HMFOperation *)v83 activity];
    [v71 invalidate];

    v72 = (void *)MEMORY[0x1D9452090]();
    v73 = v83;
    v74 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v76 = v75 = v72;
      *(_DWORD *)buf = 138543618;
      v101 = v76;
      __int16 v102 = 2112;
      v103 = v60;
      _os_log_impl(&dword_1D49D5000, v74, OS_LOG_TYPE_ERROR, "%{public}@Operation canceled due to failure <%@>", buf, 0x16u);

      v72 = v75;
    }

    [(HMFOperation *)v73 cancelWithError:v60];
  }

  id v7 = v82;
  id v10 = v83;
  id v17 = v86;
  float v23 = v80;
  float v20 = v81;
  if (v66)
  {
LABEL_50:
    v77 = [(HMFOperation *)v10 activity];
    [v77 markWithReason:@"Finished with success"];

    v78 = [(HMFOperation *)v10 activity];
    [v78 invalidate];

    [(HMFOperation *)v10 finish];
  }
}

uint64_t __97__HMDMRSetEndpointVolumeOperation_generateOverallResultAndFinishWithDeviceStatuses_overallError___block_invoke_104(uint64_t a1, void *a2)
{
  id v3 = [a2 outputUID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

BOOL __97__HMDMRSetEndpointVolumeOperation_generateOverallResultAndFinishWithDeviceStatuses_overallError___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) domain];
  uint64_t v5 = [v3 domain];
  if ([v4 isEqualToString:v5])
  {
    uint64_t v6 = [*(id *)(a1 + 32) code];
    BOOL v7 = v6 == [v3 code];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t __97__HMDMRSetEndpointVolumeOperation_generateOverallResultAndFinishWithDeviceStatuses_overallError___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 error];
}

BOOL __97__HMDMRSetEndpointVolumeOperation_generateOverallResultAndFinishWithDeviceStatuses_overallError___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 error];
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __97__HMDMRSetEndpointVolumeOperation_generateOverallResultAndFinishWithDeviceStatuses_overallError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 outputUID];
}

- (void)main
{
  BOOL v3 = [(HMFOperation *)self activity];
  [v3 markWithReason:@"Volume Operation Started"];

  if ([(HMDMRSetEndpointVolumeOperation *)self cancelOnSetup])
  {
    uint64_t v4 = [(HMFOperation *)self activity];
    [v4 markWithReason:@"Canceled with error before starting"];

    id v11 = [(HMFOperation *)self activity];
    [v11 invalidate];
  }
  else
  {
    uint64_t v5 = [(HMDMRSetEndpointVolumeOperation *)self externalObjectInterface];
    uint64_t v6 = [v5 createAssistantDiscovery];
    [(HMDMRSetEndpointVolumeOperation *)self setDiscovery:v6];

    BOOL v7 = [(HMDMRSetEndpointVolumeOperation *)self routeIDs];
    id v8 = [(HMDMRSetEndpointVolumeOperation *)self discoverRemoteControlEndpointsForUIDs:v7];

    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __39__HMDMRSetEndpointVolumeOperation_main__block_invoke;
    v14[3] = &unk_1E6A18528;
    objc_copyWeak(&v15, &location);
    id v9 = (id)[v8 addFailureBlock:v14];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_2;
    v12[3] = &unk_1E6A19160;
    objc_copyWeak(&v13, &location);
    id v10 = (id)[v8 addSuccessBlock:v12];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __39__HMDMRSetEndpointVolumeOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained generateOverallResultAndFinishWithDeviceStatuses:0 overallError:v3];
}

void __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  from = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  float v23 = [MEMORY[0x1E4F1CA48] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v5)
  {
    uint64_t v21 = *(void *)v32;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v31 + 1) + 8 * v6);
        id v8 = [WeakRetained externalObjectInterface];
        id v9 = [v8 createAssistantConnection];

        id v10 = [WeakRetained connectToEndpoint:v7 connection:v9];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_3;
        v27[3] = &unk_1E6A088B8;
        id v11 = v9;
        id v28 = v11;
        objc_copyWeak(&v30, from);
        uint64_t v29 = v7;
        id v12 = [v10 flatMap:v27];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_5;
        v26[3] = &unk_1E6A14048;
        v26[4] = v7;
        id v13 = [v12 recover:v26];

        [v23 addObject:v13];
        objc_destroyWeak(&v30);

        ++v6;
      }
      while (v5 != v6);
      uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v5);
  }

  id v14 = (void *)MEMORY[0x1E4F7A0D8];
  id v15 = (void *)MEMORY[0x1E4F7A0F0];
  id v16 = [WeakRetained underlyingQueue];
  id v17 = [v15 schedulerWithDispatchQueue:v16];
  uint64_t v18 = [v14 combineAllFutures:v23 ignoringErrors:1 scheduler:v17];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_6;
  v24[3] = &unk_1E6A19160;
  objc_copyWeak(&v25, from);
  id v19 = (id)[v18 addSuccessBlock:v24];

  objc_destroyWeak(&v25);
}

id __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v35 = a2;
  id v36 = *(id *)(a1 + 32);
  v37 = (id *)(a1 + 48);
  uint64_t v38 = a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained externalObjectInterface];
  uint64_t v4 = (void *)[v3 copyMRAVEndpointOutputDevices:*(void *)(a1 + 40)];

  id v39 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obuint64_t j = v4;
  uint64_t v42 = [obj countByEnumeratingWithState:&v54 objects:v66 count:16];
  if (v42)
  {
    uint64_t v41 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v42; ++i)
      {
        if (*(void *)v55 != v41) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(id *)(*((void *)&v54 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v7 = v6;
        }
        else {
          uint64_t v7 = 0;
        }
        id v8 = v7;

        id v9 = objc_msgSend(v8, "uid", v35, v36);
        if (v8)
        {
          id v10 = [WeakRetained routeIDs];
          v52[0] = MEMORY[0x1E4F143A8];
          v52[1] = 3221225472;
          v52[2] = __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_81;
          v52[3] = &unk_1E6A139C0;
          id v11 = v8;
          id v53 = v11;
          id v12 = objc_msgSend(v10, "na_filter:", v52);

          id v13 = (void *)MEMORY[0x1D9452090]();
          id v14 = WeakRetained;
          id v15 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            id v16 = HMFGetLogIdentifier();
            id v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
            *(_DWORD *)buf = 138544130;
            v59 = v16;
            __int16 v60 = 2112;
            id v61 = v17;
            __int16 v62 = 2112;
            uint64_t v63 = v12;
            __int16 v64 = 2112;
            id v65 = v11;
            _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Found %@ matching route IDs (%@) on the output device: %@", buf, 0x2Au);
          }
          if ([v12 count])
          {
            uint64_t v18 = [v14 getVolumeCapabilitiesForEndpoint:*(void *)(v38 + 40) outputDeviceUID:v9];
            v48[0] = MEMORY[0x1E4F143A8];
            v48[1] = 3221225472;
            v48[2] = __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_83;
            v48[3] = &unk_1E6A08840;
            objc_copyWeak(&v51, v37);
            id v19 = v9;
            uint64_t v20 = *(void *)(v38 + 40);
            id v49 = v19;
            uint64_t v50 = v20;
            uint64_t v21 = [v18 flatMap:v48];
            v46[0] = MEMORY[0x1E4F143A8];
            v46[1] = 3221225472;
            v46[2] = __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_85;
            v46[3] = &unk_1E6A14048;
            id v47 = v19;
            uint64_t v22 = [v21 recover:v46];
            v44[0] = MEMORY[0x1E4F143A8];
            v44[1] = 3221225472;
            v44[2] = __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_2_87;
            v44[3] = &unk_1E6A08890;
            id v45 = v12;
            float v23 = [v22 flatMap:v44];

            [v39 addObject:v23];
            objc_destroyWeak(&v51);
          }
        }
        else
        {
          int v24 = (void *)MEMORY[0x1D9452090]();
          id v25 = WeakRetained;
          char v26 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            id v27 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v59 = v27;
            __int16 v60 = 2112;
            id v61 = v6;
            _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Got nil output device from outputDeviceRef %@", buf, 0x16u);
          }
        }
      }
      uint64_t v42 = [obj countByEnumeratingWithState:&v54 objects:v66 count:16];
    }
    while (v42);
  }

  id v28 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v29 = (void *)MEMORY[0x1E4F7A0F0];
  id v30 = [WeakRetained underlyingQueue];
  long long v31 = [v29 schedulerWithDispatchQueue:v30];
  long long v32 = [v28 combineAllFutures:v39 ignoringErrors:1 scheduler:v31];
  long long v33 = [v32 flatMap:&__block_literal_global_24328];

  return v33;
}

id __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_5(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F7A0D8];
  id v4 = a2;
  uint64_t v5 = [[HMDMROutputDeviceStatus alloc] initWithOutputEndpoint:*(void *)(a1 + 32) error:v4];

  v9[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  uint64_t v7 = [v3 futureWithResult:v6];

  return v7;
}

void __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_6(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "na_arrayByFlattening");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained generateOverallResultAndFinishWithDeviceStatuses:v4 overallError:0];
}

uint64_t __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_81(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsUID:a2];
}

id __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_83(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([v3 unsignedIntegerValue] == 2)
  {
    uint64_t v5 = [WeakRetained setVolumeOnEndpoint:*(void *)(a1 + 40) outputDeviceUID:*(void *)(a1 + 32)];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = WeakRetained;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      uint64_t v10 = *(void *)(a1 + 32);
      int v14 = 138543874;
      id v15 = v9;
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Skipping setMRAVOutputDeviceVolume on outputDeviceUID %@. Volume not controllable with given capabilities: %@", (uint8_t *)&v14, 0x20u);
    }
    id v11 = (void *)MEMORY[0x1E4F7A0D8];
    id v12 = [[HMDMROutputDeviceStatus alloc] initWithOutputUID:*(void *)(a1 + 32)];
    uint64_t v5 = [v11 futureWithResult:v12];
  }
  return v5;
}

id __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_85(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F7A0D8];
  id v4 = a2;
  uint64_t v5 = [[HMDMROutputDeviceStatus alloc] initWithOutputUID:*(void *)(a1 + 32) error:v4];

  id v6 = [v3 futureWithResult:v5];

  return v6;
}

id __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_2_87(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v5 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_3_88;
  v10[3] = &unk_1E6A08868;
  id v11 = v3;
  id v6 = v3;
  id v7 = objc_msgSend(v5, "na_map:", v10);
  id v8 = [v4 futureWithResult:v7];

  return v8;
}

id __39__HMDMRSetEndpointVolumeOperation_main__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F7A0D8];
  id v3 = objc_msgSend(a2, "na_arrayByFlattening");
  id v4 = [v2 futureWithResult:v3];

  return v4;
}

HMDMROutputDeviceStatus *__39__HMDMRSetEndpointVolumeOperation_main__block_invoke_3_88(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [HMDMROutputDeviceStatus alloc];
  uint64_t v5 = [*(id *)(a1 + 32) error];
  id v6 = [(HMDMROutputDeviceStatus *)v4 initWithOutputUID:v3 error:v5];

  return v6;
}

- (HMDMRSetEndpointVolumeOperation)initWithRouteIDs:(id)a3 volume:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(HMDMRSetEndpointVolumeOperationDefaultExternalObjectInterface);
  id v9 = [(HMDMRSetEndpointVolumeOperation *)self initWithRouteIDs:v7 volume:v6 externalObjectInterface:v8];

  return v9;
}

- (HMDMRSetEndpointVolumeOperation)initWithRouteIDs:(id)a3 volume:(id)a4 externalObjectInterface:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HMDMRSetEndpointVolumeOperation;
  id v11 = [(HMFOperation *)&v21 initWithTimeout:0.0];
  if (v11)
  {
    id v12 = NSNumber;
    [v9 floatValue];
    *(float *)&double v14 = v13 / 100.0;
    uint64_t v15 = [v12 numberWithFloat:v14];
    volume = v11->_volume;
    v11->_volume = (NSNumber *)v15;

    uint64_t v17 = [v8 copy];
    routeIDs = v11->_routeIDs;
    v11->_routeIDs = (NSArray *)v17;

    objc_storeStrong((id *)&v11->_externalObjectInterface, a5);
    id v19 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"HMDMRSetEndpointVolumeOperation"];
    [(HMFOperation *)v11 setActivity:v19];
  }
  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t24_24350 != -1) {
    dispatch_once(&logCategory__hmf_once_t24_24350, &__block_literal_global_190);
  }
  id v2 = (void *)logCategory__hmf_once_v25_24351;
  return v2;
}

uint64_t __46__HMDMRSetEndpointVolumeOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v25_24351;
  logCategory__hmf_once_v25_24351 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)shortDescription
{
  return @"HMDMRSetEndpointVolumeOperation";
}

@end