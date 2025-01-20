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
- (BOOL)isModernTransport;
- (BOOL)isSecure;
- (BOOL)isValidMessage:(id)a3;
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
- (id)deviceForSenderContext:(id)a3;
- (id)initModernTransportWithAccountRegistry:(id)a3;
- (id)initModernTransportWithAccountRegistry:(id)a3 service:(id)a4 appleAccountManager:(id)a5 remoteAccountManager:(id)a6;
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

- (BOOL)isModernTransport
{
  return self->_modernTransport;
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
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if (v16)
  {
    v19 = [(HMDIDSMessageTransport *)self messageContexts];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __86__HMDIDSMessageTransport_service_account_identifier_didSendWithSuccess_error_context___block_invoke;
    v46[3] = &unk_1E6A097C8;
    id v20 = v16;
    id v47 = v20;
    v21 = objc_msgSend(v19, "hmf_objectPassingTest:", v46);

    if (v21)
    {
      id v42 = v14;
      if (v17)
      {
        v22 = (void *)MEMORY[0x1E4F28C58];
        v23 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:3203 underlyingError:v17];
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
        context = (void *)MEMORY[0x1D9452090](v26);
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
          _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to send message with IDS GUID %{public}@ from account: %{private}@ with error: %@", buf, 0x2Au);

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
          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 3221225472;
          v44[2] = __86__HMDIDSMessageTransport_service_account_identifier_didSendWithSuccess_error_context___block_invoke_115;
          v44[3] = &unk_1E6A16928;
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

void __86__HMDIDSMessageTransport_service_account_identifier_didSendWithSuccess_error_context___block_invoke_115(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 remoteAccountManager];
  objc_msgSend(v5, "__handleSendMessageFailureWithError:destination:", *(void *)(a1 + 40), v4);
}

- (void)legacyHandleIncomingRemoteMessage:(id)a3 sourceDevice:(id)a4 senderDeviceHandle:(id)a5 isSecure:(BOOL)a6 incomingMessage:(id)a7 fromID:(id)a8 context:(id)a9
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
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
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __132__HMDIDSMessageTransport_legacyHandleIncomingRemoteMessage_sourceDevice_senderDeviceHandle_isSecure_incomingMessage_fromID_context___block_invoke;
    aBlock[3] = &unk_1E6A097A0;
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
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __132__HMDIDSMessageTransport_legacyHandleIncomingRemoteMessage_sourceDevice_senderDeviceHandle_isSecure_incomingMessage_fromID_context___block_invoke_110;
    v83[3] = &unk_1E6A17958;
    v37 = &v84;
    objc_copyWeak(&v84, &location);
    v83[4] = v16;
    v24 = (void (**)(void, void, void))_Block_copy(v83);
    goto LABEL_14;
  }
  id v18 = (void *)MEMORY[0x1D9452090]();
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
    _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Received response to IDS message with transaction ID: %{public}@", buf, 0x16u);
  }
  v23 = [(HMDIDSMessageTransport *)v19 pendingResponses];
  v24 = [v23 objectForKeyedSubscript:v17];

  if (v24)
  {
    v25 = (void *)MEMORY[0x1E4F1CA60];
    uint64_t v26 = objc_msgSend(v81, "hmf_dictionaryForKey:", @"kIDSMessagePayloadKey");
    v27 = [v25 dictionaryWithDictionary:v26];

    [v27 setObject:v77 forKeyedSubscript:@"kIDSMessageSourceIDKey"];
    v28 = objc_msgSend(v81, "hmf_dataForKey:", @"kIDSMessageResponseErrorDataKey");
    if (v28)
    {
      v29 = (void *)MEMORY[0x1E4F28DC0];
      v30 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
      id v85 = 0;
      uint64_t v31 = [v29 _strictlyUnarchivedObjectOfClasses:v30 fromData:v28 error:&v85];
      id v32 = v85;

      if (!v31)
      {
        context = (void *)MEMORY[0x1D9452090]();
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
          _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize error with error: %@", buf, 0x16u);
        }
        uint64_t v31 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52 description:@"Generic error." reason:@"Failed to deserialize remote error." suggestion:0 underlyingError:v32];
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
          id v55 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v58 = [(HMDIDSMessageTransport *)v19 receivedResponses];
          [v58 setObject:v55 forKeyedSubscript:v17];
        }
        objc_msgSend(v55, "addObject:", v27, v74);
        uint64_t v59 = [v55 count];
        if ([(HMDRemoteMessageTransport *)v19 doesResponse:v27 matchAllCapabilities:contexta])
        {
          v60 = (void *)MEMORY[0x1D9452090]();
          v61 = v19;
          HMFGetOSLogHandle();
          v62 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            v63 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            uint64_t v96 = (uint64_t)v63;
            _os_log_impl(&dword_1D49D5000, v62, OS_LOG_TYPE_INFO, "%{public}@Response Matched all capabilities", buf, 0xCu);
          }
          [(HMDIDSMessageTransport *)v61 _removePendingResponseTimerForTransaction:v17];
          [(HMDIDSMessageTransport *)v61 _pendingResponseTimeoutFor:v17];
        }
        else
        {
          v64 = (void *)MEMORY[0x1D9452090]([(HMDIDSMessageTransport *)v19 _restartPendingResponseTimerFor:v17 withReducedFactor:v59 + 1]);
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
            _os_log_impl(&dword_1D49D5000, v66, OS_LOG_TYPE_INFO, "%{public}@Not Calling response handler with response %@", buf, 0x16u);
          }
          v68 = (void *)MEMORY[0x1D9452090]();
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
            _os_log_impl(&dword_1D49D5000, v70, OS_LOG_TYPE_INFO, "%{public}@Currently received responses = %lu", buf, 0x16u);
          }
        }

        goto LABEL_44;
      }
      v48 = (void *)MEMORY[0x1D9452090]();
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
        _os_log_impl(&dword_1D49D5000, v50, OS_LOG_TYPE_INFO, "%{public}@Received response to directed message - selecting response from %{mask.hash}@", buf, 0x20u);
      }
    }
    else
    {
      v48 = (void *)MEMORY[0x1D9452090]();
      __int16 v52 = v19;
      HMFGetOSLogHandle();
      __int16 v50 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        id v53 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v96 = (uint64_t)v53;
        _os_log_impl(&dword_1D49D5000, v50, OS_LOG_TYPE_INFO, "%{public}@No Capabilities were requested - selecting the first response", buf, 0xCu);
      }
    }

    ((void (**)(void, void *, void *))v24)[2](v24, v74, v27);
    [(HMDIDSMessageTransport *)v19 _removePendingResponseTransaction:v17];
LABEL_44:

    goto LABEL_45;
  }
  v38 = (void *)MEMORY[0x1D9452090]();
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
    _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_INFO, "%{public}@No response handler, dropping message: %@", buf, 0x16u);
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
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __132__HMDIDSMessageTransport_legacyHandleIncomingRemoteMessage_sourceDevice_senderDeviceHandle_isSecure_incomingMessage_fromID_context___block_invoke_2;
    v10[3] = &unk_1E6A09778;
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

void __132__HMDIDSMessageTransport_legacyHandleIncomingRemoteMessage_sourceDevice_senderDeviceHandle_isSecure_incomingMessage_fromID_context___block_invoke_110(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x1D9452090]();
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
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Command %{public}@ completed with error: %@", (uint8_t *)&v13, 0x20u);
  }
}

void __132__HMDIDSMessageTransport_legacyHandleIncomingRemoteMessage_sourceDevice_senderDeviceHandle_isSecure_incomingMessage_fromID_context___block_invoke_2(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v2 = [[HMDRemoteMessage alloc] initWithName:*(void *)(a1 + 32) destination:*(void *)(a1 + 40) payload:*(void *)(a1 + 48) type:1 timeout:*(unsigned __int8 *)(a1 + 104) secure:0.0];
  [(HMDRemoteMessage *)v2 setTransactionIdentifier:*(void *)(a1 + 56)];
  id v42 = 0;
  v3 = +[HMDRemoteMessageSerialization dictionaryForMessage:v2 error:&v42];
  id v4 = v42;
  id v5 = (void *)[v3 mutableCopy];

  uint64_t v6 = *(void *)(a1 + 64);
  if (v6)
  {
    v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];
    [v5 setObject:v7 forKeyedSubscript:@"kIDSMessageResponseErrorDataKey"];
  }
  if ([*(id *)(a1 + 72) fromServerStorage])
  {
    uint64_t v8 = 0;
  }
  else
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
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
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Responding to non-server storage message, %{public}@ (%{public}@), as direct message", buf, 0x20u);
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
  v24 = (void *)MEMORY[0x1D9452090]();
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
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@IDS message response ack'd with identifier %{public}@", buf, 0x16u);
    }
    uint64_t v31 = [HMDIDSMessageContext alloc];
    id v32 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v23];
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
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@IDS message response, %@, failed with error: %@", buf, 0x20u);

      id v4 = v37;
      v2 = v36;
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v165 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v150 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = [v15 originalGUID];
  if (!v16)
  {
LABEL_12:
    if (self && [(HMDIDSMessageTransport *)self isModernTransport])
    {
      id v32 = (void *)MEMORY[0x1D9452090]();
      v33 = self;
      v34 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_19;
      }
      uint64_t v35 = HMFGetLogIdentifier();
      v36 = [v13 shortDescription];
      *(_DWORD *)buf = 138544130;
      v154 = v35;
      __int16 v155 = 2112;
      uint64_t v156 = (uint64_t)v36;
      __int16 v157 = 2160;
      uint64_t v158 = 1752392040;
      __int16 v159 = 2112;
      uint64_t v160 = (uint64_t)v14;
      id v37 = v34;
      os_log_type_t v38 = OS_LOG_TYPE_DEBUG;
    }
    else
    {
      id v32 = (void *)MEMORY[0x1D9452090]();
      v33 = self;
      v34 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_INFO)) {
        goto LABEL_19;
      }
      uint64_t v35 = HMFGetLogIdentifier();
      v36 = [v13 shortDescription];
      *(_DWORD *)buf = 138544130;
      v154 = v35;
      __int16 v155 = 2112;
      uint64_t v156 = (uint64_t)v36;
      __int16 v157 = 2160;
      uint64_t v158 = 1752392040;
      __int16 v159 = 2112;
      uint64_t v160 = (uint64_t)v14;
      id v37 = v34;
      os_log_type_t v38 = OS_LOG_TYPE_INFO;
    }
    _os_log_impl(&dword_1D49D5000, v37, v38, "%{public}@Received incoming IDS message: %@, from: %{mask.hash}@", buf, 0x2Au);

LABEL_19:
    v39 = [v13 objectForKeyedSubscript:@"kIDSMessageNameKey"];
    id v40 = [MEMORY[0x1E4F65520] sharedPowerLogger];
    [v40 reportIncomingIDSPush:v39 fromToken:v14];

    if (!v14)
    {
      v108 = (void *)MEMORY[0x1D9452090]();
      v109 = self;
      v110 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v110, OS_LOG_TYPE_FAULT))
      {
        v111 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v154 = v111;
        _os_log_impl(&dword_1D49D5000, v110, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Received incoming message with nil fromID", buf, 0xCu);
      }
      v112 = [[HMDAssertionLogEvent alloc] initWithReason:@"Received incoming message with nil fromID"];
      v113 = +[HMDMetricsManager sharedLogEventSubmitter];
      [v113 submitLogEvent:v112];

      v114 = (void *)MEMORY[0x1D9452090]();
      v115 = v109;
      v116 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
      {
        v117 = HMFGetLogIdentifier();
        [v15 originalGUID];
        v119 = id v118 = v12;
        *(_DWORD *)buf = 138543618;
        v154 = v117;
        __int16 v155 = 2114;
        uint64_t v156 = (uint64_t)v119;
        _os_log_impl(&dword_1D49D5000, v116, OS_LOG_TYPE_ERROR, "%{public}@Received incoming message, %{public}@, with nil fromID", buf, 0x16u);

        id v12 = v118;
      }

      v27 = v150;
      goto LABEL_58;
    }
    id v41 = +[HMDDeviceHandle deviceHandleForDestination:v14];
    id v42 = +[HMDAccountHandle accountHandleForDestination:v14];
    uint64_t v43 = +[HMDAccountIdentifier accountIdentifierForMessageContext:v15];
    id v152 = v13;
    id v148 = v12;
    BOOL v44 = [(HMDIDSMessageTransport *)self _shouldProcessLegacyIDSMessageFromID:v14 context:v15 message:&v152 service:v12];
    id v45 = v152;

    v149 = v15;
    if (!v44)
    {
      __int16 v50 = (void *)v43;
      id v51 = (void *)MEMORY[0x1D9452090]();
      __int16 v52 = self;
      id v53 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        __int16 v54 = HMFGetLogIdentifier();
        [v149 senderCorrelationIdentifier];
        v145 = v41;
        id v55 = v14;
        id v56 = v45;
        id v57 = v39;
        uint64_t v59 = v58 = v42;
        *(_DWORD *)buf = 138543874;
        v154 = v54;
        __int16 v155 = 2114;
        uint64_t v156 = (uint64_t)v57;
        __int16 v157 = 2112;
        uint64_t v158 = (uint64_t)v59;
        _os_log_impl(&dword_1D49D5000, v53, OS_LOG_TYPE_ERROR, "%{public}@Dropping incoming message %{public}@ from unknown mergeID %@", buf, 0x20u);

        id v42 = v58;
        v39 = v57;
        id v45 = v56;
        id v14 = v55;
        id v41 = v145;
      }
      v27 = v150;
      goto LABEL_57;
    }
    v147 = v39;
    id v151 = 0;
    v46 = +[HMDRemoteMessageSerialization remoteMessageWithDictionary:v45 error:&v151];
    id v47 = v151;
    if (v46)
    {
      uint64_t v48 = [(HMDIDSMessageTransport *)self isSecure];
      if (v48) {
        uint64_t v48 = [v46 setSecure:1];
      }
      if (v41)
      {
        v143 = v45;
        if ([v46 isSecure])
        {
          uint64_t v49 = [v46 sourceVersion];

          if (v49)
          {
            uint64_t v49 = [v46 sourceVersion];
          }
        }
        else
        {
          uint64_t v49 = 0;
        }
        id v137 = v47;
        v146 = v41;
        v142 = v42;
        v138 = (void *)v43;
        v140 = [[HMDRemoteMessageSenderContext alloc] initWithDeviceHandle:v41 accountHandle:v42 accountIdentifier:v43 deviceVersion:v49 pairingIdentityIdentifier:0];
        uint64_t v66 = -[HMDIDSMessageTransport deviceForSenderContext:](self, "deviceForSenderContext:");
        if (v66)
        {
          v67 = (void *)v66;

          v68 = (void *)MEMORY[0x1E4F1CA60];
          v69 = [v46 messagePayload];
          v70 = [v68 dictionaryWithDictionary:v69];

          [v70 setObject:v14 forKeyedSubscript:@"kIDSMessageSourceIDKey"];
          v136 = v70;
          [v46 setMessagePayload:v70];
          objc_msgSend(v46, "setRestriction:", objc_msgSend((id)objc_opt_class(), "restriction"));
          uint64_t v71 = [v46 isSecure];
          uint64_t v72 = [HMDRemoteDeviceMessageDestination alloc];
          v73 = [v46 destination];
          v74 = [v73 target];
          v139 = v67;
          v75 = [(HMDRemoteDeviceMessageDestination *)v72 initWithTarget:v74 device:v67];

          [v46 setDestination:v75];
          if ((v71 & 1) != 0
            || !+[HMDSecureRemoteSession isSecureRemoteSessionMessage:v46])
          {
            v76 = +[HMDMetricsManager sharedLogEventSubmitter];
            id v77 = +[HMDRemoteMessageLogEvent receivedRemoteMessage:v46 transportType:[(HMDIDSMessageTransport *)self transportType]];
            [v76 submitLogEvent:v77];
          }
          id v78 = [v46 userInfo];
          id v79 = (void *)[v78 mutableCopy];

          v80 = objc_msgSend(NSNumber, "numberWithInt:", -[HMDIDSMessageTransport transportType](self, "transportType"));
          [v79 setObject:v80 forKeyedSubscript:@"kRemoteMessageTransportAttributionKey"];

          if (self && [(HMDIDSMessageTransport *)self isModernTransport])
          {
            id v81 = [(HMDRemoteMessageSenderContext *)v140 deviceHandle];
            [(HMDRemoteDeviceMessageDestination *)v75 setPreferredHandle:v81];

            uint64_t v135 = objc_msgSend(v143, "hmf_stringForKey:", @"idsId");
            id v82 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v135];
            id v83 = v139;
            id v84 = v82;
            id v85 = v83;
            v86 = v84;
            id v42 = v142;
            if (v84)
            {
              v133 = v75;
              id v134 = v84;
              [v83 account];
              v88 = id v87 = v83;
              int v89 = [v88 isCurrentAccount];

              if (v89)
              {
                id v90 = (void *)MEMORY[0x1D9452090]();
                id v91 = self;
                id v92 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
                {
                  HMFGetLogIdentifier();
                  v93 = id contexta = v91;
                  *(_DWORD *)buf = 138543618;
                  v154 = v93;
                  __int16 v155 = 2112;
                  uint64_t v156 = (uint64_t)v87;
                  _os_log_impl(&dword_1D49D5000, v92, OS_LOG_TYPE_DEBUG, "%{public}@Not updating IDS device identifier for device because it belongs to the current account: %@", buf, 0x16u);

                  id v91 = contexta;
                }

                id v85 = v87;
                v75 = v133;
                v86 = v134;
              }
              else
              {
                uint64_t v98 = [v87 sharedUserIDSIdentifier];
                v86 = v134;
                int v99 = [v98 isEqual:v134];

                id v85 = v87;
                v75 = v133;
                if ((v99 & 1) == 0)
                {
                  context = (void *)MEMORY[0x1D9452090]();
                  id v100 = self;
                  uint64_t v101 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
                  {
                    v102 = HMFGetLogIdentifier();
                    v103 = [v85 sharedUserIDSIdentifier];
                    *(_DWORD *)buf = 138544642;
                    v154 = v102;
                    __int16 v155 = 2160;
                    uint64_t v156 = 1752392040;
                    __int16 v157 = 2112;
                    uint64_t v158 = (uint64_t)v134;
                    __int16 v159 = 2160;
                    uint64_t v160 = 1752392040;
                    __int16 v161 = 2112;
                    id v162 = v103;
                    __int16 v163 = 2112;
                    v164 = v85;
                    _os_log_impl(&dword_1D49D5000, v101, OS_LOG_TYPE_DEFAULT, "%{public}@Setting shared user's IDS device identifier to: %{mask.hash}@, was: %{mask.hash}@, for device: %@", buf, 0x3Eu);

                    id v42 = v142;
                    v75 = v133;
                  }

                  v86 = v134;
                  [v85 setSharedUserIDSIdentifier:v134];
                }
              }
            }

            uint64_t v96 = (void *)v135;
            [v79 setObject:v14 forKeyedSubscript:@"kIDSMessageSourceIDKey"];
            v104 = [v15 toID];
            [v79 setObject:v104 forKeyedSubscript:@"kRemoteMessageIDSToIDKey"];

            v105 = objc_msgSend(v143, "hmf_dataForKey:", @"kIDSMessageResponseErrorDataKey");
            [v79 setObject:v105 forKeyedSubscript:@"kIDSMessageResponseErrorDataKey"];

            v106 = [v46 internal];
            [v106 setUserInfo:v79];

            [v46 setSenderContext:v140];
            v107 = [(HMFMessageTransport *)self delegate];
            [v107 messageTransport:self didReceiveMessage:v46];

            v95 = v140;
            __int16 v97 = v139;
          }
          else
          {
            v94 = [v46 internal];
            [v94 setUserInfo:v79];

            v95 = v140;
            [v46 setSenderContext:v140];
            uint64_t v96 = [(HMDRemoteMessageSenderContext *)v140 deviceHandle];
            id v130 = v15;
            __int16 v97 = v139;
            [(HMDIDSMessageTransport *)self legacyHandleIncomingRemoteMessage:v46 sourceDevice:v139 senderDeviceHandle:v96 isSecure:v71 incomingMessage:v143 fromID:v14 context:v130];
            id v42 = v142;
          }

          v27 = v150;
          id v41 = v146;
        }
        else
        {
          v120 = (void *)MEMORY[0x1D9452090]();
          v121 = self;
          v122 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v122, OS_LOG_TYPE_FAULT))
          {
            v123 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v154 = v123;
            _os_log_impl(&dword_1D49D5000, v122, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Failed to determine source device", buf, 0xCu);
          }
          v124 = [[HMDAssertionLogEvent alloc] initWithReason:@"Failed to determine source device"];
          v125 = +[HMDMetricsManager sharedLogEventSubmitter];
          [v125 submitLogEvent:v124];

          v126 = (void *)MEMORY[0x1D9452090]();
          v127 = v121;
          v128 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
          {
            v129 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v154 = v129;
            __int16 v155 = 2112;
            uint64_t v156 = (uint64_t)v46;
            _os_log_impl(&dword_1D49D5000, v128, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine source device, dropping message: %@", buf, 0x16u);
          }

          v27 = v150;
          id v42 = v142;
        }
        id v47 = v137;
        __int16 v50 = v138;
        id v45 = v143;
        goto LABEL_56;
      }
      __int16 v50 = (void *)v43;
      v60 = (void *)MEMORY[0x1D9452090](v48);
      v61 = self;
      v62 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v144 = v45;
        v65 = v64 = v42;
        *(_DWORD *)buf = 138543874;
        v154 = v65;
        __int16 v155 = 2160;
        uint64_t v156 = 1752392040;
        __int16 v157 = 2112;
        uint64_t v158 = (uint64_t)v14;
        _os_log_impl(&dword_1D49D5000, v62, OS_LOG_TYPE_ERROR, "%{public}@Unable to create sender device handle from fromID: %{mask.hash}@", buf, 0x20u);

        id v42 = v64;
        id v45 = v144;
      }
    }
    else
    {
      __int16 v50 = (void *)v43;
      v60 = (void *)MEMORY[0x1D9452090]();
      v61 = self;
      v62 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v63 = v141 = v42;
        *(_DWORD *)buf = 138544386;
        v154 = v63;
        __int16 v155 = 2112;
        uint64_t v156 = (uint64_t)v45;
        __int16 v157 = 2160;
        uint64_t v158 = 1752392040;
        __int16 v159 = 2112;
        uint64_t v160 = (uint64_t)v14;
        __int16 v161 = 2112;
        id v162 = v47;
        _os_log_impl(&dword_1D49D5000, v62, OS_LOG_TYPE_ERROR, "%{public}@Dropping invalid IDS message payload, %@, from: %{mask.hash}@, error: %@", buf, 0x34u);

        id v42 = v141;
      }
    }

    v27 = v150;
LABEL_56:

    v39 = v147;
LABEL_57:

    id v13 = v45;
    id v12 = v148;
    id v15 = v149;
LABEL_58:

    goto LABEL_59;
  }
  char v17 = (void *)v16;
  id v18 = [v15 originalGUID];
  uint64_t v19 = v18;
  if (!self || !v18)
  {
LABEL_11:

    goto LABEL_12;
  }
  char v20 = [(HMDIDSMessageTransport *)self messageDedupBuffer];
  char v21 = [v20 containsObject:v19];

  if ((v21 & 1) == 0)
  {
    v28 = [(HMDIDSMessageTransport *)self messageDedupBuffer];
    unint64_t v29 = [v28 count];

    if (v29 >= 0x1E)
    {
      v30 = [(HMDIDSMessageTransport *)self messageDedupBuffer];
      [v30 removeObjectAtIndex:0];
    }
    uint64_t v31 = [(HMDIDSMessageTransport *)self messageDedupBuffer];
    [v31 addObject:v19];

    goto LABEL_11;
  }

  v22 = (void *)MEMORY[0x1D9452090]();
  v23 = self;
  v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    id v25 = HMFGetLogIdentifier();
    uint64_t v26 = [v15 originalGUID];
    *(_DWORD *)buf = 138543618;
    v154 = v25;
    __int16 v155 = 2114;
    uint64_t v156 = (uint64_t)v26;
    _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Received duplicate message with GUID: %{public}@", buf, 0x16u);
  }
  v27 = v150;
LABEL_59:
}

- (BOOL)_shouldProcessLegacyIDSMessageFromID:(id)a3 context:(id)a4 message:(id *)a5 service:(id)a6
{
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
    goto LABEL_15;
  }
  if (!self || ![(HMDIDSMessageTransport *)self isModernTransport])
  {
    uint64_t v16 = [(HMDIDSMessageTransport *)self appleAccountManager];
    id v14 = [v16 account];

    char v17 = [v11 senderCorrelationIdentifier];
    id v18 = *a5;
    uint64_t v19 = [v18 objectForKeyedSubscript:@"kIDSMessagePayloadKey"];
    uint64_t v35 = [v18 objectForKeyedSubscript:@"kIDSMessageNameKey"];
    id v37 = [(HMDRemoteMessageTransport *)self homeMembershipVerifier];
    v36 = +[HMDDeviceHandle deviceHandleForDestination:v10];
    char v20 = +[HMDAccountHandle accountHandleForDestination:v10];
    char v21 = [v14 senderCorrelationIdentifier];
    if ([v21 isEqual:v17])
    {
      char v15 = 1;
    }
    else
    {
      v33 = v19;
      v34 = v17;
      v22 = [v14 handles];
      char v23 = [v22 containsObject:v20];

      if (v23) {
        goto LABEL_13;
      }
      v24 = [(HMDIDSMessageTransport *)self pendingResponses];
      id v25 = objc_msgSend(v18, "hmf_UUIDForKey:", @"kIDSMessageRequestTransactionIDKey");
      uint64_t v26 = [v24 objectForKey:v25];

      if (v26)
      {
LABEL_13:
        char v15 = 1;
        uint64_t v19 = v33;
        char v17 = v34;
        goto LABEL_14;
      }
      char v21 = +[HMDAccountIdentifier accountIdentifierForMessageContext:v11];
      v28 = [[HMDRemoteMessageSenderContext alloc] initWithDeviceHandle:v36 accountHandle:v20 accountIdentifier:v21 deviceVersion:0 pairingIdentityIdentifier:0];
      unint64_t v29 = [(HMDIDSMessageTransport *)self remoteAccountManager];
      id v32 = v28;
      id v30 = (id)[v29 deviceForSenderContext:v28];

      char v17 = v34;
      if ([v37 userWithMergeIdIsMemberOfAHome:v34])
      {
        char v15 = 1;
        uint64_t v19 = v33;
      }
      else
      {
        uint64_t v19 = v33;
        uint64_t v31 = objc_msgSend(v33, "hmf_UUIDForKey:", @"kInvitationIdentifierKey");
        if (objc_msgSend(v37, "expectingInvitationResponseForIdentifier:")) {
          char v15 = 1;
        }
        else {
          char v15 = [v35 isEqual:@"kAccessHomeInviteRequestKey"];
        }
      }
    }

LABEL_14:
LABEL_15:

    goto LABEL_16;
  }
  char v15 = 1;
LABEL_16:

  return v15;
}

- (void)_removePendingResponseTransaction:(id)a3
{
  id v7 = a3;
  id v4 = [(HMDIDSMessageTransport *)self pendingResponses];
  [v4 removeObjectForKey:v7];

  id v5 = [(HMDIDSMessageTransport *)self requestedCapabilities];
  [v5 removeObjectForKey:v7];

  uint64_t v6 = [(HMDIDSMessageTransport *)self destinationAddress];
  [v6 removeObjectForKey:v7];

  [(HMDIDSMessageTransport *)self _removePendingResponseTimerForTransaction:v7];
}

- (void)_removePendingResponseTimerForTransaction:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  uint64_t v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v12 = 138543618;
    id v13 = v8;
    __int16 v14 = 2114;
    id v15 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Cancelling timer for transaction: %{public}@", (uint8_t *)&v12, 0x16u);
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
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (fabs(a4) < 2.22044605e-16 || a4 <= 0.0) {
    unint64_t v11 = remotePendingResponseTimerNanoseconds;
  }
  else {
    unint64_t v11 = (uint64_t)(a4 * 1000000000.0);
  }
  int v12 = [(HMDIDSMessageTransport *)self workQueue];
  id v13 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v12);

  dispatch_time_t v14 = dispatch_time(0, v11);
  dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, remotePendingResponseLeewayNanoseconds);
  objc_initWeak(&location, self);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __80__HMDIDSMessageTransport__startPendingResponseTimer_responseTimeout_identifier___block_invoke;
  handler[3] = &unk_1E6A16CE0;
  objc_copyWeak(&v24, &location);
  id v15 = v8;
  id v23 = v15;
  dispatch_source_set_event_handler(v13, handler);
  dispatch_resume(v13);
  uint64_t v16 = (void *)MEMORY[0x1D9452090]();
  char v17 = self;
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
    unint64_t v29 = v20;
    __int16 v30 = 2048;
    unint64_t v31 = v11 / 0x3B9ACA00;
    _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Starting poll to track response for message with transaction %{public}@ for %lld secs", buf, 0x20u);
  }
  char v21 = [(HMDIDSMessageTransport *)v17 pendingResponseTimers];
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
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  uint64_t v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [v4 UUIDString];
    int v26 = 138543618;
    id v27 = v8;
    __int16 v28 = 2114;
    unint64_t v29 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Pending Response timeout for transaction: %{public}@", (uint8_t *)&v26, 0x16u);
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
    char v17 = [v16 objectForKeyedSubscript:v4];

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
      char v20 = (void *)MEMORY[0x1D9452090]();
      char v21 = v6;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        id v23 = HMFGetLogIdentifier();
        int v26 = 138543362;
        id v27 = v23;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@ Selecting response based on requested capabilities", (uint8_t *)&v26, 0xCu);
      }
      id v24 = [(HMDRemoteMessageTransport *)v21 matchResponse:v15 requestedCapabilities:v19];
      id v25 = [v24 objectForKeyedSubscript:@"kIDSMessageResponseErrorDataKey"];
      ((void (**)(void, void *, void *))v11)[2](v11, v25, v24);
    }
    else
    {
      id v24 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:8 userInfo:0];
      ((void (**)(void, void *, void))v11)[2](v11, v24, 0);
    }
  }
  [(HMDIDSMessageTransport *)v6 _removePendingResponseTransaction:v4];
}

- (void)_restartPendingResponseTimerFor:(id)a3 withReducedFactor:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
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
    id v13 = (void *)MEMORY[0x1D9452090]();
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
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Restarted Pending response timer for %lld sec, for transaction: %{public}@", (uint8_t *)&v22, 0x20u);
    }
  }
  else
  {
    id v13 = (void *)MEMORY[0x1D9452090]();
    id v19 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      char v20 = HMFGetLogIdentifier();
      char v21 = [v6 UUIDString];
      int v22 = 138543618;
      id v23 = v20;
      __int16 v24 = 2114;
      unint64_t v25 = (unint64_t)v21;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Timer already expired for transaction: %{public}@", (uint8_t *)&v22, 0x16u);
    }
  }
}

- (id)sendMessage:(id)a3 fromHandle:(id)a4 destination:(id)a5 priority:(int64_t)a6 timeout:(double)a7 options:(unint64_t)a8 queueOneID:(id)a9 error:(id *)a10
{
  char v11 = a8;
  uint64_t v16 = a10;
  v97[1] = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = (HMDIDSMessageTransport *)a5;
  id v20 = a9;
  if (v19)
  {
    v75 = [(HMDIDSMessageTransport *)v19 allRemoteDestinationStrings];
    if (![v75 count])
    {
      unint64_t v31 = (void *)MEMORY[0x1D9452090]();
      uint64_t v32 = self;
      v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        uint64_t v35 = v34 = v20;
        *(_DWORD *)buf = 138543618;
        uint64_t v82 = (uint64_t)v35;
        __int16 v83 = 2112;
        id v84 = v19;
        _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_ERROR, "%{public}@No valid destination strings for destination: %@", buf, 0x16u);

        id v20 = v34;
        uint64_t v16 = a10;
      }

      if (!v16)
      {
        id v30 = 0;
LABEL_68:

        goto LABEL_69;
      }
      v73 = v19;
      v36 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v96 = *MEMORY[0x1E4F28A50];
      [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:3203];
      v22 = id v37 = v16;
      v97[0] = v22;
      id v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v97 forKeys:&v96 count:1];
      [v36 hmErrorWithCode:54 userInfo:v38];
      id v30 = 0;
      id *v37 = (id)objc_claimAutoreleasedReturnValue();
LABEL_67:

      id v19 = v73;
      goto LABEL_68;
    }
    char v21 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
    int v22 = v21;
    if (v11)
    {
      uint64_t v39 = MEMORY[0x1E4F1CC38];
      [v21 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F6A9A0]];
      [v22 setObject:v39 forKeyedSubscript:*MEMORY[0x1E4F6A9C0]];
      if ((v11 & 2) == 0)
      {
LABEL_5:
        if ((v11 & 8) == 0) {
          goto LABEL_6;
        }
        goto LABEL_20;
      }
    }
    else if ((v11 & 2) == 0)
    {
      goto LABEL_5;
    }
    [v22 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F6A9D0]];
    if ((v11 & 8) == 0)
    {
LABEL_6:
      if ((v11 & 4) == 0)
      {
LABEL_8:
        if (a7 <= 0.0)
        {
          if ((v11 & 2) == 0) {
            [v22 setObject:&unk_1F2DCB838 forKeyedSubscript:*MEMORY[0x1E4F6AA10]];
          }
        }
        else
        {
          __int16 v24 = [NSNumber numberWithDouble:a7];
          [v22 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F6AA10]];
        }
        [v22 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F6A9E8]];
        [v22 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F6A960]];
        uint64_t v72 = v17;
        v73 = v19;
        id v71 = v20;
        if (v18)
        {
          long long v79 = 0u;
          long long v80 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          id v40 = [(HMDIDSMessageTransport *)self service];
          id v41 = [v40 accounts];

          uint64_t v42 = [v41 countByEnumeratingWithState:&v77 objects:v95 count:16];
          if (v42)
          {
            uint64_t v43 = v42;
            uint64_t v44 = *(void *)v78;
            while (2)
            {
              for (uint64_t i = 0; i != v43; ++i)
              {
                if (*(void *)v78 != v44) {
                  objc_enumerationMutation(v41);
                }
                v46 = *(void **)(*((void *)&v77 + 1) + 8 * i);
                id v47 = objc_msgSend(v46, "hmd_handles");
                int v48 = [v47 containsObject:v18];

                if (v48)
                {
                  uint64_t v49 = [v18 URI];
                  __int16 v50 = [v49 prefixedURI];
                  [v22 setObject:v50 forKeyedSubscript:*MEMORY[0x1E4F6A9B8]];

                  id v38 = v46;
                  goto LABEL_35;
                }
              }
              uint64_t v43 = [v41 countByEnumeratingWithState:&v77 objects:v95 count:16];
              if (v43) {
                continue;
              }
              break;
            }
            id v38 = 0;
LABEL_35:
            id v17 = v72;
          }
          else
          {
            id v38 = 0;
          }
        }
        else
        {
          id v38 = 0;
        }
        if (self && [(HMDIDSMessageTransport *)self isModernTransport])
        {
          uint64_t v51 = objc_msgSend(v17, "hmf_stringForKey:", @"kIDSMessageIdentifierKey");
        }
        else
        {
          uint64_t v51 = [v17 shortDescription];
        }
        __int16 v52 = (HMDIDSMessageTransport *)v51;
        if (shouldLogPrivateInformation())
        {
          id v53 = v22;
        }
        else
        {
          __int16 v54 = (void *)[v22 mutableCopy];
          id v55 = [MEMORY[0x1E4F1C978] arrayWithObject:*MEMORY[0x1E4F6A9B8]];
          [v54 removeObjectsForKeys:v55];

          id v53 = (id)[v54 copy];
        }
        id v56 = (void *)MEMORY[0x1D9452090]();
        id v57 = self;
        v58 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          uint64_t v59 = HMFGetLogIdentifier();
          v60 = (void *)v59;
          switch(a6)
          {
            case 100:
              v61 = @"Sync";
              break;
            case 200:
              v61 = @"Default";
              break;
            case 300:
              v61 = @"Urgent";
              break;
            default:
              v61 = @"Unknown";
              break;
          }
          *(_DWORD *)buf = 138544899;
          uint64_t v82 = v59;
          __int16 v83 = 2114;
          id v84 = v52;
          __int16 v85 = 2160;
          uint64_t v86 = 1752392040;
          __int16 v87 = 2112;
          id v88 = v75;
          __int16 v89 = 2113;
          id v90 = v38;
          __int16 v91 = 2114;
          id v92 = v61;
          __int16 v93 = 2114;
          id v94 = v53;
          _os_log_impl(&dword_1D49D5000, v58, OS_LOG_TYPE_INFO, "%{public}@Sending IDS message %{public}@ to %{mask.hash}@, from account %{private}@ with priority, %{public}@, options: %{public}@", buf, 0x48u);
        }

        v62 = [(HMDIDSMessageTransport *)v57 service];
        v63 = [MEMORY[0x1E4F1CAD0] setWithArray:v75];
        id v76 = 0;
        id v17 = v72;
        char v64 = [v62 sendMessage:v72 fromAccount:v38 toDestinations:v63 priority:a6 options:v22 identifier:&v76 error:a10];
        id v30 = v76;

        if ((v64 & 1) == 0)
        {
          v65 = (void *)MEMORY[0x1D9452090]();
          uint64_t v66 = v57;
          v67 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
          {
            v68 = HMFGetLogIdentifier();
            if (self)
            {
              objc_msgSend(v72, "hmf_stringForKey:", @"kIDSMessageIdentifierKey");
              self = (HMDIDSMessageTransport *)objc_claimAutoreleasedReturnValue();
            }
            if (a10) {
              v69 = (__CFString *)*a10;
            }
            else {
              v69 = @"<nil>";
            }
            *(_DWORD *)buf = 138543874;
            uint64_t v82 = (uint64_t)v68;
            __int16 v83 = 2114;
            id v84 = self;
            __int16 v85 = 2112;
            uint64_t v86 = (uint64_t)v69;
            _os_log_impl(&dword_1D49D5000, v67, OS_LOG_TYPE_INFO, "%{public}@Failed to send IDS message %{public}@ due to error: %@", buf, 0x20u);
          }

          id v30 = 0;
        }
        id v20 = v71;
        goto LABEL_67;
      }
LABEL_7:
      id v23 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F6A938]];
      [v22 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F6A9F0]];

      goto LABEL_8;
    }
LABEL_20:
    [v22 setObject:&unk_1F2DC7A08 forKeyedSubscript:*MEMORY[0x1E4F6A9E0]];
    if ((v11 & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  unint64_t v25 = (void *)MEMORY[0x1D9452090]();
  __int16 v26 = self;
  id v27 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    unint64_t v29 = v28 = v20;
    *(_DWORD *)buf = 138543362;
    uint64_t v82 = (uint64_t)v29;
    _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Destination is required", buf, 0xCu);

    id v20 = v28;
    uint64_t v16 = a10;
  }

  if (v16)
  {
    [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    id v30 = 0;
    *uint64_t v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v30 = 0;
  }
LABEL_69:

  return v30;
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDIDSMessageTransport *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__HMDIDSMessageTransport_sendMessage_completionHandler___block_invoke;
  block[3] = &unk_1E6A193D0;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __56__HMDIDSMessageTransport_sendMessage_completionHandler___block_invoke(id *a1)
{
  uint64_t v172 = *MEMORY[0x1E4F143B8];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__HMDIDSMessageTransport_sendMessage_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1E6A17D78;
  id v163 = a1[6];
  id v162 = a1[4];
  v2 = (void (**)(void *, void *))_Block_copy(aBlock);
  id v3 = a1[5];
  if (!v3 || ![v3 isModernTransport]) {
    goto LABEL_6;
  }
  id v4 = [a1[4] responseHandler];

  if (v4)
  {
    v125 = (void *)MEMORY[0x1D9452090]();
    id v126 = a1[5];
    v127 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v127, OS_LOG_TYPE_FAULT))
    {
      v128 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v165 = v128;
      _os_log_impl(&dword_1D49D5000, v127, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Response handler should not be set in modern transport", buf, 0xCu);
    }
    v129 = [[HMDAssertionLogEvent alloc] initWithReason:@"Response handler should not be set in modern transport"];
    id v130 = +[HMDMetricsManager sharedLogEventSubmitter];
    [v130 submitLogEvent:v129];
  }
  id v5 = [a1[4] responseHandler];

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
      char v21 = (void *)MEMORY[0x1D9452090]();
      id v22 = a1[5];
      id v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        __int16 v24 = HMFGetLogIdentifier();
        unint64_t v25 = [a1[4] identifier];
        __int16 v26 = [v25 UUIDString];
        id v27 = [a1[4] destination];
        *(_DWORD *)buf = 138543874;
        uint64_t v165 = v24;
        __int16 v166 = 2114;
        id v167 = v26;
        __int16 v168 = 2112;
        id v169 = v27;
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to send message %{public}@ invalid destination: %@", buf, 0x20u);
      }
      id v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3 description:@"Invalid parameter." reason:@"Invalid destination." suggestion:0];
      v2[2](v2, v9);
      goto LABEL_98;
    }
    id v9 = [a1[5] remoteMessageFromMessage:a1[4]];
    id v160 = 0;
    id v10 = +[HMDRemoteMessageSerialization dictionaryForMessage:v9 error:&v160];
    id v11 = v160;
    if (!v10)
    {
      id v28 = (void *)MEMORY[0x1D9452090]();
      id v29 = a1[5];
      id v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        unint64_t v31 = HMFGetLogIdentifier();
        uint64_t v32 = [a1[4] identifier];
        *(_DWORD *)buf = 138543874;
        uint64_t v165 = v31;
        __int16 v166 = 2114;
        id v167 = v32;
        __int16 v168 = 2112;
        id v169 = v11;
        _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize message %{public}@ with error: %@", buf, 0x20u);
      }
      v2[2](v2, v11);
      goto LABEL_97;
    }
    id v12 = a1[5];
    id v148 = v11;
    if (!v12 || ![v12 isModernTransport])
    {
      context = 0;
LABEL_59:
      v143 = v2;
      [v9 timeout];
      double v58 = 0.0;
      if (v59 > 0.0)
      {
        [v9 timeout];
        double v58 = v60;
      }
      uint64_t v61 = [v9 collapseID];
      if (v61)
      {
        v62 = objc_opt_class();
        v63 = [v9 name];
        char v64 = [v6 target];
        v65 = [MEMORY[0x1E4F1C9C8] now];
        id v158 = [v62 queueOneIdentifierWithMessageName:v63 target:v64 collapseID:v61 timeToLive:v65 now:v58];
      }
      else
      {
        id v158 = 0;
      }
      if ([v9 sendOptions])
      {
        uint64_t v66 = 8;
      }
      else
      {
        uint64_t v66 = (uint64_t)a1[5];
        id v67 = v9;
        id v68 = v158;
        if (v66)
        {
          char v69 = [(id)v66 isModernTransport];
          uint64_t v66 = 0;
          if (!v68 && (v69 & 1) == 0) {
            uint64_t v66 = [v67 type] == 3;
          }
        }
      }
      v70 = [a1[4] destination];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v71 = v70;
      }
      else {
        id v71 = 0;
      }
      id v72 = v71;

      if (v72 && [v72 restrictToResidentCapable]) {
        v66 |= 4uLL;
      }
      v142 = v72;
      uint64_t v73 = [(id)objc_opt_class() priorityForMessage:v9];
      id v74 = a1[5];
      id v159 = 0;
      uint64_t v75 = [v74 sendMessage:v10 fromHandle:context destination:v6 priority:v73 timeout:v66 options:v158 queueOneID:v58 error:&v159];
      id v139 = v159;
      v140 = (void *)v61;
      id v150 = (void *)v75;
      if (v75)
      {
        id v76 = +[HMDMetricsManager sharedLogEventSubmitter];
        long long v77 = +[HMDRemoteMessageLogEvent sentRemoteMessage:transportType:](HMDRemoteMessageLogEvent, "sentRemoteMessage:transportType:", v9, [a1[5] transportType]);
        [v76 submitLogEvent:v77];

        long long v78 = (void *)MEMORY[0x1D9452090]();
        id v79 = a1[5];
        long long v80 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
        {
          id v81 = HMFGetLogIdentifier();
          [a1[4] identifier];
          v83 = uint64_t v82 = v10;
          *(_DWORD *)buf = 138543874;
          uint64_t v165 = v81;
          __int16 v166 = 2114;
          id v167 = v83;
          __int16 v168 = 2114;
          id v169 = v150;
          _os_log_impl(&dword_1D49D5000, v80, OS_LOG_TYPE_INFO, "%{public}@Message %{public}@ ack'd with IDS GUID %{public}@", buf, 0x20u);

          id v10 = v82;
        }

        id v84 = [MEMORY[0x1E4F1CA60] dictionary];
        id v85 = a1[6];
        if (v85)
        {
          uint64_t v86 = (void *)[v85 copy];
          [v84 setObject:v86 forKeyedSubscript:@"HMDIDSMessageTransportCompletionHandlerKey"];
        }
        v146 = v10;
        __int16 v87 = [a1[4] responseHandler];

        v2 = v143;
        if (v87)
        {
          id v88 = [v9 transactionIdentifier];
          [v84 setObject:v88 forKeyedSubscript:@"HMDIDSMessageTransportTransactionIdentifierKey"];
          __int16 v89 = [a1[4] responseHandler];
          id v90 = _Block_copy(v89);
          __int16 v91 = [a1[5] pendingResponses];
          [v91 setObject:v90 forKeyedSubscript:v88];

          id v92 = [v9 messagePayload];
          __int16 v93 = [v92 objectForKeyedSubscript:@"kRequestedCapabilitiesKey"];
          id v94 = [a1[5] requestedCapabilities];
          [v94 setObject:v93 forKeyedSubscript:v88];

          v95 = [v6 remoteDestinationString];
          uint64_t v96 = [a1[5] destinationAddress];
          [v96 setObject:v95 forKeyedSubscript:v88];

          id v97 = a1[5];
          [v9 timeout];
          objc_msgSend(v97, "_startPendingResponseTimer:responseTimeout:identifier:", v88, v150);
        }
        uint64_t v98 = [HMDIDSMessageContext alloc];
        int v99 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v150];
        id v100 = [a1[4] destination];
        uint64_t v101 = [(HMDIDSMessageContext *)v98 initWithIdentifier:v99 destination:v100 userInfo:v84];

        v102 = [a1[5] messageContexts];
        [v102 addObject:v101];

        v103 = [a1[5] sendMessageBudget];
        LODWORD(v99) = [v103 decrement];

        if (v99)
        {
          v104 = [a1[5] sendMessageBudget];
          int v105 = [v104 isEmpty];

          id v10 = v146;
          v106 = v139;
          if (v105)
          {
            v138 = (void *)MEMORY[0x1D9452090]();
            id v107 = a1[5];
            v108 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
            {
              v109 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              uint64_t v165 = v109;
              _os_log_impl(&dword_1D49D5000, v108, OS_LOG_TYPE_ERROR, "%{public}@Exceeded send message budget", buf, 0xCu);

              id v10 = v146;
            }

            v110 = [a1[5] sendMessageBudget];
            uint64_t v111 = [v110 rate];
            v113 = +[HMDRemoteMessageExceedBudgetLogEvent eventWithBudgetRate:](HMDRemoteMessageExceedBudgetLogEvent, "eventWithBudgetRate:", v111, v112);

            v114 = +[HMDMetricsManager sharedLogEventSubmitter];
            [v114 submitLogEvent:v113];
          }
        }
        else
        {
          v121 = (void *)MEMORY[0x1D9452090]();
          id v122 = a1[5];
          v123 = HMFGetOSLogHandle();
          v106 = v139;
          if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
          {
            v124 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            uint64_t v165 = v124;
            _os_log_impl(&dword_1D49D5000, v123, OS_LOG_TYPE_INFO, "%{public}@Over send message budget", buf, 0xCu);
          }
          id v10 = v146;
        }

        id v11 = v148;
      }
      else
      {
        v115 = (void *)MEMORY[0x1D9452090]();
        id v116 = a1[5];
        v117 = HMFGetOSLogHandle();
        v106 = v139;
        if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
        {
          id v118 = HMFGetLogIdentifier();
          [a1[4] identifier];
          v119 = v147 = v10;
          v120 = [a1[4] name];
          *(_DWORD *)buf = 138544130;
          uint64_t v165 = v118;
          __int16 v166 = 2114;
          id v167 = v119;
          __int16 v168 = 2112;
          id v169 = v120;
          __int16 v170 = 2112;
          id v171 = v139;
          _os_log_impl(&dword_1D49D5000, v117, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to send message %{public}@ / %@ with error: %@", buf, 0x2Au);

          id v10 = v147;
          id v11 = v148;
        }

        v2 = v143;
        v143[2](v143, v139);
      }

LABEL_97:
LABEL_98:

      goto LABEL_99;
    }
    id v13 = (void *)[v10 mutableCopy];
    id v14 = a1[5];
    id v15 = v13;
    if (v14)
    {
      uint64_t v16 = [v14 appleAccountManager];
      id v17 = [v16 device];

      if (v17)
      {
        id v18 = [v17 idsIdentifier];
        id v19 = v18;
        if (v18)
        {
          id v20 = [v18 UUIDString];
          [v15 setObject:v20 forKeyedSubscript:@"idsId"];
        }
        else
        {
          id v144 = v10;
          id v38 = (void *)MEMORY[0x1D9452090]();
          id v39 = v14;
          id v40 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            id v41 = v156 = v38;
            *(_DWORD *)buf = 138543618;
            uint64_t v165 = v41;
            __int16 v166 = 2112;
            id v167 = v17;
            _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_ERROR, "%{public}@Cannot set the source IDS device identifier because IDS identifier is unknown for current device: %@", buf, 0x16u);

            id v38 = v156;
          }

          id v10 = v144;
        }
      }
      else
      {
        v33 = (void *)MEMORY[0x1D9452090]();
        id v34 = v14;
        uint64_t v35 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          id v155 = v15;
          id v37 = v36 = v10;
          *(_DWORD *)buf = 138543362;
          uint64_t v165 = v37;
          _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Cannot set the source IDS device identifier because current device is unknown", buf, 0xCu);

          id v10 = v36;
          id v15 = v155;
        }
      }
    }
    if ([v9 type] != 1)
    {
      context = 0;
      id v11 = v148;
LABEL_58:
      uint64_t v57 = [v15 copy];

      id v10 = (void *)v57;
      goto LABEL_59;
    }
    uint64_t v42 = [a1[4] userInfo];
    uint64_t v43 = [v42 objectForKeyedSubscript:@"kIDSMessageResponseErrorDataKey"];

    if (v43) {
      [v15 setObject:v43 forKeyedSubscript:@"kIDSMessageResponseErrorDataKey"];
    }
    id v44 = a1[5];
    id v45 = v9;
    v46 = v45;
    if (!v44 || [v45 type] != 1)
    {
      context = 0;
      id v11 = v148;
LABEL_57:

      goto LABEL_58;
    }
    id v47 = [v46 remoteToID];
    if (!v47)
    {
      context = 0;
      id v11 = v148;
LABEL_56:

      goto LABEL_57;
    }
    id v157 = v47;
    v145 = v10;
    int v48 = [v46 destination];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v49 = v48;
    }
    else {
      uint64_t v49 = 0;
    }
    id v50 = v49;

    v149 = v50;
    if (v50)
    {
      uint64_t v51 = [v50 device];
      __int16 v52 = [v51 account];

      if (v52)
      {
        if ([(HMDAssertionLogEvent *)v52 isCurrentAccount])
        {
          context = 0;
          id v11 = v148;
LABEL_55:

          id v10 = v145;
          id v47 = v157;
          goto LABEL_56;
        }
        id v53 = +[HMDAccountHandle accountHandleForDestination:v157];
        if (v53)
        {
          __int16 v54 = v53;
          context = v54;
LABEL_54:
          id v11 = v148;

          goto LABEL_55;
        }
        id contexta = (void *)MEMORY[0x1D9452090]();
        id v55 = v44;
        id v56 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          v141 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v165 = v141;
          __int16 v166 = 2112;
          id v167 = v157;
          _os_log_impl(&dword_1D49D5000, v56, OS_LOG_TYPE_ERROR, "%{public}@Invalid toID to create an account handle: %@", buf, 0x16u);
        }
        __int16 v54 = 0;
      }
      else
      {
        contextc = (void *)MEMORY[0x1D9452090]();
        id v134 = v44;
        uint64_t v135 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v135, OS_LOG_TYPE_FAULT))
        {
          v136 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          uint64_t v165 = v136;
          _os_log_impl(&dword_1D49D5000, v135, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Destination device does not have an associated account", buf, 0xCu);
        }
        __int16 v54 = [[HMDAssertionLogEvent alloc] initWithReason:@"Destination device does not have an associated account"];
        id v137 = +[HMDMetricsManager sharedLogEventSubmitter];
        [v137 submitLogEvent:v54];

        __int16 v52 = 0;
      }
    }
    else
    {
      contextb = (void *)MEMORY[0x1D9452090]();
      id v131 = v44;
      v132 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v132, OS_LOG_TYPE_FAULT))
      {
        v133 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v165 = v133;
        _os_log_impl(&dword_1D49D5000, v132, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Response message is not a device destination", buf, 0xCu);
      }
      __int16 v52 = [[HMDAssertionLogEvent alloc] initWithReason:@"Response message is not a device destination"];
      __int16 v54 = +[HMDMetricsManager sharedLogEventSubmitter];
      [(HMDAssertionLogEvent *)v54 submitLogEvent:v52];
    }
    context = 0;
    goto LABEL_54;
  }
  id v6 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48 description:@"Not supported." reason:@"Response handler should not be set when using IDS transport for modern transport" suggestion:0];
  v2[2](v2, v6);
LABEL_99:
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
  id v3 = a3;
  id v4 = [v3 destination];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
  }
  else
  {
    id v5 = [v3 destination];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      LOBYTE(v7) = 0;
      goto LABEL_6;
    }
  }
  BOOL v7 = [v3 restriction] & 1;
LABEL_6:

  return v7;
}

- (BOOL)canSendMessage:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(HMDIDSMessageTransport *)self isValidMessage:v4]) {
    goto LABEL_13;
  }
  if (self && [(HMDIDSMessageTransport *)self isModernTransport]) {
    goto LABEL_6;
  }
  id v5 = [(HMDIDSMessageTransport *)self appleAccountManager];
  id v6 = [v5 device];

  if (!v6)
  {
    id v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      int v17 = 138543362;
      id v18 = v13;
      id v14 = "%{public}@Cannot send message, not currently registered";
LABEL_11:
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v17, 0xCu);
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
    id v10 = (void *)MEMORY[0x1D9452090]();
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
  if (self && [(HMDIDSMessageTransport *)self isModernTransport]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)HMDIDSMessageTransport;
  return [(HMDRemoteMessageTransport *)&v4 isSecure];
}

- (id)deviceForSenderContext:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDIDSMessageTransport *)self appleAccountManager];
  id v6 = [v5 account];

  BOOL v7 = [v6 handles];
  char v8 = [v4 accountHandle];
  int v9 = [v7 containsObject:v8];

  if (!v9)
  {
    uint64_t v32 = [(HMDIDSMessageTransport *)self remoteAccountManager];
    id v11 = [v32 deviceForSenderContext:v4];
LABEL_16:

    goto LABEL_17;
  }
  id v10 = [v4 deviceHandle];
  id v11 = [v6 deviceForHandle:v10];

  if (!v11)
  {
    id v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = HMFGetLogIdentifier();
      int v41 = 138543362;
      uint64_t v42 = v15;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Received message from unknown device on our account, creating placeholder device", (uint8_t *)&v41, 0xCu);
    }
    uint64_t v16 = (void *)MEMORY[0x1E4F1CA48];
    int v17 = [v4 deviceHandle];
    id v18 = [v16 arrayWithObject:v17];

    uint64_t v19 = [v4 localDeviceHandle];

    if (v19)
    {
      id v20 = [v4 localDeviceHandle];
      [v18 addObject:v20];
    }
    char v21 = [HMDDevice alloc];
    id v22 = [v4 deviceHandle];
    id v23 = [v22 identifier];
    __int16 v24 = (void *)[v18 copy];
    unint64_t v25 = [v4 deviceVersion];
    id v11 = [(HMDDevice *)v21 initWithIdentifier:v23 handles:v24 name:0 productInfo:0 version:v25 capabilities:0];

    [v6 addDevice:v11];
  }
  __int16 v26 = (void *)MEMORY[0x1D9452090]();
  id v27 = self;
  id v28 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    id v29 = HMFGetLogIdentifier();
    int v41 = 138543618;
    uint64_t v42 = v29;
    __int16 v43 = 2112;
    id v44 = v11;
    _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_DEBUG, "%{public}@Authenticated sender on our account: %@", (uint8_t *)&v41, 0x16u);
  }
  id v30 = [v6 senderCorrelationIdentifier];

  if (!v30)
  {
    unint64_t v31 = [v4 accountIdentifier];
    uint64_t v32 = [v31 senderCorrelationIdentifier];

    if (v32)
    {
      v33 = (void *)MEMORY[0x1D9452090]();
      id v34 = v27;
      uint64_t v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = HMFGetLogIdentifier();
        id v37 = [v6 identifier];
        id v38 = [v37 shortDescription];
        int v41 = 138544130;
        uint64_t v42 = v36;
        __int16 v43 = 2114;
        id v44 = v38;
        __int16 v45 = 2160;
        uint64_t v46 = 1752392040;
        __int16 v47 = 2112;
        int v48 = v32;
        _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@Updating account %{public}@ with inferred mergeID %{mask.hash}@", (uint8_t *)&v41, 0x2Au);
      }
      id v39 = [(HMDIDSMessageTransport *)v34 appleAccountManager];
      [v39 updateSenderCorrelationIdentifier:v32];
    }
    goto LABEL_16;
  }
LABEL_17:

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
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self && [(HMDIDSMessageTransport *)self isModernTransport])
  {
    id v3 = (void *)MEMORY[0x1D9452090]();
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
    id v3 = (void *)MEMORY[0x1D9452090]();
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
  _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v13, 0xCu);

LABEL_8:
  char v8 = [(HMDIDSMessageTransport *)self service];
  int v9 = [(HMDIDSMessageTransport *)self workQueue];
  [v8 addDelegate:self queue:v9];

  id v10 = [(HMDRemoteMessageTransport *)self startPromise];
  [v10 fulfillWithValue:0];

  id v11 = [(HMDRemoteMessageTransport *)self startFuture];
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
    uint64_t v16 = (const char *)[v15 UTF8String];
    int v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create(v16, v17);
    workQueue = v14->_workQueue;
    v14->_workQueue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v14->_service, a4);
    objc_storeStrong((id *)&v14->_appleAccountManager, a5);
    objc_storeStrong((id *)&v14->_remoteAccountManager, a6);
    id v20 = objc_alloc(MEMORY[0x1E4F65500]);
    uint64_t v21 = [(id)objc_opt_class() sendMessageLimit];
    uint64_t v22 = [(id)objc_opt_class() sendMessageRate];
    uint64_t v24 = objc_msgSend(v20, "initWithLimit:rate:", v21, v22, v23);
    sendMessageBudget = v14->_sendMessageBudget;
    v14->_sendMessageBudget = (HMFOperationBudget *)v24;

    uint64_t v26 = [MEMORY[0x1E4F1CA48] array];
    messageContexts = v14->_messageContexts;
    v14->_messageContexts = (NSMutableArray *)v26;

    uint64_t v28 = [MEMORY[0x1E4F1CA60] dictionary];
    pendingResponses = v14->_pendingResponses;
    v14->_pendingResponses = (NSMutableDictionary *)v28;

    uint64_t v30 = [MEMORY[0x1E4F1CA60] dictionary];
    receivedResponses = v14->_receivedResponses;
    v14->_receivedResponses = (NSMutableDictionary *)v30;

    uint64_t v32 = [MEMORY[0x1E4F1CA60] dictionary];
    requestedCapabilities = v14->_requestedCapabilities;
    v14->_requestedCapabilities = (NSMutableDictionary *)v32;

    uint64_t v34 = [MEMORY[0x1E4F1CA60] dictionary];
    destinationAddress = v14->_destinationAddress;
    v14->_destinationAddress = (NSMutableDictionary *)v34;

    uint64_t v36 = [MEMORY[0x1E4F1CA60] dictionary];
    pendingResponseTimers = v14->_pendingResponseTimers;
    v14->_pendingResponseTimers = (NSMutableDictionary *)v36;

    uint64_t v38 = [objc_alloc(MEMORY[0x1E4F1CA70]) initWithCapacity:30];
    messageDedupBuffer = v14->_messageDedupBuffer;
    v14->_messageDedupBuffer = (NSMutableOrderedSet *)v38;
  }
  return v14;
}

- (id)initModernTransportWithAccountRegistry:(id)a3 service:(id)a4 appleAccountManager:(id)a5 remoteAccountManager:(id)a6
{
  id result = [(HMDIDSMessageTransport *)self initWithAccountRegistry:a3 service:a4 appleAccountManager:a5 remoteAccountManager:a6];
  if (result) {
    *((unsigned char *)result + 80) = 1;
  }
  return result;
}

- (id)initModernTransportWithAccountRegistry:(id)a3
{
  id v4 = a3;
  int v5 = +[HMDIDSServiceManager sharedManager];
  id v6 = [v5 modernService];
  BOOL v7 = +[HMDAppleAccountManager sharedManager];
  char v8 = +[HMDRemoteAccountManager sharedManager];
  id v9 = [(HMDIDSMessageTransport *)self initModernTransportWithAccountRegistry:v4 service:v6 appleAccountManager:v7 remoteAccountManager:v8];

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
  uint64_t v23 = (void *)MEMORY[0x1D9452090]();
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
  id v29 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v48 length:8];
  id v37 = sha256(@"Q1Id", v30, v31, v32, v33, v34, v35, v36, (uint64_t)v29);
  uint64_t v38 = objc_msgSend(v37, "hmf_hexadecimalRepresentation");

  return v38;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_33722 != -1) {
    dispatch_once(&logCategory__hmf_once_t2_33722, &__block_literal_global_33723);
  }
  v2 = (void *)logCategory__hmf_once_v3_33724;
  return v2;
}

uint64_t __37__HMDIDSMessageTransport_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v3_33724;
  logCategory__hmf_once_v3_33724 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (_HMFRate)sendMessageRate
{
  id v3 = [MEMORY[0x1E4F65530] sharedPreferences];
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
  v2 = [MEMORY[0x1E4F65530] sharedPreferences];
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