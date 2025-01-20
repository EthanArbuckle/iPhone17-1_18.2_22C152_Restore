@interface HMDDataStreamBulkSendProtocol
+ (id)protocolName;
- (BOOL)isActive;
- (BOOL)isConnected;
- (HMDDataStreamBulkSendProtocol)initWithQueue:(id)a3 accessory:(id)a4 logIdentifier:(id)a5;
- (HMDDataStreamBulkSendProtocol)initWithQueue:(id)a3 accessory:(id)a4 logIdentifier:(id)a5 bulkSendSessionContextFactory:(id)a6;
- (HMDDataStreamProtocolDelegate)dataStream;
- (NSMapTable)activeBulkSendSessions;
- (NSMapTable)listeners;
- (NSMutableDictionary)pendingBulkSendSessionContextBySessionIdentifier;
- (NSString)logIdentifier;
- (OS_dispatch_queue)queue;
- (id)_createSessionCandidateWithRequestHeader:(id)a3 metadata:(id)a4;
- (id)_createSessionFromCandidate:(id)a3 queue:(id)a4;
- (id)_createSessionIdentifier;
- (id)_getBulkSendSessionForSessionIdentifier:(id)a3;
- (id)accessory;
- (id)bulkSendSessionContextFactory;
- (unsigned)nextSessionIdentifier;
- (void)_cancelSessionWithIdentifier:(id)a3 reason:(unsigned __int16)a4 hadReceivedEof:(BOOL)a5;
- (void)_closeAllSessionsWithError:(id)a3;
- (void)_handleCloseMessage:(id)a3;
- (void)_handleDataMessage:(id)a3;
- (void)_handleOpenWithRequestHeader:(id)a3 payload:(id)a4;
- (void)_notifyActiveStatusChangedFromPreviousValue:(BOOL)a3;
- (void)_openSessionForFileType:(id)a3 reason:(id)a4 metadata:(id)a5 queue:(id)a6 callback:(id)a7;
- (void)_pumpMessage:(id)a3 session:(id)a4;
- (void)_pumpReceiveFailure:(id)a3 session:(id)a4;
- (void)_rejectSessionCandidate:(id)a3 status:(unsigned __int16)a4;
- (void)_removeBulkSendSessionForSessionIdentifier:(id)a3;
- (void)_sendAckMessageWithIdentifier:(id)a3;
- (void)_sendCloseMessageWithIdentifier:(id)a3 reason:(unsigned __int16)a4;
- (void)_sendOpenResponseWithRequestHeader:(id)a3 bulkSendStatus:(unsigned __int16)a4;
- (void)_sendOpenResponseWithRequestHeader:(id)a3 payload:(id)a4 status:(unsigned __int16)a5;
- (void)_sendOpenResponseWithRequestHeader:(id)a3 status:(unsigned __int16)a4;
- (void)_sendOpenResponseWithRequestHeader:(id)a3 streamIdentifier:(id)a4;
- (void)_startSessionCandidate:(id)a3 queue:(id)a4 callback:(id)a5;
- (void)addListener:(id)a3 fileType:(id)a4;
- (void)asyncBulkSendSessionCandidate:(id)a3 didAcceptOnQueue:(id)a4 callback:(id)a5;
- (void)asyncBulkSendSessionCandidate:(id)a3 didRejectWithStatus:(unsigned __int16)a4;
- (void)asyncBulkSendSessionDidCancelSessionWithIdentifier:(id)a3 reason:(unsigned __int16)a4 hadReceivedEof:(BOOL)a5;
- (void)dataStream:(id)a3 didFailWithError:(id)a4;
- (void)dataStream:(id)a3 didReceiveEvent:(id)a4 header:(id)a5 payload:(id)a6;
- (void)dataStream:(id)a3 didReceiveRequest:(id)a4 header:(id)a5 payload:(id)a6;
- (void)dataStreamDidClose:(id)a3;
- (void)dataStreamDidOpen:(id)a3;
- (void)dataStreamInitiatedClose:(id)a3;
- (void)openSessionForFileType:(id)a3 reason:(id)a4 metadata:(id)a5 queue:(id)a6 callback:(id)a7;
- (void)removeListener:(id)a3;
- (void)setAccessory:(id)a3;
- (void)setDataStream:(id)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setListeners:(id)a3;
- (void)setNextSessionIdentifier:(unsigned int)a3;
- (void)setQueue:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDDataStreamBulkSendProtocol

- (void).cxx_destruct
{
  objc_storeStrong(&self->_bulkSendSessionContextFactory, 0);
  objc_storeStrong((id *)&self->_pendingBulkSendSessionContextBySessionIdentifier, 0);
  objc_storeStrong((id *)&self->_activeBulkSendSessions, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_destroyWeak(&self->_accessory);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_dataStream);
}

- (id)bulkSendSessionContextFactory
{
  return objc_getProperty(self, a2, 72, 1);
}

- (NSMutableDictionary)pendingBulkSendSessionContextBySessionIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (NSMapTable)activeBulkSendSessions
{
  return (NSMapTable *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNextSessionIdentifier:(unsigned int)a3
{
  self->_nextSessionIdentifier = a3;
}

- (unsigned)nextSessionIdentifier
{
  return self->_nextSessionIdentifier;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setListeners:(id)a3
{
}

- (NSMapTable)listeners
{
  return self->_listeners;
}

- (void)setAccessory:(id)a3
{
}

- (id)accessory
{
  id WeakRetained = objc_loadWeakRetained(&self->_accessory);
  return WeakRetained;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setDataStream:(id)a3
{
}

- (HMDDataStreamProtocolDelegate)dataStream
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataStream);
  return (HMDDataStreamProtocolDelegate *)WeakRetained;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDDataStreamBulkSendProtocol *)self queue];
  dispatch_assert_queue_V2(v5);

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v6 = [(HMDDataStreamBulkSendProtocol *)self pendingBulkSendSessionContextBySessionIdentifier];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v37;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v37 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v36 + 1) + 8 * v10);
      v12 = [(HMDDataStreamBulkSendProtocol *)self pendingBulkSendSessionContextBySessionIdentifier];
      v13 = [v12 objectForKey:v11];

      id v14 = [v13 handleOpenRequestResponseTimer];

      if (v14 == v4)
      {
        [v13 setHandleOpenRequestResponseTimer:0];
        id v16 = v11;
        v17 = (void *)MEMORY[0x230FBD990]();
        v18 = self;
        v19 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
          goto LABEL_16;
        }
        v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v41 = v20;
        __int16 v42 = 2112;
        id v43 = v16;
        v21 = "%{public}@Session with identifier: %@ open request response timer has expired";
        goto LABEL_15;
      }
      id v15 = [v13 sendCloseEventTimer];

      if (v15 == v4) {
        break;
      }

      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    [v13 setSendCloseEventTimer:0];
    id v16 = v11;
    v17 = (void *)MEMORY[0x230FBD990]();
    v22 = self;
    v19 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v41 = v20;
    __int16 v42 = 2112;
    id v43 = v16;
    v21 = "%{public}@Session with identifier: %@ send event close timer has expired";
LABEL_15:
    _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, v21, buf, 0x16u);

LABEL_16:

    if (!v16) {
      goto LABEL_21;
    }
    v23 = [(HMDDataStreamBulkSendProtocol *)self pendingBulkSendSessionContextBySessionIdentifier];
    v24 = [v23 objectForKeyedSubscript:v16];

    if ([v24 shouldCloseSessionWithTimeoutReason])
    {
      v25 = (void *)MEMORY[0x230FBD990]();
      v26 = self;
      v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v41 = v28;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Skipping invoking the session start callback since handle response timer hasn't expired", buf, 0xCu);
      }
    }
    else
    {
      v33 = [v24 sessionStartCallback];
      v34 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:8 userInfo:0];
      ((void (**)(void, void, void *))v33)[2](v33, 0, v34);
      v35 = [(HMDDataStreamBulkSendProtocol *)self pendingBulkSendSessionContextBySessionIdentifier];
      [v35 setObject:0 forKeyedSubscript:v16];
    }
  }
  else
  {
LABEL_10:

LABEL_21:
    v29 = (void *)MEMORY[0x230FBD990]();
    v30 = self;
    v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v41 = v32;
      __int16 v42 = 2112;
      id v43 = 0;
      _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Could not find expired timer for session with identifier: %@", buf, 0x16u);
    }
  }
}

- (void)_openSessionForFileType:(id)a3 reason:(id)a4 metadata:(id)a5 queue:(id)a6 callback:(id)a7
{
  v53[4] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = [(HMDDataStreamBulkSendProtocol *)self queue];
  dispatch_assert_queue_V2(v17);

  v18 = [(HMDDataStreamBulkSendProtocol *)self _createSessionIdentifier];
  v52[0] = @"type";
  v52[1] = @"streamId";
  v40 = v13;
  v41 = v12;
  v53[0] = v12;
  v53[1] = v18;
  v52[2] = @"target";
  v52[3] = @"reason";
  v53[2] = @"controller";
  v53[3] = v13;
  v19 = [NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:4];
  v20 = (void *)[v19 mutableCopy];

  if (v14 && [v14 count]) {
    [v20 setObject:v14 forKeyedSubscript:@"metadata"];
  }
  v21 = [(HMDDataStreamBulkSendProtocol *)self bulkSendSessionContextFactory];
  v22 = ((void (**)(void, id))v21)[2](v21, v16);

  v23 = [(HMDDataStreamBulkSendProtocol *)self pendingBulkSendSessionContextBySessionIdentifier];
  [v23 setObject:v22 forKeyedSubscript:v18];

  v24 = [v22 handleOpenRequestResponseTimer];
  [v24 setDelegate:self];

  v25 = [(HMDDataStreamBulkSendProtocol *)self queue];
  v26 = [v22 handleOpenRequestResponseTimer];
  [v26 setDelegateQueue:v25];

  v27 = [v22 handleOpenRequestResponseTimer];
  [v27 resume];

  v28 = [v22 sendCloseEventTimer];
  [v28 setDelegate:self];

  v29 = [(HMDDataStreamBulkSendProtocol *)self queue];
  v30 = [v22 sendCloseEventTimer];
  [v30 setDelegateQueue:v29];

  v31 = [v22 sendCloseEventTimer];
  [v31 resume];

  v32 = (void *)MEMORY[0x230FBD990]();
  v33 = self;
  v34 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    v35 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v47 = v35;
    __int16 v48 = 2112;
    v49 = v18;
    __int16 v50 = 2112;
    id v51 = v14;
    _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_INFO, "%{public}@Starting bulk session with identifier: %@ and metadata: %@", buf, 0x20u);
  }
  long long v36 = [(HMDDataStreamBulkSendProtocol *)v33 dataStream];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __88__HMDDataStreamBulkSendProtocol__openSessionForFileType_reason_metadata_queue_callback___block_invoke;
  v42[3] = &unk_264A23AE8;
  v42[4] = v33;
  id v43 = v18;
  id v44 = v15;
  id v45 = v16;
  id v37 = v15;
  id v38 = v16;
  id v39 = v18;
  [v36 sendRequestForProtocol:@"dataSend" topic:@"open" payload:v20 completion:v42];
}

void __88__HMDDataStreamBulkSendProtocol__openSessionForFileType_reason_metadata_queue_callback___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  uint64_t v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v10);

  v11 = [*(id *)(a1 + 32) pendingBulkSendSessionContextBySessionIdentifier];
  id v12 = [v11 objectForKey:*(void *)(a1 + 40)];

  id v13 = (void *)MEMORY[0x230FBD990]();
  id v14 = *(id *)(a1 + 32);
  id v15 = HMFGetOSLogHandle();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v16)
    {
      v17 = HMFGetLogIdentifier();
      v18 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v56 = v17;
      __int16 v57 = 2112;
      v58 = v18;
      __int16 v59 = 2112;
      v60 = v7;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Received bulk send open response for session with identifier: %@ error: %@", buf, 0x20u);
    }
    v19 = [*(id *)(a1 + 32) pendingBulkSendSessionContextBySessionIdentifier];
    [v19 removeObjectForKey:*(void *)(a1 + 40)];

    if ([v12 shouldCloseSessionWithTimeoutReason])
    {
      v20 = (void *)MEMORY[0x230FBD990]();
      id v21 = *(id *)(a1 + 32);
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = HMFGetLogIdentifier();
        v24 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v56 = v23;
        __int16 v57 = 2112;
        v58 = v24;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Session with identifier: %@ has timed out, sending close event to accessory", buf, 0x16u);
      }
      [*(id *)(a1 + 32) _sendCloseMessageWithIdentifier:*(void *)(a1 + 40) reason:6];
      v25 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:8 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else if (v7)
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      v28 = objc_msgSend(v8, "hmf_numberForKey:", @"status");
      v29 = v28;
      if (v28)
      {
        unsigned __int16 v30 = [v28 integerValue];
        v54 = v29;
        if (v30)
        {
          unsigned __int16 v31 = v30;
          objc_msgSend(v9, "hmf_numberForKey:", @"status");
          v32 = (HMDDataStreamBulkSendSession *)objc_claimAutoreleasedReturnValue();
          v33 = v32;
          if (v32)
          {
            if ([(HMDDataStreamBulkSendSession *)v32 integerValue] == 2) {
              uint64_t v34 = 14;
            }
            else {
              uint64_t v34 = 23;
            }
            if ([(HMDDataStreamBulkSendSession *)v33 integerValue] == 9) {
              uint64_t v35 = 21;
            }
            else {
              uint64_t v35 = v34;
            }
          }
          else
          {
            uint64_t v35 = 23;
          }
          v47 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:v35 userInfo:0];
          context = (void *)MEMORY[0x230FBD990]();
          id v48 = *(id *)(a1 + 32);
          v49 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            __int16 v50 = v52 = v47;
            id v51 = HMDStringFromDataStreamMessageStatus(v31);
            *(_DWORD *)buf = 138544130;
            v56 = v50;
            __int16 v57 = 2112;
            v58 = v51;
            __int16 v59 = 2112;
            v60 = v33;
            __int16 v61 = 2112;
            v62 = v52;
            _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_ERROR, "%{public}@Received non-success status in header: %@ payload status: %@. Mapped to error: %@", buf, 0x2Au);

            v47 = v52;
          }

          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

          v29 = v54;
        }
        else
        {
          v40 = [HMDDataStreamBulkSendSession alloc];
          v41 = *(void **)(a1 + 32);
          uint64_t v42 = *(void *)(a1 + 40);
          uint64_t v43 = *(void *)(a1 + 48);
          id v44 = [v41 logIdentifier];
          v33 = [(HMDDataStreamBulkSendSession *)v40 initWithProtocol:v41 sessionIdentifier:v42 queue:v43 logIdentifier:v44];

          v29 = v54;
          id v45 = [*(id *)(a1 + 32) activeBulkSendSessions];
          [v45 setObject:v33 forKey:*(void *)(a1 + 40)];

          v46 = [[HMDDataStreamBulkSendOpenSessionResult alloc] initWithSession:v33 payload:v9];
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        }
      }
      else
      {
        long long v36 = (void *)MEMORY[0x230FBD990]();
        id v37 = *(id *)(a1 + 32);
        id v38 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          id v39 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v56 = v39;
          _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_ERROR, "%{public}@Could not find a status in header", buf, 0xCu);
        }
        v33 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:27 userInfo:0];
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }
    }
  }
  else
  {
    if (v16)
    {
      v26 = HMFGetLogIdentifier();
      v27 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v56 = v26;
      __int16 v57 = 2112;
      v58 = v27;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Could not find pending bulk send session context for session identifier: %@", buf, 0x16u);
    }
    [*(id *)(a1 + 32) _sendCloseMessageWithIdentifier:*(void *)(a1 + 40) reason:6];
  }
}

- (void)openSessionForFileType:(id)a3 reason:(id)a4 metadata:(id)a5 queue:(id)a6 callback:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = [(HMDDataStreamBulkSendProtocol *)self queue];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __87__HMDDataStreamBulkSendProtocol_openSessionForFileType_reason_metadata_queue_callback___block_invoke;
  v23[3] = &unk_264A2DF78;
  v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(v17, v23);
}

uint64_t __87__HMDDataStreamBulkSendProtocol_openSessionForFileType_reason_metadata_queue_callback___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _openSessionForFileType:*(void *)(a1 + 40) reason:*(void *)(a1 + 48) metadata:*(void *)(a1 + 56) queue:*(void *)(a1 + 64) callback:*(void *)(a1 + 72)];
}

- (void)_sendAckMessageWithIdentifier:(id)a3
{
  v16[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDDataStreamBulkSendProtocol *)self dataStream];
  if (v5)
  {
    v15[0] = @"streamId";
    v15[1] = @"endOfStream";
    v16[0] = v4;
    v16[1] = MEMORY[0x263EFFA88];
    v6 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
    uint64_t v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v11 = 138543618;
      id v12 = v10;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Sending 'ack' for sid=%@", (uint8_t *)&v11, 0x16u);
    }
    [v5 sendEventForProtocol:@"dataSend" topic:@"ack" payload:v6 completion:&__block_literal_global_46_177769];
  }
}

- (void)_sendCloseMessageWithIdentifier:(id)a3 reason:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  v21[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(HMDDataStreamBulkSendProtocol *)self dataStream];
  if (v7)
  {
    v20[0] = @"streamId";
    v20[1] = @"reason";
    v21[0] = v6;
    id v8 = [NSNumber numberWithUnsignedShort:v4];
    v21[1] = v8;
    id v9 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];

    uint64_t v10 = (void *)MEMORY[0x230FBD990]();
    int v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = HMFGetLogIdentifier();
      int v14 = 138543874;
      id v15 = v13;
      __int16 v16 = 2112;
      id v17 = v6;
      __int16 v18 = 1024;
      int v19 = v4;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Sending 'close' for sid=%@ with reason %d", (uint8_t *)&v14, 0x1Cu);
    }
    [v7 sendEventForProtocol:@"dataSend" topic:@"close" payload:v9 completion:&__block_literal_global_44_177773];
  }
}

- (void)_cancelSessionWithIdentifier:(id)a3 reason:(unsigned __int16)a4 hadReceivedEof:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = a4;
  id v8 = a3;
  -[HMDDataStreamBulkSendProtocol _removeBulkSendSessionForSessionIdentifier:](self, "_removeBulkSendSessionForSessionIdentifier:");
  if (v6 || !v5) {
    [(HMDDataStreamBulkSendProtocol *)self _sendCloseMessageWithIdentifier:v8 reason:v6];
  }
  else {
    [(HMDDataStreamBulkSendProtocol *)self _sendAckMessageWithIdentifier:v8];
  }
}

- (void)_pumpReceiveFailure:(id)a3 session:(id)a4
{
  id v6 = a4;
  [v6 asyncHandleRemoteCloseWithError:a3];
  id v7 = [v6 sessionIdentifier];

  [(HMDDataStreamBulkSendProtocol *)self _removeBulkSendSessionForSessionIdentifier:v7];
}

- (void)_pumpMessage:(id)a3 session:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:@"packets"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  int v11 = [v6 objectForKeyedSubscript:@"endOfStream"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  if (!v13)
  {
    if (!v10) {
      goto LABEL_15;
    }
    uint64_t v15 = 0;
    goto LABEL_13;
  }
  uint64_t v14 = [v13 BOOLValue];
  uint64_t v15 = v14;
  if (v10)
  {
LABEL_13:
    uint64_t v16 = [v10 count];
    if ((v15 & 1) != 0 || v16) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }
  if (v14)
  {
    uint64_t v15 = 1;
LABEL_18:
    [v7 asyncHandleIncomingPackets:v10 isEof:v15];
    goto LABEL_19;
  }
LABEL_15:
  id v17 = (void *)MEMORY[0x230FBD990]();
  __int16 v18 = self;
  int v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = HMFGetLogIdentifier();
    int v21 = 138543362;
    id v22 = v20;
    _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Received message with no packets", (uint8_t *)&v21, 0xCu);
  }
LABEL_19:
}

- (void)_handleDataMessage:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 objectForKeyedSubscript:@"streamId"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = [(HMDDataStreamBulkSendProtocol *)self _getBulkSendSessionForSessionIdentifier:v7];
    if (v8)
    {
      [(HMDDataStreamBulkSendProtocol *)self _pumpMessage:v4 session:v8];
    }
    else
    {
      id v13 = (void *)MEMORY[0x230FBD990]();
      uint64_t v14 = self;
      uint64_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v16 = HMFGetLogIdentifier();
        int v17 = 138543618;
        __int16 v18 = v16;
        __int16 v19 = 2112;
        id v20 = v7;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Data packet for streamIdentifier=%@ dropped because no session is active", (uint8_t *)&v17, 0x16u);
      }
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = self;
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      int v17 = 138543362;
      __int16 v18 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Data packet dropped because no session identifier was present", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (void)_handleCloseMessage:(id)a3
{
  v31[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 objectForKeyedSubscript:@"streamId"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [v4 objectForKeyedSubscript:@"reason"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (v7)
  {
    if (v10) {
      id v10 = v8;
    }
    else {
      id v10 = &unk_26E472550;
    }
    int v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F0C710];
    unsigned __int16 v30 = @"reason";
    v31[0] = v10;
    id v13 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
    uint64_t v14 = [v11 errorWithDomain:v12 code:1054 userInfo:v13];

    uint64_t v15 = [(HMDDataStreamBulkSendProtocol *)self _getBulkSendSessionForSessionIdentifier:v7];
    uint64_t v16 = (void *)MEMORY[0x230FBD990]();
    int v17 = self;
    __int16 v18 = HMFGetOSLogHandle();
    __int16 v19 = v18;
    if (v15)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = HMFGetLogIdentifier();
        int v26 = 138543618;
        id v27 = v20;
        __int16 v28 = 2112;
        id v29 = v7;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Received close packet for stream identifier: %@", (uint8_t *)&v26, 0x16u);
      }
      [(HMDDataStreamBulkSendProtocol *)v17 _pumpReceiveFailure:v14 session:v15];
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        id v25 = HMFGetLogIdentifier();
        int v26 = 138543618;
        id v27 = v25;
        __int16 v28 = 2112;
        id v29 = v7;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Close packet for streamIdentifier=%@ dropped because no session is active", (uint8_t *)&v26, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v21 = (void *)MEMORY[0x230FBD990]();
    id v22 = self;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = HMFGetLogIdentifier();
      int v26 = 138543362;
      id v27 = v24;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Close dropped because streamIdentifier was not included", (uint8_t *)&v26, 0xCu);
    }
  }
}

- (void)_handleOpenWithRequestHeader:(id)a3 payload:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  int v11 = [v7 objectForKeyedSubscript:@"target"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  uint64_t v14 = [v7 objectForKeyedSubscript:@"metadata"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  id v16 = v15;

  if (v10 && v13)
  {
    int v17 = [(HMDDataStreamBulkSendProtocol *)self listeners];
    __int16 v18 = [v17 objectForKey:v10];

    __int16 v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = self;
    uint64_t v21 = HMFGetOSLogHandle();
    id v22 = v21;
    if (v18)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v23 = HMFGetLogIdentifier();
        int v31 = 138543618;
        v32 = v23;
        __int16 v33 = 2112;
        id v34 = v10;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Received 'open' with type=%@; passing to listener",
          (uint8_t *)&v31,
          0x16u);
      }
      id v24 = [(HMDDataStreamBulkSendProtocol *)v20 _createSessionCandidateWithRequestHeader:v6 metadata:v16];
      id v25 = [(HMDDataStreamBulkSendProtocol *)v20 accessory];
      [v18 accessory:v25 didReceiveBulkSessionCandidate:v24];
    }
    else
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        unsigned __int16 v30 = HMFGetLogIdentifier();
        int v31 = 138543618;
        v32 = v30;
        __int16 v33 = 2112;
        id v34 = v10;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Received 'open' for type=%@ but no active listener accepted it", (uint8_t *)&v31, 0x16u);
      }
      [(HMDDataStreamBulkSendProtocol *)v20 _maybeSubmitMetricForDroppedOpenRequestOfType:v10];
      [(HMDDataStreamBulkSendProtocol *)v20 _sendOpenResponseWithRequestHeader:v6 bulkSendStatus:1];
    }
  }
  else
  {
    int v26 = (void *)MEMORY[0x230FBD990]();
    id v27 = self;
    __int16 v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      id v29 = HMFGetLogIdentifier();
      int v31 = 138543874;
      v32 = v29;
      __int16 v33 = 2112;
      id v34 = v10;
      __int16 v35 = 2112;
      id v36 = v13;
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Dropping 'open' because it is missing required keys (type=%@, target=%@)", (uint8_t *)&v31, 0x20u);
    }
    [(HMDDataStreamBulkSendProtocol *)v27 _sendOpenResponseWithRequestHeader:v6 status:4];
  }
}

- (void)_removeBulkSendSessionForSessionIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDDataStreamBulkSendProtocol *)self activeBulkSendSessions];
  [v5 removeObjectForKey:v4];
}

- (id)_getBulkSendSessionForSessionIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDDataStreamBulkSendProtocol *)self activeBulkSendSessions];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)_rejectSessionCandidate:(id)a3 status:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = [a3 requestHeader];
  [(HMDDataStreamBulkSendProtocol *)self _sendOpenResponseWithRequestHeader:v6 bulkSendStatus:v4];
}

- (void)_startSessionCandidate:(id)a3 queue:(id)a4 callback:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(HMDDataStreamBulkSendProtocol *)self _createSessionFromCandidate:v8 queue:v9];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v12 = [v8 pendingReads];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v25;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        [(HMDDataStreamBulkSendProtocol *)self _pumpMessage:*(void *)(*((void *)&v24 + 1) + 8 * v16++) session:v11];
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v14);
  }

  int v17 = [v8 receivedFailure];

  if (v17)
  {
    __int16 v18 = [v8 receivedFailure];
    [(HMDDataStreamBulkSendProtocol *)self _pumpReceiveFailure:v18 session:v11];
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __71__HMDDataStreamBulkSendProtocol__startSessionCandidate_queue_callback___block_invoke;
  void v21[3] = &unk_264A2F870;
  id v22 = v11;
  id v23 = v10;
  id v19 = v11;
  id v20 = v10;
  dispatch_async(v9, v21);
}

uint64_t __71__HMDDataStreamBulkSendProtocol__startSessionCandidate_queue_callback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_createSessionIdentifier
{
  v3 = NSNumber;
  uint64_t v4 = [(HMDDataStreamBulkSendProtocol *)self nextSessionIdentifier];
  [(HMDDataStreamBulkSendProtocol *)self setNextSessionIdentifier:(v4 + 1)];
  return (id)[v3 numberWithUnsignedInt:v4];
}

- (void)_sendOpenResponseWithRequestHeader:(id)a3 status:(unsigned __int16)a4
{
}

- (void)_sendOpenResponseWithRequestHeader:(id)a3 payload:(id)a4 status:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HMDDataStreamBulkSendProtocol *)self dataStream];
  if (v10)
  {
    int v11 = (void *)MEMORY[0x230FBD990]();
    uint64_t v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      uint64_t v15 = HMDStringFromDataStreamMessageStatus(v5);
      *(_DWORD *)buf = 138543874;
      __int16 v18 = v14;
      __int16 v19 = 2112;
      id v20 = v15;
      __int16 v21 = 2048;
      uint64_t v22 = v5;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Sending open response with status %@ (%ld)", buf, 0x20u);
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __83__HMDDataStreamBulkSendProtocol__sendOpenResponseWithRequestHeader_payload_status___block_invoke;
    void v16[3] = &unk_264A2F3E8;
    v16[4] = v12;
    [v10 sendResponseForRequestHeader:v8 payload:v9 status:v5 completion:v16];
  }
}

void __83__HMDDataStreamBulkSendProtocol__sendOpenResponseWithRequestHeader_payload_status___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v13 = 138543618;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      id v16 = v3;
      id v9 = "%{public}@Failed to send open response: %@";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v10, v11, v9, (uint8_t *)&v13, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v13 = 138543362;
    uint64_t v14 = v8;
    id v9 = "%{public}@Sent open response";
    id v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_INFO;
    uint32_t v12 = 12;
    goto LABEL_6;
  }
}

- (void)_sendOpenResponseWithRequestHeader:(id)a3 bulkSendStatus:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  v11[1] = *MEMORY[0x263EF8340];
  id v10 = @"status";
  id v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithUnsignedShort:v4];
  v11[0] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];

  [(HMDDataStreamBulkSendProtocol *)self _sendOpenResponseWithRequestHeader:v7 payload:v9 status:6];
}

- (void)_sendOpenResponseWithRequestHeader:(id)a3 streamIdentifier:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v10 = @"streamId";
  v11[0] = a4;
  id v6 = NSDictionary;
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 dictionaryWithObjects:v11 forKeys:&v10 count:1];

  [(HMDDataStreamBulkSendProtocol *)self _sendOpenResponseWithRequestHeader:v8 payload:v9 status:0];
}

- (id)_createSessionFromCandidate:(id)a3 queue:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDDataStreamBulkSendProtocol *)self _createSessionIdentifier];
  id v9 = [HMDDataStreamBulkSendSession alloc];
  id v10 = [(HMDDataStreamBulkSendProtocol *)self logIdentifier];
  os_log_type_t v11 = [(HMDDataStreamBulkSendSession *)v9 initWithProtocol:self sessionIdentifier:v8 queue:v7 logIdentifier:v10];

  uint32_t v12 = (void *)MEMORY[0x230FBD990]();
  int v13 = self;
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    __int16 v15 = HMFGetLogIdentifier();
    int v19 = 138543618;
    id v20 = v15;
    __int16 v21 = 2112;
    uint64_t v22 = v8;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Creating new receive session with streamIdentifier=%@", (uint8_t *)&v19, 0x16u);
  }
  id v16 = [(HMDDataStreamBulkSendProtocol *)v13 activeBulkSendSessions];
  [v16 setObject:v11 forKey:v8];

  uint64_t v17 = [v6 requestHeader];
  [(HMDDataStreamBulkSendProtocol *)v13 _sendOpenResponseWithRequestHeader:v17 streamIdentifier:v8];

  return v11;
}

- (id)_createSessionCandidateWithRequestHeader:(id)a3 metadata:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    os_log_type_t v11 = HMFGetLogIdentifier();
    int v14 = 138543618;
    __int16 v15 = v11;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Creating new receive candidate session (header %@)", (uint8_t *)&v14, 0x16u);
  }
  uint32_t v12 = [[HMDDataStreamBulkSendSessionCandidate alloc] initWithProtocol:v9 requestHeader:v6 metadata:v7];

  return v12;
}

- (void)asyncBulkSendSessionDidCancelSessionWithIdentifier:(id)a3 reason:(unsigned __int16)a4 hadReceivedEof:(BOOL)a5
{
  id v8 = a3;
  id v9 = [(HMDDataStreamBulkSendProtocol *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __106__HMDDataStreamBulkSendProtocol_asyncBulkSendSessionDidCancelSessionWithIdentifier_reason_hadReceivedEof___block_invoke;
  block[3] = &unk_264A23AC0;
  block[4] = self;
  id v12 = v8;
  unsigned __int16 v13 = a4;
  BOOL v14 = a5;
  id v10 = v8;
  dispatch_async(v9, block);
}

uint64_t __106__HMDDataStreamBulkSendProtocol_asyncBulkSendSessionDidCancelSessionWithIdentifier_reason_hadReceivedEof___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelSessionWithIdentifier:*(void *)(a1 + 40) reason:*(unsigned __int16 *)(a1 + 48) hadReceivedEof:*(unsigned __int8 *)(a1 + 50)];
}

- (void)asyncBulkSendSessionCandidate:(id)a3 didRejectWithStatus:(unsigned __int16)a4
{
  id v6 = a3;
  id v7 = [(HMDDataStreamBulkSendProtocol *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__HMDDataStreamBulkSendProtocol_asyncBulkSendSessionCandidate_didRejectWithStatus___block_invoke;
  block[3] = &unk_264A26DE8;
  block[4] = self;
  id v10 = v6;
  unsigned __int16 v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __83__HMDDataStreamBulkSendProtocol_asyncBulkSendSessionCandidate_didRejectWithStatus___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rejectSessionCandidate:*(void *)(a1 + 40) status:*(unsigned __int16 *)(a1 + 48)];
}

- (void)asyncBulkSendSessionCandidate:(id)a3 didAcceptOnQueue:(id)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned __int16 v11 = [(HMDDataStreamBulkSendProtocol *)self queue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = __89__HMDDataStreamBulkSendProtocol_asyncBulkSendSessionCandidate_didAcceptOnQueue_callback___block_invoke;
  v15[3] = &unk_264A2EE30;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __89__HMDDataStreamBulkSendProtocol_asyncBulkSendSessionCandidate_didAcceptOnQueue_callback___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startSessionCandidate:*(void *)(a1 + 40) queue:*(void *)(a1 + 48) callback:*(void *)(a1 + 56)];
}

- (void)dataStream:(id)a3 didReceiveRequest:(id)a4 header:(id)a5 payload:(id)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(HMDDataStreamBulkSendProtocol *)self isConnected])
  {
    if ([v11 isEqualToString:@"open"])
    {
      [(HMDDataStreamBulkSendProtocol *)self _handleOpenWithRequestHeader:v12 payload:v13];
    }
    else
    {
      id v14 = (void *)MEMORY[0x230FBD990]();
      __int16 v15 = self;
      id v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        id v17 = HMFGetLogIdentifier();
        int v18 = 138543618;
        int v19 = v17;
        __int16 v20 = 2112;
        id v21 = v11;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@DataSend received unexpected request '%@'", (uint8_t *)&v18, 0x16u);
      }
    }
  }
}

- (void)dataStream:(id)a3 didReceiveEvent:(id)a4 header:(id)a5 payload:(id)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (![(HMDDataStreamBulkSendProtocol *)self isConnected])
  {
    id v14 = (void *)MEMORY[0x230FBD990]();
    __int16 v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      id v17 = HMFGetLogIdentifier();
      int v21 = 138543618;
      uint64_t v22 = v17;
      __int16 v23 = 2112;
      id v24 = v11;
      int v18 = "%{public}@BulkSend dropping message because it is not running (topic=%@).";
      int v19 = v16;
      os_log_type_t v20 = OS_LOG_TYPE_DEBUG;
LABEL_10:
      _os_log_impl(&dword_22F52A000, v19, v20, v18, (uint8_t *)&v21, 0x16u);
    }
LABEL_11:

    goto LABEL_12;
  }
  if (![v11 isEqualToString:@"data"])
  {
    if ([v11 isEqualToString:@"close"])
    {
      [(HMDDataStreamBulkSendProtocol *)self _handleCloseMessage:v13];
      goto LABEL_12;
    }
    id v14 = (void *)MEMORY[0x230FBD990]();
    __int16 v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = HMFGetLogIdentifier();
      int v21 = 138543618;
      uint64_t v22 = v17;
      __int16 v23 = 2112;
      id v24 = v11;
      int v18 = "%{public}@DataSend received unexpected event '%@'";
      int v19 = v16;
      os_log_type_t v20 = OS_LOG_TYPE_INFO;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  [(HMDDataStreamBulkSendProtocol *)self _handleDataMessage:v13];
LABEL_12:
}

- (void)dataStreamDidOpen:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v23 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@DataStream did open; connected.", buf, 0xCu);
  }
  [(HMDDataStreamBulkSendProtocol *)v6 setIsConnected:1];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = [(HMDDataStreamBulkSendProtocol *)v6 listeners];
  id v10 = [v9 objectEnumerator];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        __int16 v15 = *(void **)(*((void *)&v17 + 1) + 8 * v14);
        if (v15)
        {
          id v16 = [(HMDDataStreamBulkSendProtocol *)v6 accessory];
          [v15 accessoryDidStartListening:v16];
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
}

- (void)dataStreamDidClose:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@DataStream closed; cleaning up",
      (uint8_t *)&v9,
      0xCu);
  }
  [(HMDDataStreamBulkSendProtocol *)v6 _closeAllSessionsWithError:0];
}

- (void)dataStreamInitiatedClose:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@DataStream initiated closing...", (uint8_t *)&v9, 0xCu);
  }
}

- (void)dataStream:(id)a3 didFailWithError:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  int v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v12 = 138543618;
    uint64_t v13 = v11;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@DataStream failed with error; cleaning up. (%@)",
      (uint8_t *)&v12,
      0x16u);
  }
  [(HMDDataStreamBulkSendProtocol *)v9 _closeAllSessionsWithError:v7];
}

- (BOOL)isActive
{
  v2 = [(HMDDataStreamBulkSendProtocol *)self listeners];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)_closeAllSessionsWithError:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = [(HMDDataStreamBulkSendProtocol *)v6 listeners];
    uint64_t v10 = [v9 count];
    uint64_t v11 = [(HMDDataStreamBulkSendProtocol *)v6 activeBulkSendSessions];
    *(_DWORD *)buf = 138543874;
    uint64_t v43 = v8;
    __int16 v44 = 2048;
    uint64_t v45 = v10;
    __int16 v46 = 2048;
    uint64_t v47 = [v11 count];
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Session closed; removing %lu listeners and closing %lu sessions",
      buf,
      0x20u);
  }
  [(HMDDataStreamBulkSendProtocol *)v6 setIsConnected:0];
  if (v4)
  {
    uint64_t v40 = *MEMORY[0x263F08608];
    id v41 = v4;
    int v12 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
  }
  else
  {
    int v12 = 0;
  }
  uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08570] code:-1005 userInfo:v12];
  __int16 v14 = [(HMDDataStreamBulkSendProtocol *)v6 accessory];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v15 = [(HMDDataStreamBulkSendProtocol *)v6 activeBulkSendSessions];
  uint64_t v16 = [v15 objectEnumerator];

  uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v35;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v35 != v19) {
          objc_enumerationMutation(v16);
        }
        int v21 = *(void **)(*((void *)&v34 + 1) + 8 * v20);
        if (v21) {
          [v21 asyncHandleRemoteCloseWithError:v13];
        }
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v18);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v22 = [(HMDDataStreamBulkSendProtocol *)v6 listeners];
  __int16 v23 = [v22 objectEnumerator];

  uint64_t v24 = [v23 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v31;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v31 != v26) {
          objc_enumerationMutation(v23);
        }
        [*(id *)(*((void *)&v30 + 1) + 8 * v27++) accessory:v14 didCloseDataStreamWithError:v4];
      }
      while (v25 != v27);
      uint64_t v25 = [v23 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v25);
  }

  __int16 v28 = [(HMDDataStreamBulkSendProtocol *)v6 listeners];
  [v28 removeAllObjects];

  uint64_t v29 = [(HMDDataStreamBulkSendProtocol *)v6 activeBulkSendSessions];
  [v29 removeAllObjects];
}

- (void)_notifyActiveStatusChangedFromPreviousValue:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([(HMDDataStreamBulkSendProtocol *)self isActive] != a3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      [(HMDDataStreamBulkSendProtocol *)v5 isActive];
      id v8 = HMFBooleanToString();
      int v10 = 138543618;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@BulkSend protocol changes active to %@", (uint8_t *)&v10, 0x16u);
    }
    int v9 = [(HMDDataStreamBulkSendProtocol *)v5 dataStream];
    [v9 protocolDidUpdateActiveStatus:v5];
  }
}

- (void)removeListener:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(HMDDataStreamBulkSendProtocol *)self isActive];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = [(HMDDataStreamBulkSendProtocol *)self listeners];
  id v7 = [v6 keyEnumerator];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = [(HMDDataStreamBulkSendProtocol *)self listeners];
        id v14 = [v13 objectForKey:v12];

        if (v14 == v4)
        {
          id v15 = [(HMDDataStreamBulkSendProtocol *)self listeners];
          [v15 removeObjectForKey:v12];

          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  uint64_t v16 = [(HMDDataStreamBulkSendProtocol *)self accessory];
  [v4 accessory:v16 didCloseDataStreamWithError:0];

  [(HMDDataStreamBulkSendProtocol *)self _notifyActiveStatusChangedFromPreviousValue:v5];
}

- (void)addListener:(id)a3 fileType:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(HMDDataStreamBulkSendProtocol *)self isActive];
  uint64_t v9 = [(HMDDataStreamBulkSendProtocol *)self listeners];
  uint64_t v10 = [v9 objectForKey:v7];

  uint64_t v11 = [(HMDDataStreamBulkSendProtocol *)self accessory];
  if (v10)
  {
    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    uint64_t v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = HMFGetLogIdentifier();
      int v17 = 138543618;
      long long v18 = v15;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Rejecting BulkSend registration for file type %@; handler already exists",
        (uint8_t *)&v17,
        0x16u);
    }
    [v6 accessory:v11 didCloseDataStreamWithError:0];
  }
  else
  {
    uint64_t v16 = [(HMDDataStreamBulkSendProtocol *)self listeners];
    [v16 setObject:v6 forKey:v7];

    if ([(HMDDataStreamBulkSendProtocol *)self isConnected]) {
      [v6 accessoryDidStartListening:v11];
    }
    [(HMDDataStreamBulkSendProtocol *)self _notifyActiveStatusChangedFromPreviousValue:v8];
  }
}

- (HMDDataStreamBulkSendProtocol)initWithQueue:(id)a3 accessory:(id)a4 logIdentifier:(id)a5 bulkSendSessionContextFactory:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v28.receiver = self;
  v28.super_class = (Class)HMDDataStreamBulkSendProtocol;
  id v15 = [(HMDDataStreamBulkSendProtocol *)&v28 init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_queue, a3);
    objc_storeWeak(&v16->_accessory, v12);
    uint64_t v17 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    listeners = v16->_listeners;
    v16->_listeners = (NSMapTable *)v17;

    uint64_t v19 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    activeBulkSendSessions = v16->_activeBulkSendSessions;
    v16->_activeBulkSendSessions = (NSMapTable *)v19;

    v16->_isConnected = 0;
    v16->_nextSessionIdentifier = 1;
    uint64_t v21 = _Block_copy(v14);
    id bulkSendSessionContextFactory = v16->_bulkSendSessionContextFactory;
    v16->_id bulkSendSessionContextFactory = v21;

    __int16 v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    pendingBulkSendSessionContextBySessionIdentifier = v16->_pendingBulkSendSessionContextBySessionIdentifier;
    v16->_pendingBulkSendSessionContextBySessionIdentifier = v23;

    uint64_t v25 = [v13 copy];
    logIdentifier = v16->_logIdentifier;
    v16->_logIdentifier = (NSString *)v25;
  }
  return v16;
}

- (HMDDataStreamBulkSendProtocol)initWithQueue:(id)a3 accessory:(id)a4 logIdentifier:(id)a5
{
  return [(HMDDataStreamBulkSendProtocol *)self initWithQueue:a3 accessory:a4 logIdentifier:a5 bulkSendSessionContextFactory:&__block_literal_global_177812];
}

HMDDataStreamBulkSendPendingSessionContext *__71__HMDDataStreamBulkSendProtocol_initWithQueue_accessory_logIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F42658];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithTimeInterval:0 options:5.0];
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:10.0];
  id v6 = [[HMDDataStreamBulkSendPendingSessionContext alloc] initWithSessionStartCallback:v3 handleOpenRequestResponseTimer:v4 sendCloseEventTimer:v5];

  return v6;
}

+ (id)protocolName
{
  v2 = @"dataSend";
  return @"dataSend";
}

@end