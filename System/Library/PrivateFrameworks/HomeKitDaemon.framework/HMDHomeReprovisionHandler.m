@interface HMDHomeReprovisionHandler
+ (id)logCategory;
- (HMDHomeReprovisionHandler)init;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)messageReceiveQueue;
- (id)home;
- (id)logIdentifier;
- (id)messageDestination;
- (void)_handleReprovisionAccessory:(id)a3;
- (void)_handleRequestSearchForAccessoriesNeedingReprovisioning:(id)a3;
- (void)_reportAccessoryNeedingReprovision:(void *)a3 error:;
- (void)_reprovisionAccessory:(void *)a3 networkCredential:(void *)a4 requestMessage:;
- (void)configure:(id)a3 queue:(id)a4 messageDispatcher:(id)a5;
- (void)dealloc;
- (void)handleFoundAccessoryNeedingReprovisioning:(id)a3 error:(id)a4;
- (void)handleReprovionedAccessory:(id)a3 identifier:(id)a4 error:(id)a5;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDHomeReprovisionHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingReprovisionRequests, 0);
  objc_storeStrong((id *)&self->_disableReprovisionBrowsingTimer, 0);
  objc_destroyWeak((id *)&self->_accessoryBrowser);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (OS_dispatch_queue)messageReceiveQueue
{
  if (self) {
    self = (HMDHomeReprovisionHandler *)self->_workQueue;
  }
  return (OS_dispatch_queue *)self;
}

- (NSUUID)messageTargetUUID
{
  v2 = -[HMDHomeReprovisionHandler home]((id *)&self->super.super.isa);
  v3 = [v2 uuid];

  return (NSUUID *)v3;
}

- (id)home
{
  if (WeakRetained)
  {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 4);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v16 = (HMFTimer *)a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    v4 = v16;
    if (self->_disableReprovisionBrowsingTimer != v16) {
      goto LABEL_11;
    }
    v5 = (void *)MEMORY[0x230FBD990]();
    v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v18 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Disable reprovision browsing timer fired", buf, 0xCu);
    }
    if (v6->_reprovisionBrowsingPending)
    {
      v6->_reprovisionBrowsingPending = 0;
      v6->_reprovisionBrowsingAllowed = 0;
      id WeakRetained = objc_loadWeakRetained((id *)&v6->_accessoryBrowser);
      [WeakRetained startDiscoveringAccessoriesNeedingReprovisioning];

      v10 = (void *)MEMORY[0x230FBD990]([(HMFTimer *)v6->_disableReprovisionBrowsingTimer resume]);
      v11 = v6;
      v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = HMFGetLogIdentifier();
        disableReprovisionBrowsingTimer = v11->_disableReprovisionBrowsingTimer;
        *(_DWORD *)buf = 138543874;
        v18 = v13;
        __int16 v19 = 2048;
        v20 = disableReprovisionBrowsingTimer;
        __int16 v21 = 2048;
        uint64_t v22 = disableReprivsionBrowsingPeriodInMinutes;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Resumed disable reprovision browsing timer %p for %f sec", buf, 0x20u);
      }
    }
    else
    {
      v6->_reprovisionBrowsingAllowed = 1;
      [(HMFTimer *)v6->_disableReprovisionBrowsingTimer suspend];
      v15 = v6->_disableReprovisionBrowsingTimer;
      v6->_disableReprovisionBrowsingTimer = 0;
    }
  }
  else
  {
    dispatch_assert_queue_V2(0);
  }
  v4 = v16;
LABEL_11:
}

- (void)handleReprovionedAccessory:(id)a3 identifier:(id)a4 error:(id)a5
{
  id v36 = a3;
  id v8 = a4;
  id v9 = a5;
  if (self) {
    pendingReprovisionRequests = self->_pendingReprovisionRequests;
  }
  else {
    pendingReprovisionRequests = 0;
  }
  v11 = [(NSMutableDictionary *)pendingReprovisionRequests valueForKey:v8];

  if (v11)
  {
    [v36 setAccessoryReprovisionState:0];
    v12 = -[HMDHomeReprovisionHandler home]((id *)&self->super.super.isa);
    v13 = [v12 homeManager];
    v14 = [v36 uuid];
    [v13 updateGenerationCounterWithReason:@"ReprovisionNotRequired" sourceUUID:v14 shouldNotifyClients:0];

    v15 = [MEMORY[0x263EFF9A0] dictionary];
    v16 = [v36 uuid];
    v17 = [v16 UUIDString];
    [v15 setObject:v17 forKeyedSubscript:@"kAccessoryUUID"];

    if (self) {
      v18 = self->_pendingReprovisionRequests;
    }
    else {
      v18 = 0;
    }
    __int16 v19 = [(NSMutableDictionary *)v18 objectForKey:v8];
    if (self) {
      v20 = self->_pendingReprovisionRequests;
    }
    else {
      v20 = 0;
    }
    [(NSMutableDictionary *)v20 removeObjectForKey:v8];
    if (v9)
    {
      __int16 v21 = [MEMORY[0x263F08910] archivedDataWithRootObject:v9 requiringSecureCoding:1 error:0];
      if (v21) {
        [v15 setObject:v21 forKeyedSubscript:@"kPairedAccessoryErrorDataKey"];
      }
    }
    else
    {
      uint64_t v22 = [v19 networkCredential];
      uint64_t v23 = [v22 wiFiPSK];
      v24 = [v19 networkCredential];
      v25 = [v24 wiFiPSK];
      if (v25) {
        uint64_t v26 = 3;
      }
      else {
        uint64_t v26 = 2;
      }
      [v36 saveWiFiUniquePreSharedKey:v23 credentialType:v26];

      __int16 v21 = [v19 networkCredential];
      v27 = [v21 clientIdentifier];
      v28 = [v19 networkCredential];
      v29 = [v28 networkRouterUUID];
      [v36 saveNetworkClientIdentifier:v27 networkRouterUUID:v29 clearProfileFingerprint:1];
    }
    v30 = (void *)MEMORY[0x263F42568];
    uint64_t v31 = *MEMORY[0x263F0E958];
    v32 = [v19 messageIdentifier];
    v33 = [v30 entitledMessageWithName:v31 identifier:v32 messagePayload:v15];

    v34 = -[HMDHomeReprovisionHandler messageDestination](self);
    [v33 setDestination:v34];

    if (self) {
      msgDispatcher = self->_msgDispatcher;
    }
    else {
      msgDispatcher = 0;
    }
    [(HMFMessageDispatcher *)msgDispatcher sendMessage:v33 completionHandler:0];
  }
}

- (id)messageDestination
{
  id v1 = a1;
  if (a1)
  {
    id v2 = objc_alloc(MEMORY[0x263F42570]);
    v3 = [v1 messageTargetUUID];
    id v1 = (id)[v2 initWithTarget:v3];
  }
  return v1;
}

- (void)handleFoundAccessoryNeedingReprovisioning:(id)a3 error:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (![v6 accessoryReprovisionState])
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      v12 = [v6 name];
      int v16 = 138543618;
      v17 = v11;
      __int16 v18 = 2112;
      __int16 v19 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Accessory %@ reprovision state is updated to Required", (uint8_t *)&v16, 0x16u);
    }
    [v6 setAccessoryReprovisionState:1];
    v13 = -[HMDHomeReprovisionHandler home]((id *)&v9->super.super.isa);
    v14 = [v13 homeManager];
    v15 = [v6 uuid];
    [v14 updateGenerationCounterWithReason:@"ReprovisionRequired" sourceUUID:v15 shouldNotifyClients:0];

    -[HMDHomeReprovisionHandler _reportAccessoryNeedingReprovision:error:]((id *)&v9->super.super.isa, v6, v7);
  }
}

- (void)_reportAccessoryNeedingReprovision:(void *)a3 error:
{
  id v5 = a3;
  if (a1)
  {
    id v6 = (void *)MEMORY[0x263EFF9A0];
    id v16 = v5;
    id v7 = a2;
    id v8 = [v6 dictionary];
    id v9 = [v7 uuid];

    v10 = [v9 UUIDString];
    [v8 setObject:v10 forKeyedSubscript:@"kAccessoryUUID"];

    [v8 setObject:&unk_26E471B18 forKeyedSubscript:*MEMORY[0x263F0E960]];
    if (v16)
    {
      v11 = [MEMORY[0x263F08910] archivedDataWithRootObject:v16 requiringSecureCoding:1 error:0];
      if (v11) {
        [v8 setObject:v11 forKeyedSubscript:@"kPairedAccessoryErrorDataKey"];
      }
    }
    v12 = (void *)MEMORY[0x263F42590];
    uint64_t v13 = *MEMORY[0x263F0E950];
    v14 = -[HMDHomeReprovisionHandler messageDestination](a1);
    v15 = [v12 messageWithName:v13 destination:v14 payload:v8];

    [a1[3] sendMessage:v15 completionHandler:0];
    id v5 = v16;
  }
}

- (void)_handleReprovisionAccessory:(id)a3
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (isiOSDevice())
  {
    if (self)
    {
      self->_reprovisionBrowsingPending = 0;
      self->_reprovisionBrowsingAllowed = 1;
      [(HMFTimer *)self->_disableReprovisionBrowsingTimer suspend];
      objc_storeStrong((id *)&self->_disableReprovisionBrowsingTimer, 0);
    }
    else
    {
      [0 suspend];
    }
    id v5 = [v4 uuidForKey:@"kAccessoryUUID"];
    if (!v5)
    {
      v30 = (void *)MEMORY[0x230FBD990]();
      uint64_t v31 = self;
      v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = HMFGetLogIdentifier();
        v34 = [v4 messagePayload];
        *(_DWORD *)buf = 138543618;
        v84 = v33;
        __int16 v85 = 2112;
        v86 = v34;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Missing target accessory UUID from message payload: %@", buf, 0x16u);
      }
      v35 = [v4 responseHandler];

      if (!v35) {
        goto LABEL_44;
      }
      id v6 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
      id v36 = [v4 responseHandler];
      ((void (**)(void, void *, void))v36)[2](v36, v6, 0);
      goto LABEL_43;
    }
    id v6 = -[HMDHomeReprovisionHandler home]((id *)&self->super.super.isa);
    id v7 = [v6 homeManager];
    id v8 = [v6 accessoryWithUUID:v5];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    v79 = v7;
    if (v10)
    {
      if ([v10 reachableTransports])
      {
        v76 = v6;
        id v78 = v10;
        v43 = (void *)MEMORY[0x230FBD990]();
        v44 = self;
        v45 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          v46 = HMFGetLogIdentifier();
          v47 = [v8 name];
          *(_DWORD *)buf = 138543618;
          v84 = v46;
          __int16 v85 = 2112;
          v86 = v47;
          _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@Reprovision accessory failed since the accessory: %@ is already in the network", buf, 0x16u);
        }
        v48 = (void *)MEMORY[0x230FBD990]();
        v49 = v44;
        v50 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          v51 = HMFGetLogIdentifier();
          v52 = [v8 name];
          *(_DWORD *)buf = 138543618;
          v84 = v51;
          __int16 v85 = 2112;
          v86 = v52;
          _os_log_impl(&dword_22F52A000, v50, OS_LOG_TYPE_INFO, "%{public}@Accessory %@ reprovision state is updated to NotRequired", buf, 0x16u);
        }
        [v8 setAccessoryReprovisionState:0];
        v53 = [v8 uuid];
        [v7 updateGenerationCounterWithReason:@"ReprovisionNotRequired" sourceUUID:v53 shouldNotifyClients:0];

        __int16 v19 = [MEMORY[0x263EFF9A0] dictionary];
        v54 = [v8 uuid];
        v55 = [v54 UUIDString];
        [v19 setObject:v55 forKeyedSubscript:@"kAccessoryUUID"];

        [v19 setObject:&unk_26E471AE8 forKeyedSubscript:*MEMORY[0x263F0E960]];
        v56 = (void *)MEMORY[0x263F42590];
        uint64_t v57 = *MEMORY[0x263F0E950];
        v58 = -[HMDHomeReprovisionHandler messageDestination](v49);
        v25 = [v56 messageWithName:v57 destination:v58 payload:v19];

        if (self) {
          msgDispatcher = v49->_msgDispatcher;
        }
        else {
          msgDispatcher = 0;
        }
        id v10 = v78;
        [(HMFMessageDispatcher *)msgDispatcher sendMessage:v25 completionHandler:0];
        v60 = [v4 responseHandler];

        if (v60)
        {
          v61 = [MEMORY[0x263F087E8] hmErrorWithCode:52 description:@"Accessory already in the network" reason:0 suggestion:0 underlyingError:0];
          v62 = [v4 responseHandler];
          ((void (**)(void, void *, void))v62)[2](v62, v61, 0);
        }
        id v6 = v76;
        goto LABEL_41;
      }
      int v11 = [v10 isPaired];
      v12 = (void *)MEMORY[0x230FBD990]();
      uint64_t v13 = self;
      v14 = HMFGetOSLogHandle();
      v15 = v14;
      if (v11)
      {
        v74 = v6;
        v77 = v10;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          id v16 = HMFGetLogIdentifier();
          v17 = [v8 name];
          *(_DWORD *)buf = 138543618;
          v84 = v16;
          __int16 v85 = 2112;
          v86 = v17;
          _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Accessory %@ reprovision state is updated to InProgress", buf, 0x16u);
        }
        [v8 setAccessoryReprovisionState:2];
        __int16 v18 = [v8 uuid];
        [v79 updateGenerationCounterWithReason:@"ReprovisionInProgress" sourceUUID:v18 shouldNotifyClients:0];

        __int16 v19 = [MEMORY[0x263EFF9A0] dictionary];
        uint64_t v20 = [v8 uuid];
        __int16 v21 = [v20 UUIDString];
        [v19 setObject:v21 forKeyedSubscript:@"kAccessoryUUID"];

        [v19 setObject:&unk_26E471B00 forKeyedSubscript:*MEMORY[0x263F0E960]];
        uint64_t v22 = (void *)MEMORY[0x263F42590];
        uint64_t v23 = *MEMORY[0x263F0E950];
        v24 = -[HMDHomeReprovisionHandler messageDestination](v13);
        v25 = [v22 messageWithName:v23 destination:v24 payload:v19];

        uint64_t v26 = [v4 transport];
        [v25 setTransport:v26];

        if (self) {
          v27 = v13->_msgDispatcher;
        }
        else {
          v27 = 0;
        }
        id v6 = v74;
        id v10 = v77;
        -[HMFMessageDispatcher sendMessage:completionHandler:](v27, "sendMessage:completionHandler:", v25, 0, v74);
        if (([v6 networkRouterSupport] & 8) != 0)
        {
          v68 = [v77 wiFiUniquePreSharedKey];

          if (v68)
          {
            v69 = [HMDAccessoryNetworkCredential alloc];
            v70 = [v77 networkRouterUUID];
            v71 = [v77 networkClientIdentifier];
            v72 = [v77 wiFiUniquePreSharedKey];
            v73 = [(HMDAccessoryNetworkCredential *)v69 initWithNetworkRouterUUID:v70 clientIdentifier:v71 wiFiPSK:v72];

            id v10 = v77;
            id v6 = v75;
            -[HMDHomeReprovisionHandler _reprovisionAccessory:networkCredential:requestMessage:](v13, v77, v73, v4);
          }
          else
          {
            v80[0] = MEMORY[0x263EF8330];
            v80[1] = 3221225472;
            v80[2] = __57__HMDHomeReprovisionHandler__handleReprovisionAccessory___block_invoke;
            v80[3] = &unk_264A202A8;
            v80[4] = v13;
            id v81 = v77;
            id v82 = v4;
            [v6 _createUniquePSKClientConfigurationWithRequestMessage:v82 pairingEvent:0 completion:v80];
          }
        }
        else
        {
          -[HMDHomeReprovisionHandler _reprovisionAccessory:networkCredential:requestMessage:](v13, v77, 0, v4);
        }
        goto LABEL_41;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v63 = HMFGetLogIdentifier();
        [v8 name];
        id v64 = v10;
        v66 = v65 = v6;
        *(_DWORD *)buf = 138543618;
        v84 = v63;
        __int16 v85 = 2112;
        v86 = v66;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Reprovision accessory failed since the accessory: %@ is not paired", buf, 0x16u);

        id v6 = v65;
        id v10 = v64;
      }
      v67 = [v4 responseHandler];

      if (!v67) {
        goto LABEL_42;
      }
      uint64_t v42 = [MEMORY[0x263F087E8] hmErrorWithCode:10 description:@"Accessory not paired" reason:0 suggestion:0 underlyingError:0];
    }
    else
    {
      v37 = (void *)MEMORY[0x230FBD990]();
      v38 = self;
      v39 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v40 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v84 = v40;
        __int16 v85 = 2112;
        v86 = v5;
        _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to find accessory with UUID: %@", buf, 0x16u);
      }
      v41 = [v4 responseHandler];

      if (!v41) {
        goto LABEL_42;
      }
      uint64_t v42 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    }
    __int16 v19 = (void *)v42;
    v25 = [v4 responseHandler];
    ((void (**)(void, void *, void))v25)[2](v25, v19, 0);
LABEL_41:

LABEL_42:
    id v36 = (void (**)(void, void, void))v79;
LABEL_43:

    goto LABEL_44;
  }
  v28 = [v4 responseHandler];

  if (v28)
  {
    id v5 = [v4 responseHandler];
    v29 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    ((void (**)(void, void *, void))v5)[2](v5, v29, 0);

LABEL_44:
  }
}

- (void)_reprovisionAccessory:(void *)a3 networkCredential:(void *)a4 requestMessage:
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v25 = a4;
  if (a1)
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = a1;
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      uint64_t v13 = [v7 identifier];
      *(_DWORD *)buf = 138543618;
      v32 = v12;
      __int16 v33 = 2112;
      v34 = v13;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Storing reprovison request message identifier for accessory with identifier: %@", buf, 0x16u);
    }
    v14 = [HMDHomeReprovisioningPendingInformation alloc];
    v15 = [v25 identifier];
    id v16 = [(HMDHomeReprovisioningPendingInformation *)v14 initWithMessageUUID:v15 networkCredential:v8];

    id v17 = v10[7];
    __int16 v18 = [v7 identifier];
    [v17 setObject:v16 forKey:v18];

    objc_initWeak((id *)buf, v10);
    id WeakRetained = objc_loadWeakRetained(v10 + 5);
    uint64_t v20 = [v7 identifier];
    __int16 v21 = [v8 wiFiPSK];
    uint64_t v22 = [v7 home];
    uint64_t v23 = [v22 homeLocationHandler];
    v24 = [v23 isoCountryCode];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __84__HMDHomeReprovisionHandler__reprovisionAccessory_networkCredential_requestMessage___block_invoke;
    v26[3] = &unk_264A279B0;
    objc_copyWeak(&v30, (id *)buf);
    id v27 = v25;
    id v28 = v7;
    id v29 = v8;
    [WeakRetained reprovisionAccessoryWithIdentifier:v20 wiFiPSK:v21 countryCode:v24 withCompletion:v26];

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);
  }
}

void __57__HMDHomeReprovisionHandler__handleReprovisionAccessory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    id v9 = *(NSObject **)(v8 + 16);
  }
  else {
    id v9 = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__HMDHomeReprovisionHandler__handleReprovisionAccessory___block_invoke_2;
  block[3] = &unk_264A2E908;
  id v13 = v6;
  uint64_t v14 = v8;
  id v15 = *(id *)(a1 + 40);
  id v16 = *(id *)(a1 + 48);
  id v17 = v5;
  id v10 = v5;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __57__HMDHomeReprovisionHandler__handleReprovisionAccessory___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    id v2 = (void *)MEMORY[0x230FBD990]();
    id v3 = *(id *)(a1 + 40);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = HMFGetLogIdentifier();
      uint64_t v6 = *(void *)(a1 + 48);
      uint64_t v7 = *(void *)(a1 + 32);
      int v12 = 138543874;
      id v13 = v5;
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      __int16 v16 = 2112;
      uint64_t v17 = v7;
      _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate WiFi credential for accessory %@ with error: %@", (uint8_t *)&v12, 0x20u);
    }
    [*(id *)(a1 + 56) respondWithError:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 40);
    id v9 = *(void **)(a1 + 48);
    id v11 = *(void **)(a1 + 56);
    id v10 = *(void **)(a1 + 64);
    -[HMDHomeReprovisionHandler _reprovisionAccessory:networkCredential:requestMessage:](v8, v9, v10, v11);
  }
}

void __84__HMDHomeReprovisionHandler__reprovisionAccessory_networkCredential_requestMessage___block_invoke(id *a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v5 = [a1[4] responseHandler];

  if (v5)
  {
    if (v3)
    {
      uint64_t v6 = (void *)MEMORY[0x230FBD990]();
      uint64_t v7 = WeakRetained;
      uint64_t v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = HMFGetLogIdentifier();
        id v10 = [a1[5] identifier];
        int v36 = 138543618;
        v37 = v9;
        __int16 v38 = 2112;
        v39 = v10;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to reprovision accessory with identifier: %@", (uint8_t *)&v36, 0x16u);
      }
      if (v7) {
        id v11 = (void *)v7[7];
      }
      else {
        id v11 = 0;
      }
      id v12 = a1[5];
      id v13 = v11;
      __int16 v14 = [v12 identifier];
      [v13 removeObjectForKey:v14];

      uint64_t v15 = (void *)MEMORY[0x230FBD990]();
      __int16 v16 = v7;
      uint64_t v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        __int16 v19 = [a1[5] name];
        int v36 = 138543618;
        v37 = v18;
        __int16 v38 = 2112;
        v39 = v19;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Accessory %@ reprovision state is updated to NotRequired", (uint8_t *)&v36, 0x16u);
      }
      [a1[5] setAccessoryReprovisionState:0];
      uint64_t v20 = -[HMDHomeReprovisionHandler home]((id *)v16);
      __int16 v21 = [v20 homeManager];
      uint64_t v22 = [a1[5] uuid];
      [v21 updateGenerationCounterWithReason:@"ReprovisionErrored" sourceUUID:v22 shouldNotifyClients:0];

      uint64_t v23 = [a1[6] clientIdentifier];
      if (v23)
      {
        v24 = (void *)v23;
        id v25 = [a1[5] networkClientIdentifier];

        if (!v25)
        {
          uint64_t v26 = [a1[6] clientIdentifier];
          [v20 _removeClientConfigurationWithIdentifier:v26];
        }
      }
      id v27 = [MEMORY[0x263EFF9A0] dictionary];
      id v28 = [a1[5] uuid];
      id v29 = [v28 UUIDString];
      [v27 setObject:v29 forKeyedSubscript:@"kAccessoryUUID"];

      [v27 setObject:&unk_26E471B00 forKeyedSubscript:*MEMORY[0x263F0E960]];
      id v30 = (void *)MEMORY[0x263F42590];
      uint64_t v31 = *MEMORY[0x263F0E950];
      v32 = -[HMDHomeReprovisionHandler messageDestination](v16);
      __int16 v33 = [v30 messageWithName:v31 destination:v32 payload:v27];

      if (v7) {
        v34 = (void *)v16[3];
      }
      else {
        v34 = 0;
      }
      [v34 sendMessage:v33 completionHandler:0];
    }
    uint64_t v35 = [a1[4] responseHandler];
    ((void (**)(void, id, void))v35)[2](v35, v3, 0);
  }
}

- (void)_handleRequestSearchForAccessoriesNeedingReprovisioning:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  uint64_t v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v37 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Received request to start searching for accessories need reprovisioning", buf, 0xCu);
  }
  if (v6 && v6->_reprovisionBrowsingAllowed)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_accessoryBrowser);
    [WeakRetained startDiscoveringAccessoriesNeedingReprovisioning];

    v6->_reprovisionBrowsingPending = 0;
    if (!v6->_disableReprovisionBrowsingTimer)
    {
      v6->_reprovisionBrowsingAllowed = 0;
      id v10 = objc_alloc(MEMORY[0x263F42658]);
      id v11 = (void *)[v10 initWithTimeInterval:1 options:*(double *)&disableReprivsionBrowsingPeriodInMinutes];
      objc_storeStrong((id *)&v6->_disableReprovisionBrowsingTimer, v11);

      [(HMFTimer *)v6->_disableReprovisionBrowsingTimer setDelegate:v6];
      disableReprovisionBrowsingTimer = v6->_disableReprovisionBrowsingTimer;
      id v13 = v6->_workQueue;
      [(HMFTimer *)disableReprovisionBrowsingTimer setDelegateQueue:v13];

      __int16 v14 = (void *)MEMORY[0x230FBD990]([(HMFTimer *)v6->_disableReprovisionBrowsingTimer resume]);
      uint64_t v15 = v6;
      __int16 v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = HMFGetLogIdentifier();
        uint64_t v18 = v15->_disableReprovisionBrowsingTimer;
        *(_DWORD *)buf = 138543874;
        v37 = v17;
        __int16 v38 = 2048;
        v39 = v18;
        __int16 v40 = 2048;
        uint64_t v41 = disableReprivsionBrowsingPeriodInMinutes;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Started disable reprovision browsing timer %p for %f sec", buf, 0x20u);
      }
    }
  }
  else
  {
    __int16 v19 = (void *)MEMORY[0x230FBD990]();
    uint64_t v20 = v6;
    __int16 v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v37 = v22;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Request to start searching for accessories need reprovisioning is deferred", buf, 0xCu);
    }
    if (v6) {
      v20->_reprovisionBrowsingPending = 1;
    }
  }
  [v4 respondWithSuccess];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v23 = -[HMDHomeReprovisionHandler home]((id *)&v6->super.super.isa);
  v24 = objc_msgSend(v23, "accessories", 0);
  id v25 = (void *)[v24 copy];

  uint64_t v26 = [v25 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v32 != v28) {
          objc_enumerationMutation(v25);
        }
        id v30 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if ([v30 accessoryReprovisionState] == 1) {
          -[HMDHomeReprovisionHandler _reportAccessoryNeedingReprovision:error:]((id *)&v6->super.super.isa, v30, 0);
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v27);
  }
}

- (id)logIdentifier
{
  id v2 = NSString;
  id v3 = -[HMDHomeReprovisionHandler home]((id *)&self->super.super.isa);
  id v4 = [v3 name];
  id v5 = [v2 stringWithFormat:@"%@", v4];

  return v5;
}

- (void)configure:(id)a3 queue:(id)a4 messageDispatcher:(id)a5
{
  v31[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v29 = a4;
  id v9 = a5;
  if (self)
  {
    objc_storeWeak((id *)&self->_home, v8);
    objc_storeStrong((id *)&self->_workQueue, a4);
    objc_storeStrong((id *)&self->_msgDispatcher, a5);
    id v10 = [v8 accessoryBrowser];
    objc_storeWeak((id *)&self->_accessoryBrowser, v10);
  }
  else
  {
    id v10 = [v8 accessoryBrowser];
  }

  id v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    __int16 v14 = HMFGetLogIdentifier();
    uint64_t v15 = -[HMDHomeReprovisionHandler home]((id *)&v12->super.super.isa);
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v15;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Configured reprovision handler for home %@", buf, 0x16u);
  }
  if (self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v12->_home);
    uint64_t v17 = +[HMDUserMessagePolicy userMessagePolicyWithHome:WeakRetained userPrivilege:3 remoteAccessRequired:0];

    uint64_t v18 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
    msgDispatcher = v12->_msgDispatcher;
    uint64_t v20 = *MEMORY[0x263F0EAF0];
    *(void *)buf = v18;
    *(void *)&buf[8] = v17;
    __int16 v21 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v22 = msgDispatcher;
    uint64_t v23 = [v21 arrayWithObjects:buf count:2];
    [(HMFMessageDispatcher *)v22 registerForMessage:v20 receiver:v12 policies:v23 selector:sel__handleRequestSearchForAccessoriesNeedingReprovisioning_];

    v24 = v12->_msgDispatcher;
    uint64_t v25 = *MEMORY[0x263F0EAE8];
    v31[0] = v18;
    v31[1] = v17;
    uint64_t v26 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v27 = v24;
    uint64_t v28 = [v26 arrayWithObjects:v31 count:2];
    [(HMFMessageDispatcher *)v27 registerForMessage:v25 receiver:v12 policies:v28 selector:sel__handleReprovisionAccessory_];
  }
}

- (void)dealloc
{
  id v2 = self;
  if (self) {
    self = (HMDHomeReprovisionHandler *)self->_msgDispatcher;
  }
  [(HMDHomeReprovisionHandler *)self deregisterReceiver:v2];
  id v3 = -[HMDHomeReprovisionHandler home]((id *)&v2->super.super.isa);
  id v4 = [v3 administratorHandler];
  [v4 deregisterReceiver:v2];

  v5.receiver = v2;
  v5.super_class = (Class)HMDHomeReprovisionHandler;
  [(HMDHomeReprovisionHandler *)&v5 dealloc];
}

- (HMDHomeReprovisionHandler)init
{
  v7.receiver = self;
  v7.super_class = (Class)HMDHomeReprovisionHandler;
  id v2 = [(HMDHomeReprovisionHandler *)&v7 init];
  id v3 = v2;
  if (v2)
  {
    v2->_reprovisionBrowsingAllowed = 1;
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    pendingReprovisionRequests = v3->_pendingReprovisionRequests;
    v3->_pendingReprovisionRequests = (NSMutableDictionary *)v4;
  }
  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_125725 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_125725, &__block_literal_global_125726);
  }
  id v2 = (void *)logCategory__hmf_once_v2_125727;
  return v2;
}

void __40__HMDHomeReprovisionHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  id v1 = (void *)logCategory__hmf_once_v2_125727;
  logCategory__hmf_once_v2_125727 = v0;
}

@end