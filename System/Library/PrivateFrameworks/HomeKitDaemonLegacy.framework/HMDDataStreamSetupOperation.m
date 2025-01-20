@interface HMDDataStreamSetupOperation
+ (id)hapSetupOperationWithAccessory:(id)a3 queue:(id)a4 logIdentifier:(id)a5 transferManagementService:(id)a6 maxControllerTransportMTU:(unint64_t)a7 setupOperationReadRequired:(BOOL)a8;
+ (id)tcpSetupOperationWithAccessory:(id)a3 queue:(id)a4 logIdentifier:(id)a5 transferManagementService:(id)a6;
- (BOOL)removeBulkSendListener:(id)a3;
- (HMDDataStreamSetupOperation)initWithAccessory:(id)a3 queue:(id)a4 logIdentifier:(id)a5 transferManagementService:(id)a6;
- (HMDDataStreamSetupOperationDelegate)delegate;
- (HMDHAPAccessory)accessory;
- (HMDService)transferManagementService;
- (NSMutableSet)pendingBulkSendListeners;
- (NSString)logIdentifier;
- (OS_dispatch_queue)queue;
- (void)_clearPendingBulkSendListeners;
- (void)addBulkSendListener:(id)a3 fileType:(id)a4;
- (void)continueStreamSetupWithResponse:(id)a3;
- (void)dealloc;
- (void)movePendingBulkSendListenersToBulkSendProtocol:(id)a3;
- (void)postDidFailWithError:(id)a3;
- (void)postDidSucceedWithTransport:(id)a3 sessionEncryption:(id)a4;
- (void)processTransportSetupResponse:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startSetup;
@end

@implementation HMDDataStreamSetupOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingBulkSendListeners, 0);
  objc_storeStrong((id *)&self->_transferManagementService, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (NSMutableSet)pendingBulkSendListeners
{
  return self->_pendingBulkSendListeners;
}

- (HMDService)transferManagementService
{
  return self->_transferManagementService;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (HMDHAPAccessory)accessory
{
  return self->_accessory;
}

- (void)setDelegate:(id)a3
{
}

- (HMDDataStreamSetupOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDDataStreamSetupOperationDelegate *)WeakRetained;
}

- (void)movePendingBulkSendListenersToBulkSendProtocol:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDDataStreamSetupOperation *)self queue];
  dispatch_assert_queue_V2(v5);

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(HMDDataStreamSetupOperation *)self pendingBulkSendListeners];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12 = [v11 listener];
        if (v12)
        {
          v13 = [v11 fileType];
          [v4 addListener:v12 fileType:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  v14 = [(HMDDataStreamSetupOperation *)self pendingBulkSendListeners];
  [v14 removeAllObjects];
}

- (BOOL)removeBulkSendListener:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDDataStreamSetupOperation *)self queue];
  dispatch_assert_queue_V2(v5);

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = [(HMDDataStreamSetupOperation *)self pendingBulkSendListeners];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [v11 listener];

        if (v12 == v4)
        {
          v14 = [(HMDDataStreamSetupOperation *)self pendingBulkSendListeners];
          [v14 removeObject:v11];

          BOOL v13 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (void)addBulkSendListener:(id)a3 fileType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(HMDDataStreamSetupOperation *)self queue];
  dispatch_assert_queue_V2(v8);

  v10 = [[HMDPendingBulkSendListener alloc] initWithListener:v7 fileType:v6];
  uint64_t v9 = [(HMDDataStreamSetupOperation *)self pendingBulkSendListeners];
  [v9 addObject:v10];
}

- (void)processTransportSetupResponse:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s must be overridden in a subclass/category", "-[HMDDataStreamSetupOperation processTransportSetupResponse:]");
  id v7 = [v4 exceptionWithName:v5 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)startSetup
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s must be overridden in a subclass/category", "-[HMDDataStreamSetupOperation startSetup]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (void)_clearPendingBulkSendListeners
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [(HMDDataStreamSetupOperation *)self pendingBulkSendListeners];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v11 + 1) + 8 * v7) listener];
        if (v8)
        {
          uint64_t v9 = [(HMDDataStreamSetupOperation *)self accessory];
          [v8 accessory:v9 didCloseDataStreamWithError:0];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v10 = [(HMDDataStreamSetupOperation *)self pendingBulkSendListeners];
  [v10 removeAllObjects];
}

- (void)continueStreamSetupWithResponse:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1D9452090]();
  uint64_t v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v62 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEBUG, "%{public}@[Start Stream] Parsing accessory response", buf, 0xCu);
  }
  v55 = v6;

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v58;
LABEL_5:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v58 != v12) {
        objc_enumerationMutation(v9);
      }
      long long v14 = *(void **)(*((void *)&v57 + 1) + 8 * v13);
      long long v15 = objc_msgSend(v14, "request", v55);
      uint64_t v16 = [v15 characteristic];
      long long v17 = [v16 type];
      char v18 = [v17 isEqualToString:@"00000131-0000-1000-8000-0026BB765291"];

      if (v18) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v57 objects:v65 count:16];
        if (v11) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
    id v19 = v14;

    if (!v19) {
      goto LABEL_17;
    }
    uint64_t v20 = [v19 error];

    if (v20)
    {
      uint64_t v21 = (void *)MEMORY[0x1D9452090]();
      v22 = v55;
      v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = HMFGetLogIdentifier();
        v25 = [v19 error];
        *(_DWORD *)buf = 138543618;
        v62 = v24;
        __int16 v63 = 2112;
        id v64 = v25;
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@[Start Stream] The setup transfer write reply errored out: %@", buf, 0x16u);
      }
      v26 = [v19 error];
      [(HMDDataStreamSetupOperation *)v22 postDidFailWithError:v26];

      goto LABEL_20;
    }
    v31 = (void *)MEMORY[0x1E4F5BD18];
    v32 = [v19 value];
    id v56 = 0;
    v33 = [v31 parsedFromData:v32 error:&v56];
    id v34 = v56;

    if (v34 || !v33)
    {
      v39 = (void *)MEMORY[0x1D9452090]();
      v40 = v55;
      v41 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v42 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v62 = v42;
        __int16 v63 = 2112;
        id v64 = v34;
        _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_ERROR, "%{public}@[Start Stream] The setup transfer write reply could not be parsed (error=%@)", buf, 0x16u);
      }
      v43 = [MEMORY[0x1E4F28C58] hmErrorWithCode:50];
      [(HMDDataStreamSetupOperation *)v40 postDidFailWithError:v43];

      goto LABEL_45;
    }
    v35 = [v33 status];

    if (!v35)
    {
      v44 = (void *)MEMORY[0x1D9452090]();
      v45 = v55;
      v46 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
LABEL_43:

        id v34 = [MEMORY[0x1E4F28C58] hmErrorWithCode:50];
LABEL_44:
        [(HMDDataStreamSetupOperation *)v45 postDidFailWithError:v34];
LABEL_45:

        goto LABEL_46;
      }
      v47 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v62 = v47;
      v48 = "%{public}@[Start Stream] The setup transfer write reply did not have status";
LABEL_42:
      _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_ERROR, v48, buf, 0xCu);

      goto LABEL_43;
    }
    v36 = [v33 status];
    uint64_t v37 = [v36 value];
    if (v37 == 1)
    {
      uint64_t v38 = 52;
    }
    else
    {
      if (v37 != 2)
      {

LABEL_38:
        v54 = [v33 parameters];

        if (v54)
        {
          [(HMDDataStreamSetupOperation *)v55 processTransportSetupResponse:v33];
LABEL_46:

          goto LABEL_20;
        }
        v44 = (void *)MEMORY[0x1D9452090]();
        v45 = v55;
        v46 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
          goto LABEL_43;
        }
        v47 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v62 = v47;
        v48 = "%{public}@[Start Stream] The setup transfer write reply did not contain setup parameters";
        goto LABEL_42;
      }
      uint64_t v38 = 16;
    }
    id v34 = [MEMORY[0x1E4F28C58] hmErrorWithCode:v38];

    if (v34)
    {
      v49 = (void *)MEMORY[0x1D9452090]();
      v45 = v55;
      v50 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        v51 = HMFGetLogIdentifier();
        v52 = [v33 status];
        [v52 value];
        v53 = HAPDataStreamTransportCommandStatusAsString();
        *(_DWORD *)buf = 138543618;
        v62 = v51;
        __int16 v63 = 2112;
        id v64 = v53;
        _os_log_impl(&dword_1D49D5000, v50, OS_LOG_TYPE_ERROR, "%{public}@[Start Stream] The setup transfer write failed with status %@", buf, 0x16u);
      }
      goto LABEL_44;
    }
    goto LABEL_38;
  }
LABEL_11:

LABEL_17:
  v27 = (void *)MEMORY[0x1D9452090]();
  v28 = v55;
  v29 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    v30 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v62 = v30;
    _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@[Start Stream] The setup transfer write reply does not contain a response", buf, 0xCu);
  }
  id v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:50];
  [(HMDDataStreamSetupOperation *)v28 postDidFailWithError:v19];
LABEL_20:
}

- (void)postDidSucceedWithTransport:(id)a3 sessionEncryption:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDDataStreamSetupOperation *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__HMDDataStreamSetupOperation_postDidSucceedWithTransport_sessionEncryption___block_invoke;
  block[3] = &unk_1E6A19668;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __77__HMDDataStreamSetupOperation_postDidSucceedWithTransport_sessionEncryption___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 dataStreamSetupOperation:*(void *)(a1 + 32) didSucceedWithTransport:*(void *)(a1 + 40) sessionEncryption:*(void *)(a1 + 48)];
}

- (void)postDidFailWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDDataStreamSetupOperation *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__HMDDataStreamSetupOperation_postDidFailWithError___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __52__HMDDataStreamSetupOperation_postDidFailWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 dataStreamSetupOperation:*(void *)(a1 + 32) didFailWithError:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  [(HMDDataStreamSetupOperation *)self _clearPendingBulkSendListeners];
  v3.receiver = self;
  v3.super_class = (Class)HMDDataStreamSetupOperation;
  [(HMDDataStreamSetupOperation *)&v3 dealloc];
}

- (HMDDataStreamSetupOperation)initWithAccessory:(id)a3 queue:(id)a4 logIdentifier:(id)a5 transferManagementService:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMDDataStreamSetupOperation;
  long long v15 = [(HMDDataStreamSetupOperation *)&v20 init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accessory, a3);
    objc_storeStrong((id *)&v16->_queue, a4);
    objc_storeStrong((id *)&v16->_logIdentifier, a5);
    objc_storeStrong((id *)&v16->_transferManagementService, a6);
    uint64_t v17 = [MEMORY[0x1E4F1CA80] set];
    pendingBulkSendListeners = v16->_pendingBulkSendListeners;
    v16->_pendingBulkSendListeners = (NSMutableSet *)v17;
  }
  return v16;
}

+ (id)hapSetupOperationWithAccessory:(id)a3 queue:(id)a4 logIdentifier:(id)a5 transferManagementService:(id)a6 maxControllerTransportMTU:(unint64_t)a7 setupOperationReadRequired:(BOOL)a8
{
  BOOL v8 = a8;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  uint64_t v17 = [[HMDDataStreamHAPSetupOperation alloc] initWithAccessory:v16 queue:v15 logIdentifier:v14 transferManagementService:v13 maxControllerTransportMTU:a7 setupOperationReadRequired:v8];

  return v17;
}

+ (id)tcpSetupOperationWithAccessory:(id)a3 queue:(id)a4 logIdentifier:(id)a5 transferManagementService:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [[HMDDataStreamTCPSetupOperation alloc] initWithAccessory:v12 queue:v11 logIdentifier:v10 transferManagementService:v9];

  return v13;
}

@end