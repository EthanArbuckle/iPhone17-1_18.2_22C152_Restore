@interface HMDDataStreamHAPTransport
- (BOOL)_isRunning;
- (BOOL)isWriteInProgress;
- (BOOL)lastAccessoryRequestToSendFlag;
- (HMDCharacteristic)interruptCharacteristic;
- (HMDCharacteristic)transportCharacteristic;
- (HMDDataStreamFrameReader)byteReader;
- (HMDDataStreamHAPTransport)initWithAccessory:(id)a3 sessionIdentifier:(int64_t)a4 maxControllerTransportMTU:(unint64_t)a5 workQueue:(id)a6 logIdentifier:(id)a7;
- (HMDDataStreamTransportDelegate)delegate;
- (HMDHAPAccessory)accessory;
- (NSMutableArray)pendingWrites;
- (NSNumber)sessionIdentifier;
- (NSString)logIdentifier;
- (NSString)notificationClientIdentifier;
- (OS_dispatch_queue)workQueue;
- (id)_buildWriteRequestWithError:(id *)a3 shouldForceClose:(BOOL)a4;
- (id)_getPendingWritesUpToLength:(unint64_t)a3;
- (unint64_t)maxControllerTransportMTU;
- (void)_cancelAllPendingWritesWithError:(id)a3;
- (void)_deregisterForMessages;
- (void)_doNextWriteOperation;
- (void)_handleCharacteristicsValueUpdated:(id)a3;
- (void)_handleCompletionWithResponseTuples:(id)a3;
- (void)_handleInterruptCharacteristicValue:(id)a3;
- (void)_handleReceivedData:(id)a3;
- (void)_notifyDelegateDidClose;
- (void)_notifyDelegateDidFailWithError:(id)a3;
- (void)_notifyDelegateDidOpen;
- (void)_notifyDelegateDidReceiveFrame:(id)a3;
- (void)_notifyWriteOperation:(id)a3 didCompleteWithError:(id)a4;
- (void)_registerForMessages;
- (void)_removeAndMarkCompleteAllCompletedWrites;
- (void)_stopTransportForWriteFailureError:(id)a3;
- (void)_stopWithError:(id)a3;
- (void)_teardownSessionWithError:(id)a3;
- (void)_writeCharacteristicRequests:(id)a3 completion:(id)a4;
- (void)close;
- (void)connect;
- (void)dealloc;
- (void)sendRawFrame:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setInterruptCharacteristic:(id)a3;
- (void)setIsWriteInProgress:(BOOL)a3;
- (void)setLastAccessoryRequestToSendFlag:(BOOL)a3;
- (void)setTransportCharacteristic:(id)a3;
@end

@implementation HMDDataStreamHAPTransport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingWrites, 0);
  objc_storeStrong((id *)&self->_notificationClientIdentifier, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_byteReader, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_interruptCharacteristic, 0);
  objc_storeStrong((id *)&self->_transportCharacteristic, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->delegate);
}

- (void)setLastAccessoryRequestToSendFlag:(BOOL)a3
{
  self->_lastAccessoryRequestToSendFlag = a3;
}

- (BOOL)lastAccessoryRequestToSendFlag
{
  return self->_lastAccessoryRequestToSendFlag;
}

- (void)setIsWriteInProgress:(BOOL)a3
{
  self->_isWriteInProgress = a3;
}

- (BOOL)isWriteInProgress
{
  return self->_isWriteInProgress;
}

- (NSMutableArray)pendingWrites
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96, 1);
}

- (NSString)notificationClientIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (HMDDataStreamFrameReader)byteReader
{
  return (HMDDataStreamFrameReader *)objc_getProperty(self, a2, 72, 1);
}

- (unint64_t)maxControllerTransportMTU
{
  return self->_maxControllerTransportMTU;
}

- (NSNumber)sessionIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setInterruptCharacteristic:(id)a3
{
}

- (HMDCharacteristic)interruptCharacteristic
{
  return (HMDCharacteristic *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTransportCharacteristic:(id)a3
{
}

- (HMDCharacteristic)transportCharacteristic
{
  return (HMDCharacteristic *)objc_getProperty(self, a2, 40, 1);
}

- (HMDHAPAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDHAPAccessory *)WeakRetained;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDDataStreamTransportDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (HMDDataStreamTransportDelegate *)WeakRetained;
}

- (void)_handleInterruptCharacteristicValue:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDDataStreamHAPTransport *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    id v29 = 0;
    v9 = [MEMORY[0x263F35968] parsedFromData:v8 error:&v29];
    id v10 = v29;
    if (v10 || !v9)
    {
      v18 = (void *)MEMORY[0x230FBD990]();
      v19 = self;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v31 = v27;
        __int16 v32 = 2112;
        id v33 = v10;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@[Interrupt] The interrupt value could not be parsed (error=%@)", buf, 0x16u);
      }
    }
    else
    {
      id v11 = [v9 requestToSendIdentifiers];
      v12 = (void *)[v11 bytes];

      v13 = [v9 requestToSendIdentifiers];
      size_t v14 = [v13 length];

      v15 = [(HMDDataStreamHAPTransport *)self sessionIdentifier];
      int v16 = [v15 intValue];

      v17 = memchr(v12, v16, v14);
      v18 = (void *)MEMORY[0x230FBD990]();
      v19 = self;
      v20 = HMFGetOSLogHandle();
      v21 = v20;
      if (v17)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v22 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v31 = v22;
          __int16 v32 = 1024;
          LODWORD(v33) = v16;
          _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@[Interrupt] The interrupt value contains valid accessory Request To Send (0x%x)", buf, 0x12u);
        }
        [(HMDDataStreamHAPTransport *)v19 setLastAccessoryRequestToSendFlag:1];
        [(HMDDataStreamHAPTransport *)v19 _doNextWriteOperation];
        goto LABEL_19;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v31 = v28;
        __int16 v32 = 1024;
        LODWORD(v33) = v16;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_DEBUG, "%{public}@[Interrupt] The interrupt value does not contain any Request To Send (0x%x)", buf, 0x12u);
      }
    }

LABEL_19:

    goto LABEL_20;
  }
  v23 = (void *)MEMORY[0x230FBD990]();
  v24 = self;
  v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v26 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v31 = v26;
    _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@[Interrupt] Received interrupt value but it was not of the expected type; IGNORING.",
      buf,
      0xCu);
  }
LABEL_20:
}

- (void)_handleCharacteristicsValueUpdated:(id)a3
{
  id v4 = a3;
  v5 = [(HMDDataStreamHAPTransport *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__HMDDataStreamHAPTransport__handleCharacteristicsValueUpdated___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __64__HMDDataStreamHAPTransport__handleCharacteristicsValueUpdated___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) name];
  char v3 = [v2 isEqualToString:@"HMDAccessoryCharacteristicsChangedNotification"];

  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    v5 = &kModifiedCharacteristicsKey;
LABEL_5:
    id v8 = [v4 userInfo];
    v9 = objc_msgSend(v8, "hmf_arrayForKey:", *v5);

    goto LABEL_7;
  }
  id v6 = [v4 name];
  int v7 = [v6 isEqualToString:@"HMDNotificationCharacteristicValueUpdated"];

  if (v7)
  {
    id v4 = *(void **)(a1 + 32);
    v5 = &HMDNotificationCharacteristicValueUpdatedChangedCharacteristicsKey;
    goto LABEL_5;
  }
  v9 = 0;
LABEL_7:
  id v10 = objc_msgSend(v9, "na_firstObjectPassingTest:", &__block_literal_global_149773);
  if (v10)
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = *(id *)(a1 + 40);
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      size_t v14 = HMFGetLogIdentifier();
      uint64_t v15 = *(void *)(a1 + 32);
      int v18 = 138543618;
      v19 = v14;
      __int16 v20 = 2112;
      uint64_t v21 = v15;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Handling characteristics value updated notification: %@", (uint8_t *)&v18, 0x16u);
    }
    int v16 = *(void **)(a1 + 40);
    v17 = [v10 value];
    [v16 _handleInterruptCharacteristicValue:v17];
  }
}

uint64_t __64__HMDDataStreamHAPTransport__handleCharacteristicsValueUpdated___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 type];
  uint64_t v3 = [v2 isEqualToString:@"00000139-0000-1000-8000-0026BB765291"];

  return v3;
}

- (void)_handleReceivedData:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = v4;
  dispatch_data_t v7 = dispatch_data_create((const void *)[v6 bytes], objc_msgSend(v6, "length"), 0, 0);
  id v8 = [(HMDDataStreamHAPTransport *)self byteReader];
  [v8 pushFrameData:v7];

  v9 = [(HMDDataStreamHAPTransport *)self byteReader];
  char v10 = [v9 hasFailed];

  if (v10)
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      size_t v14 = HMFGetLogIdentifier();
      int v22 = 138543362;
      v23 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@DataStream has encountered irrecoverable framing issue. Closing stream.", (uint8_t *)&v22, 0xCu);
    }
    uint64_t v15 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1052];
    [(HMDDataStreamHAPTransport *)v12 _teardownSessionWithError:v15];
  }
  else
  {
    int v16 = [(HMDDataStreamHAPTransport *)self byteReader];
    int v17 = [v16 hasCompleteFrame];

    if (v17)
    {
      do
      {
        int v18 = [(HMDDataStreamHAPTransport *)self byteReader];
        v19 = [v18 popRawFrame];

        if (v19) {
          [(HMDDataStreamHAPTransport *)self _notifyDelegateDidReceiveFrame:v19];
        }

        __int16 v20 = [(HMDDataStreamHAPTransport *)self byteReader];
        char v21 = [v20 hasCompleteFrame];
      }
      while ((v21 & 1) != 0);
    }
  }
}

- (void)_notifyWriteOperation:(id)a3 didCompleteWithError:(id)a4
{
  id v6 = a4;
  dispatch_data_t v7 = [a3 completion];
  id v8 = [(HMDDataStreamHAPTransport *)self workQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__HMDDataStreamHAPTransport__notifyWriteOperation_didCompleteWithError___block_invoke;
  v11[3] = &unk_264A2F870;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, v11);
}

uint64_t __72__HMDDataStreamHAPTransport__notifyWriteOperation_didCompleteWithError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_cancelAllPendingWritesWithError:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(HMDDataStreamHAPTransport *)self pendingWrites];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [(HMDDataStreamHAPTransport *)self _notifyWriteOperation:*(void *)(*((void *)&v11 + 1) + 8 * v9++) didCompleteWithError:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  id v10 = [(HMDDataStreamHAPTransport *)self pendingWrites];
  [v10 removeAllObjects];
}

- (void)_removeAndMarkCompleteAllCompletedWrites
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [(HMDDataStreamHAPTransport *)self pendingWrites];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v4) {
    goto LABEL_13;
  }
  uint64_t v5 = v4;
  uint64_t v6 = 0;
  uint64_t v7 = *(void *)v12;
  while (2)
  {
    uint64_t v8 = 0;
    uint64_t v9 = v6 + v5;
    do
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v3);
      }
      id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
      if (![v10 isComplete])
      {
        uint64_t v9 = v6 + v8;
        goto LABEL_11;
      }
      [(HMDDataStreamHAPTransport *)self _notifyWriteOperation:v10 didCompleteWithError:0];
      ++v8;
    }
    while (v5 != v8);
    uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    uint64_t v6 = v9;
    if (v5) {
      continue;
    }
    break;
  }
LABEL_11:

  if (v9)
  {
    uint64_t v3 = [(HMDDataStreamHAPTransport *)self pendingWrites];
    objc_msgSend(v3, "removeObjectsInRange:", 0, v9);
LABEL_13:
  }
  [(HMDDataStreamHAPTransport *)self setIsWriteInProgress:0];
}

- (void)_stopTransportForWriteFailureError:(id)a3
{
  id v4 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1061 underlyingError:a3];
  [(HMDDataStreamHAPTransport *)self _teardownSessionWithError:v4];
}

- (void)_handleCompletionWithResponseTuples:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(HMDDataStreamHAPTransport *)self isWriteInProgress];
  uint64_t v6 = (void *)MEMORY[0x230FBD990]();
  uint64_t v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  uint64_t v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v57 = v10;
      __int16 v58 = 2112;
      id v59 = v4;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEBUG, "%{public}@[Transport] Handling responses: %@", buf, 0x16u);
    }
    v49 = v7;

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v48 = v4;
    id v11 = v4;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v51 objects:v55 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v52;
LABEL_6:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v52 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v51 + 1) + 8 * v15);
        int v17 = [v16 request];
        int v18 = [v17 characteristic];
        v19 = [v18 type];
        char v20 = [v19 isEqualToString:@"00000138-0000-1000-8000-0026BB765291"];

        if (v20) {
          break;
        }
        if (v13 == ++v15)
        {
          uint64_t v13 = [v11 countByEnumeratingWithState:&v51 objects:v55 count:16];
          if (v13) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
      id v22 = v16;

      if (!v22) {
        goto LABEL_21;
      }
      v23 = [v22 error];

      if (v23)
      {
        uint64_t v24 = (void *)MEMORY[0x230FBD990]();
        v25 = v49;
        v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = HMFGetLogIdentifier();
          v28 = [v22 error];
          *(_DWORD *)buf = 138543618;
          v57 = v27;
          __int16 v58 = 2112;
          id v59 = v28;
          _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@[Transport] Write response errored out: %@", buf, 0x16u);
        }
        id v29 = [v22 error];
        [(HMDDataStreamHAPTransport *)v25 _stopTransportForWriteFailureError:v29];

        goto LABEL_24;
      }
      uint64_t v34 = (void *)MEMORY[0x263F35950];
      v35 = [v22 value];
      id v50 = 0;
      v36 = [v34 parsedFromData:v35 error:&v50];
      id v37 = v50;

      if (v37 || !v36)
      {
        v41 = (void *)MEMORY[0x230FBD990]();
        v42 = v49;
        v43 = HMFGetOSLogHandle();
        id v4 = v48;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v44 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v57 = v44;
          __int16 v58 = 2112;
          id v59 = v37;
          _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_ERROR, "%{public}@[Start Stream] The setup transfer write reply could not be parsed (error=%@)", buf, 0x16u);
        }
        v45 = [MEMORY[0x263F087E8] hmErrorWithCode:50];
        [(HMDDataStreamHAPTransport *)v42 _stopTransportForWriteFailureError:v45];
      }
      else
      {
        v38 = [v36 accessoryRequestToSend];

        id v4 = v48;
        if (v38)
        {
          v39 = [v36 accessoryRequestToSend];
          v40 = [v39 value];
          -[HMDDataStreamHAPTransport setLastAccessoryRequestToSendFlag:](v49, "setLastAccessoryRequestToSendFlag:", [v40 BOOLValue]);
        }
        else
        {
          [(HMDDataStreamHAPTransport *)v49 setLastAccessoryRequestToSendFlag:0];
        }
        [(HMDDataStreamHAPTransport *)v49 _removeAndMarkCompleteAllCompletedWrites];
        v46 = [v36 payload];

        if (v46)
        {
          v47 = [v36 payload];
          [(HMDDataStreamHAPTransport *)v49 _handleReceivedData:v47];
        }
        [(HMDDataStreamHAPTransport *)v49 _doNextWriteOperation];
      }
    }
    else
    {
LABEL_12:

LABEL_21:
      v30 = (void *)MEMORY[0x230FBD990]();
      v31 = v49;
      __int16 v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        id v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v57 = v33;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@[Transport] Write-response contained no response; weird. Erroring out.",
          buf,
          0xCu);
      }
      id v22 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      [(HMDDataStreamHAPTransport *)v31 _stopTransportForWriteFailureError:v22];
LABEL_24:
      id v4 = v48;
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      char v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v57 = v21;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@[Transport] Write-response returned but nothing in progress; stale reply? Ignoring",
        buf,
        0xCu);
    }
  }
}

- (void)_doNextWriteOperation
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (![(HMDDataStreamHAPTransport *)self isWriteInProgress])
  {
    uint64_t v3 = [(HMDDataStreamHAPTransport *)self pendingWrites];
    if (objc_msgSend(v3, "hmf_isEmpty"))
    {
      BOOL v4 = [(HMDDataStreamHAPTransport *)self lastAccessoryRequestToSendFlag];

      if (!v4) {
        return;
      }
    }
    else
    {
    }
    if ([(HMDDataStreamHAPTransport *)self _isRunning])
    {
      BOOL v5 = [(HMDDataStreamHAPTransport *)self accessory];
      if (v5)
      {
        [(HMDDataStreamHAPTransport *)self setIsWriteInProgress:1];
        id v24 = 0;
        uint64_t v6 = [(HMDDataStreamHAPTransport *)self _buildWriteRequestWithError:&v24 shouldForceClose:0];
        id v7 = v24;
        if (v7)
        {
          uint64_t v8 = (void *)MEMORY[0x230FBD990]();
          uint64_t v9 = self;
          id v10 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            id v11 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v27 = v11;
            _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@[Transport] Unable to write: building next payload failed and should not do that; closing.",
              buf,
              0xCu);
          }
          uint64_t v12 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1052 underlyingError:v7];
          [(HMDDataStreamHAPTransport *)v9 _stopTransportForWriteFailureError:v12];
        }
        else if (v6)
        {
          objc_initWeak((id *)buf, self);
          v25 = v6;
          char v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
          v22[0] = MEMORY[0x263EF8330];
          v22[1] = 3221225472;
          v22[2] = __50__HMDDataStreamHAPTransport__doNextWriteOperation__block_invoke;
          v22[3] = &unk_264A2E9A8;
          objc_copyWeak(&v23, (id *)buf);
          [(HMDDataStreamHAPTransport *)self _writeCharacteristicRequests:v21 completion:v22];

          objc_destroyWeak(&v23);
          objc_destroyWeak((id *)buf);
        }
        else
        {
          [(HMDDataStreamHAPTransport *)self _removeAndMarkCompleteAllCompletedWrites];
          [(HMDDataStreamHAPTransport *)self _doNextWriteOperation];
        }
      }
      else
      {
        int v17 = (void *)MEMORY[0x230FBD990]();
        int v18 = self;
        v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          char v20 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v27 = v20;
          _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@[Transport] Unable to write: HAPAccessory is no longer active; closing.",
            buf,
            0xCu);
        }
        id v7 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2100];
        [(HMDDataStreamHAPTransport *)v18 _stopTransportForWriteFailureError:v7];
      }
    }
    else
    {
      uint64_t v13 = (void *)MEMORY[0x230FBD990]();
      uint64_t v14 = self;
      uint64_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v27 = v16;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@[Transport] Unable to write: transport already closed.", buf, 0xCu);
      }
      BOOL v5 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1061];
      [(HMDDataStreamHAPTransport *)v14 _cancelAllPendingWritesWithError:v5];
    }
  }
}

void __50__HMDDataStreamHAPTransport__doNextWriteOperation__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v4 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v5 = [WeakRetained workQueue];
    dispatch_assert_queue_V2(v5);

    [v4 _handleCompletionWithResponseTuples:v6];
  }
}

- (void)_writeCharacteristicRequests:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDDataStreamHAPTransport *)self accessory];
  uint64_t v9 = [v8 home];
  id v10 = [MEMORY[0x263F08C38] UUID];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __69__HMDDataStreamHAPTransport__writeCharacteristicRequests_completion___block_invoke;
  v13[3] = &unk_264A2B910;
  id v14 = v6;
  id v15 = v7;
  v13[4] = self;
  id v11 = v6;
  id v12 = v7;
  [v9 writeCharacteristicValues:v11 source:7 message:0 identifier:v10 qualityOfService:-1 withCompletionHandler:v13];
}

void __69__HMDDataStreamHAPTransport__writeCharacteristicRequests_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] workQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __69__HMDDataStreamHAPTransport__writeCharacteristicRequests_completion___block_invoke_2;
  v10[3] = &unk_264A2EE30;
  id v11 = v5;
  id v14 = a1[6];
  id v12 = a1[5];
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __69__HMDDataStreamHAPTransport__writeCharacteristicRequests_completion___block_invoke_2(void *a1)
{
  uint64_t v1 = a1[7];
  uint64_t v2 = a1[5];
  if (a1[4]) {
    +[HMDCharacteristicResponse responsesWithRequests:error:](HMDCharacteristicResponse, "responsesWithRequests:error:", v2);
  }
  else {
  id v3 = +[HMDCharacteristicResponse responsesWithRequests:v2 characteristicUpdateDictionary:a1[6]];
  }
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (id)_buildWriteRequestWithError:(id *)a3 shouldForceClose:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (a4)
  {
    id v7 = 0;
    goto LABEL_5;
  }
  id v7 = [(HMDDataStreamHAPTransport *)self _getPendingWritesUpToLength:[(HMDDataStreamHAPTransport *)self maxControllerTransportMTU]];
  if ([v7 length]
    || [(HMDDataStreamHAPTransport *)self lastAccessoryRequestToSendFlag])
  {
LABEL_5:
    id v8 = objc_alloc(MEMORY[0x263F35AF0]);
    id v9 = [(HMDDataStreamHAPTransport *)self sessionIdentifier];
    id v10 = (void *)[v8 initWithValue:v9];

    if (v4)
    {
      id v11 = objc_alloc(MEMORY[0x263F35AF0]);
      id v12 = [NSNumber numberWithBool:1];
      id v13 = (void *)[v11 initWithValue:v12];
    }
    else
    {
      id v13 = 0;
    }
    id v14 = (void *)[objc_alloc(MEMORY[0x263F35958]) initWithPayload:v7 sessionIdentifier:v10 forceClose:v13];
    id v15 = [v14 serializeWithError:a3];
    id v16 = *a3;
    int v17 = (void *)MEMORY[0x230FBD990]();
    int v18 = self;
    v19 = HMFGetOSLogHandle();
    char v20 = v19;
    if (v16)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        char v21 = HMFGetLogIdentifier();
        int v30 = 138543362;
        v31 = v21;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Error: failed to serialize Controller Payload; should not happen!",
          (uint8_t *)&v30,
          0xCu);
      }
      id v22 = 0;
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        id v23 = HMFGetLogIdentifier();
        int v30 = 138543874;
        v31 = v23;
        __int16 v32 = 1024;
        int v33 = [v7 length];
        __int16 v34 = 1024;
        BOOL v35 = [(HMDDataStreamHAPTransport *)v18 lastAccessoryRequestToSendFlag];
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Writing: %u bytes (rts=%d)", (uint8_t *)&v30, 0x18u);
      }
      id v24 = [(HMDDataStreamHAPTransport *)v18 transportCharacteristic];
      id v22 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v24 value:v15 authorizationData:0 identifier:0 type:0 includeResponseValue:1];
    }
    goto LABEL_16;
  }
  v26 = (void *)MEMORY[0x230FBD990]();
  v27 = self;
  uint64_t v28 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    id v29 = HMFGetLogIdentifier();
    int v30 = 138543362;
    v31 = v29;
    _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_DEBUG, "%{public}@Writing: nothing to write", (uint8_t *)&v30, 0xCu);
  }
  id v22 = 0;
LABEL_16:

  return v22;
}

- (id)_getPendingWritesUpToLength:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v4 = [(HMDDataStreamHAPTransport *)self pendingWrites];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    id v8 = 0;
    uint64_t v9 = *(void *)v18;
    while (1)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v4);
        }
        id v11 = [*(id *)(*((void *)&v17 + 1) + 8 * v10) popNextFrameUpToMaxLength:a3];
        if (![v11 length]) {
          goto LABEL_13;
        }
        if (v7)
        {
          id v12 = v7;
LABEL_11:
          [v12 appendData:v11];
          goto LABEL_12;
        }
        if (v8)
        {
          id v12 = [MEMORY[0x263EFF990] dataWithData:v8];
          id v7 = v12;
          goto LABEL_11;
        }
        id v8 = v11;
        id v7 = 0;
LABEL_12:
        a3 -= [v11 length];
        if (!a3)
        {

          goto LABEL_20;
        }
LABEL_13:

        ++v10;
      }
      while (v6 != v10);
      uint64_t v13 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v6 = v13;
      if (!v13) {
        goto LABEL_20;
      }
    }
  }
  id v7 = 0;
  id v8 = 0;
LABEL_20:

  if (v7) {
    id v14 = v7;
  }
  else {
    id v14 = v8;
  }
  id v15 = v14;

  return v15;
}

- (void)sendRawFrame:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v9 = [[HMDDataStreamHAPPendingWrite alloc] initWithData:v7 completion:v6];

  id v8 = [(HMDDataStreamHAPTransport *)self pendingWrites];
  [v8 addObject:v9];

  [(HMDDataStreamHAPTransport *)self _doNextWriteOperation];
}

- (void)_notifyDelegateDidReceiveFrame:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDDataStreamHAPTransport *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__HMDDataStreamHAPTransport__notifyDelegateDidReceiveFrame___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __60__HMDDataStreamHAPTransport__notifyDelegateDidReceiveFrame___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 transport:*(void *)(a1 + 32) didReceiveRawFrame:*(void *)(a1 + 40)];
}

- (void)_notifyDelegateDidFailWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDDataStreamHAPTransport *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__HMDDataStreamHAPTransport__notifyDelegateDidFailWithError___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __61__HMDDataStreamHAPTransport__notifyDelegateDidFailWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 transport:*(void *)(a1 + 32) didFailWithError:*(void *)(a1 + 40)];
}

- (void)_notifyDelegateDidClose
{
  id v3 = [(HMDDataStreamHAPTransport *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__HMDDataStreamHAPTransport__notifyDelegateDidClose__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __52__HMDDataStreamHAPTransport__notifyDelegateDidClose__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 transportDidClose:*(void *)(a1 + 32)];
}

- (void)_notifyDelegateDidOpen
{
  id v3 = [(HMDDataStreamHAPTransport *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__HMDDataStreamHAPTransport__notifyDelegateDidOpen__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __51__HMDDataStreamHAPTransport__notifyDelegateDidOpen__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 transportDidOpen:*(void *)(a1 + 32)];
}

- (void)_deregisterForMessages
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  id v4 = [(HMDDataStreamHAPTransport *)self accessory];
  if (v4)
  {
    uint64_t v5 = [(HMDDataStreamHAPTransport *)self interruptCharacteristic];
    id v12 = v5;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
    id v7 = [(HMDDataStreamHAPTransport *)self notificationClientIdentifier];
    [v4 setNotificationsEnabled:0 forCharacteristics:v6 clientIdentifier:v7];
  }
  else
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    uint64_t v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v14 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Error: unable to deregister from event notifications on accessory (its weak pointer went to nil)", buf, 0xCu);
    }
  }
}

- (void)_registerForMessages
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = [(HMDDataStreamHAPTransport *)self accessory];
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel__handleCharacteristicsValueUpdated_ name:@"HMDNotificationCharacteristicValueUpdated" object:v3];

  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel__handleCharacteristicsValueUpdated_ name:@"HMDAccessoryCharacteristicsChangedNotification" object:v3];

  id v6 = [(HMDDataStreamHAPTransport *)self interruptCharacteristic];
  v9[0] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  id v8 = [(HMDDataStreamHAPTransport *)self notificationClientIdentifier];
  [v3 setNotificationsEnabled:1 forCharacteristics:v7 clientIdentifier:v8];
}

- (void)_teardownSessionWithError:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(HMDDataStreamHAPTransport *)self _isRunning])
  {
    id v15 = 0;
    uint64_t v5 = [(HMDDataStreamHAPTransport *)self _buildWriteRequestWithError:&v15 shouldForceClose:1];
    id v6 = v15;
    if (v5)
    {
      objc_initWeak((id *)location, self);
      id v16 = v5;
      id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __55__HMDDataStreamHAPTransport__teardownSessionWithError___block_invoke;
      v12[3] = &unk_264A2E9D0;
      objc_copyWeak(&v14, (id *)location);
      id v13 = v4;
      [(HMDDataStreamHAPTransport *)self _writeCharacteristicRequests:v7 completion:v12];

      objc_destroyWeak(&v14);
      objc_destroyWeak((id *)location);
    }
    else
    {
      id v8 = (void *)MEMORY[0x230FBD990]();
      uint64_t v9 = self;
      uint64_t v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = HMFGetLogIdentifier();
        *(_DWORD *)location = 138543618;
        *(void *)&location[4] = v11;
        __int16 v18 = 2112;
        id v19 = v6;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@[Transport] Unable to write: Closing after session force close failed; error=%@",
          location,
          0x16u);
      }
      [(HMDDataStreamHAPTransport *)v9 _stopWithError:v4];
    }
  }
  else
  {
    [(HMDDataStreamHAPTransport *)self _stopWithError:v4];
  }
}

void __55__HMDDataStreamHAPTransport__teardownSessionWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [WeakRetained workQueue];
    dispatch_assert_queue_V2(v3);

    [v4 _stopWithError:*(void *)(a1 + 32)];
    id WeakRetained = v4;
  }
}

- (void)_stopWithError:(id)a3
{
  id v4 = a3;
  if ([(HMDDataStreamHAPTransport *)self _isRunning]) {
    [(HMDDataStreamHAPTransport *)self _deregisterForMessages];
  }
  [(HMDDataStreamHAPTransport *)self setTransportCharacteristic:0];
  [(HMDDataStreamHAPTransport *)self setInterruptCharacteristic:0];
  id v5 = v4;
  id v6 = v5;
  if (!v5)
  {
    id v5 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1061];
  }
  [(HMDDataStreamHAPTransport *)self _cancelAllPendingWritesWithError:v5];
  [(HMDDataStreamHAPTransport *)self setIsWriteInProgress:0];
  if (v6) {
    [(HMDDataStreamHAPTransport *)self _notifyDelegateDidFailWithError:v6];
  }
  else {
    [(HMDDataStreamHAPTransport *)self _notifyDelegateDidClose];
  }
}

- (void)close
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HMDDataStreamHAPTransport *)self _isRunning];
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      id v8 = HMFGetLogIdentifier();
      int v10 = 138543362;
      id v11 = v8;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@DataStream transport closing.", (uint8_t *)&v10, 0xCu);
    }
    [(HMDDataStreamHAPTransport *)v5 _teardownSessionWithError:0];
  }
  else
  {
    if (v7)
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      id v11 = v9;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@DataStream Socket invoked closed but nothing to clean up.", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)connect
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if ([(HMDDataStreamHAPTransport *)self _isRunning])
  {
    BOOL v3 = (void *)MEMORY[0x230FBD990]();
    id v4 = self;
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = HMFGetLogIdentifier();
      int v26 = 138543362;
      v27 = v6;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_ERROR, "%{public}@Connect called on an already-running transport", (uint8_t *)&v26, 0xCu);
    }
  }
  else
  {
    BOOL v7 = [(HMDDataStreamHAPTransport *)self accessory];
    id v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 findCharacteristicType:@"00000138-0000-1000-8000-0026BB765291" forServiceType:@"00000129-0000-1000-8000-0026BB765291"];
      if (v9)
      {
        int v10 = [v8 findCharacteristicType:@"00000139-0000-1000-8000-0026BB765291" forServiceType:@"00000129-0000-1000-8000-0026BB765291"];
        id v11 = (void *)MEMORY[0x230FBD990]();
        uint64_t v12 = self;
        id v13 = HMFGetOSLogHandle();
        id v14 = v13;
        if (v10)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            id v15 = HMFGetLogIdentifier();
            int v26 = 138543362;
            v27 = v15;
            _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@[Connect] All good; connected!",
              (uint8_t *)&v26,
              0xCu);
          }
          [(HMDDataStreamHAPTransport *)v12 setTransportCharacteristic:v9];
          [(HMDDataStreamHAPTransport *)v12 setInterruptCharacteristic:v10];
          [(HMDDataStreamHAPTransport *)v12 _registerForMessages];
          [(HMDDataStreamHAPTransport *)v12 _notifyDelegateDidOpen];
        }
        else
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            id v24 = HMFGetLogIdentifier();
            int v26 = 138543362;
            v27 = v24;
            _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@[Connect] Missing characteristics to create transport for HDS over HAP (Interrupt Characteristic does not exist)", (uint8_t *)&v26, 0xCu);
          }
          v25 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
          [(HMDDataStreamHAPTransport *)v12 _teardownSessionWithError:v25];

          int v10 = 0;
        }
      }
      else
      {
        uint64_t v20 = (void *)MEMORY[0x230FBD990]();
        char v21 = self;
        uint64_t v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          id v23 = HMFGetLogIdentifier();
          int v26 = 138543362;
          v27 = v23;
          _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@[Connect] Missing characteristics to create transport for HDS over HAP (Transport Characteristic does not exist)", (uint8_t *)&v26, 0xCu);
        }
        int v10 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
        [(HMDDataStreamHAPTransport *)v21 _teardownSessionWithError:v10];
      }
    }
    else
    {
      id v16 = (void *)MEMORY[0x230FBD990]();
      long long v17 = self;
      __int16 v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v19 = HMFGetLogIdentifier();
        int v26 = 138543362;
        v27 = v19;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Connect called but accessory is no longer valid", (uint8_t *)&v26, 0xCu);
      }
      uint64_t v9 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1011];
      [(HMDDataStreamHAPTransport *)v17 _teardownSessionWithError:v9];
    }
  }
}

- (BOOL)_isRunning
{
  id v2 = [(HMDDataStreamHAPTransport *)self transportCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)HMDDataStreamHAPTransport;
  [(HMDDataStreamHAPTransport *)&v2 dealloc];
}

- (HMDDataStreamHAPTransport)initWithAccessory:(id)a3 sessionIdentifier:(int64_t)a4 maxControllerTransportMTU:(unint64_t)a5 workQueue:(id)a6 logIdentifier:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v31.receiver = self;
  v31.super_class = (Class)HMDDataStreamHAPTransport;
  id v15 = [(HMDDataStreamHAPTransport *)&v31 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_workQueue, a6);
    objc_storeWeak((id *)&v16->_accessory, v12);
    uint64_t v17 = [NSNumber numberWithInteger:a4];
    sessionIdentifier = v16->_sessionIdentifier;
    v16->_sessionIdentifier = (NSNumber *)v17;

    v16->_maxControllerTransportMTU = a5;
    uint64_t v19 = objc_opt_new();
    byteReader = v16->_byteReader;
    v16->_byteReader = (HMDDataStreamFrameReader *)v19;

    uint64_t v21 = [v14 copy];
    logIdentifier = v16->_logIdentifier;
    v16->_logIdentifier = (NSString *)v21;

    uint64_t v23 = [MEMORY[0x263EFF980] array];
    pendingWrites = v16->_pendingWrites;
    v16->_pendingWrites = (NSMutableArray *)v23;

    v25 = NSString;
    int v26 = [MEMORY[0x263F08C38] UUID];
    v27 = [v26 UUIDString];
    uint64_t v28 = [v25 stringWithFormat:@"%@.HMDDataStreamHAPTransport.%@", @"com.apple.HomeKitDaemon", v27];
    notificationClientIdentifier = v16->_notificationClientIdentifier;
    v16->_notificationClientIdentifier = (NSString *)v28;
  }
  return v16;
}

@end