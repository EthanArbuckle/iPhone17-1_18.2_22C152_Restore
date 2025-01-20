@interface GEOPairedDeviceConnection
+ (GEOPairedDeviceConnection)sharedInstance;
- (BOOL)isConnected;
- (BOOL)isNearbyAndUsable;
- (BOOL)shouldSendMessage;
- (GEOPairedDeviceConnection)init;
- (GEOPairedDeviceConnectionDelegate)delegate;
- (OS_dispatch_queue)delegateQueue;
- (id)_idsOptionsForMessage:(id)a3 withOptions:(id)a4;
- (id)_nearbyConnectedDevice;
- (int64_t)_priorityForMessage:(id)a3;
- (void)_sendMessage:(id)a3 options:(id)a4 withReply:(id)a5;
- (void)_sendReply:(id)a3 forMessage:(id)a4 forMessageIdentifier:(id)a5 messageReceivedTimestamp:(double)a6;
- (void)_updateReceiverProcessUUID:(id)a3;
- (void)sendCheckinWithSubscriptionStateSummary:(id)a3;
- (void)sendConfigureSubscriptionShouldSync:(id)a3 withReply:(id)a4;
- (void)sendGetStorageInfo:(id)a3 withReply:(id)a4;
- (void)sendMessage:(id)a3;
- (void)sendMessage:(id)a3 options:(id)a4 withReply:(id)a5;
- (void)sendPing:(id)a3 withReply:(id)a4;
- (void)sendSetObservedSubscriptionIdentifiers:(id)a3;
- (void)sendSetSubscriptionStateSummary:(id)a3;
- (void)sendStartStopSubscriptionDownload:(id)a3;
- (void)sendUpdateSubscriptionState:(id)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)start;
- (void)updateConnectionStatus;
@end

@implementation GEOPairedDeviceConnection

- (BOOL)isConnected
{
  v2 = self;
  v4 = self->_isolation;
  _geo_isolate_lock_data();
  LOBYTE(v2) = v2->_connected;
  _geo_isolate_unlock();

  return (char)v2;
}

- (BOOL)isNearbyAndUsable
{
  v2 = self;
  v4 = self->_isolation;
  _geo_isolate_lock_data();
  LOBYTE(v2) = v2->_nearby;
  _geo_isolate_unlock();

  return (char)v2;
}

+ (GEOPairedDeviceConnection)sharedInstance
{
  if (qword_1EB2A0040 != -1) {
    dispatch_once(&qword_1EB2A0040, &__block_literal_global_142);
  }
  v2 = (void *)_MergedGlobals_283;

  return (GEOPairedDeviceConnection *)v2;
}

void __43__GEOPairedDeviceConnection_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(GEOPairedDeviceConnection);
  v1 = (void *)_MergedGlobals_283;
  _MergedGlobals_283 = (uint64_t)v0;
}

- (GEOPairedDeviceConnection)init
{
  if (IDSLibraryCore()
    && (v22.receiver = self,
        v22.super_class = (Class)GEOPairedDeviceConnection,
        (self = [(GEOPairedDeviceConnection *)&v22 init]) != 0))
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_initially_inactive(v3);
    v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.GeoServices.PairedDeviceConnection", v4);
    queue = self->_queue;
    self->_queue = v5;

    v7 = (geo_isolater *)geo_isolater_create();
    isolation = self->_isolation;
    self->_isolation = v7;

    if (PairedDeviceRegistryLibraryCore())
    {
      int v9 = [getPDRRegistryClass() supportsPairedDevice];
      self->_supported = v9;
      if (v9)
      {
        v10 = (IDSService *)[objc_alloc((Class)getIDSServiceClass()) initWithService:@"com.apple.private.alloy.geoservices"];
        idsService = self->_idsService;
        self->_idsService = v10;

        [(IDSService *)self->_idsService addDelegate:self queue:self->_queue];
      }
    }
    else
    {
      self->_supported = 0;
    }
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    replyCallbackBlocks = self->_replyCallbackBlocks;
    self->_replyCallbackBlocks = v13;

    v15 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    replyCallbackBlocksLock = self->_replyCallbackBlocksLock;
    self->_replyCallbackBlocksLock = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    replyExpectingMessageMetadata = self->_replyExpectingMessageMetadata;
    self->_replyExpectingMessageMetadata = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    inFlightMessageMetadata = self->_inFlightMessageMetadata;
    self->_inFlightMessageMetadata = v19;

    [(GEOPairedDeviceConnection *)self updateConnectionStatus];
    self = self;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)start
{
}

- (void)_updateReceiverProcessUUID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && ![(NSString *)self->_receiverProcessUUID isEqualToString:v4])
  {
    v5 = GEOGetDeviceConnectionLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      receiverProcessUUID = self->_receiverProcessUUID;
      *(_DWORD *)buf = 138478083;
      v14 = receiverProcessUUID;
      __int16 v15 = 2113;
      id v16 = v4;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_INFO, "Receiver process UUID changed (%{private}@ -> %{private}@). Requesting clients re-sync state if necessary.", buf, 0x16u);
    }

    v7 = (NSString *)[v4 copy];
    v8 = self->_receiverProcessUUID;
    self->_receiverProcessUUID = v7;

    int v9 = [(GEOPairedDeviceConnection *)self delegate];

    if (v9)
    {
      v10 = [(GEOPairedDeviceConnection *)self delegateQueue];

      if (v10)
      {
        v11 = [(GEOPairedDeviceConnection *)self delegateQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __56__GEOPairedDeviceConnection__updateReceiverProcessUUID___block_invoke;
        block[3] = &unk_1E53D79D8;
        block[4] = self;
        dispatch_async(v11, block);
      }
    }
  }
}

void __56__GEOPairedDeviceConnection__updateReceiverProcessUUID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 pairedDeviceConnectionNeedsStateSynchronization:*(void *)(a1 + 32)];
}

- (id)_nearbyConnectedDevice
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(IDSService *)self->_idsService devices];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if [v6 isDefaultPairedDevice] && (objc_msgSend(v6, "isConnected"))
        {
          id v3 = v6;
          goto LABEL_12;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v3;
}

- (BOOL)shouldSendMessage
{
  self->_canSendMessages = 1;
  return 1;
}

- (id)_idsOptionsForMessage:(id)a3 withOptions:(id)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = getIDSSendMessageOptionEnforceRemoteTimeoutsKey();
  v14[0] = v6;
  uint64_t v7 = MEMORY[0x1E4F1CC38];
  v15[0] = MEMORY[0x1E4F1CC38];
  long long v8 = getIDSSendMessageOptionBypassDuetKey();
  v14[1] = v8;
  v15[1] = v7;
  long long v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  long long v10 = (void *)[v9 mutableCopy];

  int64_t v11 = [(GEOPairedDeviceConnection *)self _priorityForMessage:v5];
  if (v11 == 100)
  {
    v12 = getIDSSendMessageOptionBypassDuetKey();
    [v10 removeObjectForKey:v12];
  }

  return v10;
}

- (int64_t)_priorityForMessage:(id)a3
{
  int v3 = [a3 type];
  int64_t result = 300;
  if (v3 <= 100)
  {
    if (v3 == 1) {
      return result;
    }
    return 200;
  }
  if ((v3 - 102) < 4 || v3 != 101) {
    return 200;
  }
  return result;
}

- (void)sendMessage:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__GEOPairedDeviceConnection_sendMessage___block_invoke;
  v7[3] = &unk_1E53D8998;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __41__GEOPairedDeviceConnection_sendMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendMessage:*(void *)(a1 + 40) options:0 withReply:0];
}

- (void)sendMessage:(id)a3 options:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__GEOPairedDeviceConnection_sendMessage_options_withReply___block_invoke;
  void v15[3] = &unk_1E53D94C8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

uint64_t __59__GEOPairedDeviceConnection_sendMessage_options_withReply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendMessage:*(void *)(a1 + 40) options:*(void *)(a1 + 48) withReply:*(void *)(a1 + 56)];
}

- (void)_sendMessage:(id)a3 options:(id)a4 withReply:(id)a5
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!+[GEOPlatform isRunningInGeod])
  {
    id v14 = GEOGetDeviceConnectionLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_FAULT, "Attempt to send message from invalid process", buf, 2u);
    }

    if (v10)
    {
      __int16 v15 = (void *)MEMORY[0x1E4F28C58];
      id v12 = GEOErrorDomain();
      id v16 = [v15 errorWithDomain:v12 code:-13 userInfo:0];
      v10[2](v10, 0, v16);

LABEL_84:
      goto LABEL_85;
    }
    goto LABEL_85;
  }
  if (!self->_supported)
  {
    id v17 = GEOGetDeviceConnectionLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_ERROR, "Not sending message because device does not supported paired device communication", buf, 2u);
    }

    if (!v10) {
      goto LABEL_85;
    }
    id v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = 7;
LABEL_24:
    id v12 = [v18 errorWithDomain:@"GEOPairedDeviceConnectionErrorDomain" code:v19 userInfo:0];
    v10[2](v10, 0, v12);
    goto LABEL_84;
  }
  if (!self->_connected)
  {
    v20 = GEOGetDeviceConnectionLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_ERROR, "Not sending message because device is not connected", buf, 2u);
    }

    if (!v10) {
      goto LABEL_85;
    }
    id v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = 3;
    goto LABEL_24;
  }
  if ([(GEOPairedDeviceConnection *)self shouldSendMessage])
  {
    int64_t v11 = [(GEOPairedDeviceConnection *)self _idsOptionsForMessage:v8 withOptions:v9];
    id v12 = v11;
    if (v10)
    {
      if (v11)
      {
        uint64_t v13 = [v11 mutableCopy];
      }
      else
      {
        uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
      }
      v23 = (void *)v13;
      v24 = getIDSSendMessageOptionExpectsPeerResponseKey();
      [v23 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v24];

      id v12 = v23;
    }
    v25 = objc_alloc_init(GEOPairedDeviceMessageMetadata);
    [(__CFString *)v8 setMetadata:v25];

    v26 = _processUUID();
    v27 = [(__CFString *)v8 metadata];
    [v27 setSenderUUID:v26];

    double Current = CFAbsoluteTimeGetCurrent();
    v29 = [(__CFString *)v8 metadata];
    [v29 setSentTimestamp:Current];

    v69 = [(__CFString *)v8 data];
    unint64_t v30 = [v69 length];
    int64_t v31 = [(GEOPairedDeviceConnection *)self _priorityForMessage:v8];
    uint64_t v32 = v31;
    id v68 = v9;
    if (v31 == 300 && v30 > 0x100000)
    {
      v33 = GEOGetDeviceConnectionLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        v78 = (__CFString *)v30;
        __int16 v79 = 2048;
        uint64_t v80 = 0x100000;
        _os_log_impl(&dword_188D96000, v33, OS_LOG_TYPE_INFO, "Degrading message from Urgent to Default priority due to size (%luB / %luB)", buf, 0x16u);
      }

      uint64_t v32 = 200;
      uint64_t v34 = 200;
    }
    else
    {
      if (v31 == 300) {
        unsigned int v35 = 300;
      }
      else {
        unsigned int v35 = 200;
      }
      if (v31 == 100) {
        uint64_t v34 = 100;
      }
      else {
        uint64_t v34 = v35;
      }
    }
    v36 = [(__CFString *)v8 metadata];
    [v36 setPriority:v34];

    if (v30 > 0x500000)
    {
      v37 = GEOGetDeviceConnectionLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        v78 = (__CFString *)v30;
        __int16 v79 = 2048;
        uint64_t v80 = 5242880;
        _os_log_impl(&dword_188D96000, v37, OS_LOG_TYPE_ERROR, "Message exceeds maximum permitted and will likely fail (%luB / %luB)", buf, 0x16u);
      }
    }
    idsService = self->_idsService;
    v39 = [(IDSService *)idsService accounts];
    v40 = [v39 anyObject];
    v41 = (void *)MEMORY[0x1E4F1CAD0];
    v42 = getIDSDefaultPairedDevice();
    v43 = [v41 setWithObject:v42];
    id v75 = 0;
    id v76 = 0;
    LODWORD(idsService) = [(IDSService *)idsService sendData:v69 fromAccount:v40 toDestinations:v43 priority:v32 options:v12 identifier:&v76 error:&v75];
    id v44 = v76;
    id v67 = v75;

    if (idsService)
    {
      v45 = objc_alloc_init(_GEOPairedDeviceSentMessageMetadata);
      v46 = GEOGetDeviceConnectionLog();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        uint64_t v47 = [(__CFString *)v8 type];
        if ((int)v47 <= 99)
        {
          if (v47)
          {
            if (v47 == 1)
            {
              v48 = @"PING";
            }
            else if (v47 == 2)
            {
              v48 = @"GET_STORAGE_INFO";
            }
            else
            {
LABEL_64:
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v47);
              v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
          }
          else
          {
            v48 = @"INVALID";
          }
        }
        else
        {
          switch((int)v47)
          {
            case 'd':
              v48 = @"CONFIGURE_SUBSCRIPTION_SHOULD_SYNC";
              break;
            case 'e':
              v48 = @"START_STOP_SUBSCRIPTION_DOWNLOAD";
              break;
            case 'f':
              v48 = @"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY";
              break;
            case 'g':
              v48 = @"SET_SUBSCRIPTION_STATE_SUMMARY";
              break;
            case 'h':
              v48 = @"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS";
              break;
            case 'i':
              v48 = @"UPDATE_SUBSCRIPTION_STATE";
              break;
            default:
              goto LABEL_64;
          }
        }
        id v53 = v44;
        v54 = v48;
        uint64_t v55 = [v69 length];
        if (v12)
        {
          v56 = [NSString stringWithFormat:@", options: %@", v12];
        }
        else
        {
          v56 = &stru_1ED51F370;
        }
        *(_DWORD *)buf = 138478595;
        v78 = v54;
        __int16 v79 = 2048;
        uint64_t v80 = v55;
        __int16 v81 = 2113;
        v82 = v56;
        __int16 v83 = 2113;
        id v84 = v53;
        _os_log_impl(&dword_188D96000, v46, OS_LOG_TYPE_INFO, "Sending message: %{private}@ (size = %lu%{private}@, GUID = %{private}@)", buf, 0x2Au);
        if (v12) {

        }
        id v44 = v53;
      }

      v57 = GEOGetDeviceConnectionLog();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138477827;
        v78 = v8;
        _os_log_impl(&dword_188D96000, v57, OS_LOG_TYPE_DEBUG, "Message contents to be sent: %{private}@", buf, 0xCu);
      }

      [(_GEOPairedDeviceSentMessageMetadata *)v45 setType:[(__CFString *)v8 type]];
      v58 = [(__CFString *)v8 metadata];
      [v58 sentTimestamp];
      -[_GEOPairedDeviceSentMessageMetadata setTimestamp:](v45, "setTimestamp:");

      -[_GEOPairedDeviceSentMessageMetadata setPayloadSize:](v45, "setPayloadSize:", [v69 length]);
      [(_GEOPairedDeviceSentMessageMetadata *)v45 setReply:0];
      if (v44)
      {
        if (v10)
        {
          [(NSLock *)self->_replyCallbackBlocksLock lock];
          replyCallbackBlocks = self->_replyCallbackBlocks;
          v60 = (void *)[v10 copy];
          v61 = v44;
          v62 = (void *)MEMORY[0x18C120660]();
          [(NSMutableDictionary *)replyCallbackBlocks setObject:v62 forKey:v61];

          id v44 = v61;
          v63 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
          if (v63)
          {
            dispatch_time_t v64 = dispatch_time(0, 120000000000);
            dispatch_source_set_timer(v63, v64, 0xFFFFFFFFFFFFFFFFLL, 0);
            handler[0] = MEMORY[0x1E4F143A8];
            handler[1] = 3221225472;
            handler[2] = __60__GEOPairedDeviceConnection__sendMessage_options_withReply___block_invoke;
            handler[3] = &unk_1E53D8AF8;
            v71 = v8;
            id v72 = v61;
            v73 = self;
            v65 = v45;
            v74 = v65;
            dispatch_source_set_event_handler(v63, handler);
            [(_GEOPairedDeviceSentMessageMetadata *)v65 setTimeoutTimer:v63];
            dispatch_resume(v63);
          }
          [(NSMutableDictionary *)self->_replyExpectingMessageMetadata setObject:v45 forKey:v61];
          [(NSLock *)self->_replyCallbackBlocksLock unlock];
        }
        [(NSMutableDictionary *)self->_inFlightMessageMetadata setObject:v45 forKey:v44];
      }
      else
      {
        v66 = GEOGetDeviceConnectionLog();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_188D96000, v66, OS_LOG_TYPE_ERROR, "ERROR: Did not receive an identifier for sent message", buf, 2u);
        }
      }
      v50 = v67;
      id v9 = v68;
    }
    else
    {
      v49 = GEOGetDeviceConnectionLog();
      v50 = v67;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        v51 = [(__CFString *)v8 typeAsString:[(__CFString *)v8 type]];
        *(_DWORD *)buf = 138478083;
        v78 = v51;
        __int16 v79 = 2113;
        uint64_t v80 = (uint64_t)v67;
        _os_log_impl(&dword_188D96000, v49, OS_LOG_TYPE_ERROR, "Error sending message: messageType=%{private}@ -- %{private}@", buf, 0x16u);
      }
      v52 = GEOGetDeviceConnectionLog();
      id v9 = v68;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138477827;
        v78 = v8;
        _os_log_impl(&dword_188D96000, v52, OS_LOG_TYPE_DEBUG, "Message contents which failed: %{private}@", buf, 0xCu);
      }

      if (v10) {
        v10[2](v10, 0, v67);
      }
    }

    goto LABEL_84;
  }
  v21 = GEOGetDeviceConnectionLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    objc_super v22 = [(__CFString *)v8 typeAsString:[(__CFString *)v8 type]];
    *(_DWORD *)buf = 138477827;
    v78 = v22;
    _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_INFO, "Not sending message because connection was short circuited: %{private}@", buf, 0xCu);
  }
  if (v10)
  {
    id v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = 4;
    goto LABEL_24;
  }
LABEL_85:
}

void __60__GEOPairedDeviceConnection__sendMessage_options_withReply___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = GEOGetDeviceConnectionLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v3 = objc_msgSend(*(id *)(a1 + 32), "typeAsString:", objc_msgSend(*(id *)(a1 + 32), "type"));
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v3;
    __int16 v14 = 2114;
    uint64_t v15 = v4;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_ERROR, "ERROR: Timed out waiting for reply to message: messageType=%{public}@. GUID = %{public}@", buf, 0x16u);
  }
  [*(id *)(*(void *)(a1 + 48) + 56) lock];
  id v5 = [*(id *)(*(void *)(a1 + 48) + 48) objectForKey:*(void *)(a1 + 40)];
  id v6 = (void (**)(void, void, void))[v5 copy];

  [*(id *)(*(void *)(a1 + 48) + 48) removeObjectForKey:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 48) + 64) removeObjectForKey:*(void *)(a1 + 40)];
  [*(id *)(a1 + 56) setTimeoutTimer:0];
  [*(id *)(*(void *)(a1 + 48) + 56) unlock];
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F1D140];
    int64_t v11 = @"Timed out.";
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    id v9 = [v7 errorWithDomain:@"GEOPairedDeviceConnectionErrorDomain" code:2 userInfo:v8];
    ((void (**)(void, void, void *))v6)[2](v6, 0, v9);
  }
}

- (void)_sendReply:(id)a3 forMessage:(id)a4 forMessageIdentifier:(id)a5 messageReceivedTimestamp:(double)a6
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v10)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_51;
    }
    *(_WORD *)buf = 0;
    v52 = MEMORY[0x1E4F14500];
    id v53 = "Assertion failed: reply != ((void *)0)";
LABEL_56:
    _os_log_fault_impl(&dword_188D96000, v52, OS_LOG_TYPE_FAULT, v53, buf, 2u);
    goto LABEL_51;
  }
  if (!v12)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_51;
    }
    *(_WORD *)buf = 0;
    v52 = MEMORY[0x1E4F14500];
    id v53 = "Assertion failed: originalMessageIdentifier != ((void *)0)";
    goto LABEL_56;
  }
  if (self->_connected)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (([(__CFString *)v10 hasMetadata] & 1) == 0)
    {
      __int16 v14 = objc_alloc_init(GEOPairedDeviceReplyMetadata);
      [(__CFString *)v10 setMetadata:v14];
    }
    uint64_t v15 = _processUUID();
    uint64_t v16 = [(__CFString *)v10 metadata];
    [v16 setSenderUUID:v15];

    id v17 = [(__CFString *)v10 metadata];
    [v17 setResponseTime:Current - a6];

    id v18 = [(__CFString *)v10 metadata];
    [v18 setRequestReceivedTimestamp:a6];

    uint64_t v19 = [(__CFString *)v10 metadata];
    [v19 setSentTimestamp:Current];

    v20 = [(__CFString *)v10 data];
    v21 = (void *)MEMORY[0x1E4F1CA60];
    objc_super v22 = getIDSSendMessageOptionPeerResponseIdentifierKey();
    id v57 = v12;
    v23 = [v21 dictionaryWithObject:v12 forKey:v22];

    uint64_t v24 = [(GEOPairedDeviceConnection *)self _idsOptionsForMessage:v11 withOptions:0];
    if (v24) {
      [v23 addEntriesFromDictionary:v24];
    }
    uint64_t v55 = (void *)v24;
    v58 = v11;
    int64_t v25 = [(GEOPairedDeviceConnection *)self _priorityForMessage:v11];
    idsService = self->_idsService;
    v27 = [(IDSService *)idsService accounts];
    v28 = [v27 anyObject];
    v29 = v23;
    unint64_t v30 = (void *)MEMORY[0x1E4F1CAD0];
    int64_t v31 = getIDSDefaultPairedDevice();
    uint64_t v32 = [v30 setWithObject:v31];
    id v59 = 0;
    id v60 = 0;
    v56 = v29;
    LODWORD(idsService) = [(IDSService *)idsService sendData:v20 fromAccount:v28 toDestinations:v32 priority:v25 options:v29 identifier:&v60 error:&v59];
    id v33 = v60;
    id v54 = v59;

    uint64_t v34 = GEOGetDeviceConnectionLog();
    unsigned int v35 = (_GEOPairedDeviceSentMessageMetadata *)v34;
    if (idsService)
    {
      v36 = v20;
      v37 = v33;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        uint64_t v38 = [v58 type];
        if ((int)v38 <= 99)
        {
          if (v38)
          {
            if (v38 == 1)
            {
              v39 = @"PING";
            }
            else if (v38 == 2)
            {
              v39 = @"GET_STORAGE_INFO";
            }
            else
            {
LABEL_41:
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v38);
              v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
          }
          else
          {
            v39 = @"INVALID";
          }
        }
        else
        {
          switch((int)v38)
          {
            case 'd':
              v39 = @"CONFIGURE_SUBSCRIPTION_SHOULD_SYNC";
              break;
            case 'e':
              v39 = @"START_STOP_SUBSCRIPTION_DOWNLOAD";
              break;
            case 'f':
              v39 = @"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY";
              break;
            case 'g':
              v39 = @"SET_SUBSCRIPTION_STATE_SUMMARY";
              break;
            case 'h':
              v39 = @"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS";
              break;
            case 'i':
              v39 = @"UPDATE_SUBSCRIPTION_STATE";
              break;
            default:
              goto LABEL_41;
          }
        }
        v46 = v39;
        uint64_t v47 = [v20 length];
        v48 = [(__CFString *)v10 metadata];
        [v48 responseTime];
        uint64_t v50 = v49;

        *(_DWORD *)buf = 138478595;
        v62 = v39;
        __int16 v63 = 2048;
        uint64_t v64 = v47;
        __int16 v65 = 2048;
        uint64_t v66 = v50;
        __int16 v67 = 2113;
        v37 = v33;
        id v68 = v33;
        _os_log_impl(&dword_188D96000, &v35->super, OS_LOG_TYPE_INFO, "Sending reply for original message: %{private}@ (size = %lu, response time = %f, GUID = %{private}@)", buf, 0x2Au);
      }
      v51 = GEOGetDeviceConnectionLog();
      v43 = v55;
      v42 = v56;
      id v11 = v58;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138478083;
        v62 = v10;
        __int16 v63 = 2113;
        uint64_t v64 = (uint64_t)v58;
        _os_log_impl(&dword_188D96000, v51, OS_LOG_TYPE_DEBUG, "Reply contents to be sent: %{private}@\n Original message contents: %{private}@", buf, 0x16u);
      }

      unsigned int v35 = objc_alloc_init(_GEOPairedDeviceSentMessageMetadata);
      -[_GEOPairedDeviceSentMessageMetadata setType:](v35, "setType:", [v58 type]);
      [(_GEOPairedDeviceSentMessageMetadata *)v35 setTimestamp:Current];
      -[_GEOPairedDeviceSentMessageMetadata setPayloadSize:](v35, "setPayloadSize:", [v36 length]);
      [(_GEOPairedDeviceSentMessageMetadata *)v35 setReply:1];
      [(NSMutableDictionary *)self->_inFlightMessageMetadata setObject:v35 forKey:v37];
      id v12 = v57;
      id v44 = v54;
    }
    else if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      id v11 = v58;
      uint64_t v41 = [v58 type];
      v36 = v20;
      v42 = v56;
      id v12 = v57;
      v43 = v55;
      v37 = v33;
      if ((int)v41 <= 99)
      {
        id v44 = v54;
        if (v41)
        {
          if (v41 == 1)
          {
            v45 = @"PING";
          }
          else if (v41 == 2)
          {
            v45 = @"GET_STORAGE_INFO";
          }
          else
          {
LABEL_48:
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v41);
            v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v45 = @"INVALID";
        }
      }
      else
      {
        id v44 = v54;
        switch((int)v41)
        {
          case 'd':
            v45 = @"CONFIGURE_SUBSCRIPTION_SHOULD_SYNC";
            break;
          case 'e':
            v45 = @"START_STOP_SUBSCRIPTION_DOWNLOAD";
            break;
          case 'f':
            v45 = @"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY";
            break;
          case 'g':
            v45 = @"SET_SUBSCRIPTION_STATE_SUMMARY";
            break;
          case 'h':
            v45 = @"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS";
            break;
          case 'i':
            v45 = @"UPDATE_SUBSCRIPTION_STATE";
            break;
          default:
            goto LABEL_48;
        }
      }
      *(_DWORD *)buf = 138543618;
      v62 = v45;
      __int16 v63 = 2114;
      uint64_t v64 = (uint64_t)v44;
      _os_log_impl(&dword_188D96000, &v35->super, OS_LOG_TYPE_ERROR, "Error sending reply to message: messageType=%{public}@ -- %{public}@", buf, 0x16u);
    }
    else
    {
      v36 = v20;
      v42 = v56;
      id v12 = v57;
      id v11 = v58;
      v37 = v33;
      id v44 = v54;
      v43 = v55;
    }
  }
  else
  {
    v40 = GEOGetDeviceConnectionLog();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v40, OS_LOG_TYPE_INFO, "Not sending reply because device is not connected", buf, 2u);
    }
  }
LABEL_51:
}

- (void)updateConnectionStatus
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if (self->_supported)
  {
    int v3 = GEOGetDeviceConnectionLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = [(IDSService *)self->_idsService devices];
      *(_DWORD *)buf = 138477827;
      uint64_t v57 = (uint64_t)v4;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "Updating connection status with devices: %{private}@", buf, 0xCu);
    }
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v5 = [(IDSService *)self->_idsService devices];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v49 objects:v55 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v50;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v50 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          if ([v9 isDefaultPairedDevice] && objc_msgSend(v9, "isConnected"))
          {
            LODWORD(v6) = [v9 isNearby];
            int v10 = 1;
            goto LABEL_15;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v49 objects:v55 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    int v10 = 0;
LABEL_15:

    int connected = self->_connected;
    BOOL v12 = self->_nearby == v6 && connected == v10;
    int v13 = !v12;
    if (!v12)
    {
      void block[5] = MEMORY[0x1E4F143A8];
      block[6] = 3221225472;
      block[7] = __51__GEOPairedDeviceConnection_updateConnectionStatus__block_invoke;
      block[8] = &unk_1E53E9A00;
      block[9] = self;
      char v47 = v6;
      char v48 = v10;
      geo_isolate_sync_data();
    }
    if (connected != v10)
    {
      if (self->_connected)
      {
        __int16 v14 = [(GEOPairedDeviceConnection *)self delegateQueue];
        uint64_t v15 = v14;
        if (v14)
        {
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __51__GEOPairedDeviceConnection_updateConnectionStatus__block_invoke_2;
          block[3] = &unk_1E53D79D8;
          block[4] = self;
          dispatch_async(v14, block);
        }

LABEL_50:
        delegateQueue = self->_delegateQueue;
        if (delegateQueue)
        {
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __51__GEOPairedDeviceConnection_updateConnectionStatus__block_invoke_31;
          v37[3] = &unk_1E53D79D8;
          v37[4] = self;
          dispatch_async(delegateQueue, v37);
        }
        return;
      }
      uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"GEOPairedDeviceConnectionErrorDomain" code:1 userInfo:0];
      [(NSLock *)self->_replyCallbackBlocksLock lock];
      id v17 = [(NSMutableDictionary *)self->_replyCallbackBlocks allValues];
      id v18 = (void *)[v17 copy];

      uint64_t v19 = [(NSMutableDictionary *)self->_replyExpectingMessageMetadata allValues];
      v20 = (void *)[v19 copy];

      [(NSMutableDictionary *)self->_replyCallbackBlocks removeAllObjects];
      [(NSMutableDictionary *)self->_replyExpectingMessageMetadata removeAllObjects];
      [(NSLock *)self->_replyCallbackBlocksLock unlock];
      if ([v18 count])
      {
        v21 = GEOGetDeviceConnectionLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          uint64_t v22 = [v18 count];
          *(_DWORD *)buf = 134217984;
          uint64_t v57 = v22;
          _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_ERROR, "Canceling %lu requests due to lost connection to paired device", buf, 0xCu);
        }
      }
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v23 = v20;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v42 objects:v54 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v43;
        do
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v43 != v26) {
              objc_enumerationMutation(v23);
            }
            v28 = *(void **)(*((void *)&v42 + 1) + 8 * j);
            v29 = [v28 timeoutTimer];

            if (v29)
            {
              unint64_t v30 = [v28 timeoutTimer];
              dispatch_source_cancel(v30);

              [v28 setTimeoutTimer:0];
            }
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v42 objects:v54 count:16];
        }
        while (v25);
      }

      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v31 = v18;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v38 objects:v53 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v39;
        do
        {
          for (uint64_t k = 0; k != v33; ++k)
          {
            if (*(void *)v39 != v34) {
              objc_enumerationMutation(v31);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v38 + 1) + 8 * k) + 16))();
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v38 objects:v53 count:16];
        }
        while (v33);
      }
    }
    if (!v13) {
      return;
    }
    goto LABEL_50;
  }
}

uint64_t __51__GEOPairedDeviceConnection_updateConnectionStatus__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 81) = *(unsigned char *)(result + 40);
  *(unsigned char *)(*(void *)(result + 32) + 80) = *(unsigned char *)(result + 41);
  return result;
}

void __51__GEOPairedDeviceConnection_updateConnectionStatus__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  [WeakRetained pairedDeviceConnectionNeedsStateSynchronization:*(void *)(a1 + 32)];
}

void __51__GEOPairedDeviceConnection_updateConnectionStatus__block_invoke_31(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"GEOPairedDeviceConnectionConnectivityDidChange" object:*(void *)(a1 + 32)];
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a7;
  double Current = CFAbsoluteTimeGetCurrent();
  BOOL v12 = [v10 incomingResponseIdentifier];
  int v13 = [v10 incomingResponseIdentifier];

  if (v13)
  {
    [(NSLock *)self->_replyCallbackBlocksLock lock];
    replyCallbackBlocks = self->_replyCallbackBlocks;
    uint64_t v15 = [v10 incomingResponseIdentifier];
    uint64_t v16 = [(NSMutableDictionary *)replyCallbackBlocks objectForKey:v15];
    BOOL v17 = v16 != 0;

    [(NSLock *)self->_replyCallbackBlocksLock unlock];
  }
  else
  {
    BOOL v17 = 0;
  }
  id v18 = GEOGetDeviceConnectionLog();
  uint64_t v19 = (GEOPairedDeviceMessage *)v18;
  if (v9)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      id v84 = v12;
      _os_log_impl(&dword_188D96000, &v19->super.super, OS_LOG_TYPE_DEBUG, "Received data with incomingResponseIdentifier: %{private}@", buf, 0xCu);
    }

    if (v17)
    {
      v20 = GEOGetDeviceConnectionLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_DEBUG, "incomingResponseIdentifier matches message awaiting reply", buf, 2u);
      }

      v21 = [[GEOPairedDeviceReplyEnvelope alloc] initWithData:v9];
      uint64_t v19 = (GEOPairedDeviceMessage *)v21;
      if (v21)
      {
        uint64_t v22 = [(GEOPairedDeviceReplyEnvelope *)v21 metadata];
        id v23 = [v22 senderUUID];
        [(GEOPairedDeviceConnection *)self _updateReceiverProcessUUID:v23];

        [(NSLock *)self->_replyCallbackBlocksLock lock];
        uint64_t v24 = [(NSMutableDictionary *)self->_replyExpectingMessageMetadata objectForKey:v12];
        [(NSMutableDictionary *)self->_replyExpectingMessageMetadata removeObjectForKey:v12];
        [(NSLock *)self->_replyCallbackBlocksLock unlock];
        uint64_t v25 = [v24 timeoutTimer];

        if (v25)
        {
          uint64_t v26 = [v24 timeoutTimer];
          dispatch_source_cancel(v26);

          [v24 setTimeoutTimer:0];
        }
        [v24 timestamp];
        double v28 = v27;
        v29 = GEOGetDeviceConnectionLog();
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
LABEL_54:

          long long v44 = GEOGetDeviceConnectionLog();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138477827;
            id v84 = v19;
            _os_log_impl(&dword_188D96000, v44, OS_LOG_TYPE_DEBUG, "Received reply contents: %{private}@", buf, 0xCu);
          }

          [(NSLock *)self->_replyCallbackBlocksLock lock];
          long long v45 = [(NSMutableDictionary *)self->_replyCallbackBlocks objectForKey:v12];
          uint64_t v46 = [v45 copy];

          if (!v46)
          {
            [(NSLock *)self->_replyCallbackBlocksLock unlock];
LABEL_101:

            goto LABEL_102;
          }
          [(NSMutableDictionary *)self->_replyCallbackBlocks removeObjectForKey:v12];
          [(NSLock *)self->_replyCallbackBlocksLock unlock];
          char v47 = GEOGetDeviceConnectionLog();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_188D96000, v47, OS_LOG_TYPE_DEBUG, "Sending reply to callback block", buf, 2u);
          }

          uint64_t v48 = [(GEOPairedDeviceMessage *)v19 whichResult];
          if (v48 != 2)
          {
            if (v48 == 1)
            {
              id v49 = [(GEOPairedDeviceMessage *)v19 success];
              (*(void (**)(uint64_t, id, void))(v46 + 16))(v46, v49, 0);
            }
            else
            {
              id v49 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:@"No reply payload or error"];
              (*(void (**)(uint64_t, void, id))(v46 + 16))(v46, 0, v49);
            }
LABEL_81:

            goto LABEL_101;
          }
          long long v50 = [(GEOPairedDeviceMessage *)v19 error];
          if ([v50 hasSerializedError])
          {
            long long v51 = (void *)MEMORY[0x1E4F28DC0];
            uint64_t v52 = objc_opt_class();
            [(GEOPairedDeviceMessage *)v19 error];
            id v53 = v72 = v12;
            id v54 = [v53 serializedError];
            uint64_t v55 = [v51 unarchivedObjectOfClass:v52 fromData:v54 error:0];

            BOOL v12 = v72;
            if (v55)
            {
LABEL_69:
              (*(void (**)(uint64_t, void, void *))(v46 + 16))(v46, 0, v55);

              goto LABEL_101;
            }
          }
          else
          {
          }
          uint64_t v55 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:@"Failed to deserialize error"];
          goto LABEL_69;
        }
        double v30 = Current - v28;
        uint64_t v31 = [v24 type];
        v71 = v12;
        if ((int)v31 > 99)
        {
          switch((int)v31)
          {
            case 'd':
              uint64_t v32 = @"CONFIGURE_SUBSCRIPTION_SHOULD_SYNC";
              goto LABEL_52;
            case 'e':
              uint64_t v32 = @"START_STOP_SUBSCRIPTION_DOWNLOAD";
              goto LABEL_52;
            case 'f':
              uint64_t v32 = @"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY";
              goto LABEL_52;
            case 'g':
              uint64_t v32 = @"SET_SUBSCRIPTION_STATE_SUMMARY";
              goto LABEL_52;
            case 'h':
              uint64_t v32 = @"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS";
              goto LABEL_52;
            case 'i':
              uint64_t v32 = @"UPDATE_SUBSCRIPTION_STATE";
              goto LABEL_52;
            default:
              goto LABEL_71;
          }
        }
        if (v31)
        {
          if (v31 == 1)
          {
            uint64_t v32 = @"PING";
          }
          else
          {
            if (v31 != 2)
            {
LABEL_71:
              v70 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v31);
              goto LABEL_53;
            }
            uint64_t v32 = @"GET_STORAGE_INFO";
          }
        }
        else
        {
          uint64_t v32 = @"INVALID";
        }
LABEL_52:
        v70 = v32;
LABEL_53:
        uint64_t v38 = [v9 length];
        long long v39 = [(GEOPairedDeviceMessage *)v19 metadata];
        [v39 responseTime];
        uint64_t v41 = v40;
        long long v42 = [v10 incomingResponseIdentifier];
        long long v43 = [v10 outgoingResponseIdentifier];
        *(_DWORD *)buf = 138479107;
        id v84 = v70;
        __int16 v85 = 2048;
        uint64_t v86 = v38;
        __int16 v87 = 2048;
        double v88 = v30;
        __int16 v89 = 2048;
        uint64_t v90 = v41;
        __int16 v91 = 2113;
        v92 = v42;
        __int16 v93 = 2113;
        v94 = v43;
        _os_log_impl(&dword_188D96000, v29, OS_LOG_TYPE_INFO, "Received reply for original message type: %{private}@ (size = %lu, elapsed time = %f, remote processing time = %f, incoming guid = %{private}@, outgoing guid = %{private}@)", buf, 0x3Eu);

        BOOL v12 = v71;
        goto LABEL_54;
      }
      uint64_t v24 = GEOGetDeviceConnectionLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v37 = "Invalid reply data";
LABEL_30:
        _os_log_impl(&dword_188D96000, v24, OS_LOG_TYPE_ERROR, v37, buf, 2u);
      }
    }
    else
    {
      uint64_t v19 = [[GEOPairedDeviceMessage alloc] initWithData:v9];
      uint64_t v34 = GEOGetDeviceConnectionLog();
      uint64_t v24 = v34;
      if (v19)
      {
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          uint64_t v35 = [(GEOPairedDeviceMessage *)v19 type];
          if ((int)v35 <= 99)
          {
            if (v35)
            {
              if (v35 == 1)
              {
                v36 = @"PING";
              }
              else if (v35 == 2)
              {
                v36 = @"GET_STORAGE_INFO";
              }
              else
              {
LABEL_72:
                objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v35);
                v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
            }
            else
            {
              v36 = @"INVALID";
            }
          }
          else
          {
            switch((int)v35)
            {
              case 'd':
                v36 = @"CONFIGURE_SUBSCRIPTION_SHOULD_SYNC";
                break;
              case 'e':
                v36 = @"START_STOP_SUBSCRIPTION_DOWNLOAD";
                break;
              case 'f':
                v36 = @"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY";
                break;
              case 'g':
                v36 = @"SET_SUBSCRIPTION_STATE_SUMMARY";
                break;
              case 'h':
                v36 = @"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS";
                break;
              case 'i':
                v36 = @"UPDATE_SUBSCRIPTION_STATE";
                break;
              default:
                goto LABEL_72;
            }
          }
          uint64_t v56 = [v9 length];
          uint64_t v57 = [(GEOPairedDeviceMessage *)v19 metadata];
          [v57 sentTimestamp];
          *(_DWORD *)buf = 138478339;
          id v84 = v36;
          __int16 v85 = 2048;
          uint64_t v86 = v56;
          __int16 v87 = 2048;
          double v88 = Current - v58;
          _os_log_impl(&dword_188D96000, v24, OS_LOG_TYPE_INFO, "Received message type: %{private}@ (size = %lu, sent %f seconds ago)", buf, 0x20u);
        }
        id v59 = GEOGetDeviceConnectionLog();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138477827;
          id v84 = v19;
          _os_log_impl(&dword_188D96000, v59, OS_LOG_TYPE_DEBUG, "Received message contents: %{private}@", buf, 0xCu);
        }

        id v60 = [(GEOPairedDeviceMessage *)v19 metadata];
        v61 = [v60 senderUUID];
        [(GEOPairedDeviceConnection *)self _updateReceiverProcessUUID:v61];

        uint64_t v24 = [(GEOPairedDeviceConnection *)self delegate];
        uint64_t v62 = [(GEOPairedDeviceConnection *)self delegateQueue];
        uint64_t v46 = v62;
        if (v24)
        {
          if (v62)
          {
            if (![v10 expectsPeerResponse])
            {
              v73[0] = MEMORY[0x1E4F143A8];
              v73[1] = 3221225472;
              v73[2] = __73__GEOPairedDeviceConnection_service_account_incomingData_fromID_context___block_invoke_4;
              v73[3] = &unk_1E53D99F0;
              v74 = v24;
              id v75 = self;
              id v76 = v19;
              dispatch_async((dispatch_queue_t)v46, v73);

              goto LABEL_101;
            }
            __int16 v63 = [v10 outgoingResponseIdentifier];

            if (!v63)
            {
              __int16 v65 = GEOGetDeviceConnectionLog();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
              {
                uint64_t v66 = [(GEOPairedDeviceMessage *)v19 type];
                if ((int)v66 <= 99)
                {
                  if (v66)
                  {
                    if (v66 == 1)
                    {
                      __int16 v67 = @"PING";
                    }
                    else if (v66 == 2)
                    {
                      __int16 v67 = @"GET_STORAGE_INFO";
                    }
                    else
                    {
LABEL_98:
                      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v66);
                      __int16 v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    }
                  }
                  else
                  {
                    __int16 v67 = @"INVALID";
                  }
                }
                else
                {
                  switch((int)v66)
                  {
                    case 'd':
                      __int16 v67 = @"CONFIGURE_SUBSCRIPTION_SHOULD_SYNC";
                      break;
                    case 'e':
                      __int16 v67 = @"START_STOP_SUBSCRIPTION_DOWNLOAD";
                      break;
                    case 'f':
                      __int16 v67 = @"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY";
                      break;
                    case 'g':
                      __int16 v67 = @"SET_SUBSCRIPTION_STATE_SUMMARY";
                      break;
                    case 'h':
                      __int16 v67 = @"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS";
                      break;
                    case 'i':
                      __int16 v67 = @"UPDATE_SUBSCRIPTION_STATE";
                      break;
                    default:
                      goto LABEL_98;
                  }
                }
                *(_DWORD *)buf = 138543362;
                id v84 = v67;
                _os_log_impl(&dword_188D96000, v65, OS_LOG_TYPE_ERROR, "Message wants reply, but didn't receive a message identifier! Message: %{public}@", buf, 0xCu);
              }
              goto LABEL_101;
            }
            uint64_t v64 = [v10 outgoingResponseIdentifier];
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __73__GEOPairedDeviceConnection_service_account_incomingData_fromID_context___block_invoke;
            block[3] = &unk_1E53D9A40;
            v78 = v24;
            __int16 v79 = self;
            uint64_t v80 = v19;
            id v81 = v64;
            double v82 = Current;
            id v49 = v64;
            dispatch_async((dispatch_queue_t)v46, block);

            goto LABEL_81;
          }
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
            goto LABEL_101;
          }
          *(_WORD *)buf = 0;
          id v68 = MEMORY[0x1E4F14500];
          uint64_t v69 = "Assertion failed: delegateQueue != ((void *)0)";
        }
        else
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
            goto LABEL_101;
          }
          *(_WORD *)buf = 0;
          id v68 = MEMORY[0x1E4F14500];
          uint64_t v69 = "Assertion failed: delegate != ((void *)0)";
        }
        _os_log_fault_impl(&dword_188D96000, v68, OS_LOG_TYPE_FAULT, v69, buf, 2u);
        goto LABEL_101;
      }
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v37 = "Invalid message data";
        goto LABEL_30;
      }
    }
LABEL_102:

    goto LABEL_103;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    uint64_t v33 = "NO";
    if (v17) {
      uint64_t v33 = "YES";
    }
    *(_DWORD *)buf = 138478083;
    id v84 = v12;
    __int16 v85 = 2080;
    uint64_t v86 = (uint64_t)v33;
    _os_log_impl(&dword_188D96000, &v19->super.super, OS_LOG_TYPE_ERROR, "Missing data with incomingResponseIdentifier: %{private}@ (Reply: %s) ", buf, 0x16u);
  }
LABEL_103:
}

void __73__GEOPairedDeviceConnection_service_account_incomingData_fromID_context___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__GEOPairedDeviceConnection_service_account_incomingData_fromID_context___block_invoke_2;
  v5[3] = &unk_1E53E9A50;
  v5[4] = v3;
  id v6 = v4;
  id v7 = *(id *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  [v2 pairedDeviceConnection:v3 handleIncomingMessage:v6 completionHandler:v5];
}

void __73__GEOPairedDeviceConnection_service_account_incomingData_fromID_context___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(NSObject **)(v7 + 96);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__GEOPairedDeviceConnection_service_account_incomingData_fromID_context___block_invoke_3;
  v11[3] = &unk_1E53E9A28;
  id v12 = v5;
  id v13 = v6;
  uint64_t v14 = v7;
  id v15 = *(id *)(a1 + 40);
  id v16 = *(id *)(a1 + 48);
  uint64_t v17 = *(void *)(a1 + 56);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, v11);
}

void __73__GEOPairedDeviceConnection_service_account_incomingData_fromID_context___block_invoke_3(uint64_t a1)
{
  id v2 = objc_alloc_init(GEOPairedDeviceReplyEnvelope);
  id v6 = v2;
  if (*(void *)(a1 + 32))
  {
    -[GEOPairedDeviceReplyEnvelope setSuccess:](v2, "setSuccess:");
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3)
    {
      uint64_t v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:0];
      if (v4)
      {
        id v5 = objc_alloc_init(GEOPairedDeviceReplyError);
        [(GEOPairedDeviceReplyError *)v5 setSerializedError:v4];
        [(GEOPairedDeviceReplyEnvelope *)v6 setError:v5];
      }
    }
  }
  [*(id *)(a1 + 48) _sendReply:v6 forMessage:*(void *)(a1 + 56) forMessageIdentifier:*(void *)(a1 + 64) messageReceivedTimestamp:*(double *)(a1 + 72)];
}

uint64_t __73__GEOPairedDeviceConnection_service_account_incomingData_fromID_context___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) pairedDeviceConnection:*(void *)(a1 + 40) handleIncomingMessage:*(void *)(a1 + 48)];
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = (__CFString *)a5;
  id v11 = (__CFString *)a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v10)
  {
    id v12 = [(NSMutableDictionary *)self->_inFlightMessageMetadata objectForKey:v10];
    [(NSMutableDictionary *)self->_inFlightMessageMetadata removeObjectForKey:v10];
    id v13 = GEOGetDeviceConnectionLog();
    uint64_t v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        if ([v12 isReply]) {
          id v15 = @"reply";
        }
        else {
          id v15 = @"message";
        }
        uint64_t v16 = [v12 type];
        if ((int)v16 <= 99)
        {
          if (v16)
          {
            if (v16 == 1)
            {
              uint64_t v17 = @"PING";
            }
            else if (v16 == 2)
            {
              uint64_t v17 = @"GET_STORAGE_INFO";
            }
            else
            {
LABEL_23:
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v16);
              uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
          }
          else
          {
            uint64_t v17 = @"INVALID";
          }
        }
        else
        {
          switch((int)v16)
          {
            case 'd':
              uint64_t v17 = @"CONFIGURE_SUBSCRIPTION_SHOULD_SYNC";
              break;
            case 'e':
              uint64_t v17 = @"START_STOP_SUBSCRIPTION_DOWNLOAD";
              break;
            case 'f':
              uint64_t v17 = @"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY";
              break;
            case 'g':
              uint64_t v17 = @"SET_SUBSCRIPTION_STATE_SUMMARY";
              break;
            case 'h':
              uint64_t v17 = @"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS";
              break;
            case 'i':
              uint64_t v17 = @"UPDATE_SUBSCRIPTION_STATE";
              break;
            default:
              goto LABEL_23;
          }
        }
        *(_DWORD *)buf = 138543875;
        v29 = v15;
        __int16 v30 = 2113;
        uint64_t v31 = v17;
        __int16 v32 = 2113;
        uint64_t v33 = v10;
        _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_DEBUG, "Finished sending %{public}@ for type: %{private}@ (GUID = %{private}@)", buf, 0x20u);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v29 = v10;
      _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_FAULT, "Unable to find metadata for message GUID = %{public}@. This could throw off the in-flight message bookkeeping", buf, 0xCu);
    }

    if (!a6)
    {
      [(NSLock *)self->_replyCallbackBlocksLock lock];
      id v18 = [(NSMutableDictionary *)self->_replyCallbackBlocks objectForKey:v10];
      uint64_t v19 = (void (**)(void, void, void))[v18 copy];

      [(NSMutableDictionary *)self->_replyCallbackBlocks removeObjectForKey:v10];
      [(NSMutableDictionary *)self->_replyExpectingMessageMetadata removeObjectForKey:v10];
      [(NSLock *)self->_replyCallbackBlocksLock unlock];
      v20 = GEOGetDeviceConnectionLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = [v12 type];
        if ((int)v21 <= 99)
        {
          if (v21)
          {
            if (v21 == 1)
            {
              uint64_t v22 = @"PING";
            }
            else if (v21 == 2)
            {
              uint64_t v22 = @"GET_STORAGE_INFO";
            }
            else
            {
LABEL_41:
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v21);
              uint64_t v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
          }
          else
          {
            uint64_t v22 = @"INVALID";
          }
        }
        else
        {
          switch((int)v21)
          {
            case 'd':
              uint64_t v22 = @"CONFIGURE_SUBSCRIPTION_SHOULD_SYNC";
              break;
            case 'e':
              uint64_t v22 = @"START_STOP_SUBSCRIPTION_DOWNLOAD";
              break;
            case 'f':
              uint64_t v22 = @"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY";
              break;
            case 'g':
              uint64_t v22 = @"SET_SUBSCRIPTION_STATE_SUMMARY";
              break;
            case 'h':
              uint64_t v22 = @"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS";
              break;
            case 'i':
              uint64_t v22 = @"UPDATE_SUBSCRIPTION_STATE";
              break;
            default:
              goto LABEL_41;
          }
        }
        *(_DWORD *)buf = 138478339;
        v29 = v22;
        __int16 v30 = 2114;
        uint64_t v31 = v11;
        __int16 v32 = 2114;
        uint64_t v33 = v10;
        _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_ERROR, "Error sending message: messageType=%{private}@ -- %{public}@ (GUID = %{public}@)", buf, 0x20u);
      }
      if (v19)
      {
        id v23 = [v12 timeoutTimer];

        if (v23)
        {
          uint64_t v24 = [v12 timeoutTimer];
          dispatch_source_cancel(v24);

          [v12 setTimeoutTimer:0];
        }
        uint64_t v25 = GEOGetDeviceConnectionLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_188D96000, v25, OS_LOG_TYPE_DEBUG, "Sending reply to callback block", buf, 2u);
        }

        if (v11)
        {
          uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v11 forKey:*MEMORY[0x1E4F28A50]];
        }
        else
        {
          uint64_t v26 = 0;
        }
        uint64_t v27 = [MEMORY[0x1E4F28C58] errorWithDomain:@"GEOPairedDeviceConnectionErrorDomain" code:5 userInfo:v26];

        v19[2](v19, 0, v27);
        id v11 = (__CFString *)v27;
      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: identifier != ((void *)0)", buf, 2u);
  }
}

- (GEOPairedDeviceConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GEOPairedDeviceConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receiverProcessUUID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_isolation, 0);
  objc_storeStrong((id *)&self->_inFlightMessageMetadata, 0);
  objc_storeStrong((id *)&self->_replyExpectingMessageMetadata, 0);
  objc_storeStrong((id *)&self->_replyCallbackBlocksLock, 0);
  objc_storeStrong((id *)&self->_replyCallbackBlocks, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_idsService, 0);
}

- (void)sendStartStopSubscriptionDownload:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(GEOPairedDeviceMessage);
  [(GEOPairedDeviceMessage *)v5 setType:101];
  [(GEOPairedDeviceMessage *)v5 setStartStopSubscriptionDownload:v4];

  [(GEOPairedDeviceConnection *)self sendMessage:v5];
}

- (void)sendCheckinWithSubscriptionStateSummary:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(GEOPairedDeviceMessage);
  [(GEOPairedDeviceMessage *)v5 setType:102];
  [(GEOPairedDeviceMessage *)v5 setCheckinWithSubscriptionStateSummary:v4];

  [(GEOPairedDeviceConnection *)self sendMessage:v5];
}

- (void)sendSetSubscriptionStateSummary:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(GEOPairedDeviceMessage);
  [(GEOPairedDeviceMessage *)v5 setType:103];
  [(GEOPairedDeviceMessage *)v5 setSetSubscriptionStateSummary:v4];

  [(GEOPairedDeviceConnection *)self sendMessage:v5];
}

- (void)sendSetObservedSubscriptionIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(GEOPairedDeviceMessage);
  [(GEOPairedDeviceMessage *)v5 setType:104];
  [(GEOPairedDeviceMessage *)v5 setSetObservedSubscriptionIdentifiers:v4];

  [(GEOPairedDeviceConnection *)self sendMessage:v5];
}

- (void)sendUpdateSubscriptionState:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(GEOPairedDeviceMessage);
  [(GEOPairedDeviceMessage *)v5 setType:105];
  [(GEOPairedDeviceMessage *)v5 setUpdateSubscriptionState:v4];

  [(GEOPairedDeviceConnection *)self sendMessage:v5];
}

- (void)sendPing:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_alloc_init(GEOPairedDeviceMessage);
  [(GEOPairedDeviceMessage *)v8 setType:1];
  [(GEOPairedDeviceMessage *)v8 setPing:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__GEOPairedDeviceConnection_TypedMessageConveniences__sendPing_withReply___block_invoke;
  v10[3] = &unk_1E53F7430;
  id v11 = v6;
  id v9 = v6;
  [(GEOPairedDeviceConnection *)self sendMessage:v8 options:0 withReply:v10];
}

void __74__GEOPairedDeviceConnection_TypedMessageConveniences__sendPing_withReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v9)
  {
    uint64_t v6 = [v9 whichPayload];
    uint64_t v7 = *(void *)(a1 + 32);
    if (v6 == 1)
    {
      uint64_t v8 = [v9 ping];
      (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0);
    }
    else
    {
      uint64_t v8 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11];
      (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)sendGetStorageInfo:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_alloc_init(GEOPairedDeviceMessage);
  [(GEOPairedDeviceMessage *)v8 setType:2];
  [(GEOPairedDeviceMessage *)v8 setGetStorageInfo:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__GEOPairedDeviceConnection_TypedMessageConveniences__sendGetStorageInfo_withReply___block_invoke;
  v10[3] = &unk_1E53F7430;
  id v11 = v6;
  id v9 = v6;
  [(GEOPairedDeviceConnection *)self sendMessage:v8 options:0 withReply:v10];
}

void __84__GEOPairedDeviceConnection_TypedMessageConveniences__sendGetStorageInfo_withReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v9)
  {
    uint64_t v6 = [v9 whichPayload];
    uint64_t v7 = *(void *)(a1 + 32);
    if (v6 == 2)
    {
      uint64_t v8 = [v9 getStorageInfo];
      (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0);
    }
    else
    {
      uint64_t v8 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11];
      (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)sendConfigureSubscriptionShouldSync:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_alloc_init(GEOPairedDeviceMessage);
  [(GEOPairedDeviceMessage *)v8 setType:100];
  [(GEOPairedDeviceMessage *)v8 setConfigureSubscriptionShouldSync:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __101__GEOPairedDeviceConnection_TypedMessageConveniences__sendConfigureSubscriptionShouldSync_withReply___block_invoke;
  v10[3] = &unk_1E53F7430;
  id v11 = v6;
  id v9 = v6;
  [(GEOPairedDeviceConnection *)self sendMessage:v8 options:0 withReply:v10];
}

void __101__GEOPairedDeviceConnection_TypedMessageConveniences__sendConfigureSubscriptionShouldSync_withReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v9)
  {
    uint64_t v6 = [v9 whichPayload];
    uint64_t v7 = *(void *)(a1 + 32);
    if (v6 == 3)
    {
      uint64_t v8 = [v9 configureSubscriptionShouldSync];
      (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0);
    }
    else
    {
      uint64_t v8 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11];
      (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

@end