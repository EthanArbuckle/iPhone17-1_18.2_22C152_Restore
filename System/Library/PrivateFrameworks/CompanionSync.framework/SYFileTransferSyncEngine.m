@interface SYFileTransferSyncEngine
- (BOOL)_sessionDeviceCanUseSingleMessages;
- (BOOL)_shouldTreatAsSessionEnd:(id)a3;
- (BOOL)buffersHandshake;
- (BOOL)buffersSessions;
- (BOOL)isInSession;
- (BOOL)resume:(id *)a3;
- (BOOL)targetIsNearby;
- (NSDictionary)customIDSOptions;
- (SYFileTransferSyncEngine)initWithService:(id)a3 queue:(id)a4;
- (id)_assumeOwnershipOfURL:(id)a3 error:(id *)a4;
- (id)_fileTransferHeader;
- (id)_wrapIncomingMessage:(id)a3 ofType:(unsigned __int16)a4 identifier:(id)a5;
- (id)_wrapIncomingResponse:(id)a3 ofType:(unsigned __int16)a4 identifier:(id)a5;
- (id)_wrapMessage:(id)a3 ofType:(unsigned __int16)a4 userInfo:(id)a5;
- (id)_wrapResponse:(id)a3 toRequest:(id)a4 ofType:(unsigned __int16)a5;
- (id)cancelMessagesReturningFailures:(id)a3;
- (id)idsOptions:(id)a3;
- (id)idsOptions:(id)a3 forFileTransfer:(BOOL)a4;
- (id)outputStreamWithMetadata:(id)a3 priority:(int64_t)a4 options:(id)a5 context:(id)a6 error:(id *)a7;
- (id)stateForLogging;
- (unint64_t)_crcChecksum:(id)a3;
- (void)_cancelResponses;
- (void)_cancelSession;
- (void)_consumeRemainingStreamDataWithIdentifier:(id)a3 completion:(id)a4;
- (void)_enqueueSingleMessage:(id)a3 withMessageID:(unsigned __int16)a4 priority:(int64_t)a5 options:(id)a6 userContext:(id)a7 callback:(id)a8;
- (void)_handleError:(id)a3 messageID:(id)a4 streamer:(id)a5;
- (void)_handleIncomingSessionFileAtOwnedURL:(id)a3 metadata:(id)a4 identifier:(id)a5 idsContext:(id)a6;
- (void)_handleIncomingSessionFileAtURL:(id)a3 metadata:(id)a4 identifier:(id)a5 idsContext:(id)a6;
- (void)_handleIncomingStreamDataWithIdentifier:(id)a3 completion:(id)a4;
- (void)_handleProtobuf:(id)a3 ofType:(unsigned __int16)a4 identifier:(id)a5 isResponse:(BOOL)a6 withCompletion:(id)a7;
- (void)_handleSessionRestart:(id)a3 priority:(int64_t)a4 options:(id)a5 userContext:(id)a6 callback:(id)a7;
- (void)_processNMSMessageData:(id)a3 context:(id)a4;
- (void)_readNextProtobuf:(id)a3;
- (void)_reallyHandleSessionRestart:(id)a3 priority:(int64_t)a4 options:(id)a5 userContext:(id)a6 callback:(id)a7;
- (void)_recordLastSeqNo:(id)a3;
- (void)_resumeIdsQueue;
- (void)_suspendIdsQueue;
- (void)beginResponseSession;
- (void)beginSession;
- (void)dealloc;
- (void)endFileTransferForStream:(id)a3 atURL:(id)a4 target:(id)a5 wasCancelled:(BOOL)a6 messageRows:(id)a7;
- (void)endResponseSession;
- (void)endSession;
- (void)enqueueSyncRequest:(id)a3 withMessageID:(unsigned __int16)a4 priority:(int64_t)a5 options:(id)a6 userContext:(id)a7 callback:(id)a8;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)setCustomIDSOptions:(id)a3;
- (void)suspend;
@end

@implementation SYFileTransferSyncEngine

- (SYFileTransferSyncEngine)initWithService:(id)a3 queue:(id)a4
{
  id v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SYFileTransferSyncEngine;
  v7 = [(SYSyncEngine *)&v31 initWithService:v6 queue:a4];
  if (v7)
  {
    id v8 = [NSString alloc];
    v9 = [v6 name];
    v10 = [v9 lastPathComponent];
    v11 = (void *)[v8 initWithFormat:@"%@ SYFileTransferSyncEngine IDS Queue", v10];

    int relative_priority_ptr = 0;
    v12 = [(SYSyncEngine *)v7 queue];
    LODWORD(v9) = dispatch_queue_get_qos_class(v12, &relative_priority_ptr);

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = dispatch_queue_attr_make_with_qos_class(v13, (dispatch_qos_class_t)v9, relative_priority_ptr);

    id v15 = v11;
    dispatch_queue_t v16 = dispatch_queue_create((const char *)[v15 UTF8String], v14);
    idsQueue = v7->_idsQueue;
    v7->_idsQueue = (OS_dispatch_queue *)v16;

    +[SYQueueDumper registerQueue:v7->_idsQueue];
    v7->_idsQueueLock._os_unfair_lock_opaque = 0;
    v7->_idsQueueIsSuspended = 0;
    v7->_idsQueueResumedLock = 0;
    uint64_t v18 = objc_opt_new();
    messageRows = v7->_messageRows;
    v7->_messageRows = (NSMutableIndexSet *)v18;

    uint64_t v20 = objc_opt_new();
    responseMessageRows = v7->_responseMessageRows;
    v7->_responseMessageRows = (NSMutableIndexSet *)v20;

    uint64_t v22 = objc_opt_new();
    deferredIncomingSessions = v7->_deferredIncomingSessions;
    v7->_deferredIncomingSessions = (NSMutableArray *)v22;

    v7->_messageMapLock._os_unfair_lock_opaque = 0;
    uint64_t v24 = objc_opt_new();
    messageIDsToSessionIDs = v7->_messageIDsToSessionIDs;
    v7->_messageIDsToSessionIDs = (NSMutableDictionary *)v24;

    uint64_t v26 = objc_opt_new();
    singleMessageUUIDs = v7->_singleMessageUUIDs;
    v7->_singleMessageUUIDs = (NSMutableSet *)v26;

    v28 = v7;
  }

  return v7;
}

- (void)_suspendIdsQueue
{
  p_idsQueueLock = &self->_idsQueueLock;
  os_unfair_lock_lock(&self->_idsQueueLock);
  if (!*(_WORD *)&self->_idsQueueIsSuspended)
  {
    self->_idsQueueIsSuspended = 1;
    dispatch_suspend((dispatch_object_t)self->_idsQueue);
  }
  os_unfair_lock_unlock(p_idsQueueLock);
}

- (void)_resumeIdsQueue
{
  p_idsQueueLock = &self->_idsQueueLock;
  os_unfair_lock_lock(&self->_idsQueueLock);
  if (self->_idsQueueIsSuspended)
  {
    self->_idsQueueIsSuspended = 0;
    dispatch_resume((dispatch_object_t)self->_idsQueue);
  }
  os_unfair_lock_unlock(p_idsQueueLock);
}

- (void)dealloc
{
  [(IDSService *)self->_idsService removeDelegate:self];
  os_unfair_lock_lock(&self->_idsQueueLock);
  self->_idsQueueResumedLock = 1;
  os_unfair_lock_unlock(&self->_idsQueueLock);
  [(SYFileTransferSyncEngine *)self _resumeIdsQueue];
  idsService = self->_idsService;
  self->_idsService = 0;

  v4.receiver = self;
  v4.super_class = (Class)SYFileTransferSyncEngine;
  [(SYSyncEngine *)&v4 dealloc];
}

- (BOOL)resume:(id *)a3
{
  objc_super v4 = [(SYSyncEngine *)self service];
  id v5 = objc_alloc(MEMORY[0x263F4A0C0]);
  id v6 = [v4 name];
  v7 = (IDSService *)[v5 initWithService:v6];
  idsService = self->_idsService;
  self->_idsService = v7;

  [(IDSService *)self->_idsService addDelegate:self queue:self->_idsQueue];
  v9 = +[SYDevice targetableDevice];
  activeDevice = self->_activeDevice;
  self->_activeDevice = v9;

  return 1;
}

- (void)suspend
{
  [(IDSService *)self->_idsService removeDelegate:self];
  idsService = self->_idsService;
  self->_idsService = 0;
}

- (void)endFileTransferForStream:(id)a3 atURL:(id)a4 target:(id)a5 wasCancelled:(BOOL)a6 messageRows:(id)a7
{
  id v11 = a3;
  id v31 = a4;
  id v12 = a5;
  id v33 = a7;
  v13 = [(IDSService *)self->_idsService devices];
  v30 = v12;
  uint64_t v14 = [v12 findMatchingIDSDeviceFromList:v13];

  id v15 = (id)IDSCopyIDForDevice();
  if (!v15) {
    id v15 = (id)*MEMORY[0x263F4A148];
  }
  dispatch_queue_t v16 = [(SYSyncEngine *)self service];
  v17 = [v16 peerID];
  uint64_t v18 = [(SYSyncEngine *)self responder];
  v19 = [v18 extraTransportOptions];
  uint64_t v20 = IDSOptionsFromSYServiceOptions(v19);
  v21 = [(SYFileTransferSyncEngine *)self idsOptions:v20];

  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = __Block_byref_object_copy__13;
  v45[4] = __Block_byref_object_dispose__13;
  v46 = self->_inputPriorityBoostContext;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __91__SYFileTransferSyncEngine_endFileTransferForStream_atURL_target_wasCancelled_messageRows___block_invoke;
  v34[3] = &unk_264424028;
  id v22 = v11;
  id v35 = v22;
  v36 = self;
  BOOL v44 = a6;
  id v23 = v16;
  id v37 = v23;
  id v24 = v31;
  id v38 = v24;
  id v25 = v17;
  id v39 = v25;
  id v26 = v15;
  id v40 = v26;
  id v27 = v21;
  id v41 = v27;
  id v28 = v33;
  id v42 = v28;
  v43 = v45;
  [v22 whenComplete:v34];

  _Block_object_dispose(v45, 8);
}

void __91__SYFileTransferSyncEngine_endFileTransferForStream_atURL_target_wasCancelled_messageRows___block_invoke(uint64_t a1)
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  v2 = qword_26AB04790;
  if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEBUG)) {
    __91__SYFileTransferSyncEngine_endFileTransferForStream_atURL_target_wasCancelled_messageRows___block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }
  [*(id *)(a1 + 32) close];
  v9 = *(NSObject **)(*(void *)(a1 + 40) + 168);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __91__SYFileTransferSyncEngine_endFileTransferForStream_atURL_target_wasCancelled_messageRows___block_invoke_62;
  v14[3] = &unk_264424028;
  char v24 = *(unsigned char *)(a1 + 104);
  id v15 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 40);
  id v16 = v10;
  uint64_t v17 = v11;
  id v18 = *(id *)(a1 + 56);
  id v19 = *(id *)(a1 + 64);
  id v20 = *(id *)(a1 + 72);
  id v21 = *(id *)(a1 + 80);
  id v12 = *(id *)(a1 + 88);
  uint64_t v13 = *(void *)(a1 + 96);
  id v22 = v12;
  uint64_t v23 = v13;
  dispatch_async(v9, v14);
}

void __91__SYFileTransferSyncEngine_endFileTransferForStream_atURL_target_wasCancelled_messageRows___block_invoke_62(uint64_t a1)
{
  v48[4] = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 104))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    v2 = qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      uint64_t v44 = v3;
      uint64_t v4 = "Outgoing file-transfer unnecessary - removing output file at URL %@";
LABEL_38:
      _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_DEFAULT, v4, buf, 0xCu);
    }
  }
  else
  {
    if ([*(id *)(a1 + 32) hasWrittenData])
    {
      uint64_t v5 = [*(id *)(a1 + 40) options];
      uint64_t v6 = [v5 objectForKeyedSubscript:@"SYServiceOptionEnableCRC"];
      uint64_t v7 = [v6 integerValue];

      if (v7) {
        uint64_t v8 = [*(id *)(a1 + 48) _crcChecksum:*(void *)(a1 + 56)];
      }
      else {
        uint64_t v8 = 0;
      }
      v47[0] = @"ContainsSession";
      v47[1] = @"PeerID";
      uint64_t v10 = *(void *)(a1 + 64);
      v48[0] = MEMORY[0x263EFFA88];
      v48[1] = v10;
      v47[2] = @"EnqueuedAt";
      uint64_t v11 = objc_opt_new();
      v48[2] = v11;
      v47[3] = @"CRC";
      id v12 = [NSNumber numberWithUnsignedLong:v8];
      v48[3] = v12;
      uint64_t v13 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:4];

      uint64_t v14 = *(void *)(a1 + 56);
      id v15 = *(void **)(*(void *)(a1 + 48) + 128);
      id v16 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 72)];
      uint64_t v17 = [*(id *)(a1 + 40) priority];
      uint64_t v18 = 100;
      if (!v17) {
        uint64_t v18 = 200;
      }
      uint64_t v19 = *(void *)(a1 + 80);
      if (v17 == 20) {
        uint64_t v20 = 300;
      }
      else {
        uint64_t v20 = v18;
      }
      id v41 = 0;
      id v42 = 0;
      char v21 = [v15 sendResourceAtURL:v14 metadata:v13 toDestinations:v16 priority:v20 options:v19 identifier:&v42 error:&v41];
      id v22 = v42;
      id v23 = v41;

      if (v21)
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        char v24 = qword_26AB04790;
        if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = *(void *)(a1 + 56);
          *(_DWORD *)buf = 138412546;
          uint64_t v44 = v25;
          __int16 v45 = 2114;
          id v46 = v22;
          _os_log_impl(&dword_21C7C9000, v24, OS_LOG_TYPE_DEFAULT, "Sent file at %@ via IDS, got identifier %{public}@", buf, 0x16u);
        }
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        if (os_log_type_enabled((os_log_t)qword_26AB047C0, OS_LOG_TYPE_DEBUG)) {
          -[SYMessengerSyncEngine messageCenter:didResolveIDSIdentifier:forFileTransfer:]();
        }
        os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 48) + 216));
        id v26 = [*(id *)(a1 + 32) streamPropertyForKey:SYAssociatedSessionIdentifierPropertyKey];
        [*(id *)(*(void *)(a1 + 48) + 224) setObject:v26 forKeyedSubscript:v22];

        os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 48) + 216));
        id v27 = [*(id *)(a1 + 48) responder];
        [v27 enqueuedMessageWithID:v22 context:0];
      }
      else
      {
        id v28 = +[SYTransportLog sharedInstance];
        id v27 = [v28 oslog];

        if (os_log_type_enabled(v27, (os_log_type_t)0x90u)) {
          __91__SYFileTransferSyncEngine_endFileTransferForStream_atURL_target_wasCancelled_messageRows___block_invoke_62_cold_2(a1 + 56, v23, v27);
        }
      }

      id v29 = +[SYStatisticStore sharedInstance];
      uint64_t v30 = *(void *)(a1 + 56);
      id v31 = [*(id *)(a1 + 40) name];
      [v29 recordOutgoingFileTransferAtURL:v30 metadata:v13 identifier:v22 error:v23 forService:v31];

      if (v22)
      {
        v32 = +[SYStatisticStore sharedInstance];
        [v32 setFileTransferIdentifier:v22 forOutgoingMessagesWithRowIDs:*(void *)(a1 + 88)];
      }
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      v9 = qword_26AB04790;
      if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C7C9000, v9, OS_LOG_TYPE_DEFAULT, "Output file contains no data, not sending anything.", buf, 2u);
      }
    }
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    v2 = qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v33 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      uint64_t v44 = v33;
      uint64_t v4 = "Removing output file at %@";
      goto LABEL_38;
    }
  }
  v34 = [MEMORY[0x263F08850] defaultManager];
  [v34 removeItemAtURL:*(void *)(a1 + 56) error:0];

  uint64_t v35 = *(void *)(a1 + 48);
  v36 = *(void **)(v35 + 232);
  *(void *)(v35 + 232) = 0;

  uint64_t v37 = *(void *)(*(void *)(a1 + 96) + 8);
  id v38 = *(void **)(v37 + 40);
  *(void *)(v37 + 40) = 0;

  id v39 = [*(id *)(a1 + 48) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __91__SYFileTransferSyncEngine_endFileTransferForStream_atURL_target_wasCancelled_messageRows___block_invoke_70;
  block[3] = &unk_264422AB0;
  block[4] = *(void *)(a1 + 48);
  dispatch_async(v39, block);
}

void __91__SYFileTransferSyncEngine_endFileTransferForStream_atURL_target_wasCancelled_messageRows___block_invoke_70(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(*(void *)(a1 + 32) + 200) firstObject];
  if (v2)
  {
    [*(id *)(*(void *)(a1 + 32) + 200) removeObjectAtIndex:0];
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v3 = (void *)qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = v3;
      uint64_t v5 = [v2 identifier];
      int v11 = 138543362;
      id v12 = v5;
      _os_log_impl(&dword_21C7C9000, v4, OS_LOG_TYPE_DEFAULT, "Retrying deferred incoming session with identifier %{public}@", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = [v2 resourceURL];
    uint64_t v8 = [v2 metadata];
    v9 = [v2 identifier];
    uint64_t v10 = [v2 idsContext];
    [v6 _handleIncomingSessionFileAtOwnedURL:v7 metadata:v8 identifier:v9 idsContext:v10];
  }
}

- (void)beginResponseSession
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_21C7C9000, v0, v1, "Failed to get new temporary item url: %{public}@", v2, v3, v4, v5, v6);
}

- (void)endResponseSession
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = self->_responseFileURL;
  uint64_t v4 = self->_responseStream;
  uint64_t v5 = (void *)[(NSMutableIndexSet *)self->_responseMessageRows copy];
  BOOL responsesCanceled = self->_responsesCanceled;
  [(NSMutableIndexSet *)self->_responseMessageRows removeAllIndexes];
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  uint64_t v7 = qword_26AB04790;
  if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_INFO))
  {
    int v13 = 134217984;
    uint64_t v14 = self;
    _os_log_impl(&dword_21C7C9000, v7, OS_LOG_TYPE_INFO, "Ending file-transfer response session for engine %p", (uint8_t *)&v13, 0xCu);
  }
  responseFileURL = self->_responseFileURL;
  self->_responseFileURL = 0;

  responseStream = self->_responseStream;
  self->_responseStream = 0;

  self->_BOOL responsesCanceled = 0;
  self->_sessionCanceled = 0;
  uint64_t v10 = (OS_os_transaction *)os_transaction_create();
  closureTransaction = self->_closureTransaction;
  self->_closureTransaction = v10;

  responseSessionTransaction = self->_responseSessionTransaction;
  self->_responseSessionTransaction = 0;

  [(SYFileTransferSyncEngine *)self endFileTransferForStream:v4 atURL:v3 target:self->_responseDevice wasCancelled:responsesCanceled messageRows:v5];
}

- (void)beginSession
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_21C7C9000, v0, v1, "Failed to get new temporary item URL: %{public}@", v2, v3, v4, v5, v6);
}

- (void)endSession
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (self->_inSession)
  {
    self->_inSession = 0;
    BOOL sessionCanceled = self->_sessionCanceled;
    uint64_t v4 = self->_outputFileURL;
    uint64_t v5 = self->_outputStream;
    uint8_t v6 = (void *)[(NSMutableIndexSet *)self->_messageRows copy];
    [(NSMutableIndexSet *)self->_messageRows removeAllIndexes];
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v7 = qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v15 = self;
      _os_log_impl(&dword_21C7C9000, v7, OS_LOG_TYPE_INFO, "Ending file-transfer outgoing session for engine %p", buf, 0xCu);
    }
    outputFileURL = self->_outputFileURL;
    self->_outputFileURL = 0;

    outputStream = self->_outputStream;
    self->_outputStream = 0;

    self->_BOOL sessionCanceled = 0;
    self->_BOOL responsesCanceled = 0;
    self->_inSession = 0;
    sessionStartMessage = self->_sessionStartMessage;
    self->_sessionStartMessage = 0;

    int v11 = (OS_os_transaction *)os_transaction_create();
    closureTransaction = self->_closureTransaction;
    self->_closureTransaction = v11;

    v13.receiver = self;
    v13.super_class = (Class)SYFileTransferSyncEngine;
    [(SYSyncEngine *)&v13 endSession];
    [(SYFileTransferSyncEngine *)self endFileTransferForStream:v5 atURL:v4 target:self->_sessionDevice wasCancelled:sessionCanceled messageRows:v6];
  }
}

- (BOOL)isInSession
{
  return self->_inSession;
}

- (BOOL)buffersSessions
{
  return 1;
}

- (BOOL)buffersHandshake
{
  return ![(SYFileTransferSyncEngine *)self _sessionDeviceCanUseSingleMessages];
}

- (BOOL)targetIsNearby
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v3 = [(SYDevice *)self->_activeDevice hasCachedNearby];
  activeDevice = self->_activeDevice;
  if (v3)
  {
    uint64_t v5 = self->_activeDevice;
    return [(SYDevice *)v5 cachedIsNearby];
  }
  else
  {
    uint64_t v7 = [(IDSService *)self->_idsService devices];
    uint64_t v8 = [(SYDevice *)activeDevice findMatchingIDSDeviceFromList:v7];

    if (v8)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      v9 = (void *)qword_26AB04790;
      if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = v9;
        int v11 = [v8 isNearby];
        id v12 = "not ";
        if (v11) {
          id v12 = "";
        }
        int v14 = 136315138;
        uint64_t v15 = v12;
        _os_log_impl(&dword_21C7C9000, v10, OS_LOG_TYPE_DEFAULT, "Target device is %snearby, caching value.", (uint8_t *)&v14, 0xCu);
      }
      -[SYDevice setCachedIsNearby:](self->_activeDevice, "setCachedIsNearby:", [v8 isNearby]);
      [(SYDevice *)self->_activeDevice setHasCachedNearby:1];
      char v13 = [v8 isNearby];
    }
    else
    {
      char v13 = 0;
    }

    return v13;
  }
}

- (BOOL)_sessionDeviceCanUseSingleMessages
{
  BOOL v3 = self->_sessionDevice;
  if (!v3) {
    BOOL v3 = self->_activeDevice;
  }
  uint64_t v4 = [(SYDevice *)v3 deviceCode];
  uint64_t v5 = [(SYDevice *)v3 systemBuildVersion];
  uint8_t v6 = v5;
  if (v4 == 5) {
    uint64_t v7 = @"14S184";
  }
  else {
    uint64_t v7 = @"14A187";
  }
  uint64_t v8 = [v5 compare:v7];

  return v8 != -1;
}

- (void)_enqueueSingleMessage:(id)a3 withMessageID:(unsigned __int16)a4 priority:(int64_t)a5 options:(id)a6 userContext:(id)a7 callback:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if (self->_inSession)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      sessionStartMessage = self->_sessionStartMessage;
      self->_sessionStartMessage = 0;
    }
  }
  uint64_t v19 = (void *)[v17 copy];

  uint64_t v20 = [(SYSyncEngine *)self responder];
  char v21 = [v20 extraTransportOptions];
  id v22 = CoalesceOptionDictionaries(v21, v15);

  id v23 = [(SYSyncEngine *)self service];
  [v23 name];
  char v24 = v31 = v15;
  uint64_t v25 = [(SYSyncEngine *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __102__SYFileTransferSyncEngine__enqueueSingleMessage_withMessageID_priority_options_userContext_callback___block_invoke;
  block[3] = &unk_264424050;
  unsigned __int16 v39 = a4;
  block[4] = self;
  id v33 = v14;
  id v34 = v16;
  id v35 = v24;
  id v36 = v22;
  id v37 = v19;
  int64_t v38 = a5;
  id v26 = v22;
  id v27 = v24;
  id v28 = v16;
  id v29 = v14;
  id v30 = v19;
  dispatch_async(v25, block);
}

void __102__SYFileTransferSyncEngine__enqueueSingleMessage_withMessageID_priority_options_userContext_callback___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 128))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v2 = qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = *(unsigned __int16 *)(a1 + 88);
      *(_DWORD *)buf = 67109120;
      int v43 = v3;
      _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_DEFAULT, "Enqueueing %{companionsync:SYMessageID}hu for transfer using IDS messaging", buf, 8u);
    }
    uint64_t v4 = [*(id *)(a1 + 32) _wrapMessage:*(void *)(a1 + 40) ofType:*(unsigned __int16 *)(a1 + 88) userInfo:*(void *)(a1 + 48)];
    uint64_t v5 = +[SYStatisticStore sharedInstance];
    [v5 recordOutgoingMessage:v4 forService:*(void *)(a1 + 56)];

    uint8_t v6 = +[SYStatisticStore sharedInstance];
    uint64_t v7 = [v6 rowIDForPartialMessage:v4];

    [*(id *)(*(void *)(a1 + 32) + 184) addIndex:v7];
    uint64_t v8 = [*(id *)(a1 + 40) data];
    uint64_t v41 = 0;
    LOWORD(v41) = *(_WORD *)(a1 + 88);
    HIDWORD(v41) = [v8 length];
    v9 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithBytes:&v41 length:8];
    [v9 appendData:v8];
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = *(void **)(v10 + 136);
    id v12 = [*(id *)(v10 + 128) devices];
    uint64_t v13 = [v11 findMatchingIDSDeviceFromList:v12];

    id v37 = (id)v13;
    id v14 = (id)IDSCopyIDForDevice();
    if (!v14) {
      id v14 = (id)*MEMORY[0x263F4A148];
    }
    id v15 = *(void **)(a1 + 32);
    id v16 = IDSOptionsFromSYServiceOptions(*(void **)(a1 + 64));
    uint64_t v17 = [v15 idsOptions:v16 forFileTransfer:0];

    uint64_t v18 = *(void *)(a1 + 80);
    uint64_t v19 = 100;
    if (!v18) {
      uint64_t v19 = 200;
    }
    if (v18 == 20) {
      uint64_t v20 = 300;
    }
    else {
      uint64_t v20 = v19;
    }
    char v21 = *(void **)(*(void *)(a1 + 32) + 128);
    id v22 = [MEMORY[0x263EFFA08] setWithObject:v14];
    id v39 = 0;
    id v40 = 0;
    id v36 = (void *)v17;
    int v23 = [v21 sendData:v9 toDestinations:v22 priority:v20 options:v17 identifier:&v40 error:&v39];
    id v24 = v40;
    id v25 = v39;

    if (v23)
    {
      id v26 = +[SYStatisticStore sharedInstance];
      [v26 assignIdentifier:v24 toOutgoingMessage:v4];

      [*(id *)(*(void *)(a1 + 32) + 208) addObject:v24];
      id v27 = [*(id *)(a1 + 32) responder];
      [v27 enqueuedMessageWithID:v24 context:*(void *)(a1 + 48)];

      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 216));
      id v28 = [*(id *)(a1 + 48) objectForKeyedSubscript:0x26CD1D180];
      [*(id *)(*(void *)(a1 + 32) + 224) setObject:v28 forKeyedSubscript:v24];

      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 216));
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v29 = qword_26AB04790;
      if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_INFO))
      {
        int v30 = *(unsigned __int16 *)(a1 + 88);
        *(_DWORD *)buf = 67109378;
        int v43 = v30;
        __int16 v44 = 2114;
        uint64_t v45 = (uint64_t)v24;
        _os_log_impl(&dword_21C7C9000, v29, OS_LOG_TYPE_INFO, "Sent %{companionsync:SYMessageID}hu, got identifier %{public}@", buf, 0x12u);
      }
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v31 = (void *)qword_26AB047C0;
      if (os_log_type_enabled((os_log_t)qword_26AB047C0, OS_LOG_TYPE_DEBUG))
      {
        int v32 = *(unsigned __int16 *)(a1 + 88);
        id v33 = v31;
        uint64_t v34 = [v9 length];
        *(_DWORD *)buf = 67109634;
        int v43 = v32;
        __int16 v44 = 2048;
        uint64_t v45 = v34;
        __int16 v46 = 2114;
        id v47 = v24;
        _os_log_debug_impl(&dword_21C7C9000, v33, OS_LOG_TYPE_DEBUG, "Sent %{companionsync:SYMessageID}hu, %lu bytes: %{public}@", buf, 0x1Cu);
      }
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_ERROR)) {
        __102__SYFileTransferSyncEngine__enqueueSingleMessage_withMessageID_priority_options_userContext_callback___block_invoke_cold_1();
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    uint64_t v35 = *(void *)(a1 + 72);
    id v38 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2001 userInfo:0];
    (*(void (**)(uint64_t, void, void))(v35 + 16))(v35, 0, 0);
  }
}

- (void)enqueueSyncRequest:(id)a3 withMessageID:(unsigned __int16)a4 priority:(int64_t)a5 options:(id)a6 userContext:(id)a7 callback:(id)a8
{
  uint64_t v12 = a4;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (!self->_idsService) {
    _os_assumes_log();
  }
  uint64_t v19 = [v16 objectForKeyedSubscript:0x26CD1DCC0];
  int v20 = [v19 BOOLValue];

  if (v20 && [(SYFileTransferSyncEngine *)self _sessionDeviceCanUseSingleMessages])
  {
    [(SYFileTransferSyncEngine *)self _enqueueSingleMessage:v15 withMessageID:v12 priority:a5 options:v16 userContext:v17 callback:v18];
    goto LABEL_37;
  }
  if (!self->_inSession) {
    goto LABEL_31;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEBUG)) {
      -[SYFileTransferSyncEngine enqueueSyncRequest:withMessageID:priority:options:userContext:callback:]();
    }
    objc_storeStrong((id *)&self->_sessionStartMessage, a3);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !self->_sessionStartMessage)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v22 = v15;
      if ([v22 hasError] && self->_sessionStartMessage)
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        int v23 = qword_26AB04790;
        if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21C7C9000, v23, OS_LOG_TYPE_DEFAULT, "File-transfer engine cancelling session ending in an error", buf, 2u);
        }
        [(SYFileTransferSyncEngine *)self _cancelSession];
      }
    }
    if (self->_inSession)
    {
      BOOL v24 = !self->_inSession;
LABEL_36:
      id v26 = [(SYSyncEngine *)self service];
      id v27 = [v26 name];
      id v28 = [(SYSyncEngine *)self queue];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __99__SYFileTransferSyncEngine_enqueueSyncRequest_withMessageID_priority_options_userContext_callback___block_invoke;
      v30[3] = &unk_2644240A0;
      v30[4] = self;
      id v34 = v18;
      BOOL v36 = v24;
      id v31 = v15;
      __int16 v35 = v12;
      id v32 = v17;
      id v33 = v27;
      id v29 = v27;
      dispatch_async(v28, v30);

      goto LABEL_37;
    }
LABEL_31:
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v25 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C7C9000, v25, OS_LOG_TYPE_DEFAULT, "File-transfer engine creating a one-message session", buf, 2u);
    }
    [(SYFileTransferSyncEngine *)self beginSession];
    BOOL v24 = 1;
    goto LABEL_36;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  char v21 = qword_26AB04790;
  if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v38 = v15;
    _os_log_impl(&dword_21C7C9000, v21, OS_LOG_TYPE_DEFAULT, "File-transfer engine eliding restart request %p", buf, 0xCu);
  }
  [(SYFileTransferSyncEngine *)self _handleSessionRestart:v15 priority:a5 options:v16 userContext:v17 callback:v18];
LABEL_37:
}

void __99__SYFileTransferSyncEngine_enqueueSyncRequest_withMessageID_priority_options_userContext_callback___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 128) && *(void *)(v2 + 72))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    int v3 = (void *)qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = v3;
      uint64_t v5 = (objc_class *)objc_opt_class();
      uint8_t v6 = NSStringFromClass(v5);
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v6;
      _os_log_impl(&dword_21C7C9000, v4, OS_LOG_TYPE_DEFAULT, "Enqueueing %{public}@ message", buf, 0xCu);
    }
    uint64_t v7 = [*(id *)(a1 + 48) objectForKeyedSubscript:0x26CD1D180];
    if (v7) {
      [*(id *)(*(void *)(a1 + 32) + 72) setStreamProperty:v7 forKey:SYAssociatedSessionIdentifierPropertyKey];
    }
    uint64_t v8 = [*(id *)(a1 + 32) _wrapMessage:*(void *)(a1 + 40) ofType:*(unsigned __int16 *)(a1 + 72) userInfo:*(void *)(a1 + 48)];
    v9 = +[SYStatisticStore sharedInstance];
    [v9 recordOutgoingMessage:v8 forService:*(void *)(a1 + 56)];

    uint64_t v10 = +[SYStatisticStore sharedInstance];
    uint64_t v11 = [v10 rowIDForPartialMessage:v8];

    [*(id *)(*(void *)(a1 + 32) + 184) addIndex:v11];
    uint64_t v12 = [*(id *)(a1 + 40) data];
    *(void *)buf = 0;
    *(_WORD *)buf = *(_WORD *)(a1 + 72);
    *(_DWORD *)&uint8_t buf[4] = [v12 length];
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithBytes:buf length:8];
    [v13 appendData:v12];
    id v14 = *(void **)(*(void *)(a1 + 32) + 72);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __99__SYFileTransferSyncEngine_enqueueSyncRequest_withMessageID_priority_options_userContext_callback___block_invoke_93;
    v21[3] = &unk_264424078;
    id v15 = *(id *)(a1 + 64);
    char v24 = *(unsigned char *)(a1 + 74);
    uint64_t v16 = *(void *)(a1 + 32);
    id v17 = *(void **)(a1 + 40);
    id v23 = v15;
    v21[4] = v16;
    id v22 = v17;
    [v14 writeData:v13 completion:v21];
  }
  else
  {
    uint64_t v18 = *(void *)(a1 + 64);
    uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2001 userInfo:0];
    (*(void (**)(uint64_t, void, void, void *))(v18 + 16))(v18, 0, 0, v19);

    if (*(unsigned char *)(a1 + 74))
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      int v20 = qword_26AB04790;
      if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C7C9000, v20, OS_LOG_TYPE_DEFAULT, "Cancelling one-message file-transfer session: no IDSService or no output stream available", buf, 2u);
      }
      [*(id *)(a1 + 32) _cancelSession];
      [*(id *)(a1 + 32) endSession];
    }
  }
}

void __99__SYFileTransferSyncEngine_enqueueSyncRequest_withMessageID_priority_options_userContext_callback___block_invoke_93(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5 && (a2 & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_ERROR)) {
      __99__SYFileTransferSyncEngine_enqueueSyncRequest_withMessageID_priority_options_userContext_callback___block_invoke_93_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (*(unsigned char *)(a1 + 56))
  {
    if ((a2 & 1) == 0)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      uint8_t v6 = qword_26AB04790;
      if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C7C9000, v6, OS_LOG_TYPE_DEFAULT, "Cancelling one-message file-transfer session, since the data couldn't be written to the file", buf, 2u);
      }
      [*(id *)(a1 + 32) _cancelSession];
    }
    uint64_t v7 = (id *)(a1 + 32);
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v7 = (id *)(a1 + 32);
    if (![v8 _shouldTreatAsSessionEnd:v9]) {
      goto LABEL_16;
    }
    if ((a2 & 1) == 0)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      uint64_t v10 = qword_26AB04790;
      if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl(&dword_21C7C9000, v10, OS_LOG_TYPE_DEFAULT, "Cancelling file-transfer session, since the session-end message couldn't be written to the file", v11, 2u);
      }
      [*v7 _cancelSession];
    }
  }
  [*v7 endSession];
LABEL_16:
}

- (id)outputStreamWithMetadata:(id)a3 priority:(int64_t)a4 options:(id)a5 context:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (!self->_idsService) {
    _os_assumes_log();
  }
  id v15 = [NSURL _SYURLForNewTemporaryFile:a7];
  if (v15)
  {
    id v28 = v14;
    id v29 = (void *)a4;
    activeDevice = self->_activeDevice;
    id v17 = [(IDSService *)self->_idsService devices];
    uint64_t v18 = [(SYDevice *)activeDevice findMatchingIDSDeviceFromList:v17];

    id v19 = (id)IDSCopyIDForDevice();
    if (!v19) {
      id v19 = (id)*MEMORY[0x263F4A148];
    }
    id v20 = [[SYCompressedFileOutputStream alloc] initToCompressedFileAtURL:v15 shouldAppend:0];
    char v21 = [(SYSyncEngine *)self service];
    id v22 = [v21 name];
    [v21 defaultMessageTimeout];
    char v24 = v23;
    objc_initWeak(&location, self);
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __84__SYFileTransferSyncEngine_outputStreamWithMetadata_priority_options_context_error___block_invoke;
    v30[3] = &unk_2644240C8;
    objc_copyWeak(v37, &location);
    id v31 = v15;
    id v32 = self;
    v37[1] = v24;
    id v33 = v12;
    id v34 = v13;
    id v25 = v19;
    id v35 = v25;
    v37[2] = v29;
    id v26 = v22;
    id v36 = v26;
    [v20 setOnClose:v30];

    objc_destroyWeak(v37);
    objc_destroyWeak(&location);

    id v14 = v28;
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

void __84__SYFileTransferSyncEngine_outputStreamWithMetadata_priority_options_context_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained && [v3 streamStatus] != 7)
  {
    id v11 = (id)objc_opt_new();
    id v13 = [*(id *)(a1 + 40) _fileTransferHeader];
    [v11 setHeader:v13];

    id v14 = [v11 header];
    [v14 timestamp];
    double v16 = v15 + *(double *)(a1 + 88);
    id v17 = [v11 header];
    [v17 setTimeout:v16];

    objc_msgSend(v11, "setDecompressedFileSize:", objc_msgSend(v3, "bytesThroughput"));
    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
    id v19 = [v11 data];
    [v18 setObject:v19 forKeyedSubscript:@"FileHeader"];

    uint64_t v20 = *(void *)(a1 + 48);
    if (v20) {
      [v18 setObject:v20 forKeyedSubscript:@"UserMetadata"];
    }
    char v21 = *(void **)(a1 + 40);
    id v22 = IDSOptionsFromSYServiceOptions(*(void **)(a1 + 56));
    id v23 = [v21 idsOptions:v22];

    uint64_t v24 = *(void *)(a1 + 40);
    uint64_t v25 = *(void *)(a1 + 48);
    id v26 = *(void **)(v24 + 128);
    uint64_t v27 = *(void *)(v24 + 64);
    id v28 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 64)];
    uint64_t v29 = *(void *)(a1 + 96);
    uint64_t v30 = 100;
    if (!v29) {
      uint64_t v30 = 200;
    }
    if (v29 == 20) {
      uint64_t v31 = 300;
    }
    else {
      uint64_t v31 = v30;
    }
    id v48 = 0;
    id v49 = 0;
    char v32 = [v26 sendResourceAtURL:v27 metadata:v25 toDestinations:v28 priority:v31 options:v23 identifier:&v49 error:&v48];
    id v46 = v49;
    id v33 = v48;

    uint64_t v45 = v18;
    if (v32)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v34 = qword_26AB04790;
      if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v35 = *(void *)(*(void *)(a1 + 40) + 64);
        *(_DWORD *)buf = 138412546;
        uint64_t v52 = v35;
        __int16 v53 = 2114;
        id v54 = v46;
        _os_log_impl(&dword_21C7C9000, v34, OS_LOG_TYPE_DEFAULT, "Sent file at %@ via IDS, got identifier %{public}@", buf, 0x16u);
      }
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB047C0, OS_LOG_TYPE_DEBUG)) {
        __84__SYFileTransferSyncEngine_outputStreamWithMetadata_priority_options_context_error___block_invoke_cold_4();
      }
    }
    else
    {
      id v36 = +[SYTransportLog sharedInstance];
      id v37 = [v36 oslog];

      if (os_log_type_enabled(v37, (os_log_type_t)0x90u))
      {
        uint64_t v44 = *(void *)(*(void *)(a1 + 40) + 64);
        *(_DWORD *)buf = 138412546;
        uint64_t v52 = v44;
        __int16 v53 = 2112;
        id v54 = v33;
        _os_log_error_impl(&dword_21C7C9000, v37, (os_log_type_t)0x90u, "Failed to send file at %@ via IDS: %@", buf, 0x16u);
      }
    }
    id v38 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v39 = *(void *)(a1 + 32);
    id v47 = 0;
    char v40 = [v38 removeItemAtURL:v39 error:&v47];
    id v41 = v47;

    if ((v40 & 1) == 0)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v42 = (void *)qword_26AB04790;
      if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_ERROR)) {
        __84__SYFileTransferSyncEngine_outputStreamWithMetadata_priority_options_context_error___block_invoke_cold_3(a1 + 32, v42, v41);
      }
    }
    int v43 = +[SYStatisticStore sharedInstance];
    [v43 recordOutgoingFileTransferAtURL:*(void *)(*(void *)(a1 + 40) + 64) metadata:*(void *)(a1 + 48) identifier:v46 error:v33 forService:*(void *)(a1 + 72)];
  }
  else
  {
    id v5 = [v3 streamError];

    if (v5)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      uint8_t v6 = (void *)qword_26AB04790;
      if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_ERROR)) {
        __84__SYFileTransferSyncEngine_outputStreamWithMetadata_priority_options_context_error___block_invoke_cold_2(v6, v3);
      }
    }
    uint64_t v7 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = (void *)(a1 + 32);
    id v50 = 0;
    char v10 = [v7 removeItemAtURL:v9 error:&v50];
    id v11 = v50;

    if ((v10 & 1) == 0)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v12 = qword_26AB04790;
      if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_ERROR)) {
        __84__SYFileTransferSyncEngine_outputStreamWithMetadata_priority_options_context_error___block_invoke_cold_1(v8, (uint64_t)v11, v12);
      }
    }
  }
}

- (id)cancelMessagesReturningFailures:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (self->_idsService && [v4 count])
  {
    id v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v18 = v5;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * v11);
          idsService = self->_idsService;
          id v19 = 0;
          char v14 = [(IDSService *)idsService cancelIdentifier:v12 error:&v19];
          id v15 = v19;
          if ((v14 & 1) == 0)
          {
            if (_sync_log_facilities_pred != -1) {
              _os_once();
            }
            double v16 = qword_26AB04790;
            if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              uint64_t v25 = v12;
              __int16 v26 = 2112;
              id v27 = v15;
              _os_log_impl(&dword_21C7C9000, v16, OS_LOG_TYPE_DEFAULT, "Failed to cancel outgoing file-transfer message (%{public}@): %@", buf, 0x16u);
            }
            [v6 addObject:v12];
          }

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v9);
    }

    id v5 = v18;
  }
  else
  {
    id v6 = v5;
  }

  return v6;
}

- (id)stateForLogging
{
  id v3 = objc_opt_new();
  [v3 setType:2];
  [v3 setSuspended:self->_idsService == 0];
  objc_msgSend(v3, "setInSession:", -[SYFileTransferSyncEngine isInSession](self, "isInSession"));
  objc_msgSend(v3, "setBuffersSessions:", -[SYFileTransferSyncEngine buffersSessions](self, "buffersSessions"));
  return v3;
}

- (void)_cancelSession
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v3 = qword_26AB04790;
  if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21C7C9000, v3, OS_LOG_TYPE_DEFAULT, "Canceling send for any outgoing messages on the request stream.", v4, 2u);
  }
  self->_BOOL sessionCanceled = 1;
}

- (void)_cancelResponses
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v3 = qword_26AB04790;
  if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21C7C9000, v3, OS_LOG_TYPE_DEFAULT, "Canceling send for any outgoing messages on the response stream.", v4, 2u);
  }
  self->_BOOL responsesCanceled = 1;
}

- (void)_handleSessionRestart:(id)a3 priority:(int64_t)a4 options:(id)a5 userContext:(id)a6 callback:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = (void *)[a7 copy];
  objc_initWeak(&location, self);
  outputStream = self->_outputStream;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __88__SYFileTransferSyncEngine__handleSessionRestart_priority_options_userContext_callback___block_invoke;
  v21[3] = &unk_2644240F0;
  objc_copyWeak(v26, &location);
  id v17 = v12;
  id v22 = v17;
  v26[1] = (id)a4;
  id v18 = v13;
  id v23 = v18;
  id v19 = v14;
  id v24 = v19;
  id v20 = v15;
  id v25 = v20;
  [(_SYOutputStreamer *)outputStream whenComplete:v21];

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
}

void __88__SYFileTransferSyncEngine__handleSessionRestart_priority_options_userContext_callback___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _reallyHandleSessionRestart:*(void *)(a1 + 32) priority:*(void *)(a1 + 72) options:*(void *)(a1 + 40) userContext:*(void *)(a1 + 48) callback:*(void *)(a1 + 56)];
    id WeakRetained = v3;
  }
}

- (void)_reallyHandleSessionRestart:(id)a3 priority:(int64_t)a4 options:(id)a5 userContext:(id)a6 callback:(id)a7
{
  id v27 = a5;
  id v11 = a6;
  outputStream = self->_outputStream;
  id v13 = a7;
  [(_SYOutputStreamer *)outputStream close];
  id v14 = self->_outputStream;
  self->_outputStream = 0;

  id v15 = objc_alloc_init(MEMORY[0x263EFF8F8]);
  [v15 writeToURL:self->_outputFileURL options:1 error:0];

  double v16 = [_SYOutputStreamer alloc];
  outputFileURL = self->_outputFileURL;
  id v18 = [(SYSyncEngine *)self queue];
  id v19 = [(_SYOutputStreamer *)v16 initWithCompressedFileURL:outputFileURL callbackQueue:v18];
  id v20 = self->_outputStream;
  self->_outputStream = v19;

  if (self->_outputStream)
  {
    long long v21 = [(SYSyncEngine *)self service];
    id v22 = [v21 name];
    id v23 = +[SYPersistentStore sharedPersistentStoreForService:v22];
    id v24 = [(SYStartSyncSession *)self->_sessionStartMessage header];
    objc_msgSend(v23, "resetSequenceNumber:", objc_msgSend(v24, "sequenceNumber"));

    id v25 = objc_opt_new();
    [(SYStartSyncSession *)self->_sessionStartMessage copyTo:v25];
    __int16 v26 = (void *)[v21 _newMessageHeader];
    [v25 setHeader:v26];

    [(SYFileTransferSyncEngine *)self enqueueSyncRequest:v25 withMessageID:102 priority:a4 options:v27 userContext:v11 callback:v13];
    id v13 = v25;
  }
  else
  {
    long long v21 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2001 userInfo:0];
    (*((void (**)(id, void, void, void *))v13 + 2))(v13, 0, 0, v21);
  }
}

- (id)idsOptions:(id)a3
{
  return [(SYFileTransferSyncEngine *)self idsOptions:a3 forFileTransfer:1];
}

- (id)idsOptions:(id)a3 forFileTransfer:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_opt_new();
  [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F49F90]];
  uint64_t v8 = [(SYSyncEngine *)self service];
  uint64_t v9 = [v8 currentSession];
  [v8 defaultMessageTimeout];
  if (!v9) {
    goto LABEL_6;
  }
  if (!v4)
  {
    [v9 perMessageTimeout];
LABEL_6:
    double v13 = v10;
    goto LABEL_7;
  }
  [v9 fullSessionTimeout];
  if (v11 == 0.0) {
    goto LABEL_13;
  }
  [v9 remainingSessionTime];
  double v13 = v12 * 0.5;
LABEL_7:
  if (v13 != 0.0)
  {
    if (MGGetBoolAnswer())
    {
      id v14 = [MEMORY[0x263EFFA40] standardUserDefaults];
      id v15 = [v14 objectForKey:@"FileTransferOverrideTimeout" inDomain:@"com.apple.companionsync"];

      if (v15)
      {
        [v15 doubleValue];
        double v13 = v16;
      }
    }
    id v17 = [NSNumber numberWithDouble:v13];
    [v7 setObject:v17 forKeyedSubscript:*MEMORY[0x263F49F80]];

    [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F49ED8]];
  }
LABEL_13:
  id v18 = [(SYFileTransferSyncEngine *)self customIDSOptions];

  if (v18)
  {
    id v19 = [(SYFileTransferSyncEngine *)self customIDSOptions];
    [v7 addEntriesFromDictionary:v19];
  }
  if (v6) {
    [v7 addEntriesFromDictionary:v6];
  }
  [v7 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F49EC8]];

  return v7;
}

- (id)_fileTransferHeader
{
  uint64_t v2 = [(SYSyncEngine *)self service];
  id v3 = [v2 name];
  BOOL v4 = +[SYPersistentStore sharedPersistentStoreForService:v3];

  id v5 = objc_opt_new();
  [v5 setTimestamp:CFAbsoluteTimeGetCurrent()];
  id v6 = [SYPeer alloc];
  id v7 = [v2 peerID];
  uint64_t v8 = [v2 generationID];
  uint64_t v9 = [(SYPeer *)v6 initWithPeerID:v7 generation:v8];
  [v5 setSender:v9];

  double v10 = [SYVectorClock alloc];
  double v11 = [v4 vectorClockJSON];
  double v12 = [(SYVectorClock *)v10 initWithJSONRepresentation:v11];
  [v5 setState:v12];

  [v5 setVersion:2];
  [v5 setSequenceNumber:0];

  return v5;
}

- (id)_wrapMessage:(id)a3 ofType:(unsigned __int16)a4 userInfo:(id)a5
{
  uint64_t v5 = a4;
  id v8 = a5;
  id v9 = a3;
  double v10 = [(SYSyncEngine *)self service];
  double v11 = +[NMSOutgoingRequest requestWithMessageID:v5];
  [v11 setPbRequest:v9];

  [v11 setPersistentUserInfo:v8];
  uint64_t v12 = [v10 priority];
  if (v12 == 20) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = v12 != 0;
  }
  [v11 setPriority:v13];
  [v11 setShouldEncrypt:1];
  id v14 = [v10 currentSession];
  id v15 = v14;
  if (v14)
  {
    [v14 perMessageTimeout];
    objc_msgSend(v11, "setSendTimeout:");
    [v15 perMessageTimeout];
  }
  else
  {
    [v10 defaultMessageTimeout];
    objc_msgSend(v11, "setSendTimeout:");
    [v10 defaultMessageTimeout];
  }
  [v11 setResponseTimeout:v16 + v16];

  return v11;
}

- (id)_wrapResponse:(id)a3 toRequest:(id)a4 ofType:(unsigned __int16)a5
{
  id v6 = a4;
  id v7 = a3;
  [v6 configureResponse];
  id v8 = [v6 response];

  [v8 setPbResponse:v7];
  return v8;
}

- (id)_wrapIncomingMessage:(id)a3 ofType:(unsigned __int16)a4 identifier:(id)a5
{
  uint64_t v5 = a4;
  id v8 = a5;
  id v9 = a3;
  double v10 = [(SYSyncEngine *)self service];
  double v11 = objc_alloc_init(NMSIncomingRequest);
  [(NMSIncomingRequest *)v11 setMessageID:v5];
  [(NMSIncomingRequest *)v11 setPbRequest:v9];

  uint64_t v12 = [v10 priority];
  if (v12 == 20) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = v12 != 0;
  }
  [(NMSIncomingRequest *)v11 setPriority:v13];
  [(NMSIncomingRequest *)v11 setIdsIdentifier:v8];

  [(NMSIncomingRequest *)v11 setExpectsResponse:1];
  return v11;
}

- (id)_wrapIncomingResponse:(id)a3 ofType:(unsigned __int16)a4 identifier:(id)a5
{
  uint64_t v5 = a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = objc_alloc_init(NMSIncomingResponse);
  [(NMSIncomingResponse *)v9 setMessageID:v5];
  [(NMSIncomingResponse *)v9 setPbResponse:v8];

  [(NMSIncomingResponse *)v9 setIdsIdentifier:v7];
  return v9;
}

- (id)_assumeOwnershipOfURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 URLByDeletingLastPathComponent];
  id v7 = [v6 path];
  id v8 = [v7 stringByAppendingPathComponent:@"SYFileTransfer-XXXXX"];

  id v9 = v8;
  double v10 = strdup((const char *)[v9 UTF8String]);
  double v11 = mkdtemp(v10);
  if (v11)
  {
    uint64_t v12 = (void *)[objc_alloc(NSURL) initFileURLWithFileSystemRepresentation:v11 isDirectory:1 relativeToURL:0];
    free(v10);
    uint64_t v13 = [v5 lastPathComponent];
    id v14 = [v12 URLByAppendingPathComponent:v13];

    id v15 = (const char *)[v5 fileSystemRepresentation];
    id v16 = v14;
    if (link(v15, (const char *)[v16 fileSystemRepresentation]))
    {
      id v17 = __error();
      if (a4)
      {
        uint64_t v18 = *v17;
        id v19 = objc_alloc(MEMORY[0x263F087E8]);
        id v20 = (id)[v19 initWithDomain:*MEMORY[0x263F08438] code:v18 userInfo:0];
        id v21 = 0;
        *a4 = v20;
      }
      else
      {
        id v21 = 0;
      }
    }
    else
    {
      id v21 = v16;
    }
  }
  else
  {
    id v22 = __error();
    if (a4)
    {
      uint64_t v23 = *v22;
      id v24 = objc_alloc(MEMORY[0x263F087E8]);
      id v21 = 0;
      *a4 = (id)[v24 initWithDomain:*MEMORY[0x263F08438] code:v23 userInfo:0];
    }
    else
    {
      id v21 = 0;
    }
  }

  return v21;
}

- (void)_readNextProtobuf:(id)a3
{
  BOOL v4 = (void *)[a3 copy];
  objc_initWeak(&location, self);
  inputStream = self->_inputStream;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__SYFileTransferSyncEngine__readNextProtobuf___block_invoke;
  v7[3] = &unk_264424140;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  v7[4] = self;
  id v8 = v6;
  [(_SYInputStreamer *)inputStream readDataOfLength:8 completion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __46__SYFileTransferSyncEngine__readNextProtobuf___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained && [v5 length])
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    id v8 = [WeakRetained transportActivity];
    os_activity_scope_enter(v8, &state);

    uint64_t v9 = [v5 bytes];
    __int16 v10 = *(_WORD *)v9;
    BOOL v11 = *(_WORD *)(v9 + 2) != 0;
    uint64_t v12 = *(unsigned int *)(v9 + 4);
    if (*(_WORD *)(v9 + 2) && !*((unsigned char *)a1[4] + 49))
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      uint64_t v13 = qword_26AB04790;
      if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C7C9000, v13, OS_LOG_TYPE_DEFAULT, "Incoming data is all response data", buf, 2u);
      }
      [a1[4] _cancelResponses];
    }
    id v14 = (void *)WeakRetained[11];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __46__SYFileTransferSyncEngine__readNextProtobuf___block_invoke_123;
    v15[3] = &unk_264424118;
    objc_copyWeak(&v17, a1 + 6);
    id v16 = a1[5];
    __int16 v18 = v10;
    BOOL v19 = v11;
    [v14 readDataOfLength:v12 completion:v15];

    objc_destroyWeak(&v17);
    os_activity_scope_leave(&state);
  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }
}

void __46__SYFileTransferSyncEngine__readNextProtobuf___block_invoke_123(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = objc_msgSend(WeakRetained, "transportActivity", 0, 0);
    os_activity_scope_enter(v9, &v31);

    if (v5)
    {
      __int16 v10 = (objc_class *)SYMessageClassForID(*(unsigned __int16 *)(a1 + 48));
      BOOL v11 = v10;
      if (v10)
      {
        uint64_t v12 = (void *)[[v10 alloc] initWithData:v5];
        uint64_t v13 = v12;
        if (*(_WORD *)(a1 + 48) == 106)
        {
          id v14 = [v12 payload];
          BOOL v15 = v14 == 0;

          if (v15)
          {
            unint64_t v16 = [v5 length];
            if (v16 >= 0x14) {
              uint64_t v17 = 20;
            }
            else {
              uint64_t v17 = v16;
            }
            __int16 v18 = objc_msgSend(v5, "subdataWithRange:", 0, v17);
            if (_sync_log_facilities_pred != -1) {
              _os_once();
            }
            BOOL v19 = (id)qword_26AB04790;
            if (os_log_type_enabled(v19, (os_log_type_t)0x90u)) {
              __46__SYFileTransferSyncEngine__readNextProtobuf___block_invoke_123_cold_2((uint64_t)v18, v34, [v5 length], v19);
            }
          }
        }
        if (v13)
        {
          if (_sync_log_facilities_pred != -1) {
            _os_once();
          }
          id v20 = (id)qword_26AB04790;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            id v21 = NSStringFromClass(v11);
            *(_DWORD *)buf = 138543362;
            id v33 = v21;
            _os_log_impl(&dword_21C7C9000, v20, OS_LOG_TYPE_DEFAULT, "File-transfer engine decoded incoming %{public}@ message", buf, 0xCu);
          }
          (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        }
        else
        {
          if (_sync_log_facilities_pred != -1) {
            _os_once();
          }
          id v25 = (id)qword_26AB04790;
          if (os_log_type_enabled(v25, (os_log_type_t)0x90u))
          {
            __int16 v26 = NSStringFromClass(v11);
            __46__SYFileTransferSyncEngine__readNextProtobuf___block_invoke_123_cold_1(v26, buf, v25);
          }

          uint64_t v27 = *(void *)(a1 + 32);
          uint64_t v28 = *(unsigned __int16 *)(a1 + 48);
          int v29 = *(unsigned __int8 *)(a1 + 50);
          uint64_t v30 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2016 userInfo:0];
          (*(void (**)(uint64_t, void, uint64_t, BOOL, void *))(v27 + 16))(v27, 0, v28, v29 != 0, v30);
        }
      }
      else
      {
        uint64_t v22 = *(void *)(a1 + 32);
        uint64_t v23 = *(unsigned __int16 *)(a1 + 48);
        int v24 = *(unsigned __int8 *)(a1 + 50);
        uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2015 userInfo:0];
        (*(void (**)(uint64_t, void, uint64_t, BOOL, void *))(v22 + 16))(v22, 0, v23, v24 != 0, v13);
      }
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    os_activity_scope_leave(&v31);
  }
}

- (void)_recordLastSeqNo:(id)a3
{
  id v4 = a3;
  id v5 = [(SYSyncEngine *)self service];
  id v6 = [v5 name];
  id v7 = +[SYPersistentStore sharedPersistentStoreForService:v6];
  uint64_t v8 = [v4 sequenceNumber];
  uint64_t v9 = [v4 sender];

  __int16 v10 = [v9 peerID];
  id v12 = 0;
  LOBYTE(v8) = [v7 setLastSequenceNumber:v8 fromPeer:v10 error:&v12];
  id v11 = v12;

  if ((v8 & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_ERROR)) {
      -[SYFileTransferSyncEngine _recordLastSeqNo:]();
    }
  }
}

- (BOOL)_shouldTreatAsSessionEnd:(id)a3
{
  id v3 = a3;
  if (([v3 isMemberOfClass:objc_opt_class()] & 1) != 0
    || ([v3 isMemberOfClass:objc_opt_class()] & 1) != 0)
  {
    LOBYTE(v4) = 1;
  }
  else if (objc_opt_respondsToSelector())
  {
    int v4 = [v3 accepted] ^ 1;
  }
  else if (objc_opt_respondsToSelector())
  {
    LOBYTE(v4) = [v3 hasError];
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)_consumeRemainingStreamDataWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __81__SYFileTransferSyncEngine__consumeRemainingStreamDataWithIdentifier_completion___block_invoke;
  v10[3] = &unk_264424168;
  objc_copyWeak(&v13, &location);
  id v8 = v7;
  id v12 = v8;
  id v9 = v6;
  id v11 = v9;
  [(SYFileTransferSyncEngine *)self _readNextProtobuf:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __81__SYFileTransferSyncEngine__consumeRemainingStreamDataWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  unint64_t v7 = a2;
  unint64_t v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && v7 | v8)
  {
    if (!v8)
    {
      id v11 = [(id)v7 header];
      [WeakRetained _recordLastSeqNo:v11];

      [WeakRetained _consumeRemainingStreamDataWithIdentifier:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
      goto LABEL_13;
    }
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_ERROR)) {
      __81__SYFileTransferSyncEngine__consumeRemainingStreamDataWithIdentifier_completion___block_invoke_cold_1();
    }
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    __int16 v10 = qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_21C7C9000, v10, OS_LOG_TYPE_DEFAULT, "Canceling attempt to consume remaining messages. Sequence numbers will likely be out of sync now.", v12, 2u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_13:
}

- (void)_handleProtobuf:(id)a3 ofType:(unsigned __int16)a4 identifier:(id)a5 isResponse:(BOOL)a6 withCompletion:(id)a7
{
  BOOL v8 = a6;
  uint64_t v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  BOOL v15 = [(SYSyncEngine *)self service];
  unint64_t v16 = [(SYSyncEngine *)self responder];
  if (v10 == 106)
  {
    id v17 = v12;
    __int16 v18 = [v17 payload];
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __88__SYFileTransferSyncEngine__handleProtobuf_ofType_identifier_isResponse_withCompletion___block_invoke;
    v41[3] = &unk_264424190;
    id v42 = v14;
    [v16 handleOutOfBandData:v18 completion:v41];
  }
  else
  {
    BOOL v19 = [v12 header];
    char v20 = [v16 willAcceptMessageWithHeader:v19 messageID:v13];

    id v21 = [v12 header];
    [(SYFileTransferSyncEngine *)self _recordLastSeqNo:v21];

    if (v20)
    {
      if (v8)
      {
        uint64_t v22 = [(SYFileTransferSyncEngine *)self _wrapIncomingResponse:v12 ofType:v10 identifier:v13];
        uint64_t v23 = +[SYStatisticStore sharedInstance];
        int v24 = [v15 name];
        [v23 recordIncomingMessage:v22 forService:v24];

        v37[0] = MEMORY[0x263EF8330];
        v37[1] = 3221225472;
        v37[2] = __88__SYFileTransferSyncEngine__handleProtobuf_ofType_identifier_isResponse_withCompletion___block_invoke_131;
        id v37[3] = &unk_2644241B8;
        id v40 = v14;
        v37[4] = self;
        id v38 = v12;
        id v39 = v22;
        id v25 = v22;
        [v16 handleSyncResponse:v38 ofType:v10 completion:v37];
      }
      else
      {
        uint64_t v27 = [(SYFileTransferSyncEngine *)self _wrapIncomingMessage:v12 ofType:v10 identifier:v13];
        uint64_t v28 = +[SYStatisticStore sharedInstance];
        int v29 = [v15 name];
        [v28 recordIncomingMessage:v27 forService:v29];

        [v27 setExpectsResponse:0];
        objc_initWeak(buf, self);
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __88__SYFileTransferSyncEngine__handleProtobuf_ofType_identifier_isResponse_withCompletion___block_invoke_132;
        v30[3] = &unk_264424208;
        objc_copyWeak(&v34, buf);
        id v25 = v27;
        __int16 v35 = v10;
        id v31 = v25;
        char v32 = self;
        id v33 = v14;
        [v16 handleSyncRequest:v12 ofType:v10 response:v30];

        objc_destroyWeak(&v34);
        objc_destroyWeak(buf);
      }
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      __int16 v26 = qword_26AB04790;
      if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_21C7C9000, v26, OS_LOG_TYPE_DEFAULT, "Rejection/error somewhere caused remaining session messages to be ignored. Pulling them all out of the file to keep sequence numbers contiguous.", (uint8_t *)buf, 2u);
      }
      (*((void (**)(id, uint64_t))v14 + 2))(v14, 1);
    }
  }
}

void __88__SYFileTransferSyncEngine__handleProtobuf_ofType_identifier_isResponse_withCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_ERROR)) {
      __88__SYFileTransferSyncEngine__handleProtobuf_ofType_identifier_isResponse_withCompletion___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__SYFileTransferSyncEngine__handleProtobuf_ofType_identifier_isResponse_withCompletion___block_invoke_131(uint64_t a1, char a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    if (([*(id *)(a1 + 32) _shouldTreatAsSessionEnd:*(void *)(a1 + 40)] & 1) == 0)
    {
      id v12 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
      goto LABEL_17;
    }
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v6 = (void *)qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v7 = v6;
      BOOL v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      int v13 = 138543362;
      id v14 = v9;
      _os_log_impl(&dword_21C7C9000, v7, OS_LOG_TYPE_DEFAULT, "File-transfer engine ending session on %{public}@ message", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v10 = qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v5;
      _os_log_impl(&dword_21C7C9000, v10, OS_LOG_TYPE_DEFAULT, "Response handler failure reported: %@", (uint8_t *)&v13, 0xCu);
    }
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v11 = qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_21C7C9000, v11, OS_LOG_TYPE_DEFAULT, "Rejection/error somewhere caused remaining session messages to be ignored. Pulling them all out of the file to keep sequence numbers contiguous.", (uint8_t *)&v13, 2u);
    }
  }
  id v12 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_17:
  v12();
}

void __88__SYFileTransferSyncEngine__handleProtobuf_ofType_identifier_isResponse_withCompletion___block_invoke_132(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  BOOL v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained service];
    uint64_t v10 = [v8 _wrapResponse:v5 toRequest:*(void *)(a1 + 32) ofType:*(unsigned __int16 *)(a1 + 64)];
    [v10 setPersistentUserInfo:v6];
    id v11 = +[SYStatisticStore sharedInstance];
    __int16 v18 = v9;
    id v12 = [v9 name];
    [v11 recordOutgoingMessage:v10 forService:v12];

    int v13 = +[SYStatisticStore sharedInstance];
    uint64_t v14 = [v13 rowIDForPartialMessage:v10];

    [*(id *)(*(void *)(a1 + 40) + 192) addIndex:v14];
    uint64_t v15 = [v5 data];
    uint64_t v24 = 0x10000;
    LOWORD(v24) = *(_WORD *)(a1 + 64);
    HIDWORD(v24) = [v15 length];
    unint64_t v16 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithBytes:&v24 length:8];
    [v16 appendData:v15];
    id v17 = (void *)v8[14];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __88__SYFileTransferSyncEngine__handleProtobuf_ofType_identifier_isResponse_withCompletion___block_invoke_2;
    v19[3] = &unk_2644241E0;
    objc_copyWeak(&v22, (id *)(a1 + 56));
    __int16 v23 = *(_WORD *)(a1 + 64);
    id v20 = v5;
    id v21 = *(id *)(a1 + 48);
    [v17 writeData:v16 completion:v19];

    objc_destroyWeak(&v22);
  }
}

void __88__SYFileTransferSyncEngine__handleProtobuf_ofType_identifier_isResponse_withCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  unint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v8 = objc_msgSend(WeakRetained, "transportActivity", 0, 0);
    os_activity_scope_enter(v8, &v13);

    if ((a2 & 1) == 0)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_ERROR)) {
        __88__SYFileTransferSyncEngine__handleProtobuf_ofType_identifier_isResponse_withCompletion___block_invoke_2_cold_1();
      }
    }
    if ([v7 _shouldTreatAsSessionEnd:*(void *)(a1 + 32)])
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v9 = (id)qword_26AB04790;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = (objc_class *)objc_opt_class();
        id v11 = NSStringFromClass(v10);
        *(_DWORD *)buf = 138543362;
        uint64_t v15 = v11;
        _os_log_impl(&dword_21C7C9000, v9, OS_LOG_TYPE_DEFAULT, "File-transfer engine ending session on %{public}@ message", buf, 0xCu);
      }
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v12 = qword_26AB04790;
      if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C7C9000, v12, OS_LOG_TYPE_INFO, "Pulling remaining messages from the file to keep sequence numbers contiguous, in case this was an early return.", buf, 2u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    os_activity_scope_leave(&v13);
  }
}

- (void)_handleIncomingStreamDataWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __79__SYFileTransferSyncEngine__handleIncomingStreamDataWithIdentifier_completion___block_invoke;
  v10[3] = &unk_264424258;
  objc_copyWeak(&v14, &location);
  id v8 = v7;
  id v13 = v8;
  id v9 = v6;
  id v11 = v9;
  id v12 = self;
  [(SYFileTransferSyncEngine *)self _readNextProtobuf:v10];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __79__SYFileTransferSyncEngine__handleIncomingStreamDataWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  unint64_t v9 = a2;
  unint64_t v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && v9 | v10)
  {
    if (!v10)
    {
      uint64_t v13 = *(void *)(a1 + 32);
      id v12 = *(void **)(a1 + 40);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __79__SYFileTransferSyncEngine__handleIncomingStreamDataWithIdentifier_completion___block_invoke_134;
      v14[3] = &unk_264424230;
      objc_copyWeak(&v17, (id *)(a1 + 56));
      id v15 = *(id *)(a1 + 32);
      id v16 = *(id *)(a1 + 48);
      [v12 _handleProtobuf:v9 ofType:a3 identifier:v13 isResponse:a4 withCompletion:v14];

      objc_destroyWeak(&v17);
      goto LABEL_10;
    }
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_ERROR)) {
      __81__SYFileTransferSyncEngine__consumeRemainingStreamDataWithIdentifier_completion___block_invoke_cold_1();
    }
    [WeakRetained _handleError:v10 messageID:*(void *)(a1 + 32) streamer:*(void *)(*(void *)(a1 + 40) + 88)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_10:
}

void __79__SYFileTransferSyncEngine__handleIncomingStreamDataWithIdentifier_completion___block_invoke_134(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = WeakRetained;
    if (a2) {
      [WeakRetained _consumeRemainingStreamDataWithIdentifier:v5 completion:v6];
    }
    else {
      [WeakRetained _handleIncomingStreamDataWithIdentifier:v5 completion:v6];
    }
    id WeakRetained = v7;
  }
}

- (void)_handleIncomingSessionFileAtOwnedURL:(id)a3 metadata:(id)a4 identifier:(id)a5 idsContext:(id)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = (_SYInputStreamer *)a5;
  id v26 = a6;
  if (self->_inputStream)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v14 = qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v30 = v13;
      _os_log_impl(&dword_21C7C9000, v14, OS_LOG_TYPE_DEFAULT, "Deferring incoming file-transfer with identifier %{public}@ because I'm already within a file-transfer session", buf, 0xCu);
    }
    id v15 = objc_opt_new();
    [v15 setResourceURL:v11];
    [v15 setIdentifier:v13];
    [v15 setMetadata:v12];
    [v15 setIdsContext:v26];
    [(NSMutableArray *)self->_deferredIncomingSessions addObject:v15];
  }
  else
  {
    id v15 = [(SYSyncEngine *)self service];
    id v25 = [v12 objectForKeyedSubscript:@"SessionID"];
    id v16 = +[SYStatisticStore sharedInstance];
    id v17 = [v15 name];
    [v16 recordIncomingFileTransferAtURL:v11 metadata:v12 identifier:v13 forService:v17];

    [(SYFileTransferSyncEngine *)self beginResponseSession];
    [(_SYOutputStreamer *)self->_outputStream setStreamProperty:v25 forKey:SYAssociatedSessionIdentifierPropertyKey];
    objc_storeStrong((id *)&self->_inputFileURL, a3);
    __int16 v18 = [_SYInputStreamer alloc];
    inputFileURL = self->_inputFileURL;
    id v20 = [(SYSyncEngine *)self queue];
    id v21 = [(_SYInputStreamer *)v18 initWithCompressedFileURL:inputFileURL callbackQueue:v20];
    inputStream = self->_inputStream;
    self->_inputStream = v21;

    objc_storeStrong((id *)&self->_inputPriorityBoostContext, a6);
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    __int16 v23 = qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = self->_inputStream;
      *(_DWORD *)buf = 138543618;
      uint64_t v30 = v24;
      __int16 v31 = 2114;
      char v32 = v25;
      _os_log_impl(&dword_21C7C9000, v23, OS_LOG_TYPE_DEFAULT, "Incoming session stream: %{public}@, associated session ID: %{public}@", buf, 0x16u);
    }
    [(SYFileTransferSyncEngine *)self _suspendIdsQueue];
    objc_initWeak((id *)buf, self);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __96__SYFileTransferSyncEngine__handleIncomingSessionFileAtOwnedURL_metadata_identifier_idsContext___block_invoke;
    v27[3] = &unk_264424280;
    v27[4] = self;
    objc_copyWeak(&v28, (id *)buf);
    [(SYFileTransferSyncEngine *)self _handleIncomingStreamDataWithIdentifier:v13 completion:v27];
    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
}

void __96__SYFileTransferSyncEngine__handleIncomingSessionFileAtOwnedURL_metadata_identifier_idsContext___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "transportActivity", 0, 0);
  os_activity_scope_enter(v2, &v11);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    int v4 = qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *((void *)WeakRetained + 11);
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v5;
      _os_log_impl(&dword_21C7C9000, v4, OS_LOG_TYPE_DEFAULT, "Finished handling session stream: %{public}@", buf, 0xCu);
    }
    [WeakRetained endResponseSession];
    [*((id *)WeakRetained + 11) close];
    uint64_t v6 = (void *)*((void *)WeakRetained + 11);
    *((void *)WeakRetained + 11) = 0;

    id v7 = (void *)*((void *)WeakRetained + 12);
    *((void *)WeakRetained + 12) = 0;

    id v8 = [MEMORY[0x263F08850] defaultManager];
    unint64_t v9 = [*((id *)WeakRetained + 10) URLByDeletingLastPathComponent];
    [v8 removeItemAtURL:v9 error:0];

    unint64_t v10 = (void *)*((void *)WeakRetained + 10);
    *((void *)WeakRetained + 10) = 0;

    [WeakRetained _resumeIdsQueue];
  }

  os_activity_scope_leave(&v11);
}

- (void)_handleIncomingSessionFileAtURL:(id)a3 metadata:(id)a4 identifier:(id)a5 idsContext:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v28 = 0;
  uint64_t v14 = [(SYFileTransferSyncEngine *)self _assumeOwnershipOfURL:v10 error:&v28];
  id v15 = v28;
  if (v14)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v16 = qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v30 = v14;
      _os_log_impl(&dword_21C7C9000, v16, OS_LOG_TYPE_DEFAULT, "Keeping track of incoming file at URL %@", buf, 0xCu);
    }
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB047C0, OS_LOG_TYPE_DEBUG))
    {
      id v17 = [v11 objectForKeyedSubscript:@"EnqueuedAt"];
      [v17 timeIntervalSinceNow];
      double v19 = v18;
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v20 = qword_26AB047C0;
      if (os_log_type_enabled((os_log_t)qword_26AB047C0, OS_LOG_TYPE_DEBUG)) {
        -[SYFileTransferSyncEngine _handleIncomingSessionFileAtURL:metadata:identifier:idsContext:]((uint64_t)v12, v20, v19);
      }
    }
    objc_initWeak((id *)buf, self);
    id v21 = [(SYSyncEngine *)self responder];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __91__SYFileTransferSyncEngine__handleIncomingSessionFileAtURL_metadata_identifier_idsContext___block_invoke;
    v22[3] = &unk_2644242A8;
    objc_copyWeak(&v27, (id *)buf);
    id v23 = v14;
    id v24 = v11;
    id v25 = v12;
    id v26 = v13;
    [v21 serializeForIncomingSession:v22];

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_ERROR)) {
      -[SYFileTransferSyncEngine _handleIncomingSessionFileAtURL:metadata:identifier:idsContext:]();
    }
  }
}

void __91__SYFileTransferSyncEngine__handleIncomingSessionFileAtURL_metadata_identifier_idsContext___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v3 = qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v4;
      _os_log_impl(&dword_21C7C9000, v3, OS_LOG_TYPE_DEFAULT, "Engine deallocated while waiting to process incoming file at URL: %@", buf, 0xCu);
    }
    uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v6 = [*(id *)(a1 + 32) URLByDeletingLastPathComponent];
    id v9 = 0;
    char v7 = [v5 removeItemAtURL:v6 error:&v9];
    id v8 = v9;

    if ((v7 & 1) == 0)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_ERROR)) {
        __91__SYFileTransferSyncEngine__handleIncomingSessionFileAtURL_metadata_identifier_idsContext___block_invoke_cold_1();
      }
    }
  }
  [WeakRetained _handleIncomingSessionFileAtOwnedURL:*(void *)(a1 + 32) metadata:*(void *)(a1 + 40) identifier:*(void *)(a1 + 48) idsContext:*(void *)(a1 + 56)];
}

- (void)_processNMSMessageData:(id)a3 context:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = *(unsigned __int16 *)[v7 bytes];
  id v9 = [v6 storageGuid];
  id v10 = [v6 incomingResponseIdentifier];

  uint64_t v11 = [v7 length];
  if (v10)
  {
    uint64_t v12 = objc_msgSend(v7, "subdataWithRange:", 2, v11 - 2);

    [v6 incomingResponseIdentifier];
    v9 = id v7 = v9;
  }
  else
  {
    uint64_t v12 = objc_msgSend(v7, "subdataWithRange:", 3, v11 - 3);
  }

  id v13 = (objc_class *)SYMessageClassForID(v8);
  if (v13)
  {
    uint64_t v14 = v13;
    id v15 = (void *)[[v13 alloc] initWithData:v12];
    id v16 = v15;
    if (v8 == 106)
    {
      id v17 = [v15 payload];

      if (!v17)
      {
        unint64_t v18 = [v12 length];
        if (v18 >= 0x14) {
          uint64_t v19 = 20;
        }
        else {
          uint64_t v19 = v18;
        }
        id v28 = objc_msgSend(v12, "subdataWithRange:", 0, v19);
        id v20 = self;
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        id v21 = (void *)qword_26AB04790;
        if (os_log_type_enabled((os_log_t)qword_26AB04790, (os_log_type_t)0x90u)) {
          -[SYFileTransferSyncEngine _processNMSMessageData:context:](v21, v12, (uint64_t)v28);
        }

        self = v20;
      }
    }
    if (v16)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v22 = (void *)qword_26AB04790;
      if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = v22;
        id v24 = NSStringFromClass(v14);
        *(_DWORD *)buf = 138543362;
        uint64_t v31 = v24;
        _os_log_impl(&dword_21C7C9000, v23, OS_LOG_TYPE_DEFAULT, "File-transfer engine decoded incoming %{public}@ message", buf, 0xCu);
      }
      [(SYFileTransferSyncEngine *)self _suspendIdsQueue];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __59__SYFileTransferSyncEngine__processNMSMessageData_context___block_invoke;
      v29[3] = &unk_2644242D0;
      v29[4] = self;
      [(SYFileTransferSyncEngine *)self _handleProtobuf:v16 ofType:v8 identifier:v9 isResponse:v10 != 0 withCompletion:v29];
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v26 = (void *)qword_26AB04790;
      if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_ERROR)) {
        -[SYFileTransferSyncEngine _processNMSMessageData:context:](v26, v14);
      }
      id v27 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2016 userInfo:0];
      [(SYFileTransferSyncEngine *)self _handleError:v27 messageID:v9 streamer:0];
    }
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v25 = qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_ERROR)) {
      -[SYFileTransferSyncEngine _processNMSMessageData:context:](v8, v25);
    }
  }
}

uint64_t __59__SYFileTransferSyncEngine__processNMSMessageData_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resumeIdsQueue];
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v39 = a3;
  id v40 = a4;
  id v14 = a5;
  id v15 = a6;
  id v41 = a7;
  id v16 = a8;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v17 = [(SYSyncEngine *)self transportActivity];
  os_activity_scope_enter(v17, &state);

  unint64_t v18 = [v15 objectForKeyedSubscript:@"CRC"];
  uint64_t v19 = [(SYSyncEngine *)self service];
  id v20 = [v19 options];
  id v21 = [v20 objectForKeyedSubscript:@"SYServiceOptionEnableCRC"];
  if ([v21 integerValue]) {
    BOOL v22 = v18 == 0;
  }
  else {
    BOOL v22 = 1;
  }
  int v23 = !v22;

  if (v23)
  {
    unint64_t v24 = [(SYFileTransferSyncEngine *)self _crcChecksum:v14];
    id v25 = [NSNumber numberWithUnsignedLong:v24];
    char v26 = [v18 isEqual:v25];

    if (v26)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v27 = qword_26AB04790;
      if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C7C9000, v27, OS_LOG_TYPE_DEFAULT, "CRC validated.", buf, 2u);
      }
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v28 = (id)qword_26AB04790;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[SYFileTransferSyncEngine service:account:incomingResourceAtURL:metadata:fromID:context:]([v18 integerValue], v24, v44, v28);
      }
    }
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  int v29 = (id)qword_26AB047C0;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v30 = [v16 outgoingResponseIdentifier];
    uint64_t v31 = [v16 incomingResponseIdentifier];
    -[SYFileTransferSyncEngine service:account:incomingResourceAtURL:metadata:fromID:context:](v30, v31, buf, v29);
  }

  uint64_t v32 = [v15 objectForKeyedSubscript:@"ContainsSession"];
  int v33 = [v32 BOOLValue];

  if (v33)
  {
    id v34 = [v16 incomingResponseIdentifier];
    __int16 v35 = v34;
    if (v34)
    {
      id v36 = v34;
    }
    else
    {
      id v36 = [v16 outgoingResponseIdentifier];
    }
    id v37 = v36;

    [(SYFileTransferSyncEngine *)self _handleIncomingSessionFileAtURL:v14 metadata:v15 identifier:v37 idsContext:v16];
  }
  else
  {
    id v37 = [v15 objectForKeyedSubscript:@"UserMetadata"];
    id v38 = [(SYSyncEngine *)self responder];
    [v38 handleFileTransfer:v14 metadata:v37 completion:&__block_literal_global_13];
  }
  os_activity_scope_leave(&state);
}

void __90__SYFileTransferSyncEngine_service_account_incomingResourceAtURL_metadata_fromID_context___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_ERROR)) {
      __90__SYFileTransferSyncEngine_service_account_incomingResourceAtURL_metadata_fromID_context___block_invoke_cold_1();
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v62 = a3;
  id v63 = a4;
  id v12 = a5;
  id v64 = a6;
  id v13 = a7;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  val = self;
  id v14 = [(SYSyncEngine *)self transportActivity];
  os_activity_scope_enter(v14, &state);

  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v15 = (id)qword_26AB047C0;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v45 = [v12 length];
    id v46 = [v13 outgoingResponseIdentifier];
    id v47 = [v13 incomingResponseIdentifier];
    *(_DWORD *)buf = 134218498;
    uint64_t v79 = v45;
    __int16 v80 = 2114;
    *(void *)v81 = v46;
    *(_WORD *)&v81[8] = 2114;
    v82 = v47;
    _os_log_debug_impl(&dword_21C7C9000, v15, OS_LOG_TYPE_DEBUG, "Receiving: %zu bytes, %{public}@, replying to %{public}@", buf, 0x20u);
  }
  id v16 = [v13 storageGuid];
  if (!v16)
  {
    id v16 = [v13 outgoingResponseIdentifier];
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v17 = (id)qword_26AB04790;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = [v12 length];
    *(_DWORD *)buf = 138543618;
    uint64_t v79 = (uint64_t)v16;
    __int16 v80 = 2048;
    *(void *)v81 = v18;
    _os_log_impl(&dword_21C7C9000, v17, OS_LOG_TYPE_DEFAULT, "File-transfer engine receiving single message with GUID %{public}@, %ld bytes", buf, 0x16u);
  }

  if ((unint64_t)[v12 length] > 7)
  {
    id v20 = v12;
    unsigned int v60 = *(unsigned __int16 *)[v20 bytes];
    id v21 = v20;
    int v59 = *(unsigned __int16 *)([v21 bytes] + 2);
    id v22 = v21;
    unint64_t v23 = *(unsigned int *)([v22 bytes] + 4);
    if ([v22 length] - 8 >= v23)
    {
      v57 = objc_msgSend(v22, "subdataWithRange:", 8, v23);
      int v56 = v23;
      v58 = [(SYSyncEngine *)val responder];
      uint64_t v30 = (objc_class *)SYMessageClassForID(v60);
      uint64_t v31 = v30;
      if (v30)
      {
        uint64_t v32 = (void *)[[v30 alloc] initWithData:v57];
        if (v32)
        {
          if (_sync_log_facilities_pred != -1) {
            _os_once();
          }
          int v33 = (id)qword_26AB04790;
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            id v34 = NSStringFromClass(v31);
            *(_DWORD *)buf = 138543362;
            uint64_t v79 = (uint64_t)v34;
            _os_log_impl(&dword_21C7C9000, v33, OS_LOG_TYPE_DEFAULT, "File-transfer engine decoded incoming %{public}@ message", buf, 0xCu);
          }
          if (_sync_log_facilities_pred != -1) {
            _os_once();
          }
          __int16 v35 = (id)qword_26AB047C0;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            double Current = CFAbsoluteTimeGetCurrent();
            id v54 = [v32 header];
            [v54 timestamp];
            *(_DWORD *)buf = 138543618;
            uint64_t v79 = (uint64_t)v16;
            __int16 v80 = 2048;
            *(double *)v81 = Current - v55;
            _os_log_debug_impl(&dword_21C7C9000, v35, OS_LOG_TYPE_DEBUG, "Transit time for %{public}@: %.04f seconds", buf, 0x16u);
          }
          id v36 = [v32 header];
          char v37 = [v58 willAcceptMessageWithHeader:v36 messageID:v16];

          if (v37)
          {
            id v38 = [v32 header];
            [(SYFileTransferSyncEngine *)val _recordLastSeqNo:v38];

            [(SYFileTransferSyncEngine *)val _suspendIdsQueue];
            id v39 = [(SYSyncEngine *)val service];
            if (v59)
            {
              id v40 = [(SYFileTransferSyncEngine *)val _wrapIncomingResponse:v32 ofType:v60 identifier:v16];
              [v40 setIdsContext:v13];
              id v41 = +[SYStatisticStore sharedInstance];
              id v42 = [v39 name];
              [v41 recordIncomingMessage:v40 forService:v42];

              v74[0] = MEMORY[0x263EF8330];
              v74[1] = 3221225472;
              v74[2] = __72__SYFileTransferSyncEngine_service_account_incomingData_fromID_context___block_invoke;
              v74[3] = &unk_2644242F8;
              id v43 = v40;
              id v75 = v43;
              v76 = val;
              [v58 handleSyncResponse:v32 ofType:v60 completion:v74];
            }
            else
            {
              id v50 = [(SYFileTransferSyncEngine *)val _wrapIncomingMessage:v32 ofType:v60 identifier:v16];
              [v50 setIdsContext:v13];
              v51 = +[SYStatisticStore sharedInstance];
              uint64_t v52 = [v39 name];
              [v51 recordIncomingMessage:v50 forService:v52];

              [v50 setExpectsResponse:0];
              objc_initWeak((id *)buf, val);
              v65[0] = MEMORY[0x263EF8330];
              v65[1] = 3221225472;
              v65[2] = __72__SYFileTransferSyncEngine_service_account_incomingData_fromID_context___block_invoke_138;
              v65[3] = &unk_264424320;
              objc_copyWeak(&v70, (id *)buf);
              id v43 = v50;
              __int16 v71 = v60;
              __int16 v72 = 0;
              int v73 = v56;
              id v66 = v43;
              v67 = val;
              id v68 = v13;
              id v69 = v58;
              [v69 handleSyncRequest:v32 ofType:v60 response:v65];

              objc_destroyWeak(&v70);
              objc_destroyWeak((id *)buf);
            }
          }
          else
          {
            id v39 = [v32 header];
            [(SYFileTransferSyncEngine *)val _recordLastSeqNo:v39];
          }
        }
        else
        {
          if (_sync_log_facilities_pred != -1) {
            _os_once();
          }
          id v48 = (id)qword_26AB04790;
          if (os_log_type_enabled(v48, (os_log_type_t)0x90u))
          {
            id v49 = NSStringFromClass(v31);
            __46__SYFileTransferSyncEngine__readNextProtobuf___block_invoke_123_cold_1(v49, buf, v48);
          }

          id v39 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2016 userInfo:0];
          [v58 handleSyncError:v39 forMessageWithIdentifier:v16];
        }
      }
      else
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        uint64_t v44 = qword_26AB04790;
        if (os_log_type_enabled((os_log_t)qword_26AB04790, (os_log_type_t)0x90u)) {
          -[SYFileTransferSyncEngine service:account:incomingData:fromID:context:](v60, v44);
        }
        uint64_t v32 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2015 userInfo:0];
        [v58 handleSyncError:v32 forMessageWithIdentifier:v16];
      }
    }
    else
    {
      int v24 = v23;
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v25 = (id)qword_26AB04790;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = [v22 length];
        id v27 = v22;
        uint64_t v28 = [v27 bytes];
        uint64_t v29 = [v27 bytes];
        *(_DWORD *)buf = 134219522;
        uint64_t v79 = v26;
        __int16 v80 = 1024;
        *(_DWORD *)v81 = v60;
        *(_WORD *)&v81[4] = 1024;
        *(_DWORD *)&v81[6] = v59;
        LOWORD(v82) = 1024;
        *(_DWORD *)((char *)&v82 + 2) = v24;
        HIWORD(v82) = 2048;
        uint64_t v83 = v28;
        __int16 v84 = 1040;
        int v85 = 8;
        __int16 v86 = 2096;
        uint64_t v87 = v29;
        _os_log_impl(&dword_21C7C9000, v25, OS_LOG_TYPE_DEFAULT, "Received a protobuf encoded by NMSMessageCenter? I have %lu bytes of data, and a header saying { msgID %hu, isResponse %hu, msgLen %u }. Header bytes (%p) = %.*P", buf, 0x38u);
      }

      [(SYFileTransferSyncEngine *)val _processNMSMessageData:v22 context:v13];
    }
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v19 = qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, (os_log_type_t)0x90u)) {
      -[SYFileTransferSyncEngine service:account:incomingData:fromID:context:](v19);
    }
  }

  os_activity_scope_leave(&state);
}

void __72__SYFileTransferSyncEngine_service_account_incomingData_fromID_context___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v6 = qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_21C7C9000, v6, OS_LOG_TYPE_DEFAULT, "Response handler failure reported: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  [*(id *)(a1 + 32) setIdsContext:0];
  [*(id *)(a1 + 40) _resumeIdsQueue];
}

void __72__SYFileTransferSyncEngine_service_account_incomingData_fromID_context___block_invoke_138(uint64_t a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = [WeakRetained service];
    id v10 = (unsigned __int16 *)(a1 + 72);
    uint64_t v11 = [v8 _wrapResponse:v5 toRequest:*(void *)(a1 + 32) ofType:*(unsigned __int16 *)(a1 + 72)];
    id v35 = v6;
    [v11 setPersistentUserInfo:v6];
    id v12 = +[SYStatisticStore sharedInstance];
    id v34 = v9;
    id v13 = [v9 name];
    id v39 = v11;
    [v12 recordOutgoingMessage:v11 forService:v13];

    id v33 = v5;
    id v14 = [v5 data];
    uint64_t v42 = 0x10000;
    LOWORD(v42) = *(_WORD *)(a1 + 72);
    HIDWORD(v42) = [v14 length];
    id v15 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithBytes:&v42 length:8];
    char v37 = v14;
    [v15 appendData:v14];
    uint64_t v16 = *(void *)(a1 + 40);
    id v17 = *(void **)(v16 + 136);
    uint64_t v18 = [*(id *)(v16 + 128) devices];
    uint64_t v19 = [v17 findMatchingIDSDeviceFromList:v18];

    id v36 = (void *)v19;
    id v20 = (id)IDSCopyIDForDevice();
    if (!v20) {
      id v20 = (id)*MEMORY[0x263F4A148];
    }
    id v21 = [*(id *)(a1 + 48) priority];
    uint64_t v22 = [v21 integerValue];

    unint64_t v23 = [*(id *)(a1 + 56) extraTransportOptions];
    int v24 = IDSOptionsFromSYServiceOptions(v23);

    id v25 = *(void **)(*(void *)(a1 + 40) + 128);
    uint64_t v26 = [MEMORY[0x263EFFA08] setWithObject:v20];
    id v27 = [v8 idsOptions:v24];
    id v40 = 0;
    id v41 = 0;
    LODWORD(v25) = [v25 sendData:v15 toDestinations:v26 priority:v22 options:v27 identifier:&v41 error:&v40];
    id v28 = v41;
    id v38 = v40;

    if (v25)
    {
      uint64_t v29 = +[SYStatisticStore sharedInstance];
      [v29 assignIdentifier:v28 toOutgoingMessage:v39];

      [*(id *)(*(void *)(a1 + 40) + 208) addObject:v28];
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      uint64_t v30 = qword_26AB04790;
      uint64_t v31 = v34;
      if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_INFO))
      {
        int v32 = *v10;
        *(_DWORD *)buf = 67109378;
        int v44 = v32;
        __int16 v45 = 2114;
        id v46 = v28;
        _os_log_impl(&dword_21C7C9000, v30, OS_LOG_TYPE_INFO, "Enqueued response to %{companionsync:SYMessageID}hu, got identifier %{public}@", buf, 0x12u);
      }
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v5 = v33;
      id v6 = v35;
      if (os_log_type_enabled((os_log_t)qword_26AB047C0, OS_LOG_TYPE_DEBUG)) {
        __72__SYFileTransferSyncEngine_service_account_incomingData_fromID_context___block_invoke_138_cold_1();
      }
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v5 = v33;
      uint64_t v31 = v34;
      id v6 = v35;
      if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_ERROR)) {
        __72__SYFileTransferSyncEngine_service_account_incomingData_fromID_context___block_invoke_138_cold_2();
      }
    }
    [v8 _resumeIdsQueue];
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  BOOL v10 = a6;
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v31 = a3;
  id v33 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v17 = [(SYSyncEngine *)self transportActivity];
  os_activity_scope_enter(v17, &state);

  if (v15 && !v10)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_ERROR)) {
      -[SYFileTransferSyncEngine service:account:identifier:didSendWithSuccess:error:context:]();
    }
    -[SYFileTransferSyncEngine _handleError:messageID:streamer:](self, "_handleError:messageID:streamer:", v15, v14, 0, v31, v33);
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  uint64_t v18 = qword_26AB04790;
  if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = "NO";
    *(_DWORD *)buf = 138543874;
    id v36 = v14;
    if (v10) {
      uint64_t v19 = "YES";
    }
    __int16 v37 = 2080;
    id v38 = v19;
    __int16 v39 = 2114;
    uint64_t v40 = (uint64_t)v15;
    _os_log_impl(&dword_21C7C9000, v18, OS_LOG_TYPE_DEFAULT, "Send confirmation for message %{public}@: success=%s, error=%{public}@", buf, 0x20u);
  }
  id v20 = [(SYSyncEngine *)self service];
  if ([(NSMutableSet *)self->_singleMessageUUIDs containsObject:v14])
  {
    id v21 = +[SYStatisticStore sharedInstance];
    uint64_t v22 = [v20 name];
    [v21 updateOutgoingMessageWithIdentifier:v14 forService:v22 sentSuccessfully:v10 sendError:v15];

    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    unint64_t v23 = (id)qword_26AB047C0;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v24 = _SYObfuscate(v15);
      id v25 = (void *)v24;
      uint64_t v26 = "NO";
      *(_DWORD *)buf = 138543874;
      id v36 = v14;
      if (v10) {
        uint64_t v26 = "YES";
      }
      __int16 v37 = 2080;
      id v38 = v26;
      __int16 v39 = 2114;
      uint64_t v40 = v24;
      _os_log_debug_impl(&dword_21C7C9000, v23, OS_LOG_TYPE_DEBUG, "Device-level ACK: single message, %{public}@ (success=%s, error=%{public}@)", buf, 0x20u);
    }
  }
  else
  {
    id v27 = +[SYStatisticStore sharedInstance];
    [v27 updateOutgoingFileTransferWithIdentifier:v14 sentSuccessfully:v10 error:v15];

    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    unint64_t v23 = (id)qword_26AB047C0;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v28 = _SYObfuscate(v15);
      uint64_t v29 = (void *)v28;
      uint64_t v30 = "NO";
      *(_DWORD *)buf = 138543874;
      id v36 = v14;
      if (v10) {
        uint64_t v30 = "YES";
      }
      __int16 v37 = 2080;
      id v38 = v30;
      __int16 v39 = 2114;
      uint64_t v40 = v28;
      _os_log_debug_impl(&dword_21C7C9000, v23, OS_LOG_TYPE_DEBUG, "Device-level ACK: file transfer, %{public}@ (success=%s, error=%{public}@)", buf, 0x20u);
    }
  }

  if (v15)
  {
    os_unfair_lock_lock(&self->_messageMapLock);
    [(NSMutableDictionary *)self->_messageIDsToSessionIDs setObject:0 forKeyedSubscript:v14];
    os_unfair_lock_unlock(&self->_messageMapLock);
  }

  os_activity_scope_leave(&state);
}

- (void)_handleError:(id)a3 messageID:(id)a4 streamer:(id)a5
{
  v21[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = [v10 streamPropertyForKey:SYAssociatedSessionIdentifierPropertyKey];
    if (!v12) {
      goto LABEL_9;
    }
  }
  else
  {
    os_unfair_lock_lock(&self->_messageMapLock);
    id v12 = [(NSMutableDictionary *)self->_messageIDsToSessionIDs objectForKeyedSubscript:v9];
    os_unfair_lock_unlock(&self->_messageMapLock);
    if (!v12) {
      goto LABEL_9;
    }
  }
  id v13 = [v8 userInfo];
  if (v13)
  {
    id v14 = v13;
    id v15 = (void *)[v13 mutableCopy];
    [v15 setObject:v12 forKeyedSubscript:0x26CD1D180];
  }
  else
  {
    uint64_t v20 = 0x26CD1D180;
    v21[0] = v12;
    id v15 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
  }
  id v16 = objc_alloc(MEMORY[0x263F087E8]);
  id v17 = [v8 domain];
  uint64_t v18 = objc_msgSend(v16, "initWithDomain:code:userInfo:", v17, objc_msgSend(v8, "code"), v15);

  id v8 = (id)v18;
LABEL_9:
  uint64_t v19 = [(SYSyncEngine *)self responder];
  [v19 handleSyncError:v8 forMessageWithIdentifier:v9];
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(SYSyncEngine *)self transportActivity];
  os_activity_scope_enter(v14, &v20);

  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v15 = qword_26AB04790;
  if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v24 = v12;
    _os_log_impl(&dword_21C7C9000, v15, OS_LOG_TYPE_DEFAULT, "Delivery confirmation for message %{public}@", buf, 0xCu);
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB047C0, OS_LOG_TYPE_DEBUG)) {
    -[SYFileTransferSyncEngine service:account:identifier:hasBeenDeliveredWithContext:]();
  }
  if ([(NSMutableSet *)self->_singleMessageUUIDs containsObject:v12])
  {
    id v16 = +[SYStatisticStore sharedInstance];
    [v16 confirmDeliveryOfOutgoingMessage:v12];
  }
  os_unfair_lock_lock(&self->_messageMapLock);
  id v17 = [(NSMutableDictionary *)self->_messageIDsToSessionIDs objectForKeyedSubscript:v12];
  [(NSMutableDictionary *)self->_messageIDsToSessionIDs setObject:0 forKeyedSubscript:v12];
  os_unfair_lock_unlock(&self->_messageMapLock);
  if (v17)
  {
    uint64_t v21 = 0x26CD1D180;
    uint64_t v22 = v17;
    uint64_t v18 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  }
  else
  {
    uint64_t v18 = 0;
  }
  uint64_t v19 = [(SYSyncEngine *)self responder];
  [v19 sentMessageWithID:v12 context:v18];

  os_activity_scope_leave(&v20);
}

- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5
{
  id v8 = (IDSService *)a3;
  id v9 = a4;
  id v10 = a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v11 = [(SYSyncEngine *)self transportActivity];
  os_activity_scope_enter(v11, &state);

  if (self->_idsService == v8)
  {
    id v12 = [(SYSyncEngine *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __85__SYFileTransferSyncEngine_service_didSwitchActivePairedDevice_acknowledgementBlock___block_invoke;
    block[3] = &unk_264423CD0;
    id v14 = v9;
    id v15 = self;
    id v16 = v10;
    dispatch_async(v12, block);
  }
  os_activity_scope_leave(&state);
}

uint64_t __85__SYFileTransferSyncEngine_service_didSwitchActivePairedDevice_acknowledgementBlock___block_invoke(void *a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  uint64_t v2 = qword_26AB04790;
  if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    int v8 = 138412290;
    uint64_t v9 = v3;
    _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_DEFAULT, "Active IDS device changed to: %@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v4 = +[SYDevice deviceForIDSDevice:a1[4]];
  uint64_t v5 = a1[5];
  id v6 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v4;

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(SYSyncEngine *)self transportActivity];
  os_activity_scope_enter(v8, &v13);

  uint64_t v9 = [(SYDevice *)self->_activeDevice findMatchingIDSDeviceFromList:v7];

  if (![(SYDevice *)self->_activeDevice hasCachedNearby]
    || (((v9 != 0) ^ [(SYDevice *)self->_activeDevice cachedIsNearby]) & 1) != 0)
  {
    [(SYDevice *)self->_activeDevice setCachedIsNearby:v9 != 0];
    [(SYDevice *)self->_activeDevice setHasCachedNearby:1];
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v10 = qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = "left";
      if (v9) {
        id v11 = "entered";
      }
      *(_DWORD *)buf = 136315138;
      id v15 = v11;
      _os_log_impl(&dword_21C7C9000, v10, OS_LOG_TYPE_DEFAULT, "Target device %s proximity", buf, 0xCu);
    }
    id v12 = [(SYSyncEngine *)self responder];
    [v12 currentDeviceProximityChanged:v9 != 0];
  }
  os_activity_scope_leave(&v13);
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  int v8 = [(SYSyncEngine *)self transportActivity];
  os_activity_scope_enter(v8, &state);

  uint64_t v9 = [(SYDevice *)self->_activeDevice findMatchingIDSDeviceFromList:v7];

  if (![(SYDevice *)self->_activeDevice hasCachedConnected]
    || (((v9 != 0) ^ [(SYDevice *)self->_activeDevice cachedConnected]) & 1) != 0)
  {
    [(SYDevice *)self->_activeDevice setCachedConnected:v9 != 0];
    [(SYDevice *)self->_activeDevice setHasCachedConnected:1];
    if (v9)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      uint64_t v10 = qword_26AB04790;
      if (!os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_WORD *)os_activity_scope_state_s v13 = 0;
      id v11 = "Target device is connected";
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      uint64_t v10 = qword_26AB04790;
      if (!os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_WORD *)os_activity_scope_state_s v13 = 0;
      id v11 = "Target device is NOT connected";
    }
    _os_log_impl(&dword_21C7C9000, v10, OS_LOG_TYPE_DEFAULT, v11, v13, 2u);
LABEL_13:
    id v12 = [(SYSyncEngine *)self responder];
    [v12 currentDeviceConnectionChanged:v9 != 0];
  }
  os_activity_scope_leave(&state);
}

- (unint64_t)_crcChecksum:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v3 = open((const char *)[a3 fileSystemRepresentation], 0);
  uLong v4 = crc32(0, 0, 0);
  ssize_t v5 = read(v3, buf, 0x1000uLL);
  if (v5 >= 1)
  {
    uInt v6 = v5;
    do
    {
      uLong v4 = crc32(v4, buf, v6);
      ssize_t v7 = read(v3, buf, 0x1000uLL);
      uInt v6 = v7;
    }
    while (v7 > 0);
  }
  close(v3);
  return v4;
}

- (NSDictionary)customIDSOptions
{
  return self->_customIDSOptions;
}

- (void)setCustomIDSOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customIDSOptions, 0);
  objc_storeStrong((id *)&self->_responseSessionTransaction, 0);
  objc_storeStrong((id *)&self->_closureTransaction, 0);
  objc_storeStrong((id *)&self->_messageIDsToSessionIDs, 0);
  objc_storeStrong((id *)&self->_singleMessageUUIDs, 0);
  objc_storeStrong((id *)&self->_deferredIncomingSessions, 0);
  objc_storeStrong((id *)&self->_responseMessageRows, 0);
  objc_storeStrong((id *)&self->_messageRows, 0);
  objc_storeStrong((id *)&self->_idsQueue, 0);
  objc_storeStrong((id *)&self->_responseDevice, 0);
  objc_storeStrong((id *)&self->_sessionDevice, 0);
  objc_storeStrong((id *)&self->_activeDevice, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_responseStream, 0);
  objc_storeStrong((id *)&self->_responseFileURL, 0);
  objc_storeStrong((id *)&self->_inputPriorityBoostContext, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
  objc_storeStrong((id *)&self->_inputFileURL, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_outputFileURL, 0);
  objc_storeStrong((id *)&self->_sessionStartMessage, 0);
}

void __91__SYFileTransferSyncEngine_endFileTransferForStream_atURL_target_wasCancelled_messageRows___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __91__SYFileTransferSyncEngine_endFileTransferForStream_atURL_target_wasCancelled_messageRows___block_invoke_62_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uLong v4 = _SYObfuscate(a2);
  OUTLINED_FUNCTION_4_4();
  _os_log_error_impl(&dword_21C7C9000, a3, (os_log_type_t)0x90u, "Failed to send file at %@ via IDS: %{public}@", v5, 0x16u);
}

void __102__SYFileTransferSyncEngine__enqueueSingleMessage_withMessageID_priority_options_userContext_callback___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_21C7C9000, v0, v1, "IDS message send failed: %{public}@", v2, v3, v4, v5, v6);
}

- (void)enqueueSyncRequest:withMessageID:priority:options:userContext:callback:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6(&dword_21C7C9000, v0, v1, "File-transfer engine caching start request %p", v2, v3, v4, v5, v6);
}

void __99__SYFileTransferSyncEngine_enqueueSyncRequest_withMessageID_priority_options_userContext_callback___block_invoke_93_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_21C7C9000, v0, v1, "Error writing data to output file stream: %{public}@", v2, v3, v4, v5, v6);
}

void __84__SYFileTransferSyncEngine_outputStreamWithMetadata_priority_options_context_error___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_7_1(&dword_21C7C9000, a2, a3, "Failed to delete unused file-transfer file '%@' : %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

void __84__SYFileTransferSyncEngine_outputStreamWithMetadata_priority_options_context_error___block_invoke_cold_2(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 streamError];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3(&dword_21C7C9000, v5, v6, "Error writing to URL for file transfer: %{public}@", v7, v8, v9, v10, v11);
}

void __84__SYFileTransferSyncEngine_outputStreamWithMetadata_priority_options_context_error___block_invoke_cold_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v4 = a2;
  uint64_t v5 = _SYObfuscate(a3);
  OUTLINED_FUNCTION_4_4();
  _os_log_error_impl(&dword_21C7C9000, v4, OS_LOG_TYPE_ERROR, "Failed to delete file-transfer file '%@' : %{public}@", v6, 0x16u);
}

void __84__SYFileTransferSyncEngine_outputStreamWithMetadata_priority_options_context_error___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6(&dword_21C7C9000, v0, v1, "Sent OOB file: %{public}@", v2, v3, v4, v5, v6);
}

void __46__SYFileTransferSyncEngine__readNextProtobuf___block_invoke_123_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_21C7C9000, log, (os_log_type_t)0x90u, "File-transfer engine failed to decode incoming %{public}@ message", buf, 0xCu);
}

void __46__SYFileTransferSyncEngine__readNextProtobuf___block_invoke_123_cold_2(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl(&dword_21C7C9000, log, (os_log_type_t)0x90u, "Out of band message with nil payload found! Request data has size %lu. First 20 bytes = %{public}@", buf, 0x16u);
}

- (void)_recordLastSeqNo:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_21C7C9000, v0, v1, "Failed to store incoming sequence number: %{public}@", v2, v3, v4, v5, v6);
}

void __81__SYFileTransferSyncEngine__consumeRemainingStreamDataWithIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_21C7C9000, v0, v1, "Error reading from incoming file-transfer stream: %{public}@", v2, v3, v4, v5, v6);
}

void __88__SYFileTransferSyncEngine__handleProtobuf_ofType_identifier_isResponse_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_21C7C9000, v0, v1, "Failure dealing with OOB data: %{public}@", v2, v3, v4, v5, v6);
}

void __88__SYFileTransferSyncEngine__handleProtobuf_ofType_identifier_isResponse_withCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1(&dword_21C7C9000, v0, v1, "Failed to write %{companionsync:SYMessageID}hd response to stream, error = %{public}@");
}

- (void)_handleIncomingSessionFileAtURL:metadata:identifier:idsContext:.cold.1()
{
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_7_1(&dword_21C7C9000, v0, v1, "Failed to take ownership of incoming resource at URL '%@': %{public}@");
}

- (void)_handleIncomingSessionFileAtURL:(double)a3 metadata:identifier:idsContext:.cold.2(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = fabs(a3);
  _os_log_debug_impl(&dword_21C7C9000, a2, OS_LOG_TYPE_DEBUG, "Transfer time for %{public}@: %.02f seconds", (uint8_t *)&v3, 0x16u);
}

void __91__SYFileTransferSyncEngine__handleIncomingSessionFileAtURL_metadata_identifier_idsContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_21C7C9000, v0, v1, "Failed to remove incoming file: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_processNMSMessageData:(unsigned __int16)a1 context:(NSObject *)a2 .cold.1(unsigned __int16 a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21C7C9000, a2, OS_LOG_TYPE_ERROR, "No protobuf class mapping found for message ID %{companionsync:SYMessageID}hu", (uint8_t *)v2, 8u);
}

- (void)_processNMSMessageData:(void *)a1 context:(objc_class *)a2 .cold.2(void *a1, objc_class *a2)
{
  id v3 = a1;
  uint64_t v4 = NSStringFromClass(a2);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3(&dword_21C7C9000, v5, v6, "File-transfer engine failed to decode incoming %{public}@ message", v7, v8, v9, v10, v11);
}

- (void)_processNMSMessageData:(uint64_t)a3 context:.cold.3(void *a1, void *a2, uint64_t a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  [a2 length];
  OUTLINED_FUNCTION_4_3();
  uint64_t v7 = a3;
  _os_log_error_impl(&dword_21C7C9000, v5, (os_log_type_t)0x90u, "Out of band message with nil payload found! Request data has size %lu. First 20 bytes = %{public}@", v6, 0x16u);
}

- (void)service:(uint8_t *)buf account:(os_log_t)log incomingResourceAtURL:metadata:fromID:context:.cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_21C7C9000, log, OS_LOG_TYPE_DEBUG, "Incoming resource: %{public}@, replying to %{public}@", buf, 0x16u);
}

- (void)service:(uint8_t *)buf account:(os_log_t)log incomingResourceAtURL:metadata:fromID:context:.cold.2(int a1, int a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a1;
  *((_WORD *)buf + 4) = 1024;
  *(_DWORD *)(buf + 10) = a2;
  _os_log_error_impl(&dword_21C7C9000, log, OS_LOG_TYPE_ERROR, "Incoming message CRC failure (0x%08x vs 0x%08x). Terrible things are about to happen.", buf, 0xEu);
}

void __90__SYFileTransferSyncEngine_service_account_incomingResourceAtURL_metadata_fromID_context___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_21C7C9000, v0, v1, "Failed to process incoming file transfer: %{public}@", v2, v3, v4, v5, v6);
}

- (void)service:(os_log_t)log account:incomingData:fromID:context:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21C7C9000, log, (os_log_type_t)0x90u, "Incoming message data too small to contain protobuf header", v1, 2u);
}

- (void)service:(unsigned __int16)a1 account:(NSObject *)a2 incomingData:fromID:context:.cold.2(unsigned __int16 a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21C7C9000, a2, (os_log_type_t)0x90u, "Unknown message ID: %hu", (uint8_t *)v2, 8u);
}

void __72__SYFileTransferSyncEngine_service_account_incomingData_fromID_context___block_invoke_138_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3_2();
  _os_log_debug_impl(&dword_21C7C9000, v0, OS_LOG_TYPE_DEBUG, "Sent response to %{companionsync:SYMessageID}hu: %{public}@", v1, 0x12u);
}

void __72__SYFileTransferSyncEngine_service_account_incomingData_fromID_context___block_invoke_138_cold_2()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1(&dword_21C7C9000, v0, v1, "IDS send failed for response to %{companionsync:SYMessageID}hu, error: %{public}@");
}

- (void)service:account:identifier:didSendWithSuccess:error:context:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_21C7C9000, v0, v1, "Error sending session via file-transfer: %{public}@", v2, v3, v4, v5, v6);
}

- (void)service:account:identifier:hasBeenDeliveredWithContext:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6(&dword_21C7C9000, v0, v1, "App-level ACK: %{public}@", v2, v3, v4, v5, v6);
}

@end