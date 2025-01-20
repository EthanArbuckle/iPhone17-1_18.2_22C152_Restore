@interface HMDIDSMessageTransport
+ (_HMFRate)sendMessageRate;
+ (id)logCategory;
+ (id)queueOneIdentifierWithMessageName:(id)a3 target:(id)a4 collapseID:(id)a5 timeToLive:(double)a6 now:(id)a7;
+ (int64_t)priorityForMessage:(id)a3;
+ (unint64_t)restriction;
+ (unint64_t)sendMessageLimit;
- (BOOL)_shouldAddLocalHandleToDevice:(id)a3;
- (BOOL)_shouldProcessLegacyIDSMessageFromID:(id)a3 context:(id)a4 message:(id *)a5 service:(id)a6;
- (BOOL)canSendMessage:(id)a3;
- (BOOL)isLegacyTransport;
- (BOOL)isSecure;
- (BOOL)isValidMessage:(id)a3;
- (BOOL)shouldAcceptLegacyIDSMessage:(id)a3;
- (HMDAppleAccountManager)appleAccountManager;
- (HMDIDSMessageTransport)initWithAccountRegistry:(id)a3;
- (HMDIDSMessageTransport)initWithAccountRegistry:(id)a3 service:(id)a4 appleAccountManager:(id)a5 remoteAccountManager:(id)a6;
- (HMDIDSService)service;
- (HMDRemoteAccountManager)remoteAccountManager;
- (HMFOperationBudget)sendMessageBudget;
- (NSMutableArray)messageContexts;
- (NSMutableDictionary)destinationAddress;
- (NSMutableDictionary)pendingResponseTimers;
- (NSMutableDictionary)pendingResponses;
- (NSMutableDictionary)receivedResponses;
- (NSMutableDictionary)requestedCapabilities;
- (NSMutableOrderedSet)messageDedupBuffer;
- (OS_dispatch_queue)workQueue;
- (id)_identifierFromSerializedMessage:(void *)a1;
- (id)deviceForSenderContext:(id)a3;
- (id)initHMMMEnergyWithAccountRegistry:(id)a3;
- (id)initHMMMWithAccountRegistry:(id)a3;
- (id)initLegacyTransportWithAccountRegistry:(id)a3;
- (id)initLegacyTransportWithAccountRegistry:(id)a3 service:(id)a4 appleAccountManager:(id)a5 remoteAccountManager:(id)a6;
- (id)logIdentifier;
- (id)sendMessage:(id)a3 fromHandle:(id)a4 destination:(id)a5 priority:(int64_t)a6 timeout:(double)a7 options:(unint64_t)a8 queueOneID:(id)a9 error:(id *)a10;
- (id)start;
- (int)transportType;
- (int64_t)qualityOfService;
- (void)_pendingResponseTimeoutFor:(id)a3;
- (void)_removePendingResponseTimerForTransaction:(id)a3;
- (void)_removePendingResponseTransaction:(id)a3;
- (void)_restartPendingResponseTimerFor:(id)a3 withReducedFactor:(unint64_t)a4;
- (void)_startPendingResponseTimer:(id)a3 responseTimeout:(double)a4 identifier:(id)a5;
- (void)legacyHandleIncomingRemoteMessage:(id)a3 sourceDevice:(id)a4 senderDeviceHandle:(id)a5 isSecure:(BOOL)a6 incomingMessage:(id)a7 fromID:(id)a8 context:(id)a9;
- (void)sendMessage:(id)a3 completionHandler:(id)a4;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
@end

@implementation HMDIDSMessageTransport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageDedupBuffer, 0);
  objc_storeStrong((id *)&self->_pendingResponseTimers, 0);
  objc_storeStrong((id *)&self->_destinationAddress, 0);
  objc_storeStrong((id *)&self->_requestedCapabilities, 0);
  objc_storeStrong((id *)&self->_receivedResponses, 0);
  objc_storeStrong((id *)&self->_pendingResponses, 0);
  objc_storeStrong((id *)&self->_sendMessageBudget, 0);
  objc_storeStrong((id *)&self->_messageContexts, 0);
  objc_storeStrong((id *)&self->_remoteAccountManager, 0);
  objc_storeStrong((id *)&self->_appleAccountManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

- (BOOL)isLegacyTransport
{
  return self->_legacyTransport;
}

- (NSMutableOrderedSet)messageDedupBuffer
{
  return self->_messageDedupBuffer;
}

- (NSMutableDictionary)pendingResponseTimers
{
  return self->_pendingResponseTimers;
}

- (NSMutableDictionary)destinationAddress
{
  return self->_destinationAddress;
}

- (NSMutableDictionary)requestedCapabilities
{
  return self->_requestedCapabilities;
}

- (NSMutableDictionary)receivedResponses
{
  return self->_receivedResponses;
}

- (NSMutableDictionary)pendingResponses
{
  return self->_pendingResponses;
}

- (HMFOperationBudget)sendMessageBudget
{
  return (HMFOperationBudget *)objc_getProperty(self, a2, 120, 1);
}

- (NSMutableArray)messageContexts
{
  return (NSMutableArray *)objc_getProperty(self, a2, 112, 1);
}

- (HMDRemoteAccountManager)remoteAccountManager
{
  return self->_remoteAccountManager;
}

- (HMDAppleAccountManager)appleAccountManager
{
  return self->_appleAccountManager;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMDIDSService)service
{
  return self->_service;
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if (v16)
  {
    v19 = [(HMDIDSMessageTransport *)self messageContexts];
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __86__HMDIDSMessageTransport_service_account_identifier_didSendWithSuccess_error_context___block_invoke;
    v46[3] = &unk_264A1A870;
    id v20 = v16;
    id v47 = v20;
    v21 = objc_msgSend(v19, "hmf_objectPassingTest:", v46);

    if (v21)
    {
      id v42 = v14;
      if (v17)
      {
        v22 = (void *)MEMORY[0x263F087E8];
        v23 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:3203 underlyingError:v17];
        v43 = [v22 hmErrorWithCode:54 description:@"Communication failure." reason:0 suggestion:0 underlyingError:v23];
      }
      else
      {
        v43 = 0;
      }
      v24 = [v21 userInfo];
      v25 = [v24 objectForKeyedSubscript:@"HMDIDSMessageTransportCompletionHandlerKey"];

      if (v25) {
        uint64_t v26 = ((uint64_t (**)(void, void *))v25)[2](v25, v43);
      }
      if (!a6)
      {
        context = (void *)MEMORY[0x230FBD990](v26);
        v27 = self;
        v28 = HMFGetOSLogHandle();
        v41 = v27;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138544131;
          v49 = v29;
          __int16 v50 = 2114;
          id v51 = v20;
          __int16 v52 = 2113;
          id v53 = v15;
          __int16 v54 = 2112;
          id v55 = v17;
          _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to send message with IDS GUID %{public}@ from account: %{private}@ with error: %@", buf, 0x2Au);

          v27 = v41;
        }

        v30 = [v21 destination];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v31 = v30;
        }
        else {
          v31 = 0;
        }
        id v32 = v31;

        if (v17 && v32)
        {
          v33 = [v32 allRemoteDestinationStrings];
          v44[0] = MEMORY[0x263EF8330];
          v44[1] = 3221225472;
          v44[2] = __86__HMDIDSMessageTransport_service_account_identifier_didSendWithSuccess_error_context___block_invoke_114;
          v44[3] = &unk_264A2B8C0;
          v44[4] = v27;
          id v45 = v17;
          objc_msgSend(v33, "na_each:", v44);
        }
        contexta = v32;
        v34 = [v21 userInfo];
        v35 = [v34 objectForKeyedSubscript:@"HMDIDSMessageTransportTransactionIdentifierKey"];

        if (v35)
        {
          v36 = [(HMDIDSMessageTransport *)v27 pendingResponses];
          v37 = [v36 objectForKeyedSubscript:v35];

          if (v37) {
            ((void (**)(void, void *, void))v37)[2](v37, v43, 0);
          }
          [(HMDIDSMessageTransport *)v41 _removePendingResponseTransaction:v35];
        }
      }
      v38 = [(HMDIDSMessageTransport *)self messageContexts];
      [v38 removeObject:v21];

      id v14 = v42;
    }
  }
}

uint64_t __86__HMDIDSMessageTransport_service_account_identifier_didSendWithSuccess_error_context___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  uint64_t v4 = objc_msgSend(v3, "hmf_isEqualToUUIDString:", *(void *)(a1 + 32));

  return v4;
}

void __86__HMDIDSMessageTransport_service_account_identifier_didSendWithSuccess_error_context___block_invoke_114(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 remoteAccountManager];
  objc_msgSend(v5, "__handleSendMessageFailureWithError:destination:", *(void *)(a1 + 40), v4);
}

- (void)legacyHandleIncomingRemoteMessage:(id)a3 sourceDevice:(id)a4 senderDeviceHandle:(id)a5 isSecure:(BOOL)a6 incomingMessage:(id)a7 fromID:(id)a8 context:(id)a9
{
  uint64_t v101 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v82 = a4;
  id v78 = a5;
  id v81 = a7;
  id v77 = a8;
  id v79 = a9;
  id v16 = [v15 name];
  v80 = [v15 destination];
  id v17 = [v15 transactionIdentifier];
  objc_initWeak(&location, self);
  if (![v15 type])
  {
    v36 = aBlock;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __132__HMDIDSMessageTransport_legacyHandleIncomingRemoteMessage_sourceDevice_senderDeviceHandle_isSecure_incomingMessage_fromID_context___block_invoke;
    aBlock[3] = &unk_264A1A848;
    v37 = &v92;
    objc_copyWeak(&v92, &location);
    aBlock[4] = v16;
    id v87 = v80;
    BOOL v93 = a6;
    id v88 = v17;
    id v89 = v79;
    id v90 = v82;
    id v91 = v78;
    v24 = (void (**)(void, void, void))_Block_copy(aBlock);

LABEL_14:
    objc_destroyWeak(v37);
    [v15 setInternalResponseHandler:v24];
    v27 = [(HMFMessageTransport *)self delegate];
    [v27 messageTransport:self didReceiveMessage:v15];
LABEL_45:

    goto LABEL_46;
  }
  if ([v15 type] != 1)
  {
    v36 = v83;
    v83[0] = MEMORY[0x263EF8330];
    v83[1] = 3221225472;
    v83[2] = __132__HMDIDSMessageTransport_legacyHandleIncomingRemoteMessage_sourceDevice_senderDeviceHandle_isSecure_incomingMessage_fromID_context___block_invoke_109;
    v83[3] = &unk_264A2D420;
    v37 = &v84;
    objc_copyWeak(&v84, &location);
    v83[4] = v16;
    v24 = (void (**)(void, void, void))_Block_copy(v83);
    goto LABEL_14;
  }
  id v18 = (void *)MEMORY[0x230FBD990]();
  v19 = self;
  HMFGetOSLogHandle();
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    v22 = [v17 UUIDString];
    *(_DWORD *)buf = 138543618;
    uint64_t v96 = (uint64_t)v21;
    __int16 v97 = 2114;
    uint64_t v98 = (uint64_t)v22;
    _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Received response to IDS message with transaction ID: %{public}@", buf, 0x16u);
  }
  v23 = [(HMDIDSMessageTransport *)v19 pendingResponses];
  v24 = [v23 objectForKeyedSubscript:v17];

  if (v24)
  {
    v25 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v26 = objc_msgSend(v81, "hmf_dictionaryForKey:", @"kIDSMessagePayloadKey");
    v27 = [v25 dictionaryWithDictionary:v26];

    [v27 setObject:v77 forKeyedSubscript:@"kIDSMessageSourceIDKey"];
    v28 = objc_msgSend(v81, "hmf_dataForKey:", @"kIDSMessageResponseErrorDataKey");
    if (v28)
    {
      v29 = (void *)MEMORY[0x263F08928];
      v30 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
      id v85 = 0;
      uint64_t v31 = [v29 _strictlyUnarchivedObjectOfClasses:v30 fromData:v28 error:&v85];
      id v32 = v85;

      if (!v31)
      {
        context = (void *)MEMORY[0x230FBD990]();
        v33 = v19;
        HMFGetOSLogHandle();
        v34 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          uint64_t v35 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v96 = v35;
          __int16 v97 = 2112;
          uint64_t v98 = (uint64_t)v32;
          v73 = (void *)v35;
          _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize error with error: %@", buf, 0x16u);
        }
        uint64_t v31 = [MEMORY[0x263F087E8] hmErrorWithCode:52 description:@"Generic error." reason:@"Failed to deserialize remote error." suggestion:0 underlyingError:v32];
      }
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v31, @"kIDSMessageResponseErrorDataKey", v73);

      v74 = (void *)v31;
    }
    else
    {
      v74 = 0;
    }

    id v42 = [(HMDIDSMessageTransport *)v19 requestedCapabilities];
    v43 = [v42 objectForKeyedSubscript:v17];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v44 = v43;
    }
    else {
      v44 = 0;
    }
    id contexta = v44;

    if ([contexta count])
    {
      id v45 = [(HMDIDSMessageTransport *)v19 destinationAddress];
      v46 = [v45 objectForKeyedSubscript:v17];
      int v47 = [v46 isEqualToString:v77];

      if (!v47)
      {
        __int16 v54 = [(HMDIDSMessageTransport *)v19 receivedResponses];
        id v55 = [v54 objectForKeyedSubscript:v17];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v56 = v55;
        }
        else {
          uint64_t v56 = 0;
        }
        id v57 = v56;

        if (!v57)
        {
          id v55 = objc_alloc_init(MEMORY[0x263EFF980]);
          v58 = [(HMDIDSMessageTransport *)v19 receivedResponses];
          [v58 setObject:v55 forKeyedSubscript:v17];
        }
        objc_msgSend(v55, "addObject:", v27, v74);
        uint64_t v59 = [v55 count];
        if ([(HMDRemoteMessageTransport *)v19 doesResponse:v27 matchAllCapabilities:contexta])
        {
          v60 = (void *)MEMORY[0x230FBD990]();
          v61 = v19;
          HMFGetOSLogHandle();
          v62 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            v63 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            uint64_t v96 = (uint64_t)v63;
            _os_log_impl(&dword_22F52A000, v62, OS_LOG_TYPE_INFO, "%{public}@Response Matched all capabilities", buf, 0xCu);
          }
          [(HMDIDSMessageTransport *)v61 _removePendingResponseTimerForTransaction:v17];
          [(HMDIDSMessageTransport *)v61 _pendingResponseTimeoutFor:v17];
        }
        else
        {
          v64 = (void *)MEMORY[0x230FBD990]([(HMDIDSMessageTransport *)v19 _restartPendingResponseTimerFor:v17 withReducedFactor:v59 + 1]);
          v65 = v19;
          HMFGetOSLogHandle();
          v66 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
          {
            v67 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            uint64_t v96 = (uint64_t)v67;
            __int16 v97 = 2112;
            uint64_t v98 = (uint64_t)v27;
            _os_log_impl(&dword_22F52A000, v66, OS_LOG_TYPE_INFO, "%{public}@Not Calling response handler with response %@", buf, 0x16u);
          }
          v68 = (void *)MEMORY[0x230FBD990]();
          v69 = v65;
          HMFGetOSLogHandle();
          v70 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            id v71 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v72 = [v55 count];
            *(_DWORD *)buf = 138543618;
            uint64_t v96 = (uint64_t)v71;
            __int16 v97 = 2048;
            uint64_t v98 = v72;
            _os_log_impl(&dword_22F52A000, v70, OS_LOG_TYPE_INFO, "%{public}@Currently received responses = %lu", buf, 0x16u);
          }
        }

        goto LABEL_44;
      }
      v48 = (void *)MEMORY[0x230FBD990]();
      v49 = v19;
      HMFGetOSLogHandle();
      __int16 v50 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        id v51 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v96 = (uint64_t)v51;
        __int16 v97 = 2160;
        uint64_t v98 = 1752392040;
        __int16 v99 = 2112;
        id v100 = v77;
        _os_log_impl(&dword_22F52A000, v50, OS_LOG_TYPE_INFO, "%{public}@Received response to directed message - selecting response from %{mask.hash}@", buf, 0x20u);
      }
    }
    else
    {
      v48 = (void *)MEMORY[0x230FBD990]();
      __int16 v52 = v19;
      HMFGetOSLogHandle();
      __int16 v50 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        id v53 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v96 = (uint64_t)v53;
        _os_log_impl(&dword_22F52A000, v50, OS_LOG_TYPE_INFO, "%{public}@No Capabilities were requested - selecting the first response", buf, 0xCu);
      }
    }

    ((void (**)(void, void *, void *))v24)[2](v24, v74, v27);
    [(HMDIDSMessageTransport *)v19 _removePendingResponseTransaction:v17];
LABEL_44:

    goto LABEL_45;
  }
  v38 = (void *)MEMORY[0x230FBD990]();
  v39 = v19;
  HMFGetOSLogHandle();
  v40 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    v41 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v96 = (uint64_t)v41;
    __int16 v97 = 2112;
    uint64_t v98 = (uint64_t)v15;
    _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_INFO, "%{public}@No response handler, dropping message: %@", buf, 0x16u);
  }
  [(HMDRemoteMessageTransport *)v39 postDidReceiveRemoteMessageWithNoListenerFromDevice:v82];
  v24 = 0;
LABEL_46:

  objc_destroyWeak(&location);
}

void __132__HMDIDSMessageTransport_legacyHandleIncomingRemoteMessage_sourceDevice_senderDeviceHandle_isSecure_incomingMessage_fromID_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = [WeakRetained workQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __132__HMDIDSMessageTransport_legacyHandleIncomingRemoteMessage_sourceDevice_senderDeviceHandle_isSecure_incomingMessage_fromID_context___block_invoke_2;
    v10[3] = &unk_264A1A820;
    id v11 = *(id *)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    id v13 = v6;
    char v20 = *(unsigned char *)(a1 + 88);
    id v14 = *(id *)(a1 + 48);
    id v15 = v5;
    id v16 = *(id *)(a1 + 56);
    id v17 = v8;
    id v18 = *(id *)(a1 + 64);
    id v19 = *(id *)(a1 + 72);
    dispatch_async(v9, v10);
  }
}

void __132__HMDIDSMessageTransport_legacyHandleIncomingRemoteMessage_sourceDevice_senderDeviceHandle_isSecure_incomingMessage_fromID_context___block_invoke_109(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = WeakRetained;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = 138543874;
    id v14 = v11;
    __int16 v15 = 2114;
    uint64_t v16 = v12;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Command %{public}@ completed with error: %@", (uint8_t *)&v13, 0x20u);
  }
}

void __132__HMDIDSMessageTransport_legacyHandleIncomingRemoteMessage_sourceDevice_senderDeviceHandle_isSecure_incomingMessage_fromID_context___block_invoke_2(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  v2 = [[HMDRemoteMessage alloc] initWithName:*(void *)(a1 + 32) destination:*(void *)(a1 + 40) payload:*(void *)(a1 + 48) type:1 timeout:*(unsigned __int8 *)(a1 + 104) secure:0.0];
  [(HMDRemoteMessage *)v2 setTransactionIdentifier:*(void *)(a1 + 56)];
  id v42 = 0;
  v3 = +[HMDRemoteMessageSerialization dictionaryForMessage:v2 error:&v42];
  id v4 = v42;
  id v5 = (void *)[v3 mutableCopy];

  uint64_t v6 = *(void *)(a1 + 64);
  if (v6)
  {
    v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];
    [v5 setObject:v7 forKeyedSubscript:@"kIDSMessageResponseErrorDataKey"];
  }
  if ([*(id *)(a1 + 72) fromServerStorage])
  {
    uint64_t v8 = 0;
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 80);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v13 = *(void **)(a1 + 32);
      id v14 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      v44 = v12;
      __int16 v45 = 2114;
      v46 = v13;
      __int16 v47 = 2114;
      id v48 = v14;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Responding to non-server storage message, %{public}@ (%{public}@), as direct message", buf, 0x20u);
    }
    uint64_t v8 = 1;
  }
  __int16 v15 = [*(id *)(a1 + 72) toID];
  if ([v15 length])
  {
    uint64_t v16 = [*(id *)(a1 + 88) account];
    char v17 = [v16 isCurrentAccount];

    if (v17)
    {
      id v18 = 0;
      goto LABEL_14;
    }
    __int16 v15 = [*(id *)(a1 + 72) toID];
    id v18 = +[HMDAccountHandle accountHandleForDestination:v15];
  }
  else
  {
    id v18 = 0;
  }

LABEL_14:
  uint64_t v19 = [HMDRemoteDeviceMessageDestination alloc];
  char v20 = [*(id *)(a1 + 40) target];
  id v21 = [(HMDRemoteDeviceMessageDestination *)v19 initWithTarget:v20 device:*(void *)(a1 + 88)];

  [(HMDRemoteDeviceMessageDestination *)v21 setPreferredHandle:*(void *)(a1 + 96)];
  v22 = *(void **)(a1 + 80);
  id v41 = 0;
  v39 = v5;
  v23 = [v22 sendMessage:v5 fromHandle:v18 destination:v21 priority:300 timeout:v8 options:0 queueOneID:0.0 error:&v41];
  id v40 = v41;
  v24 = (void *)MEMORY[0x230FBD990]();
  id v25 = *(id *)(a1 + 80);
  uint64_t v26 = HMFGetOSLogHandle();
  v27 = v26;
  if (v23)
  {
    v28 = v2;
    id v29 = v4;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v44 = v30;
      __int16 v45 = 2114;
      v46 = v23;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@IDS message response ack'd with identifier %{public}@", buf, 0x16u);
    }
    uint64_t v31 = [HMDIDSMessageContext alloc];
    id v32 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v23];
    v33 = [(HMDIDSMessageContext *)v31 initWithIdentifier:v32 destination:v21 userInfo:0];

    v34 = [*(id *)(a1 + 80) messageContexts];
    [v34 addObject:v33];

    id v4 = v29;
    v2 = v28;
  }
  else
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v35 = HMFGetLogIdentifier();
      [(HMFObject *)v2 shortDescription];
      v36 = v2;
      v38 = id v37 = v4;
      *(_DWORD *)buf = 138543874;
      v44 = v35;
      __int16 v45 = 2112;
      v46 = v38;
      __int16 v47 = 2112;
      id v48 = v40;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@IDS message response, %@, failed with error: %@", buf, 0x20u);

      id v4 = v37;
      v2 = v36;
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v156 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [v16 originalGUID];
  if (!v17)
  {
LABEL_12:
    id v143 = v12;
    if (self && ![(HMDIDSMessageTransport *)self isLegacyTransport])
    {
      v36 = (void *)MEMORY[0x230FBD990]();
      id v37 = self;
      v38 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_19;
      }
      v39 = HMFGetLogIdentifier();
      [v14 shortDescription];
      id v44 = v16;
      v46 = id v45 = v13;
      *(_DWORD *)buf = 138544130;
      v147 = v39;
      __int16 v148 = 2112;
      uint64_t v149 = (uint64_t)v46;
      __int16 v150 = 2160;
      uint64_t v151 = 1752392040;
      __int16 v152 = 2112;
      id v153 = v15;
      _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_DEBUG, "%{public}@Received incoming IDS message: %@, from: %{mask.hash}@", buf, 0x2Au);

      id v13 = v45;
      id v16 = v44;
    }
    else
    {
      v36 = (void *)MEMORY[0x230FBD990]();
      id v37 = self;
      v38 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v38, OS_LOG_TYPE_INFO)) {
        goto LABEL_19;
      }
      v39 = HMFGetLogIdentifier();
      [v14 shortDescription];
      id v40 = v15;
      id v41 = v16;
      v43 = id v42 = v13;
      *(_DWORD *)buf = 138544130;
      v147 = v39;
      __int16 v148 = 2112;
      uint64_t v149 = (uint64_t)v43;
      __int16 v150 = 2160;
      uint64_t v151 = 1752392040;
      __int16 v152 = 2112;
      id v153 = v40;
      _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, "%{public}@Received incoming IDS message: %@, from: %{mask.hash}@", buf, 0x2Au);

      id v13 = v42;
      id v16 = v41;
      id v15 = v40;
    }

LABEL_19:
    uint64_t v47 = [v14 objectForKeyedSubscript:@"kIDSMessageNameKey"];
    id v48 = [MEMORY[0x263F425F8] sharedPowerLogger];
    v141 = (void *)v47;
    [v48 reportIncomingIDSPush:v47 fromToken:v15];

    if (!v15)
    {
      v117 = (void *)MEMORY[0x230FBD990]();
      v118 = self;
      v119 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v119, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        id v120 = v16;
        v122 = id v121 = v13;
        *(_DWORD *)buf = 138543362;
        v147 = v122;
        _os_log_impl(&dword_22F52A000, v119, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Received incoming message with nil fromID", buf, 0xCu);

        id v13 = v121;
        id v16 = v120;
        id v15 = 0;
      }

      v123 = [[HMDAssertionLogEvent alloc] initWithReason:@"Received incoming message with nil fromID"];
      v124 = +[HMDMetricsManager sharedLogEventSubmitter];
      [v124 submitLogEvent:v123];

      v125 = (void *)MEMORY[0x230FBD990]();
      v126 = v118;
      v127 = HMFGetOSLogHandle();
      id v12 = v143;
      if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v128 = id v137 = v13;
        v129 = [v16 originalGUID];
        *(_DWORD *)buf = 138543618;
        v147 = v128;
        __int16 v148 = 2114;
        uint64_t v149 = (uint64_t)v129;
        _os_log_impl(&dword_22F52A000, v127, OS_LOG_TYPE_ERROR, "%{public}@Received incoming message, %{public}@, with nil fromID", buf, 0x16u);

        id v12 = v143;
        id v13 = v137;
      }

      goto LABEL_65;
    }
    uint64_t v49 = +[HMDDeviceHandle deviceHandleForDestination:v15];
    uint64_t v50 = +[HMDAccountHandle accountHandleForDestination:v15];
    uint64_t v51 = +[HMDAccountIdentifier accountIdentifierForMessageContext:v16];
    id v145 = v14;
    BOOL v52 = [(HMDIDSMessageTransport *)self _shouldProcessLegacyIDSMessageFromID:v15 context:v16 message:&v145 service:v143];
    id v142 = v145;

    v140 = (void *)v51;
    if (!v52)
    {
      v58 = (void *)v50;
      uint64_t v59 = (void *)v49;
      v60 = (void *)MEMORY[0x230FBD990]();
      v61 = self;
      v62 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v64 = id v63 = v13;
        v65 = [v16 senderCorrelationIdentifier];
        *(_DWORD *)buf = 138543874;
        v147 = v64;
        __int16 v148 = 2114;
        uint64_t v149 = (uint64_t)v141;
        __int16 v150 = 2112;
        uint64_t v151 = (uint64_t)v65;
        _os_log_impl(&dword_22F52A000, v62, OS_LOG_TYPE_ERROR, "%{public}@Dropping incoming message %{public}@ from unknown mergeID %@", buf, 0x20u);

        id v13 = v63;
      }

      goto LABEL_64;
    }
    if (self) {
      uint64_t v53 = [(HMDIDSMessageTransport *)self isLegacyTransport] ^ 1;
    }
    else {
      uint64_t v53 = 0;
    }
    id v144 = 0;
    __int16 v54 = +[HMDRemoteMessageSerialization remoteMessageWithDictionary:v142 isHH2Payload:v53 error:&v144];
    id v138 = v144;
    v139 = (void *)v49;
    if (!v54)
    {
      v58 = (void *)v50;
      v66 = (void *)MEMORY[0x230FBD990]();
      v67 = self;
      v68 = HMFGetOSLogHandle();
      v69 = v138;
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v71 = v70 = v13;
        *(_DWORD *)buf = 138544386;
        v147 = v71;
        __int16 v148 = 2112;
        uint64_t v149 = (uint64_t)v142;
        __int16 v150 = 2160;
        uint64_t v151 = 1752392040;
        __int16 v152 = 2112;
        id v153 = v15;
        __int16 v154 = 2112;
        id v155 = v138;
        _os_log_impl(&dword_22F52A000, v68, OS_LOG_TYPE_ERROR, "%{public}@Dropping invalid IDS message payload, %@, from: %{mask.hash}@, error: %@", buf, 0x34u);

        id v13 = v70;
      }

      goto LABEL_63;
    }
    if (self && ![(HMDIDSMessageTransport *)self isLegacyTransport]
      || [(HMDIDSMessageTransport *)self shouldAcceptLegacyIDSMessage:v54])
    {
      uint64_t v55 = [(HMDIDSMessageTransport *)self isSecure];
      if (v55) {
        uint64_t v55 = [v54 setSecure:1];
      }
      if (v49)
      {
        id v136 = v13;
        if ([v54 isSecure]
          && ([v54 sourceVersion],
              uint64_t v56 = objc_claimAutoreleasedReturnValue(),
              v56,
              v56))
        {
          uint64_t v57 = [v54 sourceVersion];
        }
        else
        {
          uint64_t v57 = 0;
        }
        v132 = (void *)v57;
        uint64_t v72 = [[HMDRemoteMessageSenderContext alloc] initWithDeviceHandle:v49 accountHandle:v50 accountIdentifier:v51 deviceVersion:v57 pairingIdentityIdentifier:0];
        id v73 = objc_alloc(MEMORY[0x263F08C38]);
        v74 = objc_msgSend(v142, "hmf_stringForKey:", @"idsId");
        v75 = (void *)[v73 initWithUUIDString:v74];

        if (v75)
        {
          v76 = +[HMDDeviceHandle deviceHandleForDeviceIdentifier:v75];
          if (v76) {
            [(HMDRemoteMessageSenderContext *)v72 setLocalDeviceHandle:v76];
          }
        }
        v135 = v72;
        uint64_t v77 = [(HMDIDSMessageTransport *)self deviceForSenderContext:v72];
        if (v77)
        {
          uint64_t v78 = v77;

          id v79 = (void *)MEMORY[0x263EFF9A0];
          v80 = [v54 messagePayload];
          id v81 = [v79 dictionaryWithDictionary:v80];

          [v81 setObject:v15 forKeyedSubscript:@"kIDSMessageSourceIDKey"];
          v130 = v81;
          [v54 setMessagePayload:v81];
          objc_msgSend(v54, "setRestriction:", objc_msgSend((id)objc_opt_class(), "restriction"));
          unsigned int v133 = [v54 isSecure];
          id v82 = [HMDRemoteDeviceMessageDestination alloc];
          v83 = [v54 destination];
          id v84 = [v83 target];
          v131 = (void *)v78;
          uint64_t v85 = [(HMDRemoteDeviceMessageDestination *)v82 initWithTarget:v84 device:v78];

          v86 = (void *)v85;
          [v54 setDestination:v85];
          if ((v133 & 1) != 0
            || !+[HMDSecureRemoteSession isSecureRemoteSessionMessage:v54])
          {
            id v87 = +[HMDMetricsManager sharedLogEventSubmitter];
            id v88 = +[HMDRemoteMessageLogEvent receivedRemoteMessage:v54 transportType:[(HMDIDSMessageTransport *)self transportType]];
            [v87 submitLogEvent:v88];
          }
          id v89 = [v54 userInfo];
          id v90 = (void *)[v89 mutableCopy];

          id v91 = objc_msgSend(NSNumber, "numberWithInt:", -[HMDIDSMessageTransport transportType](self, "transportType"));
          [v90 setObject:v91 forKeyedSubscript:@"kRemoteMessageTransportAttributionKey"];

          if (self && ![(HMDIDSMessageTransport *)self isLegacyTransport])
          {
            v58 = (void *)v50;
            v112 = [(HMDRemoteMessageSenderContext *)v135 deviceHandle];
            [v86 setPreferredHandle:v112];

            [v90 setObject:v15 forKeyedSubscript:@"kIDSMessageSourceIDKey"];
            v113 = [v16 toID];
            [v90 setObject:v113 forKeyedSubscript:@"kRemoteMessageIDSToIDKey"];

            objc_msgSend(v142, "hmf_dataForKey:", @"kIDSMessageResponseErrorDataKey");
            v114 = v134 = v86;
            [v90 setObject:v114 forKeyedSubscript:@"kIDSMessageResponseErrorDataKey"];

            v115 = [v54 internal];
            [v115 setUserInfo:v90];

            BOOL v93 = v135;
            [v54 setSenderContext:v135];
            v94 = [(HMFMessageTransport *)self delegate];
            v116 = self;
            uint64_t v96 = v134;
            [v94 messageTransport:v116 didReceiveMessage:v54];
            id v13 = v136;
            v95 = v131;
          }
          else
          {
            v58 = (void *)v50;
            id v92 = [v54 internal];
            [v92 setUserInfo:v90];

            [v54 setSenderContext:v135];
            BOOL v93 = v135;
            v94 = [(HMDRemoteMessageSenderContext *)v135 deviceHandle];
            v95 = v131;
            [(HMDIDSMessageTransport *)self legacyHandleIncomingRemoteMessage:v54 sourceDevice:v131 senderDeviceHandle:v94 isSecure:v133 incomingMessage:v142 fromID:v15 context:v16];
            uint64_t v96 = v86;
            id v13 = v136;
          }
        }
        else
        {
          v58 = (void *)v50;
          v108 = (void *)MEMORY[0x230FBD990]();
          v109 = self;
          v110 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
          {
            v111 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v147 = v111;
            __int16 v148 = 2112;
            uint64_t v149 = (uint64_t)v54;
            _os_log_impl(&dword_22F52A000, v110, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine source device, dropping message: %@", buf, 0x16u);
          }

          id v13 = v136;
        }
        goto LABEL_62;
      }
      v58 = (void *)v50;
      __int16 v97 = (void *)MEMORY[0x230FBD990](v55);
      uint64_t v98 = self;
      __int16 v99 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v100 = v15;
        id v101 = v16;
        v103 = id v102 = v13;
        *(_DWORD *)buf = 138543874;
        v147 = v103;
        __int16 v148 = 2160;
        uint64_t v149 = 1752392040;
        __int16 v150 = 2112;
        uint64_t v151 = (uint64_t)v100;
        v104 = "%{public}@Unable to create sender device handle from fromID: %{mask.hash}@";
        v105 = v99;
        os_log_type_t v106 = OS_LOG_TYPE_ERROR;
        uint32_t v107 = 32;
LABEL_55:
        _os_log_impl(&dword_22F52A000, v105, v106, v104, buf, v107);

        id v13 = v102;
        id v16 = v101;
        id v15 = v100;
      }
    }
    else
    {
      v58 = (void *)v50;
      __int16 v97 = (void *)MEMORY[0x230FBD990]();
      uint64_t v98 = self;
      __int16 v99 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v100 = v15;
        id v101 = v16;
        v103 = id v102 = v13;
        *(_DWORD *)buf = 138543618;
        v147 = v103;
        __int16 v148 = 2112;
        uint64_t v149 = (uint64_t)v54;
        v104 = "%{public}@Dropping message from legacy transport: %@";
        v105 = v99;
        os_log_type_t v106 = OS_LOG_TYPE_INFO;
        uint32_t v107 = 22;
        goto LABEL_55;
      }
    }

LABEL_62:
    v69 = v138;
LABEL_63:

    uint64_t v59 = v139;
LABEL_64:

    id v14 = v142;
    id v12 = v143;
LABEL_65:

    goto LABEL_66;
  }
  id v18 = (void *)v17;
  id v19 = [v16 originalGUID];
  char v20 = v19;
  if (!self || !v19)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v21 = [(HMDIDSMessageTransport *)self messageDedupBuffer];
  char v22 = [v21 containsObject:v20];

  if ((v22 & 1) == 0)
  {
    id v32 = [(HMDIDSMessageTransport *)self messageDedupBuffer];
    unint64_t v33 = [v32 count];

    if (v33 >= 0x1E)
    {
      v34 = [(HMDIDSMessageTransport *)self messageDedupBuffer];
      [v34 removeObjectAtIndex:0];
    }
    uint64_t v35 = [(HMDIDSMessageTransport *)self messageDedupBuffer];
    [v35 addObject:v20];

    goto LABEL_11;
  }

  v23 = (void *)MEMORY[0x230FBD990]();
  v24 = self;
  id v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    uint64_t v26 = HMFGetLogIdentifier();
    [v16 originalGUID];
    id v27 = v12;
    id v28 = v15;
    id v29 = v16;
    uint64_t v31 = v30 = v13;
    *(_DWORD *)buf = 138543618;
    v147 = v26;
    __int16 v148 = 2114;
    uint64_t v149 = (uint64_t)v31;
    _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Received duplicate message with GUID: %{public}@", buf, 0x16u);

    id v13 = v30;
    id v16 = v29;
    id v15 = v28;
    id v12 = v27;
  }
LABEL_66:
}

- (BOOL)_shouldProcessLegacyIDSMessageFromID:(id)a3 context:(id)a4 message:(id *)a5 service:(id)a6
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([(HMDIDSMessageTransport *)self transportType] == 4)
  {
    id v13 = [v12 deviceForFromID:v10];
    id v14 = v13;
    if (v13) {
      char v15 = [v13 isDefaultPairedDevice];
    }
    else {
      char v15 = 0;
    }
  }
  else if (self && ![(HMDIDSMessageTransport *)self isLegacyTransport])
  {
    char v15 = 1;
  }
  else
  {
    id v16 = [(HMDIDSMessageTransport *)self appleAccountManager];
    uint64_t v17 = [v16 account];

    id v18 = [v11 senderCorrelationIdentifier];
    id v19 = *a5;
    char v20 = [v19 objectForKeyedSubscript:@"kIDSMessagePayloadKey"];
    v68 = v19;
    v65 = [v19 objectForKeyedSubscript:@"kIDSMessageNameKey"];
    v67 = [(HMDRemoteMessageTransport *)self homeMembershipVerifier];
    v66 = +[HMDDeviceHandle deviceHandleForDestination:v10];
    id v21 = +[HMDAccountHandle accountHandleForDestination:v10];
    char v22 = [v17 senderCorrelationIdentifier];
    if ([v22 isEqual:v18])
    {

      char v15 = 1;
    }
    else
    {
      v62 = v20;
      id v63 = v18;
      v61 = v17;
      v23 = [v17 handles];
      v64 = v21;
      char v24 = [v23 containsObject:v21];

      if (v24) {
        goto LABEL_13;
      }
      id v25 = [(HMDIDSMessageTransport *)self pendingResponses];
      uint64_t v26 = objc_msgSend(v68, "hmf_UUIDForKey:", @"kIDSMessageRequestTransactionIDKey");
      id v27 = [v25 objectForKey:v26];

      if (v27)
      {
LABEL_13:
        char v15 = 1;
        char v20 = v62;
        id v18 = v63;
      }
      else
      {
        v60 = +[HMDAccountIdentifier accountIdentifierForMessageContext:v11];
        id v29 = [[HMDRemoteMessageSenderContext alloc] initWithDeviceHandle:v66 accountHandle:v21 accountIdentifier:v60 deviceVersion:0 pairingIdentityIdentifier:0];
        id v30 = [(HMDIDSMessageTransport *)self remoteAccountManager];
        uint64_t v59 = v29;
        id v31 = (id)[v30 deviceForSenderContext:v29];

        id v18 = v63;
        char v20 = v62;
        if ([v67 userWithMergeIdIsMemberOfAHome:v63])
        {
          char v15 = 1;
          id v21 = v64;
        }
        else
        {
          v58 = objc_msgSend(v62, "hmf_UUIDForKey:", @"kInvitationIdentifierKey");
          if (objc_msgSend(v67, "expectingInvitationResponseForIdentifier:"))
          {
            char v15 = 1;
          }
          else if ([v65 isEqual:@"kAccessHomeInviteRequestKey"])
          {
            uint64_t v32 = [v62 objectForKeyedSubscript:@"kHomeName"];
            unint64_t v33 = [HMDNameValidator alloc];
            v34 = [MEMORY[0x263F08C38] UUID];
            uint64_t v35 = [(HMDNameValidator *)v33 initWithUUID:v34];

            uint64_t v56 = (void *)v32;
            uint64_t v36 = [(HMDNameValidator *)v35 validateName:v32];
            char v15 = v36 == 0;
            uint64_t v57 = (void *)v36;
            if (v36)
            {
              uint64_t v37 = v36;
              v38 = (void *)MEMORY[0x230FBD990]();
              v39 = self;
              id v40 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                id v41 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v74 = v41;
                __int16 v75 = 2112;
                uint64_t v76 = v37;
                _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_ERROR, "%{public}@Received invite from invalid home name.  Validation Error %@", buf, 0x16u);
              }
              char v20 = v62;
              id v42 = v56;
            }
            else
            {
              uint64_t v55 = v35;
              v43 = [MEMORY[0x263F08C38] UUID];
              id v44 = (void *)MEMORY[0x230FBD990]();
              id v45 = self;
              v46 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                uint64_t v47 = v45;
                v49 = id v48 = v44;
                *(_DWORD *)buf = 138543618;
                v74 = v49;
                __int16 v75 = 2112;
                uint64_t v76 = (uint64_t)v43;
                _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_INFO, "%{public}@Replacing incoming HH1 invite with message id %@", buf, 0x16u);

                id v44 = v48;
                id v45 = v47;
              }

              v72[0] = @"kAccessHomeInviteRequestKey";
              v71[0] = @"kIDSMessageNameKey";
              v71[1] = @"kIDSMessageIdentifierKey";
              __int16 v54 = [v43 UUIDString];
              v72[1] = v54;
              v72[2] = MEMORY[0x263EFFA88];
              v71[2] = @"kIDSMessageRequiresResponseKey";
              v71[3] = @"kIDSMessageRequestTransactionIDKey";
              uint64_t v53 = [MEMORY[0x263F08C38] UUID];
              uint64_t v50 = [v53 UUIDString];
              v72[3] = v50;
              v72[4] = @"1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938";
              v71[4] = @"kIDSMessageTargetKey";
              v71[5] = @"kIDSMessagePayloadKey";
              id v42 = v56;
              v69 = @"kHomeName";
              id v70 = v56;
              [NSDictionary dictionaryWithObjects:&v70 forKeys:&v69 count:1];
              v52 = uint64_t v51 = v43;
              v72[5] = v52;
              *a5 = [NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:6];

              char v20 = v62;
              uint64_t v35 = v55;
            }

            id v18 = v63;
          }
          else
          {
            char v15 = 0;
          }
          id v21 = v64;
          uint64_t v17 = v61;
        }
      }
    }
  }
  return v15;
}

- (BOOL)shouldAcceptLegacyIDSMessage:(id)a3
{
  id v3 = a3;
  if (![v3 type]
    && ([v3 name],
        id v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 isEqualToString:@"kAccessHomeInviteRequestKey"],
        v4,
        (v5 & 1) != 0)
    || [v3 type] == 1)
  {
    char v6 = 1;
  }
  else
  {
    v7 = [v3 name];
    char v6 = [v7 isEqualToString:@"kSecureServerIDSMessageRequestKey"];
  }
  return v6;
}

- (void)_removePendingResponseTransaction:(id)a3
{
  id v7 = a3;
  id v4 = [(HMDIDSMessageTransport *)self pendingResponses];
  [v4 removeObjectForKey:v7];

  char v5 = [(HMDIDSMessageTransport *)self requestedCapabilities];
  [v5 removeObjectForKey:v7];

  char v6 = [(HMDIDSMessageTransport *)self destinationAddress];
  [v6 removeObjectForKey:v7];

  [(HMDIDSMessageTransport *)self _removePendingResponseTimerForTransaction:v7];
}

- (void)_removePendingResponseTimerForTransaction:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = (void *)MEMORY[0x230FBD990]();
  char v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v12 = 138543618;
    id v13 = v8;
    __int16 v14 = 2114;
    id v15 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Cancelling timer for transaction: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  id v9 = [(HMDIDSMessageTransport *)v6 pendingResponseTimers];
  id v10 = [v9 objectForKeyedSubscript:v4];

  if (v10) {
    dispatch_source_cancel(v10);
  }
  id v11 = [(HMDIDSMessageTransport *)v6 pendingResponseTimers];
  [v11 removeObjectForKey:v4];
}

- (void)_startPendingResponseTimer:(id)a3 responseTimeout:(double)a4 identifier:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (fabs(a4) < 2.22044605e-16 || a4 <= 0.0) {
    unint64_t v11 = remotePendingResponseTimerNanoseconds;
  }
  else {
    unint64_t v11 = (uint64_t)(a4 * 1000000000.0);
  }
  int v12 = [(HMDIDSMessageTransport *)self workQueue];
  id v13 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v12);

  dispatch_time_t v14 = dispatch_time(0, v11);
  dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, remotePendingResponseLeewayNanoseconds);
  objc_initWeak(&location, self);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __80__HMDIDSMessageTransport__startPendingResponseTimer_responseTimeout_identifier___block_invoke;
  handler[3] = &unk_264A2C148;
  objc_copyWeak(&v24, &location);
  id v15 = v8;
  id v23 = v15;
  dispatch_source_set_event_handler(v13, handler);
  dispatch_resume(v13);
  uint64_t v16 = (void *)MEMORY[0x230FBD990]();
  uint64_t v17 = self;
  HMFGetOSLogHandle();
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    char v20 = [v15 UUIDString];
    *(_DWORD *)buf = 138543874;
    id v27 = v19;
    __int16 v28 = 2114;
    id v29 = v20;
    __int16 v30 = 2048;
    unint64_t v31 = v11 / 0x3B9ACA00;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Starting poll to track response for message with transaction %{public}@ for %lld secs", buf, 0x20u);
  }
  id v21 = [(HMDIDSMessageTransport *)v17 pendingResponseTimers];
  [v21 setObject:v13 forKeyedSubscript:v15];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __80__HMDIDSMessageTransport__startPendingResponseTimer_responseTimeout_identifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _pendingResponseTimeoutFor:*(void *)(a1 + 32)];
}

- (void)_pendingResponseTimeoutFor:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = (void *)MEMORY[0x230FBD990]();
  char v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [v4 UUIDString];
    int v26 = 138543618;
    id v27 = v8;
    __int16 v28 = 2114;
    id v29 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Pending Response timeout for transaction: %{public}@", (uint8_t *)&v26, 0x16u);
  }
  id v10 = [(HMDIDSMessageTransport *)v6 pendingResponses];
  unint64_t v11 = [v10 objectForKeyedSubscript:v4];

  if (v11)
  {
    int v12 = [(HMDIDSMessageTransport *)v6 receivedResponses];
    id v13 = [v12 objectForKeyedSubscript:v4];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      dispatch_time_t v14 = v13;
    }
    else {
      dispatch_time_t v14 = 0;
    }
    id v15 = v14;

    uint64_t v16 = [(HMDIDSMessageTransport *)v6 requestedCapabilities];
    uint64_t v17 = [v16 objectForKeyedSubscript:v4];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v18 = v17;
    }
    else {
      id v18 = 0;
    }
    id v19 = v18;

    if ([v15 count])
    {
      char v20 = (void *)MEMORY[0x230FBD990]();
      id v21 = v6;
      char v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        id v23 = HMFGetLogIdentifier();
        int v26 = 138543362;
        id v27 = v23;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@ Selecting response based on requested capabilities", (uint8_t *)&v26, 0xCu);
      }
      id v24 = [(HMDRemoteMessageTransport *)v21 matchResponse:v15 requestedCapabilities:v19];
      id v25 = [v24 objectForKeyedSubscript:@"kIDSMessageResponseErrorDataKey"];
      ((void (**)(void, void *, void *))v11)[2](v11, v25, v24);
    }
    else
    {
      id v24 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:8 userInfo:0];
      ((void (**)(void, void *, void))v11)[2](v11, v24, 0);
    }
  }
  [(HMDIDSMessageTransport *)v6 _removePendingResponseTransaction:v4];
}

- (void)_restartPendingResponseTimerFor:(id)a3 withReducedFactor:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  unint64_t v7 = remotePendingResponseTimerNanoseconds;
  uint64_t v8 = remotePendingResponseDecayScale;
  id v9 = [(HMDIDSMessageTransport *)self pendingResponseTimers];
  id v10 = [v9 objectForKeyedSubscript:v6];

  if (v10)
  {
    unint64_t v11 = v7 / (v8 * a4);
    dispatch_time_t v12 = dispatch_time(0, v11);
    dispatch_source_set_timer(v10, v12, 0xFFFFFFFFFFFFFFFFLL, remotePendingResponseLeewayNanoseconds);
    id v13 = (void *)MEMORY[0x230FBD990]();
    dispatch_time_t v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      unint64_t v17 = v11 / 0x3B9ACA00;
      id v18 = [v6 UUIDString];
      int v22 = 138543874;
      id v23 = v16;
      __int16 v24 = 2048;
      unint64_t v25 = v17;
      __int16 v26 = 2114;
      id v27 = v18;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Restarted Pending response timer for %lld sec, for transaction: %{public}@", (uint8_t *)&v22, 0x20u);
    }
  }
  else
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    id v19 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      char v20 = HMFGetLogIdentifier();
      id v21 = [v6 UUIDString];
      int v22 = 138543618;
      id v23 = v20;
      __int16 v24 = 2114;
      unint64_t v25 = (unint64_t)v21;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Timer already expired for transaction: %{public}@", (uint8_t *)&v22, 0x16u);
    }
  }
}

- (id)sendMessage:(id)a3 fromHandle:(id)a4 destination:(id)a5 priority:(int64_t)a6 timeout:(double)a7 options:(unint64_t)a8 queueOneID:(id)a9 error:(id *)a10
{
  char v11 = a8;
  unint64_t v17 = a10;
  v103[1] = *MEMORY[0x263EF8340];
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a9;
  id v22 = v21;
  if (v20)
  {
    id v82 = [v20 allRemoteDestinationStrings];
    id v81 = v22;
    if (![v82 count])
    {
      unint64_t v33 = (void *)MEMORY[0x230FBD990]();
      v34 = self;
      uint64_t v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        uint64_t v36 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v88 = (uint64_t)v36;
        __int16 v89 = 2112;
        uint64_t v90 = (uint64_t)v20;
        _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@No valid destination strings for destination: %@", buf, 0x16u);
      }
      if (!a10)
      {
        uint64_t v32 = v81;
LABEL_66:

        goto LABEL_67;
      }
      uint64_t v37 = (void *)MEMORY[0x263F087E8];
      uint64_t v102 = *MEMORY[0x263F08608];
      __int16 v24 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:3203];
      v103[0] = v24;
      v38 = [NSDictionary dictionaryWithObjects:v103 forKeys:&v102 count:1];
      [v37 hmErrorWithCode:54 userInfo:v38];
      unint64_t v17 = 0;
      *a10 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v32 = v81;
LABEL_65:

      goto LABEL_66;
    }
    int64_t v79 = a6;
    id v23 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
    __int16 v24 = v23;
    if (v11)
    {
      uint64_t v39 = MEMORY[0x263EFFA88];
      [v23 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F49EF8]];
      [v24 setObject:v39 forKeyedSubscript:*MEMORY[0x263F49F18]];
      if ((v11 & 2) == 0)
      {
LABEL_5:
        if ((v11 & 8) == 0) {
          goto LABEL_6;
        }
        goto LABEL_21;
      }
    }
    else if ((v11 & 2) == 0)
    {
      goto LABEL_5;
    }
    [v24 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F49F30]];
    if ((v11 & 8) == 0)
    {
LABEL_6:
      if ((v11 & 4) == 0)
      {
LABEL_8:
        if (a7 <= 0.0)
        {
          if ((v11 & 2) == 0) {
            [v24 setObject:&unk_26E4746B8 forKeyedSubscript:*MEMORY[0x263F49F80]];
          }
        }
        else
        {
          __int16 v26 = [NSNumber numberWithDouble:a7];
          [v24 setObject:v26 forKeyedSubscript:*MEMORY[0x263F49F80]];
        }
        [v24 setObject:v22 forKeyedSubscript:*MEMORY[0x263F49F60]];
        [v24 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F49EB8]];
        v80 = v18;
        id v78 = v20;
        if (v19)
        {
          long long v85 = 0u;
          long long v86 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          id v40 = [(HMDIDSMessageTransport *)self service];
          id v41 = [v40 accounts];

          uint64_t v42 = [v41 countByEnumeratingWithState:&v83 objects:v101 count:16];
          if (v42)
          {
            uint64_t v43 = v42;
            uint64_t v44 = *(void *)v84;
            while (2)
            {
              for (uint64_t i = 0; i != v43; ++i)
              {
                if (*(void *)v84 != v44) {
                  objc_enumerationMutation(v41);
                }
                v46 = *(void **)(*((void *)&v83 + 1) + 8 * i);
                uint64_t v47 = objc_msgSend(v46, "hmd_handles");
                int v48 = [v47 containsObject:v19];

                if (v48)
                {
                  uint64_t v50 = [v19 URI];
                  uint64_t v51 = [v50 prefixedURI];
                  [v24 setObject:v51 forKeyedSubscript:*MEMORY[0x263F49F10]];

                  id v49 = v46;
                  goto LABEL_36;
                }
              }
              uint64_t v43 = [v41 countByEnumeratingWithState:&v83 objects:v101 count:16];
              if (v43) {
                continue;
              }
              break;
            }
            id v49 = 0;
LABEL_36:
            id v18 = v80;
            unint64_t v17 = a10;
          }
          else
          {
            id v49 = 0;
          }
        }
        else
        {
          id v49 = 0;
        }
        if (self && ![(HMDIDSMessageTransport *)self isLegacyTransport])
        {
          uint64_t v52 = -[HMDIDSMessageTransport _identifierFromSerializedMessage:](self, v18);
        }
        else
        {
          uint64_t v52 = [v18 shortDescription];
        }
        uint64_t v53 = (void *)v52;
        if (shouldLogPrivateInformation())
        {
          id v54 = v24;
        }
        else
        {
          uint64_t v55 = (void *)[v24 mutableCopy];
          uint64_t v56 = [MEMORY[0x263EFF8C0] arrayWithObject:*MEMORY[0x263F49F10]];
          [v55 removeObjectsForKeys:v56];

          id v54 = (id)[v55 copy];
        }
        uint64_t v57 = (void *)MEMORY[0x230FBD990]();
        v58 = self;
        uint64_t v59 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          uint64_t v77 = v17;
          uint64_t v60 = HMFGetLogIdentifier();
          v61 = (void *)v60;
          switch(v79)
          {
            case 100:
              v62 = @"Sync";
              break;
            case 200:
              v62 = @"Default";
              break;
            case 300:
              v62 = @"Urgent";
              break;
            default:
              v62 = @"Unknown";
              break;
          }
          *(_DWORD *)buf = 138544899;
          uint64_t v88 = v60;
          __int16 v89 = 2114;
          uint64_t v90 = (uint64_t)v53;
          __int16 v91 = 2160;
          uint64_t v92 = 1752392040;
          __int16 v93 = 2112;
          v94 = v82;
          __int16 v95 = 2113;
          id v96 = v49;
          __int16 v97 = 2114;
          uint64_t v98 = v62;
          __int16 v99 = 2114;
          id v100 = v54;
          _os_log_impl(&dword_22F52A000, v59, OS_LOG_TYPE_INFO, "%{public}@Sending IDS message %{public}@ to %{mask.hash}@, from account %{private}@ with priority, %{public}@, options: %{public}@", buf, 0x48u);

          unint64_t v17 = v77;
        }

        id v63 = [(HMDIDSMessageTransport *)v58 service];
        v64 = [MEMORY[0x263EFFA08] setWithArray:v82];
        id v65 = v49;
        v66 = (__CFString **)v17;
        id v18 = v80;
        v67 = v65;
        char v68 = objc_msgSend(v63, "sendMessage:fromAccount:toDestinations:priority:options:identifier:error:", v80, v17);
        unint64_t v17 = (id *)0;

        if ((v68 & 1) == 0)
        {
          v69 = (void *)MEMORY[0x230FBD990]();
          id v70 = v58;
          id v71 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
          {
            uint64_t v72 = HMFGetLogIdentifier();
            uint64_t v73 = -[HMDIDSMessageTransport _identifierFromSerializedMessage:](v70, v80);
            v74 = (void *)v73;
            if (v66) {
              __int16 v75 = *v66;
            }
            else {
              __int16 v75 = @"<nil>";
            }
            *(_DWORD *)buf = 138543874;
            uint64_t v88 = (uint64_t)v72;
            __int16 v89 = 2114;
            uint64_t v90 = v73;
            __int16 v91 = 2112;
            uint64_t v92 = (uint64_t)v75;
            _os_log_impl(&dword_22F52A000, v71, OS_LOG_TYPE_INFO, "%{public}@Failed to send IDS message %{public}@ due to error: %@", buf, 0x20u);

            id v18 = v80;
          }

          unint64_t v17 = 0;
        }
        uint64_t v32 = v81;
        v38 = v67;
        id v20 = v78;
        goto LABEL_65;
      }
LABEL_7:
      unint64_t v25 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F49E98]];
      [v24 setObject:v25 forKeyedSubscript:*MEMORY[0x263F49F68]];

      goto LABEL_8;
    }
LABEL_21:
    [v24 setObject:&unk_26E471080 forKeyedSubscript:*MEMORY[0x263F49F50]];
    if ((v11 & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v27 = v21;
  uint64_t v28 = (void *)MEMORY[0x230FBD990]();
  id v29 = self;
  uint64_t v30 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    unint64_t v31 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v88 = (uint64_t)v31;
    _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@Destination is required", buf, 0xCu);
  }
  if (a10)
  {
    [MEMORY[0x263F087E8] hmErrorWithCode:20];
    unint64_t v17 = 0;
    *a10 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v32 = v27;
LABEL_67:

  return v17;
}

- (id)_identifierFromSerializedMessage:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    if ([a1 isLegacyTransport]) {
      id v4 = @"kIDSMessageIdentifierKey";
    }
    else {
      id v4 = @"id";
    }
    a1 = objc_msgSend(v3, "hmf_stringForKey:", v4);
  }

  return a1;
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDIDSMessageTransport *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__HMDIDSMessageTransport_sendMessage_completionHandler___block_invoke;
  block[3] = &unk_264A2EE80;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __56__HMDIDSMessageTransport_sendMessage_completionHandler___block_invoke(id *a1)
{
  uint64_t v174 = *MEMORY[0x263EF8340];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__HMDIDSMessageTransport_sendMessage_completionHandler___block_invoke_2;
  aBlock[3] = &unk_264A2EDE0;
  id v165 = a1[6];
  id v164 = a1[4];
  v2 = (void (**)(void *, void *))_Block_copy(aBlock);
  id v3 = a1[5];
  if (!v3 || ([v3 isLegacyTransport] & 1) != 0) {
    goto LABEL_6;
  }
  id v4 = [a1[4] responseHandler];

  if (v4)
  {
    v127 = (void *)MEMORY[0x230FBD990]();
    id v128 = a1[5];
    v129 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v129, OS_LOG_TYPE_FAULT))
    {
      v130 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v167 = v130;
      _os_log_impl(&dword_22F52A000, v129, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Response handler should not be set in modern transport", buf, 0xCu);
    }
    v131 = [[HMDAssertionLogEvent alloc] initWithReason:@"Response handler should not be set in modern transport"];
    v132 = +[HMDMetricsManager sharedLogEventSubmitter];
    [v132 submitLogEvent:v131];
  }
  char v5 = [a1[4] responseHandler];

  if (!v5)
  {
LABEL_6:
    id v7 = [a1[4] destination];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    id v6 = v8;

    if (!v6)
    {
      id v15 = (void *)MEMORY[0x230FBD990]();
      id v16 = a1[5];
      unint64_t v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = HMFGetLogIdentifier();
        id v19 = [a1[4] identifier];
        id v20 = [v19 UUIDString];
        id v21 = [a1[4] destination];
        *(_DWORD *)buf = 138543874;
        v167 = v18;
        __int16 v168 = 2114;
        id v169 = v20;
        __int16 v170 = 2112;
        id v171 = v21;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to send message %{public}@ invalid destination: %@", buf, 0x20u);
      }
      id v9 = [MEMORY[0x263F087E8] hmErrorWithCode:3 description:@"Invalid parameter." reason:@"Invalid destination." suggestion:0];
      v2[2](v2, v9);
      goto LABEL_100;
    }
    id v9 = [a1[5] remoteMessageFromMessage:a1[4]];
    id v10 = a1[5];
    if (v10) {
      uint64_t v11 = [v10 isLegacyTransport] ^ 1;
    }
    else {
      uint64_t v11 = 0;
    }
    id v162 = 0;
    id v12 = +[HMDRemoteMessageSerialization dictionaryForMessage:v9 isHH2Payload:v11 error:&v162];
    id v13 = v162;
    if (!v12)
    {
      id v22 = (void *)MEMORY[0x230FBD990]();
      id v23 = a1[5];
      __int16 v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        unint64_t v25 = HMFGetLogIdentifier();
        __int16 v26 = [a1[4] identifier];
        *(_DWORD *)buf = 138543874;
        v167 = v25;
        __int16 v168 = 2114;
        id v169 = v26;
        __int16 v170 = 2112;
        id v171 = v13;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize message %{public}@ with error: %@", buf, 0x20u);
      }
      v2[2](v2, v13);
      goto LABEL_99;
    }
    id v14 = a1[5];
    id v150 = v13;
    if (!v14 || ([v14 isLegacyTransport] & 1) != 0)
    {
      context = 0;
LABEL_61:
      id v145 = v2;
      [v9 timeout];
      double v60 = 0.0;
      if (v61 > 0.0)
      {
        [v9 timeout];
        double v60 = v62;
      }
      uint64_t v63 = [v9 collapseID];
      if (v63)
      {
        v64 = objc_opt_class();
        id v65 = [v9 name];
        v66 = [v6 target];
        v67 = [MEMORY[0x263EFF910] now];
        id v160 = [v64 queueOneIdentifierWithMessageName:v65 target:v66 collapseID:v63 timeToLive:v67 now:v60];
      }
      else
      {
        id v160 = 0;
      }
      if ([v9 sendOptions])
      {
        uint64_t v68 = 8;
      }
      else
      {
        uint64_t v68 = (uint64_t)a1[5];
        id v69 = v9;
        id v70 = v160;
        if (v68)
        {
          int v71 = [(id)v68 isLegacyTransport];
          uint64_t v68 = 0;
          if (v71)
          {
            if (!v70) {
              uint64_t v68 = [v69 type] == 3;
            }
          }
        }
      }
      uint64_t v72 = [a1[4] destination];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v73 = v72;
      }
      else {
        uint64_t v73 = 0;
      }
      id v74 = v73;

      if (v74 && [v74 restrictToResidentCapable]) {
        v68 |= 4uLL;
      }
      id v144 = v74;
      uint64_t v75 = [(id)objc_opt_class() priorityForMessage:v9];
      id v76 = a1[5];
      id v161 = 0;
      uint64_t v77 = [v76 sendMessage:v12 fromHandle:context destination:v6 priority:v75 timeout:v68 options:v160 queueOneID:v60 error:&v161];
      id v141 = v161;
      id v142 = (void *)v63;
      __int16 v152 = (void *)v77;
      if (v77)
      {
        id v78 = +[HMDMetricsManager sharedLogEventSubmitter];
        int64_t v79 = +[HMDRemoteMessageLogEvent sentRemoteMessage:transportType:](HMDRemoteMessageLogEvent, "sentRemoteMessage:transportType:", v9, [a1[5] transportType]);
        [v78 submitLogEvent:v79];

        v80 = (void *)MEMORY[0x230FBD990]();
        id v81 = a1[5];
        id v82 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
        {
          long long v83 = HMFGetLogIdentifier();
          [a1[4] identifier];
          v85 = long long v84 = v12;
          *(_DWORD *)buf = 138543874;
          v167 = v83;
          __int16 v168 = 2114;
          id v169 = v85;
          __int16 v170 = 2114;
          id v171 = v152;
          _os_log_impl(&dword_22F52A000, v82, OS_LOG_TYPE_INFO, "%{public}@Message %{public}@ ack'd with IDS GUID %{public}@", buf, 0x20u);

          id v12 = v84;
        }

        long long v86 = [MEMORY[0x263EFF9A0] dictionary];
        id v87 = a1[6];
        if (v87)
        {
          uint64_t v88 = (void *)[v87 copy];
          [v86 setObject:v88 forKeyedSubscript:@"HMDIDSMessageTransportCompletionHandlerKey"];
        }
        __int16 v148 = v12;
        __int16 v89 = [a1[4] responseHandler];

        v2 = v145;
        if (v89)
        {
          uint64_t v90 = [v9 transactionIdentifier];
          [v86 setObject:v90 forKeyedSubscript:@"HMDIDSMessageTransportTransactionIdentifierKey"];
          __int16 v91 = [a1[4] responseHandler];
          uint64_t v92 = _Block_copy(v91);
          __int16 v93 = [a1[5] pendingResponses];
          [v93 setObject:v92 forKeyedSubscript:v90];

          v94 = [v9 messagePayload];
          __int16 v95 = [v94 objectForKeyedSubscript:@"kRequestedCapabilitiesKey"];
          id v96 = [a1[5] requestedCapabilities];
          [v96 setObject:v95 forKeyedSubscript:v90];

          __int16 v97 = [v6 remoteDestinationString];
          uint64_t v98 = [a1[5] destinationAddress];
          [v98 setObject:v97 forKeyedSubscript:v90];

          id v99 = a1[5];
          [v9 timeout];
          objc_msgSend(v99, "_startPendingResponseTimer:responseTimeout:identifier:", v90, v152);
        }
        id v100 = [HMDIDSMessageContext alloc];
        id v101 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v152];
        uint64_t v102 = [a1[4] destination];
        v103 = [(HMDIDSMessageContext *)v100 initWithIdentifier:v101 destination:v102 userInfo:v86];

        v104 = [a1[5] messageContexts];
        [v104 addObject:v103];

        v105 = [a1[5] sendMessageBudget];
        LODWORD(v101) = [v105 decrement];

        if (v101)
        {
          os_log_type_t v106 = [a1[5] sendMessageBudget];
          int v107 = [v106 isEmpty];

          id v12 = v148;
          v108 = v141;
          if (v107)
          {
            v140 = (void *)MEMORY[0x230FBD990]();
            id v109 = a1[5];
            v110 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
            {
              v111 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              v167 = v111;
              _os_log_impl(&dword_22F52A000, v110, OS_LOG_TYPE_ERROR, "%{public}@Exceeded send message budget", buf, 0xCu);

              id v12 = v148;
            }

            v112 = [a1[5] sendMessageBudget];
            uint64_t v113 = [v112 rate];
            v115 = +[HMDRemoteMessageExceedBudgetLogEvent eventWithBudgetRate:](HMDRemoteMessageExceedBudgetLogEvent, "eventWithBudgetRate:", v113, v114);

            v116 = +[HMDMetricsManager sharedLogEventSubmitter];
            [v116 submitLogEvent:v115];
          }
        }
        else
        {
          v123 = (void *)MEMORY[0x230FBD990]();
          id v124 = a1[5];
          v125 = HMFGetOSLogHandle();
          v108 = v141;
          if (os_log_type_enabled(v125, OS_LOG_TYPE_INFO))
          {
            v126 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v167 = v126;
            _os_log_impl(&dword_22F52A000, v125, OS_LOG_TYPE_INFO, "%{public}@Over send message budget", buf, 0xCu);
          }
          id v12 = v148;
        }

        id v13 = v150;
      }
      else
      {
        v117 = (void *)MEMORY[0x230FBD990]();
        id v118 = a1[5];
        v119 = HMFGetOSLogHandle();
        v108 = v141;
        if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
        {
          id v120 = HMFGetLogIdentifier();
          [a1[4] identifier];
          id v121 = v149 = v12;
          v122 = [a1[4] name];
          *(_DWORD *)buf = 138544130;
          v167 = v120;
          __int16 v168 = 2114;
          id v169 = v121;
          __int16 v170 = 2112;
          id v171 = v122;
          __int16 v172 = 2112;
          id v173 = v141;
          _os_log_impl(&dword_22F52A000, v119, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to send message %{public}@ / %@ with error: %@", buf, 0x2Au);

          id v12 = v149;
          id v13 = v150;
        }

        v2 = v145;
        v145[2](v145, v141);
      }

LABEL_99:
LABEL_100:

      goto LABEL_101;
    }
    id v27 = (void *)[v12 mutableCopy];
    id v28 = a1[5];
    id v29 = v27;
    if (v28)
    {
      uint64_t v30 = [v28 appleAccountManager];
      unint64_t v31 = [v30 device];

      if (v31)
      {
        uint64_t v32 = [v31 idsIdentifier];
        unint64_t v33 = v32;
        if (v32)
        {
          v34 = [v32 UUIDString];
          [v29 setObject:v34 forKeyedSubscript:@"idsId"];
        }
        else
        {
          v146 = v12;
          id v40 = (void *)MEMORY[0x230FBD990]();
          id v41 = v28;
          uint64_t v42 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            uint64_t v43 = v158 = v40;
            *(_DWORD *)buf = 138543618;
            v167 = v43;
            __int16 v168 = 2112;
            id v169 = v31;
            _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_ERROR, "%{public}@Cannot set the source IDS device identifier because IDS identifier is unknown for current device: %@", buf, 0x16u);

            id v40 = v158;
          }

          id v12 = v146;
        }
      }
      else
      {
        uint64_t v35 = (void *)MEMORY[0x230FBD990]();
        id v36 = v28;
        uint64_t v37 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          id v157 = v29;
          uint64_t v39 = v38 = v12;
          *(_DWORD *)buf = 138543362;
          v167 = v39;
          _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@Cannot set the source IDS device identifier because current device is unknown", buf, 0xCu);

          id v12 = v38;
          id v29 = v157;
        }
      }
    }
    if ([v9 type] != 1)
    {
      context = 0;
      id v13 = v150;
LABEL_60:
      uint64_t v59 = [v29 copy];

      id v12 = (void *)v59;
      goto LABEL_61;
    }
    uint64_t v44 = [a1[4] userInfo];
    id v45 = [v44 objectForKeyedSubscript:@"kIDSMessageResponseErrorDataKey"];

    if (v45) {
      [v29 setObject:v45 forKeyedSubscript:@"kIDSMessageResponseErrorDataKey"];
    }
    id v46 = a1[5];
    id v47 = v9;
    int v48 = v47;
    if (!v46 || [v47 type] != 1)
    {
      context = 0;
      id v13 = v150;
LABEL_59:

      goto LABEL_60;
    }
    id v49 = [v48 remoteToID];
    if (!v49)
    {
      context = 0;
      id v13 = v150;
LABEL_58:

      goto LABEL_59;
    }
    id v159 = v49;
    v147 = v12;
    uint64_t v50 = [v48 destination];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v51 = v50;
    }
    else {
      uint64_t v51 = 0;
    }
    id v52 = v51;

    uint64_t v151 = v52;
    if (v52)
    {
      uint64_t v53 = [v52 device];
      id v54 = [v53 account];

      if (v54)
      {
        if ([(HMDAssertionLogEvent *)v54 isCurrentAccount])
        {
          context = 0;
          id v13 = v150;
LABEL_57:

          id v12 = v147;
          id v49 = v159;
          goto LABEL_58;
        }
        uint64_t v55 = +[HMDAccountHandle accountHandleForDestination:v159];
        if (v55)
        {
          uint64_t v56 = v55;
          context = v56;
LABEL_56:
          id v13 = v150;

          goto LABEL_57;
        }
        id contexta = (void *)MEMORY[0x230FBD990]();
        id v57 = v46;
        v58 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          id v143 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v167 = v143;
          __int16 v168 = 2112;
          id v169 = v159;
          _os_log_impl(&dword_22F52A000, v58, OS_LOG_TYPE_ERROR, "%{public}@Invalid toID to create an account handle: %@", buf, 0x16u);
        }
        uint64_t v56 = 0;
      }
      else
      {
        contextc = (void *)MEMORY[0x230FBD990]();
        id v136 = v46;
        id v137 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v137, OS_LOG_TYPE_FAULT))
        {
          id v138 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v167 = v138;
          _os_log_impl(&dword_22F52A000, v137, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Destination device does not have an associated account", buf, 0xCu);
        }
        uint64_t v56 = [[HMDAssertionLogEvent alloc] initWithReason:@"Destination device does not have an associated account"];
        v139 = +[HMDMetricsManager sharedLogEventSubmitter];
        [v139 submitLogEvent:v56];

        id v54 = 0;
      }
    }
    else
    {
      contextb = (void *)MEMORY[0x230FBD990]();
      id v133 = v46;
      v134 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v134, OS_LOG_TYPE_FAULT))
      {
        v135 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v167 = v135;
        _os_log_impl(&dword_22F52A000, v134, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Response message is not a device destination", buf, 0xCu);
      }
      id v54 = [[HMDAssertionLogEvent alloc] initWithReason:@"Response message is not a device destination"];
      uint64_t v56 = +[HMDMetricsManager sharedLogEventSubmitter];
      [(HMDAssertionLogEvent *)v56 submitLogEvent:v54];
    }
    context = 0;
    goto LABEL_56;
  }
  id v6 = [MEMORY[0x263F087E8] hmErrorWithCode:48 description:@"Not supported." reason:@"Response handler should not be set when using IDS transport for modern transport" suggestion:0];
  v2[2](v2, v6);
LABEL_101:
}

void __56__HMDIDSMessageTransport_sendMessage_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = _Block_copy(*(const void **)(a1 + 40));
  id v4 = v3;
  if (v3) {
    (*((void (**)(void *, id))v3 + 2))(v3, v5);
  }

  [*(id *)(a1 + 32) respondWithPayload:0 error:v5];
}

- (int)transportType
{
  return 2;
}

- (BOOL)isValidMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 destination];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_4;
  }
  id v6 = [v4 destination];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

LABEL_4:
    goto LABEL_5;
  }
  uint64_t v8 = [v4 destination];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_12:
    BOOL v7 = 0;
    goto LABEL_13;
  }
LABEL_5:
  if (([v4 restriction] & 1) == 0
    || (!self || [(HMDIDSMessageTransport *)self isLegacyTransport])
    && ([v4 restriction] == -1 || (objc_msgSend(v4, "restriction") & 0x10) == 0))
  {
    goto LABEL_12;
  }
  BOOL v7 = 1;
LABEL_13:

  return v7;
}

- (BOOL)canSendMessage:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(HMDIDSMessageTransport *)self isValidMessage:v4]) {
    goto LABEL_13;
  }
  if (self && ![(HMDIDSMessageTransport *)self isLegacyTransport]) {
    goto LABEL_6;
  }
  id v5 = [(HMDIDSMessageTransport *)self appleAccountManager];
  id v6 = [v5 device];

  if (!v6)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    uint64_t v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      int v17 = 138543362;
      id v18 = v13;
      id v14 = "%{public}@Cannot send message, not currently registered";
LABEL_11:
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v17, 0xCu);
    }
LABEL_12:

LABEL_13:
    BOOL v9 = 0;
    goto LABEL_14;
  }
  BOOL v7 = [(HMDIDSMessageTransport *)self service];
  char v8 = objc_msgSend(v7, "hmd_isActive");

  if ((v8 & 1) == 0)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v15 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      int v17 = 138543362;
      id v18 = v13;
      id v14 = "%{public}@Cannot send message, service is inactive";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
LABEL_6:
  BOOL v9 = 1;
LABEL_14:

  return v9;
}

- (BOOL)isSecure
{
  if (self && ![(HMDIDSMessageTransport *)self isLegacyTransport]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)HMDIDSMessageTransport;
  return [(HMDRemoteMessageTransport *)&v4 isSecure];
}

- (id)deviceForSenderContext:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDIDSMessageTransport *)self appleAccountManager];
  id v6 = [v5 account];

  if (v6)
  {
    BOOL v7 = [v6 handles];
    char v8 = [v4 accountHandle];
    int v9 = [v7 containsObject:v8];

    if (!v9)
    {
      id v18 = [(HMDIDSMessageTransport *)self remoteAccountManager];
      uint64_t v11 = [v18 deviceForSenderContext:v4];
      goto LABEL_11;
    }
    id v10 = [v4 deviceHandle];
    uint64_t v11 = [v6 deviceForHandle:v10];

    if (v11)
    {
      if (![(HMDIDSMessageTransport *)self _shouldAddLocalHandleToDevice:v11]) {
        goto LABEL_18;
      }
      id v12 = [v4 localDeviceHandle];

      if (!v12) {
        goto LABEL_18;
      }
      id v13 = [v4 localDeviceHandle];
      [(HMDDevice *)v11 addHandle:v13];
    }
    else
    {
      uint64_t v19 = (void *)MEMORY[0x230FBD990]();
      id v20 = self;
      id v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        id v22 = HMFGetLogIdentifier();
        int v46 = 138543362;
        id v47 = v22;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Received message from unknown device on our account, creating placeholder device", (uint8_t *)&v46, 0xCu);
      }
      id v23 = (void *)MEMORY[0x263EFF980];
      __int16 v24 = [v4 deviceHandle];
      id v13 = [v23 arrayWithObject:v24];

      unint64_t v25 = [v4 localDeviceHandle];

      if (v25)
      {
        __int16 v26 = [v4 localDeviceHandle];
        [v13 addObject:v26];
      }
      id v27 = [HMDDevice alloc];
      id v28 = [v4 deviceHandle];
      id v29 = [v28 identifier];
      uint64_t v30 = (void *)[v13 copy];
      unint64_t v31 = [v4 deviceVersion];
      uint64_t v11 = [(HMDDevice *)v27 initWithIdentifier:v29 handles:v30 name:0 productInfo:0 version:v31 capabilities:0];

      [v6 addDevice:v11];
    }

LABEL_18:
    uint64_t v32 = (void *)MEMORY[0x230FBD990]();
    unint64_t v33 = self;
    v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v35 = HMFGetLogIdentifier();
      int v46 = 138543618;
      id v47 = v35;
      __int16 v48 = 2112;
      id v49 = v11;
      _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_DEBUG, "%{public}@Authenticated sender on our account: %@", (uint8_t *)&v46, 0x16u);
    }
    id v36 = [v6 senderCorrelationIdentifier];

    if (v36) {
      goto LABEL_21;
    }
    v38 = [v4 accountIdentifier];
    id v18 = [v38 senderCorrelationIdentifier];

    if (v18)
    {
      uint64_t v39 = (void *)MEMORY[0x230FBD990]();
      id v40 = v33;
      id v41 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v42 = HMFGetLogIdentifier();
        uint64_t v43 = [v6 identifier];
        uint64_t v44 = [v43 shortDescription];
        int v46 = 138544130;
        id v47 = v42;
        __int16 v48 = 2114;
        id v49 = v44;
        __int16 v50 = 2160;
        uint64_t v51 = 1752392040;
        __int16 v52 = 2112;
        uint64_t v53 = v18;
        _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@Updating account %{public}@ with inferred mergeID %{mask.hash}@", (uint8_t *)&v46, 0x2Au);
      }
      id v45 = [(HMDIDSMessageTransport *)v40 appleAccountManager];
      [v45 updateSenderCorrelationIdentifier:v18];
    }
LABEL_11:

    goto LABEL_21;
  }
  id v14 = (void *)MEMORY[0x230FBD990]();
  id v15 = self;
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v17 = HMFGetLogIdentifier();
    int v46 = 138543362;
    id v47 = v17;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Received a message but no current account is available to authenticate it", (uint8_t *)&v46, 0xCu);
  }
  uint64_t v11 = 0;
LABEL_21:

  return v11;
}

- (BOOL)_shouldAddLocalHandleToDevice:(id)a3
{
  id v3 = a3;
  id v4 = [v3 localHandles];
  int v5 = objc_msgSend(v4, "hmf_isEmpty");

  if (v5)
  {
    id v6 = [v3 globalHandles];
    BOOL v7 = [v6 count] == 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)logIdentifier
{
  v2 = [(HMDIDSMessageTransport *)self service];
  id v3 = [v2 serviceIdentifier];

  return v3;
}

- (int64_t)qualityOfService
{
  return 0;
}

- (id)start
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self && ![(HMDIDSMessageTransport *)self isLegacyTransport])
  {
    id v3 = (void *)MEMORY[0x230FBD990]();
    id v4 = self;
    int v5 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
      goto LABEL_8;
    }
    id v6 = HMFGetLogIdentifier();
    int v13 = 138543362;
    id v14 = v6;
    BOOL v7 = "%{public}@Starting using modern transport";
  }
  else
  {
    id v3 = (void *)MEMORY[0x230FBD990]();
    id v4 = self;
    int v5 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
      goto LABEL_8;
    }
    id v6 = HMFGetLogIdentifier();
    int v13 = 138543362;
    id v14 = v6;
    BOOL v7 = "%{public}@Starting using legacy service";
  }
  _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v13, 0xCu);

LABEL_8:
  char v8 = [(HMDIDSMessageTransport *)self service];
  int v9 = [(HMDIDSMessageTransport *)self workQueue];
  [v8 addDelegate:self queue:v9];

  id v10 = [(HMDRemoteMessageTransport *)self startPromise];
  [v10 fulfillWithValue:0];

  uint64_t v11 = [(HMDRemoteMessageTransport *)self startFuture];
  return v11;
}

- (HMDIDSMessageTransport)initWithAccountRegistry:(id)a3 service:(id)a4 appleAccountManager:(id)a5 remoteAccountManager:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v41.receiver = self;
  v41.super_class = (Class)HMDIDSMessageTransport;
  id v14 = [(HMDRemoteMessageTransport *)&v41 initWithAccountRegistry:a3];
  if (v14)
  {
    HMDispatchQueueNameString();
    id v15 = objc_claimAutoreleasedReturnValue();
    id v16 = (const char *)[v15 UTF8String];
    int v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create(v16, v17);
    workQueue = v14->_workQueue;
    v14->_workQueue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v14->_service, a4);
    objc_storeStrong((id *)&v14->_appleAccountManager, a5);
    objc_storeStrong((id *)&v14->_remoteAccountManager, a6);
    id v20 = objc_alloc(MEMORY[0x263F425E0]);
    uint64_t v21 = [(id)objc_opt_class() sendMessageLimit];
    uint64_t v22 = [(id)objc_opt_class() sendMessageRate];
    uint64_t v24 = objc_msgSend(v20, "initWithLimit:rate:", v21, v22, v23);
    sendMessageBudget = v14->_sendMessageBudget;
    v14->_sendMessageBudget = (HMFOperationBudget *)v24;

    uint64_t v26 = [MEMORY[0x263EFF980] array];
    messageContexts = v14->_messageContexts;
    v14->_messageContexts = (NSMutableArray *)v26;

    uint64_t v28 = [MEMORY[0x263EFF9A0] dictionary];
    pendingResponses = v14->_pendingResponses;
    v14->_pendingResponses = (NSMutableDictionary *)v28;

    uint64_t v30 = [MEMORY[0x263EFF9A0] dictionary];
    receivedResponses = v14->_receivedResponses;
    v14->_receivedResponses = (NSMutableDictionary *)v30;

    uint64_t v32 = [MEMORY[0x263EFF9A0] dictionary];
    requestedCapabilities = v14->_requestedCapabilities;
    v14->_requestedCapabilities = (NSMutableDictionary *)v32;

    uint64_t v34 = [MEMORY[0x263EFF9A0] dictionary];
    destinationAddress = v14->_destinationAddress;
    v14->_destinationAddress = (NSMutableDictionary *)v34;

    uint64_t v36 = [MEMORY[0x263EFF9A0] dictionary];
    pendingResponseTimers = v14->_pendingResponseTimers;
    v14->_pendingResponseTimers = (NSMutableDictionary *)v36;

    uint64_t v38 = [objc_alloc(MEMORY[0x263EFF9B0]) initWithCapacity:30];
    messageDedupBuffer = v14->_messageDedupBuffer;
    v14->_messageDedupBuffer = (NSMutableOrderedSet *)v38;
  }
  return v14;
}

- (id)initLegacyTransportWithAccountRegistry:(id)a3 service:(id)a4 appleAccountManager:(id)a5 remoteAccountManager:(id)a6
{
  id result = [(HMDIDSMessageTransport *)self initWithAccountRegistry:a3 service:a4 appleAccountManager:a5 remoteAccountManager:a6];
  if (result) {
    *((unsigned char *)result + 80) = 1;
  }
  return result;
}

- (id)initLegacyTransportWithAccountRegistry:(id)a3
{
  id v4 = a3;
  int v5 = +[HMDIDSServiceManager sharedManager];
  id v6 = [v5 legacyService];
  BOOL v7 = +[HMDAppleAccountManager sharedManager];
  char v8 = +[HMDRemoteAccountManager sharedManager];
  id v9 = [(HMDIDSMessageTransport *)self initLegacyTransportWithAccountRegistry:v4 service:v6 appleAccountManager:v7 remoteAccountManager:v8];

  return v9;
}

- (id)initHMMMEnergyWithAccountRegistry:(id)a3
{
  id v4 = a3;
  int v5 = +[HMDIDSServiceManager sharedManager];
  id v6 = [v5 hmmmEnergyService];
  BOOL v7 = +[HMDAppleAccountManager sharedManager];
  char v8 = +[HMDRemoteAccountManager sharedManager];
  id v9 = [(HMDIDSMessageTransport *)self initWithAccountRegistry:v4 service:v6 appleAccountManager:v7 remoteAccountManager:v8];

  return v9;
}

- (id)initHMMMWithAccountRegistry:(id)a3
{
  id v4 = a3;
  int v5 = +[HMDIDSServiceManager sharedManager];
  id v6 = [v5 hmmmService];
  BOOL v7 = +[HMDAppleAccountManager sharedManager];
  char v8 = +[HMDRemoteAccountManager sharedManager];
  id v9 = [(HMDIDSMessageTransport *)self initWithAccountRegistry:v4 service:v6 appleAccountManager:v7 remoteAccountManager:v8];

  return v9;
}

- (HMDIDSMessageTransport)initWithAccountRegistry:(id)a3
{
  id v4 = a3;
  int v5 = +[HMDIDSServiceManager sharedManager];
  id v6 = [v5 service];
  BOOL v7 = +[HMDAppleAccountManager sharedManager];
  char v8 = +[HMDRemoteAccountManager sharedManager];
  id v9 = [(HMDIDSMessageTransport *)self initWithAccountRegistry:v4 service:v6 appleAccountManager:v7 remoteAccountManager:v8];

  return v9;
}

+ (id)queueOneIdentifierWithMessageName:(id)a3 target:(id)a4 collapseID:(id)a5 timeToLive:(double)a6 now:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v13)
  {
LABEL_9:
    id v40 = (void *)_HMFPreconditionFailure();
    return sha256(v40, v41, v42, v43, v44, v45, v46, v47, v51);
  }
  id v15 = v14;
  uint64_t v23 = (void *)MEMORY[0x230FBD990]();
  double v24 = fmax(a6 * 3.0, 28800.0);
  if (v24 > 604800.0) {
    double v24 = 604800.0;
  }
  unint64_t v25 = (uint64_t)v24;
  unint64_t v49 = 0;
  uint64_t v26 = sha256(@"Q1Offset", v16, v17, v18, v19, v20, v21, v22, (uint64_t)v11);
  [v26 getBytes:&v49 length:8];

  unint64_t v27 = v49 % v25;
  [v15 timeIntervalSinceReferenceDate];
  unint64_t v48 = (v27 + (unint64_t)v28) / v25;
  id v29 = [MEMORY[0x263EFF8F8] dataWithBytes:&v48 length:8];
  uint64_t v37 = sha256(@"Q1Id", v30, v31, v32, v33, v34, v35, v36, (uint64_t)v29);
  uint64_t v38 = objc_msgSend(v37, "hmf_hexadecimalRepresentation");

  return v38;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_49517 != -1) {
    dispatch_once(&logCategory__hmf_once_t2_49517, &__block_literal_global_49518);
  }
  v2 = (void *)logCategory__hmf_once_v3_49519;
  return v2;
}

void __37__HMDIDSMessageTransport_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v3_49519;
  logCategory__hmf_once_v3_49519 = v0;
}

+ (_HMFRate)sendMessageRate
{
  id v3 = [MEMORY[0x263F42608] sharedPreferences];
  id v4 = [v3 preferenceForKey:@"remoteSendMessageRate"];

  int v5 = [v4 numberValue];
  [v5 doubleValue];
  double v7 = v6;

  if (v7 <= 0.0)
  {
    double v10 = 60.0;
  }
  else
  {
    char v8 = [v4 numberValue];
    [v8 doubleValue];
    double v10 = v9;
  }
  unint64_t v11 = (unint64_t)((double)(unint64_t)[a1 sendMessageLimit] / v10);

  unint64_t v12 = v11;
  double v13 = v10;
  result.period = v13;
  result.value = v12;
  return result;
}

+ (unint64_t)sendMessageLimit
{
  v2 = [MEMORY[0x263F42608] sharedPreferences];
  id v3 = [v2 preferenceForKey:@"remoteSendMessageLimit"];

  id v4 = [v3 numberValue];
  uint64_t v5 = [v4 unsignedIntegerValue];

  if (v5)
  {
    double v6 = [v3 numberValue];
    unint64_t v7 = [v6 unsignedIntegerValue];
  }
  else
  {
    unint64_t v7 = 1800;
  }

  return v7;
}

+ (int64_t)priorityForMessage:(id)a3
{
  return 300;
}

+ (unint64_t)restriction
{
  return 1;
}

@end