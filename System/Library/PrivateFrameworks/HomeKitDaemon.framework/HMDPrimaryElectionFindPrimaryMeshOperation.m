@interface HMDPrimaryElectionFindPrimaryMeshOperation
+ (id)logCategory;
- (HMDPrimaryElectionFindPrimaryMeshOperation)initWithContext:(id)a3 otherResidents:(id)a4;
- (NSArray)results;
- (id)context;
- (id)logIdentifier;
- (void)main;
@end

@implementation HMDPrimaryElectionFindPrimaryMeshOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagesFuture, 0);
  objc_storeStrong((id *)&self->_otherResidents, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_results, 0);
}

- (NSArray)results
{
  return self->_results;
}

- (id)logIdentifier
{
  v2 = -[HMDPrimaryElectionFindPrimaryMeshOperation context]((id *)&self->super.super.super.isa);
  v3 = [v2 home];
  v4 = [v3 uuid];
  v5 = [v4 UUIDString];
  v6 = v5;
  if (!v5) {
    v5 = &stru_26E2EB898;
  }
  v7 = v5;

  return v7;
}

- (id)context
{
  if (WeakRetained)
  {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 40);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void)main
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v3 = -[HMDPrimaryElectionFindPrimaryMeshOperation context]((id *)&self->super.super.super.isa);
  if (([(HMDPrimaryElectionFindPrimaryMeshOperation *)self isCancelled] & 1) == 0 && v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F42520]);
    v5 = [(HMFOperation *)self underlyingQueue];
    v6 = (void *)[v4 initWithQueue:v5];

    v7 = (void *)MEMORY[0x230FBD990]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v36 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Querying residents to see if we're in the primary mesh", buf, 0xCu);
    }
    if (v8) {
      otherResidents = v8->_otherResidents;
    }
    else {
      otherResidents = 0;
    }
    v12 = (void *)MEMORY[0x263EFF980];
    v13 = otherResidents;
    v14 = objc_msgSend(v12, "arrayWithCapacity:", -[NSSet count](v13, "count"));

    if (v8) {
      v15 = v8->_otherResidents;
    }
    else {
      v15 = 0;
    }
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __50__HMDPrimaryElectionFindPrimaryMeshOperation_main__block_invoke;
    v30[3] = &unk_264A22B88;
    id v16 = v3;
    id v31 = v16;
    id v17 = v6;
    id v32 = v17;
    v33 = v8;
    id v18 = v14;
    id v34 = v18;
    [(NSSet *)v15 hmf_enumerateWithAutoreleasePoolUsingBlock:v30];
    v19 = (void *)MEMORY[0x263F42538];
    v20 = (void *)[v18 copy];
    v21 = [v19 allSettled:v20];
    v22 = v21;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_messagesFuture, v21);

      objc_initWeak((id *)buf, v8);
      objc_initWeak(&location, v16);
      messagesFuture = v8->_messagesFuture;
    }
    else
    {

      objc_initWeak((id *)buf, 0);
      objc_initWeak(&location, v16);
      messagesFuture = 0;
    }
    v24 = messagesFuture;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __50__HMDPrimaryElectionFindPrimaryMeshOperation_main__block_invoke_56;
    v26[3] = &unk_264A2C588;
    objc_copyWeak(&v27, (id *)buf);
    objc_copyWeak(&v28, &location);
    id v25 = (id)[(HMFFuture *)v24 inContext:v17 then:v26];

    objc_destroyWeak(&v28);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
}

void __50__HMDPrimaryElectionFindPrimaryMeshOperation_main__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [HMDRemoteDeviceMessageDestination alloc];
  v5 = [*(id *)(a1 + 32) home];
  v6 = [v5 uuid];
  v7 = [v3 device];
  v8 = [(HMDRemoteDeviceMessageDestination *)v4 initWithTarget:v6 device:v7];

  v9 = (void *)[objc_alloc(MEMORY[0x263F42590]) initWithName:@"mesh.meshInformationRequest" destination:v8 payload:0];
  [v9 setTimeout:15.0];
  [v9 setSecureRemote:1];
  [v9 setRemoteRestriction:9];
  v10 = [*(id *)(a1 + 32) messageDispatcher];
  v11 = (void *)[v9 copy];
  v12 = [v10 sendMessageExpectingResponse:v11];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __50__HMDPrimaryElectionFindPrimaryMeshOperation_main__block_invoke_2;
  v26[3] = &unk_264A22EA0;
  uint64_t v13 = *(void *)(a1 + 40);
  void v26[4] = *(void *)(a1 + 48);
  id v27 = v3;
  id v28 = *(id *)(a1 + 32);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __50__HMDPrimaryElectionFindPrimaryMeshOperation_main__block_invoke_52;
  v24[3] = &unk_264A2EC50;
  v24[4] = *(void *)(a1 + 48);
  id v14 = v27;
  id v25 = v14;
  v15 = [v12 inContext:v13 then:v26 orRecover:v24];

  id v16 = (void *)MEMORY[0x230FBD990]();
  id v17 = *(id *)(a1 + 48);
  id v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = HMFGetLogIdentifier();
    v20 = [v14 shortDescription];
    [v9 identifier];
    v23 = v16;
    v22 = v21 = v8;
    *(_DWORD *)buf = 138543874;
    v30 = v19;
    __int16 v31 = 2114;
    id v32 = v20;
    __int16 v33 = 2114;
    id v34 = v22;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Querying resident %{public}@ with message %{public}@", buf, 0x20u);

    v8 = v21;
    id v16 = v23;
  }
  [*(id *)(a1 + 56) addObject:v15];
}

uint64_t __50__HMDPrimaryElectionFindPrimaryMeshOperation_main__block_invoke_56(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = v5;
  if (WeakRetained && v5)
  {
    uint64_t v7 = objc_msgSend(v3, "na_map:", &__block_literal_global_60_162398);
    v8 = (void *)WeakRetained[39];
    WeakRetained[39] = v7;

    v9 = (void *)MEMORY[0x230FBD990]();
    v10 = WeakRetained;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      uint64_t v13 = [v10 results];
      int v15 = 138543618;
      id v16 = v12;
      __int16 v17 = 2112;
      id v18 = v13;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Got results: %@", (uint8_t *)&v15, 0x16u);
    }
    [v10 finish];
  }
  else
  {
    [WeakRetained cancel];
  }

  return 1;
}

id __50__HMDPrimaryElectionFindPrimaryMeshOperation_main__block_invoke_2_57(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = v2;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __50__HMDPrimaryElectionFindPrimaryMeshOperation_main__block_invoke_2(id *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = [a1[6] home];
    id v5 = +[HMDPrimaryElectionMeshInformation meshInformationFromMessagePayload:v3 home:v4];

    if (v5)
    {
      v5;
    }
    else
    {
      v11 = (void *)MEMORY[0x230FBD990]();
      id v12 = a1[4];
      uint64_t v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = HMFGetLogIdentifier();
        int v15 = [a1[5] shortDescription];
        int v17 = 138543874;
        id v18 = v14;
        __int16 v19 = 2114;
        v20 = v15;
        __int16 v21 = 2112;
        id v22 = v3;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to parse message payload for resident %{public}@: %@", (uint8_t *)&v17, 0x20u);
      }
    }
  }
  else
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = a1[4];
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      v10 = [a1[5] shortDescription];
      int v17 = 138543618;
      id v18 = v9;
      __int16 v19 = 2114;
      v20 = v10;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@nil result for resident: %{public}@", (uint8_t *)&v17, 0x16u);
    }
  }

  return 1;
}

uint64_t __50__HMDPrimaryElectionFindPrimaryMeshOperation_main__block_invoke_52(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    v8 = [*(id *)(a1 + 40) shortDescription];
    int v10 = 138543874;
    v11 = v7;
    __int16 v12 = 2114;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Got error result for resident %{public}@: %@", (uint8_t *)&v10, 0x20u);
  }

  return 1;
}

- (HMDPrimaryElectionFindPrimaryMeshOperation)initWithContext:(id)a3 otherResidents:(id)a4
{
  id v6 = (NSSet *)a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDPrimaryElectionFindPrimaryMeshOperation;
  id v7 = a3;
  v8 = [(HMFOperation *)&v11 initWithTimeout:0.0];
  objc_storeWeak((id *)&v8->_context, v7);

  otherResidents = v8->_otherResidents;
  v8->_otherResidents = v6;

  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t14_162471 != -1) {
    dispatch_once(&logCategory__hmf_once_t14_162471, &__block_literal_global_64_162472);
  }
  id v2 = (void *)logCategory__hmf_once_v15_162473;
  return v2;
}

void __57__HMDPrimaryElectionFindPrimaryMeshOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = (void *)logCategory__hmf_once_v15_162473;
  logCategory__hmf_once_v15_162473 = v0;
}

@end