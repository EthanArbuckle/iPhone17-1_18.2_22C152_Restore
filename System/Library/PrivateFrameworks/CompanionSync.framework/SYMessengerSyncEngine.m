@interface SYMessengerSyncEngine
- (BOOL)_checkMessageHeader:(id)a3 messageID:(id)a4;
- (BOOL)resume:(id *)a3;
- (BOOL)targetConnected;
- (BOOL)targetIsNearby;
- (NSDictionary)customIDSOptions;
- (OS_dispatch_queue)idsQueue;
- (SYMessengerSyncEngine)initWithService:(id)a3 queue:(id)a4;
- (id)_fileTransferHeader;
- (id)_getRequestHeader:(id)a3;
- (id)_getResponseHeader:(id)a3;
- (id)_wrapMessage:(id)a3 ofType:(unsigned __int16)a4 userInfo:(id)a5;
- (id)cancelMessagesReturningFailures:(id)a3;
- (id)messageCenter;
- (id)outputStreamWithMetadata:(id)a3 priority:(int64_t)a4 options:(id)a5 context:(id)a6 error:(id *)a7;
- (id)stateForLogging;
- (void)_handleError:(id)a3 forMessageID:(unsigned __int16)a4;
- (void)_hookupMessageHandler;
- (void)_recordLastSeqNo:(id)a3;
- (void)_resumeIncomingMessages;
- (void)_suspendIncomingMessages;
- (void)_updateMessageCenterPrefs:(id)a3;
- (void)beginSession;
- (void)enqueueSyncRequest:(id)a3 withMessageID:(unsigned __int16)a4 priority:(int64_t)a5 options:(id)a6 userContext:(id)a7 callback:(id)a8;
- (void)messageCenter:(id)a3 activeDeviceChanged:(id)a4 acknowledgement:(id)a5;
- (void)messageCenter:(id)a3 connectedDevicesChanged:(id)a4;
- (void)messageCenter:(id)a3 didReceiveIncomingFileTransfer:(id)a4;
- (void)messageCenter:(id)a3 didReceiveUnknownRequest:(id)a4;
- (void)messageCenter:(id)a3 didResolveIDSIdentifier:(id)a4 forFileTransfer:(id)a5;
- (void)messageCenter:(id)a3 didResolveIDSIdentifier:(id)a4 forResponse:(id)a5;
- (void)messageCenter:(id)a3 didResolveIDSIdentifierForRequest:(id)a4;
- (void)messageCenter:(id)a3 didSuccessfullyDeliverRequestWithIdentifier:(id)a4 userInfo:(id)a5;
- (void)messageCenter:(id)a3 didSuccessfullySendRequestWithIdentifier:(id)a4 userInfo:(id)a5;
- (void)messageCenter:(id)a3 failedToSendMessageWithIdentifier:(id)a4 error:(id)a5 userInfo:(id)a6;
- (void)messageCenter:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)setCustomIDSOptions:(id)a3;
- (void)suspend;
@end

@implementation SYMessengerSyncEngine

- (SYMessengerSyncEngine)initWithService:(id)a3 queue:(id)a4
{
  id v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SYMessengerSyncEngine;
  v7 = [(SYSyncEngine *)&v27 initWithService:v6 queue:a4];
  if (v7)
  {
    id v8 = [NSString alloc];
    v9 = [v6 name];
    v10 = [v9 lastPathComponent];
    v11 = (void *)[v8 initWithFormat:@"%@ SYMessengerSyncEngine IDS Queue", v10];

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
    dispatch_semaphore_t v18 = dispatch_semaphore_create(1);
    lookupLock = v7->_lookupLock;
    v7->_lookupLock = (OS_dispatch_semaphore *)v18;

    uint64_t v20 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    requestLookup = v7->_requestLookup;
    v7->_requestLookup = (NSMapTable *)v20;

    uint64_t v22 = [MEMORY[0x263F08968] mapTableWithKeyOptions:517 valueOptions:0x10000];
    callbackLookup = v7->_callbackLookup;
    v7->_callbackLookup = (NSMapTable *)v22;

    v24 = v7;
  }

  return v7;
}

- (id)messageCenter
{
  return self->_messageCenter;
}

- (BOOL)targetIsNearby
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v3 = [(SYDevice *)self->_activeDevice hasCachedNearby];
  activeDevice = self->_activeDevice;
  if (v3)
  {
    v5 = self->_activeDevice;
    return [(SYDevice *)v5 cachedIsNearby];
  }
  else
  {
    v7 = [(NMSMessageCenter *)self->_messageCenter idsService];
    id v8 = [v7 devices];
    v9 = [(SYDevice *)activeDevice findMatchingIDSDeviceFromList:v8];

    if (v9)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      v10 = (void *)qword_26AB04790;
      if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v10;
        int v12 = [v9 isNearby];
        v13 = "not ";
        if (v12) {
          v13 = "";
        }
        int v15 = 136315138;
        dispatch_queue_t v16 = v13;
        _os_log_impl(&dword_21C7C9000, v11, OS_LOG_TYPE_DEFAULT, "Target device is %snearby, caching value.", (uint8_t *)&v15, 0xCu);
      }
      -[SYDevice setCachedIsNearby:](self->_activeDevice, "setCachedIsNearby:", [v9 isNearby]);
      [(SYDevice *)self->_activeDevice setHasCachedNearby:1];
      char v14 = [v9 isNearby];
    }
    else
    {
      char v14 = 0;
    }

    return v14;
  }
}

- (BOOL)targetConnected
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v3 = [(SYDevice *)self->_activeDevice hasCachedConnected];
  activeDevice = self->_activeDevice;
  if (v3)
  {
    v5 = self->_activeDevice;
    return [(SYDevice *)v5 cachedConnected];
  }
  else
  {
    v7 = [(NMSMessageCenter *)self->_messageCenter idsService];
    id v8 = [v7 devices];
    v9 = [(SYDevice *)activeDevice findMatchingIDSDeviceFromList:v8];

    if (v9)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      v10 = (void *)qword_26AB04790;
      if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v10;
        int v12 = [v9 isConnected];
        v13 = "not ";
        if (v12) {
          v13 = "";
        }
        int v15 = 136315138;
        dispatch_queue_t v16 = v13;
        _os_log_impl(&dword_21C7C9000, v11, OS_LOG_TYPE_DEFAULT, "Target device is %sconnected, caching value.", (uint8_t *)&v15, 0xCu);
      }
      -[SYDevice setCachedConnected:](self->_activeDevice, "setCachedConnected:", [v9 isConnected]);
      [(SYDevice *)self->_activeDevice setHasCachedConnected:1];
      char v14 = [v9 isConnected];
    }
    else
    {
      char v14 = 0;
    }

    return v14;
  }
}

- (BOOL)resume:(id *)a3
{
  [(SYMessengerSyncEngine *)self _hookupMessageHandler];
  [(NMSMessageCenter *)self->_messageCenter resume];
  v5 = +[SYDevice targetableDevice];
  activeDevice = self->_activeDevice;
  self->_activeDevice = v5;

  v7 = self->_activeDevice;
  if (a3 && !v7) {
    *a3 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2003 userInfo:0];
  }
  return v7 != 0;
}

- (void)suspend
{
  [(NMSMessageCenter *)self->_messageCenter _obliterate];
  messageCenter = self->_messageCenter;
  self->_messageCenter = 0;
}

- (void)beginSession
{
  v9.receiver = self;
  v9.super_class = (Class)SYMessengerSyncEngine;
  [(SYSyncEngine *)&v9 beginSession];
  activeDevice = self->_activeDevice;
  v4 = [(NMSMessageCenter *)self->_messageCenter service];
  v5 = [v4 devices];
  id v6 = [(SYDevice *)activeDevice findMatchingIDSDeviceFromList:v5];

  v7 = [(NMSMessageCenter *)self->_messageCenter deviceIDFromDevice:v6];
  sessionDeviceID = self->_sessionDeviceID;
  self->_sessionDeviceID = v7;
}

- (void)enqueueSyncRequest:(id)a3 withMessageID:(unsigned __int16)a4 priority:(int64_t)a5 options:(id)a6 userContext:(id)a7 callback:(id)a8
{
  uint64_t v12 = a4;
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if (!self->_messageCenter) {
    _os_assumes_log();
  }
  dispatch_semaphore_t v18 = [(SYMessengerSyncEngine *)self _wrapMessage:v14 ofType:v12 userInfo:v16];
  if (v18)
  {
    id v35 = v16;
    int64_t v33 = a5;
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v34 = v17;
    id v19 = v14;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
      -[SYMessengerSyncEngine enqueueSyncRequest:withMessageID:priority:options:userContext:callback:]();
    }
    uint64_t v20 = [(SYSyncEngine *)self responder];
    v21 = [v20 extraTransportOptions];
    uint64_t v22 = [(SYMessengerSyncEngine *)self customIDSOptions];
    id v36 = v15;
    v23 = IDSOptionsFromSYServiceOptions(v15);
    v24 = CoalesceOptionDictionaries(v22, v23);
    v25 = CoalesceOptionDictionaries(v21, v24);

    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v14 = v19;
    id v16 = v35;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
      -[SYMessengerSyncEngine enqueueSyncRequest:withMessageID:priority:options:userContext:callback:]();
    }
    if (v33 == 20) {
      uint64_t v26 = 2;
    }
    else {
      uint64_t v26 = v33 != 0;
    }
    [v18 setPriority:v26];
    [v18 setExtraIDSOptions:v25];
    objc_super v27 = +[SYStatisticStore sharedInstance];
    v28 = [(SYSyncEngine *)self service];
    v29 = [v28 name];
    [v27 recordOutgoingMessage:v18 forService:v29];

    dispatch_semaphore_wait((dispatch_semaphore_t)self->_lookupLock, 0xFFFFFFFFFFFFFFFFLL);
    callbackLookup = self->_callbackLookup;
    id v17 = v34;
    v31 = (void *)MEMORY[0x21D4B17C0](v34);
    [(NSMapTable *)callbackLookup setObject:v31 forKey:v18];

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_lookupLock);
    [(NMSMessageCenter *)self->_messageCenter sendRequest:v18];
    id v15 = v36;
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    v32 = (void *)qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_ERROR)) {
      -[SYLegacyStore sendMessage:ofType:respondingTo:userInfo:idsOptions:](v32);
    }
    v25 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2001 userInfo:0];
    (*((void (**)(id, void, void, void *))v17 + 2))(v17, 0, 0, v25);
  }
}

- (id)outputStreamWithMetadata:(id)a3 priority:(int64_t)a4 options:(id)a5 context:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (!self->_messageCenter) {
    _os_assumes_log();
  }
  id v15 = [NSURL _SYURLForNewTemporaryFile:a7];
  if (v15)
  {
    id v16 = [[SYCompressedFileOutputStream alloc] initToCompressedFileAtURL:v15 shouldAppend:0];
    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __81__SYMessengerSyncEngine_outputStreamWithMetadata_priority_options_context_error___block_invoke;
    v18[3] = &unk_264423E60;
    objc_copyWeak(v24, &location);
    id v19 = v15;
    uint64_t v20 = self;
    id v21 = v13;
    id v22 = v12;
    v24[1] = (id)a4;
    id v23 = v14;
    [v16 setOnClose:v18];

    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

void __81__SYMessengerSyncEngine_outputStreamWithMetadata_priority_options_context_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained && [v3 streamStatus] != 7)
  {
    v11 = [*(id *)(a1 + 40) customIDSOptions];
    id v12 = IDSOptionsFromSYServiceOptions(*(void **)(a1 + 48));
    id v13 = CoalesceOptionDictionaries(v11, v12);

    id v14 = objc_opt_new();
    [v14 setFileURL:*(void *)(a1 + 32)];
    [v14 setMetadata:*(void *)(a1 + 56)];
    uint64_t v15 = *(void *)(a1 + 80);
    if (v15 == 20) {
      uint64_t v16 = 2;
    }
    else {
      uint64_t v16 = v15 != 0;
    }
    [v14 setPriority:v16];
    id v17 = [WeakRetained service];
    [v17 defaultMessageTimeout];
    objc_msgSend(v14, "setSendTimeout:");

    [v14 setPersistentUserInfo:*(void *)(a1 + 64)];
    [v14 setExtraIDSOptions:v13];
    dispatch_semaphore_t v18 = objc_opt_new();
    id v19 = [*(id *)(a1 + 40) _fileTransferHeader];
    [v18 setHeader:v19];

    uint64_t v20 = [v18 header];
    [v20 timestamp];
    double v22 = v21;
    [v14 sendTimeout];
    double v24 = v22 + v23;
    v25 = [v18 header];
    [v25 setTimeout:v24];

    objc_msgSend(v18, "setDecompressedFileSize:", objc_msgSend(v3, "bytesThroughput"));
    [v14 setPbHeaderInfo:v18];
    [WeakRetained[6] sendFile:v14];
  }
  else
  {
    v5 = [v3 streamError];

    if (v5)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v6 = (void *)qword_26AB04790;
      if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_ERROR)) {
        __81__SYMessengerSyncEngine_outputStreamWithMetadata_priority_options_context_error___block_invoke_cold_2(v6);
      }
    }
    v7 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v8 = *(void *)(a1 + 32);
    id v26 = 0;
    char v9 = [v7 removeItemAtURL:v8 error:&v26];
    id v10 = v26;

    if ((v9 & 1) == 0)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_ERROR)) {
        __81__SYMessengerSyncEngine_outputStreamWithMetadata_priority_options_context_error___block_invoke_cold_1();
      }
    }
  }
}

- (id)cancelMessagesReturningFailures:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v17 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * v10);
          messageCenter = self->_messageCenter;
          id v18 = 0;
          BOOL v13 = [(NMSMessageCenter *)messageCenter cancelMessageWithID:v11 error:&v18];
          id v14 = v18;
          if (!v13)
          {
            if (_sync_log_facilities_pred != -1) {
              _os_once();
            }
            uint64_t v15 = qword_26AB04790;
            if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543618;
              uint64_t v24 = v11;
              __int16 v25 = 2112;
              id v26 = v14;
              _os_log_impl(&dword_21C7C9000, v15, OS_LOG_TYPE_INFO, "Failed to cancel outgoing message (%{public}@): %@", buf, 0x16u);
            }
            [v5 addObject:v11];
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v8);
    }

    id v4 = v17;
  }
  else
  {
    id v5 = v4;
  }

  return v5;
}

- (id)stateForLogging
{
  id v3 = objc_opt_new();
  [v3 setType:1];
  [v3 setSuspended:self->_messageCenter == 0];
  objc_msgSend(v3, "setInSession:", -[SYSyncEngine isInSession](self, "isInSession"));
  objc_msgSend(v3, "setBuffersSessions:", -[SYSyncEngine buffersSessions](self, "buffersSessions"));
  return v3;
}

- (id)_fileTransferHeader
{
  v2 = [(SYSyncEngine *)self service];
  id v3 = [v2 name];
  id v4 = +[SYPersistentStore sharedPersistentStoreForService:v3];

  id v5 = objc_opt_new();
  [v5 setTimestamp:CFAbsoluteTimeGetCurrent()];
  id v6 = [SYPeer alloc];
  uint64_t v7 = [v2 peerID];
  uint64_t v8 = [v2 generationID];
  uint64_t v9 = [(SYPeer *)v6 initWithPeerID:v7 generation:v8];
  [v5 setSender:v9];

  uint64_t v10 = [SYVectorClock alloc];
  uint64_t v11 = [v4 vectorClockJSON];
  id v12 = [(SYVectorClock *)v10 initWithJSONRepresentation:v11];
  [v5 setState:v12];

  [v5 setVersion:2];
  [v5 setSequenceNumber:0];

  return v5;
}

- (void)_updateMessageCenterPrefs:(id)a3
{
  id v11 = a3;
  id v4 = [v11 objectForKeyedSubscript:@"EnableTransmitWindow"];
  id v5 = v4;
  if (!v4 || [v4 BOOLValue])
  {
    [(NMSMessageCenter *)self->_messageCenter setEnableTransmissionWindow:1];
    id v6 = [v11 objectForKeyedSubscript:@"MaxMessagesInFlight"];

    if (v6) {
      uint64_t v7 = [v6 unsignedIntegerValue];
    }
    else {
      uint64_t v7 = 20;
    }
    [(NMSMessageCenter *)self->_messageCenter setMaxMessagesInFlight:v7];
    uint64_t v8 = [v11 objectForKeyedSubscript:@"MinMessagesInFlight"];

    if (v8) {
      uint64_t v9 = [v8 unsignedIntegerValue];
    }
    else {
      uint64_t v9 = 10;
    }
    [(NMSMessageCenter *)self->_messageCenter setMinMessagesInFlight:v9];
    id v5 = [v11 objectForKeyedSubscript:@"MaxBytesInFlight"];

    if (v5) {
      uint64_t v10 = [v5 unsignedIntegerValue];
    }
    else {
      uint64_t v10 = 1000000;
    }
    [(NMSMessageCenter *)self->_messageCenter setMaxBytesInFlight:v10];
  }
}

- (void)_suspendIncomingMessages
{
}

- (void)_resumeIncomingMessages
{
}

- (void)_hookupMessageHandler
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v3 = qword_26AB04790;
  if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21C7C9000, v3, OS_LOG_TYPE_DEFAULT, "Creating NanoMessageCenter", (uint8_t *)buf, 2u);
  }
  id v4 = [NMSMessageCenter alloc];
  id v5 = [(SYSyncEngine *)self service];
  id v6 = [v5 name];
  uint64_t v7 = [(NMSMessageCenter *)v4 initWithIDSServiceIdentifier:v6];
  messageCenter = self->_messageCenter;
  self->_messageCenter = v7;

  uint64_t v9 = [(SYSyncEngine *)self transportActivity];
  [(NMSMessageCenter *)self->_messageCenter setTransportActivity:v9];

  uint64_t v10 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v11 = [v10 persistentDomainForName:@"com.apple.companionsync"];

  [(SYMessengerSyncEngine *)self _updateMessageCenterPrefs:v11];
  id v12 = self->_messageCenter;
  uint64_t v13 = objc_opt_class();
  [(NMSMessageCenter *)v12 mapPBRequest:v13 toResponse:objc_opt_class() messageID:102];
  id v14 = self->_messageCenter;
  uint64_t v15 = objc_opt_class();
  [(NMSMessageCenter *)v14 mapPBRequest:v15 toResponse:objc_opt_class() messageID:101];
  uint64_t v16 = self->_messageCenter;
  uint64_t v17 = objc_opt_class();
  [(NMSMessageCenter *)v16 mapPBRequest:v17 toResponse:objc_opt_class() messageID:103];
  id v18 = self->_messageCenter;
  uint64_t v19 = objc_opt_class();
  [(NMSMessageCenter *)v18 mapPBRequest:v19 toResponse:objc_opt_class() messageID:104];
  long long v20 = self->_messageCenter;
  uint64_t v21 = objc_opt_class();
  [(NMSMessageCenter *)v20 mapPBRequest:v21 toResponse:objc_opt_class() messageID:105];
  [(NMSMessageCenter *)self->_messageCenter mapPBRequest:objc_opt_class() toResponse:0 messageID:106];
  [(NMSMessageCenter *)self->_messageCenter mapPBRequest:objc_opt_class() toResponse:0 messageID:0x7FFFLL];
  long long v22 = self->_messageCenter;
  uint64_t v23 = objc_opt_class();
  [(NMSMessageCenter *)v22 mapPBRequest:v23 toResponse:objc_opt_class() messageID:1];
  uint64_t v24 = self->_messageCenter;
  uint64_t v25 = objc_opt_class();
  [(NMSMessageCenter *)v24 mapPBRequest:v25 toResponse:objc_opt_class() messageID:2];
  [(NMSMessageCenter *)self->_messageCenter mapPBRequest:objc_opt_class() toResponse:0 messageID:3];
  id v26 = self->_messageCenter;
  uint64_t v27 = objc_opt_class();
  [(NMSMessageCenter *)v26 mapPBRequest:v27 toResponse:objc_opt_class() messageID:4];
  uint64_t v28 = self->_messageCenter;
  uint64_t v29 = objc_opt_class();
  [(NMSMessageCenter *)v28 mapPBRequest:v29 toResponse:objc_opt_class() messageID:5];
  [(NMSMessageCenter *)self->_messageCenter mapPBRequest:objc_opt_class() toResponse:0 messageID:6];
  [(NMSMessageCenter *)self->_messageCenter setDelegate:self queue:self->_idsQueue];
  objc_initWeak(buf, self);
  id v30 = objc_alloc_init(MEMORY[0x263F089C8]);
  id v31 = objc_alloc_init(MEMORY[0x263F089C8]);
  objc_msgSend(v30, "addIndexesInRange:", 1, 6);
  objc_msgSend(v30, "addIndexesInRange:", 101, 6);
  [v30 addIndex:0x7FFFLL];
  [v31 addIndex:1];
  [v31 addIndex:2];
  [v31 addIndex:4];
  [v31 addIndex:5];
  objc_msgSend(v31, "addIndexesInRange:", 101, 6);
  [v31 removeIndex:106];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke;
  v37[3] = &unk_264423EB0;
  v37[4] = self;
  objc_copyWeak(&v38, buf);
  [v30 enumerateIndexesUsingBlock:v37];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_3;
  v35[3] = &unk_264423EB0;
  v35[4] = self;
  objc_copyWeak(&v36, buf);
  [v31 enumerateIndexesUsingBlock:v35];
  v32 = self->_messageCenter;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_84;
  v33[3] = &unk_264422F00;
  objc_copyWeak(&v34, buf);
  [(NMSMessageCenter *)v32 addRequestHandlerForMessageID:106 usingBlock:v33];
  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v38);

  objc_destroyWeak(buf);
}

void __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke(uint64_t a1, unsigned __int16 a2)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 48);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_2;
  v9[3] = &unk_264422F78;
  id v5 = (id *)(a1 + 40);
  objc_copyWeak(&v10, (id *)(a1 + 40));
  unsigned __int16 v11 = a2;
  [v4 addErrorHandlerForMessageID:a2 usingBlock:v9];
  id v6 = *(void **)(*(void *)(a1 + 32) + 48);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_73;
  v7[3] = &unk_264422F00;
  objc_copyWeak(&v8, v5);
  [v6 addRequestHandlerForMessageID:a2 usingBlock:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
}

void __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v5 = qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_ERROR)) {
      __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_2_cold_1(a1, (uint64_t)v3, v5);
    }
    [WeakRetained _handleError:v3 forMessageID:*(unsigned __int16 *)(a1 + 40)];
  }
}

void __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_73(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained service];
    uint64_t v7 = +[SYStatisticStore sharedInstance];
    id v8 = [v6 name];
    [v7 recordIncomingMessage:v3 forService:v8];

    uint64_t v9 = [v5 _getRequestHeader:v3];
    id v10 = (void *)[v9 copy];

    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB047C0, OS_LOG_TYPE_DEBUG))
    {
      double Current = CFAbsoluteTimeGetCurrent();
      [v10 timestamp];
      double v13 = v12;
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v14 = (void *)qword_26AB047C0;
      if (os_log_type_enabled((os_log_t)qword_26AB047C0, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v21 = v14;
        int v22 = [v3 messageID];
        uint64_t v23 = [v3 idsIdentifier];
        *(_DWORD *)buf = 67109634;
        int v33 = v22;
        __int16 v34 = 2114;
        id v35 = v23;
        __int16 v36 = 2048;
        double v37 = Current - v13;
        _os_log_debug_impl(&dword_21C7C9000, v21, OS_LOG_TYPE_DEBUG, "Incoming request %{companionsync:SYMessageID}hu: %{public}@. Transit time = %.02f seconds", buf, 0x1Cu);
      }
    }
    uint64_t v15 = [v3 idsIdentifier];
    char v16 = [v5 _checkMessageHeader:v10 messageID:v15];

    if (v16)
    {
      [v5 _suspendIncomingMessages];
      uint64_t v17 = [v3 pbRequest];
      if ([v3 expectsResponse]) {
        [v3 configureResponse];
      }
      id v18 = [v5 queue];
      uint64_t v24 = MEMORY[0x263EF8330];
      uint64_t v25 = 3221225472;
      id v26 = __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_74;
      uint64_t v27 = &unk_264423228;
      id v19 = v5;
      id v28 = v19;
      id v29 = v17;
      id v30 = v3;
      id v31 = v6;
      id v20 = v17;
      dispatch_async(v18, &v24);

      objc_msgSend(v19, "_recordLastSeqNo:", v10, v24, v25, v26, v27);
    }
    else
    {
      [v3 setExpectsResponse:0];
    }
  }
}

void __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_74(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) responder];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 48) messageID];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_2_75;
  v5[3] = &unk_264423E88;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 56);
  [v2 handleSyncRequest:v3 ofType:v4 response:v5];
}

void __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_2_75(id *a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  int v6 = [a1[4] expectsResponse];
  if (v15 && v6)
  {
    id v7 = [a1[4] response];
    [v7 setPbResponse:v15];
    [v7 setPersistentUserInfo:v5];
    id v8 = [a1[5] customIDSOptions];
    uint64_t v9 = [a1[5] responder];
    id v10 = [v9 extraTransportOptions];
    unsigned __int16 v11 = IDSOptionsFromSYServiceOptions(v10);

    double v12 = CoalesceOptionDictionaries(v8, v11);
    [v7 setExtraIDSOptions:v12];

    double v13 = +[SYStatisticStore sharedInstance];
    id v14 = [a1[6] name];
    [v13 recordOutgoingMessage:v7 forService:v14];

    [v7 send];
  }
  [a1[5] _resumeIncomingMessages];
}

void __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_3(uint64_t a1, unsigned __int16 a2)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_4;
  v4[3] = &unk_264422F28;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  [v3 addResponseHandler:a2 usingBlock:v4];
  objc_destroyWeak(&v5);
}

void __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    int v6 = [WeakRetained service];
    id v7 = +[SYStatisticStore sharedInstance];
    id v8 = [v6 name];
    [v7 recordIncomingMessage:v3 forService:v8];

    uint64_t v9 = [v5 _getResponseHeader:v3];
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB047C0, OS_LOG_TYPE_DEBUG))
    {
      double Current = CFAbsoluteTimeGetCurrent();
      [v9 timestamp];
      double v12 = v11;
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      double v13 = (void *)qword_26AB047C0;
      if (os_log_type_enabled((os_log_t)qword_26AB047C0, OS_LOG_TYPE_DEBUG))
      {
        id v18 = v13;
        int v19 = [v3 messageID];
        id v20 = [v3 idsIdentifier];
        uint64_t v21 = [v3 requestIDSIdentifier];
        *(_DWORD *)buf = 67109890;
        int v29 = v19;
        __int16 v30 = 2114;
        id v31 = v20;
        __int16 v32 = 2114;
        int v33 = v21;
        __int16 v34 = 2048;
        double v35 = Current - v12;
        _os_log_debug_impl(&dword_21C7C9000, v18, OS_LOG_TYPE_DEBUG, "Incoming response to %{companionsync:SYMessageID}hu: %{public}@, responding to %{public}@. Transit time = %.02f seconds", buf, 0x26u);
      }
    }
    id v14 = [v3 idsIdentifier];
    int v15 = [v5 _checkMessageHeader:v9 messageID:v14];

    if (v15)
    {
      [v5 _suspendIncomingMessages];
      char v16 = [v5 queue];
      uint64_t v22 = MEMORY[0x263EF8330];
      uint64_t v23 = 3221225472;
      uint64_t v24 = __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_80;
      uint64_t v25 = &unk_264422990;
      id v17 = v5;
      id v26 = v17;
      id v27 = v3;
      dispatch_async(v16, &v22);

      objc_msgSend(v17, "_recordLastSeqNo:", v9, v22, v23, v24, v25);
    }
  }
}

void __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_80(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) responder];
  id v3 = [*(id *)(a1 + 40) pbResponse];
  uint64_t v4 = [*(id *)(a1 + 40) messageID];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_2_81;
  v5[3] = &unk_264422968;
  id v6 = *(id *)(a1 + 32);
  [v2 handleSyncResponse:v3 ofType:v4 completion:v5];
}

void __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_2_81(uint64_t a1, char a2, void *a3)
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
  [*(id *)(a1 + 32) _resumeIncomingMessages];
}

void __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_84(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained service];
    int v7 = [v3 pbRequest];
    id v8 = +[SYStatisticStore sharedInstance];
    uint64_t v9 = [v6 name];
    [v8 recordIncomingMessage:v3 forService:v9];

    id v10 = [v7 payload];
    if (!v10)
    {
      double v11 = [v3 data];
      double v12 = [v3 data];
      unint64_t v13 = [v12 length];

      if (v13 >= 0x14) {
        uint64_t v14 = 20;
      }
      else {
        uint64_t v14 = v13;
      }
      int v15 = objc_msgSend(v11, "subdataWithRange:", 0, v14);

      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      char v16 = (void *)qword_26AB04790;
      if (os_log_type_enabled((os_log_t)qword_26AB04790, (os_log_type_t)0x90u)) {
        __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_84_cold_1(v16, v3, (uint64_t)v15);
      }
    }
    [v5 _suspendIncomingMessages];
    id v17 = [v5 queue];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_85;
    v19[3] = &unk_264422990;
    id v20 = v5;
    id v21 = v7;
    id v18 = v7;
    dispatch_async(v17, v19);
  }
}

void __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_85(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) responder];
  id v3 = [*(id *)(a1 + 40) payload];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_2_86;
  v4[3] = &unk_264422968;
  id v5 = *(id *)(a1 + 32);
  [v2 handleOutOfBandData:v3 completion:v4];
}

void __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_2_86(uint64_t a1, char a2, void *a3)
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
      _os_log_impl(&dword_21C7C9000, v6, OS_LOG_TYPE_DEFAULT, "Failure dealing with OOB data: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  [*(id *)(a1 + 32) _resumeIncomingMessages];
}

- (id)_getRequestHeader:(id)a3
{
  id v3 = [a3 pbRequest];
  uint64_t v4 = [v3 header];

  return v4;
}

- (id)_getResponseHeader:(id)a3
{
  id v3 = [a3 pbResponse];
  uint64_t v4 = [v3 header];

  return v4;
}

- (BOOL)_checkMessageHeader:(id)a3 messageID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SYSyncEngine *)self responder];
  char v9 = [v8 willAcceptMessageWithHeader:v7 messageID:v6];

  return v9;
}

- (void)_recordLastSeqNo:(id)a3
{
  id v4 = a3;
  id v5 = [(SYSyncEngine *)self service];
  id v6 = [v5 name];
  id v7 = +[SYPersistentStore sharedPersistentStoreForService:v6];
  uint64_t v8 = [v4 sequenceNumber];
  char v9 = [v4 sender];

  id v10 = [v9 peerID];
  id v14 = 0;
  char v11 = [v7 setLastSequenceNumber:v8 fromPeer:v10 error:&v14];
  id v12 = v14;

  if ((v11 & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    unint64_t v13 = (void *)qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_ERROR)) {
      -[SYMessengerSyncEngine _recordLastSeqNo:](v13);
    }
  }
}

- (void)_handleError:(id)a3 forMessageID:(unsigned __int16)a4
{
  id v12 = a3;
  id v5 = [v12 idsIdentifier];
  id v6 = [v12 domain];
  int v7 = [v6 isEqualToString:@"NMSErrorDomain"];

  if (v7 && [v12 code] == 7)
  {
    id v8 = objc_alloc(MEMORY[0x263F087E8]);
    char v9 = [v12 userInfo];
    uint64_t v10 = [v8 initWithSYError:2019 userInfo:v9];

    id v12 = (id)v10;
  }
  char v11 = [(SYSyncEngine *)self responder];
  [v11 handleSyncError:v12 forMessageWithIdentifier:v5];
}

- (id)_wrapMessage:(id)a3 ofType:(unsigned __int16)a4 userInfo:(id)a5
{
  uint64_t v5 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(SYSyncEngine *)self service];
  char v11 = +[NMSOutgoingRequest requestWithMessageID:v5];
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
  int v15 = v14;
  if (v14)
  {
    [v14 perMessageTimeout];
    objc_msgSend(v11, "setSendTimeout:");
    [v15 perMessageTimeout];
    [v11 setResponseTimeout:v16 + v16];
    if (self->_sessionDeviceID) {
      sessionDeviceID = self->_sessionDeviceID;
    }
    else {
      sessionDeviceID = (NSString *)*MEMORY[0x263F4A148];
    }
    id v18 = [MEMORY[0x263EFFA08] setWithObject:sessionDeviceID];
    [v11 setTargetDeviceIDs:v18];
  }
  else
  {
    activeDevice = self->_activeDevice;
    id v20 = [(NMSMessageCenter *)self->_messageCenter service];
    id v21 = [v20 devices];
    id v18 = [(SYDevice *)activeDevice findMatchingIDSDeviceFromList:v21];

    [v10 defaultMessageTimeout];
    objc_msgSend(v11, "setSendTimeout:");
    [v10 defaultMessageTimeout];
    [v11 setResponseTimeout:v22 + v22];
    uint64_t v23 = (void *)MEMORY[0x263EFFA08];
    uint64_t v24 = [(NMSMessageCenter *)self->_messageCenter deviceIDFromDevice:v18];
    uint64_t v25 = (void *)v24;
    if (v24) {
      uint64_t v26 = v24;
    }
    else {
      uint64_t v26 = *MEMORY[0x263F4A148];
    }
    id v27 = [v23 setWithObject:v26];
    [v11 setTargetDeviceIDs:v27];
  }
  return v11;
}

- (void)messageCenter:(id)a3 didReceiveUnknownRequest:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  int v7 = (void *)qword_26AB04790;
  if (os_log_type_enabled((os_log_t)qword_26AB04790, (os_log_type_t)0x90u)) {
    -[SYMessengerSyncEngine messageCenter:didReceiveUnknownRequest:](v7);
  }
}

- (void)messageCenter:(id)a3 didReceiveIncomingFileTransfer:(id)a4
{
  id v5 = a4;
  id v6 = [v5 fileURL];
  int v7 = [v5 metadata];
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v8 = (void *)qword_26AB047C0;
  if (os_log_type_enabled((os_log_t)qword_26AB047C0, OS_LOG_TYPE_DEBUG)) {
    -[SYMessengerSyncEngine messageCenter:didReceiveIncomingFileTransfer:](v8);
  }
  id v9 = [(SYSyncEngine *)self responder];
  [v9 handleFileTransfer:v6 metadata:v7 completion:&__block_literal_global_10];
}

void __70__SYMessengerSyncEngine_messageCenter_didReceiveIncomingFileTransfer___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_ERROR)) {
      __70__SYMessengerSyncEngine_messageCenter_didReceiveIncomingFileTransfer___block_invoke_cold_1();
    }
  }
}

- (void)messageCenter:(id)a3 didResolveIDSIdentifierForRequest:(id)a4
{
  id v5 = a4;
  id v6 = +[SYStatisticStore sharedInstance];
  int v7 = [v5 idsIdentifier];
  [v6 assignIdentifier:v7 toOutgoingMessage:v5];

  id v8 = [(SYSyncEngine *)self responder];
  id v9 = [v5 idsIdentifier];
  uint64_t v10 = [v5 persistentUserInfo];
  [v8 enqueuedMessageWithID:v9 context:v10];

  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  char v11 = (void *)qword_26AB047C0;
  if (os_log_type_enabled((os_log_t)qword_26AB047C0, OS_LOG_TYPE_DEBUG)) {
    -[SYMessengerSyncEngine messageCenter:didResolveIDSIdentifierForRequest:](v11, v5);
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_lookupLock, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v12 = [(NSMapTable *)self->_callbackLookup objectForKey:v5];
  if (v12)
  {
    [(NSMapTable *)self->_callbackLookup removeObjectForKey:v5];
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_lookupLock);
    uint64_t v13 = [v5 idsIdentifier];
    ((void (**)(void, uint64_t, void *, void))v12)[2](v12, 1, v13, 0);
  }
  else
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_lookupLock);
  }
}

- (void)messageCenter:(id)a3 didResolveIDSIdentifier:(id)a4 forResponse:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [v8 request];
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  uint64_t v10 = (void *)qword_26AB047C0;
  if (os_log_type_enabled((os_log_t)qword_26AB047C0, OS_LOG_TYPE_DEBUG)) {
    -[SYMessengerSyncEngine messageCenter:didResolveIDSIdentifier:forResponse:](v10, v9, (uint64_t)v7);
  }
  char v11 = +[SYStatisticStore sharedInstance];
  [v11 assignIdentifier:v7 toOutgoingMessage:v8];

  uint64_t v12 = [(SYSyncEngine *)self responder];
  uint64_t v13 = [v8 persistentUserInfo];

  [v12 enqueuedMessageWithID:v7 context:v13];
}

- (void)messageCenter:(id)a3 didResolveIDSIdentifier:(id)a4 forFileTransfer:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = +[SYStatisticStore sharedInstance];
  [v8 assignIdentifier:v6 toOutgoingMessage:v7];

  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB047C0, OS_LOG_TYPE_DEBUG)) {
    -[SYMessengerSyncEngine messageCenter:didResolveIDSIdentifier:forFileTransfer:]();
  }
}

- (void)messageCenter:(id)a3 didSuccessfullySendRequestWithIdentifier:(id)a4 userInfo:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB047C0, OS_LOG_TYPE_DEBUG)) {
    -[SYMessengerSyncEngine messageCenter:didSuccessfullySendRequestWithIdentifier:userInfo:]();
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  char v11 = qword_26AB04790;
  if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v9;
    _os_log_impl(&dword_21C7C9000, v11, OS_LOG_TYPE_DEFAULT, "dataIdentifier: %{public}@ didSendWithSuccess: YES error: nil", buf, 0xCu);
  }
  uint64_t v12 = +[SYStatisticStore sharedInstance];
  [v12 confirmDeliveryOfOutgoingMessage:v9];

  uint64_t v13 = [(SYSyncEngine *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__SYMessengerSyncEngine_messageCenter_didSuccessfullySendRequestWithIdentifier_userInfo___block_invoke;
  block[3] = &unk_264422BF8;
  block[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(v13, block);
}

void __89__SYMessengerSyncEngine_messageCenter_didSuccessfullySendRequestWithIdentifier_userInfo___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) responder];
  [v2 sentMessageWithID:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
}

- (void)messageCenter:(id)a3 didSuccessfullyDeliverRequestWithIdentifier:(id)a4 userInfo:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB047C0, OS_LOG_TYPE_DEBUG)) {
    -[SYMessengerSyncEngine messageCenter:didSuccessfullyDeliverRequestWithIdentifier:userInfo:]();
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  char v11 = qword_26AB04790;
  if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v9;
    _os_log_impl(&dword_21C7C9000, v11, OS_LOG_TYPE_DEFAULT, "Remote delivery confirmation for %{public}@", buf, 0xCu);
  }
  uint64_t v12 = +[SYStatisticStore sharedInstance];
  [v12 confirmDeliveryOfOutgoingMessage:v9];

  uint64_t v13 = [(SYSyncEngine *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __92__SYMessengerSyncEngine_messageCenter_didSuccessfullyDeliverRequestWithIdentifier_userInfo___block_invoke;
  block[3] = &unk_264422BF8;
  block[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(v13, block);
}

void __92__SYMessengerSyncEngine_messageCenter_didSuccessfullyDeliverRequestWithIdentifier_userInfo___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) responder];
  [v2 deliveredMessageWithID:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
}

- (void)messageCenter:(id)a3 failedToSendMessageWithIdentifier:(id)a4 error:(id)a5 userInfo:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_ERROR)) {
    -[SYMessengerSyncEngine messageCenter:failedToSendMessageWithIdentifier:error:userInfo:]();
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v14 = (void *)qword_26AB047C0;
  if (os_log_type_enabled((os_log_t)qword_26AB047C0, OS_LOG_TYPE_DEBUG)) {
    -[SYMessengerSyncEngine messageCenter:failedToSendMessageWithIdentifier:error:userInfo:]((uint64_t)v11, v14, v12);
  }
  id v15 = +[SYStatisticStore sharedInstance];
  double v16 = [(SYSyncEngine *)self service];
  id v17 = [v16 name];
  [v15 updateOutgoingMessageWithIdentifier:v11 forService:v17 sentSuccessfully:0 sendError:v12];

  id v18 = [(SYSyncEngine *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__SYMessengerSyncEngine_messageCenter_failedToSendMessageWithIdentifier_error_userInfo___block_invoke;
  block[3] = &unk_264422BF8;
  block[4] = self;
  id v22 = v12;
  id v23 = v11;
  id v19 = v11;
  id v20 = v12;
  dispatch_async(v18, block);
}

void __88__SYMessengerSyncEngine_messageCenter_failedToSendMessageWithIdentifier_error_userInfo___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) responder];
  [v2 handleSyncError:*(void *)(a1 + 40) forMessageWithIdentifier:*(void *)(a1 + 48)];
}

- (void)messageCenter:(id)a3 activeDeviceChanged:(id)a4 acknowledgement:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v11 = qword_26AB04790;
  if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
  {
    activeDevice = self->_activeDevice;
    int v15 = 138412546;
    double v16 = activeDevice;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&dword_21C7C9000, v11, OS_LOG_TYPE_DEFAULT, "Active IDS device changed. Old = %@, new = %@", (uint8_t *)&v15, 0x16u);
  }
  id v13 = +[SYDevice deviceForIDSDevice:v9];
  id v14 = self->_activeDevice;
  self->_activeDevice = v13;

  v10[2](v10);
}

- (void)messageCenter:(id)a3 nearbyDevicesChanged:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SYSyncEngine *)self transportActivity];
  os_activity_scope_enter(v8, &v13);

  id v9 = [(SYDevice *)self->_activeDevice findMatchingIDSDeviceFromList:v7];

  if (![(SYDevice *)self->_activeDevice hasCachedNearby]
    || (((v9 != 0) ^ [(SYDevice *)self->_activeDevice cachedIsNearby]) & 1) != 0)
  {
    [(SYDevice *)self->_activeDevice setCachedIsNearby:v9 != 0];
    [(SYDevice *)self->_activeDevice setHasCachedNearby:1];
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v10 = qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = "left";
      if (v9) {
        id v11 = "entered";
      }
      *(_DWORD *)buf = 136315138;
      int v15 = v11;
      _os_log_impl(&dword_21C7C9000, v10, OS_LOG_TYPE_DEFAULT, "Target device %s proximity", buf, 0xCu);
    }
    id v12 = [(SYSyncEngine *)self responder];
    [v12 currentDeviceProximityChanged:v9 != 0];
  }
  os_activity_scope_leave(&v13);
}

- (void)messageCenter:(id)a3 connectedDevicesChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v8 = [(SYSyncEngine *)self transportActivity];
  os_activity_scope_enter(v8, &state);

  id v9 = [(SYDevice *)self->_activeDevice findMatchingIDSDeviceFromList:v7];

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
      id v10 = qword_26AB04790;
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
      id v10 = qword_26AB04790;
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

- (NSDictionary)customIDSOptions
{
  return self->_customIDSOptions;
}

- (void)setCustomIDSOptions:(id)a3
{
}

- (OS_dispatch_queue)idsQueue
{
  return self->_idsQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsQueue, 0);
  objc_storeStrong((id *)&self->_customIDSOptions, 0);
  objc_storeStrong((id *)&self->_sessionDeviceID, 0);
  objc_storeStrong((id *)&self->_activeDevice, 0);
  objc_storeStrong((id *)&self->_callbackLookup, 0);
  objc_storeStrong((id *)&self->_requestLookup, 0);
  objc_storeStrong((id *)&self->_lookupLock, 0);
  objc_storeStrong((id *)&self->_messageCenter, 0);
}

- (void)enqueueSyncRequest:withMessageID:priority:options:userContext:callback:.cold.2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6(&dword_21C7C9000, v0, v1, "Coalesced IDS options: %@", v2, v3, v4, v5, v6);
}

- (void)enqueueSyncRequest:withMessageID:priority:options:userContext:callback:.cold.3()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6(&dword_21C7C9000, v0, v1, "Input request options: %@", v2, v3, v4, v5, v6);
}

void __81__SYMessengerSyncEngine_outputStreamWithMetadata_priority_options_context_error___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4_0();
  _os_log_error_impl(&dword_21C7C9000, v0, OS_LOG_TYPE_ERROR, "Failed to delete unused file-transfer file: %{public}@", v1, 0xCu);
}

void __81__SYMessengerSyncEngine_outputStreamWithMetadata_priority_options_context_error___block_invoke_cold_2(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_5() streamError];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3(&dword_21C7C9000, v4, v5, "Error writing to URL for file transfer: %{public}@", v6, v7, v8, v9, v10);
}

void __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = *(unsigned __int16 *)(a1 + 40);
  v4[0] = 67109378;
  v4[1] = v3;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_21C7C9000, log, OS_LOG_TYPE_ERROR, "Error sending message with ID %{companionsync:SYMessageID}hu: %{public}@", (uint8_t *)v4, 0x12u);
}

void __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_84_cold_1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  __int16 v5 = a1;
  uint64_t v6 = [a2 data];
  [v6 length];
  OUTLINED_FUNCTION_4_3();
  uint64_t v8 = a3;
  _os_log_error_impl(&dword_21C7C9000, v5, (os_log_type_t)0x90u, "Out of band message with nil payload found! Request data has size %lu. First 20 bytes = %{public}@", v7, 0x16u);
}

- (void)_recordLastSeqNo:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  int v3 = (void *)OUTLINED_FUNCTION_5();
  uint64_t v4 = _SYObfuscate(v3);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3(&dword_21C7C9000, v5, v6, "Failed to store incoming sequence number: %{public}@", v7, v8, v9, v10, v11);
}

- (void)messageCenter:(void *)a1 didReceiveUnknownRequest:.cold.1(void *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a1;
  int v3 = (void *)OUTLINED_FUNCTION_5();
  uint64_t v4 = _SYObfuscate(v3);
  OUTLINED_FUNCTION_4_0();
  _os_log_error_impl(&dword_21C7C9000, v1, (os_log_type_t)0x90u, "Received an unknown message: %{public}@", v5, 0xCu);
}

- (void)messageCenter:(void *)a1 didReceiveIncomingFileTransfer:.cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v2 = a1;
  int v3 = [(id)OUTLINED_FUNCTION_5() idsIdentifier];
  OUTLINED_FUNCTION_4_0();
  _os_log_debug_impl(&dword_21C7C9000, v1, OS_LOG_TYPE_DEBUG, "Incoming file: %{public}@", v4, 0xCu);
}

void __70__SYMessengerSyncEngine_messageCenter_didReceiveIncomingFileTransfer___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4_0();
  _os_log_error_impl(&dword_21C7C9000, v0, OS_LOG_TYPE_ERROR, "Failed to process incoming file transfer: %{public}@", v1, 0xCu);
}

- (void)messageCenter:(void *)a1 didResolveIDSIdentifierForRequest:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a1;
  int v5 = [(id)OUTLINED_FUNCTION_5() messageID];
  uint64_t v6 = [a2 idsIdentifier];
  v7[0] = 67109378;
  v7[1] = v5;
  __int16 v8 = 2114;
  uint64_t v9 = v6;
  _os_log_debug_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_DEBUG, "Sent %{companionsync:SYMessageID}hu: %{public}@", (uint8_t *)v7, 0x12u);
}

- (void)messageCenter:(void *)a1 didResolveIDSIdentifier:(void *)a2 forResponse:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v5 = a1;
  int v6 = [a2 messageID];
  uint64_t v7 = [a2 idsIdentifier];
  v8[0] = 67109634;
  v8[1] = v6;
  __int16 v9 = 2114;
  uint64_t v10 = v7;
  __int16 v11 = 2114;
  uint64_t v12 = a3;
  _os_log_debug_impl(&dword_21C7C9000, v5, OS_LOG_TYPE_DEBUG, "Sent response to %{companionsync:SYMessageID}hu (%{public}@): %{public}@", (uint8_t *)v8, 0x1Cu);
}

- (void)messageCenter:didResolveIDSIdentifier:forFileTransfer:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6(&dword_21C7C9000, v0, v1, "Sent file: %{public}@", v2, v3, v4, v5, v6);
}

- (void)messageCenter:didSuccessfullySendRequestWithIdentifier:userInfo:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6(&dword_21C7C9000, v0, v1, "Device-level ACK for %{public}@", v2, v3, v4, v5, v6);
}

- (void)messageCenter:didSuccessfullyDeliverRequestWithIdentifier:userInfo:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6(&dword_21C7C9000, v0, v1, "App-level ACK for %{public}@", v2, v3, v4, v5, v6);
}

- (void)messageCenter:(void *)a3 failedToSendMessageWithIdentifier:error:userInfo:.cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = a2;
  uint8_t v6 = _SYObfuscate(a3);
  int v7 = 138543618;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_debug_impl(&dword_21C7C9000, v5, OS_LOG_TYPE_DEBUG, "Send failure: %{public}@, error=%{public}@", (uint8_t *)&v7, 0x16u);
}

- (void)messageCenter:failedToSendMessageWithIdentifier:error:userInfo:.cold.2()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4_3();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_21C7C9000, v1, OS_LOG_TYPE_ERROR, "Message send failure for %{public}@: %{public}@", v2, 0x16u);
}

@end